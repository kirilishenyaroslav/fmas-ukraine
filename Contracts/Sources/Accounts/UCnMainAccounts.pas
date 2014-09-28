unit UCnMainAccounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, Ibase, FIBDatabase,
  pFIBDatabase, StdCtrls, ExtCtrls,pFibDataSet, Menus, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxDBEdit, cxMemo, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxContainer, cxCheckBox, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDataSet,pFibStoredProc,
  UCnShowProgressThread, UCnDoCalculationsThread, UCnDoProvsThread, UCnCloseSysThread,
  cxLookAndFeelPainters, cxButtons, cn_Common_Types, cn_Common_Loader,
  cxTL, dxBarExtItems, dxBar, cn_Common_Funcs, cnConsts, frxClass, frxDBSet;

type
  TfrmAccountMain = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Panel1: TPanel;
    ViewAcc: TcxGridDBTableView;
    LevelAcc: TcxGridLevel;
    GridAcc: TcxGrid;
    CheckFilterPanel: TcxCheckBox;
    ACC_NUM: TcxGridDBColumn;
    STATUS: TcxGridDBColumn;
    DATE_REG: TcxGridDBColumn;
    DATE_BEG: TcxGridDBColumn;
    DATE_END: TcxGridDBColumn;
    CheckExtInfo: TcxCheckBox;
    ExtPanel: TPanel;
    Splitter1: TSplitter;
    cxDBMemo1: TcxDBMemo;
    Label3: TLabel;
    AccDataSet: TpFIBDataSet;
    AccDataSource: TDataSource;
    MainPopupMenu: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    ViewAccDBColumn1: TcxGridDBColumn;
    CalcProgressBar: TProgressBar;
    RedLabel: TLabel;
    N19: TMenuItem;
    N20: TMenuItem;
    Label1: TLabel;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    lbGlobalCalcProcess: TLabel;
    pbGlobalCalcProcess: TProgressBar;
    TerminateButton: TcxButton;
    N4: TMenuItem;
    NEntryRest: TMenuItem;
    PopupImageList: TImageList;
    BarManager: TdxBarManager;
    InsertButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    ConfigureButton: TdxBarLargeButton;
    LgotaButton: TdxBarLargeButton;
    EntryRestButton: TdxBarLargeButton;
    HistoryButton: TdxBarLargeButton;
    FIO_BarContainer: TdxBarControlContainerItem;
    FilterExecute_Button: TdxBarButton;
    Dog_Filter_Edit: TdxBarEdit;
    FilterButton: TdxBarLargeButton;
    DsetRecordCount: TdxBarButton;
    CreditButton: TdxBarLargeButton;
    Faculty_Footer_Label: TdxBarStatic;
    Spec_Footer_Label: TdxBarStatic;
    Gragdanstvo_Footer_Label: TdxBarStatic;
    FormStudy_Footer_Label: TdxBarStatic;
    CategoryStudy_Footer_Label: TdxBarStatic;
    Kurs_Footer_Label: TdxBarStatic;
    Group_Footer_Label: TdxBarStatic;
    ProvsButton: TdxBarLargeButton;
    CalcButton: TdxBarLargeButton;
    PayerData_Button: TdxBarButton;
    RastorgPri4ina_Button: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    Dodatki_Button: TdxBarSubItem;
    Log: TdxBarButton;
    RecoveryBtn: TdxBarButton;
    OrdersBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    Erased_Btn: TdxBarButton;
    NoteStatic: TdxBarStatic;
    ExportDataBtn: TdxBarButton;
    dxBarStatic2: TdxBarStatic;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    Dog_status_label: TdxBarStatic;
    dxBarToolbarsListItem1: TdxBarToolbarsListItem;
    dxBarLargeButton5: TdxBarLargeButton;
    Scan_button: TdxBarButton;
    dxBarButton4: TdxBarButton;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    WorkPopupMenu: TdxBarPopupMenu;
    N17: TdxBarButton;
    N26: TdxBarButton;
    N18: TdxBarButton;
    N23: TdxBarButton;
    N24: TdxBarButton;
    PrintPopupMenu: TdxBarPopupMenu;
    N1: TdxBarButton;
    N25: TdxBarButton;
    N3: TdxBarButton;
    N2: TdxBarButton;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    AnalDataSet: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    Panel2: TPanel;
    CheckBox_display_account: TcxCheckBox;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigureButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure CheckExtInfoPropertiesChange(Sender: TObject);
    procedure CheckFilterPanelPropertiesChange(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FilterButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure ProvsButtonClick(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure TerminateButtonClick(Sender: TObject);
    procedure cbYearChange(Sender: TObject);
    procedure NEntryRestClick(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
  private
    PLanguageIndex : Integer;
    procedure OnTerminateCalcThread(Sender:TObject);
    procedure OnTerminateCalcThread_DB(Sender:TObject);

    procedure prOnTerminateCalcThread(Sender:TObject);
    procedure prOnTerminateCalcThread_DB(Sender:TObject);

    procedure makeOnTerminateCalcThread(Sender:TObject);
    procedure makeOnTerminateCalcThread_DB(Sender:TObject);


    procedure makeOut_saldo(New_Date:TDateTime);
    procedure SetControls(Enabled,ExtPB:Boolean);
  public
    { Public declarations }
    Id_User:Integer;
    Login:String;
    User:String;
    DoResult:Integer;
    ErrorID_KOD:String;

    Progress_Thread:TShowProgressThread;
    Calculat_Thread:UDoCalclationsThread;
    DoProvs_Thread:TDoProvsThread;
    DoSaldo_Thread:TCloseSysThread;

    CALC_KEY_SESSION:Int64;
    MBookDate:TDateTime;
    ActualDate:TDateTime;
    CalcMode: Integer;
    Constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;Id_user:Integer;Login,Pswrd:STRING);reintroduce;
    function getSqlText:String;
  end;

implementation

uses BaseTypes, Resources_unitb, DateUtils, UCnAccountConf, UCnEditAccounts,
     cxDropDownEdit, cxCalendar,   UCnAccountDetail,  UCnErrors, Kernel,
     UCnDocPrinting, UCnCalcConfigure,uCnPrintOborot;
{$R *.dfm}

constructor TfrmAccountMain.Create(AOwner: TComponent;DBHandle: TISC_DB_HANDLE; Id_user: Integer;Login,Pswrd:sTRING);
var I:Integer;
    SysInfo:TpFibDataSet;
    AccInfo:TpFibDataSet;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     self.Id_User:=Id_user;

     SysInfo:=TpFibDataSet.Create(Self);
     SysInfo.Database:=WorkDatabase;
     SysInfo.Transaction:=ReadTransaction;
     SysInfo.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
     SysInfo.Open;
     if (SysInfo.RecordCount>0)
     then MBookDate:=SysInfo.FieldByName('MAIN_BOOK_DATE').Value
     else MBookDate:=Date;

     AccInfo:=TpFibDataSet.Create(Self);
     AccInfo.Database:=WorkDatabase;
     AccInfo.Transaction:=ReadTransaction;
     AccInfo.SelectSQL.Text:='SELECT * FROM CN_DT_ACCOUNTS_INI';
     AccInfo.Open;
     CalcMode:=AccInfo.FieldByName('CALC_MODE').AsInteger;

     cbMonth.Items.Add(TRIM(BU_Month_01));
     cbMonth.Items.Add(TRIM(BU_Month_02));
     cbMonth.Items.Add(TRIM(BU_Month_03));
     cbMonth.Items.Add(TRIM(BU_Month_04));
     cbMonth.Items.Add(TRIM(BU_Month_05));
     cbMonth.Items.Add(TRIM(BU_Month_06));
     cbMonth.Items.Add(TRIM(BU_Month_07));
     cbMonth.Items.Add(TRIM(BU_Month_08));
     cbMonth.Items.Add(TRIM(BU_Month_09));
     cbMonth.Items.Add(TRIM(BU_Month_10));
     cbMonth.Items.Add(TRIM(BU_Month_11));
     cbMonth.Items.Add(TRIM(BU_Month_12));

     for i:=0 to 25 do
     begin
          cbYear.Items.Add(TRIM(IntToStr(2000+i)));
     end;

     cbMonth.ItemIndex:=0;
     for i:=0 to cbYear.Items.Count-1 do
     begin
           if pos(cbYear.Items[i],IntToStr(YearOf(MBookDate)))>0
           then begin
              cbYear.ItemIndex:=i;
              break;
           end;
     end;

     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);

     AccDataSet.SelectSQL.Text:=getSqlText;
     AccDataSet.Open;

     ViewAcc.Controller.FocusedRowIndex:=0;

     CALC_KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
end;

procedure TfrmAccountMain.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmAccountMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmAccountMain.ConfigureButtonClick(Sender: TObject);
var T: TfrmAccConf;
    USP:TpFibStoredProc;
begin
     T:=TfrmAccConf.Create(self);
     if T.ShowModal=mrYes
     then begin
               USP:=TpFibStoredProc.Create(self);
               USP.Database:=WorkDatabase;
               USP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               USP.StoredProcName:='CN_DT_ACCOUNTS_INI_UPDATE';
               USP.Prepare;
               USP.ParamByName('GLOBAL_ID_DOG').AsInt64:=T.WorkIdDog;
               USP.ParamByName('WORK_SCH').AsInt64:=T.WorkSch;
               USP.ParamByName('DATE_START').Value:=T.cxDateEdit1.Date;
               USP.ParamByName('ONLY_MAIN_DOCS').Value:=Integer(T.cxCheckBox1.Checked);
               USP.ParamByName('CALC_MODE').Value:=T.cxComboBox1.ItemIndex;
               USP.ExecProc;
               WriteTransaction.Commit;
               USP.Close;
               USP.Free;
     end;
     T.Free;
end;

procedure TfrmAccountMain.InsertButtonClick(Sender: TObject);
var
 InsertSP:TpFibStoredProc;
 ID_ACC:Integer;
begin
 with TfrmEditAcc.Create(self) do
  begin
   isEditMode:=false;
   ShowModal;
   if ModalResult = mrok then
    begin
     EdNote.Text := 'Рахунок за період '+DateToStr(DateBeg)+'-'+DateToStr(DateEnd) + ';   ' + EdNote.Text;
     InsertSP:=TpFibStoredProc.Create(self);
     InsertSP.Database:=TfrmAccountMain(Owner).WorkDatabase;
     InsertSP.Transaction:=TfrmAccountMain(Owner).WriteTransaction;
     TfrmAccountMain(Owner).WriteTransaction.StartTransaction;
     InsertSP.StoredProcName:='CN_DT_ACCOUNTS_INSERT';
     InsertSP.Prepare;
     InsertSP.ParamByName('DATE_BEG').Value   := DateBeg;
     InsertSP.ParamByName('DATE_END').Value   := DateEnd;
     InsertSP.ParamByName('NOTE').Value       := EdNote.Text;
     InsertSP.ParamByName('is_account').Value := 1;
     InsertSP.ExecProc;
     ID_ACC:=InsertSP.ParamByName('ID_ACCOUNT').Value;
     TfrmAccountMain(Owner).WriteTransaction.Commit;
     TfrmAccountMain(Owner).AccDataSet.CloseOpen(true);
     TfrmAccountMain(Owner).AccDataSet.Locate('ID_ACCOUNT',ID_ACC,[]);
    end;
   Free;
  end;
end;

procedure TfrmAccountMain.CheckExtInfoPropertiesChange(Sender: TObject);
begin
     if CheckExtInfo.Checked
     then begin
               ExtPanel.Visible:=true;
               Splitter1.Top:=ExtPanel.Top+1;
     end
     else begin
               ExtPanel.Visible:=false;
     end;

end;

procedure TfrmAccountMain.CheckFilterPanelPropertiesChange(
  Sender: TObject);
begin
    ViewAcc.OptionsView.GroupByBox:=CheckFilterPanel.Checked;
end;

function TfrmAccountMain.getSqlText: String;
var
  sql : string;
begin
  sql := 'SELECT * FROM CN_DT_ACCOUNTS_SELECT('+''''+DateToStr(ActualDate)+''''+')';
  if CheckBox_display_account.Checked
   then sql := sql + ' where is_account = 1'
   else sql := sql + ' where is_account in (0, 1)';

  result := sql;
