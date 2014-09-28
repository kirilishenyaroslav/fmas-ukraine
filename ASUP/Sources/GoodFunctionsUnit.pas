unit GoodFunctionsUnit;

interface

uses PCardsViewUnit, Controls, Classes, StdCtrls, SpComboBox, SpCommon, Dialogs, Graphics,
    windows, IBQuery, Grids, TableCentral, DateUtils, WorkModeCentral, SysUtils, Forms,
    CheckEditUnit, BoHolidayForm, PersonalCommon, variants, RxMemDs, uCommonSp,
    ProlongManOrder;

type TShowOrderProc = function(InputDataSet: TRxMemoryData): TRxMemoryData; stdcall;

function GetDateBegByRMoving(RMoving: Integer): TDate;
//
function GetCurrentWorkPlace(IdPcard: Integer; CurDate: TDate; var Id_Man_Moving: Integer; var PostName: string; var DepartmentName: string): Boolean;
//
function GetCurServer: Integer;
//
function GetMaxOrderNumItem(Id_Order: integer): Integer;
//
function GetManWorkMode(Id_Man_Moving: Integer; CurDate: TDate): Integer;
//
function GetOrderOwner(Id_Order: Integer; NewOrder: Boolean = False): Integer;
//
function GetManFio(id_Pcard: Integer): string;
//
function GetManMoney(id_man_moving: Integer; CurDate: TDate; var Money: Double): Boolean;
//
function getpcard(aDate: TDate; ShowWorking: Boolean = True; CanRemoveFilter: Boolean = False): integer;
//
function CheckForFill(Sender: TObject; Text: string): Boolean;
//
function CheckForFillBool(Check_Value: Boolean; Text: string): Boolean;
//
procedure QueryCloseOpen(Query: TIBQuery; ID_Field: string; Id_Value: Integer = -1);
//
function CheckQueryForDel(Query: TIBQuery): Boolean;
//
function DrawWorkModeExample(Grid: TStringGrid; Date1, Date2: TDate; Id_Work_Mode, Shift: Integer; Col_Count: Integer): Integer;
//
function CheckQueryForModify(Query: TIBQuery): Boolean;
//
function ShowOrder(aID_ORDER: integer;
    aID_ORDER_TYPE: integer;
    aNUM_ITEM: integer;
    EditMode: TEditMode;
    OutputQuery: TIBQuery;
    Self: TForm;
    Date_Order: TDate;
    var ID_ORDER: Integer;
    Num_Order: string = '';
    Note: string = '';
    aSub_Item: Integer = -1;
    aId_Order_Group: Integer = -1;
    aIntro: string = ''): Boolean;

//
procedure ErrMsg(MessageText: string);

var
    pcardform: TPcardsViewForm;
    Fam: string;
    TN: Integer;
    NewOrder: Boolean;

implementation

uses DB, PremiaOrderUnit, ChangeManBonusUnit, ManHolidayUnit, ToDoListUnit,
    ManPrivRemoveUnit, PrivUnit, ManBonusRemoveUnit, ManBonus, MoveManUnit,
    ManPunishingRemoveUnit, ManAwardUnit, ManPunishingUnit, DismissManUnit,
    MainUnit, AcceptToWorkUnit, DikretHollidayOrderUnit, ManComandUnit,
    AddPaperSignerUnit, AddAdditionalActionsUnit, SpFormUnit, TextShablonsUnit,
    IncreaseOrderUnit, ManWorkModeChangeUnit, AddHoursOrder, HolidayBackUnit,
    ManIoUnit, uHolidayCompensOrder;

function GetDateBegByRMoving(RMoving: Integer): TDate;
var
    Query: TIBQuery;
begin
    Query := TIBQuery.Create(nil);
    Query.Transaction := PersonalCommon.ReadTransaction;

    Query.SQL.Text := 'SELECT min(Date_Beg) as Date_Beg from man_moving where real_date_end is not null and rmoving = ' + IntToStr(Rmoving);
    Query.Open;

    if (not Query.IsEmpty) and (not VarIsNull(Query['Date_Beg'])) then
        Result := Query['Date_Beg']
    else
        Result := 0;

    Query.Close;

    Query.Free;
end;

function GetCurrentWorkPlace(IdPcard: Integer; CurDate: TDate; var Id_Man_Moving: Integer; var PostName: string; var DepartmentName: string): Boolean;
var
    Query: TIBQuery;
begin
    Query := TIBQuery.Create(nil);
    Query.Transaction := PersonalCommon.ReadTransaction;

    Query.SQL.Text := 'SELECT * from GET_CUR_WORK_PLACE(' + IntToStr(IdPcard) + ',' +
        QuotedStr(DateToStr(CurDate)) + ')';
    Query.Open;

    if (not Query.IsEmpty) and (not VarIsNull(Query['Id_Man_Moving'])) then
    begin
        result := true;
        Id_Man_Moving := Query['Id_Man_Moving'];
        PostName := Query['Post_Name'];
        DepartmentName := Query['Department_Name'];
    end
    else
        result := false;

    Query.Close;

    Query.Free;
