unit SpPeople_ModForm;
{ Здесь есть переменная pManModified, указывающая на то, что данные лица изменены, если ИСТИНА.
 Потому при добавлении новых полей, относящихся к таблице People нужно в событии их редактирования
 присваивать этой переменной значение ИСТИНЫ, иначе ничего не сохранится.}
interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
    cxEdit, cxTextEdit, cxButtons, ComCtrls, cxDropDownEdit, cxCalendar,
    cxMaskEdit, IBase, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
    pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, ExtCtrls,
    cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, cxStyles,
    cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
    cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, cxGrid, ToolWin, Buttons,
    cxCheckBox, GlobalSPR, cxButtonEdit, uCommonSp, DBCtrls, SpPeople_Types,
    SpPeople_z_dmCommonStyles, PassEditUnit, cxLabel, cxDBLabel, UManFamilyEdit,
    ActnList, AccMgmt, cxImage, SpPeople_CardFrame;

const
    InsMan_Message = 'Для прийняття нових даних треба додати фізичну особу.' + #13 + 'Додати нову особу?';

type
    TfModifyMan = class(TForm)
        PeoplePageControl: TPageControl;
        MainPage: TTabSheet;
        OkButton: TcxButton;
        CancelButton: TcxButton;
        ManModProc: TpFIBStoredProc;
        GetIdManQuery: TpFIBDataSet;
        DSDetails: TpFIBDataSet;
        MainPanel: TPanel;
        PassPage: TTabSheet;
        ToolBar1: TToolBar;
        PasportGridDBTableView1: TcxGridDBTableView;
        PasportGridLevel1: TcxGridLevel;
        PasportGrid: TcxGrid;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        ViewButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        DSPassData: TpFIBDataSet;
        PassDataSourse: TDataSource;
        cmnFIO: TcxGridDBColumn;
        cmnSERIA: TcxGridDBColumn;
        cmnNUMBER: TcxGridDBColumn;
        cmnDATE_BEG: TcxGridDBColumn;
        cmnDATE_END: TcxGridDBColumn;
        ProcPassData: TpFIBStoredProc;
        Panel2: TPanel;
        ActualPaspCB: TcxCheckBox;
        GenearlInfoGroupBox: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        FamiliaEdit: TcxMaskEdit;
        ImyaEdit: TcxMaskEdit;
        OtchestvoEdit: TcxMaskEdit;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        RusFamEdit: TcxMaskEdit;
        RusImyaEdit: TcxMaskEdit;
        RusOtchEdit: TcxMaskEdit;
        SexBox: TcxComboBox;
        Label7: TLabel;
        Label8: TLabel;
        BirthDateEdit: TcxDateEdit;
        AdditionalBox: TGroupBox;
        CardNumItemLabel: TLabel;
        Label9: TLabel;
        TinEdit: TcxMaskEdit;
        SocCardNumEdit: TcxMaskEdit;
        AdressGroupBox: TGroupBox;
        Label10: TLabel;
        AdressEdit: TcxButtonEdit;
        BirthPlaceLabel: TLabel;
        BirthPlaceEdit: TcxButtonEdit;
        AdditionalPage: TTabSheet;
        PhonePage: TGroupBox;
        WorkPhoneNum: TLabel;
        WorkPhoneEdit: TcxTextEdit;
        HomePhoneLabel: TLabel;
        HomePhoneEdit: TcxTextEdit;
        DSFamily: TpFIBDataSet;
        FamilyDataSource: TDataSource;
        NationalityBox: TGroupBox;
        Label11: TLabel;
        DSNationality: TpFIBDataSet;
        NationalityDataSource: TDataSource;
        NationalityComboBox: TcxLookupComboBox;
        DSGetAdress: TpFIBDataSet;
        ClearCurAdrBtn: TcxButton;
        ClearBirthAdrBtn: TcxButton;
        Label12: TLabel;
        CopyFIOBtn: TSpeedButton;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        VidanDBText: TcxTextEdit;
        FamilyToolBar: TToolBar;
        FamilyAddBtn: TSpeedButton;
        FamilyModifyBtn: TSpeedButton;
        FamilyDelBtn: TSpeedButton;
        FamilyGrid: TcxGrid;
        FamilyTV: TcxGridDBTableView;
        FamilyTVFIO: TcxGridDBColumn;
        FamilyTVNAME_RELATION: TcxGridDBColumn;
        FamilyTVBIRTH_DATE: TcxGridDBColumn;
        FamilyGridLevel1: TcxGridLevel;
        PanelGroup: TPanel;
        FamilyRefreshBtn: TSpeedButton;
        StProcFamily: TpFIBStoredProc;
        HistWriteTransaction: TpFIBTransaction;
        StProcHist: TpFIBStoredProc;
        ActionList1: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        FotoImage: TcxDBImage;
        DBFoto: TpFIBDatabase;
        ReadTrFoto: TpFIBTransaction;
        DSetFoto: TpFIBDataSet;
        DSourceFoto: TDataSource;
        AddFotoBtn: TcxButton;
        SaveAsBtn: TcxButton;
        FotoPanel: TPanel;
        StProcFoto: TpFIBStoredProc;
        WriteTrFoto: TpFIBTransaction;
        DelFotoBtn: TcxButton;
        BankCardPage: TTabSheet;
        WithOutOtchestvoCB: TcxCheckBox;
        SaveDialog: TSaveDialog;
        FotoGrid: TcxGrid;
        FotoGridDBTableView1: TcxGridDBTableView;
        cmnID_FOTO: TcxGridDBColumn;
        cmnDATE_FOTO: TcxGridDBColumn;
        cmnACTUALWIDTH: TcxGridDBColumn;
        cmnACTUALHEIGHT: TcxGridDBColumn;
        FotoGridLevel1: TcxGridLevel;
        Label13: TLabel;
        Gromod: TcxButtonEdit;
        DSGetCountry: TpFIBDataSet;
        DSContryDef: TpFIBDataSet;
        DelFotoProc: TpFIBStoredProc;
        Label14: TLabel;
        LiveAdressEdit: TcxButtonEdit;
        ClearLiveAdrBtn: TcxButton;
        CopyBirthPlace: TSpeedButton;
        CopyAdressBtn: TSpeedButton;
    STProcPerevodFioRus: TpFIBStoredProc;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ActualPaspCBClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ViewButtonClick(Sender: TObject);
        procedure DSPassDataDATE_ENDGetText(Sender: TField;
            var Text: string; DisplayText: Boolean);
        procedure DeleteButtonClick(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure cxMaskEdit1PropertiesValidate(Sender: TObject;
            var DisplayValue: Variant; var ErrorText: TCaption;
            var Error: Boolean);
        procedure AdressEditPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure FamilyAddBtnClick(Sender: TObject);
        procedure FamilyDelBtnClick(Sender: TObject);
        procedure FamilyModifyBtnClick(Sender: TObject);
        procedure ClearCurAdrBtnClick(Sender: TObject);
        procedure ClearBirthAdrBtnClick(Sender: TObject);
        procedure CopyFIOBtnClick(Sender: TObject);
        procedure PasportGridDBTableView1CellClick(
            Sender: TcxCustomGridTableView;
            ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
            AShift: TShiftState; var AHandled: Boolean);
        procedure FamilyRefreshBtnClick(Sender: TObject);
        procedure HistWriteTransactionAfterStart(Sender: TObject);
        procedure ManEditEditing(Sender: TObject; var CanEdit: Boolean);
        procedure NationalityComboBoxPropertiesChange(Sender: TObject);
        procedure PasportGridDBTableView1KeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
        procedure FamilyTVKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FamiliaEditKeyPress(Sender: TObject; var Key: Char);
        procedure ImyaEditKeyPress(Sender: TObject; var Key: Char);
        procedure OtchestvoEditKeyPress(Sender: TObject; var Key: Char);
        procedure RusFamEditKeyPress(Sender: TObject; var Key: Char);
        procedure RusImyaEditKeyPress(Sender: TObject; var Key: Char);
        procedure RusOtchEditKeyPress(Sender: TObject; var Key: Char);
        procedure SexBoxKeyPress(Sender: TObject; var Key: Char);
        procedure BirthDateEditKeyPress(Sender: TObject; var Key: Char);
        procedure TinEditKeyPress(Sender: TObject; var Key: Char);
        procedure SocCardNumEditKeyPress(Sender: TObject; var Key: Char);
        procedure AdressEditKeyPress(Sender: TObject; var Key: Char);
        procedure BirthPlaceEditKeyPress(Sender: TObject; var Key: Char);
        procedure WorkPhoneEditKeyPress(Sender: TObject; var Key: Char);
        procedure HomePhoneEditKeyPress(Sender: TObject; var Key: Char);
        procedure NationalityComboBoxKeyPress(Sender: TObject; var Key: Char);
        procedure SaveAsBtnClick(Sender: TObject);
        procedure AddFotoBtnClick(Sender: TObject);
        procedure DelFotoBtnClick(Sender: TObject);
        procedure cmnDATE_FOTOGetDisplayText(Sender: TcxCustomGridTableItem;
            ARecord: TcxCustomGridRecord; var AText: string);
        procedure PeoplePageControlChange(Sender: TObject);
        procedure ManEditPropertiesValidate(Sender: TObject;
            var DisplayValue: Variant; var ErrorText: TCaption;
            var Error: Boolean);
        procedure GromodPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure GromodEditing(Sender: TObject; var CanEdit: Boolean);
        procedure FormShow(Sender: TObject);
        procedure RusFamEditEnter(Sender: TObject);
        procedure RusImyaEditEnter(Sender: TObject);
        procedure RusOtchEditEnter(Sender: TObject);
        procedure RusFamEditExit(Sender: TObject);
        procedure RusOtchEditExit(Sender: TObject);
        procedure RusImyaEditExit(Sender: TObject);
        procedure LiveAdressEditKeyPress(Sender: TObject; var Key: Char);
        procedure ClearLiveAdrBtnClick(Sender: TObject);
        procedure CopyBirthPlaceClick(Sender: TObject);
        procedure CopyAdressBtnClick(Sender: TObject);
    private
        FMode: TEditMode;
        Familia: string;
        Imya: string;
        Otchestvo: string;
        RusFamilia: string;
        RusImya: string;
        RusOtchestvo: string;
        IdSex: Integer;
        BirthDate: Variant;
        TIN: string;
        SocCardNum: string;
        FIdBirthAdress: Integer;
        FIdLiveAdress: Integer;
        FIdCurrentAdress: Integer;
        FWork_Phone: string;
        FHome_Phone: string;
        FIdNationality: Variant;
        FidGrom: Integer;
        IdSexCheck: Integer;

        pStylesDM: TStylesDM;
        pManModified: Boolean;
        pBankCardFrame: TframeCard;

        function ApplyData: Boolean;
        function AskToInsMan(MessageInfo: string): Boolean;
        function CheckData: Boolean;
        function CheckString(aText: string): Boolean;
        procedure PrepareData;
        procedure FormPrepare;
        function GetAdress(IdAdress: Integer): string;
        function GetBirthPlace(IdPlace: Integer): string;
        procedure SetDefaultBirthPlace(IdAdress: Integer);
        procedure InitFoto(AImageDB_Handle: TISC_DB_HANDLE);
        procedure RefreshFoto;
        function ValidateTIN: Boolean;
        function GetCorrectTIN: Variant;
        function GetCountry(IdCountry: Integer): string;
        procedure UpdateFIOOnForm;
    public
        IdMan: Integer;

        constructor Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; {*} AImageDB_Handle: TISC_DB_HANDLE; {*} AEditMode: TEditMode; AIdMan: Integer = -1); reintroduce;
    end;

