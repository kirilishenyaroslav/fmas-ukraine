{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit AddInvKartForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClassInvKart, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxMemo, cxMaskEdit, cxDropDownEdit, cxMRUEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, Ibase, ExtCtrls, Buttons, ImgList,
  ActnList, cxButtonEdit, cxListBox, cxCalendar,
  GlobalSpr, DB, FIBDataSet, pFIBDataSet, cxCurrencyEdit, ComCtrls, cxCheckBox,
  cxGroupBox, uNormIznos, uChecked, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxLabel, DateUtils, MainInvKartForm, uResources, uMatasVars;

type
  TfmInvKartAdd = class(TForm)
    PageControlAddKart: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    cxButtonEditSelNomn: TcxButtonEdit;
    cxButtonEditSelMOL: TcxButtonEdit;
    cxButtonEditSelSch: TcxButtonEdit;
    cxComboBoxTipKrt: TcxComboBox;
    cxDateEditOst: TcxDateEdit;
    cxTextEditZavNum: TcxTextEdit;
    cxTextEditPasNum: TcxTextEdit;
    cxDateEditDateCreate: TcxDateEdit;
    cxDateEditDateReg: TcxDateEdit;
    cxTextEditDocReg: TcxTextEdit;
    cxTextEditMark: TcxTextEdit;
    cxTextEditModel: TcxTextEdit;
    cxMemoNote: TcxMemo;
    cxGroupBox1: TcxGroupBox;
    cxButtonEditBuh_id_db_sch: TcxButtonEdit;
    cxButtonEditBuh_id_kr_sch: TcxButtonEdit;
    LabelBuh_id_db_sch: TLabel;
    LabelBuh_id_kr_sch: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxButtonEditNal_id_db_sch: TcxButtonEdit;
    cxButtonEditNal_id_kr_sch: TcxButtonEdit;
    LabelNal_id_kr_sch: TLabel;
    LabelNal_id_db_sch: TLabel;
    cxCurrencyEditPersent: TcxCurrencyEdit;
    cxButtonEditID_Am_grp: TcxButtonEdit;
    LabelID_Am_grp: TLabel;
    LabelYear: TLabel;
    LabelMonth: TLabel;
    cxTextEditYear: TcxTextEdit;
    cxComboBoxMonth: TcxComboBox;
    cxComboBoxPeriodNach: TcxComboBox;
    LabelSelMethod: TLabel;
    LabelMinPrice: TLabel;
    LabelPercent: TLabel;
    LabelPer_Nachisl: TLabel;
    cxButtonEdit_Nal_am_grp: TcxButtonEdit;
    cxTextEdit_Nal_Year: TcxTextEdit;
    cxComboBox_Nal_month: TcxComboBox;
    Label_Nal_Am_grp: TLabel;
    Label_Nal_Year: TLabel;
    Label_Nal_month: TLabel;
    Label_Nal_Method: TLabel;
    cxCurrencyEdit_Nal_Percent: TcxCurrencyEdit;
    cxComboBox_Nal_Per_Nach: TcxComboBox;
    Label_Nal_Per_Nach: TLabel;
    Label_Nal_Percent: TLabel;
    Label_Nal_Min_Price: TLabel;
    cxComboBoxMethod: TcxTextEdit;
    cxComboBox_Nal_Method: TcxTextEdit;
    Panel1: TPanel;
    cxButtonAdd: TcxButton;
    cxButtonClose: TcxButton;
    cxCurrencyEditMinPrice: TcxTextEdit;
    cxCurrencyEdit_Nal_Min_Price: TcxTextEdit;
    cxDateEditDateOut: TcxTextEdit;
    cxDateEditDateUpdate: TcxTextEdit;
    ActionList1: TActionList;
    Action1: TAction;
    StoredProcWorkWithFullInv: TpFIBStoredProc;
    cxTextEditFullInvNum: TcxTextEdit;
    cxDateEditOpr: TcxDateEdit;
    cxDateEditDateExpl: TcxDateEdit;
    cxLabelSelSch: TLabel;
    cxLabelGrpNum: TLabel;
    cxLabelTipKrt: TLabel;
    cxLabelKartNum: TLabel;
    cxLabelBegPrice: TLabel;
    cxLabelOstPrice: TLabel;
    cxLabelOpr: TLabel;
    cxLabelDateExpl: TLabel;
    cxLabelSelNomn: TLabel;
    cxLabelInvNum: TLabel;
    cxLabelFullInvNum: TLabel;
    cxLabelSelMOL: TLabel;
    cxLabelBegIznos: TLabel;
    cxLabelOstIznos: TLabel;
    cxLabelOst: TLabel;
    cxLabelDateUpdate: TLabel;
    cxLabelDateOut: TLabel;
    cxLabelZavNum: TLabel;
    cxLabelPasNum: TLabel;
    cxLabelDocReg: TLabel;
    cxLabelMark: TLabel;
    cxLabelModel: TLabel;
    LabelNote: TLabel;
    cxLabelDateCreate: TLabel;
    cxLabelDateReg: TLabel;
    cxTextEditBegPrice2: TcxCurrencyEdit;
    CheckBoxOst: TCheckBox;
    cxButtonEditSaveOst: TcxButtonEdit;
    Action2: TAction;
    Action3: TAction;
    cxCheckBox1: TRadioButton;
    cxCheckBox2: TRadioButton;
    cxButtonEditShowBal: TcxButtonEdit;
    Label1: TLabel;
    Combo_box_IS_INV_OBJ: TcxComboBox;
    cxMemoFullName: TcxMemo;
    lbl1: TLabel;
    lbl6: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl3: TLabel;
    cxTextEditOstIznosNal: TcxTextEdit;
    cxTextEditBegIznosNal: TcxTextEdit;
    cxTextEditOstPriceNal: TcxTextEdit;
    cxTextEditBegPriceNal: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxTextEditKartNum: TcxCurrencyEdit;
    cxTextEditGrpNum: TcxCurrencyEdit;
    cxTextEditInvNum: TcxCurrencyEdit;
    cxTextEditBegPrice: TcxCurrencyEdit;
    cxTextEditOstPrice: TcxCurrencyEdit;
    cxTextEditBegIznos: TcxCurrencyEdit;
    cxTextEditOstIznos: TcxCurrencyEdit;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonEditSelMOLPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSelSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSelNomnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox11Click(Sender: TObject);
    procedure cxButtonEditBuh_id_db_schPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButtonEditBuh_id_kr_schPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButtonEditID_Am_grpPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditBuh_id_db_schExit(Sender: TObject);
    procedure cxButtonEditBuh_id_kr_schExit(Sender: TObject);
    procedure cxButtonEditNal_id_db_schPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButtonEditNal_id_kr_schPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxTextEditGrpNumKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditInvNumKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditKartNumKeyPress(Sender: TObject; var Key: Char);
    procedure cxCurrencyEditPersentExit(Sender: TObject);
    procedure cxCurrencyEdit_Nal_PercentExit(Sender: TObject);
    procedure cxButtonEdit_Nal_am_grpPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEditBegIznosExit(Sender: TObject);
    procedure cxTextEditBegPriceKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditBegIznosKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditOstPriceKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditOstIznosKeyPress(Sender: TObject; var Key: Char);
    procedure cxCurrencyEditMinPriceKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxCurrencyEdit_Nal_Min_PriceKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditSelNomnKeyPress(Sender: TObject; var Key: Char);
    procedure cxCurrencyEditMinPriceExit(Sender: TObject);
    procedure cxCurrencyEdit_Nal_Min_PriceExit(Sender: TObject);
    procedure cxTextEditOstPriceExit(Sender: TObject);
    procedure cxTextEditOstIznosExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxButtonEditID_Am_grpKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditBuh_id_db_schKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditBuh_id_kr_schKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEdit_Nal_am_grpKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditNal_id_db_schKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxButtonEditNal_id_kr_schKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxCheckBox21Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure cxTextEditGrpNumExit(Sender: TObject);
    procedure cxTextEditInvNumExit(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxTextEditGrpNumEnter(Sender: TObject);
    procedure cxTextEditInvNumEnter(Sender: TObject);
    procedure cxTextEditBegPrice2Exit(Sender: TObject);
    procedure cxTextEditBegPriceExit(Sender: TObject);
    procedure CheckBoxOstClick(Sender: TObject);
    procedure cxButtonEditSaveOstPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSaveOstKeyPress(Sender: TObject; var Key: Char);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxButtonEditShowBalPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditShowBalKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditShowBalExit(Sender: TObject);
    procedure cxTextEditBegPriceNalKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditOstPriceNalKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditBegIznosNalKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditOstIznosNalKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditBegPriceNalExit(Sender: TObject);
    procedure cxTextEditOstPriceNalExit(Sender: TObject);
    procedure cxTextEditBegIznosNalExit(Sender: TObject);
    procedure cxTextEditOstIznosNalExit(Sender: TObject);
    procedure cxTextEditKartNumFocusChanged(Sender: TObject);
  private
    FlagNaAdd   : integer;
    myform      : TfmMainIvKartForm;
    id_nomn     : int64;
    id_sch_db   : int64;
    nal_sch_db  : int64;
    id_sch_kr   : int64;
    nal_sch_kr  : int64;
    flajok      : int64;
    Is_check    : int64;
    is_check_buhg, is_check_nal:integer;
    id_norm     : int64;
    id_metd     : int64;
    id_norm_nal : int64;
    id_metd_nal : int64;
    rstemp      : string;
    grp_id      : integer;
    inv_full    : string;
    id_oper_opr : int64;
    id_oper_expl: Int64;
    priznak     : integer;
    id_ost      : int64;
    IS_SEL_OST  : integer;

    grp_old_num, inv_old_num : string;
    BegPrice, OstIznos, OstPrice, BegIznos, BalPrice : string;
    BegPriceNal, OstIznosNal, OstPriceNal, BegIznosNal, BalPriceNal : string;
    long_pole : string;
    prap_flag, d, dk : integer;
    zpt, zpt1 : string;
    id_kartochki : int64;
    Priznak_bloka, IS_SKLAD : integer;
  public
    id_man      : int64;
    id_sch      : int64;


    constructor Create(mform: TfmMainIvKartForm; Flag : integer; Check : int64); reintroduce; overload;
  end;

implementation

uses uSelectOst, uCheBalPrice;

{$R *.dfm}


constructor TfmInvKartAdd.Create(mform: TfmMainIvKartForm;
  Flag: integer; Check : int64);
var
    i : integer;
begin
    inherited Create(nil);
    myform    := mform;
    FlagNaAdd := flag;
    Is_check  := check;

    //cxButtonEditID_Am_grp.Text      := '2';
    //cxComboBoxMethod.Text           := '21';
    cxCheckBox1.Caption             := MAT_INV_na_check;
    cxCheckBox2.Caption             := MAT_INV_na_buhg_check;
    TabSheet1.Caption               := MAT_INV_Vklad_Osnovnie;
    TabSheet2.Caption               := MAT_INV_Vklad_Amort;
    TabSheet3.Caption               := MAT_INV_Vklad_Dop;
    cxLabelSelMOL.Caption           := MAT_INV_MOL;
    cxLabelSelNomn.Caption          := MAT_INV_Name;
    cxLabelSelSch.Caption           := MAT_INV_SCH;
    cxLabelTipKrt.Caption           := MAT_INV_Tip_karti;
    cxLabelGrpNum.Caption           := MAT_INV_Num_Grp;
    cxLabelInvNum.Caption           := MAT_INV_Inv_Num;
    cxLabelFullInvNum.Caption       := MAT_INV_full_inv;
    cxLabelZavNum.Caption           := MAT_INV_Zav_num;
    cxLabelPasNum.Caption           := MAT_INV_Pass_num;
    cxLabelKartNum.Caption          := MAT_INV_Num_kart;
    cxLabelBegPrice.Caption         := MAT_INV_Nach_price;
    cxLabelBegIznos.Caption         := MAT_INV_Nach_Iznos;
    cxLabelOstPrice.Caption         := MAT_INV_Ost_price;
    cxLabelOstIznos.Caption         := MAT_INV_Ost_Iznos;
    cxLabelOst.Caption              := MAT_INV_Date_ost;
    cxLabelOpr.Caption              := MAT_INV_Date_opr;
//    cxLabelIdOperOpr.Caption        := MAT_INV_Add_Kart_ID_Oper_Opr;
    cxLabelDateExpl.Caption         := MAT_INV_date_nach_expl;
//    cxLabelIdOperExpl.Caption       := MAT_INV_Add_Kart_IdOperExpl;
    cxLabelDateUpdate.Caption       := MAT_INV_Date_Refrash;
//    cxLabelIdOperUpdate.Caption     := MAT_INV_Add_Kart_IdOperUpdate;
    cxLabelDateOut.Caption          := MAT_INV_Date_Exit;
//    cxLabelIdOperOut.Caption        := MAT_INV_Add_Kart_IdOperOut;
    cxLabelDateCreate.Caption       := MAT_INV_Date_vipuska;
    cxLabelDocReg.Caption           := MAT_INV_Reg_doc;
    cxLabelDateReg.Caption          := MAT_INV_Date_reg_doc;
    cxLabelModel.Caption            := MAT_INV_Model;
    cxLabelMark.Caption             := MAT_INV_Marka;
    LabelNote.Caption               := MAT_INV_Primechanie;
    LabelBuh_id_db_sch.Caption      := MAT_INV_buh_db_sch;
    LabelBuh_id_kr_sch.Caption      := MAT_INV_buh_kr_sch;
    LabelNal_id_db_sch.Caption      := MAT_INV_buh_db_sch;
    LabelNal_id_kr_sch.Caption      := MAT_INV_buh_kr_sch;
    LabelID_Am_grp.Caption          := MAT_INV__am_grp;
    LabelYear.Caption               := MAT_INV_const_Let;
    LabelMonth.Caption              := MAT_INV_const_mesyacev;
    LabelSelMethod.Caption          := MAT_INV__method_name;
    LabelMinPrice.Caption           := MAT_INV_minprice;
    LabelPercent.Caption            := MAT_INV_Percent;
    LabelPer_Nachisl.Caption        := MAT_INV_PerNach_Perc;

    Label_Nal_Am_grp.Caption        := MAT_INV__am_grp;
    Label_Nal_Year.Caption          := MAT_INV_const_Let;
    Label_Nal_month.Caption         := MAT_INV_const_mesyacev;
    Label_Nal_Method.Caption        := MAT_INV__method_name;
    Label_Nal_Min_Price.Caption     := MAT_INV_minprice;
    Label_Nal_Percent.Caption       := MAT_INV_Percent;
    Label_Nal_Per_Nach.Caption      := MAT_INV_PerNach_Perc;
    CheckBoxOst.Caption             := MAT_INV_checked_ost;

    cxLabelSelMOL.Width             := 50;
    cxLabelSelNomn.Width            := 45;
    cxLabelFullInvNum.Width         := 115;
    cxLabelSelSch.Width             := 70;
    cxLabelTipKrt.Width             := 90;
    cxLabelGrpNum.Width             := 100;
    cxLabelInvNum.Width             := 68;
    cxLabelKartNum.Width            := 100;
    cxLabelPasNum.Width             := 130;
    cxLabelZavNum.Width             := 130;
    cxLabelBegPrice.Width           := 90;
    cxLabelBegIznos.Width           := 90;
    cxLabelOstPrice.Width           := 90;
    cxLabelOstIznos.Width           := 90;
    cxLabelOst.Width                := 120;
    cxLabelOpr.Width                := 120;
//    cxLabelIdOperOpr.Width          := 100;
    cxLabelDateExpl.Width           := 100;
//    cxLabelIdOperExpl.Width         := 100;
    cxLabelDateUpdate.Width         := 110;
//    cxLabelIdOperUpdate.Width       := 100;
    cxLabelDateOut.Width            := 100;
//    cxLabelIdOperOut.Width          := 90;
    cxLabelDateCreate.Width         := 130;
    cxLabelDocReg.Width             := 130;
    cxLabelDateReg.Width            := 130;
    cxLabelModel.Width              := 130;
    cxLabelMark.Width               := 130;
    cxComboBoxPeriodNach.ItemIndex  := 0;
    cxComboBoxMonth.ItemIndex       := 0;

//**********  Определение размерности полей для инв номера  ********************
        try
           StoredProcWorkWithFullInv.Close;
           StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
           StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
           StoredProcWorkWithFullInv.Transaction.StartTransaction;
           StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_KOL_ZNAKOV';
           StoredProcWorkWithFullInv.Prepare;
           StoredProcWorkWithFullInv.ExecProc;
           priznak := StoredProcWorkWithFullInv.ParamByName('PRIZNAK').AsInteger;
        except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           StoredProcWorkWithFullInv.Transaction.Commit;

        if priznak = 0 then
        begin
            cxTextEditGrpNum.Properties.MaxValue := 9;
            cxTextEditInvNum.Properties.MaxValue := 9999;
            cxTextEditFullInvNum.Properties.MaxLength := 8;
        end;
        if priznak = 2 then
        begin
            cxTextEditGrpNum.Properties.Maxvalue     := 99;
            cxTextEditInvNum.Properties.MaxValue     := 99999;
            cxTextEditFullInvNum.Properties.MaxLength := 10;
        end;
        if priznak = 1 then
        begin
            cxTextEditGrpNum.Properties.MaxValue     := 99;
            cxTextEditInvNum.Properties.MaxValue     := 9999;
            cxTextEditFullInvNum.Properties.MaxLength := 6;
        end;
//**********  Конец этого действа   ********************************************

    If FlagNaAdd = 0 then
    begin
        cxCheckBox2.Checked         := true;
        
        Caption                     := MAT_INV_system_name + MAT_INV_Add_Kart_Caption_na_AddKar;
        cxButtonAdd.Caption         := MAT_INV_Add;
        cxButtonClose.Caption       := MAT_INV_Cansel;
        cxDateEditOst.Date          := Today;
        //cxDateEditOpr.Text          := DateToStr(Today);
        //cxDateEditDateExpl.Text     := DateToStr(Today);
        //cxDateEditDateUpdate.Text   := DateToStr(Today);
        //cxDateEditDateOut.Text      := DateToStr(Today);
        {cxDateEditOpr.Enabled       := false;
        cxDateEditDateExpl.Enabled  := false;
        }cxDateEditDateUpdate.Enabled:= false;
        cxDateEditDateOut.Enabled   := false;
        //cxDateEditDateCreate.Date   := Today;
        //cxDateEditDateReg.Date      := Today;
        cxComboBoxTipKrt.ItemIndex  := 0;
        cxButtonEditShowBal.Enabled := false;
        Combo_box_IS_INV_OBJ.ItemIndex := 1;

//**********  Определение следующего номера карточки    ***********************
        try
           StoredProcWorkWithFullInv.Close;
           StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
           StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
           StoredProcWorkWithFullInv.Transaction.StartTransaction;
           StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_DOP_DATA';
           StoredProcWorkWithFullInv.Prepare;
           StoredProcWorkWithFullInv.ExecProc;
           cxTextEditKartNum.Text             := IntToStr(StoredProcWorkWithFullInv.ParamByName('max_kart_num').AsInteger + 1);
        except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           StoredProcWorkWithFullInv.Transaction.Commit;
//**********  Конец этого действа   ********************************************
    end;
    If FlagNaAdd = 2 then
    begin

        TabSheet1.Enabled     := false;
        TabSheet2.Enabled     := false;
        TabSheet3.Enabled     := false;
        cxButtonAdd.Visible   := false;
        cxButtonClose.Caption := MAT_INV_Close;
        Caption               := MAT_INV_system_name + MAT_INV_look;

        id_kartochki                      := StrToInt64(myform.DataSetKart.fieldbyname('R_ID_KART').AsString);
        id_man                            := myform.DataSetKart.fieldbyname('ID_MANS').AsInteger;
        id_nomn                           := myform.DataSetKart.fieldbyname('ID_NOMNS').AsInteger;
        id_sch                            := myform.DataSetKart.fieldbyname('ID_SCHS').AsInteger;
        is_check_buhg                     := myform.DataSetKart.fieldbyname('IS_BUHG_ACC').AsInteger;
        is_check_nal                      := myform.DataSetKart.fieldbyname('USE_IN_NALOG').AsInteger;

        id_sch_db                         := myform.DataSetOsn.fieldbyname('ID_BUH_DB').AsInteger;
        nal_sch_db                        := myform.DataSetOsn.fieldbyname('ID_NAL_DB').AsInteger;
        id_sch_kr                         := myform.DataSetOsn.fieldbyname('ID_BUH_KR').AsInteger;
        nal_sch_kr                        := myform.DataSetOsn.fieldbyname('ID_NAL_KR').AsInteger;

        cxButtonEditSelMOL.Text           := myform.DataSetKart.FieldByName('FIO_MOL').AsString + ' / '+myform.DataSetKart.FieldByName('NAME_DEPARTMENT').AsString;
        cxButtonEditSelNomn.Text          := myform.DataSetKart.FieldByName('NAME_KART').AsString;
        cxButtonEditSelSch.Text           := myform.DataSetKart.FieldByName('NUM_SCH').AsString; // +' '+ myform.DataSetKart.FieldByName('NAME_SCH').AsString;
        cxTextEditGrpNum.Text             := myform.DataSetKart.FieldByName('GRP_NUM').AsString;
        cxComboBoxTipKrt.Text             := myform.DataSetOsn.FieldByName('TIP_KRT').AsString;
        cxTextEditInvNum.Text             := myform.DataSetKart.FieldByName('INV_NUM').AsString;
        cxTextEditZavNum.Text             := myform.DataSetOsn.FieldByName('ZAV_NUM').AsString;
        cxTextEditPasNum.Text             := myform.DataSetOsn.FieldByName('PASS_NUM').AsString;
        cxTextEditKartNum.Text            := myform.DataSetOsn.FieldByName('KART_NUM').AsString;
        cxTextEditBegPrice.Text           := myform.DataSetOsn.FieldByName('BEG_PRICE').AsString;
        cxTextEditBegIznos.Text           := myform.DataSetOsn.FieldByName('BEG_IZNOS').AsString;
        cxTextEditOstPrice.Text           := myform.DataSetOsn.FieldByName('OST_PRICE').AsString;
        cxTextEditOstIznos.Text           := myform.DataSetOsn.FieldByName('OST_IZNOS').AsString;
        cxDateEditOst.Date                := myform.DataSetOsn.FieldByName('DATE_OST').AsDateTime;
        cxDateEditDateUpdate.Text         := myform.DataSetOsn.FieldByName('DATE_UPDATE').AsString;
        Combo_box_IS_INV_OBJ.ItemIndex    := myform.DataSetKart.fieldbyname('IS_INV_OBJ').AsInteger;

        if (myform.DataSetOsn.FieldByName('DATE_OPR').AsDateTime = StrToDateTime('30.12.1899')) then
        begin
            cxDateEditOpr.EditValue   := null;
        end else
        begin
            cxDateEditOpr.Date                := myform.DataSetOsn.FieldByName('DATE_OPR').AsDateTime;
        end;
        if (myform.DataSetOsn.FieldByName('DATE_EXPL').AsDateTime = StrToDateTime('30.12.1899')) then
        begin
            cxDateEditDateExpl.EditValue   := null;
        end else
        begin
            cxDateEditDateExpl.Date           := myform.DataSetOsn.FieldByName('DATE_EXPL').AsDateTime;
        end;
        id_oper_opr                       := StrToInt64(myform.DataSetOsn.FieldByName('ID_OPER_OPR').AsString);
        id_oper_expl                      := StrToInt64(myform.DataSetOsn.FieldByName('ID_OPER_EXPL').AsString);

        cxDateEditDateCreate.Date         := myform.DataSetOsn.FieldByName('DATE_CREATE').AsDateTime;
        rstemp                            := myform.DataSetOsn.FieldByName('ID_CUST').AsString;
        cxTextEditDocReg.Text             := myform.DataSetOsn.FieldByName('DOC_REG').AsString;
        cxDateEditDateReg.Date            := myform.DataSetOsn.FieldByName('DATE_REG').AsDateTime;
        cxTextEditModel.Text              := myform.DataSetOsn.FieldByName('MODEL').AsString;
        cxTextEditMark.Text               := myform.DataSetOsn.FieldByName('MARK').AsString;
        cxMemoNote.Text                   := myform.DataSetOsn.FieldByName('NOTE').AsString;

        cxButtonEditID_Am_grp.Text        := myform.DataSetOsn.FieldByName('NAME_NORM').AsString;
        id_norm                           := myform.DataSetOsn.FieldByName('NORM_ID').AsInteger;
        cxTextEditYear.Text               := myform.DataSetOsn.FieldByName('NORM_YEAR').AsString;
        cxComboBoxMonth.Text              := myform.DataSetOsn.FieldByName('NORM_MONTH').AsString;
        cxButtonEditBuh_id_db_sch.Text    := myform.DataSetOsn.FieldByName('BUH_DB_SCH').AsString;
        cxButtonEditBuh_id_kr_sch.Text    := myform.DataSetOsn.FieldByName('BUH_KR_SCH').AsString;
        cxComboBoxMethod.Text             := myform.DataSetOsn.FieldByName('METHOD_NAME').AsString;
        id_metd                           := myform.DataSetOsn.FieldByName('ID_METHD').AsInteger ;
        cxCurrencyEditMinPrice.Text       := myform.DataSetOsn.FieldByName('MIN_PRICE').AsString;
        cxCurrencyEditPersent.Text        := myform.DataSetOsn.FieldByName('AMORT_PERC').AsString;
        cxComboBoxPeriodNach.ItemIndex    := myform.DataSetOsn.FieldByName('NORM_PER_PERIOD').AsInteger;

        cxButtonEdit_Nal_am_grp.Text      := myform.DataSetOsn.FieldByName('NAL_NAME_NORM').AsString;
        id_norm_nal                       := myform.DataSetOsn.FieldByName('NAL_NORM_ID').AsInteger;
        cxTextEdit_Nal_Year.Text          := myform.DataSetOsn.FieldByName('NAL_NORM_YEAR').AsString;
        cxComboBox_Nal_month.Text         := myform.DataSetOsn.FieldByName('NAL_NORM_MONTH').AsString;
        cxButtonEditNal_id_db_sch.Text    := myform.DataSetOsn.FieldByName('NAL_DB_SCH').AsString;
        cxButtonEditNal_id_kr_sch.Text    := myform.DataSetOsn.FieldByName('NAL_KR_SCH').AsString;
        cxComboBox_Nal_Method.Text        := myform.DataSetOsn.FieldByName('NAL_METHOD_NAME').AsString;
        id_metd_nal                       := myform.DataSetOsn.FieldByName('ID_METHD_NAL').AsInteger;
        cxCurrencyEdit_Nal_Min_Price.Text := myform.DataSetOsn.FieldByName('NAL_MIN_PRICE').AsString;
        cxCurrencyEdit_Nal_Percent.Text   := myform.DataSetOsn.FieldByName('NAL_AMORT_PERC').AsString;
        cxComboBox_Nal_Per_Nach.ItemIndex := myform.DataSetOsn.FieldByName('NAL_NORM_PER_PERIOD').AsInteger;
        grp_id                            := myform.DataSetKart.FieldByName('WORKED').AsInteger;
        cxTextEditFullInvNum.Text         := myform.DataSetKart.FieldByName('FULL_INV').AsString;
        if myform.DataSetKart.FieldByName('NAME_FULL').Value<>null then
        cxMemoFullName.Text               := myform.DataSetKart.FieldByName('NAME_FULL').AsString
        else cxMemoFullName.Text:='';

        cxTextEditBegPriceNal.Text        := myform.DataSetKart.FieldByName('BEG_PRICE_NAL').AsString;
        cxTextEditBegIznosNal.Text        := myform.DataSetKart.FieldByName('BEG_IZNOS_NAL').AsString;
        cxTextEditOstPriceNal.Text        := myform.DataSetKart.FieldByName('OST_PRICE_NAL').AsString;
        cxTextEditOstIznosNal.Text        := myform.DataSetKart.FieldByName('OST_IZNOS_NAL').AsString;

        if (myform.DataSetOsn.FieldByName('DATE_CREATE').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_CREATE').AsString = '30.12.2999') then
        begin
            cxDateEditDateCreate.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_REG').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_REG').AsString = '30.12.2999') then
        begin
            cxDateEditDateReg.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_UPDATE').Asstring = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_UPDATE').AsString= '30.12.2999') then
        begin
            cxDateEditDateUpdate.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_OUT').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_OUT').AsString = '30.12.2999') then
        begin
            cxDateEditDateOut.Text         := '';
        end else
        begin
            cxDateEditDateOut.Text            := myform.DataSetOsn.FieldByName('DATE_OUT').AsString;
        end;

        if (cxDateEditDateCreate.Text = '30.12.1900') or (cxDateEditDateCreate.Text = '30.12.1899') then
        begin
            cxDateEditDateCreate.EditValue   := null;
        end;
        if (cxDateEditDateReg.Text = '30.12.1900') or (cxDateEditDateReg.Text = '30.12.1899') then
        begin
            cxDateEditDateReg.EditValue   := null;
        end;
                //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegPrice.Clear;
                    cxTextEditBegPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegPrice.Clear;
                cxTextEditBegPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegPrice.Clear;
                cxTextEditBegPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPrice.Clear;
                    cxTextEditOstPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegIznos.Clear;
                    cxTextEditBegIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegIznos.Clear;
                cxTextEditBegIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegIznos.Clear;
                cxTextEditBegIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznos.Clear;
                    cxTextEditOstIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxCurrencyEditMinPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEditMinPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxCurrencyEditMinPrice.Clear;
                    cxCurrencyEditMinPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEditMinPrice.Clear;
                cxCurrencyEditMinPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEditMinPrice.Clear;
                cxCurrencyEditMinPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxCurrencyEdit_Nal_Min_Price.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEdit_Nal_Min_Price.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxCurrencyEdit_Nal_Min_Price.Clear;
                    cxCurrencyEdit_Nal_Min_Price.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEdit_Nal_Min_Price.Clear;
                cxCurrencyEdit_Nal_Min_Price.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEdit_Nal_Min_Price.Clear;
                cxCurrencyEdit_Nal_Min_Price.Text :=zpt1+'0';
                d := 0;
            end;

        if is_check_buhg = 1 then
        begin
            cxCheckBox2.Checked := true;
        end else
        begin
            cxCheckBox2.Checked := false;
        end;

        if Is_check = 1 then
        begin
            cxCheckBox1.Checked := true;
        end else
        begin
            cxCheckBox1.Checked := false;
        end;

        if Is_check_nal = 0 then
        begin
          cxCheckBox1.Visible:=False;
          lbl3.Visible:=False;
          lbl4.Visible:=False;
          lbl5.Visible:=False;
          lbl6.Visible:=False;
          cxTextEditBegPriceNal.Visible:=False;
          cxTextEditOstPriceNal.Visible:=False;
          cxTextEditBegIznosNal.Visible:=False;
          cxTextEditOstIznosNal.Visible:=False;
        end
        else
        begin
          cxCheckBox1.Visible:=True;
          lbl3.Visible:=True;
          lbl4.Visible:=True;
          lbl5.Visible:=True;
          lbl6.Visible:=True;
          cxTextEditBegPriceNal.Visible:=True;
          cxTextEditOstPriceNal.Visible:=True;
          cxTextEditBegIznosNal.Visible:=True;
          cxTextEditOstIznosNal.Visible:=True;
        end;

    end;

    If FlagNaAdd = 3 then
    begin

        Caption                     := MAT_INV_system_name + MAT_INV_Add_Kart_Caption_na_AddKar;
        cxButtonAdd.Caption         := MAT_INV_Add;
        cxButtonClose.Caption       := MAT_INV_Cansel;
        if Is_check = 1 then
        begin
            cxCheckBox1.Checked := true;
        end else
        begin
            cxCheckBox1.Checked := false;
        end;

        Priznak_bloka                     := myform.DataSetOsn.fieldbyname('MATALO').AsInteger;
        is_check_buhg                     := myform.DataSetKart.fieldbyname('IS_BUHG_ACC').AsInteger;
        is_check_nal                      := myform.DataSetKart.fieldbyname('USE_IN_NALOG').AsInteger;
        id_man                            := myform.DataSetKart.fieldbyname('ID_MANS').AsInteger;
        id_nomn                           := myform.DataSetKart.fieldbyname('ID_NOMNS').AsInteger;
        id_sch                            := myform.DataSetKart.fieldbyname('ID_SCHS').AsInteger;
        id_sch_db                         := myform.DataSetOsn.fieldbyname('ID_BUH_DB').AsInteger;
        nal_sch_db                        := myform.DataSetOsn.fieldbyname('ID_NAL_DB').AsInteger;
        id_sch_kr                         := myform.DataSetOsn.fieldbyname('ID_BUH_KR').AsInteger;
        nal_sch_kr                        := myform.DataSetOsn.fieldbyname('ID_NAL_KR').AsInteger;

        cxButtonEditSelMOL.Text           := myform.DataSetKart.FieldByName('FIO_MOL').AsString + ' / '+myform.DataSetKart.FieldByName('NAME_DEPARTMENT').AsString;
        cxButtonEditSelNomn.Text          := myform.DataSetKart.FieldByName('NAME_KART').AsString;
        cxButtonEditSelSch.Text           := myform.DataSetKart.FieldByName('NUM_SCH').AsString; // +' '+ myform.DataSetKart.FieldByName('NAME_SCH').AsString;
        cxTextEditGrpNum.Text             := myform.DataSetKart.FieldByName('GRP_NUM').AsString;
        cxComboBoxTipKrt.Text             := myform.DataSetOsn.FieldByName('TIP_KRT').AsString;
        cxTextEditInvNum.Text             := myform.DataSetKart.FieldByName('INV_NUM').AsString;
        cxTextEditFullInvNum.Text         := myform.DataSetKart.FieldByName('FULL_INV').AsString;
        cxTextEditZavNum.Text             := myform.DataSetOsn.FieldByName('ZAV_NUM').AsString;
        cxTextEditPasNum.Text             := myform.DataSetOsn.FieldByName('PASS_NUM').AsString;
        cxTextEditKartNum.Text            := myform.DataSetOsn.FieldByName('KART_NUM').AsString;
        cxTextEditBegPrice.Text           := myform.DataSetOsn.FieldByName('BEG_PRICE').AsString;
        cxTextEditBegIznos.Text           := myform.DataSetOsn.FieldByName('BEG_IZNOS').AsString;
        cxTextEditOstPrice.Text           := myform.DataSetOsn.FieldByName('OST_PRICE').AsString;
        cxTextEditOstIznos.Text           := myform.DataSetOsn.FieldByName('OST_IZNOS').AsString;
        cxDateEditOst.Date                := myform.DataSetOsn.FieldByName('DATE_OST').AsDateTime;
        cxButtonEditSaveOst.Text          := ''; //myform.DataSetOsn.fieldbyname('OST_INFO').AsString;
        IS_SKLAD                          := myform.DataSetKart.FieldByName('IS_SKLAD').AsInteger;
        BalPrice                          := myform.DataSetOsn.FieldByName('BAL_PRICE').AsString;
        cxButtonEditShowBal.Text          := BalPrice;
        Combo_box_IS_INV_OBJ.ItemIndex    := myform.DataSetKart.fieldbyname('IS_INV_OBJ').AsInteger;
        
        if Is_check_nal = 0 then
        begin
          cxCheckBox1.Visible:=False;
          lbl3.Visible:=False;
          lbl4.Visible:=False;
          lbl5.Visible:=False;
          lbl6.Visible:=False;
          cxTextEditBegPriceNal.Visible:=False;
          cxTextEditOstPriceNal.Visible:=False;
          cxTextEditBegIznosNal.Visible:=False;
          cxTextEditOstIznosNal.Visible:=False;
        end
        else
        begin
          cxCheckBox1.Visible:=True;
          lbl3.Visible:=True;
          lbl4.Visible:=True;
          lbl5.Visible:=True;
          lbl6.Visible:=True;
          cxTextEditBegPriceNal.Visible:=True;
          cxTextEditOstPriceNal.Visible:=True;
          cxTextEditBegIznosNal.Visible:=True;
          cxTextEditOstIznosNal.Visible:=True;
        end;

