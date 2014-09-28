unit BankSelectDocProvVstrech;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView,
  ActnList, ImgList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxLabel, cxContainer, cxTextEdit, ExtCtrls, dxBar, dxBarExtItems, BankOrder,
  StdCtrls, cxMemo, cxCurrencyEdit, Placemnt;

type
  TProvod = record
  kod_dog         : Int64;
  id_dog          : Int64;
  summa_doc       : double;
  summa_prov      : double;
  num_doc         : string;
  date_doc        : string;
  id_doc          : int64;
  id_prov         : int64;
  note            : string;
  date_prov       : string;
  id_type_doc     : int64;
  IDSmeta         : int64;
  IDRazd          : int64;
  IDStat          : int64;
  id_Kekv         : int64;
  nameSmeta       : string[180];
  nameRazd        : string[180];
  nameState       : string[180];
  nameKekv        : string[180];
  kodSmeta        : integer;
  kodRazd         : integer;
  kodState        : integer;
  kodKekv         : integer;
  id_man          : int64;
  id_sch          : int64;
  kod_sch         : string;
  title_sch       : string;
  id_payer        : int64;
  id_valute       : int64;
  summa_valute    : double;
 end;

 TSelectVstrech = record
  ModalResult     : integer;
  res : array of TProvod;
 end;


  TfmBankSelectDocProvVstrech = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    ImageList: TImageList;
    ActionList: TActionList;
    ActionRefresh: TAction;
    ActionExit: TAction;
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
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    Database: TpFIBDatabase;
    TransactionRead: TpFIBTransaction;
    Panel1: TPanel;
    cxTextEditSumma: TcxTextEdit;
    cxLabel1: TcxLabel;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    ActionTake: TAction;
    DataSetID_DOC: TFIBStringField;
    DataSetID_PROV: TFIBStringField;
    DataSetDOC_DATE: TFIBDateField;
    DataSetDOC_NUM: TFIBStringField;
    DataSetID_DOC_TYPE: TFIBBCDField;
    DataSetID_DOC_TYPE_V: TFIBStringField;
    DataSetDATE_REG: TFIBDateField;
    DataSetSUMMA_DOC: TFIBBCDField;
    DataSetSUMMA_PROV: TFIBBCDField;
    DataSetCOMMENT: TFIBStringField;
    DataSetID_SM_GR: TFIBBCDField;
    DataSetID_SM: TFIBBCDField;
    DataSetID_RZ: TFIBBCDField;
    DataSetID_ST: TFIBBCDField;
    DataSetID_KV: TFIBBCDField;
    DataSetSM_GR_KOD: TFIBIntegerField;
    DataSetSM_KOD: TFIBIntegerField;
    DataSetRZ_KOD: TFIBIntegerField;
    DataSetST_KOD: TFIBIntegerField;
    DataSetKV_KOD: TFIBIntegerField;
    DataSetSM_GR_V: TFIBStringField;
    DataSetSM_V: TFIBStringField;
    DataSetRZ_V: TFIBStringField;
    DataSetST_V: TFIBStringField;
    DataSetKV_V: TFIBStringField;
    DataSetCR_BY_DT: TFIBIntegerField;
    DataSetID_DOG: TFIBStringField;
    DataSetKOD_DOG: TFIBStringField;
    DataSetKR_ID_DOG: TFIBStringField;
    DataSetKR_KOD_DOG: TFIBStringField;
    DataSetDB_ID_DOG: TFIBStringField;
    DataSetDB_KOD_DOG: TFIBStringField;
    DataSetID_MEN: TFIBBCDField;
    DataSetID_PAYER: TFIBBCDField;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    DataSetKorInfo: TpFIBDataSet;
    cxTextEdit1: TcxTextEdit;
    cxMemo1: TcxMemo;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    FormStorage1: TFormStorage;
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1SelectionChanged(
      Sender: TcxCustomGridTableView);
    procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    TT : TSelectVstrech;
    flag : boolean;
    myform : TfmBankOrder;
    id_s_k : int64;
    kod_k, title_k : string;
  public
    { Public declarations }
  end;

function Show_select_vstrech(osn_sch, kor_sch : int64; mform : TfmBankOrder; date_v : string) : TSelectVstrech;

implementation
uses Un_R_file_Alex, Un_func_file_Alex;

{$R *.dfm}

function Show_select_vstrech(osn_sch, kor_sch : int64; mform : TfmBankOrder; date_v : string) : TSelectVstrech;
Var
    T : TfmBankSelectDocProvVstrech;
begin
    T := TfmBankSelectDocProvVstrech.Create(mform.Owner);
    T.myform                          := mform;

    T.Database.Handle                 := T.myform.Class_Database.Handle;
