{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit WorldLookingKKart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxMemo,
  cxGroupBox, cxCurrencyEdit, cxDropDownEdit, cxCalendar, cxLabel,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit,
  ComCtrls, ActnList, uResources;

type
  TfmWorldLooking = class(TForm)
    pFIBDatabaseWorld: TpFIBDatabase;
    pFIBDataSetWorld: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    Panel1: TPanel;
    cxButtonOk: TcxButton;
    PageControlAddKart: TPageControl;
    TabSheet1: TTabSheet;
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
    Label1: TLabel;
    cxButtonEditSelNomn: TcxButtonEdit;
    cxButtonEditSelMOL: TcxButtonEdit;
    cxButtonEditSelSch: TcxButtonEdit;
    cxTextEditGrpNum: TcxTextEdit;
    cxComboBoxTipKrt: TcxComboBox;
    cxTextEditInvNum: TcxTextEdit;
    cxDateEditOst: TcxDateEdit;
    cxTextEditKartNum: TcxTextEdit;
    cxTextEditBegPrice: TcxTextEdit;
    cxTextEditBegIznos: TcxTextEdit;
    cxTextEditOstPrice: TcxTextEdit;
    cxTextEditOstIznos: TcxTextEdit;
    cxDateEditDateOut: TcxTextEdit;
    cxDateEditDateUpdate: TcxTextEdit;
    cxTextEditFullInvNum: TcxTextEdit;
    cxDateEditOpr: TcxDateEdit;
    cxDateEditDateExpl: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxTextEditBegPrice2: TcxCurrencyEdit;
    CheckBoxOst: TCheckBox;
    cxButtonEditSaveOst: TcxButtonEdit;
    cxCheckBox1: TRadioButton;
    cxCheckBox2: TRadioButton;
    cxButtonEditShowBal: TcxButtonEdit;
    TabSheet2: TTabSheet;
    cxGroupBox1: TcxGroupBox;
    LabelBuh_id_db_sch: TLabel;
    LabelBuh_id_kr_sch: TLabel;
    LabelID_Am_grp: TLabel;
    LabelYear: TLabel;
    LabelMonth: TLabel;
    LabelSelMethod: TLabel;
    LabelMinPrice: TLabel;
    LabelPercent: TLabel;
    LabelPer_Nachisl: TLabel;
    cxButtonEditBuh_id_db_sch: TcxButtonEdit;
    cxButtonEditBuh_id_kr_sch: TcxButtonEdit;
    cxCurrencyEditPersent: TcxCurrencyEdit;
    cxButtonEditID_Am_grp: TcxButtonEdit;
    cxTextEditYear: TcxTextEdit;
    cxComboBoxMonth: TcxComboBox;
    cxComboBoxPeriodNach: TcxComboBox;
    cxComboBoxMethod: TcxTextEdit;
    cxCurrencyEditMinPrice: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    LabelNal_id_kr_sch: TLabel;
    LabelNal_id_db_sch: TLabel;
    Label_Nal_Am_grp: TLabel;
    Label_Nal_Year: TLabel;
    Label_Nal_month: TLabel;
    Label_Nal_Method: TLabel;
    Label_Nal_Per_Nach: TLabel;
    Label_Nal_Percent: TLabel;
    Label_Nal_Min_Price: TLabel;
    cxButtonEditNal_id_db_sch: TcxButtonEdit;
    cxButtonEditNal_id_kr_sch: TcxButtonEdit;
    cxButtonEdit_Nal_am_grp: TcxButtonEdit;
    cxTextEdit_Nal_Year: TcxTextEdit;
    cxComboBox_Nal_month: TcxComboBox;
    cxCurrencyEdit_Nal_Percent: TcxCurrencyEdit;
    cxComboBox_Nal_Per_Nach: TcxComboBox;
    cxComboBox_Nal_Method: TcxTextEdit;
    cxCurrencyEdit_Nal_Min_Price: TcxTextEdit;
    TabSheet3: TTabSheet;
    cxLabelZavNum: TLabel;
    cxLabelPasNum: TLabel;
    cxLabelDocReg: TLabel;
    cxLabelMark: TLabel;
    cxLabelModel: TLabel;
    LabelNote: TLabel;
    cxLabelDateCreate: TLabel;
    cxLabelDateReg: TLabel;
    cxTextEditZavNum: TcxTextEdit;
    cxTextEditPasNum: TcxTextEdit;
    cxDateEditDateCreate: TcxDateEdit;
    cxDateEditDateReg: TcxDateEdit;
    cxTextEditDocReg: TcxTextEdit;
    cxTextEditMark: TcxTextEdit;
    cxTextEditModel: TcxTextEdit;
    cxMemoNote: TcxMemo;
    ActionList1: TActionList;
    ActionCurrensy: TAction;
    procedure cxButtonOkClick(Sender: TObject);
    procedure ActionCurrensyExecute(Sender: TObject);
  private
    Kart_id : int64;
    Is_check    : integer;
    is_check_buhg:integer;

    long_pole : string;
    prap_flag, d, dk : integer;
    zpt, zpt1 : string;
  public
    ResultArray : Variant;
  end;
    function WLKart(AOwner:TComponent; id_kart: int64; DB: TISC_DB_HANDLE):Variant;stdcall;

    exports WLKart;
var
  fmWorldLooking: TfmWorldLooking;

implementation

{$R *.dfm}

function WLKart(AOwner:TComponent; id_kart: int64; DB: TISC_DB_HANDLE):Variant;
var
 World : TfmWorldLooking;
begin
    World                            := TfmWorldLooking.Create(AOwner);
    World.KART_ID                    := ID_KART;

    World.pFIBDatabaseWorld.Handle   := DB;

    World.Caption                    := MAT_INV_system_name + MAT_INV_look;
    World.cxButtonOk.Caption         := MAT_INV_Close;

    World.cxCheckBox1.Caption             := MAT_INV_na_check;
    World.cxCheckBox2.Caption             := MAT_INV_na_buhg_check;
    World.TabSheet1.Caption               := MAT_INV_Vklad_Osnovnie;
    World.TabSheet2.Caption               := MAT_INV_Vklad_Amort;
    World.TabSheet3.Caption               := MAT_INV_Vklad_Dop;
    World.cxLabelSelMOL.Caption           := MAT_INV_MOL;
    World.cxLabelSelNomn.Caption          := MAT_INV_Name;
    World.cxLabelSelSch.Caption           := MAT_INV_SCH;
    World.cxLabelTipKrt.Caption           := MAT_INV_Tip_karti;
    World.cxLabelGrpNum.Caption           := MAT_INV_Num_Grp;
    World.cxLabelInvNum.Caption           := MAT_INV_Inv_Num;
    World.cxLabelFullInvNum.Caption       := MAT_INV_full_inv;
    World.cxLabelZavNum.Caption           := MAT_INV_Zav_num;
    World.cxLabelPasNum.Caption           := MAT_INV_Pass_num;
    World.cxLabelKartNum.Caption          := MAT_INV_Num_kart;
    World.cxLabelBegPrice.Caption         := MAT_INV_Nach_price;
    World.cxLabelBegIznos.Caption         := MAT_INV_Nach_Iznos;
    World.cxLabelOstPrice.Caption         := MAT_INV_Ost_price;
    World.cxLabelOstIznos.Caption         := MAT_INV_Ost_Iznos;
    World.cxLabelOst.Caption              := MAT_INV_Date_ost;
    World.cxLabelOpr.Caption              := MAT_INV_Date_opr;
    World.cxLabelDateExpl.Caption         := MAT_INV_date_nach_expl;
    World.cxLabelDateUpdate.Caption       := MAT_INV_Date_Refrash;
    World.cxLabelDateOut.Caption          := MAT_INV_Date_Exit;
    World.cxLabelDateCreate.Caption       := MAT_INV_Date_vipuska;
    World.cxLabelDocReg.Caption           := MAT_INV_Reg_doc;
    World.cxLabelDateReg.Caption          := MAT_INV_Date_reg_doc;
    World.cxLabelModel.Caption            := MAT_INV_Model;
    World.cxLabelMark.Caption             := MAT_INV_Marka;
    World.LabelNote.Caption               := MAT_INV_Primechanie;
    World.LabelBuh_id_db_sch.Caption      := MAT_INV_buh_db_sch;
    World.LabelBuh_id_kr_sch.Caption      := MAT_INV_buh_kr_sch;
    World.LabelNal_id_db_sch.Caption      := MAT_INV_buh_db_sch;
    World.LabelNal_id_kr_sch.Caption      := MAT_INV_buh_kr_sch;
    World.LabelID_Am_grp.Caption          := MAT_INV__am_grp;
    World.LabelYear.Caption               := MAT_INV_const_Let;
    World.LabelMonth.Caption              := MAT_INV_const_mesyacev;
    World.LabelSelMethod.Caption          := MAT_INV__method_name;
    World.LabelMinPrice.Caption           := MAT_INV_minprice;
    World.LabelPercent.Caption            := MAT_INV_Percent;
    World.LabelPer_Nachisl.Caption        := MAT_INV_PerNach_Perc;

    World.Label_Nal_Am_grp.Caption        := MAT_INV__am_grp;
    World.Label_Nal_Year.Caption          := MAT_INV_const_Let;
    World.Label_Nal_month.Caption         := MAT_INV_const_mesyacev;
    World.Label_Nal_Method.Caption        := MAT_INV__method_name;
    World.Label_Nal_Min_Price.Caption     := MAT_INV_minprice;
    World.Label_Nal_Percent.Caption       := MAT_INV_Percent;
    World.Label_Nal_Per_Nach.Caption      := MAT_INV_PerNach_Perc;
    World.CheckBoxOst.Caption             := MAT_INV_checked_ost;

    World.TabSheet1.Enabled          := false;
    World.TabSheet2.Enabled          := false;
    World.TabSheet3.Enabled          := false;

    World.pFIBDataSetWorld.Close;
    World.pFIBDataSetWorld.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_WORLD_LOOK('+IntToStr(World.KART_ID)+')';
    World.pFIBDataSetWorld.Open;

    World.is_check                          := World.pFIBDataSetWorld.FieldByName('IS_NALOG_ACC').AsInteger;
    World.is_check_buhg                     := World.pFIBDataSetWorld.fieldbyname('IS_BUHG_ACC').AsInteger;
    World.cxButtonEditSelMOL.Text           := World.pFIBDataSetWorld.FieldByName('FIO_MOL').AsString + ' / '+World.pFIBDataSetWorld.FieldByName('NAME_DEPARTMENT').AsString;
    World.cxButtonEditSelNomn.Text          := World.pFIBDataSetWorld.FieldByName('NAME_KART').AsString;
    World.cxButtonEditSelSch.Text           := World.pFIBDataSetWorld.FieldByName('NUM_SCH').AsString;
    World.cxTextEditGrpNum.Text             := World.pFIBDataSetWorld.FieldByName('GRP_NUM').AsString;
    World.cxComboBoxTipKrt.Text             := World.pFIBDataSetWorld.FieldByName('TIP_KRT').AsString;
    World.cxTextEditInvNum.Text             := World.pFIBDataSetWorld.FieldByName('INV_NUM').AsString;
    World.cxTextEditZavNum.Text             := World.pFIBDataSetWorld.FieldByName('ZAV_NUM').AsString;
    World.cxTextEditPasNum.Text             := World.pFIBDataSetWorld.FieldByName('PASS_NUM').AsString;
    World.cxTextEditKartNum.Text            := World.pFIBDataSetWorld.FieldByName('KART_NUM').AsString;
    World.cxTextEditBegPrice.Text           := World.pFIBDataSetWorld.FieldByName('BEG_PRICE').AsString;
    World.cxTextEditBegIznos.Text           := World.pFIBDataSetWorld.FieldByName('BEG_IZNOS').AsString;
    World.cxTextEditOstPrice.Text           := World.pFIBDataSetWorld.FieldByName('OST_PRICE').AsString;
    World.cxTextEditOstIznos.Text           := World.pFIBDataSetWorld.FieldByName('OST_IZNOS').AsString;
    World.cxDateEditOst.Date                := World.pFIBDataSetWorld.FieldByName('DATE_OST').AsDateTime;
    World.cxDateEditDateUpdate.Text         := World.pFIBDataSetWorld.FieldByName('DATE_UPDATE').AsString;
        if (World.pFIBDataSetWorld.FieldByName('DATE_OPR').AsDateTime = StrToDateTime('30.12.1899')) then
        begin
            World.cxDateEditOpr.EditValue   := null;
        end else
        begin
            World.cxDateEditOpr.Date                := World.pFIBDataSetWorld.FieldByName('DATE_OPR').AsDateTime;
        end;
        if (World.pFIBDataSetWorld.FieldByName('DATE_EXPL').AsDateTime = StrToDateTime('30.12.1899')) then
        begin
            World.cxDateEditDateExpl.EditValue   := null;
        end else
        begin
            World.cxDateEditDateExpl.Date           := World.pFIBDataSetWorld.FieldByName('DATE_EXPL').AsDateTime;
        end;

        World.cxDateEditDateCreate.Date         := World.pFIBDataSetWorld.FieldByName('DATE_CREATE').AsDateTime;
        World.cxTextEditDocReg.Text             := World.pFIBDataSetWorld.FieldByName('DOC_REG').AsString;
        World.cxDateEditDateReg.Date            := World.pFIBDataSetWorld.FieldByName('DATE_REG').AsDateTime;
        World.cxTextEditModel.Text              := World.pFIBDataSetWorld.FieldByName('MODEL').AsString;
        World.cxTextEditMark.Text               := World.pFIBDataSetWorld.FieldByName('MARK').AsString;
        World.cxMemoNote.Text                   := World.pFIBDataSetWorld.FieldByName('NOTE').AsString;

        World.cxButtonEditID_Am_grp.Text        := World.pFIBDataSetWorld.FieldByName('NAME_NORM').AsString;
        World.cxTextEditYear.Text               := World.pFIBDataSetWorld.FieldByName('NORM_YEAR').AsString;
        World.cxComboBoxMonth.Text              := World.pFIBDataSetWorld.FieldByName('NORM_MONTH').AsString;
        World.cxButtonEditBuh_id_db_sch.Text    := World.pFIBDataSetWorld.FieldByName('BUH_DB_SCH').AsString;
        World.cxButtonEditBuh_id_kr_sch.Text    := World.pFIBDataSetWorld.FieldByName('BUH_KR_SCH').AsString;
        World.cxComboBoxMethod.Text             := World.pFIBDataSetWorld.FieldByName('METHOD_NAME').AsString;
        World.cxCurrencyEditMinPrice.Text       := World.pFIBDataSetWorld.FieldByName('MIN_PRICE').AsString;
        World.cxCurrencyEditPersent.Text        := World.pFIBDataSetWorld.FieldByName('AMORT_PERC').AsString;
        World.cxComboBoxPeriodNach.ItemIndex    := World.pFIBDataSetWorld.FieldByName('NORM_PER_PERIOD').AsInteger;

        World.cxButtonEdit_Nal_am_grp.Text      := World.pFIBDataSetWorld.FieldByName('NAL_NAME_NORM').AsString;
        World.cxTextEdit_Nal_Year.Text          := World.pFIBDataSetWorld.FieldByName('NAL_NORM_YEAR').AsString;
        World.cxComboBox_Nal_month.Text         := World.pFIBDataSetWorld.FieldByName('NAL_NORM_MONTH').AsString;
        World.cxButtonEditNal_id_db_sch.Text    := World.pFIBDataSetWorld.FieldByName('NAL_DB_SCH').AsString;
        World.cxButtonEditNal_id_kr_sch.Text    := World.pFIBDataSetWorld.FieldByName('NAL_KR_SCH').AsString;
        World.cxComboBox_Nal_Method.Text        := World.pFIBDataSetWorld.FieldByName('NAL_METHOD_NAME').AsString;
        World.cxCurrencyEdit_Nal_Min_Price.Text := World.pFIBDataSetWorld.FieldByName('NAL_MIN_PRICE').AsString;
        World.cxCurrencyEdit_Nal_Percent.Text   := World.pFIBDataSetWorld.FieldByName('NAL_AMORT_PERC').AsString;
        World.cxComboBox_Nal_Per_Nach.ItemIndex := World.pFIBDataSetWorld.FieldByName('NAL_NORM_PER_PERIOD').AsInteger;
        World.cxButtonEditShowBal.Text          := World.pFIBDataSetWorld.FieldByName('BAL_PRICE').AsString;
        World.cxButtonEditSaveOst.Text          := World.pFIBDataSetWorld.fieldbyname('OST_INFO').AsString;
        World.cxTextEditFullInvNum.Text         := World.pFIBDataSetWorld.FieldByName('FULL_INV').AsString;

        if (World.pFIBDataSetWorld.FieldByName('DATE_CREATE').AsString = '30.12.1899') or (World.pFIBDataSetWorld.FieldByName('DATE_CREATE').AsString = '30.12.2999') then
        begin
            World.cxDateEditDateCreate.Text  := '';
        end;
        if (World.pFIBDataSetWorld.FieldByName('DATE_REG').AsString = '30.12.1899') or (World.pFIBDataSetWorld.FieldByName('DATE_REG').AsString = '30.12.2999') then
        begin
            World.cxDateEditDateReg.Text  := '';
        end;
        if (World.pFIBDataSetWorld.FieldByName('DATE_UPDATE').Asstring = '30.12.1899') or (World.pFIBDataSetWorld.FieldByName('DATE_UPDATE').AsString= '30.12.2999') then
        begin
            World.cxDateEditDateUpdate.Text  := '';
        end;
        if (World.pFIBDataSetWorld.FieldByName('DATE_OUT').AsString = '30.12.1899') or (World.pFIBDataSetWorld.FieldByName('DATE_OUT').AsString = '30.12.2999') then
        begin
            World.cxDateEditDateOut.Text         := '';
        end else
        begin
            World.cxDateEditDateOut.Text            := World.pFIBDataSetWorld.FieldByName('DATE_OUT').AsString;
        end;

        if (World.cxDateEditDateCreate.Text = '30.12.1900') or (World.cxDateEditDateCreate.Text = '30.12.1899') then
        begin
            World.cxDateEditDateCreate.EditValue   := null;
        end;
        if (World.cxDateEditDateReg.Text = '30.12.1900') or (World.cxDateEditDateReg.Text = '30.12.1899') then
        begin
            World.cxDateEditDateReg.EditValue   := null;
        end;

        if World.is_check_buhg = 1 then
        begin
            World.cxCheckBox2.Checked := true;
        end else
        begin
            World.cxCheckBox2.Checked := false;
        end;

        if World.Is_check = 1 then
        begin
            World.cxCheckBox1.Checked := true;
        end else
        begin
            World.cxCheckBox1.Checked := false;
        end;

        World.ActionCurrensyExecute(nil);

    World.ShowModal;
    WLKart := World.ResultArray;
    World.Free;
end;

procedure TfmWorldLooking.cxButtonOkClick(Sender: TObject);
begin
    close;
end;

procedure TfmWorldLooking.ActionCurrensyExecute(Sender: TObject);
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

end.
