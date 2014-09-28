unit SpPeople_MainForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet, IBase,
    SpPeople_z_dmCommonStyles, FIBDatabase, pFIBDatabase, cxContainer, cxTextEdit,
    ExtCtrls, SpPeople_Types, SpPeople_ModForm, cxSplitter, RxMemDS,
    cxLookAndFeelPainters, StdCtrls, cxButtons, FIBQuery, pFIBQuery,
    pFIBStoredProc, SpPeople_ZMessages, UAdvancedSearch, AccMGMT,
    Buttons, ToolWin, ComCtrls, ActnList, cxMemo, AllPeopleDataModule,
    SpPeople_CardFrame, SpPeople_SearchForm, uCommonSp, AppEvnts, AppStruClasses,
    jpeg, EncdDecd, OleServer, ExcelXP;

type
    TfSpPeople = class(TForm)
        PeopleGridDBTableView1: TcxGridDBTableView;
        PeopleGridLevel1: TcxGridLevel;
        PeopleGrid: TcxGrid;
        cmnTN: TcxGridDBColumn;
        cmnFIO: TcxGridDBColumn;
        DSetPeople: TpFIBDataSet;
        DSourcePeople: TDataSource;
        WriteTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        DB: TpFIBDatabase;
        SearchPanel: TPanel;
        SearchTE: TcxTextEdit;
        Timer1: TTimer;
        cmnID_MAN: TcxGridDBColumn;
        cmnTN_IS_DELETED: TcxGridDBColumn;
        SelectGrid: TcxGrid;
        SelectGridDBTableView1: TcxGridDBTableView;
        cmnID_MAN1: TcxGridDBColumn;
        cmnTN1: TcxGridDBColumn;
        cmnFIO1: TcxGridDBColumn;
        SelectGridLevel1: TcxGridLevel;
        cxSplitter1: TcxSplitter;
        MDSelected: TRxMemoryData;
        DSourceSelected: TDataSource;
        Label1: TLabel;
        SearchBtn: TcxButton;
        StProc: TpFIBStoredProc;
        StProcHist: TpFIBStoredProc;
        MainToolBar: TToolBar;
        AddBtn: TSpeedButton;
        EditBtn: TSpeedButton;
        ViewBtn: TSpeedButton;
        AdvSearchBtn: TSpeedButton;
        DeleteBtn: TSpeedButton;
        RefreshBtn: TSpeedButton;
        SelectBtn: TSpeedButton;
        ExitBtn: TSpeedButton;
        ActionList1: TActionList;
        RefreshAction: TAction;
        ExitAction: TAction;
        InfoMemo: TcxMemo;
        InfoPanel: TPanel;
        cmnTIN: TcxGridDBColumn;
        cmnBIRTH_DATE: TcxGridDBColumn;
        SelectAction: TAction;
        InsertAction: TAction;
        EditAction: TAction;
        ViewAction: TAction;
        MakeOldBtn: TSpeedButton;
        MakeOldAction: TAction;
        cmnIS_OLD: TcxGridDBColumn;
        DeleteAction: TAction;
        DSetDog: TpFIBDataSet;
        SpeedButton1: TSpeedButton;
        HstInfoAction: TAction;
        UnDeleteTnAction: TAction;
        UnDeleteTnBtn: TSpeedButton;
        DSetWorked: TpFIBDataSet;
        btnSyncWithEdbo: TSpeedButton;
        PubSysDataDSet: TpFIBDataSet;
        EdboPeopleDSet: TRxMemoryData;
        EdboPeopleDSetID_MAN: TIntegerField;
        EdboPeopleDSetFIO: TStringField;
        EdboPeopleDSetTN: TIntegerField;
        EdboPeopleDSetTN_IS_DELETED: TStringField;
        EdboPeopleDSetTIN: TStringField;
        EdboPeopleDSetBIRTH_DATE: TDateField;
        EdboPeopleDSetIS_OLD: TIntegerField;
        EdboPeopleDSetID_PERSON: TIntegerField;
        EdboPeopleDSetID_SEX: TIntegerField;
        EdboPeopleDSetSERIA_PASS: TStringField;
        EdboPeopleDSetNUMBER_PASS: TStringField;
        EdboPeopleDSetVidan: TStringField;
        EdboPeopleDSetDATE_BEG_PASS: TDateField;
        SyncStorProc: TpFIBStoredProc;
        EdboPeopleDSetFAMILIYA: TStringField;
        EdboPeopleDSetIMYA: TStringField;
        EdboPeopleDSetOTCHESTVO: TStringField;
        ImageSyncDb: TpFIBDatabase;
        ImageSyncWTrans: TpFIBTransaction;
        ImageSyncProc: TpFIBStoredProc;
        EdboPeopleDSetPERSON_CODE_U: TStringField;
        EdboPeopleDSetIsResident: TIntegerField;
        ResyncEDBO: TSpeedButton;
        ResyncAllDataEDBO: TAction;
        ResyncKodEdbo: TAction;
        StorProcReserve: TpFIBStoredProc;
        SaveDialog1: TSaveDialog;
        procedure RefreshBtnClick(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
        procedure ExitBtnClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure ViewBtnClick(Sender: TObject);
        procedure PeopleGridDBTableView1CustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
        procedure AddBtnClick(Sender: TObject);
        procedure EditBtnClick(Sender: TObject);
        procedure SelectBtnClick(Sender: TObject);
        procedure PeopleGridDBTableView1DblClick(Sender: TObject);
        procedure SearchTEKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PeopleGridDBTableView1KeyPress(Sender: TObject;
            var Key: Char);
        procedure SelectGridDBTableView1DblClick(Sender: TObject);
        procedure SearchBtnClick(Sender: TObject);
        procedure AdvSearchBtnClick(Sender: TObject);
        procedure WriteTransactionAfterStart(Sender: TObject);
        procedure PeopleGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cmnTNCustomDrawCell(Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            var ADone: Boolean);
        procedure cmnTINGetDisplayText(Sender: TcxCustomGridTableItem;
            ARecord: TcxCustomGridRecord; var AText: string);
        procedure MakeOldActionExecute(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
        procedure HstInfoActionExecute(Sender: TObject);
        procedure UnDeleteTnActionExecute(Sender: TObject);
        procedure btnSyncWithEdboClick(Sender: TObject);
        procedure ResyncAllDataEDBOExecute(Sender: TObject);
        procedure ResyncKodEdboExecute(Sender: TObject);
        procedure ShowExportDialog(Sender: TObject);
    private
        { Private declarations }
        EDBOGuidesIntf: TFMASAppModule;
        EDBOPersonIntf: TFMASAppModule;
        pStylesDM: TStylesDM;
        pMultiSelect: Boolean;
        pForSelect: Boolean;
        SELECT_PROCEDURE: string;
        University_Code_U: AnsiString;
        IdCountryEdbo: Integer;

        pImageDB_Handle: TISC_DB_HANDLE;
        function FilterIsAText: Boolean;
        function GetNewFilter(FIO: string): string; // Получает новый фильтр после редактирования физ. лица, содержащий его фамилию
        function LocateManByID(AID_MAN: Integer): Boolean;
        function StringForSearch(AText: string): string; // Осуществл. обработку строк с апострофами и, возможно, что-нибудь еще.
        function FormDogData(AID_MAN: Integer; ATIN: string; AFIO: string): Variant;
        function FormWorkData(AID_MAN: Integer; Date_Beg: TDate; Date_End: TDate): Variant;
        function GetNullDogData: Variant;
        function GetDogDataFromDataSet: Variant;
        procedure SelectBtnClickProcedure(Sender: TObject);
        procedure ShowNoRights(Sender: TObject);
        procedure ShowAccessDenied(Sender: TObject);
        function CheckAccess(Sender: TObject): Boolean;
        function GetPeoplesFromEdbo: Boolean;
        function SyncDataWithEdbo(IdPerson: Integer; Familiya, Imya, Otchestvo, PersonCodeU, NumberPass, SeriaPass: string;
            DateBegPass: TDate; PassVidan: string; IdSex: Integer; BirthDate: TDate; Inn: string; IsResident: Integer; ModeUse: Integer): Integer;
        function SyncImageWithEdbo(IdMan: Integer; PersonCodeU: AnsiString): Boolean;
        function InitConnectToEdbo: Boolean;
        function IsPersonStudent(IdPerson: Integer; PersonCodeU: AnsiString): Byte;
        function GetPersonAdresses(PersonCodeU: AnsiString): variant;
        function GetPersonDocument(PersonCodeU: AnsiString; NumDocument: Integer): Variant;
        function GetPersonContacts(PersonCodeU: AnsiString): string;
    public
        { Public declarations }
        pSelectWithDog: Boolean; // Возвращать также сведения о договоре
        pSelectWorked: Boolean; // Возвращать информацию о работе сотрудника в указанном периоде
        pDate_Beg: TDate; //дата начала периода, имеет смысл только если pSelectWorked = True
        PDate_End: TDate; //дата конца периода, имеет смысл только если pSelectWorked = True
        ResultArray: Variant;
        CanConnectToEdbo: Boolean;
        IsAutoSyncWithEdbo: Boolean;
        CanWorkWithImage: Integer; //вынесено в паблик, потому что при вызове из контрактов принудительно выставляется в 0
        Id_Man: Integer;
        CompareBirthDate: Integer;
        pSyncKodPersonEdbo: Integer;
        constructor Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; CanEdit, ForSelect, MultiSelect: Boolean; ASelProcName: string; AID_MAN:
            Integer = -1; AutoSyncWithEdbo: Boolean = False); reintroduce;
        destructor Destroy; reintroduce;
    end;

implementation

uses DateUtils, SpPeople_WaitForm, SpPeople_AccessUnit;

{$R *.dfm}

const
    StartingSearch = 'А';
const
    SqlCondition =
        'SELECT FAMILIA,IMYA,OTCHESTVO,RUS_FAMILIA,RUS_IMYA,RUS_OTCHESTVO,(CASE WHEN TN_IS_DELETED IS NULL OR TN_IS_DELETED = ''F'' THEN TN ELSE TN_MAX END) AS TN,ID_MAN,FIO,ID_SEX,BIRTH_DATE,TIN,TN_IS_DELETED,IS_OLD, ID_PERSON_EDBO, PERSON_CODE_U_EDBO FROM ';

function TfSpPeople.GetPersonDocument(PersonCodeU: AnsiString; NumDocument: Integer): Variant;
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

            if not (VarIsNull(MemoryData_Edbo['FDocumentSeries'])) then
                Result[0] := MemoryData_Edbo['FDocumentSeries'];
            if not (VarIsNull(MemoryData_Edbo['FDocumentNumbers'])) then
                Result[1] := MemoryData_Edbo['FDocumentNumbers'];
            if not (VarIsNull(MemoryData_Edbo['FDocumentDateGet'])) then
                Result[2] := MemoryData_Edbo['FDocumentDateGet'];
            if not (VarIsNull(MemoryData_Edbo['FDocumentIssued'])) then
                Result[3] := MemoryData_Edbo['FDocumentIssued'];
            MemoryData_Edbo.Close;
            MemoryData_Edbo.Free;
        end;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            Result := null;
        end;
    end;
end;

function TfSpPeople.IsPersonStudent(IdPerson: Integer; PersonCodeU: AnsiString): Byte;
var
    MemoryData_Edbo: TRxMemoryData;
    filter: AnsiString;
begin
    {
     Result = 0 - физ. лицо не является студентом или абитуриентом
     Result = 1 - физ. лицо - абитуриент
     Result = 2 - физ. лицо - студент
    }

    Result := 1;
    {MemoryData_Edbo := TRxMemoryData.Create(Self);
    EDBOPersonIntf.InParams.Items['PersonCodeU']:=PAnsiString(@PersonCodeU);
    EDBOPersonIntf.InParams.Items['UniversityFacultetKode']:=PAnsiString(@University_Code_U);
    (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('UniversityFacultetsGetRequests', MemoryData_Edbo);

    if MemoryData_Edbo.RecordCount > 0 then Result := 1
    else
    begin
       MemoryData_Edbo.Close;
       EDBOPersonIntf.InParams.Items['PersonCodeU']:=PAnsiString(@PersonCodeU);
       EDBOPersonIntf.InParams.Items['UniversityFacultetKode']:=PAnsiString(@University_Code_U);
       filter := '~2#'+IntToStr(IdPerson);
       ShowMessage(filter);
       EDBOPersonIntf.InParams.Items['Filters']:=PAnsiString(@filter);
       (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsStudentsGrupsPersonsFind', MemoryData_Edbo);
       if MemoryData_Edbo.RecordCount > 0 then Result := 2;
    end;     }
end;

function TfSpPeople.InitConnectToEdbo: Boolean;
var
    path_str: string;
begin
    try
        with TFMASAppModuleCreator.Create do
        begin
            path_str := ExtractFilePath(Application.ExeName) + 'Contingent_Student\';

            //Экземпляр для работы с веб-сервисом EDBOGuides
            EDBOGuidesIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOGuidesIntf = nil) then
                MessageBox(self.Handle, 'Помилка при роботі з модулем взаємодії з ЄДБО', 'Увага!', MB_OK or MB_ICONWARNING);

            //Экземпляр для работы с веб-сервисом EDBOPerson
            EDBOPersonIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOPersonIntf = nil) then
                MessageBox(self.Handle, 'Помилка при роботі з модулем взаємодії з ЄДБО', 'Увага!', MB_OK or MB_ICONWARNING);
        end;
        Result := True;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            Result := False;
        end;
    end;
end;

function TfSpPeople.SyncImageWithEdbo(IdMan: Integer; PersonCodeU: AnsiString): Boolean;
var
    UniversityKode: AnsiString;
    ms: TMemoryStream;
    rms: TMemoryStream;
    ImageMemoryData: TRxMemoryData;
    jpg: TJpegImage;
    IdFoto: Integer;
    ImageGet: TpFIBDataSet;
    ImageRTrans: TpFIBTransaction;
begin
    if Assigned(pImageDB_Handle) then
    begin

        //if not EdboPeopleDSet.IsEmpty then
        begin
            if PersonCodeU <> '' then
            begin
                ImageMemoryData := TRxMemoryData.Create(Self);
                EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
                EDBOPersonIntf.InParams.Items['UniversityKode'] := PAnsiString(@University_Code_U);

                (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonPhotoGet', ImageMemoryData);

                if (ImageMemoryData.RecordCount > 0) then
                begin
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

                    ImageSyncDb.Handle := pImageDB_Handle;
                    ImageGet := TpFIBDataSet.Create(Self);
                    ImageRTrans := TpFIBTransaction.Create(Self);
                    ImageRTrans.DefaultDatabase := ImageSyncDb;
                    ImageGet.Database := ImageSyncDb;
                    ImageGet.Transaction := ImageRTrans;
                    ImageRTrans.StartTransaction;
                    ImageGet.Close;
                    ImageGet.SQLs.SelectSQL.Text := 'Select * From FOTO_GET_BY_ID_MAN(:Id_Man) Where Date_Foto = :Date_Foto';
                    ImageGet.ParamByName('Id_Man').AsInteger := IdMan;
                    ImageGet.ParamByName('Date_Foto').AsDate :=
                        StrToDate(DateToStr(ImageMemoryData.FieldByName('FPersonPhotoDateLastChange').AsDateTime));
                    ImageGet.Open;
                    ImageGet.FetchAll;
                    if (ImageGet.RecordCount = 0) then
                    begin
                        try
                            ImageSyncWTrans.StartTransaction;
                            ImageSyncProc.StoredProcName := 'FOTO_MAIN_I';
                            ImageSyncProc.Prepare;
                            ImageSyncProc.ParamByName('ID_MAN').AsInteger := IdMan;
                            ImageSyncProc.ParamByName('FOTO_ICON').LoadFromStream(rms); // загружаем в BLOB-поле процедры из потока
                            ImageSyncProc.ParamByName('FOTO').LoadFromStream(rms); // загружаем в BLOB-поле процедры из потока
                            ImageSyncProc.ParamByName('ACTUALWIDTH').AsInteger := jpg.Width;
                            ImageSyncProc.ParamByName('ACTUALHEIGHT').AsInteger := jpg.Height;
                            ImageSyncProc.ParamByName('DATE_FOTO').AsDate :=
                                StrToDate(DateToStr(ImageMemoryData.FieldByName('FPersonPhotoDateLastChange').AsDateTime));
                            ImageSyncProc.ExecProc;
                            IdFoto := ImageSyncProc.FieldByName('ID_FOTO').AsInteger;
                            ImageSyncWTrans.Commit;
                            ImageSyncDb.Close;
                        except on E: Exception do
                            begin
                                ShowMessage(E.Message);
                                if ImageSyncWTrans.Active then
                                    ImageSyncWTrans.Rollback;
                                ImageSyncDb.Close;
                                Result := False;
                            end;
                        end;

                        try
                            SyncStorProc.StoredProcName := 'UP_DT_CERT_MAN_FOTO_I_D';
                            SyncStorProc.Transaction.StartTransaction;
                            SyncStorProc.Prepare;
                            SyncStorProc.ParamByName('ID_FOTO').AsInt64 := IdFoto;
                            SyncStorProc.ParamByName('ID_MAN').AsInt64 := IdMan;
                            SyncStorProc.ParamByName('DATE_BEG').AsDate :=
                                StrToDate(DateToStr(ImageMemoryData.FieldByName('FPersonPhotoDateLastChange').AsDateTime));
                            SyncStorProc.ParamByName('IS_INSERT').AsInteger := 1;
                            SyncStorProc.ExecProc;
                            SyncStorProc.Transaction.Commit;
                        except on E: Exception do
                            begin
                                ShowMessage(E.Message);
                                SyncStorProc.Transaction.Rollback;
                                Result := False;
                            end;
                        end;
                    end;
                    //Освобождаем ресурсы
                    ms.free;
                    rms.Free;
                    jpg.free;
                    ImageMemoryData.Free;
                    if ImageRTrans.Active then
                        ImageRTrans.Rollback;
                    if ImageGet.Active then
                        ImageGet.Close;
                    ImageGet.Free;
                    { if ImageSyncWTrans.Active then ImageSyncWTrans.Rollback;
                     ImageSyncDb.Close;            }
                end;
            end;
        end;
    end;
end;

function TfSpPeople.GetPersonAdresses(PersonCodeU: AnsiString): variant;
var
    MemoryData_Edbo: TRxMemoryData;
    i, j: Integer;
    str, str1: string;
begin
    try
        //Result := null;
        if IdCountryEdbo = -1 then
        begin
            result := null;
            Exit;
        end;
        MemoryData_Edbo := TRxMemoryData.Create(Self);
        EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonAddresses', MemoryData_Edbo);
        Result := VarArrayCreate([0, 6], varVariant);
        Result[0] := '';
        Result[1] := -1;
        Result[2] := '';
        Result[3] := '';
        Result[4] := '';
        Result[5] := -1;
        Result[6] := '';
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
                        str := MemoryData_Edbo['FHOMENUMBER'];
                        if length(str) > 15 then
                            str1 := Copy(str, 1, 15) //поле "номер дома" в адресах типа варчар15
                        else
                            str1 := str;
                        Result[3] := str1;
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

                //Эта информация передается для гражданства,
                //тем более в случае, если страна проживания не Украина
                if not (VarIsNull(MemoryData_Edbo['FID_COUNTRY'])) then
                    Result[5] := MemoryData_Edbo['FID_COUNTRY'];

                if not (VarIsNull(MemoryData_EDBO['FCOUNTRYNAME'])) then
                    Result[6] := MemoryData_EDBO['FCOUNTRYNAME'];
            end;
        end;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            Result := null;
        end;
    end;
end;

function TfSpPeople.SyncDataWithEdbo(IdPerson: Integer; Familiya, Imya, Otchestvo, PersonCodeU, NumberPass, SeriaPass: string;
    DateBegPass: TDate; PassVidan: string; IdSex: Integer; BirthDate: TDate; Inn: string; IsResident: Integer; ModeUse: Integer): Integer;
var
    str: string;
    DateBeg: TDate;
    WaitForm: TForm;
    MemoryD_EDBO: TRxMemoryData;
    i, IdStreetType: Integer;
    KoatuuKod, Adress, HomeNumber, PostIndex: string;
    PersonCode: AnsiString;
    Res: Variant;
    PhoneNumber: string;
    Id_Adress: Integer;
begin
    // ModeUse определяет режим синхронизации
    // ModeUse = 0 - из контрактов
    // ModeUse = 1 - синхронизация физлиц из других систем
    Result := -1;
    WaitForm := ShowWaitForm(Self);
    try
        Res := GetPersonAdresses(PersonCodeU);
        PhoneNumber := '';
        if ModeUse = 0 then
            PhoneNumber := GetPersonContacts(PersonCodeU);

        SyncStorProc.StoredProcName := 'CN_WEB_PEOPLE_SYNC_WITH_EDBO';
        SyncStorProc.Transaction.StartTransaction;
        SyncStorProc.Prepare;
        SyncStorProc.ParamByName('Id_Person').AsInteger := IdPerson;

        SyncStorProc.ParamByName('FAMILIYA').AsString := Familiya;

        SyncStorProc.ParamByName('IMYA').AsString := Imya;

        SyncStorProc.ParamByName('OTCHESTVO').AsString := Otchestvo;

        SyncStorProc.ParamByName('PERSON_CODE_U').AsString := PersonCodeU;

        SyncStorProc.ParamByName('NUMBER_PASS').AsString := NumberPass;

        SyncStorProc.ParamByName('SERIA_PASS').AsString := SeriaPass;
        if (DateBegPass < StrToDate('01.01.1900')) then
            SyncStorProc.ParamByName('DATE_BEG_PASS').Value := null
        else
            SyncStorProc.ParamByName('DATE_BEG_PASS').AsDate := DateBegPass;

        SyncStorProc.ParamByName('VIDAN').AsString := PassVidan;

        SyncStorProc.ParamByName('BIRTH_DATE').AsDate := BirthDate;

        SyncStorProc.ParamByName('ID_SEX').AsInteger := IdSex;

        SyncStorProc.ParamByName('KOATUU_CODE').AsString := VarToStr(Res[0]);

        SyncStorProc.ParamByName('ID_STREET_TYPE').AsInteger := Res[1];

        SyncStorProc.ParamByName('ADRESS').AsString := VarToStr(Res[2]);

        SyncStorProc.ParamByName('HOME_NUMBER').AsString := VarToStr(Res[3]);

        SyncStorProc.ParamByName('POST_INDEX').AsString := VarToStr(Res[4]);

        if length(inn) = 10 then
            SyncStorProc.ParamByName('INN').AsString := Inn;

        SyncStorProc.ParamByName('IS_RESIDENT').AsInteger := IsResident;

        SyncStorProc.ParamByName('PHONE_NUMBER').AsString := PhoneNumber;

        SyncStorProc.ParamByName('ID_COUNTRY_EDBO').AsInteger := Res[5];

        SyncStorProc.ParamByName('NAME_COUNTRY').AsString := VarToStr(Res[6]);

        SyncStorProc.ExecProc;
        Id_Man := SyncStorProc.FieldByName('ID_MAN').AsInteger;
        Id_Adress := SyncStorProc.FieldByName('ID_ADRESS').AsInteger;

        if (Id_Adress = -1) then
            ShowMessage('Не вдалося синхронізувати адресу фіз.особи. Перевірте коректність введеної адреси в ЄДБО!');

        Result := SyncStorProc.FieldByName('ID_MAN').AsInteger;
        SyncStorProc.Transaction.Commit;
        if CanWorkWithImage = 1 then
        begin
            if PersonCodeU <> null and Id_Man <> null then
                SyncImageWithEdbo(Id_Man, PersonCodeU);
        end;
        CloseWaitForm(WaitForm);
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            CloseWaitForm(WaitForm);
            SyncStorProc.Transaction.Rollback;
            Result := -1;
        end;
    end;
end;

function TfSpPeople.GetPeoplesFromEdbo: Boolean;
var
    FIOMask: AnsiString;
    DocumentSeries: AnsiString;
    DocumentNumber: AnsiString;
    PersonCodeU: AnsiString;
    i: Integer;
    MemoryData_EDBO: TRxMemoryData;
    PersonDocument: Variant;
begin
    Result := True;
    if SearchTE.Text = '' then
    begin
        Result := False;
    end
    else
    begin
        FIOMask := SearchTE.Text;
        EDBOPersonIntf.InParams.Items['FIOMask'] := PAnsiString(@FIOMask);

        DocumentSeries := '';
        EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);

        DocumentNumber := '';
        EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);

        PersonCodeU := '';
        EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
        MemoryData_Edbo := TRxMemoryData.Create(Self);
        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind', MemoryData_EDBO);
        MemoryData_EDBO.Open;
        MemoryData_EDBO.First;
        EdboPeopleDSet.Close;
        EdboPeopleDSet.Open;
        //EdboPeopleDSet.EmptyTable;
        for i := 0 to MemoryData_EDBO.RecordCount - 1 do
        begin
            if IsPersonStudent(MemoryData_EDBO['FId_Person'], MemoryData_EDBO['FPersonCodeU']) <> 0 then
            begin
                EdboPeopleDSet.Insert;
                EdboPeopleDSet.FieldByName('ID_PERSON').AsInteger := MemoryData_EDBO['FId_Person'];
                EdboPeopleDSet.FieldByName('PERSON_CODE_U').AsString := MemoryData_EDBO['FPersonCodeU'];
                EdboPeopleDSet.FieldByName('FIO').AsString := MemoryData_EDBO['FFIO'];

                if not (VarIsNull(MemoryData_EDBO['FLastName'])) then
                    EdboPeopleDSet.FieldByName('FAMILIYA').AsString := MemoryData_EDBO['FLastName']
                else
                    EdboPeopleDSet.FieldByName('FAMILIYA').AsString := '';

                if not (VarIsNull(MemoryData_EDBO['FFirstName'])) then
                    EdboPeopleDSet.FieldByName('IMYA').AsString := MemoryData_EDBO['FFirstName']
                else
                    EdboPeopleDSet.FieldByName('IMYA').AsString := '';

                if not (VarIsNull(MemoryData_EDBO['FMiddleName'])) then
                    EdboPeopleDSet.FieldByName('OTCHESTVO').AsString := MemoryData_EDBO['FMiddleName']
                else
                    EdboPeopleDSet.FieldByName('OTCHESTVO').AsString := '';

                EdboPeopleDSet.FieldByName('TN').AsInteger := -1;
                EdboPeopleDSet.FieldByName('TN_IS_DELETED').AsString := 'F';
                PersonDocument := GetPersonDocument(MemoryData_EDBO['FPersonCodeU'], 5);

                if (not VarIsNull(PersonDocument)) then
                    EdboPeopleDSet.FieldByName('TIN').AsString := PersonDocument[1]
                else
                    EdboPeopleDSet.FieldByName('TIN').AsString := '';

                EdboPeopleDSet.FieldByName('BIRTH_DATE').AsDateTime := StrToDate(DateToStr(MemoryData_EDBO['FBirthDay']));
                EdboPeopleDSet.FieldByName('IS_OLD').AsInteger := 0;
                EdboPeopleDSet.FieldByName('ID_MAN').AsInteger := -1;
                EdboPeopleDSet.FieldByName('ID_SEX').AsInteger := MemoryData_EDBO['FID_PERSONSEX'];

                if not (VarIsNull(MemoryData_EDBO['FPASPORTSERIES'])) then
                    EdboPeopleDSet.FieldByName('SERIA_PASS').AsString := MemoryData_EDBO['FPASPORTSERIES'];

                if not (VarIsNull(MemoryData_EDBO['FPASPORTNUMBER'])) then
                    EdboPeopleDSet.FieldByName('NUMBER_PASS').AsString := MemoryData_EDBO['FPASPORTNUMBER'];

                if not (VarIsNull(MemoryData_EDBO['FPasportDate'])) then
                    EdboPeopleDSet.FieldByName('DATE_BEG_PASS').AsDateTime := StrToDate(DateToStr(MemoryData_EDBO['FPasportDate']));

                if not (VarIsNull(MemoryData_EDBO['FPASPORTISSUED'])) then
                    EdboPeopleDSet.FieldByName('VIDAN').AsString := MemoryData_EDBO['FPASPORTISSUED'];
                EdboPeopleDSet.FieldByName('ISRESIDENT').AsInteger := MemoryData_EDBO['FRESIDENT'];
                EdboPeopleDSet.Post;
            end;
            MemoryData_EDBO.Next;
        end;
        PeopleGridDBTableView1.DataController.KeyFieldNames := '';
        DSourcePeople.DataSet := EdboPeopleDSet;
        MemoryData_EDBO.Close;
        MemoryData_EDBO.Free;
    end;
