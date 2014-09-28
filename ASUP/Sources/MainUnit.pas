{ -$Id: MainUnit.pas,v 1.138 2010/09/28 15:25:27 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                                Главный модуль                                }
{       Загрузка программы, считывание конфигурации, соединение с БД,          }
{       управление главным меню                                                }
{                                                  ответственный: Олег Волков  }
{ Autumn edition!}

unit MainUnit;

interface

uses
  //TCClient,
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Db, IBDatabase, IniFiles, SpComboBox, IBCustomDataSet, IBQuery,
    EditControl, OrdersViewUnit, Menus, ExtCtrls, SpCommon,
    PersonalCommon, Buttons, ToolWin, ComCtrls, Grids, DBGrids,
    LogInFormUnit, SpPostUnit, SpTarNetUnit, TarDigits, SpWorkTimeNorm,
    ShtatRas, EducReportUnit, WomenReportUnit, WarReportUnit, ShtatPrint,
    PostBonus, AccMGMT, ActnList, ImgList, StdActns, SpStajUnit,
    ManBonus, UniPrint, SpWorkMode, SpHolidayUnit,
    ImportPeople, AutoAccept, ExportLog, XPMan, ADODB, Buffer,
    UchetWremenyUnit, ImportLog, SpVidopl, BirthDayReportUnit, FormPlanShtat,
    PensiaReportUnit, ReportVedomostPrinatihUnit, ChildredReportUnit,
    FIBDatabase, pFIBDatabase, SpSpecUnit, KvalFormUnit, Variants,
    UCalendar, SpSR, uTimeTable, uDepartmentGroup, uTablePrint,
    MedicReportUnit, ReestrMainUnit, ProcessUnit, U_SpOklMinMax,
    uTableChangesPrint, uUserButton, uTableCommon, uTableDump, TableCentral,
    WorkModeCentral, ShellApi, uRunOnce, uSysParams,
    ReportAcceptedPBank, uCommonSp, uActionControl, AccMgmtBpl, uOrdersCanc,
    uMovingTable, RxVerInf, SysAdmin, Registry, MDIToolBar,
    FIBDataSet, pFIBDataSet, qFTools, AppEvnts, fib, PackageLoad;

