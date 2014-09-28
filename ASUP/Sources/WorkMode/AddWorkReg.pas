
{ -$Id: AddWorkReg.pas,v 1.5 2006/12/12 14:54:31 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                  Модуль "Добавление расшифровки режима работы"               }
{         Ввод числа рабочих часов по графику выбранного режима работы         }
{                                                  ответственный: Олег Волков  }

unit AddWorkReg;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon, Spin,
    ComCtrls, DateUtils, Buffer, SpTimeUtils, Variants, WorkModeCentral;

type
    TAddWorkRegForm = class(TAddForm)
        Label2: TLabel;
        Label3: TLabel;
        FC_WorkEnd: TFieldControl;
        FC_WorkBeg: TFieldControl;
        DaySpinEdit: TSpinEdit;
        DetailsQueryID_WORK_MODE: TIntegerField;
        DetailsQueryWORK_BEG: TTimeField;
        DetailsQueryWORK_END: TTimeField;
        HolidayBox: TCheckBox;
        BufferQuery: TIBQuery;
        WorkBegEdit: TCheckEdit;
        WorkEndEdit: TCheckEdit;
        Label1: TLabel;
        BreakBegEdit: TCheckEdit;
        FC_BreakBeg: TFieldControl;
        Label4: TLabel;
        BreakEndEdit: TCheckEdit;
        FC_BreakEnd: TFieldControl;
        DetailsQueryBREAK_BEG: TTimeField;
        DetailsQueryBREAK_END: TTimeField;
        Label5: TLabel;
        HoursDecEdit: TCheckEdit;
        RecalcButton: TButton;
        FC_Today_Hours: TFieldControl;
        FC_Tomorrow_Hours: TFieldControl;
        procedure DaysBoxClick(Sender: TObject);
        procedure DaysBoxEnter(Sender: TObject);
        procedure HolidayBoxClick(Sender: TObject);
        procedure WorkBegEditChange(Sender: TObject);
        procedure RecalcButtonClick(Sender: TObject);
    published
        Id_Day_WeekLabel: TLabel;
        HoursLabel: TLabel;
        DetailsQuery: TIBQuery;
        DetailsQueryId_Day_Week: TIntegerField;
        FC_Id_Day_Week: TFieldControl;
        HoursEdit: TCheckEdit;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Work_Mode: Integer;
        Id_Day: Integer;

        Recalc: Boolean;

        procedure Prepare(Mode: TEditMode; id: Integer); override;
        procedure Prepare(Mode: TEditMode; WorkMode, Day: Integer); overload;
        function GetId: Integer; override;
    end;

var
    AddWorkRegForm: TAddWorkRegForm;

implementation

{$R *.DFM}

uses uBuffer2;

procedure TAddWorkRegForm.Prepare(Mode: TEditMode; id: Integer);
begin
end;

procedure TAddWorkRegForm.Prepare(Mode: TEditMode; WorkMode, Day: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати розшифровку режиму праці'
    else if Mode = emModify then Caption := 'Змінити розшифровка режиму праці'
    else Caption := 'Додаткова інформація по розшифровці режиму праці';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    BufferQuery.Transaction := BufferTransaction;

    Id_Work_Mode := WorkMode;
    Id_Day := Day;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Work_Mode'] := WorkMode;
            Params.ParamValues['Id_Day'] := Day;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    Recalc := True;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Id_Day_Week, FC_WorkBeg, FC_WorkEnd, FC_BreakBeg,
        FC_BreakEnd, FC_Today_Hours, FC_Tomorrow_Hours]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    if Mode = emNew then
    begin
        WorkBegEdit.Text := '8:00';
        WorkEndEdit.Text := '16:00';
        HoursEdit.Text := '8:00';
    end;

    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

function TAddWorkRegForm.GetId: Integer;
begin
    Result := Id_Work_Mode;
end;

procedure TAddWorkRegForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TAddWorkRegForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    ID_PBKey: Integer;
    reg: TWorkReg;
    t: TWorkTime;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
    hack24: Boolean;
