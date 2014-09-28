unit BankShowRaschSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, ActnList, dxBar, dxBarExtItems,
  ExtCtrls, ImgList, cxGridBandedTableView, cxGridDBBandedTableView,
  cxContainer, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Kernel,
  Placemnt;

type
  TfmModeBankSch = (NoneSch, SelectSch);

  TfmBankShowRaschSch = class(TForm)
    DataSetSch: TpFIBDataSet;
    Class_Database: TpFIBDatabase;
    Class_Transaction_R: TpFIBTransaction;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    ActionTake: TAction;
    ActionClose: TAction;
    Panel1: TPanel;
    StyleRepository: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    ImageList: TImageList;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxDateEditBegin: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    dxBarLargeButton9: TdxBarLargeButton;
    ActionRefresh: TAction;
    dxBarLargeButton10: TdxBarLargeButton;
    cxLabel7: TcxLabel;
    cxLabel14: TcxLabel;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    ActionOpenSch: TAction;
    ActionBlockSch: TAction;
    ActionCloseSch: TAction;
    dxBarLargeButton13: TdxBarLargeButton;
    TransactionW: TpFIBTransaction;
    DataSetSaldo: TpFIBDataSet;
    cxLabel15: TcxLabel;
    ActionShowkor_sch: TAction;
    ActionShowNeobr: TAction;
    dxBarLargeButton14: TdxBarLargeButton;
    ActionSpSvyaz: TAction;
    dxBarLargeButton15: TdxBarLargeButton;
    DataSetTemp: TpFIBDataSet;
    dxBarLargeButton16: TdxBarLargeButton;
    ActionDelSv: TAction;
    DataSetWrite: TpFIBDataSet;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    ActionDay: TAction;
    dxBarLargeButton17: TdxBarLargeButton;
    FormStorage1: TFormStorage;
    DataSetErProvs: TpFIBDataSet;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSetSchAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionCloseSchExecute(Sender: TObject);
    procedure ActionOpenSchExecute(Sender: TObject);
    procedure ActionBlockSchExecute(Sender: TObject);
    procedure ActionShowkor_schExecute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ShowMess;
    procedure TResBankDayProc(id : int64; dd : HWND);
    procedure TResBankSPProc(id : int64; dd : HWND);
    procedure ActionShowNeobrExecute(Sender: TObject);
    procedure ActionSpSvyazExecute(Sender: TObject);
    procedure ActionDelSvExecute(Sender: TObject);
    procedure ActionDayExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    id_r_sch, id_s, id_user : int64;
    n_ras, n_sch, t_sch : string;
    TModalResult, actived_form, move_ds : boolean;
    AO : TComponent;
    procedure LoadCaptions;
  public
    flag : TfmModeBankSch;
    id_svyaz : Int64;

//    mm : TMainBankDayClass;
    constructor Create(AOwner: TComponent; db : TpFIBDatabase; id_uuu : int64); reintroduce; overload;
    destructor Destroy;
  end;


function BankDayEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):integer;stdcall;
exports BankDayEdit;

implementation
uses DateUtils, Un_R_file_Alex, BankProgressClose, AccMgmt, BankDayForm, Un_lo_file_Alex, BankDaysPl;

{$R *.dfm}

function BankDayEdit(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):integer;stdcall;
VAR
    T : TfmBankShowRaschSch;
begin
    T           := TfmBankShowRaschSch.Create(AOwner, db, id_user);
    T.Ao        := AOwner;
    T.id_user   := id_user;
    T.move_ds   := false;
    T.LoadCaptions;
    T.formstyle := fsMDIChild;
    T.Show;
    T.ShowMess;
end;

constructor TfmBankShowRaschSch.Create(AOwner: TComponent; db : TpFIBDatabase; id_uuu : int64);
var
    date_beg : string;
    date_end : TDate;
    show_sp    : integer;
