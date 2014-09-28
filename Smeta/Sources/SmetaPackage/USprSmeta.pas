{Facking CVS}


unit USprSmeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ToolWin,

  cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,

  Ibase,Menus, FIBDatabase, pFIBDatabase,DateUtils,
  FIBDataSet, pFIBDataSet,pFibStoredProc, ExtCtrls, Buttons,IB_Externals,RegUnit,
  cxCheckBox, cxTextEdit, Resources_unitb, GlobalSpr, dxBar, dxDockPanel,
  dxDockControl, cxContainer, cxMemo, cxDBEdit, ActnList,UGetPosForm,
  Placemnt, cxCalc;



type
  TfrmSmetaSpr = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    PropButton: TToolButton;
    CloseButton: TToolButton;
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    WorkPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N10: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N15: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    SmetaDataSet: TpFIBDataSet;
    SmetaSource: TDataSource;
    column_gray: TcxStyle;
    periods: TcxStyle;
    PeriodsDataSet: TpFIBDataSet;
    PeriodsSource: TDataSource;
    PeriodPopupMenu: TPopupMenu;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    PopupMenu1: TPopupMenu;
    N13: TMenuItem;
    N22: TMenuItem;
    ToolButton1: TToolButton;
    DockSite: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    DockPanelTree: TdxDockPanel;
    dxBarDockControl1: TdxBarDockControl;
    DockPanelGrid: TdxDockPanel;
    cxGrid3: TcxGrid;
    PeriodsView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel5: TPanel;
    Panel4: TPanel;
    ToolBar3: TToolBar;
    AddPeriodButton: TToolButton;
    DelPeriodButton: TToolButton;
    UpdatePeriodButton: TToolButton;
    ShowStruButton: TToolButton;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    N19: TMenuItem;
    N23: TMenuItem;
    Gkfyedfyyz1: TMenuItem;
    N24: TMenuItem;
    cxGrid4: TcxGrid;
    SmView: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    N25: TMenuItem;
    CloneItem: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    cxDBMemo1: TcxDBMemo;
    ToolButton2: TToolButton;
    N4: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ActionList1: TActionList;
    Search: TAction;
    SearchDataSet: TpFIBDataSet;
    NextItem: TAction;
    FormStorage1: TFormStorage;
    SmViewDBColumn1: TcxGridDBColumn;
    N7: TMenuItem;
    N8: TMenuItem;
    cxgrdbclmnSmViewDBColumn2: TcxGridDBColumn;
    SmViewDBColumn2: TcxGridDBColumn;
    PeriodsViewDBColumn1: TcxGridDBColumn;
    IsDraft: TcxGridDBColumn;
    SilverStyle: TcxStyle;
    OnActualDate: TcxCheckBox;
    SmViewDBColumn3: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure PropButtonClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure AddPeriodButtonClick(Sender: TObject);
    procedure UpdatePeriodButtonClick(Sender: TObject);
    procedure DelPeriodButtonClick(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure SmViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure Gkfyedfyyz1Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure PeriodsViewDblClick(Sender: TObject);
    procedure CloneItemClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure PeriodsDataSetAfterOpen(DataSet: TDataSet);
    procedure N4Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure SearchExecute(Sender: TObject);
    procedure NextItemExecute(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure PeriodsViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure OnActualDatePropertiesChange(Sender: TObject);
    procedure PeriodsViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CHECK_ACTIVITY:Boolean;
    CHECK_PERIODS :Boolean;
    CHECK_CUR_DATE:Boolean;
    CHECK_DATE_BEG:Boolean;
    CHECK_DATE_END:Boolean;
    CHECK_SM_GROUP:Boolean;
    CUR_DATE:TDateTime;
    DATE_BEG:TDateTime;
    DATE_END:TDateTime;
    SM_GROUP:Int64;
    UseAccess:Boolean;
  public
     T: TfrmGetPosForm;
     FilterForm:TForm;
     INFINITY_DATE:TdateTime;
     ActualDate:TDateTime;
     ResultValue:Variant;
     CurFS:TFormStyle;
     CurFilter:TSmetaFilterValues;
     Id_user:Integer;
     LocalGetPlan:Boolean;
    { Public declarations }
     constructor Create(AOwner:TComponent;
                        DBHandle:TISC_DB_HANDLE;
                        FS:TFormStyle;
                        Book_Date:TDateTime;
                        Filter:TSmetaFilterValues;
                        Id_User:Integer;
                        ShowUserFilter:Boolean;
                        GetPlan:Boolean=False);overload;
     procedure GetData;

  end;



implementation

uses ueditsmet, uEditSmetaPeriod, BaseTypes, UPeriodRest,cxMaskEdit, USmetaFilter,
  cxCalendar, USmetHistory;
{$R *.dfm}


constructor TfrmSmetaSpr.Create(AOwner: TComponent;DBHandle: TISC_DB_HANDLE; FS: TFormStyle; Book_Date: TDateTime;Filter:TSmetaFilterValues;Id_User:Integer;ShowUserFilter:Boolean;GetPlan:Boolean=false);
var GetSysInfo:TpFibDataSet;
begin
    inherited Create(AOwner);
    LocalGetPlan:=GetPlan;
    Self.id_user:=Id_user;
    Self.WorkDatabase.Handle:=DBHAndle;
    Self.ReadTransaction.StartTransaction;
    Self.UseAccess:=false;

    if ShowUserFilter
    then begin
        FilterForm:=TfrmSmFilter.Create(self);
        if FilterForm.ShowModal=mrYes then
        begin
            CHECK_ACTIVITY:=TfrmSmFilter(FilterForm).CheckActivity.Checked;
            CHECK_PERIODS :=TfrmSmFilter(FilterForm).CheckPeriod.Checked;
            CHECK_CUR_DATE:=TfrmSmFilter(FilterForm).CheckCurDate.Checked;
            CHECK_DATE_BEG:=TfrmSmFilter(FilterForm).CheckDateBeg.Checked;
            CHECK_DATE_END:=TfrmSmFilter(FilterForm).CheckDateEnd.Checked;
            CHECK_SM_GROUP:=TfrmSmFilter(FilterForm).CheckGroup.Checked;
            CUR_DATE      :=TfrmSmFilter(FilterForm).EdCurDate.Date;
            DATE_BEG      :=TfrmSmFilter(FilterForm).EdDateBeg.Date;
            DATE_END      :=TfrmSmFilter(FilterForm).EdDateEnd.Date;
            SM_GROUP      :=TfrmSmFilter(FilterForm).ID_SM_GROUP;

            ActualDate:=Book_Date;
            CurFS:=FS;
            CurFilter:=Filter;
            self.FormStyle:=FS;
            if (CurFS=fsNormal)
            then begin
                       N15.Enabled:=true;
                       AddButton.Enabled:=false;
                       DelButton.Enabled:=false;
                       UpdateButton.Enabled:=false;
                       PropButton.Enabled:=false;
                       N1.Enabled:=false;
                       N2.Enabled:=false;
                       N3.Enabled:=false;
                       N12.Enabled:=false;
                       AddPeriodButton.Enabled:=false;
                       DelPeriodButton.Enabled:=false;
                       UpdatePeriodButton.Enabled:=false;
                       ShowStruButton.Enabled:=false;
            end;

            PeriodsDataSet.Database:=WorkDatabase;
            PeriodsDataSet.Transaction:=ReadTransaction;

            Getdata;

            if UseAccess
            then PeriodsDataSet.SQLs.SelectSQL.Text:='SELECT * FROM BU_SMET_PLUS_PERIODS_SELECT_EX3('+IntToStr(Self.Id_user)+','+'?P_ID_SMETA,'+IntToStr(Integer(OnActualDate.Checked))+',CURRENT_DATE) ORDER BY DATE_BEG '
            else PeriodsDataSet.SQLs.SelectSQL.Text:='SELECT * FROM BU_SMET_PLUS_PERIODS_SELECT(?P_ID_SMETA,'+IntToStr(Integer(OnActualDate.Checked))+',CURRENT_DATE) ORDER BY DATE_BEG ';

            SmView.DataController.FocusedRowIndex:=0;
            //SmView.RestoreFromRegistry('Software\Budgeting\SprSmeta1',false,false, [],'SmView');

            GetSysInfo:=TpFibDataSet.Create(self);
            GetSysInfo.Database:=WorkDatabase;
            GetSysInfo.Transaction:=ReadTransaction;
            GetSysInfo.SelectSQL.Text:='SELECT USE_DRAFTS FROM BU_INI';
            GetSysInfo.Open;
            if (GetSysInfo.RecordCount>0)
            then begin
                if (GetSysInfo.FieldByName('USE_DRAFTS').Value=1)
                then begin
                    IsDraft.Visible:=True;
                    cxGridDBColumn3.Visible:=True;
                    cxGridDBColumn1.Visible:=False;
                    cxGridDBColumn2.Visible:=False;
                end
                else begin
                    IsDraft.Visible:=False;
                    cxGridDBColumn1.Visible:=True;
                    cxGridDBColumn2.Visible:=True;
                    cxGridDBColumn3.Visible:=False;
                    PeriodsView.DataController.Groups.ClearGrouping;
                end;
            end;
            GetSysInfo.Close;
            GetSysInfo.Free;
        end else begin
            PostMessage(Handle,WM_CLOSE,0,0);
        end;
    end else begin
        CHECK_ACTIVITY:=true;
        CHECK_PERIODS :=false;
        CHECK_CUR_DATE:=false;
        CHECK_DATE_BEG:=false;
        CHECK_DATE_END:=false;
        CHECK_SM_GROUP:=false;


        ActualDate:=Book_Date;
        CurFS:=FS;
        CurFilter:=Filter;
        self.FormStyle:=FS;
        if (CurFS=fsNormal) then
        begin
            N15.Enabled:=true;
            AddButton.Enabled:=false;
            DelButton.Enabled:=false;
            UpdateButton.Enabled:=false;
            PropButton.Enabled:=false;
            N1.Enabled:=false;
            N2.Enabled:=false;
            N3.Enabled:=false;
            N12.Enabled:=false;
            AddPeriodButton.Enabled:=false;
            DelPeriodButton.Enabled:=false;
            UpdatePeriodButton.Enabled:=false;
            ShowStruButton.Enabled:=false;
        end;

        PeriodsDataSet.Database:=WorkDatabase;
        PeriodsDataSet.Transaction:=ReadTransaction;

        Getdata;

        if UseAccess
        then PeriodsDataSet.SQLs.SelectSQL.Text:='SELECT * FROM BU_SMET_PLUS_PERIODS_SELECT_EX3('+IntToStr(Self.Id_user)+','+'?P_ID_SMETA,'+IntToStr(Integer(OnActualDate.Checked))+',CURRENT_DATE)'+' ORDER BY DATE_BEG'
        else PeriodsDataSet.SQLs.SelectSQL.Text:='SELECT * FROM BU_SMET_PLUS_PERIODS_SELECT(?P_ID_SMETA,'+IntToStr(Integer(OnActualDate.Checked))+',CURRENT_DATE)'+' ORDER BY DATE_BEG';

        SmView.DataController.FocusedRowIndex:=0;
        //SmView.RestoreFromRegistry('Software\Budgeting\SprSmeta1',false,false, [],'SmView');

        GetSysInfo:=TpFibDataSet.Create(self);
        GetSysInfo.Database:=WorkDatabase;
        GetSysInfo.Transaction:=ReadTransaction;
        GetSysInfo.SelectSQL.Text:='SELECT USE_DRAFTS FROM BU_INI';
        GetSysInfo.Open;
        if (GetSysInfo.RecordCount>0) then begin
            if (GetSysInfo.FieldByName('USE_DRAFTS').Value=1)
            then begin
                      IsDraft.Visible:=True;
                      cxGridDBColumn3.Visible:=True;
                      cxGridDBColumn1.Visible:=False;
                      cxGridDBColumn2.Visible:=False;
            end
            else begin
                      IsDraft.Visible:=False;
                      cxGridDBColumn1.Visible:=True;
                      cxGridDBColumn2.Visible:=True;
                      cxGridDBColumn3.Visible:=False;
                      PeriodsView.DataController.Groups.ClearGrouping;
            end;
        end;
        GetSysInfo.Close;
        GetSysInfo.Free;
    end;
end;

procedure TfrmSmetaSpr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    SmView.StoreToRegistry('Software\Budgeting\SprSmeta1',true,[],'SmView');
    if Assigned(FilterForm) then FilterForm.Free;
    Action:=caFree;
end;

procedure TfrmSmetaSpr.CloseButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfrmSmetaSpr.AddButtonClick(Sender: TObject);
var T:TfrmEditSmet;
begin
    T:=TfrmEditSmet.Create(self, WorkDatabase.Handle, WorkDatabase, WriteTransaction, Id_user, SmetaDataSet, true);
    T.edit_flag:=false;
    T.ShowModal;
    T.Free;
end;

procedure TfrmSmetaSpr.DelButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
    FI:Integer;
begin
    if (SmetaDataSet.RecordCount>0) then
    begin
        if agMessageDlg(BU_WarningCaption,BU_DeleteConfirmation+SmetaDataSet.FieldByName('P_SMETA_TITLE').aSString,mtWarning,[mbYes,mbNo])=mrYes then
        begin
            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=WorkDatabase;
            Proc.Transaction:=WriteTransaction;
            proc.StoredProcName:='PUB_SPR_SMETA_DELETE';
            WriteTransaction.StartTransaction;
            proc.Prepare;
            proc.ParamByName('P_ID_SMETA').AsInt64:=StrToInt64(SmetaDataSet.FieldByName('P_ID_SMETA').AsString);
            proc.ParamByName('P_ID_USER').Value   :=id_user;
            proc.ExecProc;
            WriteTransaction.Commit;
            proc.Free;
            FI:=SmView.DataController.FocusedRowIndex;
            SmetaDataSet.CacheDelete;
            SmView.DataController.FocusedRowIndex:=FI;
        end;
    end;
end;

procedure TfrmSmetaSpr.UpdateButtonClick(Sender: TObject);
var T:TfrmEditSmet;
begin
    if (SmetaDataSet.RecordCount>0)
    then begin
       T:=TfrmEditSmet.Create(self,
                              WorkDatabase.Handle,
                              WorkDatabase,
                              WriteTransaction,
                              Id_user,
                              SmetaDataSet,
                              false,
                              False,
                              SmetaDataSet.FieldByName('P_SMETA_KOD').AsString,
                              SmetaDataSet.FieldByName('P_SMETA_TITLE').AsString,
                              SmetaDataSet.FieldByName('id_department').Value,
                              SmetaDataSet.FieldByName('dep_name').Value,
                              SmetaDataSet.FieldByName('P_SMETA_ENABLED').Value,
                              SmetaDataSet.FieldByName('P_ID_SMETA').Value,
                              SmetaDataSet.FieldByName('IS_WITH_NDS').Value);
       T.edit_flag:=true;
       T.ShowModal;
       T.Free;
    end;
end;

procedure TfrmSmetaSpr.ViewButtonClick(Sender: TObject);
var T:TfrmEditSmet;
begin
    if (SmetaDataSet.RecordCount>0) then
    begin
       T:=TfrmEditSmet.Create(self,
                              WorkDatabase.Handle,
                              WorkDatabase,
                              WriteTransaction,
                              Id_user,
                              nil,
                              false,
                              true,
                              SmetaDataSet.FieldByName('P_SMETA_KOD').AsString,
                              SmetaDataSet.FieldByName('P_SMETA_TITLE').AsString,
                              SmetaDataSet.FieldByName('P_SMETA_ENABLED').Value);
       T.edit_flag:=true;
       T.view_falg:=true;
       T.ShowModal;
       T.Free;
    end;
end;

procedure TfrmSmetaSpr.ChooseButtonClick(Sender: TObject);
begin
if  SmetaDataSet.FieldByName('P_SMETA_ENABLED').AsInteger=1
then begin
    ResultValue:=SmetaDataSet.FieldByName('P_ID_SMETA').AsInteger;
    ModalResult:=mryes;
end
else begin
   MessageBox(Handle,PChar(BU_EnableError),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
end;
end;

procedure TfrmSmetaSpr.FilterButtonClick(Sender: TObject);
begin
     ToolButton4Click(self);
end;

procedure TfrmSmetaSpr.HelpButtonClick(Sender: TObject);
begin
//
end;

procedure TfrmSmetaSpr.PrintButtonClick(Sender: TObject);
begin
//
end;

procedure TfrmSmetaSpr.PropButtonClick(Sender: TObject);
begin
if SmetaDataSet.RecordCount>0
then GetPropByObj(self.owner,WorkDatabase.Handle,
     SmetaDataSet.FieldByName('P_ID_SMETA').AsInteger,ActualDate,ptSmeta);
end;

procedure TfrmSmetaSpr.N2Click(Sender: TObject);
begin
     UpdateButton.OnClick(self);
end;

procedure TfrmSmetaSpr.N3Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmSmetaSpr.N12Click(Sender: TObject);
begin
     PropButton.OnClick(self);
end;

procedure TfrmSmetaSpr.N9Click(Sender: TObject);
begin
     CloseButton.OnClick(self);
end;

procedure TfrmSmetaSpr.AddPeriodButtonClick(Sender: TObject);
var T:TfrmSetSmetaPeriod;
    Proc:TpFibStoredProc;
begin
    if (SmetaDataSet.RecordCount>0) then
    begin
        T:=TfrmSetSmetaPeriod.Create(self,ActualDate,ActualDate,0,false);
        T.Label4.Caption:='№ '+SmetaDataSet.FieldByName('P_SMETA_KOD').AsString+' "'+SmetaDataSet.FieldByName('P_SMETA_TITLE').AsString+'"';
        if T.ShowModal=mrYes then
        begin
            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=WorkDatabase;
            Proc.Transaction:=WriteTransaction;
            proc.StoredProcName:='BU_NEW_SMETA_PERIOD';
            WriteTransaction.StartTransaction;
            try
                  proc.Prepare;
                  proc.ParamByName('P_ID_SMETA').Value:=SmetaDataSet.FieldByName('P_ID_SMETA').AsInteger;
                  proc.ParamByName('P_DATE_BEG').Value:=T.date_beg;
                  proc.ParamByName('P_DATE_END').Value:=T.date_end;
                  proc.ParamByName('P_ID_SM_GROUP').Value:=T.id_sm_group;
                  proc.ParamByName('P_IS_BLOCKED').VALUE:=0;
                  proc.ParamByName('P_IS_ENABLE_IN_BUHG').VALUE:=1-Integer(T.IsDraft.Checked);
                  proc.ParamByName('P_NOTE').VALUE      :=T.Note.EditValue;
                  proc.ParamByName('P_CLONE_BEFORE_PERIOD').VALUE      :=Integer(T.CloneBeforeStructure.Checked);
                  proc.ExecProc;

                  WriteTransaction.Commit;
            except on E:Exception do
                  begin
                     MessageBox(Handle,PChar(E.Message),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
                     WriteTransaction.Rollback;
                  end;
            end;
            PeriodsDataSet.CloseOpen(true);
        end;
        T.Free;
    end;
end;

procedure TfrmSmetaSpr.UpdatePeriodButtonClick(Sender: TObject);
var T:TfrmPlanBeforeRest;
    UpdateRest:TpFibStoredProc;
    date_beg, date_end:TDateTime;
    id:Int64;
begin
    if (PeriodsDataSet.RecordCount>0) then
    begin
        T:=TfrmPlanBeforeRest.Create(self);
        T.KassaValue.Value  :=PeriodsDataSet.FieldByName('REST_KASSA').Value;
        T.FinanceValue.Value:=PeriodsDataSet.FieldByName('REST_FINANCE').Value;
        if T.ShowModal=mrYes
        then begin
            try
                   UpdateRest:=TpFibStoredProc.Create(self);
                   UpdateRest.Database:=WorkDatabase;
                   UpdateRest.Transaction:=WriteTransaction;
                   UpdateRest.StoredProcName:='BU_EDIT_BEFORE_PLAN_RESTS';
                   WriteTransaction.StartTransaction;
                   UpdateRest.Prepare;
                   id:=StrToInt64(PeriodsDataSet.FieldByName('ID_PLAN').AsString);
                   date_beg :=PeriodsDataSet.FieldByName('DATE_BEG').Value;
                   date_end :=PeriodsDataSet.FieldByName('DATE_END').Value;
                   UpdateRest.ParamByName('ID_PLAN').asInt64:=id;
                   UpdateRest.ParamByName('KASSA_REST').Value:=T.KassaValue.Value;
                   UpdateRest.ParamByName('FINANCE_REST').Value:=T.FinanceValue.Value;
                   UpdateRest.ParamByName('MUST_EDIT').Value:=0;
                   UpdateRest.ExecProc;
                   WriteTransaction.Commit;
                   PeriodsDataSet.CloseOpen(true);
                   PeriodsDataSet.Locate('id_plan',id,[]);
            except on E:Exception do ShowMessage(E.Message);
            end;
        end;
        T.Free;
        end;
end;

procedure TfrmSmetaSpr.DelPeriodButtonClick(Sender: TObject);
var     Proc:TpFibStoredProc;
       childstru:TpFibDataSet;
begin
    if PeriodsDataSet.RecordCount>0 then
    begin
        childstru:=TpFibDataSet.Create(self);
        childstru.Database:=WorkDatabase;
        childstru.Transaction:=ReadTransaction;
        childstru.SQLs.SelectSQL.Text:='SELECT * FROM BU_SMET_STRUCTURE WHERE ID_PLAN='+PeriodsDataSet.FieldByName('ID_PLAN').AsString;
        childstru.Open;
        if childstru.RecordCount=0
        then begin

                if BaseTypes.agMessageDlg(BU_WarningCaption,BU_DelPeriod,mtWarning,[mbYes,mbNo])=mrYes
                then begin
                      Proc:=TpFibStoredProc.Create(self);
                      Proc.Database:=WorkDatabase;
                      Proc.Transaction:=WriteTransaction;
                      proc.StoredProcName:='BU_DELETE_SMETA_PERIOD';
                      WriteTransaction.StartTransaction;
                      try
                               Proc.Prepare;
                               Proc.ParamByName('P_ID_PLAN').AsInt64:=StrToInt64(PeriodsDataSet.FieldByName('ID_PLAN').AsString);
                               Proc.ExecProc;
                               WriteTransaction.Commit;
                      except on E:Exception do
                            begin
                               BaseTypes.agMessageDlg(BU_ErrorCaption,E.Message,mtError,[mbOk]);
                               WriteTransaction.Rollback;
                            end;
                      end;
                      PeriodsDataSet.CacheDelete;
                end;
        childstru.Free;
        end
        else begin
            BaseTypes.agMessageDlg(BU_WarningCaption,BU_DELHASCHILDSTRUERROR,mtWarning,[mbOk]);
        end;
    end;
end;

procedure TfrmSmetaSpr.GetData;
var date_str,date_beg1,date_end1:string;
    UseAccessDS:TpFibDataSet;
begin
    //забираем информацию о настройках безопастности
    UseAccessDS:=TpFibDataSet.Create(self);
    UseAccessDS.Database:=WorkDatabase;
    UseAccessDS.Transaction:=ReadTransaction;
    UseAccessDS.SelectSQL.Text:='SELECT * FROM BU_INI';
    UseAccessDS.Open;
    UseAccessDS.FetchAll;
    if (UseAccessDS.RecordCount>0) then
    begin
             if UseAccessDS.FieldByName('USE_ACCESS_INFO').Value<>NULL
             then UseAccess:=Boolean(UseAccessDS.FieldByName('USE_ACCESS_INFO').AsInteger)
             else UseAccess:=false;
    end;
    UseAccessDS.Close;
    UseAccessDS.Free;

    //Формируем текст запроса для отбора информации по сметам
    SmetaDataSet.Close;
    DateTimeToString(date_str,'dd.mm.yyyy', ActualDate);
    SmetaDataSet.Database:=WorkDatabase;
    SmetaDataSet.Transaction:=ReadTransaction;
    if Curfilter.DateFilter then
    begin
        DateTimeToString(date_beg1,'dd.mm.yyyy',CurFilter.PlanBeg);
        DateTimeToString(date_end1,'dd.mm.yyyy',CurFilter.PlanEnd);
        SmetaDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_SMETA_SELECT_EX('+''''+date_beg1+''''+','+''''+date_end1+''''+','+IntToStr(curfilter.NOTEqual)+','+IntToStr(curfilter.GroupValues[0])+')';
    end else begin
        if UseAccess then begin
           SmetaDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_SMETA_SELECT_EX3('+IntToStr(id_user)+','+
                                             IntToStr(Integer(CHECK_ACTIVITY))+','+
                                             IntToStr(Integer(CHECK_PERIODS)) +','+
                                             IntToStr(Integer(CHECK_CUR_DATE))+','+
                                             IntToStr(Integer(CHECK_DATE_BEG))+','+
                                             IntToStr(Integer(CHECK_DATE_END))+','+
                                             IntToStr(Integer(CHECK_SM_GROUP))+','+
                                             ''''+DateToStr(CUR_DATE)+''''+','+
                                             ''''+DateToStr(DATE_BEG)+''''+','+
                                             ''''+DateToStr(DATE_END)+''''+','+
                                             IntToStr(SM_GROUP)+') order by SMETA_KOD_INT';
        end else begin
           SmetaDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_SMETA_SELECT_EX2('+IntToStr(id_user)+','+
                                             IntToStr(Integer(CHECK_ACTIVITY))+','+
                                             IntToStr(Integer(CHECK_PERIODS)) +','+
                                             IntToStr(Integer(CHECK_CUR_DATE))+','+
                                             IntToStr(Integer(CHECK_DATE_BEG))+','+
                                             IntToStr(Integer(CHECK_DATE_END))+','+
                                             IntToStr(Integer(CHECK_SM_GROUP))+','+
                                             ''''+DateToStr(CUR_DATE)+''''+','+
                                             ''''+DateToStr(DATE_BEG)+''''+','+
                                             ''''+DateToStr(DATE_END)+''''+','+
                                             IntToStr(SM_GROUP)+') order by SMETA_KOD_INT';
        end;
    end;


     Screen.Cursor:=crHourGlass;
     SmetaDataSet.Open;
     SmetaDataSet.FetchAll;

     PeriodsView.ViewData.Expand(true);

     Screen.Cursor:=crDefault;
end;

procedure TfrmSmetaSpr.N22Click(Sender: TObject);
begin
     if ((SmetaDataSet.RecordCount>0) and (PeriodsDataSet.RecordCount>0))
     then begin
          GlobalSpr.GetSmResults(Application.MainForm,
                                 WorkDatabase.Handle,
                                 fsMdiChild,
                                 ActualDate,
                                 TFibBCDField(SmetaDataSet.FieldByName('P_ID_SMETA')).AsInt64,
                                 TFibBCDField(PeriodsDataSet.fieldByName('ID_PLAN')).AsInt64);
     end;
end;

procedure TfrmSmetaSpr.N13Click(Sender: TObject);
begin
 if ((SmetaDataSet.RecordCount>0) and (PeriodsDataSet.RecordCount>0))
 then begin
      UseSmeta(self.Owner,workdatabase.Handle,fsMdichild,ActualDate,SmetaDataSet.FieldByName('P_ID_SMETA').AsInteger,TFibBCDField(PeriodsDataSet.fieldByName('ID_PLAN')).AsInt64);
 end;
end;

procedure TfrmSmetaSpr.ToolButton1Click(Sender: TObject);
begin
     if (FormStyle=fsNormal)
     then begin
               if LocalGetPlan
               then begin
                         if (PeriodsDataSet.RecordCount>0)
                         then begin
                                   ResultValue:=PeriodsDataSet.FieldByName('ID_PLAN').Value;
                                   ModalResult:=mrYes;
                         end
                         else agShowMessage('Не має жодного періоду для вибору!');
               end
               else begin
                         if (SmetaDataSet.RecordCount>0)
                         then begin
                                   ResultValue:=SmetaDataSet.FieldByName('P_ID_SMETA').Value;
                                   ModalResult:=mrYes;
                         end;
               end
     end;
end;

procedure TfrmSmetaSpr.N21Click(Sender: TObject);
begin
 if (SmetaDataSet.RecordCount>0)
 then begin
           if not self.DockPanelGrid.Showing
           then begin
                     self.DockPanelGrid.Show;
           end;
 end;
end;

procedure TfrmSmetaSpr.SmViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (KEY=VK_RETURN)
  then begin
             if (SmetaDataSet.RecordCount>0)
             then begin
                       if not self.DockPanelGrid.Showing
                       then begin
                                 self.DockPanelGrid.Show;
                       end;
             end;
  end;
end;

procedure TfrmSmetaSpr.N16Click(Sender: TObject);
begin
    AddPeriodButtonClick(self);
end;

procedure TfrmSmetaSpr.N17Click(Sender: TObject);
begin
     DelPeriodButtonClick(self);
end;

procedure TfrmSmetaSpr.N18Click(Sender: TObject);
begin
     UpdatePeriodButtonClick(self);
end;

procedure TfrmSmetaSpr.Gkfyedfyyz1Click(Sender: TObject);
begin
     N13Click(self);
end;

procedure TfrmSmetaSpr.N24Click(Sender: TObject);
begin
     N22Click(self);
end;

procedure TfrmSmetaSpr.PeriodsViewDblClick(Sender: TObject);
begin
 if ((SmetaDataSet.RecordCount>0) and (PeriodsDataSet.RecordCount>0))
 then begin
      UseSmeta(self.Owner,workdatabase.Handle,fsMdichild,ActualDate,SmetaDataSet.FieldByName('P_ID_SMETA').AsInteger,TFibBCDField(PeriodsDataSet.fieldByName('ID_PLAN')).AsInt64);
 end;
end;

procedure TfrmSmetaSpr.CloneItemClick(Sender: TObject);
var CloneSP:TpFibStoredProc;
begin
     if (PeriodsDataSet.RecordCount>0)
     then begin
               if (PeriodsView.Controller.FocusedRowIndex>0)
               then begin
                         CloneSP:=TpFibStoredProc.Create(self);
                         CloneSP.Database:=WorkDatabase;
                         CloneSP.Transaction:=WriteTransaction;
                         CloneSP.StoredProcName:='BU_MOVE_OLD_STRU_IN_NEW_PERIOD';
                         WriteTransaction.StartTransaction;
                         CloneSP.Prepare;
                         CloneSP.ParamByName('ID_PLAN').AsInt64:=TFibBCDField(PeriodsDataSet.fieldByName('ID_PLAN')).AsInt64;
                         CloneSP.ExecProc;
                         ShowMessage(CloneSP.ParamByName('RES_MSG').AsString);
                         WriteTransaction.Commit;
                         CloneSP.Free;
               end
               else ShowMessage('Бюджет не має попереднього періоду функціонування');
     end;
end;

procedure TfrmSmetaSpr.ToolButton2Click(Sender: TObject);
var FI:Integer;
begin
      FI:=SmView.DataController.FocusedRowIndex;
      GetData;
      SmView.DataController.FocusedRowIndex:=FI;      
end;

procedure TfrmSmetaSpr.N19Click(Sender: TObject);
var UpdSP:TpFibStoredProc;
    id_:Int64;
begin
     if (PeriodsDataSet.RecordCount>0)
     then begin
               try
                     UpdSP:=TpFibStoredProc.Create(self);
                     UpdSP.Database:=WorkDatabase;
                     UpdSP.Transaction:=WriteTransaction;
                     WriteTransaction.StartTransaction;
                     UpdSP.StoredProcName:='BU_SMET_PLUS_PERIODS_BLOCK';
                     UpdSP.Prepare;
                     id_:=StrToInt64(PeriodsDataSet.FieldByName('ID_PLAN').AsString);
                     UpdSP.ParamByName('ID_PLAN').AsInt64:=StrToInt64(PeriodsDataSet.FieldByName('ID_PLAN').AsString);
                     UpdSP.ExecProc;
                     UpdSP.Close;
                     WriteTransaction.Commit;
                     UpdSP.Free;

                     PeriodsView.BeginUpdate;
                     PeriodsDataSet.CloseOpen(true);
                     PeriodsDataSet.Locate('ID_PLAN',id_,[]);
                     PeriodsView.EndUpdate;
               except on E:Exception do ShowMessage(E.Message);
               end;
     end;
end;

procedure TfrmSmetaSpr.PeriodsDataSetAfterOpen(DataSet: TDataSet);
begin
     PeriodsDataSet.FetchAll;
     PeriodsDataSet.Last;

     PeriodsView.Controller.FocusedRowIndex:=PeriodsView.DataController.RowCount-1;
end;

procedure TfrmSmetaSpr.N4Click(Sender: TObject);
var T:TfrmSetSmetaPeriod;
    Proc:TpFibStoredProc;
    id:Int64;
begin
      id:=-1;
      if (PeriodsDataSet.RecordCount>0)
      then begin
                T:=TfrmSetSmetaPeriod.Create(self,
                                             PeriodsDataSet.FieldByName('DATE_BEG').AsDateTime,
                                             PeriodsDataSet.FieldByName('DATE_END').AsDateTime,
                                             StrToInt64(PeriodsDataSet.FieldByName('ID_SM_GROUP').AsString),
                                             True);

                T.IsDraft.Checked:=Boolean(1-PeriodsDataSet.FieldByName('IS_ENABLE_IN_BUHG').AsInteger);
                T.Note.EditValue:=PeriodsDataSet.FieldByName('NOTE').Value;

                T.Label4.Caption:='№ '+SmetaDataSet.FieldByName('P_SMETA_KOD').AsString+' "'+SmetaDataSet.FieldByName('P_SMETA_TITLE').AsString+'"';
                T.cxButtonEdit1.Text:=PeriodsDataSet.FieldByName('ID_SM_GROUP_TEXT').AsString;
                T.Curr_Date:=ActualDate;
                if T.ShowModal=mrYes
                then begin
                    Proc:=TpFibStoredProc.Create(self);
                    Proc.Database:=WorkDatabase;
                    Proc.Transaction:=WriteTransaction;
                    proc.StoredProcName:='BU_UPDATE_SMETA_PERIOD';
                    WriteTransaction.StartTransaction;
                    try
                          proc.Prepare;

                          id:=StrToInt64(PeriodsDataSet.FieldByName('ID_PLAN').AsString);

                          proc.ParamByName('P_ID_PLAN').AsInt64        :=StrToInt64(PeriodsDataSet.FieldByName('ID_PLAN').AsString);
                          proc.ParamByName('P_ID_SMETA').Value         :=SmetaDataSet.FieldByName('P_ID_SMETA').AsInteger;
                          proc.ParamByName('P_DATE_BEG').Value         :=T.date_beg;
                          proc.ParamByName('P_DATE_END').Value         :=T.date_end;
                          proc.ParamByName('P_ID_SM_GROUP').Value      :=T.id_sm_group;
                          proc.ParamByName('P_IS_ENABLE_IN_BUHG').Value:=Integer(1-Integer(T.IsDraft.Checked));
                          proc.ParamByName('P_NOTE').Value             :=T.Note.EditValue;
                          proc.ExecProc;

                          WriteTransaction.Commit;
                    except on E:Exception do
                          begin
                             MessageBox(Handle,PChar(E.Message),PChar(BU_ErrorCaption),MB_OK or MB_ICONERROR);
                             WriteTransaction.Rollback;
                          end;
                    end;
                    PeriodsDataSet.CloseOpen(true);
                    PeriodsDataSet.Locate('ID_PLAN',id,[]);

                end;
                T.Free;
      end;

end;

procedure TfrmSmetaSpr.ToolButton4Click(Sender: TObject);
var
  id_sm, SM_TITLE:String;
  SM_CODE, MODE:  Integer;
begin
    if T=nil then T:=TfrmGetPosForm.Create(self);
    if T.ShowModal=mrYes then
    begin
        SmetaDataSet.First;
        if T.CheckCode.Checked then
        begin              
            if SmetaDataSet.LocateNext('P_SMETA_KOD',trim(T.EdCode.Text),[]) then
            begin
                ID_SM:=SmetaDataSet.FieldByName('P_ID_SMETA').AsString;
                SmView.DataController.LocateByKey(ID_SM);
            end else ShowMessage('Не знайдено жодного бюджету з кодом'+#13+'"'+T.EdCode.Text+'"');
        end else begin
            if SmetaDataSet.ExtLocateNext('P_SMETA_TITLE',T.Title,[eloWildCards,eloCaseInsensitive]) then
            begin
                ID_SM:=SmetaDataSet.FieldByName('P_ID_SMETA').AsString;
                SmView.DataController.LocateByKey(ID_SM);
            end else ShowMessage('Не знайдено жодного бюджету з назвою'+#13+'"'+T.EdTitle.Text+'"');
        end;
    end;
end;

procedure TfrmSmetaSpr.SearchExecute(Sender: TObject);
begin
     ToolButton4Click(self);
end;

procedure TfrmSmetaSpr.NextItemExecute(Sender: TObject);
var ID_SM:String;
begin
    if t=nil then exit;
    if T.CheckCode.Checked then
    begin
        if SmetaDataSet.LocateNext('P_SMETA_KOD',trim(T.EdCode.Text),[]) then
        begin
            ID_SM:=SmetaDataSet.FieldByName('P_ID_SMETA').AsString;
            SmView.DataController.LocateByKey(ID_SM);
        end else ShowMessage('Більше не знайдено жодного бюджету з кодом'+#13+'"'+T.EdCode.Text+'"');
    end else begin
        if SmetaDataSet.ExtLocateNext('P_SMETA_TITLE',T.title,[eloWildCards,eloCaseInsensitive]) then
        begin
            ID_SM:=SmetaDataSet.FieldByName('P_ID_SMETA').AsString;
            SmView.DataController.LocateByKey(ID_SM);
        end else ShowMessage('Більше не знайдено жодного бюджету з назвою'+'"'+#13+T.EdTitle.Text+'"');
    end;
end;

procedure TfrmSmetaSpr.ToolButton3Click(Sender: TObject);
var FI:Integer;
begin
      if not Assigned(FilterForm) then FilterForm:=TfrmSmFilter.Create(self);

      if FilterForm.ShowModal=mrYes
      then begin
                CHECK_ACTIVITY:=TfrmSmFilter(FilterForm).CheckActivity.Checked;
                CHECK_PERIODS :=TfrmSmFilter(FilterForm).CheckPeriod.Checked;
                CHECK_CUR_DATE:=TfrmSmFilter(FilterForm).CheckCurDate.Checked;
                CHECK_DATE_BEG:=TfrmSmFilter(FilterForm).CheckDateBeg.Checked;
                CHECK_DATE_END:=TfrmSmFilter(FilterForm).CheckDateEnd.Checked;
                CHECK_SM_GROUP:=TfrmSmFilter(FilterForm).CheckGroup.Checked;
                CUR_DATE      :=TfrmSmFilter(FilterForm).EdCurDate.Date;
                DATE_BEG      :=TfrmSmFilter(FilterForm).EdDateBeg.Date;
                DATE_END      :=TfrmSmFilter(FilterForm).EdDateEnd.Date;
                SM_GROUP      :=TfrmSmFilter(FilterForm).ID_SM_GROUP;

                FI:=SmView.DataController.FocusedRowIndex;
                GetData;
                SmView.DataController.FocusedRowIndex:=FI;
      end;
end;

procedure TfrmSmetaSpr.N8Click(Sender: TObject);
var  T: TfrmGetHistory;
begin
     if SmetaDataSet.RecordCount>0
     then begin
               T:=TfrmGetHistory.Create(self);
               T.ShowModal;
               T.Free;
     end;          
end;

procedure TfrmSmetaSpr.PeriodsViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
     if (ARecord.Values[IsDraft.Index]='0')
     then AStyle:=SilverStyle
     else AStyle:=back
end;

procedure TfrmSmetaSpr.OnActualDatePropertiesChange(Sender: TObject);
begin
     if PeriodsDataSet.Active then PeriodsDataSet.Close;
     if UseAccess
                then PeriodsDataSet.SQLs.SelectSQL.Text:='SELECT * FROM BU_SMET_PLUS_PERIODS_SELECT_EX3('+IntToStr(Self.Id_user)+','+'?P_ID_SMETA,'+IntToStr(Integer(OnActualDate.Checked))+',CURRENT_DATE)'+' ORDER BY DATE_BEG'
                else PeriodsDataSet.SQLs.SelectSQL.Text:='SELECT * FROM BU_SMET_PLUS_PERIODS_SELECT(?P_ID_SMETA,'+IntToStr(Integer(OnActualDate.Checked))+',CURRENT_DATE)'+' ORDER BY DATE_BEG';
     PeriodsDataSet.Open;           
end;

procedure TfrmSmetaSpr.PeriodsViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var T:TfrmPlanBeforeRest;
    UpdateRest:TpFibStoredProc;
    date_beg, date_end:TDateTime;
    id:Int64;
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               if (PeriodsDataSet.RecordCount>0)
               then begin
                         T:=TfrmPlanBeforeRest.Create(self);
                         T.KassaValue.Value  :=PeriodsDataSet.FieldByName('REST_KASSA').Value;
                         T.FinanceValue.Value:=PeriodsDataSet.FieldByName('REST_FINANCE').Value;
                         if T.ShowModal=mrYes
                         then begin
                                   try
                                           UpdateRest:=TpFibStoredProc.Create(self);
                                           UpdateRest.Database:=WorkDatabase;
                                           UpdateRest.Transaction:=WriteTransaction;
                                           UpdateRest.StoredProcName:='BU_EDIT_BEFORE_PLAN_RESTS';
                                           WriteTransaction.StartTransaction;
                                           UpdateRest.Prepare;
                                           id:=StrToInt64(PeriodsDataSet.FieldByName('ID_PLAN').AsString);
                                           date_beg :=PeriodsDataSet.FieldByName('DATE_BEG').Value;
                                           date_end :=PeriodsDataSet.FieldByName('DATE_END').Value;
                                           UpdateRest.ParamByName('ID_PLAN').asInt64:=id;
                                           UpdateRest.ParamByName('KASSA_REST').Value:=T.KassaValue.Value;
                                           UpdateRest.ParamByName('FINANCE_REST').Value:=T.FinanceValue.Value;
                                           UpdateRest.ParamByName('MUST_EDIT').Value:=1;
                                           UpdateRest.ExecProc;
                                           WriteTransaction.Commit;
                                           PeriodsDataSet.CloseOpen(true);
                                           PeriodsDataSet.Locate('id_plan',id,[]);
                                  except on E:Exception do ShowMessage(E.Message);
                                  end;
                         end;
                         T.Free;
               end;
     end;
end;

procedure TfrmSmetaSpr.FormDestroy(Sender: TObject);
begin
  T.Free;
end;

end.
