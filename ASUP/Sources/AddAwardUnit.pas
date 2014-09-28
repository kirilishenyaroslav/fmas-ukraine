{-$Id: AddAwardUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Добавление поощрения в справочник поощрений"   }
{    Добавляет поощрение в справочник поощрений                                }
{    Ответственный: Кропов Валентин                                            }

unit AddAwardUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    FieldControl, StdCtrls, SpComboBox, Buttons, Db, IBCustomDataSet, IBQuery,
    EditControl, PersonalCommon, SpCommon;

type
    TAddAwardForm = class(TForm)
        WarPostLabel: TLabel;
        WarSostavLabel: TLabel;
        PrivInfoQuery: TIBQuery;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        PrivTypeBox: TSpComboBox;
        PrivEdit: TEdit;
        PrivFieldControl: TFieldControl;
        PrivTypeFieldControl: TFieldControl;
        PrivInfoQueryNAME_AWARD: TIBStringField;
        PrivInfoQueryID_AWARD_TYPE: TIntegerField;
        procedure FormCreate(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        procedure Prepare(id: Integer; Mode: TEditMode);

    end;

var
    AddAwardForm: TAddAwardForm;

implementation

{$R *.DFM}


procedure TAddAwardForm.Prepare(id: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then Caption := 'Додати заохочення'
    else Caption := 'Змінити заохочення';

    if Mode = emModify then
        with PrivInfoQuery do
        begin
            Close;
            Params.ParamValues['Id_Award'] := id;
            Open;
        end;
    FormControl.Prepare(Mode);
end;

procedure TAddAwardForm.FormCreate(Sender: TObject);
begin
    PrivInfoQuery.Transaction := PersonalCommon.ReadTransaction;
    FormControl := TEditControl.Create;
    FormControl.Add([PrivFieldControl, PrivTypeFieldControl]);
end;

procedure TAddAwardForm.FormActivate(Sender: TObject);
begin
    PrivEdit.SetFocus;
end;

procedure TAddAwardForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    PrivTypeBox.SaveIntoRegistry;
    Action := caFree;
end;

procedure TAddAwardForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TAddAwardForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then
        if Mode = emNew then
            FormControl.ExecProc('SP_AWARD_INSERT', [])
        else FormControl.ExecProc('SP_AWARD_UPDATE',
                [PrivInfoQuery.Params.ParamValues['ID_Award']])
    else ModalResult := 0;
end;

end.
