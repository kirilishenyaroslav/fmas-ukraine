unit AvanceAddMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxCheckBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxClasses, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, AvanceReestrMain,
  RxMemDS;

type
  TfrmAvanceAddMan = class(TForm)
    BarManagerMain: TdxBarManager;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    DataSetMan: TpFIBDataSet;
    DataSourceMan: TDataSource;
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
    cxGridRaznoskka: TcxGrid;
    cxGridRaznoskkaDBTableView1: TcxGridDBTableView;
    cxGridRaznoskkaDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridRaznoskkaDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridRaznoskkaDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridRaznoskkaLevel1: TcxGridLevel;
    dxBarLargeButton2: TdxBarLargeButton;
    cxGridRaznoskkaDBTableView1DBColumn4: TcxGridDBColumn;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    RxMemoryDataMan: TRxMemoryData;
    DataSetManID_AO: TFIBBCDField;
    DataSetManR_NOTE: TFIBStringField;
    DataSetManR_SUM_AO: TFIBBCDField;
    DataSetManR_DATE_AO: TFIBDateField;
    DataSetManR_NUM_AO: TFIBStringField;
    DataSetManR_ID_DT_DOC: TFIBBCDField;
    DataSetManR_ALL_NUMBER: TFIBStringField;
    DataSetManR_FIO: TFIBStringField;
    DataSetManR_PRIH_RAS: TFIBIntegerField;
    DataSetManID_SCH: TFIBBCDField;
    DataSetManCOUNT_ALL: TFIBIntegerField;
    DataSetManKOD_SCH: TFIBIntegerField;
    procedure cxGridRaznoskkaDBTableView1DBColumn4PropertiesChange(
      Sender: TObject);
    procedure cxGridRaznoskkaClick(Sender: TObject);
    procedure CellSelect(Sender: TObject);
    procedure cxGridRaznoskkaDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridRaznoskkaDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure dxBarLargeButton2Click(Sender: TObject);
   private
    myform        : TfrmAvanceReestrMain;
  public
    constructor Create(AOwner: TComponent; db : TpFIBDatabase; mform : TfrmAvanceReestrMain);
  end;

{var
  frmAvanceAddMan: TfrmAvanceAddMan;   }

implementation

uses DateUtils,Un_R_file_Alex;

{$R *.dfm}

