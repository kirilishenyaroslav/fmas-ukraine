unit fmSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCheckBox, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, ComCtrls, cxButtonEdit,
  cxLookAndFeelPainters, cxButtons, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, uMatasUtils, GlobalSPR, ActnList, uResources;

type
  TfrmSetup = class(TForm)
    SetupPageControl: TPageControl;
    TabSheet2: TTabSheet;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DEDateOstRec: TcxDateEdit;
    DEMaxDepDate: TcxDateEdit;
    CBDefaultIstfin: TcxCheckBox;
    DEBegDateRec: TcxDateEdit;
    CBTypeSubSch: TcxComboBox;
    CBSchInDoc: TcxCheckBox;
    CbMnaKartEn: TcxCheckBox;
    CBInvKartEn: TcxCheckBox;
    CBCloseMatSch: TcxCheckBox;
    CBTypeMatAccount: TcxComboBox;
    CBGetSchMode: TcxComboBox;
    CBToolsEn: TcxCheckBox;
    CBCleanIstfinByDog: TcxCheckBox;
    CBGenInumMode: TcxComboBox;
    CBInvNumFormat: TcxComboBox;
    CBNnumFormat: TcxComboBox;
    MBookEn: TcxCheckBox;
    CBGetOstMode: TcxComboBox;
    CBMolFormat: TcxComboBox;
    CBAvtoSetAmortData: TcxComboBox;
    CBRoundIznos: TcxCheckBox;
    CBLinkToNDSEn: TcxCheckBox;
    CBNegativOst: TcxCheckBox;
    CBFIFOOnMatSch: TcxCheckBox;
    TEIDSystem: TcxTextEdit;
    BESchPropInvAcc: TcxButtonEdit;
    BESchPropIznos: TcxButtonEdit;
    BESchPropMol: TcxButtonEdit;
    BESchPropSklad: TcxButtonEdit;
    BESchPropOs: TcxButtonEdit;
    BESchPropMna: TcxButtonEdit;
    BESchPropMAt: TcxButtonEdit;
    BEFondOs: TcxButtonEdit;
    BEFondMBP: TcxButtonEdit;
    BEFondMNA: TcxButtonEdit;
    BESchIznos: TcxButtonEdit;
    BEDefAmortDb: TcxButtonEdit;
    BEDefAmortKr: TcxButtonEdit;
    CBShowExep: TcxCheckBox;
    Label3: TLabel;
    TEDocLen: TcxTextEdit;
    Label5: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    BEGroupDogSelect: TcxTextEdit;
    BEGroupDogAdd: TcxTextEdit;
    BEKodStNDS: TcxTextEdit;
    ActionList1: TActionList;
    acYes: TAction;
    acCancel: TAction;
    use_short_org_name: TcxCheckBox;
    lbl1: TLabel;
    chk_oper_form: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BEDefAmortKrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEDefAmortDbPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BESchIznosPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEFondMNAPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEFondMBPPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BEFondOsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure acYesExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
  Res : Variant;
  id_sch:integer;
  sch_number:string;
  MATAS_PERIOD:TDateTime;
  sch_os,sch_mbp,sch_mna,sch_iznos,sch_db,sch_kr:Integer;
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation

uses dmMain,DateUtils;
{$R *.dfm}


procedure TfrmSetup.FormCreate(Sender: TObject);
var sch_id:integer;
    sch_number:string;
