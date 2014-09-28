unit uOtpusk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpravControl, uFControl, uLabeledFControl, uDateControl, uCommonSp,
  DB, FIBDatabase, pFIBDatabase,  Ibase, uFormControl, uLogicCheck,
  uCharControl, uIntControl, RxMemDS, StdCtrls, Buttons, FIBDataSet,
  pFIBDataSet, cxLookAndFeelPainters, cxButtons, AppStruClasses, AccMgmt,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxLabel, cxContainer, cxTextEdit, cxDBEdit, Mask, DBCtrls,
  UpKernelUnit, cxCurrencyEdit, dxBar, dxBarExtItems, cxGridCardView,
  cxGridDBCardView, uBoolControl, uMemoControl, cxMaskEdit, cxDropDownEdit,
  cxCalendar;
                              
type
  TfrmOtpuskOrder = class(TForm)
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    WriteDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    Query: TpFIBQuery;
    DataSourceErrors: TDataSource;
    Panel3: TPanel;
    pcardEdit: TqFSpravControl;
    cbSr: TqFBoolControl;
    Panel2: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    NoteEdit: TqFMemoControl;
    ReasonEdit: TqFMemoControl;
    DateNewEdit: TcxDateEdit;
    OtpuskEdit: TqFSpravControl;
    DataSet: TpFIBDataSet;
    HospEdit: TqFSpravControl;
    TypeHolyday: TqFCharControl;
    LblDateNew: TcxLabel;
    Label1: TcxLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DaysEdit: TqFIntControl;
    HolidayDayCount: TqFIntControl;
    TotalDayCount: TqFIntControl;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    DateEndEdit: TcxDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure pcardEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure cbSrChange(Sender: TObject);
    procedure OtpuskEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure HospEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormShow(Sender: TObject);
    procedure DateEndEditExit(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    isFrame : boolean;
    UpdateFlag:integer;
    procedure SelectAll;
  public
    out_id_work_dog_moving :Variant;
    auto_fill_not_post_main_values:Integer;
    id_post :Variant;
    is_post_main:Variant;
    max_day_count:Integer;
    loc_is_insert:Boolean;
    Input : TrxMemoryData;
    Mode    : integer;
    id_session : int64;
    holiday_beg, holiday_end : TDate;
    constructor Create(AOwner : TComponent; inp : TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame : boolean); reintroduce;
  end;

   TUP_DischargeOrder = class(TSprav)
   public
     frm : TfrmOtpuskOrder;
     constructor Create;
     procedure Show; override;
     function GetFrame:TFrame; override;
   end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation
uses uOtpuskAdd, qFTools, DateUtils, uUnivSprav, BaseTypes;
{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TUP_DischargeOrder.Create;
end;

constructor TUP_DischargeOrder.Create;
begin
  inherited Create;
  Input.FieldDefs.Add('id_order', ftInteger);
  Input.FieldDefs.Add('id_order_type', ftInteger);
  Input.FieldDefs.Add('id_item', ftInteger);
  Input.FieldDefs.Add('Date_Order', ftDate);
  Input.FieldDefs.Add('outer_hwnd', ftInteger);
  Input.FieldDefs.Add('mode', ftInteger);
  Input.FieldDefs.Add('num_item', ftInteger);
  Input.FieldDefs.Add('num_sub_item', ftInteger);
  PrepareMemoryDatasets;
end;

function TUP_DischargeOrder.GetFrame: TFrame;
begin
  frm := TfrmOtpuskOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), true);
  Result := TFrame(frm);
end;

procedure TUP_DischargeOrder.Show;
begin
  frm := TfrmOtpuskOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), false);
  frm.ShowModal;
  frm.Free;
end;

