unit AddHoursOrderEdit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, SpComboBox, ComCtrls, Grids, DBGrids, Buttons,
    ExtCtrls, SpCommon, DB, IBCustomDataSet, IBQuery, PersonalCommon, Mask,
    CheckEditUnit;

type
    TAddHoursOrderEditForm = class(TForm)
        Panel3: TPanel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Panel2: TPanel;
        GroupBox2: TGroupBox;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        BonusGrid: TDBGrid;
        Panel1: TPanel;
        TypeBox: TSpComboBox;
        Label1: TLabel;
        Label2: TLabel;
        AddDate: TDateTimePicker;
        GroupBox1: TGroupBox;
        Label10: TLabel;
        SelectNumItemButton: TButton;
        NumItemEdit: TEdit;
        WriteQuery: TIBQuery;
        ResultQuery: TIBQuery;
        ResultQueryID_ORDER: TIntegerField;
        ResultQueryID_MAN_MOVING: TIntegerField;
        ResultQueryADD_DATE: TDateField;
        ResultQueryREASON: TIBStringField;
        ResultQueryNUM_ITEM: TIntegerField;
        ResultQueryIS_ACTIVE: TIntegerField;
        ResultQueryFIO: TIBStringField;
        ResultQueryFIO_SMALL: TIBStringField;
        ResultQueryPOST_NAME: TIBStringField;
        ResultQueryDEPARTMENT_NAME: TIBStringField;
        ResultQueryTN: TIntegerField;
        ResultQueryTYPE_SMALL_NAME: TIBStringField;
        ResultQueryTYPE_FULL_NAME: TIBStringField;
        PeopleQuery: TIBQuery;
        PeopleQueryTN: TIntegerField;
        PeopleQueryNAME_FULL: TIBStringField;
        PeopleQueryNAME_POST: TIBStringField;
        PeopleQueryFIO: TIBStringField;
        PeopleQueryID_MAN_MOVING: TIntegerField;
        PeopleDataSource: TDataSource;
        Label3: TLabel;
        Hours: TCheckEdit;
        ResultQueryHOURS: TIBBCDField;
        ResultQueryID_TYPE: TIntegerField;
        procedure SelectNumItemButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure ReopenQuerys;
        constructor Create(aOwner: TComponent; aFMode: TEditMode; aID_ORDER: Integer; aOrder_Date: TDate; aNum_Order: string; aID_ADD_HOURS: Integer = -1); reintroduce;
        procedure OkButtonClick(Sender: TObject);
        procedure PeopleQueryAfterOpen(DataSet: TDataSet);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
        movings: array[0..1000] of integer;
        movings_count: Integer;

    public
        FMode: TEditMode;
        ID_ORDER: Integer;
        ID_ADD_HOURS: Integer;
        Order_Date: TDate;
        Num_Order: string;

    end;

var
    AddHoursOrderEditForm: TAddHoursOrderEditForm;

implementation

uses DtManBonusItemsUnit, GoodFunctionsUnit;

{$R *.dfm}

procedure TAddHoursOrderEditForm.ReopenQuerys;
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
    PeopleQuery.SQL.add('       (CURRENT_TIME between ds.use_beg and ds.use_end) and ');
    PeopleQuery.SQL.add('       (CURRENT_TIME between sd.use_beg and sd.use_end) ');

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

constructor TAddHoursOrderEditForm.Create(aOwner: TComponent; aFMode: TEditMode; aID_ORDER: Integer; aOrder_Date: TDate; aNum_Order: string; aID_ADD_HOURS: Integer = -1);
begin
    inherited Create(aOwner);

    WriteQuery.Transaction := WriteTransaction;
    ResultQuery.Transaction := ReadTransaction;
    PeopleQuery.Transaction := ReadTransaction;

    FMode := aFMode;
    ID_ORDER := aID_ORDER;
    ID_ADD_HOURS := aID_ADD_HOURS;
    ORDER_DATE := aOrder_Date;
    Num_Order := aNum_Order;

    if FMode = emNew
        then begin
        TypeBox.Prepare(-1, '');
        AddDate.Date := Date;

        Hours.Text := '';
    end
    else begin
        ResultQuery.Close;
        ResultQuery.Params.ParamValues['ID_ADD_HOURS'] := ID_ADD_HOURS;
        ResultQuery.Open;

        TypeBox.Prepare(ResultQueryID_TYPE.Value, ResultQueryTYPE_FULL_NAME.Value);
        AddDate.Date := ResultQueryADD_DATE.Value;
        NumItemEdit.Text := ResultQueryNUM_ITEM.AsString;

        Hours.Text := ResultQueryHOURS.AsString;

        Panel2.Visible := False;
    end;
