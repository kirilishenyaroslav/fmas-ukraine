{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls, Ibase,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, GlobalSpr,
  cxDropDownEdit, cxCheckBox, cxRadioGroup, cxCalendar, ActnList, cxLabel,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxGroupBox, uWaite, MainInvKartForm, uResources,
  uPackageManager, uMatasVars, uCommonSp;

type
  TfmFind = class(TForm)
    cxButtonCansel: TcxButton;
    cxButtonChack: TcxButton;
    cxButtonClear: TcxButton;
    cxCheckBox_worked1: TcxCheckBox;
    cxRadioButton_Out: TcxRadioButton;
    cxRadioButton_expl: TcxRadioButton;
    cxRadioButton_all: TcxRadioButton;
    Label17: TLabel;
    Label18: TLabel;
    cxDateEdit_s: TcxDateEdit;
    Label19: TLabel;
    cxDateEdit_po: TcxDateEdit;
    cxButtonEdit_kr: TcxButtonEdit;
    cxTextEditInv_num_po: TcxTextEdit;
    Label11: TLabel;
    cxTextEditInv_num_s: TcxTextEdit;
    Label10: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    cxTextEditbeg_price: TcxTextEdit;
    cxButtonEdit_db: TcxButtonEdit;
    Label14: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    cxButtonEditName: TcxButtonEdit;
    cxButtonEdit_FIO: TcxButtonEdit;
    Label5: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    cxButtonEditSchet: TcxButtonEdit;
    cxTextEditTip_kartochki: TcxComboBox;
    Label7: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    cxTextEditNum_grp_s: TcxTextEdit;
    Label8: TLabel;
    cxTextEditNum_grp_po: TcxTextEdit;
    cxTextEdit_NUM_krt_po: TcxTextEdit;
    Label13: TLabel;
    cxTextEdit_NUM_krt_s: TcxTextEdit;
    Label12: TLabel;
    cxDateEdit_Out_po: TcxDateEdit;
    Label20: TLabel;
    cxDateEdit_Out_s: TcxDateEdit;
    Label21: TLabel;
    Label22: TLabel;
    cxDateEdit_Opr_po: TcxDateEdit;
    Label23: TLabel;
    cxDateEdit_Opr_s: TcxDateEdit;
    Label24: TLabel;
    Label25: TLabel;
    cxDateEdit_Up_po: TcxDateEdit;
    Label26: TLabel;
    cxDateEdit_Up_s: TcxDateEdit;
    Label27: TLabel;
    Label28: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    cxLabelNaOstPrice: TcxLabel;
    cxTextEditOstPriceBeging: TcxTextEdit;
    cxLabelOstPricePo: TcxLabel;
    cxTextEditOstPriceEnding: TcxTextEdit;
    cxLabelNaOstIznos: TcxLabel;
    cxTextEditOstIznosEnding: TcxTextEdit;
    cxTextEditOstIznosBeging: TcxTextEdit;
    cxLabelOstIznosPo: TcxLabel;
    cxCheckBoxOstPrice: TcxCheckBox;
    cxCheckBoxOstIznos: TcxCheckBox;
    cxCheckBoxBalPrice: TcxCheckBox;
    cxComboBoxWorked: TcxComboBox;
    Action3: TAction;
    StoredProcWorkWithFullInv: TpFIBStoredProc;
    cxGroupBox1: TcxGroupBox;
    cxTextEditBprend: TcxTextEdit;
    cxLabelBegPo: TcxLabel;
    LabelBegPrz: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    lbl1: TLabel;
    cxDep: TcxButtonEdit;
    cxBuhPers: TcxCheckBox;
    cxCheckBox_in_nalog_uch: TcxCheckBox;
    cxCheckBox_in_buh_uch: TcxCheckBox;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonCanselClick(Sender: TObject);
    procedure cxTextEditInv_num_poKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditInv_num_sKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit_FIOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditSchetKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit_FIOKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditNameKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditSchetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_dbPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_krPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit_dbKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit_krKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditbeg_priceKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxTextEditOstPriceBegingKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditOstPriceEndingKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditOstPriceBegingExit(Sender: TObject);
    procedure cxTextEditOstPriceEndingExit(Sender: TObject);
    procedure cxTextEditOstIznosBegingExit(Sender: TObject);
    procedure cxTextEditOstIznosEndingExit(Sender: TObject);
    procedure cxTextEditOstIznosBegingKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxTextEditOstIznosEndingKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxCheckBoxOstPricePropertiesChange(Sender: TObject);
    procedure cxCheckBoxOstIznosPropertiesChange(Sender: TObject);
    procedure cxCheckBoxBalPricePropertiesChange(Sender: TObject);
    procedure cxTextEditbeg_priceExit(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure cxTextEditBprendExit(Sender: TObject);
    procedure cxTextEditBprendKeyPress(Sender: TObject; var Key: Char);
    procedure cxDepKeyPress(Sender: TObject; var Key: Char);
    procedure cxDepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
        FlagNaAdd : boolean;
        myform    : TfmMainIvKartForm;
        id_schet  : int64;
        id_man    : int64;
        id_nomn   : int64;
        id_db     : int64;
        id_kr     : int64;
        id_dep    : Int64;
        working, is_nalog, is_buh : integer;
        all, expl, out_proch : integer;

        cid_schet  : int64;
        cid_man    : int64;
        cid_dep    : int64;
        cid_nomn   : int64;
        cid_db     : int64;
        cid_kr     : int64;
        cworking, cis_nalog, cis_buh : integer;
        call, cexpl, cout_proch, buh_pers : integer;

        cButtonEditSchet, cButtonEdit_FIO, c_DEP, cButtonEditName, cTextEditNum_grp_s, cTextEditNum_grp_po,
        cTextEditInv_num_s, cTextEditInv_num_po, cTextEditTip_kartochki, cTextEdit_NUM_krt_s,
        cTextEdit_NUM_krt_po, cButtonEdit_db, cButtonEdit_kr, cTextEditbeg_price, cTextEditOstPriceBeging,
        cTextEditOstPriceEnding, cTextEditOstIznosBeging, cTextEditOstIznosEnding, cDateEdit_s,
        cDateEdit_po, cDateEdit_Out_s, cDateEdit_Out_po, cDateEdit_Opr_s, cDateEdit_Opr_po, cDateEdit_Up_s,
        cDateEdit_Up_po, cTextEditBprend : string;

        cbalPrice_Check, costPrice_Check, costIznos_Check : integer;

        priznak    : integer;

        long_pole : string;
        prap_flag, d : integer;
        zpt, zpt1 : string;
        DBHANDLE : TISC_DB_HANDLE;
  public
       FILTER_ID_SESSION: integer;
       F_SCH         : boolean;
       ResultArray : Variant;
  end;

  function Find(AOwneri:TComponent; flugi : Boolean; m_formochka : TfmMainIvKartForm; schname, FIOname, DEPname, nomnname : String; schidih, idnomn, idman, idpodr : Int64; grp11, grp22, inv11, inv22, TIPKART, krt11, krt22 : String; workin_g, isnalog, iddb, idkr : integer; dmname, krname, begprice, Bprend : String; alli, expli, outproch : integer; date_expl_1, date_expl_2, date_out_1, date_out_2, date_opr_1, date_opr_2, date_up_1, date_up_2, beg_ostpr, end_ostpr, beg_ostiz, end_ostiz : String; ostPrice_Check, ostIznos_Check, balPrice_Check, isbuh : integer; nazva : string;DBHANDLE : TISC_DB_HANDLE; filter_fg : boolean; id_filter:Integer; BuhPers:Boolean):Variant;

var
  fmFind: TfmFind;

implementation

uses ClassInvKart, uSpMatSchMulti;

{$R *.dfm}

function Find(AOwneri:TComponent; flugi : Boolean; m_formochka : TfmMainIvKartForm; schname, FIOname, DEPname, nomnname : String; schidih, idnomn, idman, idpodr : Int64; grp11, grp22, inv11, inv22, TIPKART, krt11, krt22 : String;  workin_g, isnalog, iddb, idkr : integer; dmname, krname, begprice, Bprend : String; alli, expli, outproch : integer; date_expl_1, date_expl_2, date_out_1, date_out_2, date_opr_1, date_opr_2, date_up_1, date_up_2, beg_ostpr, end_ostpr, beg_ostiz, end_ostiz : String; ostPrice_Check, ostIznos_Check, balPrice_Check, isbuh : integer; nazva : string;DBHANDLE : TISC_DB_HANDLE; filter_fg : boolean; id_filter:Integer; BuhPers:Boolean):Variant;
var
 form : TfmFind;
begin
      form                                  := TfmFind.Create(AOwneri);
      form.DBHANDLE                         := DBHANDLE;

      form.myform                           := m_formochka;
      form.FlagNaAdd                        := flugi;
      form.cxButtonEditSchet.Text           := schname;
      form.cxButtonEdit_FIO.Text            := FIOname;
      form.cxDep.Text                       := DEPname;
      form.cxButtonEditName.Text            := nomnname;
      form.id_schet                         := schidih;
      form.id_nomn                          := idnomn;
      form.id_man                           := idman;
      Form.id_dep                          := idpodr;
      form.cxTextEditNum_grp_s.Text         := grp11;
      form.cxTextEditNum_grp_po.Text        := grp22;
      form.cxTextEditInv_num_s.Text         := inv11;
      form.cxTextEditInv_num_po.Text        := inv22;
      form.cxTextEditTip_kartochki.Text     := TIPKART;
      form.cxTextEdit_NUM_krt_s.Text        := krt11;
      form.cxTextEdit_NUM_krt_po.Text       := krt22;
      form.working                          := workin_g;
      form.is_nalog                         := isnalog;
      form.is_buh                           := isbuh;
      form.id_db                            := iddb;
      form.id_kr                            := idkr;
      form.cxButtonEdit_db.Text             := dmname;
      form.cxButtonEdit_kr.Text             := krname;
      form.cxTextEditbeg_price.Text         := begprice;
      form.cxTextEditBprend.Text            := Bprend;
      form.all                              := alli;
      form.expl                             := expli;
      form.out_proch                        := outproch;
      form.cxDateEdit_s.EditValue           := date_expl_1;
      form.cxDateEdit_po.EditValue          := date_expl_2;
      form.cxDateEdit_Out_s.EditValue       := date_out_1;
      form.cxDateEdit_Out_po.EditValue      := date_out_2;
      form.cxDateEdit_Opr_s.EditValue       := date_opr_1;
      form.cxDateEdit_Opr_po.EditValue      := date_opr_2;
      form.cxDateEdit_Up_s.EditValue        := date_up_1;
      form.cxDateEdit_Up_po.EditValue       := date_up_2;
      form.cxTextEditOstPriceBeging.Text    := beg_ostpr;
      form.cxTextEditOstPriceEnding.Text    := end_ostpr;
      form.cxTextEditOstIznosBeging.Text    := beg_ostiz;
      form.cxTextEditOstIznosEnding.Text    := end_ostiz;
      form.cxButtonEditName.text            := nazva;
      Form.cxBuhPers.Checked               :=BuhPers;

//***************** For canceling **********************************************
      form.cButtonEditSchet                 := schname;
      form.cButtonEdit_FIO                  := FIOname;
      form.c_DEP                            := DEPname;
      form.cButtonEditName                  := nomnname;
      form.cid_schet                        := schidih;
      form.cid_nomn                         := idnomn;
      form.cid_man                          := idman;
      Form.cid_dep                         := idpodr;
      form.cTextEditNum_grp_s               := grp11;
      form.cTextEditNum_grp_po              := grp22;
      form.cTextEditInv_num_s               := inv11;
      form.cTextEditInv_num_po              := inv22;
      form.cTextEditTip_kartochki           := TIPKART;
      form.cTextEdit_NUM_krt_s              := krt11;
      form.cTextEdit_NUM_krt_po             := krt22;
      form.cworking                         := workin_g;
      form.cis_nalog                        := isnalog;
      form.cis_buh                          := isbuh;
      form.cid_db                           := iddb;
      form.cid_kr                           := idkr;
      form.cButtonEdit_db                   := dmname;
      form.cButtonEdit_kr                   := krname;
      form.cTextEditbeg_price               := begprice;
      form.call                             := alli;
      form.cexpl                            := expli;
      form.cout_proch                       := outproch;
      form.cDateEdit_s                      := date_expl_1;
      form.cDateEdit_po                     := date_expl_2;
      form.cDateEdit_Out_s                  := date_out_1;
      form.cDateEdit_Out_po                 := date_out_2;
      form.cDateEdit_Opr_s                  := date_opr_1;
      form.cDateEdit_Opr_po                 := date_opr_2;
      form.cDateEdit_Up_s                   := date_up_1;
      form.cDateEdit_Up_po                  := date_up_2;
      form.cTextEditOstPriceBeging          := beg_ostpr;
      form.cTextEditOstPriceEnding          := end_ostpr;
      form.cTextEditOstIznosBeging          := beg_ostiz;
      form.cTextEditOstIznosEnding          := end_ostiz;
      form.cbalPrice_Check                  := balPrice_Check;
      form.costPrice_Check                  := ostPrice_Check;
      form.costIznos_Check                  := ostIznos_Check;
      form.F_SCH                            := filter_fg;
      form.FILTER_ID_SESSION                := id_filter;
      form.cTextEditBprend                  := Bprend;
//********************** Ending this doing *************************************


//**********  Определение размерности полей для инв номера  ********************
        try
           form.StoredProcWorkWithFullInv.Close;
           form.StoredProcWorkWithFullInv.Database    := form.myform.DatabaseMain;
           form.StoredProcWorkWithFullInv.Transaction := form.myform.WriteTransaction;
           form.StoredProcWorkWithFullInv.Transaction.StartTransaction;
           form.StoredProcWorkWithFullInv.StoredProcName:='MAT_INV_SEL_KOL_ZNAKOV';
           form.StoredProcWorkWithFullInv.Prepare;
           form.StoredProcWorkWithFullInv.ExecProc;
           form.priznak := form.StoredProcWorkWithFullInv.ParamByName('PRIZNAK').AsInteger;
        except on E : Exception do
             begin
                 ShowMessage(E.Message);
                 form.StoredProcWorkWithFullInv.Transaction.Rollback;
                 exit;
             end;
        end;
           form.StoredProcWorkWithFullInv.Transaction.Commit;

        if form.priznak = 0 then
        begin
            form.cxTextEditNum_grp_s.Properties.MaxLength  := 1;
            form.cxTextEditNum_grp_po.Properties.MaxLength := 1;
            form.cxTextEditInv_num_s.Properties.MaxLength  := 8;
            form.cxTextEditInv_num_po.Properties.MaxLength := 8;
        end;
        if form.priznak = 2 then
        begin
            form.cxTextEditNum_grp_s.Properties.MaxLength  := 2;
            form.cxTextEditNum_grp_po.Properties.MaxLength := 2;
            form.cxTextEditInv_num_s.Properties.MaxLength  := 10;
            form.cxTextEditInv_num_po.Properties.MaxLength := 10;
        end;
        if form.priznak = 1 then
        begin
            form.cxTextEditNum_grp_s.Properties.MaxLength  := 2;
            form.cxTextEditNum_grp_po.Properties.MaxLength := 2;
            form.cxTextEditInv_num_s.Properties.MaxLength  := 6;
            form.cxTextEditInv_num_po.Properties.MaxLength := 6;
        end;
//**********  Конец этого действа   ********************************************

      form.cxCheckBox_in_buh_uch.Properties.Caption := MAT_INV_na_buhg_check;
      if balPrice_Check  = 1 then
      begin
          form.cxCheckBoxBalPrice.Checked := true;
      end else
      begin
          form.cxCheckBoxBalPrice.Checked := false;
      end;
      if ostPrice_Check = 1 then
      begin
          form.cxCheckBoxOstPrice.Checked := true;
      end else
      begin
          form.cxCheckBoxOstPrice.Checked := false;
      end;
      if ostIznos_Check = 1 then
      begin
          form.cxCheckBoxOstIznos.Checked := true;
      end else
      begin
          form.cxCheckBoxOstIznos.Checked := false;
      end;

    if form.working = 1 then
    begin
//     form.cxCheckBox_worked.Checked :=true;
    end;

    form.cxComboBoxWorked.ItemIndex:=form.working+1;

    if form.is_nalog = 1 then
  begin
      form.cxCheckBox_in_nalog_uch.Checked :=true;
  end;
  if form.is_buh = 1 then
  begin
      form.cxCheckBox_in_buh_uch.Checked :=true;
  end;
    if form.all = 1 then
        begin
            form.cxRadioButton_all.Checked := true;
        end;
        if form.expl = 1 then
        begin
            form.cxRadioButton_expl.Checked := true;
        end;
        if form.out_proch = 1 then
        begin
            form.cxRadioButton_Out.Checked := true;
        end;
      if form.FlagNaAdd = true then
      begin
          form.Caption                  := MAT_INV_system_name + MAT_INV_Find;
          form.cxButtonCansel.Caption   := MAT_INV_Cansel;
          form.cxButtonChack.Caption    := MAT_INV_ustan;
          form.cxButtonClear.Caption    := MAT_INV_clear;

          //*** Присвоение*********//
          form.Label9.Caption           := MAT_INV_s;
          form.Label8.Caption           := MAT_INV_po;
          form.Label10.Caption          := MAT_INV_s;
          form.Label11.Caption          := MAT_INV_po;

          form.cxLabelBegPo.Caption     := MAT_INV_po;
          form.cxLabelOstPricePo.Caption:= MAT_INV_po;
          form.cxLabelOstIznosPo.Caption:= MAT_INV_po;


          form.cxLabelNaOstPrice.Caption:= MAT_INV_Ost_price;
          form.cxLabelNaOstIznos.Caption:= MAT_INV_Ost_Iznos;
          form.LabelBegPrz.Caption      := MAT_INV_s;
          form.Label29.Caption          := MAT_INV_s;
          form.Label30.Caption          := MAT_INV_s;

          form.Label12.Caption          := MAT_INV_s;
          form.Label13.Caption          := MAT_INV_po;
          form.Label18.Caption          := MAT_INV_s;
          form.Label19.Caption          := MAT_INV_po;
          form.Label21.Caption          := MAT_INV_s;
          form.Label20.Caption          := MAT_INV_po;
          form.Label24.Caption          := MAT_INV_s;
          form.Label23.Caption          := MAT_INV_po;
          form.Label27.Caption          := MAT_INV_s;
          form.Label26.Caption          := MAT_INV_po;

          form.Label3.Caption           := MAT_INV_Inv_Num;
          form.Label2.Caption           := MAT_INV_Num_Grp;
          form.Label4.Caption           := MAT_INV_Tip_karti;
          form.Label5.Caption           := MAT_INV_MOL;
          form.Label6.Caption           := MAT_INV_Name;
          form.Label7.Caption           := MAT_INV_Num_kart;
          form.cxCheckBox_in_nalog_uch.Properties.Caption     := MAT_INV_na_check;
//          form.cxCheckBox_worked.Properties.Caption           := MAT_INV_working;
          form.Label14.Caption          := MAT_INV_buh_db_sch;
          form.Label15.Caption          := MAT_INV_buh_kr_sch;
          form.Label16.Caption          := MAT_INV_Nach_price;
          form.cxRadioButton_all.Caption  := MAT_INV_all;
          form.cxRadioButton_expl.Caption := MAT_INV_expl;
          form.cxRadioButton_Out.Caption  := MAT_INV_out;
          form.Label17.Caption          := MAT_INV_date_nach_expl;
          form.Label22.Caption          := MAT_INV_Date_Exit;
          form.Label25.Caption          := MAT_INV_Date_opr;
          form.Label28.Caption          := MAT_INV_Date_Refrash;

          form.Label1.Caption           := MAT_INV_SCH;
          //form.id_schet    := 0;
      end else
      begin
          form.id_schet    := 0;
      end;
      begin
         // form.id_schet    := 0;
      end;

      form.ShowModal;
      Find := form.ResultArray;
      form.Free;
end;


procedure TfmFind.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    Res : Variant;
begin
    res := GlobalSpr.GetSch(Self, myform.DatabaseMain.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_schet := res[0][0];
            cxButtonEditSchet.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;

procedure TfmFind.cxButtonCanselClick(Sender: TObject);
begin
    //close;
end;

procedure TfmFind.cxTextEditInv_num_poKeyPress(Sender: TObject; var Key: Char);
begin
    if (key > '9') or (key < '0') then key := Chr(0);
end;

procedure TfmFind.cxTextEditInv_num_sKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key > '9') or (key < '0') then key := Chr(0);
end;

procedure TfmFind.cxButtonEdit_FIOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
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
  cxButtonEdit_FIO.Text:=Res[1]+' / '+Res[2];
 end;
end;

procedure TfmFind.cxButtonEditNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
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
begin
 hPack := GetModuleHandle('SpNom.bpl');
 if hPack < 32 then hPack := LoadPackage(ExtractFilePath(Application.ExeName)+ 'SpNom.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetNomnEx'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, myform.DatabaseMain.Handle, fsNormal, 0, 0, 0, 0, 0, 0, 0);
 end else begin
  ShowMessage(PChar('Error!'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
  id_nomn:=Res[0];
  cxButtonEditName.Text:=Res[1];
 end;
end;

procedure TfmFind.cxButtonEditSchetKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmFind.cxButtonEdit_FIOKeyPress(Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmFind.cxButtonEditNameKeyPress(Sender: TObject; var Key: Char);
begin
   // key := chr(0);
end;

procedure TfmFind.cxButtonEditSchetPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
if FILTER_ID_SESSION = 0 then
begin
        FILTER_ID_SESSION := GenId_sessionFilter;
end;

 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxButtonEditSchet.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  cxButtonEditSchet.Text:='';
 end;

end;
{var
    Res : Variant;
begin
    res := GlobalSpr.GetSch(Self, myform.DatabaseMain.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_schet := res[0][0];
            cxButtonEditSchet.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;}

procedure TfmFind.cxButtonEdit_dbPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    Res : Variant;
begin
    res := GlobalSpr.GetSch(Self, myform.DatabaseMain.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_db   := res[0][0];
            cxButtonEdit_db.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;

procedure TfmFind.cxButtonEdit_krPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    Res : Variant;
begin
    res := GlobalSpr.GetSch(Self, myform.DatabaseMain.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_kr   := res[0][0];
            cxButtonEdit_kr.Text := res[0][3];//+' - '+res[0][1];
        end;
    end;
end;

procedure TfmFind.cxButtonEdit_dbKeyPress(Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmFind.cxButtonEdit_krKeyPress(Sender: TObject; var Key: Char);
begin
    key := chr(0);
end;

procedure TfmFind.cxTextEditbeg_priceKeyPress(Sender: TObject; var Key: Char);
var
   i: integer;
begin
    if Key = ',' then Key := '.';//Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = '.' then
    begin
        prap_flag := 0;
        zpt := cxTextEditbeg_price.Text;
        long_pole:= IntToStr(cxTextEditbeg_price.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = '.' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmFind.Action1Execute(Sender: TObject);
begin
     if cxTextEditbeg_price.Text = '0,00' then
     begin
         cxTextEditbeg_price.Text := '0';
     end;
     if cxTextEditBprend.Text = '0,00' then
     begin
         cxTextEditBprend.Text := '0';
     end;

     if cxTextEditOstPriceBeging.Text = '0,00' then
     begin
         cxTextEditOstPriceBeging.Text := '0';
     end;
     if cxTextEditOstPriceEnding.Text = '0,00' then
     begin
         cxTextEditOstPriceEnding.Text := '0';
     end;
     if cxTextEditOstIznosBeging.Text = '0,00' then
     begin
         cxTextEditOstIznosBeging.Text := '0';
     end;
     if cxTextEditOstIznosEnding.Text = '0,00' then
     begin
         cxTextEditOstIznosEnding.Text := '0';
     end;

     if cxCheckBoxBalPrice.Checked = false then
     begin
         cxTextEditbeg_price.Text      := '';
         cxTextEditBprend.Text         := '';
     end;

     if cxCheckBoxOstPrice.Checked = false then
     begin
         cxTextEditOstPriceBeging.Text := '';
         cxTextEditOstPriceEnding.Text := '';
     end;

     if cxCheckBoxOstIznos.Checked = false then
     begin
         cxTextEditOstIznosBeging.Text := '';
         cxTextEditOstIznosEnding.Text := '';
     end;

     if cxCheckBox_in_nalog_uch.Checked = true then
     begin
         is_nalog := 1;
     end else
     begin
         is_nalog := 0;
     end;
     if cxCheckBox_in_buh_uch.Checked = true then
     begin
         is_buh := 1;
     end else
     begin
         is_buh := 0;
     end;
     working:=cxComboBoxWorked.ItemIndex-1;
{     if cxCheckBox_worked.Checked = true then
     begin
         working := 1;
     end else
     begin
         working := 0;
     end;
}
     if cxRadioButton_all.Checked = true then
     begin
         all := 1;
     end else
     begin
         all := 0;
     end;
     if cxRadioButton_expl.Checked = true then
     begin
         expl := 1;
     end else
     begin
         expl := 0;
     end;
     if cxRadioButton_out.Checked = true then
     begin
         out_proch := 1;
     end else
     begin
         out_proch := 0;
     end;
     if cxBuhPers.Checked = True then buh_pers:=1 else buh_pers:=0;

            ResultArray := VarArrayCreate([0,45], varVariant);
            ResultArray[0] := id_schet;
            ResultArray[1] := id_nomn;
            ResultArray[2] := id_man;
            ResultArray[3] := cxTextEditNum_grp_s.Text;
            ResultArray[4] := cxTextEditNum_grp_po.Text;
            ResultArray[5] := cxTextEditInv_num_s.Text;
            ResultArray[6] := cxTextEditInv_num_po.Text;
            ResultArray[7] := cxButtonEditSchet.Text;
            ResultArray[8] := cxButtonEdit_FIO.Text;
            ResultArray[9] := cxButtonEditName.Text;
            ResultArray[10]:= cxTextEditTip_kartochki.Text;
            ResultArray[11]:= cxTextEdit_NUM_krt_s.Text;
            ResultArray[12]:= cxTextEdit_NUM_krt_po.Text;
            ResultArray[13] := is_nalog;
            ResultArray[14] := working;
            ResultArray[15]:= cxButtonEdit_db.Text;
            ResultArray[16]:= cxButtonEdit_kr.Text;
            ResultArray[17] := id_db;
            ResultArray[18] := id_kr;
            ResultArray[19] := cxTextEditbeg_price.Text;
            ResultArray[20] := all;
            ResultArray[21] := expl;
            ResultArray[22] := out_proch;
            ResultArray[23] := cxDateEdit_s.Text;
            ResultArray[24] := cxDateEdit_po.Text;
            ResultArray[25] := cxDateEdit_Out_s.Text;
            ResultArray[26] := cxDateEdit_Out_po.Text;
            ResultArray[27] := cxDateEdit_Opr_s.Text;
            ResultArray[28] := cxDateEdit_Opr_po.Text;
            ResultArray[29] := cxDateEdit_Up_s.Text;
            ResultArray[30] := cxDateEdit_Up_po.Text;
            ResultArray[31] := cxTextEditOstPriceBeging.Text;
            ResultArray[32] := cxTextEditOstPriceEnding.Text;
            ResultArray[33] := cxTextEditOstIznosBeging.Text;
            ResultArray[34] := cxTextEditOstIznosEnding.Text;

            if cxCheckBoxOstPrice.Checked = true then
            begin
                ResultArray[35] := 1;
            end else
            begin
                ResultArray[35] := 0;
            end;
            if cxCheckBoxOstIznos.Checked = true then
            begin
                ResultArray[36] := 1;
            end else
            begin
                ResultArray[36] := 0;
            end;
            if cxCheckBoxBalPrice.Checked = true then
            begin
                ResultArray[37] := 1;
            end else
            begin
                ResultArray[37] := 0;
            end;
            ResultArray[38] := is_buh;
            ResultArray[39] := cxButtonEditName.text;
            resultArray[40]   := F_SCH;
            resultArray[41]   := FILTER_ID_SESSION;
            resultArray[42]   := cxTextEditBprend.Text;
            resultArray[43]   := cxDep.Text;
            resultArray[44]   := ID_DEP;
            resultArray[45]   := buh_pers;
            
            Close;
end;

procedure TfmFind.Action2Execute(Sender: TObject);
begin
    cxButtonEditSchet.Clear;
    cxTextEditTip_kartochki.Clear;
    cxTextEditNum_grp_s.Clear;
    cxTextEditNum_grp_po.Clear;
    cxTextEditInv_num_s.Clear;
    cxTextEditInv_num_po.Clear;
    cxButtonEdit_FIO.Clear;
    cxDep.Clear;
    cxButtonEditName.Clear;
    cxTextEdit_NUM_krt_s.Clear;
    cxTextEdit_NUM_krt_po.Clear;
    cxCheckBox_in_nalog_uch.Checked := false;
    cxCheckBox_in_buh_uch.Checked   := true;
    cxComboBoxWorked.ItemIndex:=0;
//    cxCheckBox_worked.Checked       := false;
    cxRadioButton_all.Checked       := true;
    cxRadioButton_expl.Checked      := false;
    cxRadioButton_Out.Checked       := false;
    cxDateEdit_po.Clear;
    cxDateEdit_s.Clear;
    cxButtonEdit_db.Clear;
    cxButtonEdit_kr.Clear;
    cxDateEdit_s.EditValue       := null;
    cxDateEdit_po.EditValue      := null;
    cxDateEdit_Out_s.EditValue   := null;
    cxDateEdit_Out_po.EditValue  := null;
    cxDateEdit_Opr_s.EditValue   := null;
    cxDateEdit_Opr_po.EditValue  := null;
    cxDateEdit_Up_s.EditValue    := null;
    cxDateEdit_Up_po.EditValue   := null;

//    cxRadioButton_expl.Checked   := true;
//    cxCheckBox_worked.Checked    := true;

    id_schet    := 0;
    id_man      := 0;
    id_nomn     := 0;
    id_db       := 0;
    id_kr       := 0;
    all         := 0;
    expl        := 0;
    out_proch   := 0;

    cxTextEditbeg_price.Text     := '0,00';
    cxTextEditBprend.Text        := '0,00';

    cxTextEditOstPriceEnding.Text:= '0,00';
    cxTextEditOstPriceBeging.Text:= '0,00';

    cxTextEditOstIznosBeging.Text:= '0,00';
    cxTextEditOstIznosEnding.Text:= '0,00';
    F_SCH                        := false;
    FILTER_ID_SESSION            := 0;
    cxBuhPers.Checked:=False;
end;

procedure TfmFind.FormCreate(Sender: TObject);
begin
//    cxCheckBox_worked.Checked := true;
    cxRadioButton_expl.Checked := true;
end;

procedure TfmFind.cxTextEditOstPriceBegingKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
    if Key = ',' then Key := '.';//Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = '.' then
    begin
        prap_flag := 0;
        zpt := cxTextEditOstPriceBeging.Text;
        long_pole:= IntToStr(cxTextEditOstPriceBeging.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = '.' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmFind.cxTextEditOstPriceEndingKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
    if Key = ',' then Key := '.';//Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = '.' then
    begin
        prap_flag := 0;
        zpt := cxTextEditOstPriceEnding.Text;
        long_pole:= IntToStr(cxTextEditOstPriceEnding.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = '.' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmFind.cxTextEditOstPriceBegingExit(Sender: TObject);
var
    i: integer;
    sexy : Currency;
begin
    if cxTextEditOstPriceBeging.Text = '' then cxTextEditOstPriceBeging.Text := '0.00';
     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPriceBeging.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPriceBeging.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> '.' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = '.' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = '.' then
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
                    zpt := zpt+'.00';
                    cxTextEditOstPriceBeging.Clear;
                    cxTextEditOstPriceBeging.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceBeging.Clear;
                cxTextEditOstPriceBeging.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceBeging.Clear;
                cxTextEditOstPriceBeging.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

procedure TfmFind.cxTextEditOstPriceEndingExit(Sender: TObject);
var
    i: integer;
    sexy : Currency;
begin
    if cxTextEditOstPriceEnding.Text = '' then cxTextEditOstPriceEnding.Text := '0.00';
         //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstPriceEnding.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstPriceEnding.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> '.' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = '.' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = '.' then
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
                    zpt := zpt+'.00';
                    cxTextEditOstPriceEnding.Clear;
                    cxTextEditOstPriceEnding.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceEnding.Clear;
                cxTextEditOstPriceEnding.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstPriceEnding.Clear;
                cxTextEditOstPriceEnding.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

procedure TfmFind.cxTextEditOstIznosBegingExit(Sender: TObject);
var
    i: integer;
    sexy : Currency;
begin
    if cxTextEditOstIznosBeging.Text = '' then cxTextEditOstIznosBeging.Text := '0.00';

     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznosBeging.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznosBeging.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> '.' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = '.' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = '.' then
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
                    zpt := zpt+'.00';
                    cxTextEditOstIznosBeging.Clear;
                    cxTextEditOstIznosBeging.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosBeging.Clear;
                cxTextEditOstIznosBeging.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosBeging.Clear;
                cxTextEditOstIznosBeging.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;


procedure TfmFind.cxTextEditOstIznosEndingExit(Sender: TObject);
var
    i: integer;
    sexy : Currency;
begin
    if cxTextEditOstIznosEnding.Text = '' then cxTextEditOstIznosEnding.Text := '0.00';

     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditOstIznosEnding.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditOstIznosEnding.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> '.' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = '.' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = '.' then
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
                    zpt := zpt+'.00';
                    cxTextEditOstIznosEnding.Clear;
                    cxTextEditOstIznosEnding.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosEnding.Clear;
                cxTextEditOstIznosEnding.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditOstIznosEnding.Clear;
                cxTextEditOstIznosEnding.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

procedure TfmFind.cxTextEditOstIznosBegingKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
    if Key = ',' then Key := '.';//Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = '.' then
    begin
        prap_flag := 0;
        zpt := cxTextEditOstIznosBeging.Text;
        long_pole:= IntToStr(cxTextEditOstIznosBeging.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = '.' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmFind.cxTextEditOstIznosEndingKeyPress(Sender: TObject;
  var Key: Char);
var
   i: integer;
begin
    if Key = ',' then Key := '.';//Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = '.' then
    begin
        prap_flag := 0;
        zpt := cxTextEditOstIznosEnding.Text;
        long_pole:= IntToStr(cxTextEditOstIznosEnding.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = '.' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;

procedure TfmFind.cxCheckBoxOstPricePropertiesChange(Sender: TObject);
begin
    if cxCheckBoxOstPrice.Checked = true then
    begin
        cxTextEditOstPriceBeging.Enabled := true;
        cxTextEditOstPriceEnding.Enabled := true;
        //cxTextEditOstPriceBeging.SetFocus;
    end else
    begin
        cxTextEditOstPriceBeging.Enabled := false;
        cxTextEditOstPriceEnding.Enabled := false;
    end;
end;

procedure TfmFind.cxCheckBoxOstIznosPropertiesChange(Sender: TObject);
begin
    if cxCheckBoxOstIznos.Checked = true then
    begin
        cxTextEditOstIznosBeging.Enabled := true;
        cxTextEditOstIznosEnding.Enabled := true;
        //cxTextEditOstIznosBeging.SetFocus;
    end else
    begin
        cxTextEditOstIznosBeging.Enabled := false;
        cxTextEditOstIznosEnding.Enabled := false;
    end;
end;

procedure TfmFind.cxCheckBoxBalPricePropertiesChange(Sender: TObject);
begin
    if cxCheckBoxBalPrice.Checked = true then
    begin
        cxTextEditbeg_price.Enabled := true;
        cxTextEditBprend.Enabled    := true;
        //cxTextEditbeg_price.SetFocus;
    end else
    begin
        cxTextEditbeg_price.Enabled := false;
        cxTextEditBprend.Enabled    := false;
    end;
end;

procedure TfmFind.cxTextEditbeg_priceExit(Sender: TObject);
var
    i: integer;
    sexy : Currency;
begin
    if cxTextEditbeg_price.Text = '' then cxTextEditbeg_price.Text := '0.00';

     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditbeg_price.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditbeg_price.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> '.' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = '.' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = '.' then
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
                    zpt := zpt+'.00';
                    cxTextEditbeg_price.Clear;
                    cxTextEditbeg_price.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditbeg_price.Clear;
                cxTextEditbeg_price.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditbeg_price.Clear;
                cxTextEditbeg_price.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************

end;


procedure TfmFind.Action3Execute(Sender: TObject);
begin
    if cTextEditbeg_price = '0,00' then
     begin
         cTextEditbeg_price := '0';
     end;
     if cTextEditBprend = '0,00' then
     begin
         cTextEditBprend := '0';
     end;

     if cTextEditOstPriceBeging = '0,00' then
     begin
         cTextEditOstPriceBeging := '0';
     end;
     if cTextEditOstPriceEnding = '0,00' then
     begin
         cTextEditOstPriceEnding := '0';
     end;
     if cTextEditOstIznosBeging = '0,00' then
     begin
         cTextEditOstIznosBeging := '0';
     end;
     if cTextEditOstIznosEnding = '0,00' then
     begin
         cTextEditOstIznosEnding := '0';
     end;

     if cxCheckBoxBalPrice.Checked = false then
     begin
         cTextEditbeg_price      := '';
         cTextEditBprend         := '';
     end;

     if cxCheckBoxOstPrice.Checked = false then
     begin
         cTextEditOstPriceBeging := '';
         cTextEditOstPriceEnding := '';
     end;

     if cxCheckBoxOstIznos.Checked = false then
     begin
         cTextEditOstIznosBeging := '';
         cTextEditOstIznosEnding := '';
     end;

    ResultArray := VarArrayCreate([0,44], varVariant);
    ResultArray[0]  := cid_schet;
    ResultArray[1]  := cid_nomn;
    ResultArray[2]  := cid_man;
    ResultArray[3]  := cTextEditNum_grp_s;
    ResultArray[4]  := cTextEditNum_grp_po;
    ResultArray[5]  := cTextEditInv_num_s;
    ResultArray[6]  := cTextEditInv_num_po;
    ResultArray[7]  := cButtonEditSchet;
    ResultArray[8]  := cButtonEdit_FIO;
    ResultArray[9]  := cButtonEditName;
    ResultArray[10] := cTextEditTip_kartochki;
    ResultArray[11] := cTextEdit_NUM_krt_s;
    ResultArray[12] := cTextEdit_NUM_krt_po;
    ResultArray[13] := cis_nalog;
    ResultArray[14] := cworking;
    ResultArray[15] := cButtonEdit_db;
    ResultArray[16] := cButtonEdit_kr;
    ResultArray[17] := cid_db;
    ResultArray[18] := cid_kr;
    ResultArray[19] := cTextEditbeg_price;
    ResultArray[20] := call;
    ResultArray[21] := cexpl;
    ResultArray[22] := cout_proch;
    ResultArray[23] := cDateEdit_s;
    ResultArray[24] := cDateEdit_po;
    ResultArray[25] := cDateEdit_Out_s;
    ResultArray[26] := cDateEdit_Out_po;
    ResultArray[27] := cDateEdit_Opr_s;
    ResultArray[28] := cDateEdit_Opr_po;
    ResultArray[29] := cDateEdit_Up_s;
    ResultArray[30] := cDateEdit_Up_po;
    ResultArray[31] := cTextEditOstPriceBeging;
    ResultArray[32] := cTextEditOstPriceEnding;
    ResultArray[33] := cTextEditOstIznosBeging;
    ResultArray[34] := cTextEditOstIznosEnding;
    ResultArray[35] := costPrice_Check;
    ResultArray[36] := costIznos_Check;
    ResultArray[37] := cbalPrice_Check;
    ResultArray[38] := cis_buh;
    ResultArray[39] := cxButtonEditName.text;
    resultArray[40]   := F_SCH;
    resultArray[41]   := FILTER_ID_SESSION;
    resultArray[42]   := cTextEditBprend;
    resultArray[43]   := c_DEP;
    resultArray[44]   := cid_dep;
    close;
end;

procedure TfmFind.cxTextEditBprendExit(Sender: TObject);
var
    i: integer;
    sexy : Currency;
begin
    if cxTextEditBprend.Text = '' then cxTextEditBprend.Text := '0.00';

     //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditBprend.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditBprend.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> '.' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = '.' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = '.' then
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
                    zpt := zpt+'.00';
                    cxTextEditBprend.Clear;
                    cxTextEditBprend.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditBprend.Clear;
                cxTextEditBprend.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditBprend.Clear;
                cxTextEditBprend.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************

end;


procedure TfmFind.cxTextEditBprendKeyPress(Sender: TObject; var Key: Char);
var
   i: integer;
begin
    if Key = ',' then Key := '.';//Key := DecimalSeparator;

    if (Key >= 'а') and (Key <= 'я') then
    begin
        Key := Chr(0);
    end;
    if Key = '.' then
    begin
        prap_flag := 0;
        zpt := cxTextEditBprend.Text;
        long_pole:= IntToStr(cxTextEditBprend.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] = '.' then
            begin
                Key := Chr(0);
            end;
        end;
    end;
end;


procedure TfmFind.cxDepKeyPress(Sender: TObject; var Key: Char);
begin
 key := chr(0);
end;

procedure TfmFind.cxDepPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
    // Выходные параметры:
    // Id_Department - идентификатор
    // Name_Short - сокращенное название
    // Name_Full - полное название
    // создать справочник
    sp := GetSprav(ExtractFilePath(Application.ExeName)+'SpDepartment.bpl');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(self.DBHANDLE);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Root_Department'] := _ID_DEP_ROOT;
//            FieldValues['Id_Dep_Property'] := -1;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
        ShowMessage(MAT_STR_NOTHING_SELECT)
    else
    if not sp.Output.IsEmpty then
    begin
     cxDep.Text := sp.Output['Name_full'];
     c_DEP:=sp.Output['Name_full'];
     ID_DEP := sp.Output['Id_Department'];
    end;
    sp.Free;
end;

end.