//        if myform.DataSetKart.FieldByName('ID_OST').AsString = '' then
//        begin
            id_ost := 0;
            CheckBoxOst.Checked           := true;
            cxButtonEditSaveOst.Enabled   := False;
//        end else
//        begin
//            id_ost                        := StrToInt(myform.DataSetKart.FieldByName('ID_OST').AsString);
//            CheckBoxOst.Checked           := false;
//            cxButtonEditSaveOst.Enabled   := true;
//        end;

        {if Priznak_bloka = 1 then
        begin
            cxTextEditBegPrice.Enabled    := false;
            cxTextEditBegIznos.Enabled    := false;
            cxButtonEditShowBal.Enabled   := true;
        end else
        begin}
            cxButtonEditShowBal.Enabled := false;
        {end;}

       { if (myform.DataSetOsn.FieldByName('DATE_OPR').AsDateTime = StrToDateTime('30.12.1899')) then
        begin
            cxDateEditOpr.EditValue   := null;
        end else
        begin
            cxDateEditOpr.Date                := myform.DataSetOsn.FieldByName('DATE_OPR').AsDateTime;
        end;
        if (myform.DataSetOsn.FieldByName('DATE_EXPL').AsDateTime = StrToDateTime('30.12.1899')) then
        begin
            cxDateEditDateExpl.EditValue   := null;
        end else
        begin
            cxDateEditDateExpl.Date           := myform.DataSetOsn.FieldByName('DATE_EXPL').AsDateTime;
        end;
        id_oper_opr                       := StrToInt64(myform.DataSetOsn.FieldByName('ID_OPER_OPR').AsString);
        id_oper_expl                      := StrToInt64(myform.DataSetOsn.FieldByName('ID_OPER_EXPL').AsString);

        cxDateEditDateUpdate.Text         := myform.DataSetOsn.FieldByName('DATE_UPDATE').AsString;
        }
        //***************** Только для 3
        cxDateEditOpr.EditValue          := null;
        cxDateEditDateExpl.EditValue     := null;
        cxDateEditDateUpdate.EditValue   := null;
        cxDateEditDateOut.EditValue      := null;
        id_oper_opr                      := 0;
        id_oper_expl                     := 0;

        //*****************

        cxDateEditDateCreate.Date         := myform.DataSetOsn.FieldByName('DATE_CREATE').AsDateTime;
        rstemp                            := myform.DataSetOsn.FieldByName('ID_CUST').AsString;
        cxTextEditDocReg.Text             := myform.DataSetOsn.FieldByName('DOC_REG').AsString;
        cxDateEditDateReg.Date            := myform.DataSetOsn.FieldByName('DATE_REG').AsDateTime;
        cxTextEditModel.Text              := myform.DataSetOsn.FieldByName('MODEL').AsString;
        cxTextEditMark.Text               := myform.DataSetOsn.FieldByName('MARK').AsString;
        cxMemoNote.Text                   := myform.DataSetOsn.FieldByName('NOTE').AsString;

        cxButtonEditID_Am_grp.Text        := myform.DataSetOsn.FieldByName('NAME_NORM').AsString;
        id_norm                           := myform.DataSetOsn.FieldByName('NORM_ID').AsInteger;
        cxTextEditYear.Text               := myform.DataSetOsn.FieldByName('NORM_YEAR').AsString;
        cxComboBoxMonth.Text              := myform.DataSetOsn.FieldByName('NORM_MONTH').AsString;
        cxButtonEditBuh_id_db_sch.Text    := myform.DataSetOsn.FieldByName('BUH_DB_SCH').AsString;
        cxButtonEditBuh_id_kr_sch.Text    := myform.DataSetOsn.FieldByName('BUH_KR_SCH').AsString;
        cxComboBoxMethod.Text             := myform.DataSetOsn.FieldByName('METHOD_NAME').AsString;
        id_metd                           := myform.DataSetOsn.FieldByName('ID_METHD').AsInteger ;
        cxCurrencyEditMinPrice.Text       := myform.DataSetOsn.FieldByName('MIN_PRICE').AsString;
        cxCurrencyEditPersent.Text        := myform.DataSetOsn.FieldByName('AMORT_PERC').AsString;
        cxComboBoxPeriodNach.ItemIndex    := myform.DataSetOsn.FieldByName('NORM_PER_PERIOD').AsInteger;

        cxButtonEdit_Nal_am_grp.Text      := myform.DataSetOsn.FieldByName('NAL_NAME_NORM').AsString;
        id_norm_nal                       := myform.DataSetOsn.FieldByName('NAL_NORM_ID').AsInteger;
        cxTextEdit_Nal_Year.Text          := myform.DataSetOsn.FieldByName('NAL_NORM_YEAR').AsString;
        cxComboBox_Nal_month.Text         := myform.DataSetOsn.FieldByName('NAL_NORM_MONTH').AsString;
        cxButtonEditNal_id_db_sch.Text    := myform.DataSetOsn.FieldByName('NAL_DB_SCH').AsString;
        cxButtonEditNal_id_kr_sch.Text    := myform.DataSetOsn.FieldByName('NAL_KR_SCH').AsString;
        cxComboBox_Nal_Method.Text        := myform.DataSetOsn.FieldByName('NAL_METHOD_NAME').AsString;
        id_metd_nal                       := myform.DataSetOsn.FieldByName('ID_METHD_NAL').AsInteger;
        cxCurrencyEdit_Nal_Min_Price.Text := myform.DataSetOsn.FieldByName('NAL_MIN_PRICE').AsString;
        cxCurrencyEdit_Nal_Percent.Text   := myform.DataSetOsn.FieldByName('NAL_AMORT_PERC').AsString;
        cxComboBox_Nal_Per_Nach.ItemIndex := myform.DataSetOsn.FieldByName('NAL_NORM_PER_PERIOD').AsInteger;
        grp_id                            := myform.DataSetKart.FieldByName('WORKED').AsInteger;
        if myform.DataSetKart.FieldByName('NAME_FULL').Value<>null then
        cxMemoFullName.Text               := myform.DataSetKart.FieldByName('NAME_FULL').AsString
        else cxMemoFullName.Text:='';

        cxTextEditBegPriceNal.Text        := myform.DataSetKart.FieldByName('BEG_PRICE_NAL').AsString;
        cxTextEditBegIznosNal.Text        := myform.DataSetKart.FieldByName('BEG_IZNOS_NAL').AsString;
        cxTextEditOstPriceNal.Text        := myform.DataSetKart.FieldByName('OST_PRICE_NAL').AsString;
        cxTextEditOstIznosNal.Text        := myform.DataSetKart.FieldByName('OST_IZNOS_NAL').AsString;

        if (cxDateEditDateCreate.Text = '30.12.1900') or (cxDateEditDateCreate.Text = '30.12.1899') then
        begin
            cxDateEditDateCreate.EditValue   := null;
        end;
        if (cxDateEditDateReg.Text = '30.12.1900') or (cxDateEditDateReg.Text = '30.12.1899') then
        begin
            cxDateEditDateReg.EditValue   := null;
        end;
        if cxDateEditDateUpdate.Text = '30.12.1900' then
        begin
            cxDateEditDateUpdate.EditValue   := null;
        end;
        if cxDateEditDateOut.Text = '30.12.1900' then
        begin
            cxDateEditDateOut.EditValue   := null;
        end;

        if is_check_buhg = 1 then
        begin
            cxCheckBox2.Checked := true;
        end else
        begin
            cxCheckBox2.Checked := false;
        end;

        if Is_check = 1 then
        begin
            cxCheckBox1.Checked := true;
        end else
        begin
            cxCheckBox1.Checked := false;
        end;


        inv_full                              := cxTextEditFullInvNum.Text;

        //**********  Определение следующего номера карточки    ***********************
        try
           StoredProcWorkWithFullInv.Close;
           StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
           StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
           StoredProcWorkWithFullInv.Transaction.StartTransaction;
           StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_DOP_DATA';
           StoredProcWorkWithFullInv.Prepare;
           StoredProcWorkWithFullInv.ExecProc;
           cxTextEditKartNum.Text             := IntToStr(StoredProcWorkWithFullInv.ParamByName('max_kart_num').AsInteger + 1);
        except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           StoredProcWorkWithFullInv.Transaction.Commit;
        //**********  Конец этого действа   ********************************************

        if (myform.DataSetOsn.FieldByName('DATE_CREATE').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_CREATE').AsString = '30.12.2999') then
        begin
            cxDateEditDateCreate.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_REG').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_REG').AsString = '30.12.2999') then
        begin
            cxDateEditDateReg.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_OPR').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_OPR').AsString = '30.12.2999') then
        begin
            cxDateEditOpr.EditValue   := null;
        end;
        if (myform.DataSetOsn.FieldByName('DATE_EXPL').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_EXPL').AsString = '30.12.2999') then
        begin
            cxDateEditDateExpl.EditValue   := null;
        end;
        if (myform.DataSetOsn.FieldByName('DATE_UPDATE').Asstring = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_UPDATE').AsString= '30.12.2999') then
        begin
            cxDateEditDateUpdate.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_OUT').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_OUT').AsString = '30.12.2999') then
        begin
            cxDateEditDateOut.Text         := '';
        end else
        begin
            cxDateEditDateOut.Text            := myform.DataSetOsn.FieldByName('DATE_OUT').AsString;
        end;
