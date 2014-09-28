unit AddWorkModeChange;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, Grids, Spin, SpComboBox, ComCtrls, DB,
    IBCustomDataSet, IBQuery, FieldControl, SpCommon, PersonalCommon,
    GoodFunctionsUnit, WorkModeCentral, ExtCtrls;

type
    TAddWorkModeChangeForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        ResultQuery: TIBQuery;
        WriteQuery: TIBQuery;
        ResultQueryID_ORDER: TIntegerField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryRMOVING: TIntegerField;
        ResultQueryID_WORK_MODE: TIntegerField;
        ResultQuerySHIFT: TIntegerField;
        ResultQueryDATE_BEG: TDateField;
        ResultQueryDATE_END: TDateField;
        ResultQueryREASON: TIBStringField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryIS_ACTIVE: TIntegerField;
        ResultQueryPIDSTAVA: TIBStringField;
        ResultQueryFIO: TIBStringField;
        ResultQueryWHY: TIBStringField;
        ResultQueryDEPARTMENT_NAME: TIBStringField;
        ResultQueryPOST_NAME: TIBStringField;
        ResultQueryWORK_MODE_NAME: TIBStringField;
        ResultQueryTN: TIntegerField;
        ResultQueryID_PCARD: TIntegerField;
        Panel1: TPanel;
        Label3: TLabel;
        Label2: TLabel;
        Label6: TLabel;
        Label4: TLabel;
        Label9: TLabel;
        GroupBox2: TGroupBox;
        RadioButton1: TRadioButton;
        RadioButton2: TRadioButton;
        DateBeg: TDateTimePicker;
        DateEnd: TDateTimePicker;
        WorkModeBox: TSpComboBox;
        ShiftSpin: TSpinEdit;
        PidstavaEdit: TEdit;
        WorkModeGrid: TStringGrid;
        Label7: TLabel;
        UseKolStavokBox: TCheckBox;
        ResultQueryUSE_KOL_STAVOK: TIntegerField;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        constructor Create(aOwner: TComponent; aId_Work_Mode_Change: Integer; FMode: TEditMode); reintroduce;
        procedure WorkModeBoxChange(Sender: TObject);
        procedure RadioButton2Click(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);

    private
        Use_Kol_Stavok: Integer;

    public

        Mode: TEditMode;
        Id_Work_Mode_Change: Integer;
        Real_Shift: Integer;
        ID_ORDER: Integer;
        Num_Item: Integer;
        Id_Man_Moving: Integer;
    end;

var
    AddWorkModeChangeForm: TAddWorkModeChangeForm;

implementation

uses Math;

{$R *.dfm}

constructor TAddWorkModeChangeForm.Create(aOwner: TComponent; aId_Work_Mode_Change: Integer; FMode: TEditMode);
begin
    inherited Create(aOwner);

    Mode := FMode;

    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    WriteQuery.Transaction := PersonalCommon.WriteTransaction;

    Id_Work_Mode_Change := aId_Work_Mode_Change;

    if Mode = emNew then
    begin
        DateBeg.Date := Date;
        DateEnd.Date := Date;

        WorkModeBox.Prepare(-1, '');
        ShiftSpin.Value := 0;

        PidstavaEdit.Text := '';
    end;

    if (Mode = emModify) or (Mode = emView)
        then
    begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_WORK_MODE_CHANGE'] := aId_Work_Mode_Change;
        ResultQuery.Open;

        DateBeg.Date := ResultQueryDATE_BEG.Value;
        DateEnd.Date := ResultQueryDATE_END.Value;

        WorkModeBox.Prepare(ResultQueryID_WORK_MODE.Value, ResultQueryWORK_MODE_NAME.Value);

 //       ShiftSpin.Value := ConvertShift(ResultQuerySHIFT.Value, ResultQueryDATE_BEG.Value, True);

             // берем реальную фишку
            // нормализовать сдвижку
        WorkModeCenter.Id_Work_Mode := ResultQueryID_WORK_MODE.Value;
        WorkModeCenter.Shift := ResultQuerySHIFT.Value;
        ShiftSpin.Value := WorkModeCenter.NormalizedShift;

        DrawWorkModeExample(WorkModeGrid, DateBeg.Date,
            DateEnd.Date, WorkModeBox.GetId, ShiftSpin.Value, 100);


        PidstavaEdit.Text := ResultQueryPIDSTAVA.Value;

        if ResultQuery['Use_Kol_Stavok'] = 0 then UseKolStavokBox.Checked := False
        else UseKolStavokBox.Checked := True;

        if ResultQueryDATE_END.Value = PersonalCommon.Consts_Query['DATE_END']
            then
            RadioButton1.Checked := True
        else
            RadioButton1.Checked := False;
    end;

    Panel1.Enabled := not (FMode = emView);
