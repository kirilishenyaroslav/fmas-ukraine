unit WorkModeChanges;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Grids, DBGrids, Buttons, ExtCtrls, DB, IBCustomDataSet, IBQuery,
    PersonalCommon, SpCommon, AddWorkModeChange, GoodFunctionsUnit, ActnList;

type
    TWorkModeChangesForm = class(TForm)
        TopPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        CancelButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        ChangesGrid: TDBGrid;
        ResultQuery: TIBQuery;
        WorkModeChangesSource: TDataSource;
        ResultQueryID_WORK_MODE_CHANGE: TIntegerField;
        ResultQueryID_WORK_MODE: TIntegerField;
        ResultQuerySHIFT: TIntegerField;
        ResultQueryWORK_MODE_NAME: TIBStringField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryREASON: TIBStringField;
        ResultQueryID_ORDER: TIntegerField;
        WorkQuery: TIBQuery;
        ViewButton: TSpeedButton;
        ActionList1: TActionList;
        InsertAction: TAction;
        ModifyAction: TAction;
        DelAction: TAction;
        ViewAction: TAction;
        RefreshAction: TAction;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure ChangesGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure InsertActionExecute(Sender: TObject);
        procedure ModifyActionExecute(Sender: TObject);
        procedure DelActionExecute(Sender: TObject);
        procedure ViewActionExecute(Sender: TObject);
        procedure RefreshActionExecute(Sender: TObject);

    private
        Id_Man_Moving: Integer;

    public
        constructor Create(AOwner: TComponent; Id_Man_Moving: Integer); reintroduce;

    end;

var
    WorkModeChangesForm: TWorkModeChangesForm;

implementation

{$R *.dfm}

constructor TWorkModeChangesForm.Create(AOwner: TComponent; Id_Man_Moving: Integer);
begin
    inherited Create(AOwner);

    Self.Id_Man_Moving := id_man_Moving;

    ResultQuery.Transaction := ReadTransaction;
    WorkQuery.Transaction := WriteTransaction;

    ResultQuery.Params.ParamValues['Id_Man_Moving'] := Id_Man_Moving;
    RefreshButton.Click;
    CancelButton.Align := alRight;
end;

procedure TWorkModeChangesForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TWorkModeChangesForm.FormResize(Sender: TObject);
begin
    GridResize(ChangesGrid);
end;

procedure TWorkModeChangesForm.ChangesGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin

    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Work_mode_Change: ' + IntToStr(REsultQuery['Id_Work_mode_Change']));
    except
    end;
end;

procedure TWorkModeChangesForm.InsertActionExecute(Sender: TObject);
var
    Form: TAddWorkModeChangeForm;
begin
    if CheckAccess('/ROOT/Table', 'Edit', True) <> 0 then Exit;

    Form := TAddWorkModeChangeForm.create(self, -1, emNew);

    Form.Id_Man_Moving := self.Id_Man_Moving;

    if Form.ShowModal = mrOk
        then begin
        ResultQuery.close;
        ResultQuery.open;

        REsultQuery.Locate('ID_WORK_MODE_CHANGE', Form.Id_Work_Mode_Change, []);
    end;

    Form.Free;

end;

procedure TWorkModeChangesForm.ModifyActionExecute(Sender: TObject);
var
    Form: TAddWorkModeChangeForm;
begin
    if CheckAccess('/ROOT/Table', 'Edit', True) <> 0 then Exit;

    if ResultQuery.IsEmpty
        then begin
        exit;
    end;

    if (not AdminMode) and (not Developer) and (not CheckForFillBool(ResultQueryID_ORDER.Value = -1, 'Цей графік було створено за наказом і його редагування можливе тільки при редагуванні наказу!'))
        then exit;

    Form := TAddWorkModeChangeForm.create(self, ResultQueryID_WORK_MODE_CHANGE.Value, emModify);

    if Form.ShowModal = mrOk
        then begin
        ResultQuery.close;
        ResultQuery.open;

        REsultQuery.Locate('ID_WORK_MODE_CHANGE', Form.Id_Work_Mode_Change, []);
    end;

    Form.Free;
end;

procedure TWorkModeChangesForm.DelActionExecute(Sender: TObject);
begin
    if CheckAccess('/ROOT/Table', 'Edit', True) <> 0 then Exit;

    if GoodFunctionsUnit.CheckQueryForDel(ResultQuery) = False
        then exit;

    if (not AdminMode) and (not Developer) and (not CheckForFillBool(ResultQueryID_ORDER.Value = -1, 'Цей графік було створено за наказом і його можна вилучити тільки з наказом!'))
        then exit;

    WorkQuery.Close;
    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_WORK_MODE_CHANGE_DELETE(' +
        IntToStr(ResultQueryID_WORK_MODE_CHANGE.Value) + ')';
    ExecQuery(WorkQuery);

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TWorkModeChangesForm.ViewActionExecute(Sender: TObject);
var
    Form: TAddWorkModeChangeForm;
begin
    if ResultQuery.IsEmpty
        then begin
        exit;
    end;

    Form := TAddWorkModeChangeForm.create(self, ResultQueryID_WORK_MODE_CHANGE.Value, emView);

    Form.ShowModal;

    Form.Free;
end;

procedure TWorkModeChangesForm.RefreshActionExecute(Sender: TObject);
begin
    ResultQuery.Close;
    ResultQuery.Open;
    GridResize(ChangesGrid);
end;

end.