//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxButtonEditShowBal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxButtonEditShowBal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxButtonEditShowBal.Clear;
                    cxButtonEditShowBal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxButtonEditShowBal.Clear;
                cxButtonEditShowBal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxButtonEditShowBal.Clear;
                cxButtonEditShowBal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************

 //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegPrice.Clear;
                    cxTextEditBegPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegPrice.Clear;
                cxTextEditBegPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegPrice.Clear;
                cxTextEditBegPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPrice.Clear;
                    cxTextEditOstPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegIznos.Clear;
                    cxTextEditBegIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegIznos.Clear;
                cxTextEditBegIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegIznos.Clear;
                cxTextEditBegIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznos.Clear;
                    cxTextEditOstIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxCurrencyEditMinPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEditMinPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxCurrencyEditMinPrice.Clear;
                    cxCurrencyEditMinPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEditMinPrice.Clear;
                cxCurrencyEditMinPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEditMinPrice.Clear;
                cxCurrencyEditMinPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxCurrencyEdit_Nal_Min_Price.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEdit_Nal_Min_Price.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxCurrencyEdit_Nal_Min_Price.Clear;
                    cxCurrencyEdit_Nal_Min_Price.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEdit_Nal_Min_Price.Clear;
                cxCurrencyEdit_Nal_Min_Price.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEdit_Nal_Min_Price.Clear;
                cxCurrencyEdit_Nal_Min_Price.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
    end;

    If FlagNaAdd = 1 then
    begin

        if Is_check = 1 then
        begin
                cxCheckBox1.Checked := true;
        end else
           begin
                cxCheckBox1.Checked := false;
           end;
        cxButtonClose.Caption             := MAT_INV_Cansel;
        cxButtonAdd.Caption               := MAT_INV_Change;
        Caption                           := MAT_INV_system_name + MAT_INV_Add_Kart_Caption_na_change;

        Priznak_bloka                     := myform.DataSetOsn.fieldbyname('MATALO').AsInteger;
       // showmessage(IntToStr(Priznak_bloka));
        is_check_buhg                     := myform.DataSetKart.fieldbyname('IS_BUHG_ACC').AsInteger;
        is_check_nal                      := myform.DataSetKart.fieldbyname('USE_IN_NALOG').AsInteger;
        id_man                            := myform.DataSetKart.fieldbyname('ID_MANS').AsInteger;
        id_nomn                           := myform.DataSetKart.fieldbyname('ID_NOMNS').AsInteger;
        id_sch                            := myform.DataSetKart.fieldbyname('ID_SCHS').AsInteger;
        id_sch_db                         := myform.DataSetOsn.fieldbyname('ID_BUH_DB').AsInteger;
        nal_sch_db                        := myform.DataSetOsn.fieldbyname('ID_NAL_DB').AsInteger;
        id_sch_kr                         := myform.DataSetOsn.fieldbyname('ID_BUH_KR').AsInteger;
        nal_sch_kr                        := myform.DataSetOsn.fieldbyname('ID_NAL_KR').AsInteger;

        cxButtonEditSelMOL.Text           := myform.DataSetKart.FieldByName('FIO_MOL').AsString + ' / '+myform.DataSetKart.FieldByName('NAME_DEPARTMENT').AsString;
        cxButtonEditSelNomn.Text          := myform.DataSetKart.FieldByName('NAME_KART').AsString;
        cxButtonEditSelSch.Text           := myform.DataSetKart.FieldByName('NUM_SCH').AsString; // +' '+ myform.DataSetKart.FieldByName('NAME_SCH').AsString;
        cxTextEditGrpNum.Text             := myform.DataSetKart.FieldByName('GRP_NUM').AsString;
        cxComboBoxTipKrt.Text             := myform.DataSetOsn.FieldByName('TIP_KRT').AsString;
        cxTextEditInvNum.Text             := myform.DataSetKart.FieldByName('INV_NUM').AsString;
        cxTextEditFullInvNum.Text         := myform.DataSetKart.FieldByName('FULL_INV').AsString;
        cxTextEditZavNum.Text             := myform.DataSetOsn.FieldByName('ZAV_NUM').AsString;
        cxTextEditPasNum.Text             := myform.DataSetOsn.FieldByName('PASS_NUM').AsString;
        cxTextEditKartNum.Text            := myform.DataSetOsn.FieldByName('KART_NUM').AsString;
        cxTextEditBegPrice.Text           := myform.DataSetOsn.FieldByName('BEG_PRICE').AsString;
        cxTextEditBegIznos.Text           := myform.DataSetOsn.FieldByName('BEG_IZNOS').AsString;
        cxTextEditOstPrice.Text           := myform.DataSetOsn.FieldByName('OST_PRICE').AsString;
        cxTextEditOstIznos.Text           := myform.DataSetOsn.FieldByName('OST_IZNOS').AsString;
        cxDateEditOst.Date                := myform.DataSetOsn.FieldByName('DATE_OST').AsDateTime;
        cxButtonEditSaveOst.Text          := myform.DataSetOsn.fieldbyname('OST_INFO').AsString;
        IS_SKLAD                          := myform.DataSetKart.FieldByName('IS_SKLAD').AsInteger;
        BalPrice                          := myform.DataSetOsn.FieldByName('BAL_PRICE').AsString;
        cxButtonEditShowBal.Text          := BalPrice;
        Combo_box_IS_INV_OBJ.ItemIndex    := myform.DataSetKart.fieldbyname('IS_INV_OBJ').AsInteger;

         if Is_check_nal = 0 then
        begin
          cxCheckBox1.Visible:=False;
          lbl3.Visible:=False;
          lbl4.Visible:=False;
          lbl5.Visible:=False;
          lbl6.Visible:=False;
          cxTextEditBegPriceNal.Visible:=False;
          cxTextEditOstPriceNal.Visible:=False;
          cxTextEditBegIznosNal.Visible:=False;
          cxTextEditOstIznosNal.Visible:=False;
        end
        else
        begin
          cxCheckBox1.Visible:=True;
          lbl3.Visible:=True;
          lbl4.Visible:=True;
          lbl5.Visible:=True;
          lbl6.Visible:=True;
          cxTextEditBegPriceNal.Visible:=True;
          cxTextEditOstPriceNal.Visible:=True;
          cxTextEditBegIznosNal.Visible:=True;
          cxTextEditOstIznosNal.Visible:=True;
        end;

       if myform.DataSetKart.FieldByName('ID_OST').AsString = '' then
        begin
            id_ost := 0;
            CheckBoxOst.Checked           := true;
            cxButtonEditSaveOst.Enabled   := False;
        end else
        begin
            id_ost                        := StrToInt(myform.DataSetKart.FieldByName('ID_OST').AsString);
            CheckBoxOst.Checked           := false;
            cxButtonEditSaveOst.Enabled   := true;
        end;

        if Priznak_bloka = 1 then
        begin
            cxTextEditBegPrice.Enabled    := false;
            cxTextEditBegIznos.Enabled    := false;
            cxButtonEditShowBal.Enabled   := true;
        end else
        begin
            cxButtonEditShowBal.Enabled := false;
        end;

        if (myform.DataSetOsn.FieldByName('DATE_OPR').AsDateTime = StrToDateTime('30.12.1899')) then
        begin
            cxDateEditOpr.EditValue   := null;
        end else
        begin
            cxDateEditOpr.Date                := myform.DataSetOsn.FieldByName('DATE_OPR').AsDateTime;
        end;
        if (myform.DataSetOsn.FieldByName('DATE_EXPL').AsDateTime = StrToDateTime('30.12.1899')) then
        begin
            cxDateEditDateExpl.EditValue   := null;
        end else
        begin
            cxDateEditDateExpl.Date           := myform.DataSetOsn.FieldByName('DATE_EXPL').AsDateTime;
        end;
        id_oper_opr                       := StrToInt64(myform.DataSetOsn.FieldByName('ID_OPER_OPR').AsString);
        id_oper_expl                      := StrToInt64(myform.DataSetOsn.FieldByName('ID_OPER_EXPL').AsString);

        cxDateEditDateUpdate.Text         := myform.DataSetOsn.FieldByName('DATE_UPDATE').AsString;

        cxDateEditDateCreate.Date         := myform.DataSetOsn.FieldByName('DATE_CREATE').AsDateTime;
        rstemp                            := myform.DataSetOsn.FieldByName('ID_CUST').AsString;
        cxTextEditDocReg.Text             := myform.DataSetOsn.FieldByName('DOC_REG').AsString;
        cxDateEditDateReg.Date            := myform.DataSetOsn.FieldByName('DATE_REG').AsDateTime;
        cxTextEditModel.Text              := myform.DataSetOsn.FieldByName('MODEL').AsString;
        cxTextEditMark.Text               := myform.DataSetOsn.FieldByName('MARK').AsString;
        cxMemoNote.Text                   := myform.DataSetOsn.FieldByName('NOTE').AsString;

        cxButtonEditID_Am_grp.Text        := myform.DataSetOsn.FieldByName('NAME_NORM').AsString;
        if myform.DataSetOsn.FieldByName('NORM_ID').Value = null then id_norm:=0 else
        id_norm                           := myform.DataSetOsn.FieldByName('NORM_ID').AsInteger;
        cxTextEditYear.Text               := myform.DataSetOsn.FieldByName('NORM_YEAR').AsString;
        cxComboBoxMonth.Text              := myform.DataSetOsn.FieldByName('NORM_MONTH').AsString;
        cxButtonEditBuh_id_db_sch.Text    := myform.DataSetOsn.FieldByName('BUH_DB_SCH').AsString;
        cxButtonEditBuh_id_kr_sch.Text    := myform.DataSetOsn.FieldByName('BUH_KR_SCH').AsString;
        cxComboBoxMethod.Text             := myform.DataSetOsn.FieldByName('METHOD_NAME').AsString;
        if myform.DataSetOsn.FieldByName('ID_METHD').Value = null then id_metd:=0 else
        id_metd                           := myform.DataSetOsn.FieldByName('ID_METHD').AsInteger ;
        cxCurrencyEditMinPrice.Text       := myform.DataSetOsn.FieldByName('MIN_PRICE').AsString;
        cxCurrencyEditPersent.Text        := myform.DataSetOsn.FieldByName('AMORT_PERC').AsString;

        cxComboBoxPeriodNach.ItemIndex    := myform.DataSetOsn.FieldByName('NORM_PER_PERIOD').AsInteger;

        cxButtonEdit_Nal_am_grp.Text      := myform.DataSetOsn.FieldByName('NAL_NAME_NORM').AsString;
        if myform.DataSetOsn.FieldByName('NAL_NORM_ID').Value=null then id_norm_nal:=0 else
        id_norm_nal                       := myform.DataSetOsn.FieldByName('NAL_NORM_ID').AsInteger;
        cxTextEdit_Nal_Year.Text          := myform.DataSetOsn.FieldByName('NAL_NORM_YEAR').AsString;
        cxComboBox_Nal_month.Text         := myform.DataSetOsn.FieldByName('NAL_NORM_MONTH').AsString;
        cxButtonEditNal_id_db_sch.Text    := myform.DataSetOsn.FieldByName('NAL_DB_SCH').AsString;
        cxButtonEditNal_id_kr_sch.Text    := myform.DataSetOsn.FieldByName('NAL_KR_SCH').AsString;
        cxComboBox_Nal_Method.Text        := myform.DataSetOsn.FieldByName('NAL_METHOD_NAME').AsString;
        if myform.DataSetOsn.FieldByName('ID_METHD_NAL').Value=null then id_metd_nal:=0 else
        id_metd_nal                       := myform.DataSetOsn.FieldByName('ID_METHD_NAL').AsInteger;
        cxCurrencyEdit_Nal_Min_Price.Text := myform.DataSetOsn.FieldByName('NAL_MIN_PRICE').AsString;
        cxCurrencyEdit_Nal_Percent.Text   := myform.DataSetOsn.FieldByName('NAL_AMORT_PERC').AsString;
        cxComboBox_Nal_Per_Nach.ItemIndex := myform.DataSetOsn.FieldByName('NAL_NORM_PER_PERIOD').AsInteger;
        grp_id                            := myform.DataSetKart.FieldByName('WORKED').AsInteger;
        if myform.DataSetKart.FieldByName('NAME_FULL').Value<>null then
        cxMemoFullName.Text               := myform.DataSetKart.FieldByName('NAME_FULL').AsString
        else cxMemoFullName.Text:='';
       
        cxTextEditBegPriceNal.Text        := myform.DataSetKart.FieldByName('BEG_PRICE_NAL').AsString;
        cxTextEditBegIznosNal.Text        := myform.DataSetKart.FieldByName('BEG_IZNOS_NAL').AsString;
        cxTextEditOstPriceNal.Text        := myform.DataSetKart.FieldByName('OST_PRICE_NAL').AsString;
        cxTextEditOstIznosNal.Text        := myform.DataSetKart.FieldByName('OST_IZNOS_NAL').AsString;

        if (cxDateEditDateCreate.Text = '30.12.1900') or (cxDateEditDateCreate.Text = '30.12.1899') then
        begin
            cxDateEditDateCreate.EditValue   := null;
        end;
        if (cxDateEditDateReg.Text = '30.12.1900') or (cxDateEditDateReg.Text = '30.12.1899') then
        begin
            cxDateEditDateReg.EditValue   := null;
        end;
        if cxDateEditDateUpdate.Text = '30.12.1900' then
        begin
            cxDateEditDateUpdate.EditValue   := null;
        end;
        if cxDateEditDateOut.Text = '30.12.1900' then
        begin
            cxDateEditDateOut.EditValue   := null;
        end;


        if is_check_buhg = 1 then
        begin
            cxCheckBox2.Checked := true;

        end else
        begin
            cxCheckBox2.Checked := false;
        end;

        if Is_check = 1 then
        begin
            cxCheckBox1.Checked := true;
        end else
        begin
            cxCheckBox1.Checked := false;
        end;



