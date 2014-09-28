{-$Id: OrdersViewUnit.pas,v 1.31 2009/12/21 12:26:25 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Отображение приказов"                          }
{    Создание/редактирование/удаление/подписание/отклонение и т.д. приказов    }
{    Ответственный: Кропов Валентин                                            }


unit OrdersViewUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, SpComboBox,
  Buttons, DBCtrls, ExtCtrls, SpCommon,
  ComCtrls, ToolWin, Mask, IBDatabase, PersonalCommon, IBEvents, variants,
  ADODB, Buffer, Menus, NagScreenUnit, SpFormUnit, ProcessUnit,
  CheckEditUnit, cxControls, cxSplitter, ActnList, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TOrdersViewForm = class(TForm)
    InputQuery: TIBQuery;
    OrdersDataSource: TDataSource;
    OrderGrid: TDBGrid;
    OutputQuery: TIBQuery;
    Panel1: TPanel;
    Label1: TLabel;
    StatusText: TDBText;
    Label2: TLabel;
    TempQuery: TIBQuery;
    Temp2Query: TIBQuery;
    Name_Type: TDBText;
    ButtonsPanel: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SignButton: TSpeedButton;
    StopButton: TSpeedButton;
    DoButton: TSpeedButton;
    FormButton: TSpeedButton;
    CancelButton: TSpeedButton;
    UnFormButton: TSpeedButton;
    BufferQuery: TIBQuery;
    BufferTransaction: TIBTransaction;
    BufTranQuery: TIBQuery;
    IBBufferQuery: TIBQuery;
    SortMenu: TPopupMenu;
    Nomer: TMenuItem;
    DateSort: TMenuItem;
    Typ: TMenuItem;
    ServerCheckQuery: TIBQuery;
    ServerCheckQueryIS_GPP: TIBStringField;
    ServerCheckQueryID_SERVER: TIntegerField;
    N1: TMenuItem;
    N3: TMenuItem;
    InputQueryEXEC_DATETIME: TDateTimeField;
    InputQueryID_ORDER: TIntegerField;
    InputQueryID_ORDER_TYPE: TIntegerField;
    InputQueryID_STATUS: TIntegerField;
    InputQueryNUM_ORDER: TIBStringField;
    InputQueryNAME_TYPE: TIBStringField;
    InputQueryDATE_ORDER: TDateField;
    InputQueryNOTE: TIBStringField;
    InputQueryNAME_STATUS: TIBStringField;
    InputQuerySTANDART_ACTION: TIntegerField;
    InputQueryYOUR_SIGN_STATUS: TIntegerField;
    InputQueryPRINT_NAME: TIBStringField;
    InputQueryINTRO: TIBStringField;
    SelectButton: TSpeedButton;
    InfoButton: TSpeedButton;
    SearchPanel: TPanel;
    SearchLabel: TLabel;
    SearchEdit: TEdit;
    Label5: TLabel;
    SearchNextButton: TSpeedButton;
    AllLabel: TLabel;
    FilterBox: TGroupBox;
    FilterDateEnd: TCheckBox;
    DateEnd: TDateTimePicker;
    DateBeg: TDateTimePicker;
    FilterDateBeg: TCheckBox;
    FilterFio: TCheckBox;
    FilterType: TCheckBox;
    ShowAllOrders: TCheckBox;
    OtdelFilter: TCheckBox;
    SelectFio: TButton;
    FilterOtdelBox: TSpComboBox;
    FioEdit: TEdit;
    DateSort2: TMenuItem;
    ServerBox: TSpComboBox;
    SendToZpButton: TSpeedButton;
    ActionList: TActionList;
    CloseAction: TAction;
    AddAction: TAction;
    ModifyAction: TAction;
    MainInfoAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    PrintAction: TAction;
    MakeAction: TAction;
    UnMakeAction: TAction;
    SelectAction: TAction;
    SendToZpAction: TAction;
    Panel2: TPanel;
    Label3: TLabel;
    InputQueryZ_SHOW_IN_ZP_STR: TIBStringField;
    InputQueryZ_SHOW_IN_ZP: TIBStringField;
    ShowIdAction: TAction;
    InputQueryOWNER_ID_PCARD: TIntegerField;
    Buffer2Query: TIBQuery;
    DSTypeOrder: TpFIBDataSet;
    ReadTr: TpFIBTransaction;
    DataSourceTypeOrder: TDataSource;
    CBTypeOrders: TcxLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure OrderGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OrderGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure SignButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormButtonClick(Sender: TObject);
    procedure OrderGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure InputQueryAfterOpen(DataSet: TDataSet);
    procedure WriteOrderToDbf(ID_Action: Integer);
    procedure WriteOrderToDbf2(ID_Action: Integer);
    procedure NomerClick(Sender: TObject);
    procedure TypClick(Sender: TObject);
    procedure DateSortClick(Sender: TObject);
    procedure ShowAllOrdersClick(Sender: TObject);
    procedure OrderGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N3Click(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure OrderGridKeyPress(Sender: TObject; var Key: Char);
    procedure SearchNextButtonClick(Sender: TObject);
    procedure InputQueryAfterScroll(DataSet: TDataSet);
    procedure AllLabelClick(Sender: TObject);
    procedure FilterTypeClick(Sender: TObject);
    procedure FilterAccept(order_by: string = '');
    procedure FilterTypeBoxChange(Sender: TObject);
    procedure FilterOtdelBoxChange(Sender: TObject);
    procedure DateBegChange(Sender: TObject);
    procedure DateEndChange(Sender: TObject);
    procedure FilterDateBegClick(Sender: TObject);
    procedure FilterDateEndClick(Sender: TObject);
    procedure SelectFioClick(Sender: TObject);
    procedure FilterFioClick(Sender: TObject);
    procedure DateSort2Click(Sender: TObject);
    procedure ServerBoxChange(Sender: TObject);
    procedure ToZpButtonClick(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
    procedure ModifyActionExecute(Sender: TObject);
    procedure MainInfoActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure MakeActionExecute(Sender: TObject);
    procedure UnMakeActionExecute(Sender: TObject);
    procedure SelectActionExecute(Sender: TObject);
    procedure SendToZpActionExecute(Sender: TObject);
    procedure ShowIdActionExecute(Sender: TObject);
    procedure CBTypeOrdersPropertiesChange(Sender: TObject);
    procedure CBTypeOrdersPropertiesCloseUp(Sender: TObject);
    procedure CBTypeOrdersPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrdersViewForm: TOrdersViewForm;
  i: Integer;
  ID_PCARD: Integer;
  NagScreen: TNagScreen;
  ViewMode: Boolean;

implementation

uses AcceptToWorkUnit, OrdersEditUnit, MainUnit, PCardsDetailsUnit, EditControl, PrintOrderUnit, AccMgmt,
  GoodFunctionsUnit, uBuffer2, Clipbrd;
{$R *.DFM}


procedure TOrdersViewForm.FilterAccept(order_by: string = '');
var
  f_type: Integer;
  f_pcard: Integer;
  f_workmode: Integer;
  f_datebeg: TDate;
  f_dateend: TDate;
  id_server: Integer;
begin
  if Self.Visible = false
    then exit;

  InputQuery.Close;

  if not ShowAllOrders.Checked
    then InputQuery.SQL.Text := 'SELECT * FROM Asup_Orders_Sel('+IntToStr(GetUserId)+', :USER_ID_PCARD, :ID_PCARD, :Filter_Id_Order_Type, :Work_Mode, :date_beg, :date_end) order by ID_STATUS Asc'
  else InputQuery.SQL.Text := 'SELECT * FROM GET_ORDERS_LOCAL_2(:ID_SERVER, :USER_ID_PCARD, :ID_PCARD, :Filter_Id_Order_Type, :Work_Mode, :date_beg, :date_end) order by ID_STATUS Asc';

  InputQuery.SQL.Text := InputQuery.SQL.Text + order_by;

  if FilterFio.Checked
    then
    f_pcard := id_pcard
  else
    f_pcard := -1;

  if ShowAllOrders.Checked
    then
    id_server := ServerBox.GetId
  else
    id_Server := -1;

  if FilterType.Checked
    then
   // f_type := FilterTypeBox.GetId
    f_type := CBTypeOrders.EditValue
  else
    f_type := -1;

  if OtdelFilter.Checked
    then
    f_workmode := FilterOtdelBox.GetId
  else
    f_workmode := -1;

  if FilterDateBeg.Checked
    then
    f_datebeg := DateBeg.Date
  else
    f_datebeg := StrToDate('01.01.1900');

  if FilterDateEnd.Checked
    then
    f_dateend := DateEnd.Date
  else
    f_dateend := StrToDate('01.01.1900');

  InputQuery.Params.ParamValues['USER_ID_PCARD'] := CurrentID_PCARD;
  InputQuery.Params.ParamValues['ID_PCARD'] := f_pcard;
  InputQuery.Params.ParamValues['FILTER_ID_ORDER_TYPE'] := f_type;
  InputQuery.Params.ParamValues['WORK_MODE'] := f_workmode;
  InputQuery.Params.ParamValues['DATE_BEG'] := DateToStr(f_DateBeg);
  InputQuery.Params.ParamValues['DATE_END'] := DateToStr(f_DateEnd);
  if ShowAllOrders.Checked then InputQuery.Params.ParamValues['ID_SERVER'] := id_server;

  NAgScreen := TNagScreen.Create(Self);
  NagScreen.Show;
  NagScreen.SetStatusText('відбір даних...');

  try
    InputQuery.Open;
  except
      on E: Exception do
      begin
          MessageDlg(E.Message, mtError, [mbOk], 0);
          InputQuery.Transaction.Rollback;
          Exit;
      end;
  end;
  NagScreen.Free;

    //if InputQuery.IsEmpty then InputQuery.Close;

  GridResize(OrderGrid);
end;

procedure TOrdersViewForm.FormShow(Sender: TObject);
begin
  if CheckAccess('/ROOT/Orders', 'Edit') <> 0 then
  begin
    AddButton.Enabled := False;
    DeleteButton.Enabled := False;
    FormButton.Enabled := False;
    SignButton.Enabled := False;
    StopButton.Enabled := False;
    DoButton.Enabled := False;
    UnFormButton.Enabled := False;
    ModifyButton.Caption := 'Перегляд';
    ViewMode := True;
  end
  else ViewMode := False;

  FilterAccept;
end;

procedure TOrdersViewForm.SpeedButton3Click(Sender: TObject);
begin
  InputQuery.Close;
  InputQuery.Open;
end;

procedure TOrdersViewForm.OrderGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_SELECT: ModifyButton.Click;
    VK_DELETE: DeleteButton.Click;
    VK_SPACE: ModifyButton.Click;
    VK_ADD: AddButton.Click;
  end;
end;

procedure TOrdersViewForm.OrderGridDblClick(Sender: TObject);
begin
  if not SelectButton.Visible
    then ModifyButton.Click
  else SelectButton.Click;
end;

procedure TOrdersViewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild
    then Action := caFree;

  ServerBox.SaveIntoRegistry;
 // FilterTypeBox.SaveIntoRegistry;
  FilterOtdelBox.SaveIntoRegistry;
end;

procedure TOrdersViewForm.FormResize(Sender: TObject);
begin
  GridResize(OrderGrid);

  FilterBox.Width := ButtonsPanel.Width - 5;
end;

procedure TOrdersViewForm.SignButtonClick(Sender: TObject);
var
  OLD_ID_ORDER: integer;
begin
  if (not InputQuery.IsEmpty)
    then begin
    //Если приказ ещё не сформирован, то не даем его подписать
    if (InputQuery['ID_STATUS'] = 1)
      then begin
      MessageDlg('Неможна підписувати наказ, який ще не сформований!', mtError, [mbOk], 0);
      Exit;
    end;
    if (InputQuery['ID_STATUS'] > 2)
      then begin
      MessageDlg('Неможливо підписати цей наказ: цей наказ вже є Підписаним/Відхиленим/Виконаним!', mtError, [mbOk], 0);
      Exit;
    end;
    if MessageDlg('Ви справді бажаєте підписати цей наказ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then begin
      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE CHANGE_ORDER_SIGN(' + IntToStr(InputQuery['ID_ORDER']) + ',' + IntToStr(CurrentID_PCARD) + ',' + IntToStr(3) + ');';
      ExecQuery(OutputQuery);
      //ShowMessage(OutputQuery.SQL.Text);
      OLD_ID_ORDER := InputQueryID_ORDER.Value;
      InputQuery.Close;
      InputQuery.Open;
      InputQuery.Locate('ID_ORDER', OLD_ID_ORDER, []);
    end;
  end
  else MessageDlg('Немає наказів!', mtError, [mbOk], 0);
end;

procedure TOrdersViewForm.StopButtonClick(Sender: TObject);
var
  OLD_ID_ORDER: integer;
begin
  if (not InputQuery.IsEmpty)
    then begin
    //Если приказ ещё не сформирован, то не даем его отклонить
    if (InputQuery['ID_STATUS'] = 1)
      then begin
      MessageDlg('Неможна відхилити наказ, який ще не сформований!', mtError, [mbOk], 0);
      Exit;
    end;
    if (InputQuery['ID_STATUS'] > 2)
      then begin
      MessageDlg('Неможливо відхилити цей наказ: цей наказ вже є Підписаним/Відхиленим/Виконаним!', mtError, [mbOk], 0);
      Exit;
    end;
    if MessageDlg('Ви справді бажаєте відхилити цей наказ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then begin
      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE CHANGE_ORDER_SIGN(' + IntToStr(InputQuery['ID_ORDER']) + ',' + IntToStr(CurrentID_PCARD) + ',' + IntToStr(4) + ');';
      ExecQuery(OutputQuery);
      //ShowMessage(OutputQuery.SQL.Text);
      OLD_ID_ORDER := InputQueryID_ORDER.Value;
      InputQuery.Close;
      InputQuery.Open;
      InputQuery.Locate('ID_ORDER', OLD_ID_ORDER, []);
    end;
  end else MessageDlg('Немає наказів!', mtError, [mbOk], 0);
end;

procedure TOrdersViewForm.FormCreate(Sender: TObject);
var
  id_server: Integer;
begin
  BufferTransaction.DefaultDatabase := PersonalCommon.Database;
  InputQuery.Transaction := PersonalCommon.ReadTransaction;
  TempQuery.Transaction := PersonalCommon.ReadTransaction;
  Temp2Query.Transaction := PersonalCommon.ReadTransaction;
  OutputQuery.Transaction := PersonalCommon.WriteTransaction;
  BufferQuery.Transaction := PersonalCommon.ReadTransaction;
  ServerCheckQuery.Transaction := PersonalCommon.ReadTransaction;

    // Проверяем является ли этот сервер сервером, на котором много приказов из разных РУ
  ServerCheckQuery.Close;
  ServerCheckQuery.Open;
  ShowAllOrders.Visible := (ServerCheckQueryIS_GPP.Value = 'T');
  ServerBox.Visible := (ServerCheckQueryIS_GPP.Value = 'T');
  ShowAllOrdersClick(self);

  DSTypeOrder.Database := Main.FIBDatabase;
  ReadTr.DefaultDatabase := Main.FIBDatabase;
  DSTypeOrder.Transaction := ReadTr;
  DSTypeOrder.Close;
  DSTypeOrder.SQLs.SelectSQL.Text := 'Select * from Asup_Type_Orders_Sel(' +
                                      IntToStr(GetUserId) + ')';
  try
      DSTypeOrder.Open;
  except
      on E:Exception do
      ShowMessage(E.Message);
  end;

  IBBufferQuery.Transaction := BufferTransaction;
    //CancelButton.Align := alRight;
    //SUnFormButton.Visible := AdminMode;

  ID_PCARD := -1;
  //FilterTypeBox.Prepare(-1, '');
  CBTypeOrders.EditValue := -1;
  FilterOtdelBox.Prepare(-1, '');
  DateBeg.Date := Date;
  DateEnd.Date := Date;

  FioEdit.Text := '';

  OtdelFilter.Enabled := AdminMode;
  FilterOtdelBox.Enabled := AdminMode;
  OtdelFilter.Checked := not AdminMode;

  OrderGrid.Columns[0].Visible := (Version = 2);
  SendToZpButton.Visible := (Version = 2);

  if Version = 1 then
    Label3.Caption := 'Ins - додати; Space - змінити; Ctrl-Space - осн. інф; Del - вилучити; Ctrl-P - друк; F9 - виконати; Ctrl-F9 - расформувати; Esc - закрити';

  if id_otdel = 0 then OtdelFilter.Checked := False;

  if Version = 2 then begin
    if id_otdel = 2
      then FilterOtdelBox.Prepare(2, 'Сектор праці та заробітної плати');

    if id_otdel = 1
      then FilterOtdelBox.Prepare(1, 'Служба кадрів');
  end;

  if ServerBox.Visible then begin
    id_server := GetCurServer;

    if id_server <> -1 then begin
      ServerBox.Prepare(Id_Server, 'ГПП');
      ShowAllOrders.Checked := True;
    end;
  end;

  FilterAccept;

end;

procedure TOrdersViewForm.FormButtonClick(Sender: TObject);
var
  OLD_ID_ORDER: integer;
begin
  if (not InputQuery.IsEmpty) and (InputQuery['ID_STATUS'] = 1)
    then begin

    if (CurrentID_PCARD <> GetOrderOwner(InputQueryID_ORDER.Value)) and (GetOrderOwner(InputQueryID_ORDER.Value) <> 0) and
      (not AdminMode)
      then begin
      ErrMsg('Ви не можете сформувати цей наказ, його може сформувати тільки власник. Власника можна змінити, для цього треба зайти під його паролем, відкрити наказ для редагування та змінити власника.');
      exit;
    end;

    if MessageDlg('Ви справді бажаєте сформувати цей наказ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

    PersonalCommon.WriteTransaction.StartTransaction;

    try
      //  Ставим Всем подписывающим статус "Неподписанный"
      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_SIGN_2(' + IntToStr(InputQuery['ID_ORDER']) + ',2);';
      ExecQuery(OutputQuery);

      //  Меняем Статус приказа
      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_2(' + IntToStr(InputQuery['ID_ORDER']) + ',2);';
      ExecQuery(OutputQuery);

    except on E: Exception do begin
      //
        MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
        PersonalCommon.WriteTransaction.Rollback;
        exit;
      end;
    end;
    PersonalCommon.WriteTransaction.Commit;

    OLD_ID_ORDER := InputQueryID_ORDER.Value;
    InputQuery.Close;
    InputQuery.Open;
    InputQuery.Locate('ID_ORDER', OLD_ID_ORDER, []);
  end
  else MessageDlg('Немає наказів, які треба сформувати або цей наказ вже сформований!', mtError, [mbOk], 0);
end;


procedure TordersViewForm.WriteOrderToDbf(ID_Action: Integer);
var
  ID_PBKEY: Integer;
  ID_ORDER_BEG: Integer;
  DATE_DISMISSION: TDate;
  ID_MAN_MOVING: Integer;
  IS_MOVING_FIRST: Boolean;
  Money: Double;
begin

  if ID_Action = 1 then begin

   // Для всех приказов пишем о них инфу в Pep_Ord.dbf
   // Получаем ID_PBKEY
    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_PEP_ORD(' + IntToStr(InputQuery['ID_ORDER']) + ');';
    BufferQuery.Open;
    BufferQuery.FetchAll;
    BufferQuery.First;

    while not BufferQuery.Eof do begin // Если по одному приказу много записей, то в цикле они все запишутся

     // Пишем в таблицу транзакций
      ID_PBKEY := BufTran.AddRecord('PEP_ORD', 'BUFF_PEP_ORD');

     // Пишем в резервный буффер в интербейсе
      IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_PEP_ORD(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,' +
        'Date_In,DateOrd,NumerOrd,Date1,Date2,BodyOrd,T_NUM, Time_In)' +
        'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',''' +
        DateToStr(BufferQuery['Date_In']) + ''',''' +
        DateToStr(BufferQuery['DateOrd']) + ''',' +
        QuotedStr(BufferQuery['NumerOrd']) + ',''' +
        DateToStr(BufferQuery['Date1']) + ''',''' +
        DateToStr(BufferQuery['Date2']) + ''',' +
        QuotedStr(BufferQuery['BodyOrd']) + ',' +
        IntToStr(BufferQuery['T_NUM']) + ',''' +
        TimeToStr(BufferQuery['Time_In']) + ''');';
      ExecQuery(IBBufferQuery);

     //пишем в сам буфер
      WriteToDbf('PEP_ORD', 'BUFF_PEP_ORD', ID_PBKEY);

      BufferQuery.Next;

    end;

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT IS_FIRST FROM IS_MOVING_FIRST(' + IntToStr(InputQuery['ID_ORDER']) + ',' + QuotedStr(DateToStr(InputQuery['Date_Order'])) + ')';
    BufferQuery.Open;

    if bufferQuery.IsEmpty
      then begin
      raise Exception.Create('Системная ошибка при записи в буфер обмена. Запишите подробно ситуацию возникновения и обратитесь к разработчикам. Код ошибки 3030.');
    end
    else IS_MOVING_FIRST := (BufferQuery['IS_FIRST'] = 'T');


    case InputQuery['ID_ORDER_TYPE'] of

      2: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_ACCEPT_MAN_INFO(' + IntToStr(InputQuery['ID_ORDER']) + ',-1);';
          BufferQuery.Open;

          if IS_MOVING_FIRST // Если первій мувинг, то пишем в ПЕП_ДАТА
            then begin

            // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('PEP_DATA', 'BUFF_PEP_DATA');

                  // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';

            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_PEP_DATA(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,DateOrd,ACTION_LTD,T_NUM,Id_PodrK,' +
              'FIO,FIOU,Sex,Id_PostK,Birthday,Common_St,Seria,Nomer,DateV,Mesto,Ink,Prof,Oklad,Tarst,Id_Time,In_Shtat, Time_In, RAZRYAD, KOLST, DEC_LTD, WORK_TR, INOSTR)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + DateToStr(BufferQuery['DateOrd']) + ''',' +
              IntToStr(2) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              IntToStr(BufferQuery['Id_PodrK']) + ',' +
              QuotedStr(BufferQuery['FIO']) + ',' +
              QuotedStr(BufferQuery['FIOU']) + ',''' +
              BufferQuery['Sex'] + ''',' +
              IntToStr(BufferQuery['Id_PostK']) + ',' +
              '''' + DateToStr(BufferQuery['Birthday']) + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(BufferQuery['Seria']) + ',' +
              QuotedStr(BufferQuery['Nomer']) + ',' +
              '''' + DateToStr(BufferQuery['DateV']) + ''',' +
              QuotedStr(BufferQuery['Mesto']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + BufferQuery['Prof'] + ''',' +
              '''' + FloatToStr(BufferQuery['Oklad']) + ''',' +
              '''' + FloatToStr(BufferQuery['Tarst']) + ''',' +
              IntToStr(BufferQuery['Id_Time']) + ',' +
              IntToStr(BufferQuery['In_Shtat']) + ',''' +
              TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(BufferQuery['RAZRYAD']) + ',''' +
              FloatToStr(BufferQuery['KOLST']) + ''',' +
              QuotedStr(BufferQuery['DECR']) + ',' +
              QuotedStr(BufferQuery['WORK_TR']) + ',' +
              QuotedStr(BufferQuery['INOSTR']) + ');';
            ExecQuery(IBBufferQuery);
            DecimalSeparator := ',';

      // Пишем в буфер
            WriteToDbf('PEP_DATA', 'BUFF_PEP_DATA', ID_PBKEY);
          end
          else begin // Все остальные пишем в БОНУС

            // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

            // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';

            if BufferQuery['Tarst'] = -1
              then Money := BufferQuery['Oklad']
            else Money := BufferQuery['Tarst'];

            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg, Date_End, PERCENT,SUMMA, SOVM)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(1) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(DateToStr(BufferQuery['Date_End'])) + ',' +
              QuotedStr(IntToStr(TRUNC(BufferQuery['KOLST'] * 100))) + ',' +
              QuotedStr(FloatToStr(Money)) + ',' +
              '3' + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

      // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);
          end;

        end;

      3: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_MOVE_MAN_INFO(' + IntToStr(InputQuery['ID_ORDER']) + ',1);';
          BufferQuery.Open;

          if IS_MOVING_FIRST // Если первій мувинг, то пишем в ПЕП_ДАТА
            then begin
      // Пишем в таблицу транзакций старое место работы, которое закрываем
            ID_PBKEY := BufTran.AddRecord('PEP_DATA', 'BUFF_PEP_DATA');

      // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_PEP_DATA(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,DateOrd,ACTION_LTD,T_NUM,Id_PodrK,' +
              'FIO,FIOU,Sex,Id_PostK,Birthday,Common_St,Seria,Nomer,DateV,Mesto,Ink,Prof,Oklad,Tarst,Id_Time,In_Shtat, RAZRYAD, KOLST, DEC_LTD, WORK_TR, INOSTR)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + DateToStr(BufferQuery['DateOrd']) + ''',' +
              IntToStr(2) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              IntToStr(BufferQuery['Id_PodrK']) + ',' +
              QuotedStr(BufferQuery['FIO']) + ',' +
              QuotedStr(BufferQuery['FIOU']) + ',''' +
              BufferQuery['Sex'] + ''',' +
              IntToStr(BufferQuery['Id_PostK']) + ',' +
              '''' + DateToStr(BufferQuery['Birthday']) + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(BufferQuery['Seria']) + ',' +
              QuotedStr(BufferQuery['Nomer']) + ',' +
              '''' + DateToStr(BufferQuery['DateV']) + ''',' +
              QuotedStr(BufferQuery['Mesto']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + BufferQuery['Prof'] + ''',' +
              '''' + FloatToStr(BufferQuery['Oklad']) + ''',' +
              '''' + FloatToStr(BufferQuery['Tarst']) + ''',' +
              IntToStr(BufferQuery['Id_Time']) + ',' +
              IntToStr(BufferQuery['In_Shtat']) + ',' +
              IntToStr(BufferQuery['RAZRYAD']) + ',''' +
              FloatToStr(BufferQuery['KOLST']) + ''',' +
              QuotedStr(BufferQuery['DECR']) + ',' +
              QuotedStr(BufferQuery['WORK_TR']) + ',' +
              QuotedStr(BufferQuery['INOSTR']) + ');';
            ExecQuery(IBBufferQuery);
            DecimalSeparator := ',';

      // Пишем в буфер
            WriteToDbf('PEP_DATA', 'BUFF_PEP_DATA', ID_PBKEY);
          end
          else begin

            // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

            // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';

            if BufferQuery['Tarst'] = -1
              then Money := BufferQuery['Oklad']
            else Money := BufferQuery['Tarst'];

            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg, Date_End, PERCENT,SUMMA, SOVM)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(1) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(DateToStr(BufferQuery['Date_End'])) + ',' +
              QuotedStr(IntToStr(TRUNC(BufferQuery['STAVOK'] * 100))) + ',' +
              QuotedStr(FloatToStr(Money)) + ',' +
              '3' + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

      // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);
          end;

        end;

      4: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_DISMISS_MAN_INFO(' + IntToStr(InputQuery['ID_ORDER']) + ');';
          BufferQuery.Open;

          ID_ORDER_BEG := BufferQuery['ID_ORDER_BEG'];
          DATE_DISMISSION := BufferQuery['Erasing'];
          ID_MAN_MOVING := BufferQuery['ID_MAN_MOVING'];

          OutputQuery.Close;
          OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_PRIVATE_CARD_DATE_DISSM(' + IntToStr(BufferQuery['ID_PCARD']) + ',''' + DateToStr(DATE_DISMISSION) + ''');';
          ExecQuery(OutputQuery);

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_ACCEPT_MAN_INFO(' + IntToStr(ID_ORDER_BEG) + ',' + IntToStr(ID_MAN_MOVING) + ');';
          BufferQuery.Open;

          if IS_MOVING_FIRST // Если первій мувинг, то пишем в ПЕП_ДАТА
            then begin
      // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('PEP_DATA', 'BUFF_PEP_DATA');

                  // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_PEP_DATA(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,DateOrd,ACTION_LTD,T_NUM,Id_PodrK,' +
              'FIO,FIOU,Sex,Id_PostK,Birthday,Common_St,Seria,Nomer,DateV,Mesto,Ink,Prof,Oklad,Tarst,Id_Time,In_Shtat, Erasing, RAZRYAD, KOLST, DEC_LTD, WORK_TR, INOSTR)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + DateToStr(BufferQuery['DateOrd']) + ''',' +
              IntToStr(2) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              IntToStr(BufferQuery['Id_PodrK']) + ',' +
              QuotedStr(BufferQuery['FIO']) + ',' +
              QuotedStr(BufferQuery['FIOU']) + ',''' +
              BufferQuery['Sex'] + ''',' +
              IntToStr(BufferQuery['Id_PostK']) + ',' +
              '''' + DateToStr(BufferQuery['Birthday']) + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(BufferQuery['Seria']) + ',' +
              QuotedStr(BufferQuery['Nomer']) + ',' +
              '''' + DateToStr(BufferQuery['DateV']) + ''',' +
              QuotedStr(BufferQuery['Mesto']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + BufferQuery['Prof'] + ''',' +
              '''' + FloatToStr(BufferQuery['Oklad']) + ''',' +
              '''' + FloatToStr(BufferQuery['Tarst']) + ''',' +
              IntToStr(BufferQuery['Id_Time']) + ',' +
              IntToStr(BufferQuery['In_Shtat']) + ',''' +
              DateToStr(DATE_DISMISSION) + ''',' +
              IntToStr(BufferQuery['RAZRYAD']) + ',''' +
              FloatToStr(BufferQuery['KOLST']) + ''',' +
              QuotedStr(BufferQuery['DECR']) + ',' +
              QuotedStr(BufferQuery['WORK_TR']) + ',' +
              QuotedStr(BufferQuery['INOSTR']) + ');';

            ExecQuery(IBBufferQuery);
            DecimalSeparator := ',';

                  // Пишем в буфер
            WriteToDbf('PEP_DATA', 'BUFF_PEP_DATA', ID_PBKEY);
          end
          else begin
                // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

                // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';

            if BufferQuery['Tarst'] = -1
              then Money := BufferQuery['Oklad']
            else Money := BufferQuery['Tarst'];

            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg, Date_End, PERCENT,SUMMA, SOVM)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(1) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(DateToStr(DATE_DISMISSION)) + ',' +
              QuotedStr(IntToStr(TRUNC(BufferQuery['KOLST'] * 100))) + ',' +
              QuotedStr(FloatToStr(Money)) + ',' +
              '3' + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

          // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);
          end;

        end;
      16, 18: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_NHOLIDAY(' + IntToStr(InputQuery['ID_ORDER']) + ');';
          BufferQuery.Open;
          BufferQuery.FetchAll;
          BufferQuery.First;

          while not BufferQuery.Eof
            do begin

     // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('HOLIDAY', 'BUF_HOLIDAY');

                  // пишем буфер ЛТД в наш локальній буфер
            IBBufferQuery.SQL.Text := 'INSERT INTO BUF_HOLIDAY(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'Period_Beg,Period_End,Date_Beg,DatE_End,Day_Used, Day_UnUsed, VO_K)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(1) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['Period_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['Period_End']) + ''',' +
              '''' + DateToStr(BufferQuery['Date_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['Date_End']) + ''',' +
              IntToStr(BufferQuery['Day_Used']) + ',' +
              IntToStr(BufferQuery['Day_UnUsed']) + ',' +
              IntToStr(BufferQuery['VOPL']) + ');';
            ExecQuery(IBBufferQuery);

                  // Пишем в буфер
            WriteToDbf('HOLIDAY', 'BUF_HOLIDAY', ID_PBKEY);

            BufferQuery.Next;
          end;
        end;
      8, 9: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_BONUS(' + IntToStr(InputQuery['ID_ORDER']) + ');';
          BufferQuery.Open;
          BufferQuery.FetchAll;

          BufferQuery.First;
          while not BufferQuery.Eof do begin

                    // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

                    // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg,DATE_End,PERCENT,SUMMA, VO_K)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(1) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['DATE_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['DATE_End']) + ''',' +
              '''' + IntToStr(BufferQuery['PERCENT']) + ''',' +
              '''' + FloatToStr(BufferQuery['SUMMA']) + ''',' +
              IntToStr(BufferQuery['ID_VIDOPL']) + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

                    // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);

            BufferQuery.Next;

          end;
        end;
      10: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_BONUS_REMOVE(' + IntToStr(InputQuery['ID_ORDER']) + ',' + IntToStr(1) + ');';
          BufferQuery.Open;
          BufferQuery.FetchAll;

          BufferQuery.First;
          while not BufferQuery.Eof do begin

      // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

                    // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg,DATE_End,PERCENT,SUMMA, VO_K)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(2) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['DATE_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['DATE_End']) + ''',' +
              '''' + IntToStr(BufferQuery['PERCENT']) + ''',' +
              '''' + FloatToStr(BufferQuery['SUMMA']) + ''',' +
              IntToStr(BufferQuery['ID_VIDOPL']) + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

                    // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);

            BufferQuery.Next;

          end;
        end;
      17: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_PREMIA(' + IntToStr(InputQuery['ID_ORDER']) + ');';
          BufferQuery.Open;
          BufferQuery.FetchAll;

          BufferQuery.First;
          while not BufferQuery.Eof do begin

      // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

                    // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg,DATE_End,PERCENT,SUMMA, VO_K, PREMIYA)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(1) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['DATE_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['DATE_End']) + ''',' +
              '''' + IntToStr(BufferQuery['PERCENT']) + ''',' +
              '''' + FloatToStr(BufferQuery['SUMMA']) + ''',' +
              IntToStr(BufferQuery['ID_VIDOPL']) + ',''T'');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

                    // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);

            BufferQuery.Next;

          end;
        end;
    end;

  end
// Если расформировываем приказ, то вписываем в буфера то же самое, но с ID_ACTION = 3
  else begin

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT IS_FIRST FROM IS_MOVING_FIRST(' + IntToStr(InputQuery['ID_ORDER']) + ',' + QuotedStr(DateToStr(InputQuery['Date_Order'])) + ')';
    BufferQuery.Open;

    if bufferQuery.IsEmpty
      then begin
      raise Exception.Create('Системная ошибка при записи в буфер обмена. Запишите подробно ситуацию возникновения и обратитесь к разработчикам. Код ошибки 3030.');
    end
    else IS_MOVING_FIRST := (BufferQuery['IS_FIRST'] = 'T');


    case InputQuery['ID_ORDER_TYPE'] of

      2: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_ACCEPT_MAN_INFO(' + IntToStr(InputQuery['ID_ORDER']) + ',-1);';
          BufferQuery.Open;

          if IS_MOVING_FIRST // Если первій мувинг, то пишем в ПЕП_ДАТА
            then begin

            // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('PEP_DATA', 'BUFF_PEP_DATA');

                  // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';


            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_PEP_DATA(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,DateOrd,ACTION_LTD,T_NUM,Id_PodrK,' +
              'FIO,FIOU,Sex,Id_PostK,Birthday,Common_St,Seria,Nomer,DateV,Mesto,Ink,Prof,Oklad,Tarst,Id_Time,In_Shtat, Time_In, RAZRYAD, KOLST, DEC_LTD, WORK_TR, INOSTR)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + DateToStr(BufferQuery['DateOrd']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              IntToStr(BufferQuery['Id_PodrK']) + ',' +
              QuotedStr(BufferQuery['FIO']) + ',' +
              QuotedStr(BufferQuery['FIOU']) + ',''' +
              BufferQuery['Sex'] + ''',' +
              IntToStr(BufferQuery['Id_PostK']) + ',' +
              '''' + DateToStr(BufferQuery['Birthday']) + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(BufferQuery['Seria']) + ',' +
              QuotedStr(BufferQuery['Nomer']) + ',' +
              '''' + DateToStr(BufferQuery['DateV']) + ''',' +
              QuotedStr(BufferQuery['Mesto']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + BufferQuery['Prof'] + ''',' +
              '''' + FloatToStr(BufferQuery['Oklad']) + ''',' +
              '''' + FloatToStr(BufferQuery['Tarst']) + ''',' +
              IntToStr(BufferQuery['Id_Time']) + ',' +
              IntToStr(BufferQuery['In_Shtat']) + ',''' +
              TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(BufferQuery['RAZRYAD']) + ',''' +
              FloatToStr(BufferQuery['KOLST']) + ''',' +
              QuotedStr(BufferQuery['DECR']) + ',' +
              QuotedStr(BufferQuery['WORK_TR']) + ',' +
              QuotedStr(BufferQuery['INOSTR']) + ');';
            ExecQuery(IBBufferQuery);
            DecimalSeparator := ',';

      // Пишем в буфер
            WriteToDbf('PEP_DATA', 'BUFF_PEP_DATA', ID_PBKEY);
          end
          else begin // Все остальные пишем в БОНУС

            // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

            // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';

            if BufferQuery['Tarst'] = -1
              then Money := BufferQuery['Oklad']
            else Money := BufferQuery['Tarst'];

            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg, Date_End, PERCENT,SUMMA, SOVM)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(DateToStr(BufferQuery['Date_End'])) + ',' +
              QuotedStr(IntToStr(TRUNC(BufferQuery['KOLST'] * 100))) + ',' +
              QuotedStr(FloatToStr(Money)) + ',' +
              '3' + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

      // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);
          end;

        end;

      3: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_MOVE_MAN_INFO(' + IntToStr(InputQuery['ID_ORDER']) + ',1);';
          BufferQuery.Open;

          if IS_MOVING_FIRST // Если первій мувинг, то пишем в ПЕП_ДАТА
            then begin
      // Пишем в таблицу транзакций старое место работы, которое закрываем
            ID_PBKEY := BufTran.AddRecord('PEP_DATA', 'BUFF_PEP_DATA');

      // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_PEP_DATA(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,DateOrd,ACTION_LTD,T_NUM,Id_PodrK,' +
              'FIO,FIOU,Sex,Id_PostK,Birthday,Common_St,Seria,Nomer,DateV,Mesto,Ink,Prof,Oklad,Tarst,Id_Time,In_Shtat, RAZRYAD, KOLST, DEC_LTD, WORK_TR, INOSTR)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + DateToStr(BufferQuery['DateOrd']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              IntToStr(BufferQuery['Id_PodrK']) + ',' +
              QuotedStr(BufferQuery['FIO']) + ',' +
              QuotedStr(BufferQuery['FIOU']) + ',''' +
              BufferQuery['Sex'] + ''',' +
              IntToStr(BufferQuery['Id_PostK']) + ',' +
              '''' + DateToStr(BufferQuery['Birthday']) + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(BufferQuery['Seria']) + ',' +
              QuotedStr(BufferQuery['Nomer']) + ',' +
              '''' + DateToStr(BufferQuery['DateV']) + ''',' +
              QuotedStr(BufferQuery['Mesto']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + BufferQuery['Prof'] + ''',' +
              '''' + FloatToStr(BufferQuery['Oklad']) + ''',' +
              '''' + FloatToStr(BufferQuery['Tarst']) + ''',' +
              IntToStr(BufferQuery['Id_Time']) + ',' +
              IntToStr(BufferQuery['In_Shtat']) + ',' +
              IntToStr(BufferQuery['RAZRYAD']) + ',''' +
              FloatToStr(BufferQuery['KOLST']) + ''',' +
              QuotedStr(BufferQuery['DECR']) + ',' +
              QuotedStr(BufferQuery['WORK_TR']) + ',' +
              QuotedStr(BufferQuery['INOSTR']) + ');';
            ExecQuery(IBBufferQuery);
            DecimalSeparator := ',';

      // Пишем в буфер
            WriteToDbf('PEP_DATA', 'BUFF_PEP_DATA', ID_PBKEY);
          end
          else begin

            // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

            // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';

            if BufferQuery['Tarst'] = -1
              then Money := BufferQuery['Oklad']
            else Money := BufferQuery['Tarst'];

            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg, Date_End, PERCENT,SUMMA, SOVM)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(DateToStr(BufferQuery['Date_End'])) + ',' +
              QuotedStr(IntToStr(TRUNC(BufferQuery['STAVOK'] * 100))) + ',' +
              QuotedStr(FloatToStr(Money)) + ',' +
              '3' + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

      // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);
          end;

        end;

      4: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_DISMISS_MAN_INFO(' + IntToStr(InputQuery['ID_ORDER']) + ');';
          BufferQuery.Open;

          ID_ORDER_BEG := BufferQuery['ID_ORDER_BEG'];
          DATE_DISMISSION := BufferQuery['Erasing'];
          ID_MAN_MOVING := BufferQuery['ID_MAN_MOVING'];

          OutputQuery.Close;
          OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_PRIVATE_CARD_DATE_DISSM(' + IntToStr(BufferQuery['ID_PCARD']) + ',''' + DateToStr(DATE_DISMISSION) + ''');';
          ExecQuery(OutputQuery);

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_ACCEPT_MAN_INFO(' + IntToStr(ID_ORDER_BEG) + ',' + IntToStr(ID_MAN_MOVING) + ');';
          BufferQuery.Open;

          if IS_MOVING_FIRST // Если первій мувинг, то пишем в ПЕП_ДАТА
            then begin
      // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('PEP_DATA', 'BUFF_PEP_DATA');

                  // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_PEP_DATA(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,DateOrd,ACTION_LTD,T_NUM,Id_PodrK,' +
              'FIO,FIOU,Sex,Id_PostK,Birthday,Common_St,Seria,Nomer,DateV,Mesto,Ink,Prof,Oklad,Tarst,Id_Time,In_Shtat, Erasing, RAZRYAD, KOLST, DEC_LTD, WORK_TR, INOSTR)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + DateToStr(BufferQuery['DateOrd']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              IntToStr(BufferQuery['Id_PodrK']) + ',' +
              QuotedStr(BufferQuery['FIO']) + ',' +
              QuotedStr(BufferQuery['FIOU']) + ',''' +
              BufferQuery['Sex'] + ''',' +
              IntToStr(BufferQuery['Id_PostK']) + ',' +
              '''' + DateToStr(BufferQuery['Birthday']) + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(BufferQuery['Seria']) + ',' +
              QuotedStr(BufferQuery['Nomer']) + ',' +
              '''' + DateToStr(BufferQuery['DateV']) + ''',' +
              QuotedStr(BufferQuery['Mesto']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + BufferQuery['Prof'] + ''',' +
              '''' + FloatToStr(BufferQuery['Oklad']) + ''',' +
              '''' + FloatToStr(BufferQuery['Tarst']) + ''',' +
              IntToStr(BufferQuery['Id_Time']) + ',' +
              IntToStr(BufferQuery['In_Shtat']) + ',''' +
              DateToStr(DATE_DISMISSION) + ''',' +
              IntToStr(BufferQuery['RAZRYAD']) + ',''' +
              FloatToStr(BufferQuery['KOLST']) + ''',' +
              QuotedStr(BufferQuery['DECR']) + ',' +
              QuotedStr(BufferQuery['WORK_TR']) + ',' +
              QuotedStr(BufferQuery['INOSTR']) + ');';

            ExecQuery(IBBufferQuery);
            DecimalSeparator := ',';

                  // Пишем в буфер
            WriteToDbf('PEP_DATA', 'BUFF_PEP_DATA', ID_PBKEY);
          end
          else begin
                // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

                // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';

            if BufferQuery['Tarst'] = -1 then
              Money := BufferQuery['Oklad']
            else
              Money := BufferQuery['Tarst'];

            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg, Date_End, PERCENT,SUMMA, SOVM)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['Common_St']) + ''',' +
              QuotedStr(DateToStr(DATE_DISMISSION)) + ',' +
              QuotedStr(IntToStr(TRUNC(BufferQuery['KOLST'] * 100))) + ',' +
              QuotedStr(FloatToStr(Money)) + ',' +
              '3' + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

          // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);
          end;

        end;
      16, 18: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_NHOLIDAY(' + IntToStr(InputQuery['ID_ORDER']) + ');';
          BufferQuery.Open;
          BufferQuery.FetchAll;
          BufferQuery.First;

          while not BufferQuery.Eof
            do begin

     // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('HOLIDAY', 'BUF_HOLIDAY');

                  // пишем буфер ЛТД в наш локальній буфер
            IBBufferQuery.SQL.Text := 'INSERT INTO BUF_HOLIDAY(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'Period_Beg,Period_End,Date_Beg,DatE_End,Day_Used, Day_UnUsed, VO_K)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['Period_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['Period_End']) + ''',' +
              '''' + DateToStr(BufferQuery['Date_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['Date_End']) + ''',' +
              IntToStr(BufferQuery['Day_Used']) + ',' +
              IntToStr(BufferQuery['Day_UnUsed']) + ',' +
              IntToStr(BufferQuery['VOPL']) + ');';
            ExecQuery(IBBufferQuery);

                  // Пишем в буфер
            WriteToDbf('HOLIDAY', 'BUF_HOLIDAY', ID_PBKEY);

            BufferQuery.Next;
          end;
        end;
      8, 9: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_BONUS(' + IntToStr(InputQuery['ID_ORDER']) + ');';
          BufferQuery.Open;
          BufferQuery.FetchAll;

          BufferQuery.First;
          while not BufferQuery.Eof do begin

                    // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

                    // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg,DATE_End,PERCENT,SUMMA, VO_K)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['DATE_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['DATE_End']) + ''',' +
              '''' + IntToStr(BufferQuery['PERCENT']) + ''',' +
              '''' + FloatToStr(BufferQuery['SUMMA']) + ''',' +
              IntToStr(BufferQuery['ID_VIDOPL']) + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

                    // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);

            BufferQuery.Next;

          end;
        end;
      10: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_BONUS_REMOVE(' + IntToStr(InputQuery['ID_ORDER']) + ',' + IntToStr(1) + ');';
          BufferQuery.Open;
          BufferQuery.FetchAll;

          BufferQuery.First;
          while not BufferQuery.Eof do begin

      // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

                    // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg,DATE_End,PERCENT,SUMMA, VO_K)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['DATE_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['DATE_End']) + ''',' +
              '''' + IntToStr(BufferQuery['PERCENT']) + ''',' +
              '''' + FloatToStr(BufferQuery['SUMMA']) + ''',' +
              IntToStr(BufferQuery['ID_VIDOPL']) + ');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

                    // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);

            BufferQuery.Next;

          end;
        end;
      17: begin

          BufferQuery.Close;
          BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_PREMIA(' + IntToStr(InputQuery['ID_ORDER']) + ');';
          BufferQuery.Open;
          BufferQuery.FetchAll;

          BufferQuery.First;
          while not BufferQuery.Eof do begin

      // Пишем в таблицу транзакций
            ID_PBKEY := BufTran.AddRecord('BONUS', 'BUFF_BONUS');

                    // пишем буфер ЛТД в наш локальній буфер
            DecimalSeparator := '.';
            IBBufferQuery.SQL.Text := 'INSERT INTO BUFF_BONUS(DateRec_Create,TimeRec_Create,Native_Create,Id_pbKey,Date_In,Time_In,ACTION_LTD,T_NUM,Ink,' +
              'DATE_Beg,DATE_End,PERCENT,SUMMA, VO_K, PREMIYA)' +
              'VALUES(''NOW'',''NOW'',''T'',' + IntToStr(ID_PBKEY) + ',' +
              '''' + DateToStr(BufferQuery['Date_In']) + ''',' +
              '''' + TimeToStr(BufferQuery['Time_In']) + ''',' +
              IntToStr(3) + ',' +
              IntToStr(BufferQuery['T_NUM']) + ',' +
              '''' + BufferQuery['Ink'] + ''',' +
              '''' + DateToStr(BufferQuery['DATE_Beg']) + ''',' +
              '''' + DateToStr(BufferQuery['DATE_End']) + ''',' +
              '''' + IntToStr(BufferQuery['PERCENT']) + ''',' +
              '''' + FloatToStr(BufferQuery['SUMMA']) + ''',' +
              IntToStr(BufferQuery['ID_VIDOPL']) + ',''T'');';
            DecimalSeparator := ',';
            ExecQuery(IBBufferQuery);

                    // Пишем в буфер
            WriteToDbf('BONUS', 'BUFF_BONUS', ID_PBKEY);

            BufferQuery.Next;

          end;
        end;
    end;

  end;

end;

procedure TordersViewForm.WriteOrderToDbf2(ID_Action: Integer);
var
  ID_PBKEY: Integer;
  ID_ORDER_BEG: Integer;
  DATE_DISMISSION: TDate;
  ID_MAN_MOVING: Integer;
  Bonus_Id_Action: Integer;
  UnWorked, NotUsed: Integer;
  RMoving: Integer;
begin

   // Для всех приказов пишем о них инфу в NORDERS.dbf
   // Получаем ID_PBKEY
  BufferQuery.Close;
  BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_NORDERS(' + IntToStr(InputQuery['ID_ORDER']) + ');';
  BufferQuery.Open;

   // Пишем в таблицу транзакций
  ID_PBKEY := BufTran.AddRecord('NORDERS', 'BUFF_NORDERS');

   // Пишем в резервный буффер в интербейсе
  IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NORDERS(' +
    IntToStr(ID_PBKEY) + ',' +
    IntToStr(Id_Action) + ',' +
    IntToStr(InputQuery['ID_ORDER']) + ',' +
    QuotedStr(TimeToStr(BufferQuery['Time_In'])) + ',' +
    QuotedStr(DateToStr(BufferQuery['Date_In'])) + ',' +
    QuotedStr(DateToStr(BufferQuery['DateOrd'])) + ',' +
    QuotedStr(BufferQuery['NumerOrd']) + ',' +
    QuotedStr(BufferQuery['BodyOrd']) + ')';
  ExecQuery(IBBufferQuery);

   //пишем в сам буфер
  WriteToDbf('NORDERS', 'BUFF_NORDERS', ID_PBKEY);

      // Пишем дополнительные пункты приказа
  BufferQuery.Close;
  BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_NORDACT(' + IntToStr(InputQuery['ID_ORDER']) + ');';
  BufferQuery.Open;
  BufferQuery.First;

  while not BufferQuery.Eof
    do begin
         // Пишем в таблицу транзакций
    ID_PBKEY := BufTran.AddRecord('NORDACT', 'BUFF_NORDACT');

      // Пишем в резервный буффер в интербейсе
    IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NORDACT(' +
      IntToStr(ID_PBKEY) + ',' +
      IntToStr(Id_Action) + ',' +
      QuotedStr(TimeToStr(BufferQuery['Time_In'])) + ',' +
      QuotedStr(DateToStr(BufferQuery['Date_In'])) + ',' +
      IntToStr(BufferQuery['ID_ORD_ACT']) + ',' +
      IntToStr(InputQuery['ID_ORDER']) + ',' +
      QuotedStr(BufferQuery['PORYADOK']) + ',' +
      QuotedStr(BufferQuery['Text']) + ')';
    ExecQuery(IBBufferQuery);

     //пишем в сам буфер
    WriteToDbf('NORDACT', 'BUFF_NORDACT', ID_PBKEY);

    bufferQuery.Next;
  end;

//if ID_Action = 1 then begin



  if InputQuery['ID_ORDER_TYPE'] = 2
    then begin

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_INFO_NMOVING(' + IntToStr(InputQuery['ID_ORDER']) + ',-1);';
    BufferQuery.Open;

    // Пишем в таблицу транзакций
    ID_PBKEY := BufTran.AddRecord('NMOVING', 'BUFF_NMOVING');

                  // пишем буфер ЛТД в наш локальній буфер
    DecimalSeparator := '.';
    IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NMOVING(' +
      IntToStr(ID_PBKEY) + ',' +
      QuotedStr(TimeToStr(BufferQuery['TIME_IN'])) + ',' +
      QuotedStr(DateToStr(BufferQuery['DATE_IN'])) + ',' +
      IntToStr(BufferQuery['ID_MOVING']) + ',' +
      IntToStr(BufferQuery['ID_MAN']) + ',' +
      QuotedStr(DateToStr(BufferQuery['DATE_BEG'])) + ',' +
      QuotedStr(DateToStr(BufferQuery['DATE_END'])) + ',' +
      IntToStr(InputQuery['ID_ORDER']) + ',' +
      IntToStr(1) + ',' +
      QuotedStr(BufferQuery['DATEORD']) + ',' +
      IntToStr(BufferQuery['ID_PODRK']) + ',' +
      IntToStr(BufferQuery['ID_POSTK']) + ',' +
      QuotedStr(FloatToStr(BufferQuery['KOL_STAVOK'])) + ',' +
      QuotedStr(FloatToStr(BufferQuery['OKLAD'])) + ',' +
      QuotedStr(FloatToStr(BufferQuery['TARST'])) + ',' +
      IntToStr(BufferQuery['ID_TIME']) + ',' +
      IntToStr(BufferQuery['SHIFT']) + ',' +
      IntToStr(BufferQuery['IN_SHTAT']) + ',' +
      IntToStr(BufferQuery['VO_K']) + ',' +
      IntToStr(BufferQuery['ID_SPZ']) + ',' +
      IntToStr(BufferQuery['RMOVING']) + ',' +
      IntToStr(ID_ACTION) + ',' +
      IntToStr(BufferQuery['BMOVING']) + ',0,0)';
    ExecQuery(IBBufferQuery);
    DecimalSeparator := ',';

    // Пишем в буфер
    WriteToDbf('NMOVING', 'BUFF_NMOVING', ID_PBKEY);

  end;

  if InputQuery['ID_ORDER_TYPE'] = 3 then begin

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_INFO_MOVE_MAN(' + IntToStr(InputQuery['ID_ORDER']) + ')';
    BufferQuery.Open;
    BufferQuery.FetchAll;
    BufferQuery.First;

    while not BufferQuery.Eof do begin
      // Пишем в таблицу транзакций
      ID_PBKEY := BufTran.AddRecord('NMOVING', 'BUFF_NMOVING');

            // пишем буфер ЛТД в наш локальній буфер
      DecimalSeparator := '.';
      IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NMOVING(' +
        IntToStr(ID_PBKEY) + ',' +
        QuotedStr(TimeToStr(BufferQuery['TIME_IN'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_IN'])) + ',' +
        IntToStr(BufferQuery['ID_MOVING']) + ',' +
        IntToStr(BufferQuery['ID_MAN']) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_BEG'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_END'])) + ',' +
        IntToStr(InputQuery['ID_ORDER']) + ',' +
        IntToStr(BufferQuery['ID_MOVTYPE']) + ',' +
        QuotedStr(BufferQuery['DATEORD']) + ',' +
        IntToStr(BufferQuery['ID_PODRK']) + ',' +
        IntToStr(BufferQuery['ID_POSTK']) + ',' +
        QuotedStr(FloatToStr(BufferQuery['KOL_STAVOK'])) + ',' +
        QuotedStr(FloatToStr(BufferQuery['OKLAD'])) + ',' +
        QuotedStr(FloatToStr(BufferQuery['TARST'])) + ',' +
        IntToStr(BufferQuery['ID_TIME']) + ',' +
        IntToStr(BufferQuery['SHIFT']) + ',' +
        IntToStr(BufferQuery['IN_SHTAT']) + ',' +
        IntToStr(BufferQuery['VO_K']) + ',' +
        IntToStr(BufferQuery['ID_SPZ']) + ',' +
        IntToStr(BufferQuery['RMOVING']) + ',' +
        IntToStr(ID_ACTION) + ',' +
        IntToStr(BufferQuery['BMOVING']) + ',0,0)';
      ExecQuery(IBBufferQuery);
      DecimalSeparator := ',';

      // Пишем в буфер
      WriteToDbf('NMOVING', 'BUFF_NMOVING', ID_PBKEY);

      BufferQuery.Next;
    end;
  end;

  if InputQuery['ID_ORDER_TYPE'] = 4 then begin

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_DISMISS_MAN_INFO(' + IntToStr(InputQuery['ID_ORDER']) + ');';
    BufferQuery.Open;

    ID_ORDER_BEG := BufferQuery['ID_ORDER_BEG'];
    DATE_DISMISSION := BufferQuery['Erasing'];
    ID_MAN_MOVING := BufferQuery['ID_MAN_MOVING'];

    UnWorked := BufferQuery['UnWorked'];
    NotUsed := BufferQuery['NotUsed'];

    OutputQuery.Close;
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_PRIVATE_CARD_DATE_DISSM(' + IntToStr(BufferQuery['ID_PCARD']) + ',''' + DateToStr(DATE_DISMISSION) + ''');';
    ExecQuery(OutputQuery);

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_INFO_NMOVING(' + IntToStr(ID_ORDER_BEG) + ',' + IntToStr(ID_MAN_MOVING) + ')';
    BufferQuery.Open;

    // Пишем в таблицу транзакций
    ID_PBKEY := BufTran.AddRecord('NMOVING', 'BUFF_NMOVING');


    DecimalSeparator := '.';
    IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NMOVING(' +
      IntToStr(ID_PBKEY) + ',' +
      QuotedStr(TimeToStr(BufferQuery['TIME_IN'])) + ',' +
      QuotedStr(DateToStr(BufferQuery['DATE_IN'])) + ',' +
      IntToStr(BufferQuery['ID_MOVING']) + ',' +
      IntToStr(BufferQuery['ID_MAN']) + ',' +
      QuotedStr(DateToStr(BufferQuery['DATE_BEG'])) + ',' +
      QuotedStr(DateToStr(DATE_DISMISSION)) + ',' +
      IntToStr(ID_ORDER_BEG) + ',' +
      IntToStr(4) + ',' +
      QuotedStr(BufferQuery['DATEORD']) + ',' +
      IntToStr(BufferQuery['ID_PODRK']) + ',' +
      IntToStr(BufferQuery['ID_POSTK']) + ',' +
      QuotedStr(FloatToStr(BufferQuery['KOL_STAVOK'])) + ',' +
      QuotedStr(FloatToStr(BufferQuery['OKLAD'])) + ',' +
      QuotedStr(FloatToStr(BufferQuery['TARST'])) + ',' +
      IntToStr(BufferQuery['ID_TIME']) + ',' +
      IntToStr(BufferQuery['SHIFT']) + ',' +
      IntToStr(BufferQuery['IN_SHTAT']) + ',' +
      IntToStr(BufferQuery['VO_K']) + ',' +
      IntToStr(BufferQuery['ID_SPZ']) + ',' +
      IntToStr(BufferQuery['RMOVING']) + ',' +
      IntToStr(ID_ACTION) + ',' +
      IntToStr(BufferQuery['BMOVING']) + ',' +
      IntToStr(UnWorked) + ',' +
      IntToStr(NotUsed) + ')';
    ExecQuery(IBBufferQuery);
    DecimalSeparator := ',';

    // Пишем в буфер
    WriteToDbf('NMOVING', 'BUFF_NMOVING', ID_PBKEY);


          { Запись закрытий возвратов из временных перемещениях }

    RMoving := BufferQuery['RMOVING'];

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_INFO_DISMISS_RETURNS(' + IntToStr(RMoving) + ')';
    BufferQuery.Open;
    BufferQuery.First;

    while not BufferQuery.Eof do begin

            // Пишем в таблицу транзакций
      ID_PBKEY := BufTran.AddRecord('NMOVING', 'BUFF_NMOVING');

      DecimalSeparator := '.';
      IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NMOVING(' +
        IntToStr(ID_PBKEY) + ',' +
        QuotedStr(TimeToStr(BufferQuery['TIME_IN'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_IN'])) + ',' +
        IntToStr(BufferQuery['ID_MOVING']) + ',' +
        IntToStr(BufferQuery['ID_MAN']) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_BEG'])) + ',' +
        QuotedStr(DateToStr(DATE_DISMISSION)) + ',' +
        IntToStr(ID_ORDER_BEG) + ',' +
        IntToStr(4) + ',' +
        QuotedStr(BufferQuery['DATEORD']) + ',' +
        IntToStr(BufferQuery['ID_PODRK']) + ',' +
        IntToStr(BufferQuery['ID_POSTK']) + ',' +
        QuotedStr(FloatToStr(BufferQuery['KOL_STAVOK'])) + ',' +
        QuotedStr(FloatToStr(BufferQuery['OKLAD'])) + ',' +
        QuotedStr(FloatToStr(BufferQuery['TARST'])) + ',' +
        IntToStr(BufferQuery['ID_TIME']) + ',' +
        IntToStr(BufferQuery['SHIFT']) + ',' +
        IntToStr(BufferQuery['IN_SHTAT']) + ',' +
        IntToStr(BufferQuery['VO_K']) + ',' +
        IntToStr(BufferQuery['ID_SPZ']) + ',' +
        IntToStr(BufferQuery['RMOVING']) + ',' +
        IntToStr(ID_ACTION) + ',' +
        IntToStr(BufferQuery['BMOVING']) + ',' +
        IntToStr(0) + ',' +
        IntToStr(0) + ')';
      ExecQuery(IBBufferQuery);
      DecimalSeparator := ',';

    // Пишем в буфер
      WriteToDbf('NMOVING', 'BUFF_NMOVING', ID_PBKEY);

      BufferQuery.Next;
    end;
  end;

  if (InputQuery['ID_ORDER_TYPE'] = 16) or (InputQuery['ID_ORDER_TYPE'] = 18) then begin

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_NHOLIDAY(' + IntToStr(InputQuery['ID_ORDER']) + ');';
    BufferQuery.Open;
    BufferQuery.FetchAll;
    BufferQuery.First;

    while not BufferQuery.Eof do begin
            // Пишем в таблицу транзакций
      ID_PBKEY := BufTran.AddRecord('NHOLIDAY', 'BUFF_NHOLIDAY');

                  // пишем буфер ЛТД в наш локальній буфер
      IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NHOLIDAY(' +
        IntToStr(ID_PBKEY) + ',' +
        QuotedStr(TimeToStr(BufferQuery['TIME_IN'])) + ',' +
        'null' + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_IN'])) + ',' +
        'null' + ',' +
        IntToStr(Id_Action) + ',' +
        IntToStr(BufferQuery['ID_MAN_MOVING']) + ',' +
        IntToStr(BufferQuery['ID_HOLIDAY_GROUP']) + ',' +
        IntToStr(BufferQuery['T_NUM']) + ',' +
        QuotedStr(BufferQuery['INK']) + ',' +
        QuotedStr(DateToStr(BufferQuery['PERIOD_BEG'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['PERIOD_END'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_BEG'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_END'])) + ',' +
        IntToStr(BufferQuery['DAY_USED']) + ',' +
        IntToStr(BufferQuery['DAY_UNUSED']) + ',' +
        IntToStr(BufferQuery['VOPL']) + ',' +
        IntToStr(BufferQuery['ID_BUDGET']) + ',' +
        IntToStr(BufferQuery['ID_DIVISIO']) + ',' +
        IntToStr(BufferQuery['ID_ITEM']) + ',' +
        IntToStr(InputQuery['ID_ORDER']) + ')';

      ExecQuery(IBBufferQuery);

                  // Пишем в буфер
      WriteToDbf('NHOLIDAY', 'BUFF_NHOLIDAY', ID_PBKEY);

      BufferQuery.Next;
    end;


  end;

  if (InputQuery['ID_ORDER_TYPE'] = 8) or
    (InputQuery['ID_ORDER_TYPE'] = 17) or
    (InputQuery['ID_ORDER_TYPE'] = 9) or
    (InputQuery['ID_ORDER_TYPE'] = 2) or
    (InputQuery['ID_ORDER_TYPE'] = 3)
    then begin

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_NBONUS(' + IntToStr(InputQuery['ID_ORDER']) + ');';
    BufferQuery.Open;
    BufferQuery.FetchAll;

    Bonus_Id_Action := Id_Action;

                  // Если это изменение надбавок
    if InputQuery['ID_ORDER_TYPE'] = 9
      then Bonus_Id_Action := 2;

    BufferQuery.First;
    while not BufferQuery.Eof do begin

              // Пишем в таблицу транзакций
      ID_PBKEY := BufTran.AddRecord('NBONUS', 'BUFF_NBONUS');

                    // пишем буфер ЛТД в наш локальній буфер
      DecimalSeparator := '.';
      IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NBONUS(' +
        IntToStr(ID_PBKEY) + ',' +
        QuotedStr(TimeToStr(BufferQuery['TIME_IN'])) + ',' +
        'null' + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_IN'])) + ',' +
        'null' + ',' +
        IntToStr(Bonus_ID_ACTION) + ',' +
        IntToStr(InputQuery['ID_ORDER']) + ',' +
        IntToStr(BufferQuery['ID_BONUS']) + ',' +
        IntToStr(BufferQuery['ID_MOVING']) + ',' +
        IntToStr(BufferQuery['T_NUM']) + ',' +
        QuotedStr(BufferQuery['INK']) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_BEG'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_END'])) + ',' +
        IntToStr(BufferQuery['VO_K']) + ',' +
        IntToStr(BufferQuery['PERCENT']) + ',' +
        QuotedStr(FloatToStr(BufferQuery['SUMMA'])) + ',' +
        QuotedStr(BufferQuery['PREMIYA']) + ',' +
        IntToStr(BufferQuery['ID_BUDGET']) + ',' +
        IntToStr(BufferQuery['ID_DIVISIO']) + ',' +
        IntToStr(BufferQuery['ID_ITEM']) + ',' +
        IntToStr(ID_ACTION) + ',' +
        IntToStr(BufferQuery['BMOVING']) + ')';
      DecimalSeparator := ',';

      ExecQuery(IBBufferQuery);

                    // Пишем в буфер
      WriteToDbf('NBONUS', 'BUFF_NBONUS', ID_PBKEY);

      BufferQuery.Next;

    end;
  end;


  if (InputQuery['ID_ORDER_TYPE'] = 10) then begin

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFF_INFO_NBONUS_REMOVE(' + IntToStr(InputQuery['ID_ORDER']) + ');';
    BufferQuery.Open;
    BufferQuery.FetchAll;

    BufferQuery.First;
    while not BufferQuery.Eof do begin

              // Пишем в таблицу транзакций
      ID_PBKEY := BufTran.AddRecord('NBONUS', 'BUFF_NBONUS');

                    // пишем буфер ЛТД в наш локальній буфер
      DecimalSeparator := '.';
      IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NBONUS(' +
        IntToStr(ID_PBKEY) + ',' +
        QuotedStr(TimeToStr(BufferQuery['TIME_IN'])) + ',' +
        'null' + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_IN'])) + ',' +
        'null' + ',' +
        IntToStr(2) + ',' +
        IntToStr(InputQuery['ID_ORDER']) + ',' +
        IntToStr(BufferQuery['ID_BONUS']) + ',' +
        IntToStr(BufferQuery['ID_MOVING']) + ',' +
        IntToStr(BufferQuery['T_NUM']) + ',' +
        QuotedStr(BufferQuery['INK']) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_BEG'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_END'])) + ',' +
        IntToStr(BufferQuery['VO_K']) + ',' +
        IntToStr(BufferQuery['PERCENT']) + ',' +
        QuotedStr(FloatToStr(BufferQuery['SUMMA'])) + ',' +
        QuotedStr(BufferQuery['PREMIYA']) + ',' +
        IntToStr(BufferQuery['ID_BUDGET']) + ',' +
        IntToStr(BufferQuery['ID_DIVISIO']) + ',' +
        IntToStr(BufferQuery['ID_ITEM']) + ',' +
        IntToStr(ID_ACTION) + ',' +
        IntToStr(BufferQuery['BMOVING']) + ')';
      DecimalSeparator := ',';

      ExecQuery(IBBufferQuery);

                    // Пишем в буфер
      WriteToDbf('NBONUS', 'BUFF_NBONUS', ID_PBKEY);

      BufferQuery.Next;

    end;
  end;

  if (InputQuery['ID_ORDER_TYPE'] = 22) then begin

    BufferQuery.Close;
    BufferQuery.SQL.Text := 'SELECT * FROM BUFFER_INFO_INCREASE_ORDER(' + IntToStr(InputQuery['ID_ORDER']) + ');';
    BufferQuery.Open;
    BufferQuery.FetchAll;

    BufferQuery.First;
    while not BufferQuery.Eof do begin

              // Пишем в таблицу транзакций
      ID_PBKEY := BufTran.AddRecord('NMOVING', 'BUFF_NMOVING');

                    // пишем буфер ЛТД в наш локальній буфер
      DecimalSeparator := '.';
      IBBufferQuery.SQL.Text := 'EXECUTE PROCEDURE BUFF_ADD_NMOVING(' +
        IntToStr(ID_PBKEY) + ',' +
        QuotedStr(TimeToStr(BufferQuery['TIME_IN'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_IN'])) + ',' +
        IntToStr(BufferQuery['ID_MOVING']) + ',' +
        IntToStr(BufferQuery['ID_MAN']) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_BEG'])) + ',' +
        QuotedStr(DateToStr(BufferQuery['DATE_END'])) + ',' +
        IntToStr(BufferQuery['ID_ORDER']) + ',' +
        IntToStr(BufferQuery['ID_MOV_TYPE']) + ',' +
        QuotedStr(BufferQuery['DATEORD']) + ',' +
        IntToStr(BufferQuery['ID_PODRK']) + ',' +
        IntToStr(BufferQuery['ID_POSTK']) + ',' +
        QuotedStr(FloatToStr(BufferQuery['KOL_STAVOK'])) + ',' +
        QuotedStr(FloatToStr(BufferQuery['OKLAD'])) + ',' +
        QuotedStr(FloatToStr(BufferQuery['TARST'])) + ',' +
        IntToStr(BufferQuery['ID_TIME']) + ',' +
        IntToStr(BufferQuery['SHIFT']) + ',' +
        IntToStr(BufferQuery['IN_SHTAT']) + ',' +
        IntToStr(BufferQuery['VO_K']) + ',' +
        IntToStr(BufferQuery['ID_SPZ']) + ',' +
        IntToStr(BufferQuery['RMOVING']) + ',' +
        IntToStr(ID_ACTION) + ',' +
        IntToStr(BufferQuery['BMOVING']) + ',0,0)';

      ExecQuery(IBBufferQuery);
      DecimalSeparator := ',';

                    // запись в dbf
      WriteToDbf('NMOVING', 'Buff_NMOVING', Id_PBKey);

      BufferQuery.Next;
    end;
  end;
//end;

end;


procedure TOrdersViewForm.OrderGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bmp: TBitmap;
begin
  if not InputQuery.IsEmpty then begin

    case InputQuery['ID_STATUS'] of
      1: OrderGrid.Canvas.Brush.Color := RGB(157, 244, 162);
      2: OrderGrid.Canvas.Brush.Color := clWhite;
      3: OrderGrid.Canvas.Brush.Color := RGB(138, 215, 255);
      4: OrderGrid.Canvas.Brush.Color := RGB(250, 163, 177);
      5: OrderGrid.Canvas.Brush.Color := OrderGrid.Color;
    end;

    if (gdSelected in State) then OrderGrid.Canvas.Brush.Color := clGray;

    OrderGrid.Canvas.FillRect(Rect);
    OrderGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State)
  end
  else
    OrderGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Column.FieldName = 'YOUR_SIGN_STATUS') and (not InputQuery.IsEmpty) then begin
    OrderGrid.Canvas.FillRect(Rect);
    case InputQuery['YOUR_SIGN_STATUS'] of
      2: begin
          bmp := TBitmap.Create;
          bmp.Transparent := True;
          bmp.TransparentColor := clWhite;
          bmp.TransparentMode := tmAuto;
          Main.Act_ImageList.GetBitmap(13, bmp);
          OrderGrid.Canvas.Draw(Rect.left, Rect.Top, bmp);
          bmp.Destroy;
        end;
    end;
  end;
end;


procedure TOrdersViewForm.InputQueryAfterOpen(DataSet: TDataSet);
begin
  GridResize(OrderGrid);
// InputQuery.FetchAll;
// CountLabel.Caption := IntToStr(InputQuery.RecordCount);
  AllLabel.Caption := 'Клацніть тут, щоб побачити кількість наказів';
end;


procedure TOrdersViewForm.NomerClick(Sender: TObject);
begin
  FilterAccept('ORDER BY NUM_ORDER');
end;

procedure TOrdersViewForm.TypClick(Sender: TObject);
begin
  FilterAccept('ORDER BY ID_ORDER_TYPE');
end;

procedure TOrdersViewForm.DateSortClick(Sender: TObject);
begin
  FilterAccept('ORDER BY DATE_ORDER ASCENDING');
end;

procedure TOrdersViewForm.ShowAllOrdersClick(Sender: TObject);
begin
  FilterAccept;
end;

procedure TOrdersViewForm.OrderGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN
    then begin
    if SelectButton.Visible
      then SelectButton.Click;
    Key := 0;
    exit;
  end;

  if key = VK_BACK
    then begin
    SearchEdit.Text := '';
    Key := 0;
    exit;
  end;
end;

procedure TOrdersViewForm.N3Click(Sender: TObject);
begin
  FilterAccept;
end;

procedure TOrdersViewForm.SearchEditChange(Sender: TObject);
begin
  InputQuery.Locate('Num_Order', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TOrdersViewForm.OrderGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(key) < 31 then exit;

  SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TOrdersViewForm.SearchNextButtonClick(Sender: TObject);
begin
  InputQuery.LocateNext('Num_Order', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TOrdersViewForm.InputQueryAfterScroll(DataSet: TDataSet);
begin
  if InputQuery.IsEmpty then exit;

  if ViewMode then
  begin
    ModifyButton.Caption := 'Перегляд';
    Exit;
  end;

  if InputQueryID_STATUS.Value <> 1 then
    ModifyButton.Caption := 'Перегляд'
  else
    ModifyButton.Caption := 'Змінити';
end;

procedure TOrdersViewForm.AllLabelClick(Sender: TObject);
begin
  InputQuery.FetchAll;
  AllLabel.Caption := 'Усьго наказів : ' + IntToStr(InputQuery.RecordCount);
end;

procedure TOrdersViewForm.FilterTypeClick(Sender: TObject);
begin
  FilterAccept;
end;

procedure TOrdersViewForm.FilterTypeBoxChange(Sender: TObject);
begin
  if FilterType.Checked then FilterAccept;
end;

procedure TOrdersViewForm.FilterOtdelBoxChange(Sender: TObject);
begin
  if OtdelFilter.Checked then FilterAccept;
end;

procedure TOrdersViewForm.DateBegChange(Sender: TObject);
begin
  if FilterDateBeg.Checked then FilterAccept;
end;

procedure TOrdersViewForm.DateEndChange(Sender: TObject);
begin
  if FilterDateEnd.Checked then FilterAccept;
end;

procedure TOrdersViewForm.FilterDateBegClick(Sender: TObject);
begin
  FilterAccept;
end;

procedure TOrdersViewForm.FilterDateEndClick(Sender: TObject);
begin
  FilterAccept;
end;

procedure TOrdersViewForm.SelectFioClick(Sender: TObject);
begin

  id_pcard := getpcard(Date, True, True);

  if id_pcard <> -1 then
  begin
    FioEdit.Text := GoodFunctionsUnit.Fam + ' (Т/Н ' +
      GoodFunctionsUnit.pcardform.ResultQueryTN.AsString + ')';
  end;

  FilterAccept;

end;

procedure TOrdersViewForm.FilterFioClick(Sender: TObject);
begin
  FilterAccept;
end;

procedure TOrdersViewForm.DateSort2Click(Sender: TObject);
begin
  FilterAccept('ORDER BY DATE_ORDER DESCENDING');
end;

procedure TOrdersViewForm.ServerBoxChange(Sender: TObject);
begin
  if ShowAllOrders.Checked then FilterAccept;
end;

procedure TOrdersViewForm.ToZpButtonClick(Sender: TObject);
begin
  if (InputQuery.IsEmpty) then begin
    MessageDlg('Немає записів!', mtError, [mbOk], 0);
    exit;
  end;

  if (InputQueryID_STATUS.Value <> 5) then begin
    MessageDlg('Для передачі наказ повинен бути виконаним!', mtError, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Ви справді бажаєте передати цей наказ до ЗП? Після цього його расформування може стати неможливим!', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  OutputQuery.Close;
  OutputQuery.SQL.Text := 'UPDATE ORDERS SET Z_SHOW_IN_ZP = ' + QuotedStr('T') +
    ' WHERE ID_ORDER = ' + IntToStr(InputQuery['ID_ORDER']);
  ExecQuery(OutputQuery);
end;

procedure TOrdersViewForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TOrdersViewForm.AddActionExecute(Sender: TObject);
var
  TEMP: TOrdersEditForm;
  a: TLocateOptions;
begin

    //Создаем новую форму добавления приказа.
  TEMP := TOrdersEditForm.Create(Self);
    //Передаем ей параметры
  Temp.CanEdit := True;
  TEMP.CBTypeOrders.Properties.ListSource := DataSourceTypeOrder;
  Temp.FMode := 0;
  Temp.ClearForm;
  TEMP.ShowModal;
  InputQuery.Close;
  InputQuery.Open;

  if (Temp.ModalResult = mrOk) and (Temp.ID_ORDER <> -1)
    then InputQuery.Locate('ID_ORDER', TEMP.ID_ORDER, a);

  Temp.Free;
end;

procedure TOrdersViewForm.ModifyActionExecute(Sender: TObject);
var
  Temp: TOrdersEditForm;
  a: TLocateOptions;
  Locate_Id_Order: Integer;
begin
  if (InputQuery.IsEmpty) then
    MessageDlg('Немає наказів для редагування. Спочатку створіть новий наказ.', mtError, [mbOk], 0)
  else begin
        //Создаем новую форму добавления приказа.
    Temp := TOrdersEditForm.Create(Self);
        //Передаем ей параметры

    Temp.FMode := 1;
    TEMP.CBTypeOrders.Properties.ListSource := DataSourceTypeOrder;
    if ViewMode then
      Temp.CanEdit := False
    else
      Temp.CanEdit := True;

    Temp.ID_ORDER := InputQuery['ID_ORDER'];
    Locate_Id_Order := InputQuery['ID_ORDER'];
    Temp.PrepareForm;
    Temp.ShowModal;
    InputQuery.Close;
    InputQuery.Open;

                // сделал так, т.к. иногда не становится на нужную запись!
//        InputQuery.Locate('ID_ORDER', Temp.ID_ORDER, a);
    InputQuery.Locate('ID_ORDER', Locate_Id_Order, a);
    Temp.Free;
  end;
end;

procedure TOrdersViewForm.MainInfoActionExecute(Sender: TObject);
var
  id_order: Integer;
  FMode: TEditMode;
begin
  if InputQueryID_STATUS.Value = 1 then
    FMode := emModify
  else
    FMode := emView;

  ShowOrder(InputQueryID_ORDER.Value,
    InputQueryID_ORDER_TYPE.Value,
    1,
    FMode,
    OutputQuery,
    Self,
    InputQueryDATE_ORDER.Value,
    id_order,
    InputQueryNUM_ORDER.Value,
    InputQueryNOTE.Value);
end;

procedure TOrdersViewForm.DeleteActionExecute(Sender: TObject);
begin
  if InputQuery.IsEmpty then
  begin
    MessageDlg('Немає наказів, які можна вилучити!', mtError, [mbOk], 0);
    Exit;
  end;

  if (InputQuery['ID_STATUS'] <> 1) then
  begin
    MessageDlg('Цей наказ вже сформований, його неможливо вилучити!',
      mtError, [mbOk], 0);
    Exit;
  end;

  if (MessageDlg('Чи ви справді бажаєте вилучити цей наказ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes)
    then begin
        {Удаляем все записи в подчиненных таблицах с таким ID_ORDER}
    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DELETE_ORDER(' + IntToStr(InputQuery['ID_ORDER']) + ',0);';
    ExecQuery(OutputQuery);
    InputQuery.Close;
    InputQuery.Open;
  end;
end;

procedure TOrdersViewForm.RefreshActionExecute(Sender: TObject);
begin
  QueryRefresh(InputQuery);
  AllLabel.Caption := 'Клацніть тут, щоб побачити кількість наказів';
end;

procedure TOrdersViewForm.PrintActionExecute(Sender: TObject);
var
  Temp: TPrintOrderForm;
begin
  if (InputQuery.IsEmpty = False)
    then begin

    Temp := TPrintOrderForm.Create(Self);
    Temp.ID_ORDER := InputQuery['ID_ORDER'];
    Temp.ID_ORDER_TYPE := InputQuery['ID_ORDER_TYPE'];
    Temp.ID_SERVER := ServerCheckQuery['ID_SERVER'];
    if Temp.PrepareForm = True then
      Temp.ShowModal;

    Temp.Free;
  end
  else
    MessageDlg('Немає наказів!', mtError, [mbOk], 0);
end;

procedure TOrdersViewForm.MakeActionExecute(Sender: TObject);
var
  OLD_ID_ORDER: Integer;
  Form: TSpForm;
  Params: TSpParams;
  BufTran2: TBufferTransaction2;
  First_PBKey, Last_PBKey: Integer;
begin
  if (not InputQuery.IsEmpty) then begin

    if (InputQuery['ID_STATUS'] = 5)
      then begin
      MessageDlg('Неможливо виконати цей наказ, бо він вже Виконаний!', mtError, [mbOk], 0);
      Exit;
    end;

        //Если приказ ещё не сформирован, то не даем его выполнить

    if (InputQuery['ID_STATUS'] = 1) and (not AdminMode) and (Version <> 2)
      then begin
      MessageDlg('Неможна виконати наказ, який ще не сформований!', mtError, [mbOk], 0);
      Exit;
    end;

    if (CurrentID_PCARD <> GetOrderOwner(InputQueryID_ORDER.Value)) and (GetOrderOwner(InputQueryID_ORDER.Value) <> 0) and
      (not AdminMode)
      then begin
      ErrMsg('Ви не можете виконати цей наказ, його може виконати тільки власник. Власника можна змінити, для цього треба зайти під його паролем, відкрити наказ для редагування та змінити власника.');
      exit;
    end;

    if MessageDlg('Ви справді бажаєте виконати цей наказ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

        // Проверяем, а можно ли выполнять приказ

    Form := TSpForm.Create(self);
    Params := TSpPArams.Create;

    Params.SelectProcName := 'ORDER_CHECK_FOR_FORM(' + InputQueryID_ORDER.AsString + ')';
    Params.SpFields := 'BAD_STRING';
    PArams.Title := 'Підстави чому неможливе виконання цього наказу';
    Params.ColumnNames := 'Підстава чому неможливе виконання цього наказу';
    Params.ReadOnly := True;
    Params.IdField := 'BAD_STRING';
    Params.ComboField := 'BAD_STRING';
    Params.SpMode := spmNormal;
    Params.DontHideFirstColumn := True;

    Form.Init(Params);

    if (not Form.ResultQuery.IsEmpty) then begin
      Form.ShowModal;

      Params.Free;
      Form.Free;

      exit;
    end;

    Params.Free;
    Form.Free;

        //Здесь выполняется приказ

    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('виконання наказу...');

    //        BufTran.Start;
    BufTran2 := nil;
    if WriteTransaction.Active then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;
    try
      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER(' + IntToStr(InputQuery['ID_ORDER']) + ',' + IntToStr(InputQuery['ID_ORDER_TYPE']) + ',' + QuotedStr(InputQuery['NUM_ORDER']) + ',''' + InputQueryDATE_ORDER.AsString + ''',' + QuotedStr(InputQuery['NOTE']) + ',5);';
      ExecQuery(OutputQuery);

         //  Ставим Всем подписывающим статус "подписанный", но только если работаем в режиме Бога

      if AdminMode then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_SIGN_2(' + IntToStr(InputQuery['ID_ORDER']) + ',3);';
        ExecQuery(OutputQuery);
      end;

            //
      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_EXECTIME_NOW(' + IntToStr(InputQuery['ID_ORDER']) + ');';
      ExecQuery(OutputQuery);

      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_UPDATE_MOVING_INFO(' + IntToStr(InputQueryID_ORDER.Value) + ',5)';
      ExecQuery(OutputQuery);

            // Write to Buffer

            // ******* Пишем Буфера *********

            //if PersonalCommon.Version = 1 then WriteOrderToDbf(1);
      if not DontWriteToDbf then
      begin
        Buffer2Query.Transaction := WriteTransaction;
        Buffer2Query.Close;
        Buffer2Query.ParamByName('Id_Order').AsInteger := InputQueryID_ORDER.Value;
        Buffer2Query.ParamByName('Action_Ltd').AsInteger := 1; // !?
        Buffer2Query.Open;

        First_PBKey := Buffer2Query['First_PBKey'];
        Last_PBKey := Buffer2Query['Last_PBKey'];

        BufTran2 := TBufferTransaction2.
          Create('PEP_ORD,PEP_DATA,BONUS,HOLIDAY',
          'BUFF_PEP_ORD,BUFF_PEP_DATA,BUFF_BONUS,BUF_HOLIDAY',
          WriteTransaction);
        BufTran2.WriteRange(First_PBKey, Last_PBKey);
      end;
      if Test then ShowMessage('Before commit...');
      WriteTransaction.Commit;

    except on E: Exception do
      begin
        WriteTransaction.Rollback;
        if BufTran2 <> nil then BufTran2.RollbackOnError;

        MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
                //BufTran.Rollback;
      end;
    end;

        //BufTran.Commit;
    if BufTran2 <> nil then BufTran2.Free;

    NagScreen.Close;
    NagScreen.free;

        // Становимся на ту же запись в списке
    OLD_ID_ORDER := InputQueryID_ORDER.Value;
    InputQuery.Close;
    InputQuery.Open;
    InputQuery.Locate('ID_ORDER', OLD_ID_ORDER, []);
  end else
    MessageDlg('Немає наказів!', mtError, [mbOK], 0);
end;

procedure TOrdersViewForm.UnMakeActionExecute(Sender: TObject);
var
  OLD_ID_ORDER: integer;
  old_id_status: Integer;
  Form: TSpForm;
  Params: TSpParams;
  BufTran2: TBufferTransaction2;
  First_PBKey, Last_PBKey: Integer;
begin
  if (not InputQuery.IsEmpty)
    then begin

    old_id_status := InputQuery['ID_STATUS'];

    if (InputQuery['ID_STATUS'] = 1)
      then begin
      MessageDlg('Неможливо расформувати цей наказ, бо він несформований!', mtError, [mbOk], 0);
      Exit;
    end;

        // Проверяем, а можно ли расформировывать приказ? Может его информацию уже использует другой приказ?
    if (CurrentID_PCARD <> GetOrderOwner(InputQueryID_ORDER.Value)) and (GetOrderOwner(InputQueryID_ORDER.Value) <> 0) and
      (not AdminMode)
      then begin
      ErrMsg('Ви не можете расформувати цей наказ, його може расформувати тільки власник. Власника можна змінити, для цього треба зайти під його паролем, відкрити наказ для редагування та змінити власника.');
      exit;
    end;

    if MessageDlg('Ви справді бажаєте Расформувати цей наказ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;

        // Проверяем, а можно ли расформировывать этот приказ

    Form := TSpForm.Create(self);
    Params := TSpPArams.Create;

    Params.SelectProcName := 'ORDER_CHECK_FOR_UNFORM(' + InputQueryID_ORDER.AsString + ')';
    Params.SpFields := 'BAD_STRING';
    PArams.Title := 'Підстави чому неможливе розформування цього наказу';
    Params.ColumnNames := 'Підстава чому неможливе розформування цього наказу';
    Params.ReadOnly := True;
    Params.IdField := 'BAD_STRING';
    Params.ComboField := 'BAD_STRING';
    Params.SpMode := spmNormal;
    Params.DontHideFirstColumn := True;

    Form.Init(Params);

    if (not Form.ResultQuery.IsEmpty) then begin
      Form.ShowModal;

      Params.Free;
      Form.Free;

      exit;
    end;

    Params.Free;
    Form.Free;

        //

    if WriteTransaction.Active then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;

    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Расформування наказу...');

    BufTran2 := nil;
    try

        //  Ставим Всем подписывающим статус "Неподписанный"
      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_SIGN_2(' + IntToStr(InputQuery['ID_ORDER']) + ',2);';
      ExecQuery(OutputQuery);

        //  Меняем Статус приказа
      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_2(' + IntToStr(InputQuery['ID_ORDER']) + ',1);';
      ExecQuery(OutputQuery);

      OutputQuery.Close;
      OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_UPDATE_MOVING_INFO(' + IntToStr(InputQueryID_ORDER.Value) + ',1)';
      ExecQuery(OutputQuery);

        //Buffers
      if (old_id_status = 5) and not DontWriteToDbf then
      begin
        Buffer2Query.Transaction := WriteTransaction;
        Buffer2Query.Close;
        Buffer2Query.ParamByName('Id_Order').AsInteger := InputQueryID_ORDER.Value;
        Buffer2Query.ParamByName('Action_Ltd').AsInteger := 3; // !?
        Buffer2Query.Open;

        First_PBKey := Buffer2Query['First_PBKey'];
        Last_PBKey := Buffer2Query['Last_PBKey'];

        BufTran2 := TBufferTransaction2.
          Create('PEP_ORD,PEP_DATA,BONUS,HOLIDAY',
          'BUFF_PEP_ORD,BUFF_PEP_DATA,BUFF_BONUS,BUF_HOLIDAY',
          WriteTransaction);
        BufTran2.WriteRange(First_PBKey, Last_PBKey);
      end;
      WriteTransaction.Commit;

    except on E: Exception
      do begin
        MessageDlg('Виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);

        WriteTransaction.Rollback;
        if BufTran2 <> nil then BufTran2.RollbackOnError;
      end;
    end;

    if BufTran2 <> nil then BufTran2.Free;

    NagScreen.Close;
    NagScreen.Free;

    OLD_ID_ORDER := InputQueryID_ORDER.Value;
    InputQuery.Close;
    InputQuery.Open;
    InputQuery.Locate('ID_ORDER', OLD_ID_ORDER, []);
  end else
    MessageDlg('Немає наказів, які треба Расформувати!', mtError, [mbOk], 0);
end;

procedure TOrdersViewForm.SelectActionExecute(Sender: TObject);
begin
  if not InputQuery.IsEmpty then begin
    ModalResult := mrOk;
  end;
end;

procedure TOrdersViewForm.SendToZpActionExecute(Sender: TObject);
var
  old_id: Integer;
  NewValue: Char;
begin
  if (InputQuery.IsEmpty) then begin
    MessageDlg('Немає наказів!', mtError, [mbOk], 0);
    Exit;
  end;

  if (InputQueryOWNER_ID_PCARD.Value <> 0) and (GetCurrentUserIDExt <> InputQueryOWNER_ID_PCARD.Value) then begin
    ErrMsg('Ви не можете передати цей наказ до ЗП, це може зробити тільки власник наказу (' +
      GetManFIO(InputQueryOWNER_ID_PCARD.Value) + ')');
    exit;
  end;   

  if MessageDlg('Ви справді бажаєте передати вибраний наказ до ЗП?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  if InputQueryZ_SHOW_IN_ZP.Value = 'T' then
    NewValue := 'F'
  else
    NewValue := 'T';

  old_id := InputQueryID_ORDER.value;
  OutputQuery.Close;
  OutputQuery.SQL.Text := 'execute procedure ASUP_ORDERS_SEND_TO_ZP(' +
    IntToStr(InputQueryID_ORDER.Value) + ',' +
    QuotedStr(NewValue) + ')';
  ExecQuery(OutputQuery);

  RefreshAction.Execute;
  InputQuery.Locate('ID_ORDER', old_id, []);
end;

procedure TOrdersViewForm.ShowIdActionExecute(Sender: TObject);
begin
  try
    Clipboard.AsText := IntToStr(InputQuery['Id_Order']);
    ShowMessage('Id_Order: ' + IntToStr(InputQuery['Id_Order']));
  except
  end;
end;


procedure TOrdersViewForm.CBTypeOrdersPropertiesChange(Sender: TObject);
begin
    if FilterType.Checked then FilterAccept;
    if CBTypeOrders.Text='' then
        CBTypeOrdersPropertiesEditValueChanged(Self);
end;

procedure TOrdersViewForm.CBTypeOrdersPropertiesCloseUp(Sender: TObject);
begin
    CBTypeOrdersPropertiesEditValueChanged(Self);
end;

procedure TOrdersViewForm.CBTypeOrdersPropertiesEditValueChanged(
  Sender: TObject);
begin
    if (DSTypeOrder.Active) and (CBTypeOrders.EditValue<>-1) then
    begin
        DSTypeOrder.Locate('Name_Type',CBTypeOrders.EditText,[]);
        CBTypeOrders.EditValue:=DSTypeOrder['Id_Order_Type'];
    end
    else
    begin
        CBTypeOrders.EditValue:=-1;
    end;
end;

end.

