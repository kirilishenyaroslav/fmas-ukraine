{ -$Id }
unit uTimeTable;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uTableFrame, uTableSelectFrame, Buttons, ExtCtrls,
    uTablePrint, PersonalCommon, TableCentral, cxControls, cxSplitter,
    uTableChangesPrint, ActnList;

type
    TfmTimeTable = class(TForm)
        ButtonsPanel: TPanel;
        ReportButton: TSpeedButton;
        WriteOneButton: TSpeedButton;
        CloseButton: TSpeedButton;
        NewButton: TSpeedButton;
        TableFrame: TfrmTable;
        TableSelectFrame: TfrmTableSelect;
        SignButton: TSpeedButton;
        cxSplitter1: TcxSplitter;
        WriteAllButton: TSpeedButton;
        TableChangesButton: TSpeedButton;
        ActionList1: TActionList;
        NewTable: TAction;
        TakeData: TAction;
        PrintTable: TAction;
        WriteOneAction: TAction;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure CloseButtonClick(Sender: TObject);
        procedure TableFrameNevihodButtonClick(Sender: TObject);
        procedure SignButtonClick(Sender: TObject);
        procedure TableFrameTableGridKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormShow(Sender: TObject);
        procedure WriteAllButtonClick(Sender: TObject);
        procedure TableChangesButtonClick(Sender: TObject);
        procedure NewTableExecute(Sender: TObject);
        procedure TakeDataExecute(Sender: TObject);
        procedure PrintTableExecute(Sender: TObject);
        procedure WriteOneActionExecute(Sender: TObject);
        procedure TableSelectFrameAcceptButtonClick(Sender: TObject);
    private
        procedure UpdateCounts;
    public
    end;

var
    fmTimeTable: TfmTimeTable;

implementation

{$R *.dfm}

uses WorkModeCentral;

procedure TfmTimeTable.UpdateCounts;
begin
    with TableSelectFrame do
        PeopleLabel.Caption := IntToStr(TableFrame.DistCount) +
            ' (' + IntToStr(TableFrame.NewCount) + '/' + IntToStr(TableFrame.Count)
            + ' незанес. ' + IntToStr(GetMonthMovingCount(Date_Beg, Date_End)) +
            ' усього)';
end;

procedure TfmTimeTable.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    TableSelectFrame.SaveState;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmTimeTable.FormCreate(Sender: TObject);
begin
    TableSelectFrame.LoadState;
    CloseButton.Align := alRight;
end;

procedure TfmTimeTable.CloseButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmTimeTable.TableFrameNevihodButtonClick(Sender: TObject);
begin
    TableFrame.NevihodButtonClick(Sender);
end;

procedure TfmTimeTable.SignButtonClick(Sender: TObject);
var
    Id_Table_Group: Integer;