//**********  Определение полного инвентарного номера    ***********************
//showMessage('id_sch='+IntToStr(id_sch)+'id_nomn='+IntToStr(id_nomn));
       { try
           StoredProcWorkWithFullInv.Close;
           StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
           StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
           StoredProcWorkWithFullInv.Transaction.StartTransaction;
           StoredProcWorkWithFullInv.StoredProcName:='MAT_GEN_INV_NUM_IF_UPDATE';
           StoredProcWorkWithFullInv.Prepare;
           StoredProcWorkWithFullInv.ParamByName('ID_SCH').AsInt64       := id_sch;
           StoredProcWorkWithFullInv.ParamByName('ID_NOMN').AsInt64      := id_nomn;
           StoredProcWorkWithFullInv.ExecProc;
           cxTextEditFullInvNum.Text             := StoredProcWorkWithFullInv.ParamByName('INV_NUM_FULL').AsString;
           cxTextEditInvNum.Text                 := StoredProcWorkWithFullInv.ParamByName('INV_NUM').AsString;
           cxTextEditGrpNum.Text                 := StoredProcWorkWithFullInv.ParamByName('GRP_NUM').AsString;
}
           inv_full                              := cxTextEditFullInvNum.Text;
{        except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           StoredProcWorkWithFullInv.Transaction.Commit;
//**********  Конец этого действа   ********************************************
 }      if (myform.DataSetOsn.FieldByName('DATE_CREATE').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_CREATE').AsString = '30.12.2999') then
        begin
            cxDateEditDateCreate.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_REG').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_REG').AsString = '30.12.2999') then
        begin
            cxDateEditDateReg.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_OPR').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_OPR').AsString = '30.12.2999') then
        begin
            cxDateEditOpr.EditValue   := null;
        end;
        if (myform.DataSetOsn.FieldByName('DATE_EXPL').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_EXPL').AsString = '30.12.2999') then
        begin
            cxDateEditDateExpl.EditValue   := null;
        end;
        if (myform.DataSetOsn.FieldByName('DATE_UPDATE').Asstring = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_UPDATE').AsString= '30.12.2999') then
        begin
            cxDateEditDateUpdate.Text  := '';
        end;
        if (myform.DataSetOsn.FieldByName('DATE_OUT').AsString = '30.12.1899') or (myform.DataSetOsn.FieldByName('DATE_OUT').AsString = '30.12.2999') then
        begin
            cxDateEditDateOut.Text         := '';
        end else
        begin
            cxDateEditDateOut.Text            := myform.DataSetOsn.FieldByName('DATE_OUT').AsString;
        end;
//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxButtonEditShowBal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxButtonEditShowBal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxButtonEditShowBal.Clear;
                    cxButtonEditShowBal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxButtonEditShowBal.Clear;
                cxButtonEditShowBal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxButtonEditShowBal.Clear;
                cxButtonEditShowBal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************

 //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegPrice.Clear;
                    cxTextEditBegPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegPrice.Clear;
                cxTextEditBegPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegPrice.Clear;
                cxTextEditBegPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPrice.Clear;
                    cxTextEditOstPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegIznos.Clear;
                    cxTextEditBegIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegIznos.Clear;
                cxTextEditBegIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegIznos.Clear;
                cxTextEditBegIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznos.Clear;
                    cxTextEditOstIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxCurrencyEditMinPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEditMinPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxCurrencyEditMinPrice.Clear;
                    cxCurrencyEditMinPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEditMinPrice.Clear;
                cxCurrencyEditMinPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEditMinPrice.Clear;
                cxCurrencyEditMinPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxCurrencyEdit_Nal_Min_Price.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEdit_Nal_Min_Price.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxCurrencyEdit_Nal_Min_Price.Clear;
                    cxCurrencyEdit_Nal_Min_Price.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEdit_Nal_Min_Price.Clear;
                cxCurrencyEdit_Nal_Min_Price.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEdit_Nal_Min_Price.Clear;
                cxCurrencyEdit_Nal_Min_Price.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************

    end;
    BegPrice := cxTextEditBegPrice.Text;
    OstIznos := cxTextEditOstIznos.Text;
    OstPrice := cxTextEditOstPrice.Text;
    BegIznos := cxTextEditBegIznos.Text;

    BegPriceNal := cxTextEditBegPriceNal.Text;
    OstIznosNal := cxTextEditOstIznosNal.Text;
    OstPriceNal := cxTextEditOstPriceNal.Text;
    BegIznosNal := cxTextEditBegIznosNal.Text;
end;

procedure TfmInvKartAdd.cxButtonCloseClick(Sender: TObject);
begin
    myform.MrOkOrCancel := 1;
    Close;
end;

procedure TfmInvKartAdd.cxButtonEditSelMOLPropertiesButtonClick(
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
  if @SpravFunc <> NIL then Res := SpravFunc(self, myform.DatabaseMain.Handle, 0, id_man);
 end else begin
  ShowMessage(PChar('Error!'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
  id_man:=Res[0];
  cxButtonEditSelMOL.Text:=Res[1];
 end;
end;


procedure TfmInvKartAdd.cxButtonEditSelSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
begin
    res := GlobalSpr.GetSch(self, myform.DatabaseMain.Handle, fsNormal, date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_sch := res[0][0];
            cxButtonEditSelSch.Text := res[0][3];//+' - '+res[0][1];

            if (id_sch <> 0) and (id_nomn <> 0) and (priznak <> 1) then
            begin
            //**********  Определение полного инвентарного номера    ***********************
                try
                   StoredProcWorkWithFullInv.Close;
                   StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
                   StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
                   StoredProcWorkWithFullInv.Transaction.StartTransaction;
                   StoredProcWorkWithFullInv.StoredProcName:='MAT_GEN_INV_NUM';
                   StoredProcWorkWithFullInv.Prepare;
                   StoredProcWorkWithFullInv.ParamByName('ID_SCH').AsInt64       := id_sch;
                   StoredProcWorkWithFullInv.ParamByName('ID_NOMN').AsInt64      := id_nomn;
                   StoredProcWorkWithFullInv.ExecProc;
                   cxTextEditFullInvNum.Text             := StoredProcWorkWithFullInv.ParamByName('INV_NUM_FULL').AsString;
                   cxTextEditInvNum.Text                 := StoredProcWorkWithFullInv.ParamByName('INV_NUM').AsString;
                   cxTextEditGrpNum.Text                 := StoredProcWorkWithFullInv.ParamByName('GRP_NUM').AsString;

                   inv_full                              := cxTextEditFullInvNum.Text;
                except on E : Exception do
                     begin
                         ShowMessage(E.Message);
                         StoredProcWorkWithFullInv.Transaction.Rollback;
                         exit;
                     end;
                end;
                   StoredProcWorkWithFullInv.Transaction.Commit;
           //**********  Конец этого действа   ********************************************
           end;

        end;
    end;
end;

procedure TfmInvKartAdd.cxButtonEditSelNomnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : function (aOwner:TComponent;
                     DBHANDLE : TISC_DB_HANDLE;
                     aFS: TFormStyle;   {стиль формы: fsModal или fsMDIChild}
                     aID_USER : INT64; {ид.пользователя}
                     aID_NOMN: int64;  {ид.номенклатуры, если >0, то пытаемся позицироваться}
                     aID_PROP: int64;  {ид. свойства, если >0, то фильтруем записи по свойству, (пока не реализовано!)}
                     aNType: integer;  {фильтр на тип записей: 0 - все, 1 -  ТМЦ, 2 - услуги}
                     aMView: integer;  {пока не используется }
                     aMSelect:integer; {тип выбора записей: 0 - выбор одной записи, 1 - мультивыбор записей, 2 - выбор группы }
                     aLang: integer =0 {язык интерфейса: 0 - русский (по умолчанию), 1 - украинский}
  ):Variant;stdcall;
 Res:Variant;
 sResult: string;
 sender_id_nomn : int64;
begin
 if FlagNaAdd = 0 then
 begin
     sender_id_nomn := 0;
 end else
 begin
     sender_id_nomn := id_nomn;
 end;
 hPack := GetModuleHandle('SpNom.bpl');
 if hPack < 32 then hPack := LoadPackage(ExtractFilePath(Application.ExeName)+ 'SpNom.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetNomnEx'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, myform.DatabaseMain.Handle, fsNormal, 0, sender_id_nomn, 0, 0, 0, 0, 0);
 end else begin
  ShowMessage(PChar('Error!'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
  id_nomn:=Res[0];
  cxButtonEditSelNomn.Text:=Res[1];
  if id_sch=0 then
  begin
   id_sch:=Res[5];
   cxButtonEditSelSch.Text:=res[7];
  end;
  if ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
  begin
      cxTextEditBegPrice.Text :=Res[4];
      //cxTextEditOstPrice.Text :=Res[4];
  end;

  if (id_sch <> 0) and (id_nomn <> 0) then
            begin
            //**********  Определение полного инвентарного номера    ***********************
                try
                   StoredProcWorkWithFullInv.Close;
                   StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
                   StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
                   StoredProcWorkWithFullInv.Transaction.StartTransaction;
                   StoredProcWorkWithFullInv.StoredProcName:='MAT_GEN_INV_NUM';
                   StoredProcWorkWithFullInv.Prepare;
                   StoredProcWorkWithFullInv.ParamByName('ID_SCH').AsInt64       := id_sch;
                   StoredProcWorkWithFullInv.ParamByName('ID_NOMN').AsInt64      := id_nomn;
                   StoredProcWorkWithFullInv.ExecProc;
                   cxTextEditFullInvNum.Text             := StoredProcWorkWithFullInv.ParamByName('INV_NUM_FULL').AsString;
                   cxTextEditInvNum.Text                 := StoredProcWorkWithFullInv.ParamByName('INV_NUM').AsString;
                   cxTextEditGrpNum.Text                 := StoredProcWorkWithFullInv.ParamByName('GRP_NUM').AsString;

                   inv_full                              := cxTextEditFullInvNum.Text;
                except on E : Exception do
                     begin
                         ShowMessage(E.Message);
                         StoredProcWorkWithFullInv.Transaction.Rollback;
                         exit;
                     end;
                end;
                   StoredProcWorkWithFullInv.Transaction.Commit;
           //**********  Конец этого действа   ********************************************
           end;

 end;

end;

procedure TfmInvKartAdd.cxTextEditBegIznosExit(Sender: TObject);
var
    i : integer;
begin
    //**********************************************************************
   {     prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPrice.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//
     if cxTextEditBegIznos.Text = '' then
    begin
        cxTextEditBegIznos.Text := '0,00';
    end;
     if cxTextEditBegPrice.Text = '' then
    begin
        //cxTextEditBegIznos.Clear;
        MessageBox(Handle, PChar(MAT_INV_Kart_enter_beg_price), PChar(MAT_INV_Attention), 16);
        cxTextEditBegPrice.SetFocus;
        exit;
    end;

If ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
begin
     if (cxTextEditBegIznos.Text = '') or (StrToCurr(cxTextEditBegIznos.Text) > StrToCurr(cxTextEditBegPrice.Text)) then
       begin
       MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
       cxTextEditBegIznos.SetFocus;
    end else
       begin
           cxTextEditOstPrice.Text:=CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstIznos.Text));
           //cxTextEditOstIznos.Text:=cxTextEditBegIznos.Text;
       end;
end;
If FlagNaAdd = 1 then
begin
     if (cxTextEditBegIznos.Text = '') or (StrToCurr(cxTextEditBegIznos.Text) > StrToCurr(cxTextEditBegPrice.Text)) then
       begin
       MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
       cxTextEditBegIznos.SetFocus;
    end else
       begin
           //cxTextEditOstIznos.Text:=CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstPrice.Text));
           cxTextEditOstIznos.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstPrice.Text));
           //cxTextEditOstPrice.Text:=CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstIznos.Text));
       end;

end;
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegIznos.Clear;
                    cxTextEditBegIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegIznos.Clear;
                cxTextEditBegIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegIznos.Clear;
                cxTextEditBegIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPrice.Clear;
                    cxTextEditOstPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznos.Clear;
                    cxTextEditOstIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
       } //**********************************************************************
    if cxTextEditBegPrice.Enabled = false then cxButtonEditShowBal.Enabled := true else cxButtonEditShowBal.Enabled := false;
end;

procedure TfmInvKartAdd.cxCheckBox11Click(Sender: TObject);
begin
     if cxCheckBox1.Checked       = True then
        begin
            cxGroupBox2.Visible  := True;
        end else
        begin
            cxGroupBox2.Visible  := False;
        end;
end;

procedure TfmInvKartAdd.cxButtonEditBuh_id_db_schPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
begin
    res := GlobalSpr.GetSch(self, myform.DatabaseMain.Handle, fsNormal, date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_sch_db := res[0][0];
            cxButtonEditBuh_id_db_sch.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;

procedure TfmInvKartAdd.cxButtonEditBuh_id_kr_schPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
begin
    res := GlobalSpr.GetSch(self, myform.DatabaseMain.Handle, fsNormal, date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_sch_kr := res[0][0];
            cxButtonEditBuh_id_kr_sch.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;

procedure TfmInvKartAdd.cxButtonEditID_Am_grpPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
begin
    res := uNormIznos.GetNorm(self, true);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) and (res[2]<>null) and (res[3]<>null) and (res[4]<>null) and (res[5]<>null) and (res[6]<>null) and (res[7]<>null) and (res[8]<>null) and (res[9]<>null) then
        begin
            id_norm := res[0];
            cxButtonEditID_Am_grp.Text := res[1];
            id_metd := res[2];
            cxComboBoxMethod.Text      := res[3];
            cxCurrencyEditPersent.Text := res[4];
            cxComboBoxPeriodNach.ItemIndex  := res[5];
            cxTextEditYear.Text             := res[6];
            cxComboBoxMonth.Text            := res[7];
            // ResultArray[8] := Self.DataSetNorma['FORMULA'];
            // ResultArray[9] := Self.DataSetNorma['TIP'];
            cxCurrencyEditMinPrice.SetFocus;
        end;
    end;
end;


procedure TfmInvKartAdd.cxButtonEditBuh_id_db_schExit(Sender: TObject);
begin
    cxButtonEditNal_id_db_sch.Text := cxButtonEditBuh_id_db_sch.Text;
    nal_sch_db:= id_sch_db;
end;

procedure TfmInvKartAdd.cxButtonEditBuh_id_kr_schExit(Sender: TObject);
begin
    cxButtonEditNal_id_kr_sch.Text := cxButtonEditBuh_id_kr_sch.Text;
    nal_sch_kr := id_sch_kr;
end;

procedure TfmInvKartAdd.cxButtonEditNal_id_db_schPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
begin
    res := GlobalSpr.GetSch(self, myform.DatabaseMain.Handle, fsNormal, date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            nal_sch_db := res[0][0];
            cxButtonEditNal_id_db_sch.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;

procedure TfmInvKartAdd.cxButtonEditNal_id_kr_schPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
begin
    res := GlobalSpr.GetSch(self, myform.DatabaseMain.Handle, fsNormal, date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            nal_sch_kr := res[0][0];
            cxButtonEditNal_id_kr_sch.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;

procedure TfmInvKartAdd.cxTextEditGrpNumKeyPress(Sender: TObject;
  var Key: Char);
begin
  //  if (key > '9') and (key < '0') then key := Chr(0);
end;

procedure TfmInvKartAdd.cxTextEditInvNumKeyPress(Sender: TObject;
  var Key: Char);
begin
//    if (key > '9') or (key < '0') then key := Chr(0);
end;

procedure TfmInvKartAdd.cxTextEditKartNumKeyPress(Sender: TObject;
  var Key: Char);
begin
//    if (key > '9') or (key < '0') then key := Chr(0);
end;

procedure TfmInvKartAdd.cxCurrencyEditPersentExit(Sender: TObject);
begin
    if cxCurrencyEditPersent.Text = '' then
    cxCurrencyEditPersent.Text := '0';
  if (StrToCurr(cxCurrencyEditPersent.Text)> 100) then
  begin
      showmessage('Превышено допустимое значение!');
      cxCurrencyEditPersent.SetFocus;
  end;
end;

procedure TfmInvKartAdd.cxCurrencyEdit_Nal_PercentExit(Sender: TObject);
begin
     if cxCurrencyEdit_Nal_Percent.Text = '' then
    cxCurrencyEdit_Nal_Percent.Text := '0';
     if (StrToCurr(cxCurrencyEdit_Nal_Percent.Text)> 100) then
     begin
        showmessage('Превышено допустимое значение!');
        cxCurrencyEdit_Nal_Percent.SetFocus;
     end;
end;

procedure TfmInvKartAdd.cxButtonEdit_Nal_am_grpPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
    gz  : boolean;
begin
    gz := false;
    res := uNormIznos.GetNorm(self, false);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) and (res[2]<>null) and (res[3]<>null) and (res[4]<>null) and (res[5]<>null) and (res[6]<>null) and (res[7]<>null) and (res[8]<>null) and (res[9]<>null) then
        begin
            id_norm_nal := res[0];
            cxButtonEdit_Nal_am_grp.Text := res[1];
            id_metd_nal := res[2];
            cxComboBox_Nal_Method.Text           := res[3];
            cxCurrencyEdit_Nal_Percent.Text      := res[4];
            cxComboBox_Nal_Per_Nach.ItemIndex    := res[5];
            cxTextEdit_Nal_Year.Text             := res[6];
            cxComboBox_Nal_month.Text            := res[7];
            // ResultArray[8] := Self.DataSetNorma['FORMULA'];
            // ResultArray[9] := Self.DataSetNorma['TIP'];
            cxCurrencyEdit_Nal_Min_Price.SetFocus;
        end;
    end;
end;

procedure TfmInvKartAdd.cxTextEditBegPriceKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
{    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditBegPrice.Text;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end; }
end;

procedure TfmInvKartAdd.cxTextEditBegIznosKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
{    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditBegIznos.Text;
        long_pole:= IntToStr(cxTextEditBegIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;  }
end;



procedure TfmInvKartAdd.cxTextEditOstPriceKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
{    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditOstPrice.Text;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;  }
end;

procedure TfmInvKartAdd.cxTextEditOstIznosKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
{    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditOstIznos.Text;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;      }
end;

procedure TfmInvKartAdd.cxCurrencyEditMinPriceKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxCurrencyEditMinPrice.Text;
        long_pole:= IntToStr(cxCurrencyEditMinPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmInvKartAdd.cxCurrencyEdit_Nal_Min_PriceKeyPress(
  Sender: TObject; var Key: Char);
var
   i: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxCurrencyEdit_Nal_Min_Price.Text;
        long_pole:= IntToStr(cxCurrencyEdit_Nal_Min_Price.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmInvKartAdd.cxButtonEditSelNomnKeyPress(Sender: TObject;
  var Key: Char);
begin
//    Key := Chr(0);
end;



procedure TfmInvKartAdd.cxCurrencyEditMinPriceExit(Sender: TObject);
var
    i : integer;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPrice.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//
     if cxCurrencyEditMinPrice.Text = '' then
    begin
        cxCurrencyEditMinPrice.Text := '0,00';
    end;

            prap_flag := 0;
        d         := 0;
        zpt := cxCurrencyEditMinPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEditMinPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxCurrencyEditMinPrice.Clear;
                    cxCurrencyEditMinPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEditMinPrice.Clear;
                cxCurrencyEditMinPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEditMinPrice.Clear;
                cxCurrencyEditMinPrice.Text :=zpt1+'0';
                d := 0;
            end;
end;

procedure TfmInvKartAdd.cxCurrencyEdit_Nal_Min_PriceExit(Sender: TObject);
var
    i : integer;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPrice.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//
     if cxCurrencyEdit_Nal_Min_Price.Text = '' then
    begin
        cxCurrencyEdit_Nal_Min_Price.Text := '0,00';
    end;

            prap_flag := 0;
        d         := 0;
        zpt := cxCurrencyEdit_Nal_Min_Price.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxCurrencyEdit_Nal_Min_Price.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxCurrencyEdit_Nal_Min_Price.Clear;
                    cxCurrencyEdit_Nal_Min_Price.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxCurrencyEdit_Nal_Min_Price.Clear;
                cxCurrencyEdit_Nal_Min_Price.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxCurrencyEdit_Nal_Min_Price.Clear;
                cxCurrencyEdit_Nal_Min_Price.Text :=zpt1+'0';
                d := 0;
            end;

end;


procedure TfmInvKartAdd.cxTextEditOstPriceExit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    //**********************************************************************
   {     prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPrice.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//
    if cxTextEditOstPrice.Text = '' then
    begin
        cxTextEditOstPrice.Text := '0,00';
    end;

If ((FlagNaAdd = 1) or (FlagNaAdd = 3)) then
begin
     if (cxTextEditBegPrice.Text = '') and (cxTextEditOstPrice.Text = '') then
       begin
           MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
           cxTextEditOstPrice.SetFocus;
       end else
       begin
           if (cxTextEditBegPrice.Enabled = false) then
           begin
               cxTextEditOstIznos.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstPrice.Text));
           end else
           begin
               cxTextEditOstIznos.Text := CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstPrice.Text));
           end;
       end;
end;

if (StrToCurr(cxTextEditOstIznos.Text) < 0) then
begin
     ShowMessage(MAT_INV_Otricatelnoe);
     cxTextEditBegPrice.Text := BegPrice;
     cxTextEditOstIznos.Text := OstIznos;
     cxTextEditOstPrice.Text := OstPrice;
     cxTextEditBegIznos.Text := BegIznos;
end;
     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPrice.Clear;
                    cxTextEditOstPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznos.Clear;
                    cxTextEditOstIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1+'0';
                d := 0;
            end;
    }    //**********************************************************************
    if cxTextEditOstPrice.Text='' then cxTextEditOstPrice.EditValue:=0;
    cxTextEditOstIznos.EditValue:=cxButtonEditShowBal.EditValue-cxTextEditOstPrice.EditValue;
    if cxTextEditBegPrice.Enabled = false then cxButtonEditShowBal.Enabled := true else cxButtonEditShowBal.Enabled := false;
end;

procedure TfmInvKartAdd.cxTextEditOstIznosExit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    //**********************************************************************
   {     cxTextEditOstPrice.Text:=CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstIznos.Text));
      //  cxTextEditOstPrice.Text:=CurrToStr(StrToCurr(cxButtonEditShowBal.Text)-StrToCurr(cxTextEditOstIznos.Text));

       prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPrice.Text := zpt1;
                end;
            end;
        end; 
      //**********************************************************************//
    if cxTextEditOstIznos.Text = '' then
    begin
        cxTextEditOstIznos.Text := '0,00';
    end;

If FlagNaAdd = 1 then
begin
     if (cxTextEditBegPrice.Text = '') and (cxTextEditOstIznos.Text = '') then
       begin
           MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
           cxTextEditOstIznos.SetFocus;
       end else
       begin
           if (cxTextEditBegPrice.Enabled = false) then
           begin
               cxTextEditOstPrice.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstIznos.Text));
           end else
           begin
               cxTextEditOstPrice.Text := CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstIznos.Text));
           end;
       end;