end;

procedure TfrmAccountMain.RefreshButtonClick(Sender: TObject);
var
 ID_ACC:Int64;
begin
 ID_ACC:=0;
 if AccDataSet.Active then
  begin
   if (AccDataSet.RecordCount>0)
    then ID_ACC:=StrToInt64(AccDataSet.FieldByName('ID_ACCOUNT').AsString);
   AccDataSet.Close;
  end;
 AccDataSet.SelectSQL.Text:=getSqlText;
 AccDataSet.Open;
 AccDataSet.Locate('ID_ACCOUNT',ID_ACC,[]);
end;

procedure TfrmAccountMain.EditButtonClick(Sender: TObject);
var
 InsertSP:TpFibStoredProc;
 ID_ACC:Integer;
begin
 if (AccDataSet.RecordCount = 0) then exit;

 if (AccDataSet.FieldByName('STATUS').AsInteger <> 0) then
  begin
   Showmessage('Не можна редагувати цей рахунок.');
   exit;
  End;

  with TfrmEditAcc.Create(self) do
   begin
    isEditMode:=true;
    Calc_Mode:=CalcMode;
    dateBeg:=AccDataSet.FieldByName('DATE_BEG').Value;
    dateEnd:=AccDataSet.FieldByName('DATE_END').Value;
    EdNote.Text:=AccDataSet.FieldByName('NOTE').AsString;
    EdAccNum.Text:=AccDataSet.FieldByName('NUM_SCH').AsString;
    ShowModal;
    if ModalResult = mrOk then
     Begin
      InsertSP:=TpFibStoredProc.Create(self);
      InsertSP.Database:=TfrmAccountMain(Owner).WorkDatabase;
      InsertSP.Transaction:=TfrmAccountMain(Owner).WriteTransaction;
      TfrmAccountMain(Owner).WriteTransaction.StartTransaction;
      InsertSP.StoredProcName:='CN_DT_ACCOUNTS_UPDATE';
      InsertSP.Prepare;
      ID_ACC:=TfrmAccountMain(Owner).AccDataSet.FieldByName('ID_ACCOUNT').Value;
      InsertSP.ParamByName('ID_ACCOUNT').Value := TfrmAccountMain(Owner).AccDataSet.FieldByName('ID_ACCOUNT').Value;
      InsertSP.ParamByName('DATE_BEG').Value   := DateBeg;
      InsertSP.ParamByName('DATE_END').Value   := DateEnd;
      InsertSP.ParamByName('NOTE').Value       := EdNote.Text;
      InsertSP.ExecProc;
      TfrmAccountMain(Owner).WriteTransaction.Commit;
      TfrmAccountMain(Owner).AccDataSet.CloseOpen(true);
      TfrmAccountMain(Owner).AccDataSet.Locate('ID_ACCOUNT',ID_ACC,[]);
     end;
    Free;
   end;
