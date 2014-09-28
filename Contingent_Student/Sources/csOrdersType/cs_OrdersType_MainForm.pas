unit cs_OrdersType_MainForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView, cs_OrdersType_DM,
    cxGridDBTableView, cxGrid, dxBar, dxBarExtItems, iBase,
    cxCheckBox, uCS_Constants, cxTextEdit, ImgList, AArray, ib_externals,
    AppStruClasses, RxMemDs, FIBDataset, pFIBDataset, uCS_Resources;

type
    TcsFormOrdersType = class(TForm)
        dxBarManager1: TdxBarManager;
        btnSelect: TdxBarLargeButton;
        cxGrid1: TcxGrid;
        TypesView: TcxGridDBTableView;
        col_IdType: TcxGridDBColumn;
        col_Name: TcxGridDBColumn;
        col_Shablon: TcxGridDBColumn;
        col_IdShablon: TcxGridDBColumn;
        col_IsActive: TcxGridDBColumn;
        col_IsLogical: TcxGridDBColumn;
        col_CanCancel: TcxGridDBColumn;
        col_IdTypeEdbo: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
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
        btnImport: TdxBarLargeButton;
        btnExit: TdxBarLargeButton;
        procedure btnSelectClick(Sender: TObject);
        procedure btnImportClick(Sender: TObject);
        procedure btnExitClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
        EDBOGuidesIntf: TFMASAppModule;
        EDBOPersonIntf: TFMASAppModule;
        ResultArray: TAArray;
        CanConnectToEdbo: Boolean;
        IdMode: Integer; // режимы подключени€ формы: 0 - обычный, 1 - выборка только наших типов, 2 - только типов едбо
        procedure InitCaptions;
        procedure InitStyles;
        procedure InitMode(IdMode: Integer); //настройка формы в соответствии с режимом
        function MyCsConnectToEdbo: Boolean;
    public
    { Public declarations }
        IndLangVWF: Integer;
        TextViewColorVWF: TColor;
        ID_User_Global: Int64;
        User_Name_Global: string;
        function GetOrdersTypeFromEdbo: Boolean; //отобрать из едбо всю информацию о приказах
        constructor Create(AOwner: TComponent; aParam: TAArray); reintroduce;

    end;

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray); stdcall;
exports ShowAllPrkBpl;

var
    csFormOrdersType: TcsFormOrdersType;
    DM: TDM;

implementation

{$R *.dfm}

procedure ShowAllPrkBpl(aOwner: TComponent; aParam: TAArray);
var
    T: TcsFormOrdersType;
begin
    T := TcsFormOrdersType.Create(aOwner, aParam);
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

constructor TcsFormOrdersType.Create(AOwner: TComponent; aParam: TAArray);
var
    DBHandle: TISC_DB_HANDLE;
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHandle := PVoid(aParam['Input']['aDBHANDLE'].asInteger);
        ResultArray := aParam;
        ID_User_Global := aParam['Input']['ID_USER_GLOBAL'].AsInt64;
        IndLangVWF := 0;
        if Assigned(aParam['Input']['ID_MODE']) then
            IdMode := aParam['Input']['ID_MODE'].AsInteger
        else IdMode := 0;
        inherited Create(aOwner);

        InitCaptions;

        WindowState := wsMaximized;

        DM := TDM.Create(self, DBHandle);
        //инициализаци€ режима должна происходить после создани€ DM формы,
        //т.к. при инициализации режима мы мен€ем селект датасета на ƒћ форме
        InitMode(IdMode);

        TypesView.DataController.DataSource := DM.DSOrdersType;
    end
    else ShowMessage('ќшибка HANDLE`a Ѕазы');
end;

procedure TcsFormOrdersType.InitCaptions;
begin
    csFormOrdersType.Caption := nOrdersType_MainForm_Caption[IndLangVWF];
    btnImport.Caption := nAction_GetOrderTypeFromEDBO[IndLangVWF];
    btnSelect.Caption := nAction_Vibrat[IndLangVWF];
    btnExit.Caption := nAction_Exit[IndLangVWF];
end;

procedure TcsFormOrdersType.InitStyles;
begin
end;

