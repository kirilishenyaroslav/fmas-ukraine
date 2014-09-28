unit KassaShowDel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar, dxBarExtItems, ActnList, ImgList,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, ExtCtrls, StdCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer,
  cxCheckBox, cxCurrencyEdit, frxClass, frxDBSet;

type
  TfmKassaShowDel = class(TForm)
    cxGridDeleteDBTableView1: TcxGridDBTableView;
    cxGridDeleteLevel1: TcxGridLevel;
    cxGridDelete: TcxGrid;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
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
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionRefresh: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
    ActionPrint: TAction;
    cxGridDeleteDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDeleteDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDeleteDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDeleteDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDeleteDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDeleteDBTableView1DBColumn6: TcxGridDBColumn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    cxCheckBoxWith: TcxCheckBox;
    cxDateEditBegin: TcxDateEdit;
    cxCheckBoxTo: TcxCheckBox;
    cxDateEditEnd: TcxDateEdit;
    frxDBDataset1: TfrxDBDataset;
    DataSetID_DT_DOC: TFIBBCDField;
    DataSetKASSA_DAY: TFIBDateField;
    DataSetNOTE: TFIBStringField;
    DataSetNUMBER: TFIBStringField;
    DataSetSUMMA_PRIH: TFIBBCDField;
    DataSetSUMMA_RASH: TFIBBCDField;
    DataSetPRIHOD: TFIBIntegerField;
    DataSetUSE_END: TFIBDateTimeField;
    DataSetID_USER: TFIBBCDField;
    DataSetFIO_DEL: TFIBStringField;
    DataSetFIO: TFIBStringField;
    DataSetNAME_PREDPR: TFIBStringField;
    frxReport1: TfrxReport;
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure cxCheckBoxWithClick(Sender: TObject);
    procedure cxCheckBoxToClick(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
  private
    d_beg : string;
    d_end : string;
    sum_beg, sum_end, fio, note : string;
    prihod, rashod : integer;
  public
    constructor Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase); reintroduce; overload;
  end;

