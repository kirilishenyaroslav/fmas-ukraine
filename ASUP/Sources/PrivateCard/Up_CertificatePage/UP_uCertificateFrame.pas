unit UP_uCertificateFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid,  cxContainer, cxLabel,
  cxDBLabel, ExtCtrls, Buttons, cxCalendar, cxTL, //Clipbrd,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCurrencyEdit,
  cxCheckBox, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  Ibase, cxTextEdit, cxDropDownEdit, uFControl, uLabeledFControl,
  uDateControl, cxDBEdit, cxSplitter, cxLookAndFeelPainters, cxButtons,
  cxButtonEdit, cxPropertiesStore, Placemnt, uLogicCheck, ComCtrls,
  pFibStoredProc,uCommonSp, IniFiles;

type
  TfmCertificatePage = class(TFrame)
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    Panel1: TPanel;
    ActionList1: TActionList;
    BonusesAct: TAction;               
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    pFIBDS_Format: TpFIBDataSet;
    pFIBDS_FormatSTAVKI_DISP_FORMAT: TFIBStringField;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    ReportDataViewDBColumn7: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    Panel2: TPanel;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    Label7: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label8: TLabel;
    Label9: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    Label11: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    Label1: TLabel;
    cxCB_ShowOld: TcxCheckBox;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    HistView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    HistViewDBColumn1: TcxGridDBColumn;
    HistViewDBColumn3: TcxGridDBColumn;
    HistViewDBColumn4: TcxGridDBColumn;
    L: TcxGridLevel;
    Panel4: TPanel;
    onclickAction: TAction;
    cxSplitter1: TcxSplitter;
    checker_click: TAction;
    Btn_Show: TSpeedButton;
    CheckerSet: TpFIBDataSet;
    DatePeriods: TSpeedButton;
    DateVidachi: TSpeedButton;
    ReportDataViewDBColumn9: TcxGridDBColumn;
    DBFoto: TpFIBDatabase;
    FotoSet: TpFIBDataSet;
    FIBTrans: TpFIBTransaction;
    CertificateSelect: TpFIBDataSet;
    HistDataSet: TpFIBDataSet;
    HistDataSource: TDataSource;
    CertificateSource: TDataSource;
    procedure OnDateChange(Sender: TObject);
    procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_ShowClick(Sender: TObject);
    procedure ReportDataViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure onclickActionExecute(Sender: TObject);
    procedure checker_clickExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DatePeriodsClick(Sender: TObject);
    procedure DateVidachiClick(Sender: TObject);
    procedure CertificateSelectAfterScroll(DataSet: TDataSet);
  private
    Select_Type: Integer;
    modify: Integer;
    id_level:Variant;
    procedure GetData;
  public
    id_pcard:int64;
    procedure MovingsSelectAfterOpen(DataSet: TDataSet);
    constructor Create(AOwner: TComponent;DBHandle:TISC_DB_HANDLE;Id_PCard: Integer; Select_Type: Integer;modify :integer); reintroduce;
  end;

implementation

{$R *.dfm}

uses uFormControl, Registry, Clipbrd,
     UpKernelUnit, uUnivSprav, RxmemDS, accmgmt, UP_CertificateDateEdit;

constructor TfmCertificatePage.Create(AOwner: TComponent;
                                       DBHandle:TISC_DB_HANDLE;
                                       Id_PCard:Integer;
                                       Select_Type: Integer;
                                       modify :integer);
var D,M,Y,Hour, Min, Sec, MSec :Word;
    pc:integer;
    ch:Variant;
