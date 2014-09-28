
{ -$Id: DepartmentsViewUnit.pas,v 1.11 2007/11/05 11:04:41 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                  Модуль "Отображение дерева подразделений"                   }
{       Отображение дерева подразделений, управление порядком отображения      }
{       подразделений, поиск подразделений                                     }
{                                                  ответственный: Олег Волков  }

unit DepartmentsViewUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ComCtrls, StdCtrls, Buttons, Db, IBCustomDataSet, IBQuery,
    SpCommon, EditControl, PersonalCommon, ToolWin, ExtCtrls, uSearchFrame,
    uDepartmentsTree, NagScreenUnit;

type
    TDepartmentsViewForm = class(TForm)
        ResultQuery: TIBQuery;
        ToolBar1: TToolBar;
        ToolButton1: TToolButton;
        SearchQuery: TIBQuery;
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DetailsButton: TSpeedButton;
        OkButton: TSpeedButton;
        CancelButton: TSpeedButton;
        UpButton: TSpeedButton;
        DownButton: TSpeedButton;
        MoveQuery: TIBQuery;
        RemoveQuery: TIBQuery;
        RefreshButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        ResultQueryID_DEPARTMENT: TIntegerField;
        ResultQueryID_PARENT: TIntegerField;
        ResultQueryNAME_SHORT: TIBStringField;
        ResultQueryDISPLAY_ORDER: TIntegerField;
        ResultQueryDISPLAY_ORDER2: TIntegerField;
        ResultQueryNAME_FULL: TIBStringField;
        DepartmentsTree: TfmDepartmentsTree;
        Panel2: TPanel;
        Label9: TLabel;
        CurTimePicker: TDateTimePicker;
        ResultQueryDISPLAY_NAME: TStringField;
        BufferQuery: TIBQuery;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DetailsButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure DepartmentsTreeKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure DepartmentsTreeDblClick(Sender: TObject);
        procedure UpButtonClick(Sender: TObject);
        procedure DownButtonClick(Sender: TObject);
        procedure DepartmentsTreeDragOver(Sender, Source: TObject; X,
            Y: Integer; State: TDragState; var Accept: Boolean);
        procedure RefreshButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure CurTimePickerChange(Sender: TObject);
        procedure ResultQueryCalcFields(DataSet: TDataSet);
        procedure ResultQueryAfterScroll(DataSet: TDataSet);
        procedure DepartmentsTreeTreeListDblClick(Sender: TObject);
        procedure DepartmentsTreeTreeListKeyPress(Sender: TObject;
            var Key: Char);
        procedure DepartmentsTreeTreeListKeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
    private
        procedure ShowChangeForm(theMode: TEditMode);
    public
        Buhg: Boolean;
        Select: Boolean;
        CanSelectRoot: Boolean;
        Selected_Id: Integer;
        Order_Kind: Integer;
        SelectAll: Boolean;
        procedure Prepare(Select: Boolean; Actual_Date: TDate; Order_Kind: Integer = 1);
    end;

var
    DepartmentsViewForm: TDepartmentsViewForm;

procedure SelectDepartment(var Value: Variant; var DisplayText: string);

implementation

{$R *.DFM}

uses DepartmentsDetailsUnit, PeopleSearchUnit, DepartmentsSearchUnit, Variants,
    uBuffer2, Buffer;

procedure SelectDepartment(var Value: Variant; var DisplayText: string);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Application.MainForm);
    form.Prepare(True, Date);
    form.CanSelectRoot := True;
    if not VarIsNull(Value) then
        form.ResultQuery.Locate('Id_Department', Value, []);

    if form.ShowModal = mrOk then
        with form do
        begin
            Value := Selected_Id;
            if Value = -1 then
                DisplayText := Consts_Query['Firm_Name']
            else DisplayText := ResultQuery['Name_Full'];
        end;
    form.Free;
end;