procedure TcsFormOrdersType.btnSelectClick(Sender: TObject);
begin
    ResultArray['OutPut']['ID_TYPE_EDBO'].AsInteger := DM.DSetOrdersType.fbn('NUMBER_FROM_EDBO').AsInteger;
    ResultArray['OutPut']['TYPE_NAME'].AsString := DM.DSetOrdersType.fbn('TYPE_NAME').AsString;
    Close;
end;

function TcsFormOrdersType.MyCsConnectToEdbo: Boolean;
var
    path_str: string;
begin
    try
        Result := True;
        with TFMASAppModuleCreator.Create do
        begin
            path_str := ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

       //Ёкземпл€р дл€ работы с веб-сервисом EDBOGuides
            EDBOGuidesIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOGuidesIntf = nil)
                then begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF], mtInformation, [mbOk], 0);
                Result := False;
            end;
       //Ёкземпл€р дл€ работы с веб-сервисом EDBOPerson
            EDBOPersonIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOPersonIntf = nil)
                then begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF], mtInformation, [mbOk], 0);
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

function TcsFormOrdersType.GetOrdersTypeFromEdbo: Boolean;
var
    ActualDate: TDateTime;
    Id_AcademicYear: Integer;
    Filter: AnsiString;
    MemoryData_EDBO: TRxMemoryData;
    i: Integer;
    PubSysDataDSet: TpFIBDataset;
begin
    Result := True;

    PubSysDataDSet := TpFIBDataset.Create(Self);
    PubSysDataDSet.Database := DM.DB;
    PubSysDataDSet.Transaction := DM.DefaultTransaction;

    if PubSysDataDSet.Active then PubSysDataDSet.Close;
    PubSysDataDSet.SQLs.SelectSQL.Text := 'Select Can_Connect_To_Edbo From Pub_Sys_Data';
    PubSysDataDSet.Open;
    if PubSysDataDSet['Can_Connect_To_Edbo'] = null then CanConnectToEdbo := False
    else CanConnectToEdbo := Boolean(PubSysDataDSet['Can_Connect_To_Edbo']);
    if CanConnectToEdbo then
    begin
        MemoryData_Edbo := TRxMemoryData.Create(Self);
        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationHistoryTypesGet', MemoryData_EDBO);
        try
            MemoryData_EDBO.Open;
            MemoryData_EDBO.First;
        except on E: Exception do Showmessage(E.Message);
        end;
        DM.RxMem_EdboOrdersType.Close;
        DM.RxMem_EdboOrdersType.EmptyTable;
        DM.RxMem_EdboOrdersType.Open;
        for i := 0 to MemoryData_EDBO.RecordCount - 1 do
        begin
            try
                DM.RxMem_EdboOrdersType.Insert;
                DM.RxMem_EdboOrdersType.FieldByName('fId_PersonEducationHistoryType ').AsInteger := MemoryData_EDBO['FId_PersonEducationHistoryType'];
                DM.RxMem_EdboOrdersType.FieldByName('fPersonEducationHistoryTypeName').AsString := MemoryData_EDBO['FPersonEducationHistoryTypeName'];

                DM.RxMem_EdboOrdersType.Post;
            except on E: Exception do
                begin
                    csMessageDlg(nMsgBoxTitle[IndLangVWF], E.Message, mtInformation, [mbOk], 0);
                    exit;
                end;
            end;
            MemoryData_EDBO.Next;
        end;

        result := False;
        DM.StorProc.Transaction.StartTransaction;
        DM.StorProc.StoredProcName := 'CS_GET_ORDER_TYPES_FROM_EDBO';
        DM.StorProc.Prepare;
        for i := 0 to DM.RxMem_EdboOrdersType.RecordCount - 1 do
        begin
            try
                DM.StorProc.ParamByName('NUMBER_FROM_EDBO').AsInteger := DM.RxMem_EdboOrdersType.FieldByName('fId_PersonEducationHistoryType ').AsInteger;
                DM.StorProc.ParamByName('TYPE_NAME').AsString := DM.RxMem_EdboOrdersType.FieldByName('fPersonEducationHistoryTypeName').AsString;

                DM.StorProc.ExecProc;
              {  DM.RxMem_EdboOrdersType.Insert;
                DM.RxMem_EdboOrdersType.FieldByName('fId_PersonEducationHistoryType ').AsInteger := MemoryData_EDBO['FId_PersonEducationHistoryType'];
                DM.RxMem_EdboOrdersType.FieldByName('fPersonEducationHistoryTypeName').AsString := MemoryData_EDBO['FPersonEducationHistoryTypeName'];

                DM.RxMem_EdboOrdersType.Post;
               }
            except on E: Exception do
                begin
                    csMessageDlg(nMsgBoxTitle[IndLangVWF], E.Message, mtInformation, [mbOk], 0);
                    DM.StorProc.Transaction.Rollback;
                    exit;
                end;
            end;
            DM.RxMem_EdboOrdersType.Next;
        end;

        try
       // DM.StorProc.ExecProc;
            DM.StorProc.Transaction.Commit;
            result := True;
        except on E: Exception do
            begin
                csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], 0);
                Result := False;
                DM.StorProc.Transaction.Rollback;
                exit;
            end;
        end;

        MemoryData_EDBO.Close;
        MemoryData_EDBO.Free;
        PubSysDataDSet.Free;
    end;