end;

function TfSpPeople.FilterIsAText: Boolean;
var
    i: Integer;
    IsText: Boolean;
begin
    IsText := False;
    for i := 1 to Length(SearchTE.Text) do
        case SearchTE.Text[i] of
            '0'..'9': ;
        else
            begin
                IsText := True;
                Break;
            end;
        end;
    Result := IsText;
end;

function TfSpPeople.GetNewFilter(FIO: string): string; // Получает новый фильтр после редактирования физ. лица, содержащий его фамилию
var
    l: Integer;
begin
    begin // Выбираем только по фамилии
        l := Pos(' ', FIO);
        if (l - 1) <= SearchTE.Properties.MaxLength then
            Delete(FIO, l, Length(FIO) - l + 1)
        else
            Delete(FIO, SearchTE.Properties.MaxLength, Length(FIO) - SearchTE.Properties.MaxLength + 1);
        Result := FIO;
        SearchTE.Text := Result;
        Exit;
    end;
end;

function TfSpPeople.StringForSearch(AText: string): string;
var
    i, l: Integer;
begin
    Result := AText;
    l := Length(AText);
    for i := l downto 1 do
        if AText[i] = '''' then
            Insert('''', Result, i);
end;

function TfSpPeople.LocateManByID(AID_MAN: Integer): Boolean;
var
    ManStr: string;