implementation

{$R *.dfm}

uses SpPeople_ZMessages, IniFiles, StrUtils, AllPeopleDataModule;

procedure TfModifyMan.SetDefaultBirthPlace(IdAdress: Integer);
begin
    if DSGetAdress.Active then
        DSGetAdress.Close;
    DSGetAdress.SQLs.SelectSQL.Text := 'SELECT * FROM ADR_ADRESS_SEL(' + IntToStr(IdAdress) + ')';
    DSGetAdress.Open;
    FIdBirthAdress := DSGetAdress['ID_PLACE'];
    DSGetAdress.Close;
    BirthPlaceEdit.Text := GetBirthPlace(FIdBirthAdress);
end;

function TfModifyMan.ApplyData: Boolean;
begin
    Result := False;
    if CheckData then
    begin
        if FMode = emNew then
        begin
            try
                GetIdManQuery.Open;
                IdMan := GetIdManQuery['IDMAN'];
                GetIdManQuery.Close;

                PrepareData;
                ManModProc.Transaction.StartTransaction;
                ManModProc.ExecProcedure('PUB_ALL_PEOPLE_INSERT', [Familia,
                    Imya, Otchestvo, RusFamilia, RusImya, RusOtchestvo, IdSex,
                        BirthDate, {Tin} GetCorrectTIN, FIdBirthAdress,
                        FIdCurrentAdress, IDMAN, SocCardNum, FWork_Phone,
                        FHome_Phone, FIdNationality, FidGrom, FIdLiveAdress]);
                ManModProc.Transaction.Commit;
                Result := True;
            except
                on E: Exception do
                begin
                    MessageDlg('Не вдалося створити фізичну особу. Причина:' + #10#13 + E.Message, mtError, [mbOk], 0);
                    ManModProc.Transaction.Rollback;
                end;
            end;
        end;
        if FMode = emModify then
        begin
            if pManModified then
            begin
                try
                    PrepareData;
                    ManModProc.Transaction.StartTransaction;
                    ManModProc.ExecProcedure('PUB_ALL_PEOPLE_UPDATE', [Familia,
                        Imya, Otchestvo, RusFamilia, RusImya, RusOtchestvo, IdSex,
                            BirthDate, {Tin} GetCorrectTIN, FIdBirthAdress,
                            FIdCurrentAdress, IDMAN, SocCardNum, FWork_Phone,
                            FHome_Phone, FIdNationality, FidGrom, FIdLiveAdress]);
                    ManModProc.Transaction.Commit;
                    Result := True;
                except
                    on E: Exception do
                    begin
                        MessageDlg('Не вдалося змінити фізичну особу. Причина:' + #10#13 + E.Message, mtError, [mbOk], 0);
                        ManModProc.Transaction.Rollback;
                    end;
                end;
            end;
        end;
    end;
end;

function TfModifyMan.AskToInsMan(MessageInfo: string): Boolean;
begin
    Result := False;
    if ZShowMessage(Self.Caption, MessageInfo, mtCustom, [mbYes, mbNo]) = mrYes then
    begin
        Refresh;
        if ApplyData then
        begin
            Result := True;
            FMode := emModify;
        end;
    end;
end;

function TfModifyMan.GetAdress(IdAdress: Integer): string;
{var
    CountryName:String;
    PlaceName:String;
    StreetName:String;
    House:String;
    Flat:String;
    AdrFull:String; }
begin
    if DSGetAdress.Active then
        DSGetAdress.Close;
    DSGetAdress.SQLs.SelectSQL.Text := 'SELECT * FROM ADR_ADRESS_SEL(' + IntToStr(IdAdress) + ')';
    DSGetAdress.Open;

    Result := VarToStr(DSGetAdress['FULL_NAME']);

    DSGetAdress.Close;

    {    DSGetAdress.ParamByName('ACTDATE').Value:=Date();
        DSGetAdress.ParamByName('ID_ADRESS').Value:=IdAdress;
        DSGetAdress.Open;

        if (not VarIsNull(DSGetAdress['COUNTRY_NAME'])) then
            CountryName:=DSGetAdress['COUNTRY_NAME']+', '
        else
            CountryName:='';

        if (not VarIsNull(DSGetAdress['PLACE_NAME'])) then
            PlaceName:=DSGetAdress['PLACE_NAME']+', '
        else
            PlaceName:='';

        if (not VarIsNull(DSGetAdress['STREET_NAME'])) then
            StreetName:=DSGetAdress['STREET_NAME']+', '
        else
            StreetName:='';

        if (not VarIsNull(DSGetAdress['HOUSE'])) then
            House:=', буд '+DSGetAdress['HOUSE']
        else
            House:='';

        if (not VarIsNull(DSGetAdress['FLAT'])) then
            Flat:=', кв '+DSGetAdress['FLAT']
        else
            Flat:='';

        DSGetAdress.Close;

        AdrFull:=CountryName+PlaceName+StreetName+House+Flat;

        Result:=AdrFull;
    }
end;

function TfModifyMan.GetCountry(IdCountry: Integer): string;
begin
    if DSGetCountry.Active then
        DSGetCountry.Close;
    DSGetCountry.SQLs.SelectSQL.Text := 'SELECT * FROM ADR_COUNTRY_S(' + IntToStr(IdCountry) + ')';
    DSGetCountry.Open;

    Result := VarToStr(DSGetCountry['NAME_COUNTRY']);

    DSGetCountry.Close;
end;

function TfModifyMan.GetBirthPlace(IdPlace: Integer): string;
begin
    if DSGetAdress.Active then
        DSGetAdress.Close;
    DSGetAdress.SQLs.SelectSQL.Text := 'SELECT * FROM ADR_GET_BY_ID_PLACE(' + IntToStr(IdPlace) + ')';
    DSGetAdress.Open;

    Result := VarToStr(DSGetAdress['FULL_NAME']);

    DSGetAdress.Close;
end;

constructor TfModifyMan.Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AImageDB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; AIdMan: Integer = -1);
begin
    try
        inherited Create(AOwner);
    //******************************************************************************
        DB.Handle := ADB_Handle;
        ReadTransaction.Active := True;
    //******************************************************************************
        pStylesDM := TStylesDM.Create(Self);
        PasportGridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
        FamilyTV.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
        FotoGridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
    //******************************************************************************
        FIdBirthAdress := -1;
        FIdCurrentAdress := -1;
        FIdLiveAdress := -1;
    //******************************************************************************
        pManModified := False;
        FMode := AEditMode;
        IdMan := AIdMan;

        if (FMode = emNew) then
        begin
            Caption := 'Довідник фізичних осіб: Додати';
            if DSContryDef.Active then
                DSContryDef.Close;
            DSContryDef.SQLs.SelectSQL.Text := 'SELECT DEF_ID_COUNTRY, CN_DEF_ID_NATIONAL FROM PUB_SYS_DATA';
            DSContryDef.Open;
            if not (DSContryDef['DEF_ID_COUNTRY'] = null) then
            begin
                FidGrom := DSContryDef['DEF_ID_COUNTRY'];

                if DSGetCountry.Active then
                    DSGetCountry.Close;
                DSGetCountry.SQLs.SelectSQL.Text := 'SELECT * FROM ADR_COUNTRY_S(' + IntToStr(FidGrom) + ')';
                DSGetCountry.Open;

                Gromod.Text := VarToStr(DSGetCountry['NAME_COUNTRY']);
                DSGetCountry.Close;
            end;
            if not (DSContryDef['CN_DEF_ID_NATIONAL'] = null) then
                NationalityComboBox.EditValue := DSContryDef['CN_DEF_ID_NATIONAL'];

            DSContryDef.Close;
        end
        else
            DSContryDef.Close;

        if (FMode = emModify) then
            Caption := 'Довідник фізичних осіб: Редагувати';
        if (FMode = emView) then
        begin
            Caption := 'Довідник фізичних осіб: Перегляд';
            OkButton.Visible := False;
        end;
        PeoplePageControl.ActivePageIndex := 0;
        DSNationality.Open;

        if Fmode <> emNew then
            FormPrepare;
    //******************************************************************************
        InitFoto(AImageDB_Handle);
    //  Width:=Width-155;
    //******************************************************************************
        if not IsAccessGranted(SAP_MainInfo, cEdit) then
        begin
            MainPanel.Enabled := False;
            if not IsAccessGranted(SAP_MainInfo, cView) then
                MainPage.TabVisible := False;
        end;

        if not IsAccessGranted(SAP_Otchestvo, cEdit) then
        begin
            WithOutOtchestvoCB.Visible := False;
        end;

        if not IsAccessGranted(SAP_PassData, cEdit) then
        begin
            AddButton.Enabled := False;
            ModifyButton.Enabled := False;
            DeleteButton.Enabled := False;
            if not IsAccessGranted(SAP_PassData, cView) then
                PassPage.TabVisible := False;
        end;

        if not IsAccessGranted(SAP_Info, cEdit) then
        begin
            FamilyAddBtn.Enabled := False;
            FamilyModifyBtn.Enabled := False;
            FamilyDelBtn.Enabled := False;
            PhonePage.Enabled := False;
            NationalityBox.Enabled := False;
            if not IsAccessGranted(SAP_Info, cView) then
                AdditionalPage.TabVisible := False;
        end;

        if not IsAccessGranted(SAP_BankCards, cEdit) then
            if not IsAccessGranted(SAP_BankCards, cView) then
                BankCardPage.TabVisible := False;
    except on E: Exception
        do begin
            ShowMessage(E.Message);
        end;
    end;
end;

function TfModifyMan.CheckString(aText: string): Boolean;
var
    i, n: Integer;
    s: Char;
    Txt: string;
begin
    CheckString := True;
    Txt := aText;
    n := Length(aText);
    if n >= 1 then
        for i := 1 to n do
        begin
            s := Txt[i];
            if not (s in ['А'..'Я', 'а'..'я', '-', '''', ' ', 'І', 'і', 'Є', 'є', 'Ґ', 'ґ', 'Ї', 'ї', #27, #8])
                then
            begin
                CheckString := False;
                Exit;
            end;
        end;
end;

function TfModifyMan.CheckData: Boolean;
begin
    CheckData := True;
    if FamiliaEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Прізвище''', mtError, [mbOk], 0);
        CheckData := False;
        PeoplePageControl.ActivePage := MainPage;
        FamiliaEdit.SetFocus;
        Exit;
    end;
    if CheckString(FamiliaEdit.Text) = False then
    begin
        MessageDlg('Поле ' + '''Прізвище''' + ' містить недопустимі символи!', mtError, [mbOk], 0);
        CheckData := False;
        PeoplePageControl.ActivePage := MainPage;
        FamiliaEdit.SetFocus;
        Exit;
    end;
    if ImyaEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Ім''я''', mtError, [mbOk], 0);
        CheckData := False;
        PeoplePageControl.ActivePage := MainPage;
        ImyaEdit.SetFocus;
        Exit;
    end;
    if CheckString(ImyaEdit.Text) = False then
    begin
        MessageDlg('Поле ' + '''Ім''я''' + ' містить недопустимі символи!', mtError, [mbOk], 0);
        CheckData := False;
        PeoplePageControl.ActivePage := MainPage;
        ImyaEdit.SetFocus;
        Exit;
    end;
    // У иностранцев отчеств нет
    if not WithOutOtchestvoCB.Checked then
    begin
        if OtchestvoEdit.Text = '' then
        begin
            MessageDlg('Не задано необхіднe поле ' + '''По батькові''', mtError, [mbOk], 0);
            CheckData := False;
            PeoplePageControl.ActivePage := MainPage;
            OtchestvoEdit.SetFocus;
            Exit;
        end;
        if CheckString(OtchestvoEdit.Text) = False then
        begin
            MessageDlg('Поле ' + '''По батькові''' + ' містить недопустимі символи!', mtError, [mbOk], 0);
            CheckData := False;
            PeoplePageControl.ActivePage := MainPage;
            OtchestvoEdit.SetFocus;
            Exit;
        end;
    end;
    if RusFamEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Фамилия''', mtError, [mbOk], 0);
        CheckData := False;
        PeoplePageControl.ActivePage := MainPage;
        RusFamEdit.SetFocus;
        Exit;
    end;
    if RusImyaEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Имя''', mtError, [mbOk], 0);
        CheckData := False;
        PeoplePageControl.ActivePage := MainPage;
        RusImyaEdit.SetFocus;
        Exit;
    end;
    if not WithOutOtchestvoCB.Checked then
        if RusOtchEdit.Text = '' then
        begin
            MessageDlg('Не задано необхіднe поле ' + '''Отчество''', mtError, [mbOk], 0);
            CheckData := False;
            PeoplePageControl.ActivePage := MainPage;
            RusOtchEdit.SetFocus;
            Exit;
        end;
    if Gromod.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Громадянство''', mtError, [mbOk], 0);
        CheckData := False;
        PeoplePageControl.ActivePage := MainPage;
        Gromod.SetFocus;
        Exit;
    end;
    if SexBox.ItemIndex = -1 then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Стать''', mtError, [mbOk], 0);
        CheckData := False;
        PeoplePageControl.ActivePage := MainPage;
        SexBox.SetFocus;
        Exit;
    end;

    if not ValidateTIN then
    begin
        CheckData := False;
        Exit;
    end;
end;

procedure TfModifyMan.FormPrepare;
begin
    if DSDetails.Active then
        DSDetails.Close;
    DSDetails.ParamByName('ID_MAN').Value := IDMAN;
    DSDetails.Open;

    FamiliaEdit.Text := DSDetails['Familia'];
    ImyaEdit.Text := DSDetails['Imya'];
    OtchestvoEdit.Text := DSDetails['Otchestvo'];

    if (not VarIsNull(DSDetails['Rus_Familia'])) then
        RusFamEdit.Text := DSDetails['Rus_Familia']
    else
        RusFamEdit.Text := '';

    if (not VarIsNull(DSDetails['Rus_Imya'])) then
        RusImyaEdit.Text := DSDetails['Rus_Imya']
    else
        RusImyaEdit.Text := '';

    if (not VarIsNull(DSDetails['Rus_Otchestvo'])) then
        RusOtchEdit.Text := DSDetails['Rus_Otchestvo']
    else
        RusOtchEdit.Text := '';
    // Сначала задаем значение, а потом навешиваем процедуру на событие OnEditing,
    // иначе она срабатывает при инициализации данных и проверка на вненсение изменений
    // не работает.
    SexBox.ItemIndex := DSDetails['Id_Sex'] - 1;
    IdSexCheck := DSDetails['Id_Sex'];
    SexBox.OnEditing := ManEditEditing;

    if (VarIsNull(DSDetails['SOC_CARD_NUMBER'])) then
        SocCardNumEdit.Text := ''
    else
        SocCardNumEdit.Text := DSDetails['SOC_CARD_NUMBER'];

    if (not VarIsNull(DSDetails['BIRTH_DATE'])) then
        BirthDateEdit.Date := StrToDate(DSDetails['BIRTH_DATE']);

    if (VarIsNull(DSDetails['WORK_PHONE'])) then
        WorkPhoneEdit.Text := ''
    else
        WorkPhoneEdit.Text := DSDetails['WORK_PHONE'];

    if (VarIsNull(DSDetails['HOME_PHONE'])) then
        HomePhoneEdit.Text := ''
    else
        HomePhoneEdit.Text := DSDetails['HOME_PHONE'];

    if DSDetails['TIN'] <= 0 then
        TINEdit.Text := ''
    else
        TINEdit.Text := DSDetails['TIN'];

    RefreshButtonClick(Self);
    FamilyRefreshBtnClick(Self);

    if FMode = emView then
    begin
        MainPanel.Enabled := False;
        AddButton.Enabled := False;
        ModifyButton.Enabled := False;
        DeleteButton.Enabled := False;
        FamilyAddBtn.Enabled := False;
        FamilyModifyBtn.Enabled := False;
        FamilyDelBtn.Enabled := False;
        PhonePage.Enabled := False;
        NationalityBox.Enabled := False;
        AddFotoBtn.Enabled := False;
        DelFotoBtn.Enabled := False;
    end;

    NationalityComboBox.EditValue := DSDetails['ID_NATIONALITY'];

    if DSDetails['ID_COUNTRY'] <> null then
        Gromod.Text := GetCountry(DSDetails['ID_COUNTRY']);
    FidGrom := DSDetails['ID_COUNTRY'];

    AdressEdit.Text := GetAdress(DSDetails['ID_ADRESS']);
    FIdCurrentAdress := DSDetails['ID_ADRESS'];
    BirthPlaceEdit.Text := GetBirthPlace(DSDetails['ID_BIRTH_PLACE']);
    FIdBirthAdress := DSDetails['ID_BIRTH_PLACE'];
    LiveAdressEdit.Text := GetAdress(DSDetails['ID_LIVE_ADRESS']);
    FIdLiveAdress := DSDetails['ID_LIVE_ADRESS'];

    // Если не указаны отчества, то, вероятнее всего, в прошлый раз была выбрана опция "Без отчества". Повторяем
    if (Trim(OtchestvoEdit.Text) = '') or (Trim(RusOtchEdit.Text) = '') then
        WithOutOtchestvoCB.Checked := True;
    //******************************************************************************
    pBankCardFrame := TframeCard.Create(BankCardPage, DB.Handle, FMode, IdMan, DSDetails['TIN']);
end;

procedure TfModifyMan.PrepareData;
begin
    Familia := FamiliaEdit.Text;
    Imya := ImyaEdit.Text;
    Otchestvo := OtchestvoEdit.Text;
    RusFamilia := RusFamEdit.Text;
    RusImya := RusImyaEdit.Text;
    RusOtchestvo := RusOtchEdit.Text;
    IdSex := SexBox.ItemIndex + 1;
    BirthDate := DateToStr(BirthDateEdit.Date);
    if (BirthDate = '00.00.0000') then
        BirthDate := null;
    TIN := TinEdit.Text;
    {*******
     if (FMode<>emNew) then
       begin
        if TinEdit.Text<>'' then
           TIN:=TinEdit.Text
         else
           TIN:=DSDetails['TIN']
       end
      else
       TIN:=TinEdit.Text;
     *******}
// Поскольку лицам без ИНН в базе в качестве ИНН присвоены отрицательные значения,
// а отображаются и СОХРАНЯЮТСЯ они БЕЗ минуса, проверяем настоящий ИНН или нет.
{      if (FMode<>emNew) and (TinEdit.Text<>'') then
       begin
                    if ((Length(TinEdit.Text)<10) {т.е. ИНН ненастоящий}{and (DSDetails['TIN']<0))
           and (TinEdit.Text=IntToStr(-DSDetails['TIN'])) then
          TIN:='-'+TinEdit.Text
        else
          TIN:=TinEdit.Text;
       end
      else
       TIN:=TinEdit.Text;       }

    SocCardNum := SocCardNumEdit.Text;
    FWork_Phone := WorkPhoneEdit.Text;
    FHome_Phone := HomePhoneEdit.Text;
    FIdNationality := NationalityComboBox.EditValue;

end;

procedure TfModifyMan.OkButtonClick(Sender: TObject);
begin
    if ApplyData then
        ModalResult := mrOk;
end;

procedure TfModifyMan.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    if FMode = emNew then
        IdMan := -1;
end;

procedure TfModifyMan.AddButtonClick(Sender: TObject);
var
    PassInfo: TPassRec;
    pIdPasData: Int64;
begin
    if IdMan = -1 then
        if not AskToInsMan(InsMan_Message) then
            Exit;

    PassInfo.Familia := FamiliaEdit.Text;
    PassInfo.Imya := ImyaEdit.Text;
    PassInfo.Otchestvo := OtchestvoEdit.Text;
    PassInfo.RusFamilia := RusFamEdit.Text;
    PassInfo.RusImya := RusImyaEdit.Text;
    PassInfo.RusOtchestvo := RusOtchEdit.Text;
    PassInfo.ID_MAN := IdMan;
    PassInfo.ID_PAS_DATA := -1;
    PassInfo.WithOutOtchestvo := WithOutOtchestvoCB.Checked;

    if GetPassInfo(Self, DB.Handle, emNew, PassInfo) then
    begin
        ProcPassData.Transaction.StartTransaction;

        ProcPassData.ExecProcedure('PUB_PASS_DATA_INSERT',
            [PassInfo.Familia, PassInfo.Imya, PassInfo.Otchestvo,
            PassInfo.RusFamilia, PassInfo.RusImya, PassInfo.RusOtchestvo,
                PassInfo.Seria, PassInfo.Number, DateToStr(PassInfo.GrantDate),
                PassInfo.GrantedBy, IdMan, PassInfo.IdPassType]);
        pIdPasData := ProcPassData.FN('ID_OUT').AsInt64;
        ProcPassData.Transaction.Commit;

        RefreshButtonClick(Self);
        DSPassData.Locate('ID_PAS_DATA', pIdPasData, []);
        if PassInfo.UpdateFIO then
        begin
            UpdateFIOOnForm;
        end;
    end;
end;

procedure TfModifyMan.ActualPaspCBClick(Sender: TObject);
begin
    RefreshButtonClick(Self);
end;

procedure TfModifyMan.ModifyButtonClick(Sender: TObject);
var
    PassInfo: TPassRec;
begin
    if DSPassData.IsEmpty then
        Exit;

    PassInfo.Familia := DSPassData['FAMILIA'];
    PassInfo.Imya := DSPassData['IMYA'];
    PassInfo.Otchestvo := DSPassData['OTCHESTVO'];
    PassInfo.RusFamilia := DSPassData['RUS_FAMILIA'];
    PassInfo.RusImya := DSPassData['RUS_IMYA'];
    PassInfo.RusOtchestvo := DSPassData['RUS_OTCHESTVO'];
    PassInfo.Seria := DSPassData['SERIA'];
    PassInfo.Number := DSPassData['NUMBER'];
    PassInfo.GrantDate := {StrToDate}(DSPassData['DATE_BEG']);
    PassInfo.GrantedBy := DSPassData['VIDAN'];
    PassInfo.WithOutOtchestvo := WithOutOtchestvoCB.Checked;

    if (VarIsNull(DSPassData['ID_PASS_TYPE'])) then
        PassInfo.IdPassType := 1
    else
        PassInfo.IdPassType := DSPassData['ID_PASS_TYPE'];

    PassInfo.ID_MAN := IdMan;
    PassInfo.ID_PAS_DATA := DSPassData['ID_PAS_DATA'];

    if GetPassInfo(Self, DB.Handle, emModify, PassInfo) then
    begin
        ProcPassData.Transaction.StartTransaction;

        ProcPassData.ExecProcedure('PUB_PASS_DATA_UPDATE',
            [PassInfo.Familia, PassInfo.Imya, PassInfo.Otchestvo,
            PassInfo.RusFamilia, PassInfo.RusImya, PassInfo.RusOtchestvo,
                PassInfo.Seria, PassInfo.Number, DateToStr(PassInfo.GrantDate),
                PassInfo.GrantedBy, IdMan, PassInfo.IdPassType, DSPassData['ID_PAS_DATA']]);
        ProcPassData.Transaction.Commit;

        RefreshButtonClick(Self);
        if PassInfo.UpdateFIO then
        begin
            UpdateFIOOnForm;
        end;
    end;
end;

procedure TfModifyMan.ViewButtonClick(Sender: TObject);
var
    PassInfo: TPassRec;
begin
    if DSPassData.IsEmpty then
        Exit;

    PassInfo.Familia := DSPassData['FAMILIA'];
    PassInfo.Imya := DSPassData['IMYA'];
    PassInfo.Otchestvo := DSPassData['OTCHESTVO'];
    PassInfo.RusFamilia := DSPassData['RUS_FAMILIA'];
    PassInfo.RusImya := DSPassData['RUS_IMYA'];
    PassInfo.RusOtchestvo := DSPassData['RUS_OTCHESTVO'];
    PassInfo.Seria := DSPassData['SERIA'];
    PassInfo.Number := DSPassData['NUMBER'];
    PassInfo.GrantDate := {StrToDate}(DSPassData['DATE_BEG']);
    PassInfo.GrantedBy := DSPassData['VIDAN'];
    PassInfo.WithOutOtchestvo := WithOutOtchestvoCB.Checked;

    if (VarIsNull(DSPassData['ID_PASS_TYPE'])) then
        PassInfo.IdPassType := 1
    else
        PassInfo.IdPassType := DSPassData['ID_PASS_TYPE'];

    PassInfo.ID_MAN := IdMan;
    PassInfo.ID_PAS_DATA := DSPassData['ID_PAS_DATA'];

    GetPassInfo(Self, DB.Handle, emView, PassInfo);
end;

procedure TfModifyMan.DSPassDataDATE_ENDGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin

    {    if DSPassDataDATE_END.Value=Module.ConstsQuery['INFINITY_DATE'] then
                         Text:='безстроково'
                 else Text:=DateToStr(DSPassDataDATE_END.Value); }

end;

procedure TfModifyMan.DeleteButtonClick(Sender: TObject);
var
    ViewMessageForm: TForm;
    i: integer;
    pUpdateFIO, pPassed: Boolean;
begin
    if DSPassData.IsEmpty then
        Exit;
    repeat
        if ZShowMessage('Вилучення', 'Запис буде вилучено! Продовжити?', mtconfirmation, [mbYes, MbNo]) = mrYes then
        begin
            pPassed := True;
            pUpdateFIO := False;

            ProcPassData.Transaction.StartTransaction;
            ProcPassData.StoredProcName := 'PEOPLE_PASS_FIO_EQUAL';
            ProcPassData.Prepare;
            ProcPassData.ParamByName('ID_MAN').AsInteger := IdMan;
            ProcPassData.ParamByName('ID_PAS_DATA').AsInt64 := DSPassData['ID_PAS_DATA'];
            ProcPassData.ParamByName('EDIT_MODE').AsInteger := 2;
            ProcPassData.ExecProc;
            if ProcPassData.FN('IS_EQUAL').AsInteger = 0 then
            begin
                pPassed := False;
                ViewMessageForm := CreateMessageDialog('Змінити ПІБ у даних фізичної особи?' + #13 +
                    'Увага!!! Якщо Ви відповісте "ТАК", то у всіх вихідних документах,' + #13 +
                    'де вона зустрічається, її ПІБ буде записане як:' + #13 +
                    FamiliaEdit.Text + ' ' + ImyaEdit.Text + ' ' + OtchestvoEdit.Text, mtWarning, [mbYes, mbNo, mbCancel]);
                with ViewMessageForm do
                begin
                    for i := 0 to ComponentCount - 1 do
                        if (Components[i].ClassType = TButton) then
                        begin
                            if UpperCase((Components[i] as TButton).Caption) = '&YES' then
                            begin
                                (Components[i] as TButton).Left := 70;
                                (Components[i] as TButton).Caption := 'Так';
                                (Components[i] as TButton).Width := 45;
                            end;
                            if UpperCase((Components[i] as TButton).Caption) = '&NO' then
                            begin
                                (Components[i] as TButton).Left := 120;
                                (Components[i] as TButton).Caption := 'Ні';
                                (Components[i] as TButton).Width := 45;
                            end;
                            if UpperCase((Components[i] as TButton).Caption) = 'CANCEL' then
                            begin
                                (Components[i] as TButton).Left := 170;
                                (Components[i] as TButton).Caption := 'Повернутися до редагування';
                                (Components[i] as TButton).Width := 170;
                            end;
                        end;
                    Caption := 'Увага';
                    i := ShowModal;
                    Free;
                end;
                case i of
                    mrYes:
                        begin
                            pPassed := True;
                            pUpdateFIO := True;
                        end;
                    mrNo:
                        begin
                            pPassed := True;
                        end;
                    mrCancel:
                        begin
                            pPassed := False;
                        end;
                end;
            end;
            ProcPassData.Transaction.Rollback;

            if pPassed then
            begin
                ProcPassData.StoredProcName := 'PASS_DATA_DELETE';
                ProcPassData.Transaction.StartTransaction;
                ProcPassData.ParamByName('ID_MAN').Value := IdMan;
                ProcPassData.ParamByName('DATE_BEG').Value := DSPassData['DATE_BEG'];
                ProcPassData.ParamByName('ID_PAS_DATA').Value := DSPassData['ID_PAS_DATA'];
                ProcPassData.ExecProc;
                ProcPassData.Transaction.Commit;
                DSPassData.CloseOpen(True);

                if pUpdateFIO then
                begin
                    UpdateFIOOnForm;
                end;
            end;
        end
        else
            Break;
    until pPassed;
end;

procedure TfModifyMan.RefreshButtonClick(Sender: TObject);
var
    pIdPasData: Int64;
begin
    pIdPasData := -1;

    if DSPassData.Active then
    begin
        if not DSPassData.IsEmpty then
            pIdPasData := DSPassData['ID_PAS_DATA'];
        DSPassData.Close;
    end;

    if ActualPaspCB.Checked then
        DSPassData.SQLs.SelectSQL.Text := 'SELECT * FROM PASS_DATA_GET_BY_ID_MAN('
            + IntToStr(IdMan) + ',''T'')'
    else
        DSPassData.SQLs.SelectSQL.Text := 'SELECT * FROM PASS_DATA_GET_BY_ID_MAN('
            + IntToStr(IdMan) + ',''F'')';

    DSPassData.Open;

    if pIdPasData <> -1 then
        DSPassData.Locate('ID_PAS_DATA', pIdPasData, []);

    if VarIsNull(DSPassData['VIDAN']) then
        VidanDBText.Text := ''
    else
        VidanDBText.Text := DSPassData['VIDAN'];
end;

procedure TfModifyMan.cxMaskEdit1PropertiesValidate(Sender: TObject;
    var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
    ErrorText := 'Довжина поля "Податковий номер" повинна дорівнювати 10!';
end;

procedure TfModifyMan.AdressEditPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    AdressesSp: TSprav;
    ShowStyle, Select: Integer;
    IdAdr: Variant;
begin

    if (Sender = AdressEdit) then
    begin
        if (FIdCurrentAdress <= 0) then
            IdAdr := null
        else
            IdAdr := FIdCurrentAdress;
    end
    else
        if (Sender = BirthPlaceEdit) then
        begin
            if (FIdBirthAdress <= 0) then
                IdAdr := null
            else
                IdAdr := FIdBirthAdress;

        end
        else
            if (Sender = LiveAdressEdit) then
            begin
                if (FIdLiveAdress <= 0) then
                    IdAdr := null
                else
                    IdAdr := FIdLiveAdress;
            end;

    if (Sender = BirthPlaceEdit) then
        ShowStyle := 3
    else
        ShowStyle := 4;

    if (FMode = emView) then
        Select := 0
    else
        Select := 1;

    AdressesSp := GetSprav('Adresses');
    if (AdressesSp <> nil) then
    begin
        with AdressesSp.Input do
        begin
            Edit;
            FieldValues['Id_Adress'] := IdAdr;
            FieldValues['DbHandle'] := Integer(DB.Handle);
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := ShowStyle;
            Post;
        end;

        AdressesSp.Show;

        if (not VarIsNull(AdressesSp.Output['Name_Adr']))
            then
        begin
            if (Sender = AdressEdit)
                then
            begin
                AdressEdit.Text := AdressesSp.Output['Name_Adr'];
                FIdCurrentAdress := AdressesSp.Output['Id_Adress'];
            end
            else
                if (Sender = BirthPlaceEdit) then
                begin
                    BirthPlaceEdit.Text := AdressesSp.Output['Name_Adr'];
                    FIdBirthAdress := AdressesSp.Output['Id_Adress'];
                end
                else
                    if (Sender = LiveAdressEdit) then
                    begin
                        LiveAdressEdit.Text := AdressesSp.Output['Name_Adr'];
                        FIdLiveAdress := AdressesSp.Output['Id_Adress'];
                    end;

            pManModified := True;
        end;
        AdressesSp.Destroy;
    end;
end;

procedure TfModifyMan.FamilyAddBtnClick(Sender: TObject);
var
    ViewForm: TfFamilyEdit;
begin
    if IdMan = -1 then
    begin
        if not AskToInsMan(InsMan_Message) then
            Exit;
    end
    else
    begin
        if IdSexCheck <> SexBox.ItemIndex + 1 then
            AskToInsMan('Була внесені зміни по фізичній особі! Бажаєте зберегти інформацію?');
    end;

    ViewForm := TfFamilyEdit.Create(Self, DB.Handle);
    if ViewForm.ShowModal = mrOk then
    begin
        try
            StProcFamily.Transaction.StartTransaction;
            StProcFamily.StoredProcName := 'MAN_FAMILY_INSERT';
            StProcFamily.Prepare;
            StProcFamily.ParamByName('ID_MAN_INT').AsInteger := IdMan;
            StProcFamily.ParamByName('FIO').AsString := ViewForm.FIO;
            StProcFamily.ParamByName('ID_RELATION').AsInteger := ViewForm.IdRelation;
            if ViewForm.UseDate then
                StProcFamily.ParamByName('BIRTH_DATE').AsDate := ViewForm.BirthDate
            else
                StProcFamily.ParamByName('BIRTH_DATE').Clear;
            StProcFamily.ExecProc;
            StProcFamily.Transaction.Commit;
            FamilyRefreshBtnClick(Self);
            DSFamily.Locate('FIO', ViewForm.FIO, []);
        except
            on e: Exception do
            begin
                StProcFamily.Transaction.Rollback;
                ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
            end;
        end;
    end;
    ViewForm.Free;
end;

procedure TfModifyMan.FamilyDelBtnClick(Sender: TObject);
begin
    if DSFamily.IsEmpty then
        Exit;
    if ZShowMessage('Вилучення', 'Ви справді бажаєте вилучити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
        try
            StProcFamily.Transaction.StartTransaction;
            StProcFamily.StoredProcName := 'MAN_FAMILY_DELETE';
            StProcFamily.Prepare;
            StProcFamily.ParamByName('ID_WA').AsInteger := IdMan;
            StProcFamily.ParamByName('FIO').AsString := DSFamily['FIO'];
            StProcFamily.ExecProc;
            StProcFamily.Transaction.Commit;
            FamilyRefreshBtnClick(Self);
        except
            on e: Exception do
            begin
                StProcFamily.Transaction.Rollback;
                ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
            end;
        end;
    end;
end;

procedure TfModifyMan.FamilyModifyBtnClick(Sender: TObject);
var
    ViewForm: TfFamilyEdit;
begin
    if DSFamily.IsEmpty then
        Exit;
    if VarIsNull(DSFamily['BIRTH_DATE']) then
        ViewForm := TfFamilyEdit.Create(Self, DB.Handle, DSFamily['ID_RELATION'], DSFamily['FIO'])
    else
        ViewForm := TfFamilyEdit.Create(Self, DB.Handle, DSFamily['ID_RELATION'], DSFamily['FIO'], DSFamily['BIRTH_DATE']);
    if ViewForm.ShowModal = mrOk then
    begin
        try
            StProcFamily.Transaction.StartTransaction;
            StProcFamily.StoredProcName := 'Z_MAN_FAMILY_U';
            StProcFamily.Prepare;
            StProcFamily.ParamByName('ID_MAN_INT').AsInteger := IdMan;
            StProcFamily.ParamByName('FIO_OLD').AsString := DSFamily['FIO'];
            StProcFamily.ParamByName('FIO').AsString := ViewForm.FIO;
            StProcFamily.ParamByName('ID_RELATION').AsInteger := ViewForm.IdRelation;
            if ViewForm.UseDate then
                StProcFamily.ParamByName('BIRTH_DATE').AsDate := ViewForm.BirthDate
            else
                StProcFamily.ParamByName('BIRTH_DATE').Clear;
            StProcFamily.ExecProc;
            StProcFamily.Transaction.Commit;
            FamilyRefreshBtnClick(Self);
            DSFamily.Locate('FIO', ViewForm.FIO, []);
        except
            on e: Exception do
            begin
                StProcFamily.Transaction.Rollback;
                ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
            end;
        end;
    end;
    ViewForm.Free;
end;

procedure TfModifyMan.ClearCurAdrBtnClick(Sender: TObject);
begin
    AdressEdit.Text := '';
    FIdCurrentAdress := -1;
    pManModified := True;
end;

procedure TfModifyMan.ClearBirthAdrBtnClick(Sender: TObject);
begin
    BirthPlaceEdit.Text := '';
    FIdBirthAdress := -1;
    pManModified := True;
end;

procedure TfModifyMan.CopyFIOBtnClick(Sender: TObject);
var IdSex:integer;
c :Char;
s:string;
p:Integer;
begin

    if SexBox.ItemIndex <> 1 then  IdSex := 1        //mug po umolch
    else if SexBox.ItemIndex = 1 then  IdSex := 2;   //mug po umolch
    S:= ImyaEdit.Text;
    c:=S[Length(S)];
    if ((Ord(c) >= Ord('а')) and (Ord(c) <= Ord('я'))) then p:=1           // est mal bukv
    else p:=0;


    STProcPerevodFioRus.Transaction.StartTransaction;
    STProcPerevodFioRus.StoredProcName := 'SYS_PEOPLE_FIO_CONVERT_RUS';
    STProcPerevodFioRus.Prepare;
    STProcPerevodFioRus.ParamByName('ID_SEX').AsInteger := IdSex;
    STProcPerevodFioRus.ParamByName('FAMILIYA').AsString := FamiliaEdit.Text;
    STProcPerevodFioRus.ParamByName('IMYA').AsString := ImyaEdit.Text;
    STProcPerevodFioRus.ParamByName('OTCHESTVO').AsString := OtchestvoEdit.Text;
    STProcPerevodFioRus.ParamByName('PRIZNAK').AsInteger := p;
    STProcPerevodFioRus.ExecProc;

    RusFamEdit.Text   := STProcPerevodFioRus.ParamByName('FAMILIYA_RU').AsString;
    RusImyaEdit.Text  := STProcPerevodFioRus.ParamByName('IMYA_RU').AsString;
    RusOtchEdit.Text  := STProcPerevodFioRus.ParamByName('OTCHESTVO_RU').AsString;

    STProcPerevodFioRus.Transaction.Rollback;
end;

procedure TfModifyMan.PasportGridDBTableView1CellClick(
    Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
    AShift: TShiftState; var AHandled: Boolean);
begin
    if VarIsNull(DSPassData['VIDAN']) then
        VidanDBText.Text := ''
    else
        VidanDBText.Text := DSPassData['VIDAN'];
end;

procedure TfModifyMan.FamilyRefreshBtnClick(Sender: TObject);
begin
    if DSFamily.Active then
        DSFamily.Close;
    DSFamily.SQLs.SelectSQL.Text := 'SELECT * FROM Z_FAMILY_BY_ID_MAN(' + IntToStr(IdMan) + ')';
    DSFamily.Open;
end;

procedure TfModifyMan.HistWriteTransactionAfterStart(Sender: TObject);
begin
    // записываем данные о грядущем изменении в таблицу PUB_DT_HISTORY_INFO
    // уже не записываем, по словам КЯВа данные должна писать аццмжмт-бплина
    {StProcHist.StoredProcName := 'PUB_SET_HISTORY_INS';
    StProcHist.Prepare;
    StProcHist.ParamByName('IN_ID_USER').AsInt64 := accMgmt.GetUserId;
    StProcHist.ParamByName('IN_IP_ADRESS').AsString := GetIPAddress;
    StProcHist.ParamByName('IN_HOST_NAME').AsString := GetCompName;
    StProcHist.ParamByName('APP_NAME').AsString := ExtractFileName(Application.ExeName);
    StProcHist.ExecProc; }
end;

procedure TfModifyMan.ManEditEditing(Sender: TObject;
    var CanEdit: Boolean);
begin
    //  ShowMessage(TComponent(Sender).Name);
    pManModified := True;
end;

procedure TfModifyMan.NationalityComboBoxPropertiesChange(Sender: TObject);
begin
    pManModified := True;
end;

procedure TfModifyMan.PasportGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_INSERT:
            begin
                if FMode <> emView then
                    AddButtonClick(Self);
            end;
        VK_F2:
            begin
                if FMode <> emView then
                    ModifyButtonClick(Self);
            end;
        VK_SPACE:
            begin
                ViewButtonClick(Self);
            end;
        VK_DELETE:
            begin
                if FMode <> emView then
                    DeleteButtonClick(Self);
            end;
        VK_F5:
            begin
                RefreshButtonClick(Self);
            end;
    end;
end;

procedure TfModifyMan.FamilyTVKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    case Key of
        VK_INSERT:
            begin
                if FMode <> emView then
                    FamilyAddBtnClick(Self);
            end;
        VK_F2:
            begin
                if FMode <> emView then
                    FamilyModifyBtnClick(Self);
            end;
        VK_DELETE:
            begin
                if FMode <> emView then
                    FamilyDelBtnClick(Self);
            end;
        VK_F5:
            begin
                FamilyRefreshBtnClick(Self);
            end;
    end;
end;

procedure TfModifyMan.FamiliaEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        ImyaEdit.SetFocus
    else
        if not (Key in ['А'..'Я', 'а'..'я', '-', '''', ' ', 'І', 'і', 'Є', 'є', 'Ґ', 'ґ', 'Ї', 'ї', #27, #8])
            then
            Key := #0;
