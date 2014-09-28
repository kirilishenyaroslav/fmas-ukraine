unit uMainAccounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, Ibase, FIBDatabase,
  pFIBDatabase, StdCtrls, ExtCtrls,pFibDataSet, Menus, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxDBEdit, cxMemo, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxContainer, cxCheckBox, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDataSet,pFibStoredProc,
  cxLookAndFeelPainters, cxButtons, uCommon_Types, uCommon_Loader,
  cxTL, dxBarExtItems, dxBar, uCommon_Funcs, uConsts, uDM, uCommon_Messages,
  uConsts_Messages, Placemnt;

type
  TfrmMainAccounts = class(TForm)
    ExtPanel: TPanel;
    Splitter1: TSplitter;
    cxDBMemo1: TcxDBMemo;
    Label3: TLabel;
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
    N19: TMenuItem;
    N20: TMenuItem;
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
    GridAcc: TcxGrid;
    ViewAcc: TcxGridDBTableView;
    ACC_NUM: TcxGridDBColumn;
    STATUS: TcxGridDBColumn;
    DATE_BEG: TcxGridDBColumn;
    DATE_END: TcxGridDBColumn;
    DATE_REG: TcxGridDBColumn;
    ViewAccDBColumn1: TcxGridDBColumn;
    LevelAcc: TcxGridLevel;
    bsFormStorage: TFormStorage;
    CalculateButton: TdxBarLargeButton;
    Open_period_Button: TdxBarLargeButton;
    Close_period_Button: TdxBarLargeButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConfigureButtonClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
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
    procedure NEntryRestClick(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CalculateButtonClick(Sender: TObject);
    procedure Close_period_ButtonClick(Sender: TObject);
    procedure Open_period_ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex : Integer;
    DM : TfrmAccounts_DM;
    aHandle : TISC_DB_HANDLE;
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
    Login : String;
    User  : String;
    DoResult:Integer;
    ErrorID_KOD:String;
    kod_period_system : Integer;

    //Progress_Thread:TShowProgressThread;
    //Calculat_Thread:UDoCalclationsThread;
    //DoProvs_Thread:TDoProvsThread;
    //DoSaldo_Thread:TCloseSysThread;

    CALC_KEY_SESSION:Int64;
    MBookDate:TDateTime;
    ActualDate:TDateTime;
    CalcMode: Integer;
    res : Variant; 
    Constructor Create(AParameter:TbsSimpleParams);reintroduce;
  end;

implementation

uses uAccounts_AE, {BaseTypes, Resources_unitb,} DateUtils, {UCnAccountConf,}
     cxDropDownEdit, cxCalendar   {UCnAccountDetail,  UCnErrors, Kernel,}
     {UCnDocPrinting, UCnCalcConfigure,uCnPrintOborot};
{$R *.dfm}

constructor TfrmMainAccounts.Create(AParameter:TbsSimpleParams);
var
  I : Integer;
begin
  Inherited Create(AParameter.Owner);

  DM := TfrmAccounts_DM.Create(self);
  DM.DB.Handle := AParameter.Db_Handle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;

  self.Id_User := AParameter.ID_User;
  self.aHandle := AParameter.Db_Handle;

  DM.ReadDataSet.Close;
  DM.ReadDataSet.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
  DM.ReadDataSet.Open;

  if (DM.ReadDataSet.RecordCount > 0)
   then MBookDate := DM.ReadDataSet.FieldByName('MAIN_BOOK_DATE').Value
   else MBookDate := Date;


  DM.DataSet.Close;
  RefreshButtonClick(self);

  ViewAcc.Controller.FocusedRowIndex:=0;

  CALC_KEY_SESSION := DM.DB.Gen_Id('BS_GEN_ID_SESSION',1);

  bsFormStorage.RestoreFormPlacement;
end;

procedure TfrmMainAccounts.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainAccounts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  bsFormStorage.SaveFormPlacement;
  if FormStyle = fsMDIChild
   then action := caFree
   else DM.Free;
end;

procedure TfrmMainAccounts.ConfigureButtonClick(Sender: TObject);
var //T: TfrmAccConf;
    USP:TpFibStoredProc;
begin
     //T:=TfrmAccConf.Create(self);
     {if T.ShowModal=mrYes
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
     T.Free;}
end;

procedure TfrmMainAccounts.InsertButtonClick(Sender: TObject);
var
  ID_ACC : Integer;
  ViewForm : TfrmAccounts_AE;
begin
  ViewForm := TfrmAccounts_AE.Create(self, aHandle);
  ViewForm.ShowModal;

  ViewForm.isEditMode := false;

  if ViewForm.ModalResult = mrok then
    begin
     ViewForm.EdNote.Text := 'Рахунок за період '+DateToStr(ViewForm.DateBeg)+'-'+DateToStr(ViewForm.DateEnd) + ';   ' + ViewForm.EdNote.Text;

     DM.WriteTransaction.StartTransaction;
     DM.StoredProc.StoredProcName := 'BS_DT_ACCOUNTS_INSERT';
     DM.StoredProc.Prepare;
     DM.StoredProc.ParamByName('DATE_BEG').Value := ViewForm.DateBeg;
     DM.StoredProc.ParamByName('DATE_END').Value := ViewForm.DateEnd;
     DM.StoredProc.ParamByName('NOTE').Value     := ViewForm.EdNote.Text;
     DM.StoredProc.ExecProc;

     ID_ACC := DM.StoredProc.ParamByName('ID_ACCOUNT').Value;
     try
      DM.WriteTransaction.Commit;
      RefreshButtonClick(Self);
      DM.DataSet.Locate('ID_ACCOUNT',ID_ACC,[]);
     except
      on E:Exception do
       begin
        bsShowMessage('Error', e.Message, mtError, [mbOK]);
        DM.WriteTransaction.Rollback;
        raise;
       end;
     end;
    end;
   ViewForm.Free;
end;

procedure TfrmMainAccounts.RefreshButtonClick(Sender: TObject);
var
 ID_ACC : Int64;
begin
  ID_ACC := 0;
  if DM.DataSet.Active then
   begin
    if (DM.DataSet.RecordCount > 0)
     then ID_ACC := StrToInt64(DM.DataSet.FieldByName('ID_ACCOUNT').AsString);
    DM.DataSet.Close;
   end;

  DM.DataSet.Close;
  DM.DataSet.SelectSQL.Text := 'Select * from BS_DT_ACCOUNTS_SELECT(:ActualDate)';
  DM.DataSet.ParamByName('ActualDate').AsDate := ActualDate;
  DM.DataSet.Open;
  DM.DataSet.Locate('ID_ACCOUNT',ID_ACC,[]);
end;

procedure TfrmMainAccounts.EditButtonClick(Sender: TObject);
var
 InsertSP:TpFibStoredProc;
 ID_ACC:Integer;
begin
 {if DM.DataSet.RecordCount = 0 then exit;

 if (DM.DataSet.FieldByName('STATUS').AsInteger <> 0) then
  begin
   Showmessage('Не можна редагувати цей рахунок.');
   exit;
  End;

  with TfrmAccounts_AE.Create(self, aHandle) do
   begin
    ________________I := True;
    ___________________I := CalcMode;

    dateBeg       := DM.DataSet.FieldByName('DATE_BEG').Value;
    dateEnd       := DM.DataSet.FieldByName('DATE_END').Value;
    EdNote.Text   := DM.DataSet.FieldByName('NOTE').AsString;
    EdAccNum.Text := DM.DataSet.FieldByName('NUM_SCH').AsString;

    ShowModal;

    if ModalResult = mrOk then
     Begin
      DM.WriteTransaction.StartTransaction;
      DM.StoredProc.StoredProcName := 'BS_DT_ACCOUNTS_UPDATE';
      DM.StoredProc.Prepare;
      ID_ACC := DM.DataSet.FieldByName('ID_ACCOUNT').Value;

      DM.StoredProc.ParamByName('ID_ACCOUNT').Value := DM.DataSet.FieldByName('ID_ACCOUNT').Value;
      DM.StoredProc.ParamByName('DATE_BEG').Value   := DateBeg;
      DM.StoredProc.ParamByName('DATE_END').Value   := DateEnd;
      DM.StoredProc.ParamByName('NOTE').Value       := EdNote.Text;
      DM.StoredProc.ExecProc;
      try
       DM.WriteTransaction.Commit;
       RefreshButtonClick(self);
       DM.DataSet.Locate('ID_ACCOUNT',ID_ACC,[]);
      except
       on E:Exception do
       begin
        bsShowMessage('Error', e.Message, mtError, [mbOK]);
        DM.WriteTransaction.Rollback;
        raise;
       end;
      end;
     End;
    Free;
   end; }
end;

procedure TfrmMainAccounts.FilterButtonClick(Sender: TObject);
var I:Integer;
begin
     for i:=0 to ViewAcc.ColumnCount-1 do ViewAcc.Columns[i].Options.Filtering:=FilterButton.Down;
end;

procedure TfrmMainAccounts.DeleteButtonClick(Sender: TObject);
var
  i : Byte;
begin
  if DM.DataSet.RecordCount = 0 then exit;

  if (DM.DataSet.FieldByName('STATUS').AsInteger < 2) then
   begin
    i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts_Messages.bs_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then exit;

    DM.WriteTransaction.StartTransaction;
    DM.StoredProc.StoredProcName:='BS_DT_ACCOUNTS_DELETE';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('ID_ACCOUNT').Value := DM.DataSet.FieldByName('ID_ACCOUNT').AsInteger;
    DM.StoredProc.ExecProc;
    try
     DM.WriteTransaction.Commit;
     DM.DataSet.CacheDelete;
     except
      on E:Exception do
       begin
        bsShowMessage('Error', e.Message, mtError, [mbOK]);
        DM.WriteTransaction.Rollback;
        raise;
       end;
     end;
   end
  else bsShowMessage('Confirmation', 'Не можна видалити проведений документ.', mtConfirmation, [mbOK]);
end;

procedure TfrmMainAccounts.OnTerminateCalcThread(Sender: TObject);
begin
     SetControls(true,false);

     MessageBox(self.Handle,'Процес розрахунку завершено.','Увага!',MB_OK);

     RefreshButtonClick(Self);
end;

procedure TfrmMainAccounts.OnTerminateCalcThread_DB(Sender: TObject);
begin
 //    if Assigned(Progress_Thread) then Progress_Thread.Terminate;
end;


procedure TfrmMainAccounts.SetControls(Enabled,ExtPB: Boolean);
begin
     InsertButton.Enabled   :=Enabled;
     DeleteButton.Enabled   :=Enabled;
     RefreshButton.Enabled  :=Enabled;
     CloseButton.Enabled    :=Enabled;
     CalcButton.Enabled     :=Enabled;
     ProvsButton.Enabled    :=Enabled;
     FilterButton.Enabled   :=Enabled;
     PrintButton.Enabled    :=Enabled;
     N1.Enabled             :=Enabled;
     N2.Enabled             :=Enabled;
     N3.Enabled             :=Enabled;
     ConfigureButton.Enabled:=Enabled;
     N5.Enabled             :=Enabled;
     N6.Enabled             :=Enabled;
     N7.Enabled             :=Enabled;
     N8.Enabled             :=Enabled;
     N9.Enabled             :=Enabled;
     N10.Enabled            :=Enabled;
     N11.Enabled            :=Enabled;
     N12.Enabled            :=Enabled;
     N13.Enabled            :=Enabled;
     N14.Enabled            :=Enabled;
     N15.Enabled            :=Enabled;
     EditButton.Enabled     :=Enabled;
     N16.Enabled            :=Enabled;
end;

procedure TfrmMainAccounts.N17Click(Sender: TObject);
var
 CheckSP:TpFibStoredProc;
 //T:TfrmCalcConfigure;
 F:Integer;
 isRevers : integer;
begin
{  CALC_KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
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
          if (f=0) then
          begin
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
        if CalcMode=1 then T.CheckCalc.Visible:=True;
        if (T.ShowModal=mrYes) then
        begin
          SetControls(false,true);

          Progress_Thread                :=TShowProgressThread.Create(true,self);
          Progress_Thread.FreeOnTerminate:=true;
          Progress_Thread.Priority       :=tpNormal;
          Progress_Thread.OnTerminate    :=OnTerminateCalcThread;
          Progress_Thread.Resume;

          if T.CheckBox_revers.Checked
           then isRevers := 1
           else isRevers := 0;

          Calculat_Thread                 := UDoCalclationsThread.Create(true,self, T.Calc.Checked, T.Recalc.Checked, T.rbAll.Checked, StrToInt64(T.edFixedKode.Text), T.rbFilter.Checked, T.ID_SESSION_FILTER, CalcMode, T.CheckCalc.Checked, isRevers);
          Calculat_Thread.FreeOnTerminate := true;
          Calculat_Thread.Priority        := tpNormal;
          Calculat_Thread.OnTerminate     := OnTerminateCalcThread_DB;
          Calculat_Thread.Resume;
        end;
        T.Free;
      end;
   end;}
end;

procedure TfrmMainAccounts.ProvsButtonClick(Sender: TObject);
//var T: TfrmAccDetail;
begin
{if (AccDataSet.RecordCount>0)
then begin
     T:=TfrmAccDetail.Create(self);
     T.ShowModal;
     T.Free;
end;}
end;

procedure TfrmMainAccounts.N18Click(Sender: TObject);
var CheckSP:TpFibStoredProc;
    F:Integer;
begin
{     CALC_KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
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
     end;}
end;

procedure TfrmMainAccounts.prOnTerminateCalcThread(Sender: TObject);
{var T:TfrmGetErrors;}
begin
{     SetControls(true,false);

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
 }
end;

procedure TfrmMainAccounts.prOnTerminateCalcThread_DB(Sender: TObject);
begin
//     if Assigned(Progress_Thread) then Progress_Thread.Terminate;
end;

procedure TfrmMainAccounts.N23Click(Sender: TObject);
{var GetOSTDate:TpFibStoredProc;}
begin
{     CALC_KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
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
     GetOSTDate.Free;}
end;

procedure TfrmMainAccounts.N26Click(Sender: TObject);
//var BackOSTDate:TpFibStoredProc;
begin
{     BackOSTDate:=TpFibStoredProc.Create(self);
     BackOSTDate.Database:=WorkDatabase;
     BackOSTDate.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     BackOSTDate.StoredProcName:='CN_ACCOUNTS_BACK_SALDO';
     BackOSTDate.Prepare;
     BackOSTDate.ExecProc;
     WriteTransaction.Commit;
     BackOSTDate.Close;
     BackOSTDate.Free;

     RefreshButtonClick(self);}
end;

procedure TfrmMainAccounts.makeOut_saldo(New_Date: TDateTime);
begin
{      DoResult:=0;
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
 }
end;

procedure TfrmMainAccounts.makeOnTerminateCalcThread(Sender: TObject);
begin
     SetControls(true,false);

     if (DoResult=1)
     then MessageBox(self.Handle,'Процес розрахунку залишків завершено успішно.','Увага!',MB_OK)
     else MessageBox(self.Handle,PAnsiChar('Під час розрахунку залишків виникли помилки.'+#13+
                                 '(Error ID_KOD='+ErrorID_KOD+')'+#13+
                                 ' Зверніться до адміністратора системи.'),'Увага!',MB_OK);

     RefreshButtonClick(Self);
end;

procedure TfrmMainAccounts.makeOnTerminateCalcThread_DB(Sender: TObject);
begin
//     if Assigned(Progress_Thread) then Progress_Thread.Terminate;
end;

procedure TfrmMainAccounts.N1Click(Sender: TObject);
//var T:TfrmDocPrinting;
begin
{     if (AccDataSet.RecordCount>0)
     then begin
               T:=TfrmDocPrinting.Create(self,1);
               T.ShowModal;
               T.Free;
     end;}
end;

procedure TfrmMainAccounts.N2Click(Sender: TObject);
{var
  T:TfrmPrintOborot;}
begin
{  if (AccDataSet.RecordCount > 0) then
   begin
    T := TfrmPrintOborot.Create(self,WorkDatabase.Handle,AccDataSet['ID_ACCOUNT'],
                                AccDataSet.FieldByName('DATE_BEG').AsDateTime, AccDataSet.FieldByName('DATE_END').AsDateTime);
   end;}
end;

procedure TfrmMainAccounts.N3Click(Sender: TObject);
//var T:TfrmDocPrinting;
begin
  {   if (AccDataSet.RecordCount>0)
     then begin
               T:=TfrmDocPrinting.Create(self,3);
               T.ShowModal;
               T.Free;
     end;}
end;

procedure TfrmMainAccounts.N24Click(Sender: TObject);
{var      STRU:KERNEL_MODE_STRUCTURE;
         ChangeSTSP:TpFibStoredProc;
         ErrorList:TStringList;
         DoResult:Boolean;
         MSG_STRING:String;
         i:Integer;}
begin
{if (AccDataSet.RecordCount>0)
then begin
         if (AccDataSet.FieldByName('STATUS').AsInteger=2)
         then begin
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
               except on E:Exception do showMessage(E.Message);
               end;
         end;
end;}
end;

procedure TfrmMainAccounts.TerminateButtonClick(Sender: TObject);
begin
//     Calculat_Thread.Terminate;
end;

procedure TfrmMainAccounts.NEntryRestClick(Sender: TObject);
{var
AParameter: TcnSimpleParamsEx;}
begin
{AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= WorkDatabase.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.ID_User:=-1;
  RunFunctionFromPackage(AParameter, 'Contracts\cn_Account_Ost.bpl','ShowAccountOst');
  AParameter.Free;
  Screen.Cursor := crDefault;}
end;

procedure TfrmMainAccounts.N25Click(Sender: TObject);
//var T:TfrmDocPrinting;
begin
{     if (AccDataSet.RecordCount>0)
     then begin
               T:=TfrmDocPrinting.Create(self,2);
               T.ShowModal;
               T.Free;
     end;}
end;

procedure TfrmMainAccounts.FormCreate(Sender: TObject);
begin
  kod_period_system := -1;
  DM.WriteTransaction.StartTransaction;
  DM.StoredProc.StoredProcName := 'BS_ACC_TEST_PERIOD';
  DM.StoredProc.Prepare;
  DM.StoredProc.ExecProc;
  try
    DM.WriteTransaction.Commit;
    kod_period_system := DM.StoredProc.FieldByName('kod_period_system').AsInteger;
    except
      on E:Exception do
       begin
        bsShowMessage('Error', e.Message, mtError, [mbOK]);
        DM.WriteTransaction.Rollback;
        raise;
       end;
  end;

  PLanguageIndex := uCommon_Funcs.bsLanguageIndex();

  InsertButton.Caption    := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption      := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Caption    := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption   := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  CalcButton.Caption      := uConsts.bs_Main_WorkBtn_Caption[PLanguageIndex];
  ProvsButton.Caption     := uConsts.bs_ViewShort_Caption[PLanguageIndex];
  FilterButton.Caption    := uConsts.bs_FilterBtn_Caption[PLanguageIndex];
  PrintButton.Caption     := uConsts.bs_Print_Caption[PLanguageIndex];
  ConfigureButton.Caption := uConsts.bs_Config[PLanguageIndex];
  CloseButton.Caption     := uConsts.bs_ExitBtn_Caption[PLanguageIndex];
end;

procedure TfrmMainAccounts.CalculateButtonClick(Sender: TObject);
var
  ViewForm : TfrmAccounts_AE;
begin
  ViewForm := TfrmAccounts_AE.Create(self, aHandle);
  ViewForm.date_month := DM.DataSet['DATE_MONTH'];
  ViewForm.date_year := DM.DataSet['DATE_YEAR'];
  ViewForm.KOd_period_system := kod_period_system;
  ViewForm.ShowModal;
  ViewForm.Free;

  RefreshButtonClick(Self);
end;

procedure TfrmMainAccounts.Close_period_ButtonClick(Sender: TObject);
begin
  DM.WriteTransaction.StartTransaction;
  DM.StoredProc.StoredProcName := 'BS_DT_ACCOUNTS_INSERT';
  DM.StoredProc.Prepare;
  DM.StoredProc.ExecProc;
  try
    DM.WriteTransaction.Commit;
    except
      on E:Exception do
       begin
        bsShowMessage('Error', e.Message, mtError, [mbOK]);
        DM.WriteTransaction.Rollback;
        raise;
       end;
  end;
  RefreshButtonClick(self);
end;

procedure TfrmMainAccounts.Open_period_ButtonClick(Sender: TObject);
begin
  if DM.DataSet['STATUS'] <> 2 then exit;

  DM.WriteTransaction.StartTransaction;
  DM.StoredProc.StoredProcName := 'BS_DT_ACCOUNTS_DELETE';
  DM.StoredProc.Prepare;
  DM.StoredProc.ExecProc;
  try
    DM.WriteTransaction.Commit;
    except
      on E:Exception do
       begin
        bsShowMessage('Error', e.Message, mtError, [mbOK]);
        DM.WriteTransaction.Rollback;
        raise;
       end;
  end;
  RefreshButtonClick(self);
end;

procedure TfrmMainAccounts.FormShow(Sender: TObject);
begin
  If kod_period_system = -1 then
   Begin
    CalculateButton.Enabled := False;
    Close_period_Button.Enabled := False;
    Open_period_Button.Enabled := False;
   End; 
end;

end.