end;

function GetCurServer: Integer;
var
    Query: TIBQuery;
begin
    Query := TIBQuery.Create(nil);
    Query.Transaction := PersonalCommon.ReadTransaction;

    Query.SQL.Text := 'SELECT ID_SERVER from ORDERS_CHECK_SERVER_STATUS';
    Query.Open;

    if (not Query.IsEmpty) and (not VarIsNull(Query['Id_Server'])) then
        result := Query['Id_Server']
    else
        result := -1;

    Query.Close;

    Query.Free;
end;

function GetMaxOrderNumItem(Id_Order: integer): Integer;
var
    Query: TIBQuery;
begin
    Query := TIBQuery.Create(nil);
    Query.Transaction := PersonalCommon.ReadTransaction;

    Query.SQL.Text := 'SELECT max(num_item) as num_item from DT_MAN_BONUS_ORDER_ITEM where id_order = ' + IntToStr(Id_Order);
    Query.Open;

    if (not Query.IsEmpty) and (not VarIsNull(Query['num_item'])) then
        result := Query['num_item'] + 1
    else
        result := 1;

    Query.Close;

    Query.Free;
end;

function GetManWorkMode(Id_Man_Moving: Integer; CurDate: TDate): Integer;
var
    Query: TIBQuery;
begin
    Query := TIBQuery.Create(nil);
    Query.Transaction := PersonalCommon.ReadTransaction;

    Query.SQL.Text := 'SELECT id_work_mode from GET_CURRENT_WORKMODE(' +
        IntToStr(Id_Man_Moving) + ',' +
        QuotedStr(DateToStr(CurDate)) + ')';
    Query.Open;

    if (not Query.IsEmpty) and (not VarIsNull(Query['ID_WORK_MODE'])) then
        result := Query['ID_WORK_MODE']
    else
        result := -1;

    Query.Close;

    Query.Free;
end;

function GetOrderOwner(Id_Order: Integer; NewOrder: Boolean = False): Integer;
var
    Query: TIBQuery;
begin
    if not NewOrders then
    begin
        Query := TIBQuery.Create(nil);
        Query.Transaction := PersonalCommon.ReadTransaction;

        Query.SQL.Text := 'SELECT OWNER_ID_PCARD FROM ORDERS WHERE ID_ORDER = ' +
            IntToStr(Id_Order);
        Query.Open;

        if (not Query.IsEmpty) and (not VarIsNull(Query['OWNER_ID_PCARD'])) then
            result := Query['OWNER_ID_PCARD']
        else
            result := -1;

        Query.Close;

        Query.Free;
    end
    else
    begin
        Query := TIBQuery.Create(nil);
        Query.Transaction := PersonalCommon.ReadTransaction;

        Query.SQL.Text := 'SELECT OWNER_ID_USER FROM ASUP_ORDERS WHERE ID_ORDER = ' +
            IntToStr(Id_Order);
        Query.Open;

        if (not Query.IsEmpty) and (not VarIsNull(Query['OWNER_ID_USER'])) then
            result := Query['OWNER_ID_USER']
        else
            result := -1;

        Query.Close;

        Query.Free;
    end;
end;


function GetManFio(id_Pcard: Integer): string;
var
    Query: TIBQuery;
begin

    Query := TIBQuery.Create(nil);
    Query.Transaction := PersonalCommon.ReadTransaction;

    Query.SQL.Text := 'SELECT FIO, FIO_SMALL From GET_MAN_FIO(' + IntToStr(Id_Pcard) + ')';
    Query.Open;

    if (not Query.IsEmpty) and (not VarIsNull(Query['FIO'])) then
        result := Query['FIO']
    else
        result := '';

    Query.Close;

    Query.Free;
end;

function GetManMoney(id_man_moving: Integer; CurDate: TDate; var Money: Double): Boolean;
var
    Query: TIBQuery;
begin
    result := true;

    Query := TIBQuery.Create(nil);
    Query.Transaction := PersonalCommon.ReadTransaction;

    Query.SQL.Text := 'SELECT MONEY FROM GET_MAN_MONEY(' + IntToStr(Id_Man_Moving) + ',' +
        QuotedStr(DateToStr(CurDate)) + ')';
    Query.Open;

    if Query.IsEmpty or (VarIsNull(Query['Money'])) then
        result := false
    else
    begin
        Money := Query['Money'];
    end;

    Query.Close;

    Query.Free;
end;

procedure ErrMsg(MessageText: string);
begin
    MessageDlg(MessageText, mtError, [mbOk], 0);
end;

