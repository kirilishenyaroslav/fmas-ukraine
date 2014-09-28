unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, U_ExpImpFrame, StdCtrls, Buttons, ExtCtrls,uImportDm,IniFiles;

type
  TImportForm = class(TForm)
    Panel1: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    ImportFrame: TExpImpFr;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  ImportForm: TImportForm;

implementation

{$R *.dfm}

procedure TImportForm.OkButtonClick(Sender: TObject);
begin
    ImportFrame.Import(ImportDm.MainDatabase.Handle);
end;

procedure TImportForm.CancelButtonClick(Sender: TObject);
begin
    ImportFrame.Stop;
end;

procedure TImportForm.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  DataBasePath: string;
  Password: string;
begin
    ImportDm:=TImportDm.Create(Self);

    IniFile := TIniFile.Create('.\config.ini');
    DataBasePath := IniFile.ReadString('CONNECTION', 'Db_pass', '');
    Password := IniFile.ReadString('CONNECTION', 'password', '');

    ImportDm.MainDataBase.DatabaseName := DataBasePath;
    ImportDm.MainDataBase.DBParams.Clear;
    ImportDm.MainDataBase.DBParams.Add('user_name=SYSDBA');
    ImportDm.MainDataBAse.DBParams.Add('password=' + Password);
    ImportDm.MainDataBase.DBParams.Add('lc_ctype=WIN1251');
    ImportDm.MainDataBase.Connected := True;

end;

end.