end;

procedure TfrmAccountMain.FilterButtonClick(Sender: TObject);
var I:Integer;
begin
     for i:=0 to ViewAcc.ColumnCount-1 do ViewAcc.Columns[i].Options.Filtering:=FilterButton.Down;
end;

procedure TfrmAccountMain.DeleteButtonClick(Sender: TObject);
var InsertSP:TpFibStoredProc;
begin
     if (AccDataSet.RecordCount>0)
     then begin
               if (AccDataSet.FieldByName('STATUS').AsInteger<2)
               then begin
                         if BaseTypes.agMessageDlg(BU_WarningCaption,BU_DeleteConfirmation,mtWarning,[mbYes,mbNo])=mrYes
                         then begin
                                    InsertSP:=TpFibStoredProc.Create(self);
                                    InsertSP.Database:=WorkDatabase;
                                    InsertSP.Transaction:=WriteTransaction;
                                    WriteTransaction.StartTransaction;
                                    InsertSP.StoredProcName:='CN_DT_ACCOUNTS_DELETE';
                                    InsertSP.Prepare;
                                    InsertSP.ParamByName('ID_ACCOUNT').Value:=AccDataSet.FieldByName('ID_ACCOUNT').AsInteger;
                                    InsertSP.ExecProc;
                                    WriteTransaction.Commit;
                                    AccDataSet.CacheDelete;
                         end;
               end
               else BaseTypes.agMessageDlg(BU_WarningCaption,'Не можна видалити проведений документ.',mtConfirmation,[mbOK]);
     end;
