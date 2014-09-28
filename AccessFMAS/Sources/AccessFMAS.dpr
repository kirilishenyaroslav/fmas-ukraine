program AccessFMAS;

uses
  Forms,
  Dialogs,
  Windows,
  Controls,
  MainForm in 'MainForm\MainForm.pas' {FormMain},
  MainDM in 'MainDataModule\MainDM.pas' {DMMain: TDataModule},
  AccessObject in 'AccessObject.pas',
  Action in 'Action.pas',
  ObjectActions in 'ObjectActions\ObjectActions.pas' {FormObjectActions},
  AddObject in 'ObjectActions\AddObject.pas' {FormAddObject},
  ActionsForm in 'Actions\ActionsForm.pas' {FormActions},
  AddAction in 'Actions\AddAction.pas' {FormAddAction},
  RolesForm in 'Roles\RolesForm.pas' {FormRoles},
  AddRole in 'Roles\AddRole.pas' {FormAddRole},
  Role in 'Role.pas',
  Lock in 'Lock.pas',
  UsersGroupForm in 'UsersGroups\UsersGroupForm.pas' {FormUsersGroup},
  AddUser in 'Users\AddUser.pas' {FormAddUser},
  Dbun in 'Dbun.pas',
  UsersForm in 'Users\UsersForm.pas' {FormUsers},
  AboutForm in 'AboutForm\AboutForm.pas' {FormAbout},
  DomainUser in 'AddDomainUsers\DomainUser.pas' {frmDomainUsers},
  WindowsUsers in 'WindowsUsers.pas',
  PCardsViewUnit in 'PCardsView\PCardsViewUnit.pas' {PCardsViewForm},
  LogInFormUnit in 'LoginForm\LogInFormUnit.pas' {LogInForm},
  ObjectFilter in 'ObjectActions\ObjectFilter.pas' {frmObjectFilter},
  OAHistory in 'FHistory\OAHistory.pas' {frmOAHistory},
  OARHistory in 'FHistory\OARHistory.pas' {frmOARHistory},
  OHistory in 'FHistory\OHistory.pas' {frmOHistory},
  User in 'user.pas';

{$R *.RES}
var Login:TLogInForm;

begin
  Login:=TLogInForm.Create(nil);
  if Login.ShowModal=mrOk
  then begin
            Application.Initialize;
            Application.Title := 'Управління доступом';
            Application.CreateForm(TFormMain, FormMain);
  FormMain.Login:=Login.LogInEdit.Text;
            FormMain.Password:=Login.PasswordEdit.Text;
            Application.CreateForm(TDMMain, DMMain);
            Login.Free;
            Application.Run;
  end
  else Login.Free;
end.