begin
    inherited Create(AOwner);
    id_level:=null;

    DecodeDate(Date,Y,M,D);
    DecodeTime(Time,Hour, Min, Sec, MSec);
    self.Name:=self.Name+IntToStr(Y)+IntToStr(M)+IntToStr(D)+IntToStr(Hour)+IntToStr(Min)+IntToStr(Sec);
    DB.Handle:=DBHandle;
    ReadTransaction.StartTransaction;
    Self.Select_Type := Select_Type;
    Self.modify:=modify;
    self.id_pcard:=Id_PCard;
    CheckerSet.Close;
    CheckerSet.SQLs.SelectSQL.Text:='SELECT GIVE_CERTIFICATE FROM PRIVATE_CARDS WHERE ID_PCARD=:PC';
    CheckerSet.ParamByName('PC').AsInteger :=Id_PCard;
    CheckerSet.Open;
    ch:=CheckerSet['GIVE_CERTIFICATE'];
    CertificateSelect.Close;
    //showmessage('ch '+inttostr(ch));
    CertificateSelect.SQLs.SelectSQL.Text:='SELECT * FROM UP_KER_GET_CERTIFICATE_BY_PCARD(:ID_PCARD)';
     CertificateSelect.AfterOpen:=MovingsSelectAfterOpen;
    CertificateSelect.ParamByName('ID_PCARD').AsInteger :=Id_PCard;
    CertificateSelect.CloseOpen(True);
    //pFIBDS_Format.Close;
    //pFIBDS_Format.Open;
    If  CertificateSelect.IsEmpty then
    begin
        CertificateSelect.Close;
    end ;
    if CertificateSelect.RecordCount>0 then
    begin
    HistDataSet.Close;
    HistDataSet.SQLs.SelectSQL.Clear;
    HistDataSet.SQLs.SelectSQL.Text:='SELECT * FROM UP_KER_GET_CERTIFICATE_HIST(:ID_MAN_CERTIFICATE)';
    HistDataSet.ParamByName('ID_MAN_CERTIFICATE').AsInteger :=CertificateSelect['ID_MAN_CERTIFICATE'];
    HistDataSet.Open;
    //showmessage(inttostr(ch));

    end;
    if CertificateSelect.IsEmpty then
    begin
        DatePeriods.Enabled:=false;
        DateVidachi.Enabled:=false;
    end
    else
    begin
        DatePeriods.Enabled:=true;
        DateVidachi.Enabled:=true;
    end;
     if ch=-1 then
        cxCB_ShowOld.Checked:=true else   cxCB_ShowOld.Checked:=false;

    if modify=0
    then
    begin
        cxCB_ShowOld.Enabled:=False;
        Btn_Show.Enabled:=False;
    end;
    if cxCB_ShowOld.Checked=false then
    begin
        //cxCB_ShowOld.Properties.Caption:='Видавати посвідчення';
        Btn_Show.Caption:='Видавати посвідчення';
    end
    else
    begin
        //cxCB_ShowOld.Properties.Caption:='Не видавати посвідчення';
        Btn_Show.Caption:='Не видавати посвідчення';
    end;
end;

function GetImageDBHandle(MAIN_DB_HANDLE: TISC_DB_HANDLE): TISC_DB_HANDLE;
var
    CurrUserInfo: AccMgmt.TUserInfo;
    ResultInfo: AccMgmt.TResultInfo;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    pShowFoto: Variant;
    F: TIniFile;
    ImagePath: string;
begin
    CurrUserInfo := AccMgmt.fibGetCurrentUserInfo;
{ Первый шаг проверки - разрешено ли использование пакета фотографий,
  второй шаг - проверка на наличие базы, т.к. мало ли что можно отметить в таблице}
// Первый шаг

    Result := nil;
    DB := TpFIBDatabase.Create(nil);
    ReadTransaction := TpFIBTransaction.Create(nil);
    DSet := TpFIBDataSet.Create(nil);

    ReadTransaction.DefaultDatabase := DB;
    DB.DefaultTransaction := ReadTransaction;
    DSet.Database := DB;
    DSet.Transaction := ReadTransaction;

    DB.Handle := MAIN_DB_HANDLE;
    ReadTransaction.Active := True;
    DSet.SQLs.SelectSQL.Text := 'SELECT SHOW_FOTO FROM PUB_SYS_DATA';
    DSet.Open;
    pShowFoto := DSet['SHOW_FOTO'];

    ReadTransaction.Active := False;
    DSet.Free;
    ReadTransaction.Free;
    DB.Free;

    if pShowFoto <> 1 then Exit; // Не повезло.

// Второй шаг

// Проверяем на наличие базы по ее пути в config.ini
    F := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\config.ini');
    try
        ImagePath := F.ReadString('IMAGE_CONNECTION', 'Path', '');
    finally;
        F.Free;
    end;

    if ImagePath = '' then Exit; // Не повезло.