end;
if (StrToCurr(cxTextEditOstPrice.Text) < 0) then
begin
    ShowMessage(MAT_INV_Otricatelnoe);
    cxTextEditBegPrice.Text := BegPrice;
    cxTextEditOstIznos.Text := OstIznos;
    cxTextEditOstPrice.Text := OstPrice;
    cxTextEditBegIznos.Text := BegIznos;
end;
//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPrice.Clear;
                    cxTextEditOstPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1+'0';
                d := 0;
            end;
//**********************************************************************
//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznos.Clear;
                    cxTextEditOstIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1+'0';
                d := 0;
            end; }
//**********************************************************************
        if cxTextEditOstIznos.Text='' then cxTextEditOstIznos.EditValue:=0;
        cxTextEditOstPrice.EditValue:=cxButtonEditShowBal.EditValue-cxTextEditOstIznos.EditValue;

    if cxTextEditBegPrice.Enabled = false then cxButtonEditShowBal.Enabled := true else cxButtonEditShowBal.Enabled := false;


end;

procedure TfmInvKartAdd.Action1Execute(Sender: TObject);
var
    j, o, id, mans, noms, schs, GRP_ID_main : int64;
    T : TfmNormIznos;
    res : Variant;
    out_dat, opr_dat, expl_dat, Update_dat : string;
    inv, inv1, inv2, inv3, sch : String;
    inventarnik : String;
    grp : String;
    is_buhg_acc : integer;
    num_oper, name_full : string;
    oprihod, explua, is_inv_obj, is_expl : integer;
begin
 is_expl:=0;
 if _NOT_CHANGE_INV_NUM = 1 then
  if (cxDateEditDateExpl.Text<>'') and (cxDateEditDateOut.Text = '') then is_expl:=1 else is_expl:=0;
if (((FlagNaAdd = 1) or (FlagNaAdd = 0) or (FlagNaAdd = 3))and (is_expl=0)) then
begin
    If cxTextEditInvNum.Text <> inv_old_num then
    begin
    //**********  Определение полного инвентарного номера    ***********************
   { ShowMessage('id_sch='+Inttostr(id_sch)+', id_nomn='+Inttostr(id_nomn)+', IS_SKLAD='+IntToStr(IS_SKLAD)+
    ', INUM='+cxTextEditInvNum.Text+', GRPN='+cxTextEditGrpNum.Text);
    }    try
           StoredProcWorkWithFullInv.Close;
           StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
           StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
           StoredProcWorkWithFullInv.Transaction.StartTransaction;
           StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_GEN_INUM_FULL';
           StoredProcWorkWithFullInv.Prepare;
           StoredProcWorkWithFullInv.ParamByName('ID_SCH').AsInt64    := id_sch;
           StoredProcWorkWithFullInv.ParamByName('GRPN').AsString     := cxTextEditGrpNum.Text;
           StoredProcWorkWithFullInv.ParamByName('INUM').AsString     := cxTextEditInvNum.Text;
           StoredProcWorkWithFullInv.ParamByName('ID_NOMN').AsInt64   := id_nomn;
           StoredProcWorkWithFullInv.ParamByName('IS_SKLAD').AsInt64  := IS_SKLAD;
           StoredProcWorkWithFullInv.ExecProc;
           cxTextEditFullInvNum.Text             := StoredProcWorkWithFullInv.ParamByName('INV_NUM_FULL').AsString;
           cxTextEditInvNum.Text                 := StoredProcWorkWithFullInv.ParamByName('INV_NUM').AsString;
           cxTextEditGrpNum.Text                 := StoredProcWorkWithFullInv.ParamByName('GRP_NUM').AsString;
           inv_full                              := cxTextEditFullInvNum.Text;
        except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           StoredProcWorkWithFullInv.Transaction.Commit;
//**********  Конец этого действа   ********************************************
    end;
end;

    is_inv_obj := Combo_box_IS_INV_OBJ.ItemIndex;
    if (cxCheckBox1.Checked = false) and (cxCheckBox2.Checked = false) then
    begin
        ShowMessage(MAT_INV_Error_add_double);
        exit;
    end;
    if cxCheckBox2.Checked = true then
    begin
        is_buhg_acc := 1;
    end else
    begin
        is_buhg_acc := 0;
        id_norm     := 0;
        id_metd     := 0;
        id_sch_db   := 0;
        id_sch_kr   := 0;
        cxCurrencyEditPersent.text   := '0';
        cxCurrencyEditMinPrice.Text  := '0';
        cxTextEditYear.Text          := '0';
        cxComboBoxMonth.Text         := '0';
    end;

    if cxCheckBox1.Checked = true then
    begin
        flajok := 1;
    end else
    begin
        flajok       := 0;
        id_norm_nal  := 0;
        id_metd_nal  := 0;
        nal_sch_db   := 0;
        nal_sch_kr   := 0;
        cxCurrencyEdit_Nal_Percent.text   := '0';
        cxCurrencyEdit_Nal_Min_Price.Text := '0';
        cxTextEdit_Nal_Year.Text          := '0';
        cxComboBox_Nal_month.Text         := '0';
    end;
//***********  Proverka dat na korrektnost'   **********************************
        if cxDateEditDateOut.Text    = '' then
        begin
            out_dat := '30.12.1899';
        end else
        begin
            out_dat := cxDateEditDateOut.Text;
        end;
        if cxDateEditDateUpdate.Text    = '' then
        begin
            Update_dat := '30.12.1899';
        end else
        begin
            Update_dat := cxDateEditDateUpdate.Text;
        end;
        if cxDateEditOpr.Text    = '' then
        begin
            opr_dat := '30.12.1899';
        end else
        begin
            opr_dat := cxDateEditOpr.Text;
        end;
        if cxDateEditDateExpl.Text    = '' then
        begin
            expl_dat := '30.12.1899';
        end else
        begin
            expl_dat := cxDateEditDateExpl.Text;
        end;

        if cxDateEditDateCreate.EditValue = null then
        begin
            //showMessage('1');
            cxDateEditDateCreate.Date   := StrToDate('30.12.1899');//Text   := '30.12.1899';//EditValue   := null;//Date   := StrToDate('30.12.1899');
        end;
        if cxDateEditDateReg.EditValue = null then
        begin
            //showMessage('2');
            cxDateEditDateReg.Date   := StrToDate('30.12.1899');//Text   := '30.12.1899';
        end;

        if cxDateEditOpr.Text = '' then
        begin
            cxDateEditOpr.Text   := '30.12.1899';
        end;
        if cxDateEditDateExpl.Text = '' then
        begin
            cxDateEditDateExpl.Text   := '30.12.1899';
        end;
        if cxDateEditDateUpdate.Text = '' then
        begin
            cxDateEditDateUpdate.Text   := '30.12.1899';
        end;
        if cxDateEditDateOut.Text = '' then
        begin
            cxDateEditDateOut.Text   := '30.12.1899';
        end;

//**********  Konec proverki dat na korrektnost'   *****************************
if is_buhg_acc = 1 then
begin
if (cxButtonEditID_Am_grp.Text <> '') or (cxButtonEditBuh_id_db_sch.Text <> '') or (cxButtonEditBuh_id_kr_sch.Text <> '') then
begin
    if ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
    begin
         if (cxButtonEditSelSch.Text = '') or (cxTextEditGrpNum.Text = '') or (cxTextEditInvNum.Text = '') or (cxTextEditKartNum.Text = '') or (cxButtonEditSelNomn.Text = '') or (cxButtonEditSelMOL.Text = '') then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
           begin
            //--DecimalSeparator := '.';
            if CheckBoxOst.Checked = true then
            begin
                IS_SEL_OST := 1;
            end else
            begin
                IS_SEL_OST := 0;
            end;

            if _IS_TWICE_INV_NUM = 1 then
            if cxTextEditKartNum.text = '' then
            begin
              ShowMessage('Введіть номер!');
              Exit;
            end
            else inv_full:= cxTextEditKartNum.text;
            id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
            name_full:= cxMemoFullName.Text;

            if cxTextEditBegPriceNal.Text='' then cxTextEditBegPriceNal.Text:='0';
            if cxTextEditOstPriceNal.Text='' then cxTextEditOstPriceNal.Text:='0';
            if cxTextEditBegIznosNal.Text='' then cxTextEditBegIznosNal.Text:='0';
            if cxTextEditOstIznosNal.Text='' then cxTextEditOstIznosNal.Text:='0';

            j := AddKartochku(id, id_man, id_nomn, id_sch, cxTextEditGrpNum.Text, cxComboBoxTipKrt.text, cxTextEditInvNum.Text,
                               cxTextEditZavNum.Text, cxTextEditPasNum.Text, cxTextEditKartNum.EditValue, cxTextEditBegPrice.EditValue,
                               cxTextEditBegIznos.EditValue, cxTextEditOstPrice.EditValue,
                               cxTextEditOstIznos.EditValue, cxDateEditOst.Text, {cxDateEditOpr.Text,} 0, {cxDateEditDateExpl.Text,}
                               0, {cxDateEditDateUpdate.Text,} 0, {cxDateEditDateOut.Text,} 0, DateToStr(cxDateEditDateCreate.date), 0, cxTextEditDocReg.Text,
                               DateToStr(cxDateEditDateReg.Date), cxMemoNote.Text, cxTextEditModel.Text, cxTextEditMark.Text, id_norm,
                               id_metd, id_norm_nal, id_metd_nal, 1, StringReplace(cxCurrencyEditPersent.text,',','.',[]),
                               StringReplace(cxCurrencyEditMinPrice.Text,',','.',[]), StrToInt(cxTextEditYear.Text), StrToInt(cxComboBoxMonth.Text), id_sch_db, id_sch_kr,
                               flajok, StringReplace(cxCurrencyEdit_Nal_Percent.text,',','.',[]), StringReplace(cxCurrencyEdit_Nal_Min_Price.Text,',','.',[]),
                               StrToInt(cxTextEdit_Nal_Year.Text), StrToInt(cxComboBox_Nal_month.Text), nal_sch_db, nal_sch_kr, 1, inv_full, is_buhg_acc,IS_SEL_OST, id_ost, is_inv_obj, name_full,
                               StringReplace(cxTextEditBegPriceNal.Text,',','.',[]), StringReplace(cxTextEditBegIznosNal.Text,',','.',[]), StringReplace(cxTextEditOstPriceNal.Text,',','.',[]), StringReplace(cxTextEditOstIznosNal.Text,',','.',[]));
            If j > 0 then
            begin
                if (cxDateEditOpr.Text <> '') then oprihod := 1 else oprihod := 0;
                if (cxDateEditDateExpl.Text <> '') then explua := 1 else explua := 0;
                if (oprihod = 1) then
                begin
                    //**********  Определение полного инвентарного номера    ***********************
                    try
                       StoredProcWorkWithFullInv.Close;
                       StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
                       StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
                       StoredProcWorkWithFullInv.Transaction.StartTransaction;
                       StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_NUM_OPER';
                       StoredProcWorkWithFullInv.Prepare;
                       StoredProcWorkWithFullInv.ParamByName('TIP_OPER').AsInteger := 1;
                       StoredProcWorkWithFullInv.ExecProc;
                       if StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString = '' then
                       begin num_oper := '00001'; end else begin num_oper := StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString; end;
                       except on E : Exception do
                         begin
                             ShowMessage(E.Message);
                             StoredProcWorkWithFullInv.Transaction.Rollback;
                         end;
                       end;
                       StoredProcWorkWithFullInv.Transaction.Commit;
                    //**********  Конец этого действа   ********************************************
                    try
                    o:= Provodki(1, num_oper, myform.DataSetKart.FieldByName('DOC_REC').AsString, cxDateEditOpr.Text, id_man, id_man, id_sch, id_sch, cxTextEditOstPrice.EditValue, cxTextEditOstPrice.EditValue, cxTextEditOstIznos.EditValue, cxTextEditOstIznos.EditValue, cxTextEditBegIznos.EditValue, StringReplace('0',',','.',[]), 0, j, 0, '');
                    if o > 0 then
                    begin
                        Update_oprih(j, 0, cxDateEditOpr.Text);
                    end;
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                end;
                if (explua = 1) then
                begin
                    //**********  Определение полного инвентарного номера    ***********************
                    try
                       StoredProcWorkWithFullInv.Close;
                       StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
                       StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
                       StoredProcWorkWithFullInv.Transaction.StartTransaction;
                       StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_NUM_OPER';
                       StoredProcWorkWithFullInv.Prepare;
                       StoredProcWorkWithFullInv.ParamByName('TIP_OPER').AsInteger := 3;
                       StoredProcWorkWithFullInv.ExecProc;
                       if StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString = '' then
                       begin num_oper := '00001'; end else begin num_oper := StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString; end;
                       except on E : Exception do
                         begin
                             ShowMessage(E.Message);
                             StoredProcWorkWithFullInv.Transaction.Rollback;
                         end;
                       end;
                       StoredProcWorkWithFullInv.Transaction.Commit;
                    //**********  Конец этого действа   ********************************************
                    o := 0;
                    try
                    o:= Provodki(3, num_oper, myform.DataSetKart.FieldByName('DOC_REC').AsString, cxDateEditDateExpl.Text, id_man, id_man, id_sch, id_sch, cxTextEditOstPrice.EditValue, cxTextEditOstPrice.EditValue, cxTextEditOstIznos.EditValue, cxTextEditOstIznos.EditValue, cxTextEditBegIznos.EditValue, StringReplace('0',',','.',[]), 0, j, 0, '');
                    if o > 0 then
                    begin
                        Update_expl(j, 0, cxDateEditDateExpl.Text, id_man);
                    end;
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                end;
                myform.MrOkOrCancel := 0;
                close;
            end;
    end;
    end;

    if FlagNaAdd = 1 then
    begin
            //--DecimalSeparator := '.';
            j := myform.DataSetKart.FieldByName('R_ID_KART').AsVariant;
            id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
            GRP_ID_main := myform.DataSetKart.FieldByName('ID_INV_GRP').AsVariant;
           if ((grp_id = 0) or (id = 2299)) then
               begin
                   showmessage(MAT_INV_Alarm);
                   res := UChecked.GetCheck(self);
                   if VarArrayDimCount(res) > 0 then
                   begin
                    if (res[0]<>null) then
                    begin
                        GRP_ID_main := res[0];
                    end;
                   end;
               end;

               if CheckBoxOst.Checked = true then
               begin
                   IS_SEL_OST := 1;
               end else
               begin
                   IS_SEL_OST := 0;
               end;

             if cxDateEditOpr.Text    = '' then
             begin
                opr_dat := '30.12.1899';
             end else
             begin
                opr_dat := cxDateEditOpr.Text;
             end;
             if cxDateEditDateExpl.Text    = '' then
             begin
                expl_dat := '30.12.1899';
             end else
             begin
                expl_dat := cxDateEditDateExpl.Text;
             end;
               if IS_SKLAD = 1 then
               begin
                   //
               end;
             //New Checked data
             if cxTextEditYear.Text = '' then
             begin
                 cxTextEditYear.Text := '0';
             end;
             if cxComboBoxMonth.Text = '' then
             begin
                 cxComboBoxMonth.Text := '0';
             end;
             if cxCurrencyEditMinPrice.Text = '' then
             begin
                 cxCurrencyEditMinPrice.Text := '0';
             end;
             //End checked data

            {Showmessage('cxTextEditGrpNum.Text='+cxTextEditGrpNum.Text+', cxComboBoxTipKrt.text='+cxComboBoxTipKrt.text+
            ', cxTextEditInvNum.Text='+cxTextEditInvNum.Text+', cxTextEditZavNum.Text='+cxTextEditZavNum.Text+
            ', cxTextEditPasNum.Text='+cxTextEditPasNum.Text+', cxTextEditKartNum.Text='+cxTextEditKartNum.Text+
            ', cxTextEditBegPrice.Text='+cxTextEditBegPrice.Text+', cxTextEditBegIznos.Text='+cxTextEditBegIznos.Text+
            ', cxTextEditOstPrice.Text='+cxTextEditOstPrice.Text+', cxTextEditOstIznos.Text='+cxTextEditOstIznos.Text+
            ', cxDateEditOst.Text='+cxDateEditOst.Text+', cxDateEditOpr.Text='+cxDateEditOpr.Text+', id_oper_opr='+IntToStr(id_oper_opr));
            Showmessage(', cxDateEditDateExpl.Text='+cxDateEditDateExpl.Text+', id_oper_expl='+IntToStr(id_oper_expl)+', Update_dat='+', out_dat='+
            ', cxDateEditDateCreate.Text='+cxDateEditDateCreate.Text+', cxTextEditDocReg.Text='+cxTextEditDocReg.Text+
            ', cxDateEditDateReg.Text='+cxDateEditDateReg.Text+', cxMemoNote.Text='+cxMemoNote.Text+
            ', cxTextEditModel.Text='+cxTextEditModel.Text+', cxTextEditMark.Text='+cxTextEditMark.Text+
            ', id_norm='+Inttostr(id_norm)+', id_metd='+Inttostr(id_metd)+', id_norm_nal='+Inttostr(id_norm_nal));
            Showmessage(', id_metd_nal='+Inttostr(id_metd_nal)+', cxCurrencyEditPersent.text='+cxCurrencyEditPersent.text+
            ', cxCurrencyEditMinPrice.Text='+cxCurrencyEditMinPrice.Text+', cxTextEditYear.Text='+cxTextEditYear.Text+
            ', cxComboBoxMonth.Text='+cxComboBoxMonth.Text+', id_sch_db='+IntToStr(id_sch_db)+', id_sch_kr='+IntToStr(id_sch_kr)+
            ', flajok='+IntToStr(flajok)+', cxCurrencyEdit_Nal_Percent.text='+cxCurrencyEdit_Nal_Percent.text+
            ', cxCurrencyEdit_Nal_Min_Price.Text='+cxCurrencyEdit_Nal_Min_Price.Text);
            Showmessage(', cxTextEdit_Nal_Year.Text='+cxTextEdit_Nal_Year.Text+', cxComboBox_Nal_month.Text='+cxComboBox_Nal_month.Text+
            ', nal_sch_db='+IntToStr(nal_sch_db)+', nal_sch_kr='+IntToStr(nal_sch_kr)+', inv_full='+inv_full+
            ', is_buhg_acc='+IntToStr(is_buhg_acc)+', IS_SEL_OST='+IntToStr(IS_SEL_OST)+', id_ost='+IntToStr(id_ost));
            }
            if _IS_TWICE_INV_NUM = 1 then
            if cxTextEditKartNum.text = '' then
            begin
              ShowMessage('Введіть номер!');
              Exit;
            end
            else inv_full:= cxTextEditKartNum.text;
            name_full:= cxMemoFullName.Text;

            if cxTextEditBegPriceNal.Text='' then cxTextEditBegPriceNal.Text:='0';
            if cxTextEditOstPriceNal.Text='' then cxTextEditOstPriceNal.Text:='0';
            if cxTextEditBegIznosNal.Text='' then cxTextEditBegIznosNal.Text:='0';
            if cxTextEditOstIznosNal.Text='' then cxTextEditOstIznosNal.Text:='0';
            
            ChangeKartochku(GRP_ID_main, j, id_man, id_nomn, id_sch, cxTextEditGrpNum.Text, cxComboBoxTipKrt.text, cxTextEditInvNum.Text,
                            cxTextEditZavNum.Text, cxTextEditPasNum.Text, cxTextEditKartNum.EditValue, cxTextEditBegPrice.EditValue,
                            cxTextEditBegIznos.EditValue, cxTextEditOstPrice.EditValue,
                            cxTextEditOstIznos.EditValue, cxDateEditOst.Text, {cxDateEditOpr.Text}Opr_dat, id_oper_opr, {cxDateEditDateExpl.Text}Expl_dat,
                            id_oper_expl, Update_dat, 0, out_dat, 0, cxDateEditDateCreate.Text, 0, cxTextEditDocReg.Text,
                            cxDateEditDateReg.Text, cxMemoNote.Text, cxTextEditModel.Text, cxTextEditMark.Text, id_norm,
                            id_metd, id_norm_nal, id_metd_nal, StringReplace(cxCurrencyEditPersent.text,',','.',[]),
                            StringReplace(cxCurrencyEditMinPrice.Text,',','.',[]), StrToInt(cxTextEditYear.Text), StrToInt(cxComboBoxMonth.Text), id_sch_db, id_sch_kr,
                            flajok, StringReplace(cxCurrencyEdit_Nal_Percent.text,',','.',[]), StringReplace(cxCurrencyEdit_Nal_Min_Price.Text,',','.',[]),
                            StrToInt(cxTextEdit_Nal_Year.Text), StrToInt(cxComboBox_Nal_month.Text), nal_sch_db, nal_sch_kr, inv_full, is_buhg_acc, IS_SEL_OST, id_ost, is_inv_obj,_CURRENT_USER_ID , _CURRENT_USER_NAME, name_full,
                            StringReplace(cxTextEditBegPriceNal.Text,',','.',[]), StringReplace(cxTextEditBegIznosNal.Text,',','.',[]), StringReplace(cxTextEditOstPriceNal.Text,',','.',[]), StringReplace(cxTextEditOstIznosNal.Text,',','.',[]));
            //--DecimalSeparator := ',';
            //--myform.Special_actionExecute(Sender);
            //--myform.DataSetKart.Open;
            //--myform.DataSetKart.Locate('R_ID_KART',id_kartochki, []);
            //myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
            myform.MrOkOrCancel := 0;
            close;
    end;
    end else
    begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
    end;
