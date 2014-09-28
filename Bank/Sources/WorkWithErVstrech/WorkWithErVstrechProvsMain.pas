unit WorkWithErVstrechProvsMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Placemnt, ImgList, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ComCtrls, ToolWin, cxContainer, cxLabel,
  ExtCtrls, frxClass, cxDropDownEdit, cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TfrmWorkWithErVstrechProvs = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    ImageList1: TImageList;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    DataSetID_PROV: TFIBBCDField;
    DataSetDATE_DOC: TFIBDateField;
    DataSetNUM_DOC: TFIBStringField;
    DataSetSUMMA_DOC: TFIBBCDField;
    DataSetPRIHOD: TFIBIntegerField;
    DataSetDATE_PROV: TFIBDateField;
    DataSetSCH_DB_NUMBER: TFIBStringField;
    DataSetTITLE_DB_SCH: TFIBStringField;
    DataSetSMETA_KOD: TFIBIntegerField;
    DataSetTITLE_SMETA: TFIBStringField;
    DataSetSCH_KR_NUMBER: TFIBStringField;
    DataSetTITLE_KR_SCH: TFIBStringField;
    DataSetRAZD_NUM: TFIBIntegerField;
    DataSetTITLE_RAZD: TFIBStringField;
    DataSetSTAT_KOD: TFIBIntegerField;
    DataSetTITLE_STATE: TFIBStringField;
    DataSetKEKV_KOD: TFIBIntegerField;
    DataSetTITLE_KEKV: TFIBStringField;
    DataSetSUMMA_PROV: TFIBBCDField;
    Panel3: TPanel;
    cxSpinEdit1: TcxSpinEdit;
    cxLabel8: TcxLabel;
    cxComboBox1: TcxComboBox;
    cxLabel9: TcxLabel;
    procedure ToolButton2Click(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure cxSpinEdit1Click(Sender: TObject);
    procedure cxSpinEdit1Editing(Sender: TObject; var CanEdit: Boolean);
    procedure cxSpinEdit1Exit(Sender: TObject);
    procedure cxSpinEdit1FocusChanged(Sender: TObject);
    procedure cxSpinEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSetAfterScroll(DataSet: TDataSet);
  private
    Owner : TComponent;
    id_sch_main : int64;
    id_sys : integer;
    date_beg    : Tdate;
    regim_obr   : integer;
    flag_change_date : integer;
  public
    d : TPfibDataBase;
    id_user : int64;
    constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase;  id_form_uch : integer; id_sch : int64; date_beg_per : TDate); reintroduce; overload;
  end;

  function ErVstrechProvs(AOwner:TComponent; id_us: int64; DB: TpFIBDatabase;  id_form_uch : integer; id_sch : int64; date_beg_per : TDate) : Integer; stdcall;
    exports ErVstrechProvs;

{var
  frmWorkWithErVstrechProvs: TfrmWorkWithErVstrechProvs; }

implementation

uses Un_R_file_Alex, DateUtils;

{$R *.dfm}

function ErVstrechProvs(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase; id_form_uch : integer; id_sch : int64; date_beg_per : TDate): integer;
var
    T : TfrmWorkWithErVstrechProvs;
begin
    T := TfrmWorkWithErVstrechProvs.Create(AOwner, id_us, DB, id_form_uch,id_sch,date_beg_per);
    T.ShowModal;
    T.Free;
end;

constructor TfrmWorkWithErVstrechProvs.Create(AOwner: TComponent; id_us: int64;DB: TpFIBDatabase; id_form_uch : integer; id_sch : int64; date_beg_per : TDate);
var month, year : integer;
    date_beg_str : string;
