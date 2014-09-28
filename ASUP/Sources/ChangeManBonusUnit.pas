{-$Id: ChangeManBonusUnit.pas,v 1.4 2008/01/29 09:32:29 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Управление изменением надбавок по приказу"     }
{    Позволяет добавить/изменить/удалить изменение надбавки по приказу         }
{    Ответственный: Кропов Валентин                                            }

unit ChangeManBonusUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, DBCtrls, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
    StdCtrls, Buttons, ExtCtrls, SpCommon;

type
    TChangeManBonusForm = class(TForm)
        ManPanel: TPanel;
        Label1: TLabel;
        CancelButton: TSpeedButton;
        Label7: TLabel;
        ManEdit: TEdit;
        PCardButton: TBitBtn;
        ActiveBonusGrid: TDBGrid;
        ActiveBonusQuery: TIBQuery;
        ActiveBonusQueryID_MAN_BONUS: TIntegerField;
        ActiveBonusQueryID_MAN_MOVING: TIntegerField;
        ActiveBonusQueryID_BONUS: TIntegerField;
        ActiveBonusQueryNAME_BONUS: TIBStringField;
        ActiveBonusQueryIS_PERCENT: TIBStringField;
        ActiveBonusQuerySUMMA: TIBBCDField;
        ActiveBonusQueryBONUS_DATE_BEG: TDateField;
        ActiveBonusQueryBONUS_DATE_END: TDateField;
        ActiveBonusQueryID_ORDER: TIntegerField;
        ActiveBonusQueryNUM_ITEM: TIntegerField;
        ActiveBonusQueryDEPARTMENT_NAME: TIBStringField;
        ActiveBonusQueryPOST_NAME: TIBStringField;
        ActiveBonusQueryTHE_BONUS: TIBStringField;
        ActiveBonusDataSource: TDataSource;
        Panel1: TPanel;
        Label6: TLabel;
        Label9: TLabel;
        DBText1: TDBText;
        DBText2: TDBText;
        Panel2: TPanel;
        DeleteButton: TBitBtn;
        OutputQuery: TIBQuery;
        CheckQuery: TIBQuery;
        CheckQueryNUM_ORDER: TIBStringField;
        CheckQueryDATE_ORDER: TDateField;
        CheckQueryNAME_STATUS: TIBStringField;
        ChangeBonusGrid: TDBGrid;
        ChangeBonusQuery: TIBQuery;
        ChangeBonusDataSource: TDataSource;
        Panel3: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        BitBtn1: TBitBtn;
        Label2: TLabel;
        Label3: TLabel;
        Label8: TLabel;
        DBText3: TDBText;
        DBText4: TDBText;
        DBText5: TDBText;
        DBText6: TDBText;
        Label10: TLabel;
        Label11: TLabel;
        DBText7: TDBText;
        Label12: TLabel;
        DBText8: TDBText;
        Label13: TLabel;
        DBText9: TDBText;
        Label14: TLabel;
        DBText10: TDBText;
        ChangeBonusQueryID_MAN_BONUS: TIntegerField;
        ChangeBonusQueryFIO: TIBStringField;
        ChangeBonusQueryDEPARTMENT_NAME: TIBStringField;
        ChangeBonusQueryPOST_NAME: TIBStringField;
        ChangeBonusQueryID_MAN_MOVING: TIntegerField;
        ChangeBonusQueryNEW_DATE_BEG: TDateField;
        ChangeBonusQueryNEW_DATE_END: TDateField;
        ChangeBonusQueryNEW_NAME_BONUS: TIBStringField;
        ChangeBonusQueryNEW_THE_BONUS: TIBStringField;
        ChangeBonusQueryOLD_DATE_BEG: TDateField;
        ChangeBonusQueryOLD_DATE_END: TDateField;
        ChangeBonusQueryOLD_NAME_BONUS: TIBStringField;
        ChangeBonusQueryOLD_THE_BONUS: TIBStringField;
        ChangeBonusQueryFIO_SMALL: TIBStringField;
        ChangeBonusQueryDATE_ORDER: TDateField;
        ChangeBonusQueryNUM_ORDER: TIBStringField;
        ChangeBonusQueryID_STATUS: TIntegerField;
        ChangeBonusQueryID_DEPARTMENT: TIntegerField;
        ChangeBonusQueryNEW_IS_PERCENT: TIBStringField;
        ChangeBonusQueryNEW_SUMMA: TIBBCDField;
        ChangeBonusQueryNEW_ID_VIDOPL: TIntegerField;
        ChangeBonusQueryNEW_NUM_ITEM: TIntegerField;
        AddButton: TBitBtn;
    ActiveBonusQueryPERCENT: TIBBCDField;
    ChangeBonusQueryNEW_PERCENT: TIBBCDField;
    ChangeBonusQueryORDER_ITEM_TEXT: TMemoField;
        procedure PCardButtonClick(Sender: TObject);
        procedure Prepare;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        function CheckInputData: Boolean;
        procedure BitBtn1Click(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        function CheckBonusForRemove: Boolean;
        procedure FormResize(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    private
    { Private declarations }
    public

        FMode: TEditMode;
        ID_ORDER: Integer;
        NUM_ITEM: Integer;
        ID_PCARD: Integer;

        ID_ORDER_TYPE: Integer;
        ORDER_DATE: TDATE;
        NUM_ORDER: string;
        Note_Order: string;

    end;

var
    ChangeManBonusForm: TChangeManBonusForm;

implementation
uses PersonalCommon, AddPostBonus, GoodFunctionsUnit, AddManBOnusUnit;
{$R *.dfm}

function TChangeManBonusForm.CheckBonusForRemove: Boolean;
begin
    result := true;
    if not ActiveBonusQuery.IsEmpty then begin
        CheckQuery.Close;
        CheckQuery.Params.ParamValues['ID_MAN_BONUS'] := ActiveBonusQuery['ID_MAN_BONUS'];
        CheckQuery.Open;
        result := CheckQuery.IsEmpty;
        if result = False then MessageDlg('Неможливо змінити цю надбавку! Її вже хтось намагається змінити за наказом №' + CheckQuery['NUM_ORDER'] + ' від "' + DateToStr(CheckQuery['DATE_ORDER']) + '", який має статус "' + CheckQuery['NAME_STATUS'] + '"', mtError, [mbOk], 0);
    end;
end;

function TChangeManBonusForm.CheckInputData: Boolean;
begin
    CheckInputData := True;
    if Id_PCard = -1 then begin
        MessageDlg('Потрібно вибрати фізичну особу!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;
    if ActiveBonusQuery.IsEmpty then begin
        MessageDlg('Потрібно вибрати надбавку, яку треба змінити!', mtWarning, [mbOk], 0);
        CheckInputData := False;
        Exit;
    end;
end;


procedure TChangeManBonusForm.Prepare;
begin

    if FMode = emNew then begin

        PersonalCommon.WriteTransaction.StartTransaction;

        try
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(ID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Order_DATE) + ''',' + QuotedStr(NOTE_ORDER) + ',' + IntToStr(1) + ');';
            Id_Order := ExecQuery(OutputQuery);
        except
            PersonalCommon.WriteTransaction.Rollback;
            ModalResult := mrNone;
            MessageDlg('При занесенні данних у базу виникла помилка!', mtError, [mbOk], 0);
            exit;
        end;
        PersonalCommon.WriteTransaction.Commit;
    end;

    ID_PCARD := -1;
    ActiveBonusQuery.Close;
    ActiveBonusQuery.Params.ParamValues['CUR_DATE'] := DateToStr(ORDER_DATE);

    ChangeBonusQuery.Close;
    ChangeBonusQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
//	ChangeBonusQuery.Params.ParamValues['NUM_ITEM'] := NUM_ITEM;

    if (FMode = emModify) or (FMode = emView) then ChangeBonusQuery.Open;

    Caption := 'Змінені надбавки за наказом №' + NUM_Order + ' пункт №' + IntToStr(Num_Item);

    Label7.Caption := Label7.Caption + DateToStr(ORDER_DATE) + ':';

    if FMode = emView then begin
        Caption := Caption + '(тільки перегляд)';
        ManPanel.Visible := False;
        Panel1.Visible := False;
        ActiveBonusGrid.Visible := False;
        Panel2.Visible := False;
    end;
end;



procedure TChangeManBonusForm.PCardButtonClick(Sender: TObject);
begin
    id_pcard := getpcard(order_date);

    if id_pcard <> -1 then
    begin

        ManEdit.Text := GoodFunctionsUnit.Fam;

        with ActiveBonusQuery do
        begin
            Params.ParamValues['Id_PCard'] := Id_PCard;
            Close;
            Open;
            GridResize(ActiveBonusGrid);
        end;

    end;

end;

procedure TChangeManBonusForm.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TChangeManBonusForm.FormCreate(Sender: TObject);
begin
    ActiveBonusQuery.Transaction := PersonalCommon.ReadTransaction;
    ChangeBonusQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    CheckQuery.Transaction := PersonalCommon.ReadTransaction;
end;


procedure TChangeManBonusForm.BitBtn1Click(Sender: TObject);
var
//    form: TAddPostBonusForm;
    Form: TAddManBonusForm;
    i: Integer;
    is_percent: CHAR;
    percent: string;
    summa: string;
    id_man_bonus: Integer;
begin
    if ChangeBonusQuery.IsEmpty then
    begin
        MessageDlg('Немає записів для редагування!', mtError, [mbOk], 0);
        Exit;
    end;

    Form := TAddManBonusForm.Create(self);

    form.ID_ORDER := id_order;
    form.Order_Date := order_date;
    form.Panel2.Visible := False;
    Form.BonusBox.Prepare(ChangeBonusQuery['New_Id_Vidopl'], ChangeBonusQuery['New_Name_Bonus']);
    Form.DateBegPicker.Date := ChangeBonusQuery['New_Date_Beg'];
    Form.DateEndPicker.Date := ChangeBonusQuery['New_Date_End'];

    if ChangeBonusQuery['New_Is_Percent'] = 'T' then
    begin
        form.BonusGroup.ItemIndex := 0;
        form.PercentEdit.Text := FloatToStr(ChangeBonusQuery['New_Percent']);
    end
    else
    begin
        form.BonusGroup.ItemIndex := 1;
        form.SumEdit.Text := FloatToStr(ChangeBonusQuery['New_Summa']);
    end;

    form.NumItemEdit.Text := IntToStr(ChangeBonusQuery['New_Num_Item']);

    id_man_bonus := ChangeBonusQuery['Id_Man_Bonus'];

    if Form.ShowModal = mrOk then
    begin

        if form.BonusGroup.ItemIndex = 0 then is_percent := 'T'
        else is_percent := 'F';

        if is_percent = 'T' then Percent := form.PercentEdit.Text
        else Percent := '0';

        if is_percent = 'T' then Summa := '0'
        else Summa := form.SumEdit.Text;

        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_UPDATE(' +
            IntToStr(form.BonusBox.GetId) + ',' +
            QuotedStr(DateToStr(form.DateBegPicker.Date)) + ',' +
            QuotedStr(DateToStr(form.DateEndPicker.Date)) + ',' +
            QuotedStr(is_percent) + ',' +
            QuotedStr(StringReplace(percent, ',', '.', [])) + ',' +
            QuotedStr(summa) + ',' +
            IntToStr(ID_ORDER) + ',' +
            form.NumItemEdit.Text + ',' +
            IntToStr(id_man_bonus) + ')';
        ExecQuery(OutputQuery);

        ChangeBonusQuery.Close;
        ChangeBonusQuery.Open;

        ChangeBonusQuery.Locate('ID_MAN_BONUS', id_man_bonus, []);
    end;

    Form.Free;
{    if ChangeBonusQuery.IsEmpty
        then begin
        MessageDlg('Немає записів для редагування!', mtError, [mbOk], 0);
        exit;
    end;

    form := TAddPostBonusForm.Create(Self, emModify, abmManBonus);
    form.Id_Order := Id_Order;
    form.Num_Item := Num_Item;
    form.Id_Man_Bonus := ChangeBonusQuery['Id_Man_Bonus'];
    form.Id_Man_Moving := ChangeBonusQuery['Id_Man_Moving'];
    if form.ShowModal = mrOk then
    begin
        ChangeBonusQuery.Close;
        ChangeBonusQuery.Open;
        GridResize(ChangeBonusGrid);
    end;
    form.Free;}
end;

procedure TChangeManBonusForm.DeleteButtonClick(Sender: TObject);
begin
    if ChangeBonusQuery.IsEmpty
        then begin
        MessageDlg('Немає записів для вилучення!', mtError, [mbOk], 0);
        exit;
    end;

    if MessageDlg('Чі ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DT_MAN_BONUS_DELETE(' + IntToStr(ChangeBonusQuery['ID_MAN_BONUS']) + ',' + IntToStr(ID_ORDER) + ');';
    ExecQuery(OutputQuery);

    ChangeBonusQuery.Close;

end;

procedure TChangeManBonusForm.FormResize(Sender: TObject);
begin
    GridResize(ActiveBonusGrid);
    GridResize(ChangeBonusGrid);
end;

procedure TChangeManBonusForm.AddButtonClick(Sender: TObject);
begin
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_COPY_MAN_BONUS(' +
        ':Id_Man_Bonus, :Old_Id_Order, :New_Id_Order)';
    OutputQuery.ParamByName('Id_Man_Bonus').AsInteger :=
        ActiveBonusQuery['Id_Man_Bonus'];
    OutputQuery.ParamByName('Old_Id_Order').AsInteger :=
        ActiveBonusQuery['Id_Order'];
    OutputQuery.ParamByName('New_Id_Order').AsInteger := Id_Order;
    ExecQuery(OutputQuery);
    ChangeBonusQuery.Close;
    ChangeBonusQuery.Open;
end;

end.

