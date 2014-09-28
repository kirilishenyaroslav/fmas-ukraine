program PersonPay;

uses
  Forms,
  IniFiles,
  SysUtils,
  Dialogs,
  Windows,
  Controls,
  ibase,
  uMainFanc,
  uMainPerem,
  uLogin in 'Modules\PCMain\uLogin.pas' {uLoginForm},
  uMain in 'Modules\PCMain\uMain.pas' {uMainForm},
  uExit in 'Modules\PCMain\uExit.pas' {ExitForm},
  uPerenOst in 'Modules\PCMain\uPerenOst.pas' {PerOstForm},
  uSchOpen in 'Modules\PCMain\uSchOpen.pas' {SchForm},
  uMDIFormsBar in 'Modules\PCMain\uMDIFormsBar.pas',
  uNewSystem in 'Modules\PCMain\uNewSystem.pas' {NewSystemForm},
  uSpValyuta in 'Modules\PCMain\uSpValyuta.pas' {ValyutaForm},
  uEditKurs in 'Modules\PCMain\uEditKurs.pas' {EditKursForm},
  uHistoryValute in 'Modules\PCMain\uHistoryValute.pas' {HistoryForm},
  uEditVal in 'Modules\PCMain\uEditVal.pas' {EditValForm},
  uHistoryKurs in 'Modules\PCMain\uHistoryKurs.pas' {HistKursForm},
  uSpVal in 'Modules\PCMain\uSpVal.pas' {SpValForm},
  uHstSys in 'uHstSys.pas' {HSTForm},
  uFormUch in 'Modules\PCMain\uFormUch.pas' {RegUchForm},
  uQuest in 'Modules\PCMain\uQuest.pas' {QuestForm};

{$R *.res}

var
  T:TuLoginForm;
  Layout: array[0.. KL_NAMELENGTH] of char;

begin
 Application.Initialize;
 ShortDateFormat  := 'dd.mm.yyyy';
 LongDateFormat   := 'dd.mm.yyyy';
 DecimalSeparator := ',';
 LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
 T:=TuLoginForm.Create(Application);
 if T.ShowModal=mrCancel then
  Application.Terminate
 else
  begin
  MAIN_DB_HANDLE:=T.LResult.DBHandle;
  ID_REG := T.id;
  FORM_UCH:= T.fu;
  NAME_SYSTEM_:=T.name;
  USER_NAME:=T.User_name;
  USER_ID:=T.USER_ID;
  USER_ID_PCARD:=T.USER_ID_PCARD;
  USER_FIO:=T.USER_FIO;
  Application.Title := 'Розрахунки';
  Application.CreateForm(TuMainForm, uMainForm);
  Application.CreateForm(TQuestForm, QuestForm);
  //  InitializaAdminSystem(Self, MAIN_DB_HANDLE, 999 , AccMGMT.GetUserId,False);
  //Application.CreateForm(THSTForm, HSTForm);
  end;
 T.Free;
 Application.Run;

end.