end;

procedure TfrmAccountMain.OnTerminateCalcThread(Sender: TObject);
begin
     SetControls(true,false);

     MessageBox(self.Handle,'Процес розрахунку завершено.','Увага!',MB_OK);

     RefreshButtonClick(Self);
end;

procedure TfrmAccountMain.OnTerminateCalcThread_DB(Sender: TObject);
begin
     if Assigned(Progress_Thread) then Progress_Thread.Terminate;
end;


procedure TfrmAccountMain.SetControls(Enabled,ExtPB: Boolean);
begin
     InsertButton.Enabled      :=Enabled;
     DeleteButton.Enabled      :=Enabled;
     RefreshButton.Enabled     :=Enabled;
     CloseButton.Enabled       :=Enabled;
     CalcButton.Enabled        :=Enabled;
     ProvsButton.Enabled       :=Enabled;
     FilterButton.Enabled      :=Enabled;
     PrintButton.Enabled       :=Enabled;
     N1.Enabled                :=Enabled;
     N2.Enabled                :=Enabled;
     N3.Enabled                :=Enabled;
     ConfigureButton.Enabled   :=Enabled;
     N5.Enabled                :=Enabled;
     N6.Enabled                :=Enabled;
     N7.Enabled                :=Enabled;
     N8.Enabled                :=Enabled;
     N9.Enabled                :=Enabled;
     N10.Enabled               :=Enabled;
     N11.Enabled               :=Enabled;
     N12.Enabled               :=Enabled;
     N13.Enabled               :=Enabled;
     N14.Enabled               :=Enabled;
     N15.Enabled               :=Enabled;
     EditButton.Enabled        :=Enabled;
     N16.Enabled               :=Enabled;
     RedLabel.Enabled          :=not Enabled;
     CalcProgressBar.Enabled   := not Enabled;
     dxBarLargeButton1.Enabled := Enabled;
     GridAcc.Enabled           := Enabled;


     lbGlobalCalcProcess.Visible:=ExtPB;
     pbGlobalCalcProcess.Visible:=ExtPB;
     TerminateButton.Visible:=ExtPB;
