unit uDepartmentGroup;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Grids, DBGrids, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
    PersonalCommon, SpCommon, DepartmentsViewUnit;

type
    TfmDepartmentsGroup = class(TForm)
        TopPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        SelectButton: TSpeedButton;
        CancelButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        GroupsGrid: TDBGrid;
        Panel1: TPanel;
        AddDep: TSpeedButton;
        AddTreeButton: TSpeedButton;
        DeleteDeptButton: TSpeedButton;
        DeptsGrid: TDBGrid;
        DeptGroupSelect: TIBQuery;
        DeptGroupSelectID_DEPT_GROUP: TIntegerField;
        DeptGroupSelectNAME_DEPT_GROUP: TIBStringField;
        DeptGroupSource: TDataSource;
        WorkQuery: TIBQuery;
        DeptsByGroup: TIBQuery;
        DeptsByGroupID_DEPARTMENT: TIntegerField;
        DeptsByGroupNAME_FULL: TIBStringField;
        DeptsSource: TDataSource;
        RefreshDeptsButton: TSpeedButton;
        procedure FormCreate(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure AddDepClick(Sender: TObject);
        procedure RefreshDeptsButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure AddTreeButtonClick(Sender: TObject);
        procedure DeleteDeptButtonClick(Sender: TObject);
        procedure GroupsGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SelectButtonClick(Sender: TObject);
        procedure GroupsGridDblClick(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Dept_Group: Integer;
    end;

var
    fmDepartmentsGroup: TfmDepartmentsGroup;

procedure SelectDepartmentGroup(var Value: Variant; var DisplayText: string);

implementation

{$R *.dfm}

procedure SelectDepartmentGroup(var Value: Variant; var DisplayText: string);
var
    form: TfmDepartmentsGroup;
begin
    form := TfmDepartmentsGroup.Create(Application.MainForm);
    form.SelectButton.Visible := True;
    form.ShowModal;
    with form do
        if Id_Dept_Group <> -1 then
        begin
            Value := DeptGroupSelect['Id_Dept_Group'];
            DisplayText := DeptGroupSelect['Name_Dept_Group'];
        end;
    form.Free;
end;

procedure TfmDepartmentsGroup.FormCreate(Sender: TObject);
begin
    CancelButton.Align := alRight;
    SelectButton.Align := alRight;

    DeptGroupSelect.Transaction := ReadTransaction;
    DeptGroupSelect.Open;
    DeptsByGroup.Transaction := ReadTransaction;
    DeptsByGroup.Open;

    Id_Dept_Group := -1;
end;

procedure TfmDepartmentsGroup.RefreshButtonClick(Sender: TObject);
begin
    DeptGroupSelect.Close;
    DeptGroupSelect.Open;
end;

procedure TfmDepartmentsGroup.AddButtonClick(Sender: TObject);
var
    s: string;
begin
    if InputQuery('Введіть назву групи підрозділів', 'Назва групи підрозділів', s)
        then
    begin
        WorkQuery.Transaction := WriteTransaction;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Sp_Dept_Group_Insert ' +
            QuotedStr(s);
        ExecQuery(WorkQuery);
        RefreshButton.Click;
    end;
end;

procedure TfmDepartmentsGroup.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TfmDepartmentsGroup.ModifyButtonClick(Sender: TObject);
var
    s: string;
begin
    if DeptGroupSelect.IsEmpty then Exit;

    if InputQuery('Введіть нову назву групи підрозділів', 'Назва групи підрозділів', s)
        then
    begin
        WorkQuery.Transaction := WriteTransaction;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Sp_Dept_Group_Update ' +
            IntToStr(DeptGroupSelect['Id_Dept_Group']) + ',' + QuotedStr(s);
        ExecQuery(WorkQuery);
        RefreshButton.Click;
    end;
end;

procedure TfmDepartmentsGroup.DeleteButtonClick(Sender: TObject);
begin
    if DeptGroupSelect.IsEmpty then Exit;

    if MessageDlg('Ви справді бажаєте вилучити групу підрозділів ' +
        DeptGroupSelect['Name_Dept_Group'], mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then
    begin
        WorkQuery.Transaction := WriteTransaction;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Sp_Dept_Group_Delete ' +
            IntToStr(DeptGroupSelect['Id_Dept_Group']);
        ExecQuery(WorkQuery);
        RefreshButton.Click;
    end;
end;

procedure TfmDepartmentsGroup.AddDepClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    if DeptGroupSelect.IsEmpty then Exit;

    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            WorkQuery.Transaction := WriteTransaction;
            WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Add_Dept_To_Group ' +
                IntToStr(DeptGroupSelect['Id_Dept_Group']) + ',' +
                IntToStr(Selected_Id) + ', 0';
            ExecQuery(WorkQuery);
            RefreshDeptsButton.Click;
        end;
end;

procedure TfmDepartmentsGroup.RefreshDeptsButtonClick(Sender: TObject);
begin
    DeptsByGroup.Close;
    DeptsByGroup.Open;
end;

procedure TfmDepartmentsGroup.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmDepartmentsGroup.AddTreeButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    if DeptGroupSelect.IsEmpty then Exit;

    form := TDepartmentsViewForm.Create(Self);
    form.Prepare(True, Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            WorkQuery.Transaction := WriteTransaction;
            WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Add_Dept_To_Group ' +
                IntToStr(DeptGroupSelect['Id_Dept_Group']) + ',' +
                IntToStr(Selected_Id) + ', 1';
            ExecQuery(WorkQuery);
            RefreshDeptsButton.Click;
        end;
end;

procedure TfmDepartmentsGroup.DeleteDeptButtonClick(Sender: TObject);
begin
    if DeptsByGroup.IsEmpty then Exit;

    if MessageDlg('Ви справді бажаєте вилучити підрозділ ' +
        DeptsByGroup['Name_Full'] + ' з групи?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes
        then
    begin
        WorkQuery.Transaction := WriteTransaction;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Remove_Dept_From_Group ' +
            IntToStr(DeptGroupSelect['Id_Dept_Group']) + ',' +
            IntToStr(DeptsByGroup['Id_Department']);
        ExecQuery(WorkQuery);
        RefreshDeptsButton.Click;
    end;
end;

procedure TfmDepartmentsGroup.GroupsGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Dept_Group: ' + IntToStr(DeptGroupSelect['Id_Dept_Group']));
    except
    end;
end;

procedure TfmDepartmentsGroup.SelectButtonClick(Sender: TObject);
begin
    if DeptGroupSelect.IsEmpty then Exit;

    Id_Dept_Group := DeptGroupSelect['Id_Dept_Group'];
    Close;
end;

procedure TfmDepartmentsGroup.GroupsGridDblClick(Sender: TObject);
begin
    if not DeptGroupSelect.IsEmpty and SelectButton.Visible then
        SelectButton.Click;
end;

end.
