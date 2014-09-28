program ShtatMain;

uses
  accmgmt,
  Forms,
  Controls,
  SpCommon,
  SysAdmin,
  uFormControl,
  Shtat in 'Shtat.pas' {fmShtatMain},
  uShtatImport in 'uShtatImport.pas' {fmShtatImport},
  LogInFormUnit in 'LogInFormUnit.pas' {LogInForm},
  uOkladInc in 'uOkladInc.pas' {fmIncOklads},
  uWhatsNew in 'uWhatsNew.pas' {fmWhatsNewForm},
  uApp32 in 'uApp32.pas' {fmReportStavok32},
  uConvertBonus in 'uConvertBonus.pas' {ConvertBonusForm};

{$R *.res}

var
    Handle: Pointer;
begin
  Application.Initialize;
  Application.Title := 'Штатний розклад';

  Shtat.AllOk := True;
  LogInForm := TLogInForm.Create(Application);

  if LogInForm.ShowModal = mrOk then
  begin
    Handle := LogInForm.AccResult.DBHandle;
    Acc_Id_User := GetUserId;
    LogInForm.Free;
    Application.CreateForm(TfmShtatMain, fmShtatMain);
    Application.CreateForm(TfmReportStavok32, fmReportStavok32);
    Application.CreateForm(TConvertBonusForm, ConvertBonusForm);
    fmShtatMain.DB.Handle := Handle;
    fmShtatMain.DB.Connected := True;
    SpInit(Handle);
    fmShtatMain.Clean;
    InitializaAdminSystem(fmShtatMain, Handle, 888, GetUserId, False);
    Application.Run;
    SpDone;
    if Shtat.AllOk then FinalizeAdminSystem;
  end
  else LogInForm.Free;

  Application.Terminate;
end.
