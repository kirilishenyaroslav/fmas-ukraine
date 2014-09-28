
{ -$Id: AddSR.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Добавление штатного расписания"                 }
{             Добавление и изменение базовых данных о штатном расписании       }
{                                                  ответственный: Олег Волков  }

unit AddSR;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, ComCtrls, Mask,
    CheckEditUnit, FieldControl, SpCommon, EditControl, PersonalCommon;

type
    TAddSRForm = class(TAddForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DetailsQuery: TIBQuery;
        DetailsQueryID_SR: TIntegerField;
        DetailsQueryDATE_BEG: TDateField;
        DetailsQueryDATE_END: TDateField;
        DetailsQueryIS_PLAN: TIBStringField;
        DetailsQueryNAME: TIBStringField;
        DetailsQueryIS_PROD: TIBStringField;
        Label1: TLabel;
        NameEdit: TCheckEdit;
        Label2: TLabel;
        FromPicker: TDateTimePicker;
        ToPicker: TDateTimePicker;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        PlanBox: TCheckBox;
        Label6: TLabel;
        ProdBox: TCheckBox;
        FC_Name: TFieldControl;
        FC_DateBeg: TFieldControl;
        FC_DateEnd: TFieldControl;
        FC_Plan: TFieldControl;
        FC_Prod: TFieldControl;
        procedure OkButtonClick(Sender: TObject);
        procedure PlanBoxEnter(Sender: TObject);
    private
        FormControl: TEditControl;
    public
        Id_SR: Integer;
        Mode: TEditMode;

        procedure Prepare(Mode: TEditMode; id: Integer); override;
        function GetId: Integer; override;
    end;

var
    AddSRForm: TAddSRForm;

implementation

{$R *.dfm}


procedure TAddSRForm.Prepare(Mode: TEditMode; id: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати штатний розклад'
    else if Mode = emModify then Caption := 'Змінити штатний розклад'
    else Caption := 'Додаткова інформація по штатному розкладу';

    DetailsQuery.Transaction := ReadTransaction;

    Id_SR := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_SR'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Name, FC_DateBeg, FC_DateEnd, FC_Plan, FC_Prod]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    OkButton.OnClick := OkButtonClick;
end;

function TAddSRForm.GetId: Integer;
begin
    Result := Id_SR;
end;


procedure TAddSRForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
begin
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if FC_DateBeg.Value >= FC_DateEnd.Value then
        begin
            MessageDlg('Дата початку повинна бути менша за дату кінця!',
                mtError, [mbOk], 0);
            ModalResult := 0;

            Exit;
        end;
        if Mode = emNew then
            ok := FormControl.ExecProc('DT_SR_INSERT', [], True)
        else ok := FormControl.ExecProc('DT_SR_UPDATE', [Id_SR], False);

        if not ok then ModalResult := 0;
    end
    else ModalResult := 0;
end;

procedure TAddSRForm.PlanBoxEnter(Sender: TObject);
begin
    if Mode = emModify then
        OkButton.SetFocus;
end;

initialization
    RegisterClass(TAddSRForm);

end.
