
{ -$Id: AddWarSostav.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

                       {                       Модуль "Информация о воинском составе"                 }
{    Отображение, редактирование и добавлении информации о воинском составе.   }
{    Ответственный:Данил Збуривский                                            }

unit AddWarSostav;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, SpComboBox, EditControl, FieldControl,
    Db, IBCustomDataSet, IBQuery, PersonalCommon, SpCommon;

type
    TAddWarSostavMode = (awNew, awModify);
    TAddWarSostavForm = class(TForm)
        WarPostLabel: TLabel;
        WarSostavEdit: TEdit;
        WarSostavLabel: TLabel;
        WarGroupBox: TSpComboBox;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        WarSostavFieldControl: TFieldControl;
        WarGroupFieldControl: TFieldControl;
        WarSostavQuery: TIBQuery;
        WarSostavQueryNAME_WARSOSTAV: TIBStringField;
        WarSostavQueryID_WARPOSTGR: TIntegerField;
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        Mode: TEditMode;
        FormControl: TEditControl;
        procedure Prepare(id: Integer; Mode: TEditMode);
    end;

var
    AddWarSostavForm: TAddWarSostavForm;

implementation

{$R *.DFM}

procedure TAddWarSostavForm.Prepare(id: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then Caption := 'Додати військовий склад'
    else Caption := 'Змінити війсковій склад';
    if Mode = emModify then
        with WarSostavQuery do
        begin
            Close;
            Params.ParamValues['Id_WarSostav'] := id;
            Open;
        end;
    FormControl.Prepare(Mode);
end;

procedure TAddWarSostavForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if Mode = emNew then
            FormControl.ExecProc('WARSOSTAV_INSERT', [])
        else FormControl.ExecProc('WARSOSTAV_UPDATE',
                [WarSostavQuery.Params.ParamValues['ID_WARSOSTAV']]);
        ModalResult := mrOk;
    end;
end;

procedure TAddWarSostavForm.FormCreate(Sender: TObject);
begin
    WarSostavQuery.Transaction := PersonalCommon.ReadTransaction;
    FormControl := TEditControl.Create;
    FormControl.Add([WarSostavFieldControl, WarGroupFieldControl]);
end;

procedure TAddWarSostavForm.FormActivate(Sender: TObject);
begin
    WarSostavEdit.SetFocus;
end;

procedure TAddWarSostavForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    WarGroupBox.SaveIntoRegistry;
    Action := caFree;
end;

procedure TAddWarSostavForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

end.