function ShowOrder(aID_ORDER: integer;
    aID_ORDER_TYPE: integer;
    aNUM_ITEM: integer;
    EditMode: TEditMode;
    OutputQuery: TIBQuery;
    Self: TForm;
    Date_Order: TDate;
    var ID_ORDER: Integer;
    Num_Order: string = '';
    Note: string = '';
    aSub_Item: Integer = -1;
    aId_Order_Group: Integer = -1;
    aIntro: string = ''): Boolean;
var
    temp: TAcceptToWorkForm;
    temp2: TDismissManForm;
    temp3: TManPunishingAddForm;
    temp4: TManPunishingRemoveForm;
    temp5: TManAwardForm;
    temp6: TMoveManForm;
    temp7: TManBonusForm;
    temp8: TManBonusRemoveForm;
    temp9: TManPrivForm;
    temp10: TManPrivRemoveForm;
    temp11: TToDoListForm;
    temp12: TManHolidayForm;
    temp13: TChangeManBonusForm;
    temp14: TPremiaOrderForm;
    temp18: TDikretHollidayOrderForm;
    temp19: TManComandForm;
    temp20: TIncreaseOrderForm;
    temp21: TManWorkModeChangeForm;
    temp22: TAddHoursOrderForm;
    temp23: THolidayBackForm;
    temp24: TBoHoliday;
    temp25: TManIoForm;
    temp29: TfmHolidayCompensOrder;
    temp31: TfmProlongManOrder;
    Query: TIBQuery;
    BplName: string;
    Sp: TSprav;
    SpMode: Integer;
    Input: TRxMemoryData;