(*function TfrmOtpuskOrder.ShowFilter(id_session, id_order_type : int64) : boolean;
var   PC: TFMASAppModule;
      Count:Integer;
      id_user : integer;
begin
      Result := false;
      id_user := AccMgmt.GetUserId;
      with TFMASAppModuleCreator.Create do
      begin
              PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'up\','up_filter');
              if (PC<>nil)
              then begin
                        //Инициализация входящих параметров
                        PC.InParams.Items['AOwner']        :=@self;
                        PC.InParams.Items['DbHandle']      :=PInteger(@Database.Handle);
                        PC.InParams.Items['Id_User']       :=PInteger(@id_user);
                        PC.InParams.Items['Id_order_type'] :=PInteger(@id_order_type);
                        PC.InParams.Items['KEY_SESSION']   :=PInt64(@id_session);


                        //Запуск фильтра
                        (PC as IFMASModule).Run;


                        //Получение количества записей которые вернул фильтр
                        Count:=PInteger(PC.OutParams.Items['Count'])^;
                        Result := Count > 0;
              end
              else MessageDlg('Помилка при використанні модуля up_filter.bpl',mtError,[mbOk], 0);
      end;
end;
  *)
procedure TfrmOtpuskOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteDataSet.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
  StoredProc.Prepare;
  StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
  StoredProc.ExecProc;
  WriteDataSet.Transaction.Commit;
end;

procedure TfrmOtpuskOrder.SelectAll;
begin
//  ReadDataSet.Close;
//  ReadDataSet.ParamByName('ID_SESSION').AsInt64 := id_session;
//  ReadDataSet.Open;
end;

procedure TfrmOtpuskOrder.btnAddClick(Sender: TObject);
//var
// frm : TfrmAddOtpusk;
begin
(*  if not ShowFilter(id_session, input['id_order_type']) then
  begin
    ShowMessage('Не відобрано записів');
    exit;
  end;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'UP_DT_MAN_POCH_DIS_BUFF_ADD';
  StoredProc.Prepare;
  StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
  StoredProc.ParamByName('ID_ORDER').AsInt64 := input['ID_ORDER'];
  StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := input['id_order_type'];
  StoredProc.ParamByName('DATE_BEG').AsDate := datebegEdit.Value;
  StoredProc.ParamByName('DATE_END').AsDate := dateEndEdit.Value;
  StoredProc.ParamByName('ID_TYPE_HOLIDAY').AsInt64 := 0;        
    try
      StoredProc.ExecProc;
    except
      StoredProc.Transaction.Rollback;
    end;
    StoredProc.Close;
    StoredProc.Transaction.Commit;
    SelectAll;
  *)
(*  frm := TfrmAddOtpusk.Create(Self);
  frm.Caption := 'Додати - ' + frm.Caption;
  frm.cbAll.Blocked := true;
  if frm.ShowModal = mrOK then
  begin
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_DT_MAN_POCH_DIS_BUFF_ADD';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('ID_ORDER').AsInt64 := input['id_order'];
    StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := input['id_order_type'];
    StoredProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
    StoredProc.ParamByName('ID_POCHAS_PLAN').AsInt64 := frm.DataSet['ID_POCHAS_PLAN'];
    try
      StoredProc.ExecProc;
    except
      StoredProc.Transaction.Rollback;
    end;
    StoredProc.Close;
    StoredProc.Transaction.Commit;
    SelectAll;
  end;
  frm.Free;*)
end;

procedure TfrmOtpuskOrder.btnDeleteClick(Sender: TObject);
begin
(*  if ReadDataSet.RecordCount = 0 then exit;
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName := 'UP_DT_MAN_POCH_DIS_BUFF_D';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
  StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := ReadDataSet['ID_ORDER_ITEM'];
  try
    StoredProc.ExecProc;
  except
    WriteTransaction.Rollback;
    exit;
  end;
  WriteTransaction.Commit;
  ReadDataSet.CacheDelete;*)
end;

procedure TfrmOtpuskOrder.btnOkClick(Sender: TObject);
var
  st : UP_KERNEL_MODE_STRUCTURE;
  doCommit : boolean;
  id_item, id_item2 : int64;