begin
    if CheckAccess('/ROOT/Table', 'Edit', True) <> 0 then Exit;

    if TableSelectFrame.Signed then
    begin
        MessageDlg('Ця група табелів вже підписана!', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Ви справді бажаєте підписати цю групу табелів?',
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    if not TableSelectFrame.Loaded then
    begin
        MessageDlg('Спочатку треба отримати дані!', mtError, [mbOk], 0);
        Exit;
    end;

    if TableFrame.NewCount > 0 then
    begin
        MessageDlg('Потрібно занести усі табеля!', mtError, [mbOk], 0);
        Exit;
    end;


    if not TableFrame.OrdersCheck then Exit;

    WriteTransaction.StartTransaction;
    try
        Id_Table_Group := TableSelectFrame.Sign;
        TableFrame.AddToGroup(Id_Table_Group);
    except on e: Exception do
        begin
            MessageDlg('Під час запису у базу даних виникла помилка: ' + e.Message,
                mtError, [mbOk], 0);
            WriteTransaction.Rollback;
            Exit;
        end;
    end;
    WriteTransaction.Commit;
    TakeData.Execute;
end;

procedure TfmTimeTable.TableFrameTableGridKeyUp(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
//    if Key = VK_F2 then WriteOneButton.Click;
end;

procedure TfmTimeTable.FormShow(Sender: TObject);
begin
    if CheckAccess('/ROOT/Table', 'View', True) <> 0 then Close;
end;

procedure TfmTimeTable.WriteAllButtonClick(Sender: TObject);
var
    res: string;
begin
    if CheckAccess('/ROOT/Table', 'Edit', True) <> 0 then Exit;

    if MessageDlg('Ви справді бажаєте занести цю групу табелів?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    res := TableFrame.WriteAll(1, TableSelectFrame.Signed,
        TableSelectFrame.Id_Table_Group);
    UpdateCounts;
    if res <> '' then
        MessageDlg('При занесення табеля виникла помилка: ' + res,
            mtError, [mbOk], 0);
end;

procedure TfmTimeTable.TableChangesButtonClick(Sender: TObject);
var
    form: TfrmTableChangesPrint;
begin
    if CheckAccess('/ROOT/REPORTS/TABLECHANGESREPORT', 'View', True) <> 0 then Exit;

    form := TfrmTableChangesPrint.Create(Self);
    with form do
    begin
        AllBox.Checked := False;
        SelectFrame.CopyState(TableSelectFrame);
        DateBegPicker.Date := TableSelectFrame.Date_End;
        DateEndPicker.Date := Date;
        ShowModal;
        Free;
    end;
end;

procedure TfmTimeTable.NewTableExecute(Sender: TObject);
begin
    if CheckAccess('/ROOT/Table', 'Edit', True) = 0 then
        TableFrame.ReformCurrent;
end;

procedure TfmTimeTable.TakeDataExecute(Sender: TObject);
begin
    Calendar.ReLoad;
    WorkModeCenter.ReLoad;

    TableSelectFrame.AcceptButtonClick(Sender);
    if not TableSelectFrame.Loaded then Exit;
    with TableSelectFrame do
        TableFrame.Prepare(TableQuery, Date_Beg, Date_End);
    TableFrame.ShowTable;
    UpdateCounts;
end;

procedure TfmTimeTable.PrintTableExecute(Sender: TObject);
var
    form2: TfmTablePrint;
begin
    form2 := TfmTablePrint.Create(Self);
    with form2 do
    begin
        SelectFrame.CopyState(TableSelectFrame);
        ShowModal;
        Free;
    end;
end;

procedure TfmTimeTable.WriteOneActionExecute(Sender: TObject);
var
    res: string;
    comment: string;
    info: string;
begin
    if CheckAccess('/ROOT/Table', 'Edit', True) <> 0 then Exit;

    comment := '';
    info := '';
    if TableSelectFrame.Signed then
        info := 'Табель вже було підписано. '
    else
        if TableFrame.CurrentSigned then
            info := 'Табель на цю людину вже було підписано у іншому місці. '
        else info := '';

    if info <> '' then
    begin
        while Trim(comment) = '' do
            if not InputQuery('Введення коментаря',
                info + 'Введіть підставу для коректування табеля',
                comment) then Exit;
    end
    else comment := 'занесення табеля';

    res := TableFrame.WriteCurrent(1, comment, TableSelectFrame.Id_Table_Group);
    UpdateCounts;
    if res <> '' then
        MessageDlg('При занесення табеля виникла помилка: ' + res,
            mtError, [mbOk], 0);
end;


procedure TfmTimeTable.TableSelectFrameAcceptButtonClick(Sender: TObject);
begin
    Calendar.ReLoad;
    WorkModeCenter.ReLoad;

    TableSelectFrame.AcceptButtonClick(Sender);
    if not TableSelectFrame.Loaded then Exit;
    with TableSelectFrame do
        TableFrame.Prepare(TableQuery, Date_Beg, Date_End);
    TableFrame.ShowTable;
    UpdateCounts;
end;

end.
