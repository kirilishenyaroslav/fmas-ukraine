unit DMUnit;

interface

uses
  Forms, SysUtils, Classes, IBDatabase, DB, IniFiles, Messages, Dialogs, consts;

type
  TDM = class(TDataModule)
    MainDatabase: TIBDatabase;
    ReadTransaction: TIBTransaction;
    WriteTransaction: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    DBPath : String;
    AllOkWhileStartup, DontKillLog : Boolean;
    ProgramPath : String;
    CurrentLogin, CurrentPassword : String; 
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

uses SysAdmin, IBase;

procedure TDM.DataModuleCreate(Sender: TObject);
var
    IniFile : TIniFile;
begin
    ProgramPath := ExtractFilePath(Application.ExeName);

    IniFile := TIniFile.Create(ProgramPath + 'update.ini');

    DBPath := IniFile.ReadString('Database', 'Path', '');
    DontKillLog := (IniFile.ReadString('Params','DontKillLog','F') = 'T');

    AllOkWhileStartup := True;

    if (DBPath = '') then begin
        MessageDlg('Не могу найти файл конфигурации Update.ini или в нем указан неверный путь к базе!', mtError, [mbOk], 0);
        AllOkWhileStartup := False;
    end;

    IniFile.Free;
end;

end.
