unit UpProlongBonusesParams;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, uFControl,
    uLabeledFControl, uSpravControl, cxControls, cxContainer, cxEdit,
    cxCheckBox, uCommonSp, Ibase, GlobalSPR, cxLabel, cxTextEdit, cxMaskEdit,
    cxDropDownEdit, cxCalendar, pFibStoredProc, pFibDatabase;

type
    TfrmChangeGetParams = class(TForm)
        cxButton1: TcxButton;
        cxButton2: TcxButton;
        CheckDepartmentValue: TcxCheckBox;
        DepartmentValue: TqFSpravControl;
        CheckBudgetValue: TcxCheckBox;
        BudgetValue: TqFSpravControl;
        CheckNewBudgetValue: TcxCheckBox;
        NewBudgetValue: TqFSpravControl;
        ExistRateValue: TqFSpravControl;
        CheckRaiseValue: TcxCheckBox;
        cxDateEdit1: TcxDateEdit;
        cxDateEdit2: TcxDateEdit;
        cxLabel1: TcxLabel;
        cxLabel2: TcxLabel;
        CheckDepartmentWithChild: TcxCheckBox;
        CheckReturnFinance: TcxCheckBox;
        procedure cxButton1Click(Sender: TObject);
        procedure cxButton2Click(Sender: TObject);
        procedure DepartmentValueOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure BudgetValueOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure ExistRateValueOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure NewBudgetValueOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure CheckDepartmentValuePropertiesChange(Sender: TObject);
        procedure CheckBudgetValuePropertiesChange(Sender: TObject);
        procedure CheckNewBudgetPropertiesChange(Sender: TObject);
        procedure CheckRaisePropertiesChange(Sender: TObject);
    private
        { Private declarations }
        db_handle: Tisc_db_handle;
        id_order: Int64;
    public
        { Public declarations }
        constructor Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; idorder: Int64); reintroduce;
    end;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmChangeGetParams.cxButton1Click(Sender: TObject);
var
    Sproc: TpFibStoredProc;
begin
    if DepartmentValue.Value = NULL then
        begin
            ShowMessage('Не введено підрозділ!');
            Exit;
        end;

    if BudgetValue.Value = NULL then
        begin
            ShowMessage('Не введено старий бюджет!');
            Exit;
        end;

    if NewBudgetValue.Value = NULL then
        begin
            ShowMessage('Не введено новий бюджет!');
            Exit;
        end;

    if ExistRateValue.Value = NULL then
        begin
            ShowMessage('Не введено надбавку для заміни бюджет!');
            Exit;
        end;

    try

        Sproc := TpFibStoredProc.Create(self);
        Sproc.Database := TpFibDatabase.Create(self);
        Sproc.Database.SQLDialect := 3;
        Sproc.Database.Handle := db_handle;
        Sproc.Transaction := TpFIBTransaction.Create(self);
        Sproc.Transaction.DefaultDatabase := Sproc.Database;
        Sproc.Database.DefaultTransaction := Sproc.Transaction;
        Sproc.Database.DefaultUpdateTransaction := Sproc.Transaction;
        Sproc.Transaction.StartTransaction;
        Sproc.StoredProcName := 'UP_CHANGE_RAISE_BUDGETS';
        Sproc.Prepare;
        Sproc.ParamByName('id_department').Value := DepartmentValue.Value;
        Sproc.ParamByName('old_budget').Value := BudgetValue.Value;
        Sproc.ParamByName('new_budget').Value := NewBudgetValue.Value;
        Sproc.ParamByName('id_raise').Value := ExistRateValue.Value;
        Sproc.ParamByName('date_from').Value := cxDateEdit1.EditValue;
        Sproc.ParamByName('date_to').Value := cxDateEdit2.EditValue;
        Sproc.ParamByName('id_order').AsInt64 := id_order;
        if CheckDepartmentWithChild.Checked then
            Sproc.ParamByName('dep_with_child').Value := 1
        else
            Sproc.ParamByName('dep_with_child').Value := 0;
        if CheckReturnFinance.Checked then
            Sproc.ParamByName('return_finance').Value := 1
        else
            Sproc.ParamByName('return_finance').Value := 0;
        Sproc.ExecProc;
        Sproc.Transaction.Commit;
        Sproc.Free;
    except on E: Exception do
            begin
            end;

    end;

    ShowMessage('Пункти наказу успішно сформовано!');

    ModalResult := mrYes;
end;

procedure TfrmChangeGetParams.cxButton2Click(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmChangeGetParams.DepartmentValueOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
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

procedure TfrmChangeGetParams.BudgetValueOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Res: Variant;
begin
    Res := GlobalSPR.GetSmets(self,
        Db_Handle,
        Date,
        psmSmetWithoutPeriod);
    if (VarArrayDimCount(Res) > 0) then
        begin
            Value := Res[0];
            DisplayText := VarToStr(Res[3]) + ' "' + VarToStr(Res[2]) + '"';
        end;
end;

procedure TfrmChangeGetParams.ExistRateValueOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
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

procedure TfrmChangeGetParams.NewBudgetValueOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Res: Variant;
begin
    Res := GlobalSPR.GetSmets(self,
        Db_Handle,
        Date,
        psmSmetWithoutPeriod);
    if (VarArrayDimCount(Res) > 0) then
        begin
            Value := Res[0];
            DisplayText := VarToStr(Res[3]) + ' "' + VarToStr(Res[2]) + '"';
        end;
end;

constructor TfrmChangeGetParams.Create(AOwner: TComponent;
    DbHandle: TISC_DB_HANDLE; idorder: Int64);
begin
    inherited Create(AOwner);
    db_handle := DbHandle;
    id_order := idorder;
    cxDateEdit1.EditValue := EncodeDate(YearOf(Date), Monthof(Date), 1);
    cxDateEdit2.EditValue := IncMonth(cxDateEdit1.EditValue) - 1;
end;

procedure TfrmChangeGetParams.CheckDepartmentValuePropertiesChange(
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

procedure TfrmChangeGetParams.CheckBudgetValuePropertiesChange(
    Sender: TObject);
var
    Res: Variant;
    s: string;
begin
    if CheckBudgetValue.Checked then
        begin
            BudgetValueOpenSprav(BudgetValue, Res, s);
            BudgetValue.Value := Res;
            BudgetValue.DisplayText := s;
        end;
end;

procedure TfrmChangeGetParams.CheckNewBudgetPropertiesChange(
    Sender: TObject);
var
    Res: Variant;
    s: string;
begin
    if CheckNewBudgetValue.Checked then
        begin
            NewBudgetValueOpenSprav(NewBudgetValue, Res, s);
            NewBudgetValue.Value := Res;
            NewBudgetValue.DisplayText := s;
        end;
end;

procedure TfrmChangeGetParams.CheckRaisePropertiesChange(Sender: TObject);
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

