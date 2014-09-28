unit uBeginWork;

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
  cxCalendar, ActnList;
                              
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
    Panel2: TPanel;
    Bevel1: TBevel;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    OtpuskEdit: TqFSpravControl;
    DataSet: TpFIBDataSet;
    TypeHolyday: TqFCharControl;
    DateBegEdit: TcxDateEdit;
    LblDateBegEdit: TcxLabel;
    NoteEdit: TqFMemoControl;
    ReasonEdit: TqFMemoControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure pcardEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure cbSrChange(Sender: TObject);
    procedure OtpuskEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure HospEditOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormShow(Sender: TObject);
    procedure DateBegEditExit(Sender: TObject);
    procedure NoteEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    isFrame : boolean;
  public
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
uses uBeginWorkAdd, qFTools, DateUtils, BaseTypes;
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

procedure TfrmOtpuskOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteDataSet.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
  StoredProc.Prepare;
  StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
  StoredProc.ExecProc;
  WriteDataSet.Transaction.Commit;
end;

procedure TfrmOtpuskOrder.btnOkClick(Sender: TObject);
var
  st : UP_KERNEL_MODE_STRUCTURE;
  id_item : int64;
begin
  if Mode = 2 then btnCancelClick(Sender);

  if DateBegEdit.Text='' then
  begin
      agMessageDlg('Помилка!', 'Не заповнено поле "Стала до роботи з"!', mtError, [mbOk]);
      DateBegEdit.Style.Color:=$8080FF;
      exit;
  end;

    if not qFCheckAll(Self) then exit;

    if VarToDateTime(DateBegEdit.Text) < holiday_beg then
    begin
      ShowMessage('Дата, коли людина стане до роботи, повинна бути більше дати початку відпустки!');
      exit;
    end;

    if VarToDateTime(DateBegEdit.Text) < holiday_beg then
    begin
      ShowMessage('Дата, коли людина стане до роботи, повинна бути більше дати початку відпустки!');
      exit;
    end;

    if VarToDateTime(DateBegEdit.Text) > holiday_end then
    begin
      ShowMessage('Дата, коли людина стане до роботи, повинна бути менше дати кінця відпустки!');
      exit;
    end;

    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_DT_BEGIN_WORK_BUFF_ADD';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('ID_ORDER').AsInt64 := input['ID_ORDER'];
    StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := input['ID_ORDER_TYPE'];
    StoredProc.ParamByName('DATE_BEG').asDate := DateBegEdit.Date;
    StoredProc.ParamByName('ID_MAN_HOLIDAY_FACT').AsInt64 := OtpuskEdit.value;
    StoredProc.ParamByName('NOTE').AsString := NoteEdit.Value;
    StoredProc.ParamByName('REASON').AsString := ReasonEdit.Value;
    StoredProc.ParamByName('ID_ORDER_ITEM').Value := Input['ID_ITEM'];
    StoredProc.ParamByName('NUM_ITEM').AsInteger := input['num_item'];
    StoredProc.ParamByName('NUM_SUBITEM').AsInteger := input['num_sub_item'];
    if (Mode = 1) then StoredProc.ParamByName('IS_EDIT').Value := 1 else StoredProc.ParamByName('IS_EDIT').Value := 0;
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

constructor TfrmOtpuskOrder.Create(AOwner: TComponent; inp : TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame : boolean);
begin
  inherited Create(AOwner);
  if DateBegEdit.Text<>'' then
  begin
      LblDateBegEdit.Caption :=  'Стала до роботи з:';
      LblDateBegEdit.Left :=  20;
  end
  else
  begin
      LblDateBegEdit.Caption :=  '* Стала до роботи з:';
      LblDateBegEdit.Left :=  16;
  end;
  //DateBegEdit.Date := now;
  Self.isFrame := in_isFrame;
  Input := inp;
  Mode := Input['mode'];
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
    DataSet.SelectSQL.Text := 'select * from UP_DT_BEGIN_WORK_BUFF_SEL(:ID_ITEM)';

    DataSet.ParamByName('ID_ITEM').AsInt64 := Input['ID_ITEM'];
    DataSet.Open;
    DateBegEdit.Date := DataSet.fbn('holiday_beg').AsDateTime;
    pcardEdit.Value := TFIBBCDField(DataSet.fbn('ID_PCARD')).AsInt64;
    pcardEdit.DisplayText := DataSet.fbn('FIO').AsString;
    OtpuskEdit.Value := TFIBBCDField(DataSet.fbn('ID_MAN_HOLIDAY_FACT_AWAY')).AsInt64;
    holiday_beg := DataSet.fbn('HF_BEG').AsDateTime;
    holiday_end := DataSet.fbn('HF_END').AsDateTime;
    OtpuskEdit.DisplayText := '№ ' + DataSet.fbn('NUM_ORDER').AsString + ' від ' +  DateToStr(DataSet.fbn('DATE_ORDER').AsDateTime) + '. Відпустка: ' + DateToStr(DataSet.fbn('HF_BEG').AsDateTime) + ' - ' + DateToStr(DataSet.fbn('HF_END').AsDateTime);
    NoteEdit.Value := DataSet.fbn('NOTE').AsString;
    ReasonEdit.Value := DataSet.fbn('REASON').AsString;
    TypeHolyday.Value := DataSet.fbn('HOLIDAY_TYPE').AsString;

    DataSet.Close;

    if DateBegEdit.Text<>'' then
    begin
        LblDateBegEdit.Caption :=  'Стала до роботи з:';
        LblDateBegEdit.Left :=  20;
    end
    else
    begin
        LblDateBegEdit.Caption :=  '* Стала до роботи з:';
        LblDateBegEdit.Left :=  16;
    end;

  end;
  if Mode = 2 then
  begin
    btnOk.Visible := false;
    DateBegEdit.Enabled := false;
    pcardEdit.Enabled := false;
    OtpuskEdit.Enabled := false;
    NoteEdit.Enabled := false;
    ReasonEdit.Enabled := false;
    if DateBegEdit.Text<>'' then
    begin
        LblDateBegEdit.Caption :=  'Стала до роботи з:';
        LblDateBegEdit.Left :=  20;
    end
    else
    begin
        LblDateBegEdit.Caption :=  '* Стала до роботи з:';
        LblDateBegEdit.Left :=  16;
    end;

  end;
end;

procedure TfrmOtpuskOrder.btnCancelClick(Sender: TObject);
begin
  if isFrame then SendMessage(input['outer_hwnd'], FMAS_MESS_CLOSE_FRAME,0,0) else Close;
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
 //lbNew.Visible := cbSR.Value;
 //DateNewEdit.Visible := cbSR.Value;
end;

procedure TfrmOtpuskOrder.OtpuskEditOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
 f : TfrmAddOtpusk;
begin
 if VarIsNull(pcardEdit.value) then exit;
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
    if  btnOk.Visible then
    btnOk.SetFocus;
end;

procedure TfrmOtpuskOrder.DateBegEditExit(Sender: TObject);
begin
    if DateBegEdit.Text<>'' then
    begin
        LblDateBegEdit.Caption :=  'Стала до роботи з:';
        LblDateBegEdit.Left :=  20;
    end
    else
    begin
        LblDateBegEdit.Caption :=  '* Стала до роботи з:';
        LblDateBegEdit.Left :=  16;
    end;
end;

procedure TfrmOtpuskOrder.NoteEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If ((Key = VK_F12) And (ssShift In Shift))
   Then ShowMessage('id_session= '+IntToStr(id_session));
end;

end.




