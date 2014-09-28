unit gr_Main_Group_Grant;

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
  ZTypes,gr_uMessage, ActnList, dxBarExtItems, StrUtils,
  cxGridBandedTableView,  Current_Ctrl_MainForm_Mas, Registry, cxSplitter;

type
  TFGroupGrant = class(TForm)
    Actions: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    ActionAdd: TAction;
    ActionDel: TAction;
    ActionClean: TAction;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
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
    cxGrid1Payment: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    ColPeriod: TcxGridDBColumn;
    ColEndMonth: TcxGridDBColumn;
    ColTypeOperNomber: TcxGridDBColumn;
    ColTypeOper: TcxGridDBColumn;
    ColEstimateNomber: TcxGridDBColumn;
    ColEstimate: TcxGridDBColumn;
    ColSum: TcxGridDBColumn;
    ColOrder: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid1FIO: TcxGrid;
    cxGrid1DBTableView1FIO: TcxGridDBTableView;
    Grid1ClTin: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1ClCat: TcxGridDBColumn;
    Grid1ClDep: TcxGridDBColumn;
    Grid1ClFormaOb: TcxGridDBColumn;
    Grid1ClBal: TcxGridDBColumn;
    cxGrid1FIOLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    BtnSave: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    procedure dxBarButton1Click(Sender: TObject);
    procedure FUpdateGroup(DataSetI: TRxMemoryData;DataSetE:TpFIBDataSet;x:Char);
    procedure    fDelete(DataSetI:TpFIBDataSet);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionCleanExecute(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure ClearCurrentBuffer(Sender:TObject);
    procedure ColPeriodGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure LBtnDeletePaymentClick(Sender: TObject);
    procedure LBtnUpdateClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    //procedure FormCreate(AOwner:TComponent);        //Sender: TObject
  private
    //StylesDM:TStylesDM;
   // PBarLocate:TZBarLocate;
    PLanguageIndex:Byte;
    PParamFilter:TParamFilter;
    procedure EnableEditPeople(x:boolean);
   { PWidth33:word;
    PWidth32:word;
    PWidth22:word;
    PWidth31:word;        }
  public
    Constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ParamFilter:TParamFilter);
  end;

function View_grCurrentCtrl(AParameter:TgrCtrlSimpleParam):Variant;stdcall;

var
  FGroupGrant: TFGroupGrant;
  Focus:Variant;


implementation



{$R *.dfm}

constructor TFGroupGrant.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE;ParamFilter:TParamFilter);
var i:byte;
wf:TForm;
aField: TVarRec;
begin

inherited Create(AOwner);
//******************************************************************************
//ShowMessage(inttostr(PLanguageIndex));
PLanguageIndex                := IndexLanguage;
Grid1ClFIO.Caption            := GridClFIO_Caption[PLanguageIndex];
Grid1ClTin.Caption            := GridClTin_Caption[PLanguageIndex];
Grid1ClBal.Caption            := GridClBal_Caption[PLanguageIndex];
Grid1ClDep.Caption            := GridClNameDepartment_Caption[PLanguageIndex];
Grid1ClFormaOb.Caption        := GridClForma_Ob_Caption[PLanguageIndex];
Grid1ClCat.Caption            := GridClCategory_Caption[PLanguageIndex];
dxBarLargeButton2.Caption     := Exit_Caption[PLanguageIndex];
dxBarLargeButton5.Caption     := Add_Paiment[PLanguageIndex];
DeleteBtn.Caption             := Delete_Group[PLanguageIndex];
AddManBtn.Caption             := Add_Group[PLanguageIndex];
RefreshBtn.Caption            := ClearBtn_Caption[PLanguageIndex];
LBtnUpdate.Caption            := UpdateRecBtn_Caption[PLanguageIndex];
LBtnDeletePayment.Caption     := DeletePayment_Caption[PLanguageIndex];
BtnSave.Caption               := YesBtn_Caption[PLanguageIndex];
//******************************************************************************
PParamFilter:=ParamFilter;
wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
//******************************************************************************
DM := TDM_g.Create(self,Db_Handle,PParamFilter);