//    T.Database.DefaultTransaction     := T.TransactionRead;
//    T.TransactionRead.DefaultDatabase := T.Database;
    T.DataSet.Database                := T.TransactionRead.DefaultDatabase;
    T.DataSet.Transaction             := T.TransactionRead;
    T.DataSetKorInfo.Database         := T.TransactionRead.DefaultDatabase;
    T.DataSetKorInfo.Transaction      := T.TransactionRead;
    T.TransactionRead.StartTransaction;

    T.DataSetKorInfo.Close;
    T.DataSetKorInfo.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO('''+date_v+''', '+IntToStr(kor_sch)+')';
    T.DataSetKorInfo.Open;
    if T.DataSetKorInfo.RecordCount = 1 then
    begin
        T.id_s_k  := kor_sch;
        T.kod_k   := T.DataSetKorInfo.FieldByName('SCH_NUMBER').AsString;
        T.title_k := T.DataSetKorInfo.FieldByName('SCH_TITLE').AsString;
    end;
    T.DataSetKorInfo.Close;

    T.DataSet.Close;
    if T.myform.prih = 1
        then T.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_FACED_INFO_FOR_SCH('+IntToStr(osn_sch)+', '+IntToStr(kor_sch)+', '''+date_v+''')'
        else T.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_FACED_INFO_FOR_SCH('+IntToStr(kor_sch)+', '+IntToStr(osn_sch)+', '''+date_v+''')';
    T.DataSet.Open;
    T.cxGrid1DBBandedTableView1.Bands.Items[0].Caption  := Un_R_file_Alex.BANK_DANNIE_PO_DOC;
    T.cxGrid1DBBandedTableView1.Bands.Items[1].Caption  := Un_R_file_Alex.BANK_DANNIE_PO_PROV;
    T.cxGrid1DBBandedTableView1DBBandedColumn1.Caption  := Un_R_file_Alex.BANK_DATE_DOCUMENT;
    T.cxGrid1DBBandedTableView1DBBandedColumn2.Caption  := Un_R_file_Alex.BANK_NUM_DOCUMENT;
    T.cxGrid1DBBandedTableView1DBBandedColumn3.Caption  := Un_R_file_Alex.KASSA_SUMMA;
    T.cxGrid1DBBandedTableView1DBBandedColumn4.Caption  := Un_R_file_Alex.BANK_NOTE;
    T.cxGrid1DBBandedTableView1DBBandedColumn5.Caption  := Un_R_file_Alex.KASSA_SMETA;
    T.cxGrid1DBBandedTableView1DBBandedColumn6.Caption  := Un_R_file_Alex.KASSA_RAZD;
    T.cxGrid1DBBandedTableView1DBBandedColumn7.Caption  := Un_R_file_Alex.KASSA_STAT;
    T.cxGrid1DBBandedTableView1DBBandedColumn8.Caption  := Un_R_file_Alex.KASSA_KEKV;
    T.cxGrid1DBBandedTableView1DBBandedColumn9.Caption  := Un_R_file_Alex.KASSA_ADD_PROVODKA_SUMMA_PROV;
    T.Caption                                           := Un_R_file_Alex.BANK_SELECT_VSTRECH_CAPTION;
    T.cxLabel1.Caption                                  := Un_R_file_Alex.BANK_SELECT_VSTRECH_ALL_SUM;
    T.cxLabel2.Caption                                  := Un_R_file_Alex.KASSA_SUMMA;
    T.cxLabel3.Caption                                  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    T.ActionRefresh.Caption                             := Un_R_file_Alex. MY_ACTION_REFRESH_CONST;
    T.ActionExit.Caption                                := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
    T.ActionTake.Caption                                := Un_R_file_Alex.MY_ACTION_CHOOSE_CONST;

    T.flag := false;
    if T.ShowModal = mrOk then
    begin
        result := T.TT;
    end else
    begin
        result := T.TT;
    end;
    T.Database.Handle := nil;
    T.Free;
end;

procedure TfmBankSelectDocProvVstrech.ActionExitExecute(Sender: TObject);
begin
    TT.ModalResult := 0;
    Close;
end;

procedure TfmBankSelectDocProvVstrech.ActionTakeExecute(Sender: TObject);
var
    count, k : integer;