end;

procedure TfrmAccountMain.N17Click(Sender: TObject);
var
 CheckSP:TpFibStoredProc;
 T:TfrmCalcConfigure;
 F:Integer;
 GetDataMode:Integer;
begin



  CALC_KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
  DoResult:=0;
  if (AccDataSet.RecordCount>0) then
   begin
    //Проверяем статус счета
    if (AccDataSet.FieldByName('STATUS').AsInteger=2) then
     begin
      ShowMessage('Рахунок вже проведений по бухгалтерії.');
      Exit;
     end
    else
      begin
        if CalcMode<>1 then
        begin
          //Проверяем есть ли между эти счетом и ближайшим расчитанным "нерасчитанные" счета
          CheckSP:=TpFibStoredProc.Create(self);
          CheckSP.Database:=WorkDatabase;
          CheckSP.Transaction:=ReadTransaction;
          CheckSP.StoredProcName:='CN_ACCOUTS_IS_MAY_BEE_CALC';
          CheckSP.Prepare;
          CheckSP.ParamByName('ID_ACCOUNT').AsInt64:=StrToInt64(AccDataSet.FieldByName('ID_ACCOUNT').AsString);
          CheckSP.ExecProc;
          F:=CheckSP.ParamByName('RESULT').AsInteger;
          if (f=0)
          then begin
                    BaseTypes.agMessageDlg(BU_WarningCaption,CheckSP.ParamByName('WARNING_MSG').AsString,mtError,[mbOk]);
                    CheckSP.Close;
                    CheckSP.Free;
                    Exit;
          end
          else
          begin
                    CheckSP.Close;
                    CheckSP.Free;
          end;
        end;

        //Предупреждаем пользователя о том что расчет по этому документу уже совершался
        if (AccDataSet.FieldByName('STATUS').AsInteger=1)then
        begin
             if BaseTypes.agMessageDlg(BU_WarningCaption,'По документу вже зроблено розрахунок. Виконати розрахунок?',mtConfirmation,[mbYes,mbNo])=mrNo
             then Exit;
        end;

        T:=TfrmCalcConfigure.Create(self, WorkDatabase.Handle);
        if (T.ShowModal=mrYes) then
        begin

          SetControls(false,true);

          Progress_Thread                :=TShowProgressThread.Create(true,self);
          Progress_Thread.FreeOnTerminate:=true;
          Progress_Thread.Priority       :=tpNormal;
          Progress_Thread.OnTerminate    :=OnTerminateCalcThread;
          Progress_Thread.Resume;

          GetDataMode:=1;
          if T.rbFilter.Checked    then GetDataMode:=1;
          if T.rbFixedKod.Checked  then GetDataMode:=2;

          Calculat_Thread := UDoCalclationsThread.Create(true,                            //CreateSuspended
                                                         self,                            //Form
                                                         T.DoCalc.Checked,                //DoCalc
                                                         T.DoReversCalc.Checked,          //DoReversCalc
                                                         T.Recalc.Checked,                //DoRecalc
                                                         T.DoRecalcByFilter.Checked,      //DoRecalcByFilter
                                                         T.DoRecalcWithoutFilter.Checked, //DoRecalcWithoutFilter
                                                         T.DoRecalcWithCheckEdit.Checked, //DoRecalcWithCheckEdit
                                                         StrToInt64(T.edFixedKode.Text),  //UsedFixedIdKod
                                                         T.ID_SESSION_FILTER,             //Used_SESSION_FILTER
                                                         GetDataMode,                     //GetDataMode
                                                         StrToInt64(AccDataSet.FieldByName('ID_ACCOUNT').AsString));


          Calculat_Thread.FreeOnTerminate := true;
          Calculat_Thread.Priority        := tpNormal;
          Calculat_Thread.OnTerminate     := OnTerminateCalcThread_DB;
          Calculat_Thread.Resume;
        end;
        T.Free;
      end;
   end;