begin
    inherited Create (AOwner);
    move_ds := false;
    Class_Database                      := DB;
    Class_Transaction_R.DefaultDatabase := DB;
    Class_Database.DefaultTransaction   := Class_Transaction_R;
    DataSetSch.Database                 := Class_Database;
    DataSetSch.Transaction              := Class_Transaction_R;
    DataSetTemp.Database                := Class_Database;
    DataSetTemp.Transaction             := Class_Transaction_R;
    DataSetErProvs.Database             := Class_Database;
    DataSetErProvs.Transaction          := Class_Transaction_R;
    Class_Transaction_R.StartTransaction;
    if MonthOf(Date) < 10
        then date_beg := '01.'+'0'+ IntToStr(MonthOf(Date)) + '.'+ IntToStr(YearOf(Date))
        else date_beg := '01.'+ IntToStr(MonthOf(Date)) + '.' + IntToStr(YearOf(Date));
    date_end := IncMonth(StrToDate(date_beg),1);
    date_end := IncDay(date_end,-1);
    cxDateEditBegin.date := StrToDate(date_beg);
    cxDateEditEnd.Date   := date_end;

    DataSetTemp.Close;
    DataSetTemp.SQLs.SelectSQL.Text := 'SElect * from BANK_SELECT_INFO_PO_ID_USER('+IntToStr(id_uuu)+', '''+'Bank_Admin'+''')';
    DataSetTemp.Open;
    try
        if DataSetTemp.FBN('R_RESULT').AsInteger = 1
            then show_sp := 1
            else show_sp := 0;
    except
        show_sp := 0;
    end;

    if show_sp = 0 then
    begin
        ActionSpSvyaz.Visible := false;
        ActionDelSv.Visible   := false;
    end;

    DataSetTemp.Close;

    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_RASCH_SCH(' +  QuotedStr(date_beg) + ',' +  QuotedStr(DateToStr(date_end)) + ')' ;
    DataSetSch.Open;

//    DataSetSch.Locate('ID_RAS_SCH', n.last_id_ras, []);
    actived_form := false;
    move_ds   := true;
end;

procedure TfmBankShowRaschSch.ActionCloseExecute(Sender: TObject);
begin
    move_ds := false;
    Close;
end;

procedure TfmBankShowRaschSch.ActionTakeExecute(Sender: TObject);
var
    mf, n_r, n_s, t_s, m : string;
    id_sc, id_ra, id_sv : int64;
    b : boolean;
    T : TfmBankDayForm;
    error, er   : integer;
    open_sch    : tdate;
    is_valuta   : Integer;
    id_valuta   : Integer;
    name_valuta : string;
begin
    move_ds   := false;
    if (DataSetSch['ID_SCH'] > 0) and (DataSetSch['ID_RAS_SCH'] > 0) then
    begin
        try id_ra := StrToInt64(DataSetSch.FieldByName('ID_RAS_SCH').AsString); except id_ra := -1; end;
        try n_r := DataSetSch.FieldByName('KOD_RAS').AsString;                  except n_r   := ''; end;
        try n_s := DataSetSch.FieldByName('KOD_SCH').AsString;                  except n_s   := ''; end;
        try t_s := DataSetSch.FieldByName('TITLE_SCH').AsString;                except t_s   := ''; end;
        try mf  := DataSetSch.FieldByName('NAME_MFO').AsString;                 except mf    := ''; end;
        try m   := DataSetSch.FBN('MFO').AsString;                              except m     := ''; end;
        try id_sc := StrToInt64(DataSetSch.FieldByName('ID_SCH').AsString);     except id_sc := -1; end;
        try id_sv := StrToInt64(DataSetSch.FieldByName('ID_SVYAZKA').AsString); except id_sv := -1; end;
        try open_sch := DataSetSch.FieldByName('OPEN_SCH').AsDateTime; except open_sch := strtodate('01.01.1899'); end;


        er := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_RS','Belong');
        if er <> 0 then
        begin
        error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_RS/J2_'+IntToStr(id_sc),'Belong');
            if error <> 0 then
            begin
                MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
                move_ds := true;
                exit;
            end;
        end;

        if (not (DataSetSch['id_valute'] = null )) then
        begin
          is_valuta := 1;
        end
        else
        begin
          is_valuta := 0;
        end;

        if DataSetSch['id_valute'] = null then
          id_valuta := 0
        else
          id_valuta   := DataSetSch['id_valute'];

        name_valuta := DataSetSch['title_valute'];

        T := TfmBankDayForm.Create(Self, Edit_bank, Class_Database, id_ra, id_sv,open_sch, TResBankDayProc,is_valuta,id_valuta, name_valuta);
        T.Caption                      := Un_R_file_Alex.BANK_DOC_DAY + n_r;
        T.cxLabel7.Text                := n_r;
        T.cxLabel9.Text                := m;
        T.cxLabel11.Text               := mf;
        T.cxLabel13.Text               := copy(n_s,3, Length(n_s)-2);
        T.cxLabel15.Text               := t_s;
        T.id_s                         := id_sc;
        T.id_user                      := id_user;

        T.FormStyle := fsMDIChild;

        //*****заполнение параметров, если счет - валютный**//
        if (not (DataSetSch['id_valute'] = null )) then
        begin
          t.cxTextEdit1.Text := 'валютний';
          t.cxTextEdit2.Text := DataSetSch['title_valute'];
        end
        else
        begin
          t.cxTextEdit1.Text := 'Не валютний';
          t.cxTextEdit2.Text := '';
        end;

    end;
end;

procedure TfmBankShowRaschSch.LoadCaptions;
begin
    ActionTake.Caption     := Un_R_file_Alex.MY_ACTION_CHOOSE_CONST;
    ActionClose.Caption    := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
    ActionRefresh.Caption  := Un_R_file_Alex.MY_ACTION_REFRESH_CONST;
    ActionOpenSch.Caption  := Un_R_file_Alex.KASSA_OPEN_SCH;
    ActionCloseSch.Caption := Un_R_file_Alex.KASSA_CLOSE_SCH;
    ActionDelSv.Caption    := Un_R_file_Alex.BANK_SP_DELETE_SV;
    Caption                := Un_R_file_Alex.BANK_DAY_SHOW_SCH_CAPTION;
    ActionBlockSch.Caption := Un_R_file_Alex.KASSA_CLOSE_UNBLOC;

    ActionShowNeobr.Caption := Un_R_file_Alex.MY_BUTTON_SHOW_NEOBR;
    ActionSpSvyaz.Caption   := Un_R_file_Alex.BANK_SP_SCH_SZYAZ;
    ActionDay.Caption   := Un_R_file_Alex.BANK_COUNT_DAYS;

    cxGrid1DBBandedTableView1.Bands.Items[1].Caption := Un_R_file_Alex.BANK_RECVIZ;
    cxGrid1DBBandedTableView1.Bands.Items[0].Caption := Un_R_file_Alex.BANK_DANNIE_SCH;
    cxGrid1DBBandedTableView1DBBandedColumn1.Caption := Un_R_file_Alex.BANK_R_S;
    cxGrid1DBBandedTableView1DBBandedColumn2.Caption := Un_R_file_Alex.BANK_MFO;
    cxGrid1DBBandedTableView1DBBandedColumn3.Caption := Un_R_file_Alex.BANK_BANK;
    cxGrid1DBBandedTableView1DBBandedColumn4.Caption := Un_R_file_Alex.KASSA_SCH;
    cxGrid1DBBandedTableView1DBBandedColumn5.Caption := Un_R_file_Alex.BANK_DAY_SHOW_SCH_NAME_;
    cxGrid1DBBandedTableView1DBBandedColumn6.Caption := Un_R_file_Alex.BANK_PERIOD_MONTH_YEAR;
    cxGrid1DBBandedTableView1DBBandedColumn7.Caption := Un_R_file_Alex.BANK_BLOCK;
    cxLabel1.Caption  := Un_R_file_Alex.BANK_TYPE_RAS_SCH;
    cxLabel3.Caption  := Un_R_file_Alex.BANK_PERIOD_DATE;
    cxLabel5.Caption  := Un_R_file_Alex.J4_MAIN_FORM_TO;
    cxLabel14.Caption := Un_R_file_Alex.J4_MAIN_FORM_TO;
    cxLabel7.Caption  := Un_R_file_Alex.BANK_OTOBRAJAT_S;
    cxLabel8.Caption  := Un_R_file_Alex.BANK_OPEN_WITH;
    cxLabel10.Caption := Un_R_file_Alex.BANK_CLOSE_WHO;
    cxLabel12.Caption := Un_R_file_Alex.BANK_BLOCK_WHO;
    cxLabel15.Caption := Un_R_file_Alex.BANK_OPEN_WITH_2;
    cxLabel16.Caption := Un_R_file_Alex.BANK_OBJ_PRAV[1];

end;

procedure TfmBankShowRaschSch.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionTakeExecute(Sender);
end;

procedure TfmBankShowRaschSch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Class_Transaction_R.Commit;
    if formStyle = fsMDIChild then Action := CaFree;
    FormStorage1.SaveFormPlacement;
end;

procedure TfmBankShowRaschSch.DataSetSchAfterScroll(DataSet: TDataSet);
begin
    if (not DataSetSch.IsEmpty) and (move_ds)then
    begin
        if (DataSetSch['BLOKED'] = null) or (DataSetSch['ID_RAS_SCH'] <= 0)
            then ActionBlockSch.Caption := Un_R_file_Alex.BANK_RAS_SCH_NE_OPREDELEN
            else if DataSetSch['BLOKED'] = Un_R_file_Alex.MY_DA
                    then ActionBlockSch.Caption := Un_R_file_Alex.KASSA_CLOSE_UNBLOC
                    else ActionBlockSch.Caption := Un_R_file_Alex.KASSA_CLOSE_BLOC;
        if DataSetSch['NAME_TYPE_ACCOUNT'] <> null then cxLabel2.Caption  := DataSetSch['NAME_TYPE_ACCOUNT'] else cxLabel2.Caption  := '';
        if DataSetSch['OPEN_SCH'] <> null          then cxLabel9.Caption  := DataSetSch.FieldByName('OPEN_SCH').AsString else cxLabel9.Caption  := '';
        if DataSetSch['WHO_CLOSED'] <> null        then cxLabel11.Caption := DataSetSch['WHO_CLOSED'] else cxLabel11.Caption := '';
        if DataSetSch['WHO_BLOCKED'] <> null       then cxLabel13.Caption := DataSetSch['WHO_BLOCKED'] else cxLabel13.Caption := '';
        if DataSetSch['DATE_RAS_BEG'] <> null      then cxLabel4.Caption  := DataSetSch.FieldByName('DATE_RAS_BEG').AsString else cxLabel4.Caption  := '';
        if DataSetSch['DATE_RAS_END'] <> null      then cxLabel6.Caption  := DataSetSch.FieldByName('DATE_RAS_END').AsString else cxLabel6.Caption  := '';
        if (DataSetSch['ID_SCH'] <> null) and (DataSetSch['ID_SCH'] <> 0) then cxLabel17.Caption  := 'J2_'+DataSetSch.FieldByName('ID_SCH').AsString else cxLabel17.Caption  := ''; 
    end;
end;

procedure TfmBankShowRaschSch.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  move_ds := false;
      try
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Pen.Color :=  clBlack;
      if (AViewInfo.GridRecord.Values[0] = 'Счет не определен') or (AViewInfo.GridRecord.Values[4] = 'Счет не определен') and (not AViewInfo.GridRecord.Focused) then
      begin
          ACanvas.Canvas.Font.Color := RGB(150,50,50);//clRed;
//          ACanvas.Canvas.Font.Style:=[fsStrikeOut];
          ACanvas.Canvas.FillRect(Arect);
          exit;
      end;
      if (not AViewInfo.GridRecord.Focused) then
      begin
          ACanvas.Canvas.Font.Color := clBlack;
//          ACanvas.Canvas.Font.Style:=[];
          ACanvas.Canvas.FillRect(Arect);
      end;
      except
      end;
  move_ds := true;
end;

procedure TfmBankShowRaschSch.ActionRefreshExecute(Sender: TObject);
begin
    move_ds   := false;
    DataSetSch.Close;
    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_RASCH_SCH(' +  QuotedStr(cxDateEditBegin.Text) + ',' +  QuotedStr(cxDateEditEnd.Text) + ')' ;
    DataSetSch.Open;
//    DataSetSch.Locate('ID_RAS_SCH', mm.last_id_ras, []);

    move_ds   := true;
    ShowMess;
end;

procedure TfmBankShowRaschSch.ActionCloseSchExecute(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
    day_end : TDATE;
    day_begin : string;
    date_beg_for_close : TDate;
    T : TfmBankProgressClose;
    id : Int64;
    error : integer;
begin
    move_ds := false;
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS','Close');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        move_ds := true;
        exit;
    end;
  if (DataSetSch['ID_SCH'] > 0) and (DataSetSch['ID_RAS_SCH'] > 0) then
  begin
    T := TfmBankProgressClose.Create(self, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.Update;
    TransactionW.DefaultDatabase := Class_Database;
    DataSetSaldo.Database        := Class_Database;
    DataSetSaldo.Transaction     := TransactionW;
    TransactionW.StartTransaction;
    day_end := IncMonth(DataSetSch.FieldByName('OPEN_SCH').AsDateTime, 1);
    date_beg_for_close := DataSetSch.FieldByName('OPEN_SCH').AsDateTime;
    DataSetSaldo.Close;
    DataSetSaldo.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_SALDO(' +  QuotedStr(dateToStr(DataSetSch.FieldByName('OPEN_SCH').AsDateTime)) + ', ' +  QuotedStr(DateToStr(day_end)) + ', '+IntToStr(DataSetSch.fieldByname('ID_SCH').AsInteger)+')';
    DataSetSaldo.Open;
    IF DataSetSaldo.Fieldbyname('FLAG_ERROR').AsInteger = 1 then
    begin
        ShowMessage(DataSetSaldo.Fieldbyname('ERROR').AsString);
    end else
    begin
        STRU.DBHANDLE      := Class_Database.Handle;
        STRU.TRHANDLE      := TransactionW.Handle;
        STRU.ID_SCH        := DataSetSch.FieldByname('ID_SCH').AsInteger;
        STRU.MODE          := 1;
        STRU.DB_SALDO_IN   := DataSetSaldo.Fieldbyname('SALDO_BEGIN').AsCurrency;
        STRU.KR_SALDO_IN   := 0;
        STRU.DB_SALDO_OUT  := DataSetSaldo.fieldByname('SALDO_END').AsCurrency;
        STRU.KR_SALDO_OUT  := 0;
        STRU.KR_OBOR       := DataSetSaldo.fieldByname('OBOROT_DB').AsCurrency;
        STRU.DB_OBOR       := DataSetSaldo.fieldByname('OBOROT_KR').AsCurrency;
        STRU.ID_USER       := id_user;
//        showmessage('DB ' + CurrToStr(STRU.DB_OBOR));
//        showmessage('KR ' + CurrToStr(STRU.KR_OBOR));
//        showmessage('DB_OUT ' + CurrToStr(STRU.DB_SALDO_OUT));
        try
            DoResult := Kernel.SchManager(@STRU);
            T.Free;
            if DoResult.RESULT_CODE = 0 then
            begin
                TransactionW.Rollback;
                ShowMessage(DoResult.RESULT_MESSAGE);
                id := DataSetSch['ID_SCH'];
                DataSetErProvs.Close;
                DataSetErProvs.SQLs.SelectSQL.Text        := 'Select * from BANK_GET_INFO_WRONG_SYS(:ID_KOD_SYS, :ID_SCH_IN,:DATE_BEG_IN)';
                DataSetErProvs.ParamByName('ID_KOD_SYS').AsInteger    := 2;
                DataSetErProvs.ParamByName('ID_SCH_IN').AsInt64       := id;
                DataSetErProvs.ParamByName('DATE_BEG_IN').AsDate      := date_beg_for_close;
                DataSetErProvs.Open;
                if  DataSetErProvs.RecordCount >0 then
                begin
                     Un_lo_file_Alex.LErVstrechProvs(Self, id_user, Class_Database, 2, id, date_beg_for_close);
                end;
            end ELSE
            begin
                TransactionW.Commit;
                id := DataSetSch['ID_SCH'];
                ActionRefreshExecute(Sender);
                ShowMessage(Un_R_file_Alex.KASSA_CLOSE_CLOSE);
                DataSetSch.Locate('ID_SCH', id, []);
            end;
        except on E : Exception do
            begin
                TransactionW.Rollback;
                ShowMessage(Un_R_file_Alex.MY_MESSAGE_ERROR+E.Message);
            end;
        end;
    end;
  end;
  move_ds := true;
end;

procedure TfmBankShowRaschSch.ActionOpenSchExecute(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
    day_begin : string;
    T : TfmBankProgressClose;
    id : int64;
    error : integer;
begin
    move_ds := false;
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS','Close');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        move_ds := true;
        exit;
    end;
  if (DataSetSch['ID_SCH'] > 0) and (DataSetSch['ID_RAS_SCH'] > 0) then
  begin
    T := TfmBankProgressClose.Create(self, Un_R_file_Alex.KASSA_CLOSE_WAIT_O);
    T.Show;
    T.Update;
    TransactionW.DefaultDatabase := Class_Database;
    TransactionW.StartTransaction;
    STRU.DBHANDLE    := Class_Database.Handle;
    STRU.TRHANDLE    := TransactionW.Handle;
    STRU.ID_SCH      := DataSetSch.FieldByname('ID_SCH').AsInteger;
    STRU.MODE        := 2;
    STRU.KR_SALDO_IN   := 0;
    STRU.DB_SALDO_IN   := 0;
    STRU.DB_SALDO_IN   := 0;
    STRU.DB_SALDO_OUT  := 0;
    STRU.KR_OBOR       := 0;
    STRU.DB_OBOR       := 0;
    STRU.ID_USER       := id_user;
    try
        DoResult := Kernel.SchManager(@STRU);
        TransactionW.Commit;
        T.Free;
        if DoResult.RESULT_CODE = 0 then
            ShowMessage(DoResult.RESULT_MESSAGE)
        ELSE
        begin
            id := DataSetSch['ID_SCH'];
            ActionRefreshExecute(Sender);
            ShowMessage(Un_R_file_Alex.KASSA_CLOSE_OPEN);
            DataSetSch.Locate('ID_SCH', id, []);
        end;
    except on E : Exception do
        ShowMessage(Un_R_file_Alex.MY_MESSAGE_ERROR+E.Message);
    end;
  end;
  move_ds := true;
end;

procedure TfmBankShowRaschSch.ActionBlockSchExecute(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
    day_begin : string;
    id : int64;
    error : integer;
begin
    move_ds := false;
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS','Block');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        move_ds := true;
        exit;
    end;

  if (DataSetSch['ID_SCH'] > 0) and (DataSetSch['ID_RAS_SCH'] > 0) then
  begin
    TransactionW.DefaultDatabase := Class_Database;
    TransactionW.StartTransaction;
    STRU.DBHANDLE    := Class_Database.Handle;
    STRU.TRHANDLE    := TransactionW.Handle;
    STRU.ID_SCH      := DataSetSch['ID_SCH'];
    if DataSetSch['BLOKED'] = Un_R_file_Alex.MY_BUTTON_YES_CONST
        then STRU.MODE := 4
        else STRU.MODE := 3;
    STRU.KR_SALDO_IN   := 0;
    STRU.DB_SALDO_IN   := 0;
    STRU.DB_SALDO_IN   := 0;
    STRU.DB_SALDO_OUT  := 0;
    STRU.KR_OBOR       := 0;
    STRU.DB_OBOR       := 0;
    STRU.ID_USER       := id_user;
    try
        DoResult := Kernel.SchManager(@STRU);
        TransactionW.Commit;
        if DoResult.RESULT_CODE = 0 then
            ShowMessage(DoResult.RESULT_MESSAGE)
        ELSE
        begin
            id := DataSetSch['ID_SCH'];
            ActionRefreshExecute(Sender);
            DataSetSch.Locate('ID_SCH', id, []);
        end;
    except on E : Exception do
        ShowMessage(Un_R_file_Alex.MY_MESSAGE_ERROR+E.Message);
    end;
  end;
  move_ds := true;
end;

procedure TfmBankShowRaschSch.ActionShowkor_schExecute(Sender: TObject);
begin
    move_ds := false;
    showmessage('ID_RAS_SCH - ' + DataSetSch.FieldByName('ID_RAS_SCH').AsString + #13+
                'ID_SCH - ' + DataSetSch.FieldByName('ID_SCH').AsString + #13);
    move_ds := true;
end;


procedure TfmBankShowRaschSch.cxGrid1DBBandedTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key = VK_RETURN then ActionTakeExecute(Sender);
end;

procedure TfmBankShowRaschSch.ShowMess;
var
    flagok_na_error : boolean;
begin
    move_ds   := false;
    cxGrid1DBBandedTableView1.BeginUpdate;
  try

    flagok_na_error := false;
    DataSetSch.First;
    while not DataSetSch.eof do
    begin
        if DataSetSch['ID_RAS_SCH'] = 0 then
            flagok_na_error := true;
        DataSetSch.Next;
    end;
    cxGrid1DBBandedTableView1.endUpdate;

    if flagok_na_error then
        MessageBox(Handle, PChar(Un_R_file_Alex.BANK_WARNING_EXISTS_SCH+#13+Un_R_file_Alex.BANK_WARNING_EXISTS_SCH_2), PChar(Un_R_file_Alex.KASSA_WARNING), 16);
//    if actived_form
//        then DataSetSch.Locate('ID_RAS_SCH', mm.last_id_ras, [])
//        else actived_form := true;
  except
  end;
  move_ds   := true;
end;

destructor TfmBankShowRaschSch.Destroy;
begin
  inherited;
end;

procedure TfmBankShowRaschSch.TResBankDayProc(id: int64; dd : HWND);
begin
    DataSetSch.Locate('ID_RAS_SCH', id, []);
    Self.BringToFront;
end;

procedure TfmBankShowRaschSch.ActionShowNeobrExecute(Sender: TObject);
var
    id_sv : int64;
    rs, n_rs, sc, n_sc : string;
begin
    if (not DataSetSch.IsEmpty) and ((DataSetSch.fbn('KOD_SCH').AsString <> 'Счет не определен') and (DataSetSch.fbn('KOD_RAS').AsString <> 'Счет не определен')) then
    begin
        id_sv := StrToInt64(DataSetSch.fbn('ID_SVYAZKA').AsString);
        rs    := DataSetSch.fbn('KOD_RAS').AsString;
        n_rs  := DataSetSch.fbn('NAME_TYPE_ACCOUNT').AsString;
        sc    := DataSetSch.fbn('KOD_SCH').AsString;
        n_sc  := DataSetSch.fbn('TITLE_SCH').AsString;
        Un_lo_file_Alex.LBankProsmotrNeobr(AO, id_user, Class_Database, id_sv, rs, n_rs, sc, n_sc);
    end;
end;

procedure TfmBankShowRaschSch.ActionSpSvyazExecute(Sender: TObject);
var
    d1, d2 : TDate;
    s1, s2, id_s : int64;
begin
    if not DataSetSch.IsEmpty then
    begin
        d1 := cxDateEditBegin.Date;
        d2 := cxDateEditEnd.Date;
        try s1   := StrToInt64(DataSetSch.FBN('ID_SCH').asString);     except s1   := -1; end;
        try s2   := StrToInt64(DataSetSch.FBN('ID_RAS_SCH').asString); except s2   := -1; end;
        try id_s := StrToInt64(DataSetSch.FBN('ID_SVYAZKA').asString); except id_s := -1; end;
        if s1 > 0
            then begin
                Un_lo_file_Alex.LBank_sp_sch(AO, Class_Database, s1, s2, id_s, d1, d2, TResBankSPProc)
            end
            else showmessage('Додати новий звязок можливо тільки на балансовому рахунку!');
    end;
end;

procedure TfmBankShowRaschSch.TResBankSPProc(id: int64; dd: HWND);
begin
    DataSetSch.CloseOpen(false);
    DataSetSch.Locate('ID_SVYAZKA', id, []);
    Self.BringToFront;
end;

procedure TfmBankShowRaschSch.ActionDelSvExecute(Sender: TObject);
begin
    if (not DataSetSch.IsEmpty) and (StrToInt64(DataSetSch.fbn('ID_SVYAZKA').AsString)>0) then
    begin
        TransactionW.DefaultDatabase := Class_Database;
        DataSetWrite.Database        := Class_Database;
        DataSetWrite.Transaction     := TransactionW;

        TransactionW.StartTransaction;
        try
            DataSetWrite.close;
            DataSetWrite.SQLs.SelectSQL.Text := 'Select * from BANK_DELETE_SP_SCH('''+DataSetSch.fbn('ID_SVYAZKA').AsString+''')';
            DataSetWrite.Open;
            if DataSetWrite.FBN('R_RESULT').asInteger = 1 then
            begin
                TransactionW.Rollback;
                showmessage(DataSetWrite.FBN('R_RESULT_VAR').asString);
                Exit;
            end else
            begin
                TransactionW.Commit;
                ActionRefreshExecute(Sender);
            end;
        except on E:Exception do
        begin
            TransactionW.Rollback;
            ShowMessage(E.Message);
        end;
        end;
    end;
end;

procedure TfmBankShowRaschSch.ActionDayExecute(Sender: TObject);
var
    T     : TfmDaysLast;
begin
    id_svyaz := StrToInt64(DataSetSch.FieldByName('ID_SVYAZKA').AsString);
    T := TfmDaysLast.Create(Self, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmBankShowRaschSch.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

end.