begin

  if UpdateFlag=1
     then cxButton1Click(self);
  if Mode = 2 then btnCancelClick(Sender);

  if not qFCheckAll(Self) then exit;

  if DateBegEdit.Visible then
  begin
    if VarToDateTime(DateBegEdit.Date) < holiday_beg then
    begin
      ShowMessage('Дата початку відкликання менше дати початку відпустки.');
      exit;
    end;

    if VarToDateTime(DateBegEdit.Date) + DaysEdit.Value - 1 > holiday_end then
    begin
      ShowMessage('Кількість днів перевищує дату закінчення відпустки.');
      exit;
    end;
  end;
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'HL_DT_MAN_HOLIDAY_FACT_BUFF_ADD';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('ID_ORDER').AsInt64 := input['ID_ORDER'];
    StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := input['ID_ORDER_TYPE'];
    StoredProc.ParamByName('DATE_BEG').asDate := DateBegEdit.Date;
    StoredProc.ParamByName('DAY_COUNT').asVariant := TotalDayCount.Value;
    StoredProc.ParamByName('ID_MAN_HOLIDAY_FACT').AsInt64 := OtpuskEdit.value;
    if cbSr.Value = true then StoredProc.ParamByName('SR').asInteger := 1 else StoredProc.ParamByName('SR').asInteger := 0;
    StoredProc.ParamByName('DATE_NEW').asDate := DateNewEdit.Date;
    StoredProc.ParamByName('NOTE').AsString := NoteEdit.Value;
    StoredProc.ParamByName('REASON').AsString := ReasonEdit.Value;
    StoredProc.ParamByName('ID_ORDER_ITEM').Value := Input['ID_ITEM'];
    StoredProc.ParamByName('ID_MAN_HOSP').Value := HospEdit.Value;
    StoredProc.ParamByName('NUM_ITEM').AsInteger := input['num_item'];
    StoredProc.ParamByName('NUM_SUBITEM').AsInteger := input['num_sub_item'];
    if (Mode = 1) then StoredProc.ParamByName('IS_EDIT').Value := 1 else StoredProc.ParamByName('IS_EDIT').Value := 0;
    StoredProc.ExecProc;
    id_item := StoredProc['ID_ITEM'].AsInt64;
    if cbSr.Value = true then id_item2 := StoredProc['ID_ITEM2'].AsInt64;
    if StoredProc['ERR'].AsInteger = 1 then
    begin
      WriteTransaction.Rollback;
      StoredProc.Close;
      ShowMessage('Период больничного не пересекается с периодом отпуска.');
      exit;
    end;

{    if StoredProc['RESULT'].AsInteger = 1 then
    begin
      StoredProc.Close;
      StoredProc.Transaction.Rollback;
      ShowMessage('Не знайдені періоди фактичних відпусток.');
      exit;
    end;}

    st.AOWNER := self;
    st.ID_ORDER := input['ID_ORDER'];
    st.ID_ORDER_ITEM_IN := id_item;
    st.KEY_SESSION := id_session;
    st.DBHANDLE := Database.Handle;
    st.TRHANDLE := WriteTransaction.Handle;
    if not UpKernelDo(@st) then
    begin
      GetUpSessionErrors(self, Database.Handle, id_session, id_item);
      WriteTransaction.Rollback;
      SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_ERR,0,0);
      exit;
    end;

    if cbSr.Value = true then
    begin
      st.ID_ORDER_ITEM_IN := id_item2;
      if not UpKernelDo(@st) then
      begin
        GetUpSessionErrors(self, Database.Handle, id_session, id_item2);
        WriteTransaction.Rollback;
        SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_ERR,0,0);
        exit;
      end;
    end;

    WriteTransaction.Commit;
    SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_OK,0,0);
end;

constructor TfrmOtpuskOrder.Create(AOwner: TComponent; inp : TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame : boolean);
var GetInfo:TpFibQuery;
    GetInfoStoredProc:TpFibStoredProc;
begin
  inherited Create(AOwner);
  DateBegEdit.Date := now;
  DateNewEdit.Date := Date;
  DateEndEdit.Date := now;
  Self.isFrame := in_isFrame;
  Input := inp;
  UpdateFlag:=0;
  Mode := Input['mode'];
