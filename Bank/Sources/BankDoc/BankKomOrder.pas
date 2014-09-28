unit BankKomOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BankOrder, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxGridTableView, ImgList, RxMemDS, ExtCtrls,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls, cxMemo,
  cxDropDownEdit, cxMRUEdit, cxMaskEdit, cxCalendar, cxContainer, cxLabel,
  ActnList, cxCurrencyEdit;

type
  TfmBankKomOrder = class(TForm)
    cxLabel1: TcxLabel;
    cxTextEditNum: TcxTextEdit;
    cxLabel3: TcxLabel;
    DateTimePicker1: TDateTimePicker;
    cxLabel4: TcxLabel;
    cxLabel13: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxMRUEditFio: TcxMRUEdit;
    cxLabel7: TcxLabel;
    cxMemo1: TcxMemo;
    cxLabel14: TcxLabel;
    cxTextEditSumma: TcxTextEdit;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    cxGridSaveAll: TcxGrid;
    cxGridSaveAllDBTableView1: TcxGridDBTableView;
    cxGridSaveAllDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridSaveAllDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridSaveAllLevel1: TcxGridLevel;
    TabSheet1: TTabSheet;
    cxSplitter1: TcxSplitter;
    Panel3: TPanel;
    cxGridDog: TcxGrid;
    cxGridDogDBTableView1: TcxGridDBTableView;
    cxGridDogDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDogDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDogDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDogDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDogLevel1: TcxGridLevel;
    Panel5: TPanel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    Panel6: TPanel;
    cxGridPodDog: TcxGrid;
    cxGridPodDogDBTableView1: TcxGridDBTableView;
    cxGridPodDogDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridPodDogDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridPodDogDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridPodDogDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridPodDogLevel1: TcxGridLevel;
    Panel7: TPanel;
    cxTextEditSmet: TcxTextEdit;
    cxLabel2: TcxLabel;
    DataSourceDog: TDataSource;
    RxMemoryDataDog: TRxMemoryData;
    ImageList1: TImageList;
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
    RxMemoryDataSaveAll: TRxMemoryData;
    DataSourceSaveAll: TDataSource;
    RxMemoryDataPodDog: TRxMemoryData;
    DataSourcePodDog: TDataSource;
    cxButtonClose: TcxButton;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionClose: TAction;
    ActionSaveAll: TAction;
    ActionChangeDog: TAction;
    ActionShowKom: TAction;
    procedure RxMemoryDataPodDogAfterScroll(DataSet: TDataSet);
    procedure RxMemoryDataSaveAllAfterScroll(DataSet: TDataSet);
    procedure ActionCloseExecute(Sender: TObject);
    procedure RxMemoryDataDogAfterScroll(DataSet: TDataSet);
  private
    myform : TfmBankOrder;
  public
    { Public declarations }
  end;

function ShowKomOrder(m : TfmBankOrder) : boolean;

implementation
uses Un_R_file_Alex;

{$R *.dfm}

function ShowKomOrder(m : TfmBankOrder) : boolean;
var
    T : TfmBankKomOrder;
    flag_na_exists_dog : boolean;
