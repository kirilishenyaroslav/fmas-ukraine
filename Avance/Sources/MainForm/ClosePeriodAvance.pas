unit ClosePeriodAvance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, MainForm, DB, FIBDataSet, pFIBDataSet,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCalendar, Un_R_file_Alex, Kernel,
  cxSpinEdit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGroupBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxSplitter, ExtCtrls, FIBDatabase, pFIBDatabase,
  cxCheckBox;

type
  TfmClosePeriodAvance = class(TForm)
    DataSetSch: TpFIBDataSet;
    DataSetSaldo: TpFIBDataSet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    Panel1: TPanel;
    cxButtonOpenSch: TcxButton;
    cxLabel1: TcxLabel;
    cxButtonCloseSch: TcxButton;
    cxComboBoxSch: TcxComboBox;
    cxButtonClose: TcxButton;
    cxSplitter1: TcxSplitter;
    cxButtonBlock: TcxButton;
    DataSetSelectOpen: TpFIBDataSet;
    DataSource1: TDataSource;
    TransactionW: TpFIBTransaction;
    DataSetSelectOpenID_SCH: TFIBBCDField;
    DataSetSelectOpenNAME_SCH: TFIBStringField;
    DataSetSelectOpenNUMBER_SCH: TFIBStringField;
    DataSetSelectOpenNAME_BLOCK: TFIBStringField;
    DataSetSelectOpenDATE_OPEN: TFIBDateField;
    DataSetSelectOpenKASSA_NAME: TFIBStringField;
    DataSetSelectOpenID_KASSA: TFIBBCDField;
    DataSetSelectOpenBLOCK_SCH: TFIBSmallIntField;
    cxLabel2: TcxLabel;
    Transaction: TpFIBTransaction;
    Database: TpFIBDatabase;
    DataSetSelectOpenDATE_BEG: TFIBDateField;
    DataSetSelectOpenDATE_END: TFIBDateField;
    DataSetSelectOpenINTO_MY: TFIBIntegerField;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxCheckBox1: TcxCheckBox;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonCloseSchClick(Sender: TObject);
    procedure cxButtonOpenSchClick(Sender: TObject);
    procedure DataSetSelectOpenAfterScroll(DataSet: TDataSet);
    procedure cxButtonBlockClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxCheckBox1Click(Sender: TObject);
  private
//    Ind : array of Int64;
  public
    myform : TfmAvanceMainForm;
    constructor Create(AOwner: TComponent; mform : TfmAvanceMainForm); reintroduce; overload;
  end;


implementation

uses DateUtils, ProgressFormAvance;

{$R *.dfm}

constructor TfmClosePeriodAvance.Create(AOwner: TComponent;
  mform: TfmAvanceMainForm);
begin
    inherited Create (AOwner);
    myform                        := mform;
    Database                      := myform.Database;
    Transaction.DefaultDatabase   := Database;
    TransactionW.DefaultDatabase  := Database;
    Database.defaultTransaction   := Transaction;

    DataSetSelectOpen.Database    := Database;
    DataSetSelectOpen.Transaction := Transaction;

    Transaction.StartTransaction;
//    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(990000000)+')';
    DataSetSelectOpen.Close;
    DataSetSelectOpen.SQLs.SelectSQL.Text := 'select * from J4_SELECT_INFO_OPEN_SCH('+inttostr(myform.id_user)+') where DATE_OPEN<DATE_END';
    DataSetSelectOpen.open;
    CAPTION                              := Un_R_file_Alex.KASSA_CLOSE_CAPTION;
    cxButtonOpenSch.Caption              := Un_R_file_Alex.KASSA_OPEN_SCH;
    cxButtonCloseSch.Caption             := Un_R_file_Alex.KASSA_CLOSE_SCH;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_CLOSE_NUMBER_SCH;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_CLOSE_NAME_SCH;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_CLOSE_BLOCK_SCH;
//    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_CLOSE_DATE_SCH;
    cxLabel2.Caption                     := Un_R_file_Alex.J4_SYSTEM;
end;