end;

if (is_buhg_acc = 1) and (flajok = 1) then
begin
if (cxButtonEditID_Am_grp.Text <> '') or (cxButtonEditBuh_id_db_sch.Text <> '') or (cxButtonEditBuh_id_kr_sch.Text <> '') or (cxButtonEdit_Nal_am_grp.Text <> '') or (cxButtonEditNal_id_db_sch.Text <> '') or (cxButtonEditNal_id_kr_sch.Text <> '') then
begin
    if ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
    begin
         if (cxButtonEditSelSch.Text = '') or (cxTextEditGrpNum.Text = '') or (cxTextEditInvNum.Text = '') or (cxTextEditKartNum.Text = '') or (cxButtonEditSelNomn.Text = '') or (cxButtonEditSelMOL.Text = '') then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
           begin
            DecimalSeparator := '.';
            id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
            if CheckBoxOst.Checked = true then
            begin
                IS_SEL_OST := 1;
            end else
            begin
                IS_SEL_OST := 0;
            end;
            if _IS_TWICE_INV_NUM = 1 then
            if cxTextEditKartNum.text = '' then
            begin
              ShowMessage('Введіть номер!');
              Exit;
            end
            else inv_full:= cxTextEditKartNum.text;
            name_full:= cxMemoFullName.Text;
            if cxTextEditBegPriceNal.Text='' then cxTextEditBegPriceNal.Text:='0';
            if cxTextEditOstPriceNal.Text='' then cxTextEditOstPriceNal.Text:='0';
            if cxTextEditBegIznosNal.Text='' then cxTextEditBegIznosNal.Text:='0';
            if cxTextEditOstIznosNal.Text='' then cxTextEditOstIznosNal.Text:='0';

            j := AddKartochku(id, id_man, id_nomn, id_sch, cxTextEditGrpNum.Text, cxComboBoxTipKrt.text, cxTextEditInvNum.Text,
                               cxTextEditZavNum.Text, cxTextEditPasNum.Text, cxTextEditKartNum.EditValue, cxTextEditBegPrice.EditValue,
                               cxTextEditBegIznos.EditValue, cxTextEditOstPrice.EditValue,
                               cxTextEditOstIznos.EditValue, cxDateEditOst.Text, {cxDateEditOpr.Text,} 0, {cxDateEditDateExpl.Text,}
                               0, {cxDateEditDateUpdate.Text,} 0, {cxDateEditDateOut.Text,} 0, cxDateEditDateCreate.Text, 0, cxTextEditDocReg.Text,
                               cxDateEditDateReg.Text, cxMemoNote.Text, cxTextEditModel.Text, cxTextEditMark.Text, id_norm,
                               id_metd, id_norm_nal, id_metd_nal, 1, StringReplace(cxCurrencyEditPersent.text,',','.',[]),
                               StringReplace(cxCurrencyEditMinPrice.Text,',','.',[]), StrToInt(cxTextEditYear.Text), StrToInt(cxComboBoxMonth.Text), id_sch_db, id_sch_kr,
                               flajok, StringReplace(cxCurrencyEdit_Nal_Percent.text,',','.',[]), StringReplace(cxCurrencyEdit_Nal_Min_Price.Text,',','.',[]),
                               StrToInt(cxTextEdit_Nal_Year.Text), StrToInt(cxComboBox_Nal_month.Text), nal_sch_db, nal_sch_kr, 1, inv_full, is_buhg_acc, IS_SEL_OST, id_ost, is_inv_obj, name_full,
                               StringReplace(cxTextEditBegPriceNal.Text,',','.',[]), StringReplace(cxTextEditBegIznosNal.Text,',','.',[]), StringReplace(cxTextEditOstPriceNal.Text,',','.',[]), StringReplace(cxTextEditOstIznosNal.Text,',','.',[]));
            If j > 0 then
            begin
                DecimalSeparator := ',';
                if (cxDateEditOpr.Text <> '') then oprihod := 1 else oprihod := 0;
                if (cxDateEditDateExpl.Text <> '') then explua := 1 else explua := 0;
                if (oprihod = 1) then
                begin
                    //**********  Определение полного инвентарного номера    ***********************
                    try
                       StoredProcWorkWithFullInv.Close;
                       StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
                       StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
                       StoredProcWorkWithFullInv.Transaction.StartTransaction;
                       StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_NUM_OPER';
                       StoredProcWorkWithFullInv.Prepare;
                       StoredProcWorkWithFullInv.ParamByName('TIP_OPER').AsInteger := 1;
                       StoredProcWorkWithFullInv.ExecProc;
                       if StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString = '' then
                       begin num_oper := '00001'; end else begin num_oper := StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString; end;
                       except on E : Exception do
                         begin
                             ShowMessage(E.Message);
                             StoredProcWorkWithFullInv.Transaction.Rollback;
                         end;
                       end;
                       StoredProcWorkWithFullInv.Transaction.Commit;
                    //**********  Конец этого действа   ********************************************
                    try
                    o:= Provodki(1, num_oper, myform.DataSetKart.FieldByName('DOC_REC').AsString, cxDateEditOpr.Text, id_man, id_man, id_sch, id_sch, cxTextEditOstPrice.EditValue, cxTextEditOstPrice.EditValue, cxTextEditOstIznos.EditValue, cxTextEditOstIznos.EditValue, cxTextEditBegIznos.EditValue, StringReplace('0',',','.',[]), 0, j, 0, '');
                    if o > 0 then
                    begin
                        Update_oprih(j, 0, cxDateEditOpr.Text);
                    end;
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                end;
                if (explua = 1) then
                begin
                    //**********  Определение полного инвентарного номера    ***********************
                    try
                       StoredProcWorkWithFullInv.Close;
                       StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
                       StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
                       StoredProcWorkWithFullInv.Transaction.StartTransaction;
                       StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_NUM_OPER';
                       StoredProcWorkWithFullInv.Prepare;
                       StoredProcWorkWithFullInv.ParamByName('TIP_OPER').AsInteger := 3;
                       StoredProcWorkWithFullInv.ExecProc;
                       if StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString = '' then
                       begin num_oper := '00001'; end else begin num_oper := StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString; end;
                       except on E : Exception do
                         begin
                             ShowMessage(E.Message);
                             StoredProcWorkWithFullInv.Transaction.Rollback;
                         end;
                       end;
                       StoredProcWorkWithFullInv.Transaction.Commit;
                    //**********  Конец этого действа   ********************************************
                    o := 0;
                    try
                    o:= Provodki(3, num_oper, myform.DataSetKart.FieldByName('DOC_REC').AsString, cxDateEditDateExpl.Text, id_man, id_man, id_sch, id_sch, cxTextEditOstPrice.EditValue, cxTextEditOstPrice.EditValue, cxTextEditOstIznos.EditValue, cxTextEditOstIznos.EditValue, cxTextEditBegIznos.EditValue, StringReplace('0',',','.',[]), 0, j, 0, '');
                    if o > 0 then
                    begin
                        Update_expl(j, 0, cxDateEditDateExpl.Text, id_man);
                    end;
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                end;
                myform.MrOkOrCancel := 0;
                close;
            end;
    end;
    end;
    if FlagNaAdd = 1 then
    begin
            DecimalSeparator := '.';
            j := myform.DataSetKart.FieldByName('R_ID_KART').AsVariant;
            id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
            GRP_ID_main := myform.DataSetKart.FieldByName('ID_INV_GRP').AsVariant;

           if grp_id = 0 then
               begin
                   showmessage(MAT_INV_Alarm);
                   res := UChecked.GetCheck(self);
                   if VarArrayDimCount(res) > 0 then
                   begin
                    if (res[0]<>null) then
                    begin
                        GRP_ID_main := res[0];
                    end;
                   end;
               end;
               if GRP_ID_main = null then
               begin
                   GRP_ID_main := 0;
               end;
            //ShowMessage('1');
            if CheckBoxOst.Checked = true then
            begin
                IS_SEL_OST := 1;
            end else
            begin
                IS_SEL_OST := 0;
            end;
            //New Checked data
             if cxTextEditYear.Text = '' then
             begin
                 cxTextEditYear.Text := '0';
             end;
             if cxComboBoxMonth.Text = '' then
             begin
                 cxComboBoxMonth.Text := '0';
             end;
             if cxCurrencyEditMinPrice.Text = '' then
             begin
                 cxCurrencyEditMinPrice.Text := '0';
             end;
             //End checked data
            if _IS_TWICE_INV_NUM = 1 then
            if cxTextEditKartNum.text = '' then
            begin
              ShowMessage('Введіть номер!');
              Exit;
            end
            else inv_full:= cxTextEditKartNum.text;
            name_full:= cxMemoFullName.Text;
            if cxTextEditBegPriceNal.Text='' then cxTextEditBegPriceNal.Text:='0';
            if cxTextEditOstPriceNal.Text='' then cxTextEditOstPriceNal.Text:='0';
            if cxTextEditBegIznosNal.Text='' then cxTextEditBegIznosNal.Text:='0';
            if cxTextEditOstIznosNal.Text='' then cxTextEditOstIznosNal.Text:='0';
            ChangeKartochku(GRP_ID_main, j, id_man, id_nomn, id_sch, cxTextEditGrpNum.Text, cxComboBoxTipKrt.text, cxTextEditInvNum.Text,
                            cxTextEditZavNum.Text, cxTextEditPasNum.Text, cxTextEditKartNum.EditValue, cxTextEditBegPrice.EditValue,
                            cxTextEditBegIznos.EditValue, cxTextEditOstPrice.EditValue,
                            cxTextEditOstIznos.EditValue, cxDateEditOst.Text, Opr_dat, 0, Expl_dat,
                            0, Update_dat, 0, out_dat, 0, cxDateEditDateCreate.Text, 0, cxTextEditDocReg.Text,
                            cxDateEditDateReg.Text, cxMemoNote.Text, cxTextEditModel.Text, cxTextEditMark.Text, id_norm,
                            id_metd, id_norm_nal, id_metd_nal, StringReplace(cxCurrencyEditPersent.text,',','.',[]),
                            StringReplace(cxCurrencyEditMinPrice.Text,',','.',[]), StrToInt(cxTextEditYear.Text), StrToInt(cxComboBoxMonth.Text), id_sch_db, id_sch_kr,
                            flajok, StringReplace(cxCurrencyEdit_Nal_Percent.text,',','.',[]), StringReplace(cxCurrencyEdit_Nal_Min_Price.Text,',','.',[]),
                            StrToInt(cxTextEdit_Nal_Year.Text), StrToInt(cxComboBox_Nal_month.Text), nal_sch_db, nal_sch_kr, inv_full, is_buhg_acc, IS_SEL_OST, id_ost, is_inv_obj,_CURRENT_USER_ID , _CURRENT_USER_NAME, name_full,
                            StringReplace(cxTextEditBegPriceNal.Text,',','.',[]), StringReplace(cxTextEditBegIznosNal.Text,',','.',[]), StringReplace(cxTextEditOstPriceNal.Text,',','.',[]), StringReplace(cxTextEditOstIznosNal.Text,',','.',[]));
            DecimalSeparator := ',';
            //--myform.Special_actionExecute(Sender);
            //--myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
            myform.MrOkOrCancel := 0;
            close;
    end;
    end else
    begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
    end;
    //myform.DataSetKart.CloseOpen(False);
    //myform.DataSetKart.Locate('R_ID_KART',id, []);
end;

