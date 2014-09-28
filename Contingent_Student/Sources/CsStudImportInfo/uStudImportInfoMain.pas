unit uStudImportInfoMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ucs_Types, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,uCS_Constants,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ExtCtrls, AppEvnts, AppStruClasses,
   uCS_Resources, uCS_WaitForm,RxMemDS, FIBDataSet, pFIBDataSet, ComCtrls,
  StdCtrls,pFIBStoredProc, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel,
  Gauges;

type
  TfmStudImportInfo = class(TForm)
    Panel1: TPanel;
    cxGridOrdersEDBO: TcxGrid;
    cxGridOrdersEDBODBTableView1: TcxGridDBTableView;
    col_FIO: TcxGridDBColumn;
    col_Facul: TcxGridDBColumn;
    col_Spec: TcxGridDBColumn;
    col_Kurs: TcxGridDBColumn;
    col_Datebeg: TcxGridDBColumn;
    cxGridOrdersEDBOLevel1: TcxGridLevel;
    Panel2: TPanel;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton_Refresh: TdxBarLargeButton;
    dxBarLargeButton_GetDataFromEDBO: TdxBarLargeButton;
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
    Panel3: TPanel;
    Label2: TLabel;
    col_Form: TcxGridDBColumn;
    col_cat: TcxGridDBColumn;
    ComboBoxSeason: TcxLookupComboBox;
    LabelSeason: TcxLabel;
    ProgressBar: TGauge;
    procedure dxBarLargeButton_RefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton_GetDataFromEDBOClick(Sender: TObject);
  private
    FInicFormCaption: string;
  //  ResultArray: TAArray;
    CanConnectToEdbo: Boolean;
    University_Code_U: AnsiString;
    EDBOGuidesIntf: TFMASAppModule;
    EDBOPersonIntf: TFMASAppModule;
   // PBForm: TForm_cs_Orders_ProgressBar;
    procedure InitCaptions;
    procedure SetInicFormCaption(const Value: string);
    function MyCsConnectToEdbo: Boolean;
  public
      res:Variant;
      IndLangVWF: Integer;
      TextViewColorVWF: TColor;
      ID_User_Global: Int64;
      User_Name_Global: string;
      IdCountryEdbo: Integer;
      id_order : int64;
      function GetOrder: Boolean;
      function GetPeopleFromOrder: Boolean; //забрать информацию по людям из приказа в нашу базу
      function SyncDataWithEdbo(IdPerson: Integer; Familiya, Imya: string; Otchestvo : variant; PersonCodeU:string; NumberPass, SeriaPass,
      DateBegPass, PassVidan: variant; IdSex: Integer; BirthDate: TDate; Inn: variant; IsResident: Integer): Boolean;
      property InicFormCaption: string read FInicFormCaption write SetInicFormCaption;
      procedure ApplyFilter;
      function GetStudInfoFromEdbo: Boolean;
      function GetPersonDocument(PersonCodeU: AnsiString; NumDocument: Integer): Variant;
      function GetPersonAdresses(PersonCodeU: AnsiString): variant;
       /// property InicFormCaption: string read FInicFormCaption write SetInicFormCaption;
       constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

var
  fmStudImportInfo: TfmStudImportInfo;

implementation

uses DM_StudImportInfo, FIBQuery;

{$R *.dfm}
constructor  TfmStudImportInfo.Create(AParameter:TcsParamPacks);
var
     MemoryDataEdbo: TRxMemoryData;
     i, j, add : integer;
     ActualDate : string;
     Id_Language, Id_PersonRequestSeasons, OnlyActive, Id_PersonEducationForm, max : integer;
