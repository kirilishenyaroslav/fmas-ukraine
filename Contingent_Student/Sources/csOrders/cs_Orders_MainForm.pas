unit cs_Orders_MainForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView, AArray,
    cxGridDBTableView, cxGrid, RxMemDS, iBase,
    dxBar, dxBarExtItems, ExtCtrls, cs_DM, AppEvnts, AppStruClasses,
    ib_externals, DateUtils, SpPeople_MainForm, FIBDataSet, pFIBDataSet, jpeg, EncdDecd, FIBDatabase,
    pFIBDatabase, AllPeopleDataModule, pFIBStoredProc, uCS_Constants,
    ImgList, cs_Orders_ProgressBar, uCS_Resources, uCS_WaitForm, cxCheckBox,
    cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit;

type
    TcsFormOrders = class(TForm)
        cxGridOrdersEDBODBTableView1: TcxGridDBTableView;
        cxGridOrdersEDBOLevel1: TcxGridLevel;
        cxGridOrdersEDBO: TcxGrid;
        dxBarManager1: TdxBarManager;
        Panel1: TPanel;
        dxBarLargeButton_Refresh: TdxBarLargeButton;
        dxBarLargeButton_GetDataFromEDBO: TdxBarLargeButton;
        Panel2: TPanel;
        col_IdOrder: TcxGridDBColumn;
        col_NumOrder: TcxGridDBColumn;
        col_DateOrder: TcxGridDBColumn;
        col_DateChange: TcxGridDBColumn;
        col_OrderType: TcxGridDBColumn;
        col_Verification: TcxGridDBColumn;
        col_Status: TcxGridDBColumn;
        col_VerificationType: TcxGridDBColumn;
        col_StudCount: TcxGridDBColumn;
        DisabledLargeImages: TImageList;
        PopupImageList: TImageList;
        LargeImages: TImageList;
        Styles: TcxStyleRepository;
        BackGround: TcxStyle;
        FocusedRecord: TcxStyle;
        Header: TcxStyle;
        DesabledRecord: TcxStyle;
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
        Default_StyleSheet: TcxGridTableViewStyleSheet;
        DevExpress_Style: TcxGridTableViewStyleSheet;
        col_IsSynch: TcxGridDBColumn;
        cxButtonEdit1: TcxButtonEdit;
        cxLabelTypeOrder: TcxLabel;
        procedure dxBarLargeButton_RefreshClick(Sender: TObject);
        procedure dxBarLargeButton_GetDataFromEDBOClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
        EDBOGuidesIntf: TFMASAppModule;
        EDBOPersonIntf: TFMASAppModule;
        FInicFormCaption: string;
        ResultArray: TAArray;
        CanConnectToEdbo: Boolean;
        University_Code_U: AnsiString;
        CanWorkWithImage: Integer;
        PBForm: TForm_cs_Orders_ProgressBar;
        procedure SetInicFormCaption(const Value: string);
        procedure InitCaptions;
        procedure InitStyles;
        function MyCsConnectToEdbo: Boolean;
    public
    { Public declarations }
        IndLangVWF: Integer;
        TextViewColorVWF: TColor;
        ID_User_Global: Int64;
        User_Name_Global: string;
        IdCountryEdbo: Integer;
        property InicFormCaption: string read FInicFormCaption write SetInicFormCaption;
        constructor Create(AOwner: TComponent; aParam: TAArray); overload;
        procedure ApplyFilter;
        function GetOrdersFromEdbo: Boolean; //отобрать из едбо всю информацию о приказах
        function GetPeopleFromOrder(Id_Cs_Order: Integer): Boolean; //забрать информацию по людям из приказа в нашу базу
        function GetOrder: Integer; //забрать информацию о приказе в нашу базу
        function ExecSync(PersonCode: AnsiString): Boolean;
        function SyncDataWithEdbo(IdPerson: Integer; Familiya, Imya, Otchestvo, PersonCodeU, NumberPass, SeriaPass: string;
            DateBegPass: TDate; PassVidan: string; IdSex: Integer; BirthDate: TDate; Inn: string; IsResident: Integer): Boolean;
        function SyncImageWithEdbo(IdMan: Integer; PersonCodeU: AnsiString): Boolean;
        function GetPersonAdresses(PersonCodeU: AnsiString): variant;
        function GetPersonDocument(PersonCodeU: AnsiString; NumDocument: Integer): Variant;
        function IsOrderImported(IdCodeEdbo: Integer; TimeModify: TDateTime): Boolean;
        destructor Destroy;
    end;

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray); stdcall;
exports ShowAllPrkBpl;

var
    csFormOrders: TcsFormOrders;
    DM: TDM;
implementation

{$R *.dfm}

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray);
var
    T: TcsFormOrders;
begin
    T := TcsFormOrders.Create(aOwner, aParam);
    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
        fsNormal: begin
                T.ShowModal;
            end;
        fsMDIChild: begin
            end;
    else
        T.Free;
    end;
end;

constructor TcsFormOrders.Create(AOwner: TComponent; aParam: TAArray);
var
    DBHAndle: TISC_DB_HANDLE;
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHandle := PVoid(aParam['Input']['aDBHANDLE'].asInteger);
        ResultArray := aParam;
        ID_User_Global := aParam['Input']['ID_USER_GLOBAL'].AsInt64;
        IndLangVWF := 0;

        inherited Create(aOwner);

        InitCaptions;

        WindowState := wsMaximized;

        DM := TDM.Create(self, DBHandle);
        cxGridOrdersEDBODBTableView1.DataController.DataSource := DM.DSource_EdboOrders;
    end
    else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TcsFormOrders.SetInicFormCaption(
    const Value: string);