begin
    T := TfmBankKomOrder.Create(nil);
    T.myform := m;
    T.cxGridSaveAllDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_KREDIT;
    T.cxGridSaveAllDBTableView1DBColumn7.Caption := Un_R_file_Alex.KASSA_SCH_KORESPOND;
    T.cxLabel1.Caption  := Un_R_file_Alex.BANK_DOC_ORDER_RASH_KAS_ORD;
    T.CAPTION           := Un_R_file_Alex.BANK_ORDER+ ' ( ' + Un_R_file_Alex.BANK_KOMIS + ' )';
    T.cxLabel3.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    T.cxLabel13.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_FROM;
    T.cxLabel7.Caption  := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    T.cxLabel14.Caption := Un_R_file_Alex.KASSA_DOC_ORDER_SUMMA_ALL;
    T.cxLabel6.Caption  := Un_R_file_Alex.BANK_PRINYATO_OT;
    T.cxGridSaveAllDBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    T.cxGridSaveAllDBTableView1DBColumn5.Caption := Un_R_file_Alex.J4_NAME_SMETA;
    T.cxGridSaveAllDBTableView1DBColumn6.Caption := Un_R_file_Alex.KASSA_SUMMA;
    T.cxGridDogDBTableView1DBColumn1.Caption     := Un_R_file_Alex.BANK_DOGOVOR;
    T.cxGridDogDBTableView1DBColumn2.Caption     := Un_R_file_Alex.BANK_NAME_CUSTMERA;
    T.cxGridDogDBTableView1DBColumn3.Caption     := Un_R_file_Alex.BANK_DATE_DOG;
    T.cxGridDogDBTableView1DBColumn4.Caption     := Un_R_file_Alex.KASSA_SUMMA;
    T.cxGridPodDogDBTableView1DBColumn1.Caption  := Un_R_file_Alex.KASSA_KOD_S_R_S_K;
    T.cxGridPodDogDBTableView1DBColumn2.Caption  := Un_R_file_Alex.KASSA_DEBET;
    T.cxGridPodDogDBTableView1DBColumn4.Caption  := Un_R_file_Alex.KASSA_SCH_KORESPOND;
    T.cxGridPodDogDBTableView1DBColumn3.Caption  := Un_R_file_Alex.KASSA_SUMMA;
    T.ActionClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    T.PageControl1.Pages[0].Caption := Un_R_file_Alex.KASSA_DOC_ORDER_BUHG_PROVODKI;
    T.PageControl1.Pages[1].Caption := Un_R_file_Alex.BANK_RAZB_PO_DOG;
    T.cxLabel2.Caption    := Un_R_file_Alex.J4_NAME_SMETA;
    T.cxLabel8.Caption    := Un_R_file_Alex.BANK_TYPE_DOGOVOR;
    T.cxLabel9.Caption    := Un_R_file_Alex.KASSA_REG_NUM;
    T.cxMemo1.Enabled          := false;
    T.cxTextEditSumma.Enabled  := false;
    T.cxTextEditNum.Enabled    := false;
    T.cxMRUEditFio.Enabled     := false;
    T.cxDateEdit2.Date          := T.myform.cxDateEdit2.Date;

    T.cxTextEditNum.Text     := T.myform.cxTextEditNum.Text;
    T.cxMRUEditFio.Text      := T.myform.TRec.name_cust;
    T.cxTextEditSumma.Text   := FloatToStr(T.myform.TRec.summa_doc);
    T.cxMemo1.Text           := T.myform.TRec.note;
    T.DateTimePicker1.DateTime  := T.myform.TRec.date_vip;
    T.cxDateEdit2.Date          := T.myform.TRec.date_vip;

    T.myform.RxKomis.First;
    while not T.myform.RxKomis.Eof do
    begin
        T.RxMemoryDataSaveAll.Open;
        T.RxMemoryDataSaveAll.Insert;
//        T.RxMemoryDataSaveAll := T.myform.RxMemoryDataSaveAll;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value      := T.myform.RxKomis.FieldByName('RxMemDat_summa').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value       := T.myform.RxKomis.FieldByName('RxMemDatid_sm').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value     := T.myform.RxKomis.FieldByName('RxMemDatid_razd').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value       := T.myform.RxKomis.FieldByName('RxMemDatid_st').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value     := T.myform.RxKomis.FieldByName('RxMemDatid_kekv').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value      := T.myform.RxKomis.FieldByName('RxMemDatid_dog').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value     := T.myform.RxKomis.FieldByName('RxMemDatkod_dog').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value := T.myform.RxKomis.FieldByName('RxMemoryDataSaveAllKodSmeta').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value  := T.myform.RxKomis.FieldByName('RxMemoryDataSaveAllKodRazd').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value := T.myform.RxKomis.FieldByName('RxMemoryDataSaveAllKodState').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := T.myform.RxKomis.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value  := T.myform.RxKomis.FieldByName('RxMemoryDataSaveAllKodKekv').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value    := T.myform.RxKomis.FieldByName('RxMemDatNameStat').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value    := T.myform.RxKomis.FieldByName('RxMemDatNameRazd').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value   := T.myform.RxKomis.FieldByName('RxMemDatNameSmeta').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value    := T.myform.RxKomis.FieldByName('RxMemDatNameKekv').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value      := T.myform.RxKomis.FieldByName('RxMemDatid_man').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value      := T.myform.RxKomis.FieldByName('RxMemDatid_sch').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value := T.myform.RxKomis.FieldByName('RxMemDatsumma_value').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value    := T.myform.RxKomis.FieldByName('RxMemDatid_value').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value     := T.myform.RxKomis.FieldByName('RxMemDatNameSch').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value         := T.myform.RxKomis.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value           := T.myform.RxKomis.FieldByName('RxMemDatname_korespond').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value   := T.myform.RxKomis.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value      := T.myform.RxKomis.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value      := T.myform.RxKomis.FieldByName('RxMemoryDataSaveAllTitleSch').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value := T.myform.RxKomis.FieldByName('RxMemoryDataDogFieldNameCust').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value  := T.myform.RxKomis.FieldByName('RxMemoryDataDogFielddateDog').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value  := T.myform.RxKomis.FieldByName('RxMemoryDataDogFieldTypeDog').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value   := T.myform.RxKomis.FieldByName('RxMemoryDataDogFieldRegDog').Value;
        T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value   := T.myform.RxKomis.FieldByName('RxMemoryDataDogFieldNumDog').Value;
        T.RxMemoryDataSaveAll.Post;
        T.myform.RxKomis.Next;
    end;

    T.RxMemoryDataSaveAll.First;
    while not T.RxMemoryDataSaveAll.Eof do
    begin
        //занос в договора
        flag_na_exists_dog := false;
        T.RxMemoryDataDog.First;
        While not T.RxMemoryDataDog.Eof do
        begin
            if (T.RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant = T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value) and
               (T.RxMemoryDataDog.FieldByName('RxMemDatkod_dog').AsString = T.RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value)
                then flag_na_exists_dog := true;
            T.RxMemoryDataDog.Next;
        end;
        if not flag_na_exists_dog then
        begin
            T.RxMemoryDataDog.Open;
            T.RxMemoryDataDog.Insert;
            T.RxMemoryDataDog.FieldByName('RxMemDat_summa').Value      := T.RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatid_sm').Value       := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatid_razd').Value     := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatid_st').Value       := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatid_kekv').Value     := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatid_dog').Value      := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatkod_dog').Value     := T.RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value     := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodState').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value     := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatid_man').Value      := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatid_sch').Value      := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatsumma_value').Value := T.RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatid_value').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatNameSch').Value     := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatNameStat').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatNameRazd').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatNameSmeta').Value   := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatNameKekv').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleKorSch').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value       := T.RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
            T.RxMemoryDataDog.FieldByName('RxMemDatname_korespond').Value         := T.RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNameCust').Value   := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldDateDog').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFielddateDog').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldTypeDog').Value    := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldRegDog').Value     := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').Value;
            T.RxMemoryDataDog.FieldByName('RxMemoryDataDogFieldNumDog').Value     := T.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNumDog').Value;
            T.RxMemoryDataDog.Post;
        end;
        T.RxMemoryDataSaveAll.Next;
    end;



    if T.ShowModal=mrOk then
    begin
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;

