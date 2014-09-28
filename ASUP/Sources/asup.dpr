{ -$Id: asup.dpr,v 1.53 2008/02/11 11:32:48 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система «Управление персоналом              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                                Модуль проекта                                }
{                                                  ответственный: Олег Волков  }

program ASUP;

{ проект }


uses
    Forms,
    IniFiles,
    SysUtils,
    Dialogs,
    SpCommon,
    Controls,
    ActnList,
    SysAdmin,
    Accmgmt,
    NagScreenUnit,
    uTableCommon,
    Registry,
    Windows,
    Buffer,
    MainUnit in 'MainUnit.pas' {Main},
    PeopleViewUnit in 'PeopleViewUnit.pas' {PeopleViewForm},
    PeopleDetailsUnit in 'PeopleDetailsUnit.pas' {PeopleDetailsForm},
    PeopleSearchUnit in 'PeopleSearchUnit.pas' {PeopleSearchForm},
    PCardsViewUnit in 'PCardsViewUnit.pas' {PCardsViewForm},
    PCardsDetailsUnit in 'PCardsDetailsUnit.pas' {PCardsDetailsForm},
    PCardsSearchUnit in 'PCardsSearchUnit.pas' {PCardsSearchForm},
    SpWarpostUnit in 'SpWarpostUnit.pas' {SpWarpostForm},
    AddWarPost in 'AddWarPost.pas' {AddWarpostForm},
    AddWarSostav in 'AddWarSostav.pas' {AddWarSostavForm},
    SpWarSostavUnit in 'SpWarSostavUnit.pas' {SpWarSostavForm},
    DepartmentsViewUnit in 'DepartmentsViewUnit.pas' {DepartmentsViewForm},
    DepartmentsDetailsUnit in 'DepartmentsDetailsUnit.pas' {DepartmentsDetailsForm},
    DepartmentsSearchUnit in 'DepartmentsSearchUnit.pas' {DepartmentsSearchForm},
    EducationUnit in 'EducationUnit.pas' {EducationForm},
    SpEducOrgUnit in 'SpEducOrgUnit.pas' {SpEducOrgForm},
    AddEducOrgUnit in 'AddEducOrgUnit.pas' {AddEducOrgForm},
    PersonalCommon in 'PersonalCommon.pas',
    SpPostUnit in 'SpPostUnit.pas' {SpPostForm},
    AddPost in 'AddPost.pas' {AddPostForm},
    SpTarNetUnit in 'SpTarNetUnit.pas' {SpTarNetForm},
    AddTarNet in 'AddTarNet.pas' {AddTarNetForm},
    TarDigits in 'TarDigits.pas' {SpTarDigitsForm},
    AddTarDigit in 'AddTarDigit.pas' {AddTarDigitForm},
    AcceptToWorkUnit in 'AcceptToWorkUnit.pas' {AcceptToWorkForm},
    ShtatRas in 'ShtatRas.pas' {ShtatRasForm},
    AddShtatPost in 'AddShtatPost.pas' {AddShtatPostForm},
    ShtatSPZ in 'ShtatSPZ.pas' {ShtatSPZForm},
    AddShtatSPZ in 'AddShtatSPZ.pas' {AddShtatSPZForm},
    ManPunishingUnit in 'ManPunishingUnit.pas' {ManPunishingForm},
    SpPrivUnit in 'SpPrivUnit.pas' {SpPrivForm},
    AddPrivUnit in 'AddPrivUnit.pas' {AddPrivForm},
    EducReportUnit in 'EducReportUnit.pas' {EducReportForm},
    ShtatPrint in 'ShtatPrint.pas' {ShtatPrintForm},
    WarReportUnit in 'WarReportUnit.pas',
    WomenReportUnit in 'WomenReportUnit.pas' {WomenReportForm},
    AddAwardUnit in 'AddAwardUnit.pas' {AddAwardForm},
    ManAwardUnit in 'ManAwardUnit.pas' {ManAwardForm},
    OrdersEditUnit in 'OrdersEditUnit.pas' {OrdersEditForm},
    OrdersViewUnit in 'OrdersViewUnit.pas' {OrdersViewForm},
    SpAwardUnit in 'SpAwardUnit.pas' {SpAwardForm},
    SpHolidayUnit in 'SpHolidayUnit.pas',
    PostBonus in 'PostBonus.pas' {PostBonusForm},
    AddPostBonus in 'AddPostBonus.pas' {AddPostBonusForm},
    WorkBookUnit in 'WorkBookUnit.pas' {WorkBookForm},
    PrintOrderUnit in 'PrintOrderUnit.pas' {PrintOrderForm},
    DismissManUnit in 'DismissManUnit.pas' {DismissManForm},
    AddStaj in 'AddStaj.pas' {AddStajForm},
    PrivUnit in 'PrivUnit.pas' {ManPrivForm},
    ManPunishingRemoveUnit in 'ManPunishingRemoveUnit.pas' {ManPunishingRemoveForm},
    SpStajUnit in 'SpStajUnit.pas' {SpStajForm},
    ManBonus in 'ManBonus.pas' {ManBonusForm},
    LogInFormUnit in 'LogInFormUnit.pas' {LogInForm},
    MoveManUnit in 'MoveManUnit.pas' {MoveManForm},
    UniPrint in 'UniPrint.pas' {UniPrintForm},
    AddVihod in 'AddVihod.pas' {AddVihodForm},
    SpWorkMode in 'WorkMode\SpWorkMode.pas' {SpWorkModeForm},
    ManBonusRemoveUnit in 'ManBonusRemoveUnit.pas' {ManBonusRemoveForm},
    ManPrivRemoveUnit in 'ManPrivRemoveUnit.pas' {ManPrivRemoveForm},
    AddHoliday in 'AddHoliday.pas' {AddHolidayForm},
    AddManFamily in 'AddManFamily.pas' {AddManFamilyForm},
    SelectMovingUnit in 'SelectMovingUnit.pas' {SelectMovingForm},
    ImportPeople in 'ImportPeople.pas' {ImportPeopleForm},
    AutoAccept in 'AutoAccept.pas' {AutoAcceptForm},
    ToDoListUnit in 'ToDoListUnit.pas' {ToDoListForm},
    ExportLog in 'ExportLog.pas' {ExportLogForm},
    Consts in 'Consts.pas',
    ChangeManBonusUnit in 'ChangeManBonusUnit.pas' {ChangeManBonusForm},
    AddChangeManBonusUnit in 'AddChangeManBonusUnit.pas' {AddChangeManBonusForm},
    SpVidopl in 'SpVidopl.pas' {SpVidoplForm},
    AddVidOpl in 'AddVidOpl.pas' {AddVidOplForm},
    AddBonus in 'AddBonus.pas' {AddBonusForm},
    MArkUnit in 'MArkUnit.pas' {MarkForm},
    ToDoManCloseUnit in 'ToDoManCloseUnit.pas',
    UCalendar in 'WorkMode\UCalendar.pas' {CalendarForm},
    ExportUnit in 'ExportUnit.pas',
    ImportLog in 'ImportLog.pas' {ImportLogForm},
    PremiaOrderUnit in 'PremiaOrderUnit.pas' {PremiaOrderForm},
    PremiaFilterUnit in 'PremiaFilterUnit.pas' {PremiaFilterForm},
    BirthDayReportUnit in 'BirthDayReportUnit.pas' {BirthDayReportForm},
    ReportVedomostPrinatihUnit in 'ReportVedomostPrinatihUnit.pas' {ReportVedomostPrinatihForm},
    PCardExportUnit in 'PCardExportUnit.pas' {PCardExportForm},
    PensiaReportUnit in 'PensiaReportUnit.pas' {PensiaReportForm},
    UchetWremenyUnit in 'UchetWremenyUnit.pas' {UchetWremenyForm},
    FormPlanShtat in 'FormPlanShtat.pas' {FormPlanShtatRasForm},
    ExternProgsUnit in 'ExternProgsUnit.pas' {ExternProgsForm},
    ExternProgsAddUnit in 'ExternProgsAddUnit.pas' {ExternProgsAddForm},
    ChildredReportUnit in 'ChildredReportUnit.pas' {ChildrenReportForm},
    AddSpz in 'AddSpz.pas' {AddSpzForm},
    PassVidanUnit in 'PassVidanUnit.pas' {PassVidanForm},
    SpSpecUnit in 'SpSpecUnit.pas' {SpecForm},
    KvalFormUnit in 'KvalFormUnit.pas' {KvalForm},
    VoenkomFormUnit in 'VoenkomFormUnit.pas' {VoenkomForm},
    SpSR in 'SpSR.pas' {SpSRForm},
    AddSR in 'AddSR.pas' {AddSRForm},
    DikretHollidayOrderUnit in 'DikretHollidayOrderUnit.pas' {DikretHollidayOrderForm},
    ManHolidayUnit in 'manholidayunit.pas' {ManHolidayForm},
    AddManHolidayUnit in 'AddManHolidayUnit.pas' {AddManHolidayForm},
    SpWorkExc in 'WorkMode\SpWorkExc.pas' {SpWorkExcForm},
    ManComandUnit in 'ManComandUnit.pas' {ManComandForm},
    ManComandFactUnit in 'ManComandFactUnit.pas' {ManComandFactForm},
    GoodFunctionsUnit in 'GoodFunctionsUnit.pas',
    AddManComandPlanDet in 'AddManComandPlanDet.pas' {AddManComandPlanDetForm},
    ManComandFactEditUnit in 'ManComandFactEditUnit.pas' {ManComandFactEditForm},
    AddPaperSignerUnit in 'AddPaperSignerUnit.pas' {AddPaperSignerForm},
    AddAdditionalActionsUnit in 'AddAdditionalActionsUnit.pas' {AddAdditionalActionsForm},
    AddInplaceBonus in 'AddInplaceBonus.pas' {AddInplaceBonusForm},
    HolidayBackUnit in 'holidaybackunit.pas' {HolidayBackForm},
    IncreaseOrderUnit in 'increaseorderunit.pas' {IncreaseOrderForm},
    AddManBonusRemoveUnit in 'AddManBonusRemoveUnit.pas' {AddManBonusRemoveForm},
    AddAttrUnit in 'AddAttrUnit.pas' {AddAttrForm},
    PCardAttributesUnit in 'PCardAttributesUnit.pas',
    PCardAttrEditUnit in 'PCardAttrEditUnit.pas' {EditPCardAttrForm},
    uSearchFrame in 'SpLib\uSearchFrame.pas' {fmSearch: TFrame},
    WorkReg in 'WorkMode\WorkReg.pas' {WorkRegForm},
    AddExc in 'WorkMode\AddExc.pas' {AddExcForm},
    AddManWorkModeChangeUnit in 'WorkMode\AddManWorkModeChangeUnit.pas' {AddManWorkModeChangeForm},
    AddWorkMode in 'WorkMode\AddWorkMode.pas' {AddWorkModeForm},
    AddWorkModeChange in 'WorkMode\AddWorkModeChange.pas' {AddWorkModeChangeForm},
    AddWorkReg in 'WorkMode\AddWorkReg.pas' {AddWorkRegForm},
    AddWorkTimeNorm in 'WorkMode\AddWorkTimeNorm.pas' {AddWorkTimeForm},
    ManWorkModeChangeUnit in 'WorkMode\ManWorkModeChangeUnit.pas' {ManWorkModeChangeForm},
    WorkModeChanges in 'WorkMode\WorkModeChanges.pas' {WorkModeChangesForm},
    uTableFrame in 'TimeTable\uTableFrame.pas' {frmTable: TFrame},
    AddHoursOrderEdit in 'AddHoursOrderEdit.pas' {AddHoursOrderEditForm},
    uTableSelectFrame in 'TimeTable\uTableSelectFrame.pas' {frmTableSelect: TFrame},
    uTimeTable in 'TimeTable\uTimeTable.pas' {fmTimeTable},
    AddHoursOrder in 'AddHoursOrder.pas' {AddHoursOrderForm},
    AddManBonusUnit in 'addmanbonusunit.pas' {AddManBonusForm},
    DtManBonusItemsUnit in 'dtmanbonusitemsunit.pas' {DtManBonusItemsForm},
    uDepartmentGroup in 'TimeTable\uDepartmentGroup.pas' {fmDepartmentsGroup},
    uTablePrint in 'TimeTable\uTablePrint.pas' {fmTablePrint},
    uNevihod in 'TimeTable\uNevihod.pas' {fmNevihod},
    MedicReportUnit in 'medicreportunit.pas' {MedicReportForm},
    SpWorkTimeNorm in 'WorkMode\SpWorkTimeNorm.pas' {SpWorkTimeForm},
    uTableGroup in 'TimeTable\uTableGroup.pas',
    BonusReportUnit in 'bonusreportunit.pas' {ReportBonusForm},
    Date_Form in 'Date_Form.pas' {ReportVakantForm},
    AddHolidayBackUnit in 'AddHolidayBackUnit.pas' {AddHolidayBackForm},
    uCheckMain in 'Check\uCheckMain.pas' {fmCheck},
    ReestrMainUnit in 'ReestrMainUnit.pas' {ReestrMainForm},
    EditReestrUnit in 'EditReestrUnit.pas' {EditReestrForm},
    ReestrFillFormUnit in 'ReestrFillFormUnit.pas',
    ReportAcceptedPBank in 'ReportAcceptedPBank.pas' {ReportAcceptedPBankForm},
    AddSovmBonusUnit in 'AddSovmBonusUnit.pas' {AddSovmBonusForm},
    ProcessUnit in 'ProcessForm\ProcessUnit.pas' {ProcessForm},
    ReBufferUnit in 'Buffer\ReBufferUnit.pas' {ReBufferForm},
    BufferCleanUnit in 'Buffer\buffercleanunit.pas' {BuffersCleanForm},
    AllBuffersUnit in 'Buffer\AllBuffersUnit.pas' {AllBuffersForm},
    UChangeVGroup in 'Vilki\UChangeVGroup.pas' {Form_Change_Group},
    UAddVilka in 'Vilki\UAddVilka.pas' {Form_Add_Vilka},
    UChangeMinMax in 'Vilki\UChangeMinMax.pas' {Form_ChangeMinMax},
    U_SPoklminmax in 'Vilki\U_SPoklminmax.pas' {Form_SP_OKL_MIN_MAX},
    uTableChangesPrint in 'TimeTable\uTableChangesPrint.pas' {frmTableChangesPrint},
    uCommonDBParams in 'CommonDB\uCommonDBParams.pas',
    uCommonDB in 'CommonDB\uCommonDB.pas',
    uFIBCommonDBErrors in 'CommonDB\FIBCommonDB\uFIBCommonDBErrors.pas',
    uFIBCommonDB in 'CommonDB\FIBCommonDB\uFIBCommonDB.pas',
    uIBXCommonDBErrors in 'CommonDB\IBXCommonDB\uIBXCommonDBErrors.pas',
    uIBXCommonDB in 'CommonDB\IBXCommonDB\uIBXCommonDB.pas',
    uUserButton in 'uUserButton.pas' {frmChangeUserAction},
    uTableDump in 'TimeTable\uTableDump.pas' {fmTableDump},
    uTableParams in 'TimeTable\uTableParams.pas' {frmTableParams},
    uDepartmentsTree in 'SpDepartment\uDepartmentsTree.pas' {fmDepartmentsTree: TFrame},
    BoHolidayForm in 'BoHolidayForm.pas' {BoHoliday},
    AddBoHolidayUnit in 'AddBoHolidayUnit.pas' {AddBoHoliday},
    ManIoUnit in 'ManIoUnit.pas' {ManIoForm},
    AddManIoUnit in 'AddManIoUnit.pas' {AddManIoForm},
    ReportHolidayAndHospitalCrossingUnit in 'ReportHolidayAndHospitalCrossingUnit.pas' {ReportHolidayAndHospitalCrossingForm},
    uRunOnce in 'uRunOnce.pas',
    addholidaylongunit in 'addholidaylongunit.pas' {addholidaylongForm},
    uVihodsDetails in 'TimeTable\uVihodsDetails.pas',
    uTableSignersData in 'TimeTable\uTableSignersData.pas' {dmTableSigners: TDataModule},
    uTableSignerAdd in 'TimeTable\uTableSignerAdd.pas' {fmTableSignerAdd},
    uTableStrings in 'TimeTable\uTableStrings.pas',
    uGlobalActions in 'uGlobalActions.pas' {GlobalActions: TDataModule},
    uTableSignersList in 'TimeTable\uTableSignersList.pas' {fmTableSignersList},
    uTableSigners in 'TimeTable\uTableSigners.pas',
    uSysParams in 'uSysParams.pas',
    uTableRealSignerAdd in 'TimeTable\uTableRealSignerAdd.pas' {fmTableRealSignerAdd},
    Orders2ViewUnit in 'Orders2ViewUnit.pas' {Orders2ViewForm},
    uWorkExcCopy in 'WorkMode\uWorkExcCopy.pas' {fmCopyExc},
    Orders2EditUnit in 'Orders2EditUnit.pas' {Orders2EditForm},
    AddForm in 'AddKosht\AddForm.pas' {frmAddSmet},
    AddItemUnit in 'AddItemUnit.pas' {AddItemForm},
    TextShablonsUnit in 'textshablonsunit.pas' {TextShablonsForm},
    AddTextShablonUnit in 'addtextshablonunit.pas' {AddTextShablonForm},
    uHolidayCompensOrder in 'uHolidayCompensOrder.pas' {fmHolidayCompensOrder},
    uHolidayCompensAdd in 'uHolidayCompensAdd.pas' {fmHolidayCompensAdd},
    uAsupParams in 'uAsupParams.pas' {fmAsupParams},
    ReportAccepted2 in 'reportaccepted2.pas' {ReportAccepted2Form},
    uTableSignCheck in 'TimeTable\uTableSignCheck.pas',
    uTableData in 'TimeTable\uTableData.pas' {TableData: TDataModule},
    uOrdersNotInZP in 'TimeTable\uOrdersNotInZP.pas' {fmOrdersNotInZP},
    ProlongManOrder in 'ProlongManOrder.pas' {fmProlongManOrder},
    uWorkHalfTime in 'TimeTable\uWorkHalfTime.pas' {fmWorkHalfTime},
    uAddHalfTime in 'TimeTable\uAddHalfTime.pas' {fmAddHalfTime},
    uOrdersCanc in 'uOrdersCanc.pas' {fmOrdersCanc},
    uOrdersCancModify in 'uOrdersCancModify.pas' {fmOrdersCancModify},
    uShouldClosePCard in 'uShouldClosePCard.pas' {fmShouldClosePCard},
    uAddCommonPremia in 'uAddCommonPremia.pas' {fmAddCommonPremia},
    uWhatsNew in 'uWhatsNew.pas' {fmWhatsNew},
    uUpLoad in 'uUpLoad.pas' {UpLoadForm},
    uCommonSp in 'uCommonSp.pas',
    UPPInfo in 'UPPInfo.pas' {fminfoPEOPLE};

