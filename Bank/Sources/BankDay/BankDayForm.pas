unit BankDayForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxSplitter, cxContainer, cxLabel, ExtCtrls,
  dxBar, dxBarExtItems, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridTableView, ImgList, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, Un_lo_file_Alex,
  cxCalendar, cxGridBandedTableView, cxGridDBBandedTableView, StdCtrls,
  cxCheckBox, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet,
  frxDesgn, Menus, Placemnt;

type
  TfmShowDayBank = (Show_bank, Edit_Bank);
  TResBankDayProc = procedure (id : int64; dd : HWND) of object;

  TfmBankDayForm = class(TForm)
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionClose: TAction;
    ActionRefresh: TAction;
    ActionTake: TAction;
    cxGridDayBank: TcxGrid;
    cxGridDayBankLevel1: TcxGridLevel;
    ImageList: TImageList;
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
    DataSetMax_day: TpFIBDataSet;
    DataSetDayBank: TpFIBDataSet;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DataSourceDay: TDataSource;
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
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    ActionCancle: TAction;
    dxBarLargeButton7: TdxBarLargeButton;
    cxGridDayBankDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDayBankDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDayBankDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDayBankDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDayBankDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDayBankDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    GroupBox1: TGroupBox;
    cxLabel16: TcxLabel;
    cxDateEditBegin: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    cxLabel12: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel13: TcxTextEdit;
    cxLabel15: TcxTextEdit;
    cxLabel7: TcxTextEdit;
    cxLabel9: TcxTextEdit;
    cxLabel11: TcxTextEdit;
    cxCheckBoxWith: TcxCheckBox;
    cxCheckBoxTo: TcxCheckBox;
    StoredProc: TpFIBStoredProc;
    TransactionWR: TpFIBTransaction;
    cxGridDayBankDBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    DataSetAdd: TpFIBDataSet;
    ActionPrint: TAction;
    dxBarLargeButton8: TdxBarLargeButton;
    DataSetPrint: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    ReportGrSm: TfrxReport;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    ActionPrintSm: TAction;
    DataSetPrintS_ID_SMETA: TFIBBCDField;
    DataSetPrintALL_P_SUMMA: TFIBBCDField;
    DataSetPrintALL_R_SUMMA: TFIBBCDField;
    DataSetPrintS_ID_KEKV: TFIBBCDField;
    DataSetPrintR_KEKV_KOD: TFIBIntegerField;
    DataSetPrintR_KEKV_TYTLE: TFIBStringField;
    DataSetPrintR_ID_SM_GR: TFIBBCDField;
    DataSetPrintR_GROUP_KOD: TFIBIntegerField;
    DataSetPrintR_GROUP_TITLE: TFIBStringField;
    DataSetPrintR_SMETA_TYTLE: TFIBStringField;
    DataSetPrintR_SMETA_KOD: TFIBIntegerField;
    DataSetPrintR_NAME_PRED: TFIBStringField;
    ActionInvoice: TAction;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton11: TdxBarLargeButton;
    cxGridDayBankDBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    dxBarSubItem3: TdxBarSubItem;
    ActionPrintRashifr: TAction;
    dxBarLargeButton12: TdxBarLargeButton;
    FormStorage1: TFormStorage;
    Label1: TLabel;
    Label2: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxGridDayBankDBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDayBankDBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDayBankDBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDayBankDBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure ActionCancleExecute(Sender: TObject);
    procedure DataSetDayBankAfterScroll(DataSet: TDataSet);
    procedure cxGridDayBankDBTableView1DblClick(Sender: TObject);
    procedure cxCheckBoxToClick(Sender: TObject);
    procedure cxCheckBoxWithClick(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionPrintSmExecute(Sender: TObject);
    procedure ActionInvoiceExecute(Sender: TObject);
    procedure cxGridDayBankDBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionPrintRashifrExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDayBankDBBandedTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGridDayBankDBBandedTableView1DBBandedColumn9CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDayBankDBBandedTableView1DBBandedColumn10CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDayBankDBBandedTableView1DBBandedColumn11CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDayBankDBBandedTableView1DBBandedColumn8CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
//    Ind1 : array [1..3] of array of Variant;
    fl : boolean;
    max_date, min_date : Tdate;
    s : TResBankDayProc;
    flag_change_date  : integer;
  public
    id_ras_sch, id_s, id_user, id_svyaz : int64;
    is_valuta_in   : Integer;
    id_valuta_in   : Integer;
    name_valuta_in : string;
    open_sch_in    : Tdate;
    flag           : TfmShowDayBank;
    constructor Create(AOwner: TComponent; m : TfmShowDayBank; db : TpFIBDatabase; id_r, id_sv : int64; open_sch_out :tdate; tr : TResBankDayProc;is_valuta : Integer; id_valuta : Integer; name_valuta : string); reintroduce; overload;
  end;


implementation
uses BankDayAdd, DateUtils, Un_R_file_Alex, pFIBProps, BankInvoice,Accmgmt,
  BankRashifr;

{$R *.dfm}

constructor TfmbankDayForm.Create(AOwner: TComponent; m: TfmShowDayBank; db : TpFIBDatabase; id_r, id_sv : int64; open_sch_out :tdate; tr : TResBankDayProc;is_valuta : Integer; id_valuta : Integer; name_valuta : string);
var
   i, j, days_ago_show : int64;
   month, year  : integer;
begin
    inherited Create (AOwner);
    is_valuta_in   := is_valuta;
    id_valuta_in   := id_valuta;
    name_valuta_in := name_valuta;
    if (is_valuta = 1)then
    begin
      cxGridDayBankDBBandedTableView1DBBandedColumn8.Visible  := True;
      cxGridDayBankDBBandedTableView1DBBandedColumn9.Visible  := True;
      cxGridDayBankDBBandedTableView1DBBandedColumn10.Visible := True;
      cxGridDayBankDBBandedTableView1DBBandedColumn11.Visible := True;
      cxGridDayBankDBBandedTableView1DBBandedColumn1.Position.LineCount := 2;
      cxGridDayBankDBBandedTableView1DBBandedColumn6.Position.LineCount := 2;
    end
    else
    begin
      cxGridDayBankDBBandedTableView1DBBandedColumn8.Visible  := False;
      cxGridDayBankDBBandedTableView1DBBandedColumn9.Visible  := False;
      cxGridDayBankDBBandedTableView1DBBandedColumn10.Visible := False;
      cxGridDayBankDBBandedTableView1DBBandedColumn11.Visible := False;
      cxGridDayBankDBBandedTableView1DBBandedColumn1.Position.LineCount := 1;
      cxGridDayBankDBBandedTableView1DBBandedColumn6.Position.LineCount := 1;
    end;
    s                             := tr;
    Database                      := DB;
    TransactionWR.DefaultDatabase := Database;
    Transaction.DefaultDatabase   := Database;
    Database.DefaultTransaction   := Transaction;

    DataSetDayBank.Database       := Database;
    DataSetMax_day.Database       := Database;
    DataSetAdd.Database           := Database;
    DataSetPrint.Database           := Database;

    DataSetMax_day.Transaction    := Transaction;
    DataSetDayBank.Transaction    := Transaction;
    Database.DefaultTransaction   := Transaction;
    DataSetAdd.Transaction        := Transaction;
    DataSetPrint.Transaction        := Transaction;

    Transaction.StartTransaction;

    flag_change_date              := 0;

    StoredProc.Database           := Database;
    StoredProc.Transaction        := TransactionWR;
    TransactionWR.StartTransaction;
    try
        StoredProc.StoredProcName := 'BANK_INSERT_DAY_IF_NOT_EXISTS';
        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_SP_RAS').AsInt64    := id_r;
        StoredProc.ParamByName('D_DATE_BEGIN').AsDate    := StrToDate('01.01.1900');
        StoredProc.ParamByName('D_DATE_END').AsDate      := StrToDate('31.12.2999');
        StoredProc.ParamByName('D_ID').AsInt64           := id_sv;
        StoredProc.ExecProc;
        TransactionWR.Commit;
    except
        TransactionWR.Rollback;
    end;
//    Caption                      := Un_R_file_Alex.BANK_DOC_DAY + myclass.name_r;
    ActionAdd.Caption            := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionClose.Caption           := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionChange.Caption         := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption         := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionRefresh.Caption        := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionCancle.Caption         := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;
    ActionPrint.Caption          := Un_R_file_Alex.MY_BUTTON_PRINT;
    dxBarLargeButton9.Caption    := Un_R_file_Alex.KASSA_PRINT_WITH_GR_SM;
    ActionPrintSm.Caption        := Un_R_file_Alex.KASSA_PRINT_WITH_SM;
    ActionPrintRashifr.Caption   := Un_R_file_Alex.BANK_PRINT_B_RZ_ST_KEKV;
    ActionInvoice.Caption        := Un_R_file_Alex.BANK_INVOICE;

    cxLabel1.Caption             := Un_R_file_Alex.BANK_R_S;
    cxLabel3.Caption             := Un_R_file_Alex.KASSA_DAY_KOL_PRIH;
    cxLabel8.Caption             := Un_R_file_Alex.BANK_MFO;
    cxLabel10.Caption            := Un_R_file_Alex.BANK_BANK;
    cxLabel12.Caption            := Un_R_file_Alex.BANK_DAY_SHOW_SCH_BALL;
    cxLabel14.Caption            := Un_R_file_Alex.BANK_DAY_SHOW_SCH_NAME_BALL;

{    cxLabel7.Text                := myclass.name_r;
    cxLabel9.Text                := myclass.mfo;
    cxLabel11.Text               := myclass.name_mfo;
    cxLabel13.Text               := copy(myclass.name_s,3, Length(myclass.name_s)-2);
    cxLabel15.Text               := myclass.title_s;
 }   cxLabel16.Caption            := Un_R_file_Alex.BANK_OTOBR_DAY_S;
    GroupBox3.Caption            := Un_R_file_Alex.BANK_RECVIZ_BALL_SCH;
    GroupBox2.Caption            := Un_R_file_Alex.BANK_RECVIZ;
    cxCheckBoxTo.properties.Caption := Un_R_file_Alex.J4_MAIN_FORM_TO;

    cxGridDayBankDBBandedTableView1.Bands.Items[1].Caption := Un_R_file_Alex.BANK_SALDO;
    cxGridDayBankDBBandedTableView1.Bands.Items[2].Caption := Un_R_file_Alex.KASSA_SUMMA;
    cxGridDayBankDBBandedTableView1.Bands.Items[3].Caption := Un_R_file_Alex.BANK_NEOBRABOTAN;
    cxGridDayBankDBBandedTableView1DBBandedColumn1.Caption := Un_R_file_Alex.BANK_DAY;
    cxGridDayBankDBBandedTableView1DBBandedColumn2.Caption := Un_R_file_Alex.BANK_SALDO_BEG;
    cxGridDayBankDBBandedTableView1DBBandedColumn3.Caption := Un_R_file_Alex.BANK_SALDO_END;
    cxGridDayBankDBBandedTableView1DBBandedColumn4.Caption := Un_R_file_Alex.BANK_SUM_DEBET;
    cxGridDayBankDBBandedTableView1DBBandedColumn5.Caption := Un_R_file_Alex.BANK_SUM_KREDIT;


    id_ras_sch   := id_r;
    id_svyaz     := id_sv;
    open_sch_in  := open_sch_out;

    DataSetMax_day.Close;
    DataSetMax_day.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_INI';
    DataSetMax_day.Open;
    max_date             := StrToDate('31.12.2999');
    min_date             := DataSetMax_day.fIELDbYnAME('BANK_INSTALL_SYSTEM').AsDateTime;
    DataSetMax_day.Close;

    cxDateEditBegin.Date := open_sch_in;
    cxDateEditEnd.date   := DATE;

    DataSetDayBank.Close;
    DataSetDayBank.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_DAY_FOR_BANK('+IntToStr(id_ras_sch)+', '''+cxDateEditBegin.text+''', '''+'31.12.2999'+''', '+IntToStr(id_sv)+')';
    DataSetDayBank.open;
    DataSetDayBank.last;
    DataSetDayBank.Locate('ID_DT_DAY', DataSetDayBank.FieldByName('ID_DT_DAY').AsVariant, []);
    cxCheckBoxWith.Checked       := true;
    fl := true;
end;

procedure TfmBankDayForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Transaction.Commit;
    if FormStyle = fsMDIChild then
    begin
        Action := caFree;
    end;
    FormStorage1.SaveFormPlacement;
end;

procedure TfmBankDayForm.ActionCloseExecute(Sender: TObject);
begin
    s(id_ras_sch, self.ParentWindow);
    Close;
end;

procedure TfmBankDayForm.ActionRefreshExecute(Sender: TObject);
var
    date_b, date_e : string;
begin
    if ((flag_change_date=0)or(flag_change_date=1)) then
    begin
        flag_change_date := flag_change_date+1;
        exit;
    end;
    if cxCheckBoxWith.Checked then
    begin
        date_b := cxDateEditBegin.Text;
    end else
    begin
        date_b := DateToStr(min_date);
    end;
    if cxCheckBoxTo.Checked then
    begin
        date_e := cxDateEditEnd.Text;
    end else
    begin
        date_e := DateToStr(max_date);
    end;

    StoredProc.Database           := Database;
    StoredProc.Transaction        := TransactionWR;
    TransactionWR.StartTransaction;
    try
        StoredProc.StoredProcName := 'BANK_INSERT_DAY_IF_NOT_EXISTS';
        StoredProc.Prepare;
        StoredProc.ParamByName('D_ID_SP_RAS').AsInt64    := id_ras_sch;
        StoredProc.ParamByName('D_DATE_BEGIN').AsDate    := StrToDate('01.01.1900');
        StoredProc.ParamByName('D_DATE_END').AsDate      := StrToDate('31.12.2999');
        StoredProc.ParamByName('D_ID').AsInt64           := id_svyaz;
        StoredProc.ExecProc;
        TransactionWR.Commit;
    except
        TransactionWR.Rollback;
    end;

    DataSetDayBank.Close;
    DataSetDayBank.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_DAY_FOR_BANK('+IntToStr(id_ras_sch)+', '''+date_b+''', '''+date_e+''', '+IntToStr(id_svyaz)+')';
    DataSetDayBank.open;
    DataSetDayBank.last;
end;

procedure TfmBankDayForm.ActionDeleteExecute(Sender: TObject);
var
    id_del, id_prev : int64;
begin
    if DataSetDayBank.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.N_AUTOKOD_FORM_ERROR_DEL), PChar(Un_R_file_Alex.KASSA_WARNING), 16);
        exit;
    end
    else begin
        if MessageBox(Handle,Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL+' - '+DataSetDayBank.FieldByName('DAY_BANK').AsString), Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), mb_YesNO)=mrYes
        then
        begin
            if (DataSetDayBank.FieldByName('SUM_DEBET').AsFloat > 0) or (DataSetDayBank.FieldByName('SUM_KREDIT').AsFloat > 0)  then
            begin
                Showmessage(Un_R_file_Alex.BANK_DAY_NOT_DELETE);
                exit;
            end;
            // УДАЛЕНИЕ ДНЯ
            id_del := DataSetDayBank['ID_DT_DAY'];
            if id_del <> 1 then
            begin
                cxGridDayBankDBBandedTableView1.Controller.GoToPrev(false);
                id_prev := DataSetDayBank['ID_DT_DAY'];
