
{ -$Id: AddStaj.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                         Модуль "Добавление типа стажа"                       }
{                    Добавление/изменение типа стажа                           }
{                                             ответственный: Данил Збуривский  }

unit AddStaj;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, SpCommon,
    IBCustomDataSet, IBQuery, FieldControl, EditControl, PersonalCommon;

type
    TAddStajForm = class(TForm)
        Label1: TLabel;
        Label2: TLabel;
    published
        DetailsQuery: TIBQuery;
        name_stajEdit: TCheckEdit;
        DetailsQueryname_staj: TIBStringField;
        FC_name_staj: TFieldControl;
        is_defaultBox: TCheckBox;
        DetailsQueryis_default: TIBStringField;
        FC_is_default: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        constructor Create(AOwner: TComponent; Mode: TEditMode;
            id: Integer); reintroduce;
    end;

var
    AddStajForm: TAddStajForm;

implementation

{$R *.DFM}

constructor TAddStajForm.Create(AOwner: TComponent; Mode: TEditMode; id: Integer);
begin
    inherited Create(AOwner);

    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати  стаж'
    else if Mode = emModify then Caption := 'Змінити стаж'
    else Caption := 'Додаткова інформація по стажу';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['id_staj'] := id;
            Open;
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_name_staj, FC_is_default]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(mode = emView);
    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

procedure TAddStajForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;

end;

procedure TAddStajForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if Mode = emNew then
            FormControl.ExecProc('Ini_Staj_Insert', [])
        else FormControl.ExecProc('Ini_Staj_Update', [
                DetailsQuery.Params.ParamValues['id_staj']])
    end
    else ModalResult := 0;
end;

end.
