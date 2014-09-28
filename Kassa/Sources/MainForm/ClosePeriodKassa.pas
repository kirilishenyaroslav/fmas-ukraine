unit ClosePeriodKassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, MainFormKassa, DB, FIBDataSet, pFIBDataSet,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCalendar, Un_R_file_Alex, Kernel,
  cxSpinEdit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGroupBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxSplitter, ExtCtrls, FIBDatabase, pFIBDatabase;

type
  TfmClosePeriodKassa = class(TForm)
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
    DataSetSelectOpenID_SCH: TFIBBCDField;
    DataSetSelectOpenNAME_SCH: TFIBStringField;
    DataSetSelectOpenNUMBER_SCH: TFIBStringField;
    DataSetSelectOpenNAME_BLOCK: TFIBStringField;
    DataSetSelectOpenDATE_OPEN: TFIBDateField;
    DataSetSelectOpenKASSA_NAME: TFIBStringField;
    DataSetSelectOpenID_KASSA: TFIBBCDField;
    DataSetSelectOpenBLOCK_SCH: TFIBSmallIntField;
    DataSource1: TDataSource;
    TransactionW: TpFIBTransaction;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    DataSetErProvs: TpFIBDataSet;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonCloseSchClick(Sender: TObject);
    procedure cxButtonOpenSchClick(Sender: TObject);
    procedure DataSetSelectOpenAfterScroll(DataSet: TDataSet);
    procedure cxButtonBlockClick(Sender: TObject);
  private
//    Ind : array of Int64;
//    id_sch : int64;
  public
    myform : TfmMainForm;
    constructor Create(AOwner: TComponent; mform : TfmMainForm); reintroduce; overload;
  end;


implementation

uses DateUtils, ProgressFormKassa, Un_lo_file_Alex;

{$R *.dfm}

constructor TfmClosePeriodKassa.Create(AOwner: TComponent;
  mform: TfmMainForm);
begin
    inherited Create (AOwner);
    myform                           := mform;
    pFIBDatabase1                    := myform.Database;
    pFIBTransaction1.DefaultDatabase := pFIBDatabase1;
    pFIBDatabase1.DefaultTransaction := pFIBTransaction1;
    TransactionW.DefaultDatabase     := pFIBDatabase1;
    DataSetSelectOpen.Database       := pFIBDatabase1;
    DataSetSelectOpen.Transaction    := pFIBTransaction1;
    DataSetSaldo.Database            := pFIBDatabase1;
    DataSetSaldo.Transaction         := TransactionW;
    DataSetErProvs.Database          := pFIBDatabase1;
    DataSetErProvs.Transaction       := TransactionW;

    pFIBTransaction1.StartTransaction;
//    DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+IntToStr(990000000)+')';
    DataSetSelectOpen.open;
    CAPTION                  := Un_R_file_Alex.KASSA_CLOSE_CAPTION;
    cxButtonOpenSch.Caption  := Un_R_file_Alex.KASSA_OPEN_SCH;
    cxButtonCloseSch.Caption := Un_R_file_Alex.KASSA_CLOSE_SCH;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_CLOSE_NUMBER_SCH;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_CLOSE_NAME_SCH;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_CLOSE_BLOCK_SCH;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_CLOSE_DATE_SCH;
end;