begin
  try
   dmMatas.MatasStoredProc.Transaction.StartTransaction;
   dmMatas.MatasStoredProc.StoredProcName:='MAT_INI_SELECT_ALL';
   dmMatas.MatasStoredProc.Prepare;
   dmMatas.MatasStoredProc.ExecProc;
   CBShowExep.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('SHOW_EXCEPTIONS').Value);
   DEDateOstRec.EditValue:=dmMatas.MatasStoredProc.ParamByName('DATE_OST_REC').Value;
   DEMaxDepDate.EditValue:=dmMatas.MatasStoredProc.ParamByName('MAX_DEP_DATE').Value;
   TEIDSystem.Text:=dmMatas.MatasStoredProc.ParamByName('MAT_ID_SYSTEM').Value;
   CBDefaultIstfin.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('USE_DEFAULT_ISTFIN').Value);
   DEBegDateRec.editvalue:=dmMatas.MatasStoredProc.ParamByName('BEG_DATE_REC').Value;
   CBTypeSubSch.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('TYPE_SUB_SCH').Value;
   CBSchInDoc.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('SCH_IN_DOC').Value);
   BESchPropIznos.Text:=dmMatas.MatasStoredProc.ParamByName('SCH_PROP_IZNOS').Value;
   BESchPropMol.Text:=dmMatas.MatasStoredProc.ParamByName('SCH_PROP_MOL').Value;
   BESchPropSklad.Text:=dmMatas.MatasStoredProc.ParamByName('SCH_PROP_SKLAD').Value;
   BESchPropOs.Text:=dmMatas.MatasStoredProc.ParamByName('SCH_PROP_OS').Value;
   BESchPropMna.Text:=dmMatas.MatasStoredProc.ParamByName('SCH_PROP_MNA').Value;
   BESchPropMAt.Text:=dmMatas.MatasStoredProc.ParamByName('SCH_PROP_MAT').Value;
   BEGroupDogSelect.Text:=dmMatas.MatasStoredProc.ParamByName('GROUP_DOG_SELECT').Value;
   BEGroupDogAdd.Text:=dmMatas.MatasStoredProc.ParamByName('GROUP_DOG_ADD').Value;
   BEKodStNDS.Text:=dmMatas.MatasStoredProc.ParamByName('KOD_ST_NDS').Value;
   CBCloseMatSch.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('CLOSE_MAT_SCH').Value);
   CBInvKartEn.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('INV_KART_ENABLED').Value);
   CbMnaKartEn.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('MNA_KART_ENABLED').Value);
   CBTypeMatAccount.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('TYPE_MAT_ACCOUNT').Value;
   CBGetSchMode.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('GET_SCH_MODE').Value;
   CBToolsEn.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('TOOLS_ENABLED').Value);
   CBCleanIstfinByDog.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('CLEAR_ISTFIN_BY_DOG').Value);
   BESchPropInvAcc.Text:=dmMatas.MatasStoredProc.ParamByName('SCH_PROP_INV_ACC').Value;
   CBGenInumMode.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('GEN_INUM_MODE').Value;
   CBInvNumFormat.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('INV_NUM_FORMAT').Value;
   CBNnumFormat.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('NNUM_FORMAT').Value;
   use_short_org_name.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('USE_SHORT_ORG_NAME').Value);
   chk_oper_form.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('SHOW_OPER_FORM').Value);

   sch_id:=dmMatas.MatasStoredProc.ParamByName('FOND_OS_ROOT_ID').Value;
   if dmMatas.MatasStoredProc.ParamByName('Fond_Os_Root_Number').Value=null
    then sch_number:=''
    else sch_number:=dmMatas.MatasStoredProc.ParamByName('Fond_Os_Root_Number').Value;
   BEFondOs.text:=sch_number+' ('+inttostr(sch_id)+')';
   sch_os:=sch_id;

   sch_id:=dmMatas.MatasStoredProc.ParamByName('FOND_MBP_ROOT_ID').Value;
   if dmMatas.MatasStoredProc.ParamByName('Fond_Mbp_Root_Number').Value=null
    then sch_number:=''
    else sch_number:=dmMatas.MatasStoredProc.ParamByName('Fond_Mbp_Root_Number').Value;
   BEFondMBP.text:=sch_number+' ('+inttostr(sch_id)+')';
   sch_mbp:=sch_id;

   sch_id:=dmMatas.MatasStoredProc.ParamByName('FOND_MNA_ROOT_ID').Value;
   if dmMatas.MatasStoredProc.ParamByName('Fond_Mna_Root_Number').Value=null
    then sch_number:=''
    else sch_number:=dmMatas.MatasStoredProc.ParamByName('Fond_Mna_Root_Number').Value;
   BEFondMNA.text:=sch_number+' ('+inttostr(sch_id)+')';
   sch_mna:=sch_id;

   sch_id:=dmMatas.MatasStoredProc.ParamByName('SCH_IZNOS_ROOT_ID').Value;
   if dmMatas.MatasStoredProc.ParamByName('SCH_IZNOS_ROOT_NUMBER').Value=null
    then sch_number:=''
    else sch_number:=dmMatas.MatasStoredProc.ParamByName('SCH_IZNOS_ROOT_NUMBER').Value;
   BESchIznos.text:=sch_number+' ('+inttostr(sch_id)+')';
   sch_iznos:=sch_id;

   MBookEn.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('MBOOK_ENABLED').Value);
   CBGetOstMode.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('GET_OST_MODE').Value;
   CBMolFormat.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('MOL_FIO_FORMAT').Value;
   CBRoundIznos.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('ROUND_IZNOS').Value);
   CBLinkToNDSEn.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('LINK_TO_NDS_ENABLED').Value);
   CBAvtoSetAmortData.ItemIndex:=dmMatas.MatasStoredProc.ParamByName('AUTO_SET_AMORT_DATA').Value;
   CBNegativOst.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('CHECK_NEGATIVE_OST').Value);
    if dmMatas.MatasStoredProc.ParamByName('DEF_AMORT_DB_ID_SCH').Value=null
      then sch_id:=0
    else sch_id:=dmMatas.MatasStoredProc.ParamByName('DEF_AMORT_DB_ID_SCH').Value;
    if dmMatas.MatasStoredProc.ParamByName('Def_Amort_Db_Number').Value=null
      then sch_number:=''
    else sch_number:=dmMatas.MatasStoredProc.ParamByName('Def_Amort_Db_Number').Value;
    BEDefAmortDb.text:=sch_number+' ('+inttostr(sch_id)+')';
    sch_db:=sch_id;

    if dmMatas.MatasStoredProc.ParamByName('DEF_AMORT_KR_ID_SCH').Value=null
      then sch_id:=0
    else sch_id:=dmMatas.MatasStoredProc.ParamByName('DEF_AMORT_KR_ID_SCH').Value;
    if dmMatas.MatasStoredProc.ParamByName('Def_Amort_Kr_Number').Value=null
      then sch_number:=''
    else sch_number:=dmMatas.MatasStoredProc.ParamByName('Def_Amort_Kr_Number').Value;
   BEDefAmortKr.text:=sch_number+' ('+inttostr(sch_id)+')';
   sch_kr:=sch_id;

   CBFIFOOnMatSch.Checked:=IntToBool(dmMatas.MatasStoredProc.ParamByName('USE_FIFO_ON_MAT_SCH').Value);
   TEDocLen.Text:=dmMatas.MatasStoredProc.ParamByName('DOC_REESTR_NUM_LEN').Value;

     dmMatas.MatasStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    dmMatas.MatasStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
 // SetEnvironment;
 cxButton1.Caption:=MAT_BUTTON_SAVE_CONST;