begin
    FInicFormCaption := Value;
    InitCaptions;
end;

procedure TcsFormOrders.InitCaptions;
begin
    Caption := nOrders_MainForm_Caption[IndLangVWF];
    dxBarLargeButton_Refresh.Caption := nAction_GetDataFromEDBO[IndLangVWF];
    dxBarLargeButton_GetDataFromEDBO.Caption := nAction_UpdDataFromEDBO[IndLangVWF];

    dxBarLargeButton_Refresh.Hint := nHint_GetDataFromEDBO[IndLangVWF];
    dxBarLargeButton_GetDataFromEDBO.Hint := nHint_UpdDataFromEDBO[IndLangVWF];

    col_IdOrder.Caption := nCol_IdOrder[IndLangVWF];
    col_NumOrder.Caption := nCol_NumOrder[IndLangVWF];
    col_OrderType.Caption := nCol_OrderType[IndLangVWF];
    col_DateOrder.Caption := nCol_DateOrder[IndLangVWF];
    col_Verification.Caption := nCol_Verification[IndLangVWF];
    col_Status.Caption := nCol_Status[IndLangVWF];
    col_VerificationType.Caption := nCol_VerificationType[IndLangVWF];
    col_DateChange.Caption := nCol_DateChange[IndLangVWF];
    col_StudCount.Caption := nCol_StudCount[IndLangVWF];
    col_IsSynch.Caption := nCol_IsSyncWithDB[IndLangVWF];
end;

procedure TcsFormOrders.InitStyles;
begin

end;

procedure TcsFormOrders.ApplyFilter;
var
    WaitForm: TForm;
begin
    if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DM.DB.Handle) then
    begin
        WaitForm := ShowWaitForm(Self);
        GetOrdersFromEdbo;
        CloseWaitForm(WaitForm);
    end
    else csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF] + #10#13 + nMsgToAdmin[IndLangVWF], mtWarning, [mbOk], IndLangVWF);
end;

destructor TcsFormOrders.Destroy;
begin
    if Assigned(EDBOPersonIntf) then EDBOPersonIntf.Free;
end;

function TcsFormOrders.GetOrdersFromEdbo: Boolean;
var
    ActualDate: TDateTime;
    UniversityKode: AnsiString;
    Id_PersonEducationHistoryType: integer;
    Id_PersonEducationHistoryOrderStatus: Integer;
    Id_AcademicYear: Integer;
    Filter: AnsiString;
    MemoryData_EDBO: TRxMemoryData;
    UseFilter: Boolean;
    i: Integer;
    PubSysDataDSet: TpFIBDataset;