constructor TfrmAvanceAddMan.Create(AOwner: TComponent; db : TpFIBDatabase; mform : TfrmAvanceReestrMain);
begin
    inherited Create (AOwner);

    myform     := mform;

    Database                        := DB;

    Transaction.DefaultDatabase     := Database;
    Database.DefaultTransaction     := Transaction;

    DataSetMan.Database             := Database;
    DataSetMan.Transaction          := Transaction;

    StoredProc.DataBase             := Database;
    StoredProc.Transaction          := Transaction;

    Caption                         := Un_R_file_Alex.J4_FORM_REESTR_ADD_HAND;

    cxGridRaznoskkaDBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_NUM_AO;
    cxGridRaznoskkaDBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGridRaznoskkaDBTableView1DBColumn3.Caption := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    dxBarLargeButton2.Caption                    := Un_R_file_Alex.MY_BUTTON_CLOSE;

    DataSetMan.Close;
    DataSetMan.SQLs.SelectSQL.Text := 'SELECT * FROM J4_DT_SELECT_FOR_REESTR('''+dateToStr(myform.date_beg_period)+''','+inttostr(myform.id_system)+','''+dateToStr(myform.date_end_period)+''')';
    if (myform.fl_sch=1) then
    begin
        DataSetMan.SQLs.SelectSQL.Add('where id_sch='+inttostr(myform.id_sch)+'');
    end;

    if (myform.fl_num=1) then
    begin
        if(myform.fl_sch=1)  then
        begin
            DataSetMan.SQLs.SelectSQL.Add('and R_NUM_AO >='''+myform.num_avance_b+'''');
            DataSetMan.SQLs.SelectSQL.Add('and R_NUM_AO <='''+myform.num_avance_e+'''');
        end else
        begin
            DataSetMan.SQLs.SelectSQL.Add('where R_NUM_AO >='''+myform.num_avance_b+'''');
            DataSetMan.SQLs.SelectSQL.Add('and R_NUM_AO <='''+myform.num_avance_e+'''');
        end;
    end;
    DataSetMan.Open;
    DataSetMan.FetchAll;
    DataSetMan.First;



    while not DataSetMan.Eof do
    begin
        RxMemoryDataMan.Open;
        RxMemoryDataMan.Insert;
        RxMemoryDataMan.FieldByName('RxMemoryDataManID_AO').Value         := DataSetMan.FieldByName('ID_AO').AsVariant;
        RxMemoryDataMan.FieldByName('RxMemoryDataManNOTE').Value          := DataSetMan.FieldByName('R_NOTE').AsString;
        RxMemoryDataMan.FieldByName('RxMemoryDataManSUM_AO').Value        := DataSetMan.FieldByName('R_SUM_AO').AsCurrency;
        RxMemoryDataMan.FieldByName('RxMemoryDataManDATE_AO').Value       := DataSetMan.FieldByName('R_DATE_AO').AsDateTime;
        RxMemoryDataMan.FieldByName('RxMemoryDataManNUM_AO').Value        := DataSetMan.FieldByName('R_NUM_AO').AsString;
        RxMemoryDataMan.FieldByName('RxMemoryDataManID_DT_DOC').Value     := DataSetMan.FieldByName('R_ID_DT_DOC').AsVariant;
        RxMemoryDataMan.FieldByName('RxMemoryDataManALL_NUMBER').Value    := DataSetMan.FieldByName('R_ALL_NUMBER').AsString;
        RxMemoryDataMan.FieldByName('RxMemoryDataManFIO').Value           := DataSetMan.FieldByName('R_FIO').AsString;
        RxMemoryDataMan.FieldByName('RxMemoryDataManPRIH_RAS').Value      := DataSetMan.FieldByName('R_PRIH_RAS').AsInteger;
        RxMemoryDataMan.FieldByName('CHECK_RECORD').Value                 := 0;
        RxMemoryDataMan.Post;
        DataSetMan.Next;
    end;

    Transaction.StartTransaction;

end;

procedure TfrmAvanceAddMan.cxGridRaznoskkaDBTableView1DBColumn4PropertiesChange(
  Sender: TObject);
begin
   // if  cxGridRaznoskkaDBTableView1DBColumn4.
end;

procedure TfrmAvanceAddMan.cxGridRaznoskkaClick(Sender: TObject);
begin
    CellSelect(sender);;
end;

procedure TfrmAvanceAddMan.CellSelect(Sender: TObject);
var
    i : integer;
    s : Currency;
    id_reestr_man : int64;
begin
    if not RxMemoryDataMan.IsEmpty then
    begin
        if RxMemoryDataMan.FieldByName('check_record').AsInteger = 1 then
        begin
            Transaction.StartTransaction;
            try
              StoredProc.StoredProcName := 'J4_REESTR_MONTH_MAN_DEL_BY_AO';

              StoredProc.Prepare;
              StoredProc.ParamByName('id_ao').AsInt64               := RxMemoryDataMan.FieldByName('RxMemoryDataManID_AO').Value;

              StoredProc.ExecProc;
              Transaction.Commit;
              RxMemoryDataMan.Edit;
              RxMemoryDataMan.FieldByName('check_record').AsInteger := 0;
              RxMemoryDataMan.Post;
              myform.ActionRefreshExecute(Sender);
             // myform.DataSetMainReestr.Locate('id_reestr_month_man', id_reestr_man, []);
            except
              begin
                Transaction.Rollback;
                Showmessage('При додаванні виникла помилка');
                exit;
              end;
            end;

        end else
        begin

            Transaction.StartTransaction;
            try
              StoredProc.StoredProcName := 'J4_REESTR_MONTH_MAN_INS';

              StoredProc.Prepare;
              StoredProc.ParamByName('id_reestr_month').AsInteger    := myform.DataSetMainReestr['id_reestr_month'];
              StoredProc.ParamByName('id_ao').AsInt64                := RxMemoryDataMan.FieldByName('RxMemoryDataManID_AO').Value;

              StoredProc.ExecProc;
              id_reestr_man                                         := StoredProc.ParamByName('id_reestr_month_man').value;
              Transaction.Commit;
              RxMemoryDataMan.Edit;
              RxMemoryDataMan.FieldByName('check_record').AsInteger := 1;
              RxMemoryDataMan.Post;
              myform.ActionRefreshExecute(Sender);
              myform.DataSetMainReestr.Locate('id_reestr_month', myform.DataSetMainReestr['id_reestr_month'], []);
              myform.DataSetMan.Locate('id_reestr_month_man', id_reestr_man, []);
             // close;
            except
              begin
                Transaction.Rollback;
                Showmessage('При додаванні виникла помилка');
                exit;
              end;
            end;
        end;
    end;
end;

procedure TfrmAvanceAddMan.cxGridRaznoskkaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
     CellSelect(Sender);
end;

procedure TfrmAvanceAddMan.cxGridRaznoskkaDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
 { Arect:=AViewInfo.Bounds;
  if (AViewInfo.GridRecord.Values[4]=1) then
  begin //подписанные пачки
      ACanvas.Canvas.Font.color := RGB(250,0,0);//zelenii
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end; }
end;

procedure TfrmAvanceAddMan.dxBarLargeButton2Click(Sender: TObject);
begin
     close;
end;

end.