if flajok = 1 then
begin
if (cxButtonEdit_Nal_am_grp.Text <> '') or (cxButtonEditNal_id_db_sch.Text <> '') or (cxButtonEditNal_id_kr_sch.Text <> '') then
begin
    if ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
    begin
         if (cxButtonEditSelSch.Text = '') or (cxTextEditGrpNum.Text = '') or (cxTextEditInvNum.Text = '') or (cxTextEditKartNum.Text = '') or (cxButtonEditSelNomn.Text = '') or (cxButtonEditSelMOL.Text = '') then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
           begin
            DecimalSeparator := '.';
            id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
            if CheckBoxOst.Checked = true then
            begin
                IS_SEL_OST := 1;
            end else
            begin
                IS_SEL_OST := 0;
            end;
            if _IS_TWICE_INV_NUM = 1 then
            if cxTextEditKartNum.text = '' then
            begin
              ShowMessage('Введіть номер!');
              Exit;
            end
            else inv_full:= cxTextEditKartNum.text;
            name_full:= cxMemoFullName.Text;
            if cxTextEditBegPriceNal.Text='' then cxTextEditBegPriceNal.Text:='0';
            if cxTextEditOstPriceNal.Text='' then cxTextEditOstPriceNal.Text:='0';
            if cxTextEditBegIznosNal.Text='' then cxTextEditBegIznosNal.Text:='0';
            if cxTextEditOstIznosNal.Text='' then cxTextEditOstIznosNal.Text:='0';
            j := AddKartochku(id, id_man, id_nomn, id_sch, cxTextEditGrpNum.Text, cxComboBoxTipKrt.text, cxTextEditInvNum.Text,
                               cxTextEditZavNum.Text, cxTextEditPasNum.Text, cxTextEditKartNum.EditValue, cxTextEditBegPrice.EditValue,
                               cxTextEditBegIznos.EditValue, cxTextEditOstPrice.EditValue,
                               cxTextEditOstIznos.EditValue, cxDateEditOst.Text, {cxDateEditOpr.Text,} 0, {cxDateEditDateExpl.Text,}
                               0, {cxDateEditDateUpdate.Text,} 0, {cxDateEditDateOut.Text,} 0, cxDateEditDateCreate.Text, 0, cxTextEditDocReg.Text,
                               cxDateEditDateReg.Text, cxMemoNote.Text, cxTextEditModel.Text, cxTextEditMark.Text, id_norm,
                               id_metd, id_norm_nal, id_metd_nal, 1, StringReplace(cxCurrencyEditPersent.text,',','.',[]),
                               StringReplace(cxCurrencyEditMinPrice.Text,',','.',[]), StrToInt(cxTextEditYear.Text), StrToInt(cxComboBoxMonth.Text), id_sch_db, id_sch_kr,
                               flajok, StringReplace(cxCurrencyEdit_Nal_Percent.text,',','.',[]), StringReplace(cxCurrencyEdit_Nal_Min_Price.Text,',','.',[]),
                               StrToInt(cxTextEdit_Nal_Year.Text), StrToInt(cxComboBox_Nal_month.Text), nal_sch_db, nal_sch_kr, 1, inv_full, is_buhg_acc, IS_SEL_OST, id_ost, is_inv_obj, name_full,
                               StringReplace(cxTextEditBegPriceNal.Text,',','.',[]), StringReplace(cxTextEditBegIznosNal.Text,',','.',[]), StringReplace(cxTextEditOstPriceNal.Text,',','.',[]), StringReplace(cxTextEditOstIznosNal.Text,',','.',[]));
            If j > 0 then
            begin
                DecimalSeparator := ',';
                if (cxDateEditOpr.Text <> '') then oprihod := 1 else oprihod := 0;
                if (cxDateEditDateExpl.Text <> '') then explua := 1 else explua := 0;
                if (oprihod = 1) then
                begin
                    //**********  Определение полного инвентарного номера    ***********************
                    try
                       StoredProcWorkWithFullInv.Close;
                       StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
                       StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
                       StoredProcWorkWithFullInv.Transaction.StartTransaction;
                       StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_NUM_OPER';
                       StoredProcWorkWithFullInv.Prepare;
                       StoredProcWorkWithFullInv.ParamByName('TIP_OPER').AsInteger := 1;
                       StoredProcWorkWithFullInv.ExecProc;
                       if StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString = '' then
                       begin num_oper := '00001'; end else begin num_oper := StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString; end;
                       except on E : Exception do
                         begin
                             ShowMessage(E.Message);
                             StoredProcWorkWithFullInv.Transaction.Rollback;
                         end;
                       end;
                       StoredProcWorkWithFullInv.Transaction.Commit;
                    //**********  Конец этого действа   ********************************************
                    try
                    o:= Provodki(1, num_oper, myform.DataSetKart.FieldByName('DOC_REC').AsString, cxDateEditOpr.Text, id_man, id_man, id_sch, id_sch, cxTextEditOstPrice.EditValue, cxTextEditOstPrice.EditValue, cxTextEditOstIznos.EditValue, cxTextEditOstIznos.EditValue, cxTextEditBegIznos.EditValue, StringReplace('0',',','.',[]), 0, j, 0, '');
                    if o > 0 then
                    begin
                        Update_oprih(j, 0, cxDateEditOpr.Text);
                    end;
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                end;
                if (explua = 1) then
                begin
                    //**********  Определение полного инвентарного номера    ***********************
                    try
                       StoredProcWorkWithFullInv.Close;
                       StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
                       StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
                       StoredProcWorkWithFullInv.Transaction.StartTransaction;
                       StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_NUM_OPER';
                       StoredProcWorkWithFullInv.Prepare;
                       StoredProcWorkWithFullInv.ParamByName('TIP_OPER').AsInteger := 3;
                       StoredProcWorkWithFullInv.ExecProc;
                       if StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString = '' then
                       begin num_oper := '00001'; end else begin num_oper := StoredProcWorkWithFullInv.ParamByName('MAX_NUM_OPER').AsString; end;
                       except on E : Exception do
                         begin
                             ShowMessage(E.Message);
                             StoredProcWorkWithFullInv.Transaction.Rollback;
                         end;
                       end;
                       StoredProcWorkWithFullInv.Transaction.Commit;
                    //**********  Конец этого действа   ********************************************
                    o := 0;
                    try
                    o:= Provodki(3, num_oper, myform.DataSetKart.FieldByName('DOC_REC').AsString, cxDateEditDateExpl.Text, id_man, id_man, id_sch, id_sch, cxTextEditOstPrice.EditValue, cxTextEditOstPrice.EditValue, cxTextEditOstIznos.EditValue, cxTextEditOstIznos.EditValue, cxTextEditBegIznos.EditValue, StringReplace('0',',','.',[]), 0, j, 0, '');
                    if o > 0 then
                    begin
                        Update_expl(j, 0, cxDateEditDateExpl.Text, id_man);
                    end;
                    except on E:Exception
                    do begin
                        MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                        Application.Terminate;
                    end;
                    end;
                end;
                myform.MrOkOrCancel := 0;
                close;
            end;
    end;
    end;
    if FlagNaAdd = 1 then
    begin
            DecimalSeparator := '.';
            j := myform.DataSetKart.FieldByName('R_ID_KART').AsVariant;
            id := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
            GRP_ID_main := myform.DataSetKart.FieldByName('ID_INV_GRP').AsVariant;
           if grp_id = 0 then
               begin
                   showmessage(MAT_INV_Alarm);
                   res := UChecked.GetCheck(self);
                   if VarArrayDimCount(res) > 0 then
                   begin
                    if (res[0]<>null) then
                    begin
                        GRP_ID_main := res[0];
                    end;
                   end;
               end;
            if CheckBoxOst.Checked = true then
            begin
                IS_SEL_OST := 1;
            end else
            begin
                IS_SEL_OST := 0;
            end;
            //New Checked data
             if cxTextEditYear.Text = '' then
             begin
                 cxTextEditYear.Text := '0';
             end;
             if cxComboBoxMonth.Text = '' then
             begin
                 cxComboBoxMonth.Text := '0';
             end;
             if cxCurrencyEditMinPrice.Text = '' then
             begin
                 cxCurrencyEditMinPrice.Text := '0';
             end;
             //End checked data
            if _IS_TWICE_INV_NUM = 1 then
            if cxTextEditKartNum.text = '' then
            begin
              ShowMessage('Введіть номер!');
              Exit;
            end
            else inv_full:= cxTextEditKartNum.text;             
            name_full:= cxMemoFullName.Text;
            if cxTextEditBegPriceNal.Text='' then cxTextEditBegPriceNal.Text:='0';
            if cxTextEditOstPriceNal.Text='' then cxTextEditOstPriceNal.Text:='0';
            if cxTextEditBegIznosNal.Text='' then cxTextEditBegIznosNal.Text:='0';
            if cxTextEditOstIznosNal.Text='' then cxTextEditOstIznosNal.Text:='0';
            ChangeKartochku(GRP_ID_main, j, id_man, id_nomn, id_sch, cxTextEditGrpNum.Text, cxComboBoxTipKrt.text, cxTextEditInvNum.Text,
                            cxTextEditZavNum.Text, cxTextEditPasNum.Text, cxTextEditKartNum.EditValue, cxTextEditBegPrice.EditValue,
                            cxTextEditBegIznos.EditValue, cxTextEditOstPrice.EditValue,
                            cxTextEditOstIznos.EditValue, cxDateEditOst.Text, Opr_dat, 0, Expl_dat,
                            0, Update_dat, 0, out_dat, 0, cxDateEditDateCreate.Text, 0, cxTextEditDocReg.Text,
                            cxDateEditDateReg.Text, cxMemoNote.Text, cxTextEditModel.Text, cxTextEditMark.Text, id_norm,
                            id_metd, id_norm_nal, id_metd_nal, StringReplace(cxCurrencyEditPersent.text,',','.',[]),
                            StringReplace(cxCurrencyEditMinPrice.Text,',','.',[]), StrToInt(cxTextEditYear.Text), StrToInt(cxComboBoxMonth.Text), id_sch_db, id_sch_kr,
                            flajok, StringReplace(cxCurrencyEdit_Nal_Percent.text,',','.',[]), StringReplace(cxCurrencyEdit_Nal_Min_Price.Text,',','.',[]),
                            StrToInt(cxTextEdit_Nal_Year.Text), StrToInt(cxComboBox_Nal_month.Text), nal_sch_db, nal_sch_kr, inv_full, is_buhg_acc, IS_SEL_OST, id_ost, is_inv_obj,_CURRENT_USER_ID , _CURRENT_USER_NAME, name_full,
                            StringReplace(cxTextEditBegPriceNal.Text,',','.',[]), StringReplace(cxTextEditBegIznosNal.Text,',','.',[]), StringReplace(cxTextEditOstPriceNal.Text,',','.',[]), StringReplace(cxTextEditOstIznosNal.Text,',','.',[]));
            DecimalSeparator := ',';
            //--myform.Special_actionExecute(Sender);
            //--myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
            myform.MrOkOrCancel := 0;
            close;
    end;
    end else
    begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
    end;
end;


end;

procedure TfmInvKartAdd.cxButtonEditID_Am_grpKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmInvKartAdd.cxButtonEditBuh_id_db_schKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmInvKartAdd.cxButtonEditBuh_id_kr_schKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmInvKartAdd.cxButtonEdit_Nal_am_grpKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmInvKartAdd.cxButtonEditNal_id_db_schKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmInvKartAdd.cxButtonEditNal_id_kr_schKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmInvKartAdd.cxCheckBox21Click(Sender: TObject);
begin
    if cxCheckBox2.Checked       = True then
    begin
        cxGroupBox1.Visible  := True;
    end else
    begin
        cxGroupBox1.Visible  := False;
    end;
end;

procedure TfmInvKartAdd.TabSheet2Show(Sender: TObject);
begin
    if (cxCheckBox2.Checked = False) and (cxCheckBox1.Checked = False) then
    begin
        cxGroupBox1.Visible    := false;
        cxGroupBox2.Visible    := false;
        showMessage(MAT_INV_checked_error);
    end;
    if cxCheckBox2.Checked = False then
    begin
        cxGroupBox1.Visible    := false;
    end;
    if cxCheckBox1.Checked = False then
    begin
        cxGroupBox2.Visible    := false;
    end;
end;

procedure TfmInvKartAdd.cxTextEditGrpNumExit(Sender: TObject);
var is_expl:Integer;
begin
 is_expl:=0;
 if _NOT_CHANGE_INV_NUM = 1 then
  if (cxDateEditDateExpl.Text<>'') and (cxDateEditDateOut.Text = '') then is_expl:=1 else is_expl:=0;
if (((FlagNaAdd = 1) or (FlagNaAdd = 0) or (FlagNaAdd = 3))and (is_expl=0)) then
begin
    If cxTextEditGrpNum.Text <> grp_old_num then
    begin
    //**********  Определение полного инвентарного номера    ***********************
        try
           StoredProcWorkWithFullInv.Close;
           StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
           StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
           StoredProcWorkWithFullInv.Transaction.StartTransaction;
           StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_GEN_INUM_FULL';
           StoredProcWorkWithFullInv.Prepare;
           StoredProcWorkWithFullInv.ParamByName('ID_SCH').AsInt64    := id_sch;
           StoredProcWorkWithFullInv.ParamByName('GRPN').AsString     := cxTextEditGrpNum.Text;
           StoredProcWorkWithFullInv.ParamByName('INUM').AsString     := '0';
           StoredProcWorkWithFullInv.ParamByName('ID_NOMN').AsInt64   := id_nomn;
           StoredProcWorkWithFullInv.ExecProc;
           cxTextEditFullInvNum.Text             := StoredProcWorkWithFullInv.ParamByName('INV_NUM_FULL').AsString;
           cxTextEditInvNum.Text                 := StoredProcWorkWithFullInv.ParamByName('INV_NUM').AsString;
           cxTextEditGrpNum.Text                 := StoredProcWorkWithFullInv.ParamByName('GRP_NUM').AsString;
           inv_full                              := cxTextEditFullInvNum.Text;
        except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           StoredProcWorkWithFullInv.Transaction.Commit;
//**********  Конец этого действа   ********************************************
    end;
end;
// проставляем автоматически группу аммортизации
    try
           StoredProcWorkWithFullInv.Close;
           StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
           StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
           StoredProcWorkWithFullInv.Transaction.StartTransaction;
           StoredProcWorkWithFullInv.StoredProcName:='MAT_GET_INV_AMORT_GR';
           StoredProcWorkWithFullInv.Prepare;
           StoredProcWorkWithFullInv.ParamByName('ID_SCH').AsInteger    := id_sch;
           StoredProcWorkWithFullInv.ParamByName('GRPN').AsInteger     := StrToInt(cxTextEditGrpNum.Text);
           StoredProcWorkWithFullInv.ExecProc;
           except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           StoredProcWorkWithFullInv.Transaction.Commit;
           if StoredProcWorkWithFullInv.ParamByName('RESULT').AsInteger = 1 then
           begin
           cxButtonEditID_Am_grp.Text:=StoredProcWorkWithFullInv.ParamByName('name_norm').AsString;
           cxCurrencyEditPersent.EditValue:= StoredProcWorkWithFullInv.ParamByName('percent').AsFloat;
           id_norm:=StoredProcWorkWithFullInv.ParamByName('id_norm_izn').AsInteger;
           id_metd:=1;
           cxTextEditYear.Text:= '0';
           cxComboBoxMonth.Text:= '0';
           end;
end;

procedure TfmInvKartAdd.cxTextEditInvNumExit(Sender: TObject);
begin
if ((FlagNaAdd = 1) or (FlagNaAdd = 0) or (FlagNaAdd = 3)) then
begin
    If VarToStr(cxTextEditInvNum.Value) <> inv_old_num then
    begin
    //**********  Определение полного инвентарного номера    ***********************
   { ShowMessage('id_sch='+Inttostr(id_sch)+', id_nomn='+Inttostr(id_nomn)+', IS_SKLAD='+IntToStr(IS_SKLAD)+
    ', INUM='+cxTextEditInvNum.Text+', GRPN='+cxTextEditGrpNum.Text);
    }    try
           StoredProcWorkWithFullInv.Close;
           StoredProcWorkWithFullInv.Database    := myform.DatabaseMain;
           StoredProcWorkWithFullInv.Transaction := myform.WriteTransaction;
           StoredProcWorkWithFullInv.Transaction.StartTransaction;
           StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_GEN_INUM_FULL';
           StoredProcWorkWithFullInv.Prepare;
           StoredProcWorkWithFullInv.ParamByName('ID_SCH').AsInt64    := id_sch;
           StoredProcWorkWithFullInv.ParamByName('GRPN').AsString     := cxTextEditGrpNum.Text;
           StoredProcWorkWithFullInv.ParamByName('INUM').AsString     := VarToStr(cxTextEditInvNum.Value);
           StoredProcWorkWithFullInv.ParamByName('ID_NOMN').AsInt64   := id_nomn;
           StoredProcWorkWithFullInv.ParamByName('IS_SKLAD').AsInt64  := IS_SKLAD;
           StoredProcWorkWithFullInv.ExecProc;
           cxTextEditFullInvNum.Text             := StoredProcWorkWithFullInv.ParamByName('INV_NUM_FULL').AsString;
           cxTextEditInvNum.Text                 := StoredProcWorkWithFullInv.ParamByName('INV_NUM').AsString;
           cxTextEditGrpNum.Text                 := StoredProcWorkWithFullInv.ParamByName('GRP_NUM').AsString;
           inv_full                              := cxTextEditFullInvNum.Text;
        except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           StoredProcWorkWithFullInv.Transaction.Commit;
//**********  Конец этого действа   ********************************************
    end;
end;
end;

procedure TfmInvKartAdd.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked       = True then
    begin
        cxGroupBox2.Visible  := True;

        cxGroupBox1.Visible  := False;
        Label1.Enabled:=False;
        cxLabelBegPrice.Enabled:=False;
        cxLabelOstPrice.Enabled:=False;
        cxLabelBegIznos.Enabled:=False;
        cxLabelOstIznos.Enabled:=False;
        cxButtonEditShowBal.Enabled:=False;
        cxTextEditBegPrice.Enabled:=False;
        cxTextEditOstPrice.Enabled:=False;
        cxTextEditBegIznos.Enabled:=False;
        cxTextEditOstIznos.Enabled:=False;


        lbl3.Enabled:=True;
        lbl4.Enabled:=True;
        lbl5.Enabled:=True;
        lbl6.Enabled:=True;

        cxTextEditBegPriceNal.Enabled:=True;
        cxTextEditOstPriceNal.Enabled:=True;
        cxTextEditBegIznosNal.Enabled:=True;
        cxTextEditOstIznosNal.Enabled:=True;
    end else
    begin
        cxGroupBox2.Visible  := False;
    end;

end;

procedure TfmInvKartAdd.cxTextEditGrpNumEnter(Sender: TObject);
begin
    grp_old_num := cxTextEditGrpNum.Text;
end;

procedure TfmInvKartAdd.cxTextEditInvNumEnter(Sender: TObject);
begin
    inv_old_num := cxTextEditInvNum.Text;
end;

procedure TfmInvKartAdd.cxTextEditBegPrice2Exit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    if cxTextEditBegPrice.Text = '' then
    begin
        cxTextEditBegPrice.Text := '0,00';
    end;
     if cxTextEditBegPrice.Text = '' then
       begin
           MessageBox(Handle, PChar(MAT_INV_Kart_enter_beg_price), PChar(MAT_INV_Attention), 16);
           cxTextEditBegPrice.SetFocus;
       end;
      // ShowMessage('1.5');
If ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
begin
     if cxTextEditBegIznos.Text = '0.00' then
     begin
         sexy := 0;
     end else
     begin
         sexy := StrToCurr(cxTextEditBegIznos.Text);
     end;
     if (cxTextEditBegIznos.Text <> '') and (cxTextEditBegIznos.Text <> '0.00') then
     begin
         if (cxTextEditBegIznos.Text = '') or (sexy > StrToCurr(cxTextEditBegPrice.Text)) then
       begin
           MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
           cxTextEditBegIznos.SetFocus;
       end else
       begin
       ShowMessage(CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-sexy));
           cxTextEditOstPrice.Text:=CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-sexy);
           cxTextEditOstIznos.Text:=cxTextEditBegIznos.Text;
       end;
     end;
end;
end;