end;

procedure TcsFormOrdersType.btnImportClick(Sender: TObject);
begin
    if (csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgImportOrderTypes[IndLangVWF], mtInformation, [mbOK, mbCancel], 0) = mrOk)
        then begin
        if MyCsConnectToEdbo then
        begin
         //   ApplyFilter

            if DM.RxMem_EdboOrdersType.Active then
            begin
                DM.RxMem_EdboOrdersType.Close;
                DM.RxMem_EdboOrdersType.EmptyTable;
                DM.RxMem_EdboOrdersType.Open;
            end
            else
                DM.RxMem_EdboOrdersType.EmptyTable;
            if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DM.DB.Handle) then
            begin
                GetOrdersTypeFromEdbo;
                if DM.StorProc.Transaction.Active then
                    DM.StorProc.Transaction.Commit;

                DM.DSetOrdersType.Close;
                DM.DSetOrdersType.Open;
            end
            else csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF], mtWarning, [mbOk], 0);
        end
        else
        begin
            csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF], mtError, [mbOK], 0);
            exit;
        end;
    end;

end;

procedure TcsFormOrdersType.btnExitClick(Sender: TObject);
begin
    Close;
end;

procedure TcsFormOrdersType.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TcsFormOrdersType.InitMode(IdMode: Integer);
var
    SelectSql: string;
begin
    //настройка формы в соответствии с режимом
    // 0 - обычный, 1 - выбор только наших типов приказов, 2 - выбор только типов пркиазов едбо
    SelectSql := 'SELECT * FROM CS_DT_ORDER_TYPE';
    case IdMode of
        1: begin
                btnSelect.Visible := ivAlways;
                //IdMode = 1 в случае выбора типа приказов дл€ добавлени€ нового пункта
                //¬ этом случае используетс€ проверка на права
                SelectSql := 'Select * from CS_DT_ORDER_TYPE_SEL(' + IntToStr(ID_User_Global) + ')';
                col_IdTypeEdbo.Visible := False;
                col_Shablon.Visible := False;
                col_IdShablon.Visible := False;
                col_IsActive.Visible := False;
                col_IsLogical.Visible := False;
                col_CanCancel.Visible := False;
                //чтоб не было сообщений типа "поле не найдено" при хождении по гриду
                col_IdTypeEdbo.DataBinding.FieldName := '';
                col_Shablon.DataBinding.FieldName := '';
                col_IdShablon.DataBinding.FieldName := '';
                col_IsActive.DataBinding.FieldName := '';
                col_IsLogical.DataBinding.FieldName := '';
                col_CanCancel.DataBinding.FieldName := '';
            end;
        2: begin
                btnSelect.Visible := ivAlways;
                SelectSql := 'Select * from Cs_Dt_Order_Type_Edbo_Sel';
                col_Shablon.Visible := False;
                col_IdShablon.Visible := False;
                col_IsActive.Visible := False;
                col_IsLogical.Visible := False;
                col_CanCancel.Visible := False;
            end;
        // в случае неопознанного режима, работа будет така€ же как и в режиме 0,
        // поэтому объедин€ем эти случаи в вариант else
    else begin
            btnSelect.Visible := ivNever;
        end;
    end;
    DM.DSetOrdersType.Close;
    DM.DSetOrdersType.SQLs.SelectSQL.Text := SelectSql;
    DM.DSetOrdersType.Open;
   // DM.DSetOrdersType.FetchAll;
end;

end.

