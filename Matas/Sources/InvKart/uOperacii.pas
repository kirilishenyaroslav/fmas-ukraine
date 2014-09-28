{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uOperacii;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, 
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxButtonEdit, cxCalendar, Ibase, GlobalSpr, ClassInvKart, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxSplitter, Kernel, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Grids, RxMemDS, ActnList, cxCurrencyEdit,
  ComCtrls, cxCheckBox,  uMatasVars, uMatasUtils, DateUtils, MainInvKartForm, uResources;

type
  TfmOperacion = class(TForm)
    cxTextEditVid_oper: TcxTextEdit;
    LabelTip_oper: TLabel;
    cxButtonEditMOL_old: TcxButtonEdit;
    cxButtonEditSch_old: TcxButtonEdit;
    cxTextEditOst_price: TcxTextEdit;
    cxDateEditDate_doc: TcxDateEdit;
    cxTextEditDoc_num: TcxTextEdit;
    LabelFIO_MOL: TLabel;
    LabelSch: TLabel;
    LabelOst_price: TLabel;
    LabelNum_doc: TLabel;
    Labeldate_doc: TLabel;
    cxTextEditOst_izn: TcxTextEdit;
    LabelOst_iznos: TLabel;
    cxTextEditSumma: TcxTextEdit;
    cxTextEditIznos: TcxTextEdit;
    LabelSumma: TLabel;
    LabelIznos: TLabel;
    ErrorDataSet: TpFIBDataSet;
    WorkDataSet: TpFIBDataSet;
    OperProvDataSet: TpFIBDataSet;
    OperExProvDataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    DocDataSet: TpFIBDataSet;
    DocDataSetR_ID_KART: TFIBBCDField;
    DocDataSetTIP_KRT: TFIBStringField;
    DocDataSetGRP_NUM: TFIBStringField;
    DocDataSetINV_NUM: TFIBIntegerField;
    DocDataSetKART_NUM: TFIBIntegerField;
    DocDataSetBEG_PRICE: TFIBBCDField;
    DocDataSetBEG_IZNOS: TFIBBCDField;
    DocDataSetOST_PRICE: TFIBBCDField;
    DocDataSetOST_IZNOS: TFIBBCDField;
    DocDataSetDATE_OST: TFIBDateField;
    DocDataSetDATE_OPR: TFIBDateField;
    DocDataSetID_OPER_OPR: TFIBBCDField;
    DocDataSetDATE_EXPL: TFIBDateField;
    DocDataSetID_OPER_EXPL: TFIBBCDField;
    DocDataSetDATE_UPDATE: TFIBDateField;
    DocDataSetID_OPER_UPDATE: TFIBBCDField;
    DocDataSetDATE_OUT: TFIBDateField;
    DocDataSetID_OPER_OUT: TFIBBCDField;
    DocDataSetZAV_NUM: TFIBStringField;
    DocDataSetPASS_NUM: TFIBStringField;
    DocDataSetMODEL: TFIBStringField;
    DocDataSetMARK: TFIBStringField;
    DocDataSetDATE_CREATE: TFIBDateField;
    DocDataSetID_CUST: TFIBBCDField;
    DocDataSetDOC_REG: TFIBStringField;
    DocDataSetDATE_REG: TFIBDateField;
    DocDataSetNOTE: TFIBStringField;
    DocDataSetNAME_NORM: TFIBStringField;
    DocDataSetAMORT_PERC: TFIBFloatField;
    DocDataSetMIN_PRICE: TFIBBCDField;
    DocDataSetMETHOD_NAME: TFIBStringField;
    DocDataSetNORM_TIP: TFIBSmallIntField;
    DocDataSetNORM_FORMULA: TFIBStringField;
    DocDataSetBUH_DB_SCH: TFIBBCDField;
    DocDataSetBUH_KR_SCH: TFIBBCDField;
    DocDataSetNORM_YEAR: TFIBSmallIntField;
    DocDataSetNORM_MONTH: TFIBSmallIntField;
    DocDataSetNORM_ID: TFIBBCDField;
    DocDataSetNORM_PER_PERIOD: TFIBSmallIntField;
    DocDataSetIS_NALOG_ACC: TFIBSmallIntField;
    DocDataSetNAL_NAME_NORM: TFIBStringField;
    DocDataSetNAL_AMORT_PERC: TFIBFloatField;
    DocDataSetNAL_MIN_PRICE: TFIBBCDField;
    DocDataSetNAL_METHOD_NAME: TFIBStringField;
    DocDataSetNAL_NORM_TIP: TFIBSmallIntField;
    DocDataSetNAL_NORM_FORMULA: TFIBStringField;
    DocDataSetNAL_DB_SCH: TFIBBCDField;
    DocDataSetNAL_KR_SCH: TFIBBCDField;
    DocDataSetNAL_NORM_YEAR: TFIBSmallIntField;
    DocDataSetNAL_NORM_MONTH: TFIBSmallIntField;
    DocDataSetNAL_NORM_ID: TFIBBCDField;
    DocDataSetNAL_NORM_PER_PERIOD: TFIBSmallIntField;
    DocDataSetID_BUH_DB: TFIBBCDField;
    DocDataSetID_BUH_KR: TFIBBCDField;
    DocDataSetID_NAL_DB: TFIBBCDField;
    DocDataSetID_NAL_KR: TFIBBCDField;
    DocDataSetID_METHD: TFIBBCDField;
    DocDataSetID_METHD_NAL: TFIBBCDField;
    DocDataSetMAIN_SCH_NUM: TFIBBCDField;
    DocDataSetFIO_MOL: TFIBStringField;
    DocDataSetMAIN_NOMN: TFIBStringField;
    DocDataSetDEPARTMENT: TFIBStringField;
    StoredProc: TpFIBStoredProc;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    cxButtonAdd: TcxButton;
    cxButtonCansel: TcxButton;
    cxButtonAddProv: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxButtonChange: TcxButton;
    RxMemoryData1: TRxMemoryData;
    DataSource1: TDataSource;
    cxButtonDel: TcxButton;
    ActionList1: TActionList;
    ActionDel: TAction;
    ActionChange: TAction;
    pFIBDataSetSel_sch: TpFIBDataSet;
    pFIBDataSetSel_schID_SCH: TFIBBCDField;
    RxMemoryData1Debet: TVariantField;
    RxMemoryData1Kredit: TVariantField;
    RxMemoryData1Summa: TCurrencyField;
    RxMemoryData1id_debet: TVariantField;
    RxMemoryData1id_kredit: TVariantField;
    StatusBar1: TStatusBar;
    Action1: TAction;
    Action_add_new_prov: TAction;
    cxTextEdit_koeff: TcxTextEdit;
    Labelkoeff: TLabel;
    cxTextEditSumma_pr: TcxTextEdit;
    cxTextEditSumma_izn: TcxTextEdit;
    LabelSumm_pr: TLabel;
    LabelSumma_izn: TLabel;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    RxMemoryData1db_id_sm: TIntegerField;
    RxMemoryData1db_sm: TStringField;
    RxMemoryData1db_id_rz: TIntegerField;
    RxMemoryData1db_rz: TStringField;
    RxMemoryData1db_id_st: TIntegerField;
    RxMemoryData1db_st: TStringField;
    RxMemoryData1db_id_kekv: TIntegerField;
    RxMemoryData1db_kekv: TStringField;
    RxMemoryData1kr_sm: TStringField;
    RxMemoryData1kr_rz: TStringField;
    RxMemoryData1kr_st: TStringField;
    RxMemoryData1kr_kekv: TStringField;
    RxMemoryData1kr_id_sm: TIntegerField;
    RxMemoryData1kr_id_rz: TIntegerField;
    RxMemoryData1kr_id_st: TIntegerField;
    RxMemoryData1kr_id_kekv: TIntegerField;
    RxMemoryData1id_doc: TIntegerField;
    LabelFullInv: TLabel;
    cxTextEditFullInv: TcxTextEdit;
    LabelOldMol: TLabel;
    cxTextEditMOLold: TcxTextEdit;
    cxTextEditNomnName: TcxTextEdit;
    LabelNomnName: TLabel;
    DataSetGridWatch: TpFIBDataSet;
    DataSourceContek: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    ForHaeder: TcxStyle;
    AfterSelection: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    DataSetGridWatchID_MO: TFIBBCDField;
    DataSetGridWatchFIO_MOL: TFIBStringField;
    DataSetGridWatchNAME_KART: TFIBStringField;
    DataSetGridWatchID_NOMNS: TFIBBCDField;
    DataSetGridWatchNUM_SCH: TFIBStringField;
    DataSetGridWatchID_SCHS: TFIBBCDField;
    DataSetGridWatchOST_PRICE: TFIBBCDField;
    DataSetGridWatchOST_IZNOS: TFIBBCDField;
    DataSetGridWatchFULL_INV: TFIBStringField;
    DataSetGridWatchSUMMA_OPER: TFIBBCDField;
    DataSetGridWatchID_KART: TFIBBCDField;
    DataSetGridWatchNUM_DOG: TFIBStringField;
    PushEnter: TAction;
    CheckBoxDookrugl: TCheckBox;
    cxButtonCalcul: TcxButton;
    procedure cxButtonCanselClick(Sender: TObject);
    procedure cxButtonEditMOL_oldPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEditOst_priceKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditOst_iznKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditSch_oldPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditIznosKeyPress(Sender: TObject; var Key: Char);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure cxButtonEditSch_oldKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditMOL_oldKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure Action_add_new_provExecute(Sender: TObject);
    procedure cxTextEditSumma_prExit(Sender: TObject);
    procedure cxTextEditSumma_iznExit(Sender: TObject);
    procedure cxTextEditSumma_prKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSumma_iznKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSumma_prKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTextEditSumma_iznKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTextEdit_koeffKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSummaExit(Sender: TObject);
    procedure PushEnterExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure CheckBoxDookruglClick(Sender: TObject);
    procedure cxButtonCalculClick(Sender: TObject);
  private
        DBHandle        : TISC_DB_HANDLE;
          STRU          : WIZARD_GET_PROV_INFO;
          PERIOD        : TDateTime;
          FlagNaAdd     : boolean;
          Kakaya_oper   : integer;
          myform        : TfmMainIvKartForm;
          id_kart       : int64;
          id_mo_old     : int64;
          id_mo_new     : int64;
          id_sch_old    : int64;
          id_sch_new    : int64;
          id_ost_in     : int64;
          id_nomn       : int64;
          beg_price     : string;
          ost_price_old : string;
          ost_iznos_old : string;
          ost_price_new : string;
          ost_iznos_new : string;
          iznos         : string;
          summa         : string;
          summa_mat_doc : string;
          summa_mat_tmp : string;
          summa_mat_oper:string;
          doc_rec       : string;
          id_oprih      : int64;
          id_debet      : int64;
          id_kredit     : int64;
          id_schet      : int64;
          deb           : string;
          kred          : string;
          main_sch      : string;
          ost_pr        : string;
          izn           : string;
          begpr         : string;
          id_sch_from   : int64;
          id_user       : int64;
          computer_name : string;
          user_name     : string;
          mul_sel       : string;
          ID_SESSION_PER: int64;
          OKR_KLIENT    : Integer;

          PID_DOC       : int64;

          look_1, look_2, look_3 : String;
          look_flag : Boolean;

          id_krt : String;

          long_pole : string;
          prap_flag, d : integer;
          zpt, zpt1 : string;

          db_smeta     : String;
          db_razdel    : String;
          db_statya    : String;
          db_kekv      : String;

          id_smeta     : int64;
          id_razdel    : int64;
          id_statya    : int64;
          id_kekv      : int64;
  public
        _BUH_FORM_UCH         : integer;
        _USE_TRANS_SCH_OUT_OS : int64;
        _ID_TRANS_SCH_OS      : int64;
        _ID_TRANS_SCH_IZN     : int64;
        PUB_ID_DOC            : int64;
       constructor Create(foma: TfmMainIvKartForm; Prapor : boolean; oper : integer; db, kr, sch : string; id_db, id_kr, id_sch : int64; ost_price, iznos, beg_pr : string; Period : TDateTime; multi_sel_look : String); reintroduce; overload;

  end;


implementation

uses uAddProv, uChangeInfoPereoc;

{$R *.dfm}

constructor TfmOperacion.Create(foma: TfmMainIvKartForm; Prapor: boolean; oper : integer; db, kr, sch : string; id_db, id_kr, id_sch : int64; ost_price, iznos, beg_pr : string; Period : TDateTime; multi_sel_look : String);
var
   i: integer;
   sexy : Currency;
begin
    inherited Create(nil);

    myform      := foma;
    FlagNaAdd   := Prapor;
    Kakaya_oper := oper;
    id_debet    := id_db;
    id_kredit   := id_kr;
    id_schet    := id_sch;
    deb         := db;
    kred        := kr;
    main_sch    := sch;
    ost_pr      := ost_price;
    izn         := iznos;
    begpr       := beg_pr;
    Period      := Period;
    mul_sel     := multi_sel_look;
    ID_SESSION_PER := StrToInt(multi_sel_look);
    DBHandle    := DBHandle;

    cxDateEditDate_doc.Date := EndOfTheMonth(_MATAS_PERIOD);//period; {Date; //}

    cxButtonCansel.Caption  := MAT_INV_Cansel;
    LabelTip_oper.caption   := MAT_INV_oper_Labl_oper;
    LabelFIO_MOL.Caption    := MAT_INV_new_MOL;
    LabelSch.Caption        := MAT_INV_SCH;
    LabelOst_price.Caption  := MAT_INV_Ost_price;
    LabelOst_iznos.Caption  := MAT_INV_Ost_Iznos;
    LabelNum_doc.Caption    := MAT_INV_oper_num_doc;
    Labeldate_doc.Caption   := MAT_INV_oper_date_doc;
    cxButtonAddProv.caption := MAT_INV_Add;
    cxButtonChange.Caption  := MAT_INV_Change;
    LabelSumma.Caption      := MAT_INV_obj_sum;
    StatusBar1.Panels[0].Text := MAT_INV_period_now +':'+ myform.DataSetKart.FieldByName('DOC_REC').Asstring;
    cxButtonDel.Caption     := MAT_INV_Delete;
    LabelSumm_pr.Caption    := MAT_INV_sum_osp_pr;
    LabelSumma_izn.Caption  := MAT_INV_sum_ost_izn;
    Labelkoeff.Caption      := MAT_INV_koef_pereoc;

    cxGrid1DBTableView1DBColumn1.Caption   := MAT_INV_SCH;
    cxGrid1DBTableView1DBColumn2.Caption   := MAT_INV_Inv_Num;
    cxGrid1DBTableView1DBColumn3.Caption   := MAT_INV_MOL;
    cxGrid1DBTableView1DBColumn4.Caption   := MAT_INV_Name;
    cxGrid1DBTableView1DBColumn5.Caption   := MAT_INV_Ost_price;
    cxGrid1DBTableView1DBColumn6.Caption   := MAT_INV_Ost_Iznos;
    cxGrid1DBTableView1DBColumn7.Caption   := MAT_INV_obj_sum;
    cxGrid1DBTableView1DBColumn8.Caption   := MAT_INV_oper_num_doc;

    LabelFullInv.Caption                 := MAT_INV_full_inv;
    LabelOldMol.Caption                  := MAT_INV_MOL;
    LabelNomnName.Caption                := MAT_INV_Name;

    cxTextEditFullInv.Text   := myform.DataSetKart.FieldByName('FULL_INV').AsString;
    cxTextEditNomnName.Text  := myform.DataSetKart.FieldByName('NAME_KART').AsString;
    cxTextEditMOLold.Text    := myform.DataSetKart.FieldByName('FIO_MOL').AsString;
    //cxDateEditDate_doc.date := date;
    id_kart                 := myform.DataSetOsn.FieldByName('R_ID_KART').AsVariant;
    id_mo_old               := myform.DataSetKart.FieldByName('ID_MANS').AsVariant;
    id_sch_old              := myform.DataSetKart.FieldByName('ID_SCHS').AsVariant;
    ost_price_old           := myform.DataSetOsn.FieldByName('OST_PRICE').Asstring;
    ost_iznos_old           := myform.DataSetOsn.FieldByName('OST_IZNOS').Asstring;
    cxButtonEditMOL_old.Text:= myform.DataSetKart.FieldByName('FIO_MOL').Asstring;
    cxButtonEditSch_old.Text:= myform.DataSetKart.FieldByName('NUM_SCH').Asstring;
    cxTextEditOst_price.Text:= myform.DataSetKart.FieldByName('OST_PRICE').Asstring;
    cxTextEditOst_izn.Text  := myform.DataSetOsn.FieldByName('OST_IZNOS').Asstring;
    id_ost_in               := myform.DataSetKart.FieldByName('ID_OST').AsVariant;
    id_nomn                 := myform.DataSetKart.FieldByName('ID_NOMNS').AsVariant;
    beg_price               := myform.DataSetKart.FieldByName('BAL_PRICE').Asstring;
    id_mo_new               := id_mo_old;
    id_sch_new              := id_sch_old;
    doc_rec                 := myform.DataSetKart.FieldByName('DOC_REC').Asstring;
    //**********  Определение полного инвентарного номера    ***********************
                try
                   StoredProc.Close;
                   StoredProc.Database    := myform.DatabaseMain;
                   StoredProc.Transaction := myform.WriteTransaction;
                   StoredProc.Transaction.StartTransaction;
                   StoredProc.StoredProcName:='MAT_INV_SEL_NUM_OPER';
                   StoredProc.Prepare;
                   StoredProc.ParamByName('TIP_OPER').AsInteger := Kakaya_oper;
                   StoredProc.ExecProc;
                   if StoredProc.ParamByName('MAX_NUM_OPER').AsString = '' then
                   begin
                       cxTextEditDoc_num.Text                       := '00001';
                   end else
                   begin
                       cxTextEditDoc_num.Text                       := StoredProc.ParamByName('MAX_NUM_OPER').AsString;
                   end;
                except on E : Exception do
                     begin
                         ShowMessage(E.Message);
                         StoredProc.Transaction.Rollback;
                         exit;
                     end;
                end;
                   StoredProc.Transaction.Commit;
           //**********  Конец этого действа   ********************************************


    If FlagNaAdd = true then
    begin
        Caption := MAT_INV_system_name + MAT_INV_oper_add;
        cxButtonAdd.Caption := MAT_INV_save;
        if Kakaya_oper = 1 then
        begin
            cxTextEditVid_oper.Text := MAT_INV_oper_opih;
            cxButtonEditMOL_old.Enabled := false;
            cxButtonEditSch_old.Enabled := false;
            cxTextEditOst_price.Enabled := false;
            cxTextEditOst_izn.Enabled   := false;
            cxTextEditIznos.Enabled     := false;
            cxTextEditSumma.Enabled     := false;

            //cxTextEditSumma.Text        := '0';
            //cxTextEditIznos.Text        := '0';

            cxButtonAddProv.Visible     := false;
            cxButtonChange.Visible      := false;
            cxButtonDel.Visible         := false;
            GroupBox1.Visible             := false;
            Height                      := 300;
        end;
        if Kakaya_oper = 2 then
        begin
            cxTextEditVid_oper.Text := MAT_INV_oper_perem;
            cxTextEditOst_price.Enabled := false;
            cxTextEditOst_izn.Enabled   := false;
            cxTextEditIznos.Enabled     := false;
            cxTextEditSumma.Enabled     := false;

            cxTextEditSumma.Text        := begpr;

            cxButtonAddProv.Visible     := false;
            cxButtonChange.Visible      := false;
            cxButtonDel.Visible         := false;
            GroupBox1.Visible             := false;
            Height                      := 300;
        end;
        if Kakaya_oper = 3 then
        begin
            cxTextEditVid_oper.Text := MAT_INV_oper_expl;
            cxButtonEditMOL_old.Enabled := true;
            cxButtonEditSch_old.Enabled := false;
            cxTextEditOst_price.Enabled := false;
            cxTextEditOst_izn.Enabled   := false;
            cxTextEditIznos.Enabled     := false;
            cxTextEditSumma.Enabled     := false;

            //cxTextEditSumma.Text        := '0';
            //cxTextEditIznos.Text        := '0';

            cxButtonAddProv.Visible     := false;
            cxButtonChange.Visible      := false;
            cxButtonDel.Visible         := false;
            GroupBox1.Visible             := false;
            Height                      := 300;
        end;

        if Kakaya_oper = 4 then
        begin
            cxTextEditVid_oper.Text := MAT_INV_oper_spis;
            cxButtonEditMOL_old.Enabled := false;
            cxButtonEditSch_old.Enabled := false;
            cxTextEditOst_price.Enabled := false;
            cxTextEditOst_izn.Enabled   := false;
            cxTextEditIznos.Enabled     := false;

            cxTextEditSumma.Enabled     := false;
            cxTextEditSumma.Text := CurrToStr(StrToCurr(ost_pr)+StrToCurr(izn));

            cxButtonAddProv.Visible     := false;
            cxButtonChange.Visible      := false;
            cxButtonDel.Visible         := false;
            GroupBox1.Visible             := false;
            Height                      := 300;
    end;
        if Kakaya_oper = 5 then
        begin
            cxTextEditVid_oper.Text := MAT_INV_Namoder;
            cxButtonEditMOL_old.Enabled := false;
            cxButtonEditSch_old.Enabled := false;
            cxTextEditOst_price.Enabled := false;
            cxTextEditOst_izn.Enabled   := false;
            cxTextEditIznos.Enabled     := false;
            cxTextEditSumma.Text        := begpr;

            cxButtonAddProv.Visible     := false;
            cxButtonChange.Visible      := false;
            cxButtonDel.Visible         := false;
            GroupBox1.Visible             := false;
            Height                      := 300;
        end;
        if Kakaya_oper = 6 then
        begin
            cxTextEditVid_oper.Text := MAT_INV_smoder;
            cxButtonEditMOL_old.Enabled := false;
            cxButtonEditSch_old.Enabled := false;
            cxTextEditOst_price.Enabled := false;
            cxTextEditOst_izn.Enabled   := false;
            cxTextEditIznos.Enabled     := false;
            cxTextEditSumma.Text        := begpr;

            cxButtonAddProv.Visible     := false;
            cxButtonChange.Visible      := false;
            cxButtonDel.Visible         := false;
            GroupBox1.Visible             := false;

            Height                      := 300;
        end;
       if Kakaya_oper = 7 then
        begin
            cxTextEditVid_oper.Text := MAT_INV_Pereoc;
            CheckBoxDookrugl.Caption    := MAT_INV_okrugl_doizn;
            CheckBoxDookrugl.Visible    := True;
            cxTextEditFullInv.Visible   := False;
            LabelFullInv.Visible        := False;
            LabelOldMol.Visible         := False;
            cxTextEditMOLold.Visible    := False;
            LabelNomnName.Visible       := False;
            cxTextEditNomnName.Visible  := False;
            LabelSch.Visible            := False;
            cxButtonEditSch_old.Visible := False;
            LabelFIO_MOL.Visible        := False;
            cxButtonEditMOL_old.Visible := False;
            LabelNum_doc.Visible        := False;
            cxTextEditDoc_num.Visible   := False;
            cxTextEditOst_price.Visible := False;
            LabelOst_price.Visible      := False;
            cxTextEditOst_izn.Visible   := False;
            LabelOst_iznos.Visible      := False;
            cxTextEditSumma.Visible     := False;
            LabelSumma.Visible          := False;
            cxTextEditSumma_pr.Visible  := False;
            LabelSumm_pr.Visible        := False;
            cxTextEditSumma_izn.Visible := False;
            LabelSumma_izn.Visible      := False;
            cxButtonCalcul.Visible      := True;

            cxTextEditVid_oper.Top      := 8;
            LabelTip_oper.Top           := 11;
            cxTextEditVid_oper.Left     := 140;
            cxDateEditDate_doc.Top      := 8;
            cxDateEditDate_doc.Left     := 400;
            Labeldate_doc.Top           := 11;
            Labeldate_doc.Left          := 305;
            cxTextEdit_koeff.Top        := 33;
            cxTextEdit_koeff.Left       := 140;
            Labelkoeff.Top              := 36;
            GroupBox1.Top               := 55;
            cxButtonCalcul.Left         := 450;
            cxButtonCalcul.Top          := 33;

            cxButtonCalcul.Caption      := 'Розрахувати';

            cxTextEditSumma.Text        := begpr;
            cxTextEditSumma.Text        := '0';
            look_flag                   := false;
            OKR_KLIENT                  := 1;
            CheckBoxDookrugl.Top        := 36;
            CheckBoxDookrugl.Left       := 305;

            cxButtonAddProv.Visible     := false;
            cxButtonChange.Visible      := true;
            cxButtonDel.Visible         := false;
            cxGrid1.Visible             := true;
            cxTextEdit_koeff.Visible    := true;
            Labelkoeff.Visible          := true;
            Height                      := 382;

            DataSetGridWatch.Close;
            DataSetGridWatch.SQLs.SelectSQL.Text          := 'select * from MAT_INV_SEL_FOR_PEREOCENKA('+IntToStr(ID_SESSION_PER)+')';
            DataSetGridWatch.Open;

           end;

    end else
    begin
        Caption := MAT_INV_system_name + MAT_INV_oper_change;
        cxButtonAdd.Caption := MAT_INV_Change;
    end;

    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditSumma.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditSumma.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if (zpt[i] <> ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 1;
            end;
            if (zpt[i] = ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if (zpt[StrToInt(long_pole)-1] = ',') or (zpt[StrToInt(long_pole)-1] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditSumma.Clear;
                    cxTextEditSumma.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOst_izn.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOst_izn.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if (zpt[i] <> ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 1;
            end;
            if (zpt[i] = ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if (zpt[StrToInt(long_pole)-1] = ',') or (zpt[StrToInt(long_pole)-1] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditOst_izn.Clear;
                    cxTextEditOst_izn.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOst_izn.Clear;
                cxTextEditOst_izn.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOst_izn.Clear;
                cxTextEditOst_izn.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOst_price.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOst_price.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if (zpt[i] <> ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 1;
            end;
            if (zpt[i] = ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if (zpt[StrToInt(long_pole)-1] = ',') or (zpt[StrToInt(long_pole)-1] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditOst_price.Clear;
                    cxTextEditOst_price.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOst_price.Clear;
                cxTextEditOst_price.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOst_price.Clear;
                cxTextEditOst_price.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;



procedure TfmOperacion.cxButtonCanselClick(Sender: TObject);
begin
    Close;
end;

procedure TfmOperacion.cxButtonEditMOL_oldPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : function (AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_MO: integer):Variant;stdcall;
 Res:Variant;
 sResult: string;
begin
 hPack := GetModuleHandle('MatasSpr.bpl');
 if hPack < 32 then hPack := LoadPackage('MatasSpr.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetMatOtv'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, myform.DatabaseMain.Handle, 0, 0);
 end else begin
  ShowMessage(PChar('Error!'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
  id_mo_new:=Res[0];
  cxButtonEditMOL_old.Text:=Res[1];
 end;
end;

procedure TfmOperacion.cxTextEditOst_priceKeyPress(Sender: TObject;
  var Key: Char);
begin
    begin
    if cxTextEditOst_price.Text = '0,00' then cxTextEditOst_price.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditOst_price.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditOst_price.Text) - Pos(DecimalSeparator, cxTextEditOst_price.Text) > 1) and (Pos(DecimalSeparator,cxTextEditOst_price.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
     end;
end;

procedure TfmOperacion.cxTextEditOst_iznKeyPress(Sender: TObject;
  var Key: Char);
begin
begin
    if cxTextEditOst_izn.Text = '0,00' then cxTextEditOst_izn.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditOst_izn.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditOst_izn.Text) - Pos(DecimalSeparator, cxTextEditOst_izn.Text) > 1) and (Pos(DecimalSeparator,cxTextEditOst_izn.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
     end;
end;

procedure TfmOperacion.cxButtonEditSch_oldPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
begin
    res := GlobalSpr.GetSch(self, myform.DatabaseMain.Handle, fsNormal, date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_sch_new := res[0][0];
            cxButtonEditSch_old.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;

procedure TfmOperacion.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
begin
    if cxTextEditSumma.Text = '0,00' then cxTextEditSumma.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
     end; 
end;

procedure TfmOperacion.cxTextEditIznosKeyPress(Sender: TObject;
  var Key: Char);
begin
begin
    if cxTextEditIznos.Text = '0,00' then cxTextEditIznos.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditIznos.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditIznos.Text) - Pos(DecimalSeparator, cxTextEditIznos.Text) > 1) and (Pos(DecimalSeparator,cxTextEditIznos.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
     end;
end;

procedure TfmOperacion.ActionDelExecute(Sender: TObject);
begin
    if not RxMemoryData1.IsEmpty then
    begin
        RxMemoryData1.Delete;
        cxTextEditSumma.text := RxMemoryData1.FieldByName('Summa').AsString;
    end;
    if cxTextEditSumma.text = '' then
    begin
        cxTextEditSumma.text := '0';
    end;
end;

procedure TfmOperacion.ActionChangeExecute(Sender: TObject);
VAR
    res : Variant;
    ost_pr_s, ost_iz_s, summ_a, dog_n : Variant;
    id_ch_kart : int64;
    ID_SES,OKR_KL : integer;
begin
    DataSourceContek.Enabled := False;
    if not DataSetGridWatch.IsEmpty  then
    begin
        ost_pr_s  := DataSetGridWatch['OST_PRICE'];
        ost_iz_s  := DataSetGridWatch['OST_IZNOS'];
        summ_a    := DataSetGridWatch['SUMMA_OPER'];
        dog_n     := DataSetGridWatch['NUM_DOG'];
        id_ch_kart:= DataSetGridWatch['ID_KART'];

        if CheckBoxDookrugl.Checked then OKR_KL := 1 else OKR_KL := 0;

        res := UChangeInfoPereoc.Znacheniya(self, ost_pr_s, ost_iz_s, summ_a, dog_n, ID_SES,id_ch_kart,OKR_KL,DBHandle,1);
        if VarArrayDimCount(res) > 0 then
        begin
            if (res[0]<>null) and (res[1]<>null) and (res[2]<>null) and (res[3]<>null) then
            begin
                ost_pr_s  := res[0];
                ost_iz_s  := res[1];
                summ_a    := res[2];
                dog_n     := res[3];

                try
                    StoredProc.Close;
                    StoredProc.Transaction := WriteTransaction;
                    StoredProc.Transaction.StartTransaction;
                    StoredProc.StoredProcName:='MAT_INV_CHENGE_FOR_PEREOCENKA';
                    StoredProc.Prepare;
                    StoredProc.ParamByName('ID_KART').AsInt64       := id_ch_kart;
                    StoredProc.ParamByName('SUMMA').AsString        := summ_a;
                    StoredProc.ParamByName('OST_PR').AsString       := ost_pr_s;
                    StoredProc.ParamByName('OST_IZ').AsString       := ost_iz_s;
                    StoredProc.ParamByName('NUM_DOG').AsString      := dog_n;
                    StoredProc.ParamByName('ID_SESSION').AsInt64    := ID_SESSION_PER;
                    StoredProc.ExecProc;
                except on E : Exception do
                 begin
                     ShowMessage(E.Message);
                     StoredProc.Transaction.Rollback;
                     exit;
                 end;
               end;
               StoredProc.Transaction.Commit;
            end;
        end;
    end;
    DataSetGridWatch.CloseOpen(False);
    DataSetGridWatch.Locate('ID_KART',id_ch_kart, []);
    DataSourceContek.Enabled := true;
end;

procedure TfmOperacion.cxButtonEditSch_oldKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := chr(0);
end;

procedure TfmOperacion.cxButtonEditMOL_oldKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmOperacion.Action1Execute(Sender: TObject);
var
   j, id : int64;
   p: real;
   i: integer;
   KEY_SESSION: int64;
   PUB_ID_PROV: int64;
   STRU: KERNEL_MODE_STRUCTURE;
   ErrorList: TStringList;
   DoResult: boolean;
   StringError, mess: string;
   Res : Variant;

   r, dlina : integer;
   tex_text : string;
   currtext : Variant;
begin
    period := cxDateEditDate_doc.date;
    if FlagNaAdd = true then
    begin
          if (cxTextEditDoc_num.Text = '') or (cxDateEditDate_doc.Text = '') then
           begin
                //ShowMessage(MAT_INV_metall_not_all_Row);
                //exit;
           end;
//******************************************************************************
    if Kakaya_oper = 1 then
    begin
        if FlagNaAdd = true then
    begin

          if (cxTextEditDoc_num.Text = '') or (cxDateEditDate_doc.Text = '') then
           begin
                ShowMessage(MAT_INV_metall_not_all_Row);
                exit;
           end
           else
              begin
                    //DecimalSeparator := '.';
                    ost_price_new           := cxTextEditOst_price.text;
                    ost_iznos_new           := cxTextEditOst_izn.Text;
                    iznos                   := cxTextEditIznos.Text;
                    summa                   := cxTextEditSumma.Text;
                    id_user                 := _CURRENT_USER_ID;
                    computer_name           := '';
                    user_name               := _CURRENT_USER_FIO;

                try
                    j:= Provodki(Kakaya_oper, cxTextEditDoc_num.Text, cxDateEditDate_doc.Text, doc_rec, id_mo_old, id_mo_new, id_sch_old, id_sch_new, StringReplace(ost_price_old,',','.',[]), StringReplace(ost_price_new,',','.',[]), StringReplace(ost_iznos_old,',','.',[]), StringReplace(ost_iznos_new,',','.',[]), StringReplace(iznos,',','.',[]), StringReplace(summa,',','.',[]), 0, id_kart, id_user, computer_name);
                except on E:Exception
                do begin
                    MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                    Application.Terminate;
                end;
                end;
                If j > 0 then
                begin
                    DecimalSeparator := ',';
                    id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                    myform.ActionUpdateHistExecute(Sender);
                    //myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
                    close;
                end;
              end;
    end;
        id_oprih    := 0;
        Update_oprih(id_kart, id_oprih, cxDateEditDate_doc.Text);
    end;

if Kakaya_oper = 2 then
begin
     if FlagNaAdd = true then
     begin
          if (cxTextEditDoc_num.Text = '') or (cxDateEditDate_doc.Text = '') then
           begin
                ShowMessage(MAT_INV_metall_not_all_Row);
                exit;
           end
           else
              begin
                    //DecimalSeparator := '.';
                    cxTextEditOst_price.text:= CurrToStr(StrToCurr(cxTextEditOst_price.text) + StrToCurr(cxTextEditSumma.text));
                    ost_price_new           := cxTextEditOst_price.text;
                    ost_iznos_new           := cxTextEditOst_izn.Text;
                    iznos                   := cxTextEditIznos.Text;
                    summa                   := cxTextEditSumma.Text;
                    id_user                 := _CURRENT_USER_ID;
                    computer_name           := '';
                    user_name               := _CURRENT_USER_FIO;
                    try
                        j:= Provodki(Kakaya_oper, cxTextEditDoc_num.Text, cxDateEditDate_doc.Text, doc_rec, id_mo_old, id_mo_new, id_sch_old, id_sch_new, StringReplace(ost_price_old,',','.',[]), StringReplace(ost_price_new,',','.',[]), StringReplace(ost_iznos_old,',','.',[]), StringReplace(ost_iznos_new,',','.',[]), StringReplace(iznos,',','.',[]), StringReplace(summa,',','.',[]), PUB_ID_DOC, id_kart, id_user, computer_name);
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                    If j > 0 then
                    begin
                        DecimalSeparator := ',';
                        id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                        myform.ActionUpdateHistExecute(Sender);
                        //myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
                        close;
                    end;
              end;
        end;
 Update_peremesh(id_kart, id_mo_new, id_sch_new);
 end;

if Kakaya_oper = 3 then
 begin
    if FlagNaAdd = true then
    begin
          if (cxTextEditDoc_num.Text = '') or (cxDateEditDate_doc.Text = '') then
           begin
                ShowMessage(MAT_INV_metall_not_all_Row);
                exit;
           end
           else
              begin
                    //DecimalSeparator := '.';
                    ost_price_new           := cxTextEditOst_price.text;
                    ost_iznos_new           := cxTextEditOst_izn.Text;
                    iznos                   := cxTextEditIznos.Text;
                    summa                   := cxTextEditSumma.Text;
                    id_user                 := _CURRENT_USER_ID;
                    computer_name           := '';
                    user_name               := _CURRENT_USER_FIO;
                try
                    j:= Provodki(Kakaya_oper, cxTextEditDoc_num.Text, cxDateEditDate_doc.Text, doc_rec, id_mo_old, id_mo_new, id_sch_old, id_sch_new, StringReplace(ost_price_old,',','.',[]), StringReplace(ost_price_new,',','.',[]), StringReplace(ost_iznos_old,',','.',[]), StringReplace(ost_iznos_new,',','.',[]), StringReplace(iznos,',','.',[]), StringReplace(summa,',','.',[]), 0, id_kart, id_user, computer_name);
                except on E:Exception
                do begin
                    MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                    Application.Terminate;
                end;
                end;
                If j > 0 then
                begin
                    DecimalSeparator := ',';
                    id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                    myform.ActionUpdateHistExecute(Sender);
                    //myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
                    close;
                end;
              end;
    end;
    Update_expl(id_kart, id_oprih, cxDateEditDate_doc.Text, id_mo_new);
 end;

if Kakaya_oper = 4 then
begin
    if FlagNaAdd = true then
    begin
          if (cxTextEditDoc_num.Text = '') or (cxDateEditDate_doc.Text = '') then
           begin
                ShowMessage(MAT_INV_metall_not_all_Row);
                exit;
           end
           else
              begin
                    //DecimalSeparator := '.';
                    ost_price_new           := cxTextEditOst_price.text;
                    ost_iznos_new           := cxTextEditOst_izn.Text;
                    iznos                   := cxTextEditIznos.Text;
                    summa                   := cxTextEditSumma.Text;
                    id_user                 := _CURRENT_USER_ID;
                    computer_name           := '';
                    user_name               := _CURRENT_USER_FIO;
                    try
                        j:= Provodki(Kakaya_oper, cxTextEditDoc_num.Text, cxDateEditDate_doc.Text, doc_rec, id_mo_old, id_mo_new, id_sch_old, id_sch_new, StringReplace(ost_price_old,',','.',[]), StringReplace(ost_price_new,',','.',[]), StringReplace(ost_iznos_old,',','.',[]), StringReplace(ost_iznos_new,',','.',[]), StringReplace(iznos,',','.',[]), StringReplace(summa,',','.',[]), PUB_ID_DOC, id_kart, id_user, computer_name);
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                    If j > 0 then
                    begin
                        DecimalSeparator := ',';
                        id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                        myform.ActionUpdateHistExecute(Sender);
                        //myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
                        close;
                    end;
              end;
      Update_out(id_kart, cxDateEditDate_doc.Text);
    end;
 end;
end;

if Kakaya_oper = 5 then
begin
     if FlagNaAdd = true then
     begin
          if (cxTextEditDoc_num.Text = '') or (cxDateEditDate_doc.Text = '') then
           begin
                ShowMessage(MAT_INV_metall_not_all_Row);
                exit;
           end
           else
              begin
                    //DecimalSeparator := '.';
                    cxTextEditOst_price.text:= CurrToStr(StrToCurr(cxTextEditOst_price.text) + StrToCurr(cxTextEditSumma.text));
                    ost_price_new           := cxTextEditOst_price.text;
                    ost_iznos_new           := cxTextEditOst_izn.Text;
                    iznos                   := cxTextEditIznos.Text;
                    summa                   := cxTextEditSumma.Text;

                    id_user                 := _CURRENT_USER_ID;
                    computer_name           := '';
                    user_name               := _CURRENT_USER_FIO;

                  WorkDataSet.Close;
                  WorkDataSet.SelectSQL.Clear;
                  WorkDataSet.SelectSQL.Text :='SELECT * FROM MAT_INV_SEL_PRISES('+IntToStr(id_kart)+')';
                  WorkDataSet.CloseOpen(false);
                  summa                    := cxTextEditSumma.Text;
                  cxTextEditOst_price.Text := summa;
                  ost_price_old            := WorkDataSet.FieldByName('OST_PRICE').AsString;
                  ost_iznos_old            := WorkDataSet.FieldByName('OST_IZNOS').AsString;
                  ost_price_new            := summa;
                  summa_mat_doc            := CurrToStr((StrToCurr(WorkDataSet.FieldByName('BEG_PRICE').AsString) + StrToCurr(summa)) - StrToCurr(WorkDataSet.FieldByName('BEG_PRICE').AsString));
                  summa_mat_oper           := summa;

                    try
                        j:= Provodki(Kakaya_oper, cxTextEditDoc_num.Text, cxDateEditDate_doc.Text, doc_rec, id_mo_old, id_mo_new, id_sch_old, id_sch_new, StringReplace(ost_price_old,',','.',[]), StringReplace(ost_price_new,',','.',[]), StringReplace(ost_iznos_old,',','.',[]), StringReplace(ost_iznos_new,',','.',[]), StringReplace(iznos,',','.',[]), StringReplace(summa,',','.',[]), PUB_ID_DOC, id_kart, id_user, computer_name);
                        Insert_into_MATAS(cxTextEditDoc_num.Text, cxDateEditDate_doc.Text, id_mo_old, summa_mat_doc, id_user, user_name, computer_name, id_nomn, beg_price, summa_mat_oper, id_sch_old, id_ost_in, id_kart);
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                    If j > 0 then
                    begin
                        DecimalSeparator := ',';
                        id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                        myform.ActionUpdateHistExecute(Sender);
                        close;
                    end;
              end;
     end;
    id_oprih    := 0;
    Update_modern(id_kart, id_oprih, cxDateEditDate_doc.Text, StringReplace(cxTextEditOst_price.Text,',','.',[]));
end;

//********************   Переоценка    *****************************************
if Kakaya_oper = 7 then
begin
 if cxTextEdit_koeff.Text <> '' then
 begin
            if cxTextEdit_koeff.Text <> ''then
            begin
                For_main_ved(cxDateEditDate_doc.Text, cxTextEdit_koeff.Text, '1');
            end;
            if cxTextEdit_koeff.Text = ''then
            begin
                For_main_ved(cxDateEditDate_doc.Text, '0', '1');
            end;

                id_user                 := _CURRENT_USER_ID;
                computer_name           := '';
                user_name               := _CURRENT_USER_FIO;


                try
                   Save_pereocenku(id_user, user_name, computer_name, cxDateEditDate_doc.Text,  doc_rec, ID_SESSION_PER, 0, 0, 0, 0, '');
                    Info_for_ved(0);
                except on E:Exception
                do begin
                    MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                    Application.Terminate;
                end;
                end;
                If j > 0 then
                begin
                    DecimalSeparator := ',';
                    id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                    myform.ActionUpdateHistExecute(Sender);
                    close;
                end;
        close;
 end else
 begin
     ShowMessage(MAT_INV_metall_not_all_Row);
     exit;
 end;
 end else
 begin
//     ShowMessage(MAT_INV_metall_not_all_Row);
//     exit;
 end;
end;

procedure TfmOperacion.Action_add_new_provExecute(Sender: TObject);
VAR
    res : Variant;
    debil, kredil, sumashed, sm, rz, st, kekv : String;
    id_debil, id_kredil, id_sm, id_rz, id_st, id_kekv : int64;
begin
    debil       := '';
    kredil      := '';
    sumashed    := '';
    id_debil    := 0;
    id_kredil   := 0;

    sm          := '0';
    rz          := '0';
    st          := '0';
    kekv        := '0';

    id_sm          := 0;
    id_rz          := 0;
    id_st          := 0;
    id_kekv        := 0;

    res := uAddProv.GetProv(self, true, myform, id_debil, id_kredil, debil, kredil, sumashed, sm, rz, st, kekv, _MATAS_PERIOD, id_sm, id_rz, id_st, id_kekv);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) and (res[2]<>null) then
        begin
                RxMemoryData1.Open;
                RxMemoryData1.Insert;
                RxMemoryData1.FieldByName('Debet').Value         := res[0];
                RxMemoryData1.FieldByName('Kredit').Value        := res[1];
                RxMemoryData1.FieldByName('Summa').AsFloat       := res[2];
                RxMemoryData1.FieldByName('id_debet').AsInteger  := res[3];
                RxMemoryData1.FieldByName('id_kredit').AsInteger := res[4];

                RxMemoryData1.FieldByName('db_sm').Value         := Res[6];
                RxMemoryData1.FieldByName('db_rz').Value         := Res[7];
                RxMemoryData1.FieldByName('db_st').Value         := Res[8];
                RxMemoryData1.FieldByName('db_kekv').Value       := Res[9];
                RxMemoryData1.FieldByName('db_id_sm').Value      := Res[10];
                RxMemoryData1.FieldByName('db_id_rz').Value      := Res[11];
                RxMemoryData1.FieldByName('db_id_st').Value      := Res[12];
                RxMemoryData1.FieldByName('db_id_kekv').Value    := Res[13];

                RxMemoryData1.FieldByName('kr_sm').Value         := Res[14];
                RxMemoryData1.FieldByName('kr_rz').Value         := Res[15];
                RxMemoryData1.FieldByName('kr_st').Value         := Res[16];
                RxMemoryData1.FieldByName('kr_kekv').Value       := Res[17];
                RxMemoryData1.FieldByName('kr_id_sm').Value      := Res[18];
                RxMemoryData1.FieldByName('kr_id_rz').Value      := Res[19];
                RxMemoryData1.FieldByName('kr_id_st').Value      := Res[20];
                RxMemoryData1.FieldByName('kr_id_kekv').Value    := Res[21];

//************** Передача начальных данных
                 try
                    StoredProc.Close;
                    StoredProc.Transaction := WriteTransaction;
                    StoredProc.Transaction.StartTransaction;
                    StoredProc.StoredProcName:='MAT_INV_ADD_INFO_FOR_PROVODKI';
                    StoredProc.Prepare;
                    StoredProc.ParamByName('ID_KART').AsInt64       := id_kart;
                    StoredProc.ParamByName('SUMMA').AsFloat         := RxMemoryData1.FieldByName('Summa').AsFloat;
                    StoredProc.ParamByName('ID_DB').AsInt64         := RxMemoryData1.FieldByName('id_debet').AsVariant;
                    StoredProc.ParamByName('ID_KR').AsInt64         := RxMemoryData1.FieldByName('id_kredit').AsVariant;
                    StoredProc.ParamByName('ID_SM').AsInteger       := RxMemoryData1.FieldByName('db_id_sm').AsInteger;
                    StoredProc.ParamByName('ID_RZ').AsInteger       := RxMemoryData1.FieldByName('db_id_rz').AsInteger;
                    StoredProc.ParamByName('ID_ST').AsInteger       := RxMemoryData1.FieldByName('db_id_st').AsInteger;
                    StoredProc.ParamByName('ID_KEKV').AsInteger     := RxMemoryData1.FieldByName('db_id_kekv').AsInteger;
                    StoredProc.ExecProc;
                    PID_DOC := StoredProc.ParamByName('PID_DOC').AsInt64;
                except on E : Exception do
                 begin
                     ShowMessage(E.Message);
                     StoredProc.Transaction.Rollback;
                     exit;
                 end;
               end;
               StoredProc.Transaction.Commit;

               RxMemoryData1.FieldByName('id_doc').Value     := PID_DOC;
               RxMemoryData1.Post;


                cxTextEditSumma.text:=StrToCurr(cxTextEditSumma.Text)+ res[2];
                if Kakaya_oper = 5 then
                begin
                    //cxTextEditOst_price.Text := CurrToStr(StrToCurr(cxTextEditOst_price.Text)+StrToCurr(cxTextEditSumma.Text));
                end;
        end;
    end;
end;

procedure TfmOperacion.cxTextEditSumma_prExit(Sender: TObject);
var
   i: integer;
   flag_priznak_prov : boolean;
begin

    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditSumma_pr.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditSumma_pr.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if (zpt[i] <> ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 1;
            end;
            if (zpt[i] = ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if (zpt[StrToInt(long_pole)-1] = ',') or (zpt[StrToInt(long_pole)-1] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditSumma_pr.Clear;
                    cxTextEditSumma_pr.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditSumma_pr.Clear;
                cxTextEditSumma_pr.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditSumma_pr.Clear;
                cxTextEditSumma_pr.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        if cxTextEditSumma_pr.Text = '' then
        cxTextEditSumma_pr.Text    := '0,00';

        if (cxTextEditSumma_pr.Text <> '0,00') or (cxTextEditSumma_izn.Text <> '0,00') then
        begin
            cxTextEdit_koeff.Enabled := false;

        end else
        begin
            cxTextEdit_koeff.Enabled := True;
            cxTextEditOst_price.Text := myform.DataSetKart.FieldByName('OST_PRICE').Asstring;
        end;



        if cxTextEditSumma_pr.Text = look_1 then
        begin
            Exit;
        end;
end;

procedure TfmOperacion.cxTextEditSumma_iznExit(Sender: TObject);
var
   i: integer;
   flag_priznak_prov : boolean;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditSumma_izn.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditSumma_izn.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if (zpt[i] <> ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 1;
            end;
            if (zpt[i] = ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if (zpt[StrToInt(long_pole)-1] = ',') or (zpt[StrToInt(long_pole)-1] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditSumma_izn.Clear;
                    cxTextEditSumma_izn.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditSumma_izn.Clear;
                cxTextEditSumma_izn.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditSumma_izn.Clear;
                cxTextEditSumma_izn.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        if cxTextEditSumma_izn.Text = '' then
        cxTextEditSumma_izn.Text    := '0,00';

        if (cxTextEditSumma_pr.Text <> '0,00') or (cxTextEditSumma_izn.Text <> '0,00') then
        begin
            cxTextEdit_koeff.Enabled := false;
        end else
        begin
            cxTextEdit_koeff.Enabled := True;
            cxTextEditOst_izn.Text := myform.DataSetOsn.FieldByName('OST_IZNOS').Asstring;
        end;


        if cxTextEditSumma_izn.Text = look_2 then
        begin
            Exit;
        end;
end;

procedure TfmOperacion.cxTextEditSumma_prKeyPress(Sender: TObject;
  var Key: Char);
begin
    if cxTextEditSumma_pr.Text = '0,00' then cxTextEditSumma_pr.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma_pr.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma_pr.Text) - Pos(DecimalSeparator, cxTextEditSumma_pr.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma_pr.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);

end;

procedure TfmOperacion.cxTextEditSumma_iznKeyPress(Sender: TObject;
  var Key: Char);
begin
    if cxTextEditSumma_izn.Text = '0,0000' then cxTextEditSumma_izn.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma_izn.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma_izn.Text) - Pos(DecimalSeparator, cxTextEditSumma_izn.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma_izn.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmOperacion.cxTextEditSumma_prKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if cxTextEditSumma_pr.Text = '0,00' then
    begin
        cxTextEditSumma_pr.Clear;
    end;
end;

procedure TfmOperacion.cxTextEditSumma_iznKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if cxTextEditSumma_izn.Text = '0,00' then
    begin
        cxTextEditSumma_izn.Clear;
    end;
end;

procedure TfmOperacion.cxTextEdit_koeffKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = '.' then key:= ',';
    if (key < '0') and (key > '9') then key:= chr(0);
end;

procedure TfmOperacion.cxTextEditSummaExit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditSumma.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditSumma.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if (zpt[i] <> ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 1;
            end;
            if (zpt[i] = ',') or (zpt[i] <> '.') then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if (zpt[StrToInt(long_pole)-1] = ',') or (zpt[StrToInt(long_pole)-1] = '.') then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditSumma.Clear;
                    cxTextEditSumma.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

procedure TfmOperacion.PushEnterExecute(Sender: TObject);
begin
    if cxTextEdit_koeff.IsFocused then
    cxGrid1.SetFocus;
end;

procedure TfmOperacion.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionChangeExecute(Sender);
end;

procedure TfmOperacion.CheckBoxDookruglClick(Sender: TObject);
begin
    if CheckBoxDookrugl.Checked = true then
    begin
        OKR_KLIENT                  := 1;
    end else
    begin
        OKR_KLIENT                  := 0;
    end;
end;

procedure TfmOperacion.cxButtonCalculClick(Sender: TObject);
var
    flag_priznak_prov : boolean;
    koeff_ent : String;
    id_ch_kart : int64;
begin
    id_ch_kart               := DataSetGridWatch['ID_KART'];
    koeff_ent := cxTextEdit_koeff.Text;
    DataSourceContek.Enabled := False;
    if (koeff_ent = '') then koeff_ent := '1';
    try
        StoredProc.Close;
        StoredProc.Transaction := WriteTransaction;
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName:='MAT_INV_CALC_FOR_PEREOCENKA';
        StoredProc.Prepare;
        StoredProc.ParamByName('COEFF').AsFloat        := StrToFloat(koeff_ent);
        StoredProc.ParamByName('OKR_KLIENT').AsInteger := OKR_KLIENT;
        StoredProc.ParamByName('ID_SESSION').AsString  := IntToStr(ID_SESSION_PER);
        StoredProc.ExecProc;
    except on E : Exception do
     begin
         ShowMessage(E.Message);
         StoredProc.Transaction.Rollback;
         exit;
     end;
   end;
   StoredProc.Transaction.Commit;

   DataSetGridWatch.CloseOpen(False);
   DataSetGridWatch.Locate('ID_KART',id_ch_kart, []);
   DataSourceContek.Enabled := true;
end;


end.