procedure TfmBankKomOrder.RxMemoryDataPodDogAfterScroll(DataSet: TDataSet);
begin
    cxTextEditSmet.Text := RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').AsString;
end;

procedure TfmBankKomOrder.RxMemoryDataSaveAllAfterScroll(
  DataSet: TDataSet);
begin
    cxTextEdit1.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldTypeDog').AsString;
    cxTextEdit2.Text := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldRegNum').AsString;
end;

procedure TfmBankKomOrder.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankKomOrder.RxMemoryDataDogAfterScroll(DataSet: TDataSet);
begin
    RxMemoryDataPodDog.EmptyTable;
    if not RxMemoryDataDog.isEmpty then
    begin
        RxMemoryDataSaveAll.First;
        while not RxMemoryDataSaveAll.eof do
        begin
            if (RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').AsVariant = RxMemoryDataDog.FieldByName('RxMemDatid_dog').AsVariant) and
               (RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').asString = RxMemoryDataDog.FieldByName('RxMemDatkod_dog').asString) then
            begin
                RxMemoryDataPodDog.Open;
                RxMemoryDataPodDog.Insert;
                RxMemoryDataPodDog.FieldByName('RxMemDat_summa').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_sm').Value                := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sm').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_razd').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_st').Value                := RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_kekv').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_dog').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatkod_dog').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodSmeta').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodSmeta').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodRazd').Value   := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodRazd').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodState').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodState').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllKodKekv').Value   := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllKodKekv').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_man').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_sch').Value               := RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatsumma_value').Value          := RxMemoryDataSaveAll.FieldByName('RxMemDatsumma_value').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatid_value').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatid_value').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameSch').Value              := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSch').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameStat').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatNameStat').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameRazd').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatNameRazd').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameSmeta').Value            := RxMemoryDataSaveAll.FieldByName('RxMemDatNameSmeta').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatNameKekv').Value             := RxMemoryDataSaveAll.FieldByName('RxMemDatNameKekv').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatID_SCH_KORESPOND').Value     := RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Value;
                RxMemoryDataPodDog.FieldByName('RxMemDatname_korespond').Value       := RxMemoryDataSaveAll.FieldByName('RxMemDatname_korespond').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAll_ID_PROV').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataSaveAllTitleSch').Value  := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllTitleSch').Value;
                RxMemoryDataPodDog.FieldByName('RxMemoryDataDogFieldNameCust').Value := RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllFieldNameCust').Value;
                RxMemoryDataPodDog.Post;
            end;
            RxMemoryDataSaveAll.Next;
        end;
    end
end;

end.