//                myclass.DeleteDay(id_del, id_ras_sch);

                StoredProc.Database       := Database;
                StoredProc.Transaction    := TransactionWR;

                TransactionWR.StartTransaction;

                StoredProc.StoredProcName := 'BANK_DELETE_DAY';
                StoredProc.Prepare;
//                StoredProc.ParamByName('D_ID_SP_RAS').AsInt64 := id_ras_sch;
                StoredProc.ParamByName('D_ID_DAY').AsInt64    := id_del;
                try
                    StoredProc.ExecProc;
                    TransactionWR.Commit;
                except on E:Exception do begin
                    TransactionWR.Rollback;
                    DataSetDayBank.Locate('ID_DT_DAY', id_del, []);
                    ShowMessage(E.Message);
                end end;
                ActionRefreshExecute(Sender);
                DataSetDayBank.Locate('ID_DT_DAY', id_prev, []);

            end;
        end;
    end;
end;

procedure TfmBankDayForm.ActionAddExecute(Sender: TObject);
var
    T : TfmbankDayAdd;
begin
    DataSetAdd.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_SALDO_END('+IntTostr(id_ras_sch)+')';
    DataSetAdd.Open;
    if DataSetAdd['SALDO_END'] = null then
        T := TfmBankDayAdd.Create(Self, Self, Add_Day_Bank, '0,00', '0,00', id_valuta_in,name_valuta_in)
    else
        T := TfmBankDayAdd.Create(Self, Self, Add_Day_Bank, DataSetAdd['SALDO_END'], DataSetAdd['SALDO_END_VALUTA'], id_valuta_in,name_valuta_in);
    T.ShowModal;
    T.Free;
    DataSetAdd.Close;