// Пытаемся установить подключение
    ResultInfo := AccMgmt.fibInitImageConnection(CurrUserInfo.UserName, CurrUserInfo.Password);
    if ResultInfo.ErrorCode <> ACCMGMT_OK then // ошибка
        if ResultInfo.ErrorCode = -12 then
    {... т.е. если ошибка "Невірне ім'я або пароль"(а она появляется при повторной
    загрузке справочника физических лиц, то мы вызываем fibInitImageConnection
    снова и база, закрытая предыдущим вызовом, вновь открывается. Вот так вот,
    и не надо нигде запоминать хэндл базы.}
        begin
            ResultInfo := AccMgmt.fibInitImageConnection(CurrUserInfo.UserName, CurrUserInfo.Password);
            if ResultInfo.ErrorCode <> ACCMGMT_OK then // ошибка, мало ли чего...
                Result := nil
            else
                Result := ResultInfo.DBHandle;
        end
        else
            Result := nil
    else
        Result := ResultInfo.DBHandle;
end;


procedure TfmCertificatePage.MovingsSelectAfterOpen(DataSet: TDataSet);
begin
end;

procedure TfmCertificatePage.OnDateChange(Sender: TObject);
begin
    Screen.Cursor:=crHourGlass;

    GetData;

    Screen.Cursor:=crDefault;
end;

procedure TfmCertificatePage.ReportDataViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift))
     then begin
               ShowInfo(CertificateSelect);
     end;
end;

procedure TfmCertificatePage.GetData;
var id_man_mov:Int64;
begin

    Screen.Cursor:=crHourGlass;
    id_man_mov:=-1;


    if CertificateSelect.Active
    then begin
              if (CertificateSelect.RecordCount>0)
              then id_man_mov:=TFIBBCDField(CertificateSelect.FieldByName('ID_man_moving')).AsInt64
              else id_man_mov:=-1;

              CertificateSelect.Close;

    end;
    CertificateSelect.ParamByName('Id_PCard').AsInteger :=Id_PCard;
    CertificateSelect.Open;
     HistDataSet.ParamByName('Id_PCard').AsInteger :=Id_PCard;
    HistDataSet.Open;
    CertificateSelect.Locate('id_man_moving',id_man_mov,[]);

    try
       ReportDataView.Controller.FocusedRowIndex:=ReportDataView.Controller.FocusedRowIndex+1;
    except
    end;

    Screen.Cursor:=crDefault;
end;

procedure TfmCertificatePage.Btn_ShowClick(Sender: TObject);
var sp: TSprav;
res:Boolean;
begin
    sp := GetSprav('ASUP\LogInForma');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle']   := Integer(DB.Handle);
            FieldValues['Select']     := 1;
            Post;
        end;
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty  then
        begin
            res:=CheckUserInfo(GetUserId,Sp.Output['PASS']);
            if res=false then
            begin
                showmessage('У вас немає прав на цю дію');
                exit;
            end
        else
        begin
            checker_clickExecute(self);
        end;
        end;
   end;
end;

procedure TfmCertificatePage.ReportDataViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);

begin
    onclickActionExecute(Self);
end;

procedure TfmCertificatePage.onclickActionExecute(Sender: TObject);

begin
    if CertificateSelect.RecordCount>0
    then
    begin
        HistDataSet.Close;
        HistDataSet.SQLs.SelectSQL.Clear;
        HistDataSet.SQLs.SelectSQL.Text:='SELECT * FROM UP_KER_GET_CERTIFICATE_HIST(:ID_MAN_CERTIFICATE)';
        HistDataSet.ParamByName('ID_MAN_CERTIFICATE').AsInteger :=CertificateSelect['ID_MAN_CERTIFICATE'];
        HistDataSet.Open;
    end;
end;