type
    TMain = class(TForm)
        ChermetDatabase: TIBDatabase;
        DefaultTransaction: TIBTransaction;
        WriteTransaction: TIBTransaction;
        ReadTransaction: TIBTransaction;
        MainMenu1: TMainMenu;
        Work: TMenuItem;
        PCards: TMenuItem;
        Orders: TMenuItem;
        Sp: TMenuItem;
        Departments: TMenuItem;
        People: TMenuItem;
        Print: TMenuItem;
        War: TMenuItem;
        WarPost: TMenuItem;
        WarSostav: TMenuItem;
        WarPostGroup: TMenuItem;
        Window: TMenuItem;
        N1: TMenuItem;
        ExitItem: TMenuItem;
        HelpMenu: TMenuItem;
        OsvitaItem: TMenuItem;
        ServiceItem: TMenuItem;
        Educ_Org: TMenuItem;
        Staff: TMenuItem;
        Category: TMenuItem;
        Post: TMenuItem;
        TarNet: TMenuItem;
        TarDigits: TMenuItem;
        N4: TMenuItem;
        N5: TMenuItem;
        SPZ: TMenuItem;
        WorkTimeNorm: TMenuItem;
        ShtatRas: TMenuItem;
        N7: TMenuItem;
        ShtatRasView: TMenuItem;
        CondSp: TMenuItem;
        FormPaySp: TMenuItem;
        EducItem: TMenuItem;
        WomenReportItem: TMenuItem;
        WarReportItem: TMenuItem;
        ShtatPrintItem: TMenuItem;
        N9: TMenuItem;
        BonusType: TMenuItem;
        PostBonus: TMenuItem;
        ControlBar1: TControlBar;
        StandartToolBar: TToolBar;
        UserQuery: TIBQuery;
        ReLoginItem: TMenuItem;
        ActionList1: TActionList;
        Act_Exit: TAction;
        Act_ReLogin: TAction;
        TB_Exit: TToolButton;
        TB_ReLogin: TToolButton;
        Cascade1: TMenuItem;
        N12: TMenuItem;
        N13: TMenuItem;
        N14: TMenuItem;
        WindowCascade1: TWindowCascade;
        WindowTileHorizontal1: TWindowTileHorizontal;
        WindowTileVertical1: TWindowTileVertical;
        WindowMinimizeAll1: TWindowMinimizeAll;
        EditCopy1: TEditCopy;
        EditCut1: TEditCut;
        EditDelete1: TEditDelete;
        EditPaste1: TEditPaste;
        EditSelectAll1: TEditSelectAll;
        EditUndo1: TEditUndo;
        EditToolBar: TToolBar;
        ToolButton1: TToolButton;
        ToolButton2: TToolButton;
        ToolButton3: TToolButton;
        ToolButton4: TToolButton;
        ToolButton6: TToolButton;
        ExecOrders: TAction;
        ExecPCards: TAction;
        ExecSR: TAction;
        StartToolBar: TToolBar;
        Act_ImageList: TImageList;
        ToolButton5: TToolButton;
        ToolButton7: TToolButton;
        ToolButton8: TToolButton;
        StatusPanel: TPanel;
        UserLabel: TLabel;
        N11: TMenuItem;
        VacanciesItem: TMenuItem;
        ExecPrintForm: TAction;
        WorkModesItem: TMenuItem;
        N8: TMenuItem;
        TableItem: TMenuItem;
        VihodItem: TMenuItem;
        HolidayItem: TMenuItem;
        ImportPeopleItem: TMenuItem;
        AutoAcceptItem: TMenuItem;
        SettingsItem: TMenuItem;
        PanelsItem: TMenuItem;
        KillemItem: TMenuItem;
        DBPathLabel: TLabel;
        AdminLabel: TLabel;
        DismissAllItem: TMenuItem;
        StajItem: TMenuItem;
        N6: TMenuItem;
        N10: TMenuItem;
        N15: TMenuItem;
        VidoplItem: TMenuItem;
        Mark: TMenuItem;
        CalendarItem: TMenuItem;
        ExecTable: TAction;
        ExecRating: TAction;
        BuffQuery: TIBQuery;
        InfoQuery: TIBQuery;
        BReportItem: TMenuItem;
        ReBuffer: TMenuItem;
        RealShtatRas: TMenuItem;
        PensiaItem: TMenuItem;
        UchetItem: TMenuItem;
        ReportPrinatih: TMenuItem;
        ReportDismissed: TMenuItem;
        TablePrint: TMenuItem;
        ExternReports: TMenuItem;
        ChildItem: TMenuItem;
        HolidaysReport: TMenuItem;
        SpOrdersMenu: TMenuItem;
        SpPunishingItem: TMenuItem;
        SpAwardItem: TMenuItem;
        SpPrivForm: TMenuItem;
        ResultQuery: TIBQuery;
        WorkQuery: TIBQuery;
        InitExport: TMenuItem;
        ResultQuery2: TIBQuery;
        FIBDatabase: TpFIBDatabase;
        AdrDefaultTransaction: TpFIBTransaction;
        AdrWriteTransaction: TpFIBTransaction;
        AdrReadTransaction: TpFIBTransaction;
        N17: TMenuItem;
        N18: TMenuItem;
        N19: TMenuItem;
        SRItem: TMenuItem;
        ExeVersionLabel: TLabel;
        DBVersion: TIBQuery;
        BufferCleanItem: TMenuItem;
        HospItem: TMenuItem;
        N20: TMenuItem;
        N21: TMenuItem;
        N23: TMenuItem;
        ManComandItem: TMenuItem;
        AllBuffersItem: TMenuItem;
        ExitTimer: TTimer;
        ExitLabel: TLabel;
        SecTimer: TTimer;
        SessionTransaction: TIBTransaction;
        SessionQuery: TIBQuery;
        ToolButton11: TToolButton;
        ForDeveloperItem: TMenuItem;
        DontWriteDbfItem: TMenuItem;
        DontWriteTableItem: TMenuItem;
        TestItem: TMenuItem;
        ShowQueryItem: TMenuItem;
        DesignReportItem: TMenuItem;
        SpDeptGroupItem: TMenuItem;
        MedicReportItem: TMenuItem;
        ReportVakant: TMenuItem;
        BonusReport: TMenuItem;
        ToolButton9: TToolButton;
        ExecHospital: TAction;
        CheckItem: TMenuItem;
        ExecCheck: TAction;
        HospReestrItem: TMenuItem;
        Accepted2Item: TMenuItem;
        VilkiItem: TMenuItem;
        mFIBReadTransaction: TpFIBTransaction;
        mFIBWriteTransaction: TpFIBTransaction;
        TableChangesItem: TMenuItem;
        UserButton1: TButton;
        UserButton2: TButton;
        UserButton3: TButton;
        ExecTablePrint: TAction;
        ExecPost: TAction;
        ExecDepartments: TAction;
        ExecTableChangesPrint: TAction;
        TableDump: TMenuItem;
        PensiaItem2: TMenuItem;
        WorkModeFixItem: TMenuItem;
        ExecVilki: TAction;
        ExecWorkMode: TAction;
        HolidayAndHospitalIntersectItem: TMenuItem;
        UchetWremenyAction: TAction;
        Educ2Item: TMenuItem;
        N2: TMenuItem;
        AcceptedForPBankItem: TMenuItem;
        OrdersHeaderItem: TMenuItem;
        PochasFact: TMenuItem;
        MovesReportItem: TMenuItem;
        DeadWorkersItem: TMenuItem;
        AsupParams: TMenuItem;
        AsupParamsAction: TAction;
        AsupParamsActionControl: TqFActionControl;
        SysAdminItem: TMenuItem;
        ErrorsItem: TMenuItem;
        ExecAdress: TAction;
        N16: TMenuItem;
        OrdersCancItem: TMenuItem;
        BufferPrepare: TMenuItem;
        AllReportsItem: TMenuItem;
        NewOrdersSpItem: TMenuItem;
        SpDismissionItem: TMenuItem;
        SpMovingTypeItem: TMenuItem;
        SpPoschasTarifItem: TMenuItem;
        TestLabel: TLabel;
        ExecOrdersCanc: TAction;
        ExecPochasFact: TAction;
        ZPBuffersItem: TMenuItem;
        N3: TMenuItem;
        N24: TMenuItem;
        WhatsNewItem: TMenuItem;
        StajCalc: TMenuItem;
        RaiseStajItem: TMenuItem;
        N25: TMenuItem;
        N22: TMenuItem;
        AllVuzBuffersItem: TMenuItem;
        SpPCards: TMenuItem;
        N27: TMenuItem;
        N28: TMenuItem;
        N26: TMenuItem;
        N29: TMenuItem;
        HospHolOrderItem: TMenuItem;
        BonusSmetItem: TMenuItem;
        NichItem: TMenuItem;
        OrdersMHelpPremia: TMenuItem;
        WAccReportItem: TMenuItem;
        AllReports: TMenuItem;
        ShowPrint: TAction;
        MenuQuery: TpFIBDataSet;
        HolPlan: TMenuItem;
        ReminderItem: TMenuItem;
        ListPeopleItem: TMenuItem;
        CertItem: TMenuItem;
        ApplicationEventsDisconnect: TApplicationEvents;
        PersonStaj: TMenuItem;
        procedure QuitButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OrdersClick(Sender: TObject);
        procedure PeopleClick(Sender: TObject);
        procedure ExitItemClick(Sender: TObject);
        procedure WarPostClick(Sender: TObject);
        procedure WarSostavClick(Sender: TObject);
        procedure WarPostGroupClick(Sender: TObject);
        procedure Educ_OrgClick(Sender: TObject);
        procedure CategoryClick(Sender: TObject);
        procedure ChermetDatabaseBeforeConnect(Sender: TObject);
        procedure TarNetClick(Sender: TObject);
        procedure TarDigitsClick(Sender: TObject);
        procedure SPZClick(Sender: TObject);
        procedure WorkTimeNormClick(Sender: TObject);
        procedure ShtatRasViewClick(Sender: TObject);
        procedure CondSpClick(Sender: TObject);
        procedure FormPaySpClick(Sender: TObject);
        procedure EducItemClick(Sender: TObject);
        procedure WomenReportItemClick(Sender: TObject);
        procedure WarReportItemClick(Sender: TObject);
        procedure ShtatPrintItemClick(Sender: TObject);
        procedure BonusTypeItemClick(Sender: TObject);
        procedure PostBonusClick(Sender: TObject);
        procedure Act_ExitExecute(Sender: TObject);
        procedure Act_ReLoginExecute(Sender: TObject);
        procedure ExecOrdersExecute(Sender: TObject);
        procedure ExecPCardsExecute(Sender: TObject);
        procedure ExecSRExecute(Sender: TObject);
        procedure VacanciesItemClick(Sender: TObject);
        procedure StajItemClick(Sender: TObject);
        procedure ExecPrintFormExecute(Sender: TObject);
        procedure VihodItemClick(Sender: TObject);
        procedure HolidayItemClick(Sender: TObject);
        procedure ImportPeopleItemClick(Sender: TObject);
        procedure KillemItemClick(Sender: TObject);
        procedure AutoAcceptItemClick(Sender: TObject);
        procedure DismissAllItemClick(Sender: TObject);
        procedure ExportLogItemClick(Sender: TObject);
        procedure N6Click(Sender: TObject);
        procedure N10Click(Sender: TObject);
        procedure N15Click(Sender: TObject);
        procedure VidoplItemClick(Sender: TObject);
        procedure CalendarItemClick(Sender: TObject);
        procedure ExecRatingExecute(Sender: TObject);
        procedure ExecTableExecute(Sender: TObject);
        procedure ExportLogClick(Sender: TObject);
        procedure ImportDataClick(Sender: TObject);
        procedure BReportItemClick(Sender: TObject);
        procedure ReBufferClick(Sender: TObject);
        procedure FormPlanShtatRasClick(Sender: TObject);
        procedure PlanShtatRasItemClick(Sender: TObject);
        procedure PensiaItemClick(Sender: TObject);
        procedure RealShtatRasClick(Sender: TObject);
        procedure ReportPrinatihClick(Sender: TObject);
        procedure ReportDismissedClick(Sender: TObject);
        procedure ExternReportsClick(Sender: TObject);
        procedure ChildItemClick(Sender: TObject);
        procedure HolidaysReportClick(Sender: TObject);
        procedure SpPunishingItemClick(Sender: TObject);
        procedure SpAwardItemClick(Sender: TObject);
        procedure SpPrivFormClick(Sender: TObject);
        procedure InitExportClick(Sender: TObject);
        procedure SRItemClick(Sender: TObject);
        procedure BufferCleanItemClick(Sender: TObject);
        procedure ManComandItemClick(Sender: TObject);
        procedure AllBuffersItemClick(Sender: TObject);
        procedure ExitTimerTimer(Sender: TObject);
        procedure SecTimerTimer(Sender: TObject);
        procedure ChermetDatabaseBeforeDisconnect(Sender: TObject);
        procedure PrintClick(Sender: TObject);
        procedure SpClick(Sender: TObject);
        procedure DontWriteTableItemClick(Sender: TObject);
        procedure DontWriteDbfItemClick(Sender: TObject);
        procedure TestItemClick(Sender: TObject);
        procedure ShowQueryItemClick(Sender: TObject);
        procedure DesignReportItemClick(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure SpDeptGroupItemClick(Sender: TObject);
        procedure MedicReportItemClick(Sender: TObject);
        procedure ReportVakantClick(Sender: TObject);
        procedure BonusReportClick(Sender: TObject);
        procedure ExecHospitalExecute(Sender: TObject);
//        procedure ExecCheckExecute(Sender: TObject);
        procedure HospReestrItemClick(Sender: TObject);
        procedure Accepted2ItemClick(Sender: TObject);
        procedure ExecTablePrintExecute(Sender: TObject);
        procedure UserButton1MouseUp(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure ExecPostExecute(Sender: TObject);
        procedure ExecDepartmentsExecute(Sender: TObject);
        procedure ExecTableChangesPrintExecute(Sender: TObject);
        procedure UserButton1Click(Sender: TObject);
        procedure TableDumpClick(Sender: TObject);
        procedure PensiaItem2Click(Sender: TObject);
        procedure WorkModeFixItemClick(Sender: TObject);
        procedure ExecVilkiExecute(Sender: TObject);
        procedure ExecWorkModeExecute(Sender: TObject);
        procedure HolidayAndHospitalIntersectItemClick(Sender: TObject);
        procedure ServiceItemClick(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure UchetWremenyActionExecute(Sender: TObject);
        procedure Educ2ItemClick(Sender: TObject);
        procedure AcceptedForPBankItemClick(Sender: TObject);
        procedure OrdersHeaderItemClick(Sender: TObject);
        procedure MovesReportItemClick(Sender: TObject);
        procedure DeadWorkersItemClick(Sender: TObject);
        procedure AsupParamsActionControlGetKeys(Sender: TObject;
            var ValueString: Variant);
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure SysAdminItemClick(Sender: TObject);
        procedure ErrorsItemClick(Sender: TObject);
        procedure ExecAdressExecute(Sender: TObject);
        procedure BufferPrepareClick(Sender: TObject);
        procedure SpDismissionItemClick(Sender: TObject);
        procedure SpMovingTypeItemClick(Sender: TObject);
        procedure SpPoschasTarifItemClick(Sender: TObject);
        procedure ExecOrdersCancExecute(Sender: TObject);
        procedure ExecPochasFactExecute(Sender: TObject);
        procedure N3Click(Sender: TObject);
        procedure N24Click(Sender: TObject);
        procedure WhatsNewItemClick(Sender: TObject);
        procedure StajCalcClick(Sender: TObject);
        procedure RaiseStajItemClick(Sender: TObject);
        procedure AllVuzBuffersItemClick(Sender: TObject);
        procedure N27Click(Sender: TObject);
        procedure N28Click(Sender: TObject);
        procedure N26Click(Sender: TObject);
        procedure N29Click(Sender: TObject);
        procedure HospHolOrderItemClick(Sender: TObject);
        function CloseAllAccess: Boolean;
        procedure BonusSmetItemClick(Sender: TObject);
        procedure OrdersMHelpPremiaClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure ForDeveloperItemClick(Sender: TObject);
        procedure SettingsItemClick(Sender: TObject);
        procedure WAccReportItemClick(Sender: TObject);
        procedure ShowPrintExecute(Sender: TObject);
        procedure SpravMenuItemHandler(Sender: TObject);
        procedure HolPlanClick(Sender: TObject);
        procedure ExecCheckExecute(Sender: TObject);
        procedure ReminderItemClick(Sender: TObject);
        procedure ListPeopleItemClick(Sender: TObject);
        procedure CertItemClick(Sender: TObject);
        procedure ApplicationEventsDisconnectException(Sender: TObject; E: Exception);
        procedure PersonStajClick(Sender: TObject);
    private
        procedure LogIn(AFirstTime: boolean);
        procedure ShowUserName;
        procedure ShowToolBar(Sender: TObject);
        procedure ShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo:
            THintInfo);
        procedure IdleHandler(Sender: TObject; var Done: Boolean);
        procedure HelpItemClick(Sender: TObject);
        procedure LoadMenu;
        procedure ShowOnMenu;
    public
        procedure SetCaption;
        procedure PrepareForm2;
    end;

var
    Main: TMain;

resourcestring
    NagCaption = 'Управління персоналом: процесс триває...';

implementation

uses ExternProgsUnit, PeopleViewUnit, PCardsViewUnit, DepartmentsViewUnit,
    SpWarpostUnit, SpWarSostavUnit, SpEducOrgUnit, SpFormUnit, MarkUnit, CRC32,
    ReBufferUnit, SpAwardUnit, SpPrivUnit, uCheckMain,
    BufferCleanUnit, ManComandFactUnit, NagScreenUnit, AllBuffersUnit,
    GoodFunctionsUnit,
    Date_Form, BonusReportUnit, ReportAccepted2,
    ReportHolidayAndHospitalCrossingUnit,
    Orders2ViewUnit, RxMemDS, uWhatsNew, uUpLoad, UPPInfo, AllPeopleUnit, Ztypes;

{$R *.DFM}

procedure TMain.LoadMenu;
var
    mi: TMenuItem;
begin
    {подгружаем справочники основываясь на правах пользователя}
    try
        MenuQuery.Close;
        MenuQuery.SQLs.SelectSQL.Text := 'Select * from Up_Dt_Sprav_Menu_Sel('+IntToStr(GetUserID)+')';
        MenuQuery.Open;
        while not MenuQuery.Eof do
        begin
            mi := TMenuItem.Create(Sp);
            mi.Caption := MenuQuery['Menu_Item_Name'];
            mi.Visible := True;
            mi.OnClick := SpravMenuItemHandler;
            Sp.Add(mi);
            MenuQuery.Next;
        end;
    except
        qFErrorDialog('Помилка при формуванні меню довідників. Натисніть OK щоб продовжити роботу.');
    end;
end;

procedure TMain.SpravMenuItemHandler(Sender: TObject);
var
    sp: TSprav;
begin
    if Sender is TMenuItem then
        if MenuQuery.Locate('Menu_Item_Name', (Sender as TMenuItem).Caption, []) then
        begin
            sp := GetSprav(MenuQuery['Bpl_Name']);
            if sp <> nil then
            begin
                with sp.Input do
                begin
                    Append;
                    FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                    FieldValues['ShowStyle'] := 1;
                    FieldValues['Select'] := 0;
                    Post;
                end;
                sp.Show;
            end;
        end;
end;


function TMain.CloseAllAccess: Boolean;
var res: integer;
begin
    res := fibCheckPermission('/ROOT/CloseAllAccess', 'Belong');
//  ShowMessage(IntToStr(res));
    if (res = ACCMGMT_OK)
        then
    begin
        MessageDlg('Ви не маєте прав доступу до цього пункту!', mtError, [mbYes], -1);
        result := true;
    end
    else
        result := False;
end;


procedure TMain.SetCaption;
begin
          // Сгенерить корректный заголовок формы
    if not FirmQuery.IsEmpty then
        Caption := StringReplace(Caption, '%f', FirmQuery['Name'], [])
    else
        Caption := StringReplace(Caption, '%f', '', []);

    if newversion then
        Caption := Caption + ' [ВЕРСІЯ 2]';

    if newversion then
        LoadMenu;
end;

procedure TMain.FormCreate(Sender: TObject);
var
    i: Integer;
    TempItem: TMenuItem;
    s, s2: string;
    NewMenuItem: TMenuItem;
    TempQuery: TIBQuery;
    VerInf: TVersionInfo;
    reg: TIniFile;
    sp: TSprav;
begin
        // загрузить параметры базы из ini-файла
    reg := TIniFile.Create('.\config.ini');

    if reg = nil then
    begin
        MessageDlg('Не знайдено конфігураційний файл "Config.ini"', mtError, [mbOk],
            0);
        Application.Terminate;
        Exit;
    end;

          // Загружаем путь к dbf-файлам буферов
    try
        DBF_PATH := reg.ReadString('Params', 'DBF_PATH', '.\dbf');
        IMPORT_PATH := reg.ReadString('Params', 'IMPORT_PATH', '.\dbf');
        if reg.ReadString('Params', 'Log', 'F') = 'T' then
            LogOn;
        if reg.ReadString('Params', 'ShowQuery', 'F') = 'T' then
            ShowQuery := True;
        if reg.ReadString('Params', 'DesignReport', 'F') = 'T' then
            sDesignReport := True;
        Test := (reg.ReadString('Params', 'Test', 'F') = 'T');
        NewTable := (reg.ReadString('Params', 'NewTable', 'F') = 'T');
        Version := reg.ReadInteger('Params', 'Version', 1);
            // если не в первой версии, забить на DBF
        if Version <> 1 then
        begin
            DontWriteToDbf := True;
            Buffer.DontWriteToDbf := True;
        end;
                // если в ини файле нет инфы, в ДБФ не пишем
        DontWriteToDbf := (reg.ReadString('Params', 'DontWriteToDbf', 'T') = 'T');

        DontWriteTableToDbf := (reg.ReadString('Params', 'DontWriteTableToDbf', 'T')
            = 'T');

        NewOrders := (reg.ReadString('Params', 'NewOrders', 'F') = 'T');
        FirstInstall := (reg.ReadString('Params', 'FirstInstall', 'F') = 'T');
        ImportType := reg.ReadInteger('Params', 'ImportType', 1);
        ImportPeopleDbf := reg.ReadString('Params', 'ImportPeopleDbf',
            'pep_data.dbf');
        ImportPodrDbf := reg.ReadString('Params', 'ImportPodrDbf', 'sp_podrb.dbf');
        ImportPostDbf := reg.ReadString('Params', 'ImportPostDbf', 'sp_post.dbf');
    finally
        reg.Free;
    end;

  // установить нормальный формат даты для DateToStr
    ShortDateFormat := 'dd.mm.yyyy';


  // Сгенерировать меню панелей управления
    for i := 1 to ControlBar1.ControlCount do
    begin
        TempItem := TMenuItem.Create(self);
        TempItem.Name := 'ToolBarItem' + IntToStr(i);
        TempItem.Caption := TToolBar(ControlBar1.Controls[i - 1]).Caption;
        TempItem.Checked := True;
        TempItem.Tag := i;
        TempItem.OnClick := ShowToolBar;
        PanelsItem.Add(TempItem);
    end;

  // Установить обработчик хинтов
    Application.OnShowHint := ShowHint;


    // отобразить версию экзешника
    try
        VerInf := TVersionInfo.Create(Application.ExeName);
        if VerInf.Valid then
            ExeVersionLabel.Caption := 'Версія exe-файлу: ' + VerInf.FileVersion;
        VerInf.Free;
    except
    end;

  // загрузить пользовательские кнопочки
    LoadUserButton(UserButton1, ActionList1);
    LoadUserButton(UserButton2, ActionList1);
    LoadUserButton(UserButton3, ActionList1);

    if Version = 2 then
        ShowInDecimals := True
    else
        ShowInDecimals := False;

            // в первой версии пишем в ДБФ всегда!
    if Version = 1 then
        DontWriteToDbf := False;

  // если не в первой версии, забить на DBF
    if Version <> 1 then
        DontWriteToDbf := True;

    newversion := false;
      // А если мы хотим режим админа? :) а может, протоколирование?
    for i := 1 to ParamCount do
    begin
        if ParamStr(i) = 'iddqd' then
            AdminMode := True;
        if ParamStr(i) = 'idclip' then
            NoPassMode := True;
        if ParamStr(i) = 'idkfa' then
            Developer := True;
        if ParamStr(i) = 'test' then
            Test := True;
        if ParamStr(i) = 'log' then
            LogOn;

        //Новые приказы
        if ParamStr(i) = 'newversion'
            then
            newversion := true;
    end;

    if (Version = 2) and not NewVersion then CheckItem.Visible := True;

    ShowOnMenu;
end;

procedure TMain.ChermetDatabaseBeforeConnect(Sender: TObject);
begin
{  if FileSearch('Config.ini', ProgramPath) = '' then                       `
  begin
    MessageDlg('Не знайдено конфігураційний файл "Config.ini"', mtError, [mbOk],
      0);
    Application.Terminate;
    Application.ProcessMessages;
    Exit;
  end;

  // загрузить параметры базы из ini-файла
  with ChermetDatabase do
  begin
    // загрузить параметры базы из ini-файла
    reg := TIniFile.Create('.\config.ini');
    DatabaseName := reg.ReadString('CONNECTION', 'Server', '') +
      ':' + reg.ReadString('CONNECTION', 'Path', '');
    Params.Add('user_name=' + reg.ReadString('Connection', 'User', ''));
    pwd := reg.ReadString('Connection', 'Password_Crypted', '');
    pwd := PwdDeCrypt(pwd);
    Params.Add('password=' + pwd);

  end;
  with FIBDatabase do
  begin
    DatabaseName := ChermetDatabase.DatabaseName;
    DBParams.Add('user_name=' + reg.ReadString('Connection', 'User', ''));
    DBParams.Add('password=' + pwd);
  end;}

{$IFDEF TESTING}
    TestLabel.Visible := True;
{$ENDIF}
end;

type
    TBlackMagic = class(TDBGrid)
    end;

procedure TMain.ShowHint(var HintStr: string; var CanShow: Boolean; var
    HintInfo: THintInfo);
var
    coo: TGridCoord;
    cur, x: Integer;
begin
    if HintInfo.HintControl is TSpComboBox then
        with HintInfo.HintControl as TSpComboBox do
        begin
            if Text <> '' then
                HintStr := Text
            else
                if Hint <> '' then
                    HintStr := Hint
                else
                    if SpParams.Title <> '' then
                        HintStr := 'Довідник ' + SpParams.Title;

            if HintStr <> '' then
                CanShow := True;
        end;

    if HintInfo.HintControl is TDBGrid then
        with TBlackMagic(HintInfo.HintControl) do
        begin
            Application.HideHint;
            HintInfo.ReShowTimeout := 1000;
            coo := MouseCoord(HintInfo.CursorPos.X, HintInfo.CursorPos.Y);
            if coo.y > 0 then
            try
                cur := DataLink.ActiveRecord;
                try
                    DataLink.ActiveRecord := coo.y - 1;
                    x := coo.x;
                    if dgIndicator in Options then
                        dec(x);
                    HintStr := Fields[x].DisplayText;
                finally
                    DataLink.ActiveRecord := cur
                end;
                CanShow := Canvas.TextWidth(HintStr) > Columns[x].Width;
            except
                CanShow := False
            end;
            if not CanShow and (Hint <> '') then
            begin
                HintStr := Hint;
                CanShow := True;
            end;
        end;

    if HintInfo.HintControl is TLabel then
        with HintInfo.HintControl as TLabel do
        begin
            HintStr := Caption;
            CanShow := True;
        end;

    if HintInfo.HintControl is TPanel then
        with HintInfo.HintControl as TPanel do
        begin
            HintStr := Caption;
            CanShow := True;
        end;
end;

procedure TMain.LogIn(AFirstTime: boolean);
var
    LogInForm: TLogInForm;
begin
{    if not AFirstTime then
        CloseConnection; // ???}

  // Запустить диалог пароля
    LogInForm := TLogInForm.Create(Self);

  // Если при старте логин/пароль неверны, выйти
    if (LogInForm.ShowModal <> mrOk) and (AFirstTime or AdminMode) then
        Application.Terminate;

  // Показать имя пользователя
    ShowUserName;

  // Освободить форму входа в систему
    LogInForm.Free;
end;

procedure TMain.ShowUserName; // Вывести имя пользователя на StatusBar
begin
{    UserQuery.Transaction := PersonalCommon.ReadTransaction;
    UserQuery.ParamByName('ID_PCARD').Value := CurrentID_PCard;
    UserQuery.Open;
    if not UserQuery.IsEmpty then
        CurrentUserName := UserQuery['Familia'] + ' ' + UserQuery['Imya'] +
            ' ' + UserQuery['Otchestvo'];
    UserQuery.Close;}
    UserLabel.Caption := 'Користувач: ' + CurrentUserName;

  // Чтоб было счастье
    KillemItem.Visible := AdminMode;
    DismissAllItem.Visible := AdminMode;
    InitExport.Visible := AdminMode;
    AdminLabel.Visible := AdminMode;
end;

procedure TMain.QuitButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TMain.Act_ExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TMain.Act_ReLoginExecute(Sender: TObject);
begin
    LogIn(false);
    ShowUserName;
end;

procedure TMain.ShowToolBar(Sender: TObject);
begin
    ControlBar1.Controls[TMenuItem(Sender).Tag - 1].Visible :=
        not ControlBar1.Controls[TMenuItem(Sender).Tag - 1].Visible;
    TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
end;

procedure TMain.ExecOrdersExecute(Sender: TObject);
var
    form: TOrdersViewForm;
    form2: TOrders2ViewForm;
    sp: TSprav;
begin
    if CloseAllAccess then
        Exit;

    if CheckAccess('/ROOT/Orders', 'View', True) = 0 then
    begin
        if newversion
            then
        begin
            sp := GetSprav('UP\Up_OrderList');
            if sp <> nil then
            begin
         // заполнить входные параметры
                with sp.Input do
                begin
                    Append;
                    FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                    FieldValues['Select'] := 0;
                    FieldValues['ShowStyle'] := 1;
                    Post;
                end;

         // показать справочник и проанализировать результат (выбор одного подр.)
                sp.Show;
            end;

        end
        else
            if NewOrders then
            begin
                form2 := TOrders2ViewForm.Create(Self);
                form2.FormStyle := fsMDIChild;
            end
            else
            begin
                form := TOrdersViewForm.Create(Self);
                form.FormStyle := fsMDIChild;
            end;
    end;

end;

procedure TMain.ExecPCardsExecute(Sender: TObject);
var
    Form: TPCardsViewForm;
    sp: TSprav;
begin
    if CloseAllAccess then
        Exit;

  // создать справочник

    if NewOrders then
    begin
        sp := GetSprav('asup\PCardsList');
        if sp <> nil then
        begin
      // заполнить входные параметры
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                FieldValues['ActualDate'] := Date;
                FieldValues['AdminMode'] := AdminMode;
                FieldValues['Select'] := 0;
                FieldValues['ShowStyle'] := 1;
                if NewVersion then
                begin
                    FieldValues['NewVersion'] := 1;
                    FieldValues['Show_Dropped_Workers'] := 1;
                end
                else
                    FieldValues['NewVersion'] := 0;
                Post;
            end;

      // показать справочник и проанализировать результат (выбор одного подр.)
            sp.Show;
        end;
    end
    else
    begin
        Form := TPCardsViewForm.Create(Self, True, True);
        Form.FormStyle := fsMDIChild;
        Form.WindowState := wsMaximized;
    end;
end;

procedure TMain.ExecSRExecute(Sender: TObject);
var
    form: TShtatRasForm;
begin
    if CloseAllAccess then
        Exit;

    if (CheckAccess('/ROOT/Plan_Shtat_Ras', 'View', True)) <> 0 then
        Exit;

    if CheckAccess('/ROOT/Plan_Shtat_Ras', 'Edit') = 0 then
    begin
        form := TShtatRasForm.Create(Self, spmNormal, -1, -1, False, Date);
        form.FormStyle := fsMDIChild;
        form.WindowState := wsMaximized;
    end
    else
    begin
        form := TShtatRasForm.Create
            (Self, [spfDetails], -1, -1, False, Date);
        form.FormStyle := fsMDIChild;
        form.WindowState := wsMaximized;
    end;

end;

procedure TMain.OrdersClick(Sender: TObject);
var
    form: TOrdersViewForm;
begin
    form := TOrdersViewForm.Create(Self);
    form.FormStyle := fsMDIChild;
end;

procedure TMain.PeopleClick(Sender: TObject);
var
    form: TPeopleViewForm;
    sp: TSprav;
begin
    if NewOrders then
        AllPeopleUnit.ShowSp(Self, PersonalCommon.FIBDatabase.Handle)
    else
    begin
        form := TPeopleViewForm.Create(self);
        form.Prepare(False);
        form.WindowState := wsMaximized;
        form.FormStyle := fsMDIChild;
    end;

end;

procedure TMain.ExitItemClick(Sender: TObject);
begin
    Close;
end;

procedure TMain.WarPostClick(Sender: TObject);
var

    Params: TSpParams;
    Form: TSpWarPostForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_WarPost';
        IdField := 'Id_WarPost';
        SpFields := 'Name_WarPost';
        ComboField := 'Name_WarPost';
        InsertProcName := 'WarPost_Insert';
        SelectProcName := 'Sp_Warpost_Select';
        DeleteProcName := 'WarPost_Delete';
        Title := 'Військові звання';
    end;
    Form := TSpWarPostForm.Create(Self);
    Form.Init(Params);
    Form.FormStyle := fsMDIChild;
end;

procedure TMain.WarSostavClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpWarSostavForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_WarSostav';
        IdField := 'Id_WarSostav';
        SpFields := 'Name_WarSostav';
        ComboField := 'Name_WarSostav';
        InsertProcName := 'WARSOSTAV_INSERT';
        SelectProcName := 'Sp_WarSostav_Select';
        DeleteProcName := 'WarSostav_Delete';
        Title := 'Військові склади';
    end;
    Form := TSpWarSostavForm.Create(Self);
    Form.Init(Params);
    Form.FormStyle := fsMDIChild;
end;

procedure TMain.WarPostGroupClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_WarPostGr';
        IdField := 'Id_WarPostGr';
        SpFields := 'Name_WarPostGr';
        ComboField := 'Name_WarPostGr';
        ColumnNames := 'Група обліку';
        DeleteProcName := 'WarPostGr_Delete';
        InsertProcName := 'WarPostGr_Insert';
        UpdateProcName := 'WarPostGr_Update';
        Title := 'Групи обліку';
    end;
    Form := TSpForm.Create(Self);
    Form.Init(Params);
    Form.FormStyle := fsMDIChild;
end;

procedure TMain.Educ_OrgClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpEducOrgForm;
    sp: TSprav;
begin

    if NewOrders then
    begin //если новый справочник образования
    // создать справочник

        if NewOrders then
        begin
            sp := GetSprav('ASUP\SpEdOrg');
            if sp <> nil then
            begin
        // заполнить входные параметры
                with sp.Input do
                begin
                    Append;
                    FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                    FieldValues['Select'] := 0;
                    FieldValues['ShowStyle'] := 1;
                    Post;
                end;

        // показать справочник и проанализировать результат
                sp.Show;
            end;
        end;
    end
    else

    begin //Если старый справочник образования
        Params := TSpParams.Create;
        with Params do
        begin
            SelectProcName := 'SP_EDUCORG_SELECT';
            IdField := 'Id_Org';
            SpFields := 'Name_Full,Akreditation';
            ColumnNames := 'Назва,Акредитація';
            Title := 'Освітні установи';

        end;
        Form := TSpEducOrgForm.Create(Self);
        Form.FormStyle := fsMDIChild;
        Form.Init(Params);
    //
    //Params.Free;}
    end;
end;

procedure TMain.CategoryClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_Category';
        IdField := 'Id_Category';
        SpFields := 'Name_Category';
        ColumnNames := 'Назва категорії';
        InsertProcName := 'Sp_Category_Insert';
        UpdateProcName := 'Sp_Category_Update';
        DeleteProcName := 'Sp_Category_Delete';
        Title := 'Категорії';
    end;
    Form := TSpForm.Create(Self);
    Form.FormStyle := fsMDIChild;
    Form.Init(Params);
end;

procedure TMain.TarNetClick(Sender: TObject);
var
    Params: TSpParams;
    form: TSpTarNetForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_Tar_Net';
        IdField := 'Id_Tar_Net';
        SpFields := 'Name_Tar_Net';
        ComboField := 'Name_Tar_Net';
        ColumnNames := 'Найменування сітки,Ставка першого розряду,Початок,Кінець';
        SelectProcName := 'Sp_Tar_Net_Select_2(' + IntToStr(Curr_Tar_Plan) + ')';
        DeleteProcName := 'Sp_Tar_Net_Delete';
        Title := 'Тарифні сітки';
    end;
    form := TSpTarNetForm.Create(Self);
    form.FormStyle := fsMDIChild;
    form.Init(Params);
    form.Id_Tar_Plan := Curr_Tar_Plan;
    form.TarPlanBox.Prepare(Curr_Tar_Plan);
end;

procedure TMain.TarDigitsClick(Sender: TObject);
var
    Params: TSpParams;
    form: TSpTarDigitsForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Tar_Nets';
        IdField := 'Num_Digit';
        SpFields := 'Num_Digit';
        ComboField := 'Num_Digit';
        ColumnNames := 'Розряд,Коментар,Коефіцієнт,Ставка';
        Title := 'Розряди тарифних сіток';
    end;
    form := TSpTarDigitsForm.Create(Self);
    form.FormStyle := fsMDIChild;
    form.Init(Params);
end;

procedure TMain.SPZClick(Sender: TObject);
var
    Params: TSpParams;
    form: TSpForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        AddFormName := 'AddSpzForm';
        Table := 'ini_SPZ';
        IdField := 'Id_SPZ';
        SpFields := 'SPZ';
        ComboField := 'SPZ';
        InsertProcName := 'Ini_SPZ_Insert';
        UpdateProcName := 'Ini_SPZ_Update';
        DeleteProcName := 'Ini_SPZ_Delete';
        SelectProcName := 'Ini_SPZ_Select';
        ColumnNames := 'Шифр,Найменування';
        Title := 'Шифри виробничих витрат';
    end;
    form := TSpForm.Create(Self);
    form.FormStyle := fsMDIChild;
    form.Init(Params);
end;

procedure TMain.WorkTimeNormClick(Sender: TObject);
var
    Params: TSpParams;
    form: TSpWorkTimeForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'dt_WorkTimeNorm';
        IdField := 'wtMonth';
        SpFields := 'wtMonth';
        ComboField := 'wtMonth,wtYear';
        ColumnNames := 'Рік,Місяць,Норма тривалості робочого часу';
        Title := 'Норми тривалості робочого часу';
        DontHideFirstColumn := True;
    end;
    form := TSpWorkTimeForm.Create(Self);
    form.FormStyle := fsMDIChild;
    form.Init(Params);
end;

procedure TMain.ShtatRasViewClick(Sender: TObject);
var
    form: TShtatRasForm;
begin
    if (CheckAccess('/ROOT/Plan_Shtat_Ras', 'View', True)) <> 0 then
        Exit;
    form := TShtatRasForm.Create
        (Self, spmReadOnly - [spfSelect], -1, -1, False, Date);
    form.FormStyle := fsMDIChild;
    form.WindowState := wsMaximized;
end;

procedure TMain.CondSpClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'INI_WORK_COND';
        IdField := 'ID_WORK_COND';
        SpFields := 'NAME_WORK_COND';
        ColumnNames := 'Назва умови праці';
        Title := 'Умови праці';
        SpMode := spmReadOnly;
    end;
    Form := TSpForm.Create(Self);
    Form.FormStyle := fsMDIChild;
    Form.Init(Params);
end;

procedure TMain.FormPaySpClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'INI_PAY_FORM';
        IdField := 'ID_PAY_FORM';
        SpFields := 'NAME_PAY_FORM';
        ColumnNames := 'Назва форми';
        Title := 'Форма та система оплати праці';
        SpMode := spmReadOnly;
    end;
    Form := TSpForm.Create(Self);
    Form.FormStyle := fsMDIChild;
    Form.Init(Params);
end;

procedure TMain.EducItemClick(Sender: TObject);
var
    Form: TEducReportForm;
begin
    if CheckAccess('/ROOT/REPORTS/EducReport', 'View') = 0 then
    begin
        Form := TEducReportForm.Create(Self);
        Form.SHOW_ALL := 1;
        Form.FormStyle := fsNormal;
        Form.ShowModal;
    end;

end;

procedure TMain.WomenReportItemClick(Sender: TObject);

var
    Form: TWomenReportForm;

begin
    if CheckAccess('/ROOT/REPORTS/WomenReport', 'View', True) = 0 then
    begin
        Form := TWomenReportForm.Create(Self);
        Form.FormStyle := fsNormal;
        Form.ShowModal;
    end;
end;

procedure TMain.WarReportItemClick(Sender: TObject);
var
    Form: TWarReportForm;
begin
    if CheckAccess('/ROOT/REPORTS/WarReport', 'View', True) = 0 then
    begin
        Form := TWarReportForm.Create(Self);
        Form.ShowModal;
        Form.Free;
    end;
end;

procedure TMain.ShtatPrintItemClick(Sender: TObject);
var
    form: TShtatPrintForm;
    sp: TSprav;
begin
    if CheckAccess('/ROOT/REPORTS/PLANSHTATREPORT', 'View', True) <> 0 then
        Exit;

    if Version = 1 then
    begin
        form := TShtatPrintForm.Create(Self);
        form.SetSR(Curr_SR);
        form.ShowModal;
        form.Free;
    end
    else
    begin
        sp := GetSprav('ASUP\ShtatPrint_v2');
        if sp <> nil then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(Database.Handle);
                FieldValues['Actual_Date'] := Date;
                FieldValues['DesignReport'] := sDesignReport;
                FieldValues['Id_SR'] := Curr_SR;
                Post;
            end;

            sp.Show;
            sp.Free;
        end;
    end;
end;

procedure TMain.BonusTypeItemClick(Sender: TObject);
var
    form: TSpForm;
    Params: TSpParams;
begin
    form := TSpVidoplForm.Create(Self);
    Params := TSpParams.Create;
    Form.FormStyle := fsMDIChild;

    with Params do
    begin
        AddFormName := 'AddVidOplForm';
        Table := 'Sp_VidOpl';
        Title := 'Довідник: Надбавки та доплати';
        IdField := 'Id_VidOpl';
        SpFields := 'Name_VidOpl';
        ColumnNames := 'Назва надбавки чи доплатиі';
        SelectProcName := 'Sp_VidOpl_Select(201)';
        DeleteProcName := 'Sp_VidOpl_Delete';
    end;

    form.Init(Params);
end;

procedure TMain.PostBonusClick(Sender: TObject);
var
    form: TPostBonusForm;
begin
    form := TPostBonusForm.Create(Self, spmNormal);
    form.FormStyle := fsMDIChild;
    form.WindowState := wsMaximized;
end;

procedure TMain.VacanciesItemClick(Sender: TObject);
var
    form: TShtatRasForm;
begin
    if (CheckAccess('/ROOT/Plan_Shtat_Ras', 'View', True)) <> 0 then
        Exit;
    form := TShtatRasForm.Create(Self,
        spmReadOnly - [spfSelect] + [spfCantRemoveFilter], -1, -1, True, Date);
    form.FormStyle := fsMDIChild;
    form.WindowState := wsMaximized;
end;

procedure TMain.StajItemClick(Sender: TObject);
var
    form: TSpStajForm;
    Params: TSpParams;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Ini_Staj';
        Title := 'Стаж';
        IdField := 'Id_Staj';
        SpFields := 'Name_Staj';
        ColumnNames := 'Стаж';
        InsertProcName := 'Ini_Staj_Insert';
        UpdateProcName := 'Ini_Satj__Update';
        DeleteProcName := 'Ini_Satj_Delete';
    end;
    form := TSpStajForm.Create(Self);
    form.Init(Params);
    form.FormStyle := fsMDIChild;
end;

procedure TMain.ExecPrintFormExecute(Sender: TObject);
begin
    TUniPrintForm.Create(Self).ShowModal;
end;

procedure TMain.VihodItemClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        if GPP then
            SpMode := spmNormal - [spfDelete]
        else
            SpMode := spmNormal - [spfAdd, spfDelete];

        IdField := 'Id_Vihod';
        SpFields := 'Name_Full';
        AddFormName := 'AddVihodForm';
        ColumnNames := 'Найменування,Скорочення,Вихід,-,-';
        InsertProcName := 'Sp_Vihod_Insert';
        UpdateProcName := 'Sp_Vihod_Update';
        DeleteProcName := 'Sp_Vihod_Delete';
        SelectProcName := 'Sp_Vihod_Select';
        Title := 'Типи виходів на роботу';
    end;
    Form := TSpForm.Create(Self);
    Form.FormStyle := fsMDIChild;
    Form.Init(Params);
end;

procedure TMain.HolidayItemClick(Sender: TObject);
var
    form: TSpHolidayForm;
    Params: TSpParams;

begin
    form := TSpHolidayForm.Create(Self);
    Params := TSpParams.Create;
    Form.FormStyle := fsMDIChild;
    with Params do
    begin
        Table := 'Sp_Holiday';
        Title := 'Відпустки';
        IdField := 'Id_Holiday';
        SpFields := 'Name_Holiday';
        ColumnNames := 'Відпустки';
        InsertProcName := 'Sp_Holiday_Insert';
        UpdateProcName := 'Sp_Holiday_Update';
        DeleteProcName := 'Sp_Holiday_Delete';
    end;

    form.Init(Params);

end;

procedure TMain.KillemItemClick(Sender: TObject);
var
    killquery: TIBQuery;
begin
    if CloseAllAccess then
        Exit;

    if MessageDlg('Это уничтожит всех людей! Ты правда этого хочешь?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if MessageDlg('Хорошо подумал?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            killquery := TIBQuery.Create(Self);
            killquery.Transaction := WriteTransaction;
            killquery.SQL.Text := 'EXECUTE PROCEDURE KILL_EM_ALL';
            ExecQuery(killquery);
            killquery.Free;
        end;
end;

procedure TMain.ImportPeopleItemClick(Sender: TObject);
var
    form: TImportPeopleForm;
begin
    if CloseAllAccess then
        Exit;

    form := TImportPeopleForm.Create(Self);
    form.ShowModal;
    form.Free;
end;

procedure TMain.AutoAcceptItemClick(Sender: TObject);
var
    form: TAutoAcceptForm;
begin
    if CloseAllAccess then
        Exit;

    form := TAutoAcceptForm.Create(Self);
    form.ShowModal;
    form.Free;
end;

procedure TMain.DismissAllItemClick(Sender: TObject);
var
    disquery: TIBQuery;
begin
    if CloseAllAccess then
        Exit;

    if MessageDlg('Ця операція звільнить усіх! Ви впевнені?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        if MessageDlg('Справді?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
            disquery := TIBQuery.Create(Self);
            disquery.Transaction := WriteTransaction;
            disquery.SQL.Text := 'DELETE FROM MAN_MOVING';
            ExecQuery(disquery);
            disquery.Free;
        end;
end;

procedure TMain.ExportLogItemClick(Sender: TObject);
var
    form: TExportLogForm;
begin
    form := TExportLogForm.Create(Self);
    form.ShowModal;
    form.Free;
end;

procedure TMain.N6Click(Sender: TObject);
var
    form: TSpForm;
    Params: TSpParams;
begin
    form := TSpForm.Create(Self);
    Params := TSpParams.Create;
    Form.FormStyle := fsMDIChild;

    with Params do
    begin
        SelectProcName := 'Sp_Education_Select';
        Title := 'Типи Освіт';
        IdField := 'Id_Educ';
        SpFields := 'Name_Educ';
        ColumnNames := 'Освіта';
        InsertProcName := 'Sp_Education_Insert';
        UpdateProcName := 'Sp_Education_Update';
        DeleteProcName := 'Sp_Education_Delete';
    end;

    form.Init(Params);

end;

procedure TMain.N10Click(Sender: TObject);
var
    form: TSpecForm;
    Params: TSpParams;

begin
    form := TSpecForm.Create(Self);
    Params := TSpParams.Create;
    Form.FormStyle := fsMDIChild;

    with Params do
    begin
        SelectProcName := 'Sp_Spec_Select';
        Title := 'Спеціальність';
        IdField := 'Id_Spec';
        SpFields := 'Name_Spec';
        ColumnNames := 'Спеціальність';
        InsertProcName := 'Sp_Spec_Insert';
        UpdateProcName := 'Sp_Spec_Update';
        DeleteProcName := 'Sp_Spec_Delete';
    end;

    form.Init(Params);

end;

procedure TMain.N15Click(Sender: TObject);
var
    form: TKvalForm;
    Params: TSpParams;

begin
    form := TKvalForm.Create(Self);
    Params := TSpParams.Create;
    Form.FormStyle := fsMDIChild;

    with Params do
    begin
        SelectProcName := 'Sp_Kvalification_Select';
        Title := 'Кваліфікація';
        IdField := 'Id_Kval';
        SpFields := 'Name_Kval';
        ColumnNames := 'Кваліфікація';
        InsertProcName := 'Sp_Kvalification_Insert';
        UpdateProcName := 'Sp_Kvalification_Update';
        DeleteProcName := 'Sp_Kvalification_Delete';
    end;

    form.Init(Params);
end;

procedure TMain.VidoplItemClick(Sender: TObject);
var
    form: TSpVidoplForm;
    Params: TSpParams;
begin
    form := TSpVidoplForm.Create(Self);
    Params := TSpParams.Create;
    Form.FormStyle := fsMDIChild;

    with Params do
    begin
        AddFormName := 'AddVidOplForm';
        Table := 'Sp_VidOpl';
        Title := 'Види оплати';
        IdField := 'Id_VidOpl';
        SpFields := 'Name_VidOpl';
        ColumnNames := 'Назва виду оплати';
        SpMode := spmNormal + [spfDetails];
        SelectProcName := 'Sp_VidOpl_Select(-1)';
        DeleteProcName := 'Sp_VidOpl_Delete';
    end;
    form.Use_Filter := True;
    form.Init(Params);
end;

procedure TMain.CalendarItemClick(Sender: TObject);
var
    form: TCalendarForm;
begin
    form := TCalendarForm.Create(Self);
    form.FormStyle := fsMDIChild;
end;

procedure TMain.ExecTableExecute(Sender: TObject);
var
    form: TfmTimeTable;
begin
    if CloseAllAccess then
        Exit;

    form := TfmTimeTable.Create(Self);
    form.FormStyle := fsMDIChild;
end;

procedure TMain.ExecRatingExecute(Sender: TObject);
var
    MarkForm: TMarkForm;
begin
    MarkForm := TMarkForm.Create(Self);
    MarkForm.FormStyle := fsMDIChild;
end;

procedure TMain.ExportLogClick(Sender: TObject);
var
    form: TExportLogForm;
begin
    form := TExportLogForm.Create(Self);
    form.ShowModal;
    form.Free;
end;

procedure TMain.ImportDataClick(Sender: TObject);
var
    form: TImportLogForm;
begin
    form := TImportLogForm.Create(Self);
    form.ShowModal;
    form.Free;
end;

procedure TMain.BReportItemClick(Sender: TObject);
var
    Form: TBirthDayReportForm;

begin
    if CheckAccess('/ROOT/REPORTS/BirthDateReport', 'View', True) = 0 then
    begin
        Form := TBirthDayReportForm.Create(Self);
        Form.FormStyle := fsNormal;
        Form.ShowModal;
    end;
end;

procedure TMain.ReBufferClick(Sender: TObject);
var
    ReBuffer: TReBufferForm;
begin
    if CloseAllAccess then
        Exit;

    ReBuffer := TReBufferForm.Create(self);
    ReBuffer.ShowModal;
end;

procedure TMain.PensiaItemClick(Sender: TObject);
var
    form: TPensiaReportForm;
begin
    if CheckAccess('/ROOT/REPORTS/PensiaReport', 'View', True) = 0 then
    begin
        Form := TPensiareportForm.Create(Self);
        Form.FormStyle := fsNormal;
        Form.ShowModal;
    end;
end;

procedure TMain.RealShtatRasClick(Sender: TObject);
var
    sp: TSprav;
begin
    if CheckAccess('/ROOT/Fact_Shtat_Ras', 'View', True) <> 0 then
        Exit;

    sp := GetSprav('ASUP\oldFactShtatPrint');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Database.Handle);
            FieldValues['DesignReport'] := sDesignReport;
            FieldValues['Version'] := Version;
            Post;
        end;

        sp.Show;
        sp.Free;
    end;

end;

procedure TMain.ReportPrinatihClick(Sender: TObject);
var
    Form: TReportVedomostPrinatihForm;
begin
    if CheckAccess('/ROOT/REPORTS/PRINATIHREPORT', 'View', True) <> 0 then
        Exit;

    Form := TReportVedomostPrinatihForm.Create(self);
    Form.ID_REPORT_TYPE := 1;
    Form.ShowModal;
    Form.Free;
end;

procedure TMain.ReportDismissedClick(Sender: TObject);
var
    Form: TReportVedomostPrinatihForm;
begin
    if CheckAccess('/ROOT/REPORTS/DISMISSIDREPORT', 'View', True) <> 0 then
        Exit;

    Form := TReportVedomostPrinatihForm.Create(self);
    Form.ID_REPORT_TYPE := 2;
    Form.ShowModal;
    Form.Free;
end;

procedure TMain.FormPlanShtatRasClick(Sender: TObject);
var
    form: TFormPlanShtatRasForm;
begin
    form := TFormPlanShtatRasForm.Create(Self);
    form.ShowModal;
    form.Free;
end;

procedure TMain.PlanShtatRasItemClick(Sender: TObject);
var
    form: TShtatRasForm;
begin
    form := TShtatRasForm.Create(Self, spmNormal, -1, -1, False, Date, True);
    form.FormStyle := fsMDIChild;
    form.WindowState := wsMaximized;
end;

procedure TMain.ExternReportsClick(Sender: TObject);
var
    Form: TExternProgsForm;
begin
    if CheckAccess('/ROOT/REPORTS/EXTERNREPORTS', 'View', True) <> 0 then
        Exit;

    Form := TExternProgsForm.Create(self);
    Form.FormStyle := fsMDIChild;
end;

procedure TMain.ChildItemClick(Sender: TObject);
var
    form: TChildrenReportForm;
begin
    if CheckAccess('/ROOT/REPORTS/ChildrenReport', 'View', True) = 0 then
    begin
        form := TChildrenReportForm.Create(Self);
        form.ShowModal;
        form.Free;
    end;
end;

procedure TMain.HolidaysReportClick(Sender: TObject);
var
    Form: TReportVedomostPrinatihForm;
begin
    if CheckAccess('/ROOT/REPORTS/HolidayReport', 'View', True) = 0 then
    begin
        Form := TReportVedomostPrinatihForm.Create(self);
        Form.ID_REPORT_TYPE := 3;
        Form.ShowModal;
        Form.Free;
    end;
end;

procedure TMain.SpPunishingItemClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_Punishing';
        SpFields := 'Name_Punishing';
        IdField := 'Id_Punishing';
        InsertProcName := 'Sp_Punishing_Insert';
        UpdateProcName := 'Sp_Punishing_Update';
        DeleteProcName := 'Sp_Punishing_Delete';
        ColumnNames := 'Стягнення';
        Title := 'Довідник стягнень';
    end;
    Form := TSpForm.Create(Self);
    Form.Init(Params);
    Form.FormStyle := fsMDIChild;
end;

procedure TMain.SpAwardItemClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpAwardForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_Award';
        SpFields := 'Name_Award';
        IdField := 'Id_Award';
        ColumnNames := 'Заохочення';
        Title := 'Довідник заохочень';
    end;
    Form := TSpAwardForm.Create(Self);
    Form.Init(Params);
    Form.FormStyle := fsMDIChild;
end;

procedure TMain.SpPrivFormClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpPrivForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_Privelege';
        SpFields := 'Name_Priv';
        IdField := 'Id_Privelege';
        Title := 'Довідник пільг';
    end;
    SpPrivForm.Free;
    Form := TSpPrivForm.Create(Self);
    Form.Init(Params);
    Form.FormStyle := fsMDIChild;
end;

procedure TMain.InitExportClick(Sender: TObject);
var
    s: string;
    i: Integer;
    form: TProcessForm;
begin
    if CloseAllAccess then
        Exit;

    form := TProcessForm.Create(Self);
    form.Caption := 'Ініціалізація обміну, зачекайте...';
    form.Show;

    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery2.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;

    ResultQuery.Close;
    ResultQuery.Open;
    ResultQuery.FetchAll;
    ResultQuery.First;

    form.Progress.Max := ResultQuery.RecordCount;
    Form.Progress.Position := 0;

    WorkQuery.Close;
    WorkQuery.SQL.Text := 'DELETE FROM EXCH_INI_DATE_LOG_REC';
    ExecQuery(WorkQuery);

    WorkQuery.Close;
    WorkQuery.SQL.Text := 'DELETE FROM EXCH_INI_LOG_REC';
    ExecQuery(WorkQuery);

    WorkQuery.Close;
    WorkQuery.SQL.Text := 'DELETE FROM EXCH_INI_LOG_REC_SERVERS';
    ExecQuery(WorkQuery);

    while not ResultQuery.Eof do
    begin

        s := ResultQuery['EXPRESSION_FIELDS'];
        s := StringReplace(s, ';', ',', [rfReplaceAll]);

        ResultQuery2.Close;

        form.Caption := 'Ініціалізація обміну, зачекайте... Оброблюється таблиця "'
            + ResultQuery['NAME_TABLE'] + '" ...';

        if ResultQuery['Is_Use_End'] = 1 then
            ResultQuery2.SQL.text := 'SELECT ' + s + ' FROM ' +
                ResultQuery['NAME_TABLE']
                + ' WHERE ''NOW'' BETWEEN Use_Beg AND Use_End'
        else
            ResultQuery2.SQL.text := 'SELECT ' + s + ' FROM ' +
                ResultQuery['NAME_TABLE'];

        ResultQuery2.Open;
        ResultQuery2.First;

        while not ResultQuery2.Eof do
        begin

            s := '';

            for i := 0 to ResultQuery2.FieldCount - 1 do
            begin
                s := s + ResultQuery2.Fields[i].AsString;
                if i <> ResultQuery2.FieldCount - 1 then
                    s := s + ';';
            end;

            WorkQuery.Close;
            WorkQuery.SQL.Text := 'EXECUTE PROCEDURE EXCH_PROC_INI_LOG_REC_ADD 0,' +
                QuotedStr(ResultQuery['NAME_TABLE']) + ',' + QuotedStr(s);
            ExecQuery(WorkQuery);
            ResultQuery2.Next;

        end;

        form.Step;
        ResultQuery.Next;
    end;

    Form.Close;
    ShowMessage('Ініціалізацію обміну завершено!');
end;

procedure TMain.SRItemClick(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpSRForm;
begin
    if (CheckAccess('/ROOT/Plan_Shtat_Ras', 'View', True)) <> 0 then
        Exit;
    Params := TSpParams.Create;
    with Params do
    begin
        AddFormName := 'AddSRForm';
        Table := 'Dt_SR';
        IdField := 'Id_SR';
        SpFields :=
            'Name,Date_Beg,Date_End,Is_Plan,Is_Prod,Id_Tar_Plan,Name_Tar_Plan,Name_Department';
        ColumnNames :=
            'Назва штатного розкладу,Початок,Кінець,Проект,Промислове,-,Тарифний план,Застовується';
        ComboField := 'Name';
        DeleteProcName := 'Dt_SR_Delete';
        SelectProcName := 'Dt_SR_Select';
        SpMode := [spfModify, spfDelete, spfDetails];
        Title := 'Штатні розклади';
    end;
    Form := TSpSRForm.Create(Self);
    Form.FormStyle := fsMDIChild;
    Form.Init(Params);
end;

procedure TMain.BufferCleanItemClick(Sender: TObject);
var
    Form: TBuffersCleanForm;
begin
    if CloseAllAccess then
        Exit;

    Form := TBuffersCleanForm.Create(self);
    Form.ShowModal;
end;

procedure TMain.ManComandItemClick(Sender: TObject);
var
    Form: TManComandFactForm;
begin
    if CloseAllAccess then
        Exit;

    if CheckAccess('/ROOT/Commandirovki', 'View', True) = 0 then
    begin
        Form := TManComandFactForm.Create(self);
        Form.FormStyle := fsMDIChild;
    end;

end;

procedure TMain.IdleHandler(Sender: TObject; var Done: Boolean);
begin
    CheckSynchronize;
end;

procedure TMain.AllBuffersItemClick(Sender: TObject);
var
    Form: TAllBuffersForm;
begin
    if CloseAllAccess then
        Exit;

    Form := TAllBuffersForm.Create(self);
    Form.ShowModal;
    form.Free;
end;

procedure TMain.ExitTimerTimer(Sender: TObject);
begin

    SessionQuery.Close;
    SessionQuery.Open;
    if not VarIsNull(SessionQuery['Exit_Time']) then
    begin
        if VarIsNull(Exit_Time) or (Exit_Time <> SessionQuery['Exit_Time']) then
        begin
            Exit_Time := SessionQuery['Exit_Time'];
            Local_Exit_Time := Exit_Time + NOW - SessionQuery['Server_Time'];
            MessageDlg('Для оновлення версії потрібно вийти з програми. ' +
                'Вихід буде зроблено автоматично за ' +
                TimeToStr(Local_Exit_Time - Now), mtWarning, [mbOk], 0);
        end;
    end
    else
    begin
        Exit_Time := Null;
        ExitLabel.Caption := '';
    end;

end;

procedure TMain.SecTimerTimer(Sender: TObject);
begin
    if not VarIsNull(Exit_Time) and not VarIsEmpty(Exit_Time) then
    begin
        ExitLabel.Caption := 'Залишилось часу: ' + TimeToStr(Local_Exit_Time - Now);
        if Local_Exit_Time <= Now then
            Application.Terminate;
    end;
end;

procedure TMain.ChermetDatabaseBeforeDisconnect(Sender: TObject);
begin
    MessageDlg('Неможливо продовжити роботу через помилку у мережі' +
        ' або сервері бази даних!', mtError, [mbOk], 0);
    Application.Terminate;
end;

procedure TMain.PrintClick(Sender: TObject);
begin
    if CloseAllAccess then
        Exit;

  //if (CheckAccess('/ROOT/REPORTS','View',True)<>0) then Exit;
end;

procedure TMain.SpClick(Sender: TObject);
begin
    if CloseAllAccess then
        Exit;

    if CheckAccess('/ROOT/All_Sprav', 'View', True) <> 0 then
        Exit;
end;

procedure TMain.DontWriteTableItemClick(Sender: TObject);
begin
    DontWriteTableItem.Checked := not DontWriteTableItem.Checked;
    DontWriteTableToDbf := DontWriteTableItem.Checked;
end;

procedure TMain.DontWriteDbfItemClick(Sender: TObject);
begin
    DontWriteDbfItem.Checked := not DontWriteDbfItem.Checked;
    DontWriteToDbf := DontWriteDbfItem.Checked;
end;

procedure TMain.TestItemClick(Sender: TObject);
begin
    TestItem.Checked := not TestItem.Checked;
    Test := TestItem.Checked;
end;

procedure TMain.ShowQueryItemClick(Sender: TObject);
begin
    ShowQueryItem.Checked := not ShowQueryItem.Checked;
    ShowQuery := ShowQueryItem.Checked;
end;

procedure TMain.DesignReportItemClick(Sender: TObject);
begin
    DesignReportItem.Checked := not DesignReportItem.Checked;
    sDesignReport := DesignReportItem.Checked;
end;

procedure TMain.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    begin
    end;
end;

procedure TMain.FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
    if (ssCtrl in Shift) and (ssAlt in Shift) and (ssShift in Shift) then
    begin
        Developer := not Developer;
        ForDeveloperItem.Visible := Developer;
    end;
end;

procedure TMain.SpDeptGroupItemClick(Sender: TObject);
var
    form: TfmDepartmentsGroup;
begin
    form := TfmDepartmentsGroup.Create(Self);
    form.FormStyle := fsMDIChild;
    form.WindowState := wsMaximized;
end;

procedure TMain.MedicReportItemClick(Sender: TObject);
var
    form: TMedicReportForm;
begin
    if CheckAccess('/ROOT/REPORTS/MEDICREPORT', 'View', True) <> 0 then
        Exit;

    form := TMedicReportForm.Create(Self);
    Form.ShowModal;
    form.Free;
end;

procedure TMain.ReportVakantClick(Sender: TObject);
var
    Form: TReportVakantForm;
begin
    if CheckAccess('/ROOT/REPORTS/3PNREPORT', 'View', True) <> 0 then
        Exit;

    Form := TReportVakantForm.Create(Self);

    Form.ShowModal;

    Form.Free;
end;

procedure TMain.BonusReportClick(Sender: TObject);
var
    Form: TReportBonusForm;
begin
    if CheckAccess('/ROOT/REPORTS/BONUSREPORT', 'View', True) <> 0 then
        Exit;

    Form := TReportBonusForm.Create(self);

    Form.ShowModal;

    Form.Free;
end;

procedure TMain.ExecHospitalExecute(Sender: TObject);
var
    sp: TSprav;
begin
    if CloseAllAccess then
        Exit;

   { if CheckAccess('/ROOT/Hosp', 'View', True) = 0 then
    begin
   }
    if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_HOSP','Belong')=0)
     or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
     or (CheckAccess('/ROOT/Hosp', 'View', True) = 0) then
     begin //yes
         LoadHospRMoving(self,FIBDatabase.Handle, zfsChild);

     end
     else MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);


   { //Больничные листы
        sp := GetSprav('Asup\AsupHospital');
        if sp <> nil then
        begin
      // заполнить входные параметры
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                if AdminMode then
                    FieldValues['Admin_Mode'] := 1
                else
                    FieldValues['Admin_Mode'] := 0;
                FieldValues['ShowStyle'] := 1;
                FieldValues['Select'] := 0;
                FieldValues['NewVersion'] := NewVersion;
                Post;
            end;
        end;
    // просто показать справочник
        sp.Show;

    end;}
end;

procedure TMain.ExecCheckExecute(Sender: TObject);
var
    CheckForm: TfmCheck;
begin
    if CloseAllAccess then
        Exit;

    if (CheckAccess('/ROOT/CheckMenu', 'View', True) <> 0) then
        Exit;

    CheckForm := TfmCheck.Create(Self);
    CheckForm.ShowModal;
    CheckForm.Free;
end;

procedure TMain.HospReestrItemClick(Sender: TObject);
var
    form: TReestrMainForm;
begin
    if CloseAllAccess then
        Exit;

    if CheckAccess('/ROOT/HOSPREESTR', 'View', True) <> 0 then
        Exit;

    form := TReestrMainForm.Create(self);
    form.FormStyle := fsMDIChild;
    form.Show;
end;

procedure TMain.Accepted2ItemClick(Sender: TObject);
var
    Form: TReportAccepted2Form;
begin
    if CheckAccess('/ROOT/REPORTS/PN1REPORT', 'View', True) <> 0 then
        Exit;

    Form := TReportAccepted2Form.Create(Self);

    Form.ShowModal;

    Form.Free;
end;

procedure TMain.ExecTablePrintExecute(Sender: TObject);
var
    form2: TfmTablePrint;
begin
    if CheckAccess('/ROOT/REPORTS/TABLEREPORT', 'View', True) <> 0 then
        Exit;

    form2 := TfmTablePrint.Create(Self);
    with form2 do
    begin
        SelectFrame.LoadState;
        ShowModal;
        Free;
    end;
end;

procedure TMain.UserButton1MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
    if Button = mbRight then
        if Sender is TButton then
        begin
            SetUserButtonAction(Sender as TButton, ActionList1);
            LoadUserButton(Sender as TButton, ActionList1);
        end;
end;

procedure TMain.ExecPostExecute(Sender: TObject);
var
    Params: TSpParams;
    form: TSpPostForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Sp_Post';
        IdField := 'Id_Post';
        SpFields := 'Name_Post';
        ComboField := 'Name_Post';
        DeleteProcName := 'Sp_Post_Delete';
        Title := 'Посади';
        SpMode := spmSelect + [spfDetails];
    end;
    form := TSpPostForm.Create(Self);
    form.FormStyle := fsMDIChild;
    form.Init(Params);
end;

procedure TMain.ExecDepartmentsExecute(Sender: TObject);
var
    form: TDepartmentsViewForm;
    sp: TSprav;
begin
    if NewOrders then
    begin
    // создать справочник
        sp := GetSprav('SpDepartment');
        if sp <> nil then
        begin
      // заполнить входные параметры
            with sp.Input do
            begin
                Append;
        // присвоить хэндл базы данных
                FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
        // MDI-окно
                FieldValues['ShowStyle'] := 1;
        // без выборки
                FieldValues['Select'] := 0;
        // с возможностью редактирования
                FieldValues['AllowEdit'] := True;
                Post;
            end;
        end;
    // просто показать справочник
        sp.Show;

    end
    else
    begin
        form := TDepartmentsViewForm.Create(Self);
        form.FormStyle := fsMDIChild;
        form.Prepare(False, Date);
    end;
end;

procedure TMain.ExecTableChangesPrintExecute(Sender: TObject);
var
    form: TfrmTableChangesPrint;
begin
    if CheckAccess('/ROOT/REPORTS/TABLECHANGESREPORT', 'View', True) <> 0 then
        Exit;

    form := TfrmTableChangesPrint.Create(Self);
    with form do
    begin
        LoadState;
        ShowModal;
        Free;
    end;
end;

procedure TMain.UserButton1Click(Sender: TObject);
begin
    if Sender is TButton then
        with Sender as TButton do
            if Action = nil then
                if MessageDlg('Дія не призначена. Для призначення дії натисніть' +
                    ' праву кнопку миші. Призначити дію зараз?', mtConfirmation,
                    [mbYes, mbNo], 0) = mrYes then
                begin
                    SetUserButtonAction(Sender as TButton, ActionList1);
                    LoadUserButton(Sender as TButton, ActionList1);
                end;
end;

procedure TMain.TableDumpClick(Sender: TObject);
var
    form: TfmTableDump;
begin
    if CloseAllAccess then
        Exit;

    form := TfmTableDump.Create(Self);
    form.ShowModal;
    form.Free;
end;

procedure TMain.PensiaItem2Click(Sender: TObject);
var
    form: TPensiaReportForm;
begin
    if CheckAccess('/ROOT/REPORTS/PensPeopleReport', 'View', True) = 0 then
    begin
        Form := TPensiareportForm.Create(Self);
        Form.ReportType := '2';
        Form.FormStyle := fsNormal;
        Form.ShowModal;
    end;
end;

procedure TMain.WorkModeFixItemClick(Sender: TObject);
var
    WorkRegDS: TDataSet;
    reg: TWorkReg;
    WTime: TWorkTime;
begin
    if CloseAllAccess then
        Exit;

    WorkRegDS := Curr_DB.QueryData('SELECT * FROM Dt_WorkReg');
    WTime := TWorkTime.Create(0, 1);

    WorkRegDS.First;
    while not WorkRegDs.Eof do
    begin
        Curr_DB.StoreFields(WorkRegDS,
            'Work_Beg, Work_End, Break_Beg, Break_End, Id_Work_Mode, Id_Day_Week');

        reg.Work_Beg := Curr_DB['Work_Beg'];
        reg.Work_End := Curr_DB['Work_End'];
        reg.Break_Beg := Curr_DB['Break_Beg'];
        reg.Break_End := Curr_DB['Break_End'];

        WTime.CalcTime(reg);
        Curr_DB['Today_Hours'] := 24 * WTime.Today_Hours;
        Curr_DB['Tomorrow_Hours'] := 24 * WTime.Tomorrow_Hours;

        Curr_DB.ExecQuery('UPDATE Dt_WorkReg SET Today_Hours = :Today_Hours,' +
            ' Tomorrow_Hours = :Tomorrow_Hours WHERE Id_Work_Mode = ' +
            ' :Id_Work_Mode AND Id_Day_Week = :Id_Day_Week',
            'Today_Hours, Tomorrow_Hours, Id_Work_Mode, Id_Day_Week');

        WorkRegDS.Next;
    end;

    WTime.Free;
    Curr_DB.RemoveDataset(WorkRegDS);

    MessageDlg('Ok!', mtInformation, [mbOk], 0);
end;

procedure TMain.ExecVilkiExecute(Sender: TObject);
begin
    PSP_OKLMINMAX(Self, False);
end;

procedure TMain.ExecWorkModeExecute(Sender: TObject);
var
    Params: TSpParams;
    Form: TSpWorkModeForm;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        SpMode := spmSelect + [spfDetails];
        IdField := 'Id_Work_Mode';
        SpFields := 'Name';
        AddFormName := 'AddWorkModeForm';
        ColumnNames :=
            'Номер,Найменування,Скорочення,Початок ночі,Кінець ночі,Зміна';
        InsertProcName := 'Dt_Work_Mode_Insert';
        UpdateProcName := 'Dt_Work_Mode_Update';
        DeleteProcName := 'Dt_Work_Mode_Delete';
        SelectProcName := 'Dt_Work_Mode_Select';
        Title := 'Режими праці';
    end;
    Form := TSpWorkModeForm.Create(Self);
    Form.FormStyle := fsMDIChild;
    Form.Init(Params);
end;

procedure TMain.HelpItemClick(Sender: TObject);
var
    FileName, Path: string;
    St, St2: array[0..1024] of char;
begin

    FileName := ProgramPath + (Sender as TMenuItem).Hint;
    Path := ProgramPath + 'Документация';

    ShellExecute(0, 'open', PAnsiChar(Filename), 0, 0, SW_SHOW);
end;

procedure TMain.HolidayAndHospitalIntersectItemClick(Sender: TObject);
var
    Form: TReportHolidayAndHospitalCrossingForm;
begin
    if CheckAccess('/ROOT/REPORTS/HOLANDHOSPINTERSECT', 'View', True) <> 0 then
        Exit;

    Form := TReportHolidayAndHospitalCrossingForm.Create(Self);
    Form.ShowModal;
    Form.Free;
end;

procedure TMain.ServiceItemClick(Sender: TObject);
begin

    if (CheckAccess('/ROOT/ServiceMenu', 'View', True) <> 0) then
        Exit;
end;

procedure TMain.FormDestroy(Sender: TObject);
var i: integer;
begin
    GoodFunctionsUnit.pcardform.Free;
    GoodFunctionsUnit.pcardform := nil;
    try
    for i := 1 to ControlBar1.ControlCount-1 do
    begin
        PanelsItem.Items[i].Free;
    end;
    except on E: exception do
        ShowMessage(E.Message);
    end;
    try
        PersonalCommon.Done;
    except
    end;

    ChermetDatabase.Close;
    FIBDatabase.Close;
end;

procedure TMain.UchetWremenyActionExecute(Sender: TObject);
var
    form: TUchetWremenyForm;
begin
    if CheckAccess('/ROOT/REPORTS/WORKTIMEREPORT', 'View', True) <> 0 then
        Exit;

    Form := TUchetWremenyForm.Create(Self);
    Form.FormStyle := fsNormal;
    Form.ShowModal;
    Form.Free;
end;

procedure TMain.Educ2ItemClick(Sender: TObject);
var
    Form: TEducReportForm;
begin
    if CheckAccess('/ROOT/REPORTS/EducReport', 'View') = 0 then
    begin
        Form := TEducReportForm.Create(Self);
        Form.SHOW_ALL := -1;
        Form.FormStyle := fsNormal;
        Form.ShowModal;
    end;
end;

procedure TMain.AcceptedForPBankItemClick(Sender: TObject);
var
    Form: tReportAcceptedPBankForm;
begin
    if CheckAccess('/ROOT/REPORTS/EducReport', 'View') = 0 then
    begin
        Form := TReportAcceptedPBankForm.Create(Self);
        Form.ShowModal;
        Form.Free;
    end;
end;

procedure TMain.OrdersHeaderItemClick(Sender: TObject);
var
    TempQuery: TIBQuery;
    WriteQuery: TIBQuery;
    res: string;
begin
    TempQuery := TIBQuery.Create(Self);
    TempQuery.Transaction := ReadTransaction;

    TempQuery.SQL.Text := 'SELECT ORDERS_HEADER FROM INI_ASUP_CONSTS';
    TempQuery.open;

    if TempQuery.IsEmpty = False then
        res := TempQuery['ORDERS_HEADER']
    else
        res := '';

    if InputQuery('Заголовок наказів', 'Введіть новий заголовок наказів:', res) then
    begin
        WriteQuery := TIBQuery.Create(Self);
        WriteQuery.Transaction := WriteTransaction;

        if WriteQuery.Transaction.Active then
            WriteQuery.Transaction.Rollback;
        WriteQuery.Transaction.StartTransaction;

        WriteQuery.SQL.Text := 'UPDATE INI_ASUP_CONSTS SET ORDERS_HEADER = ' +
            QuotedStr(res);
        ExecQuery(WriteQuery);
        WriteQuery.Transaction.Commit;
        WriteQuery.Free;
    end;

    TempQuery.Free;
end;

procedure TMain.MovesReportItemClick(Sender: TObject);
var
    sp: TSprav;
begin
    sp := GetSprav('ASUP\MovesReport');

    with sp.Input do
    begin
        Append;
        FieldValues['DBHANDLE'] := Integer(PersonalCommon.FIBDatabase.Handle);
        FieldValues['DesignReport'] := sDesignReport;
        Post;
    end;

    sp.Show;
    sp.Free;
end;

procedure TMain.DeadWorkersItemClick(Sender: TObject);
var
    sp: TSprav;
{    Form: TSpForm;
    Params: TSpParams;
    NagScreen: TNagScreen;}
begin
{    Form := TSpForm.Create(Self);
    Params := TSpParams.Create;

    Params.SelectProcName := 'ASUP_REPORT_DEAD_WORKERS';
    Params.SpFields := 'TN, FIO, DATE_BEG, DATE_END,-';
    Params.IdField := 'RMOVING';
    Params.Title := 'Список тимчасово прийнятих працівників';
    Params.ReadOnly := True;
    Params.SpMode := spmReadOnly;
    Params.DontHideFirstColumn := True;
    Params.ColumnNames := 'ТН, ПІБ, Дата початку праці, Дата кінця праці,-';

    NagScreen := TNagScreen.Create(Self);
    NagScreen.Show;
    NagScreen.SetStatusText('відбір даних...');
    Form.Init(Params);
    NagScreen.Free;

    Form.ShowModal;

    Form.Free;
    Params.Free;}
    sp := GetSprav('Asup\Asup_Rep_Temp_Workers');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
            FieldValues['ShowStyle'] := 0;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;

end;

procedure TMain.AsupParamsActionControlGetKeys(Sender: TObject;
    var ValueString: Variant);
begin
    ValueString := '';
end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageDlg('Ви справді бажаєте вийти?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        CanClose := false;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IFDEF TESTING}
    TCClient.RemoveClient
{$ENDIF}
end;

procedure TMain.SysAdminItemClick(Sender: TObject);
begin
    if CloseAllAccess then
        Exit;

    SysAdmin.AdminShowUsers(Self);
end;

procedure TMain.ErrorsItemClick(Sender: TObject);
begin
    if CloseAllAccess then
        Exit;

  {    if Version <> 1 then
          SysAdmin.AdminShowErrors(Self);}
end;

procedure TMain.ExecAdressExecute(Sender: TObject);
var
    sp: TSprav;
begin
  // создать справочник

    if NewOrders then
    begin
        sp := GetSprav('Adresses');
        if sp <> nil then
        begin
      // заполнить входные параметры
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                FieldValues['id_adress'] := -1;
                FieldValues['Select'] := 0;
                FieldValues['ShowStyle'] := 1;
                Post;
            end;

      // показать справочник и проанализировать результат
            sp.Show;
        end;
    end;
end;

procedure TMain.BufferPrepareClick(Sender: TObject);
var
    NagScreen: TNagScreen;
begin
    if CloseAllAccess then
        Exit;

    NagScreen := TNagScreen.Create(Self);
    NagScreen.Show;
    NagScreen.SetStatusText('Підготовка до обміну з ЗП...');

    WorkQuery.Transaction := WriteTransaction;
    WorkQuery.Close;
    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_LTD_BUFFER_PREPARE';
    WorkQuery.Open;
    WriteTransaction.Commit;

    NagScreen.Free;

    MessageDlg('Підготовку завершено!', mtInformation, [mbOk], 0);
end;

procedure TMain.SpDismissionItemClick(Sender: TObject);
var
    sp: TSprav;
begin
  // создать справочник
    sp := GetSprav('asup\SpDismission');
    if sp <> nil then
    begin

    // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PersonalCommon.FIBDatabase.Handle);
            FieldValues['FormStyle'] := fsMDIChild;
            Post;
        end;

    // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        sp.Free;
    end;
end;

procedure TMain.SpMovingTypeItemClick(Sender: TObject);
var
    sp: TSprav;
begin
  // создать справочник
    sp := GetSprav('Asup\SpMovingType');
    if sp <> nil then
    begin
    // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PersonalCommon.FIBDatabase.Handle);
            FieldValues['IdType'] := -1;
            Post;
        end;

    // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        sp.Free;
    end;
end;

procedure TMain.SpPoschasTarifItemClick(Sender: TObject);
var
    sp: TSprav;
begin
  // создать справочник
    sp := GetSprav('Asup\SpPochasTarif');
    if sp <> nil then
    begin
    // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(PersonalCommon.FIBDatabase.Handle);
            FieldValues['SpDate'] := Date;
            Post;
        end;

    // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        sp.Free;
    end;
end;

procedure TMain.ExecOrdersCancExecute(Sender: TObject);
var
    Form: TfmOrdersCanc;
begin
    if CloseAllAccess then
        Exit;

    Form := TfmOrdersCanc.Create(Self);
    Form.FormStyle := fsMdiChild;
end;

procedure TMain.ExecPochasFactExecute(Sender: TObject);
var
    Sp: TSprav;
begin
    if CloseAllAccess then
        Exit;
    if CheckAccess('/ROOT/POCHASFACT', 'View', True) <> 0 then
        Exit;
    Sp := TSprav.Create;

    sp := GetSprav('Asup\PochasFact');

    if sp <> nil then
    begin
        Sp.input.Open;

        with sp.Input do
        begin
            Append;

      // Системные переменные
            FieldValues['DBHANDLE'] := Integer(PersonalCommon.FIBDatabase.Handle);

            FieldValues['SpMode'] := 2;
            Post;
        end;

        sp.Show;
        sp.Free;
    end;
end;

procedure TMain.N3Click(Sender: TObject);
var
    First_PBKey, Last_PBKey, i: Integer;
    sql: string;
    eval_bool: Boolean;
    Answer: TModalResult;
begin
    if (Sender <> Application.MainForm) and
        (MessageDlg('Вы действительно хотите произвести выгрузку перемещений?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        exit;

    eval_bool := DontWriteToDbf;
    DontWriteToDbf := False;

    if NichItem.Checked then
        BuffQuery.SQL.Text :=
            'execute procedure Asup_z_Sverka(2, ''01.01.1900'', ''31.12.2150'');'
    else
        BuffQuery.SQL.Text :=
            'execute procedure Asup_z_Moving_Create(2, ''01.01.1900'', ''31.12.2150'');';

    BuffQuery.Transaction.StartTransaction;
    BuffQuery.ExecSQL;
    BuffQuery.Transaction.Commit;

    repeat
        try
    //BuffQuery.Transaction.StartTransaction;

            Buffer.BufferTable.Close;
            Buffer.BufferTable.TableName := 'zmoving';
            Buffer.BufferTable.Exclusive := True;
            Buffer.BufferTable.Open;
            Buffer.BufferTable.Zap;
            Buffer.BufferTable.Exclusive := False;
    //BufferTable.IndexFiles.Clear;
    //BufferTable.IndexFileInclude('zmoving.cdx');

// запись в dbf
            sql := 'SELECT ID_SESSION, ID_MAN_MOVING as ID_MAN_MOV, RMOVING, B_MOVING, DATE_BEG, DATE_END, '
                +
                'REAL_DATE_END as REAL_DATE_, OKLAD_WITH_PPS as OKLAD_WITH, OKLAD_PPS, OKLAD, KOL_STAVOK, ' +
                'KOD_SM, KOD_SM_PPS, ID_DEPARTMENT as ID_DEPARTM, TARIF, ID_POST, ID_CATEGORY as ID_CATEGOR, ' +
                'ID_WORK_MODE as ID_WORK_MO, WORK_MODE_SHIFT as WORK_MODE_, ID_MAN, TN, BIRTH_DATE, ID_SEX, ' +
                'ID_SOVMEST, ID_ORDER, NUM_ORDER, ID_POST_SALARY as ID_POST_SA, STAVKA_OKLAD ' +
                'as STAVKA_OKL FROM ASUP_Z_MOVINGS WHERE id_session = 2';

            Buffer.MassWriteToDbf('ZMoving', 'Asup_z_movings', sql);
            Answer := idOK;
        except on e: Exception do
            begin
                ShowError(e);
                Answer := MessageDlg('Повторить выгрузку?', mtError, [mbYes, mbNo], 0);
                Buffer.BufferTable.Close;
            end
        end;
    until (Answer = idOK) or (Answer = idNo);

    if (Sender <> Application.MainForm) then
        ShowMessage('Выгрузка завершена!');

    Buffer.BufferTable.Close;

    DontWriteToDbf := eval_bool;
end;

procedure TMain.N24Click(Sender: TObject);
var
    i: Integer;
    sql: string;
    eval_bool: Boolean;
    Answer: TModalResult;
begin
    if (Sender <> Application.MainForm) and
        (MessageDlg('Вы действительно хотите произвести выгрузку надбавок?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        exit;

    eval_bool := DontWriteToDbf;
    DontWriteToDbf := False;

    BuffQuery.SQL.Text :=
        'execute procedure Asup_Z_Bonus_Create(2, ''01.01.1900'', ''31.12.2150'');';
    BuffQuery.Transaction.StartTransaction;
    BuffQuery.ExecSQL;
    BuffQuery.Transaction.Commit;

    repeat
        try

    //BuffQuery.Transaction.StartTransaction;

            Buffer.BufferTable.Close;
            Buffer.BufferTable.TableName := 'zbonus';
            Buffer.BufferTable.Exclusive := True;
            Buffer.BufferTable.Open;
            Buffer.BufferTable.Zap;
            Buffer.BufferTable.Exclusive := False;
            BufferTable.IndexFiles.Clear;
            BufferTable.IndexFileInclude('zmoving.cdx');

    // запись в dbf
            sql := 'SELECT ID_SESSION, ID_MAN_MOVING as ID_MAN_MOV, BMOVING, RMOVING, ID_MAN, TN, ID_RAISE,'
                +
                'IS_PERCENT, PERCENT, KOD_SM, KOD_SM_PPS, SUMMA, SUMMA_PPS, DATE_BEG,' +
                'DATE_END, REAL_DATE_END as REAL_DATE_, ID_MAN_BONUS as ID_MAN_BON, TARIF, ID_VIDOPL, ID_ORDER, OKLAD2,' +
                'TARIF2, KOD_VOPL ' +
                'FROM ASUP_Z_BONUS where id_session = 2';

            Buffer.MassWriteToDbf('zbonus', 'Asup_z_bonus', sql);
            Answer := idOK;
        except on e: Exception do
            begin
                ShowError(e);
                Answer := MessageDlg('Повторить выгрузку?', mtError, [mbYes, mbNo], 0);
                Buffer.BufferTable.Close;
            end
        end;
    until (Answer = idOK) or (Answer = idNo);

    if (Sender <> Application.MainForm) then
        ShowMessage('Выгрузка завершена!');

    Buffer.BufferTable.Close;
    DontWriteToDbf := eval_bool;
end;

procedure TMain.WhatsNewItemClick(Sender: TObject);
var
    Form: TfmWhatsNew;
begin
    Form := TfmWhatsNew.Create(Self);
    Form.ShowModal;
    Form.Free;
end;

procedure TMain.StajCalcClick(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if CloseAllAccess then
        Exit;

    PCardSp := GetSprav('ASUP\StajRecalc');
    with PCardSp.Input do
    begin
        Append;
        FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;

procedure TMain.RaiseStajItemClick(Sender: TObject);
var
    PCardSp: TSprav;
begin
    PCardSp := GetSprav('ASUP\RaiseStaj');
    with PCardSp.Input do
    begin
        Append;
        FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;

procedure TMain.AllVuzBuffersItemClick(Sender: TObject);
begin
    N3Click(Application.MainForm);
    N24Click(Application.MainForm);
end;

procedure TMain.N27Click(Sender: TObject);
var
    sp: TSprav;
begin
  // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
    // заполнить входные параметры
        with sp.Input do
        begin
            Append;
      // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
      // MDI-окно
            FieldValues['ShowStyle'] := 1;
      // без выборки
            FieldValues['Select'] := 0;
      // смотрим на текущую дату
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
  // просто показать справочник
    sp.Show;
end;

procedure TMain.N28Click(Sender: TObject);
var
    sp: TSprav;
begin
  // создать справочник
    sp := GetSprav('ASUP\SpRegards');
    if sp <> nil then
    begin
    // заполнить входные параметры
        with sp.Input do
        begin
            Append;
      // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
      // MDI-окно
            FieldValues['ShowStyle'] := 1;
      // без выборки
            FieldValues['Select'] := 0;
      // смотрим на текущую дату
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
  // просто показать справочник
    sp.Show;
end;

procedure TMain.N26Click(Sender: TObject);
begin
    if CloseAllAccess then
        Exit;

    AllBuffersRollback(False);
end;

procedure TMain.N29Click(Sender: TObject);
var
    UForm: TUpLoadForm;
begin
    if CheckAccess('/ROOT/Buffers', 'DONE', True) = 0 then
    begin
        UForm := TUpLoadForm.Create(Self);
        UForm.ShowModal;
        UForm.Free;
    end;
end;

procedure TMain.HospHolOrderItemClick(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if CloseAllAccess then
        Exit;

    PCardSp := GetSprav('ASUP\HolHosOrder');
    with PCardSp.Input do
    begin
        Append;
        FieldValues['DBHandle'] := Integer(PersonalCOmmon.FIBDatabase.Handle);
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;

procedure TMain.BonusSmetItemClick(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if CloseAllAccess then
        Exit;

    PCardSp := GetSprav('ASUP\BonusSmeta');
    with PCardSp.Input do
    begin
        Append;
        FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;

end;

procedure TMain.OrdersMHelpPremiaClick(Sender: TObject);
var
    PCardSp: TSprav;
begin
    if CloseAllAccess then
        Exit;

    PCardSp := GetSprav('ASUP\OrdersMpPr');
    with PCardSp.Input do
    begin
        Append;
        FieldValues['DBHandle'] := Integer(PersonalCOmmon.FIBDatabase.Handle);
        FieldValues['AdminMode'] := AdminMode;
        Post;
    end;
    PCardSp.Show;
    PCardSp.Free;
end;

procedure TMain.FormShow(Sender: TObject);
var
    p: TMDITool;
    sprav: TSprav;
begin
    p := TMDITool.Create;
    p.AddMDIToolBar(Self);
end;

procedure TMain.ForDeveloperItemClick(Sender: TObject);
begin
    if CloseAllAccess then
        Exit;
end;

procedure TMain.SettingsItemClick(Sender: TObject);
begin
    if CloseAllAccess then
        Exit;
end;

procedure TMain.WAccReportItemClick(Sender: TObject);
var
    sp: TSprav;
begin
    if CheckAccess('/ROOT/REPORTS/WACCREPORT', 'View', True) <> 0 then
        Exit;

    sp := GetSprav('ASUP\AsupWAccReport');

    with sp.Input do
    begin
        Append;
        FieldValues['DBHANDLE'] := Integer(PersonalCommon.FIBDatabase.Handle);
        FieldValues['DesignReport'] := sDesignReport;
        Post;
    end;

    sp.Show;
    sp.Free;
end;

procedure TMain.ShowPrintExecute(Sender: TObject);
var
    sp: TSprav;
begin


    if newversion then
    begin
        sp := GetSprav('UP\UpReportsLoader');
        if sp <> nil then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                FieldValues['DesignReport'] := sDesignReport;
                Post;
            end;

            sp.Show;
        end;
    end
    else
    begin
        sp := GetSprav('ASUP\ReportsLoader');
        if sp <> nil then
        begin

            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                FieldValues['DesignReport'] := sDesignReport;
                Post;
            end;

            sp.Show;
        end;
    end;
    sp.Free;
end;

procedure TMain.HolPlanClick(Sender: TObject);
var
    sp: TSprav;
begin
    if CheckAccess('/ROOT/UPHOLIDAYPLAN', 'View', True) <> 0 then
        Exit;

    if newversion then
    begin
        sp := GetSprav('UP\UpHolidayPlan');
        if sp <> nil then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                FieldValues['ShowMod'] := 0;
                Post;
            end;
            sp.Show;
        end;
    end
end;

{procedure TMain.ExecCheckExecute(Sender: TObject);
var
    CheckForm: TfmCheck;
begin
    if CloseAllAccess then
        Exit;

    if (CheckAccess('/ROOT/CheckMenu', 'View', True) <> 0) then
        Exit;

    CheckForm := TfmCheck.Create(Self);
    CheckForm.ShowModal;
    CheckForm.Free;
end;}

procedure TMain.ReminderItemClick(Sender: TObject);
var
    sp: TSprav;
begin
     // вызвать модуль напоминаний
    if (PersonalCommon.Version = 1) then
    begin
        try
            sp := GetSprav('UP\UpReminder');
            if sp <> nil then
            begin
                with sp.Input do
                begin
                    Append;
                    FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                    FieldValues['ShowStyle'] := 0;
                    Post;
                end;
            end;
            sp.Show;
        except
        end;
    end;
end;

procedure TMain.ListPeopleItemClick(Sender: TObject);
var
    T: TfminfoPEOPLE;
begin
    T := TfminfoPEOPLE.Create(self, FIBDatabase.Handle);
    T.ShowModal;
    T.Free;
end;

procedure TMain.PrepareForm2;
var
    i, res: Integer;
    restr_acc: Boolean;
    sprav: TSprav;
begin
  // Отобразить путь к базе
    DBPathLabel.Caption := 'База даних: ' + fibGetCurrentDBPath;

      //Регулирование отображения пунктов меню

    ImportPeopleItem.Visible := FirstInstall;
    AutoAcceptItem.Visible := FirstInstall;
    InitExport.Visible := (Version = 1);
    BonusSmetItem.Visible := NewOrders;
    AllReportsItem.Visible := NewOrders;
    OrdersMHelpPremia.Visible := NewOrders;
    SpPCards.Visible := NewOrders;
    ListPeopleItem.Visible := Version = 1;
    HolidayItem.Visible := not NewVersion;



    if newversion then SpPoschasTarifItem.Visible := False;

//    ShowMessage(BoolToStr(NewVersion));
    HolPlan.Visible := NewVersion;

    PochasFact.Visible := NewOrders { and not NewVersion};
    OrdersCancItem.Visible := NewOrders and not NewVersion;
    HospHolOrderItem.Visible := (not NewVersion) and NewOrders;
    OrdersMHelpPremia.Visible := (not NewVersion) and NewOrders;
    Print.Visible := not NewVersion;
    AllReports.Visible := NewVersion;

    WAccReportItem.Enabled := Version = 1;
    WAccReportItem.Visible := Version = 1;

    VilkiItem.Visible := Test;

  // Пункты меню только для разработчиков
    ForDeveloperItem.Visible := Developer;

    DontWriteTableItem.Checked := DontWriteTableToDbf;
    DontWriteDbfItem.Checked := DontWriteToDbf;
    TestItem.Checked := Test;
    ShowQueryItem.Checked := ShowQuery;
    DesignReportItem.Checked := sDesignReport;

    ExitLabel.Caption := '';

    AcceptedForPBankItem.Visible := (Version = 2);

    if NewOrders then
    begin
        ExecSR.Enabled := False;
        ExecSR.Visible := False;
    //HospReestrItem.Visible := False;
        ExecCheck.Visible := False;
    end;

    NewOrdersSpItem.Visible := NewOrders;
    SpOrdersMenu.Visible := not NewOrders;
    Staff.Visible := not NewOrders;
  //OsvitaItem.Visible := not NewOrders;
    War.Visible := not NewOrders;
    N16.Visible := not NewOrders;
    N29.Visible := NewOrders;
    StajItem.Visible := not NewOrders;
    VidoplItem.Visible := not NewOrders;
    StajCalc.Visible := NewOrders;
    ReminderItem.Visible := (Version = 1);
    CertItem.Visible := NewOrders;

    if Version <> 2 then
    begin
        TableDump.Visible := False;
        HospReestrItem.Visible := False;
    end;

  // для табеля кое-чего сделать
    TableUserLogin := CurrentLogin;
    TableUserName := CurrentUserName;
    if NoPassMode then
        TableUserFlags := 4
    else
        if AdminMode then
            TableUserFlags := 8
        else
            if Developer then
                TableUserFlags := 16
            else
                TableUserFlags := 0;

    BufferPrepare.Visible := (Version = 1) and AdminMode;
    BufferCleanItem.Visible := (Version = 1) and AdminMode;
    //AllBuffersItem.Visible := (Version = 1) and AdminMode;

      // Показать имя пользователя
    ShowUserName;


        // Скрыть ненужные пункты если пользователь с ограниченным доступом
    res := fibCheckPermission('/ROOT/UP_MAIN_MENU/RESTRICT_ALL', 'Belong');
    if res = 0 then restr_acc := True
    else restr_acc := False;

    if restr_acc then
    begin
        sp.Enabled := False;
        sp.Visible := False;
        ServiceItem.Enabled := False;
        ServiceItem.Visible := False;
        HelpMenu.Enabled := False;
        HelpMenu.Visible := False;
        ExecSR.Enabled := False;
        ExecSR.Visible := False;
        ShtatRas.Enabled := False;
        ShtatRas.Visible := False;
        ExecHospital.Enabled := False;
        ExecHospital.Visible := False;
        ExecRating.Enabled := False;
        ExecRating.Visible := False;
        ExecDepartments.Enabled := False;
        ExecDepartments.Visible := False;
        ExecPochasFact.Enabled := False;
        ExecPochasFact.Visible := False;
        Mark.Enabled := False;
        Mark.Visible := False;
        OrdersCancItem.Enabled := False;
        OrdersCancItem.Visible := False;
        HospReestrItem.Enabled := False;
        HospReestrItem.Visible := False;
        TableItem.Enabled := False;
        TableItem.Visible := False;
        OrdersCancItem.Enabled := False;
        OrdersCancItem.Visible := False;
        ManComandItem.Enabled := False;
        ManComandItem.Visible := False;
        HospHolOrderItem.Enabled := False;
        HospHolOrderItem.Visible := False;
        OrdersMHelpPremia.Enabled := False;
        OrdersMHelpPremia.Visible := False;
        ExecTable.Enabled := False;
        ExecTable.Visible := False;
        HolPlan.Visible := False;
        CertItem.Visible := False;
    end;

                    // вызвать модуль напоминаний
    FibDatabase.Connected := True;
    if (PersonalCommon.Version = 1) then
    begin
        try
            sprav := GetSprav('UP\UpReminder');
            if sprav <> nil then
            begin
                with sprav.Input do
                begin
                    Append;
                    FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
                    FieldValues['ShowStyle'] := 0;
                    Post;
                end;
                sprav.Show;
            end;
            sprav.Free;
        except on e: Exception do
            begin
                ShowMessage(e.Message);
            end
        end;
    end;
    ShowOnMenu;
end;

procedure TMain.CertItemClick(Sender: TObject);
var
    Sp: TSprav;
    res: Integer;
begin
    if CloseAllAccess then
        Exit;

    res := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'Belong');
    if (res <> 0 ) then
    begin
        MessageDlg('Ви не маєте прав доступу до цього пункту!', mtError, [mbYes], -1);
        Exit;
    end;


    Sp := TSprav.Create;

    sp := GetSprav('ASUP\ReqCertificate.bpl');

    if sp <> nil then
    begin
        Sp.input.Open;

        with sp.Input do
        begin
            Append;

      // Системные переменные
            FieldValues['DBHANDLE'] := Integer(PersonalCommon.FIBDatabase.Handle);

            FieldValues['SpMode'] := 2;
            Post;
        end;

        sp.Show;
        sp.Free;
    end;
end;

procedure TMain.ApplicationEventsDisconnectException(Sender: TObject; E: Exception);
var
temp_s:string;
begin
    if E is EFIBInterBaseError
    then begin
          if EFIBInterbaseError(E).SQLCode = -902 then
             begin
               temp_s:=EFIBInterbaseError(E).Message + 'Зв"язок з сервером було втрачено, зверніться до адміністратора.';
               MessageBox(Application.Handle,Pchar(temp_s),'Увага!',MB_OK);
               Application.Terminate;
             end
    end;
end;

procedure TMain.PersonStajClick(Sender: TObject);
var
    Sp: TSprav;
    res: Integer;
begin
    if CloseAllAccess then
        Exit;

    res := fibCheckPermission('/ROOT/UP_MAIN_MENU/PersonStaj', 'Belong');
    if (res <> 0 ) then
    begin
        MessageDlg('Ви не маєте прав доступу до цього пункту!', mtError, [mbYes], -1);
        Exit;
    end;

    Sp := TSprav.Create;
    sp := GetSprav('UP\UPReestrZajavok.bpl');
    if sp <> nil then
    begin
        Sp.input.Open;
        with sp.Input do
        begin
            Append;
            // Системные переменные
            FieldValues['DBHANDLE'] := Integer(PersonalCommon.FIBDatabase.Handle);
            Post;
        end;
        sp.Show;
        sp.Free;
    end;
end;

procedure TMain.ShowOnMenu;
var
    mi: TMenuItem;
    res : Integer;
begin
    {*если доступ закрыт ко всему*}
    if CloseAllAccess then
    begin
        PCards.Visible := False;
        Orders.Visible := False;
        ShtatRas.Visible := False;
        HospItem.Visible := False;
        HospReestrItem.Visible := False;
        ManComandItem.Visible := False;
        TableItem.Visible := False;
        PochasFact.Visible := False;
        OrdersMHelpPremia.Visible := False;
        PersonStaj.Visible := False;
        Exit;
    end;
    if NewOrders then
    begin
        //приказы
        res := fibCheckPermission('/ROOT/Orders', 'View');
        if (res <> 0)
        then Orders.Visible := False;
        //штатное расписание
        res :=  fibCheckPermission('/ROOT/Plan_Shtat_Ras', 'View');
        if (res <> 0)
        then ShtatRas.Visible := False;
        // Листи непрацездатності
        if (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values/Z_Menu_HOSP','Belong')=0)
            or (fibCheckPermission('/ROOT/Zarplata/Z_Menu/Z_Menu_Values','Belong')=0)
            or (fibCheckPermission('/ROOT/Hosp', 'View')= 0)
        then HospItem.Visible := True
        else  HospItem.Visible := False;
        // Реєстри лікарняних листів
        res :=  fibCheckPermission('/ROOT/HOSPREESTR', 'View');
        if (res <> 0)
        then HospReestrItem.Visible := False;
        // Відрядження
        res :=  fibCheckPermission('/ROOT/Commandirovki', 'View');
        if (res <> 0)
        then ManComandItem.Visible := False;
        // Фактична погодинна праця
        res :=  fibCheckPermission('/ROOT/POCHASFACT', 'View');
        if (res <> 0)
        then PochasFact.Visible := False;
        // Планові відпустки
        res :=  fibCheckPermission('/ROOT/UPHOLIDAYPLAN', 'View');
        if (res <> 0)
        then HolPlan.Visible := False;
        // Робота з персоніфікацією 
        res :=  fibCheckPermission('/ROOT/UP_MAIN_MENU/PersonStaj', 'Belong');
        if (res <> 0)
        then PersonStaj.Visible := False;
        //  Посвідчення
        res := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'Belong');
        if (res <> 0 )
        then CertItem.Visible := False;
        res := fibCheckPermission('/ROOT/ServiceMenu', 'View');
        if (res <> 0 )
        then ServiceItem.Visible := False;
        res := fibCheckPermission('/ROOT/UP_MAIN_MENU/UP_REPORTS', 'View');
        if (res <> 0 )
        then begin

            ShowPrint.Enabled := False;
            ShowPrint.Visible := False;
            AllReports.Visible := False;

        end;

    end;
end;
end.