end;

procedure TfModifyMan.ImyaEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        OtchestvoEdit.SetFocus
    else
        if not (Key in ['А'..'Я', 'а'..'я', '-', '''', ' ', 'І', 'і', 'Є', 'є', 'Ґ', 'ґ', 'Ї', 'ї', #27, #8])
            then
            Key := #0;
end;

procedure TfModifyMan.OtchestvoEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        RusFamEdit.SetFocus
    else
        if not (Key in ['А'..'Я', 'а'..'я', '-', '''', ' ', 'І', 'і', 'Є', 'є', 'Ґ', 'ґ', 'Ї', 'ї', #27, #8])
            then
            Key := #0;
end;

procedure TfModifyMan.RusFamEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        RusImyaEdit.SetFocus;
end;

procedure TfModifyMan.RusImyaEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        RusOtchEdit.SetFocus;
end;

procedure TfModifyMan.RusOtchEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        SexBox.SetFocus;
end;

procedure TfModifyMan.SexBoxKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        BirthDateEdit.SetFocus;
end;

procedure TfModifyMan.BirthDateEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        TinEdit.SetFocus;
end;

procedure TfModifyMan.TinEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        SocCardNumEdit.SetFocus;
end;

procedure TfModifyMan.SocCardNumEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        AdressEdit.SetFocus;
end;

procedure TfModifyMan.AdressEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        LiveAdressEdit.SetFocus;
end;

procedure TfModifyMan.BirthPlaceEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        FamiliaEdit.SetFocus;
end;

procedure TfModifyMan.WorkPhoneEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        HomePhoneEdit.SetFocus;
end;

procedure TfModifyMan.HomePhoneEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        NationalityComboBox.SetFocus;
end;

procedure TfModifyMan.NationalityComboBoxKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        WorkPhoneEdit.SetFocus;
end;

procedure TfModifyMan.InitFoto(AImageDB_Handle: TISC_DB_HANDLE);
begin
    if AImageDB_Handle = nil then
        // не показываем панели с фотографиями, но и не выводим никакого сообщения
    begin
        FotoPanel.Hide;
        Width := Width - 155;
    end
    else
        // в случае, если все пучком, - подключаемся к базе
    begin
        DBFoto.Handle := AImageDB_Handle;
        ReadTrFoto.Active := True;
        if IdMan <> -1 then
            RefreshFoto;
        //проверяем наличие прав на правку/просмотр фотографий
        if not IsAccessGranted(SAP_Foto, cEdit) then
        begin
            AddFotoBtn.Enabled := False;
            DelFotoBtn.Enabled := False;
            if not IsAccessGranted(SAP_Foto, cView) then
            begin
                FotoPanel.Hide;
                Width := Width - 155;
            end;
        end;
    end;
end;

procedure TfModifyMan.RefreshFoto;
begin
    if DSetFoto.Active then
        DSetFoto.Close;
    DSetFoto.SQLs.SelectSQL.Text := 'SELECT * FROM FOTO_ICON_GET_BY_ID_MAN(' + IntToStr(IdMan) + ') ORDER BY DATE_FOTO DESCENDING, ID_FOTO DESCENDING'; // Т.к. ID_FOTO присваивается по мере добавления в БД, следовательно, более поздние фото имеют больший ID
    DSetFoto.Open;
    DSetFoto.First;
end;

procedure TfModifyMan.SaveAsBtnClick(Sender: TObject);
begin
    StProcFoto.StoredProcName := 'FOTO_GET_BY_ID'; // Процедура вставки записи в таблицу
    StProcFoto.Transaction.StartTransaction;
    StProcFoto.Prepare;
    StProcFoto.ParamByName('IN_ID_FOTO').AsInteger := DSetFoto.fbn('ID_FOTO').AsInteger;
    StProcFoto.ExecProc; // выполняем
    try
        if not SaveDialog.Execute then
            Exit;
        StProcFoto.FieldByName('FOTO').SaveToFile(SaveDialog.FileName);
        StProcFoto.Transaction.Commit;
    except
        on E: Exception do
        begin
            StProcFoto.Transaction.Rollback;
            ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
        end;
    end;
end;

procedure TfModifyMan.AddFotoBtnClick(Sender: TObject);
var
    HandlePack: HModule;
    MDIFUNC: function(AOwner: TComponent; DBM, DB: TISC_DB_HANDLE; AIdMan: Integer): Variant; stdcall;
    Res: Variant;
begin
    if IdMan = -1 then
        if not AskToInsMan(InsMan_Message) then
            Exit;

    HandlePack := GetModuleHandle('SpAllPeople_Foto.bpl');
    if HandlePack < 32
        then
    try
        Screen.Cursor := crHourGlass;
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'SpAllPeople_Foto.bpl');
    finally
        Screen.Cursor := crDefault;
    end;

    if HandlePack > 0 then
    begin
        @MDIFUNC := GetProcAddress(HandlePack, PChar('AddFoto'));
        if @MDIFUNC <> nil
            then
            Res := MDIFUNC(Self, DB.Handle, DBFoto.Handle, IdMan);
    end
    else
    begin
        MessageBox(TForm(Self).Handle, PChar('Неможливо завантажити' + #13 + 'SpAllPeople_Foto.bpl'), PChar('Помилка'), MB_OK and MB_ICONWARNING);
        Res := NULL;
    end;
    RefreshFoto;
end;

function TfModifyMan.ValidateTIN: Boolean;
var
    Str: string;
    BDate: TDate;
    ViewMessageForm: TForm;
    i: integer;
begin
    Result := True;
    if not ((TinEdit.Text = '') or (BirthDateEdit.Text = '')) then
    begin
        // Если ИНН ненастоящий, то делать нам тут нечего
        if Length(TinEdit.Text) < 10 then
            Exit;

        {Проверяем первые пять цифр ИД номера. Они образуют число, которое равно
        количеству дней от 01.01.1900 до даты рождения, т.е. :

        31.12.1899 + N = Дата_рождения
        (N - количество дней - первые пять цифр).

        Если ИД номер не проходит проверку, то выдается сообщение
        и дается возможность вернуться в редактирование и продолжить
        сохранение. Сообщение должно содержать
         вариант начала ИД номера (по введенной дате рождения),
         и вариант даты рождения(по введенному ИД номеру).
        }
        Str := Copy(TinEdit.Text, 1, 5);
        BDate := StrToInt(Str) + 1;
        if BDate <> BirthDateEdit.EditValue then
        begin
            //******************************************************************************
            ViewMessageForm := CreateMessageDialog('Введений податковий номер не відповідає даті народження.' + #13
                + 'Можливі варіанти податкового коду та дати народження, відповідно:' + #13
                + TinEdit.Text + ' - ' + DateToStr(BDate) + #13
                + IntToStr(Integer(BirthDateEdit.EditValue) - 1) + Copy(TinEdit.Text, 6, 5) + ' - ' + BirthDateEdit.Text, mtWarning, [mbYes, mbNo]);
            with ViewMessageForm do
            begin
                for i := 0 to ComponentCount - 1 do
                    if (Components[i].ClassType = TButton) then
                    begin
                        if UpperCase((Components[i] as TButton).Caption) = '&YES' then
                        begin
                            (Components[i] as TButton).Left := 15;
                            (Components[i] as TButton).Caption := 'Повернутися до редагування';
                            (Components[i] as TButton).Width := 240;
                        end;
                        if UpperCase((Components[i] as TButton).Caption) = '&NO' then
                        begin
                            (Components[i] as TButton).Left := 260;
                            (Components[i] as TButton).Caption := 'Продовжити збереження';
                            (Components[i] as TButton).Width := 150;
                        end;
                    end;
                Caption := 'Увага';
                i := ShowModal;
                Free;
            end;
            case i of
                mrYes:
                    begin
                        Result := False;
                        PeoplePageControl.ActivePage := MainPage;
                        TinEdit.SetFocus;
                    end;
                mrNo:
                    begin
                        Result := True;
                    end;
            end;
            //******************************************************************************
        end;
    end
    else
    begin
        //******************************************************************************
        ViewMessageForm := CreateMessageDialog('Не вказано '
            + IfThen(TinEdit.Text = '', 'податковий номер', '')
            + IfThen((TinEdit.Text = '') and (BirthDateEdit.Text = ''), ' та ', '')
            + IfThen(BirthDateEdit.Text = '', 'дату народження', '') + '!',
            mtWarning, [mbYes, mbNo]);
        with ViewMessageForm do
        begin
            Width := 425;
            Position := poScreenCenter;
            for i := 0 to ComponentCount - 1 do
                if (Components[i].ClassType = TButton) then
                begin
                    if UpperCase((Components[i] as TButton).Caption) = '&YES' then
                    begin
                        (Components[i] as TButton).Left := 15;
                        (Components[i] as TButton).Caption := 'Повернутися до редагування';
                        (Components[i] as TButton).Width := 240;
                    end;
                    if UpperCase((Components[i] as TButton).Caption) = '&NO' then
                    begin
                        (Components[i] as TButton).Left := 260;
                        (Components[i] as TButton).Caption := 'Продовжити збереження';
                        (Components[i] as TButton).Width := 150;
                    end;
                end;
            Caption := 'Увага';
            i := ShowModal;
            Free;
        end;
        case i of
            mrYes:
                begin
                    Result := False;
                    PeoplePageControl.ActivePage := MainPage;
                    if BirthDateEdit.Text = '' then
                        BirthDateEdit.SetFocus
                    else
                        TinEdit.SetFocus;
                end;
            mrNo:
                begin
                    //*********
                    TIN := '';
                    //*********
                    Result := True;
                    //***
                    //PeoplePageControl.ActivePage:=MainPage;
                    //***
                end;
        end;
        //******************************************************************************
    end;
end;

procedure TfModifyMan.DelFotoBtnClick(Sender: TObject);
begin
    if DSetFoto.IsEmpty then
        Exit;
    if ZShowMessage('Вилучення', 'Ви справді бажаєте вилучити фото?', mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
        try
            StProcFoto.Transaction.StartTransaction;
            StProcFoto.StoredProcName := 'FOTO_MAIN_D';
            StProcFoto.Prepare;
            StProcFoto.ParamByName('IN_ID_FOTO').AsInteger := DSetFoto['ID_FOTO'];
            StProcFoto.ExecProc;
            StProcFoto.Transaction.Commit;
            DelFotoProc.Transaction.StartTransaction;
            DelFotoProc.StoredProcName := 'UP_DT_CERT_MAN_FOTO_I_D';
            DelFotoProc.Prepare;
            DelFotoProc.ParamByName('ID_FOTO').AsInteger := DSetFoto['ID_FOTO']; //DSetFoto.FieldByName('ID_FOTO').AsInteger;
            DelFotoProc.ParamByName('IS_INSERT').AsInteger := 0;
            DelFotoProc.ExecProc;
            DelFotoProc.Transaction.Commit;
            RefreshFoto;
        except
            on e: Exception do
            begin
                StProcFoto.Transaction.Rollback;
                DelFotoProc.Transaction.Rollback;
                ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
            end;
        end;
    end;
end;

procedure TfModifyMan.cmnDATE_FOTOGetDisplayText(
    Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
    var AText: string);
begin
    AText := 'Від ' + AText;
end;

function TfModifyMan.GetCorrectTIN: Variant;
begin
    if Trim(TIN) = '' then
        Result := Null
    else
        Result := TIN;
end;

procedure TfModifyMan.UpdateFIOOnForm;
begin
    ProcPassData.Transaction.StartTransaction;
    try
        ProcPassData.ExecProcedure('PEOPLE_UPDATE_FIO_BY_PASS', [IdMan]);

        FamiliaEdit.Text := ProcPassData.FN('Familia').AsString;
        ImyaEdit.Text := ProcPassData.FN('Imya').AsString;
        OtchestvoEdit.Text := ProcPassData.FN('Otchestvo').AsString;
        CopyFIOBtnClick(Self);

        ProcPassData.Transaction.Commit;
    except
        on e: Exception do
        begin
            ProcPassData.Transaction.Rollback;
            ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
        end;
    end;
end;

procedure TfModifyMan.PeoplePageControlChange(Sender: TObject);
begin
    if (IdMan = -1) and (PeoplePageControl.ActivePage = BankCardPage) then
        if not AskToInsMan(InsMan_Message) then
            Exit
        else
            pBankCardFrame := TframeCard.Create(BankCardPage, DB.Handle, FMode, IdMan, TinEdit.Text);
end;

procedure TfModifyMan.ManEditPropertiesValidate(Sender: TObject;
    var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
    s: string;
begin
    // удаляем пробелы  в начале и в конце фамилии, имени и т.д.
    s := VarToStr(DisplayValue);
    if Length(s)<1 then Exit;
    while s[1] = ' ' do
        Delete(s, 1, 1);
    while s[Length(s)] = ' ' do
        Delete(s, Length(s), 1);
    DisplayValue := s;
end;

procedure TfModifyMan.GromodPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
var
    AdressesSp: TSprav;
    ShowStyle, Select: Integer;
    IdAdr: Variant;
    id: Integer;
begin
    AdressesSp := GetSprav('Adresses');
    if (AdressesSp <> nil) then
    begin
        with AdressesSp.Input do
        begin
            Edit;
            FieldValues['Id_Adress'] := IdAdr;
            FieldValues['DbHandle'] := Integer(DB.Handle);
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := 6;
            Post;
        end;

        AdressesSp.Show;
        // ShowMessage(AdressesSp.Output['Name_Adr']);
        if (not VarIsNull(AdressesSp.Output['Name_Adr']))
            then
        begin
            Gromod.Text := AdressesSp.Output['Name_Adr'];
            FidGrom := AdressesSp.Output['id_adress'];
            pManModified := True;
        end;
    end;
end;

procedure TfModifyMan.GromodEditing(Sender: TObject; var CanEdit: Boolean);
begin
    pManModified := True;
end;

procedure TfModifyMan.FormShow(Sender: TObject);
begin
    {if (RusFamEdit.IsFocused or RusImyaEdit.IsFocused or RusOtchEdit.IsFocused) then
    begin
    Showmessage('Aaaa!');
      LoadKeyboardLayout('00000419', 1);
    //  ActivateKeyboardLayout(00000419, KLF_SETFORPROCESS);
    end;  }
end;

procedure TfModifyMan.RusFamEditEnter(Sender: TObject);
begin
    LoadKeyboardLayout('00000419', 1);
end;

procedure TfModifyMan.RusImyaEditEnter(Sender: TObject);
begin
    LoadKeyboardLayout('00000419', 1);
end;

procedure TfModifyMan.RusOtchEditEnter(Sender: TObject);
begin
    LoadKeyboardLayout('00000419', 1);
end;

procedure TfModifyMan.RusFamEditExit(Sender: TObject);
begin
    LoadKeyboardLayout('00000422', 1);
end;

procedure TfModifyMan.RusOtchEditExit(Sender: TObject);
begin
    LoadKeyboardLayout('00000422', 1);
end;

procedure TfModifyMan.RusImyaEditExit(Sender: TObject);
begin
    LoadKeyboardLayout('00000422', 1);
end;

procedure TfModifyMan.LiveAdressEditKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        BirthPlaceEdit.SetFocus;
end;

procedure TfModifyMan.ClearLiveAdrBtnClick(Sender: TObject);
begin
    LiveAdressEdit.Text := '';
    FIdLiveAdress := -1;
    pManModified := True;
end;

procedure TfModifyMan.CopyBirthPlaceClick(Sender: TObject);
begin
    if not (FIdBirthAdress > 0) then // т.е. место рождения не указано => мы предполагаем его сами
        SetDefaultBirthPlace(FIdCurrentAdress);
end;

procedure TfModifyMan.CopyAdressBtnClick(Sender: TObject);
begin
    if not (FIdCurrentAdress > 0) then
    begin
        AdressEdit.Text := LiveAdressEdit.Text;
        FIdCurrentAdress := FIdLiveAdress;
    end;
end;

end.

