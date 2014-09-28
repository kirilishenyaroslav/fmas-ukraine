
{ -$Id: AddBonus.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Добавление вида надбавки"                       }
{              Управляет добавлением/изменением типа надбавки                  }
{                                                  ответственный: Олег Волков  }

unit AddBonus;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon;

type
    TAddBonusForm = class(TAddForm)
    published
        Name_BonusLabel: TLabel;
        Id_VidOplLabel: TLabel;
        DetailsQuery: TIBQuery;
        Name_BonusEdit: TCheckEdit;
        DetailsQueryName_Bonus: TIBStringField;
        FC_Name_Bonus: TFieldControl;
        Id_VidOplBox: TSpComboBox;
        DetailsQueryId_VidOpl: TIntegerField;
        FC_Id_VidOpl: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Bonus: Integer;

        procedure Prepare(Mode: TEditMode; id: Integer); override;
        function GetId: Integer; override;
    end;

var
    AddBonusForm: TAddBonusForm;

implementation

{$R *.DFM}

procedure TAddBonusForm.Prepare(Mode: TEditMode; id: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати вид надбавки'
    else if Mode = emModify then Caption := 'Змінити вид надбавки'
    else Caption := 'Додаткова інформація по виду надбавки';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Bonus := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Bonus'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Name_Bonus, FC_Id_VidOpl]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

function TAddBonusForm.GetId: Integer;
begin
    Result := Id_Bonus;
end;

procedure TAddBonusForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;
    Id_VidOplBox.SaveIntoRegistry;

end;

procedure TAddBonusForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
begin
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if Mode = emNew then
            ok := FormControl.ExecProc('Sp_Bonus_Insert', [], True)
        else ok := FormControl.ExecProc('Sp_Bonus_Update', [
                DetailsQuery.Params.ParamValues['Id_Bonus']]);
        if not ok then ModalResult := 0;
        if Mode = emNew then Id_Bonus := LastId;
    end
    else ModalResult := 0;
end;

initialization
    RegisterClass(TAddBonusForm);
end.