procedure TfmClosePeriodKassa.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmClosePeriodKassa.cxButtonCloseSchClick(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
    day_end, date_beg_for_close : TDATE;
//    day_begin : string;
    T : TfmProgressFormKassa;
    id : Int64;
begin
    T := TfmProgressFormKassa.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    TransactionW.StartTransaction;

    date_beg_for_close := DataSetSelectOpen.FieldByName('DATE_OPEN').AsDateTime;
    day_end := IncMonth(DataSetSelectOpen.FieldByName('DATE_OPEN').AsDateTime,1);

    DataSetSaldo.Close;
    DataSetSaldo.SQLs.SelectSQL.Text := 'select * from KASSA_SELECT_SALDO(' +  QuotedStr(dateToStr(DataSetSelectOpen.FieldByName('DATE_OPEN').AsDateTime)) + ', ' +  QuotedStr(DateToStr(day_end)) + ', '+IntToStr(DataSetSelectOpen.fieldByname('ID_SCH').AsInteger)+')';
    DataSetSaldo.Open;
    IF DataSetSaldo.Fieldbyname('FLAG_ERROR').AsInteger = 1 then
    begin
        ShowMessage(DataSetSaldo.Fieldbyname('ERROR').AsString);
    end else
    begin
        STRU.DBHANDLE     := pFIBDatabase1.Handle;
        STRU.TRHANDLE     := TransactionW.Handle;
        STRU.ID_SCH       := TFIBBCDField(DataSetSelectOpen.FieldByname('ID_SCH')).AsInt64;
        STRU.MODE         := 1;
        STRU.DB_SALDO_IN  := DataSetSaldo.Fieldbyname('SALDO_IN').AsFloat;
        STRU.KR_SALDO_IN  := 0;
        STRU.DB_SALDO_OUT := DataSetSaldo.Fieldbyname('SALDO_OUT').AsFloat;
        STRU.KR_SALDO_OUT := 0;
        STRU.KR_OBOR      := DataSetSaldo.fieldByname('OBOROT_KR').AsFloat;
        STRU.DB_OBOR      := DataSetSaldo.fieldByname('OBOROT_DB').AsFloat;
        STRU.ID_USER      := myform.id_user;
        try
            DoResult := Kernel.SchManager(@STRU);
            TransactionW.Commit;
            T.Free;
            if DoResult.RESULT_CODE = 0 then
            begin
                ShowMessage(DoResult.RESULT_MESSAGE);
                id := DataSetSelectOpen['ID_SCH'];
                DataSetErProvs.Close;
                DataSetErProvs.SQLs.SelectSQL.Text        := 'Select * from BANK_GET_INFO_WRONG_SYS(:ID_KOD_SYS, :ID_SCH_IN,:DATE_BEG_IN)';
                DataSetErProvs.ParamByName('ID_KOD_SYS').AsInteger    := 2;
                DataSetErProvs.ParamByName('ID_SCH_IN').AsInt64       := id;
                DataSetErProvs.ParamByName('DATE_BEG_IN').AsDate      := date_beg_for_close;
                DataSetErProvs.Open;
                if  DataSetErProvs.RecordCount >0 then
                begin
                     Un_lo_file_Alex.LErVstrechProvs(Self, myform.id_user, pFIBDatabase1, 1, id, date_beg_for_close);
                end; 
            end
            ELSE
            begin
                id := DataSetSelectOpen['ID_SCH'];
                DataSetSelectOpen.CloseOpen(true);
                ShowMessage(Un_R_file_Alex.KASSA_CLOSE_CLOSE);
                DataSetSelectOpen.Locate('ID_SCH', id, []);
            end;
            except on E : Exception do
                ShowMessage(Un_R_file_Alex.MY_MESSAGE_ERROR+E.Message);
        end;
    end;
end;

procedure TfmClosePeriodKassa.cxButtonOpenSchClick(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
//    day_begin : string;
    T : TfmProgressFormKassa;
    id : int64;
begin
    T := TfmProgressFormKassa.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT_O);
    T.Show;
    TransactionW.StartTransaction;
    STRU.DBHANDLE     := pFIBDatabase1.Handle;
    STRU.TRHANDLE     := TransactionW.Handle;
    STRU.ID_SCH       := TFIBBCDField(DataSetSelectOpen.FieldByname('ID_SCH')).AsInt64;
//    STRU.ACTUAL_DATE := DataSetSelectOpen.FieldByName('DATE_OPEN').AsDateTime;
    STRU.MODE         := 2;
    STRU.KR_SALDO_IN  := 0;
    STRU.DB_SALDO_IN  := 0;
    StRU.KR_SALDO_OUT := 0;
    STRU.DB_SALDO_OUT := 0;
    STRU.KR_OBOR      := 0;
    STRU.DB_OBOR      := 0;
    STRU.ID_USER      := myform.id_user;
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
        ShowMessage('Œ¯Ë·Í‡ '+E.Message);
    end;
end;

procedure TfmClosePeriodKassa.DataSetSelectOpenAfterScroll(
  DataSet: TDataSet);
begin
    if not DataSetSelectOpen.IsEmpty then
    begin
        cxLabel1.Caption := DataSetSelectOpen['KASSA_NAME'];
        if DataSetSelectOpen['BLOCK_SCH'] = 1
        then cxButtonBlock.Caption := Un_R_file_Alex.KASSA_CLOSE_UNBLOC
        else cxButtonBlock.Caption := Un_R_file_Alex.KASSA_CLOSE_BLOC;

    end;
end;

procedure TfmClosePeriodKassa.cxButtonBlockClick(Sender: TObject);
var
    STRU : KERNEL_SCH_MNGR_STRUCTURE;
    DoResult : RESULT_STRUCTURE;
//    day_begin : string;
    id : int64;
begin
    TransactionW.StartTransaction;
    STRU.DBHANDLE      := pFIBDatabase1.Handle;
    STRU.TRHANDLE      := TransactionW.Handle;
    STRU.ID_SCH        := DataSetSelectOpen['ID_SCH'];
    if DataSetSelectOpen['BLOCK_SCH'] = 1
        then STRU.MODE := 4
        else STRU.MODE := 3;
    STRU.KR_SALDO_IN   := 0;
    STRU.DB_SALDO_IN   := 0;
    StRU.KR_SALDO_OUT  := 0;
    STRU.DB_SALDO_OUT  := 0;
    STRU.KR_OBOR       := 0;
    STRU.DB_OBOR       := 0;
    STRU.ID_USER       := myform.id_user;
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

end.
