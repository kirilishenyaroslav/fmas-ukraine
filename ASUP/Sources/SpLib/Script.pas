{ -internal}
{-$Id: Script.pas,v 1.1.1.1 2005/07/07 10:35:18 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2003                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{             Автоматическая генерация скрипта по описанию таблицы           }
{ver 1.3.5}

unit Script;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TScriptForm = class(TForm)
    GenBox: TCheckBox;
    GenEdit: TEdit;
    InsertEdit: TEdit;
    UpdateBox: TCheckBox;
    UpdateEdit: TEdit;
    DeleteBox: TCheckBox;
    DeleteEdit: TEdit;
    SelectBox: TCheckBox;
    SelectEdit: TEdit;
    InsertBox: TCheckBox;
    ScriptMemo: TMemo;
    Label1: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    DescBox: TCheckBox;
    CopyButton: TBitBtn;
    GetIdBox: TCheckBox;
    Label10: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
  private
	Keys: array of String;
	KeyTypes: array of String;
	KeyCount: Integer;
	FieldCount: Integer;
	function InPrimary(Field: String): Boolean;
	function GenerateWhere: String;
	function GenIDParams: String;
  public
  end;

var
  ScriptForm: TScriptForm;

implementation

uses	EditExpertFormUnit;

{$R *.DFM}

function GetType(t: String): String;
begin
	case UpCase(t[1]) of
		'N':	Result := 'INTEGER';
		'F':	Result := 'NUMERIC(9,2)';
		'D':	Result := 'DATE';
		'L':	Result := 'CHAR(1)';
		'C':	Result := 'VARCHAR' + Copy(t,2,Length(t)-1);
	end;
end;

function CutTo31(s: String): String;
begin
	if Length(s) > 31 then Result := Copy(s,1,31)
	else Result := s;
end;

procedure TScriptForm.FormCreate(Sender: TObject);
var
	form: TEditExpertForm;
	field, Key: String;
	p,i,fc: Integer;
begin
	form := Owner as TEditExpertForm;
	if Pos(',',form.PrimaryEdit.Text) = 0 then
		GenEdit.Text := CutTo31(form.PrimaryEdit.Text + '_Generator')
	else	GenBox.Checked := False;
	InsertEdit.Text := CutTo31(form.TableEdit.Text + '_Insert');
	UpdateEdit.Text := CutTo31(form.TableEdit.Text + '_Update');
	DeleteEdit.Text := CutTo31(form.TableEdit.Text + '_Delete');
	SelectEdit.Text := CutTo31(form.TableEdit.Text + '_Select');

	for fc:=1 to form.FieldsGrid.RowCount do
		if Trim(form.FieldsGrid.Cells[0,fc]) = '' then
			break;
	FieldCount := fc - 1;

	Key := form.PrimaryEdit.Text;
	with form.FieldsGrid do
	begin
		KeyCount := 0;
		while Key <> '' do
		begin
			p := Pos(',',Key);
			if p <> 0 then
			begin
				field := Copy(Key,1,p-1);
				Key := Copy(Key,p+1,Length(Key)-p);
			end
			else	field := Key;
			inc(KeyCount);
			SetLength(Keys,KeyCount);
			SetLength(KeyTypes,KeyCount);
			Keys[KeyCount-1] := field;
			for i:=1 to FieldCount do
				if Trim(Cells[0,i]) = Trim(field) then
					KeyTypes[KeyCount-1] :=
						GetType(Cells[1,i]);
			if p = 0 then break;
		end;
	end;
end;

function TScriptForm.InPrimary(Field: String): Boolean;
var
	i: Integer;
begin
	for i:=0 to KeyCount-1 do
		if Trim(Keys[i]) = Trim(Field) then
		begin
			Result := True;
			Exit;
		end;
	Result := False;
end;

function TScriptForm.GenerateWhere: String;
var
	i: Integer;
begin
	Result :=  'WHERE';
	for i:=0 to KeyCount-1 do
	begin
		if i<>0 then Result := Result + ' AND';
		Result := Result + ' ' + Keys[i] + ' = :' + Keys[i];
	end;
end;

function TScriptForm.GenIDParams: String;
var
	i: Integer;
begin
	Result :=  '';
	for i:=0 to KeyCount-1 do
	begin
		if i<>0 then Result := Result + ' ,';
		Result := Result + Keys[i] + ' ' + KeyTypes[i];
	end;
end;

procedure TScriptForm.OkButtonClick(Sender: TObject);
var
	form: TEditExpertForm;
	i: Integer;
	t: String;
begin
	form := Owner as TEditExpertForm;
	with form do
	begin
		with ScriptMemo.Lines do
		begin
			Add('/* Скрипт создан: ' + DateToStr(Date) + ' */');
			Add('');
			Add('/* Создание таблицы ' + TableEdit.Text + '*/');
			Add('');
			Add('CREATE TABLE ' + TableEdit.Text + '(');

			for i:=1 to FieldCount do
			with FieldsGrid do
			begin
				t:= #9+ Cells[0,i]+' '+GetType(Cells[1,i]);
				if Trim(Cells[2,i]) = '' then
					t := t + ' ' + 'NOT NULL';
				t := t + ',';
				Add(t);
			end;

			for i:=1 to FieldCount do
			with FieldsGrid do
			if Trim(Cells[3,i]) <> '' then
			begin
				Add(#9 + 'CONSTRAINT ' + CutTo31('FK_' +
				TableEdit.Text + '_' + Cells[0,i]) +
				#13#10#9#9 + ' FOREIGN KEY(' + Cells[0,i] +
				') REFERENCES '+ Cells[3,i] + ',');
			end;

			Add(#9+ 'CONSTRAINT PK_' + TableEdit.Text);
			Add(#9#9 + 'PRIMARY KEY(' + PrimaryEdit.Text + ')');
			Add(');');

			if GenBox.Checked then
			begin
			Add('');
			Add('/* Создание генератора ' + GenEdit.Text + '*/');
			Add('');
			Add('CREATE GENERATOR ' + GenEdit.Text + ';');
			Add('SET GENERATOR ' + GenEdit.Text + ' TO 1;');
			end;

			if InsertBox.Checked then
			begin
			Add('');
			Add('/* Создание процедуры добавления */');Add('');
			Add('SET TERM ^ ;');Add('');
			Add('CREATE PROCEDURE ' + InsertEdit.Text+'(');
			for i:=1 to FieldCount do
			with FieldsGrid do
			if not InPrimary(Cells[0,i]) then
			begin
				t:= #9+ Cells[0,i]+' '+GetType(Cells[1,i]);
				if i <> FieldCount then t := t + ',';
				Add(t);
			end;
			if KeyCount > 1 then Add(GenIDParams);
			Add(')');

			if High(Keys) > 0 then
			begin
				MessageDlg('Можно забирать только один идентификатор!',
					mtError,[mbOk],0);
				GetIdBox.Checked := False;
			end;
			if GetIdBox.Checked then
				Add(#9 + 'RETURNS (ID INTEGER)');

			Add('AS');Add('BEGIN');
			if GetIdBox.Checked then
				Add(#9 + 'ID = GEN_ID(' +GenEdit.Text+',100);');

			Add(#9 + 'INSERT INTO ' + TableEdit.Text + '(');
			for i:=1 to FieldCount do
			with FieldsGrid do
			begin
				t:= #9#9+ Cells[0,i];
				if i<> FieldCount then t := t + ','
				else t := t + ')';
				Add(t);
			end;
			Add(#9 + 'VALUES(');
			for i:=1 to FieldCount do
			with FieldsGrid do
			begin
				t := #9#9;
				if not InPrimary(Cells[0,i]) or
					( KeyCount > 1 ) then
						t:= t + ':' + Cells[0,i]
				else
				if GetIdBox.Checked then t := t + ':ID'
				else t := t+'GEN_ID('+GenEdit.Text+',100)';
				if i<> FieldCount then t := t + ','
				else t := t + ');';
				Add(t);
			end;

			if GetIdBox.Checked then Add(#9 + 'SUSPEND;');

			Add('END^');Add('');Add('SET TERM ; ^');
			end;

			if UpdateBox.Checked then
			begin
			Add('');
			Add('/* Создание процедуры изменения */');Add('');
			Add('SET TERM ^ ;');Add('');
			Add('CREATE PROCEDURE ' + UpdateEdit.Text+'(');
			for i:=1 to FieldCount do
			with FieldsGrid do
			if not InPrimary(Cells[0,i]) then
			begin
				t:= #9+ Cells[0,i]+' '+GetType(Cells[1,i]);
				t := t + ',';
				Add(t);
			end;
			Add(#9 + GenIDParams +')');
			Add('AS');Add('BEGIN');
			Add(#9 + 'UPDATE ' + TableEdit.Text + ' SET');
			for i:=1 to FieldCount do
			with FieldsGrid do
			if not InPrimary(Cells[0,i]) then
			begin
				t:= #9#9+ Cells[0,i] + ' = :' + Cells[0,i];
				if i<> FieldCount then t := t + ',';
				Add(t);
			end;
			Add(#9 + GenerateWhere + ';');
			Add('END^');Add('');Add('SET TERM ; ^');
			end;

			if DeleteBox.Checked then
			begin
			Add('');
			Add('/* Создание процедуры удаления */');Add('');
			Add('SET TERM ^ ;');Add('');
			Add('CREATE PROCEDURE ' + DeleteEdit.Text);
			Add(#9 + '(' + GenIDParams + ')');
			Add('AS');Add('BEGIN');
			Add(#9 + 'DELETE FROM ' + TableEdit.Text);
			Add(#9 + GenerateWhere + ';');
			Add('END^');Add('');Add('SET TERM ; ^');
			end;

			if SelectBox.Checked then
			begin
			Add('');
			Add('/* Создание процедуры выборки */');Add('');
			Add('SET TERM ^ ;');Add('');
			Add('CREATE PROCEDURE ' + SelectEdit.Text);
			Add('RETURNS (');
			for i:=1 to FieldCount do
			with FieldsGrid do
			begin
				t:= #9+ Cells[0,i]+' '+GetType(Cells[1,i]);
				if i<> FieldCount then t := t + ','
				else t := t + ')';
				Add(t);
			end;
			Add('AS');Add('BEGIN');
			Add(#9 + 'FOR SELECT ');
			for i:=1 to FieldCount do
			with FieldsGrid do
			begin
				t:= #9#9+ Cells[0,i];
				if i<> FieldCount then t := t + ',';
				Add(t);
			end;
			Add(#9 + 'FROM ' + TableEdit.Text);
			Add(#9 + 'INTO');
			for i:=1 to FieldCount do
			with FieldsGrid do
			begin
				t:= #9#9+ ':' + Cells[0,i];
				if i<> FieldCount then t := t + ',';
				Add(t);
			end;
			Add(#9 + 'DO SUSPEND;');
			Add('END^');Add('');Add('SET TERM ; ^');
			end;

			if DescBox.Checked then
			begin
			Add('');
			Add('/* Добавление описаний */');Add('');
			Add('UPDATE RDB$RELATIONS');
			Add('SET RDB$DESCRIPTION = ''' + DescEdit.Text+ '''');
			Add('WHERE RDB$RELATION_NAME = ''' +
				AnsiUpperCase(TableEdit.Text) + ''';');
			Add('');
			for i:=1 to FieldCount do
			with FieldsGrid do
			begin
				Add('UPDATE RDB$RELATION_FIELDS');
				Add('SET RDB$DESCRIPTION = '+QuotedStr(Cells[4,i]));
				Add('WHERE RDB$RELATION_NAME ='''+
					AnsiUpperCase(TableEdit.Text) + '''');
				Add('AND RDB$FIELD_NAME = ''' +
					AnsiUpperCase(Cells[0,i]) + ''';');
				Add('');
			end;
			if InsertBox.Checked then
			begin
				Add('UPDATE RDB$PROCEDURES');
				Add('SET RDB$DESCRIPTION = '''+
				'Процедура добавления для таблицы ' +
				 TableEdit.Text +' (' + DescEdit.Text + ')''');
				Add('WHERE RDB$PROCEDURE_NAME = ''' +
				AnsiUpperCase(InsertEdit.Text) + ''';');
				Add('');
			end;
			if UpdateBox.Checked then
			begin
				Add('UPDATE RDB$PROCEDURES');
				Add('SET RDB$DESCRIPTION = '''+
				'Процедура изменения для таблицы ' +
				 TableEdit.Text +' (' + DescEdit.Text + ')''');
				Add('WHERE RDB$PROCEDURE_NAME = ''' +
				AnsiUpperCase(UpdateEdit.Text) + ''';');
				Add('');
			end;
			if DeleteBox.Checked then
			begin
				Add('UPDATE RDB$PROCEDURES');
				Add('SET RDB$DESCRIPTION = '''+
				'Процедура удаления для таблицы ' +
				 TableEdit.Text +' (' + DescEdit.Text + ')''');
				Add('WHERE RDB$PROCEDURE_NAME = ''' +
				AnsiUpperCase(DeleteEdit.Text) + ''';');
				Add('');
			end;
			if SelectBox.Checked then
			begin
				Add('UPDATE RDB$PROCEDURES');
				Add('SET RDB$DESCRIPTION = '''+
				'Процедура выборки для таблицы ' +
				 TableEdit.Text +' (' + DescEdit.Text + ')''');
				Add('WHERE RDB$PROCEDURE_NAME = ''' +
				AnsiUpperCase(SelectEdit.Text) + ''';');
				Add('');
			end;
			end
		end;
	end;
end;

procedure TScriptForm.CopyButtonClick(Sender: TObject);
begin
	ScriptMemo.SelectAll;
	ScriptMemo.CopyToClipboard;
end;

end.

