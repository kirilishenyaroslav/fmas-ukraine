{ -$Id: UpOrderList.dpr,v 1.6 2008/04/11 09:53:25 gala Exp $}
{******************************************************************************}
{               Автоматизированная система «Управление персоналом              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                                Модуль проекта                                }
{                                                  ответственный: Олег Волков  }

program UpOrderList;

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
  uBuffer,
  NagScreenUnit,
  uTableCommon,
  Registry,
  Windows,
  MainUnit in '..\..\..\ASUP\Sources\MainUnit.pas' {Main},
  PeopleViewUnit in '..\..\..\ASUP\Sources\PeopleViewUnit.pas' {PeopleViewForm},
  PeopleDetailsUnit in '..\..\..\ASUP\Sources\PeopleDetailsUnit.pas' {PeopleDetailsForm},
  PeopleSearchUnit in '..\..\..\ASUP\Sources\PeopleSearchUnit.pas' {PeopleSearchForm},
  PCardsViewUnit in '..\..\..\ASUP\Sources\PCardsViewUnit.pas' {PCardsViewForm},
  PCardsDetailsUnit in '..\..\..\ASUP\Sources\PCardsDetailsUnit.pas' {PCardsDetailsForm},
  PCardsSearchUnit in '..\..\..\ASUP\Sources\PCardsSearchUnit.pas' {PCardsSearchForm},
  SpWarpostUnit in '..\..\..\ASUP\Sources\SpWarpostUnit.pas' {SpWarpostForm},
  AddWarPost in '..\..\..\ASUP\Sources\AddWarPost.pas' {AddWarpostForm},
  AddWarSostav in '..\..\..\ASUP\Sources\AddWarSostav.pas' {AddWarSostavForm},
  SpWarSostavUnit in '..\..\..\ASUP\Sources\SpWarSostavUnit.pas' {SpWarSostavForm},
  DepartmentsViewUnit in '..\..\..\ASUP\Sources\DepartmentsViewUnit.pas' {DepartmentsViewForm},
  DepartmentsDetailsUnit in '..\..\..\ASUP\Sources\DepartmentsDetailsUnit.pas' {DepartmentsDetailsForm},
  DepartmentsSearchUnit in '..\..\..\ASUP\Sources\DepartmentsSearchUnit.pas' {DepartmentsSearchForm},
  EducationUnit in '..\..\..\ASUP\Sources\EducationUnit.pas' {EducationForm},
  SpEducOrgUnit in '..\..\..\ASUP\Sources\SpEducOrgUnit.pas' {SpEducOrgForm},
  AddEducOrgUnit in '..\..\..\ASUP\Sources\AddEducOrgUnit.pas' {AddEducOrgForm},
  PersonalCommon in '..\..\..\ASUP\Sources\PersonalCommon.pas',
  SpPostUnit in '..\..\..\ASUP\Sources\SpPostUnit.pas' {SpPostForm},
  AddPost in '..\..\..\ASUP\Sources\AddPost.pas' {AddPostForm},
  SpTarNetUnit in '..\..\..\ASUP\Sources\SpTarNetUnit.pas' {SpTarNetForm},
  AddTarNet in '..\..\..\ASUP\Sources\AddTarNet.pas' {AddTarNetForm},
  TarDigits in '..\..\..\ASUP\Sources\TarDigits.pas' {SpTarDigitsForm},
  AddTarDigit in '..\..\..\ASUP\Sources\AddTarDigit.pas' {AddTarDigitForm},
  AcceptToWorkUnit in '..\..\..\ASUP\Sources\AcceptToWorkUnit.pas' {AcceptToWorkForm},
  ShtatRas in '..\..\..\ASUP\Sources\ShtatRas.pas' {ShtatRasForm},
  AddShtatPost in '..\..\..\ASUP\Sources\AddShtatPost.pas' {AddShtatPostForm},
  ShtatSPZ in '..\..\..\ASUP\Sources\ShtatSPZ.pas' {ShtatSPZForm},
  AddShtatSPZ in '..\..\..\ASUP\Sources\AddShtatSPZ.pas' {AddShtatSPZForm},
  ManPunishingUnit in '..\..\..\ASUP\Sources\ManPunishingUnit.pas' {ManPunishingForm},
  SpPrivUnit in '..\..\..\ASUP\Sources\SpPrivUnit.pas' {SpPrivForm},
  AddPrivUnit in '..\..\..\ASUP\Sources\AddPrivUnit.pas' {AddPrivForm},
  EducReportUnit in '..\..\..\ASUP\Sources\EducReportUnit.pas' {EducReportForm},
  ShtatPrint in '..\..\..\ASUP\Sources\ShtatPrint.pas' {ShtatPrintForm},
  WarReportUnit in '..\..\..\ASUP\Sources\WarReportUnit.pas',
  WomenReportUnit in '..\..\..\ASUP\Sources\WomenReportUnit.pas' {WomenReportForm},
  AddAwardUnit in '..\..\..\ASUP\Sources\AddAwardUnit.pas' {AddAwardForm},
  ManAwardUnit in '..\..\..\ASUP\Sources\ManAwardUnit.pas' {ManAwardForm},
  OrdersEditUnit in '..\..\..\ASUP\Sources\OrdersEditUnit.pas' {OrdersEditForm},
  OrdersViewUnit in '..\..\..\ASUP\Sources\OrdersViewUnit.pas' {OrdersViewForm},
  SpAwardUnit in '..\..\..\ASUP\Sources\SpAwardUnit.pas' {SpAwardForm},
  SpHolidayUnit in '..\..\..\ASUP\Sources\SpHolidayUnit.pas',
  PostBonus in '..\..\..\ASUP\Sources\PostBonus.pas' {PostBonusForm},
  AddPostBonus in '..\..\..\ASUP\Sources\AddPostBonus.pas' {AddPostBonusForm},
  WorkBookUnit in '..\..\..\ASUP\Sources\WorkBookUnit.pas' {WorkBookForm},
  PrintOrderUnit in '..\..\..\ASUP\Sources\PrintOrderUnit.pas' {PrintOrderForm},
  DismissManUnit in '..\..\..\ASUP\Sources\DismissManUnit.pas' {DismissManForm},
  AddStaj in '..\..\..\ASUP\Sources\AddStaj.pas' {AddStajForm},
  PrivUnit in '..\..\..\ASUP\Sources\PrivUnit.pas' {ManPrivForm},
  ManPunishingRemoveUnit in '..\..\..\ASUP\Sources\ManPunishingRemoveUnit.pas' {ManPunishingRemoveForm},
  SpStajUnit in '..\..\..\ASUP\Sources\SpStajUnit.pas' {SpStajForm},
  ManBonus in '..\..\..\ASUP\Sources\ManBonus.pas' {ManBonusForm},
  LogInFormUnit in '..\..\..\ASUP\Sources\LogInFormUnit.pas' {LogInForm},
  MoveManUnit in '..\..\..\ASUP\Sources\MoveManUnit.pas' {MoveManForm},
  UniPrint in '..\..\..\ASUP\Sources\UniPrint.pas' {UniPrintForm},
  AddVihod in '..\..\..\ASUP\Sources\AddVihod.pas' {AddVihodForm},
  SpWorkMode in '..\..\..\ASUP\Sources\WorkMode\SpWorkMode.pas' {SpWorkModeForm},
  ManBonusRemoveUnit in '..\..\..\ASUP\Sources\ManBonusRemoveUnit.pas' {ManBonusRemoveForm},
  EditHosp in '..\..\..\ASUP\Sources\EditHosp.pas' {EditHospForm},
  ManHospital in '..\..\..\ASUP\Sources\ManHospital.pas' {ManHospitalForm},
  ManPrivRemoveUnit in '..\..\..\ASUP\Sources\ManPrivRemoveUnit.pas' {ManPrivRemoveForm},
  AddHoliday in '..\..\..\ASUP\Sources\AddHoliday.pas' {AddHolidayForm},
  AddManFamily in '..\..\..\ASUP\Sources\AddManFamily.pas' {AddManFamilyForm},
  SelectMovingUnit in '..\..\..\ASUP\Sources\SelectMovingUnit.pas' {SelectMovingForm},
  ImportPeople in '..\..\..\ASUP\Sources\ImportPeople.pas' {ImportPeopleForm},
  AutoAccept in '..\..\..\ASUP\Sources\AutoAccept.pas' {AutoAcceptForm},
  ToDoListUnit in '..\..\..\ASUP\Sources\ToDoListUnit.pas' {ToDoListForm},
  ExportLog in '..\..\..\ASUP\Sources\ExportLog.pas' {ExportLogForm},
  Consts in '..\..\..\ASUP\Sources\Consts.pas',
  ChangeManBonusUnit in '..\..\..\ASUP\Sources\ChangeManBonusUnit.pas' {ChangeManBonusForm},
  AddChangeManBonusUnit in '..\..\..\ASUP\Sources\AddChangeManBonusUnit.pas' {AddChangeManBonusForm},
  SpVidopl in '..\..\..\ASUP\Sources\SpVidopl.pas' {SpVidoplForm},
  AddVidOpl in '..\..\..\ASUP\Sources\AddVidOpl.pas' {AddVidOplForm},
  AddBonus in '..\..\..\ASUP\Sources\AddBonus.pas' {AddBonusForm},
  MArkUnit in '..\..\..\ASUP\Sources\MArkUnit.pas' {MarkForm},
  ToDoManCloseUnit in '..\..\..\ASUP\Sources\ToDoManCloseUnit.pas',
  UCalendar in '..\..\..\ASUP\Sources\WorkMode\UCalendar.pas' {CalendarForm},
  ExportUnit in '..\..\..\ASUP\Sources\ExportUnit.pas',
  CRC32 in '..\..\..\ASUP\Sources\CRC32.pas',
  ImportLog in '..\..\..\ASUP\Sources\ImportLog.pas' {ImportLogForm},
  PremiaOrderUnit in '..\..\..\ASUP\Sources\PremiaOrderUnit.pas' {PremiaOrderForm},
  PremiaFilterUnit in '..\..\..\ASUP\Sources\PremiaFilterUnit.pas' {PremiaFilterForm},
  BirthDayReportUnit in '..\..\..\ASUP\Sources\BirthDayReportUnit.pas' {BirthDayReportForm},
  ReportVedomostPrinatihUnit in '..\..\..\ASUP\Sources\ReportVedomostPrinatihUnit.pas' {ReportVedomostPrinatihForm},
  PCardExportUnit in '..\..\..\ASUP\Sources\PCardExportUnit.pas' {PCardExportForm},
  PensiaReportUnit in '..\..\..\ASUP\Sources\PensiaReportUnit.pas' {PensiaReportForm},
  UchetWremenyUnit in '..\..\..\ASUP\Sources\UchetWremenyUnit.pas' {UchetWremenyForm},
  FormPlanShtat in '..\..\..\ASUP\Sources\FormPlanShtat.pas' {FormPlanShtatRasForm},
  RealShtatReportUnit in '..\..\..\ASUP\Sources\realshtatreportunit.pas' {RealShtatReportForm},
  ExternProgsUnit in '..\..\..\ASUP\Sources\ExternProgsUnit.pas' {ExternProgsForm},
  ExternProgsAddUnit in '..\..\..\ASUP\Sources\ExternProgsAddUnit.pas' {ExternProgsAddForm},
  ChildredReportUnit in '..\..\..\ASUP\Sources\ChildredReportUnit.pas' {ChildrenReportForm},
  AddSpz in '..\..\..\ASUP\Sources\AddSpz.pas' {AddSpzForm},
  PassVidanUnit in '..\..\..\ASUP\Sources\PassVidanUnit.pas' {PassVidanForm},
  SpSpecUnit in '..\..\..\ASUP\Sources\SpSpecUnit.pas' {SpecForm},
  KvalFormUnit in '..\..\..\ASUP\Sources\KvalFormUnit.pas' {KvalForm},
  VoenkomFormUnit in '..\..\..\ASUP\Sources\VoenkomFormUnit.pas' {VoenkomForm},
  SpSR in '..\..\..\ASUP\Sources\SpSR.pas' {SpSRForm},
  AddSR in '..\..\..\ASUP\Sources\AddSR.pas' {AddSRForm},
  DikretHollidayOrderUnit in '..\..\..\ASUP\Sources\DikretHollidayOrderUnit.pas' {DikretHollidayOrderForm},
  ManHolidayUnit in '..\..\..\ASUP\Sources\manholidayunit.pas' {ManHolidayForm},
  AddManHolidayUnit in '..\..\..\ASUP\Sources\AddManHolidayUnit.pas' {AddManHolidayForm},
  AddExceptPeriodUnit in '..\..\..\ASUP\Sources\AddExceptPeriodUnit.pas' {AddExceptPeriodForm},
  SpWorkExc in '..\..\..\ASUP\Sources\WorkMode\SpWorkExc.pas' {SpWorkExcForm},
  SelectHospUnit in '..\..\..\ASUP\Sources\SelectHospUnit.pas' {SelectHospForm},
  ManComandUnit in '..\..\..\ASUP\Sources\ManComandUnit.pas' {ManComandForm},
  ManComandFactUnit in '..\..\..\ASUP\Sources\ManComandFactUnit.pas' {ManComandFactForm},
  GoodFunctionsUnit in '..\..\..\ASUP\Sources\GoodFunctionsUnit.pas',
  AddManComandPlanDet in '..\..\..\ASUP\Sources\AddManComandPlanDet.pas' {AddManComandPlanDetForm},
  ManComandFactEditUnit in '..\..\..\ASUP\Sources\ManComandFactEditUnit.pas' {ManComandFactEditForm},
  AddPaperSignerUnit in '..\..\..\ASUP\Sources\AddPaperSignerUnit.pas' {AddPaperSignerForm},
  AddAdditionalActionsUnit in '..\..\..\ASUP\Sources\AddAdditionalActionsUnit.pas' {AddAdditionalActionsForm},
  AddInplaceBonus in '..\..\..\ASUP\Sources\AddInplaceBonus.pas' {AddInplaceBonusForm},
  HolidayBackUnit in '..\..\..\ASUP\Sources\holidaybackunit.pas' {HolidayBackForm},
  IncreaseOrderUnit in '..\..\..\ASUP\Sources\increaseorderunit.pas' {IncreaseOrderForm},
  AddManBonusRemoveUnit in '..\..\..\ASUP\Sources\AddManBonusRemoveUnit.pas' {AddManBonusRemoveForm},
  AddAttrUnit in '..\..\..\ASUP\Sources\AddAttrUnit.pas' {AddAttrForm},
  PCardAttributesUnit in '..\..\..\ASUP\Sources\PCardAttributesUnit.pas',
  PCardAttrEditUnit in '..\..\..\ASUP\Sources\PCardAttrEditUnit.pas' {EditPCardAttrForm},
  uSearchFrame in '..\..\..\ASUP\Sources\SpLib\uSearchFrame.pas' {fmSearch: TFrame},
  WorkReg in '..\..\..\ASUP\Sources\WorkMode\WorkReg.pas' {WorkRegForm},
  AddExc in '..\..\..\ASUP\Sources\WorkMode\AddExc.pas' {AddExcForm},
  AddManWorkModeChangeUnit in '..\..\..\ASUP\Sources\WorkMode\AddManWorkModeChangeUnit.pas' {AddManWorkModeChangeForm},
  AddWorkMode in '..\..\..\ASUP\Sources\WorkMode\AddWorkMode.pas' {AddWorkModeForm},
  AddWorkModeChange in '..\..\..\ASUP\Sources\WorkMode\AddWorkModeChange.pas' {AddWorkModeChangeForm},
  AddWorkReg in '..\..\..\ASUP\Sources\WorkMode\AddWorkReg.pas' {AddWorkRegForm},
  AddWorkTimeNorm in '..\..\..\ASUP\Sources\WorkMode\AddWorkTimeNorm.pas' {AddWorkTimeForm},
  ManWorkModeChangeUnit in '..\..\..\ASUP\Sources\WorkMode\ManWorkModeChangeUnit.pas' {ManWorkModeChangeForm},
  WorkModeChanges in '..\..\..\ASUP\Sources\WorkMode\WorkModeChanges.pas' {WorkModeChangesForm},
  uTableFrame in '..\..\..\ASUP\Sources\TimeTable\uTableFrame.pas' {frmTable: TFrame},
  AddHoursOrderEdit in '..\..\..\ASUP\Sources\AddHoursOrderEdit.pas' {AddHoursOrderEditForm},
  uTableSelectFrame in '..\..\..\ASUP\Sources\TimeTable\uTableSelectFrame.pas' {frmTableSelect: TFrame},
  uTimeTable in '..\..\..\ASUP\Sources\TimeTable\uTimeTable.pas' {fmTimeTable},
  AddHoursOrder in '..\..\..\ASUP\Sources\AddHoursOrder.pas' {AddHoursOrderForm},
  AddManBonusUnit in '..\..\..\ASUP\Sources\addmanbonusunit.pas' {AddManBonusForm},
  DtManBonusItemsUnit in '..\..\..\ASUP\Sources\dtmanbonusitemsunit.pas' {DtManBonusItemsForm},
  uDepartmentGroup in '..\..\..\ASUP\Sources\TimeTable\uDepartmentGroup.pas' {fmDepartmentsGroup},
  uTablePrint in '..\..\..\ASUP\Sources\TimeTable\uTablePrint.pas' {fmTablePrint},
  uNevihod in '..\..\..\ASUP\Sources\TimeTable\uNevihod.pas' {fmNevihod},
  MedicReportUnit in '..\..\..\ASUP\Sources\medicreportunit.pas' {MedicReportForm},
  SpWorkTimeNorm in '..\..\..\ASUP\Sources\WorkMode\SpWorkTimeNorm.pas' {SpWorkTimeForm},
  uTableGroup in '..\..\..\ASUP\Sources\TimeTable\uTableGroup.pas',
  BonusReportUnit in '..\..\..\ASUP\Sources\bonusreportunit.pas' {ReportBonusForm},
  Date_Form in '..\..\..\ASUP\Sources\Date_Form.pas' {ReportVakantForm},
  AddHolidayBackUnit in '..\..\..\ASUP\Sources\AddHolidayBackUnit.pas' {AddHolidayBackForm},
  uCheckMain in '..\..\..\ASUP\Sources\Check\uCheckMain.pas' {fmCheck},
  ReestrMainUnit in '..\..\..\ASUP\Sources\ReestrMainUnit.pas' {ReestrMainForm},
  EditReestrUnit in '..\..\..\ASUP\Sources\EditReestrUnit.pas' {EditReestrForm},
  ReestrFillFormUnit in '..\..\..\ASUP\Sources\ReestrFillFormUnit.pas',
  ReportAcceptedPBank in '..\..\..\ASUP\Sources\ReportAcceptedPBank.pas' {ReportAcceptedPBankForm},
  AddSovmBonusUnit in '..\..\..\ASUP\Sources\AddSovmBonusUnit.pas' {AddSovmBonusForm},
  ProcessUnit in '..\..\..\ASUP\Sources\ProcessForm\ProcessUnit.pas' {ProcessForm},
  ReBufferUnit in '..\..\..\ASUP\Sources\Buffer\ReBufferUnit.pas' {ReBufferForm},
  Buffer in '..\..\..\ASUP\Sources\Buffer\Buffer.pas',
  BufferCleanUnit in '..\..\..\ASUP\Sources\Buffer\buffercleanunit.pas' {BuffersCleanForm},
  AllBuffersUnit in '..\..\..\ASUP\Sources\Buffer\AllBuffersUnit.pas' {AllBuffersForm},
  UChangeVGroup in '..\..\..\ASUP\Sources\Vilki\UChangeVGroup.pas' {Form_Change_Group},
  UAddVilka in '..\..\..\ASUP\Sources\Vilki\UAddVilka.pas' {Form_Add_Vilka},
  UChangeMinMax in '..\..\..\ASUP\Sources\Vilki\UChangeMinMax.pas' {Form_ChangeMinMax},
  U_SPoklminmax in '..\..\..\ASUP\Sources\Vilki\U_SPoklminmax.pas' {Form_SP_OKL_MIN_MAX},
  uTableChangesPrint in '..\..\..\ASUP\Sources\TimeTable\uTableChangesPrint.pas' {frmTableChangesPrint},
  uCommonDBParams in '..\..\..\ASUP\Sources\CommonDB\uCommonDBParams.pas',
  uCommonDB in '..\..\..\ASUP\Sources\CommonDB\uCommonDB.pas',
  uFIBCommonDBErrors in '..\..\..\ASUP\Sources\CommonDB\FIBCommonDB\uFIBCommonDBErrors.pas',
  uFIBCommonDB in '..\..\..\ASUP\Sources\CommonDB\FIBCommonDB\uFIBCommonDB.pas',
  uIBXCommonDBErrors in '..\..\..\ASUP\Sources\CommonDB\IBXCommonDB\uIBXCommonDBErrors.pas',
  uIBXCommonDB in '..\..\..\ASUP\Sources\CommonDB\IBXCommonDB\uIBXCommonDB.pas',
  uUserButton in '..\..\..\ASUP\Sources\uUserButton.pas' {frmChangeUserAction},
  uTableDump in '..\..\..\ASUP\Sources\TimeTable\uTableDump.pas' {fmTableDump},
  uTableParams in '..\..\..\ASUP\Sources\TimeTable\uTableParams.pas' {frmTableParams},
  uDepartmentsTree in '..\..\..\ASUP\Sources\SpDepartment\uDepartmentsTree.pas' {fmDepartmentsTree: TFrame},
  BoHolidayForm in '..\..\..\ASUP\Sources\BoHolidayForm.pas' {BoHoliday},
  AddBoHolidayUnit in '..\..\..\ASUP\Sources\AddBoHolidayUnit.pas' {AddBoHoliday},
  ManIoUnit in '..\..\..\ASUP\Sources\ManIoUnit.pas' {ManIoForm},
  AddManIoUnit in '..\..\..\ASUP\Sources\AddManIoUnit.pas' {AddManIoForm},
  ReportHolidayAndHospitalCrossingUnit in '..\..\..\ASUP\Sources\ReportHolidayAndHospitalCrossingUnit.pas' {ReportHolidayAndHospitalCrossingForm},
  uRunOnce in '..\..\..\ASUP\Sources\uRunOnce.pas',
  addholidaylongunit in '..\..\..\ASUP\Sources\addholidaylongunit.pas' {addholidaylongForm},
  uVihodsDetails in '..\..\..\ASUP\Sources\TimeTable\uVihodsDetails.pas',
  uTableSignersData in '..\..\..\ASUP\Sources\TimeTable\uTableSignersData.pas' {dmTableSigners: TDataModule},
  uTableSignerAdd in '..\..\..\ASUP\Sources\TimeTable\uTableSignerAdd.pas' {fmTableSignerAdd},
  uTableStrings in '..\..\..\ASUP\Sources\TimeTable\uTableStrings.pas',
  uGlobalActions in '..\..\..\ASUP\Sources\uGlobalActions.pas' {GlobalActions: TDataModule},
  uTableSignersList in '..\..\..\ASUP\Sources\TimeTable\uTableSignersList.pas' {fmTableSignersList},
  uTableSigners in '..\..\..\ASUP\Sources\TimeTable\uTableSigners.pas',
  uSysParams in '..\..\..\ASUP\Sources\uSysParams.pas',
  uTableRealSignerAdd in '..\..\..\ASUP\Sources\TimeTable\uTableRealSignerAdd.pas' {fmTableRealSignerAdd},
  Orders2ViewUnit in '..\..\..\ASUP\Sources\Orders2ViewUnit.pas' {Orders2ViewForm},
  uWorkExcCopy in '..\..\..\ASUP\Sources\WorkMode\uWorkExcCopy.pas' {fmCopyExc},
  Orders2EditUnit in '..\..\..\ASUP\Sources\Orders2EditUnit.pas' {Orders2EditForm},
  AddForm in '..\..\..\ASUP\Sources\AddKosht\AddForm.pas' {frmAddSmet},
  AddItemUnit in '..\..\..\ASUP\Sources\AddItemUnit.pas' {AddItemForm},
  TextShablonsUnit in '..\..\..\ASUP\Sources\textshablonsunit.pas' {TextShablonsForm},
  AddTextShablonUnit in '..\..\..\ASUP\Sources\addtextshablonunit.pas' {AddTextShablonForm},
  uHolidayCompensOrder in '..\..\..\ASUP\Sources\uHolidayCompensOrder.pas' {fmHolidayCompensOrder},
  uHolidayCompensAdd in '..\..\..\ASUP\Sources\uHolidayCompensAdd.pas' {fmHolidayCompensAdd},
  uAsupParams in '..\..\..\ASUP\Sources\uAsupParams.pas' {fmAsupParams},
  ReportAccepted2 in '..\..\..\ASUP\Sources\reportaccepted2.pas' {ReportAccepted2Form},
  OldShtatPrint in '..\..\..\ASUP\Sources\OldShtatPrint.pas' {OldShtatPrintForm},
  RealShtatReport3Unit in '..\..\..\ASUP\Sources\realshtatreport3unit.pas' {RealShtatReport3Form},
  uTableSignCheck in '..\..\..\ASUP\Sources\TimeTable\uTableSignCheck.pas',
  uTableData in '..\..\..\ASUP\Sources\TimeTable\uTableData.pas' {TableData: TDataModule},
  uOrdersNotInZP in '..\..\..\ASUP\Sources\TimeTable\uOrdersNotInZP.pas' {fmOrdersNotInZP},
  ProlongManOrder in '..\..\..\ASUP\Sources\ProlongManOrder.pas' {fmProlongManOrder},
  uWorkHalfTime in '..\..\..\ASUP\Sources\TimeTable\uWorkHalfTime.pas' {fmWorkHalfTime},
  uAddHalfTime in '..\..\..\ASUP\Sources\TimeTable\uAddHalfTime.pas' {fmAddHalfTime},
  uOrdersCanc in '..\..\..\ASUP\Sources\uOrdersCanc.pas' {fmOrdersCanc},
  uOrdersCancModify in '..\..\..\ASUP\Sources\uOrdersCancModify.pas' {fmOrdersCancModify},
  uBuffer2 in '..\..\..\ASUP\Sources\Buffer\uBuffer2.pas',
  uShouldClosePCard in '..\..\..\ASUP\Sources\uShouldClosePCard.pas' {fmShouldClosePCard},
  uAddCommonPremia in '..\..\..\ASUP\Sources\uAddCommonPremia.pas' {fmAddCommonPremia},
  uWhatsNew in '..\..\..\ASUP\Sources\uWhatsNew.pas' {fmWhatsNew},
  uUpLoad in '..\..\..\ASUP\Sources\uUpLoad.pas' {UpLoadForm};

{ToDoManCloseForm}

{$R *.RES}

var
    Handle: Pointer;
    NagScreen: TNagScreen;
    reg2: TRegistry;
    StartupAction: string;
    i: Integer;
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
        Buffer.Buffer_Id_System := 123;
        Application.Run;
        SpDone;
        FinalizeAdminSystem;
    end
    else
        LogInForm.Free;

    Application.Terminate;
end.

