unit ManComandFactEditUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, Buttons,
    ExtCtrls, PersonalCommon, SpCommon;

type
    TManComandFactEditForm = class(TForm)
        MiddlePanel: TPanel;
        ButtonsPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        Label5: TLabel;
        ResultQuery2: TIBQuery;
        DataSource2: TDataSource;
        CenterPanel: TPanel;
        Panel1: TPanel;
        Panel2: TPanel;
        Label1: TLabel;
        CancelButton: TSpeedButton;
        ResultQuery1: TIBQuery;
        DataSource1: TDataSource;
        CopyButton: TSpeedButton;
        CopyAllButton: TSpeedButton;
        ResultQuery1ID_MAN_COMAND_PLAN_DET: TIntegerField;
        ResultQuery1DATE_BEG: TDateField;
        ResultQuery1DATE_END: TDateField;
        ResultQuery1MESTO: TIBStringField;
        ResultQuery2ID_MAN_COMAND_FACT_DET: TIntegerField;
        ResultQuery2DATE_BEG: TDateField;
        ResultQuery2DATE_END: TDateField;
        ResultQuery2MESTO: TIBStringField;
        WriteQuery: TIBQuery;
        ResultQuery1MESTO2: TIBStringField;
        ResultQuery2MESTO2: TIBStringField;
        LeftGrid: TDBGrid;
        RightGrid: TDBGrid;
        procedure CancelButtonClick(Sender: TObject);
        constructor Create(aOwner: TComponent; aID_MAN_COMAND_PLAN: Integer); reintroduce;
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure CopyButtonClick(Sender: TObject);
        procedure CopyAllButtonClick(Sender: TObject);
        procedure LeftGridDblClick(Sender: TObject);
    private
    { Private declarations }
    public
        ID_MAN_COMAND_PLAN: Integer;
    end;

var
    ManComandFactEditForm: TManComandFactEditForm;

implementation

uses AddManComandPlanDet;

{$R *.dfm}

constructor TManComandFactEditForm.Create(aOwner: TComponent; aID_MAN_COMAND_PLAN: Integer);
begin
    inherited Create(aOwner);

    ResultQuery1.Transaction := PersonalCommon.ReadTransaction;
    ResultQuery2.Transaction := PersonalCommon.ReadTransaction;
    WriteQuery.Transaction := PersonalCommon.WriteTransaction;

    ID_MAN_COMAND_PLAN := aID_MAN_COMAND_PLAN;

    ResultQuery1.Close;
    ResultQuery1.Params.ParamValues['ID_MAN_COMAND_PLAN'] := ID_MAN_COMAND_PLAN;
    ResultQuery1.Open;

    ResultQuery2.Close;
    ResultQuery2.Params.ParamValues['ID_MAN_COMAND_PLAN'] := ID_MAN_COMAND_PLAN;
    ResultQuery2.Open;

    GridResize(LeftGrid);
    GridResize(RightGrid);
end;

procedure TManComandFactEditForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TManComandFactEditForm.AddButtonClick(Sender: TObject);
var
    Form: TAddManComandPlanDetForm;
    Date1: TDate;
begin
    if ResultQuery2.IsEmpty
        then begin
        ResultQuery1.First;
        Date1 := ResultQuery1DATE_BEG.Value;
    end
    else begin
        ResultQuery2.Last;
        Date1 := ResultQuery2DATE_END.Value + 1;
    end;

    Form := TAddManComandPlanDetForm.Create(Self, '', '', date1, date1, -1, ID_MAN_COMAND_PLAN, 'FACT');

    if Form.ShowModal = mrOk
        then begin
        ResultQuery2.Close;
        ResultQuery2.Open;
    end;

    Form.Free;
end;

procedure TManComandFactEditForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddManComandPlanDetForm;
begin
    if ResultQuery2.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        Exit;
    end;

    Form := TAddManComandPlanDetForm.Create(Self,
        ResultQuery2MESTO.Value,
        ResultQuery2MESTO2.Value,
        ResultQuery2DATE_BEG.Value,
        ResultQuery2DATE_END.Value,
        ResultQuery2ID_MAN_COMAND_FACT_DET.Value,
        ID_MAN_COMAND_PLAN, 'FACT');

    if Form.ShowModal = mrOk
        then begin
        ResultQuery2.Close;
        ResultQuery2.Open;
    end;

    Form.Free;
end;

procedure TManComandFactEditForm.DeleteButtonClick(Sender: TObject);
begin
    if ResultQuery2.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) = ID_NO
        then exit;

    WriteQuery.Close;
    WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_COMAND_FACT_DET_DELETE(' + IntToStr(ResultQuery2ID_MAN_COMAND_FACT_DET.Value) + ')';
    ExecQuery(WriteQuery);

    ResultQuery2.Close;
    ResultQuery2.Open;
end;

procedure TManComandFactEditForm.CopyButtonClick(Sender: TObject);
begin
    if ResultQuery1.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи ви справді бажаєте скопіювати вибраний запис?', mtConfirmation, [mbYes, mbNo], 0) = ID_NO
        then exit;

    WriteQuery.Close;
    WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_COMAND_FACT_DET_INSERT(' + IntToStr(ID_MAN_COMAND_PLAN) + ','
        + QuotedStr(DateToStr(ResultQuery1DATE_BEG.Value)) + ','
        + QuotedStr(DateToStr(ResultQuery1DATE_END.Value)) + ','
        + QuotedStr(ResultQuery1MESTO.Value) + ','
        + QuotedStr(ResultQuery1MESTO2.Value) + ')';
    ExecQuery(WriteQuery);

    ResultQuery2.Close;
    ResultQuery2.Open;
end;

procedure TManComandFactEditForm.CopyAllButtonClick(Sender: TObject);
begin
    if ResultQuery1.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи ви справді бажаєте скопіювати усі запис?', mtConfirmation, [mbYes, mbNo], 0) = ID_NO
        then exit;

    ResultQuery1.First;

    while not ResultQuery1.Eof
        do begin
        WriteQuery.Close;
        WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_COMAND_FACT_DET_INSERT(' + IntToStr(ID_MAN_COMAND_PLAN) + ','
            + QuotedStr(DateToStr(ResultQuery1DATE_BEG.Value)) + ','
            + QuotedStr(DateToStr(ResultQuery1DATE_END.Value)) + ','
            + QuotedStr(ResultQuery1MESTO.Value) + ','
            + QuotedStr(ResultQuery1MESTO2.Value) + ')';
        ExecQuery(WriteQuery);

        ResultQuery1.Next;
    end;

    ResultQuery2.Close;
    ResultQuery2.Open;
end;

procedure TManComandFactEditForm.LeftGridDblClick(Sender: TObject);
begin
    CopyButton.Click;
end;

end.
