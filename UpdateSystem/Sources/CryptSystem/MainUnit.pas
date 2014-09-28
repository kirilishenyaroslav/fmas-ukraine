unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, IBSQL, ProcessUnit, Consts, IniFiles,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxLookAndFeelPainters, cxButtons, cxDropDownEdit, cxCalendar, ExtCtrls;

type
  TMainForm = class(TForm)
    OpenDialog: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SaveDialog: TSaveDialog;
    NumberEdit: TcxTextEdit;
    FileEdit: TcxButtonEdit;
    SystemBox: TcxComboBox;
    DateEdit: TcxDateEdit;
    GenerateButton: TcxButton;
    Shape1: TShape;
    procedure ButtonClick(Sender: TObject);
   	function StrToStr8(s: string) : String;
    procedure FormCreate(Sender: TObject);
    procedure FileEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GenerateButtonClick(Sender: TObject);
    procedure NumberEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    OutF, InF   : file;
    InFile      : string;
    Ind         : array [0..100] of Integer;
    ProcessF    : TProcessForm;

    procedure EnableControls(Enabled : boolean);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

function TMainForm.StrToStr8(s: string) : String;
begin
 result := s;

	while Length(result) < 8 do	insert('0', result, 0);
end;

procedure TMainForm.ButtonClick(Sender: TObject);
begin
	Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
 Ini        : TIniFile;
 i, n, p, l : Integer;
 s          : String;
begin
 DateEdit.Date := Date;

 Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CryptSystem.ini');

 i := 0;
 SystemBox.Properties.Items.Clear;
 s := Ini.ReadString('CryptSystemItems', IntToStr(i), 'nothing');

 while s <> 'nothing' do begin
  p := Pos(';', s);
  l := Length(s);
  n := StrToInt(Copy(s, p + 1, l - p));
  SystemBox.Properties.Items.Add(Copy(s, 1, p - 1));
  Ind[i] := n;
  i := i + 1;
  s := Ini.ReadString('CryptSystemItems', IntToStr(i), 'nothing');
 end;

 Ini.Free;
end;

procedure TMainForm.FileEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
	if OpenDialog.Execute then	FileEdit.Text := OpenDialog.FileName;
end;

procedure TMainForm.GenerateButtonClick(Sender: TObject);
var
 i : Integer;
 c : byte;
begin
	if FileEdit.Text = '' then begin
  ShowMessage('Необходимо выбрать файл со скриптом обновления!');
  FileEdit.SetFocus;
  Exit;
 end;

	if SystemBox.ItemIndex = -1 then begin
  ShowMessage('Необходимо ввыбрать систему, для которой предназначается обновление!');
  SystemBox.SetFocus;
 	Exit;
 end;

	if NumberEdit.Text = '' then begin
 	ShowMessage('Необходимо ввести номер обновления!');
  NumberEdit.SetFocus;
 	Exit;
 end;

 if not SaveDialog.Execute then Exit;

 if (FileSearch(SaveDialog.FileName, '') <> '') and (MessageDlg('Файл уже существует. Перезаписать?', mtConfirmation, [mbYes, mbNo],0) = mrNo) then	Exit;

	//InEdit.Lines.LoadFromFile(FileEdit.Text);

 //InEdit.Lines.Insert(0,'3030#' + StrToStr8(IdEdit.Text) + '#' + StrToStr8(NumberEdit.Text) + '#' + DateToStr(DateEdit.Date));

 EnableControls(False);

 AssignFile(InF, OpenDialog.FileName);
 Reset(InF, 1);
 AssignFile(OutF, SaveDialog.FileName);
 Rewrite(OutF, 1);

	InFile := '3030#' + StrToStr8(IntToStr(Ind[SystemBox.ItemIndex])) + '#'
 + StrToStr8(NumberEdit.Text) + '#' + DateToStr(DateEdit.Date) + #13#10 + InFile;; 

 ProcessF := TProcessForm.Create(Self);
 ProcessF.Progress.Properties.Max := FileSize(inF) + Length(InFile);

 ProcessF.Show;

 for i := 1 to Length(InFile) do begin
  c := Ord(InFile[i]) xor 147;
  ProcessF.Progress.Position := i;
  ProcessF.Step;
  BlockWrite(OutF, c, 1);
 end;

 while not Eof(inF) do begin
  BlockRead(inF, c, 1);
  c := Ord(c) xor 147;
  BlockWrite(OutF, c, 1);

  if i mod 100 = 0 then begin
   ProcessF.Progress.Position := i;
   ProcessF.Step;

   if ProcessF.Stop then begin
    CloseFile(OutF);
    CloseFile(InF);
    ProcessF.Hide;
    Screen.Cursor := crDefault;
    EnableControls(True);
    Exit;
   end;
  end;

  inc(i);
 end;

 CloseFile(OutF);
 CloseFile(InF);

 Screen.Cursor := crDefault;

 ShowMessage(IntToStr(i) + ' байт обработано!');

 ProcessF.Close;

 EnableControls(True);
end;

procedure TMainForm.NumberEditKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in [#13, '0'..'9', #27, #8]) then begin
  Key := #0;
  Exit;
 end;

 if Key = #13 then begin
  Key := #0;
  DateEdit.SetFocus;
 end;
end;

procedure TMainForm.DateEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  GenerateButton.SetFocus;
 end;
end;

procedure TMainForm.EnableControls(Enabled: boolean);
begin
 FileEdit.Enabled       := Enabled;
 SystemBox.Enabled      := Enabled;
 NumberEdit.Enabled     := Enabled;
 DateEdit.Enabled       := Enabled;
 GenerateButton.Enabled := Enabled;
end;

end.
