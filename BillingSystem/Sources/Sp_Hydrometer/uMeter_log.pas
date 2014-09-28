unit uMeter_log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, iBase, uHydrometer_DM, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, ImgList, cxClasses, dxBar, dxBarExtItems,
  uCommon_Funcs, uConsts, dxStatusBar, uCommon_Types, uCommon_Messages,
  cxCalendar, ExtCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxContainer, cxLabel, cxDBEdit, FIBDataSet, pFIBDataSet, BsUnivSprav;

type
  TfrmMeter_log = class(TForm)
    BarManager: TdxBarManager;
    Button_add: TdxBarLargeButton;
    Button_edit: TdxBarLargeButton;
    Button_delete: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    Grid_hydrometer_log: TcxGrid;
    Grid_hydrometer_logDBView: TcxGridDBTableView;
    ColumnInput: TcxGridDBColumn;
    ColumnNumInv: TcxGridDBColumn;
    ColumnMeterDate: TcxGridDBColumn;
    ColumnMeterBeg: TcxGridDBColumn;
    ColumnMeterEnd: TcxGridDBColumn;
    Grid_hydrometer_logLevel: TcxGridLevel;
    StatusBar: TdxStatusBar;
    ColumnAdjustVolume: TcxGridDBColumn;
    ColumnVolume: TcxGridDBColumn;
    PopupMenu_edit: TdxBarPopupMenu;
    btnEditHydr: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    pnlFilter: TPanel;
    lblDateBeg: TcxLabel;
    lblDateEnd: TcxLabel;
    ColumnSummary: TcxGridDBColumn;
    ColumnHydrType: TcxGridDBColumn;
    DateBeg: TcxDBDateEdit;
    DateEnd: TcxDBDateEdit;
    LogDSet: TpFIBDataSet;
    LogDS: TDataSource;
    cxLabel1: TcxLabel;
    StatusEdit: TcxDBTextEdit;
    btnHistory: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormIniLanguage;
    procedure Button_addClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_editClick(Sender: TObject);
    procedure Button_deleteClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
  private
    PLanguageIndex : byte;
    TDM : TdmHydrometer_DM;
    aShortCut : TbsShortCut;
    IdInput, IdHydrometer:Integer;
    _DateBeg, _DateEnd:Tdate;
  public
    id_user : int64;
    Name_user : String;
    Is_admin : Boolean;
    constructor create(aOwner : TComponent; id_input, id_hydrometer : Integer; DBeg, DEnd:TDate; inDM:TdmHydrometer_DM); reintroduce;
  end;

var
  frmMeter_log: TfrmMeter_log;

implementation

{$R *.dfm}

uses uMeter_AE, FIBQuery, pFIBStoredProc, pFIBQuery, uStatus_change,
  cxCurrencyEdit;

constructor TfrmMeter_log.create(aOwner: TComponent; id_input, id_hydrometer : Integer; DBeg, DEnd:TDate; inDM:TdmHydrometer_DM);
begin
  inherited create(aOwner);

  IdInput := id_input;
  IdHydrometer:=id_hydrometer;
  TDM:=inDM;
  _DateBeg:=DBeg;
  _DateEnd:=DEnd;

  FormIniLanguage();

  RefreshButtonClick(self);
end;

procedure TfrmMeter_log.FormIniLanguage;
begin
  PLanguageIndex := uCommon_Funcs.bsLanguageIndex();

  //кэпшн формы
  Caption := 'Работа с показаниями водомера';

  //названия кнопок
  Button_add.Caption     := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  Button_edit.Caption    := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  Button_delete.Caption  := uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  RefreshButton.Caption  := uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  ExitButton.Caption     := uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //грид
//  name.Caption           := uConsts.bs_Name_Column[PLanguageIndex];


  //Статусбар
  StatusBar.Panels[0].Text := uConsts.bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  StatusBar.Panels[1].Text := uConsts.bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  StatusBar.Panels[2].Text := uConsts.bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  StatusBar.Panels[3].Text := uConsts.bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  StatusBar.Panels[4].Text := uConsts.bs_ExitBtn_ShortCut[PLanguageIndex]    + uConsts.bs_ExitBtn_Caption[PLanguageIndex];

  //Бокс
  //Box_Input.Caption := uConsts.bs_Name_Column[PLanguageIndex];

  aShortCut := LoadShortCut(TDM.DB.Handle, self);
//  Act_add.ShortCut := aShortCut.Add;
end;

