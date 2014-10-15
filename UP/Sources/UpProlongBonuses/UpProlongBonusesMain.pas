unit UpProlongBonusesMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
    cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, uFControl,
    uLabeledFControl, uSpravControl, cxControls, cxContainer, cxEdit,
    cxCheckBox, uCommonSp, Ibase, GlobalSPR, pFibStoredProc,
    pFibDatabase;

type
    TfrmProlongBonuses = class(TForm)
        CheckDepartmentValue: TcxCheckBox;
        DepartmentValue: TqFSpravControl;
        CheckDepartmentWithChild: TcxCheckBox;
        CheckRaiseValue: TcxCheckBox;
        ExistRateValue: TqFSpravControl;
    lblNewDateBeg: TcxLabel;
    NewDateBeg: TcxDateEdit;
    lblNewDateEnd: TcxLabel;
    NewDateEnd: TcxDateEdit;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    lblDateFilter: TcxLabel;
    DateFilter: TcxDateEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DepartmentValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure ExistRateValueOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure CheckDepartmentValuePropertiesChange(Sender: TObject);
    procedure CheckRaiseValuePropertiesChange(Sender: TObject);
    private
        { Private declarations }
        db_handle: Tisc_db_handle;
        id_order: Int64;
    public
        { Public declarations }
        constructor Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; idorder: Int64); reintroduce;
    end;

var
    frmProlongBonuses: TfrmProlongBonuses;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmProlongBonuses.btnOkClick(Sender: TObject);
var
    Sproc: TpFibStoredProc;
begin
    if DepartmentValue.Value = NULL then
        begin
            ShowMessage('Не введено підрозділ!');
            Exit;
        end;

    if ExistRateValue.Value = NULL then
        begin
            ShowMessage('Не введено надбавку для заміни бюджет!');
            Exit;
        end;
        ShowMessage('Попередження! Дана операція працює лише для надбавок з типом "без прив''''язки до посадового окладу". ' +
                     'З питаннями звертатись до розробників чи адміністраторів.');
        Sproc := TpFibStoredProc.Create(self);
        Sproc.Database := TpFibDatabase.Create(self);
        Sproc.Database.SQLDialect := 3;
        Sproc.Database.Handle := db_handle;
        Sproc.Transaction := TpFIBTransaction.Create(self);
        Sproc.Transaction.DefaultDatabase := Sproc.Database;
        Sproc.Database.DefaultTransaction := Sproc.Transaction;
        Sproc.Database.DefaultUpdateTransaction := Sproc.Transaction;
        Sproc.Transaction.StartTransaction;
        
    try


        Sproc.StoredProcName := 'UP_PROLONG_BONUSES';
        Sproc.Prepare;
        Sproc.ParamByName('ID_DEPARTMENT').Value := DepartmentValue.Value;
        if CheckDepartmentWithChild.Checked then
            Sproc.ParamByName('WITH_CHILD').Value := 1
        else
            Sproc.ParamByName('WITH_CHILD').Value := 0;
        Sproc.ParamByName('ID_RAISE').Value := ExistRateValue.Value;
        Sproc.ParamByName('FILTER_DATE').Value := DateFilter.EditValue;
        Sproc.ParamByName('NEW_DATE_BEG').Value := NewDateBeg.EditValue;
        Sproc.ParamByName('NEW_DATE_END').Value := NewDateEnd.EditValue;
        Sproc.ParamByName('ID_ORDER').AsInt64 := Id_Order;
        Sproc.ExecProc;
        Sproc.Transaction.Commit;

    except on E: Exception do
            begin
                ShowMessage('Увага! Під час формування пунктів виникла помилка: ' + E.Message);
                Sproc.Transaction.Rollback;
            end;

    end;
     Sproc.Free;
    ShowMessage('Пункти наказу успішно сформовано!');

    ModalResult := mrYes;

end;

procedure TfrmProlongBonuses.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmProlongBonuses.DepartmentValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
        begin
            with sp.Input do
                begin
                    Append;
                    FieldValues['DBHandle'] := Integer(db_Handle);
                    FieldValues['Select'] := 1;
                    FieldValues['ShowStyle'] := 0;
                    Post;
                end;
            sp.Show;

            if (sp.Output <> nil) and not sp.Output.IsEmpty then
                begin
                    Value := sp.Output['ID_DEPARTMENT'];
                    DisplayText := sp.Output['NAME_FULL'];
                end;
        end;
end;

procedure TfrmProlongBonuses.ExistRateValueOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
    sp := GetSprav('Asup/SpRaise');
    if sp <> nil then
        begin
            with sp.Input do
                begin
                    Append;
                    FieldValues['DBHandle'] := Integer(Db_Handle);
                    FieldValues['Select'] := 1;
                    FieldValues['Actual_Date'] := date;
                    FieldValues['ShowStyle'] := 0;
                    Post;
                end;
            sp.Show;

            if (sp.Output <> nil) and not sp.Output.IsEmpty then
                begin
                    Value := sp.Output['ID_RAISE'];
                    DisplayText := sp.Output['NAME'];
                end;
        end;
end;

constructor TfrmProlongBonuses.Create(AOwner: TComponent;
    DbHandle: TISC_DB_HANDLE; idorder: Int64);
begin
    inherited Create(AOwner);
    db_handle := DbHandle;
    id_order := idorder;
    NewDateBeg.EditValue := EncodeDate(YearOf(Date), Monthof(Date), 1);
    NewDateEnd.EditValue := IncMonth(NewDateBeg.EditValue) - 1;
end;

procedure TfrmProlongBonuses.CheckDepartmentValuePropertiesChange(
  Sender: TObject);
var
    Res: Variant;
    s: string;
begin
    if CheckDepartmentValue.Checked then
        begin
            DepartmentValueOpenSprav(DepartmentValue, Res, s);
            DepartmentValue.Value := Res;
            DepartmentValue.DisplayText := s;
        end;
end;

procedure TfrmProlongBonuses.CheckRaiseValuePropertiesChange(
  Sender: TObject);
var
    Res: Variant;
    s: string;
begin
    if CheckRaiseValue.Checked then
        begin
            ExistRateValueOpenSprav(ExistRateValue, Res, s);
            ExistRateValue.Value := Res;
            ExistRateValue.DisplayText := s;
        end;
end;

end.