end;

procedure TfrmSetup.BEDefAmortKrPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  MATAS_PERIOD:=dmMatas.IniDataSet.FieldByName('DATE_REC').AsDateTime;
  Res:=GlobalSPR.GetSch(self,  dmMatas.fdbMatas.Handle, fsNormal,MATAS_PERIOD, 1, -1, -1);
    if VarArrayDimCount(Res)>0 then
    begin
     ID_SCH := (Res[0][0]);
     SCH_NUMBER := VarToStr(RES[0][3]);
    end;
  BEDefAmortKr.Text:=sch_number+' ('+IntToStr(id_sch)+')';
  sch_kr:=id_sch;
end;

procedure TfrmSetup.BEDefAmortDbPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  MATAS_PERIOD:=dmMatas.IniDataSet.FieldByName('DATE_REC').AsDateTime;
  Res:=GlobalSPR.GetSch(self,  dmMatas.fdbMatas.Handle, fsNormal,MATAS_PERIOD, 1, -1, -1);
    if VarArrayDimCount(Res)>0 then
    begin
     ID_SCH := (Res[0][0]);
     SCH_NUMBER := VarToStr(RES[0][3]);
    end;
  BEDefAmortDb.Text:=sch_number+' ('+IntToStr(id_sch)+')';
  sch_db:=id_sch;
end;

procedure TfrmSetup.BESchIznosPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  MATAS_PERIOD:=dmMatas.IniDataSet.FieldByName('DATE_REC').AsDateTime;
  Res:=GlobalSPR.GetSch(self,  dmMatas.fdbMatas.Handle, fsNormal,MATAS_PERIOD, 1, -1, -1);
    if VarArrayDimCount(Res)>0 then
    begin
     ID_SCH := (Res[0][0]);
     SCH_NUMBER := VarToStr(RES[0][3]);
    end;
  BESchIznos.Text:=sch_number+' ('+IntToStr(id_sch)+')';
  sch_iznos:=id_sch;
end;

procedure TfrmSetup.BEFondMNAPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  MATAS_PERIOD:=dmMatas.IniDataSet.FieldByName('DATE_REC').AsDateTime;
  Res:=GlobalSPR.GetSch(self,  dmMatas.fdbMatas.Handle, fsNormal,MATAS_PERIOD, 1, -1, -1);
    if VarArrayDimCount(Res)>0 then
    begin
     ID_SCH := (Res[0][0]);
     SCH_NUMBER := VarToStr(RES[0][3]);
    end;
  BEFondMNA.Text:=sch_number+' ('+IntToStr(id_sch)+')';
  sch_mna:=id_sch;