begin
    Result := True;
    UseFilter := False;

    PubSysDataDSet := TpFIBDataset.Create(Self);
    PubSysDataDSet.Database := DM.DB;
    PubSysDataDSet.Transaction := DM.DefaultTransaction;

    if PubSysDataDSet.Active then PubSysDataDSet.Close;
    PubSysDataDSet.SQLs.SelectSQL.Text := 'Select Can_Connect_To_Edbo, University_Code_U, Id_Country_Edbo, Show_Foto From Pub_Sys_Data';
    PubSysDataDSet.Open;
    if PubSysDataDSet['Can_Connect_To_Edbo'] = null then CanConnectToEdbo := False
    else CanConnectToEdbo := Boolean(PubSysDataDSet['Can_Connect_To_Edbo']);

    if PubSysDataDSet['University_Code_U'] = null then University_Code_U := ''
    else University_Code_U := PubSysDataDSet['University_Code_U'];

    if PubSysDataDSet['Id_Country_Edbo'] = null then IdCountryEdbo := -1
    else IdCountryEdbo := PubSysDataDSet['Id_Country_Edbo'];

    if PubSysDataDSet['Show_Foto'] = null then CanWorkWithImage := 0
    else CanWorkWithImage := PubSysDataDSet['Show_Foto'];

    if UseFilter then
    begin
        //Result := False;
    end
    else
    begin

        EDBOPersonIntf.InParams.Items['UniversityKode'] := PAnsiString(@University_Code_U);

        Id_PersonEducationHistoryType := 0; //Тип приказа - пока 0
        EDBOPersonIntf.InParams.Items['Id_PersonEducationHistoryType'] := PInteger(@Id_PersonEducationHistoryType);

        Id_PersonEducationHistoryOrderStatus := 3; //Статус приказа  - пока 0
        EDBOPersonIntf.InParams.Items['Id_PersonEducationHistoryOrderStatus'] := PInteger(@Id_PersonEducationHistoryOrderStatus);

        Id_AcademicYear := 101; //Академический год  - кажется пока 101
        EDBOPersonIntf.InParams.Items['Id_AcademicYear'] := PInteger(@Id_AcademicYear);

        MemoryData_Edbo := TRxMemoryData.Create(Self);

        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryOrdersGet', MemoryData_EDBO);

        try
            MemoryData_EDBO.Open;
            MemoryData_EDBO.First;
        except on E: Exception do Showmessage(E.Message);
        end;
        DM.RxMem_EdboOrders.Close;
        DM.RxMem_EdboOrders.EmptyTable;
        DM.RxMem_EdboOrders.Open;
        if not MemoryData_EDBO.IsEmpty then
            for i := 0 to MemoryData_EDBO.RecordCount - 1 do
            begin
                try
                    DM.RxMem_EdboOrders.Insert;
                    DM.RxMem_EdboOrders.FieldByName('Id_PersonEducationHistoryOrders').AsInteger := MemoryData_EDBO['FId_PersonEducationHistoryOrders'];
                    if not VarIsNull(MemoryData_EDBO['FPersonEducationHistoryOrdersNumber']) then
                        DM.RxMem_EdboOrders.FieldByName('OrdersNumber').AsString := MemoryData_EDBO['FPersonEducationHistoryOrdersNumber'];
                    DM.RxMem_EdboOrders.FieldByName('OrdersDate').AsDateTime := MemoryData_EDBO['FPersonEducationHistoryOrdersDate'];
                    DM.RxMem_EdboOrders.FieldByName('OrdersDateLastChange').AsDateTime := MemoryData_EDBO['FPersonEducationHistoryOrdersDateLastChange'];

                    DM.RxMem_EdboOrders.FieldByName('Id_HistoryType').AsInteger := MemoryData_EDBO['FId_PersonEducationHistoryType'];

                    DM.RxMem_EdboOrders.FieldByName('TypeName').AsString := MemoryData_EDBO['FPersonEducationHistoryTypeName'];

                    DM.RxMem_EdboOrders.FieldByName('Id_OrderStatus').AsInteger := MemoryData_EDBO['FId_PersonEducationHistoryOrderStatus'];
                    DM.RxMem_EdboOrders.FieldByName('OrderStatusName').AsString := MemoryData_EDBO['FPersonEducationHistoryOrderStatusName'];
                    DM.RxMem_EdboOrders.FieldByName('IsVerified').AsInteger := MemoryData_EDBO['FIsVerified'];

                    DM.RxMem_EdboOrders.FieldByName('Id_VerificationHistoryType').AsInteger := MemoryData_EDBO['FId_RegulationDocumentVerificationHistoryType'];
                    DM.RxMem_EdboOrders.FieldByName('VerificationHistoryTypeName').AsString := MemoryData_EDBO['FRegulationDocumentVerificationHistoryTypeName'];
                    DM.RxMem_EdboOrders.FieldByName('StudCount').AsInteger := MemoryData_EDBO['FStudCount'];
                    DM.RxMem_EdboOrders.FieldByName('Is_SyncWithDB').AsBoolean := IsOrderImported(MemoryData_EDBO['FId_PersonEducationHistoryOrders'], MemoryData_EDBO['FPersonEducationHistoryOrdersDateLastChange']);
                    DM.RxMem_EdboOrders.Post;
                except on E: Exception do
                    begin
                        csMessageDlg(nMsgBoxTitle[IndLangVWF], E.Message, mtInformation, [mbOk], IndLangVWF);
                        exit;
                    end;
                end;
                MemoryData_EDBO.Next;
            end
        else csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgEmptyDataAfterFiltr[IndLangVWF], mtInformation, [mbOk], IndLangVWF);

        cxGridOrdersEDBODBTableView1.DataController.KeyFieldNames := '';
        DM.DSource_EdboOrders.DataSet := DM.RxMem_EdboOrders;
        MemoryData_EDBO.Close;
        MemoryData_EDBO.Free;
        PubSysDataDSet.Free;
    end;
end;

function TcsFormOrders.MyCsConnectToEdbo: Boolean;
var
    path_str: string;
begin
    try
        Result := True;
        with TFMASAppModuleCreator.Create do
        begin
            path_str := ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

       //Экземпляр для работы с веб-сервисом EDBOGuides
            EDBOGuidesIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOGuidesIntf = nil)
                then begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF] + #10#13 + nMsgToAdmin[IndLangVWF], mtInformation, [mbOk], IndLangVWF);
                Result := False;
            end;
       //Экземпляр для работы с веб-сервисом EDBOPerson
            EDBOPersonIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOPersonIntf = nil)
                then begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF] + #10#13 + nMsgToAdmin[IndLangVWF], mtInformation, [mbOk], IndLangVWF);
                Result := False;
            end;
        end;

    except on E: Exception do
        begin
            ShowMessage(E.Message);
            Result := False;
        end;
    end;
end;

procedure TcsFormOrders.dxBarLargeButton_RefreshClick(Sender: TObject);
begin
    if MyCsConnectToEdbo then
    begin
         //   ApplyFilter

        if DM.RxMem_EdboOrders.Active then
        begin
            DM.RxMem_EdboOrders.Close;
            DM.RxMem_EdboOrders.EmptyTable;
            DM.RxMem_EdboOrders.Open;
        end
        else
            DM.RxMem_EdboOrders.EmptyTable;
        ApplyFilter;
    end
    else
    begin
        csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF] + #10#13 + nMsgToAdmin[IndLangVWF], mtError, [mbOK], IndLangVWF);
        exit;
    end;
end;

function TcsFormOrders.GetPeopleFromOrder(Id_Cs_Order: Integer): Boolean;
var
    ActualDate: TDateTime;
    UniversityKode: AnsiString;
    PersonCodeU: AnsiString;
    Id_PersonEducation: integer;
    Id_PersonEducationHistoryOrderStatus: Integer;
    Id_AcademicYear: Integer;
    Filter: AnsiString;
    MemoryDataPeople_Edbo, MemoryDataHistoryEducation_Edbo: TRxMemoryData;
    UseFilter: Boolean;
    man_count, educ_history_count: Integer;
    Id_Order: Integer;
    StorProcDelEduc: TpFIBStoredProc;
    StorProcInfoInsert: TpFibStoredProc;
    StorProcOrderIns: TpFibStoredProc;