begin
    Screen.Cursor := crHourGlass;

    inherited Create(AParameter.Owner);
    InitCaptions;

    DM := TDM.Create(Self);
    DM.DB.Handle:=AParameter.DB_Handle;
    DM.DB.Connected := True;
    ID_User_Global := AParameter.ID_User;
    WindowState := wsMaximized;
    IndLangVWF := 0;
    cxGridOrdersEDBODBTableView1.DataController.DataSource := DM.DSource_EdboStud;
    add := 0;
    if MyCsConnectToEdbo then
    begin
        if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DM.DB.Handle) then
        begin
            MemoryDataEdbo := TRxMemoryData.Create(Self);
            (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonRequestSeasonsGet', MemoryDataEdbo);
            try
                    MemoryDataEdbo.Open;
                    MemoryDataEdbo.First;
                except on E: Exception do Showmessage(E.Message);
            end;
            DM.MemoryDataSeasons.Close;
            DM.MemoryDataSeasons.EmptyTable;
            DM.MemoryDataSeasons.Open;
            max :=  -1;
            while i<MemoryDataEdbo.RecordCount - 1 do
            begin
                if(i<>0) then
                begin
                DM.MemoryDataSeasons.First;
                for j:=0 to DM.MemoryDataSeasons.RecordCount - 1 do
                begin
                   if((DM.MemoryDataSeasons['Id_PersonRequestSeasons']=MemoryDataEdbo['FId_PersonRequestSeasons']) and
                     (DM.MemoryDataSeasons['NameSeasons']=MemoryDataEdbo['FName'])) then
                   begin
                     DM.MemoryDataSeasons.Next;
                   end
                   else
                   begin
                     add :=1;
                      i := MemoryDataEdbo.RecordCount - 1;
                   end;
                end;
                end;
                if(add=1)or(i=0) then
                begin
                    DM.MemoryDataSeasons.Insert;
                    DM.MemoryDataSeasons.FieldByName('Id_PersonRequestSeasons').AsInteger := MemoryDataEdbo['FId_PersonRequestSeasons'];
                    DM.MemoryDataSeasons.FieldByName('NameSeasons').AsString := MemoryDataEdbo['FName'];

                    DM.MemoryDataSeasons.Post;
                    if(max < MemoryDataEdbo['FId_PersonRequestSeasons']) then max := MemoryDataEdbo['FId_PersonRequestSeasons'];
                    add :=0;
                end;
                MemoryDataEdbo.Next;
                i := i+1;
            end;
        end
    else csMessageDlg('Увага', 'Не було встановлено підключення до ЄДБО!', mtWarning, [mbOk], IndLangVWF);
    end
    else
    begin
        csMessageDlg('Увага', 'Подальша робота неможлива, не вдалося встановити зв''''язок з ЄДБО', mtError, [mbOK], IndLangVWF);
        exit;
    end;
   ComboBoxSeason.Properties.ListSource:=DM.DataSourceSeason;
   ComboBoxSeason.Properties.KeyFieldNames  := 'Id_PersonRequestSeasons';
   ComboBoxSeason.Properties.ListFieldNames := 'NameSeasons';

   ComboBoxSeason.EditValue := max;;

    Screen.Cursor:=crDefault;
end;

procedure TfmStudImportInfo.InitCaptions;
begin
    Caption := nFormImportStud[IndLangVWF];
    dxBarLargeButton_Refresh.Caption := nAction_GetDataFromEDBO[IndLangVWF];
    dxBarLargeButton_GetDataFromEDBO.Caption := ndxBtnImportStud[IndLangVWF];

    dxBarLargeButton_Refresh.Hint := nHint_GetDataFromEDBO[IndLangVWF];
    dxBarLargeButton_GetDataFromEDBO.Hint := nHint_UpdDataFromEDBO[IndLangVWF];

    col_FIO.Caption := nFIO[IndLangVWF];
    col_Facul.Caption := nFacul[IndLangVWF];
    col_Spec.Caption := nSpeciality[IndLangVWF];
    col_Kurs.Caption := nKurs[IndLangVWF];
    col_datebeg.Caption := nDateFrom[IndLangVWF];
    col_form.Caption := nFormEduc[IndLangVWF];
    col_cat.Caption := nKatEduc[IndLangVWF];
    LabelSeason.Caption := nSeason[IndLangVWF];
end;

procedure TfmStudImportInfo.SetInicFormCaption(
    const Value: string);
begin
    FInicFormCaption := Value;
    InitCaptions;
end;

function TfmStudImportInfo.MyCsConnectToEdbo: Boolean;
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
                csMessageDlg('Увага!', 'Помилка при роботі з модулем взаємодії з ЄДБО', mtInformation, [mbOk], IndLangVWF);
                Result := False;
            end;
       //Экземпляр для работы с веб-сервисом EDBOPerson
            EDBOPersonIntf := CreateFMASModule(path_str, 'EDBOIntf');
            if (EDBOPersonIntf = nil)
                then begin
                csMessageDlg('Увага!', 'Помилка при роботі з модулем взаємодії з ЄДБО', mtInformation, [mbOk], IndLangVWF);
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

function TfmStudImportInfo.GetStudInfoFromEdbo: Boolean;
var
    ActualDate: TDateTime;
    UniversityKode: AnsiString;
    Id_PersonRequestSeasons: integer;
    Id_PersonEducationHistoryOrders: Integer;
    Id_AcademicYear: Integer;
    PersonCode : string;
    Filter: AnsiString;
    MemoryData_EDBO: TRxMemoryData;
    MemoryDataPeople_EDBO: TRxMemoryData;
    id_perosn: integer;
    UseFilter: Boolean;
    FIOMask,DocumentSeries,DocumentNumber,FMiddleName :string;
    PersonDocument: Variant;
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


    if UseFilter then
    begin
        //Result := False;
    end
    else
    begin

        EDBOPersonIntf.InParams.Items['UniversityKode'] := PAnsiString(@University_Code_U);

        Id_PersonRequestSeasons := ComboBoxSeason.EditValue;
        EDBOPersonIntf.InParams.Items['Id_PersonRequestSeasons'] := PInteger(@Id_PersonRequestSeasons);


        MemoryData_Edbo := TRxMemoryData.Create(Self);

        (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonEducationsFullGet', MemoryData_EDBO);

        try
            MemoryData_EDBO.Open;
            MemoryData_EDBO.First;
        except on E: Exception do Showmessage(E.Message);
        end;

        DM.RxMem_EdboStud.Close;
        DM.RxMem_EdboStud.EmptyTable;
        DM.RxMem_EdboStud.Open;

        MemoryDataPeople_EDBO := TRxMemoryData.Create(Self);

        for i := 0 to MemoryData_EDBO.RecordCount - 1 do
        begin
        if(MemoryData_EDBO['FId_PersonEducationHistoryOrders']=0)  then
        begin
            try
                FIOMask := '';
                EDBOPersonIntf.InParams.Items['FIOMask'] := PAnsiString(@FIOMask);
                DocumentSeries := '';
                EDBOPersonIntf.InParams.Items['DocumentSeries'] := PAnsiString(@DocumentSeries);
                DocumentNumber := '';
                EDBOPersonIntf.InParams.Items['DocumentNumber'] := PAnsiString(@DocumentNumber);

                PersonCode := MemoryData_EDBO['FPersonCodeU'];
                EDBOPersonIntf.InParams.Items['PersonCodeU'] := PAnsiString(@PersonCode);

                (EDBOPersonIntf as IEDBOTools).GetXMLDataFromService('PersonsFind', MemoryDataPeople_EDBO);

                MemoryDataPeople_EDBO.Open;
                MemoryDataPeople_EDBO.First;

                DM.RxMem_EdboStud.Insert;
                DM.RxMem_EdboStud.FieldByName('Id_PersonEducation').AsInteger := MemoryData_EDBO['FId_Education'];

                PersonDocument := GetPersonDocument(PersonCode, 5);
                if (not VarIsNull(PersonDocument)) then DM.RxMem_EdboStud.FieldByName('Inn').AsString := PersonDocument[1]
                else DM.RxMem_EdboStud.FieldByName('Inn').AsString := '';

                if(not varisnull(MemoryDataPeople_EDBO['FFirstName'])) then
                    DM.RxMem_EdboStud.FieldByName('FirstName').AsString := MemoryDataPeople_EDBO['FFirstName']
                else DM.RxMem_EdboStud.FieldByName('FirstName').AsString := '';

                if(not varisnull(MemoryDataPeople_EDBO['FLastName'])) then
                    DM.RxMem_EdboStud.FieldByName('LastName').AsString := MemoryDataPeople_EDBO['FLastName']
                else DM.RxMem_EdboStud.FieldByName('LastName').AsString := '';

                if(not varisnull(MemoryDataPeople_EDBO['FPasportNumber'])) then
                    DM.RxMem_EdboStud.FieldByName('PasportNumber').AsString := MemoryDataPeople_EDBO['FPasportNumber']
                else DM.RxMem_EdboStud.FieldByName('PasportNumber').AsString := '';

                if(not varisnull(MemoryDataPeople_EDBO['FPasportSeries'])) then
                    DM.RxMem_EdboStud.FieldByName('PasportSeries').AsString := MemoryDataPeople_EDBO['FPasportSeries']
                else DM.RxMem_EdboStud.FieldByName('PasportSeries').AsString := '';

                if(not varisnull(MemoryDataPeople_EDBO['FPasportIssued'])) then
                    DM.RxMem_EdboStud.FieldByName('PasportIssued').AsString := MemoryDataPeople_EDBO['FPasportIssued']
                else DM.RxMem_EdboStud.FieldByName('PasportIssued').AsString := '';

                if(not varisnull(MemoryDataPeople_EDBO['FId_Person'])) then
                    DM.RxMem_EdboStud.FieldByName('Id_Person').AsInteger := MemoryDataPeople_EDBO['FId_Person']
                else DM.RxMem_EdboStud.FieldByName('Id_Person').AsInteger := 0;

                if(not varisnull(MemoryDataPeople_EDBO['FPasportDate'])) then
                    DM.RxMem_EdboStud.FieldByName('PasportDate').AsDateTime := MemoryDataPeople_EDBO['FPasportDate']
                else DM.RxMem_EdboStud.FieldByName('PasportDate').AsVariant := Null;

                 if(not varisnull(MemoryDataPeople_EDBO['FId_PersonSex'])) then
                    DM.RxMem_EdboStud.FieldByName('Id_PersonSex').AsInteger := MemoryDataPeople_EDBO['FId_PersonSex']
                else DM.RxMem_EdboStud.FieldByName('Id_PersonSex').AsInteger := 0;

                 if(not varisnull(MemoryDataPeople_EDBO['FBirthday'])) then
                    DM.RxMem_EdboStud.FieldByName('Birthday').AsDateTime := MemoryDataPeople_EDBO['FBirthday']
                else DM.RxMem_EdboStud.FieldByName('Birthday').AsVariant := Null;

                if(not varisnull(MemoryData_EDBO['FId_PersonEducationForm'])) then
                    DM.RxMem_EdboStud.FieldByName('Id_PersonEducationForm').AsInteger := MemoryData_EDBO['FId_PersonEducationForm']
                else DM.RxMem_EdboStud.FieldByName('Id_PersonEducationForm').AsInteger := 0;

                if(not varisnull(MemoryDataPeople_EDBO['FResident'])) then
                    DM.RxMem_EdboStud.FieldByName('Resident').AsInteger := MemoryDataPeople_EDBO['FResident']
                else DM.RxMem_EdboStud.FieldByName('Resident').AsInteger := 0;

                if(not varisnull(MemoryData_EDBO['FPersonEducationFormName'])) then
                DM.RxMem_EdboStud.FieldByName('PersonEducationFormName').AsString := MemoryData_EDBO['FPersonEducationFormName']
                else DM.RxMem_EdboStud.FieldByName('PersonEducationFormName').AsString := '';

                if(not varisnull(MemoryData_EDBO['FPersonEducationDateBegin'])) then
                DM.RxMem_EdboStud.FieldByName('PersonEducationDateBegin').AsDateTime := MemoryData_EDBO['FPersonEducationDateBegin']
                else DM.RxMem_EdboStud.FieldByName('PersonEducationDateBegin').AsVariant := Null;

                if(not varisnull(MemoryData_EDBO['FPersonEducationDateEnd'])) then
                DM.RxMem_EdboStud.FieldByName('PersonEducationDateEnd').AsDateTime := MemoryData_EDBO['FPersonEducationDateEnd']
                else DM.RxMem_EdboStud.FieldByName('PersonEducationDateEnd').AsVariant := Null;

                if(not varisnull(MemoryData_EDBO['FPersonCodeU'])) then
                     DM.RxMem_EdboStud.FieldByName('PersonCodeU').AsString := MemoryData_EDBO['FPersonCodeU']
                else DM.RxMem_EdboStud.FieldByName('PersonCodeU').AsString := '';

                if(not varisnull(MemoryData_EDBO['FUniversityFacultetKode'])) then
                    DM.RxMem_EdboStud.FieldByName('UniversityFacultetKode').AsString := MemoryData_EDBO['FUniversityFacultetKode']
                else DM.RxMem_EdboStud.FieldByName('UniversityFacultetKode').AsString := '';

                if(not varisnull(MemoryData_EDBO['FUniversityFacultetFullName'])) then
                    DM.RxMem_EdboStud.FieldByName('UniversityFacultetFullName').AsString := MemoryData_EDBO['FUniversityFacultetFullName']
                else DM.RxMem_EdboStud.FieldByName('UniversityFacultetFullName').AsString := '';

                if(not varisnull(MemoryData_EDBO['FQualificationName'])) then
                DM.RxMem_EdboStud.FieldByName('QualificationName').AsString := MemoryData_EDBO['FQualificationName']
                else DM.RxMem_EdboStud.FieldByName('QualificationName').AsString := '';

                if(VarIsNull(MemoryDataPeople_EDBO['FMiddleName'])) then
                     DM.RxMem_EdboStud.FieldByName('MiddleName').AsString := ''
                else
                     DM.RxMem_EdboStud.FieldByName('MiddleName').AsString := MemoryDataPeople_EDBO['FMiddleName'];
                DM.RxMem_EdboStud.FieldByName('FIO').AsString :=DM.RxMem_EdboStud['LastName'] + ' ' + DM.RxMem_EdboStud['FirstName'] + ' ' + vartostr(DM.RxMem_EdboStud.FieldByName('MiddleName').AsVariant);
                if(not varisnull(MemoryData_EDBO['FId_PersonEducationHistoryOrders'])) then
                     DM.RxMem_EdboStud.FieldByName('Id_PersonEducationHistoryOrders').AsInteger := MemoryData_EDBO['FId_PersonEducationHistoryOrders']
                else DM.RxMem_EdboStud.FieldByName('Id_PersonEducationHistoryOrders').AsInteger := 0;

                if(not varisnull(MemoryData_EDBO['FPersonEducationHistoryOrdersNumber'])) then
                     DM.RxMem_EdboStud.FieldByName('PersonEducationHistoryOrdersNum').AsString := MemoryData_EDBO['FPersonEducationHistoryOrdersNumber']
                else DM.RxMem_EdboStud.FieldByName('PersonEducationHistoryOrdersNum').AsString := '';

                if(not varisnull(MemoryData_EDBO['FPersonEducationHistoryOrdersDate'])) then
                     DM.RxMem_EdboStud.FieldByName('PersonEducationHistoryOrdDate').AsDateTime := MemoryData_EDBO['FPersonEducationHistoryOrdersDate']
                else DM.RxMem_EdboStud.FieldByName('PersonEducationHistoryOrdDate').AsDateTime := strtodate('31.12.9999');

                if(not varisnull(MemoryData_EDBO['FUniversityGroupFullName'])) then
                DM.RxMem_EdboStud.FieldByName('UniversityGroupFullName').AsString := MemoryData_EDBO['FUniversityGroupFullName']
                else DM.RxMem_EdboStud.FieldByName('UniversityGroupFullName').AsString := '';

                if(not varisnull(MemoryData_EDBO['FSpecSpecialityName'])) then
                DM.RxMem_EdboStud.FieldByName('SpecSpecialityName').AsString := MemoryData_EDBO['FSpecSpecialityName']
                else DM.RxMem_EdboStud.FieldByName('SpecSpecialityName').AsString := '';

                if(not varisnull(MemoryData_EDBO['FId_PersonEducationPaymentType'])) then
                     DM.RxMem_EdboStud.FieldByName('Id_PersonEducationPaymentType').AsInteger := MemoryData_EDBO['FId_PersonEducationPaymentType']
                else DM.RxMem_EdboStud.FieldByName('Id_PersonEducationPaymentType').AsInteger := 0;

                if(not varisnull(MemoryData_EDBO['FId_Course'])) then
                     DM.RxMem_EdboStud.FieldByName('Id_Course').AsInteger := MemoryData_EDBO['FId_Course']
                else DM.RxMem_EdboStud.FieldByName('Id_Course').AsInteger := 0;

                if(not varisnull(MemoryData_EDBO['FId_Qualification'])) then
                     DM.RxMem_EdboStud.FieldByName('Id_Qualification').AsInteger := MemoryData_EDBO['FId_Qualification']
                else DM.RxMem_EdboStud.FieldByName('Id_Qualification').AsInteger := 0;

                if(not varisnull(MemoryData_EDBO['FSpecCode'])) then
                     DM.RxMem_EdboStud.FieldByName('SpecCode').AsString := MemoryData_EDBO['FSpecCode']
                else DM.RxMem_EdboStud.FieldByName('SpecCode').AsString := '';

                if(not varisnull(MemoryData_EDBO['FIsSecondHigher'])) then
                    DM.RxMem_EdboStud.FieldByName('IsSecondHigher').AsInteger := MemoryData_EDBO['FIsSecondHigher']
                else DM.RxMem_EdboStud.FieldByName('IsSecondHigher').AsString := '';

                if(not varisnull(MemoryData_EDBO['FId_UniversityGroup'])) then
                     DM.RxMem_EdboStud.FieldByName('Id_UniversityGroup').AsInteger := MemoryData_EDBO['FId_UniversityGroup']
                else DM.RxMem_EdboStud.FieldByName('Id_UniversityGroup').AsInteger := 0;

                if(not varisnull(MemoryData_EDBO['FId_PersonEducationHistoryType'])) then
                     DM.RxMem_EdboStud.FieldByName('Id_PersonEducationHistoryType').AsInteger := MemoryData_EDBO['FId_PersonEducationHistoryType']
                else DM.RxMem_EdboStud.FieldByName('Id_PersonEducationHistoryType').AsInteger := 0;

               DM.RxMem_EdboStud.Post;
            except on E: Exception do
                begin
                    exit;
                end;
            end;
            MemoryDataPeople_EDBO.Close;
            MemoryDataPeople_EDBO.EmptyTable;
            MemoryData_EDBO.Next;
           end else
           begin
               MemoryData_EDBO.Next;
           end;

        end;
        cxGridOrdersEDBODBTableView1.DataController.KeyFieldNames := '';
        DM.DSource_EdboStud.DataSet := DM.RxMem_EdboStud;
        MemoryData_EDBO.Close;
        MemoryData_EDBO.Free;
        PubSysDataDSet.Free;
    end;
end;

procedure TfmStudImportInfo.ApplyFilter;
var
    WaitForm: TForm;
begin
    if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DM.DB.Handle) then
    begin
        WaitForm := ShowWaitForm(Self);
        GetStudInfoFromEdbo;
        CloseWaitForm(WaitForm);
    end
    else csMessageDlg('Увага', 'Не було встановлено підключення до ЄДБО!', mtWarning, [mbOk], IndLangVWF);
end;


procedure TfmStudImportInfo.dxBarLargeButton_RefreshClick(Sender: TObject);
begin
    if DM.RxMem_EdboStud.Active then
    begin
        DM.RxMem_EdboStud.Close;
        DM.RxMem_EdboStud.EmptyTable;
        DM.RxMem_EdboStud.Open;
    end
    else
        DM.RxMem_EdboStud.EmptyTable;
    ApplyFilter;
end;

procedure TfmStudImportInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfmStudImportInfo.dxBarLargeButton_GetDataFromEDBOClick(
  Sender: TObject);
var
     i, pos: integer;
begin
    if DM.RxMem_EdboStud.IsEmpty then
    begin
        csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgEmptyOrdersEDBO[IndLangVWF], mtWarning, [mbOk], IndLangVWF);
        exit;
    end;
    if (EDBOPersonIntf as IEDBOTools).InitEDBOConnection('EDBOPerson', DM.DB.Handle) then
    begin
        ProgressBar.MaxValue:=DM.RxMem_EdboStud.RecordCount;
        pos:=0;
        i :=0;
        Panel3.Update;
        DM.RxMem_EdboStud.First;
        while i<DM.RxMem_EdboStud.RecordCount do
        begin
            i:=i+1;
            Label2.Caption := DM.RxMem_EdboStud['FIO'];
            try
            begin
                GetOrder;
                GetPeopleFromOrder;
                DM.RxMem_EdboStud.Next;
                pos:=i;
                ProgressBar.Progress:=pos;
            end;
            except on E: Exception do
            begin
            end;
            end
        end;
       // pos:=0;
       // Panel3.Update;
       // ProgressBar.Progress:=0;
    end
    else csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorConnectEDBO[IndLangVWF] + #10#13 + nMsgToAdmin[IndLangVWF], mtWarning, [mbOk], IndLangVWF);
    end;

function TfmStudImportInfo.GetOrder: Boolean;
begin
    result := False;
    DM.StorProc.Transaction.StartTransaction;
    DM.StorProc.StoredProcName := 'CS_ORDER_FROM_EDBO_INS';
    DM.StorProc.Prepare;

    DM.StorProc.ParamByName('ID_ORDER_EDBO').AsInteger := DM.RxMem_EdboStud.FieldByName('Id_PersonEducationHistoryOrders').AsInteger;
    DM.StorProc.ParamByName('ID_USER').AsInt64 := ID_User_Global;
    DM.StorProc.ParamByName('ID_ORDER_TYPE').AsInteger :=  DM.RxMem_EdboStud.FieldByName('Id_PersonEducationHistoryType').AsInteger;
    DM.StorProc.ParamByName('NUM_ORDER').AsString := DM.RxMem_EdboStud.FieldByName('PersonEducationHistoryOrdersNum').AsString;
    DM.StorProc.ParamByName('DATE_ORDER').AsDateTime := DM.RxMem_EdboStud.FieldByName('PersonEducationHistoryOrdDate').AsDateTime;

    try
        DM.StorProc.ExecProc;
        id_order := DM.StorProc.ParamByName('ID_ORDER').AsInt64;
        DM.StorProc.Transaction.Commit;
        result := True;
        DM.RxMem_EdboStud.Edit;
        DM.RxMem_EdboStud.FieldByName('Is_SyncWithDB').AsBoolean := True;
        DM.RxMem_EdboStud.Post;
    except on E: Exception do
        begin
            csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
            Result := False;
            DM.StorProc.Transaction.Rollback;
            exit;
        end;
    end;
end;

function TfmStudImportInfo.GetPeopleFromOrder: Boolean;
var
    ActualDate: TDateTime;
    UniversityKode: AnsiString;
    PersonCodeU: AnsiString;
    Id_PersonEducation: integer;
    Id_PersonEducationHistoryOrderStatus: Integer;
    Id_AcademicYear: Integer;
    Filter: AnsiString;
    MemoryDataHistoryEducation_Edbo: TRxMemoryData;
    UseFilter: Boolean;
    man_count, educ_history_count: Integer;
    StorProcDelEduc: TpFIBStoredProc;
    StorProcInfoInsert: TpFibStoredProc;
    StorProcOrderIns: TpFibStoredProc;
begin
    Result := True;
    try
        DM.WriteTransaction.StartTransaction;

        StorProcDelEduc := TpFIBStoredProc.Create(Self);
        StorProcDelEduc.Database := DM.DB;
        StorProcDelEduc.Transaction := DM.WriteTransaction;

        StorProcInfoInsert := TpFIBStoredProc.Create(Self);
        StorProcInfoInsert.Database := DM.DB;
        StorProcInfoInsert.Transaction := DM.WriteTransaction;
        Id_PersonEducation := DM.RxMem_EdboStud['Id_PersonEducation'];
        PersonCodeU        := DM.RxMem_EdboStud['PersonCodeU'];

        result := SyncDataWithEdbo(DM.RxMem_EdboStud.FieldByName('Id_Person').AsVariant, DM.RxMem_EdboStud.FieldByName('LastName').AsVariant,
        DM.RxMem_EdboStud.FieldByName('FirstName').AsVariant,DM.RxMem_EdboStud.FieldByName('MiddleName').AsVariant, PersonCodeU,
        DM.RxMem_EdboStud.FieldByName('PasportNumber').AsVariant,DM.RxMem_EdboStud.FieldByName('PasportSeries').AsVariant,
        DM.RxMem_EdboStud.FieldByName('PasportDate').AsVariant,
        DM.RxMem_EdboStud.FieldByName('PasportIssued').AsVariant, DM.RxMem_EdboStud.FieldByName('Id_PersonSex').AsVariant, DM.RxMem_EdboStud.FieldByName('Birthday').AsVariant,
        DM.RxMem_EdboStud.FieldByName('Inn').AsVariant, DM.RxMem_EdboStud.FieldByName('Resident').AsVariant);

        
        if result = False then
        begin
            csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF], mtInformation, [mbOk], IndLangVWF);
            exit;
        end;
        StorProcDelEduc.StoredProcName := 'CS_DT_STUD_DEL_BY_PERSON_EDUC';
        StorProcDelEduc.Prepare;
        StorProcDelEduc.ParamByName('ID_PERSON_EDUCATION').AsInteger := Id_PersonEducation;
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
            StorProcInfoInsert.StoredProcName := 'CS_DT_STUD_INFO_INSERT';
            StorProcInfoInsert.Prepare;
            StorProcInfoInsert.ParamByName('PERSON_CODE').AsString := MemoryDataHistoryEducation_Edbo['FPersonCodeU'];
            StorProcInfoInsert.ParamByName('DATE_BEG').AsDateTime := MemoryDataHistoryEducation_Edbo['FPersonEducationHistoryDateBegin'];

            if VarIsNull(MemoryDataHistoryEducation_Edbo['FPersonEducationHistoryDateEnd']) then
                StorProcInfoInsert.ParamByName('DATE_END').AsDateTime := EncodeDate(9999, 12, 31)
            else
            begin
                if MemoryDataHistoryEducation_Edbo['FPersonEducationHistoryDateEnd'] < StrToDate('01.01.1900') then
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
            StorProcInfoInsert.ParamByName('ID_ORDER').AsInt64 := id_order;

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
            MemoryDataHistoryEducation_Edbo.Next;

       end;
      MemoryDataHistoryEducation_Edbo.Close;
      MemoryDataHistoryEducation_Edbo.Free;
          //  end;
       // end;

      if Result = True
          then DM.WriteTransaction.Commit
      else DM.WriteTransaction.Rollback;

    except on E: Exception do
        begin
            csMessageDlg(nMsgBoxTitle[IndLangVWF], nMsgErrorWithEDBO[IndLangVWF] + #10#13 + E.Message, mtInformation, [mbOk], IndLangVWF);
            Result := False;
        end;
    end;

    StorProcDelEduc.Free;
    StorProcInfoInsert.Free;
end;


function TfmStudImportInfo.SyncDataWithEdbo(IdPerson: Integer; Familiya, Imya: string; Otchestvo :variant; PersonCodeU : string; NumberPass, SeriaPass,
    DateBegPass, PassVidan: variant; IdSex: Integer; BirthDate: TDate; Inn: variant; IsResident: Integer): Boolean;
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
    Innstr,OtchestvoStr,NumberPassStr,SeriaPassStr,PassVidanStr : string;

begin
    Result := True;
    PersonCode  := DM.RxMem_EdboStud['PersonCodeU'];
    Innstr := vartostr(inn);
    OtchestvoStr :=vartostr(Otchestvo);
    NumberPassStr :=vartostr(NumberPass);
    SeriaPassStr :=vartostr(SeriaPass);
    PassVidanStr :=vartostr(PassVidan);

    try
        Res := GetPersonAdresses(PersonCodeU);
        DM.SyncStorProc.Transaction := DM.SyncTrans;
        DM.SyncStorProc.Transaction.StartTransaction;

        DM.SyncStorProc.StoredProcName := 'CN_WEB_PEOPLE_SYNC_WITH_EDBO';
        DM.SyncStorProc.Prepare;
        DM.SyncStorProc.ParamByName('Id_Person').AsInteger := DM.RxMem_EdboStud['Id_Person'];
        DM.SyncStorProc.ParamByName('FAMILIYA').AsString := Familiya;
        DM.SyncStorProc.ParamByName('IMYA').AsString := Imya;
        DM.SyncStorProc.ParamByName('OTCHESTVO').AsString := OtchestvoStr;
        DM.SyncStorProc.ParamByName('PERSON_CODE_U').AsString := PersonCodeU;
        DM.SyncStorProc.ParamByName('NUMBER_PASS').AsString := NumberPassStr;
        DM.SyncStorProc.ParamByName('SERIA_PASS').AsString := SeriaPassStr;
        if (DateBegPass < StrToDate('01.01.1900')) then
            DM.SyncStorProc.ParamByName('DATE_BEG_PASS').Value := null
        else DM.SyncStorProc.ParamByName('DATE_BEG_PASS').AsDate := DateBegPass;
        DM.SyncStorProc.ParamByName('VIDAN').AsString := PassVidanStr;
        DM.SyncStorProc.ParamByName('BIRTH_DATE').AsDate := BirthDate;
        DM.SyncStorProc.ParamByName('ID_SEX').AsInteger := IdSex;
        DM.SyncStorProc.ParamByName('KOATUU_CODE').AsString := VarToStr(Res[0]);
        DM.SyncStorProc.ParamByName('ID_STREET_TYPE').AsInteger := Res[1];
        DM.SyncStorProc.ParamByName('ADRESS').AsString := VarToStr(Res[2]);
        DM.SyncStorProc.ParamByName('HOME_NUMBER').AsString := VarToStr(Res[3]);
        DM.SyncStorProc.ParamByName('POST_INDEX').AsString := VarToStr(Res[4]);
        if (length(InnStr) = 10) then //10 cимволов ИНН
            DM.SyncStorProc.ParamByName('INN').AsVariant := inn;
        DM.SyncStorProc.ParamByName('IS_RESIDENT').AsInteger := DM.RxMem_EdboStud['Resident'];
        DM.SyncStorProc.ParamByName('PHONE_NUMBER').AsString := '';
        DM.SyncStorProc.ExecProc;
        Id_Man := DM.SyncStorProc.FieldByName('ID_MAN').AsInteger;
        DM.SyncStorProc.Transaction.Commit;
    except on E: Exception
        do begin
            ShowMessage(E.Message);
            DM.SyncStorProc.Transaction.Rollback;
            Result := False;
        end;
    end;
end;

function TfmStudImportInfo.GetPersonAdresses(PersonCodeU: AnsiString): variant;
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

function TfmStudImportInfo.GetPersonDocument(PersonCodeU: AnsiString; NumDocument: Integer): Variant;
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

            if (not varisnull(MemoryData_Edbo['FDocumentSeries'])) then
                Result[0] := MemoryData_Edbo['FDocumentSeries'];
            if (not varisnull(MemoryData_Edbo['FDocumentNumbers'])) then
                Result[1] := MemoryData_Edbo['FDocumentNumbers'];
            if (not varisnull(MemoryData_Edbo['FDocumentDateGet'])) then
                Result[2] := MemoryData_Edbo['FDocumentDateGet'];
            if (not varisnull(MemoryData_Edbo['FDocumentIssued'])) then
                Result[3] := MemoryData_Edbo['FDocumentIssued'];
            end;
            MemoryData_Edbo.Close;
            MemoryData_Edbo.Free;
    except on E: Exception
        do begin
            ShowMessage(E.Message);
            Result := null;
        end;
    end;
end;




end.