{ToDoManCloseForm}

{$R *.RES}

var
    Handle: Pointer;
    NagScreen: TNagScreen;
    reg2: TRegistry;
    StartupAction: string;
    i: Integer;
    sp: TSprav;
begin

    Application.Initialize;
    Application.Title := 'Управління персоналом';

    LogInForm := TLogInForm.Create(Application);

    if LogInForm.ShowModal = mrOk then
    begin
        Handle := LogInForm.AccResult.DBHandle;
        LogInForm.Free;

        Application.CreateForm(TMain, Main);
        try
            NagScreen := TNagScreen.Create(Main);
            NagScreen.Show;

            NagScreen.SetStatusText('Підключення до сховища інформації...');

            Main.FIBDatabase.Handle := Handle;
            Main.FIBDatabase.Connected := True;

            Main.ChermetDatabase.SetHandle(Handle);
            Main.ChermetDatabase.Connected := True;
        except on e: Exception do
            begin
            end
        end;


          // инициализация общих для АСУП транзацкий, запросов...
        PersonalCommon.Init(Main.ChermetDatabase, Main.FIBDatabase);

        uTableCommon.TableReadTransaction := PersonalCommon.ReadTransaction;
        uTableCommon.TableWriteTransaction := PersonalCommon.WriteTransaction;

        Main.InfoQuery.Transaction := ReadTransaction;
        Main.BuffQuery.Transaction := BufferTransaction;

          // выполнить действия один раз
        RunOnce;

        NagScreen.Free;

        Main.SetCaption;

        Buffer.Buffer_Id_System := 123;

          // откатить все буферные транзакции
        if not DontWriteToDbf then
            AllBuffersRollback;

        StartupAction := '';
        reg2 := TRegistry.Create;
        try
            try
                reg2.RootKey := HKEY_CURRENT_USER;

                if reg2.OpenKey('\Software\ASUP\', True) then
                begin
                    StartupAction := reg2.ReadString('StartupAction');
                end;

                for i := 1 to ParamCount do
                    if Pos('action:', ParamStr(i)) = 1 then
                        StartupAction := Copy(ParamStr(i), Length('action:') + 1, 200);

            except
            end
        finally
            reg2.Free;
        end;

        with Main do
            if StartupAction <> '' then
                for i := 0 to ActionList1.ActionCount - 1 do
                    if ActionList1.Actions[i] is TAction then
                        if (ActionList1.Actions[i].Category = 'Exec') and
                            ((ActionList1.Actions[i] as TAction).Name = StartupAction) then
                            (ActionList1.Actions[i] as TAction).Execute;



        SpInit(Handle);
        InitializaAdminSystem(Main, Handle, 123, GetUserId, False);

        Main.PrepareForm2;

        Application.Run;
        SpDone;
        FinalizeAdminSystem;
    end
    else
        LogInForm.Free;

    Application.Terminate;
end.