procedure TfmCertificatePage.checker_clickExecute(Sender: TObject);
var InsertSp:TpFibStoredProc;
GetIdMan, PeopleFio, PeopleFioNorm:TpFIBDataset;
begin
   // ShowMessage('1');
    if modify=1 then
    begin
        //ShowMessage('2');
        try
          cxCB_ShowOld.Checked:=not cxCB_ShowOld.Checked;
          InsertSp:=TpFibStoredProc.Create(self);
          InsertSp.Database    :=DB;
          InsertSp.Transaction :=ReadTransaction;
          InsertSp.Transaction.StartTransaction;
          //WriteTransaction.StartTransaction;
          //StartHistory(WriteTransaction);
          InsertSp.StoredProcName:='UP_PCARD_CERT_INS';
          InsertSp.Prepare;
          InsertSp.ParamByName('ID_PCARD').AsInteger:=self.id_pcard;
          InsertSp.ParamByName('GIVE_CERTIFICATE').Value:=cxCB_ShowOld.Checked;
          InsertSp.ExecProc;
          InsertSp.Transaction.Commit;
          InsertSp.Close;
          InsertSp.Free;
          //ShowMessage('3');
       except on e:exception
       do begin
             ShowMessage(e.Message);
          end;
       end;
        //WriteTransaction.Commit;
    end;
    if cxCB_ShowOld.Checked=false then
    begin
        //cxCB_ShowOld.Properties.Caption:='Видавати посвідчення';
        Btn_Show.Caption:='Видавати посвідчення';
    end
    else
    begin
        //cxCB_ShowOld.Properties.Caption:='Не видавати посвідчення';
        Btn_Show.Caption:='Не видавати посвідчення';


        GetIdMan:=TpFibDataSet.Create(nil);
        GetIdMan.Database   :=DB;
        GetIdMan.Transaction:=DB.DefaultTransaction;
        GetIdMan.SelectSQL.Text:='SELECT ID_MAN, TN FROM PRIVATE_CARDS WHERE ID_PCARD=:ID_PC';
        GetIdMan.ParamByName('ID_PC').AsInteger:=Id_Pcard;
        GetIdMan.Open;

        PeopleFio:=TpFibDataSet.Create(nil);
        PeopleFio.Database   :=DB;
        PeopleFio.Transaction:=DB.DefaultTransaction;
        PeopleFio.SelectSQL.Text:='SELECT FAMILIA, IMYA, OTCHESTVO  FROM PEOPLE WHERE ID_MAN=:ID_MAN';
        PeopleFio.ParamByName('ID_MAN').AsInteger:=GetIdMan['ID_MAN'];
        PeopleFio.Open;

        PeopleFioNorm:=TpFibDataSet.Create(nil);
        PeopleFioNorm.Database   :=DB;
        PeopleFioNorm.Transaction:=DB.DefaultTransaction;
        PeopleFioNorm.SelectSQL.Text:='SELECT FIO from up_req_norm_fio(:fam_ukr, :imya_ukr, :otch_ukr)';
        PeopleFioNorm.ParamByName('fam_ukr').AsString:=PeopleFio['FAMILIA'];
        PeopleFioNorm.ParamByName('imya_ukr').AsString:=PeopleFio['IMYA'];
        PeopleFioNorm.ParamByName('otch_ukr').AsString:=PeopleFio['OTCHESTVO'];
        PeopleFioNorm.Open;


        DBFoto.Handle:=GetImageDBHandle(DB.Handle);
        FotoSet.Close;
        FotoSet.SQLs.SelectSQL.Text:='SELECT ID_FOTO FROM FOTO_GET_BY_ID_MAN(:IN_ID_MAN)';
        FotoSet.ParamByName('IN_ID_MAN').AsInteger:=GetIdMan['ID_MAN'];
        FotoSet.Open;
        if VarIsNull(FotoSet['ID_FOTO']) then showmessage(PeopleFioNorm['FIO']+' (ТН '+inttostr(GetIdMan['TN'])+')'+' немає зареєстрованих фото');
    end;
    DBFoto.Connected:=False;
    DBFoto.DefaultTransaction.Active:=False;
end;

procedure TfmCertificatePage.SpeedButton1Click(Sender: TObject);
var sp: TSprav;
check_done:iNTEGER;
res:Boolean;

