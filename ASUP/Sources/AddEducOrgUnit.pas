
{ -$Id: AddEducOrgUnit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                 Модуль "Редактирование информации о учебном заведении"       }
{    Отображение, редактирование и добавлении информации о учебном заведении.  }
{    Ответственный:Данил Збуривский                                            }

unit AddEducOrgUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    PersonalCommon, EditControl, Db, IBCustomDataSet, FieldControl,
    StdCtrls, Buttons, IBQuery, SpCommon, Mask, CheckEditUnit;

type
    TAddEducOrgForm = class(TForm)
        EducOrgInfoQuery: TIBQuery;
        Label1: TLabel;
        Label2: TLabel;
        ShortNameEdit: TEdit;
        Label3: TLabel;
        AkrEdit: TEdit;
        Label4: TLabel;
        IsLearnComboBox: TComboBox;
        Label5: TLabel;
        Label6: TLabel;
        IsKvalifComboBox: TComboBox;
        Label7: TLabel;
        Label8: TLabel;
        SpeedButton1: TSpeedButton;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FC_FullName: TFieldControl;
        FC_ShortName: TFieldControl;
        FC_Akreditation: TFieldControl;
        FC_IsLearn: TFieldControl;
        FC_IsKvalif: TFieldControl;
        FC_Adress: TFieldControl;
        EducOrgInfoQueryID_ORG: TIntegerField;
        EducOrgInfoQueryNAME_FULL: TIBStringField;
        EducOrgInfoQueryNAME_SHORT: TIBStringField;
        EducOrgInfoQueryID_ADRESS: TIntegerField;
        EducOrgInfoQueryAKREDITATION: TIntegerField;
        EducOrgInfoQueryIS_LEARNING: TIntegerField;
        EducOrgInfoQueryIS_KVALIF: TIntegerField;
        FullNameEdit: TCheckEdit;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        LId: Integer;
        procedure Prepare(id: Integer; Mode: TEditMode);
    end;

var
    AddEducOrgForm: TAddEducOrgForm;

implementation

{$R *.DFM}


procedure TAddEducOrgForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
begin
    ok := True;
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if Mode = emNew then
        begin
            ok := ok and FormControl.ExecProc('Sp_EducOrg_Insert', [], True);
            LId := LastId;
        end
        else ok := ok and FormControl.ExecProc('Sp_EducOrg_UPDATE',
                [EducOrgInfoQuery.Params.ParamValues['ID_ORG']]);
        if ok then Self.ModalResult := mrOK;
    end;
end;

procedure TAddEducOrgForm.Prepare(id: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then Caption := 'Додати навчальний заклад'
    else Caption := 'Змінити навчальний заклад';

    if Mode = emModify then
        with EducOrgInfoQuery do
        begin
            Close;
            Params.ParamValues['Id_Org'] := id;
            Open;
        end;
    FormControl.Prepare(Mode);
end;

procedure TAddEducOrgForm.FormCreate(Sender: TObject);
begin
    EducOrgInfoQuery.Transaction := PersonalCommon.ReadTransaction;
    FormControl := TEditControl.Create;
    FormControl.Add([FC_FullName, FC_ShortName, FC_Adress, FC_Akreditation,
        FC_IsLearn, FC_IsKvalif]);
end;

procedure TAddEducOrgForm.FormActivate(Sender: TObject);
begin
    FullNameEdit.SetFocus;
end;

procedure TAddEducOrgForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TAddEducOrgForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

end.
