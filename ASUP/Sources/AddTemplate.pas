{ -internal}
{-$Id: AddTemplate.pas,v 1.1.1.1 2005/07/07 10:35:06 oleg Exp $}
{                Форма редактирования для таблицы %t (%d)                    }
{ создана экспертом формы редактирования, входящим в состав библиотеки SpLib }
{                     SpLib (c) Qizz 2002-2003                               }

unit %u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
  IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon;

type
  T%f = class(TAddForm)
	published
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure OkButtonClick(Sender: TObject);
	public
		%e: TEditControl;
		Mode: TEditMode;
		%p: Integer;
		
		procedure Prepare(Mode: TEditMode; id: Integer);override;
		function GetId: Integer;override;
  end;

var
  %f: T%f;

implementation

{$R *.DFM}

procedure T%f.Prepare(Mode: TEditMode; id: Integer);
begin
	Self.Mode := Mode;

	if Mode=emNew then Caption := 'Додати ' + %d
	else if Mode = emModify then Caption := 'Змінити ' + %d
	else Caption := 'Додаткова інформація по ' + %d;

	DetailsQuery.Transaction:=PersonalCommon.ReadTransaction;

	%p := id;

	if Mode <> emNew then
	with DetailsQuery do
	begin
		Close;
		Params.ParamValues['%p'] := id;
		Open;
		if DetailsQuery.IsEmpty then
			MessageDlg('Не вдалося знайти запис. ' + 
				'Можливо, його вилучив інший користувач!',
				mtError,[mbOk],0);
	end;

	%e := TEditControl.Create;
	%e.Add([%l]);
	%e.Prepare(Mode);
	%e.SetReadOnly(Mode = emView);

	OkButton.OnClick := OkButtonClick;
	OnClose := FormClose;
end;

function T%f.GetId: Integer;
begin
	Result := %p;
end;

procedure T%f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	%e.Free;
	if FormStyle = fsMDIChild then Action := caFree;
	{RegSave}
end;

procedure T%f.OkButtonClick(Sender: TObject);
var
	ok: Boolean;
begin
	%e.Read;
	if %e.CheckFill then
	begin
		if Mode = emNew then
			ok := %e.ExecProc('%ip',[]{GetIdParam})
		else    ok := %e.ExecProc('%up',[
				DetailsQuery.Params.ParamValues['%p']]);
		if not ok then ModalResult := 0;
		{DoGetId}
	end
	else	ModalResult := 0;
end;

initialization
	RegisterClass(T%f);
end.
