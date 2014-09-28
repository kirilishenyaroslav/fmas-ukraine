{ -internal}
{-$Id: InsScript.pas,v 1.1.1.1 2005/07/07 10:35:18 oleg Exp $}

unit InsScript;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, IBDatabase, IBCustomDataSet, IBQuery;

type
  TStringArray = array of String;

  TInsForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PathEdit: TEdit;
    UserEdit: TEdit;
    PasswordEdit: TEdit;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    GenBox: TCheckBox;
    Label4: TLabel;
    GenProc: TEdit;
    Label5: TLabel;
    GenExcept: TEdit;
    TablesBox: TCheckBox;
    TableProc: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    TablesExcept: TEdit;
    Label8: TLabel;
    ScriptMemo: TMemo;
    CopyButton: TBitBtn;
    DB: TIBDatabase;
    CharsetEdit: TEdit;
    Label9: TLabel;
    GenQuery: TIBQuery;
    DefaultTransaction: TIBTransaction;
    GenQueryRDBGENERATOR_NAME: TIBStringField;
    Label10: TLabel;
    IdServerBox: TCheckBox;
    TablesQuery: TIBQuery;
    TablesQueryRDBRELATION_NAME: TIBStringField;
    RefQuery: TIBQuery;
    procedure CopyButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InsForm: TInsForm;

implementation

{$R *.DFM}

procedure ExtractList(s: String; var a: TStringArray);
var
	p: Integer;
	t: String;
begin
	s := Trim(s);
	while s <> '' do
	begin
		p := Pos(',',s);
		
		if ( p = 0 ) then
		begin
			t := s;
			s := '';
		end
		else
		begin
			t := Copy(s,1,p-1);
			s := Copy(s,p+1,Length(s)-p);
		end;

		SetLength(a,Length(a)+1);
		a[Length(a)-1] := t;
		s := Trim(s);
	end;
end;

function	StrBegin(s: String; a: TStringArray): Boolean;
var
	i: Integer;
begin
	for i := 0 to High(a) do
		if ( Pos(a[i],s) = 1 ) then
		begin
			Result := True;
			Exit;
		end;
	Result := False;
end;

function	StrFind(s: String; a: TStringArray): Integer;
var
	i: Integer;
begin
	for i:=0 to High(a) do
		if Trim(s) = Trim(a[i]) then
		begin
			Result := i;
			Exit;
		end;
	Result := -1;
end;

procedure TInsForm.CopyButtonClick(Sender: TObject);
begin
	ScriptMemo.SelectAll;
	ScriptMemo.CopyToClipboard;
end;

procedure TInsForm.OkButtonClick(Sender: TObject);
var
	GenExc, TblExc, a: TStringArray;
	s: String;
	i,j,min: Integer;
	f,c: Boolean;
begin
	ExtractList(GenExcept.Text, GenExc);
	ExtractList(TablesExcept.Text, TblExc);

	with DB do
	begin
		Connected := False;
		DatabaseName := PathEdit.Text;
		Params.Clear;
		Params.Add('user_name=' + UserEdit.Text);
		Params.Add('password=' + PasswordEdit.Text);
		Params.Add('lc_ctype=' + CharsetEdit.Text);
		Connected := True;
	end;
	with ScriptMemo.Lines do
	begin
		Add(#9#9 + '/* Дата : ' + DateToStr(Date) + ' ' +
			TimeToStr(Time) + ' */');
		Add(#9#9 + '/* Инсталляционный скрипт - создан экспертом */');
		Add(#9#9 + '/* (c) Qizz 2003 */');
	end;
	if GenBox.Checked then
	with GenQuery do
	with ScriptMemo.Lines do
	begin
		if IdServerBox.Checked then
		begin
			Add('');
			Add(#9#9+ '/* Получение Id_Server из системной таблицы */');
			Add(#9+ 'SELECT DISTINCT Id_Server FROM Sys_Options');
			Add(#9+ 'INTO :Id_Server;');
			Add('');
		end;

		Add('');
		Add(#9#9 + '/* Обработка генераторов */');
		Open;
		First;
		while not Eof do
		begin
			s := GenQuery['RDB$GENERATOR_NAME'];
			s := Trim(s);
			if not StrBegin(s,GenExc) then
			Add(#9 + StringReplace(GenProc.Text,
				'%g',s,[rfReplaceAll]));
			Next;
		end;
	end;

	if TablesBox.Checked then
	with TablesQuery do
	with ScriptMemo.Lines do
	begin
		Add('');
		Add(#9#9 + ' /* Обработка таблиц */');
		Open;
		First;
		while not Eof do
		begin
			s := TablesQuery['RDB$RELATION_NAME'];
			s := Trim(s);

			if not StrBegin(s,TblExc) then
			begin
				SetLength(a,Length(a)+1);
				a[Length(a)-1] := s;
			end;
			Next;
		end;

		RefQuery.Open;
			// пузырек
		c := True;
		while c do
		begin
			c := False;
			for i := 0 to High(a) do
			begin
				min := Length(a)+1;
				RefQuery.First;

				while True do
				begin
					f := RefQuery.LocateNext('Master',
						a[i],[loPartialKey]);
					if not f then break;
					j := StrFind(RefQuery['Detail'],a);
					if (j<min) and (j<>-1) then min := j;
					if not RefQuery.Eof then RefQuery.Next;
				end;

				if (i > min) and (min <> -1) then
				begin
					s := a[i];
					a[i] := a[min];
					a[min] := s;
					c := True;
				end;
			end;
		end;

		for i:=0 to High(a) do
			Add(#9 + StringReplace(TableProc.Text,
				'%t',a[i],[rfReplaceAll]));
	end;
end;

procedure TInsForm.CancelButtonClick(Sender: TObject);
begin
	Close;
end;

end.