procedure TfmClosePeriodAvance.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmClosePeriodAvance.cxButtonCloseSchClick(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
    day_end : TDATE;
    T : TfmProgressFormAvance;
    id : Int64;
begin
    if DataSetSelectOpen.IsEmpty then exit;
    if DataSetSelectOpen.FBN('DATE_OPEN').AsDateTime >= DataSetSelectOpen.FBN('DATE_END').AsDateTime then exit;
    T := TfmProgressFormAvance.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.Update;
    DataSetSaldo.Database    := Database;
    DataSetSaldo.Transaction := TransactionW;
    TransactionW.StartTransaction;


//    date_first := EncodeDate(YearOf(cxDateEdit.Date), monthof(cxDateEdit.Date), 1);
//    MAX_DAY := IncMonth(date_first, 1);

//    if cxComboBoxMonth.ItemIndex < 10
//            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
//            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(DataSetSelectOpen.FieldByName('DATE_OPEN').AsDateTime,1);
//        showMessage(datetoStr(DataSetSelectOpen.FieldByName('DATE_OPEN').AsDateTime));
//        showMessage(datetoStr(day_end));
//        day_end := IncDay(day_end,-1);
    DataSetSaldo.Close;
    DataSetSaldo.SQLs.SelectSQL.Text := 'select * from J4_SELECT_SALDO(' +  QuotedStr(dateToStr(DataSetSelectOpen.FieldByName('DATE_OPEN').AsDateTime)) + ', ' +  QuotedStr(DateToStr(day_end)) + ', '+IntToStr(TFIBBCDField(DataSetSelectOpen.fieldByname('ID_SCH')).AsInt64)+', '+IntToStr(myform.id_user)+')';
    DataSetSaldo.Open;
    IF DataSetSaldo.Fieldbyname('FLAG_ERROR').AsInteger = 1 then
    begin
        ShowMessage(DataSetSaldo.Fieldbyname('ERROR').AsString);
    end else
    begin
        STRU.DBHANDLE     := myform.Database.Handle;
        STRU.TRHANDLE     := TransactionW.Handle;
        STRU.ID_SCH       := TFIBBCDField(DataSetSelectOpen.FieldByname('ID_SCH')).AsInt64;
        STRU.MODE         := 1;
        STRU.KR_SALDO_IN  := DataSetSaldo.Fieldbyname('SALDO_KR_IN').AsCurrency;
        STRU.DB_SALDO_IN  := DataSetSaldo.fieldByname('SALDO_DB_IN').AsCurrency;
        STRU.KR_OBOR      := DataSetSaldo.fieldByname('OBOROT_DB').AsCurrency;
        STRU.DB_OBOR      := DataSetSaldo.fieldByname('OBOROT_KR').AsCurrency;
        STRU.KR_SALDO_OUT := DataSetSaldo.fieldByname('SALDO_KR').AsCurrency;
        STRU.DB_SALDO_OUT := DataSetSaldo.fieldByname('SALDO_DB').AsCurrency;
        try
            DoResult := Kernel.SchManager(@STRU);
            T.Free;
            if DoResult.RESULT_CODE = 0 then
            begin
                ShowMessage(DoResult.RESULT_MESSAGE);
                TransactionW.Rollback;
            end ELSE
            begin
                TransactionW.Commit;
                id := DataSetSelectOpen['ID_SCH'];
                DataSetSelectOpen.CloseOpen(true);
                ShowMessage(Un_R_file_Alex.KASSA_CLOSE_CLOSE);
                DataSetSelectOpen.Locate('ID_SCH', id, []);
            end;
            except on E : Exception do
            begin
                ShowMessage(Un_R_file_Alex.KASSA_ERROR+E.Message);
                TransactionW.Rollback;
            end;
        end;
    end;
end;

procedure TfmClosePeriodAvance.cxButtonOpenSchClick(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
    T : TfmProgressFormAvance;
    id : int64;
begin
    if DataSetSelectOpen.IsEmpty then exit;
    T := TfmProgressFormAvance.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT_O);
    T.Show;
    T.Update;
    TransactionW.StartTransaction;
    STRU.DBHANDLE    := myform.Database.Handle;
    STRU.TRHANDLE    := TransactionW.Handle;
    STRU.ID_SCH      := TFIBBCDField(DataSetSelectOpen.FieldByname('ID_SCH')).AsInt64;
    STRU.MODE        := 2;
    STRU.KR_SALDO_IN  := 0;
    STRU.DB_SALDO_IN  := 0;
    STRU.KR_OBOR      := 0;
    STRU.DB_OBOR      := 0;
    STRU.KR_SALDO_OUT := 0;
    STRU.DB_SALDO_OUT := 0;
    try
        DoResult := Kernel.SchManager(@STRU);
        TransactionW.Commit;
        T.Free;
        if DoResult.RESULT_CODE = 0 then
            ShowMessage(DoResult.RESULT_MESSAGE)
        ELSE
        begin
            id := DataSetSelectOpen['ID_SCH'];
            DataSetSelectOpen.CloseOpen(true);
            ShowMessage(Un_R_file_Alex.KASSA_CLOSE_OPEN);
            DataSetSelectOpen.Locate('ID_SCH', id, []);
        end;
    except on E : Exception do
        ShowMessage(Un_R_file_Alex.MY_MESSAGE_ERROR+E.Message);
    end;
end;

procedure TfmClosePeriodAvance.DataSetSelectOpenAfterScroll(
  DataSet: TDataSet);
begin
    if not DataSetSelectOpen.IsEmpty then
    begin
        if not DataSetSelectOpen.FBN('KASSA_NAME').IsNull then cxLabel1.Caption := DataSetSelectOpen['KASSA_NAME'] else cxLabel1.Caption := ''; 
        if DataSetSelectOpen['BLOCK_SCH'] = 1
        then cxButtonBlock.Caption := Un_R_file_Alex.KASSA_CLOSE_UNBLOC
        else cxButtonBlock.Caption := Un_R_file_Alex.KASSA_CLOSE_BLOC;
    end;
end;

procedure TfmClosePeriodAvance.cxButtonBlockClick(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
    id : int64;
begin
    if DataSetSelectOpen.IsEmpty then exit;
    TransactionW.StartTransaction;
    STRU.DBHANDLE    := myform.Database.Handle;
    STRU.TRHANDLE    := TransactionW.Handle;
    STRU.ID_SCH      := DataSetSelectOpen['ID_SCH'];
//    STRU.ACTUAL_DATE := DataSetSelectOpen['DATE_OPEN'];
    if DataSetSelectOpen['BLOCK_SCH'] = 1
        then STRU.MODE := 4
        else STRU.MODE := 3;
    STRU.KR_SALDO_IN  := 0;
    STRU.DB_SALDO_IN  := 0;
    STRU.KR_OBOR      := 0;
    STRU.DB_OBOR      := 0;
    STRU.KR_SALDO_OUT := 0;
    STRU.DB_SALDO_OUT := 0;
    try
        DoResult := Kernel.SchManager(@STRU);
        TransactionW.Commit;
        if DoResult.RESULT_CODE = 0 then
            ShowMessage(DoResult.RESULT_MESSAGE)
        ELSE
        begin
            id := DataSetSelectOpen['ID_SCH'];
            DataSetSelectOpen.CloseOpen(true);
            DataSetSelectOpen.Locate('ID_SCH', id, []);
        end;
    except on E : Exception do
        ShowMessage(Un_R_file_Alex.MY_MESSAGE_ERROR+E.Message);
    end;
end;

procedure TfmClosePeriodAvance.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
    Arect:=AViewInfo.Bounds;
    if (AViewInfo.GridRecord.Values[cxGrid1DBTableView1DBColumn5.Index] = 0) and (not AViewInfo.GridRecord.Focused) then
    begin
        ACanvas.Canvas.Font.Color := RGB(204,107,0);
        ACanvas.Canvas.FillRect(Arect);
        exit;
    end; 
    if (not AViewInfo.GridRecord.Focused) then
    begin   // остальные
        ACanvas.Canvas.Font.Color := clBlack;
        ACanvas.Canvas.FillRect(Arect);
    end;
end;

procedure TfmClosePeriodAvance.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        DataSetSelectOpen.Close;
        DataSetSelectOpen.SQLs.SelectSQL.Text := 'select * from J4_SELECT_INFO_OPEN_SCH(:id_user)';
        DataSetSelectOpen.ParamByName('id_user').AsInt64 := myform.id_user;
        DataSetSelectOpen.open;
    end else
    begin
        DataSetSelectOpen.Close;
        DataSetSelectOpen.SQLs.SelectSQL.Text := 'select * from J4_SELECT_INFO_OPEN_SCH(:id_user) where DATE_OPEN<DATE_END';
        DataSetSelectOpen.ParamByName('id_user').AsInt64 := myform.id_user;
        DataSetSelectOpen.open;
    end;
end;

end.