end;

procedure TfmBankDayForm.ActionChangeExecute(Sender: TObject);
Var
    T : TfmBankDayAdd;
begin
    T := TfmBankDayAdd.Create(self, Self, Change_Day_Bank, '0', '0,00', id_valuta_in,name_valuta_in);
    T.ShowModal;
    T.Free;
end;

procedure TfmBankDayForm.ActionTakeExecute(Sender: TObject);
var
    res : integer;
    id : int64;
    rr : td;
begin
    if cxGridDayBank.IsFocused then
    begin
        if not DataSetDayBank.IsEmpty then
        begin
            id                := DataSetDayBank['ID_DT_DAY'];
            rr.mfo            := cxLabel9.Text;
            rr.bank           := cxLabel11.Text;
            rr.id_rate_acc    := cxLabel7.Text;
            rr.kod_kor_sch    := cxLabel13.Text;
            rr.title_kor_sch  := cxLabel15.Text;
            rr.kod_dog        := DataSetDayBank['DAY_BANK'];
            rr.id_kor_sch     := id_s;
            rr.block_debet    := DataSetDayBank['BLOCK_DEBET'];
            rr.block_kredit   := DataSetDayBank['BLOCK_KREDIT'];
            rr.block_saldo    := DataSetDayBank['BLOCK_SALDO'];
            rr.is_valuta      := is_valuta_in;
            rr.id_valuta      := id_valuta_in;
            rr.name_valuta    := name_valuta_in;

            res := Un_lo_file_Alex.LBankDocEdit(self, id_user, Database, id_ras_sch, id, -1, rr);
            if res = -1 then
            begin
                ActionRefreshExecute(sender);
                DataSetDayBank.Locate('ID_DT_DAY', id, []);
            end;
        end;
    end;
