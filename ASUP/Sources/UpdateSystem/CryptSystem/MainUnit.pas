unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, CheckEditUnit, IBSQL, ProcessUnit, Consts, IniFiles;

type
  TMainForm = class(TForm)
    OpenDialog: TOpenDialog;
    Label1: TLabel;
    FileEdit: TEdit;
    OpenFileButton: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit: TDateTimePicker;
    Button1: TButton;
    NumberEdit: TCheckEdit;
    SaveDialog: TSaveDialog;
    SystemBox: TComboBox;
    procedure ButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure OpenFileButtonClick(Sender: TObject);
	function StrToStr8(s: string) : String;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Ind : array [0..100] of Integer;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

function TMainForm.StrToStr8(s: string) : String;
begin
    result := s;

	while Length(result) < 8 do
    	Insert('0', result, 0);
end;

procedure TMainForm.ButtonClick(Sender: TObject);
begin
	Close;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
	i : Integer;
    OutF, InF : File;
    c : Byte;
    InFile : String;
    ProcessForm: TProcessForm;
begin
	if FileEdit.Text = '' then begin
    	MessageDlg('Необходимо выбрать файл со скриптом обновления!', mtError, [mbOk], 0);
        FileEdit.SetFocus;
    	exit;
    end;

	if SystemBox.ItemIndex = -1 then begin
    	MessageDlg('Необходимо ввыбрать систему, для которой предназначается обновление!', mtError, [mbOk], 0);
        SystemBox.SetFocus;
    	exit;
    end;

	if NumberEdit.Text = '' then begin
    	MessageDlg('Необходимо ввести номер обновления!', mtError, [mbOk], 0);
        NumberEdit.SetFocus;
    	exit;
    end;

    if not SaveDialog.Execute then exit;

    if (FileSearch(SaveDialog.FileName, '') <> '') and (MessageDlg('Файл уже существует. Перезаписать?', mtConfirmation, [mbYes, mbNo],0) = mrNo)
    then
    	exit;

	//InEdit.Lines.LoadFromFile(FileEdit.Text);

    //InEdit.Lines.Insert(0,'3030#' + StrToStr8(IdEdit.Text) + '#' + StrToStr8(NumberEdit.Text) + '#' + DateToStr(DateEdit.Date));

    AssignFile(InF, OpenDialog.FileName);
    Reset(InF, 1);
    AssignFile(OutF, SaveDialog.FileName);
    Rewrite(OutF, 1);

	InFile := '3030#' + StrToStr8(IntToStr(Ind[SystemBox.ItemIndex])) + '#' +
    StrToStr8(NumberEdit.Text) + '#' + DateToStr(DateEdit.Date) + #13#10 + InFile;;

    ProcessForm := TProcessForm.Create(Self);
    ProcessForm.Progress.Max := FileSize(inF) + Length(InFile);

    ProcessForm.Show;

    for i := 1 to Length(InFile) do begin
    	c := Ord(InFile[i]) xor 147;
        ProcessForm.Progress.Position := i;
        ProcessForm.Step;
    	BlockWrite(OutF, c, 1);
    end;

    while not Eof(inF) do begin
    	BlockRead(inF, c, 1);
    	c := Ord(c) xor 147;
    	BlockWrite(OutF, c, 1);

        if i mod 100 = 0 then begin

	        ProcessForm.Progress.Position := i;
    	    ProcessForm.Step;

        	if ProcessForm.Stop then begin
    			CloseFile(OutF);
    			CloseFile(InF);
    			ProcessForm.Hide;
		    	Screen.Cursor := crDefault;
            	exit;
	        end;
    	end;

        i := i + 1;
    end;

    CloseFile(OutF);
    CloseFile(InF);

    ProcessForm.Close;
    Screen.Cursor := crDefault;

    ShowMessage(IntToStr(i) + ' байт обработано!');
end;

procedure TMainForm.OpenFileButtonClick(Sender: TObject);
begin
	if OpenDialog.Execute then
    	FileEdit.Text := OpenDialog.FileName;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
    Ini : TIniFile;
    i, n, p, l : Integer;
    s : String;
begin
    DateEdit.Date := Date;

    Ini := TIniFile.Create(  ExtractFilePath(Application.ExeName) + 'CryptSystem.ini');

    i := 0;
    SystemBox.Items.Clear;
    s := Ini.ReadString('CryptSystemItems', IntToStr(i), 'nothing');

    while s <> 'nothing' do begin
        p := Pos(';', s);
        l := Length(s);
        n := StrToInt(Copy(s, p + 1, l - p));
        SystemBox.Items.Add(Copy(s, 1, p - 1));
        Ind[i] := n;
        i := i + 1;
        s := Ini.ReadString('CryptSystemItems', IntToStr(i), 'nothing');
    end;

    Ini.Free;
end;

end.