procedure TDepartmentsViewForm.Prepare(Select: Boolean; Actual_Date: TDate; Order_Kind: Integer = 1);
var
    s: string;
    NagScreen: TNagScreen;
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    SearchQuery.Transaction := PersonalCommon.ReadTransaction;
    MoveQuery.Transaction := PersonalCommon.WriteTransaction;
    RemoveQuery.Transaction := PersonalCommon.WriteTransaction;

    Self.Order_Kind := Order_Kind;

    if FormStyle = fsMDIChild then WindowState := wsMaximized
    else WindowState := wsNormal;

    Self.Select := Select;
    if Select then OkButton.Caption := 'Вибрати'
    else OkButton.Visible := False;
    CancelButton.Align := alRight;
    OkButton.Align := alRight;

    CurTimePicker.Date := Actual_Date;

    if Buhg then
    begin
        s := ResultQuery.SQL.Text;
        ResultQuery.SQL.Text := StringReplace(s, 'Get_Departments_2',
            'Get_Buhg_Departments', []);
        AddButton.Enabled := False;
        ModifyButton.Enabled := False;
        DetailsButton.Enabled := False;
        UpButton.Enabled := False;
        DownButton.Enabled := False;
    end;

    if not Buhg then
        ResultQuery.Params.ParamValues['Root'] :=
            Consts_Query['Current_Department']
    else ResultQuery.Params.ParamValues['Root'] :=
        Consts_Query['Current_Buhg_Department'];

    ResultQuery.Params.ParamValues['Actual_Date'] := Actual_Date;

    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Відкривається довідник підрозділів...');

    DepartmentsTree.Prepare(ResultQuery);
    if DepartmentsTree.TreeList.TopNode <> nil then
        DepartmentsTree.TreeList.TopNode.Expand(False);

    NagScreen.Free;
end;

procedure TDepartmentsViewForm.ShowChangeForm(theMode: TEditMode);
var
    form: TDepartmentsDetailsForm;
begin
    form := TDepartmentsDetailsForm.Create(Self);

    with form do
    begin
        if theMode = emNew then
        begin
            id := -1;
            id_parent := ResultQuery['Id_Department'];
            Name_Parent := ResultQuery['Name_Full'];
        end
        else
        begin
            id := ResultQuery['Id_Department'];
            Name_Department := ResultQuery['Name_Full'];
            id_parent := ResultQuery['Id_Parent'];
            ResultQuery.Locate('Id_Department', ResultQuery['Id_Parent'], []);
            Name_Parent := ResultQuery['Name_Full'];
            ResultQuery.Locate('Id_Department', id, []);
        end
    end;

    form.Prepare(theMode);

    if form.ShowModal = mrOk then
        RefreshButton.Click;

    form.Free;
end;

procedure TDepartmentsViewForm.AddButtonClick(Sender: TObject);
begin
    if AddButton.Enabled then
        if CheckAccess('/ROOT/SP_DEPARTMENT', 'Edit', True) = 0 then
            ShowChangeForm(emNew);
end;

procedure TDepartmentsViewForm.ModifyButtonClick(Sender: TObject);
begin
    if ModifyButton.Enabled then
        if CheckAccess('/ROOT/SP_DEPARTMENT', 'Edit', True) = 0 then
            with DepartmentsDetailsForm do
                ShowChangeForm(emModify);
end;

procedure TDepartmentsViewForm.DetailsButtonClick(Sender: TObject);
begin
    if DetailsButton.Enabled then
        ShowChangeForm(emView);
end;

procedure TDepartmentsViewForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    if FormStyle = fsMDIChild then Close;
end;

procedure TDepartmentsViewForm.OkButtonClick(Sender: TObject);
begin
    if Select then
    begin
        with DepartmentsTree.TreeList do
            if (not CanSelectRoot) and (FocusedNode = TopNode) then
                Exit;

        Selected_Id := ResultQuery['Id_Department'];
        ModalResult := mrOk;
        if FormStyle = fsMDIChild then Close;
    end;
end;

procedure TDepartmentsViewForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TDepartmentsViewForm.DepartmentsTreeKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_RETURN: OkButton.Click;
        VK_SPACE: ModifyButton.Click;
        VK_ADD: AddButton.Click;
    end;

    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Department: ' + IntToStr(ResultQuery['Id_Department']));
    except
    end;

end;

procedure TDepartmentsViewForm.DepartmentsTreeDblClick(Sender: TObject);
begin
    if Select then OkButton.Click;
end;

procedure TDepartmentsViewForm.UpButtonClick(Sender: TObject);
begin
    if not UpButton.Enabled then Exit;

    MoveQuery.Params.ParamValues['Id_Department'] := ResultQuery['Id_Department'];
    MoveQuery.Params.ParamValues['Direction'] := -1;
    MoveQuery.Params.ParamValues['Order_Kind'] := Order_Kind;
    ExecQuery(MoveQuery);

    RefreshButton.Click;
end;

