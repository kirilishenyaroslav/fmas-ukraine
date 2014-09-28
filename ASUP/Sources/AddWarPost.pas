
{ -$Id: AddWarPost.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

                       {                       Модуль "Информация о воинском звании".                 }
{    Отображение, редактирование и добавлении информации о воинском звании.    }
{    Ответственный:Данил Збуривский                                            }

unit AddWarPost;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, SpComboBox, FieldControl, SpCommon,
    EditControl, Db, IBCustomDataSet, IBQuery, PersonalCommon;

type
    TAddWarpostForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        WarPostLabel: TLabel;
        WarPostEdit: TEdit;
        WarSostavLabel: TLabel;
        WarSostavBox: TSpComboBox;
        WarPostFieldControl: TFieldControl;
        WarSostavFieldControl: TFieldControl;
        WarPostInfoQuery: TIBQuery;
        WarPostInfoQueryNAME_WARPOST: TIBStringField;
        WarPostInfoQueryID_WARSOSTAV: TIntegerField;
        procedure OkButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        procedure Prepare(id: Integer; Mode: TEditMode);
    end;

var
    AddWarpostForm: TAddWarpostForm;

implementation

{$R *.DFM}

procedure TAddWarpostForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if Mode = emNew then
            FormControl.ExecProc('WARPOST_INSERT', [])
        else FormControl.ExecProc('WARPOST_UPDATE',
                [WarPostInfoQuery.Params.ParamValues['ID_WARPOST']]);
        ModalResult := mrOk;
    end;
end;

procedure TAddWarpostForm.Prepare(id: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then Caption := 'Додати військове звання'
    else Caption := 'Змінити війскове звання';

    if Mode = emModify then
        with WarPostInfoQuery do
        begin
            Close;
            Params.ParamValues['Id_WarPost'] := id;
            Open;
        end;
    FormControl.Prepare(Mode);
end;

procedure TAddWarpostForm.FormCreate(Sender: TObject);
begin
    WarPostInfoQuery.Transaction := PersonalCommon.ReadTransaction;
    FormControl := TEditControl.Create;
    FormControl.Add([WarPostFieldControl, WarSostavFieldControl]);
end;

procedure TAddWarpostForm.FormActivate(Sender: TObject);
begin
    WarPostEdit.SetFocus;
end;

procedure TAddWarpostForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    WarSostavBox.SaveIntoRegistry;
    Action := caFree;
end;

procedure TAddWarpostForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

end.