procedure TfrmMeter_log.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMeter_log.RefreshButtonClick(Sender: TObject);
begin
  LogDSet.Close;
  LogDSet.SQLs.SelectSQL.Text := 'Select * from bs_hydrometer_log_sel(:id_input, :id_hydrometer, :date_beg, :date_end)';
  LogDSet.ParamByName('id_input').AsInt64 := IdInput;
  LogDSet.ParamByName('id_hydrometer').AsInteger:=IdHydrometer;
  LogDSet.ParamByName('date_beg').AsDate:=_DateBeg;
  LogDSet.ParamByName('date_end').AsDate:=_DateEnd;
  LogDSet.Open;
end;

procedure TfrmMeter_log.Button_addClick(Sender: TObject);
var
  ViewForm : TfrmMeter_AE;
  id : Integer;
begin
  ViewForm := TfrmMeter_AE.Create(self);

  ViewForm.DateSet.Date := Date;
  if ViewForm.ModalResult = mrok then
   Begin
    with TDM.StProc do
     Begin
      Transaction.StartTransaction;
      StoredProcName := 'BS_HYDROMETER_LOG_INS';
      Prepare;
      ParamByName('ID_INPUT').AsInt64 := IdInput;
      ParamByName('METER_DATE').AsDate := ViewForm.DateSet.Date;
      ParamByName('METER_END').AsFloat := ViewForm.MeterBeg.Value;
      ParamByName('ADJUSTMENT_VOLUME').AsFloat := ViewForm.AdjustVolume.Value;
      ExecProc;
      id := FieldByName('ID_HYDROMETER_LOG').AsInteger;
      Try
       Transaction.Commit;
       except
       on E:Exception do
         begin
          bsShowMessage('Ошибка', e.Message, mtError, [mbOK]);
          Transaction.Rollback;
          raise;
         end;
      end;

      RefreshButtonClick(self);
      LogDSet.Locate('ID_HYDROMETER_LOG', id, []);
     end;
   End;
  ViewForm.Free;
end;

procedure TfrmMeter_log.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild
   then action:=caFree
end;

procedure TfrmMeter_log.Button_editClick(Sender: TObject);
var
  ViewForm : TfrmMeter_AE;
  RetId:Variant;
  StrMsg:string;
begin
  if LogDSet.RecordCount = 0 then exit;

  ViewForm := TfrmMeter_AE.Create(self);

  ViewForm.DateSet.Date:= LogDSet['METER_DATE'];
  ViewForm.MeterBeg.Value:= LogDSet['METER_BEG'];
  ViewForm.AdjustVolume.Value := LogDSet['ADJUSTMENT_VOLUME'];
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrok then
  Begin
    with TDM.StProc do
    Begin
      Transaction.StartTransaction;
      StoredProcName := 'BS_HYDROMETER_LOG_INS';
      Prepare;
      ParamByName('ID_HYDROMETER').AsInteger := IdHydrometer;
      ParamByName('ID_INPUT').AsInteger := IdInput;
      ParamByName('METER_DATE').AsDate := ViewForm.DateSet.Date;
      ParamByName('METER_BEG').AsDouble := ViewForm.MeterBeg.Value;
      ParamByName('ADJUSTMENT_VOLUME').AsDouble := ViewForm.AdjustVolume.Value;
      ParamByName('ID_SOURCE').AsInteger := 0;
      ParamByName('ID_HYDROMETER_STATUS_IN').AsInteger := LogDSet['ID_HYDROMETER_STATUS'];
      Try
         ExecProc;
         RetId:=FieldByName('ID_HYDROMETER_LOG').AsInteger;
         StrMsg:=FieldByName('ER_MSG').AsString;
         if StrMsg='' then
         begin
            Transaction.Commit;
            RefreshButtonClick(self);
            LogDSet.Locate('ID_HYDROMETER_LOG', RetId, []);
         end
         else
         begin
            Transaction.Rollback;
            bsShowMessage(Application.Title, StrMsg, mtInformation, [mbOK]);
         end;
      except on E:Exception do
              begin
                 bsShowMessage('Ошибка', e.Message, mtError, [mbOK]);
                 Transaction.Rollback;
                 raise;
              end;
      end;
    End;
  End;
  ViewForm.Free;
end;

procedure TfrmMeter_log.Button_deleteClick(Sender: TObject);
var
  i : Byte;
  RetId, RetDate : Variant;
  strMsg:string;
