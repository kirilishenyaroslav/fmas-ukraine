
{ -$Id: WorkReg.pas,v 1.6 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Расшифровка режима работы"                      }
{                    Отображение расшифровки режима работы                     }
{                                                  ответственный: Олег Волков  }

unit WorkReg;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, Grids, DBGrids, Buttons,
    StdCtrls, ExtCtrls, SpComboBox, SpCommon, AddWorkReg, PersonalCommon,
    SpTimeUtils, Variants, uSearchFrame;

type
    TWorkRegForm = class(TSpForm)
        Panel1: TPanel;
        Label1: TLabel;
        WorkModeBox: TSpComboBox;
        ResultQueryID_DAY_WEEK: TIntegerField;
        ResultQueryWORK_BEG: TTimeField;
        ResultQueryWORK_END: TTimeField;
        ResultQueryBREAK_BEG: TTimeField;
        ResultQueryBREAK_END: TTimeField;
        DecBox: TCheckBox;
        ResultQuerySmena: TStringField;
        ResultQueryHours: TStringField;
        ResultQueryTODAY_HOURS: TIBBCDField;
        ResultQueryTOMORROW_HOURS: TIBBCDField;
        BufferQuery: TIBQuery;
        procedure WorkModeBoxEnter(Sender: TObject);
        procedure WorkModeBoxChange(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure SpGridDblClick(Sender: TObject);
        procedure ResultQueryCalcFields(DataSet: TDataSet);
        procedure SpGridDrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure ResultQueryWORK_BEGGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure ResultQueryAfterOpen(DataSet: TDataSet);
        procedure DecBoxClick(Sender: TObject);
    private
        procedure ShowChangeForm(Mode: TEditMode);
    public
        Night_Beg, Night_End: TTime;
        nextHours: Double;
    end;

var
    WorkRegForm: TWorkRegForm;

implementation

{$R *.DFM}

uses uBuffer2, Buffer;

procedure TWorkRegForm.WorkModeBoxEnter(Sender: TObject);
begin
    if spfCantRemoveFilter in Params.SpMode then
        SpGrid.SetFocus;
end;

procedure TWorkRegForm.WorkModeBoxChange(Sender: TObject);
begin
    if (ResultQuery <> nil) and (ResultQuery.Transaction <> nil)
        and (WorkModeBox.ItemIndex > 0) then
    begin
        ResultQuery.Params.ParamValues['Id_Work_Mode'] :=
            WorkModeBox.GetId;
        Refresh;
    end;
end;

procedure TWorkRegForm.AddButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    ShowChangeForm(emNew);
end;

 // показать форму на редактирование в нужном режиме

procedure TWorkRegForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddWorkRegForm;
    WorkMode, Day, newDay: Integer;
begin
    WorkMode := WorkModeBox.GetId;
    if WorkMode <= 0 then Exit;

    if ResultQuery.IsEmpty then Day := -1
    else Day := ResultQuery['Id_Day_Week'];

    newDay := 1;
    if (Mode = emNew) and not ResultQuery.IsEmpty then
    begin
        ResultQuery.Last;
        newDay := ResultQuery['Id_Day_Week'] + 1;
        ResultQuery.Locate('Id_Day_Week', Day, []);
    end;

    form := TAddWorkRegForm.Create(Self);
    form.Prepare(Mode, WorkMode, Day);
    if Mode = emNew then form.DaySpinEdit.Value := newDay;

    if form.ShowModal = mrOk then Refresh;
    form.Free;
end;

procedure TWorkRegForm.ModifyButtonClick(Sender: TObject);
begin
    if not GPP_Check then Exit;
    if not ResultQuery.IsEmpty then ShowChangeForm(emModify);
end;

procedure TWorkRegForm.DeleteButtonClick(Sender: TObject);
var
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    if not GPP_Check then Exit;
    if Params = nil then Exit;

    if ResultQuery.IsEmpty then
    begin
        MessageDlg('Довідник пустий!', mtError, [mbOk], 0);
        Exit;
    end;

    if Params.ReadOnly or not (spfDelete in Params.SpMode) then
    begin
        MessageDlg('Вилучення з цього довідника неможливе!',
            mtError, [mbOk], 0);
        Exit;
    end;

    if (MessageDlg('Чи ви справді бажаєте цей запис ?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
        WorkQuery.Transaction := WriteTransaction;
        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE Dt_WorkReg_Delete ' +
            IntToStr(WorkModeBox.GetId()) + ', ' +
            IntToStr(ResultQuery['Id_Day_Week']);

        if WriteTransaction.InTransaction then WriteTransaction.Rollback;
        WriteTransaction.StartTransaction;

        BufTran2 := nil;
        try
            ExecQuery(WorkQuery);

            if not DontWriteToDbf then
            begin
                BufferQuery.Transaction := WriteTransaction;
                BufferQuery.Close;
                BufferQuery.ParamByName('Id_Work_Mode').AsInteger := WorkModeBox.GetId();
                BufferQuery.Open;

                First_PBKey := BufferQuery['First_PBKey'];
                Last_PBKey := BufferQuery['Last_PBKey'];

                BufTran2 := TBufferTransaction2.
                    Create('DT_TIME,HOSPITAL,HOSP_DET,SP_TIME', 'BUFF_DT_TIME,BUF_HOSPITAL,BUF_HOSP_DET,BUFF_SP_TIME', WriteTransaction);
                BufTran2.WriteRange(First_PBKey, Last_PBKey);
            end;
            WriteTransaction.Commit;

        except on E: Exception do
            begin
                WriteTransaction.Rollback;
                if BufTran2 <> nil then BufTran2.RollbackOnError;

                MessageDlg('При вилученні з бази даних виникла помилка: '
                    + E.Message, mtError, [mbOk], 0);
            end;
        end;
        if BufTran2 <> nil then BufTran2.Free;

        Refresh;
    end;
end;

procedure TWorkRegForm.SpGridDblClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then ModifyButton.Click;
end;

procedure TWorkRegForm.ResultQueryCalcFields(DataSet: TDataSet);
var
    t, today_beg, today_end, br_beg, br_end, hours, tom_beg, tom_end: TTime;
begin
{    t :=
        TimeDiff(ResultQuery['Work_Beg'], ResultQuery['Work_End']);
    if not VarIsNull(ResultQuery['Break_Beg']) then
        t := t - TimeDiff(ResultQuery['Break_Beg'], ResultQuery['Break_End']);
    ResultQuery['Smena'] := EncodeTimeString(t, DecBox.Checked);

    SplitHours(ResultQuery['Work_Beg'], ResultQuery['Work_End'], False, today_beg, today_end);
    SplitHours(ResultQuery['Work_Beg'], ResultQuery['Work_End'], True, tom_beg, tom_end);
    if not VarIsNull(ResultQuery['Break_Beg']) then
        SplitHours(ResultQuery['Break_Beg'], ResultQuery['Break_End'], False, br_beg, br_end)
    else
    begin
        br_beg := 0;
        br_end := 0;
    end;

    hours := NextHours + (today_end - today_beg);
    if hours > 0 then
        hours := hours - (br_end-br_beg);

    ResultQuery['Hours'] := EncodeTimeString(hours, DecBox.Checked);

    NextHours := tom_end - tom_beg;}
    ResultQuery['Hours'] := ResultQuery['Today_Hours'] + NextHours;
    ResultQuery['Smena'] := ResultQuery['Today_Hours'] +
        ResultQuery['Tomorrow_Hours'];
    NextHours := ResultQuery['Tomorrow_Hours'];
end;

procedure TWorkRegForm.SpGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    with SpGrid.Canvas.Brush do
        if gdSelected in State then Color := clBlack
        else
            if ResultQuery['Hours'] = '' then Color := clWhite
            else
                if ResultQuery['Work_Beg'] > ResultQuery['Work_End'] then
                    Color := clSkyBlue
                else Color := clInfoBk;
    SpGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State)
end;

procedure TWorkRegForm.ResultQueryWORK_BEGGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if not ResultQuery.IsEmpty and
        (ResultQuery['Work_Beg'] = ResultQuery['Work_End']) then
        Text := 'вихідний'
    else Text := Sender.AsString;
end;

procedure TWorkRegForm.ResultQueryAfterOpen(DataSet: TDataSet);
begin
    inherited;
    NextHours := 0;
end;

procedure TWorkRegForm.DecBoxClick(Sender: TObject);
begin
    Refresh;
end;

end.