begin
    Result := True;
    try
        Id_Order := DM.RxMem_EdboOrders.FieldByName('Id_PersonEducationHistoryOrders').AsInteger; //Идентификатор  приказа

        EDBOPersonIntf.InParams.Items['Id_PersonEducationHistoryOrders'] := PInteger(@Id_Order);
        MemoryDataPeople_Edbo := TRxMemoryData.Create(Self);
        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryOrdersDataGet', MemoryDataPeople_Edbo);
        try
            MemoryDataPeople_Edbo.Open;
            MemoryDataPeople_Edbo.First;
        except on E: Exception do
            begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
                Result := False;
                exit;
            end;
        end;

        DM.WriteTransaction.StartTransaction;

        StorProcDelEduc := TpFIBStoredProc.Create(Self);
        StorProcDelEduc.Database := DM.DB;
        StorProcDelEduc.Transaction := DM.WriteTransaction;

        StorProcInfoInsert := TpFIBStoredProc.Create(Self);
        StorProcInfoInsert.Database := DM.DB;
        StorProcInfoInsert.Transaction := DM.WriteTransaction;
        PBForm.SetProgressBar(MemoryDataPeople_Edbo.RecordCount);
        if MemoryDataPeople_Edbo.RecordCount > 0 then
        begin
            for man_count := 0 to MemoryDataPeople_Edbo.RecordCount - 1 do
            begin
                PersonCodeU := MemoryDataPeople_Edbo['FPersonCodeU'];
                Id_PersonEducation := MemoryDataPeople_Edbo['FId_PersonEducation'];

                result := ExecSync(PersonCodeU);

                if result = False then
                begin
                    csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF], mtInformation, [mbOk], IndLangVWF);
                    DM.StorProc.Transaction.Rollback;
                    exit;
                end;

                StorProcDelEduc.StoredProcName := 'CS_DT_STUD_DEL_BY_ORDER_EDUC';
                StorProcDelEduc.Prepare;
                StorProcDelEduc.ParamByName('ID_PERSON_EDUCATION').AsInt64 := Id_PersonEducation;
                StorProcDelEduc.ParamByName('ID_ORDER_EDBO').AsInteger := Id_Order; //ид-р приказа из ЕДБО
                try
                    StorProcDelEduc.ExecProc;
                except on E: Exception do
                    begin
                        csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
                        DM.WriteTransaction.Rollback;
                        Result := False;
                    end;
                end;

                EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
                EDBOPersonIntf.InParams.Items['Id_PersonEducation'] := PInteger(@Id_PersonEducation);

                MemoryDataHistoryEducation_Edbo := TRxMemoryData.Create(Self);
                try
                    (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryGet', MemoryDataHistoryEducation_Edbo);
                    MemoryDataHistoryEducation_Edbo.Open;
                    MemoryDataHistoryEducation_Edbo.First;
                except on E: Exception do
                    begin
                        csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
                        Result := False;
                        exit;
                    end;
                end;

                for educ_history_count := 0 to MemoryDataHistoryEducation_Edbo.RecordCount - 1 do
                begin
                    if (MemoryDataHistoryEducation_Edbo['FId_PersonEducationHistoryOrders'] = Id_Order) then
                    begin
                        StorProcInfoInsert.StoredProcName := 'CS_DT_STUD_INFO_INSERT';
                        StorProcInfoInsert.Prepare;
                        StorProcInfoInsert.ParamByName('PERSON_CODE').AsString := MemoryDataHistoryEducation_Edbo['FPersonCodeU'];
                        StorProcInfoInsert.ParamByName('DATE_BEG').AsDateTime := MemoryDataHistoryEducation_Edbo['FPersonEducationHistoryDateBegin'];

                        if VarIsNull(MemoryDataHistoryEducation_Edbo['FPersonEducationHistoryDateEnd']) then
                            StorProcInfoInsert.ParamByName('DATE_END').AsDateTime := EncodeDate(9999, 12, 31)
                        else begin
                            if MemoryDataHistoryEducation_Edbo['FPersonEducationHistoryDateEnd'] < StrToDate('01.01.1900')
                                then
                                StorProcInfoInsert.ParamByName('DATE_END').AsDate := EncodeDate(9999, 12, 31)
                            else
                                StorProcInfoInsert.ParamByName('DATE_END').AsDateTime := MemoryDataHistoryEducation_Edbo['FPersonEducationHistoryDateEnd'];
                        end;

                        StorProcInfoInsert.ParamByName('ID_ORDER_EDBO').AsInteger := MemoryDataHistoryEducation_Edbo['FId_PersonEducationHistoryOrders'];
                        StorProcInfoInsert.ParamByName('ID_STUD_MOVING').AsInt64 := MemoryDataHistoryEducation_Edbo['FId_PersonEducationHistory'];
                        StorProcInfoInsert.ParamByName('ID_STUD_MOVING_OLD').AsInt64 := MemoryDataHistoryEducation_Edbo['FId_PersonEducationHistoryCorrected'];
                        StorProcInfoInsert.ParamByName('ID_PERSON_EDUCATION').AsInt64 := MemoryDataHistoryEducation_Edbo['FId_PersonEducation'];
                        StorProcInfoInsert.ParamByName('ID_PAYMENT_TYPE').AsInt64 := MemoryDataHistoryEducation_Edbo['FId_PersonEducationPaymentType'];
                        StorProcInfoInsert.ParamByName('ID_UNIVERSITY_GROUP').AsInt64 := MemoryDataHistoryEducation_Edbo['FId_UniversityGroup'];
                        StorProcInfoInsert.ParamByName('ID_COURSE').AsInteger := MemoryDataHistoryEducation_Edbo['FId_Course'];
                        StorProcInfoInsert.ParamByName('ID_EDUC_FORM').AsInteger := MemoryDataHistoryEducation_Edbo['FId_PersonEducationForm'];
                        StorProcInfoInsert.ParamByName('ID_FACULTET').AsString := MemoryDataHistoryEducation_Edbo['FUniversityFacultetKode'];
                        StorProcInfoInsert.ParamByName('ID_SPEC_CODE').AsString := MemoryDataHistoryEducation_Edbo['FSpecCode'];
                        StorProcInfoInsert.ParamByName('ID_QUALIFICATION').AsInteger := MemoryDataHistoryEducation_Edbo['FId_Qualification'];
                        StorProcInfoInsert.ParamByName('ID_ORDER').AsInteger := Id_Cs_Order;

                        try
                            StorProcInfoInsert.ExecProc;
                        except on E: Exception do
                            begin
                                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
                                Result := False;
                                StorProcInfoInsert.Transaction.Rollback;
                                exit;
                            end;
                        end;
                    end;
                    MemoryDataHistoryEducation_Edbo.Next;
                end;
                MemoryDataHistoryEducation_Edbo.Close;
                MemoryDataHistoryEducation_Edbo.Free;
                MemoryDataPeople_Edbo.Next;
                PBForm.ProgressBarExport.StepIt;
            end;
        end;

        if Result = True
            then DM.WriteTransaction.Commit
        else DM.WriteTransaction.Rollback;

    except on E: Exception do
        begin
            csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
            Result := False;
        end;
    end;

    MemoryDataPeople_Edbo.Close;
    MemoryDataPeople_Edbo.Free;
    StorProcDelEduc.Free;
    StorProcInfoInsert.Free;
end;

procedure TcsFormOrders.dxBarLargeButton_GetDataFromEDBOClick(
    Sender: TObject);
var
    id_order: integer;
begin
    if DM.RxMem_EdboOrders.IsEmpty then
    begin
        csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgEmptyOrdersEDBO[IndLangVWF], mtWarning, [mbOk], IndLangVWF);
        exit;
    end;
    if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DM.DB.Handle) then
    begin
        PBForm := TForm_cs_Orders_ProgressBar.Create(Self);
        PBForm.Show;
        PBForm.Label2.Caption := nMsgSaveOrderInfo[IndLangVWF];
        Id_Order := GetOrder;
        if //сначала добавлем приказ, потом людей, иначе не сможем человеку записать наш ид-р приказа
            (Id_Order <> 0) then
        begin
            GetPeopleFromOrder(Id_Order);
        end;
        if Assigned(PBForm) then PBForm.Free;
    end
    else csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF] + #10#13 + nMsgToAdmin[IndLangVWF], mtWarning, [mbOk], IndLangVWF);