end;

procedure TAddHoursOrderEditForm.SelectNumItemButtonClick(Sender: TObject);
var
    form: TDtManBonusItemsForm;
begin
    Form := TDtManBonusItemsForm.Create(self);
    Form.id_order := ID_ORDER;
    Form.aID_TYPE := 1;

    Form.Prepare;

    if Form.ShowModal = mrOk
        then begin
        NumItemEdit.Text := IntToStr(form.ResultQueryNUM_ITEM.Value);
    end;

    Form.Free;
end;

procedure TAddHoursOrderEditForm.AddButtonClick(Sender: TObject);
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

procedure TAddHoursOrderEditForm.DeleteButtonClick(Sender: TObject);
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

procedure TAddHoursOrderEditForm.OkButtonClick(Sender: TObject);
begin

    if not CheckForFillBool(TypeBox.GetId <> -1, 'Потрібно вибрати тип надурочної прац!')
        then exit;

    if not CheckForFill(Hours, 'Годин')
        then exit;

    if not CheckForFill(NumItemEdit, 'Пункт наказу')
        then exit;

    if ((FMode = emNew) and (PeopleQuery.IsEmpty))
        then begin
        MessageDlg('Потрібно вибрати хочаб одного працівника!', mtError, [mbOk], 0);
        exit;
    end;

    Hours.Text := StringReplace(Hours.Text, ',', '.', []);

    if FMode = emNew then begin

        WriteTransaction.StartTransaction;

        try
            PeopleQuery.First;

            while not PeopleQuery.Eof do begin
                WriteQuery.Close;
                WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_ADD_HOURS_I(' +
                    IntToStr(TypeBox.GetId) + ',' +
                    PeopleQueryID_MAN_MOVING.AsString + ',' +
                    QuotedStr(DateToStr(AddDate.Date)) + ',' +
                    QuotedStr('Наказ №' + Num_Order) + ',' +
                    IntToStr(Id_Order) + ',' +
                    NumItemEdit.Text + ',' +
                    '1' + ',' +
                    QuotedStr(Hours.Text) + ')';

                ExecQuery(writeQuery);

                PeopleQuery.Next;
            end;

        except on E: Exception
            do begin
                MessageDlg('Виникла помилка: "' + e.message + '"', mtError, [mbOk], 0);
                WriteTransaction.Rollback;
                exit;
            end;
        end;

        WriteTransaction.Commit;
    end;

    if FMode = emModify then begin

        WriteQuery.Close;
        WriteQuery.SQL.Text := 'EXECUTE PROCEDURE DT_ADD_HOURS_U(' +
            IntToStr(ID_ADD_HOURS) + ',' +
            IntToStr(TypeBox.GetId) + ',' +
            IntToStr(ResultQueryID_MAN_MOVING.Value) + ',' +
            QuotedStr(DateToStr(AddDate.Date)) + ',' +
            QuotedStr('Наказ №' + Num_Order) + ',' +
            IntToStr(Id_Order) + ',' +
            NumItemEdit.Text + ',' +
            '1' + ',' +
            QuotedStr(Hours.Text) + ')';

        ExecQuery(writeQuery);

    end;

    ModalResult := mrOk;
end;

procedure TAddHoursOrderEditForm.PeopleQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(bonusGrid);
end;

procedure TAddHoursOrderEditForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    TypeBox.SaveIntoRegistry;
end;

end.
