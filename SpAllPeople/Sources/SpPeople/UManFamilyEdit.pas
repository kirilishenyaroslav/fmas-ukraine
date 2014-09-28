unit UManFamilyEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, FIBDataSet, pFIBDataSet, cxDropDownEdit,
    cxDBEdit, cxMaskEdit, cxCalendar, cxControls, cxContainer, cxEdit,
    cxTextEdit, StdCtrls, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
    cxLookAndFeelPainters, cxButtons, FIBDatabase, pFIBDatabase, cxCheckBox,
    ActnList, IBase;

type
    TfFamilyEdit = class(TForm)
        Label1: TLabel;
        FIOEdit: TcxTextEdit;
        Label2: TLabel;
        BirthDateEdit: TcxDateEdit;
        RelationsDataSet: TpFIBDataSet;
        RelationsDataSetID_RELATION: TFIBIntegerField;
        RelationsDataSetNAME_RELATION: TFIBStringField;
        RelationsDataSetID_SEX: TFIBIntegerField;
        RelationsDataSetUNIQUE_REL: TFIBStringField;
        RelationsDataSource: TDataSource;
        RelationsComboBox: TcxLookupComboBox;
        OkBtn: TcxButton;
        cxButton1: TcxButton;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        UseDateChB: TcxCheckBox;
        ActionList1: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        procedure RelationsComboBoxPropertiesChange(Sender: TObject);
        procedure UseDateChBPropertiesChange(Sender: TObject);
        procedure OkActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
    private
        { Private declarations }
    public
        IdRelation: Integer;
        FIO: string;
        BirthDate: TDate;
        UseDate: Boolean;
        constructor Create(AOwner: TComponent; ADB_HANDLE: TISC_DB_HANDLE; AIdRelation: Integer = -1; AFIO: string = ''; ABirthDate: TDateTime = -1); reintroduce;
    end;

implementation

{$R *.dfm}

constructor TfFamilyEdit.Create(AOwner: TComponent; ADB_HANDLE: TISC_DB_HANDLE; AIdRelation: Integer = -1; AFIO: string = ''; ABirthDate: TDateTime = -1);
begin
    inherited Create(AOwner);
    //******************************************************************************
    DB.Handle := ADB_HANDLE;
    ReadTransaction.Active := True;
    RelationsDataSet.Open;
    IdRelation := AIdRelation;
    RelationsComboBox.EditValue := IdRelation;
    FIOEdit.Text := AFIO;
    if ABirthDate <> -1 then
    begin
        BirthDateEdit.Date := ABirthDate;
        BirthDateEdit.Enabled := True;
        UseDateChB.Checked := True;
    end
    else
    begin
        BirthDateEdit.Enabled := False;
        UseDateChB.Checked := False;
    end;
end;

procedure TfFamilyEdit.RelationsComboBoxPropertiesChange(
    Sender: TObject);
begin
    IdRelation := RelationsComboBox.EditValue;
end;

procedure TfFamilyEdit.UseDateChBPropertiesChange(Sender: TObject);
begin
    BirthDateEdit.Enabled := UseDateChB.Checked;
end;

procedure TfFamilyEdit.OkActionExecute(Sender: TObject);
begin
    if IdRelation = -1 then
    begin
        MessageDlg('Не задано необхіднe поле ' + ''' Відносини ''', mtError, [mbOk], 0);
        RelationsComboBox.SetFocus;
        Exit;
    end;
    if (BirthDateEdit.Text = '') and (UseDateChB.Checked) then
    begin
        MessageDlg('Не задано необхіднe поле ' + ''' Дата народження ''', mtError, [mbOk], 0);
        BirthDateEdit.SetFocus;
        Exit;
    end;
    if FIOEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + ''' Прізвище, ім''я та по батькові ''', mtError, [mbOk], 0);
        FIOEdit.SetFocus;
        Exit;
    end;
    FIO := FIOEdit.Text;
    UseDate := UseDateChB.Checked;
    if UseDate then
        BirthDate := BirthDateEdit.Date;
    ModalResult := mrOk;
end;

procedure TfFamilyEdit.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.
