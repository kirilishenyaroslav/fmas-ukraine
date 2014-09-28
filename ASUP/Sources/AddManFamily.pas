
{ -$Id: AddManFamily.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

                       {                       Модуль "Информация о родственнике"                     }
{    Редактирование и добавлении информации о родственнике физического лица.   }
{    Ответственный:Данил Збуривский                                            }


unit AddManFamily;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon, ComCtrls, Variants;

type
    TAddManFamilyForm = class(TAddForm)
        Label1: TLabel;
        BirthDatePicker: TDateTimePicker;
        FC_BIRTH_DATE: TFieldControl;
        DetailsQueryBIRTH_DATE: TDateField;
        InvalidBox: TGroupBox;
        SeriaEdit: TCheckEdit;
        NumEdit: TCheckEdit;
        DateSpravPicker: TDateTimePicker;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        DetailsQueryIS_INVALID: TIBStringField;
        DetailsQueryIS_CHERNOB: TIBStringField;
        DetailsQuerySERIA_SPRAV: TIBStringField;
        DetailsQueryNOMER_SPRAV: TIBStringField;
        DetailsQueryDATE_SPRAV: TDateField;
        FC_INVALID: TFieldControl;
        FC_CHERNOB: TFieldControl;
        FC_SERIA: TFieldControl;
        FC_NOMER: TFieldControl;
        FC_DATE: TFieldControl;
        InvalidCheckBox: TCheckBox;
        ChernobCheckBox: TCheckBox;
        NoteMemo: TMemo;
        FC_NOTE: TFieldControl;
        DetailsQueryNOTE: TIBStringField;
        procedure DetailsButtonClick(Sender: TObject);
        procedure Id_RelationBoxChange(Sender: TObject);
    published
        Id_RelationLabel: TLabel;
        FIOLabel: TLabel;
        DetailsQuery: TIBQuery;
        Id_RelationBox: TSpComboBox;
        DetailsQueryId_Relation: TIntegerField;
        FC_Id_Relation: TFieldControl;
        FIOEdit: TCheckEdit;
        DetailsQueryFIO: TIBStringField;
        FC_FIO: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Man_Int: Integer;
        FIO: string;
        procedure Prepare(Mode: TEditMode; id: Integer); override;
        function GetId: Integer; override;
    end;

var
    AddManFamilyForm: TAddManFamilyForm;
    FirstTime: Boolean;

implementation

{$R *.DFM}

procedure TAddManFamilyForm.Prepare(Mode: TEditMode; id: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати родича'
    else if Mode = emModify then Caption := 'Змінити родича'
    else Caption := 'Додаткова інформація по родичу';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Man_Int := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Man_Int'] := id;
            Params.ParamValues['FIO'] := FIO;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Id_Relation, FC_FIO, FC_BIRTH_DATE, FC_INVALID, FC_CHERNOB, FC_SERIA,
        FC_NOMER, FC_DATE, FC_NOTE]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    BirthDatePicker.Date := Date();
    BirthDatePicker.Checked := False;
    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

function TAddManFamilyForm.GetId: Integer;
begin
    Result := Id_Man_Int;
end;

procedure TAddManFamilyForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;
    Id_RelationBox.SaveIntoRegistry;
end;

procedure TAddManFamilyForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
begin
    FormControl.Read;
    if not FormControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;

    if (FC_BIRTH_DATE.Value = '31.12.2150') then FC_BIRTH_DATE.Value := NULL;
    if Mode = emNew then
        ok := FormControl.ExecProc('Man_Family_Insert', [Id_Man_Int])
    else ok := FormControl.ExecProc('Man_Family_Update', [FIO, Id_Man_Int]);
    if not ok then ModalResult := 0;
end;

procedure TAddManFamilyForm.DetailsButtonClick(Sender: TObject);
begin
    AddManFamilyForm.Height := 316;
end;

procedure TAddManFamilyForm.Id_RelationBoxChange(Sender: TObject);
begin
    if not FirstTime then
    begin
        InvalidCheckBox.Checked := False;
        ChernobCheckBox.Checked := False;
        SeriaEdit.Text := '';
        NumEdit.Text := '';
        NoteMemo.Lines.Clear;
        DateSpravPicker.Checked := False;

    end;
    FirstTime := False;
end;

initialization
    RegisterClass(TAddManFamilyForm);
end.
