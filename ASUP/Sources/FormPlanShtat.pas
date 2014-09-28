unit FormPlanShtat;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
    PersonalCommon, SpCommon, SpComboBox, Mask, CheckEditUnit, FieldControl,
    EditControl, DepartmentsViewUnit, ExtCtrls;

type
    TFormPlanShtatRasForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel1: TPanel;
        Label1: TLabel;
        OldNameEdit: TEdit;
        Label5: TLabel;
        OldDateBeg: TLabel;
        Label2: TLabel;
        OldDateEnd: TLabel;
        FC_SR: TFieldControl;
        Panel2: TPanel;
        GlobalBox: TCheckBox;
        DeptLabel: TLabel;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        FC_Department: TFieldControl;
        Panel3: TPanel;
        Label3: TLabel;
        FromDate: TDateTimePicker;
        FC_FromDate: TFieldControl;
        Label4: TLabel;
        Name_Shtat: TCheckEdit;
        FC_NameShtat: TFieldControl;
        Panel4: TPanel;
        NewTarPlan: TCheckBox;
        FC_NewTarPlan: TFieldControl;
        PlanLabel: TLabel;
        TarPlanName: TCheckEdit;
        FC_TarPlanName: TFieldControl;
        TarPlanLabel: TLabel;
        TarPlanBox: TSpComboBox;
        FC_TarPlan: TFieldControl;
        Panel5: TPanel;
        PercentBox: TCheckBox;
        PercentEdit: TCheckEdit;
        Label6: TLabel;
        FC_Percent: TFieldControl;
        TarifsBox: TCheckBox;
        FC_IncTarifs: TFieldControl;
        FC_Global: TFieldControl;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
        procedure NewTarPlanClick(Sender: TObject);
        procedure PercentBoxClick(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure GlobalBoxClick(Sender: TObject);
    private
        FormControl: TEditControl;
    public
        Id_SR: Integer;
    end;

var
    FormPlanShtatRasForm: TFormPlanShtatRasForm;

implementation

{$R *.dfm}

procedure TFormPlanShtatRasForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TFormPlanShtatRasForm.FormCreate(Sender: TObject);
begin
    FormControl := TEditControl.Create;
    FormControl.Add([FC_SR, FC_FromDate, FC_NameShtat, FC_Global, FC_Department,
        FC_NewTarPlan, FC_TarPlanName, FC_TarPlan, FC_Percent, FC_IncTarifs]);
    FormControl.Prepare(emNew);
    TarPlanBox.BoxType := Id_SR;
    TarPlanBox.LoadFromRegistry;
    NewTarPlan.Checked := True;
    NewTarPlanClick(Self);
    GlobalBox.Checked := True;
    FromDate.Date := Date;
end;

procedure TFormPlanShtatRasForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    TarPlanBox.SaveIntoRegistry;
end;

procedure TFormPlanShtatRasForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then
        FormControl.ExecProc('Form_Plan_ShtatRas', [])
    else ModalResult := 0;
end;

procedure TFormPlanShtatRasForm.NewTarPlanClick(Sender: TObject);
begin
    PlanLabel.Visible := NewTarPlan.Checked;
    TarPlanName.Visible := NewTarPlan.Checked;
    FC_TarPlanName.Required := NewTarPlan.Checked;

    TarPlanLabel.Visible := not NewTarPlan.Checked;
    TarPlanBox.Visible := not NewTarPlan.Checked;
    FC_TarPlan.Required := not NewTarPlan.Checked;

    TarifsBox.Checked := NewTarPlan.Checked;
    TarifsBox.Visible := NewTarPlan.Checked;
end;

procedure TFormPlanShtatRasForm.PercentBoxClick(Sender: TObject);
begin
    FC_Percent.Required := TarifsBox.Checked;
end;

procedure TFormPlanShtatRasForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);

    form.Prepare(True, Date);
    form.CanSelectRoot := False;
    if form.ShowModal = mrOk then
        with form do
            if Selected_Id <> -1 then
            begin
                FC_Department.Value := Selected_Id;
                DepartmentEdit.Text := ResultQuery['Name_Full'];
            end;
    form.Free;
end;

procedure TFormPlanShtatRasForm.GlobalBoxClick(Sender: TObject);
begin
    DeptLabel.Visible := not GlobalBox.Checked;
    DepartmentEdit.Visible := not GlobalBox.Checked;
    DepartmentButton.Visible := not GlobalBox.Checked;
    FC_Department.Required := not GlobalBox.Checked;
    if GlobalBox.Checked then FC_Department.Value := Null;
end;

end.
