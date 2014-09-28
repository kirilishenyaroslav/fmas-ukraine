unit TextShablonsUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, SpFormUnit, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
    Buttons, StdCtrls, ExtCtrls, PersonalCommon, SpCommon, uSearchFrame, AccMgmt;

type
    TTextShablonsForm = class(TSpForm)
        ResultQueryID_TEXT_SHABLON: TIntegerField;
        ResultQueryTEXT1: TIBStringField;
        ResultQueryTEXT2: TIBStringField;
        CheckQuery: TIBQuery;
        procedure Prepare(aID_TYPE: Integer);
        procedure ResultQueryAfterOpen(DataSet: TDataSet);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure DetailsButtonClick(Sender: TObject);
        procedure FindButtonClick(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure SearchNextClick(Sender: TObject);
        procedure SearchEditChange(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
        procedure OrderAutoInsert(id_text_shablon: Integer; Auto: Boolean);
    private
    { Private declarations }
    public
        ID_TYPE: integer;
    end;

var
    TextShablonsForm: TTextShablonsForm;

implementation

uses AddTextShablonUnit;

procedure TTextShablonsForm.OrderAutoInsert(id_text_shablon: Integer; Auto: Boolean);
begin
    case id_type of
        6, 13, 14, 15: begin
                WorkQuery.Close;

                if Auto then
                    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_JN_ORDER_AUTO_INSERTUPDATE' +
                        '(:ID_TEXT_SHABLON, :ID_USER)'
                else
                    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_JN_ORDER_AUTO_DELETE' +
                        '(:ID_TEXT_SHABLON, :ID_USER)';

            //ShowMessage('');

                WorkQuery.Params.ParamValues['ID_TEXT_SHABLON'] := id_text_shablon;
                WorkQuery.Params.ParamValues['ID_USER'] := AccMgmt.GetUserId;

                ExecQuery(WorkQuery);
            end;
    end;
end;

procedure TTextShablonsForm.Prepare(aID_TYPE: Integer);
begin
    ResultQuery.Transaction := PersonalCommon.ReadTransaction;
    CheckQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;

    Params := TSpParams.Create;

    Params.IdField := 'ID_TEXT_SHABLON';
    Params.SpFields := 'TEXT1, TEXT2';

    Id_Type := aId_Type;

    case Id_Type of

        1: begin
                Caption := 'Шаблони пунктів наказів';
                SpGrid.Columns[0].Title.Caption := 'Текст';
                SpGrid.Columns[1].Visible := False;
            end;

        2: begin
                Caption := 'Шаблони додаткових пунктів наказів';
                SpGrid.Columns[0].Title.Caption := 'Текст';
                SpGrid.Columns[1].Visible := False;
            end;
        3: begin
                Caption := 'Візуючі';
                SpGrid.Columns[0].Title.Caption := 'П.І.Б особи, шо візує';
                SpGrid.Columns[1].Visible := False;
            end;
        4: begin
                Caption := 'Ознайомлені';
                SpGrid.Columns[0].Title.Caption := 'П.І.Б особи, що ознайомилася';
                SpGrid.Columns[1].Visible := False;
            end;
        5: begin
                Caption := 'Погоджуючі';
                SpGrid.Columns[0].Title.Caption := 'П.І.Б особи, що погоджує';
                SpGrid.Columns[1].Visible := False;
            end;
        6: begin
                Caption := 'Особи, що підписують друковану версію наказу';
                SpGrid.Columns[0].Title.Caption := 'П.І.Б особи, що підписує';
                SpGrid.Columns[1].Title.Caption := 'Посада особи, що підписує';
            end;
        7: begin
                Caption := 'Друковані назви наказів';
                SpGrid.Columns[0].Title.Caption := 'Текст назви';
                SpGrid.Columns[1].Visible := False;
            end;
        8: begin
                Caption := 'Вступи до наказів';
                SpGrid.Columns[0].Title.Caption := 'Текст вступу';
                SpGrid.Columns[1].Visible := False;
            end;
        9: begin
                if not NewOrders then
                    Caption := 'Виконавці наказів'
                else
                    Caption := 'Працівники, які вносять проекти наказів';

                SpGrid.Columns[0].Title.Caption := 'П.І.Б.';
                SpGrid.Columns[1].Title.Caption := 'Посада';
                //SpGrid.Columns[1].Visible := False;
            end;
        10: begin
                Caption := 'Тексти пунктів наказів';
                SpGrid.Columns[0].Title.Caption := 'Текст';
                SpGrid.Columns[1].Visible := False;
            end;
        13: begin
                Caption := 'Візуючі';
                SpGrid.Columns[0].Title.Caption := 'П.І.Б візуючого';
                SpGrid.Columns[1].Title.Caption := 'Посада';
            end;
        14: begin
                Caption := 'Ознайомлені';
                SpGrid.Columns[0].Title.Caption := 'П.І.Б ознайомленого';
                SpGrid.Columns[1].Title.Caption := 'Посада';
            end;
        15: begin
                Caption := 'Погоджуючі';
                SpGrid.Columns[0].Title.Caption := 'П.І.Б погоджуючого';
                SpGrid.Columns[1].Title.Caption := 'Посада';
            end;
        16: begin
                Caption := 'ШАБЛОНИ підстав для виконання обов`язків';
                SpGrid.Columns[0].Title.Caption := 'Текст шаблону підстави';
                SpGrid.Columns[1].Visible := False;
            end;
        17: begin
                Caption := 'Групи пунктів наказів';
                SpGrid.Columns[0].Title.Caption := 'Назва групи';
                SpGrid.Columns[1].Visible := False;
            end;
    end;

    ResultQuery.Close;
    ResultQuery.Params.ParamValues['ID_TYPE'] := ID_TYPE;
    ResultQuery.Open;
end;

{$R *.dfm}

procedure TTextShablonsForm.ResultQueryAfterOpen(DataSet: TDataSet);
begin
    inherited;

    GridResize(SpGrid);
end;

procedure TTextShablonsForm.AddButtonClick(Sender: TObject);
var
    Form: TAddTextShablonForm;
    tmp_int: Integer;
begin
    Form := TAddTextShablonForm.Create(self);

    Form.ID_TYPE := ID_TYPE;

    if Form.ShowModal = mrOk
        then begin
        try
            WorkQuery.Transaction.StartTransaction;
            WorkQuery.Close;
            WorkQuery.SQL.Text := 'SELECT ID_TEXT_SHABLON FROM DT_TEXT_SHABLONS_INSERT(' + QuotedStr(Form.Memo1.Text) + ',' +
                IntToStr(ID_TYPE) + ',' +
                QuotedStr(Form.Memo2.Text) + ')';
            tmp_int := ExecQuery(WorkQuery);

            OrderAutoInsert(tmp_int, Form.CheckBox1.Checked);
        except on E: Exception do begin
                MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                WorkQuery.Transaction.Rollback;
                exit;
            end;
        end;

        ResultQuery.Locate('ID_TEXT_SHABLON', tmp_int, []);
        WorkQuery.Transaction.Commit;
        ResultQuery.Close;
        ResultQuery.Open;
    end;

    Form.Free;
end;

procedure TTextShablonsForm.ModifyButtonClick(Sender: TObject);
var
    Form: TAddTextShablonForm;
    tmp_int: Integer;
begin

    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    Form := TAddTextShablonForm.Create(self);

    Form.ID_TYPE := ID_TYPE;
    Form.Memo1.Text := ResultQueryTEXT1.Value;
    Form.Memo2.Text := ResultQueryTEXT2.Value;

    CheckQuery.Close;
    CheckQuery.Params.ParamValues['ID_TEXT_SHABLON'] := ResultQueryID_TEXT_SHABLON.Value;
    CheckQuery.Params.ParamValues['ID_USER'] := AccMgmt.GetUserId;
    CheckQuery.Open;
    Form.CheckBox1.Checked := not CheckQuery.IsEmpty;
    CheckQuery.Close;

    if Form.ShowModal = mrOk
        then begin
        tmp_int := ResultQueryID_TEXT_SHABLON.Value;

        WorkQuery.Close;
        WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_TEXT_SHABLONS_UPDATE(' + IntToStr(ResultQueryID_TEXT_SHABLON.Value) + ',' +
            QuotedStr(Form.Memo1.Text) + ',' +
            IntToStr(ID_TYPE) + ',' +
            QuotedStr(Form.Memo2.Text) + ')';
        ExecQuery(WorkQuery);

        OrderAutoInsert(ResultQueryID_TEXT_SHABLON.Value, Form.CheckBox1.Checked);

        ResultQuery.Close;
        ResultQuery.Open;

        ResultQuery.Locate('ID_TEXT_SHABLON', tmp_int, []);
    end;

    Form.Free;
end;

procedure TTextShablonsForm.DeleteButtonClick(Sender: TObject);
begin

    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    if MessageDlg('Ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) <> ID_YES
        then exit;

    WorkQuery.Close;
    WorkQuery.SQL.Text := 'EXECUTE PROCEDURE DT_TEXT_SHABLONS_DELETE(' + IntToStr(ResultQueryID_TEXT_SHABLON.Value) + ')';
    ExecQuery(WorkQuery);

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TTextShablonsForm.DetailsButtonClick(Sender: TObject);
var
    Form: TAddTextShablonForm;
begin
    Form := TAddTextShablonForm.Create(self);

    Form.ID_TYPE := ID_TYPE;
    Form.Memo1.Text := ResultQueryTEXT1.Value;
    Form.Memo2.Text := ResultQueryTEXT2.Value;
    Form.Panel1.Enabled := False;
    Form.Panel2.Enabled := False;

    CheckQuery.Close;
    CheckQuery.Params.ParamValues['ID_TEXT_SHABLON'] := ResultQueryID_TEXT_SHABLON.Value;
    CheckQuery.Params.ParamValues['ID_USER'] := AccMgmt.GetUserId;
    CheckQuery.Open;
    Form.CheckBox1.Checked := not CheckQuery.IsEmpty;
    CheckQuery.Close;

    Form.ShowModal;

    Form.Free;

end;

procedure TTextShablonsForm.FindButtonClick(Sender: TObject);
begin
    inherited;
  //
end;

procedure TTextShablonsForm.RefreshButtonClick(Sender: TObject);
begin
    inherited;
//
end;

procedure TTextShablonsForm.SearchNextClick(Sender: TObject);
begin
    inherited;
//
end;

procedure TTextShablonsForm.SearchEditChange(Sender: TObject);
begin
    inherited;
//
end;

procedure TTextShablonsForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    inherited;

    Params.Free;
end;

procedure TTextShablonsForm.OkButtonClick(Sender: TObject);
begin
    inherited;

    if ResultQuery.IsEmpty
        then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    ModalResult := mrOk;
end;

end.