end;

procedure TfmBankDayForm.ActionCancleExecute(Sender: TObject);
begin
//
end;

procedure TfmBankDayForm.DataSetDayBankAfterScroll(DataSet: TDataSet);
begin
    if not VarIsNull(DataSetDayBank['COL_PRIHOD'])
        then cxLabel4.Caption := IntToStr(DataSetDayBank['COL_PRIHOD']) + Un_R_file_Alex.PRIHODNIH
        else cxLabel4.Caption := '0' + Un_R_file_Alex.PRIHODNIH;
    if not VarIsNull(DataSetDayBank['COL_RASHOD'])
        then cxLabel5.Caption := IntToStr(DataSetDayBank['COL_RASHOD']) + Un_R_file_Alex.RASHODNIH
        else cxLabel5.Caption := '0' + Un_R_file_Alex.RASHODNIH;
end;


procedure TfmBankDayForm.cxGridDayBankDBTableView1DblClick(
  Sender: TObject);
begin
    if not DataSetDayBank.IsEmpty then
        ActionTakeExecute(Sender);
end;

procedure TfmBankDayForm.cxCheckBoxToClick(Sender: TObject);
begin
    if  cxCheckBoxTo.Checked then
    begin
        cxDateEditEnd.Properties.ReadOnly := false;
        cxDateEditEnd.Enabled             := true;