function KassaShowDelete(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;

exports KassaShowDelete;

implementation
uses Un_R_file_Alex, KassaShowDelFilter, Un_Progress_form;
{$R *.dfm}

function KassaShowDelete(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase):Integer;stdcall;
var
    T : TfmKassaShowDel;
begin
    T := TfmKassaShowDel.Create(AOwner, id_user, DB);
    if KassaShowDelFilt(AOwner, id_user, T.Database, T.d_beg, T.d_end, T.sum_beg, T.sum_end, T.fio, T.note, T.prihod, T.rashod) then
    begin
//        d_end := dateToStr(date);
//        d_beg := '01.01.2000';
        T.cxDateEditBegin.date := StrTodate(T.d_beg);
        T.cxDateEditEnd.date   := StrToDate(T.d_end);
        T.DataSet.Close;
        T.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DELETED_DOC('''+T.d_beg+''','''+T.d_end+''', '''+StringReplace(T.sum_beg, ',', '.', [])+''', '''+StringReplace(T.sum_end, ',', '.', [])+''', '''+T.fio+''', '''+T.note+''', '+IntToStr(T.prihod)+', '+IntToStr(T.rashod)+')';
        T.DataSet.Open;
        T.ShowModal;
    end;
    T.Free;
end;

constructor TfmKassaShowDel.Create(AOwner: TComponent; id: int64;
  DB: TpFIBDatabase);
var
    i : int64;
begin
    inherited Create(AOwner);
    Database := db;
    TransactionRead.DefaultDatabase := Database;
    DataSet.Database    := Database;
    DataSet.Transaction := TransactionRead;
    TransactionRead.StartTransaction;
    Caption                                   := Un_R_file_Alex.KASSA_DELETE_CAPTION;
    Label3.Caption                            := Un_R_file_Alex.KASSA_FIO_DELETED;
    Label1.Caption                            := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxGridDeleteDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_FIND_NUM_DOC;
    cxGridDeleteDBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_FIND_DATE_DOC;
    cxGridDeleteDBTableView1DBColumn3.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGridDeleteDBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_DOC_PRIHOD;
    cxGridDeleteDBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_DOC_RASHOD;
    cxGridDeleteDBTableView1DBColumn6.Caption := Un_R_file_Alex.KASSA_DATE_DELETE;
    cxCheckBoxWith.Properties.Caption         := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxCheckBoxTo.Properties.Caption           := Un_R_file_Alex.KASSA_FIND_CAP_3;
    ActionClose.Caption                       := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
    ActionRefresh.Caption                     := Un_R_file_Alex.MY_ACTION_REFRESH_CONST;
    ActionPrint.Caption                       := Un_R_file_Alex.MY_ACTION_PRINT_CONST;
end;

procedure TfmKassaShowDel.DataSetAfterScroll(DataSet: TDataSet);
begin
    if DataSet['NOTE'] <> null then
        label2.Caption := DataSet['NOTE'];
    if DataSet['FIO_DEL'] <> null then
        label4.Caption := DataSet['FIO_DEL'];
end;

procedure TfmKassaShowDel.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaShowDel.ActionRefreshExecute(Sender: TObject);
var
    d_beg : string;
    d_end : string;
begin
{    d_beg := cxDateEditBegin.Text;
    d_end := cxDateEditEnd.Text;
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DELETED_DOC('''+d_beg+''','''+d_end+''')';
    DataSet.Open;}
end;

procedure TfmKassaShowDel.cxCheckBoxWithClick(Sender: TObject);
begin
    if cxCheckBoxWith.Checked then
    begin
        cxDateEditBegin.Enabled := true;
        cxCheckBoxTo.Enabled    := true;
        cxDateEditEnd.Enabled   := true;
    end else
    begin
        cxDateEditBegin.Enabled := false;
        cxCheckBoxTo.Enabled    := false;
        cxDateEditEnd.Enabled   := false;
    end;
    cxCheckBoxToClick(Sender);
end;

procedure TfmKassaShowDel.cxCheckBoxToClick(Sender: TObject);
begin
    if  cxCheckBoxTo.Checked then
    begin
        cxDateEditEnd.Properties.ReadOnly := false;
        cxDateEditEnd.Enabled             := true;
    end else
    begin
        cxDateEditEnd.Properties.ReadOnly := true;
        cxDateEditEnd.Enabled             := false;
    end;
end;

procedure TfmKassaShowDel.ActionPrintExecute(Sender: TObject);
var
    T : TfmUn_Progress_form;
begin
{    T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.KASSA_CLOSE_WAIT);
    T.Show;
    T.update;
        if cxComboBoxMonth.ItemIndex < 9
            then day_begin := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
            else day_begin := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
        day_end := IncMonth(StrToDate(day_begin),1);
        if (StrToDate(day_begin)<date_begin_inst) or (date<StrToDate(day_begin)) then
        begin
            T.Free;
            ShowMessage(Un_R_file_Alex.KASSA_PRINT_DATE_EROR);
            exit;
        end;
        day_end := IncDay(day_end,-1);
        DataSetFRX_Report.Close;
        DataSetFRX_Report.SQLs.SelectSQL.Text := 'select * from KASSA_REPORT_3_15(' +  QuotedStr(day_begin) + ','
                                                                               +  QuotedStr(DateToStr(day_end)) + ','
                                                                               +  IntToStr(IndKassa[cxComboBoxSch.ItemIndex]) + ')';
        DataSetFRX_Report.Open;
    T.Free;}
        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Kassa\Kassa_10006.fr3');
        frxReport1.Variables['date_beg']   := QuotedStr(d_beg);
        frxReport1.Variables['date_end']   := QuotedStr(d_end);
//        frxReport1.Variables['']   := ;
        frxReport1.Variables['comp']       := QuotedStr({GetComputerNetName}' ');
        frxReport1.Variables['id_user']    := QuotedStr(' '{IntToStr(myform.id_user)});
        frxReport1.PrepareReport(true);
        frxReport1.ShowReport(true);
end;

end.