begin
    ShowOrder := True;

    Query := TIbQuery.Create(Self);
    Query.Transaction := ReadTransaction;
    Query.SQL.Text := 'SELECT bpl_name FROM order_type where id_order_type = ' + IntToStr(aID_ORDER_TYPE);
    Query.Open;

    Id_Order := -1;

    NewOrder := False;

    if (not Query.IsEmpty) and (not VarIsNull(Query['BPL_NAME'])) then
    begin
        BplName := Query['BPL_NAME'];
        NewOrder := True;

        try
            // создать справочник
            sp := GetSprav(BplName);
            if sp <> nil then
            begin
                // заполнить входные параметры
                Sp.input.Open;

                with sp.Input do
                begin

                    Append;
                    FieldValues['Id_Order_Type'] := aId_Order_Type;
                    FieldValues['Date_Order'] := Date_Order;
                    FieldValues['Id_Order'] := aId_Order;
                    FieldValues['Num_Item'] := aNum_Item;
                    FieldValues['Sub_Item'] := aSub_Item;
                    FieldValues['Id_Order_Group'] := aId_Order_Group;
                    FieldValues['Intro'] := aIntro;

                    if FindField('Num_Order') <> nil then
                        FieldValues['Num_Order'] := Num_Order;

                    if FindField('Note_Order') <> nil then
                        FieldValues['Note_Order'] := Note;

                    if FindField('SpType') <> nil then
                        FieldValues['SpType'] := 0;

                    // Системные переменные
                    FieldValues['DBHANDLE'] := Integer(PersonalCommon.FIBDatabase.Handle);

                    case EditMode of
                        emNew: SpMode := 1;
                        emModify: SpMode := 2;
                        emView: SpMode := 3;
                    end;

                    FieldValues['SpMode'] := SpMode;
                    Post;
                end;

                // показать справочник и проанализировать результат (выбор одного подр.)
                sp.Show;

                if (sp.Output <> nil) and not sp.Output.IsEmpty then
                begin

                    if SpMode = 1 then
                        Id_Order := sp.Output['New_Id_Order']
                    else
                        Id_Order := aId_Order;

                    if Id_Order > 0 then
                    begin
                        Result := True;

                        // переформировываем по приказу таблицу для поиска
                        if id_order <> -1 then begin
                            OutputQuery.Close;
                            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDERS_PCARD_INDEX_INSERT(' + IntToStr(Id_Order) + ')';
                            ExecQuery(OutputQuery);
                        end;

                        Query.Free;
                        exit;
                    end
                    else
                    begin
                        Result := False;
                        Query.Free;
                        exit;
                    end;
                end;
            end;

            sp.Free;

        except on E: Exception do
            begin
                ErrMsg('Виникла помилка: "' + E.message + '"');
                Result := False;
                Query.Free;
                exit;
            end;
        end;


        Result := True;
        Query.Free;
        exit;
    end;

    // Если это приказ на Принятие человека

    if (aID_ORDER_TYPE = 2) then
    begin
        temp := TAcceptToWorkForm.Create(Self);
        temp.FMode := EditMode;
        temp.ID_ORDER := aID_ORDER;
        temp.NUM_ITEM := aNUM_ITEM;
        temp.ORDER_DATE := Date_Order;
        temp.ID_ORDER_TYPE := aID_ORDER_TYPE;
        temp.NUM_ORDER := NUM_ORDER;
        temp.Note_Order := Note;

        if temp.Prepare then temp.ShowModal;

        if temp.ModalResult <> mrOk then
            ShowOrder := False
        else
        begin

            ID_ORDER := temp.ID_ORDER;

            if Id_Order <> -1 then
            begin
                OutputQuery.Close;
                OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UTIL_WORK_MODE_COPY_BY_ORDER(' + IntToStr(id_order) + ')';
                ExecQuery(OutputQuery);
            end;
        end;

        temp.Free;

    end
    else

    // Если это приказ на П Е Р Е М Е Щ Е Н И Е человека  -- а чего большими буквами и в разрядку?
        if (aID_ORDER_TYPE = 3) then
        begin
            temp6 := TMoveManForm.Create(Self);
            temp6.FMode := EditMode;
            temp6.ID_ORDER := aID_ORDER;
            temp6.NUM_ITEM := aNUM_ITEM;
            temp6.ORDER_DATE := Date_Order;
            temp6.ID_ORDER_TYPE := aID_ORDER_TYPE;
            temp6.NUM_ORDER := NUM_ORDER;
            temp6.Note_Order := Note;

            if temp6.Prepare then temp6.ShowModal;

            if temp6.ModalResult <> mrOk then
                ShowOrder := False
            else
            begin

                ID_ORDER := temp6.ID_ORDER;

                if Id_Order <> -1 then
                begin
                    OutputQuery.Close;
                    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UTIL_WORK_MODE_COPY_BY_ORDER(' + IntToStr(id_order) + ')';
                    ExecQuery(OutputQuery);
                end;
            end;

            temp6.Free;

        end
        else
  {// Если это приказ об Увольнения человека}if (aID_ORDER_TYPE = 4) then
            begin
                temp2 := TDismissManForm.Create(Self);
                temp2.FMode := EditMode;
                temp2.ID_ORDER := aID_ORDER;
                temp2.ORDER_DATE := Date_Order;
                temp2.ID_ORDER_TYPE := aID_ORDER_TYPE;
                temp2.NUM_ORDER := NUM_ORDER;
                temp2.Note_Order := Note;
    //temp2.ID_ACTION := aID_ACTION;
                temp2.NUM_ITEM := aNUM_ITEM;
                if temp2.PrepareForm then temp2.ShowModal;
                if temp2.ModalResult <> mrOk then
                    ShowOrder := False
                else
                    ID_ORDER := temp2.ID_ORDER;
                temp2.Free;
            end
            else
  {// Если это приказ Про накладання стягнення}if (aID_ORDER_TYPE = 5) then
                begin
                    temp3 := TManPunishingAddForm.Create(Self);
                    temp3.FMode := EditMode;
                    temp3.Id_Order := aID_ORDER;
                    temp3.Num_Item := aNUM_ITEM;
                    temp3.Num_Order := NUM_ORDER;
                    temp3.Order_Date := Date_Order;
                    temp3.Id_Order_type := aID_ORDER_TYPE;
                    temp3.Note_Order := Note;
                    temp3.Prepare;
                    temp3.ShowModal;
    //if temp3.ModalResult <> mrOk then CheckAction := False;
                    ID_ORDER := temp3.Id_Order;
                    temp3.Free;
                end
                else if (aID_ORDER_TYPE = 6) then
                begin
                    temp4 := TManPunishingRemoveForm.Create(Self);
                    temp4.FMode := EditMode;
                    temp4.Id_Order := aID_ORDER;
                    temp4.Num_Item := aNUM_ITEM;
                    temp4.Num_Order := NUM_ORDER;
                    temp4.Order_Date := Date_Order;
                    temp4.Id_Order_type := aID_ORDER_TYPE;
                    temp4.Note_Order := Note;
                    temp4.Prepare;
                    temp4.ShowModal;
    //if temp4.ModalResult <> mrOk then CheckAction := False;
                    ID_ORDER := temp4.Id_Order;
                    temp4.Free;
                end
                else if (aID_ORDER_TYPE = 7) then
                begin
                    temp5 := TManAwardForm.Create(Self);
                    temp5.FMode := EditMode;
                    temp5.ORDER_DATE := Date_Order;
                    temp5.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp5.NUM_ORDER := NUM_ORDER;
                    temp5.Note_Order := Note;
                    temp5.Prepare(aID_ORDER, NUM_ORDER, aNUM_ITEM, Date_Order);
                    temp5.ShowModal;
    //if temp5.ModalResult <> mrOk then CheckAction := False
                    ID_ORDER := temp5.Id_Order;
                    temp5.Free;
                end
                else if (aID_ORDER_TYPE = 8) then
                begin
                    temp7 := TManBonusForm.Create(Self, aID_ORDER_TYPE, DATE_ORDER, NUM_ORDER, NOTE, EditMode, aID_ORDER, aNUM_ITEM);
                    temp7.Order_Date := Date_Order;
                    temp7.ShowModal;
                    ID_ORDER := temp7.ID_ORDER;
                    temp7.Free;
                end
                else if (aID_ORDER_TYPE = 9) then
                begin
                    temp13 := TChangeManBonusForm.Create(Self);
                    temp13.FMode := EditMode;
                    temp13.ID_ORDER := aID_ORDER;
                    temp13.NUM_ITEM := aNUM_ITEM;
                    temp13.ORDER_DATE := Date_Order;
                    temp13.NUM_ORDER := NUM_ORDER;
                    temp13.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp13.Note_Order := Note;
                    temp13.Prepare;
                    temp13.ShowModal;
                    ID_ORDER := temp13.ID_ORDER;
                    temp13.Free;
                end
                else if (aID_ORDER_TYPE = 10) then
                begin
                    temp8 := TManBonusRemoveForm.Create(Self);
                    temp8.FMode := EditMode;
                    temp8.ID_ORDER := aID_ORDER;
                    temp8.ORDER_DATE := Date_Order;
                    temp8.NUM_ORDER := NUM_ORDER;
                    temp8.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp8.Note_Order := Note;
                    temp8.Prepare;
                    temp8.ShowModal;
                    ID_ORDER := temp8.ID_ORDER;
                    temp8.Free;
                end
                else if (aID_ORDER_TYPE = 13) then
                begin
                    temp9 := TManPrivForm.Create(Self);
                    temp9.FMode := EditMode;
                    temp9.ID_ORDER := aID_ORDER;
                    temp9.NUM_ITEM := aNUM_ITEM;
                    temp9.ORDER_DATE := Date_Order;
                    temp9.NUM_ORDER := NUM_ORDER;
                    temp9.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp9.Note_Order := Note;
                    temp9.PrepareForm;
                    temp9.ShowModal;
                    ID_ORDER := temp9.ID_ORDER;
                    temp9.Free;
                end
                else if (aID_ORDER_TYPE = 14) then
                begin
                    temp10 := TManPrivRemoveForm.Create(Self);
                    temp10.FMode := EditMode;
                    temp10.ID_ORDER := aID_ORDER;
                    temp10.NUM_ITEM := aNUM_ITEM;
                    temp10.Order_Date := Date_Order;
                    temp10.NUM_ORDER := NUM_ORDER;
                    temp10.Note_Order := Note;
                    temp10.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp10.Prepare;
                    temp10.ShowModal;
                    ID_ORDER := temp10.Id_Order;
                    temp10.Free;
                end
                else if (aID_ORDER_TYPE = 15) then
                begin
                    temp11 := TToDoListForm.Create(Self);
                    temp11.FMode := EditMode;
                    temp11.ID_ORDER := aID_ORDER;
                    temp11.NUM_ITEM := aNUM_ITEM;
                    temp11.ORDER_DATE := Date_Order;
                    temp11.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp11.NUM_ORDER := NUM_ORDER;
                    temp11.Note_ORDER := Note;
                    if temp11.PrepareForm then temp11.ShowModal;
                    if temp11.ModalResult <> mrOk then
                        ShowOrder := False
                    else
                        ID_ORDER := temp11.ID_ORDER;
                    temp11.Free;
                end
                else if (aID_ORDER_TYPE = 16) then
                begin
                    temp12 := TManHolidayForm.Create(Self);
                    temp12.ORDER_DATE := Date_Order;
                    temp12.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp12.NUM_ORDER := NUM_ORDER;
                    temp12.Note_Order := Note;
                    temp12.FMode := EditMode;
                    temp12.ID_ORDER := aId_Order;
                    temp12.NUM_ITEM := aNum_Item;

                    temp12.Prepare;
                    temp12.ShowModal;

                    if temp12.ID_ORDER = -1 then
                        ShowOrder := False
                    else
                        ID_ORDER := temp12.ID_ORDER;

                    temp12.Free;
                end
                else if (aID_ORDER_TYPE = 17) or (aID_ORDER_TYPE = 21) then
                begin
                    temp14 := TPremiaOrderForm.Create(Self);
                    temp14.FMode := EditMode;
                    temp14.ID_ORDER := aID_ORDER;
                    temp14.NUM_ITEM := aNUM_ITEM;
                    temp14.ORDER_DATE := Date_Order;
                    temp14.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp14.NUM_ORDER := NUM_ORDER;
                    temp14.Note_Order := Note;
                    temp14.Prepare;
                    temp14.ShowModal;
                    if temp14.ID_ORDER = -1 then
                        ShowOrder := False
                    else
                        ID_ORDER := temp14.ID_ORDER;
                    temp14.Free;
                end
                else if (aID_ORDER_TYPE = 18) then
                begin
                    temp18 := TDikretHollidayOrderForm.Create(Self);
                    temp18.FMode := EditMode;
                    temp18.ID_ORDER := aID_ORDER;
                    temp18.NUM_ITEM := aNUM_ITEM;
                    temp18.ORDER_DATE := Date_Order;
                    temp18.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp18.NUM_ORDER := NUM_ORDER;
                    temp18.Note_Order := Note;
                    if temp18.Prepare then temp18.ShowModal;
                    if temp18.ModalResult <> mrOk then
                        ShowOrder := False
                    else
                        ID_ORDER := temp18.ID_ORDER;
                    temp18.Free;
                end
                else if (aID_ORDER_TYPE = 19) then
                begin
                    temp19 := TManComandForm.Create(Self);
                    temp19.FMode := EditMode;
                    temp19.ID_ORDER := aID_ORDER;
                    temp19.NUM_ITEM := aNUM_ITEM;
                    temp19.ORDER_DATE := Date_Order;
                    temp19.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp19.NUM_ORDER := NUM_ORDER;
                    temp19.Note_Order := Note;
                    temp19.Prepare;
                    if temp19.ShowModal <> mrOk then
                        ShowOrder := False
                    else
                        ID_ORDER := temp19.ID_ORDER;
                    temp19.Free;
                end
                else if (aID_ORDER_TYPE = 20) and (EditMode = emNew) then
                begin

                    if not NewOrders then
                        MessageDlg('Для цього типу наказів уся інформація міститься у додаткових пунктах!', mtWarning, [mbOk], 0);

                    OutputQuery.Close;
                    OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(aID_ORDER_TYPE) + ',' +
                        QuotedStr(Num_ORDER) + ',''' +
                        DateToStr(Date_Order) + ''',' +
                        QuotedStr(Note) + ',' +
                        IntToStr(1) + ');';
                    ID_ORDER := ExecQuery(OutputQuery);
                end
                else if (aID_ORDER_TYPE = 22) then
                begin
                    temp20 := TIncreaseOrderForm.Create(Self);
                    temp20.FMode := EditMode;
                    temp20.ID_ORDER := aID_ORDER;
                    temp20.ORDER_DATE := Date_Order;
                    temp20.ID_ORDER_TYPE := aID_ORDER_TYPE;
                    temp20.NUM_ORDER := NUM_ORDER;
                    temp20.Note_Order := Note;
                    temp20.Prepare;
                    if temp20.ShowModal <> mrOk then
                        ShowOrder := False
                    else
                        ID_ORDER := temp20.ID_ORDER;
                    temp20.Free;
                end
                else if (aID_ORDER_TYPE = 23) then
                begin
                    temp21 := TManWorkModeChangeForm.Create(Self, aID_ORDER_TYPE, DATE_ORDER, NUM_ORDER, NOTE, EditMode, aID_ORDER, aNUM_ITEM);
                    temp21.Order_Date := Date_Order;
                    temp21.ShowModal;
                    ID_ORDER := temp21.ID_ORDER;
                    temp21.Free;
                end
                else if (aID_ORDER_TYPE = 24) then
                begin
                    temp22 := TAddHoursOrderForm.Create(Self, aID_ORDER_TYPE, Date_Order, Num_Order, Note, EditMode, aID_ORDER);

                    temp22.ShowModal;

                    ID_ORDER := temp22.ID_ORDER;

                    temp22.Free;
                end
                else if (aID_ORDER_TYPE = 25) then
                begin
                    temp23 := THolidayBackForm.Create(Self, aID_ORDER_TYPE, Date_Order, Num_Order, Note, EditMode, aID_ORDER);

                    temp23.ShowModal;

                    ID_ORDER := temp23.ID_ORDER;

                    temp23.Free;
                end
                else if (aID_ORDER_TYPE = 26) then
                begin
                    temp24 := TBoHoliday.Create(Self, aID_ORDER_TYPE, Date_Order, Num_Order, Note, EditMode, aID_ORDER);

                    temp24.ShowModal;

                    if EditMode = emNew then
                        ID_ORDER := temp24.ID_ORDER;

                    temp24.Free;
                end
                else if (aID_ORDER_TYPE = 27) then
                begin
                    temp25 := TManIoForm.Create(Self, aID_ORDER_TYPE, Date_Order, Num_Order, Note, EditMode, aID_ORDER);

                    temp25.ShowModal;

                    if EditMode = emNew then
                        ID_ORDER := temp25.ID_ORDER;

                    temp25.Free;
                end
                else if (aID_ORDER_TYPE = 29) then
                begin
                    temp29 := TfmHolidayCompensOrder.Create(Self);

                    if EditMode = emNew then
                    begin
                        PersonalCommon.WriteTransaction.StartTransaction;
                        try
                            OutputQuery.Close;
                            OutputQuery.SQL.Text := 'SELECT NEW_ID_ORDER FROM INSERT_ORDER(0,' + IntToStr(aID_ORDER_TYPE) + ',' + QuotedStr(Num_ORDER) + ',''' + DateToStr(Date_Order) + ''',' + QuotedStr(NOTE) + ',' + IntToStr(1) + ');';
                            aId_Order := ExecQuery(OutputQuery);
                        except on e: Exception do
                            begin
                                PersonalCommon.WriteTransaction.Rollback;
                                MessageDlg('При занесенні данних у базу виникла помилка:' + '"' + e.Message + '"', mtError, [mbOk], 0);
                                temp29.Free;
                                exit;
                            end;
                        end;
                        PersonalCommon.WriteTransaction.Commit;
                    end;

                    temp29.Id_Order := aID_ORDER;
                    temp29.ResultQuery.Close;
                    temp29.ResultQuery.ParamByName('where').Value := aID_ORDER;
                    temp29.ResultQuery.Open;

                    temp29.ShowModal;

                    if EditMode = emNew then
                        ID_ORDER := temp29.ID_ORDER;

                    temp29.Free;
                end
                else if (aID_ORDER_TYPE = 31) then
                begin
                    temp31 := TfmProlongManOrder.Create(Self);
                    temp31.aFMode := EditMode;
                    temp31.aIdOrder := aID_ORDER;
                    temp31.aDateOrder := Date_Order;
                    temp31.aIdOrderType := aID_ORDER_TYPE;
                    temp31.aNumOrder := NUM_ORDER;
                    temp31.aNoteOrder := Note;
                    temp31.Prepare;

                    if temp31.ShowModal <> mrOk then
                        ShowOrder := False
                    else
                        Id_Order := temp31.IdOrder.Value;

                    temp31.Free;
                end
                else
                begin
                    MessageDlg('Цей тип наказу ще не функціонує', mtError, [mbOk], 0);
                    Result := False;
                end;

    if (EditMode = emNew) and (id_order <> -1) then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'UPDATE ORDERS SET OWNER_ID_PCARD = '
            + IntToStr(CurrentID_PCARD)
            + ' WHERE ID_ORDER = ' + IntToStr(Id_Order);
        ExecQuery(OutputQuery);

        // проставляем группу приказов и пункт и прочее
        if aId_Order_Group <> -1 then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDERS_ITEM_AFTER_ADD(' + IntToStr(aId_Order_Group) + ',' +
                IntToStr(id_order) + ',' +
                IntToStr(aNum_Item) + ',' +
                IntToStr(aSub_Item) + ',' +
                QuotedStr(aIntro) + ')';
            ExecQuery(OutputQuery);
        end;
    end;

    // переформировываем по приказу таблицу для поиска
    if id_order <> -1 then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ASUP_ORDERS_PCARD_INDEX_INSERT(' + IntToStr(Id_Order) + ')';
        ExecQuery(OutputQuery);
    end;
end;

function DrawWorkModeExample(Grid: TStringGrid; Date1, Date2: TDate; Id_Work_Mode, Shift: Integer; Col_Count: Integer): Integer;
var
    span: TTableDaySpan;
    i: Integer;
    real_shift: Integer;
    s, s2, s3: string;
begin
    try
        // Готовим Грид

        Grid.RowCount := 3;
        Grid.ColCount := Col_Count + 1;
        Grid.FixedCols := 1;
        Grid.FixedRows := 2;
        Grid.DefaultColWidth := 40;
        Grid.DefaultRowHeight := 20;
        Grid.FixedColor := RGB(220, 250, 255);
        Grid.Color := clInfoBk;
        Grid.Cells[0, 1] := 'Дата';
        Grid.Cells[0, 2] := 'Годин';

{
        // возвратить реальную сдвижку исходя из сдвижки отн. какой-то даты
        // и самой этой даты

        real_shift :=  ConvertShift(Shift, Date1);
        WorkModeCenter.Id_Work_Mode := Id_Work_Mode;
        WorkModeCenter.Shift := real_shift;
        real_shift := WorkModeCenter.NormalizedShift;
}
            // пользуемся только реальной сдвижкой, ну ее нахх относительную
        WorkModeCenter.Id_Work_Mode := Id_Work_Mode;
        WorkModeCenter.Shift := Shift;
        real_shift := WorkModeCenter.NormalizedShift;
        result := real_shift;

        // создать промежуток дней табеля

        span := TTableDaySpan.Create(Date1, Date1 + Col_Count);

        // выбрать все клетки

        span.SelectAll;

        // установить режим и сдвижку

        span.SetMode(Id_Work_Mode, real_shift, 1);

        // подсчитать часы

        span.CalcDays;

        // вывести строчку часов

        for i := 1 to span.Count do
        begin

            if MonthOf(Date1 + i - 1) < 10 then
                s := '0'
            else
                s := '';

            if DayOfTheMonth(Date1 + i - 1) < 10 then
                s2 := '0'
            else
                s2 := '';

            case DayOfTheWeek(Date1 + i - 1) of
                1: s3 := 'Пн';
                2: s3 := 'Вт';
                3: s3 := 'Ср';
                4: s3 := 'Чт';
                5: s3 := 'Пт';
                6: s3 := 'Сб';
                7: s3 := 'Нд';
            end;

            Grid.Cells[i, 0] := s3;
            Grid.Cells[i, 1] := s2 + IntToStr(DayOfTheMonth(Date1 + i - 1)) + '.' + s + IntToStr(MonthOf(Date1 + i - 1));
            if span[i].WorkDay then
                Grid.Cells[i, 2] := FormatFloat('#0.###', span[i].Hours.Hours)
            else
                Grid.Cells[i, 2] := ' - ';
        end;

        // освободить строчку

        span.Free;
    except
    end;
end;

function CheckQueryForDel(Query: TIBQuery): Boolean;
begin

    if Query.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        result := false;
        exit;
    end;

    result := (MessageDlg('Ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) = mrYes);

end;

function CheckQueryForModify(Query: TIBQuery): Boolean;
begin

    if Query.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        result := false;
        exit;
    end;

    result := true;
end;

procedure QueryCloseOpen(Query: TIBQuery; ID_Field: string; Id_Value: Integer = -1);
var
    old_id: Integer;
begin
    if id_value = -1 then
        old_id := Query.FieldValues[Id_Field].Value
    else
        old_id := id_value;

    Query.Close;
    Query.Open;

    Query.Locate(Id_Field, old_id, []);
end;

function CheckForFillBool(Check_Value: Boolean; Text: string): Boolean;
begin
    if not Check_Value then
    begin
        MessageDlg(Text, mtError, [mbOk], 0);
    end;

    result := Check_Value;
end;

function CheckForFill(Sender: TObject; Text: string): Boolean;
begin

    if Sender.ClassName = 'TMemo' then
    begin

        if (Sender as TMemo).Text = '' then
        begin
            MessageDlg('Потрібно заповнити поле "' + Text + '"', mtError, [mbOk], 0);
            CheckForFill := False;
            (Sender as TMemo).SetFocus;
            (Sender as TMemo).Color := RGB(255, 130, 132);
            exit;
        end;

        (Sender as TMemo).Color := clWhite;
        CheckForFill := True;
    end;

    if Sender.ClassName = 'TEdit' then
    begin

        if (Sender as TEdit).Text = '' then
        begin
            MessageDlg('Потрібно заповнити поле "' + Text + '"', mtError, [mbOk], 0);
            CheckForFill := False;
            (Sender as TEdit).SetFocus;
            (Sender as TEdit).Color := RGB(255, 130, 132);
            exit;
        end;

        (Sender as TEdit).Color := clWhite;
        CheckForFill := True;
    end;

    if Sender.ClassName = 'TCheckEdit' then
    begin

        if (Sender as TCheckEdit).Text = '' then
        begin
            MessageDlg('Потрібно заповнити поле "' + Text + '"', mtError, [mbOk], 0);
            CheckForFill := False;
            (Sender as TCheckEdit).SetFocus;
            (Sender as TCheckEdit).Color := RGB(255, 130, 132);
            exit;
        end;

        (Sender as TCheckEdit).Color := clWhite;
        CheckForFill := True;
    end;

    if Sender.ClassName = 'TSpComboBox' then
    begin

        if (Sender as TSpComboBox).getId = -1 then
        begin
            MessageDlg('Потрібно вибрати поле "' + Text + '"', mtError, [mbOk], 0);
            CheckForFill := False;
            (Sender as TSpComboBox).SetFocus;
            (Sender as TSpComboBox).Color := RGB(255, 130, 132);
            exit;
        end;

        (Sender as TSpComboBox).Color := clWhite;
        CheckForFill := True;
    end;
end;

function getpcard(aDate: TDate; ShowWorking: Boolean = True; CanRemoveFilter: Boolean = False): integer;
begin
    if (pcardform = nil)
        or ((pcardform <> nil) and (pcardform.Cur_Date <> aDate)) {// мля!!!!!} then
    begin
        pcardform := TPCardsViewForm.Create(nil, ShowWorking, CanRemoveFilter, aDate);
        pcardform.Select := True;
    end;

    if pcardForm.ShowModal = mrOk then
    begin
        pcardForm.SearchEdit.Text := '';
        try
            result := pcardForm.ResultQueryID_PCARD.Value;
            Fam := pcardForm.ResultQuery['Familia'] + ' ' + pcardForm.ResultQuery['Imya'] + ' ' + pcardForm.ResultQuery['Otchestvo'];
            TN := pcardForm.ResultQuery['TN'];
        except
            ShowMessage('Помилка при getpcard');
        end
    end
    else
    begin
        result := -1;
        Fam := '';
    end;
end;

end.