begin
    Refresh;

    // Если поиск осуществлялся по ТН, то нет необходимости искать человека снова,
    // т.к. ТН мы не меняем.
    if SearchTE.Text <> '' then
        if not FilterIsAText then
        begin
            RefreshBtnClick(Self);
            Result := True;
            Exit;
        end;

    {      if DSetPeople.Active then DSetPeople.Close;
          DSetPeople.SQLs.SelectSQL.Text:='SELECT * FROM Z_FIO_BY_ID_MAN('+IntToStr(AID_MAN)+')';
          DSetPeople.Open;
          ManStr:=DSetPeople['FIO'];
          DSetPeople.Close;}
      // Используем читающую транзакцию, т.к. не вносим изменения в таблицу
    StProc.Transaction := ReadTransaction;
    StProc.StoredProcName := 'Z_FIO_BY_ID_MAN';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('ID_MAN').AsInteger := AID_MAN;
    StProc.ExecProc;
    ManStr := StProc.ParamByName('FIO').AsString;
    StProc.Transaction.Rollback;
    StProc.Transaction := WriteTransaction;

    ManStr := GetNewFilter(ManStr);

    if DSetPeople.Active then
        DSetPeople.Close;
    DSetPeople.SQLs.SelectSQL.Text := SqlCondition + SELECT_PROCEDURE + '(''' + StringForSearch(ManStr) + ''',NULL,NULL,NULL)';
    DSetPeople.Open;
    Result := DSetPeople.Locate('ID_MAN', AID_MAN, []);
end;

constructor TfSpPeople.Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; CanEdit, ForSelect, MultiSelect: Boolean; ASelProcName: string;
    AID_MAN: Integer = -1; AutoSyncWithEdbo: Boolean = False);
var
    wf: TForm;
begin
    // Если не ForSelect, то не может быть MultiSelect, следовательно:
    if not ForSelect then
        MultiSelect := False;
    //******************************************************************************
    inherited Create(AOwner);
    //******************************************************************************
    DB.Handle := ADB_Handle;
    ReadTransaction.Active := True;
    //  SpInit(DB.Handle);
    //******************************************************************************
    if DSetPeople.Active then
        DSetPeople.Close;

    if PubSysDataDSet.Active then
        PubSysDataDSet.Close;
    PubSysDataDSet.SQLs.SelectSQL.Text := 'Select Can_Connect_To_Edbo, University_Code_U, Id_Country_Edbo, Show_Foto From Pub_Sys_Data';
    PubSysDataDSet.Open;
    if PubSysDataDSet['Can_Connect_To_Edbo'] = null then
        CanConnectToEdbo := False
    else
        CanConnectToEdbo := Boolean(PubSysDataDSet['Can_Connect_To_Edbo']);

    if PubSysDataDSet['University_Code_U'] = null then
        University_Code_U := ''
    else
        University_Code_U := PubSysDataDSet['University_Code_U'];

    if PubSysDataDSet['Id_Country_Edbo'] = null then
        IdCountryEdbo := -1
    else
        IdCountryEdbo := PubSysDataDSet['Id_Country_Edbo'];

    if PubSysDataDSet['Show_Foto'] = null then
        CanWorkWithImage := 0
    else
        CanWorkWithImage := PubSysDataDSet['Show_Foto'];

    pSyncKodPersonEdbo := 0; // ставим по умолчанию в 0, при необходимости флаг изменяется в методе вызова после вызова конструктора
    //этот флаг обозначает, что идет синхронизация только кодов и используется для получения информации по нажатию клавиш
    IsAutoSyncWithEdbo := AutoSyncWithEdbo;

    if AutoSyncWithEdbo and CanConnectToEdbo then
    begin
        btnSyncWithEdbo.Visible := False;
        AddBtn.Visible := False;
        EditBtn.Visible := False;
        DeleteBtn.Visible := False;
        ViewBtn.Visible := False;
        MakeOldBtn.Visible := False;
        AdvSearchBtn.Visible := False;
        UnDeleteTnBtn.Visible := False;
        SpeedButton1.Visible := False;

        if InitConnectToEdbo then
            if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DB.Handle) then
            begin
                GetPeoplesFromEdbo;
            end;
    end
    else
    begin
        if CanConnectToEdbo then
        begin
            btnSyncWithEdbo.Visible := True;
            InitConnectToEdbo;
        end;
        SELECT_PROCEDURE := ASelProcName;
        pSelectWithDog := False;
        pSelectWorked := False;
        if AID_MAN = -1 then
            // Все-равно сначала появляется строка ввода параметров поиска
        begin
            SearchTE.Text := GetSearchParams(Self);
            Timer1Timer(Self);
        end
            {    begin
                  DSetPeople.SQLs.SelectSQL.Text:=SqlCondition+SELECT_PROCEDURE+'('''+StartingSearch+''',NULL,NULL,NULL)';
                  DSetPeople.Open;
                end }
        else
            LocateManByID(AID_MAN);
    end;
    //******************************************************************************
    wf := ShowWaitForm(Self);
    {  InsertAction.Enabled:=IsPossible('Add');
      EditAction.Enabled:=IsPossible('Edit');
      DeleteAction.Enabled:=IsPossible('Del'); }
    MakeOldAction.Visible := IsPossible('Close');
    // Проверка прочих действий осуществляется при нажатии кнопок
    //******************************************************************************
    pStylesDM := TStylesDM.Create(Self);
    PeopleGridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
    SelectGridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
    //******************************************************************************
    AddBtn.Enabled := CanEdit;
    EditBtn.Enabled := CanEdit;
    DeleteBtn.Enabled := CanEdit;

    pForSelect := ForSelect;
    if not ForSelect then
        //  if AID_MAN<>-1 then
        // Отображаются список лиц, панель инструментов
    begin
        SelectBtn.Visible := False;
        FormStyle := fsMDIChild;
        Visible := True;
    end
        {  else
        // Первоначально отображается лишь строка поиска
           begin
            SelectBtn.Visible:=False;
            FormStyle:=fsStayOnTop;
            Visible:=False;
                PeopleGrid.Hide;
                MainToolBar.Hide;
                InfoPanel.Show;
                InfoPanel.Align:=alClient;
                Height:=SearchPanel.Height+70;
                BorderIcons:=BorderIcons-[biMinimize,biMaximize];
             SelectGrid.Visible  := False;
             cxSplitter1.Visible := False;
             PeopleGrid.Align := alClient;
            Show;
           end    }
    else // Если открыто для выбора лица
    begin
        FormStyle := fsNormal;
        Visible := False;
        {    if not MultiSelect then
              begin
                if AID_MAN=-1 then // Если конкретное лицо не запрошено, то будет осуществляться поиск
                  begin
                    PeopleGrid.Hide;
                    MainToolBar.Hide;
                    InfoPanel.Show;
                    InfoPanel.Align:=alClient;
                    Height:=SearchPanel.Height+70;
                    BorderIcons:=BorderIcons-[biMinimize,biMaximize];
                  end;
              end; }
    end;
    pMultiSelect := MultiSelect;
    //******************************************************************************
    if pMultiSelect then
    begin
        MDSelected.CopyStructure(DSetPeople);
        MDSelected.Open;
    end
    else
    begin
        SelectGrid.Visible := False;
        cxSplitter1.Visible := False;
        PeopleGrid.Align := alClient;
    end;
    //******************************************************************************
    SearchTE.Width := SearchPanel.Width - 167;
    Timer1.Interval := 0; // Тут таймер отключается, а значит поиск осуществляется в ручном режиме
    SearchBtn.Visible := True;
    //******************************************************************************
    pImageDB_Handle := GetImageDBHandle(DB.Handle);
    CloseWaitForm(wf);
end;

destructor TfSpPeople.Destroy;
begin
    //Освобождаем ресурсы
    if Assigned(EDBOGuidesIntf) then
        EDBOGuidesIntf.Free;

    if Assigned(EDBOPersonIntf) then
        EDBOPersonIntf.Free;
end;

procedure TfSpPeople.RefreshBtnClick(Sender: TObject);
begin
    Refresh;
    if DSetPeople.Active then
        DSetPeople.Close;
    DSetPeople.Open;
end;

procedure TfSpPeople.Timer1Timer(Sender: TObject);
var
    wf: TForm;
begin
    Timer1.Enabled := False;
    if SearchTE.Text = '' then
        Exit;

    wf := ShowWaitForm(Self);
    if IsAutoSyncWithEdbo then
    begin
        GetPeoplesFromEdbo;
    end
    else
    begin
        if DSetPeople.Active then
            DSetPeople.Close;
        if FilterIsAText then
            DSetPeople.SQLs.SelectSQL.Text := SqlCondition + SELECT_PROCEDURE + '(''' + StringForSearch(SearchTE.Text) +
                ''',NULL,NULL,NULL)'
        else
            DSetPeople.SQLs.SelectSQL.Text := SqlCondition + SELECT_PROCEDURE + '('''',' +
                Copy(SearchTE.Text, 1, 9) + ',NULL,NULL)';
        DSetPeople.Open;
    end;
    CloseWaitForm(wf);
    {  if not PeopleGrid.Visible then
          begin
            Hide;
            InfoPanel.Hide;
            PeopleGrid.Show;
            MainToolBar.Show;
            Top:=Top-167;
            if Top<0 then Top:=0;
            Height:=443;
            BorderIcons:=BorderIcons+[biMinimize,biMaximize];

            if not pForSelect then
             begin
              Position:=poMainFormCenter;
              FormStyle:=fsMDIChild;
             end;
            Show;
          end; }
    // переходим на таблицу физ. лиц, где можно перемещаться и продолжать поиск
    if Visible then
        PeopleGrid.SetFocus;