//        cxDateEditEnd.Date                := StrToDate(d_end);
    end else
    begin
        cxDateEditEnd.Properties.ReadOnly := true;
        cxDateEditEnd.Enabled             := false;
//        cxDateEditEnd.Date                := max_date;
    end;
end;

procedure TfmBankDayForm.cxCheckBoxWithClick(Sender: TObject);
begin
    if cxCheckBoxWith.Checked then
    begin
        cxDateEditBegin.Enabled := true;
        cxCheckBoxTo.Enabled    := true;
        cxDateEditEnd.Enabled   := true;
//        cxDateEditBegin.Date    := StrTodate(d_beg);
    end else
    begin
        cxDateEditBegin.Enabled := false;
        cxCheckBoxTo.Enabled    := false;
        cxDateEditEnd.Enabled   := false;
//        cxDateEditBegin.Date    := min_date;
    end;
    cxCheckBoxToClick(Sender);
end;

procedure TfmBankDayForm.ActionPrintExecute(Sender: TObject);
var
       day_cur, kor_sch, ras_sch  : string;
begin
        day_cur := DataSetDayBank.FieldByName('DAY_BANK').AsString;
        kor_sch := inttostr(id_s);
        DataSetPrint.Close;
        DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_SUMS_ONDATE_BY_GR(''' + day_cur +''', '''+day_cur+''', '''+kor_sch+''') order by r_kekv_kod, r_group_kod';
        DataSetPrint.Open;
        DataSetPrint.FetchAll;


        ReportGrSm.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_day_by_group.fr3');

        ReportGrSm.Variables['day']     := QuotedStr(day_cur);
        ReportGrSm.Variables['korresp_sch'] := QuotedStr(cxLabel13.Text+' ('+cxLabel15.Text+')');
        ReportGrSm.Variables['ras_sch'] := QuotedStr(cxLabel7.Text);

        ReportGrSm.PrepareReport(true);
        ReportGrSm.ShowReport(true);
        //ReportGrSm.DesignReport;

