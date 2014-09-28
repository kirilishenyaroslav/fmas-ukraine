unit uOtpuskKompens;

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
  TfrmOtpuskKompens = class(TForm)
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
    Panel2: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    NoteEdit: TqFMemoControl;
    ReasonEdit: TqFMemoControl;
    KompensEdit: TqFSpravControl;
    DaysEdit: TqFIntControl;
    DataSet: TpFIBDataSet;
    ReasonDSet: TpFIBDataSet;
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
    procedure FormCreate(Sender: TObject);
    procedure KompensEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    isFrame : boolean;
    DateFilter:TDate;
//    function ShowFilter(id_session, id_order_type : int64) : boolean;
    procedure SelectAll;
  public
    Input : TrxMemoryData;
    Mode    : integer;
    id_session : int64;
    constructor Create(AOwner : TComponent; inp : TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame : boolean); reintroduce;
  end;

   TUP_DischargeOrder = class(TSprav)
   public
     frm : TfrmOtpuskKompens;
     constructor Create;
     procedure Show; override;
     function GetFrame:TFrame; override;
   end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

implementation
uses uOtpuskAddKompens, qFTools;
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
  frm := TfrmOtpuskKompens.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), true);
  Result := TFrame(frm);
end;

procedure TUP_DischargeOrder.Show;
begin
  frm := TfrmOtpuskKompens.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), false);
  frm.ShowModal;
  frm.Free;
end;

(*function TfrmOtpuskKompens.ShowFilter(id_session, id_order_type : int64) : boolean;
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
procedure TfrmOtpuskKompens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteDataSet.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
  StoredProc.Prepare;
  StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
  StoredProc.ExecProc;
  WriteDataSet.Transaction.Commit;
end;

procedure TfrmOtpuskKompens.SelectAll;
begin
end;

procedure TfrmOtpuskKompens.btnAddClick(Sender: TObject);
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

procedure TfrmOtpuskKompens.btnDeleteClick(Sender: TObject);
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

procedure TfrmOtpuskKompens.btnOkClick(Sender: TObject);
var
  st : UP_KERNEL_MODE_STRUCTURE;
  id_item : int64;
begin
  if Mode = 3 then btnCancelClick(Sender);
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'HL_DT_MAN_HOLIDAY_KOMPENS_INS';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('ID_ORDER').AsInt64 := input['ID_ORDER'];
    StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := input['ID_ORDER_TYPE'];
    StoredProc.ParamByName('DAY_COUNT').asInteger := DaysEdit.Value;
//    StoredProc.ParamByName('ID_PCARD').AsInt64 := pcardEdit.value;
    StoredProc.ParamByName('ID_MAN_HOLIDAY_PLAN').AsInt64 := KompensEdit.Value;
    StoredProc.ParamByName('NOTE').AsString := NoteEdit.Value;
    StoredProc.ParamByName('REASON').AsString := ReasonEdit.Value;
    StoredProc.ParamByName('NUM_ITEM').AsInteger := input['num_item'];
    StoredProc.ParamByName('NUM_SUBITEM').AsInteger := input['num_sub_item'];
    if mode = 1 then StoredProc.ParamByName('IS_EDIT').AsInteger := 1 else StoredProc.ParamByName('IS_EDIT').AsInteger := 0;
    StoredProc.ParamByName('ID_ORDER_ITEM').Value := input['ID_ITEM'];
    StoredProc.ParamByName('Date_Filter').AsDate:=Date;//DateFilter;
    StoredProc.ExecProc;
    id_item := StoredProc['ID_ITEM'].AsInt64;

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

    WriteTransaction.Commit;
    SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_OK,0,0);
end;

