unit gr_SpSchMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, dxBar, dxBarExtItems,
  cxGridBandedTableView, cxClasses, cxGridTableView, dxStatusBar, ibase,
  ZProc, gr_uCommonConsts, DB, FIBDatabase, gr_dmCommonStyles,
  pFIBDatabase, FIBDataSet, pFIBDataSet, gr_uCommonProc, cxMaskEdit,
  cxCheckBox, RxMemDS, Unit_ZGlobal_Consts, dates;

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
    SchTreeListcxDBTreeListSchNumber: TcxDBTreeListColumn;
    SchTreeListcxDBTreeListSchTitle: TcxDBTreeListColumn;
    SchTreeListcxDBTreeListType: TcxDBTreeListColumn;
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
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;KodCurSetup: integer;SchProp:integer); reintroduce;
  end;

var
  FGr_SchForm: TFGr_SchForm;

implementation

{$R *.dfm}

constructor TfGr_SchForm.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;KodCurSetup: integer;SchProp:integer);
var i:integer;
    date_in : Tdate;
begin
 inherited Create(AOwner);
//******************************************************************************

//******************************************************************************
 PLanguageIndex:=LanguageIndex;
 Caption:=SvodBySch_Caption[PLanguageIndex];
 RefreshBtn.Caption:='Обновити';//RefreshBtn_Caption[PLanguageIndex];
 SelectBtn.Caption :='Вибрати';//SelectBtn_Caption[PLanguageIndex];
 InverseBtn.Caption:='Інвертувати';//InverseBtn_Caption[PLanguageIndex];
 ExitBtn.Caption   :='Вийти';//ExitBtn_Caption[PLanguageIndex];
 DB.Handle:=AHandle;
 if(KodCurSetup<>0) and(KodCurSetup<>null) then
     date_in := ConvertKodToDate(KodCurSetup)
 else date_in := date;
 DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM GR_SP_MAIN_SCH_SELECT_BY_PROP('''+dateToStr(date_in)+''',1,9,'+IntToStr(SchProp)+')';
 if(grValueFieldFromZSetup(DB.Handle,'NUM_PREDPR')=5)then
 begin
   if(SchProp=30)then
     DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM GR_SP_MAIN_SCH_SELECT_BY_PROP('''+dateToStr(date_in)+''',1,99,'+IntToStr(SchProp)+')'
 end;
 DSetMain.Open;
 MemoryData:=TRxMemoryData.Create(self);
 MemoryData.FieldDefs.Add('ID_SCH',ftInteger);
 MemoryData.FieldDefs.Add('SCH_NUMBER',ftString,255);
 MemoryData.FieldDefs.Add('SCH_TITLE',ftString,255);
 MemoryData.FieldDefs.Add('TYPE',ftString,255);
 MemoryData.FieldDefs.Add('CHECK',ftBoolean);
 MemoryData.FieldDefs.Add('LINK_TO',ftInteger);
 MemoryData.Open;
 DSetMain.First;
 while not(DSetMain.Eof)do
 begin
   MemoryData.Insert;
   MemoryData['ID_SCH']:=DSetMain['ID_SCH'];
   MemoryData['SCH_NUMBER']:=DSetMain['SCH_NUMBER'];
   MemoryData['SCH_TITLE']:=DSetMain['SCH_TITLE'];
   MemoryData['TYPE']:=DSetMain['SCH_OBJ_TYPE_TITLE'];
   MemoryData['LINK_TO']:=DSetMain['LINK_TO'];

   MemoryData['CHECK']:=IfThen(DSetMain['CHECK_SCH']=1,True,False);
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
    MemoryData['ID_SCH']:=DSetMain['ID_SCH'];
    MemoryData['SCH_NUMBER']:=DSetMain['SCH_NUMBER'];
    MemoryData['SCH_TITLE']:=DSetMain['SCH_TITLE'];
    MemoryData['TYPE']:=DSetMain['SCH_OBJ_TYPE_TITLE'];
    MemoryData['LINK_TO']:=DSetMain['LINK_TO'];
    MemoryData['CHECK']:=IfThen(DSetMain['CHECK_SCH']=1,True,False);
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
        Result[i]:=MemoryData['ID_SCH'];
        i:=i+1;
      end;
      MemoryData.Next;
    end;
    ModalResult:=mrYes;
  end
  else
    ShowMessage('Не обрано рахунок');
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
