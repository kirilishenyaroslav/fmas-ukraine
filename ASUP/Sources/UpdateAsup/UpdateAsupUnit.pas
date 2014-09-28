unit UpdateAsupUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, StdCtrls, Buttons, IniFiles, Spin,
  IBCustomDataSet, IBQuery, ExtCtrls;

type
  TUpdateForm = class(TForm)
    ChermetDatabase: TIBDatabase;
    DefaultTransaction: TIBTransaction;
    WriteTransaction: TIBTransaction;
    ReadTransaction: TIBTransaction;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    ExitMinutes: TSpinEdit;
    Label2: TLabel;
    OldFile: TEdit;
    OpenButton: TButton;
    Label3: TLabel;
    NewFile: TEdit;
    Button1: TButton;
    OpenDialog: TOpenDialog;
    WorkQuery: TIBQuery;
    Timer1: TTimer;
    ExitLabel: TLabel;
    DBPathLabel: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    Version: Integer;
    Exit_Time: Variant;
  public
    { Public declarations }
  end;

var
  UpdateForm: TUpdateForm;

implementation

{$R *.dfm}

procedure TUpdateForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TUpdateForm.OpenButtonClick(Sender: TObject);
begin
    if OpenDialog.Execute then OldFile.Text := OpenDialog.FileName;
end;

procedure TUpdateForm.Button1Click(Sender: TObject);
begin
    if OpenDialog.Execute then NewFile.Text := OpenDialog.FileName;
end;

procedure TUpdateForm.OkButtonClick(Sender: TObject);
begin
    if VarIsNull(Exit_Time) or VarIsEmpty(Exit_Time) then
    begin
        OkButton.Caption := 'Відмінити';
        WorkQuery.Params.ParamValues['Exit_Time'] := Now + ExitMinutes.Value/1440;
    end
    else
    begin
        OkButton.Caption := 'Почати відлік';
        WorkQuery.Params.ParamValues['Exit_Time'] := Null;
    end;
    WriteTransaction.StartTransaction;
    WorkQuery.ExecSQL;
    WriteTransaction.Commit;
    Exit_Time := WorkQuery.Params.ParamValues['Exit_Time'] + 1/1440;
end;

procedure TUpdateForm.Timer1Timer(Sender: TObject);
var
    ok: Boolean;
begin
    if not VarIsNull(Exit_Time) and not VarIsEmpty(Exit_Time) then
    begin
        ExitLabel.Caption := 'Залишилось часу: ' + TimeToStr(Exit_Time - Now);
        if Exit_Time <= Now then
        begin
            ok := False;
            while not ok do
            begin
                ok := DeleteFile(OldFile.Text);
                if not ok then
                    if MessageDlg('Не вдалося вилучити старий файл, можливо, програма ще виконується. Повторити?',
                        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                            OkButton.Click;
            end;
            CopyFile(PChar(NewFile.Text), PChar(OldFile.Text), TRUE);
            WriteTransaction.StartTransaction;
            WorkQuery.Params.ParamValues['Exit_Time'] := Null;
            WorkQuery.ExecSQL;
            WriteTransaction.Commit;
            Exit_Time := Null;
            ShowMessage('Оновлення завершено!');
            OkButton.Caption := 'Почати відлік';
        end;
    end
    else ExitLabel.Caption := '';
end;

procedure TUpdateForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if VarIsNull(Exit_Time) or VarIsEmpty(Exit_Time) then Exit;

    WriteTransaction.StartTransaction;
    WorkQuery.Params.ParamValues['Exit_Time'] := Null;
    WorkQuery.ExecSQL;
    WriteTransaction.Commit;
end;

procedure TUpdateForm.FormCreate(Sender: TObject);
var
	reg: TIniFile;
begin
		// загрузить параметры базы из ini-файла
	with ChermetDatabase do
	begin
		reg := TIniFile.Create('.\chermet.ini');
		DatabaseName := reg.ReadString('Database','Path','chermet.gdb');
		Params.Clear;
		Params.Add('user_name=' +
    	reg.ReadString('Database','USER','SYSDBA'));
		Params.Add('password=' + reg.ReadString('Database','PASSWORD','masterkey'));
		Params.Add('lc_ctype=' + reg.ReadString('Database','CHARSET','WIN1251'));
        Version := reg.ReadInteger('Params', 'Version', 1);
        reg.Free;
	end;

    DBPathLabel.Caption := 'База даних: ' + ChermetDatabase.DatabaseName;

    if Version = 2 then
        OldFile.Text := ExtractFileDir(Application.ExeName) + '\asup.exe'
    else OldFile.Text := ExtractFileDir(Application.ExeName) + '\chermet.exe';

    ChermetDatabase.Connected := True;
end;

end.