end;

procedure TfrmAccountMain.ProvsButtonClick(Sender: TObject);
var T: TfrmAccDetail;
begin
if (AccDataSet.RecordCount>0)
then begin
          T:=TfrmAccDetail.Create(self, WorkDatabase.Handle, AccDataSet.FieldBYName('STATUS').Value);
          T.ShowModal;
          T.Free;
end;
end;

procedure TfrmAccountMain.N18Click(Sender: TObject);
var CheckSP:TpFibStoredProc;
    F:Integer;
begin
     CALC_KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
     DoResult:=0;
     if (AccDataSet.RecordCount>0)
     then begin
                 //Проверяем статус счета
                 if (AccDataSet.FieldByName('STATUS').AsInteger=0)
                 then begin
                            ShowMessage('Рахунок ще не розрахований.');
                            Exit;
                 end
                 else begin
                            //Проверяем есть ли между эти счетом и ближайшим проведенным "нерасчитанные" счета
                            CheckSP:=TpFibStoredProc.Create(self);
                            CheckSP.Database:=WorkDatabase;
                            CheckSP.Transaction:=ReadTransaction;
                            CheckSP.StoredProcName:='CN_ACCOUTS_IS_MAY_BEE_PROV';
                            CheckSP.Prepare;
                            CheckSP.ParamByName('ID_ACCOUNT').AsInt64:=StrToInt64(AccDataSet.FieldByName('ID_ACCOUNT').AsString);
                            CheckSP.ExecProc;
                            F:=CheckSP.ParamByName('RESULT').AsInteger;
                            CheckSP.Close;
                            CheckSP.Free;
                            if (f=0)
                            then begin
                                      BaseTypes.agMessageDlg(BU_WarningCaption,'Не можна проводити рахунок, є не проведені рахунки, які додані раніше! ',mtError,[mbOk]);
                                      Exit;
                            end;


                            SetControls(false,false);

                            Progress_Thread                :=TShowProgressThread.Create(true,self);
                            Progress_Thread.FreeOnTerminate:=true;
                            Progress_Thread.Priority       :=tpNormal;
                            Progress_Thread.OnTerminate    :=prOnTerminateCalcThread;
                            Progress_Thread.Resume;

                            DoProvs_Thread                 :=TDoProvsThread.Create(true,self);
                            DoProvs_Thread.FreeOnTerminate :=true;
                            DoProvs_Thread.Priority        :=tpNormal;
                            DoProvs_Thread.OnTerminate     :=prOnTerminateCalcThread_DB;
                            DoProvs_Thread.Resume;
                 end;
     end;
end;

procedure TfrmAccountMain.prOnTerminateCalcThread(Sender: TObject);
var T:TfrmGetErrors;
begin
     SetControls(true,false);

     if (DoResult=1)
     then MessageBox(self.Handle,'Процес проведення документу завершено.','Увага!',MB_OK)
     else begin
               T:=TfrmGetErrors.Create(self);
               T.cxMemo1.Lines.Add('Під час проведення документу виникли помилки');
               T.cxMemo1.Lines.Add(ErrorID_KOD);
               T.ShowModal;
               T.Free;
               ErrorID_KOD:='';
     end;
     RefreshButtonClick(Self);

end;

procedure TfrmAccountMain.prOnTerminateCalcThread_DB(Sender: TObject);
begin
     if Assigned(Progress_Thread) then Progress_Thread.Terminate;
end;

procedure TfrmAccountMain.N23Click(Sender: TObject);
var GetOSTDate:TpFibStoredProc;
begin
     CALC_KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
     GetOSTDate:=TpFibStoredProc.Create(self);
     GetOSTDate.Database:=WorkDatabase;
     GetOSTDate.Transaction:=ReadTransaction;
     GetOSTDate.StoredProcName:='CN_ACCOUNTS_GET_OST_DATE';
     GetOSTDate.Prepare;
     GetOSTDate.ExecProc;
     if agMessageDlg(BU_WarningCaption,'Сформувати залишки на '+GetOSTDate.ParamByName('LAST_OST_DATE').AsString,mtConfirmation,[mbYes,mbNo])=mrYes
     then begin
               makeOut_saldo(GetOSTDate.ParamByName('LAST_OST_DATE').AsDateTime);
     end;
     GetOSTDate.Close;
     GetOSTDate.Free;
end;