begin
  if LogDset.RecordCount = 0 then exit;

  i := bsShowMessage('Информация', 'Вы действительно хотите удалить запись?', mtInformation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  with TDM.StProc do
  Begin
    Transaction.StartTransaction;
    StoredProcName := 'BS_HYDROMETER_LOG_DEL';
    Prepare;
    ParamByName('ID_HYDROMETER_LOG').AsInteger:= LogDSet['ID_HYDROMETER_LOG'];
    Try
      ExecProc;
      RetId := FieldByName('ID_HYDROMETER').AsInteger;
      RetDate := FieldByName('Date_BEg').AsDate;
      strMsg:= FieldByName('ER_MSG').AsString;
      if strMsg='' then
      begin
         Transaction.Commit;
         RefreshButtonClick(self);
         LogDSet.Locate('ID_HYDROMETER;Date_Beg_Period', VarArrayOf([RetId, RetDate]), []);
      end
      else
      begin
         Transaction.Rollback;
         bsShowMessage(Application.Title, strMsg, mtInformation, [mbOK]);
      end;

     except
     on E:Exception do
       begin
        bsShowMessage('Ошибка', e.Message, mtError, [mbOK]);
        Transaction.Rollback;
        raise;
       end;
    end;
  end;
end;

procedure TfrmMeter_log.dxBarLargeButton2Click(Sender: TObject);
Var
  ViewForm : TfrmStatus_change;
  Retid : Integer;
  strMsg:string;
begin
  If LogDSet.RecordCount = 0 then exit;

  ViewForm := TfrmStatus_change.Create(self);
  ViewForm.StatusDSetCloseOpen;
  ViewForm.StateBox.EditValue:=LogDSet['Id_Hydrometer_Status'];

  ViewForm.aHandle   := TDM.DB.Handle;
  ViewForm.id_user   := id_user;
  ViewForm.Name_User := Name_User;
  ViewForm.is_admin  := is_admin;
  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrOk then
  begin

    With TDM.StProc do
    begin
      Transaction.StartTransaction;
      StoredProcName := 'BS_HYDROMETER_STATUS_UPD';
      Prepare;
      ParamByName('ID_INPUT').AsInteger := IdInput;
      ParamByName('ID_HYDROMETER_STATUS').AsInteger := ViewForm.StateBox.EditValue;
      ParamByName('DATE_SET').AsDate := ViewForm.DateSet.Date;
      ParamByName('ID_HYDROMETER').AsInteger := IdHydrometer;
      Try
         ExecProc;
         Retid := FieldByName('ID_HYDROMETER_LOG').AsInteger;
         strMsg := FieldByName('ER_MSG').AsString;
         if strMsg='' then
         begin
            Transaction.Commit;
            RefreshButtonClick(self);
            LogDSet.Locate('ID_HYDROMETER_LOG', Retid, []);
         end
         else
         begin
            Transaction.Rollback;
            bsShowMessage(Application.Title, strMsg, mtInformation, [mbOK]);
         end;
      except on E:Exception do
             begin
                bsShowMessage('Ошибка', e.Message, mtError, [mbOK]);
                Transaction.Rollback;
                raise;
             end;
      end;
    end;
  end;
   
  ViewForm.Free; 
end;

procedure TfrmMeter_log.btnHistoryClick(Sender: TObject);
var frm:TfrmSprav;
    sParam:TSpravParams;
begin
    if LogDSet.IsEmpty then Exit;
    sParam.FormCaption := 'Ісорія змін';
    sParam.SelectText := 'SELECT DISTINCT * FROM BS_HYDROMETER_LOG_HST_SEL('+IntToStr(IdHydrometer)+','+IntToStr(IdInput)+')';
    sParam.NameFields := 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Kod_Input,'+
                         'Meter_Date,Meter_Beg,Meter_Volume,'+
                         'Adjustment_Volume,Meter_End,Date_Add,Num_Cd_Period,Name_Hydrometer_Status,Id_Hst';
    sParam.FieldsCaption := 'Користувач#Дата та час зміни#Дія#Код вводу#'+
                            'Дата зняття#Поч. показання#Розрахунковий об''єм#'+
                            '#Заведений#Кіл-сть календарних днів#Статус';
    sParam.KeyField := 'Id_Hst';
    sParam.ReturnFields := 'Id_Hst';
    sParam.FilterFields:= 'User_Fio_Hst,Date_Time_Hst,Action_Hst,Kod_Input,'+
                         'Meter_Date,Meter_Beg,Meter_Volume,'+
                         'Adjustment_Volume,Meter_End,Date_Add,Num_Cd_Period,Name_Hydrometer_Status';
    sParam.FilterCaptions:='Користувач,Дата та час зміни,Дія,Код вводу,'+
                            'Дата зняття,Поч. показання,Розрахунковий об''єм,'+
                            ',Заведений,Кіл-сть календарних днів,Статус';
    sParam.DbHandle:=TDM.DB.Handle;
    sParam.frmButtons:=[BsUnivSprav.fbExit];
    sParam.IsMultiSelect:=False;
    frm:=TfrmSprav.Create(Self, sParam);
    frm.ShowModal;
    frm.Free;
end;

end.