//  ShowMessage(IntToStr(mode));
  TypeHolyday.Enabled := false;
  if isFrame then
  begin
    BorderStyle := bsNone;
    BorderIcons := [];
    Visible     := true;
    SendMessage(input['outer_hwnd'], FMAS_MESS_GET_BUTTON_OK,btnOk.Handle,btnOk.Handle);
    SendMessage(input['outer_hwnd'], FMAS_MESS_GET_BUTTON_CANCEL,btnCancel.Handle,btnCancel.Handle);  if isFrame then
  end;
  Database.Handle := hnd;


  DataSet.SelectSQL.Text := 'select moving_type from UP_DT_ORDER_TYPE where id_type = ' + IntToStr(input['id_order_type']);
  DataSet.Open;
  case DataSet.fbn('MOVING_TYPE').AsInteger of
    12:begin // Отзыв из отпуска
         cbSr.Visible := false;
        // lbNew.Visible := false;
         LblDateNew.Visible := false;
         DateNewEdit.Visible := false;
         HospEdit.Visible := false;
       end;
    15:begin // Перенос відпустки безстроковий
//         DateBegEdit.Visible := false;
//         lbDateBEg.Visible := false;
//         DaysEdit.Required := false;
//         DaysEdit.Visible := false;
//         DateEndEdit.Visible := false;
//         label1.Visible := false;
         cxLabel1.Caption := 'Перенести з';
         cbSr.Visible := false;
        // lbNew.Visible := false;
         LblDateNew.Visible := false;
         DateNewEdit.Visible := false;
         HospEdit.Visible := false;
       end;
    16:begin //Перенос відпустки строковий
//         DateBegEdit.Visible := false;
//         lbDateBEg.Visible := false;
//         DaysEdit.Required := false;
//         DaysEdit.Visible := false;
//         DateEndEdit.Visible := false;
//         label1.Visible := false;
         cxLabel1.Caption := 'Перенести з';
         cbSr.Visible := false;
         cbSr.Value := true;

     //    lbNew.Visible := true;
         LblDateNew.Visible := true;
         DateNewEdit.Visible := true;
         HospEdit.Visible := false;
       end;
    17:begin //Перенос відпустки по лікарняному
//         DateBegEdit.Visible := false;
//         lbDateBEg.Visible := false;
//         DaysEdit.Required := false;
//         DaysEdit.Visible := false;
//         DateEndEdit.Visible := false;
//         label1.Visible := false;
         cxLabel1.Caption := 'Перенести з';
         cbSr.Visible := false;
      //   lbNew.Visible := false;

         LblDateNew.Visible := false;
         DateNewEdit.Visible := false;
         HospEdit.Visible := true;
         HospEdit.Required := true;
         HospEdit.Asterisk := true;
       end;
  end;
  DataSet.close;

  if Mode = 0 then
  begin
    WriteDataSet.Transaction.StartTransaction;
    //Получаем идентификатор сессиии
    WriteDataSet.SelectSQL.Text := 'select gen_id(GEN_UP_ID_SESSION, 1) from ini_asup_consts';
    WriteDataSet.Open;
    id_session := WriteDataSet.Fields[0].Value;
    WriteDataSet.Close;
    WriteDataSet.Transaction.Commit;
  end;
  if (Mode = 1) or (Mode = 2) then
  begin
    WriteDataSet.Transaction.StartTransaction;
    //Получаем идентификатор сессиии
    WriteDataSet.SelectSQL.Text := 'select gen_id(GEN_UP_ID_SESSION, 1) from ini_asup_consts';
    WriteDataSet.Open;
    id_session := WriteDataSet.Fields[0].Value;
    WriteDataSet.Close;
    WriteDataSet.Transaction.Commit;
    DataSet.SelectSQL.Text := 'select * from HL_DT_MAN_HOLIDAY_FACT_BUFF_S2(:ID_ITEM)';
(*    DataSet.SelectSQL.Text := 'select hfb.holiday_beg, hfb.holiday_end, hfb.ID_MAN_HOLIDAY_FACT_AWAY, ' +
        'oi.note, oi.reason, hp.id_pcard, p.familia || '' '' || p.imya || '' '' || p.otchestvo as fio, ' +
        'hf.holiday_beg as hf_beg, hf.holiday_end as hf_end ' +
        'from hl_dt_man_holiday_fact_inst hfb, up_dt_order_items_inst oi, ' +
        'hl_dt_holiday_periods hp, private_cards pc, people p, ' +
        'hl_dt_man_holiday_fact hf ' +
        'where hfb.id_order_item = :ID_ITEM and ' +
        'oi.id_item = hfb.id_order_item and ' +
        'hp.id_holiday_period = hfb.id_holiday_period and ' +
        'pc.id_pcard = hp.id_pcard and ' +
        'p.id_man = pc.id_man';*)



    DataSet.ParamByName('ID_ITEM').AsInt64 := Input['ID_ITEM'];