end;

procedure TfSpPeople.ExitBtnClick(Sender: TObject);
begin
    Close;
end;

procedure TfSpPeople.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ReadTransaction.Active := False;
    MDSelected.Close;
    Action := caFree;
end;

procedure TfSpPeople.FormResize(Sender: TObject);
begin
    SearchTE.Width := SearchPanel.Width - 167;
    SearchBtn.Left := SearchTE.Left + SearchTE.Width + 5;
end;

procedure TfSpPeople.ViewBtnClick(Sender: TObject);
var
    ModFrom: TfModifyMan;
    Access: Boolean;
begin
    if DSetPeople.IsEmpty then
        Exit;
    Access := CheckAccess(Self);
    if Access then
    begin
        ModFrom := TfModifyMan.Create(Self, DB.Handle, pImageDB_Handle, emView, DSetPeople['ID_MAN']);
        ModFrom.ShowModal;
        ModFrom.Free;
    end;
end;

procedure TfSpPeople.PeopleGridDBTableView1CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AViewInfo.GridRecord.Values[6] = 1) then
    begin
        ACanvas.Font.Style := [fsStrikeOut];
        ACanvas.Brush.Color := clSilver;
    end;
end;

procedure TfSpPeople.AddBtnClick(Sender: TObject);
var
    ModForm: TfModifyMan;
    pIdMan: Integer;
begin
    if not IsPossible('Add') then
    begin
        ShowNoRights(Self);
        Exit;
    end;
    ModForm := TfModifyMan.Create(Self, DB.Handle, pImageDB_Handle, emNew);
    ModForm.ShowModal;
    pIdMan := ModForm.IdMan;
    ModForm.Free;
    if pIdMan <> -1 then
    begin
        LocateManByID(pIdMan);

        if SelectBtn.Visible then
        begin
            SelectBtnClick(Self);
        end;
    end;
end;

procedure TfSpPeople.EditBtnClick(Sender: TObject);
var
    ModForm: TfModifyMan;
    LocIdMan: Integer;
    AccessForm: TAccessForm;
    Access: Boolean;
begin
    if DSetPeople.IsEmpty then
        Exit;
    if not IsPossible('Edit') then
    begin
        ShowNoRights(Self);
        Exit;
    end;
    Access := CheckAccess(Self);
    if Access then
    begin
        ModForm := TfModifyMan.Create(Self, DB.Handle, pImageDB_Handle, emModify, DSetPeople['ID_MAN']);
        ModForm.ShowModal;
        ModForm.Free;
        LocIdMan := DSetPeople['ID_MAN'];
        LocateManByID(LocIdMan);
    end;
end;

procedure TfSpPeople.SelectBtnClick(Sender: TObject);
var
    i: integer;
    Access: Boolean;
    id_man_i: integer;
    otchestvo, number_pass, seria_pass, vidan, tin: string;