begin
    Check_done := fibCheckPermission('/ROOT/PCardsList/PrivateCard/CertificatePageCheck', 'DONE');
        if (Check_done<>0) then
        begin
            MessageDlg('Помилка: Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk],0);
            exit;
        end

    else
    begin
    sp := GetSprav('ASUP\LogInForma');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle']   := Integer(DB.Handle);
            FieldValues['Select']     := 1;
            Post;
        end;
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty  then
        begin
            res:=CheckUserInfo(GetUserId,Sp.Output['PASS']);
            if res=false then
            begin
            MessageDlg('Помилка: невірний пароль! ',mtError,[mbOk],0);
                //showmessage('У вас немає прав на цю дію');
                exit;
            end
        else
        begin
            checker_clickExecute(self);
        end;
        end;
   end;
  end;
end;
procedure TfmCertificatePage.DatePeriodsClick(Sender: TObject);
var frm:TfrmDateChange;
    DatePeriodsProc:TpFIBStoredProc;
    Er:Integer;
begin
  try
    frm:=TfrmDateChange.Create(Self);
    frm.Caption:='Змінити період дії посвідчення';
    frm.DateBeg.Visible:=true;
    frm.DateEnd.Visible:=true;
    frm.Date_Beg.Visible:=true;
    frm.Date_End.Visible:=true;
    frm.Date_Beg.Caption:='Дата початку дії';
    frm.Date_End.Caption:='Дата кінця дії';
    frm.DateBeg.Date:=CertificateSelect['DATE_BEG'];
    frm.DateEnd.Date:=CertificateSelect['DATE_END'];
    DatePeriodsProc:=TpFIBStoredProc.Create(Self);
    DatePeriodsProc.Database:= DB;
    DatePeriodsProc.Transaction:=ReadTransaction;
    DatePeriodsProc.StoredProcName:='UP_DT_REQ_CERT_DATE_UPD';
    DatePeriodsProc.Transaction.StartTransaction;
    DatePeriodsProc.Prepare;
    if frm.ShowModal=mrOk then
    begin
        DatePeriodsProc.ParamByName('DATE_BEG').AsDate:=frm.DateBeg.Date;
        DatePeriodsProc.ParamByName('DATE_END').AsDate:=frm.DateEnd.Date;
        DatePeriodsProc.ParamByName('ID_MAN_CERT').AsInteger:=CertificateSelect['ID_MAN_CERTIFICATE'];
        DatePeriodsProc.ParamByName('FLAG').AsInteger:=1;
        DatePeriodsProc.ExecProc;
        Er:=DatePeriodsProc.FieldbyName('ER').AsInteger;
        DatePeriodsProc.Transaction.Commit;
    end;
    frm.Free;
    if Er=1 then MessageDlg('Дата кінця дії посвідчення повинна бути більше ніж дата початку',mtInformation,[mbOk],0);
    DatePeriodsProc.Close;
    DatePeriodsProc.Free;
    except on e:exception
    do begin
          Showmessage(e.Message);
       end;
    end;
    CertificateSelect.Close;
    CertificateSelect.Open;
end;

procedure TfmCertificatePage.DateVidachiClick(Sender: TObject);
var frm:TfrmDateChange;
    DateVidachiProc:TpFIBStoredProc;
begin
   try
    frm:=TfrmDateChange.Create(Self);
    frm.DateVidachi.Visible:=true;
    if VarIsNull(CertificateSelect['DATE_VIDACHI']) then
    frm.DateVidachi.Date:=Date
    else    frm.DateVidachi.Date:=CertificateSelect['DATE_VIDACHI'];
    frm.Date_Vidachi.Visible:=true;
    frm.Caption:='Змінити дату видачі посвідчення';
    DateVidachiProc:=TpFIBStoredProc.Create(Self);
    DateVidachiProc.Database:=DB;
    DateVidachiProc.Transaction:=ReadTransaction;
    DateVidachiProc.StoredProcName:='UP_DT_REQ_CERT_DATE_UPD';
    DateVidachiProc.Transaction.StartTransaction;
    DateVidachiProc.Prepare;
    if frm.ShowModal=MrOk then
    begin
        if VarIsNull(frm.DateVidachi.EditValue) then DateVidachiProc.ParamByName('DATE_VIDACHI').Value:=Null
        else DateVidachiProc.ParamByName('DATE_VIDACHI').AsDate:=frm.DateVidachi.Date;
        DateVidachiProc.ParamByName('ID_MAN_CERT').AsInteger:=CertificateSelect['ID_MAN_CERTIFICATE'];
        DateVidachiProc.ParamByName('FLAG').AsInteger:=2;
        DateVidachiProc.ExecProc;
        DateVidachiProc.Transaction.Commit;
        //checker_clickExecute(self);
    end;
    frm.Free;
    DateVidachiProc.Close;
    DateVidachiProc.Free;
    except on e:exception
    do begin
          ShowMessage(e.message);
       end;
    end;
    CertificateSelect.Close;
    CertificateSelect.Open;
end;

procedure TfmCertificatePage.CertificateSelectAfterScroll(
  DataSet: TDataSet);
begin
   onclickActionExecute(Self);
end;

end.