//    DataSet.ParamByName('KEY_SESSION').AsInt64 := id_session;
    DataSet.Open;
    DateBegEdit.Date := DataSet.fbn('holiday_beg').AsDateTime;
    DateEndEdit.Date := DataSet.fbn('holiday_end').AsDateTime;
    // - DataSet.fbn('holiday_beg').AsDateTime;
    pcardEdit.Value := TFIBBCDField(DataSet.fbn('ID_PCARD')).AsInt64;
    pcardEdit.DisplayText := DataSet.fbn('FIO').AsString;
    OtpuskEdit.Value := TFIBBCDField(DataSet.fbn('ID_MAN_HOLIDAY_FACT_AWAY')).AsInt64;
    holiday_beg := DataSet.fbn('HF_BEG').AsDateTime;
    holiday_end := DataSet.fbn('HF_END').AsDateTime;
    OtpuskEdit.DisplayText := '№ ' + DataSet.fbn('NUM_ORDER').AsString + ' від ' +  DateToStr(DataSet.fbn('DATE_ORDER').AsDateTime) + '. Відпустка: ' + DateToStr(DataSet.fbn('HF_BEG').AsDateTime) + ' - ' + DateToStr(DataSet.fbn('HF_END').AsDateTime);
    NoteEdit.Value := DataSet.fbn('NOTE').AsString;
    ReasonEdit.Value := DataSet.fbn('REASON').AsString;
    DaysEdit.Value := -DataSet.fbn('DAY_COUNT').AsVariant;
///////////////////////////////////////
     //Получаем количество праздничных дней между двумя датами

     GetInfoStoredProc:=TpFibStoredProc.Create(self);
     GetInfoStoredProc.Database:=Database;
     GetInfoStoredProc.Transaction:=ReadTransaction;
     GetInfoStoredProc.StoredProcName:='HOLIDAYS_BETWEEN_2_DATES_EX3';
     GetInfoStoredProc.Prepare;
     GetInfoStoredProc.ParamByName('DATE_BEG').Value:=DateBegEdit.Date;
     GetInfoStoredProc.ParamByName('DATE_END').Value:=DateEndEdit.Date;
     GetInfoStoredProc.ExecProc;
     HolidayDayCount.Value:=GetInfoStoredProc.ParamByName('COUNT_DAY').Value;
     GetInfoStoredProc.Close;
     GetInfoStoredProc.Free;

     TotalDayCount.Value:= DaysEdit.Value+HolidayDayCount.Value;
        ///////////////////////////////////////////


    DateEndEdit.Date := IncDay(DateBegEdit.Date, TotalDayCount.Value-1);
    HospEdit.Value := TFIBBCDField(DataSet.fbn('ID_HOSPITAL')).AsInt64;
    HospEdit.DisplayText := DataSet.fbn('HOSP_STR').AsString;
    TypeHolyday.Value := DataSet.fbn('HOLIDAY_TYPE').AsString;

    if not VarIsNull(DataSet.fbn('DATE_NEW').AsVariant) then DateNewEdit.Date := DataSet.fbn('DATE_NEW').AsDateTime;
    DataSet.Close;