begin
    if IsAutoSyncWithEdbo and CanConnectToEdbo then
    begin
        if not EdboPeopleDSet.IsEmpty then
        begin
            Access := CheckAccess(Self);
            if Access then
            begin
                id_man_i := -1;
                if VarIsNull(EdboPeopleDSet['Otchestvo']) then
                    otchestvo := ''
                else
                    otchestvo := EdboPeopleDSet['Otchestvo'];
                if VarIsNull(EdboPeopleDSet['Number_Pass']) then
                    number_pass := ''
                else
                    number_pass := EdboPeopleDSet['Number_Pass'];
                if VarIsNull(EdboPeopleDSet['Seria_Pass']) then
                    seria_pass := ''
                else
                    seria_pass := EdboPeopleDSet['Seria_Pass'];
                if VarIsNull(EdboPeopleDSet['Vidan']) then
                    vidan := ''
                else
                    vidan := EdboPeopleDSet['Vidan'];
                if VarIsNull(EdboPeopleDSet['TIN']) then
                    tin := ''
                else
                    tin := EdboPeopleDSet['TIN'];
                if length(tin) <> 10 then
                    tin := '';
                id_man_i := SyncDataWithEdbo(EdboPeopleDSet['Id_Person'], EdboPeopleDSet['Familiya'], EdboPeopleDSet['Imya'],
                    otchestvo, EdboPeopleDSet['Person_Code_U'], number_pass,
                    seria_pass, EdboPeopleDSet['Date_Beg_Pass'], vidan,
                    EdboPeopleDSet['Id_Sex'], EdboPeopleDSet['Birth_Date'], tin, EdboPeopleDSet['IsResident'], 0);
                if (id_man_i <> -1) then
                begin
                    ResultArray := VarArrayCreate([0, 1], varVariant);
                    ResultArray[0] := id_man_i;
                    ResultArray[1] := EdboPeopleDSet['FIO'];
                    ModalResult := mrOk;
                end;
            end;
        end;
    end
    else
    begin
        if (DSetPeople['TN_IS_DELETED'] = 'T') then
            if ZShowMessage(Self.Caption, 'Особиста картка видалена. Вибрати запис?', mtConfirmation, [mbYes, mbNo]) = mrNo then
                Exit;

        if not pMultiSelect then
        begin
            if DSetPeople.IsEmpty then
                Exit;
            Access := CheckAccess(Self);
            if Access then
            begin
                ResultArray := VarArrayCreate([0, 11], varVariant);
                ResultArray[0] := DSetPeople['ID_MAN'];
                ResultArray[1] := DSetPeople['FIO'];
                ResultArray[2] := DSetPeople['Familia'];
                ResultArray[3] := DSetPeople['Imya'];
                ResultArray[4] := DSetPeople['Otchestvo'];
                ResultArray[5] := DSetPeople['Rus_Familia'];
                ResultArray[6] := DSetPeople['Rus_Imya'];
                ResultArray[7] := DSetPeople['Rus_Otchestvo'];
                ResultArray[8] := DSetPeople['Birth_Date'];
                ResultArray[9] := DSetPeople['TIN'];
                ResultArray[10] := DSetPeople['TN'];
                if pSelectWithDog then
                    ResultArray[11] := FormDogData(DSetPeople['ID_MAN'], DSetPeople['TIN'], DSetPeople['FIO'])
                else if pSelectWorked then
                    ResultArray[11] := FormWorkData(DSetPeople['ID_MAN'], pDate_Beg, pDate_End);
            end;
        end;
        if pMultiSelect then
        begin
            if MDSelected.IsEmpty then
                Exit;
            MDSelected.First;

            ResultArray := VarArrayCreate([0, MDSelected.RecordCount], varVariant);
            for i := 0 to MDSelected.RecordCount - 1 do
            begin
                ResultArray[i] := VarArrayCreate([0, 10], varVariant);
            end;

            for i := 0 to MDSelected.RecordCount - 1 do
            begin

                if not pSelectWithDog then
                begin
                    if pSelectWorked then
                        ResultArray[i] :=
                            VarArrayOf([MDSelected['ID_MAN'],
                            MDSelected['FIO'], MDSelected['FAMILIA'], MDSelected['IMYA'],
                                MDSelected['OTCHESTVO'], MDSelected['RUS_FAMILIA'], MDSelected['RUS_IMYA'],
                                MDSelected['RUS_OTCHESTVO'], MDSelected['BIRTH_DATE'], MDSelected['TIN'],
                                MDSelected['TN'], FormWorkData(DSetPeople['ID_MAN'], pDate_Beg, pDate_End)])
                    else
                        ResultArray[i] :=
                            VarArrayOf([MDSelected['ID_MAN'],
                            MDSelected['FIO'], MDSelected['FAMILIA'], MDSelected['IMYA'],
                                MDSelected['OTCHESTVO'], MDSelected['RUS_FAMILIA'], MDSelected['RUS_IMYA'],
                                MDSelected['RUS_OTCHESTVO'], MDSelected['BIRTH_DATE'], MDSelected['TIN'],
                                MDSelected['TN']])
                end
                else
                    ResultArray[i] :=
                        VarArrayOf([MDSelected['ID_MAN'],
                        MDSelected['FIO'], MDSelected['FAMILIA'], MDSelected['IMYA'],
                            MDSelected['OTCHESTVO'], MDSelected['RUS_FAMILIA'], MDSelected['RUS_IMYA'],
                            MDSelected['RUS_OTCHESTVO'], MDSelected['BIRTH_DATE'], MDSelected['TIN'],
                            MDSelected['TN'], FormDogData(DSetPeople['ID_MAN'], DSetPeople['TIN'], DSetPeople['FIO'])]);
                MDSelected.Next;
            end;
        end;
        if (not pMultiSelect) and pSelectWithDog and VarIsNull(ResultArray[11]) then
        begin
            if ZShowMessage(Self.Caption, 'Обрана особа не має банківського договору!' + #13 +
                '         Вибрати цю фізичну особу?', mtConfirmation, [mbYes, mbNo]) = mrYes then
            begin
                Access := CheckAccess(Self);
                if Access then
                begin
                    ResultArray[11] := GetNullDogData;
                    ModalResult := mrOk;
                end;
            end;
        end
        else if (not pMultiSelect) and pSelectWorked and VarIsNull(ResultArray[11]) then
        begin
            if ZShowMessage(Self.Caption, 'Обрана особа не є працівником даної організації у вказаному періоді!' + #13 +
                '         Вибрати цю фізичну особу?', mtConfirmation, [mbYes, mbNo]) = mrYes then
            begin
                Access := CheckAccess(Self);
                if Access then
                begin
                    // ResultArray[11] := GetNullDogData;
                    ModalResult := mrOk;
                end;
            end;
        end
        else
            ModalResult := mrOk;
    end;
end;

procedure TfSpPeople.PeopleGridDBTableView1DblClick(Sender: TObject);
begin
    if IsAutoSyncWithEdbo then
    begin
        if not EdboPeopleDSet.IsEmpty then
        begin
            if SelectBtn.Visible then
                SelectBtnClick(Self);
        end;
    end
    else
    begin
        if not pMultiSelect then
        begin
            if SelectBtn.Visible = True then
                SelectBtnClick(Self);
            Exit;
        end;

        if (DSetPeople['TN_IS_DELETED'] = 'T') then
        begin
            ShowMessage('Неможливо вибрати цей табельний номер!');
            Exit;
        end;

        if not MDSelected.Locate('ID_MAN', DSetPeople['ID_MAN'], []) then
        begin
            MDSelected.LoadFromDataSet(DSetPeople, 1, lmAppend);
            MDSelected.Last;
        end
        else if DSetPeople['TN'] <> MDSelected['TN'] then
        begin
            MDSelected.LoadFromDataSet(DSetPeople, 1, lmAppend);
            MDSelected.Last;
        end;
    end;
end;

procedure TfSpPeople.SearchTEKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    Timer1.Enabled := False;
    Timer1.Enabled := True;
    if Key = 13 then
        Timer1Timer(Self); // Enter нажат
end;

procedure TfSpPeople.PeopleGridDBTableView1KeyPress(Sender: TObject;
    var Key: Char);
const
    LettersBig = 'АБВГҐДЕЁЖЗЄІИЇЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
    LettersSmall = 'абвгґдеёжзєіиїйклмнопрстуфхцчшщъыьэюя';
    Signs = '0123456789-()/\';
    Space = ' ';
begin
    if Key = #13 then
        SelectBtnClick(Self);

    if (Pos(Key, LettersBig) = 0) and (Pos(Key, LettersSmall) = 0) and
        (Pos(Key, Signs) = 0) and (Pos(Key, Space) = 0) then
        Exit;

    SearchTE.Text := {SearchTE.Text+} Key;
    SearchTE.SetFocus;
    SearchTE.SetSelection(Length(SearchTE.Text), Length(SearchTE.Text));
    Timer1.Enabled := False;
    Timer1.Enabled := True;
end;

procedure TfSpPeople.SelectGridDBTableView1DblClick(Sender: TObject);
begin
    if MDSelected.IsEmpty then
        Exit;
    MDSelected.Delete;
end;

procedure TfSpPeople.SearchBtnClick(Sender: TObject);
begin
    Timer1Timer(Self);
end;

procedure TfSpPeople.AdvSearchBtnClick(Sender: TObject);
var
    ViewForm: TAdvancedSearchForm;
