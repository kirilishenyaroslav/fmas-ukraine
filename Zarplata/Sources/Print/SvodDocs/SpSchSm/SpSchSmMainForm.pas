unit SpSchSmMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, dxBar, dxBarExtItems,
  cxGridBandedTableView, cxClasses, cxGridTableView, dxStatusBar, ibase,
  ZProc,  DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet,  cxMaskEdit,
  cxCheckBox, RxMemDS, Unit_ZGlobal_Consts, gr_dmCommonStyles;

type
  TFSchSmForm = class(TForm)
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
    dxBarLargeButton1: TdxBarLargeButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure InverseBtnClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure SchTreeListcxDBTreeListCheckPropertiesChange(
      Sender: TObject);
  private
    //PStyles : TDataModule;
    PStyles : TStylesDM;
    PLanguageIndex:Integer;
  public
    MemoryData: TRxMemoryData;
    Result:TDataSet;
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;SchProp:integer); reintroduce;
  end;

var
  FSchSmForm: TFSchSmForm;

implementation

{$R *.dfm}

constructor TFSchSmForm.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;SchProp:integer);
var i:integer;
begin
 inherited Create(AOwner);
//******************************************************************************

//******************************************************************************
 PLanguageIndex:=LanguageIndex;
// Caption:=SvodBySch_Caption[PLanguageIndex];
 RefreshBtn.Caption:='Обновити';//RefreshBtn_Caption[PLanguageIndex];
 SelectBtn.Caption :='Вибрати';//SelectBtn_Caption[PLanguageIndex];
 InverseBtn.Caption:='Інвертувати';//InverseBtn_Caption[PLanguageIndex];
 ExitBtn.Caption   :='Вийти';//ExitBtn_Caption[PLanguageIndex];

 //******************************************************************************
 PStyles:=TStylesDM.Create(self);
 SchTreeList.Styles.StyleSheet:=PStyles.TreeListStyleSheetDevExpress;

 DB.Handle:=AHandle;
 DSetMain.Close;
 DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM Z_SP_MAIN_SCH_SM_BY_PROP('''+dateToStr(date)+''',1,9,'+IntToStr(SchProp)+')';
 DSetMain.Open;
 DSetMain.FetchAll;
 MemoryData:=TRxMemoryData.Create(self);
 MemoryData.FieldDefs.Add('ID_SCH',ftInteger);
 MemoryData.FieldDefs.Add('SCH_NUMBER',ftString,255);
 MemoryData.FieldDefs.Add('SCH_TITLE',ftString,255);
 MemoryData.FieldDefs.Add('TYPE',ftString,255);
 MemoryData.FieldDefs.Add('CHECK',ftBoolean);
 MemoryData.FieldDefs.Add('LINK_TO',ftInteger);
 MemoryData.FieldDefs.Add('TYPE_OBJECT',ftInteger);
 MemoryData.FieldDefs.Add('ID_SMETA',ftInteger);
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
   MemoryData['TYPE_OBJECT']:=DSetMain['TYPE_OBJECT'];
   MemoryData['ID_SMETA']:=DSetMain['ID_SCH'];
   MemoryData['CHECK']:=IfThen(DSetMain['CHECK_SCH']=1,True,False);
   MemoryData.Post;
   DSetMain.Next
 end;

//******************************************************************************
 PStyles:=TStylesDM.Create(self);
 //SchTreeList.Styles.StyleSheet:=PStyles.TreeListStyleSheetDevExpress;
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
 Result:=nil;
 SchTreeList.FullExpand;
 MemoryData.Last;
end;

procedure TFSchSmForm.ExitBtnClick(Sender: TObject);
begin
  result:=nil;
  ModalResult:=mrCancel;
end;

procedure TFSchSmForm.RefreshBtnClick(Sender: TObject);
begin
  DSetMain.Close;
  MemoryData.Close;
  DSetMain.Open;
  MemoryData.Open;
  DSetMain.First;
  while not(DSetMain.Eof)do
  begin
    MemoryData.Insert;
    MemoryData['ID_SCH']      :=              DSetMain['ID_SCH'];
    MemoryData['SCH_NUMBER']  :=              DSetMain['SCH_NUMBER'];
    MemoryData['SCH_TITLE']   :=              DSetMain['SCH_TITLE'];
    MemoryData['TYPE']        :=              DSetMain['SCH_OBJ_TYPE_TITLE'];
    MemoryData['LINK_TO']     :=              DSetMain['LINK_TO'];
    MemoryData['TYPE_OBJECT'] :=              DSetMain['TYPE_OBJECT'];
    MemoryData['ID_SMETA']    :=              DSetMain['ID_SCH'];
    MemoryData['CHECK']       :=              IfThen(DSetMain['CHECK_SCH']=1,True,False);
    MemoryData.Post;
    DSetMain.Next
  end;
  SchTreeList.FullExpand;
  MemoryData.Last;
end;

procedure TFSchSmForm.SelectBtnClick(Sender: TObject);
var i:integer;
begin

  i:=0;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin

    if(MemoryData['CHECK']=true)then
    begin
      i:=i+1;
      Break;   //+++
    end;

    MemoryData.Next;
  end;
  if(i<>0)then
  begin
    MemoryData.First;
    while not(MemoryData.Eof)do
    begin
      if(MemoryData['CHECK']<>true)  then
      begin
        MemoryData.delete;
      end
      else  MemoryData.Next;
    end;
    Result:=MemoryData;

    ModalResult:=mrYes;
  end
  else
    ShowMessage('Не обрано рахунок');
end;

procedure TFSchSmForm.InverseBtnClick(Sender: TObject);
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

procedure TFSchSmForm.dxBarLargeButton1Click(Sender: TObject);
var i:Integer;
begin
 i:=SchTreeList.DataController.FocusedRecordIndex;
 SchTreeList.DataController.DataSource:=nil;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin
    if(MemoryData['CHECK']=True)then
    begin
      MemoryData.Edit;
      MemoryData['CHECK']:=False;
      MemoryData.Post;
    end ;

    MemoryData.Next;
  end;
  SchTreeList.DataController.DataSource:=DSourceMain;
  SchTreeList.FullExpand;
  SchTreeList.DataController.FocusedRecordIndex:=i;

end;





procedure TFSchSmForm.SchTreeListcxDBTreeListCheckPropertiesChange(
  Sender: TObject);
  var ID_SCH,i:Integer;
  CHECK:Boolean;
begin
  if MemoryData['TYPE_OBJECT']<>6 then
  begin
  i:=MemoryData.recno;
  SchTreeList.DataController.DataSource:=nil;
  if MemoryData['CHECK']=True then
  begin
    CHECK:=False;
    ID_SCH:=MemoryData['ID_SCH'];
    while(MemoryData.locate('LINK_TO;CHECK;TYPE_OBJECT', VarArrayOf([ID_SCH, not CHECK,6]), [])) do
    begin
      MemoryData.edit;
      MemoryData['CHECK']:=CHECK;
      MemoryData.post;
    end
  end
  else
  begin
    CHECK:=True;
    ID_SCH:=MemoryData['ID_SCH'];
    while(MemoryData.locate('LINK_TO;CHECK;TYPE_OBJECT', VarArrayOf([ID_SCH,not CHECK,6]), [])) do
    begin
      MemoryData.edit;
      MemoryData['CHECK']:=CHECK;
      MemoryData.post;
    end
  end;
  SchTreeList.DataController.DataSource:=DSourceMain;
  SchTreeList.FullExpand;
  MemoryData.recno:=i;

  MemoryData.edit;
  MemoryData['CHECK']:=CHECK;
  MemoryData.post;
  end;
end;

end.
