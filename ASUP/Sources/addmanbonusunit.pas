unit AddManBonusUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, SpComboBox, Mask,
    CheckEditUnit, ExtCtrls, ComCtrls, Buttons, Spin, Grids,
    DBGrids, PersonalCommon, FieldControl, SpCommon, DateUtils;

type
    TAddManBonusForm = class(TForm)
        ID_POST: TIntegerField;
        ID_BONUS: TIntegerField;
        DATE_BEG: TDateField;
        DATE_END: TDateField;
        IS_PERCENT: TIBStringField;
        PERCENT: TIntegerField;
        SUMMA: TIBBCDField;
        Panel1: TPanel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        DateEndPicker: TDateTimePicker;
        BonusGroup: TRadioGroup;
        PercentEdit: TCheckEdit;
        SumEdit: TCheckEdit;
        DateBegPicker: TDateTimePicker;
        BonusBox: TSpComboBox;
        GroupBox1: TGroupBox;
        Label1: TLabel;
        Panel2: TPanel;
        GroupBox2: TGroupBox;
        Panel3: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        PeopleDataSource: TDataSource;
        PeopleQuery: TIBQuery;
        BonusGrid: TDBGrid;
        PeopleQueryTN: TIntegerField;
        PeopleQueryNAME_FULL: TIBStringField;
        PeopleQueryNAME_POST: TIBStringField;
        PeopleQueryFIO: TIBStringField;
        PeopleQueryID_MAN_MOVING: TIntegerField;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        procedure AddButtonClick(Sender: TObject);
        procedure ReopenQuerys;
        procedure PeopleQueryAfterOpen(DataSet: TDataSet);
        procedure DeleteButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure PercentEditEnter(Sender: TObject);
        procedure SumEditEnter(Sender: TObject);
        procedure SelectNumItemButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        movings: array[0..1000] of integer;
        movings_count: Integer;

        Order_Date: TDate;
        ID_ORDER: Integer;
    end;

var
    AddManBonusForm: TAddManBonusForm;

implementation

uses DtManBonusItemsUnit;

{$R *.dfm}

procedure TAddManBonusForm.ReopenQuerys;
var
    i: integer;
begin


    PeopleQuery.Close;
    PeopleQuery.SQL.Clear;
    PeopleQuery.SQL.add('SELECT pc.TN, p.FAMILIA || '' '' || substring(p.IMYA from 1 for 1) || ''.'' || substring(p.OTCHESTVO from 1 for 1) || ''.'' as FIO, sd.name_full, sp.name_post, mm.id_man_moving ');
    PeopleQuery.SQL.add('FROM   man_moving mm, private_cards pc, people p, dt_shtatras ds, sp_department sd, sp_post sp ');
    PeopleQuery.SQL.add('WHERE  mm.id_pcard = pc.id_pcard and ');
    PeopleQuery.SQL.add('       pc.id_man = p.id_man and ');
    PeopleQuery.SQL.add('       mm.id_shtatras = ds.id_shtatras and ');
    PeopleQuery.SQL.add('       ds.id_department = sd.id_department and ');
    PeopleQuery.SQL.add('       ds.id_post = sp.id_post and ');
    PeopleQuery.SQL.add('       (CURRENT_TIMESTAMP between ds.use_beg and ds.use_end) and ');
    PeopleQuery.SQL.add('       (CURRENT_TIMESTAMP between sd.use_beg and sd.use_end) ');

    if movings_count > 0
        then PeopleQuery.SQL.add('and (');

    for i := 0 to movings_count - 1
        do begin

        PeopleQuery.SQL.Add('mm.ID_MAN_MOVING = ' + IntToStr(movings[i]));

        if i < movings_count - 1 then PeopleQuery.SQL.Add(' or ')

    end;

    if movings_count > 0
        then begin
        PeopleQuery.SQL.Add(')');
        PeopleQuery.SQL.Add('ORDER BY name_full, p.familia, p.imya, p.otchestvo');

        PeopleQuery.Open;
    end;
end;

procedure TAddManBonusForm.AddButtonClick(Sender: TObject);
var
    mov_info: TMovingInfo;
begin
    if Select_Man_Moving(mov_info, OrdeR_Date)
        then begin
        Movings[movings_count] := mov_info.Id_Man_Moving;
        movings_count := movings_count + 1;

        ReopenQuerys;

        PeopleQuery.Locate('ID_MAN_MOVING', mov_info.Id_Man_Moving, []);
    end;
end;

procedure TAddManBonusForm.PeopleQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(BonusGrid);
end;

procedure TAddManBonusForm.DeleteButtonClick(Sender: TObject);
var
    i: Integer;
    old_i: Integer;
begin
    if PeopleQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    for i := 0 to movings_count - 1
        do begin
        if movings[i] = PeopleQueryID_MAN_MOVING.value
            then begin
            movings[i] := movings[movings_count - 1];
            movings_count := movings_count - 1;

            if i > 0 then old_i := i - 1;
        end;
    end;

    ReopenQuerys;

    if movings_count > 0
        then PeopleQuery.Locate('ID_MAN_MOVING', movings[old_i], []);
end;

procedure TAddManBonusForm.FormCreate(Sender: TObject);
begin
    PeopleQuery.Transaction := PersonalCommon.ReadTransaction;

    BonusBox.LoadFromRegistry;
end;

procedure TAddManBonusForm.OkButtonClick(Sender: TObject);
begin
    if BonusBox.GetId = -1
        then begin
        MessageDlg('Треба вибрати тип надбавки (доплати)!', mtError, [mbOk], 0);
        BonusBox.SetFocus;
        exit;
    end;

    if DateBegPicker.Date > DateEndPicker.Date then
    begin
        MessageDlg('Дата початку періоду повинна бути менша за дату кінця', mtError, [mbOk], 0);
        DateBegPicker.SetFocus;
        Exit;
    end;

    if (BonusGroup.ItemIndex = 0) and (PercentEdit.Text = '') then
    begin
        MessageDlg('Потрібно ввести процент!', mtError, [mbOk], 0);
        PercentEdit.SetFocus;
        Exit;
    end;

    if (BonusGroup.ItemIndex = 1) and (SumEdit.Text = '') then
    begin
        MessageDlg('Потрібно ввести суму!', mtError, [mbOk], 0);
        SumEdit.SetFocus;
        Exit;
    end;

    if (NumItemEdit.Text = '') then
    begin
        MessageDlg('Потрібно вибрати пункт наказу!', mtError, [mbOk], 0);
        NumItemEdit.SetFocus;
        Exit;
    end;

    if (PeopleQuery.IsEmpty) and (Panel2.visible) then
    begin
        MessageDlg('Потрібно додати хоча б одного працівника!', mtError, [mbOk], 0);
        Exit;
    end;

    ModalResult := mrOk;
end;

procedure TAddManBonusForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    BonusBox.SaveIntoRegistry;
end;

procedure TAddManBonusForm.PercentEditEnter(Sender: TObject);
begin
    SumEdit.Text := '';
    BonusGroup.ItemIndex := 0;
end;

procedure TAddManBonusForm.SumEditEnter(Sender: TObject);
begin
    PercentEdit.Text := '';
    BonusGroup.ItemIndex := 1;
end;

procedure TAddManBonusForm.SelectNumItemButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.aID_TYPE := 10;

    Form.Prepare;

    if Form.ShowModal = mrOk
        then begin
        NumItemEdit.Text := IntToStr(form.ResultQueryNUM_ITEM.Value);
    end;

    Form.Free;
end;

end.