end;

function TcsFormOrders.GetOrder: Integer;
{   функция возвращает наш идентификатор импортированного приказа;
    если импорт не прошел по каким-либо причинам, то возвращается 0   }
begin
    Result := 0;
    DM.StorProc.Transaction.StartTransaction;
    DM.StorProc.StoredProcName := 'CS_ORDER_FROM_EDBO_INS';
    DM.StorProc.Prepare;

    DM.StorProc.ParamByName('ID_ORDER_EDBO').AsInteger := DM.RxMem_EdboOrders.FieldByName('Id_PersonEducationHistoryOrders').AsInteger;
    if VarIsNull(DM.RxMem_EdboOrders.FieldByName('OrdersDateLastChange').AsVariant)
        then DM.StorProc.ParamByName('DATETIME_EDBO').AsVariant := null
    else begin
        if (DM.RxMem_EdboOrders.FieldByName('OrdersDateLastChange').AsDateTime < StrToDate('01.01.1900')) then
            DM.StorProc.ParamByName('DATETIME_EDBO').AsVariant := null
        else
            DM.StorProc.ParamByName('DATETIME_EDBO').AsDateTime := DM.RxMem_EdboOrders.FieldByName('OrdersDateLastChange').AsDateTime;
    end;
    DM.StorProc.ParamByName('ID_USER').AsInt64 := ID_User_Global;
    DM.StorProc.ParamByName('ID_ORDER_TYPE').AsInteger := DM.RxMem_EdboOrders.FieldByName('Id_HistoryType').AsInteger;
    DM.StorProc.ParamByName('NUM_ORDER').AsString := DM.RxMem_EdboOrders.FieldByName('OrdersNumber').AsString;
    DM.StorProc.ParamByName('DATE_ORDER').AsDateTime := DM.RxMem_EdboOrders.FieldByName('OrdersDate').AsDateTime;

    try
        DM.StorProc.ExecProc;
        Result := DM.StorProc.FieldByName('ID_ORDER').asInteger;
        DM.StorProc.Transaction.Commit;
        DM.RxMem_EdboOrders.Edit;
        DM.RxMem_EdboOrders.FieldByName('Is_SyncWithDB').AsBoolean := True;
        DM.RxMem_EdboOrders.Post;
    except on E: Exception do
        begin
            csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
            Result := 0;
            DM.StorProc.Transaction.Rollback;
            exit;
        end;
    end;
end;

function TcsFormOrders.ExecSync(PersonCode: AnsiString): Boolean;
var
    MemoryData_EDBO: TRxMemoryData;
    Inn, DocumentNumber, DocumentSeries, FIOMask: string;
    PersonDocument: Variant;
    FMiddleName, FPasportNumber, FPasportSeries, FPasportIssued: string;
