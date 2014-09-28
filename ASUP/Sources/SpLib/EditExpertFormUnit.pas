{ -internal}
{-$Id: EditExpertFormUnit.pas,v 1.1.1.1 2005/07/07 10:35:18 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2003                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{       Форма ввода описания таблицы для эксперта формы редактирования       }
{ver 1.4 }

unit EditExpertFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, Script, EditParams, Registry;

type
  TEditExpertForm = class(TForm)
    Label1: TLabel;
    TableEdit: TEdit;
    Label2: TLabel;
    FieldsGrid: TStringGrid;
    Label3: TLabel;
    PrimaryEdit: TEdit;
    ScriptButton: TBitBtn;
    CancelButton: TBitBtn;
    Label4: TLabel;
    DescEdit: TEdit;
    FormButton: TBitBtn;
    Label10: TLabel;
    Label12: TLabel;
    LastRecord: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ScriptButtonClick(Sender: TObject);
    procedure FieldsGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormButtonClick(Sender: TObject);
    procedure LastRecordClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure SaveIntoRegistry;
    procedure LoadFromRegistry;
  public
    { Public declarations }
  end;

var
  EditExpertForm: TEditExpertForm;

implementation

{$R *.DFM}


procedure TEditExpertForm.FormCreate(Sender: TObject);
begin
	with FieldsGrid do
	begin
		Cells[0,0] := 'Имя поля';
		Cells[1,0] := 'Тип';
		Cells[2,0] := 'Необяз';
		Cells[3,0] := 'Внешний ключ';
		Cells[4,0] := 'Описание';
	end;
end;

procedure TEditExpertForm.ScriptButtonClick(Sender: TObject);
var
	form: TScriptForm;
begin
	form := TScriptForm.Create(Self);
	form.ShowModal;
	form.Free;
end;

procedure TEditExpertForm.FieldsGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	with FieldsGrid do
	if (Key = VK_TAB) and (Col = ColCount-1) and (Row = RowCount-1) then
		RowCount := RowCount + 1;
end;

procedure TEditExpertForm.FormButtonClick(Sender: TObject);
var
	form: TEditFormParams;
begin
	form := TEditFormParams.Create(Self);
	form.ShowModal;
	form.Free;
end;

procedure TEditExpertForm.SaveIntoRegistry;
var
	reg: TRegistry;
	key: String;
	i, j, FieldCount: Integer;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		key := '\Software\Qizz Software\EditExpert\';

		if reg.OpenKey(key,True) then
		begin
			reg.WriteString('Table',TableEdit.Text);
			reg.WriteString('TableDesc',DescEdit.Text);
			reg.WriteString('Primary',PrimaryEdit.Text);

			for FieldCount:=1 to FieldsGrid.RowCount do
			if Trim(FieldsGrid.Cells[0,FieldCount]) = '' then
				break;
			FieldCount := FieldCount - 1;
			reg.WriteInteger('RowCount',FieldCount);
			reg.WriteInteger('ColCount',FieldsGrid.ColCount);

			with FieldsGrid do
			for i:=1 to FieldCount do
				for j:=0 to ColCount-1 do
					reg.WriteString('c['+IntToStr(j)+','+
						IntToStr(i)+']',Cells[j,i]);
		end;
	finally
		reg.Free;
	end;

end;

procedure TEditExpertForm.LoadFromRegistry;
var
	reg: TRegistry;
	key: String;
	i, j, nrows, ncols: Integer;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		key := '\Software\Qizz Software\EditExpert';

		if reg.OpenKey(key,True) then
		begin
			TableEdit.Text := reg.ReadString('Table');
			DescEdit.Text := reg.ReadString('TableDesc');
			PrimaryEdit.Text := reg.ReadString('Primary');

			nrows := reg.ReadInteger('RowCount');
			ncols := reg.ReadInteger('ColCount');

			if nrows > FieldsGrid.RowCount then
				FieldsGrid.RowCount := nrows;

			with FieldsGrid do
			for i:=1 to nrows do
				for j:=0 to ncols-1 do
					Cells[j,i] :=	reg.ReadString(
					'c['+IntToStr(j)+','+ IntToStr(i)+']');
		end;
	finally
		reg.Free;
	end;

end;

procedure TEditExpertForm.LastRecordClick(Sender: TObject);
begin
	LoadFromRegistry;
end;

procedure TEditExpertForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	SaveIntoRegistry;
end;

end.