procedure TfrmAccountMain.N26Click(Sender: TObject);
var BackOSTDate:TpFibStoredProc;
begin
     BackOSTDate:=TpFibStoredProc.Create(self);
     BackOSTDate.Database:=WorkDatabase;
     BackOSTDate.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     BackOSTDate.StoredProcName:='CN_ACCOUNTS_BACK_SALDO';
     BackOSTDate.Prepare;
     BackOSTDate.ExecProc;
     WriteTransaction.Commit;
     BackOSTDate.Close;
     BackOSTDate.Free;

     RefreshButtonClick(self);
end;

procedure TfrmAccountMain.makeOut_saldo(New_Date: TDateTime);
begin
      DoResult:=0;
      SetControls(false,false);

      Progress_Thread                :=TShowProgressThread.Create(true,self);
      Progress_Thread.FreeOnTerminate:=true;
      Progress_Thread.Priority       :=tpNormal;
      Progress_Thread.OnTerminate    :=makeOnTerminateCalcThread;
      Progress_Thread.Resume;

      DoSaldo_Thread                 :=TCloseSysThread.Create(true,self,New_Date);
      DoSaldo_Thread.FreeOnTerminate :=true;
      DoSaldo_Thread.Priority        :=tpNormal;
      DoSaldo_Thread.OnTerminate     :=makeOnTerminateCalcThread_DB;
      DoSaldo_Thread.Resume;

end;

procedure TfrmAccountMain.makeOnTerminateCalcThread(Sender: TObject);
begin
     SetControls(true,false);

     if (DoResult=1)
     then MessageBox(self.Handle,'Процес розрахунку залишків завершено успішно.','Увага!',MB_OK)
     else MessageBox(self.Handle,PAnsiChar('Під час розрахунку залишків виникли помилки.'+#13+
                                 '(Error ID_KOD='+ErrorID_KOD+')'+#13+
                                 ' Зверніться до адміністратора системи.'),'Увага!',MB_OK);

     RefreshButtonClick(Self);
end;

procedure TfrmAccountMain.makeOnTerminateCalcThread_DB(Sender: TObject);
begin
     if Assigned(Progress_Thread) then Progress_Thread.Terminate;
end;

procedure TfrmAccountMain.N1Click(Sender: TObject);
var T:TfrmDocPrinting;
begin
     if (AccDataSet.RecordCount>0)
     then begin
               T:=TfrmDocPrinting.Create(self,1);
               T.ShowModal;
               T.Free;
     end;
end;

procedure TfrmAccountMain.N2Click(Sender: TObject);
var
  T:TfrmPrintOborot;
begin
  if (AccDataSet.RecordCount > 0) then
   begin
    T := TfrmPrintOborot.Create(self,WorkDatabase.Handle,AccDataSet['ID_ACCOUNT'],
                                AccDataSet.FieldByName('DATE_BEG').AsDateTime, AccDataSet.FieldByName('DATE_END').AsDateTime);
   end;
end;

procedure TfrmAccountMain.N3Click(Sender: TObject);
var T:TfrmDocPrinting;
begin
     if (AccDataSet.RecordCount>0)
     then begin
               T:=TfrmDocPrinting.Create(self,3);
               T.ShowModal;
               T.Free;
     end;
end;

procedure TfrmAccountMain.N24Click(Sender: TObject);
var      STRU:KERNEL_MODE_STRUCTURE;
         ChangeSTSP:TpFibStoredProc;
         ErrorList:TStringList;
         DoResult:Boolean;
         MSG_STRING:String;
         i:Integer;
begin
if (AccDataSet.RecordCount>0)
then begin
         if (AccDataSet.FieldByName('STATUS').AsInteger=2)
         then begin
               //start_sql_monitor;
               WriteTransaction.StartTransaction;
               STRU.KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
               STRU.TRHANDLE:=WriteTransaction.Handle;
               STRU.DBHANDLE:=WorkDatabase.Handle;
               STRU.KERNEL_ACTION:=2;
               STRU.PK_ID:=TFibBCDField(AccDataSet.FieldByName('BUHG_PK_ID')).AsInt64;
               STRU.WORKDATE:=AccDataSet.FieldByName('WORK_SCH_DATE').Value;
               STRU.ID_USER:=self.id_user;
               try
                  DoResult:=Kernel.KernelDo(@STRU);
                  if not DoResult
                  then begin
                             ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                             MSG_STRING:='При видаленні документа були виявленні помилки. '+Chr(10)+chr(13);
                             if ErrorList<>nil
                             then begin
                                    for i:=0 to  ErrorList.Count-1 do
                                    begin
                                          MSG_STRING:=MSG_STRING+' ПОМИЛКА- '+ErrorList.Strings[i];
                                    end;
                             end;
                             ShowMessage(MSG_STRING);
                  end
                  else begin
                            //Изменяем статус счета
                            ChangeSTSP:=TpFibStoredProc.Create(self);
                            ChangeSTSP.Database:=WorkDatabase;
                            ChangeSTSP.Transaction:=WriteTransaction;
                            WriteTransaction.StartTransaction;
                            ChangeSTSP.StoredProcName:='CN_ACC_DROP_FROM_BUHG';
                            ChangeSTSP.Prepare;
                            ChangeSTSP.ParamByName('ID_ACCOUNT').AsInt64:=StrToInt64(AccDataSet.FieldByName('ID_ACCOUNT').AsString);
                            ChangeSTSP.ExecProc;
                            ChangeSTSP.Free;
                  end;
                  WriteTransaction.Commit;
                  RefreshButtonClick(self);
               except
                 on E:Exception do
                  Begin
                   showMessage(E.Message);
                   //Send_mail(e.Message);
                  end; 
               end;
           //stop_sql_monitor;
         end;
