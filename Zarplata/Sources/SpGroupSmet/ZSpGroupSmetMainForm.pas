unit ZSpGroupSmetMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, dxBar, dxBarExtItems,
  cxGridBandedTableView, cxClasses, cxGridTableView, dxStatusBar, ibase,
  ZProc, gr_uCommonConsts, DB, FIBDatabase, gr_dmCommonStyles,
  pFIBDatabase, FIBDataSet, pFIBDataSet, gr_uCommonProc, cxMaskEdit,
  cxCheckBox, RxMemDS, Unit_ZGlobal_Consts, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, Dates, ZTypes;

type
  TFZGroupSmetForm = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    FilterBtn: TdxBarButton;
    SelectBtn: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    DB: TpFIBDatabase;
    DSetMain: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DSourceMain: TDataSource;
    InverseBtn: TdxBarLargeButton;
    GridSmetaDBTableView: TcxGridDBTableView;
    cxgrdlvlGridSmetaLevel: TcxGridLevel;
    GridSmeta: TcxGrid;
    GridSmetaDBTableViewDBCheck: TcxGridDBColumn;
    GridSmetaDBTableViewDBTitle: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure InverseBtnClick(Sender: TObject);
    procedure GridSmetaDBTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure GridSmetaDBTableViewDblClick(Sender: TObject);
  private
    PStyles : TStylesDM;
    PLanguageIndex:Integer;
  public
    MemoryData: TRxMemoryData;
    Result:variant;
    constructor Create(Parameter:TZSpGroupSm); reintroduce;
  end;

var
  FZGroupSmetForm: TFZGroupSmetForm;

implementation

{$R *.dfm}

constructor TFZGroupSmetForm.Create(Parameter:TZSpGroupSm);
var i:integer;
begin
 inherited Create(Parameter.Owner);
//******************************************************************************

//******************************************************************************
 PLanguageIndex:=LanguageIndex;
 Caption:=SvodBySch_Caption[PLanguageIndex];
 RefreshBtn.Caption:=RefreshBtn_Caption[PLanguageIndex];
 SelectBtn.Caption :=SelectBtn_Caption[PLanguageIndex];
 InverseBtn.Caption:=InverseBtn_Caption[PLanguageIndex];
 ExitBtn.Caption   :=ExitBtn_Caption[PLanguageIndex];
 DB.Handle:=Parameter.Db_Handle;
 DSetMain.SQLs.SelectSQL.Text:='SELECT * '+
                                 'FROM Z_PKV_TYPE_FINANCE_S('+IntToStr(Parameter.IdSession)+','''+DateToStr(ConvertKodToDate(Parameter.KodSetup))+''','+
                                                              IntToStr(Parameter.TypeData)+')';
 DSetMain.Open;
 MemoryData:=TRxMemoryData.Create(self);
 MemoryData.FieldDefs.Add('ID_PKV',ftInteger);
 MemoryData.FieldDefs.Add('ID_TYPE_FINANCE',ftInteger);
 MemoryData.FieldDefs.Add('PKV_FINANCE_NAME',ftString,255);
 MemoryData.FieldDefs.Add('CHECK',ftBoolean);
 MemoryData.Open;
 DSetMain.First;
 while not(DSetMain.Eof)do
 begin
   MemoryData.Insert;
   MemoryData['ID_PKV']:=DSetMain['ID_PKV'];
   MemoryData['ID_TYPE_FINANCE']:=DSetMain['ID_TYPE_FINANCE'];
   MemoryData['PKV_FINANCE_NAME']:=DSetMain['PKV_FINANCE_NAME'];
   MemoryData['CHECK']:=false;
   MemoryData.Post;
   DSetMain.Next;
 end;

//******************************************************************************
 PStyles:=TStylesDM.Create(self);
 GridSmetaDBTableView.Styles.StyleSheet:=PStyles.GridTableViewStyleSheetDevExpress;
//******************************************************************************
 DSourceMain.DataSet:=MemoryData;
 GridSmetaDBTableView.DataController.DataSource:=DSourceMain;
 //******************************************************************************
 dxStatusBar1.Panels[0].Text:= 'F5 - '+RefreshBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text:= 'Enter - '+SelectBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[2].Text:= 'Esc - '+ExitBtn_Caption[PLanguageIndex];
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

//******************************************************************************
 Result:=Null;
 MemoryData.First;
end;

procedure TFZGroupSmetForm.ExitBtnClick(Sender: TObject);
begin
  Result:=null;
  ModalResult:=mrCancel;
end;

procedure TFZGroupSmetForm.RefreshBtnClick(Sender: TObject);
begin
  DSetMain.Close;
  MemoryData.Close;
  DSetMain.Open;
  MemoryData.Open;
  DSetMain.First;
  while not(DSetMain.Eof)do
  begin
    MemoryData.Insert;
    MemoryData['ID_PKV']:=DSetMain['ID_PKV'];
    MemoryData['ID_TYPE_FINANCE']:=DSetMain['ID_TYPE_FINANCE'];
    MemoryData['PKV_FINANCE_NAME']:=DSetMain['PKV_FINANCE_NAME'];
    MemoryData['CHECK']:=false;
    MemoryData.Post;
    DSetMain.Next
  end;
  MemoryData.First;
end;

procedure TFZGroupSmetForm.SelectBtnClick(Sender: TObject);
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
    Result:=VarArrayCreate([0,i],varVariant);
    MemoryData.First;
    i:=0;
    while not(MemoryData.Eof)do
    begin
      if(MemoryData['CHECK']=true)then
      begin
        Result[i]:=VarArrayOf([MemoryData['ID_PKV'],MemoryData['ID_TYPE_FINANCE']]);
        i:=i+1;
      end;
      MemoryData.Next;
    end;
    ModalResult:=mrYes;
  end
  else
    ShowMessage('Не обрано кошторис');
end;

procedure TFZGroupSmetForm.InverseBtnClick(Sender: TObject);
var i:integer;
begin
  i:=GridSmetaDBTableView.DataController.FocusedRecordIndex;
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
  GridSmetaDBTableView.DataController.FocusedRecordIndex:=i;
end;

procedure TFZGroupSmetForm.GridSmetaDBTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
if(Key=' ')then
  GridSmetaDBTableViewDBCheck.EditValue:=not(GridSmetaDBTableViewDBCheck.EditValue);
  if (GridSmetaDBTableView.OptionsBehavior.IncSearchItem <> GridSmetaDBTableViewDBTitle)then
  begin
    GridSmetaDBTableView.Controller.IncSearchingText   := '';
    GridSmetaDBTableView.OptionsBehavior.IncSearchItem := GridSmetaDBTableViewDBTitle;
  end;
end;

procedure TFZGroupSmetForm.GridSmetaDBTableViewDblClick(Sender: TObject);
begin
  GridSmetaDBTableViewDBCheck.EditValue:=not(GridSmetaDBTableViewDBCheck.EditValue);
end;

end.