{    DataSet.Close;
    DataSet.SelectSQL.Text := 'select hfb.holiday_beg from hl_dt_man_holiday_fact_inst hfb, up_dt_order_items_inst oi ' +
                              'where hfb.id_order_item = oi.id_item and ' +
                              'oi.linkto = :ID_ITEM';
    DataSet.ParamByName('ID_ITEM').AsInt64 := Input['ID_ITEM'];
    DataSet.Open;
    if DataSet.RecordCount <> 0 then
    begin
      cbSr.Value := true;
      DateNewEdit.Date := DataSet.fbn('HF_BEG').AsDateTime;
    end;}
  end;
  if Mode = 2 then
  begin
    btnOk.Visible := false;
    DateBegEdit.Enabled := false;
    DateEndEdit.Enabled := false;
    DaysEdit.Enabled := false;
    pcardEdit.Enabled := false;
    OtpuskEdit.Enabled := false;
    NoteEdit.Enabled := false;
    ReasonEdit.Enabled := false;
    cbSr.Enabled := false;
    DateNewEdit.Enabled := false;
    HospEdit.Enabled := false;
  end;
  //////////////////////


     UpdateFlag:=1;
/////////////////////////

end;

procedure TfrmOtpuskOrder.btnEditClick(Sender: TObject);
//var
// frm : TfrmAddOtpusk;
// id : int64;
begin
(*  if ReadDataSet.RecordCount = 0 then exit;
  id := ReadDataSet['ID_ORDER_ITEM'];
  frm := TfrmAddOtpusk.Create(Self);
  frm.Caption := 'Змінити - ' + frm.Caption;
  frm.NoteEdit.Value := ReadDataSet['NOTE'];
  frm.DataSet.Locate('ID_POCHAS_PLAN', ReadDataSet['ID_POCHAS_PLAN'], []);
  frm.cxGrid1.Enabled := false;
  if Mode = 2 then qFBlock(true, frm);

  if (frm.ShowModal = mrOK) and (Mode <> 2) then
  begin
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_DT_MAN_POCH_DIS_BUFF_U';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := id;
    StoredProc.ParamByName('NOTE').AsVariant := frm.NoteEdit.Value;
    StoredProc.ParamByName('DO_ALL').AsInteger := frm.cbAll.Value;
    try
      StoredProc.ExecProc;
    except
      StoredProc.Transaction.Rollback;
    end;
    StoredProc.Transaction.Commit;
    SelectAll;
    ReadDataSet.Locate('ID_ORDER_ITEM', id, []);
  end;
  frm.Free;*)
end;

procedure TfrmOtpuskOrder.btnCancelClick(Sender: TObject);
begin
  if isFrame then SendMessage(input['outer_hwnd'], FMAS_MESS_CLOSE_FRAME,0,0) else Close;
end;

procedure TfrmOtpuskOrder.btnViewClick(Sender: TObject);
//var
//  md : integer;
begin
(*  md   := Mode;
  Mode := 2;
  btnEditClick(Sender);
  Mode := md;*)
end;

procedure TfrmOtpuskOrder.pcardEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
  // создать справочник
  sp :=  GetSprav('asup\PCardsList');
  if sp <> nil then
  begin
    // заполнить входные параметры
    with sp.Input do
    begin
      Append;
      FieldValues['DBHandle'] := Integer(Database.Handle);
      FieldValues['ActualDate'] := Date;
      FieldValues['SecondDate'] := 0;
      FieldValues['ShowWorking'] := True;
      FieldValues['CanRemoveFilter'] := True;
      Post;
    end;
    // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
    begin
      Value := sp.Output['ID_PCARD'];
      DisplayText := sp.Output['FIO'];
      ReasonEdit.Value := 'Заява ' + sp.Output['FIO_SMALL'];
    end;
    sp.Free;
  end;
end;

procedure TfrmOtpuskOrder.cbSrChange(Sender: TObject);
begin
// lbNew.Visible := cbSR.Value;
 DateNewEdit.Visible := cbSR.Value;
end;

procedure TfrmOtpuskOrder.OtpuskEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
 f : TfrmAddOtpusk;