FUpdateGroup(DM.RxMemoryData1,DM.DSetStud,'I');


//******************************************************************************
cxGridDBTableView1.DataController.DataSource:=DM.DSourceEditPayment;

ColPeriod.DataBinding.FieldName:='KOD_SETUP';
ColEndMonth.DataBinding.FieldName:='END_MONTH';
ColTypeOperNomber.DataBinding.FieldName:='KOD_VIDOPL';
ColTypeOper.DataBinding.FieldName:='NAME_VIDOPL';
ColEstimateNomber.DataBinding.FieldName:='SMETA_KOD';
ColEstimate.DataBinding.FieldName:='SMETA_TITLE';
ColSum.DataBinding.FieldName:='SUMMA';
ColOrder.DataBinding.FieldName:='PRIKAZ';



//******************************************************************************
cxGrid1DBTableView1FIO.DataController.DataSource:=DM.DSourceStud;

Grid1ClTin.DataBinding.FieldName:='TIN';
Grid1ClFIO.DataBinding.FieldName:='FIO';
Grid1ClCat.DataBinding.FieldName:='CAT';
Grid1ClDep.DataBinding.FieldName:='NAME_DEPARTMENT';
Grid1ClFormaOb.DataBinding.FieldName:='FORMA_OB';
Grid1ClBal.DataBinding.FieldName:='BAL';

//******************************************************************************
EnableEditPeople(False);


//******************************************************************************
WindowState := wsMaximized;

//******************************************************************************

CloseWaitForm(wf);
end;

procedure TFGroupGrant.EnableEditPeople(x:boolean);
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

procedure TFGroupGrant.FUpdateGroup(DataSetI:TRxMemoryData;DataSetE:TpFIBDataSet;x:Char);
var i:integer;
aField: array[1..1] of TVarRec;
b:bool;
id :integer;
begin

if not DataSetE.Active then exit;
if not DataSetI.Active then
begin
  DataSetI.CopyStructure(DataSetE);
  DataSetI.open;
end
else if DataSetI.RecordCount=0 then
begin
  DataSetI.Close;
  DataSetI.CopyStructure(DataSetE);
  DataSetI.open;
end;



if x='I' then
begin
  DataSetE.First;
  //DataSetI.First;
  while (not DataSetI.Eof) and (not DataSetE.Eof) do
  begin
    if  DataSetI.Locate('ID_MAN' ,DataSetE.FieldValues['ID_MAN'],[loCaseInsensitive]) then
    begin
      try
      //ShowMessage(DataSetE.FieldValues['FIO']);
      if  DataSetI.RecordCount=1 then
        begin
        DataSetI.LoadFromDataSet(DataSetE,0,lmCopy);
        exit;
        end;
      DataSetI.Delete;
      DataSetE.Next;
      except
      //DataSetI.Next;
      ShowMessage('Ошибка добавления людей');
      end;
    end
    else
    begin
      DataSetE.Next;
    end;
  end;
  DataSetI.LoadFromDataSet(DataSetE,0,lmAppend);
end;


if x='D' then
begin
  DataSetE.First;
  DataSetI.First;

  while ((not DataSetI.Eof) and (not DataSetE.Eof)) do
  begin
    if  DataSetI.Locate('ID_MAN',DataSetE.FieldValues['ID_MAN'],[loCaseInsensitive])  then
    begin
      if DataSetI.RecordCount =1 then
      begin
        DataSetI.close;
        if not DataSetI.IsEmpty then
        DataSetI.CopyStructure(DataSetE);
        DataSetI.Open;
        break;
      end
      else DataSetI.Delete;
      DataSetE.Next;
    end
    else DataSetE.Next;
  end;
end;
DataSetE.Close;
end;


procedure TFGroupGrant.FDelete(DataSetI:TpFIBDataSet);
begin
DataSetI.Delete;
DataSetI.Post;
end;