end;

procedure TfmBankDayForm.ActionPrintSmExecute(Sender: TObject);
var
       day_cur, kor_sch, ras_sch  : string;
begin
        day_cur := DataSetDayBank.FieldByName('DAY_BANK').AsString;
        kor_sch := inttostr(id_s);
        DataSetPrint.Close;
        DataSetPrint.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_SUMS_ONDATE_BY_SM(''' + day_cur +''', '''+day_cur+''', '''+kor_sch+''') order by r_kekv_kod, r_group_kod, r_smeta_kod';
        DataSetPrint.Open;
        DataSetPrint.FetchAll;

        ReportGrSm.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_day_by_group_sm.fr3');

        ReportGrSm.Variables['day']     := QuotedStr(day_cur);
        ReportGrSm.Variables['korresp_sch'] := QuotedStr(cxLabel13.Text+' ('+cxLabel15.Text+')');
        ReportGrSm.Variables['ras_sch'] := QuotedStr(cxLabel7.Text);

        ReportGrSm.PrepareReport(true);
        ReportGrSm.ShowReport(true);
        //ReportGrSm.DesignReport;
end;

procedure TfmBankDayForm.ActionInvoiceExecute(Sender: TObject);
var
    T : TfmBankInvoice;
    error : integer;
begin
    error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Invoices','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end;
    T := TfmBankInvoice.Create(Self, Database, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmBankDayForm.cxGridDayBankDBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;

  if (AViewInfo.GridRecord.Values[6] = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //заблокированные сальдом
      ACanvas.Canvas.Font.Color := RGB(0,0,255);//синий;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;

end;

procedure TfmBankDayForm.ActionPrintRashifrExecute(Sender: TObject);
var
    T : TfmBankRashifr;
    error : integer;
begin
    {error := fibCheckPermission('/ROOT/Bank/Work/Work_with_RS/Bank_Print_Rashifr','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARN_NO), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
        exit;
    end; }
    T := TfmBankRashifr.Create(Self, Database, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmBankDayForm.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;

end;

procedure TfmBankDayForm.cxGridDayBankDBBandedTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  //if ARecord.DisplayTexts[7]<>'' then
 // astyle := cxstyle11;
end;

procedure TfmBankDayForm.cxGridDayBankDBBandedTableView1DBBandedColumn9CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
      ACanvas.Canvas.Brush.Color :=$00EAF3CD;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
end;

procedure TfmBankDayForm.cxGridDayBankDBBandedTableView1DBBandedColumn10CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
      ACanvas.Canvas.Brush.Color :=$00EAF3CD;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
end;

procedure TfmBankDayForm.cxGridDayBankDBBandedTableView1DBBandedColumn11CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
      ACanvas.Canvas.Brush.Color :=$00EAF3CD;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
end;

procedure TfmBankDayForm.cxGridDayBankDBBandedTableView1DBBandedColumn8CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var   Arect : TRect;
begin
      ACanvas.Canvas.Brush.Color :=$00EAF3CD;
      ACanvas.Canvas.Font.Color :=clBlack;
      ACanvas.Canvas.FillRect(Arect);
end;

end.