constructor TfrmOtpuskKompens.Create(AOwner: TComponent; inp : TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame : boolean);
begin
  inherited Create(AOwner);
  Self.isFrame := in_isFrame;
  Input := inp;
  Mode := Input['mode'];
  if isFrame then
  begin
    BorderStyle := bsNone;
    BorderIcons := [];
    Visible     := true;
    SendMessage(input['outer_hwnd'], FMAS_MESS_GET_BUTTON_OK,btnOk.Handle,btnOk.Handle);
    SendMessage(input['outer_hwnd'], FMAS_MESS_GET_BUTTON_CANCEL,btnCancel.Handle,btnCancel.Handle);  if isFrame then
  end;
  Database.Handle := hnd;
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

    DataSet.SelectSQL.Text :=
       'select hf.day_count, oi.note, oi.reason, hp.id_pcard, ' +
       'p.familia || '' '' || p.imya || '' '' || p.otchestvo as fio, ' +
       'hplan.period_beg, hplan.period_end, hplan.id_man_holiday_plan ' +
       'from hl_dt_man_holiday_fact_inst hf, up_dt_order_items_inst oi, ' +
       'hl_dt_holiday_periods hp, private_cards pc, people p, ' +
       'hl_dt_man_holiday_plan hplan ' +
       'where hf.id_order_item = oi.id_item and ' +
       'oi.id_item = :id_item and ' +
       'hp.id_holiday_period = hf.id_holiday_period and ' +
       'hp.id_pcard = pc.id_pcard and ' +
       'pc.id_man = p.id_man and ' +
       'hplan.id_type_holiday = hf.id_type_holiday and ' +
       'hplan.id_holiday_period = hf.id_holiday_period and ' +
       'hplan.id_work_dog_moving = hf.id_work_dog_moving';
    DataSet.ParamByName('ID_ITEM').AsInt64 := input['ID_ITEM'];
    DataSet.Open;
    pcardEdit.Value := TFIBBCDField(DataSet.fbn('ID_PCARD')).AsInt64;
    pcardEdit.DisplayText := DataSet.fbn('FIO').AsString;
    KompensEdit.Value := TFIBBCDField(DataSet.fbn('id_man_holiday_plan')).AsInt64;
    KompensEdit.DisplayText := DateToStr(DataSet.fbn('period_beg').AsDateTime) + ' - ' + DateToStr(DataSet.fbn('period_end').AsDateTime);
    DaysEdit.Value := DataSet.fbn('day_count').AsInteger;
    NoteEdit.Value := DataSet.fbn('note').AsString;
    ReasonEdit.Value := DataSet.fbn('reason').AsString;
    DataSet.Close;
  end;
  if Mode = 2 then
  begin
      btnOk.Enabled := false;
//    btnEdit.Enabled := false;
//    btnDelete.Enabled := false;
  end;
end;

procedure TfrmOtpuskKompens.btnEditClick(Sender: TObject);
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

procedure TfrmOtpuskKompens.btnCancelClick(Sender: TObject);
begin
  if isFrame then SendMessage(input['outer_hwnd'], FMAS_MESS_CLOSE_FRAME,0,0) else Close;
end;

procedure TfrmOtpuskKompens.btnViewClick(Sender: TObject);
//var
//  md : integer;
begin
(*  md   := Mode;
  Mode := 2;
  btnEditClick(Sender);
  Mode := md;*)
end;

procedure TfrmOtpuskKompens.pcardEditOpenSprav(Sender: TObject;
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
      if not VarIsNull(Value) then
      begin
         if ReasonDSet.Active then ReasonDSet.Close;
         ReasonDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM UP_GET_MAN_REASON_BY_PCARD(:ID_PCARD)';
         ReasonDSet.ParamByName('ID_PCARD').AsInteger:=Value;
         ReasonDSet.Open;
         if ((not ReasonDSet.IsEmpty) and (ReasonDSet['MAN_REASON']<>'')) then ReasonEdit.Value:=ReasonDSet['MAN_REASON'];
      end;
    end;
    sp.Free;
  end;
end;

procedure TfrmOtpuskKompens.cbSrChange(Sender: TObject);
begin
// lbNew.Visible := cbSR.Value;
// DateNewEdit.Visible := cbSR.Value;
end;

procedure TfrmOtpuskKompens.FormCreate(Sender: TObject);
begin
// DateBegEdit.Date := now;
// DateNewEdit.Date := now;
end;

procedure TfrmOtpuskKompens.KompensEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
 f : TfrmAddKompens;
begin
 f := TfrmAddKompens.Create(Self);
 F.DataSet.ParamByName('ID_PCARD').AsInt64 := pcardEdit.value;
// showmessage(IntToStr(pcardEdit.value));
 F.DataSet.Open;
 if f.ShowModal = mrOk then
 begin
   if f.DataSet.RecordCount <> 0 then
   begin
     Value := f.DataSet['ID_MAN_HOLIDAY_PLAN'];
     DisplayText := DateToStr(f.DataSet['PERIOD_BEG']) + ' - ' + DateToStr(f.DataSet['PERIOD_END']);
     DateFilter:=f.DataSet['PERIOD_BEG'];
   end;
 end;
 f.Free;
end;

end.




