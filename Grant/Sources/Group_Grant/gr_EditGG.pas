unit gr_EditGG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxLookAndFeelPainters, dxStatusBar,
  StdCtrls, cxButtons, ExtCtrls, dxBar, cxLabel, cxContainer, gr_uCommonConsts
  ,gr_Stud_Group_DM, gr_uCommonProc, gr_uWaitForm,RxMemDs, DateUtils, ZWait,         ///////
  gr_Filter_Stud_Group,gr_uCommonTypes, IBase,Dates, pFIBDataSet, FIBDataSet
  , cxCalendar, cxCurrencyEdit, cxCheckBox, gr_uCommonLoader,
  ZTypes, ActnList, dxBarExtItems, StrUtils,
  cxGridBandedTableView, cxSplitter, cxMemo,
  Current_Ctrl_MainForm_Mas, Registry, Grant_Ctrl_MainForm_Mas, gr_uMessage,
  cxGridDBBandedTableView, cxTimeEdit;

type
  TFEditGG = class(TForm)
    Actions: TActionList;
    ActionCancel: TAction;
    ActionAdd: TAction;
    ActionDel: TAction;
    ActionClean: TAction;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    BtnExit: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarGroup1: TdxBarGroup;
    dxBarButton1: TdxBarButton;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    dxStatusBar2: TdxStatusBar;
    LBtnUpdate: TdxBarLargeButton;
    LBtnDeletePayment: TdxBarLargeButton;
    Panel1: TPanel;
    cxGrid1FIO: TcxGrid;
    cxGrid1DBTableView1FIO: TcxGridDBTableView;
    Grid1ClTin: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1ClCat: TcxGridDBColumn;
    Grid1ClDep: TcxGridDBColumn;
    Grid1ClFormaOb: TcxGridDBColumn;
    cxGrid1FIOLevel1: TcxGridLevel;
    BtnSave: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    BtnCorrent: TdxBarLargeButton;
    BtnGrant: TdxBarLargeButton;
    Grid1CheckBox: TcxGridDBColumn;
    BtnInver: TdxBarLargeButton;
    BtnSel: TdxBarLargeButton;
    cxMemo1: TcxMemo;
    cxSplitter1: TcxSplitter;
    BtnSn: TdxBarLargeButton;
    Grid1ClKurs: TcxGridDBColumn;
    cxGrid1DBTableView1FIODBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1FIODBColumn2: TcxGridDBColumn;
    Grid1CheckBoxColor: TcxGridDBColumn;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    dxBarButton4: TdxBarButton;
    procedure cxButton1Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);

    procedure ClearCurrentBuffer(Sender:TObject);
    procedure ColPeriodGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCorrentClick(Sender: TObject);
    procedure BtnGrantClick(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure BtnInverClick(Sender: TObject);
    procedure BtnSnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure cxGrid1DBTableView1FIODblClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionCleanExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure cxGrid1DBTableView1FIOFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1DBTableView1FIOStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    //procedure FormCreate(AOwner:TComponent);        //Sender: TObject
  private
    //StylesDM:TStylesDM;
   // PBarLocate:TZBarLocate;
    ParamB: TgrPriznakSimpleParam;
    PLanguageIndex:Byte;
    PParamFilter:TParamFilter;
    FRes:Variant;
    procedure InvertValueColor;
    procedure EnableEditPeople(x:boolean);
    function RResult: Variant;
    procedure WResult(const Value: Variant);

  public
    Constructor Create(ParamA:TgrPriznakSimpleParam);
    property Res:Variant read RResult write WResult;
  end;

function View_Edit(ParamA:TgrPriznakSimpleParam):Variant;stdcall;

var
  FEditGG: TFEditGG;



implementation


{$R *.dfm}

constructor TFEditGG.Create(ParamA:TgrPriznakSimpleParam);
var
wf:TForm;
Stream: TMemoryStream;
begin
  inherited Create(ParamA.Owner);
  PLanguageIndex                := IndexLanguage;
  ParamB:=ParamA;

//******************************************************************************

  Grid1ClFIO.Caption            := GridClFIO_Caption[PLanguageIndex];
  Grid1ClTin.Caption            := GridClTin_Caption[PLanguageIndex];
  //Grid1ClBal.Caption            := GridClBal_Caption[PLanguageIndex];
  Grid1ClDep.Caption            := GridClNameDepartment_Caption[PLanguageIndex];
  Grid1ClFormaOb.Caption        := GridClForma_Ob_Caption[PLanguageIndex];
  Grid1ClCat.Caption            := GridClCategory_Caption[PLanguageIndex];
  Grid1ClKurs.Caption           := GridClKurs_Caption[PLanguageIndex];
  //dxBarLargeButton2.Caption     := Exit_Caption[PLanguageIndex];
  dxBarLargeButton5.Caption     := InsertBtn_Caption[PLanguageIndex];
  LBtnUpdate.Caption            := UpdateRecBtn_Caption[PLanguageIndex];
  LBtnDeletePayment.Caption     := DeletePayment_Caption[PLanguageIndex];

  BtnSave.Caption               := YesBtn_Caption[PLanguageIndex];
  BtnExit.Caption               := Exit_Caption[PLanguageIndex];
  AddManBtn.Caption             := InsertBtn_Caption[PLanguageIndex];
  BtnCorrent.Caption            := CorrentBtn_Caption[PLanguageIndex];
  BtnGrant.Caption              := GrantBtn_Caption[PLanguageIndex];
  DeleteBtn.Caption             := DeleteBtn_Caption[PLanguageIndex];
  RefreshBtn.Caption            := ClearBtn_Caption[PLanguageIndex];
  BtnSel.Caption                := SelAll_Caption[PLanguageIndex];
  BtnInver.Caption              := InverseBtn_Caption[PLanguageIndex];
  BtnSn.Caption                 := SnBtn_Caption[PLanguageIndex];
  //BtnSave.Caption               := gr_uMessage.IgnoreBtnCaption[PLanguageIndex];
  FRes:=Null;
//******************************************************************************
  cxGrid1DBTableView1FIO.DataController.DataSource:=DM.DSourceStudEdit;
  DM.RxMemoryData1.Close;
  DM.DSetStudSelEdit.close;


//******************************************************************************

  Grid1ClTin.DataBinding.FieldName:='TIN';
  Grid1ClFIO.DataBinding.FieldName:='FIO';
  Grid1ClCat.DataBinding.FieldName:='CAT';
  Grid1ClDep.DataBinding.FieldName:='NAME_DEPARTMENT';
  Grid1ClFormaOb.DataBinding.FieldName:='FORMA_OB';
  Grid1ClKurs.DataBinding.FieldName:='KURS';
  Grid1CheckBox.DataBinding.FieldName:='CHECKBOX';
  Grid1CheckBoxColor.DataBinding.FieldName:='CHECKBOXCOLOR';
  
  if  ParamB.Priznak='U' then
    begin
      RefreshBtn.Caption:='Очистити не доданих';
      if DM.DSetEditPayment['TYPE_MASS_PAYMENT']='G' then BtnCorrent.Visible:=ivNever
      else if DM.DSetEditPayment['TYPE_MASS_PAYMENT']='P' then BtnGrant.Visible:=ivNever;

      wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
      with DM do
        begin
          DSetStudSelEdit.close;
          DSetStudSelEdit.SelectSQL.Text:='select * from GR_MASS_PAYMENT_MAN_S('+
          VarToStrDef(DSetEditPayment['ID_GR_MASS_PAYMENT'],'0')+')';
          DSetStudSelEdit.Open;

          RxMemoryData1.close;
          RxMemoryData1.LoadFromDataSet(DSetStudSelEdit,0,lmAppend);

          Stream:=TMemoryStream.Create;
          TBlobField(DSetEditPayment.FieldByName('OTCHET')).SaveToStream(Stream);
          Stream.Position := 0;
          cxMemo1.Lines.LoadFromStream(Stream);
          cxGrid1DBTableView1FIO.Controller.GoToFirst;
        end;
      DefaultCheckedColor:=UnCheckedColor;
      CloseWaitForm(wf);
    end
  else  if  ParamB.Priznak='A' then
    DefaultCheckedColor:=UnCheckedColor;

//******************************************************************************

//WindowState := wsMaximized;


end;

procedure TFEditGG.EnableEditPeople(x:boolean);
begin
if x then
begin
  AddManBtn.Enabled:=True;
  DeleteBtn.Enabled:=True;
  RefreshBtn.Enabled:=True;
  BtnSave.Enabled:=True;
end
else
begin
  AddManBtn.Enabled:=False;
  DeleteBtn.Enabled:=False;
  RefreshBtn.Enabled:=False;
  BtnSave.Enabled:=False;
end;

end;







procedure TFEditGG.cxButton1Click(Sender: TObject);
begin
  Checked:=1;  //восстановить умолчания
  UnChecked:=0;
  DefaultCheckedColor:=CheckedColor; //восстановить умолчания цвета
  Close;
end;

procedure TFEditGG.dxBarLargeButton5Click(Sender: TObject);
var
PParamFilter:TParamFilter;
KodSetup,t:Integer;
wf:TForm;
focus:Variant;
Form:TFGrantCtrlMas;
Form2:TFgrCurrentCtrlMas;
Stream:TMemoryStream;
begin
  //******************************************************************************
  KodSetup := grKodSetup(DM.DB.Handle);
  PParamFilter:=TParamFilter.Create;
  PParamFilter.AOwner:=self;
  PParamFilter.Db_Handle:=DM.DB.Handle;
  PParamFilter.Year:=YearMonthFromKodSetup(KodSetup);
  PParamFilter.Month:=YearMonthFromKodSetup(KodSetup,False);
  PParamFilter.Contract    :='F';
  PParamFilter.Butget      :='T';
  PParamFilter.ManCaption  :='';
  PParamFilter.DepCaption  :='';
  PParamFilter.CatCaption  :='';
  PParamFilter.id_dep      :=null;
  PParamFilter.id_man      :=null;
  PParamFilter.id_prop     :=null;
  PParamFilter.id_cat      :=null;

  if not View_FormFilter(PParamFilter) then  Exit;
//******************************************************************************
  wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
  DM.DSetStudSelEdit.Close;
//******************************************************************************
  DM.DSetStudSelEdit.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO_MAS('
                                                                  +VarToStrDef(PParamFilter.KodSetup,'Null')+','''
                                                                  +PParamFilter.Contract+''','''
                                                                  +PParamFilter.Butget+''','
                                                                  +varToStrDef(PParamFilter.id_dep,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_man,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_prop,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_cat,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_B<>'',PParamFilter.Bal_B,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_E<>'',PParamFilter.Bal_E,'Null')
                                                                  +') order by FIO';

  DM.DSetStudSelEdit.Open;
//******************************************************************************
  PParamFilter.Free;


  if (not DM.RxMemoryData1.IsEmpty) and (not DM.DSetStudSelEdit.IsEmpty) then
    begin
      DM.DSetStudSelEdit.First;
      for t:=0 to DM.DSetStudSelEdit.RecordCount-1 do
        begin
          if DM.RxMemoryData1.Locate('ID_MAN',DM.DSetStudSelEdit['ID_MAN'],[])  then
            DM.DSetStudSelEdit.CacheDelete
          else
            DM.DSetStudSelEdit.Next;
        end;
      if not DM.DSetStudSelEdit.IsEmpty then
        focus:=DM.DSetStudSelEdit['ID_MAN'];
    end;


  if  not DM.DSetStudSelEdit.IsEmpty  then
    DM.RxMemoryData1.LoadFromDataSet(DM.DSetStudSelEdit,0,lmAppend)
  else
    begin
      CloseWaitForm(wf);
      exit;
    end;

  if focus<>null then
    DM.RxMemoryData1.Locate('ID_MAN',focus,[loCaseInsensitive])
  else  DM.RxMemoryData1.First;
  CloseWaitForm(wf);

end;

procedure TFEditGG.dxBarLargeButton2Click(Sender: TObject);
var focus:integer;
wf:TForm;
LocParamB: TParamGG;
begin
  if  DM.RxMemoryData1.IsEmpty  then  exit;

  wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);

  LocParamB:=TParamGG.Create;
  LocParamB.Mode:='D';
  LocParamB.PMemo:=cxMemo1;
  LocParamB.PGrid:=cxGrid1DBTableView1FIO;
  if DM.DSetEditPayment['TYPE_MASS_PAYMENT']='P'
    then  ViewCurrentCtrlMas(LocParamB)
  else if DM.DSetEditPayment['TYPE_MASS_PAYMENT']='G'
    then  ViewGrantCtrl(LocParamB);
  LocParamB.Free;
  CloseWaitForm(wf);
end;

procedure TFEditGG.ClearCurrentBuffer(Sender:TObject);
var reg: TRegistry;
    Key:string;
begin

end;


function View_Edit(ParamA:TgrPriznakSimpleParam):Variant;stdcall;
var wf:TForm;
    focus:integer;
    FormEdit:TFEditGG;
begin
  FormEdit:=TFEditGG.Create(ParamA);
  FormEdit.ShowModal();
  View_Edit:=FormEdit.RResult;
end;


procedure TFEditGG.ColPeriodGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if Atext<>'' then
AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFEditGG.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
begin

end;

procedure TFEditGG.BtnSaveClick(Sender: TObject);
var   Param:TgrSimpleParam;
begin
  if DM.RxMemoryData1.IsEmpty then
  begin
    showMessage('Не можливо створити виплати без людей');
    exit;
  end;

end;

procedure TFEditGG.BtnCorrentClick(Sender: TObject);
var Result:variant;
LocParamB: TParamGG;
begin
  if DM.RxMemoryData1.IsEmpty  then
    begin
      showMessage('Не можливо створити виплати без людей');
      exit;
    end;


  if not DM.RxMemoryData1.Locate('CHECKBOX',CHECKED,[]) then
    begin
      showMessage('Не обрано не одної людини');
      exit;
    end;

  LocParamB:=TParamGG.Create;
  if ParamB.Priznak='U' then
    LocParamB.Mode:='U'
  else if  ParamB.Priznak='A' then
    LocParamB.Mode:='A';
  LocParamB.PMemo:=cxMemo1;
  LocParamB.PGrid:=cxGrid1DBTableView1FIO;
  Result:=ViewCurrentCtrlMas(LocParamB);
  LocParamB.Free;
  WResult(Result);
end;

procedure TFEditGG.BtnGrantClick(Sender: TObject);
var Result:variant;
LocParamB: TParamGG;
begin
  if DM.RxMemoryData1.IsEmpty  then
    begin
      showMessage('Не можливо створити виплати без людей');
      exit;
    end;


  if not DM.RxMemoryData1.Locate('CHECKBOX',CHECKED,[]) then
    begin
      showMessage('Не обрано не одної людини');
      exit;
    end;

  LocParamB:=TParamGG.Create;
  if ParamB.Priznak='U' then
    LocParamB.Mode:='U'
  else if  ParamB.Priznak='A' then
    LocParamB.Mode:='A';
  LocParamB.PMemo:=cxMemo1;
  LocParamB.PGrid:=cxGrid1DBTableView1FIO;
  Result:=ViewGrantCtrl(LocParamB);
  LocParamB.Free;
  WResult(Result);

end;

procedure TFEditGG.BtnSelClick(Sender: TObject);
var t,focus:integer;
begin
  if  DM.RxMemoryData1.IsEmpty then   exit;

  focus:= DM.RxMemoryData1['ID_MAN'];
  cxGrid1DBTableView1FIO.DataController.DataSource:=nil;
  DM.RxMemoryData1.First;
  For t:=0 to  DM.RxMemoryData1.RecordCount-1 do
    begin
      DM.RxMemoryData1.Edit;
      DM.RxMemoryData1['CHECKBOX']:=CHECKED;
      DM.RxMemoryData1.Post;
      DM.RxMemoryData1.Next;
    end;
  DM.RxMemoryData1.Locate('ID_MAN',focus,[]);
  cxGrid1DBTableView1FIO.DataController.DataSource:=DM.DSourceStudEdit;

end;

procedure TFEditGG.BtnInverClick(Sender: TObject);
var buf:integer;
wf:TForm;
begin

  buf:=Checked;
  Checked:=UnChecked;
  UnChecked:=buf;

  TcxCheckBoxProperties(Grid1CheckBox.Properties).ValueChecked := 2;
  TcxCheckBoxProperties(Grid1CheckBox.Properties).ValueUnChecked := UnChecked;
  TcxCheckBoxProperties(Grid1CheckBox.Properties).ValueChecked := Checked;

end;

procedure TFEditGG.BtnSnClick(Sender: TObject);
var t,focus:integer;
begin
  if  DM.RxMemoryData1.IsEmpty then   exit;

  focus:= DM.RxMemoryData1['ID_MAN'];
  cxGrid1DBTableView1FIO.DataController.DataSource:=nil;
  DM.RxMemoryData1.First;
  For t:=0 to  DM.RxMemoryData1.RecordCount-1 do
    begin
      DM.RxMemoryData1.Edit;
      DM.RxMemoryData1['CHECKBOX']:=UnChecked;
      DM.RxMemoryData1.Post;
      DM.RxMemoryData1.Next;
    end;
  DM.RxMemoryData1.Locate('ID_MAN',focus,[]);
  cxGrid1DBTableView1FIO.DataController.DataSource:=DM.DSourceStudEdit;
end;



function TFEditGG.RResult: Variant;
begin
  result:=FRes;
end;

procedure TFEditGG.WResult(const Value: Variant);
begin
  FRes:=Value;
end;

procedure TFEditGG.InvertValueColor;
begin

end;

procedure TFEditGG.RefreshBtnClick(Sender: TObject);
var t:integer;
begin
  if  DM.RxMemoryData1.IsEmpty then   exit;
  if ParamB.Priznak='A' then
    begin
      DM.RxMemoryData1.Close;
      DM.RxMemoryData1.Open;
    end
  else  if ParamB.Priznak='U' then
    begin
      cxGrid1DBTableView1FIO.DataController.DataSource:=nil;
      DM.RxMemoryData1.First;
      For t:=0 to  DM.RxMemoryData1.RecordCount-1 do
        begin
          if (DM.RxMemoryData1['CHECKBOX']=UnChecked) and (DM.RxMemoryData1['CHECKBOXCOLOR']=UnCheckedColor) then
            DM.RxMemoryData1.Delete
          else
            DM.RxMemoryData1.Next;
        end;
      cxGrid1DBTableView1FIO.DataController.DataSource:=DM.DSourceStudEdit;
    end;
end;

procedure TFEditGG.dxBarButton2Click(Sender: TObject);
begin
 cxGrid1DBTableView1FIO.DataController.DataSource:=nil;
 cxGrid1DBTableView1FIO.DataController.DataSource:=DM.DSourceStudEdit;
end;

procedure TFEditGG.dxBarButton3Click(Sender: TObject);
var t,n:integer;
begin
  DM.RxMemoryData1.First;
  cxGrid1DBTableView1FIO.DataController.DataSource:=nil;
  For t:=0 to  cxGrid1DBTableView1FIO.DataController.RowCount-1 do
    begin
      DM.RxMemoryData1.edit;
      DM.RxMemoryData1['CHECKBOX']:=0;
      DM.RxMemoryData1.Post;
      DM.RxMemoryData1.Next;
    end;
  cxGrid1DBTableView1FIO.DataController.DataSource:=DM.DSourceStudEdit;

end;

procedure TFEditGG.cxGrid1DBTableView1FIODblClick(Sender: TObject);
begin

  if  DM.RxMemoryData1.IsEmpty then   exit;
  DM.RxMemoryData1.Edit;
  if DM.RxMemoryData1['CHECKBOX']=Checked
    then DM.RxMemoryData1['CHECKBOX']:=UnChecked
  else
    DM.RxMemoryData1['CHECKBOX']:=Checked;
  DM.RxMemoryData1.Post;
end;

procedure TFEditGG.ActionCancelExecute(Sender: TObject);
begin
  cxButton1Click(Sender);
end;

procedure TFEditGG.ActionAddExecute(Sender: TObject);
begin
  dxBarLargeButton5Click(Sender);
end;

procedure TFEditGG.ActionDelExecute(Sender: TObject);
begin
dxBarLargeButton2Click(Sender);
end;

procedure TFEditGG.ActionCleanExecute(Sender: TObject);
begin
  RefreshBtnClick(Sender);
end;

procedure TFEditGG.Action1Execute(Sender: TObject);
begin
  BtnSelClick(Sender);
end;

procedure TFEditGG.Action2Execute(Sender: TObject);
begin
  BtnSnClick(Sender);
end;

procedure TFEditGG.Action3Execute(Sender: TObject);
begin
  BtnInverClick(Sender);
end;

procedure TFEditGG.Action4Execute(Sender: TObject);
begin
  cxGrid1DBTableView1FIODblClick(Sender);
end;

procedure TFEditGG.Action5Execute(Sender: TObject);
begin
  if (ParamB.Priznak='A') or (DM.DSetEditPayment['TYPE_MASS_PAYMENT_OUT']='P') then
    BtnCorrentClick(Sender);
end;

procedure TFEditGG.Action6Execute(Sender: TObject);
begin
  if (ParamB.Priznak='A') or (DM.DSetEditPayment['TYPE_MASS_PAYMENT_OUT']='G') then
    BtnGrantClick(Sender);
end;

procedure TFEditGG.cxGrid1DBTableView1FIOFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  Sender.LayoutChanged();
end;

procedure TFEditGG.cxGrid1DBTableView1FIOStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
with Sender.Controller do
  begin
    if FocusedRecord<>nil then
      begin
        if FocusedRecord.Index = -1 then Exit;
      end
    else exit;
    //if (ARecord.Values[cxGrid1DBTableView1FIO.Columns[9].Index] = Values[ARecord.Index, cxGrid1DBTableView1FIO.Columns[9].Index])
    if (ARecord.Values[9] <> null)
      then
      if  (ARecord.Values[9]=CheckedColor)
        then
          begin
            AStyle := cxStyle11;
          end
  end;
end;

end.