end;

procedure TfrmSetup.BEFondMBPPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  MATAS_PERIOD:=dmMatas.IniDataSet.FieldByName('DATE_REC').AsDateTime;
  Res:=GlobalSPR.GetSch(self,  dmMatas.fdbMatas.Handle, fsNormal,MATAS_PERIOD, 1, -1, -1);
    if VarArrayDimCount(Res)>0 then
    begin
     ID_SCH := (Res[0][0]);
     SCH_NUMBER := VarToStr(RES[0][3]);
    end;
  BEFondMBP.Text:=sch_number+' ('+IntToStr(id_sch)+')';
  sch_mbp:=id_sch;
end;

procedure TfrmSetup.BEFondOsPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  MATAS_PERIOD:=dmMatas.IniDataSet.FieldByName('DATE_REC').AsDateTime;
  Res:=GlobalSPR.GetSch(self,  dmMatas.fdbMatas.Handle, fsNormal,MATAS_PERIOD, 1, -1, -1);
    if VarArrayDimCount(Res)>0 then
    begin
     ID_SCH := (Res[0][0]);
     SCH_NUMBER := VarToStr(RES[0][3]);
    end;
  BEFondOs.Text:=sch_number+' ('+IntToStr(id_sch)+')';
  sch_os:=id_sch;
end;