begin
    ExecSync := True;
    PersonDocument := GetPersonDocument(PersonCode, 5);
    if (not VarIsNull(PersonDocument)) then Inn := PersonDocument[1]
    else Inn := '';

    MemoryData_EDBO := TRxMemoryData.Create(Self);
    FIOMask := '';
    EDBOPersonIntf.InParams.Items['FIOMask'] := PAnsiString(@FIOMask);
    DocumentSeries := '';
    EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);
    DocumentNumber := '';
    EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);
    EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCode);

    (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind', MemoryData_EDBO);

    MemoryData_EDBO.Open;
    if (MemoryData_EDBO.RecordCount > 0) then
    begin

        if VarIsNull(MemoryData_EDBO['FMiddleName']) then FMiddleName := ''
        else FMiddleName := MemoryData_EDBO['FMiddleName'];
        if VarIsNull(MemoryData_EDBO['FPasportNumber']) then FPasportNumber := ''
        else FPasportNumber := MemoryData_EDBO['FPasportNumber'];
        if VarIsNull(MemoryData_EDBO['FPasportSeries']) then FPasportSeries := ''
        else FPasportSeries := MemoryData_EDBO['FPasportSeries'];
        if VarIsNull(MemoryData_EDBO['FPasportIssued']) then FPasportIssued := ''
        else FPasportIssued := MemoryData_EDBO['FPasportIssued'];

        PBForm.Label2.Caption := VarToStr(MemoryData_EDBO['FLastName']) + ' ' + VarToStr(MemoryData_EDBO['FFirstName']) + ' ' + FMiddleName;

        result := SyncDataWithEdbo(MemoryData_EDBO['FId_Person'], MemoryData_EDBO['FLastName'], MemoryData_EDBO['FFirstName'],
            FMiddleName, PersonCode, FPasportNumber, FPasportSeries, MemoryData_EDBO['FPasportDate'], FPasportIssued,
            MemoryData_EDBO['FId_PersonSex'], MemoryData_EDBO['FBirthday'], Inn, MemoryData_EDBO['FResident']);
    end;
    MemoryData_EDBO.Close;
    MemoryData_EDBO.Free;
end;

function TcsFormOrders.SyncDataWithEdbo(IdPerson: Integer; Familiya, Imya, Otchestvo, PersonCodeU, NumberPass, SeriaPass: string;
    DateBegPass: TDate; PassVidan: string; IdSex: Integer; BirthDate: TDate; Inn: string; IsResident: Integer): Boolean;
var
    str: string;
    DateBeg: TDate;
    WaitForm: TForm;
    MemoryD_EDBO: TRxMemoryData;
    i, IdStreetType: Integer;
    KoatuuKod, Adress, HomeNumber, PostIndex: string;
    PersonCode: AnsiString;
    Res: Variant;
    Id_Man: Integer;
begin
    Result := True;
    try
        Res := GetPersonAdresses(PersonCodeU);
        DM.SyncStorProc.Transaction := DM.SyncTrans;
        DM.SyncStorProc.Transaction.StartTransaction;

        DM.SyncStorProc.StoredProcName := 'CN_WEB_PEOPLE_SYNC_WITH_EDBO';
        DM.SyncStorProc.Prepare;

        DM.SyncStorProc.ParamByName('Id_Person').AsInteger := IdPerson;
        DM.SyncStorProc.ParamByName('FAMILIYA').AsString := Familiya;
        DM.SyncStorProc.ParamByName('IMYA').AsString := Imya;
        DM.SyncStorProc.ParamByName('OTCHESTVO').AsString := Otchestvo;
        DM.SyncStorProc.ParamByName('PERSON_CODE_U').AsString := PersonCodeU;
        DM.SyncStorProc.ParamByName('NUMBER_PASS').AsString := NumberPass;
        DM.SyncStorProc.ParamByName('SERIA_PASS').AsString := SeriaPass;
        if (DateBegPass < StrToDate('01.01.1900')) then
            DM.SyncStorProc.ParamByName('DATE_BEG_PASS').Value := null
        else DM.SyncStorProc.ParamByName('DATE_BEG_PASS').AsDate := DateBegPass;
        DM.SyncStorProc.ParamByName('VIDAN').AsString := PassVidan;
        DM.SyncStorProc.ParamByName('BIRTH_DATE').AsDate := BirthDate;
        DM.SyncStorProc.ParamByName('ID_SEX').AsInteger := IdSex;
        DM.SyncStorProc.ParamByName('KOATUU_CODE').AsString := VarToStr(Res[0]);
        DM.SyncStorProc.ParamByName('ID_STREET_TYPE').AsInteger := Res[1];
        DM.SyncStorProc.ParamByName('ADRESS').AsString := VarToStr(Res[2]);
        DM.SyncStorProc.ParamByName('HOME_NUMBER').AsString := VarToStr(Res[3]);
        DM.SyncStorProc.ParamByName('POST_INDEX').AsString := VarToStr(Res[4]);
        if (length(Inn) = 10) then //10 cимволов ИНН
            DM.SyncStorProc.ParamByName('INN').AsString := Inn;
        DM.SyncStorProc.ParamByName('IS_RESIDENT').AsInteger := IsResident;
        DM.SyncStorProc.ParamByName('PHONE_NUMBER').AsString := '';
        DM.SyncStorProc.ExecProc;
        Id_Man := DM.SyncStorProc.FieldByName('ID_MAN').AsInteger;
        DM.SyncStorProc.Transaction.Commit;
        if CanWorkWithImage = 1 then
        begin
           { Showmessage('36');
            if PersonCodeU <> null and Id_Man <> null then
                SyncImageWithEdbo(Id_Man, PersonCodeU);
            Showmessage('37');  }
        end;
    except on E: Exception
        do begin
            ShowMessage(E.Message);
            DM.SyncStorProc.Transaction.Rollback;
            Result := False;
        end;
    end;
end;

function TcsFormOrders.SyncImageWithEdbo(IdMan: Integer; PersonCodeU: AnsiString): Boolean;
var
    UniversityKode: AnsiString;
    ms: TMemoryStream;
    rms: TMemoryStream;
    ImageMemoryData: TRxMemoryData;
    jpg: TJpegImage;
    IdFoto: Integer;
    ImageGet: TpFIBDataSet;
    ImageRTrans: TpFIBTransaction;
    pImageDB_Handle: TISC_DB_HANDLE;
begin
    pImageDB_Handle := GetImageDBHandle(DM.DB.Handle);
    begin
        if PersonCodeU <> '' then
        begin
            ImageMemoryData := TRxMemoryData.Create(Self);
            EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
            EDBOPersonIntf.InParams.Items['UniversityKode'] := PAnsiString(@University_Code_U);
            (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonPhotoGet', ImageMemoryData);
            if (ImageMemoryData.RecordCount > 0)
                then begin
               //Декодируем изображение в понятный нам формат
                ms := TMemoryStream.Create;
                rms := TMemoryStream.Create;

                ms.WriteBuffer(ImageMemoryData.FieldByName('FPersonPhotoBase64String').AsString[1],
                    Length(ImageMemoryData.FieldByName('FPersonPhotoBase64String').AsString) * SizeOf(Char));
                ms.Position := 0;
                DecodeStream(ms, rms);
                rms.Position := 0;
               //Загружаем изображение
                jpg := TJpegImage.Create;
                jpg.LoadFromStream(rms);
                rms.Position := 0;
                DM.ImageSyncDb.Handle := pImageDB_Handle;
                ImageGet := TpFIBDataSet.Create(Self);
                ImageRTrans := TpFIBTransaction.Create(Self);
                ImageRTrans.DefaultDatabase := DM.ImageSyncDb;
                ImageGet.Database := DM.ImageSyncDb;
                ImageGet.Transaction := ImageRTrans;
                ImageRTrans.StartTransaction;
                ImageGet.Close;
                ImageGet.SQLs.SelectSQL.Text := 'Select * From FOTO_GET_BY_ID_MAN(:Id_Man) Where Date_Foto = :Date_Foto';
                ImageGet.ParamByName('Id_Man').AsInteger := IdMan;
                ImageGet.ParamByName('Date_Foto').AsDate := StrToDate(DateToStr(ImageMemoryData.FieldByName('FPersonPhotoDateLastChange').AsDateTime));
                ImageGet.Open;
                ImageGet.FetchAll;
                if (ImageGet.RecordCount = 0) then
                begin
                    try
                        DM.ImageSyncWTrans.StartTransaction;
                        DM.ImageSyncProc.StoredProcName := 'FOTO_MAIN_I';
                        DM.ImageSyncProc.Prepare;
                        DM.ImageSyncProc.ParamByName('ID_MAN').AsInteger := IdMan;
                        DM.ImageSyncProc.ParamByName('FOTO_ICON').LoadFromStream(rms); // загружаем в BLOB-поле процедры из потока
                        DM.ImageSyncProc.ParamByName('FOTO').LoadFromStream(rms); // загружаем в BLOB-поле процедры из потока
                        DM.ImageSyncProc.ParamByName('ACTUALWIDTH').AsInteger := jpg.Width;
                        DM.ImageSyncProc.ParamByName('ACTUALHEIGHT').AsInteger := jpg.Height;
                        DM.ImageSyncProc.ParamByName('DATE_FOTO').AsDate := StrToDate(DateToStr(ImageMemoryData.FieldByName('FPersonPhotoDateLastChange').AsDateTime));
                        DM.ImageSyncProc.ExecProc;
                        IdFoto := DM.ImageSyncProc.FieldByName('ID_FOTO').AsInteger;
                        DM.ImageSyncWTrans.Commit;
                        DM.ImageSyncDb.Close;
                    except on E: Exception
                        do begin
                            ShowMessage(E.Message);
                            if DM.ImageSyncWTrans.Active then DM.ImageSyncWTrans.Rollback;
                            DM.ImageSyncDb.Close;
                            Result := False;
                        end;
                    end;

                    try
                        DM.SyncStorProc.Transaction := DM.SyncTrans;
                        DM.SyncStorProc.StoredProcName := 'UP_DT_CERT_MAN_FOTO_I_D';
                        DM.SyncStorProc.Transaction.StartTransaction;
                        DM.SyncStorProc.Prepare;
                        DM.SyncStorProc.ParamByName('ID_FOTO').AsInt64 := IdFoto;
                        DM.SyncStorProc.ParamByName('ID_MAN').AsInt64 := IdMan;
                        DM.SyncStorProc.ParamByName('DATE_BEG').AsDate := StrToDate(DateToStr(ImageMemoryData.FieldByName('FPersonPhotoDateLastChange').AsDateTime));
                        DM.SyncStorProc.ParamByName('IS_INSERT').AsInteger := 1;
                        DM.SyncStorProc.ExecProc;
                        DM.SyncStorProc.Transaction.Commit;
                    except on E: Exception
                        do begin
                            ShowMessage(E.Message);
                            DM.SyncStorProc.Transaction.Rollback;
                            Result := False;
                        end;
                    end;
                end;
               //Освобождаем ресурсы
                ms.free;
                rms.Free;
                jpg.free;
                ImageMemoryData.Free;
                if ImageRTrans.Active then ImageRTrans.Rollback;
                if ImageGet.Active then ImageGet.Close;
                ImageGet.Free;
            end;
        end;
    end;
end;

function TcsFormOrders.GetPersonAdresses(PersonCodeU: AnsiString): variant;
var
    MemoryData_Edbo: TRxMemoryData;
    i, j: Integer;
    str, str1: string;
begin
    try
    //Result := null;
        if IdCountryEdbo = -1 then Exit;
        MemoryData_Edbo := TRxMemoryData.Create(Self);

        EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonAddresses', MemoryData_Edbo);

        Result := VarArrayCreate([0, 4], varVariant);
        Result[0] := '';
        Result[1] := -1;
        Result[2] := '';
        Result[3] := '';
        Result[4] := '';
        if MemoryData_Edbo.RecordCount > 0 then
        begin
            for i := 0 to MemoryData_Edbo.RecordCount - 1 do
            begin
                if MemoryData_Edbo['FId_Country'] = IdCountryEdbo then
                begin
                    if not (VarIsNull(MemoryData_Edbo['FKOATUUCODE'])) then
                        Result[0] := MemoryData_Edbo['FKOATUUCODE'];

                    if not (VarIsNull(MemoryData_Edbo['FID_STREETTYPE'])) then
                        Result[1] := MemoryData_Edbo['FID_STREETTYPE'];

                    if not (VarIsNull(MemoryData_Edbo['FADRESS'])) then
                        Result[2] := MemoryData_Edbo['FADRESS'];

                    if not (VarIsNull(MemoryData_Edbo['FHOMENUMBER'])) then
                    begin
                        str1 := MemoryData_Edbo['FHOMENUMBER'];
                        str := Copy(str1, 1, 15); //ограничено длиной поля в таблице адресов
                        Result[3] := str;
                    end;

                    if not (VarIsNull(MemoryData_Edbo['FPOSTINDEX'])) then
                    begin
                        str1 := MemoryData_Edbo['FPOSTINDEX'];
                        str := trim(str1);
                        for j := 1 to length(str) do
                            if not (str[j] in ['0'..'9']) then
                            begin
                                str := '';
                                break;
                            end;
                        Result[4] := str;
                    end;
                end;
            end;
        end;
    except on E: Exception
        do begin
            ShowMessage(E.Message);
            Result := null;
        end;
    end;
end;

function TcsFormOrders.GetPersonDocument(PersonCodeU: AnsiString; NumDocument: Integer): Variant;
var
    MemoryData_Edbo: TRxMemoryData;
begin
    try
        Result := null;
        MemoryData_Edbo := TRxMemoryData.Create(Self);

        EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
        EDBOPersonIntf.InParams.Items['Id_PersonDocumentType'] := PInteger(@NumDocument);
        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonDocumentsGet', MemoryData_Edbo);

        if (MemoryData_Edbo.RecordCount > 0) then
        begin
            Result := VarArrayCreate([0, 3], varVariant);
            Result[0] := ''; //  Серия документа
            Result[1] := ''; //  Номер документа
            Result[2] := '00.00.0000'; //   Дата выдачи документа
            Result[3] := ''; // Кем выдано
            if MemoryData_Edbo['FDocumentSeries'] <> null then
                Result[0] := MemoryData_Edbo['FDocumentSeries'];
            if MemoryData_Edbo['FDocumentNumbers'] <> null then
                Result[1] := MemoryData_Edbo['FDocumentNumbers'];
            if MemoryData_Edbo['FDocumentDateGet'] <> null then
                Result[2] := MemoryData_Edbo['FDocumentDateGet'];
            if MemoryData_Edbo['FDocumentIssued'] <> null then
                Result[3] := MemoryData_Edbo['FDocumentIssued'];
            MemoryData_Edbo.Close;
            MemoryData_Edbo.Free;
        end;
    except on E: Exception
        do begin
            ShowMessage(E.Message);
            Result := null;
        end;
    end;
end;

procedure TcsFormOrders.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

function TcsFormOrders.IsOrderImported(IdCodeEdbo: Integer; TimeModify: TDateTime): Boolean;
var
    StorProcCheck: TpFIBStoredProc;
    Check: Integer;
begin
    //проверяем, был ли уже импортирован этот приказ
    Result := False;
    StorProcCheck := TpFIBStoredProc.Create(Self);
    StorProcCheck.Database := DM.DB;
    StorProcCheck.Transaction := DM.DefaultTransaction;

    StorProcCheck.Transaction.StartTransaction;
    StorProcCheck.StoredProcName := 'CS_CHECK_IMPORT_ORDER_EDBO';
    StorProcCheck.Prepare;

    StorProcCheck.ParamByName('ID_ORDER_EDBO').AsInteger := IdCodeEdbo;
    StorProcCheck.ParamByName('DATE_MODIFY').AsDateTime := TimeModify;

    try
        StorProcCheck.ExecProc;

        Check := StorProcCheck.FieldByName('IMPORT').AsInteger;
        Result := (Check = 1);
        StorProcCheck.Transaction.Commit;

    except
        on E: Exception do
        begin
            csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgError[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
            StorProcCheck.Transaction.Rollback;
        end;
    end;
    StorProcCheck.Free;
end;
end.

