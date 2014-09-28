
{ -$Id: WorkBookUnit.pas,v 1.4 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Информация по трудовым книжкам"                  }
{         Отображение,редактирование и добавление информации
{         по трудовым книжкам.                                                  }
{         Ответственный: Данил Збуривский                                      }

unit WorkBookUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, CheckLst,
    ComCtrls, PersonalCommon, EditControl, FieldControl, SpFormUnit, SpStajUnit,
    SpCommon, Mask, CheckEditUnit;

type
    TWorkBookForm = class(TForm)
        Label1: TLabel;
        Label2: TLabel;
        DateBegPicker: TDateTimePicker;
        DateEndPicker: TDateTimePicker;
        Label3: TLabel;
        Note: TMemo;
        StajListBox: TCheckListBox;
        Bevel1: TBevel;
        Label4: TLabel;
        AddButton: TSpeedButton;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        WorkDetailsQuery: TIBQuery;
        StajQuery: TIBQuery;
        WorkDetailsQueryID_MAN_WORK: TIntegerField;
        WorkDetailsQueryDATE_BEG: TDateField;
        WorkDetailsQueryDATE_END: TDateField;
        WorkDetailsQueryNOTE: TIBStringField;
        WorkDetailsQueryUSE_BEG: TDateField;
        WorkDetailsQueryUSE_END: TDateField;
        FC_DATE_BEG: TFieldControl;
        FC_DATE_END: TFieldControl;
        FC_NOTE: TFieldControl;
        WorkStajQuery: TIBQuery;
        WorkStajQueryID_STAJ: TIntegerField;
        WorkStajQueryNAME_STAJ: TIBStringField;
        WorkStajQueryIS_DEFAULT: TIBStringField;
        ChangeWorkStajQuery: TIBQuery;
        StajQueryID_STAJ: TIntegerField;
        StajQueryNAME_STAJ: TIBStringField;
        StajQueryIS_DEFAULT: TIBStringField;
        LastDateQuery: TIBQuery;
        LastDateQueryMAX: TDateField;
        DateCheckBox: TCheckBox;
        Label5: TLabel;
        NomerEdit: TCheckEdit;
        Label6: TLabel;
        OrderNumEdit: TCheckEdit;
        FC_NUMBER: TFieldControl;
        FC_ORDER_NUM: TFieldControl;
        WorkDetailsQueryNUMBER: TIntegerField;
        WorkDetailsQueryORDER_NUM: TIBStringField;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure DateCheckBoxClick(Sender: TObject);
        procedure DateEndPickerEnter(Sender: TObject);
    private
    { Private declarations }
    public
        WorkBookControl: TEditControl;
        Mode: TEditMode;
        IDWORK: Integer;
        IDPCARD: INTEGER;


        procedure Prepare(Mode: TEditMode; id_work: Integer; id_pcard: Integer);
        procedure BuildStajList();
        procedure RebuildStaJList();


    end;

var
    WorkBookForm: TWorkBookForm;

implementation


procedure TWorkBookForm.BuildStajList;
begin
    StajListBox.Clear;
    with StajQuery do
    begin
        Close;
        Open;
        First;
        while not Eof do
        begin
            StajListBox.Items.Add(FieldValues['Name_Staj']);
            Next;
        end;
    end;

    with WorkStajQuery do
    begin
        Params.ParamValues['id_man_work_book'] := IDWORK;
        Close;
        Open;
        RebuildStajList;
    end;

end;


procedure TWorkBookForm.RebuildStaJList;
var
    i: Integer;
begin
    for i := 0 to StajListBox.Items.Count - 1 do
        StajListBox.Checked[i] := False;
    if Mode = emNew then
    begin
        with StajListBox do
            for i := 0 to Items.Count - 1 do
            begin
                StajQuery.Locate('Name_Staj', Items[i], []);
                if StajQuery['Is_Default'] = 'T' then
                    StajListBox.Checked[i] := True;
            end;
    end
    else
    begin
        with StajListBox do
            for i := 0 to Items.Count - 1 do
            begin
                if WorkStajQuery.Locate('Name_Staj', Items[i], []) then
                    StajListBox.Checked[i] := True;
            end;
    end;
end;


procedure TWorkBookForm.Prepare(Mode: TEDitMode; id_work: Integer; id_pcard: Integer);
var
    Date: TDate;
begin
    Self.Mode := Mode;
    IDWORK := id_work;
    IDPCARD := id_pcard;
    if Mode = emView then
    begin
        Caption := 'Трудова книжка:Перегляд';
        StajListBox.Enabled := False;
        AddButton.Enabled := False;
    end;
    if Mode = emNew then
        Caption := 'Трудова книжка:Додати';

    if Mode = emModify then
        Caption := 'Трудова книжка:Змінити';

//    if (Mode = emModify) then DateCheckBox.Visible := True;

    WorkDetailsQuery.Params.ParamValues['Id_Man_Work'] := id_work;
    WorkDetailsQuery.Close;
    WorkDetailsQuery.Open;

    StajQuery.Close;
    StajQuery.Open;

    WorkStajQuery.Params.ParamValues['id_man_work_book'] := id_work;
    LastDateQuery.Params.ParamValues['Id_Pcard'] := id_pcard;
    LastDateQuery.Close;
    LastDateQuery.Open;

    BuildStajList;
    WorkBookControl.Prepare(Mode);
    WorkBookControl.SetReadOnly(Mode = emView);
    DateBegPicker.ShowCheckbox := False;

    if (id_work <> -1) then
    begin
        Date := LastDateQuery['MAX'];

        if Mode = emNew then
        begin
            DateBegPicker.DateTime := Date + 1;
            DateEndPicker.DateTime := Date + 1;

            if Date >= Consts_Query['DATE_END'] then
            begin
                DateCheckBox.Checked := True;
                Exit
            end
            else DateCheckBox.Checked := False;

        end;
    end;

    if (Mode = emModify) or (Mode = emView) then
        DateCheckBox.Checked := DateEndPicker.Date >= StrToDate('31.12.2050');
end;



{$R *.DFM}

procedure TWorkBookForm.FormCreate(Sender: TObject);
begin
    WorkDetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    StajQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkStajQuery.Transaction := PersonalCommon.ReadTransaction;

    ChangeWorkStajQuery.Transaction := PersonalCommon.WriteTransaction;
    LastDateQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkBookControl := TEditControl.Create;
    WorkBookControl.Add([FC_DATE_BEG, FC_DATE_END, FC_NOTE, FC_NUMBER, FC_ORDER_NUM]);
end;

procedure TWorkBookForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    ch, i: integer;
begin
    ok := True;
    if Mode = emView then
    begin
        Close;
        Exit;
    end;

    WorkBookControl.Read;
    if not WorkBookControl.CheckFill then Exit;
    if (DateBegPicker.Date > DateEndPicker.Date) and (DateEndPicker.Checked) then begin
        MessageDlg('Невірний період: дата початку більше дати закінчення', mtError, [mbOK], 0);
        Exit;
    end;

    PersonalCommon.WriteTransaction.StartTransaction;

    if Mode = emNew then
    begin
        if DateCheckBox.Checked then FC_DATE_END.Value := StrToDate('31.12.2150');
        ok := ok and WorkBookControl.ExecProc('Man_Work_Book_Insert', [IDPCARD], True);
    end;

    if Mode = emModify then
    begin
        WorkBookControl.Read;
        if DateCheckBox.Checked then FC_DATE_END.Value := StrToDate('31.12.2150');
        ok := ok and WorkBookControl.ExecProc('Man_Work_Book_Update', [IDPCARD, IDWORK], True);
    end;

    IDWORK := EditControl.LastId;

    with StajListBox do
        for i := 0 to StajListBox.Items.Count - 1 do
        begin
            if Checked[i] then Ch := 1
            else Ch := 0;
            with ChangeWorkStajQuery.SQL do
            begin
                Clear;
                StajQuery.Locate('Name_Staj', Items[i], []);
                Add('EXECUTE PROCEDURE WORK_STAJ_UPDATE ' +
                    IntToStr(IDWORK) + ',' + IntToStr(StajQuery['Id_Staj']) + ',' +
                    IntToStr(Ch));
            end;
            ExecQuery(ChangeWorkStajQuery);
        end;

    if not ok then
    begin
        PersonalCommon.WriteTransaction.Rollback;
        ModalResult := 0;

        Exit
    end;

    PersonalCommon.WriteTransaction.Commit;
    Self.ModalResult := mrOk;
end;

procedure TWorkBookForm.AddButtonClick(Sender: TObject);
var
    StajForm: TSpStajForm;
    Params: TSpParams;
begin
    Params := TSpParams.Create;
    with Params do
    begin
        Table := 'Ini_Staj';
        Title := 'Стаж';
        IdField := 'Id_Staj';
        SpFields := 'Name_Staj';
        ColumnNames := 'Стаж';
        InsertProcName := 'Ini_Staj_Insert';
        UpdateProcName := 'Ini_Satj__Update';
        DeleteProcName := 'Ini_Satj_Delete';
        SpMode := spmSelect;
    end;


    StajForm := TSpStajForm.Create(Self);
    StajForm.Init(Params);
    StajForm.ShowModal;
    BuildStajList;


end;

procedure TWorkBookForm.DateCheckBoxClick(Sender: TObject);
begin
    if DateCheckBox.Checked then
        DateEndPicker.Date := StrToDate('31.12.2150');
end;

procedure TWorkBookForm.DateEndPickerEnter(Sender: TObject);
begin
    if DateCheckBox.Checked then DateCheckBox.SetFocus;
end;

end.