begin
 f := TfrmAddOtpusk.Create(Self);
 F.DataSet.Close;
 F.DataSet.ParamByName('ID_PCARD').AsInt64 := pcardEdit.value;
 if DateBegEdit.Visible then
   F.DataSet.ParamByName('FILTER_DATE').AsDate := DateBegEdit.Date
  else
   F.DataSet.ParamByName('FILTER_DATE').AsVariant := Null;

 F.DataSet.Open;
 if f.ShowModal = mrOk then
 begin
   if f.DataSet.RecordCount <> 0 then
   begin
     Value := f.DataSet['ID_MAN_HOLIDAY_fact'];
     holiday_beg := f.DataSet['HOLIDAY_BEG'];
     holiday_end := f.DataSet['HOLIDAY_END'];
     DisplayText :=  '№ ' + f.DataSet.fbn('NUM_ORDER').AsString + ' від ' +  DateToStr(f.DataSet.fbn('DATE_ORDER').AsDateTime) + '. Відпустка: ' + DateToStr(f.DataSet['HOLIDAY_BEG']) + ' - ' + DateToStr(f.DataSet['HOLIDAY_END']);
     TypeHolyday.Value := f.DataSet['NAME_TYPE_HOLIDAY'];
   end;
 end;
 f.Free;
end;

procedure TfrmOtpuskOrder.HospEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
  sp := GetSprav('Asup\AsupHospital');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Database.Handle);
            FieldValues['Select'] := 1;
//            FieldValues['Input_Id_PCard'] := pcardEdit.Value;
            Post;
        end;
                // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
         Value := sp.Output['Id_Man_Hosp'];
          DisplayText := sp.Output['DisplayText'];
        end;
     end;
  sp.Free;
end;

procedure TfrmOtpuskOrder.FormShow(Sender: TObject);
begin
 DateBegEdit.Focused;
end;

procedure TfrmOtpuskOrder.DateEndEditExit(Sender: TObject);
var
  d : TDateTime;
begin
 // if  TryStrToDate(DateEndEdit.Text, d) then DaysEdit.Value := DaysBetween(DateBegEdit.Date, d) + 1;
  if UpdateFlag=1
     then cxButton1Click(self);
end;

procedure TfrmOtpuskOrder.cxButton1Click(Sender: TObject);
var GetInfoStoredProc:TpFibStoredProc;
begin
    if (DateBegEdit.Date <= DateEndEdit.Date) then
    begin
     //Необходимо получить количество дней между двумя датами
     TotalDayCount.Value:=DaysBetween(DateBegEdit.Date,DateEndEdit.Date)+1;

     //Получаем количество праздничных дней между двумя датами
     GetInfoStoredProc:=TpFibStoredProc.Create(self);
     GetInfoStoredProc.Database:=Database;
     GetInfoStoredProc.Transaction:=ReadTransaction;
     GetInfoStoredProc.StoredProcName:='HOLIDAYS_BETWEEN_2_DATES_EX3';
     GetInfoStoredProc.Prepare;
     GetInfoStoredProc.ParamByName('DATE_BEG').Value:=DateBegEdit.Date;
     GetInfoStoredProc.ParamByName('DATE_END').Value:=DateEndEdit.Date;
     GetInfoStoredProc.ExecProc;
     HolidayDayCount.Value:=GetInfoStoredProc.ParamByName('COUNT_DAY').Value;
     GetInfoStoredProc.Close;
     GetInfoStoredProc.Free;

     DaysEdit.Value:=TotalDayCount.Value-HolidayDayCount.Value;
     end
     else    agShowMessage('Дата початку не повинна перевищувати дати кінця!');

end;

procedure TfrmOtpuskOrder.cxButton2Click(Sender: TObject);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      if (HolidayDayCount.Value>0)
      then begin
                Params.FormCaption :='Святкові дні за період '+DateToStr(DateBegEdit.Date)+'-'+DateToStr(DateEndEdit.Date);
                Params.ShowMode    :=fsmSelect;
                Params.ShowButtons :=[fbExit];
                Params.TableName   :='HOLIDAYS_BETWEEN_2_DATES_EX2('+''''+DateToStr(DateBegEdit.Date)+''''+','+''''+DateToStr(DateEndEdit.Date)+''''+')';
                Params.Fields      :='HDATE';
                Params.FieldsName  :='Свято';
                Params.KeyField    :='HDATE';
                Params.ReturnFields:='HDATE';
                Params.DBHandle    :=Integer(Database.Handle);

                OutPut:=TRxMemoryData.Create(self);

                GetUnivSprav(Params,OutPut)
      end
      else agShowMessage('Не має жодного святкового дня!');

end;

end.




