unit DMUnit;

interface

uses
  Forms, SysUtils, Classes, IBDatabase, DB, IniFiles, Messages, consts;

type
  TDM = class(TDataModule)
    MainDatabase: TIBDatabase;
    ReadTransaction: TIBTransaction;
    WriteTransaction: TIBTransaction;
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

end.