begin
    ViewForm := TAdvancedSearchForm.Create(Self);
    if ViewForm.ShowModal = mrOk then
    begin
        if DSetPeople.Active then
            DSetPeople.Close;
        case ViewForm.pParamNumber of
            1: DSetPeople.SQLs.SelectSQL.Text := SqlCondition + SELECT_PROCEDURE + '(NULL,NULL,' +
                ViewForm.pParamValue + ',NULL)';
            2: DSetPeople.SQLs.SelectSQL.Text := SqlCondition + SELECT_PROCEDURE + '(NULL,NULL,NULL,''' +
                StringForSearch(ViewForm.pParamValue) + ''')';
        end;
        DSetPeople.Open;
    end;
    ViewForm.Free;
end;

procedure TfSpPeople.WriteTransactionAfterStart(Sender: TObject);
begin
    // записываем данные о грядущем изменении в таблицу PUB_DT_HISTORY_INFO
    // уже не записываем, по словам КЯВа данные должна писать аццмжмт-бплина
  {  StProcHist.StoredProcName := 'PUB_SET_HISTORY_INS';
    StProcHist.Prepare;
    StProcHist.ParamByName('IN_ID_USER').AsInt64 := accMgmt.GetUserId;
    StProcHist.ParamByName('IN_IP_ADRESS').AsString := GetIPAddress;
    StProcHist.ParamByName('IN_HOST_NAME').AsString := GetCompName;
    StProcHist.ParamByName('APP_NAME').AsString := ExtractFileName(Application.ExeName);
    StProcHist.ExecProc;}
end;

procedure TfSpPeople.PeopleGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if DSetPeople.RecordCount > 0 then
    begin
        if Key = 46 {Delete} then
            DeleteActionExecute(Self);
        if ((Key = VK_F12) and (ssShift in Shift)) then
            ShowMessage('Id_Man = ' + IntToStr(DSetPeople['ID_MAN']));
        //идет в обработке нажатия клавиш на грид, потому что в обработчике нажатия клавиш на форме не срабатывает
        if ((ssShift in Shift) and (ssCtrl in Shift) and (Key = VK_F11) and (pSyncKodPersonEdbo = 1)) then
            ShowExportDialog(Self);
    end
end;

procedure TfSpPeople.cmnTNCustomDrawCell(Sender: TcxCustomGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
    var ADone: Boolean);
begin
    if (AViewInfo.GridRecord.Values[3] = 'T') then
    begin
        ACanvas.Font.Style := [fsStrikeOut];
        ACanvas.Brush.Color := clSilver;
    end;
end;

procedure TfSpPeople.cmnTINGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
    if AText = '' then
        Exit;
    if (Length(AText) < 10) or (AText[1] = '-') then // т.е. перед нами ненастоящий ИНН
        AText := '';
end;

procedure TfSpPeople.MakeOldActionExecute(Sender: TObject);
var
    i: Integer;
    pPassed: Boolean;
begin
    if DSetPeople.IsEmpty then
        Exit;
    if DSetPeople['IS_OLD'] <> 1 then
        pPassed := (ZShowMessage(Self.Caption, MakeOld_Message, mtCustom, [mbYes, mbNo]) = mrYes)
    else
        pPassed := (ZShowMessage(Self.Caption, MakeUsual_Message, mtCustom, [mbYes, mbNo]) = mrYes);
    if pPassed then
    begin
        try
            StProc.Transaction.StartTransaction;
            StProc.StoredProcName := 'PEOPLE_MAKE_OLD';
            StProc.Prepare;
            StProc.ParamByName('ID_MAN').AsInteger := DSetPeople['ID_MAN'];
            StProc.ParamByName('IS_OLD').AsInteger := DSetPeople['IS_OLD'];
            StProc.ExecProc;
            StProc.Transaction.Commit;
            i := DSetPeople['ID_MAN'];
            DSetPeople.CloseOpen(False);
            DSetPeople.Locate('ID_MAN', i, [])
        except
            on e: Exception do
            begin
                StProc.Transaction.Rollback;
                ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
            end;
        end;
    end;
end;

procedure TfSpPeople.DeleteActionExecute(Sender: TObject);
begin
    if DSetPeople.IsEmpty then
        Exit;
    if not IsPossible('Del') then
    begin
        ShowNoRights(Self);
        Exit;
    end;
    if zShowMessage('Вилучення', 'Запис буде вилучено! Продовжити?', mtConfirmation, [mbYes, MbNo]) = mrYes then
    begin
        try
            StProc.Transaction.StartTransaction;
            StProc.StoredProcName := 'PEOPLE_DELETE';
            StProc.Prepare;
            StProc.ParamByName('ID_MAN').AsInteger := DSetPeople['ID_MAN'];
            StProc.ExecProc;
            StProc.Transaction.Commit;
            DSetPeople.DeleteSQL.Text := 'execute procedure Z_EMPTY_PROC';
            DSetPeople.Delete;
        except
            on e: Exception do
            begin
                StProc.Transaction.Rollback;
                ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
            end;
        end;
    end;
end;

procedure TfSpPeople.SelectBtnClickProcedure(Sender: TObject);
begin
    while not (Sender is TForm) do
        Sender := (Sender as TComponent).Owner;
    (Sender as TForm).ModalResult := mrOk;
end;

function TfSpPeople.FormDogData(AID_MAN: Integer; ATIN: string; AFIO: string): Variant;
var
    T: TForm;
    F: TframeCard;
    pId: Int64;
begin
    Result := Null;
    if DSetDog.Active then
        DSetDog.Close;
    DSetDog.SQLs.SelectSQL.Text := 'SELECT * FROM PEOPLE_DOG_BANKCARD_SELECT(' + IntToStr(AID_MAN) + ',''' + DateToStr(Today) + ''',0)';
    DSetDog.Open;
    if DSetDog.IsEmpty then
        Exit;
    if DSetDog.RecordCount = 1 then
    begin
        Result := GetDogDataFromDataSet;
        {      Result:=VarArrayCreate([0,17],varVariant);
              Result[0]:=DSetDog['ID_DOG_BANKCARD'];
              Result[1]:=DSetDog['ID_MAN'];
              Result[2]:=DSetDog['FAMILIA'];
              Result[3]:=DSetDog['IMYA'];
              Result[4]:=DSetDog['OTCHESTVO'];
              Result[5]:=DSetDog['TIN'];
              Result[6]:=DSetDog['NUM_DOG'];
              Result[7]:=DSetDog['DATE_DOG'];
              Result[8]:=DSetDog['DATE_BEG'];
              Result[9]:=DSetDog['DATE_END'];
              Result[10]:=DSetDog['COMENT'];
              Result[11]:=DSetDog['NUM_LIC_ACCAUNT'];
              Result[12]:=DSetDog['ID_TYPE_PAYMENT'];
              Result[13]:=DSetDog['SHORT_NAME_TYPE_PAYMENT'];
              Result[14]:=DSetDog['FULL_NAME_TYPE_PAYMENT'];
              Result[15]:=DSetDog['IN_USE'];
              Result[16]:=DSetDog['IS_DOG_CLOSE'];
              Result[17]:=DSetDog['CONTROL_ID'];  }
    end
    else
    begin
        T := TForm.Create(Self);
        F := TframeCard.Create(T, DB.Handle, emView, AID_MAN, ATIN);
        T.Width := F.Width + 5;
        T.Height := F.Height + 25;
        T.FormStyle := fsNormal;
        T.BorderStyle := bsDialog;
        T.Caption := 'Інформація про карткові рахунки: ' + AFIO;
        T.Position := poDesktopCenter;
        F.SelectBtn.Visible := True;
        F.SelectBtn.OnClick := SelectBtnClickProcedure;
        F.GridDogDBTableView1.OnDblClick := SelectBtnClickProcedure;
        T.ShowModal;
        pId := F.DSetDog['ID_DOG_BANKCARD'];
        T.Release;
        if DSetDog.Active then
            DSetDog.Close;
        DSetDog.SQLs.SelectSQL.Text := 'SELECT * FROM PEOPLE_DOG_BANKCARD_SELECT(' + IntToStr(AID_MAN) + ',''' + DateToStr(Today) +
            ''',0) WHERE ID_DOG_BANKCARD=' + IntToStr(pId);
        DSetDog.Open;
        Result := GetDogDataFromDataSet;
        {  if DSetDog.IsEmpty then Exit;
              Result:=VarArrayCreate([0,17],varVariant);
              Result[0]:=DSetDog['ID_DOG_BANKCARD'];
              Result[1]:=DSetDog['ID_MAN'];
              Result[2]:=DSetDog['FAMILIA'];
              Result[3]:=DSetDog['IMYA'];
              Result[4]:=DSetDog['OTCHESTVO'];
              Result[5]:=DSetDog['TIN'];
              Result[6]:=DSetDog['NUM_DOG'];
              Result[7]:=DSetDog['DATE_DOG'];
              Result[8]:=DSetDog['DATE_BEG'];
              Result[9]:=DSetDog['DATE_END'];
              Result[10]:=DSetDog['COMENT'];
              Result[11]:=DSetDog['NUM_LIC_ACCAUNT'];
              Result[12]:=DSetDog['ID_TYPE_PAYMENT'];
              Result[13]:=DSetDog['SHORT_NAME_TYPE_PAYMENT'];
              Result[14]:=DSetDog['FULL_NAME_TYPE_PAYMENT'];
              Result[15]:=DSetDog['IN_USE'];
              Result[16]:=DSetDog['IS_DOG_CLOSE'];
              Result[17]:=DSetDog['CONTROL_ID'];}
    end;
end;

function TfSpPeople.GetNullDogData: Variant;
begin
    Result := VarArrayCreate([0, 17], varVariant);
    Result[0] := Null;
    Result[1] := Null;
    Result[2] := Null;
    Result[3] := Null;
    Result[4] := Null;
    Result[5] := Null;
    Result[6] := Null;
    Result[7] := Null;
    Result[8] := Null;
    Result[9] := Null;
    Result[10] := Null;
    Result[11] := Null;
    Result[12] := Null;
    Result[13] := Null;
    Result[14] := Null;
    Result[15] := Null;
    Result[16] := Null;
    Result[17] := Null;
end;

function TfSpPeople.GetDogDataFromDataSet: Variant;
begin
    Result := Null;
    if not DSetDog.Active then
        Exit;
    if DSetDog.IsEmpty then
        Exit;
    Result := VarArrayCreate([0, 17], varVariant);
    Result[0] := DSetDog['ID_DOG_BANKCARD'];
    Result[1] := DSetDog['ID_MAN'];
    Result[2] := DSetDog['FAMILIA'];
    Result[3] := DSetDog['IMYA'];
    Result[4] := DSetDog['OTCHESTVO'];
    Result[5] := DSetDog['TIN'];
    Result[6] := DSetDog['NUM_DOG'];
    Result[7] := DSetDog['DATE_DOG'];
    Result[8] := DSetDog['DATE_BEG'];
    Result[9] := DSetDog['DATE_END'];
    Result[10] := DSetDog['COMENT'];
    Result[11] := DSetDog['NUM_LIC_ACCAUNT'];
    Result[12] := DSetDog['ID_TYPE_PAYMENT'];
    Result[13] := DSetDog['SHORT_NAME_TYPE_PAYMENT'];
    Result[14] := DSetDog['FULL_NAME_TYPE_PAYMENT'];
    Result[15] := DSetDog['IN_USE'];
    Result[16] := DSetDog['IS_DOG_CLOSE'];
    Result[17] := DSetDog['CONTROL_ID'];
end;

function TfSpPeople.FormWorkData(AID_MAN: Integer; Date_Beg: TDate; Date_End: TDate): Variant;
begin
    Result := Null;
    if DSetWorked.Active then
        DSetWorked.Close;
    DSetWorked.SQLs.SelectSQL.Text := 'SELECT * FROM PEOPLE_WORKED_SELECT(' + IntToStr(AID_MAN) + ',''' + DateToStr(Date_Beg) + ''',''' +
        DateToStr(Date_End) + ''')';
    DSetWorked.Open;
    if DSetWorked.IsEmpty then
        Exit;
    if DSetWorked.RecordCount = 1 then
    begin
        Result := DSetWorked['ID_WORK_DOG_MOVING'];
    end
    else
    begin
        Result := Null;
    end;
end;

procedure TfSpPeople.ShowNoRights(Sender: TObject);
begin
    ZShowMessage('Увага', 'Вам не дозволено виконувати цю дію.' + #13 + 'Зверніться, будь ласка, до адміністратора.', mtWarning, [mbOK]);
end;

procedure TfSpPeople.ShowAccessDenied(Sender: TObject);
begin
    ZShowMessage('Увага', 'Доступ до даних фізичної особи заблоковано,' + #13 + 'тому що введені некоректні паспортні дані', mtWarning, [mbOK]);
end;

procedure TfSpPeople.HstInfoActionExecute(Sender: TObject);
var
    Sp: TSprav;
    id_man: Integer;
begin
    id_man := -DSetPeople['ID_MAN'];
    sp := GetSprav('UP\ReportPeopleHstInfo');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
            FieldValues['id_sp_report'] := IntToStr(id_man);
            FieldValues['DesignReport'] := False;
            Post;
        end;
        sp.Show;
        sp.Free;
    end;
end;

procedure TfSpPeople.UnDeleteTnActionExecute(Sender: TObject);
var
    id_man: Integer;
begin
    id_man := DSetPeople['ID_MAN'];
    if ((DSetPeople['TN_IS_DELETED'] = 'T') and (not VarIsNull(DSetPeople['TN']))) then
    begin
        try
            StProc.Transaction := WriteTransaction;
            StProc.StoredProcName := 'ASUP_PRIVATE_CARDS_UNDELETE';
            StProc.Transaction.StartTransaction;
            StProc.Prepare;
            StProc.ParamByName('TN').AsInteger := DSetPeople['TN'];
            StProc.ExecProc;
            StProc.Transaction.Commit;
        except on E: Exception do
            begin
                ZShowMessage('Увага', E.Message, mtError, [mbOK]);
                StProc.Transaction.Rollback;
            end;
        end
    end
    else
    begin
        if VarIsNull(DSetPeople['TN']) then
            ZShowMessage('Увага', 'Ця людина не має табельного номера', mtError, [mbOK])
        else
            ZShowMessage('Увага', 'Дія неможлива, табельний номер активний', mtError, [mbOK]);
    end;
    if DSetPeople.Active then
        DSetPeople.Close;
    DSetPeople.Open;
    DSetPeople.Locate('ID_MAN', id_man, []);
end;

function TfSpPeople.CheckAccess(Sender: TObject): Boolean;
var
    Access: Boolean;
    DSetCheckData: TpFIBDataset;
    id_man: Integer;
begin
    if IsAutoSyncWithEdbo then
    begin
        Access := True;
    end
    else
    begin
        Access := False;
        id_man := DSetPeople['ID_MAN'];
        if AccMgmt.fibCheckPermission('/ROOT/SpAllPeople/SAP_access_control', 'View') = 0 then
        begin
            AccessForm := TAccessForm.Create(Self);
            AccessForm.ShowModal;
            if AccessForm.ModalResult = mrOk then
            begin
                DSetCheckData := TpFIBDataset.Create(Self);
                DSetCheckData.Database := DB;
                DSetCheckData.Close;
                DSetCheckData.SQLs.SelectSQL.Text := 'Select Result_Kod from People_Check_Pass_Data(' + IntToStr(id_man) + ','''
                    + AccessForm.Seria + ''',''' + AccessForm.Number + ''')';
                DSetCheckData.Open;

                Access := (DSetCheckData.FBN('Result_Kod').asInteger = 1);

                if not Access then
                begin
                    ShowAccessDenied(Self);
                end;

                DSetCheckData.Free;
            end
            else
            begin
                Access := False;
            end;
            AccessForm.Free;
        end
        else
            Access := True;
    end;
    Result := Access;
end;

procedure TfSpPeople.btnSyncWithEdboClick(Sender: TObject);
var
    MemoryData_EDBO: TRxMemoryData;
    PersonCodeU: AnsiString;
    result: Boolean;
    Inn, DocumentNumber, DocumentSeries, FIOMask: string;
    PersonDocument: Variant;
    WaitForm: TForm;
begin
    try
        if not DSetPeople.IsEmpty then
        begin
            if CanConnectToEdbo then
            begin
                if not InitConnectToEdbo then
                begin
                    ShowMessage('Не вдалося підключитись до ЄДБО!');
                    Exit;
                end
                else
                begin
                    (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DB.Handle);
                end;
                if ((DSetPeople['PERSON_CODE_U_EDBO'] <> null) and (DSetPeople['PERSON_CODE_U_EDBO'] <> '')) then
                begin
                    WaitForm := ShowWaitForm(Self);
                    PersonCodeU := DSetPeople['PERSON_CODE_U_EDBO'];
                    PersonDocument := GetPersonDocument(PersonCodeU, 5);
                    if (not VarIsNull(PersonDocument)) then
                        Inn := PersonDocument[1]
                    else
                        Inn := '';

                    MemoryData_EDBO := TRxMemoryData.Create(Self);
                    FIOMask := '';
                    EDBOPersonIntf.InParams.Items['FIOMask'] := PAnsiString(@FIOMask);

                    DocumentSeries := '';
                    EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);

                    DocumentNumber := '';
                    EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);

                    EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
                    (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind', MemoryData_EDBO);
                    MemoryData_EDBO.Open;
                    if (MemoryData_EDBO.RecordCount > 0) then
                    begin
                        result := (SyncDataWithEdbo(MemoryData_EDBO['FId_Person'], MemoryData_EDBO['FLastName'], MemoryData_EDBO['FFirstName'],
                            MemoryData_EDBO['FMiddleName'], PersonCodeU, MemoryData_EDBO['FPasportNumber'],
                            MemoryData_EDBO['FPasportSeries'], MemoryData_EDBO['FPasportDate'], MemoryData_EDBO['FPasportIssued'],
                            MemoryData_EDBO['FId_PersonSex'], MemoryData_EDBO['FBirthday'], Inn, MemoryData_EDBO['FResident'], 1) <> -1);

                        if result then
                            ShowMessage('Синхронізація виконана!')
                        else
                            ShowMessage('Не вдалося синхронізувати дані!');
                    end;
                    CloseWaitForm(WaitForm);
                    MemoryData_EDBO.Close;
                    MemoryData_EDBO.Free;
                end
                else
                begin
                    ShowMessage('Обрана фізична особа не пов''язана з ЄДБО!');
                end;
            end;
        end;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
        end;
    end;
end;

function TfSpPeople.GetPersonContacts(PersonCodeU: AnsiString): string;
var
    MemoryData_Edbo: TRxMemoryData;
    res_str, str_connect, contact: string;
    i: integer;
    type_contact: integer;
begin
    try
        MemoryData_Edbo := TRxMemoryData.Create(Self);
        EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);
        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonContactsGet', MemoryData_Edbo);
        res_str := '';
        if MemoryData_Edbo.RecordCount > 0 then
        begin
            str_connect := ''; //связка вначале пустая
            for i := 0 to MemoryData_Edbo.RecordCount - 1 do
            begin
                if not (VarIsNull(MemoryData_Edbo['FValue'])) then
                begin
                    type_contact := MemoryData_Edbo['FId_PersonContactType'];
                    if (type_contact in [1, 2]) then //мобильный и телефонный номера
                    begin
                        contact := MemoryData_Edbo['FValue'];
                        res_str := res_str + str_connect + contact; //добавляем связку ', ';
                        str_connect := ', ';
                    end;
                end;
                MemoryData_Edbo.Next;
            end;
        end;
        result := res_str;
        MemoryData_Edbo.Close;
        MemoryData_Edbo.Free;
    except on E: Exception do
        begin
            Showmessage('При імпортуванні контактів фіз.особи виникла помилка' + E.Message);
            exit;
        end;
    end;
end;

procedure TfSpPeople.ResyncAllDataEDBOExecute(Sender: TObject);
var
    FIOMask: AnsiString;
    DocumentSeries: AnsiString;
    DocumentNumber: AnsiString;
    PersonCodeU: AnsiString;
    i: Integer;
    MemoryData_EDBO: TRxMemoryData;
    PersonDocument: Variant;
    result: Boolean;
    Inn: string;
    WaitForm: TForm;
begin

    DSetPeople.First;
    MemoryData_Edbo := TRxMemoryData.Create(Self);
    WaitForm := ShowWaitForm(Self);

    while not DSetPeople.Eof do
    begin
        try
            FIOMask := '';
            EDBOPersonIntf.InParams.Items['FIOMask'] := PAnsiString(@FIOMask);

            DocumentSeries := '';
            EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);

            DocumentNumber := '';
            EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);

            PersonCodeU := DSetPeople.fbn('Person_Code_U_Edbo').AsString;
            EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);

            (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind', MemoryData_EDBO);
            MemoryData_EDBO.Open;
            MemoryData_EDBO.First;
            EdboPeopleDSet.Close;
            EdboPeopleDSet.Open;
            //EdboPeopleDSet.EmptyTable;
            for i := 0 to MemoryData_EDBO.RecordCount - 1 do
            begin
                if IsPersonStudent(MemoryData_EDBO['FId_Person'], MemoryData_EDBO['FPersonCodeU']) <> 0 then
                begin
                    EdboPeopleDSet.Insert;
                    EdboPeopleDSet.FieldByName('ID_PERSON').AsInteger := MemoryData_EDBO['FId_Person'];
                    EdboPeopleDSet.FieldByName('PERSON_CODE_U').AsString := MemoryData_EDBO['FPersonCodeU'];
                    EdboPeopleDSet.FieldByName('FIO').AsString := MemoryData_EDBO['FFIO'];

                    if not (VarIsNull(MemoryData_EDBO['FLastName'])) then
                        EdboPeopleDSet.FieldByName('FAMILIYA').AsString := MemoryData_EDBO['FLastName']
                    else
                        EdboPeopleDSet.FieldByName('FAMILIYA').AsString := '';

                    if not (VarIsNull(MemoryData_EDBO['FFirstName'])) then
                        EdboPeopleDSet.FieldByName('IMYA').AsString := MemoryData_EDBO['FFirstName']
                    else
                        EdboPeopleDSet.FieldByName('IMYA').AsString := '';

                    if not (VarIsNull(MemoryData_EDBO['FMiddleName'])) then
                        EdboPeopleDSet.FieldByName('OTCHESTVO').AsString := MemoryData_EDBO['FMiddleName']
                    else
                        EdboPeopleDSet.FieldByName('OTCHESTVO').AsString := '';

                    EdboPeopleDSet.FieldByName('TN').AsInteger := -1;
                    EdboPeopleDSet.FieldByName('TN_IS_DELETED').AsString := 'F';
                    PersonDocument := GetPersonDocument(MemoryData_EDBO['FPersonCodeU'], 5);

                    if (not VarIsNull(PersonDocument)) then
                        EdboPeopleDSet.FieldByName('TIN').AsString := PersonDocument[1]
                    else
                        EdboPeopleDSet.FieldByName('TIN').AsString := '';

                    EdboPeopleDSet.FieldByName('BIRTH_DATE').AsDateTime := StrToDate(DateToStr(MemoryData_EDBO['FBirthDay']));
                    EdboPeopleDSet.FieldByName('IS_OLD').AsInteger := 0;
                    EdboPeopleDSet.FieldByName('ID_MAN').AsInteger := -1;
                    EdboPeopleDSet.FieldByName('ID_SEX').AsInteger := MemoryData_EDBO['FID_PERSONSEX'];

                    if not (VarIsNull(MemoryData_EDBO['FPASPORTSERIES'])) then
                        EdboPeopleDSet.FieldByName('SERIA_PASS').AsString := MemoryData_EDBO['FPASPORTSERIES'];

                    if not (VarIsNull(MemoryData_EDBO['FPASPORTNUMBER'])) then
                        EdboPeopleDSet.FieldByName('NUMBER_PASS').AsString := MemoryData_EDBO['FPASPORTNUMBER'];

                    if not (VarIsNull(MemoryData_EDBO['FPasportDate'])) then
                        EdboPeopleDSet.FieldByName('DATE_BEG_PASS').AsDateTime := StrToDate(DateToStr(MemoryData_EDBO['FPasportDate']));

                    if not (VarIsNull(MemoryData_EDBO['FPASPORTISSUED'])) then
                        EdboPeopleDSet.FieldByName('VIDAN').AsString := MemoryData_EDBO['FPASPORTISSUED'];
                    EdboPeopleDSet.FieldByName('ISRESIDENT').AsInteger := MemoryData_EDBO['FRESIDENT'];
                    EdboPeopleDSet.Post;
                end;
                MemoryData_EDBO.Next;

            end;

            PersonDocument := GetPersonDocument(PersonCodeU, 5);
            if (not VarIsNull(PersonDocument)) then
                Inn := PersonDocument[1]
            else
                Inn := '';

            result := (SyncDataWithEdbo(MemoryData_EDBO['FId_Person'], MemoryData_EDBO['FLastName'], MemoryData_EDBO['FFirstName'],
                MemoryData_EDBO['FMiddleName'], PersonCodeU, MemoryData_EDBO['FPasportNumber'],
                MemoryData_EDBO['FPasportSeries'], MemoryData_EDBO['FPasportDate'], MemoryData_EDBO['FPasportIssued'],
                MemoryData_EDBO['FId_PersonSex'], MemoryData_EDBO['FBirthday'], Inn, MemoryData_EDBO['FResident'], 1) <> -1);

            if not result then
            begin
                //запишем неудачную попытку в другую мемори дату
            end;

            PeopleGridDBTableView1.DataController.KeyFieldNames := '';
            DSourcePeople.DataSet := EdboPeopleDSet;
            if MemoryData_EDBO.Active then
            begin
                MemoryData_EDBO.Close;
                MemoryData_EDBO.EmptyTable;
                MemoryData_EDBO.Open;
            end
            else
                MemoryData_EDBO.EmptyTable;
        except on E: Exception do
            begin
                showmessage(E.Message);
            end;
        end;

        DSetPeople.Next;
    end;

    MemoryData_EDBO.Close;
    MemoryData_EDBO.Free;
    CloseWaitForm(WaitForm);
    Showmessage('Синхронізація пройшла успішно!');
end;

procedure TfSpPeople.ResyncKodEdboExecute(Sender: TObject);
//процедура, сохраняющая людей, которым не удалось найти соответствие
    procedure SaveNotFoundPeople(In_Id_Man: Int64; In_FioMask: AnsiString; In_TextMessage: string);
    begin
        StorProcReserve.StoredProcName := 'CS_SYNC_KOD_EDBO_EXC_INS';
        StorProcReserve.Transaction.StartTransaction;
        StorProcReserve.Prepare;

        StorProcReserve.ParamByName('ID_MAN').AsInteger := In_Id_Man;
        StorProcReserve.ParamByName('FIO').AsString := In_FioMask;
        StorProcReserve.ParamByName('TEXT_MESSAGE').AsString := In_TextMessage;
        try
            StorProcReserve.ExecProc;
            StorProcReserve.Transaction.Commit;
        except on E: Exception do
            begin
                ShowMessage(E.Message);
                StorProcReserve.Transaction.Rollback;
            end;
        end;
    end;
var
    FIOMask: AnsiString;
    DocumentSeries: AnsiString;
    DocumentNumber: AnsiString;
    PersonCodeU: AnsiString;
    IdPerson: Integer;
    i: Integer;
    MemoryData_EDBO: TRxMemoryData;
    PersonDocument: Variant;
    Inn: string;
    WaitForm: TForm;
    BDate, BDateEdbo: TDateTime;
    WasSync, DoSync: Boolean;
    TextMessage: string;
begin
    //Очистим таблицу, в которой хранится инфа о неудавшихся синхронизациях

    StorProcReserve.StoredProcName := 'CS_SYNC_KOD_EDBO_EXC_DEL';
    StorProcReserve.Transaction.StartTransaction;
    StorProcReserve.Prepare;
    try
        StorProcReserve.ExecProc;
        StorProcReserve.Transaction.Commit;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            StorProcReserve.Transaction.Rollback;
        end;
    end;

    DSetPeople.First;
    MemoryData_Edbo := TRxMemoryData.Create(Self);
    WaitForm := ShowWaitForm(Self);

    while not DSetPeople.Eof do
    begin
        try
            FIOMask := DSetPeople.fbn('FIO').AsString;
            EDBOPersonIntf.InParams.Items['FIOMask'] := PAnsiString(@FIOMask);

            DocumentSeries := '';
            EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);

            DocumentNumber := '';
            EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);

            PersonCodeU := '';
            EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCodeU);

            (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind', MemoryData_EDBO);
            MemoryData_EDBO.Open;
            MemoryData_EDBO.First;

            WasSync := False; //флаг, чтобы знать, получилось ли просинхронизировать
            TextMessage := ''; //сообщение о синхронизации

            if MemoryData_Edbo.IsEmpty then
            begin
                TextMessage := 'Не знайдено жодної фіз.особи у ЄДБО за таким ПІБ. ';
            end
            else
            begin
                if not VarIsNull(DSetPeople.FBN('Birth_Date').AsVariant) then
                    BDate := DSetPeople.FBN('Birth_Date').AsDateTime
                else
                begin
                    BDate := StrToDate('01.01.1900');
                    TextMessage := 'Немає дати народження у довіднику фіз. осіб. ';
                end;

                //Чтоб каждый раз не сравнивать в цикле то, что можно сравнить один раз, вынесем проверку за пределы цикла
                if (CompareBirthDate = 1) and (MemoryData_EDBO.RecordCount = 1) then
                    DoSync := True //нам повезло, есть только одно подходящее лицо в ЕДБО, можно синхронизировать не зависимо от даты рождения
                else
                    DoSync := False;

                for i := 0 to MemoryData_EDBO.RecordCount - 1 do
                begin
                    BDateEDBO := StrToDate(DateToStr(MemoryData_EDBO['FBirthDay']));

                    if ((CompareDate(BDate, BDateEDBO) = 0) or DoSync) then
                    begin

                        SyncStorProc.StoredProcName := 'PEOPLE_UPDATE_CODE_EDBO';
                        SyncStorProc.Transaction.StartTransaction;
                        SyncStorProc.Prepare;

                        SyncStorProc.ParamByName('Id_Man').AsInteger := DSetPeople['Id_Man'];
                        SyncStorProc.ParamByName('Id_Person_Edbo').AsInteger := MemoryData_EDBO['FId_Person'];
                        SyncStorProc.ParamByName('Person_Code_U_Edbo').AsString := MemoryData_EDBO['FPersonCodeU'];

                        try
                            SyncStorProc.ExecProc;
                            SyncStorProc.Transaction.Commit;

                            WasSync := True; //не забываем поставить флаг в труъ
                        except on E: Exception do
                            begin
                                ShowMessage(E.Message);
                                SyncStorProc.Transaction.Rollback;
                            end;
                        end;

                        //идем на последнюю запись, чтоб не искать больше совпадений
                        MemoryData_EDBO.Last;
                    end;
                    MemoryData_EDBO.Next;
                end;
                //делаем конкатенацией, чтобы не потерять сообщение о пустой дате рождения, если оно было.
                TextMessage := TextMessage + 'Не знайдено відповідностей за датою народження. ';

            end;

            if not WasSync then
            begin
                //инсертим в табличку проблемных людей
                SaveNotFoundPeople(DSetPeople['Id_Man'], FioMask, TextMessage);
            end;

            if MemoryData_EDBO.Active then
            begin
                MemoryData_EDBO.Close;
                MemoryData_EDBO.EmptyTable;
                MemoryData_EDBO.Open;
            end
            else
                MemoryData_EDBO.EmptyTable;
        except on E: Exception do
            begin
                showmessage(E.Message);
            end;
        end;

        DSetPeople.Next;
    end;

    MemoryData_EDBO.Close;
    MemoryData_EDBO.Free;
    CloseWaitForm(WaitForm);
    if ZShowMessage('Увага', 'Синхронізацію виконано! Бажаєте отримати дані за тими студентами, для яких не вдалося встановити зв''''язок з ЄДБО?',
        mtConfirmation, [mbYes, MbNo]) = mrYes then
        ShowExportDialog(Self);