procedure TFGroupGrant.dxBarButton1Click(Sender: TObject);
var
PParamFilter:TParamFilter;
KodSetup:Integer;
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
//DM.DefaultTransaction.StartTransaction;
//******************************************************************************
DM.DSet1Add.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO('
                                                                  +varToStrDef(PParamFilter.KodSetup,'Null')+','''
                                                                  +PParamFilter.Contract+''','''
                                                                  +PParamFilter.Butget+''','
                                                                  +varToStrDef(PParamFilter.id_dep,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_man,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_prop,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_cat,'Null')
                                                                  +') order by FIO';
DM.DSet1Add.Open;
//******************************************************************************
//FUpdateGroup(DM.DSet1,DM.DSet1Add,'I');
DM.RxMemoryData1.LoadFromDataSet(DM.DSet1Add,0,lmAppend);
end;

procedure TFGroupGrant.dxBarButton2Click(Sender: TObject);
var
PParamFilter:TParamFilter;
KodSetup:Integer;
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
//DM.DefaultTransaction.StartTransaction;
//******************************************************************************
DM.DSet1Add.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO('
                                                                  +varToStrDef(PParamFilter.KodSetup,'Null')+','''
                                                                  +PParamFilter.Contract+''','''
                                                                  +PParamFilter.Butget+''','
                                                                  +varToStrDef(PParamFilter.id_dep,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_man,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_prop,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_cat,'Null')
                                                                  +') order by FIO';
DM.DSet1Add.Open;
//******************************************************************************
FUpdateGroup(DM.RxMemoryData1,DM.DSet1Add,'D');
end;

procedure TFGroupGrant.dxBarButton6Click(Sender: TObject);
begin
DM.DSet1.First;
while not DM.DSet1.Eof do
DM.DSet1.Delete;
end;

procedure TFGroupGrant.cxButton2Click(Sender: TObject);
begin

dxBarLargeButton5.Lowered:=not dxBarLargeButton5.Lowered;
if LBtnUpdate.Lowered then LBtnUpdate.Lowered:=not LBtnUpdate.Lowered;

EnableEditPeople(False);

cxGrid1Payment.Enabled:=True;
LBtnDeletePayment.Enabled:=True;
DM.DSetEditPayment.Open;


if dxBarLargeButton5.Lowered  then
begin
  focus:=DM.DSetEditPayment['ID_GR_MASS_PAYMENT'];   


  DM.RxMemoryData1.close;
  DM.RxMemoryData1.Open;

  cxGrid1Payment.Enabled:=False;
  DM.DSetEditPayment.Active:=False;

  EnableEditPeople(True);

  LBtnDeletePayment.Enabled:=False;

end;


if (focus<>Null) and (DM.DSetEditPayment.active) then
DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT',focus,[loCaseInsensitive]);

end;

procedure TFGroupGrant.ActionCancelExecute(Sender: TObject);
begin
cxButton1Click(self)
end;

procedure TFGroupGrant.ActionYesExecute(Sender: TObject);
begin
cxButton2Click(self);
end;

procedure TFGroupGrant.cxButton1Click(Sender: TObject);
begin
Close;
end;

procedure TFGroupGrant.ActionAddExecute(Sender: TObject);
begin
dxBarButton1Click(self);
end;

procedure TFGroupGrant.ActionDelExecute(Sender: TObject);
begin
dxBarButton2Click(self);
end;

procedure TFGroupGrant.ActionCleanExecute(Sender: TObject);
begin
dxBarButton6Click(self);
end;

procedure TFGroupGrant.dxBarLargeButton5Click(Sender: TObject);
var
PParamFilter:TParamFilter;
KodSetup:Integer;
wf:TForm;
focus:integer;
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
//******************************************************************************
//DM.DefaultTransaction.StartTransaction;
//******************************************************************************
wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
DM.DSet1Add.Close;
//******************************************************************************
DM.DSet1Add.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO('
                                                                  +varToStrDef(PParamFilter.KodSetup,'Null')+','''
                                                                  +PParamFilter.Contract+''','''
                                                                  +PParamFilter.Butget+''','
                                                                  +varToStrDef(PParamFilter.id_dep,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_man,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_prop,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_cat,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_B<>'',PParamFilter.Bal_B,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_E<>'',PParamFilter.Bal_E,'Null')
                                                                  +') order by FIO';
//ShowMessage(DM.DSet1Add.SQLs.SelectSQL.Text);

DM.DSet1Add.Open;
//******************************************************************************


//DM.RxMemoryData1.LoadFromDataSet(DM.DSet1Add,0,lmAppend);


//******************************************************************************

FUpdateGroup(DM.RxMemoryData1,DM.DSet1Add,'I');


CloseWaitForm(wf);
end;

procedure TFGroupGrant.dxBarLargeButton2Click(Sender: TObject);
var
PParamFilter:TParamFilter;
KodSetup:Integer;
wf:TForm;
focus:integer;
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
//DM.DefaultTransaction.StartTransaction;
//******************************************************************************
DM.DSet1Add.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_S_FIO('
                                                                  +varToStrDef(PParamFilter.KodSetup,'Null')+','''
                                                                  +PParamFilter.Contract+''','''
                                                                  +PParamFilter.Butget+''','
                                                                  +varToStrDef(PParamFilter.id_dep,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_man,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_prop,'Null')+','
                                                                  +varToStrDef(PParamFilter.id_cat,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_B<>'',PParamFilter.Bal_B,'Null')+','
                                                                  +IfThen(PParamFilter.Bal_E<>'',PParamFilter.Bal_E,'Null')
                                                                  +') order by FIO';
//ShowMessage(DM.DSet1Add.SQLs.SelectSQL.Text);
wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
DM.DSet1Add.Open;
//******************************************************************************
FUpdateGroup(DM.RxMemoryData1,DM.DSet1Add,'D');

{while not DM.RxMemoryData1.Eof do
 with DM do
  try
  StProc.StoredProcName:='GR_MASS_PAYMENT_MAN_D';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInteger :=   DSetEditPayment['ID_GR_MASS_PAYMENT'];
  StProc.ParamByName('ID_MAN').AsInteger :=               RxMemoryData1['ID_MAN'];
  //grShowStProcParametersData(StProc);
  StProc.ExecProc;
  StProc.Transaction.Commit;
  RxMemoryData1.Next;
  except
  showMessage('Помилка додання людини');
  StProc.Transaction.Rollback;
  break;
  end;    }

//DM.RxMemoryData1.close;
//DM.RxMemoryData1.CopyStructure(DM.DSet1Add);
//DM.RxMemoryData1.Open;

{focus:=DM.DSetEditPayment['ID_GR_MASS_PAYMENT'];
DM.DSetEditPayment.CloseOpen(True);
DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT',focus,[loCaseInsensitive]);  }

CloseWaitForm(wf);
end;

procedure TFGroupGrant.dxBarLargeButton3Click(Sender: TObject);
var focus:integer;
begin
DM.RxMemoryData1.close;
DM.RxMemoryData1.Open;

{if DM.RxMemoryData1.RecordCount =1 then exit;
while not DM.RxMemoryData1.Eof do
    begin
    if DM.RxMemoryData1.RecordCount =1 then
    begin
      DM.RxMemoryData1.Edit;
      DM.RxMemoryData1.ClearFields;
      //DM.RxMemoryData1['ID_MAN']:=Null;
      exit;
      //DM.RxMemoryData1.post;
    end  
    else DM.RxMemoryData1.Delete;
    end;  
 


{ with DM do
  try
  StProc.StoredProcName:='GR_MASS_PAYMENT_MAN_D';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInteger :=   DSetEditPayment['ID_GR_MASS_PAYMENT'];
  StProc.ParamByName('ID_MAN').AsVariant :=               null;
  //grShowStProcParametersData(StProc);
  StProc.ExecProc;
  StProc.Transaction.Commit;
  except
  //  showMessage('Помилка додання людини');
  StProc.Transaction.Rollback;
  end;  }
              
{focus:=DM.DSetEditPayment['ID_GR_MASS_PAYMENT'];
DM.DSetEditPayment.CloseOpen(True);
DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT',focus,[loCaseInsensitive]);}

end;



procedure TFGroupGrant.ClearCurrentBuffer(Sender:TObject);
var reg: TRegistry;
    Key:string;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Grant\GroupGrant\CurrentCtr',True);
  reg.WriteString('IsBuffer','0');
 finally
  reg.Free;
 end;
end;


procedure TFGroupGrant.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ClearCurrentBuffer(self);
Destroy;
end;


function View_grCurrentCtrl(AParameter:TgrCtrlSimpleParam):Variant;stdcall;
var Form:TFgrCurrentCtrlMas;
    wf:TForm;
    focus:integer;
begin
 if AParameter.fs=zcfsDelete then
 with DM do
  try
  StProc.StoredProcName:='GR_MASS_PAYMENT_D';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInteger :=   DM.DSetEditPayment['ID_GR_MASS_PAYMENT'];
  //grShowStProcParametersData(StProc);
  StProc.ExecProc;
  StProc.Transaction.Commit;
  DM.DSetEditPayment.Prior;
  focus:=DM.DSetEditPayment['ID_GR_MASS_PAYMENT'];
  DM.DSetEditPayment.CloseOpen(true);
  DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT',focus,[loCaseInsensitive]);
  exit;
  except
  StProc.Transaction.Rollback;
  ShowMessage('Ошибка удаления');
  exit;
  end;

 Form:=TFgrCurrentCtrlMas.Create(TgrCtrlSimpleParam(AParameter).Owner);

 Form.IdMovingBox.Visible:=False;
 Form.YesBtn.Top:=210;
 Form.CancelBtn.Top:=210;
 Form.height:=289;

 //DM.DSet1.First;
 //while not DM.DSet1.EOF do
 //begin
 result := Form.PrepareData(TgrCtrlSimpleParam(AParameter).DB_Handle,
                                  TgrCtrlSimpleParam(AParameter).fs,
                                  TgrCtrlSimpleParam(AParameter).Id);
 //Result:=True;
 if Result<>False then
 begin
            if Form.ShowModal=mrYes then
            begin
              Result:=Form.result;
              wf:=gr_uWaitForm.ShowWaitForm(TgrCtrlSimpleParam(AParameter).Owner as TForm, wfAddData);
            end
            else
            begin
              Result := NULL;
              Form.Destroy;
              exit;
            end

 end
 else
 begin
          Result := NULL;
          Form.Destroy;
          exit;
 end;


      //end;
      //if not DM.DB.Connected then ShowMessage('!!!');



  CloseWaitForm(wf);
  Form.Destroy;
  //ShowMessage('Операцію здійснено');
end;


procedure TFGroupGrant.ColPeriodGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if Atext<>'' then
AText := KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFGroupGrant.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  DM.DSetStud.close;
  if not DM.DSetEditPayment['ID_GR_MASS_PAYMENT']<>Null then
  DM.DSetStud.SQLs.SelectSQL.Text:='SELECT * FROM GR_MASS_PAYMENT_MAN_S('''
  +IntToStr(DM.DSetEditPayment['ID_GR_MASS_PAYMENT'])+
  ''')';
  if not dxBarLargeButton5.Lowered then
  try
  //ShowMessage(DSetStud.SQLs.SelectSQL.Text);
  if not DM.DSetStud.Active  then
  begin
    DM.DSetStud.open;
    DM.RxMemoryData1.Close;
    DM.RxMemoryData1.CopyStructure(DM.DSetStud);
    DM.RxMemoryData1.Open;
    FUpdateGroup(DM.RxMemoryData1,DM.DSetStud,'I');
  end;
  except
    ShowMessage('Ошибка выбора людей1');
  end
end;

procedure TFGroupGrant.LBtnDeletePaymentClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
begin

if DM.DSetEditPayment.IsEmpty then exit;

if dxBarLargeButton5.Lowered then dxBarLargeButton5.Lowered:=not dxBarLargeButton5.Lowered;
if LBtnUpdate.Lowered then LBtnUpdate.Lowered:=not LBtnUpdate.Lowered;

if grShowMessage(ExitBtn_Caption[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
 begin
   //Action:=caFree;

//else
// Action:=caNone;

  param := TgrCtrlSimpleParam.Create;
  Param.Owner := self;
  Param.DB_Handle := DM.DB.Handle;
  Param.fs := zcfsDelete;

  View_grCurrentCtrl(Param);

  Param.Destroy;
  end;
end;

procedure TFGroupGrant.LBtnUpdateClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
begin

if (DM.DSetEditPayment.IsEmpty) and (not dxBarLargeButton5.Lowered) then exit;

LBtnUpdate.Lowered:=not LBtnUpdate.Lowered;
if dxBarLargeButton5.Lowered then dxBarLargeButton5.Lowered:=not dxBarLargeButton5.Lowered;

EnableEditPeople(LBtnUpdate.Lowered);

cxGrid1Payment.Enabled:=True;
LBtnDeletePayment.Enabled:=True;
DM.DSetEditPayment.Active:=True;

{if DM.DSetEditPayment.active then
DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT',focus,[loCaseInsensitive]);}

{param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.fs := zcfsUpdate;
Param.Id :=DM.DSetEditPayment['ID_GR_MASS_PAYMENT'];

View_grCurrentCtrl(Param);

Param.Destroy;   }
end;

procedure TFGroupGrant.BtnSaveClick(Sender: TObject);
var Param:TgrCtrlSimpleParam;
    Key:Variant;
    Res:Variant;
    wf:TForm;
begin

if DM.RxMemoryData1.IsEmpty then         //Если удаляем всех людей из выплаты
begin
  showMessage('Не можливо створити виплати без людей');
  exit;
end;

param := TgrCtrlSimpleParam.Create;
Param.Owner := self;
Param.DB_Handle := DM.DB.Handle;
Param.fs := zcfsInsert;

///wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);

if  LBtnUpdate.Lowered then
  begin
    Try
    DM.DSet1Add.close;
    DM.DSet1Add.SQLs.SelectSQL.Text:='delete from GR_MASS_PAYMENT_MAN Where ID_GR_MASS_PAYMENT='''
    +VarToStr(DM.DSetEditPayment['ID_GR_MASS_PAYMENT'])+''' ';
    //ShowMessage(DM.DSet1Add.SQLs.SelectSQL.Text);
    DM.DSet1Add.open;
    DM.DSet1Add.Transaction.Commit;
    DM.DSet1Add.close;
    except
    ShowMessage('Помилка редагування виплат');
    exit;
    end;

    Res:=DM.DSetEditPayment['ID_GR_MASS_PAYMENT'];            //если редактируем
  end
else  Res:=View_grCurrentCtrl(Param);                        //если вставляем выплату


if Res<>NULL then
begin
DM.RxMemoryData1.first;

wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);

while not DM.RxMemoryData1.Eof do
 with DM do
  try
  StProc.StoredProcName:='GR_MASS_PAYMENT_MAN_I';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID_GR_MASS_PAYMENT').AsInteger :=   Res;
  StProc.ParamByName('ID_MAN').AsInteger :=               RxMemoryData1['ID_MAN'];


  
  //grShowStProcParametersData(StProc);
  StProc.ExecProc;
  StProc.Transaction.Commit;
  RxMemoryData1.Next;
  except
  showMessage('Помилка додання людини');
  StProc.Transaction.Rollback;
  break;
  end;

//focus:=DM.DSetEditPayment.['ID_GR_MASS_PAYMENT'];
DM.DSetEditPayment.CloseOpen(True);
DM.DSetEditPayment.Locate('ID_GR_MASS_PAYMENT',Res,[loCaseInsensitive]);
end;
//Key:=DoFunctionFromPackage(Param,Stud_Current_Ctrl_Pack);

Param.Destroy;

focus:=Res;

CloseWaitForm(wf);

end;

end.
