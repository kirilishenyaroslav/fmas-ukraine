unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,LoaderClBank, Menus, FIBDatabase, pFIBDatabase,IniFiles;

type
  TfrmMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    TransactionWrite: TpFIBTransaction;
    N5: TMenuItem;
    N21: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainForm: TfrmMainForm;

implementation

{$R *.dfm}

procedure TfrmMainForm.N4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainForm.N1Click(Sender: TObject);
begin
  LoaderClBank.LoadconfigClBank(self,Database.Handle);
end;

procedure TfrmMainForm.N2Click(Sender: TObject);
begin
LoaderClBank.LoadRunClBank(self,Database.Handle);
end;

procedure TfrmMainForm.N3Click(Sender: TObject);
begin
LoaderClBank.LoadViewClBank(self,Database.Handle);
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
var
  ini:TINIFile;
  Path_DB,SERVER:String;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'\config.ini') then
    begin
      ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'\config.ini');
      Path_DB:= Ini.ReadString('CONNECTION','Path','ERROR');
      SERVER:=Ini.ReadString('CONNECTION','SERVER','ERROR');
      try
        Database.DatabaseName:=SERVER+':'+Path_DB;
        //Database.DatabaseName:=Path_DB;
        Database.Connected:=true;
        except
          begin
            ShowMessage('Ошибка соединения с БД');
            Application.Terminate;
          end;
      end;
    end;
end;

procedure TfrmMainForm.N5Click(Sender: TObject);
begin
LoaderClBank.LoadPrintDocClBank(self,Database.Handle,0);
end;

procedure TfrmMainForm.N21Click(Sender: TObject);
begin
LoaderClBank.LoadPrintDocChP(self,Database.Handle,0);
end;

end.