end;

procedure TfSpPeople.ShowExportDialog(Sender: TObject);
var
    fXl: TExcelApplication;
    lcid: cardinal;
    R, C, i: integer;
    ASheet: _Worksheet;
    vData: Variant;
    nRec, nf: integer;
    DoLoad: boolean;
    NotCloneGet: TpFibDataSet;
    WaitForm: TForm;
    s: string;
begin

    NotCloneGet := TpFIBDataSet.Create(Self);
    NotCloneGet.Database := DB;
    NotCloneGet.Transaction := ReadTransaction;
    ReadTransaction.StartTransaction;
    NotCloneGet.Close;
    NotCloneGet.SQLs.SelectSQL.Text := 'SELECT * FROM CS_SYNC_KOD_EDBO_EXC_SEL';
    NotCloneGet.Open;
    NotCloneGet.FetchAll;

    if NotCloneGet.IsEmpty then
    begin
        ShowMessage('Немає людей, для яких синхронізація була неуспішною!');
        exit;
    end;

    DoLoad := true;
    SaveDialog1.Execute;

    while ((SaveDialog1.FileName = '') and DoLoad) do
    begin
        if ZShowMessage('Увага',
            'Для вивантаження даних потрібно вказати назву файла! Якщо бажаєте обрати файл, натисніть "Так", для скасування вивантаження даних натисніть "Ні"',
            mtConfirmation, [mbYes, MbNo]) = mrYes then
        begin
            SaveDialog1.Execute;
        end
        else
            DoLoad := false;
    end;

    if DoLoad = false then
        exit; //не хотят выгружать данные, ну и не надо, уходим отсюда

    WaitForm := ShowWaitForm(Self);
    lcid := GetUserDefaultLCId; //
    fXL := TExcelApplication.Create(nil);
    try
        fXL.ConnectKind := ckNewInstance;
        fXl.Application.AutomationSecurity := 1;
        fXL.DisplayAlerts[lcid] := False;
        fXL.AutoQuit := false;
        fXL.Visible[lcid] := false;
        fXL.Connect;
        fXl.Workbooks.Add(1, lcid);
        nf := 0;
        nf := NotCloneGet.FieldCount;

        vData := VarArrayCreate([0, NotCloneGet.RecordCount, 1, nf], varVariant);
        i := 1;
        for C := 0 to NotCloneGet.FieldCount - 1 do
        begin
            vData[0, i] := NotCloneGet.FieldList.Fields[C].FieldName;
            Inc(i);
        end;
        nRec := NotCloneGet.RecNo;
        NotCloneGet.DisableControls;
        NotCloneGet.First;
        R := 1;
        while not NotCloneGet.Eof do
        begin
            C := 0;
            for i := 0 to NotCloneGet.FieldCount - 1 do
            begin
                Inc(C);
                vData[R, C] := NotCloneGet.Fields[i].AsVariant;
            end;
            Inc(R);
            NotCloneGet.Next;
        end;
        ASheet := (fXL.ActiveWorkbook.ActiveSheet as _Worksheet);
        with ASheet do
            with Range['A1', Cells.Item[NotCloneGet.RecordCount + 1, nf]] do
                Formula := vData;
        fXl.UserControl := false;
        ASheet.SaveAs(SaveDialog1.FileName, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
            EmptyParam);
        fXL.Quit;
        fXL.Disconnect;
        FreeAndNil(fXL);
        NotCloneGet.RecNo := nRec;
        NotCloneGet.EnableControls;
        showmessage('Експорт виконано!');
    except on E: Exception do
        begin
            ShowMessage(E.Message);
        end;
    end;
    NotCloneGet.Close;
    NotCloneGet.Free;
    CloseWaitForm(WaitForm);
end;

end.