begin
    inherited Create(AOwner);
    Owner                           := AOwner;
    Database                        := DB;

    Transaction.DefaultDatabase     := Database;
    Database.DefaultTransaction     := Transaction;

    id_user                         := id_us;

    DataSet.Database                := DB;
    DataSet.Transaction             := Transaction;
    Transaction.StartTransaction;

    Caption                               := Un_R_file_Alex.BANK_ER_VSTRECH;
    cxGrid1DBTableView1DBColumn1.Caption  := Un_R_file_Alex.BANK_NUM_DOCUMENT;
    cxGrid1DBTableView1DBColumn2.Caption  := Un_R_file_Alex.J4_MAIN_FORM_DEBET;
    cxGrid1DBTableView1DBColumn3.Caption  := Un_R_file_Alex.J4_MAIN_FORM_KREDIT;
    cxGrid1DBTableView1DBColumn4.Caption  := Un_R_file_Alex.BANK_DATE_PROV;
    cxGrid1DBTableView1DBColumn5.Caption  := Un_R_file_Alex.BANK_DATE_DOCUMENT;
    cxGrid1DBTableView1DBColumn6.Caption  := Un_R_file_Alex.BANK_SUMMA_DOC;
    cxGrid1DBTableView1DBColumn7.Caption  := Un_R_file_Alex.KASSA_ADD_PROVODKA_SUMMA_PROV;

    if(id_sch= null) then  id_sch := 0;
    id_sch_main      := id_sch;
    id_sys           := id_form_uch;
    date_beg         := date_beg_per;

    month            := MonthOf(date_beg);
    year             := yearOf(date_beg);

    flag_change_date := 0;

    if month < 9
        then date_beg_str := '01.'+'0'+ IntToStr(month) + '.'+ IntToStr(year)
        else date_beg_str := '01.'+ IntToStr(month) + '.' + IntToStr(year);

    date_beg  := strtodate(date_beg_str);

    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text        := 'Select * from BANK_GET_INFO_WRONG_SYS(:ID_KOD_SYS, :ID_SCH_IN,:DATE_BEG_IN)';
    DataSet.ParamByName('ID_KOD_SYS').AsInteger    := id_sys;
    DataSet.ParamByName('ID_SCH_IN').AsInt64       := id_sch_main;
    DataSet.ParamByName('DATE_BEG_IN').AsDate      := date_beg;
    DataSet.Open;

    cxComboBox1.Clear;
    cxComboBox1.Properties.Items.Insert(0, Un_R_file_Alex.MY_JANUARY);
    cxComboBox1.Properties.Items.Insert(1, Un_R_file_Alex.MY_FEBRIARY);
    cxComboBox1.Properties.Items.Insert(2, Un_R_file_Alex.MY_MARCH);
    cxComboBox1.Properties.Items.Insert(3, Un_R_file_Alex.MY_APRILE);
    cxComboBox1.Properties.Items.Insert(4, Un_R_file_Alex.MY_MAY);
    cxComboBox1.Properties.Items.Insert(5, Un_R_file_Alex.MY_JUNE);
    cxComboBox1.Properties.Items.Insert(6, Un_R_file_Alex.MY_JULY);
    cxComboBox1.Properties.Items.Insert(7, Un_R_file_Alex.MY_AUGUST);
    cxComboBox1.Properties.Items.Insert(8, Un_R_file_Alex.MY_SEPTEMBER);
    cxComboBox1.Properties.Items.Insert(9, Un_R_file_Alex.MY_OCTOBER);
    cxComboBox1.Properties.Items.Insert(10, Un_R_file_Alex.MY_NOVEMBER);
    cxComboBox1.Properties.Items.Insert(11, Un_R_file_Alex.MY_DESEMBER);

    cxComboBox1.ItemIndex       := MonthOf(date_beg)-1;

    cxSpinEdit1.value           := yearOf(date_beg);

end;

procedure TfrmWorkWithErVstrechProvs.ToolButton2Click(Sender: TObject);
begin
    close;
end;

procedure TfrmWorkWithErVstrechProvs.cxComboBox1PropertiesChange(
  Sender: TObject);
begin
    if (flag_change_date=0)or(flag_change_date=1) then
    begin
        flag_change_date := flag_change_date+1;
        exit;
    end;
    if cxComboBox1.ItemIndex > 8
        then date_beg := StrToDate('01.'+IntToStr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
        else date_beg := StrToDate('01.0'+IntToStr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text        := 'Select * from BANK_GET_INFO_WRONG_SYS(:ID_KOD_SYS, :ID_SCH_IN,:DATE_BEG_IN)';
    DataSet.ParamByName('ID_KOD_SYS').AsInteger    := id_sys;
    DataSet.ParamByName('ID_SCH_IN').AsInt64       := id_sch_main;
    DataSet.ParamByName('DATE_BEG_IN').AsDate      := date_beg;
    DataSet.Open;

    cxGrid1.SetFocus;
end;

procedure TfrmWorkWithErVstrechProvs.cxSpinEdit1Click(Sender: TObject);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
    cxSpinEdit1.value := cxSpinEdit1.Text;
end;

procedure TfrmWorkWithErVstrechProvs.cxSpinEdit1Editing(Sender: TObject;
  var CanEdit: Boolean);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfrmWorkWithErVstrechProvs.cxSpinEdit1Exit(Sender: TObject);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfrmWorkWithErVstrechProvs.cxSpinEdit1FocusChanged(
  Sender: TObject);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfrmWorkWithErVstrechProvs.cxSpinEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfrmWorkWithErVstrechProvs.DataSetAfterScroll(DataSet: TDataSet);
begin
   if DataSet['smeta_kod'] <> null      then  cxLabel3.Caption   := DataSet.FieldByName('smeta_kod').AsString +' '+ DataSet.FieldByName('title_smeta').AsString;
   if DataSet['razd_num'] <> null       then  cxLabel10.Caption  := DataSet.FieldByName('razd_num').AsString +' '+ DataSet.FieldByName('title_razd').AsString;
   if DataSet['stat_kod'] <> null       then  cxLabel11.Caption  := DataSet.FieldByName('stat_kod').AsString +' '+ DataSet.FieldByName('title_state').AsString;
   if DataSet['kekv_kod'] <> null       then   cxLabel12.Caption  := DataSet.FieldByName('kekv_kod').AsString +' '+ DataSet.FieldByName('title_kekv').AsString;
end;

end.
