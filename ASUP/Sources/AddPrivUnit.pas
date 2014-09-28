{-$Id: AddPrivUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Добавление льготы в справочник льгот"           }
{    Добвляет льготу в справочник льгот                                        }
{    Ответственный: Кропов Валентин                                            }

unit AddPrivUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    FieldControl, StdCtrls, SpComboBox, Buttons, Db, IBCustomDataSet, IBQuery,
    EditControl, PersonalCommon, SpCommon;

type
    TAddPrivForm = class(TForm)
        WarPostLabel: TLabel;
        WarSostavLabel: TLabel;
        PrivInfoQuery: TIBQuery;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        PrivTypeBox: TSpComboBox;
        PrivEdit: TEdit;
        PrivFieldControl: TFieldControl;
        PrivTypeFieldControl: TFieldControl;
        PrivInfoQueryNAME_PRIV: TIBStringField;
        PrivInfoQueryID_PRIV_TYPE: TIntegerField;
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
    AddPrivForm: TAddPrivForm;

implementation

{$R *.DFM}


procedure TAddPrivForm.Prepare(id: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then Caption := 'Додати пільгу'
    else Caption := 'Змінити пільгу';

    if Mode = emModify then
        with PrivInfoQuery do
        begin
            Close;
            Params.ParamValues['Id_Privelege'] := id;
            Open;
        end;
    FormControl.Prepare(Mode);
end;




procedure TAddPrivForm.FormCreate(Sender: TObject);
begin
    PrivInfoQuery.Transaction := PersonalCommon.ReadTransaction;
    FormControl := TEditControl.Create;
    FormControl.Add([PrivFieldControl, PrivTypeFieldControl]);
end;

procedure TAddPrivForm.FormActivate(Sender: TObject);
begin
    PrivEdit.SetFocus;
end;

procedure TAddPrivForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    PrivTypeBox.SaveIntoRegistry;
    Action := caFree;
end;

procedure TAddPrivForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TAddPrivForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then
        if Mode = emNew then
            FormControl.ExecProc('SP_PRIVELEGE_INSERT', [])
        else FormControl.ExecProc('SP_PRIVELEGE_UPDATE',
                [PrivInfoQuery.Params.ParamValues['ID_Privelege']])
    else ModalResult := 0;
end;

end.