end;

procedure TAddWorkModeChangeForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TAddWorkModeChangeForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    WorkModeBox.SaveIntoRegistry;
end;

procedure TAddWorkModeChangeForm.WorkModeBoxChange(Sender: TObject);
begin
    if (WorkModeBox.GetId <> -1) and (DateBeg.Date <= DateEnd.Date)
        then
    begin
        Real_Shift := DrawWorkModeExample(WorkModeGrid, DateBeg.Date,
            DateEnd.Date, WorkModeBox.GetId, ShiftSpin.Value, 100);
        WorkModeCenter.Id_Work_Mode := WorkModeBox.GetId;
        WorkModeCenter.Shift := Real_Shift;
        Real_Shift := WorkModeCenter.NormalizedShift;
    end;
end;

procedure TAddWorkModeChangeForm.RadioButton2Click(Sender: TObject);
begin
    if RadioButton1.Checked
        then
    begin
        DateEnd.Visible := False;
        DateEnd.Date := EncodeDate(2150, 12, 31);
    end
    else
    begin
        DateEnd.Visible := True;
        DateEnd.Date := DateBeg.Date;
    end;
end;

procedure TAddWorkModeChangeForm.OkButtonClick(Sender: TObject);
begin

    if not CheckForFillBool(WorkModeBox.GetId <> -1, 'Потрібно вибрати режим праці!')
        then exit;

    if not CheckForFillBool(DateBeg.Date <= DateEnd.Date, 'Дата кінця не може бути більше ніж дата початку!')
        then exit;

    if not CheckForFill(PidstavaEdit, 'Підстава')
        then exit;

    if UseKolStavokBox.Checked then
        Use_Kol_Stavok := 1
    else
        Use_Kol_Stavok := 0;

    if Mode = emNew then
    begin
        WriteQuery.Close;
        WriteQuery.SQL.Text := 'select ID_WORK_MODE_CHANGE from ' +
            'DT_WORK_MODE_CHANGE_INSERT_2(' +
            IntToStr(ID_MAN_MOVING) + ',' +
            IntToStr(WorkModeBox.GetId) + ',' +
            IntToStr(Real_Shift) + ',' +
            QuotedStr(DateToStr(DateBeg.Date)) + ',' +
            QuotedStr(DateToStr(DateEnd.date)) + ',' +
            QuotedStr('Не за наказом') + ',' +
            IntToStr(-1) + ',' +
            IntToStr(1) + ',' +
            IntToStr(5) + ',' +
            QuotedStr(PidstavaEdit.Text) + ',' +
            QuotedStr(PidstavaEdit.Text) + ',' +
            IntToStr(Use_Kol_Stavok) + ')';

        id_work_mode_change := ExecQuery(WriteQuery);
    end;

    if Mode = emModify then
    begin
        WriteQuery.Close;
        WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_WORK_MODE_CHANGE_UPDATE_3(' +
            IntToStr(Id_Work_Mode_Change) + ',' +
            IntToStr(ResultQueryID_MAN_MOVING.value) + ',' +
            IntToStr(WorkModeBox.GetId) + ',' +
            IntToStr(Real_Shift) + ',' +
            QuotedStr(DateToStr(DateBeg.Date)) + ',' +
            QuotedStr(DateToStr(DateEnd.date)) + ',' +
            QuotedStr(ResultQueryREASON.Value) + ',' +
            IntToStr(ResultQueryID_ORDER.Value) + ',' +
            IntToStr(ResultQueryNUM_ITEM.Value) + ',' +
            IntToStr(ResultQueryIS_ACTIVE.Value) + ',' +
            QuotedStr(PidstavaEdit.Text) + ',' +
            QuotedStr(ResultQueryWHY.Value) + ',' +
            IntToStr(Use_Kol_Stavok) + ')';

        ExecQuery(WriteQuery);
    end;

    ModalREsult := mrOk;
end;

end.