procedure TfrmSetup.acYesExecute(Sender: TObject);
begin
    if TEDocLen.text='' then
   begin
    ShowMessage('Заповніть поле Длина полю "номер реєстру документів"');
    TEDocLen.SetFocus;
    Exit;
   end;

  if DEDateOstRec.text='' then
   begin
    ShowMessage('Заповніть поле Період вводу початкових залишків');
    DEDateOstRec.SetFocus;
    Exit;
   end;

  if DEMaxDepDate.text='' then
   begin
    ShowMessage('Заповніть поле Дата закінчення періода для підрозділів');
    Exit;
   end;

  if DEBegDateRec.text='' then
   begin
    ShowMessage('Заповніть поле Дата початку відліку');
    Exit;
   end;

  if BEGroupDogAdd.text='' then
   begin
    ShowMessage('Заповніть поле Група Договорів для додання');
    Exit;
   end;

  if BEGroupDogSelect.text='' then
   begin
    ShowMessage('Заповніть поле Група Договорів для вибору');
    Exit;
   end;

  if TEIDSystem.text='' then
   begin
    ShowMessage('Заповніть поле ID системи "Облік ТМЦ"');
    Exit;
   end;

  if BEKodStNDS.text='' then
   begin
    ShowMessage('Заповніть поле Код статті НДС');
    Exit;
   end;

 try
   dmMatas.MatasStoredProc.Transaction.StartTransaction;

   dmMatas.MatasStoredProc.StoredProcName:='MAT_INI_UPDATE_ALL';
   dmMatas.MatasStoredProc.Prepare;
   dmMatas.MatasStoredProc.ParamByName('Show_Exeption').Value:=BoolToInt(CBShowExep.Checked);
   dmMatas.MatasStoredProc.ParamByName('Date_Ost_Rec').Value:=DEDateOstRec.editvalue;
   dmMatas.MatasStoredProc.ParamByName('Max_Dep_Date').Value:=DEMaxDepDate.editvalue;
   dmMatas.MatasStoredProc.ParamByName('Mat_Id_System').Value:=TEIDSystem.Text;
   dmMatas.MatasStoredProc.ParamByName('Use_Default_Istfin').Value:=BoolToInt(CBDefaultIstfin.Checked);
   dmMatas.MatasStoredProc.ParamByName('Beg_Date_Rec').Value:=DEBegDateRec.editvalue;
   dmMatas.MatasStoredProc.ParamByName('Type_Sub_Sch').Value:=CBTypeSubSch.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Sch_In_Doc').Value:=BoolToInt(CBSchInDoc.Checked);
   dmMatas.MatasStoredProc.ParamByName('Sch_Prop_Iznos').Value:=BESchPropIznos.Text;
   dmMatas.MatasStoredProc.ParamByName('Sch_Prop_Mol').Value:=BESchPropMol.Text;
   dmMatas.MatasStoredProc.ParamByName('Sch_Prop_Sklad').Value:=BESchPropSklad.Text;
   dmMatas.MatasStoredProc.ParamByName('Sch_Prop_Os').Value:=BESchPropOs.Text;
   dmMatas.MatasStoredProc.ParamByName('Sch_Prop_Mna').Value:=BESchPropMna.Text;
   dmMatas.MatasStoredProc.ParamByName('Sch_Prop_Mat').Value:=BESchPropMAt.Text;
   dmMatas.MatasStoredProc.ParamByName('Group_Dog_Select').Value:=BEGroupDogSelect.Text;
   dmMatas.MatasStoredProc.ParamByName('Group_Dog_Add').Value:=BEGroupDogAdd.Text;
   dmMatas.MatasStoredProc.ParamByName('Kod_St_Nds').Value:=BEKodStNDS.Text;
   dmMatas.MatasStoredProc.ParamByName('Close_Mat_Sch').Value:=BoolToInt(CBCloseMatSch.Checked);
   dmMatas.MatasStoredProc.ParamByName('USE_SHORT_ORG_NAME').Value:=BoolToInt(use_short_org_name.Checked);
   dmMatas.MatasStoredProc.ParamByName('SHOW_OPER_FORM').Value:=BoolToInt(chk_oper_form.Checked);
   dmMatas.MatasStoredProc.ParamByName('Inv_Kart_Enabled').Value:=BoolToInt(CBInvKartEn.Checked);
   dmMatas.MatasStoredProc.ParamByName('Mna_Kart_Enabled').Value:=BoolToInt(CbMnaKartEn.Checked);
   dmMatas.MatasStoredProc.ParamByName('Type_Mat_Account').Value:=CBTypeMatAccount.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Get_Sch_Mode').Value:=CBGetSchMode.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Tools_Enabled').Value:=BoolToInt(CBToolsEn.Checked);
   dmMatas.MatasStoredProc.ParamByName('Clear_Istfin_By_Dog').Value:=BoolToInt(CBCleanIstfinByDog.Checked);
   dmMatas.MatasStoredProc.ParamByName('Sch_Prop_Inv_Acc').Value:=BESchPropInvAcc.Text;
   dmMatas.MatasStoredProc.ParamByName('Gen_Inum_Mode').Value:=CBGenInumMode.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Inv_Num_Format').Value:=CBInvNumFormat.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Nnum_Format').Value:=CBNnumFormat.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Fond_Os_Root_Id').Value:=sch_os;
   dmMatas.MatasStoredProc.ParamByName('Fond_Mbp_Root_Id').Value:=sch_mbp;
   dmMatas.MatasStoredProc.ParamByName('Fond_Mna_Root_Id').Value:=sch_mna;
   dmMatas.MatasStoredProc.ParamByName('Fond_Iznos_Root_Id').Value:=sch_iznos;
   dmMatas.MatasStoredProc.ParamByName('Mbook_Enabled').Value:=BoolToInt(MBookEn.Checked);
   dmMatas.MatasStoredProc.ParamByName('Get_Ost_Mode').Value:=CBGetOstMode.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Mol_Fio_Format').Value:=CBMolFormat.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Round_Iznos').Value:=BoolToInt(CBRoundIznos.Checked);
   dmMatas.MatasStoredProc.ParamByName('Link_To_Nds_Enabled').Value:=BoolToInt(CBLinkToNDSEn.Checked);
   dmMatas.MatasStoredProc.ParamByName('Auto_Set_Amort_Data').Value:=CBAvtoSetAmortData.ItemIndex;
   dmMatas.MatasStoredProc.ParamByName('Check_Negative_Ost').Value:=BoolToInt(CBNegativOst.Checked);
   if BEDefAmortDb.Text='' then dmMatas.MatasStoredProc.ParamByName('Def_Amort_Db_Id_Sch').Value:=0
   else dmMatas.MatasStoredProc.ParamByName('Def_Amort_Db_Id_Sch').Value:=sch_db;
   if BEDefAmortKr.Text='' then dmMatas.MatasStoredProc.ParamByName('Def_Amort_Kr_Id_Sch').Value:=0
   else dmMatas.MatasStoredProc.ParamByName('Def_Amort_Kr_Id_Sch').Value:=sch_kr;
   dmMatas.MatasStoredProc.ParamByName('Use_Fifo_On_Mat_Sch').Value:=BoolToInt(CBFIFOOnMatSch.Checked);
   dmMatas.MatasStoredProc.ParamByName('Doc_Reestr_Num_Len').Value:=TEDocLen.Text;
   dmMatas.MatasStoredProc.ExecProc;
   dmMatas.MatasStoredProc.Transaction.Commit;

  except on E : Exception
   do begin
    ShowMessage(E.Message);
    dmMatas.MatasStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
  ShowMessage('Зміни підтверджено!');
  Close;

end;

procedure TfrmSetup.acCancelExecute(Sender: TObject);
begin
Close;
end;

end.