begin
  if flag then
  begin
    count := cxGrid1DBBandedTableView1.DataController.GetSelectedCount;
    TT.ModalResult := 1;
    SetLength(TT.res, count);
    for k := 0 to count-1 do
    begin
        DataSet.Locate('ID_PROV', cxGrid1DBBandedTableView1.DataController.GetRecordId(cxGrid1DBBandedTableView1.Controller.SelectedRecords[k].RecordIndex),[]);
        if myform.prih = 1 then
        begin
            if DataSet.FieldByName('DB_KOD_DOG').AsString <> ''
                then TT.res[k].kod_dog            := StrToInt64(DataSet.FieldByName('DB_KOD_DOG').AsString)
                else TT.res[k].kod_dog            := 0;
            if DataSet.FieldByName('DB_ID_DOG').AsString <> ''
                then TT.res[k].id_dog             := StrToInt64(DataSet.FieldByName('DB_ID_DOG').AsString)
                else TT.res[k].id_dog             := 0;
        end else
        begin
            if DataSet.FieldByName('KR_KOD_DOG').AsString <> ''
                then TT.res[k].kod_dog            := StrToInt64(DataSet.FieldByName('KR_KOD_DOG').asString)
                else TT.res[k].kod_dog            := 0;
            if DataSet.FieldByName('KR_ID_DOG').AsString <> ''
                then TT.res[k].id_dog             := StrToInt64(DataSet.FieldByName('KR_ID_DOG').AsString)
                else TT.res[k].id_dog             := 0;
        end;
        TT.res[k].summa_doc          := DataSet.FieldByName('SUMMA_DOC').AsFloat;
        TT.res[k].summa_prov         := DataSet.FieldByName('SUMMA_PROV').AsFloat;
        TT.res[k].num_doc            := DataSet.FieldByName('DOC_NUM').AsString;
        TT.res[k].date_doc           := DataSet.FieldByName('DOC_DATE').AsString;
        TT.res[k].id_doc             := StrToInt64(DataSet.FieldByName('ID_DOC').AsString);
        TT.res[k].id_prov            := StrToInt64(DataSet.FieldByName('ID_PROV').AsString);
        TT.res[k].note               := DataSet.FieldByName('COMMENT').AsString;
        TT.res[k].date_prov          := DataSet.FieldByName('DATE_REG').AsString;
        TT.res[k].id_type_doc        := TFIBBCDField(DataSet.FieldByName('ID_DOC_TYPE')).asInt64;
        TT.res[k].IDSmeta            := TFIBBCDField(DataSet.FieldByName('ID_SM')).asInt64;
        TT.res[k].IDRazd             := TFIBBCDField(DataSet.FieldByName('ID_RZ')).asInt64;
        TT.res[k].IDStat             := TFIBBCDField(DataSet.FieldByName('ID_ST')).asInt64;
        TT.res[k].id_Kekv            := TFIBBCDField(DataSet.FieldByName('ID_KV')).asInt64;
        TT.res[k].nameSmeta          := DataSet.FieldByName('SM_V').AsString;
        TT.res[k].nameRazd           := DataSet.FieldByName('RZ_V').AsString;
        TT.res[k].nameState          := DataSet.FieldByName('ST_V').AsString;
        TT.res[k].nameKekv           := DataSet.FieldByName('KV_V').AsString;
        TT.res[k].kodSmeta           := DataSet.FieldByName('SM_KOD').AsInteger;
        TT.res[k].kodRazd            := DataSet.FieldByName('RZ_KOD').AsInteger;
        TT.res[k].kodState           := DataSet.FieldByName('ST_KOD').AsInteger;
        TT.res[k].kodKekv            := DataSet.FieldByName('KV_KOD').AsInteger;
        TT.res[k].id_man             := TFIBBCDField(DataSet.FieldByName('ID_MEN')).asInt64;
        TT.res[k].id_sch             := id_s_k;
        TT.res[k].kod_sch            := kod_k;
        TT.res[k].title_sch          := title_k;
        TT.res[k].id_payer           := TFIBBCDField(DataSet.FieldByName('ID_PAYER')).asInt64;
        TT.res[k].id_valute          := 0;//TFIBBCDField(DataSet.FieldByName('')).asInt64;
        TT.res[k].summa_valute       := 0;//DataSet.FieldByName('').AsFloat;
    end;
    ModalResult := mrOK;
  end;
end;

procedure TfmBankSelectDocProvVstrech.cxGrid1DBBandedTableView1SelectionChanged(
  Sender: TcxCustomGridTableView);
var
    count, k : integer;
    s : double;
    pr : integer;
begin
    count := cxGrid1DBBandedTableView1.DataController.GetSelectedCount;
    s := 0;
    for k := 0 to count-1 do
    begin
        DataSet.Locate('ID_PROV', cxGrid1DBBandedTableView1.DataController.GetRecordId(cxGrid1DBBandedTableView1.Controller.SelectedRecords[k].RecordIndex),[]);
        s := s + DataSet.FieldByName('SUMMA_PROV').AsFloat;
    end;
    pr := 1;
    cxTextEditSumma.Text := AddNol(FloatToStr(s), pr);
    if (pr = -1) then
    begin
        ShowMessage(Un_R_file_Alex.MY_ERROR_SUMMA_LENGTH);
        flag := false;
    end else
    begin
        flag := true;
    end;
end;

procedure TfmBankSelectDocProvVstrech.cxGrid1DBBandedTableView1DblClick(
  Sender: TObject);
begin
    ActionTakeExecute(Sender);
end;

procedure TfmBankSelectDocProvVstrech.cxGrid1DBBandedTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = VK_SPACE then
    begin
//        SendMessage(handle, )
//        cxGrid1DBBandedTableView1.Controller.GoToNext(False);
    end;
end;

procedure TfmBankSelectDocProvVstrech.FormCreate(Sender: TObject);
begin
     FormStorage1.RestoreFormPlacement;
end;

procedure TfmBankSelectDocProvVstrech.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FormStorage1.SaveFormPlacement; 
end;

end.