procedure TDepartmentsViewForm.DownButtonClick(Sender: TObject);
begin
    if not DownButton.Enabled then Exit;

    MoveQuery.Params.ParamValues['Id_Department'] := ResultQuery['Id_Department'];
    MoveQuery.Params.ParamValues['Direction'] := 1;
    MoveQuery.Params.ParamValues['Order_Kind'] := Order_Kind;
    ExecQuery(MoveQuery);

    RefreshButton.Click;
end;

procedure TDepartmentsViewForm.DepartmentsTreeDragOver(Sender,
    Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := Sender = DepartmentsTree;
end;

procedure TDepartmentsViewForm.RefreshButtonClick(Sender: TObject);
var
    id: Integer;
    NagScreen: TNagScreen;
begin
    if not ResultQuery.IsEmpty then id := ResultQuery['Id_Department'];

    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Відкривається довідник підрозділів...');

    DepartmentsTree.Refresh;
    ResultQuery.Locate('Id_Department', id, []);
    if DepartmentsTree.TreeList.FocusedNode <> nil then
        DepartmentsTree.TreeList.FocusedNode.Expand(False);

    NagScreen.Free;
end;

procedure TDepartmentsViewForm.DeleteButtonClick(Sender: TObject);
var
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    if CheckAccess('/ROOT/SP_DEPARTMENT', 'Del', True) <> 0 then
        Exit;

    if MessageDlg('Ви справді бажаєте вилучити цей підрозділ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
    if MessageDlg('При вилученні підрозділу будуть видалені посади штатного'
        + ' розкладу та інші пов''язані дані. Продовжити?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    if ResultQuery['Id_Department'] = Consts_Query['Current_Department'] then
    begin
        MessageDlg('Неможливо вилучити головний підрозділ!', mtError, [mbOk], 0);
        Exit;
    end;

    BufTran2 := nil;
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;
    try
            // запись основной информации
        RemoveQuery.Transaction := WriteTransaction;
        RemoveQuery.Close;
        RemoveQuery.Params.ParamValues['Id_Department'] := ResultQuery['Id_Department'];
        ExecQuery(RemoveQuery);

        if not DontWriteToDbf then
        begin
            BufferQuery.Transaction := WriteTransaction;
            BufferQuery.Close;
            BufferQuery.ParamByName('Id_Department').AsInteger := ResultQuery['Id_Department'];
            BufferQuery.Open;

            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('SP_PODRK', 'BUFF_SP_PODRK', WriteTransaction);
            BufTran2.WriteRange(First_PBKey, Last_PBKey);
        end;
        WriteTransaction.Commit;

    except on e: Exception do
        begin
            WriteTransaction.Rollback;
            if BufTran2 <> nil then BufTran2.RollbackOnError;

            MessageDlg('При занесенні інформації виникла помилка: ' +
                e.Message, mtError, [mbOk], 0);
        end;
    end;

    if BufTran2 <> nil then BufTran2.Free;

    Sleep(1000);
    RefreshButton.Click;
end;

procedure TDepartmentsViewForm.CurTimePickerChange(Sender: TObject);
begin
    ResultQuery.Close;
    ResultQuery.ParamByName('Actual_Date').AsDate := CurTimePicker.Date;
    RefreshButton.Click;
end;

procedure TDepartmentsViewForm.ResultQueryCalcFields(DataSet: TDataSet);
begin
    if ResultQuery.IsEmpty then Exit;

    if Trim(ResultQuery['Name_Short']) = '' then
        ResultQuery['Display_Name'] := ResultQuery['Name_Full']
    else ResultQuery['Display_Name'] := ResultQuery['Name_Full'] +
        '(' + ResultQuery['Name_Short'] + ')';
end;

procedure TDepartmentsViewForm.ResultQueryAfterScroll(DataSet: TDataSet);
begin
    ResultQueryCalcFields(DataSet);
end;

procedure TDepartmentsViewForm.DepartmentsTreeTreeListDblClick(
    Sender: TObject);
begin
    if Select then OkButton.Click;
end;

procedure TDepartmentsViewForm.DepartmentsTreeTreeListKeyPress(
    Sender: TObject; var Key: Char);
begin
    DepartmentsTree.TreeListKeyPress(Sender, Key);
end;

procedure TDepartmentsViewForm.DepartmentsTreeTreeListKeyDown(
    Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    DepartmentsTree.TreeListKeyDown(Sender, Key, Shift);
    if Select and (Key = VK_RETURN) then
        OkButton.Click;
end;

end.