begin
    hack24 := False;
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if (VarIsNull(FC_BreakBeg.Value) <> VarIsNull(FC_BreakEnd.Value)) or
            (not VarIsNull(FC_BreakBeg.Value) and not VarIsNull(FC_BreakEnd.Value)
            and not PeriodInside(UniTime(FC_BreakBeg.Value), UniTime(FC_BreakEnd.Value),
            UniTime(FC_WorkBeg.Value), UniTime(FC_WorkEnd.Value))) then
        begin
            MessageDlg('Невірно задана перерва!', mtError, [mbOk], 0);
            ModalResult := 0;
            Exit;
        end;

        reg.Work_Beg := StringToTime(WorkBegEdit.Text);
        reg.Work_End := StringToTime(WorkEndEdit.Text);
        if Trim(WorkBegEdit.Text) <> '' then
        begin
            reg.Break_Beg := StringToTime(BreakBegEdit.Text);
            reg.Break_End := StringToTime(BreakEndEdit.Text);
        end;

        t := TWorkTime.Create(0, 1);
        t.CalcTime(reg);

        FC_Today_Hours.Value := 24 * t.Today_Hours;
        FC_Tomorrow_Hours.Value := 24 * t.Tomorrow_Hours;
        t.Free;

        BufTran2 := nil;
        if WriteTransaction.InTransaction then WriteTransaction.Rollback;
        WriteTransaction.StartTransaction;
        try
            if Mode = emNew then
                ok := FormControl.ExecProc('Dt_WorkReg_Insert', [Id_Work_Mode])
            else ok := FormControl.ExecProc('Dt_WorkReg_Update', [Id_Work_Mode]);

            if not ok then raise Exception.Create('');

            if ok and not DontWriteToDbf then
            begin
                BufferQuery.Transaction := WriteTransaction;
                BufferQuery.Close;
                BufferQuery.ParamByName('Id_Work_Mode').AsInteger := Id_Work_mode;
                BufferQuery.Open;

                First_PBKey := BufferQuery['First_PBKey'];
                Last_PBKey := BufferQuery['Last_PBKey'];

                BufTran2 := TBufferTransaction2.
                    Create('DT_TIME,HOSPITAL,HOSP_DET,SP_TIME',
                    'BUFF_DT_TIME,BUF_HOSPITAL,BUF_HOSP_DET,BUFF_SP_TIME',
                    WriteTransaction);
                BufTran2.WriteRange(First_PBKey, Last_PBKey);
            end;
            WriteTransaction.Commit;

        except on e: Exception do
            begin
                WriteTransaction.Rollback;
                if BufTran2 <> nil then BufTran2.RollbackOnError;

                MessageDlg('При занесенні інформації виникла помилка: ' +
                    e.Message, mtError, [mbOk], 0);
                ModalResult := 0;
                Exit;
            end;
        end;
        if BufTran2 <> nil then BufTran2.Free;

        WorkModeCenter.ReLoad;
        Exit;
    end
    else ModalResult := 0;
end;

procedure TAddWorkRegForm.DaysBoxClick(Sender: TObject);
begin
    if Mode = emModify then WorkBegEdit.SetFocus;
end;

procedure TAddWorkRegForm.DaysBoxEnter(Sender: TObject);
begin
    if Mode = emModify then WorkBegEdit.SetFocus;
end;

procedure TAddWorkRegForm.HolidayBoxClick(Sender: TObject);
begin
    if HolidayBox.Checked then
    begin
        WorkBegEdit.Text := '8:00';
        WorkEndEdit.Text := '8:00';
        BreakBegEdit.Text := '';
        BreakEndEdit.Text := '';
    end;
end;

procedure TAddWorkRegForm.WorkBegEditChange(Sender: TObject);
var
    wb, we, bb, be, t: TTime;
begin
    if Recalc then
    try
        wb := StringToTime(WorkBegEdit.Text);
        we := StringToTime(WorkEndEdit.Text);
        bb := StringToTime(BreakBegEdit.Text);
        be := StringToTime(BreakEndEdit.Text);
        t := TimeDiff(wb, we) - TimeDiff(bb, be);
        HoursEdit.Text := EncodeTimeString(t, False);
        HoursDecEdit.Text := FloatToStr(24 * t);
    except
    end;
end;

procedure TAddWorkRegForm.RecalcButtonClick(Sender: TObject);
var
    wb, we, bb, be, t: TTime;
begin
    try
        wb := StringToTime(WorkBegEdit.Text);
        we := StringToTime(WorkEndEdit.Text);
        bb := StringToTime(BreakBegEdit.Text);
        be := StringToTime(BreakEndEdit.Text);
        t := TimeDiff(wb, we) - TimeDiff(bb, be);
        if HoursDecEdit.Text <> FloatToStr(24 * t) then
        begin
            t := StrToFloat(HoursDecEdit.Text) / 24;
            HoursEdit.Text := EncodeTimeString(t, False);
        end
        else
            if HoursEdit.Text <> EncodeTimeString(t, False) then
            begin
                t := StringToTime(HoursEdit.Text);
                HoursDecEdit.Text := FloatToStr(t * 24);
            end;
        Recalc := False;
        WorkEndEdit.Text := EncodeTimeString(wb + t + TimeDiff(bb, be), False);
        Recalc := True;
    except
    end;
end;

initialization
    RegisterClass(TAddWorkRegForm);
end.
