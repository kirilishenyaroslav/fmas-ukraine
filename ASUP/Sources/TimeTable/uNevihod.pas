unit uNevihod;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, Mask, CheckEditUnit, SpComboBox, DB,
    IBCustomDataSet, IBQuery, DateUtils, PersonalCommon, FieldControl,
    EditControl, SpCommon;

type
    TIntArray = array of Integer;

    TfmNevihod = class(TForm)
        FIOLabel: TLabel;
        Label1: TLabel;
        ReasonEdit: TEdit;
        Label2: TLabel;
        VihodBox: TSpComboBox;
        Label3: TLabel;
        DaysEdit: TCheckEdit;
        AddButton: TBitBtn;
        CancelButton: TBitBtn;
        Label4: TLabel;
        SelectNevihod: TIBQuery;
        FC_Reason: TFieldControl;
        FC_Vihod: TFieldControl;
        FC_Days: TFieldControl;
        DeleteButton: TBitBtn;
        FC_Id_Man_Moving: TFieldControl;
        AllMemo: TMemo;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure AddButtonClick(Sender: TObject);
    private
        Id_Man_Moving: Integer;
        Month_Beg: TDate;
        Month_End: TDate;

        EditControl: TEditControl;
    public
        constructor Create(AOwner: TComponent; Id_Man_Moving: Integer;
            FIO: string; Month_Beg, Month_End: TDate); reintroduce;

        procedure Refresh;
    end;

var
    fmNevihod: TfmNevihod;

implementation

procedure TfmNevihod.Refresh;
var
    vihod: Integer;
    Reason: string;
    s: string;
begin
    SelectNevihod.Transaction := ReadTransaction;
    SelectNevihod.Close;
    with SelectNevihod.Params do
    begin
        ParamByName('Id_Man_Moving').AsInteger := Id_Man_Moving;
        ParamByName('Month_Beg').AsDate := Month_Beg;
        ParamByName('Month_End').AsDate := Month_End;
    end;
    SelectNevihod.Open;

    AllMemo.Lines.Clear;
    vihod := -1;
    Reason := '';
    s := '';

    SelectNevihod.Open;
    SelectNevihod.First;
    while not SelectNevihod.Eof do
    begin
        if (SelectNevihod['Id_Vihod'] <> vihod) or
            (SelectNevihod['Reason'] <> Reason) then
        begin
            vihod := SelectNevihod['Id_Vihod'];
            Reason := SelectNevihod['Reason'];

            if s <> '' then AllMemo.Lines.Add(s);
            s := '';
            AllMemo.Lines.Add(SelectNevihod['Name_Full'] + '(' +
                SelectNevihod['Name_Short'] + ') - ' + SelectNevihod['Reason']);
        end;

        if s <> '' then s := s + ', ';
        s := s + IntToStr(DayOfTheMonth(SelectNevihod['Nev_Date']));

        SelectNevihod.Next;
    end;
    if s <> '' then AllMemo.Lines.Add(s);
end;

constructor TfmNevihod.Create(AOwner: TComponent; Id_Man_Moving: Integer;
    FIO: string; Month_Beg, Month_End: TDate);
begin
    inherited Create(AOwner);

    Self.Id_Man_Moving := Id_Man_Moving;
    FIOLabel.Caption := FIO;
    Self.Month_Beg := Month_Beg;
    Self.Month_End := Month_End;

    EditControl := TEditControl.Create;
    EditControl.Add([FC_Id_Man_Moving, FC_Reason, FC_Vihod, FC_Days]);
    EditControl.Prepare(emNew);

    FC_Id_Man_Moving.Value := Id_Man_Moving;

    Refresh;
end;

{$R *.dfm}

procedure TfmNevihod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    VihodBox.SaveIntoRegistry;
    EditControl.Free;
end;

function SplitString(Src: string; Min, Max: Integer;
    var Res: TIntArray; Separator: Char = ','): string;
var
    p: Integer;
    int: Integer;
    s: string;
begin
    Result := '';
    SetLength(Res, 0);

    s := Src;
    while Trim(s) <> '' do
    begin
        p := Pos(',', s);
        try
            if p <> 0 then
            begin
                int := StrToInt(Copy(s, 1, p - 1));
                s := Copy(s, p + 1, Length(s));
            end
            else
            begin
                int := StrToInt(s);
                s := '';
            end;
        except
            Result := 'Потрібно ввести числове значення!';
            Exit;
        end;

        if (int < Min) or (int > Max) then
        begin
            Result := 'Одне з чисел за межами діапазону!';
            Exit;
        end;

        SetLength(Res, Length(Res) + 1);
        Res[High(Res)] := int;
    end;
end;

procedure TfmNevihod.AddButtonClick(Sender: TObject);
var
    MaxDay: Integer;
    days: TIntArray;
    res: string;
    i: Integer;
begin
    if CheckAccess('/ROOT/Table', 'Edit', True) <> 0 then Exit;

    if CheckAccess('/ROOT/Table', 'Edit', True) <> 0 then Exit;

    FC_Days.Required := Sender = AddButton;
    EditControl.Read;
    if not EditControl.CheckFill then Exit;

    if Sender = DeleteButton then
        if MessageDlg('Ви справді бажаєте вилучити дані по невиходам за заданою'
            + ' підставою та типом невиходу?', mtError, [mbYes, mbNo], 0) = mrNo
            then Exit;

    MaxDay := DaysInAMonth(YearOf(Month_Beg), MonthOf(Month_Beg));
    res := SplitString(DaysEdit.Text, 1, MaxDay, days);
    if res <> '' then
    begin
        MessageDlg(res, mtError, [mbOk], 0);
        Exit;
    end;

    WriteTransaction.StartTransaction;
    try
        FC_Days.NeedUpdate := False;
        EditControl.ExecProc('Dt_Nevihod_Delete', []);
        FC_Days.NeedUpdate := True;

        if Sender = AddButton then
            for i := 0 to High(days) do
            begin
                FC_Days.Value := EncodeDate(YearOf(Month_Beg), MonthOf(Month_Beg), days[i]);
                EditControl.ExecProc('Dt_Nevihod_Insert', []);
            end;
    except on e: Exception do
        begin
            MessageDlg('Не вдалося провести операцію з базою даних: ' + e.Message,
                mtError, [mbOk], 0);
            WriteTransaction.Rollback;
            Exit;
        end;
    end;
    WriteTransaction.Commit;
    Refresh;
end;

end.
