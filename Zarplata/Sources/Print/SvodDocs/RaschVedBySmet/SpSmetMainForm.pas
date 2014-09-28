unit SpSmetMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, dxBar, dxBarExtItems,
  cxGridBandedTableView, cxClasses, cxGridTableView, dxStatusBar, ibase,
  ZProc, gr_uCommonConsts, DB, FIBDatabase, gr_dmCommonStyles,
  pFIBDatabase, FIBDataSet, pFIBDataSet, gr_uCommonProc, cxMaskEdit,
  cxCheckBox, RxMemDS, Unit_ZGlobal_Consts, ZSvodTypesUnit;

type
  TFGr_SchForm = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    FilterBtn: TdxBarButton;
    SelectBtn: TdxBarLargeButton;
    SchTreeList: TcxDBTreeList;
    dxStatusBar1: TdxStatusBar;
    DB: TpFIBDatabase;
    DSetMain: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DSourceMain: TDataSource;
    SchTreeListcxDBTreeListSmetaKod: TcxDBTreeListColumn;
    SchTreeListcxDBTreeListSmetaName: TcxDBTreeListColumn;
    SchTreeListcxDBTreeListCheck: TcxDBTreeListColumn;
    InverseBtn: TdxBarLargeButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure InverseBtnClick(Sender: TObject);
  private
    PStyles : TStylesDM;
    PLanguageIndex:Integer;
  public
    MemoryData: TRxMemoryData;
    Result:variant;
    constructor Create(AParameter: TZAccListParameter); reintroduce;
  end;

var
  FGr_SchForm: TFGr_SchForm;

implementation

{$R *.dfm}

constructor TfGr_SchForm.Create(AParameter:TZAccListParameter);
var i:integer;
begin
 inherited Create(AParameter.AOwner);
//******************************************************************************

//******************************************************************************
 PLanguageIndex:=LanguageIndex;
 Caption:=SvodBySch_Caption[PLanguageIndex];
 RefreshBtn.Caption:=RefreshBtn_Caption[PLanguageIndex];
 SelectBtn.Caption :=SelectBtn_Caption[PLanguageIndex];
 InverseBtn.Caption:=InverseBtn_Caption[PLanguageIndex];
 ExitBtn.Caption   :=ExitBtn_Caption[PLanguageIndex];
 DB.Handle:=AParameter.DB_Handle;
 DSetMain.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM Z_ACCOUNT_ACC_SMETA_S2('+IntToStr(AParameter.Id_Group_Account)+','+
                                                          IntToStr(AParameter.Id_Man)+','+IntToStr(AParameter.Kod_setup)+','+IntToStr(AParameter.TypeData)+')';
 DSetMain.Open;
 MemoryData:=TRxMemoryData.Create(self);
 MemoryData.FieldDefs.Add('ID_SMETA',ftInteger);
 MemoryData.FieldDefs.Add('SMETA_KOD',ftString,30);
 MemoryData.FieldDefs.Add('SMETA_NAME',ftString,60);
 MemoryData.FieldDefs.Add('CHECK',ftBoolean);
 MemoryData.Open;
 DSetMain.First;
 while not(DSetMain.Eof)do
 begin
   MemoryData.Insert;
   MemoryData['ID_SMETA']:=DSetMain['ID_SMETA'];
   MemoryData['SMETA_KOD']:=DSetMain['SMETA_KOD'];
   MemoryData['SMETA_NAME']:=DSetMain['SMETA_NAME'];
   MemoryData['CHECK']:=false;
   MemoryData.Post;
   DSetMain.Next
 end;

//******************************************************************************
 PStyles:=TStylesDM.Create(self);
 SchTreeList.Styles.StyleSheet:=PStyles.TreeListStyleSheetDevExpress;
//******************************************************************************
 DSourceMain.DataSet:=MemoryData;
 SchTreeList.DataController.DataSource:=DSourceMain;
 //******************************************************************************
 dxStatusBar1.Panels[0].Text:= 'F5 - '+RefreshBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text:= 'Enter - '+SelectBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[2].Text:= 'Esc - '+ExitBtn_Caption[PLanguageIndex];
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

//******************************************************************************
 Result:=Null;
 SchTreeList.FullExpand;
 MemoryData.Last;
end;

procedure TFGr_SchForm.ExitBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFGr_SchForm.RefreshBtnClick(Sender: TObject);
begin
  DSetMain.Close;
  MemoryData.Close;
  DSetMain.Open;
  MemoryData.Open;
  DSetMain.First;
  while not(DSetMain.Eof)do
  begin
    MemoryData.Insert;
    MemoryData['ID_SMETA']:=DSetMain['ID_SMETA'];
    MemoryData['SMETA_KOD']:=DSetMain['SMETA_KOD'];
    MemoryData['SMETA_NAME']:=DSetMain['SMETA_NAME'];
    MemoryData['CHECK']:=false;
    MemoryData.Post;
    DSetMain.Next
  end;
  SchTreeList.FullExpand;
  MemoryData.Last;
end;

procedure TFGr_SchForm.SelectBtnClick(Sender: TObject);
var i:integer;
begin
  i:=0;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin
    if(MemoryData['CHECK']=true)then
      i:=i+1;
    MemoryData.Next;
  end;
  if(i<>0)then
  begin
    Result:=VarArrayCreate([0,i],varInteger);
    MemoryData.First;
    i:=0;
    while not(MemoryData.Eof)do
    begin
      if(MemoryData['CHECK']=true)then
      begin
        Result[i]:=MemoryData['ID_SMETA'];
        i:=i+1;
      end;
      MemoryData.Next;
    end;
    ModalResult:=mrYes;
  end
  else
    ShowMessage('Не обрано кошторис');
end;

procedure TFGr_SchForm.InverseBtnClick(Sender: TObject);
var i:integer;
begin
  i:=SchTreeList.DataController.FocusedRecordIndex;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin
    if(MemoryData['CHECK']=true)then
    begin
      MemoryData.Edit;
      MemoryData['CHECK']:=false;
      MemoryData.Post;
    end
    else
    begin
      MemoryData.Edit;
      MemoryData['CHECK']:=true;
      MemoryData.Post;
    end;
    MemoryData.Next;
  end;
  SchTreeList.DataController.FocusedRecordIndex:=i;
end;

end.