end;
end;

procedure TfrmAccountMain.TerminateButtonClick(Sender: TObject);
begin
     Calculat_Thread.Terminate;
end;

procedure TfrmAccountMain.cbYearChange(Sender: TObject);
begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
     RefreshButtonClick(self);
end;

procedure TfrmAccountMain.NEntryRestClick(Sender: TObject);
var
AParameter: TcnSimpleParamsEx;
begin
AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= WorkDatabase.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.ID_User:=-1;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_Account_Ost.bpl','ShowAccountOst');
  AParameter.Free;
  Screen.Cursor := crDefault;
end;

procedure TfrmAccountMain.N25Click(Sender: TObject);
var T:TfrmDocPrinting;
begin
     if (AccDataSet.RecordCount>0)
     then begin
               T:=TfrmDocPrinting.Create(self,2);
               T.ShowModal;
               T.Free;
     end;
end;

procedure TfrmAccountMain.FormCreate(Sender: TObject);
begin
  PLanguageIndex := cn_Common_Funcs.cnLanguageIndex();

  InsertButton.Caption    := cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption      := cnConsts.cn_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption    := cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption   := cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
  CalcButton.Caption      := cnConsts.cn_Main_WorkBtn_Caption[PLanguageIndex];
  ProvsButton.Caption     := cnConsts.cn_ViewShort_Caption[PLanguageIndex];
  FilterButton.Caption    := cnConsts.cn_FilterBtn_Caption[PLanguageIndex];
  PrintButton.Caption     := cnConsts.cn_Print_Caption[PLanguageIndex];
  ConfigureButton.Caption := cnConsts.cn_Config[PLanguageIndex];
  CloseButton.Caption     := cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmAccountMain.dxBarLargeButton1Click(Sender: TObject);
var T:TfrmCalcConfigure;
    m:Integer;
    ad:TdateTime;
begin
     T:=TfrmCalcConfigure.Create(self, WorkDatabase.Handle);
     T.Panel4.Visible:=false;
     T.Panel5.Align:=alClient;
     T.cxCheckBox1.Visible:=true;
     T.Label1.Visible:=true;
     T.cbMonthBeg.Visible:=true;
     T.cbYearBeg.Visible:=true;
     T.Caption:='Вибір множини договорів для аналізу синтетичного та аналітичного обліку';
     if T.ShowModal=mrYes
     then begin
               SetControls(false,false);
               Panel2.Visible:=true;
               Application.ProcessMessages;
               if t.rbFilter.Checked
               then m:=1
               else m:=2;

               ad := StrToDate('01.'+IntToStr(T.cbMonthBeg.ItemIndex+1)+'.'+T.cbYearBeg.Properties.Items[T.cbYearBeg.ItemIndex]);
               ad := IncMonth(ad,1) - 1;

               if AnalDataSet.Active then AnalDataSet.Close;
               AnalDataSet.SelectSQL.Text:='select * from PC_GET_KODS_FOR_COMP('+
               IntToStr(m)+','+
               IntToStr(T.ID_SESSION_FILTER)+','+
               T.edFixedKode.Text+','+
               IntToStr(Integer(T.cxCheckBox1.Checked))+','+
               ''''+DateToStr(ad)+''''+')';

               AnalDataSet.Open;

               frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Contracts\reestrsyntplusanal.fr3',true);

               frxReport1.Variables['ad']:=''''+DateToStr(ad)+'''';
               frxReport1.PrepareReport;
               frxReport1.ShowReport(true);
               Panel2.Visible:=false;
               Application.ProcessMessages;
               SetControls(true,true);
     end;
     T.Free;
end;

end.