procedure TfmInvKartAdd.cxTextEditBegPriceExit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    //**********************************************************************
   {     prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPrice.Text := zpt1;
                end;
            end;
        end;
    }  //**********************************************************************//
{    if cxTextEditBegPrice.Text = '' then
    begin
        cxTextEditBegPrice.Value := 0;
    end;
     if cxTextEditBegPrice.Text = '' then
       begin
           MessageBox(Handle, PChar(MAT_INV_Kart_enter_beg_price), PChar(MAT_INV_Attention), 16);
           cxTextEditBegPrice.SetFocus;
       end;

If ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
begin
     if cxTextEditBegIznos.Value = 0 then
     begin
         sexy := 0;
     end else
     begin
         sexy := StrToCurr(cxTextEditBegIznos.Text);
     end;
     if (cxTextEditBegIznos.Text <> '') and (cxTextEditBegIznos.Text <> '0.00') then
     begin
         if (cxTextEditBegIznos.Text = '') or (sexy > StrToCurr(cxTextEditBegPrice.Text)) then
         begin
           MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
           cxTextEditBegIznos.SetFocus;
         end else
         begin
         //ShowMessage(CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-sexy));
          // cxTextEditOstIznos.Text:=cxTextEditBegIznos.Text;
           cxTextEditOstPrice.Text:=CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-{sexy-}{StrToCurr(cxTextEditOstIznos.Text));
     {    end;
     end;

     if (StrToCurr(cxTextEditOstIznos.Text) < 0) then
     begin
         ShowMessage(MAT_INV_Otricatelnoe);
         cxTextEditBegPrice.Text := BegPrice;
         cxTextEditOstIznos.Text := OstIznos;
         cxTextEditOstPrice.Text := OstPrice;
         cxTextEditBegIznos.Text := BegIznos;
     end;
end;
If FlagNaAdd = 1 then
begin
    cxTextEditOstIznos.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstPrice.Text));
    // old cxTextEditOstIznos.Text := CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstPrice.Text));
     if (StrToCurr(cxTextEditOstIznos.Text) < 0) then
     begin
         ShowMessage(MAT_INV_Otricatelnoe);
         cxTextEditBegPrice.Text := BegPrice;
         cxTextEditOstIznos.Text := OstIznos;
         cxTextEditOstPrice.Text := OstPrice;
         cxTextEditBegIznos.Text := BegIznos;
     end;
end;
     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegPrice.Clear;
                    cxTextEditBegPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegPrice.Clear;
                cxTextEditBegPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegPrice.Clear;
                cxTextEditBegPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPrice.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPrice.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPrice.Clear;
                    cxTextEditOstPrice.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPrice.Clear;
                cxTextEditOstPrice.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznos.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznos.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznos.Clear;
                    cxTextEditOstIznos.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznos.Clear;
                cxTextEditOstIznos.Text :=zpt1+'0';
                d := 0;
            end;
      }  //**********************************************************************
    if cxTextEditBegPrice.Enabled = false then cxButtonEditShowBal.Enabled := true else cxButtonEditShowBal.Enabled := false;
end;


procedure TfmInvKartAdd.CheckBoxOstClick(Sender: TObject);
begin
    if CheckBoxOst.Checked = true then
    begin
        cxButtonEditSaveOst.Enabled := false;
    end else
    begin
        cxButtonEditSaveOst.Enabled := true;
    end;
end;

procedure TfmInvKartAdd.cxButtonEditSaveOstPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
begin
    if (cxButtonEditSelNomn.Text <> '') and (cxButtonEditSelMOL.Text <> '') then
    begin
        res := USelectOst.GetOst(self, id_man, id_nomn);
        if VarArrayDimCount(res) > 0 then
        begin
            if (res[0]<>null) and (res[1]<>null) and (res[2]<>null) and (res[3]<>null) then
            begin
                id_ost := res[0];
                cxButtonEditSaveOst.Text := res[1];
                cxButtonEditSaveOst.Text := cxButtonEditSaveOst.Text + ', ' + res[2];
                cxButtonEditSaveOst.Text := cxButtonEditSaveOst.Text + ', ' + FloatToStr(res[3]);
            end;
        end;
    end else begin ShowMessage(MAT_INV_Mess_ost); end;
end;

procedure TfmInvKartAdd.cxButtonEditSaveOstKeyPress(Sender: TObject;
  var Key: Char);
begin
//    Key := Chr(0);
end;

procedure TfmInvKartAdd.Action2Execute(Sender: TObject);
begin
    ShowMessage('ТМЦ:'+IntToStr(id_nomn)+'МОЛ:'+IntToStr(id_man));
end;

procedure TfmInvKartAdd.Action3Execute(Sender: TObject);
begin
    ShowMessage('ID_OST: '+IntToStr(ID_OST));
end;

procedure TfmInvKartAdd.cxCheckBox2Click(Sender: TObject);
begin
    if cxCheckBox2.Checked       = True then
    begin
        cxGroupBox1.Visible  := True;

        lbl3.Enabled:=False;
        lbl4.Enabled:=False;
        lbl5.Enabled:=False;
        lbl6.Enabled:=False;

        cxTextEditBegPriceNal.Enabled:=False;
        cxTextEditOstPriceNal.Enabled:=False;
        cxTextEditBegIznosNal.Enabled:=False;
        cxTextEditOstIznosNal.Enabled:=False;

        Label1.Enabled:=True;
        cxLabelBegPrice.Enabled:=True;
        cxLabelOstPrice.Enabled:=True;
        cxLabelBegIznos.Enabled:=True;
        cxLabelOstIznos.Enabled:=True;
       // cxButtonEditShowBal.Enabled:=True;
       // cxTextEditBegPrice.Enabled:=True;
       // cxTextEditOstPrice.Enabled:=True;
       // cxTextEditBegIznos.Enabled:=True;
      //  cxTextEditOstIznos.Enabled:=True;
    end else
    begin

        cxGroupBox1.Visible  := False;
        
    end;
end;

procedure TfmInvKartAdd.cxButtonEditShowBalPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
VAR
    res : Variant;
    i   : integer;
    bal_pro_1, bal_pro_2 : Currency;
begin
    res := UCheBalPrice.CheBal(self, cxButtonEditShowBal.Text);
    if VarArrayDimCount(res) > 0 then
    begin
        cxButtonEditShowBal.Text := res[0];
        BalPrice                 := res[0];
    end;

    cxTextEditOstIznos.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstPrice.Text));
    bal_pro_1               := StrToCurr(cxTextEditOstIznos.Text)+StrToCurr(cxTextEditOstPrice.Text);
    bal_pro_2               := StrToCurr(cxTextEditBegIznos.Text)+StrToCurr(cxTextEditBegPrice.Text);
    if bal_pro_1 <> bal_pro_2 then
    begin
        cxTextEditBegPrice.Enabled := false;
        cxTextEditBegIznos.Enabled := false;
    end else
    begin
        cxTextEditBegPrice.Enabled := true;
        cxTextEditBegIznos.Enabled := true;
    end;

//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxButtonEditShowBal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxButtonEditShowBal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxButtonEditShowBal.Clear;
                    cxButtonEditShowBal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxButtonEditShowBal.Clear;
                cxButtonEditShowBal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxButtonEditShowBal.Clear;
                cxButtonEditShowBal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

procedure TfmInvKartAdd.cxButtonEditShowBalKeyPress(Sender: TObject;
  var Key: Char);
begin
    Key := Chr(0);
end;

procedure TfmInvKartAdd.cxButtonEditShowBalExit(Sender: TObject);
var
    i : integer;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt :=cxButtonEditShowBal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxButtonEditShowBal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxButtonEditShowBal.Clear;
                    cxButtonEditShowBal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxButtonEditShowBal.Clear;
                cxButtonEditShowBal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxButtonEditShowBal.Clear;
                cxButtonEditShowBal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************

end;

procedure TfmInvKartAdd.cxTextEditBegPriceNalKeyPress(Sender: TObject;
  var Key: Char);
var i: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditBegPriceNal.Text;
        long_pole:= IntToStr(cxTextEditBegPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;

end;

procedure TfmInvKartAdd.cxTextEditOstPriceNalKeyPress(Sender: TObject;
  var Key: Char);
var i: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditOstPriceNal.Text;
        long_pole:= IntToStr(cxTextEditOstPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;

end;

procedure TfmInvKartAdd.cxTextEditBegIznosNalKeyPress(Sender: TObject;
  var Key: Char);
var i: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditBegIznosNal.Text;
        long_pole:= IntToStr(cxTextEditBegIznosNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmInvKartAdd.cxTextEditOstIznosNalKeyPress(Sender: TObject;
  var Key: Char);
var i: integer;
begin
    if Key = '.' then Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = ',' then
    begin
        prap_flag := 0;
        zpt := cxTextEditOstIznosNal.Text;
        long_pole:= IntToStr(cxTextEditOstIznosNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmInvKartAdd.cxTextEditBegPriceNalExit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPriceNal.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//
    if cxTextEditBegPriceNal.Text = '' then
    begin
        cxTextEditBegPriceNal.Text := '0,00';
    end;
     if cxTextEditBegPriceNal.Text = '' then
       begin
           MessageBox(Handle, PChar(MAT_INV_Kart_enter_beg_price), PChar(MAT_INV_Attention), 16);
           cxTextEditBegPriceNal.SetFocus;
       end;

If ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
begin
     if cxTextEditBegIznosNal.Text = '0.00' then
     begin
         sexy := 0;
     end else
     begin
         sexy := StrToCurr(cxTextEditBegIznosNal.Text);
     end;
     if (cxTextEditBegIznosNal.Text <> '') and (cxTextEditBegIznosNal.Text <> '0.00') then
     begin
         if (cxTextEditBegIznosNal.Text = '') or (sexy > StrToCurr(cxTextEditBegPriceNal.Text)) then
         begin
           MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
           cxTextEditBegIznosNal.SetFocus;
         end else
         begin
         //ShowMessage(CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-sexy));
          // cxTextEditOstIznos.Text:=cxTextEditBegIznos.Text;
           cxTextEditOstPriceNal.Text:=CurrToStr(StrToCurr(cxTextEditBegPriceNal.Text)-{sexy-}StrToCurr(cxTextEditOstIznosNal.Text));
         end;
     end;

     if (StrToCurr(cxTextEditOstIznosNal.Text) < 0) then
     begin
         ShowMessage(MAT_INV_Otricatelnoe);
         cxTextEditBegPriceNal.Text := BegPriceNal;
         cxTextEditOstIznosNal.Text := OstIznosNal;
         cxTextEditOstPriceNal.Text := OstPriceNal;
         cxTextEditBegIznosNal.Text := BegIznosNal;
     end;
end;
If FlagNaAdd = 1 then
begin
    cxTextEditOstIznosNal.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstPriceNal.Text));
    // old cxTextEditOstIznos.Text := CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstPrice.Text));
     if (StrToCurr(cxTextEditOstIznosNal.Text) < 0) then
     begin
         ShowMessage(MAT_INV_Otricatelnoe);
         cxTextEditBegPriceNal.Text := BegPriceNal;
         cxTextEditOstIznosNal.Text := OstIznosNal;
         cxTextEditOstPriceNal.Text := OstPriceNal;
         cxTextEditBegIznosNal.Text := BegIznosNal;
     end;
end;
     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegPriceNal.Clear;
                    cxTextEditBegPriceNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegPriceNal.Clear;
                cxTextEditBegPriceNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegPriceNal.Clear;
                cxTextEditBegPriceNal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPriceNal.Clear;
                    cxTextEditOstPriceNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceNal.Clear;
                cxTextEditOstPriceNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceNal.Clear;
                cxTextEditOstPriceNal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznosNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznosNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznosNal.Clear;
                    cxTextEditOstIznosNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosNal.Clear;
                cxTextEditOstIznosNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosNal.Clear;
                cxTextEditOstIznosNal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
    if cxTextEditBegPriceNal.Enabled = false then cxButtonEditShowBal.Enabled := true else cxButtonEditShowBal.Enabled := false;
end;

procedure TfmInvKartAdd.cxTextEditOstPriceNalExit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPriceNal.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//
    if cxTextEditOstPriceNal.Text = '' then
    begin
        cxTextEditOstPriceNal.Text := '0,00';
    end;

If ((FlagNaAdd = 1) or (FlagNaAdd = 3)) then
begin
     if (cxTextEditBegPriceNal.Text = '') and (cxTextEditOstPriceNal.Text = '') then
       begin
           MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
           cxTextEditOstPriceNal.SetFocus;
       end else
       begin
           if (cxTextEditBegPriceNal.Enabled = false) then
           begin
               cxTextEditOstIznosNal.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstPriceNal.Text));
           end else
           begin
               cxTextEditOstIznosNal.Text := CurrToStr(StrToCurr(cxTextEditBegPriceNal.Text)-StrToCurr(cxTextEditOstPriceNal.Text));
           end;
       end;
end;

if (StrToCurr(cxTextEditOstIznosNal.Text) < 0) then
begin
     ShowMessage(MAT_INV_Otricatelnoe);
     cxTextEditBegPriceNal.Text := BegPriceNal;
     cxTextEditOstIznosNal.Text := OstIznosNal;
     cxTextEditOstPriceNal.Text := OstPriceNal;
     cxTextEditBegIznosNal.Text := BegIznosNal;
end;
     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPriceNal.Clear;
                    cxTextEditOstPriceNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceNal.Clear;
                cxTextEditOstPriceNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceNal.Clear;
                cxTextEditOstPriceNal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznosNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznosNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznosNal.Clear;
                    cxTextEditOstIznosNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosNal.Clear;
                cxTextEditOstIznosNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosNal.Clear;
                cxTextEditOstIznosNal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
    if cxTextEditBegPriceNal.Enabled = false then cxButtonEditShowBal.Enabled := true else cxButtonEditShowBal.Enabled := false;
end;

procedure TfmInvKartAdd.cxTextEditBegIznosNalExit(Sender: TObject);
var
    i : integer;
begin
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPriceNal.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//
     if cxTextEditBegIznosNal.Text = '' then
    begin
        cxTextEditBegIznosNal.Text := '0,00';
    end;
     if cxTextEditBegPriceNal.Text = '' then
    begin
        //cxTextEditBegIznos.Clear;
        MessageBox(Handle, PChar(MAT_INV_Kart_enter_beg_price), PChar(MAT_INV_Attention), 16);
        cxTextEditBegPriceNal.SetFocus;
        exit;
    end;

If ((FlagNaAdd = 0) or (FlagNaAdd = 3)) then
begin
     if (cxTextEditBegIznosNal.Text = '') or (StrToCurr(cxTextEditBegIznosNal.Text) > StrToCurr(cxTextEditBegPriceNal.Text)) then
       begin
       MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
       cxTextEditBegIznosNal.SetFocus;
    end else
       begin
           cxTextEditOstPriceNal.Text:=CurrToStr(StrToCurr(cxTextEditBegPriceNal.Text)-StrToCurr(cxTextEditOstIznosNal.Text));
           //cxTextEditOstIznos.Text:=cxTextEditBegIznos.Text;
       end;
end;
If FlagNaAdd = 1 then
begin
     if (cxTextEditBegIznosNal.Text = '') or (StrToCurr(cxTextEditBegIznosNal.Text) > StrToCurr(cxTextEditBegPriceNal.Text)) then
       begin
       MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
       cxTextEditBegIznosNal.SetFocus;
    end else
       begin
           //cxTextEditOstIznos.Text:=CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstPrice.Text));
           cxTextEditOstIznosNal.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstPriceNal.Text));
           //cxTextEditOstPrice.Text:=CurrToStr(StrToCurr(cxTextEditBegPrice.Text)-StrToCurr(cxTextEditOstIznos.Text));
       end;

end;
    //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegIznosNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegIznosNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditBegIznosNal.Clear;
                    cxTextEditBegIznosNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBegIznosNal.Clear;
                cxTextEditBegIznosNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBegIznosNal.Clear;
                cxTextEditBegIznosNal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPriceNal.Clear;
                    cxTextEditOstPriceNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceNal.Clear;
                cxTextEditOstPriceNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceNal.Clear;
                cxTextEditOstPriceNal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznosNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznosNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznosNal.Clear;
                    cxTextEditOstIznosNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosNal.Clear;
                cxTextEditOstIznosNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosNal.Clear;
                cxTextEditOstIznosNal.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
        //**********************************************************************
    if cxTextEditBegPriceNal.Enabled = false then cxButtonEditShowBal.Enabled := true else cxButtonEditShowBal.Enabled := false;
end;

procedure TfmInvKartAdd.cxTextEditOstIznosNalExit(Sender: TObject);
var
   i: integer;
   sexy : Currency;
begin
    //**********************************************************************
    cxTextEditOstPriceNal.Text:=CurrToStr(StrToCurr(cxTextEditBegPriceNal.Text)-StrToCurr(cxTextEditOstIznosNal.Text));
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBegPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBegPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = ',' then
            begin
                prap_flag := 1;
                dk := i;
            end;
        end;
        zpt1 := '';
        if (prap_flag = 1) then
        begin
            d := StrToInt(long_pole)-dk;
            if (d > 2) then
            begin
                d := dk + 2;
                for i := 1 to d do
                begin
                    if (i <> d) then
                    begin
                        zpt1 := zpt1 + zpt[i];
                    end else
                    begin
                        if (zpt[d+1] = '5') or (zpt[d+1] = '6') or (zpt[d+1] = '7') or (zpt[d+1] = '8') or (zpt[d+1] = '9') then
                        begin
                            zpt1 := zpt1 + IntToStr(StrToInt(zpt[i]) + 1);
                        end;
                    end;
                    cxTextEditBegPriceNal.Text := zpt1;
                end;
            end;
        end;
      //**********************************************************************//
    if cxTextEditOstIznosNal.Text = '' then
    begin
        cxTextEditOstIznosNal.Text := '0,00';
    end;

If FlagNaAdd = 1 then
begin
     if (cxTextEditBegPriceNal.Text = '') and (cxTextEditOstIznosNal.Text = '') then
       begin
           MessageBox(Handle, PChar(MAT_INV_kart_Error), PChar(MAT_INV_Attention), 16);
           cxTextEditOstIznosNal.SetFocus;
       end else
       begin
           if (cxTextEditBegPriceNal.Enabled = false) then
           begin
               cxTextEditOstPriceNal.Text := CurrToStr(StrToCurr(BalPrice)-StrToCurr(cxTextEditOstIznosNal.Text));
           end else
           begin
               cxTextEditOstPriceNal.Text := CurrToStr(StrToCurr(cxTextEditBegPriceNal.Text)-StrToCurr(cxTextEditOstIznosNal.Text));
           end;
       end;
end;
if (StrToCurr(cxTextEditOstPriceNal.Text) < 0) then
begin
    ShowMessage(MAT_INV_Otricatelnoe);
    cxTextEditBegPriceNal.Text := BegPriceNal;
    cxTextEditOstIznosNal.Text := OstIznosNal;
    cxTextEditOstPriceNal.Text := OstPriceNal;
    cxTextEditBegIznosNal.Text := BegIznosNal;
end;
//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPriceNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPriceNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstPriceNal.Clear;
                    cxTextEditOstPriceNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceNal.Clear;
                cxTextEditOstPriceNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceNal.Clear;
                cxTextEditOstPriceNal.Text :=zpt1+'0';
                d := 0;
            end;
//**********************************************************************
//**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznosNal.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznosNal.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
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
                    cxTextEditOstIznosNal.Clear;
                    cxTextEditOstIznosNal.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosNal.Clear;
                cxTextEditOstIznosNal.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosNal.Clear;
                cxTextEditOstIznosNal.Text :=zpt1+'0';
                d := 0;
            end;
//**********************************************************************
    if cxTextEditBegPriceNal.Enabled = false then cxButtonEditShowBal.Enabled := true else cxButtonEditShowBal.Enabled := false;
end;

procedure TfmInvKartAdd.cxTextEditKartNumFocusChanged(Sender: TObject);
var text:string;
    i:Integer;
begin

end;

end.
