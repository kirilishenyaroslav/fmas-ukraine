program Garage;

uses
 { Forms,
  IniFiles,
  SysUtils,
  WinSock,
  Dialogs,
  Windows,
  PackageLoad,
  Variants,
  ZTypes,
  iBase, }

  Forms,
  IniFiles,
  Controls,
  SysUtils,
  WinSock,
  Dialogs,
  Windows,
  iBase,
  Variants,
  gar_ExeDM in 'Exe\gar_ExeDM.pas' {ExeDM: TDataModule},
  gar_ExeMainForm in 'Exe\gar_ExeMainForm.pas' {ExeMainForm},
  gar_LoadPackageGarage;


{$R *.res}

function SetConnection(DB_Handle:TISC_DB_HANDLE):boolean;
begin
  Result:=not(DB_Handle=nil);
  if not Result then Application.Terminate;
  ExeDM.MainDB.Handle := DB_Handle;
end;

var DB_Handle:TISC_DB_HANDLE;
begin
 LoadKeyboardLayout('00000422',KLF_ACTIVATE or KLF_SUBSTITUTE_OK);
 DB_Handle:=LoadGarAccess(Application,  Name_GarAccess);
 if DB_Handle<>nil then
  begin
    Application.Initialize;
    Application.CreateForm(TExeDM, ExeDM);
    if SetConnection(DB_Handle) then
    begin
      Application.CreateForm(TExeMainForm, ExeMainForm);
      Application.Title := 'Гараж';
      Application.Run;
    end
  end
 else
  Application.Terminate;

end.
