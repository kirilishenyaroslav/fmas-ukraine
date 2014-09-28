unit gr_IndexCount_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxSpinEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxTextEdit, cxButtonEdit,
  cxGroupBox, cxControls, cxContainer, cxEdit, cxCheckBox, ibase,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, ZProc,
  Unit_ZGlobal_Consts, DB, FIBDataSet, pFIBDataSet, gr_uMessage,
  gr_uCommonConsts, Dates, PackageLoad, ZTypes, uCommonSp, GlobalSpr,
  cxDBEdit, gr_uCommonProc, gr_uWaitForm, gr_uCommonLoader;

type
  TFIndexCount = class(TForm)
    CheckBoxVidOpl: TcxCheckBox;
    BoxVidOpl: TcxGroupBox;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    CheckBoxDepartment: TcxCheckBox;
    BoxDepartment: TcxGroupBox;
    EditDepartment: TcxButtonEdit;
    LabelDepartmentData: TcxLabel;
    DateEdit: TcxDateEdit;
    CheckBoxSmeta: TcxCheckBox;
    BoxSmeta: TcxGroupBox;
    EditSmeta: TcxButtonEdit;
    LabelSmetaData: TcxLabel;
    BoxKodSetup: TcxGroupBox;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    cxLabel1: TcxLabel;
    CheckBoxKatStud: TcxCheckBox;
    BoxCatStud: TcxGroupBox;
    ComboBoxCategory: TcxLookupComboBox;
    BtnOk: TcxButton;
    BtnCancel: TcxButton;
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    DSetCatStud: TpFIBDataSet;
    DSourceCatStud: TDataSource;
    ReadTransaction: TpFIBTransaction;
    cxLabel2: TcxLabel;
    MaskEditPercent: TcxMaskEdit;
    DSetPM: TpFIBDataSet;
    DSourcePM: TDataSource;
    MaskEditPM: TcxMaskEdit;
    Editkurs: TcxSpinEdit;
    CheckBoxKurs: TcxCheckBox;
    BoxProp: TcxGroupBox;
    CheckBoxProp: TcxCheckBox;
    PropEdit: TcxLookupComboBox;
    DSetProp: TpFIBDataSet;
    DSourceProp: TDataSource;
    CheckBoxIsDelete: TcxCheckBox;
    procedure CheckBoxVidOplClick(Sender: TObject);
    procedure CheckBoxDepartmentClick(Sender: TObject);
    procedure CheckBoxSmetaClick(Sender: TObject);
    procedure CheckBoxKatStudClick(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditDepartmentExit(Sender: TObject);
    procedure EditDepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaExit(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure YearSpinEditPropertiesChange(Sender: TObject);
    procedure CheckBoxPropClick(Sender: TObject);
    procedure CheckBoxKursClick(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PLanguageIndex:byte;
    PId_VidOpl:integer;
    PId_department:integer;
    PCode_department:variant;
    PId_smeta:integer;
    PNum_predpr:integer;
    PParam:TObject;
  public
    constructor Create(Param:Tobject);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TFIndexCount.Create(Param:TObject);       //  TgrIndexacParam
var CurrKodSetup:Integer;
begin
  inherited Create(TgrIndexacParam(Param).Owner);
  PParam:=Param;
  PDb_Handle:=TgrIndexacParam(Param).DB_Handle;
  PLanguageIndex:= IndexLanguage;
  PNum_predpr:=NumPredpr(PDb_Handle);
  ComboBoxCategory.Properties.DataController.DataSource:=DSourceCatStud;
//******************************************************************************
  Self.Caption                                := GrantIndexation_Text[PLanguageIndex];
  CheckBoxDepartment.Properties.Caption       := LabelDepartment_Caption[PLanguageIndex];
  CheckBoxVidOpl.Properties.Caption           := LabelVidOpl_Caption[PLanguageIndex];
  CheckBoxSmeta.Properties.Caption            := LabelSmeta_Caption[PLanguageIndex];
  CheckBoxKatStud.Properties.Caption          := LabelCategory_Caption[PLanguageIndex];
  MonthesList.Properties.Items.Text           := MonthesList_Text[PLanguageIndex];
  cxLabel1.Caption                            := LabelIndexMinim_Caption[PLanguageIndex];
  cxLabel2.Caption                            := LabelIndexPercent_Caption[PLanguageIndex];
  CheckBoxProp.Properties.Caption             := GridClPropertyName_Caption[PLanguageIndex];
  CheckBoxKurs.Properties.Caption             := LabelKurs_Caption[PLanguageIndex];
  BtnOk.Caption                               := YesBtn_Caption[PLanguageIndex];
  BtnCancel.Caption                           := CancelBtn_Caption[PLanguageIndex];

  try
    DB.Handle:=PDb_Handle;
  except
    on E:Exception do
    begin
      grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
    end;
  end;
//******************************************************************************
  StProc.Transaction:=StProcTransaction;
  StProc.Transaction.StartTransaction;
  StProc.StoredProcName:='Z_SETUP_S';
  StProc.Prepare;
  StProc.ExecProc;
  CurrKodSetup:=StProc.ParamByName('gr_kod_setup').AsInteger;
  StProc.Transaction.Commit;
 
  //CurrentKodSetup(PDb_Handle);
  YearSpinEdit.Value := YearMonthFromKodSetup(CurrKodSetup);
  MonthesList.ItemIndex := YearMonthFromKodSetup(CurrKodSetup,False)-1;
  DateEdit.EditValue:=ConvertKodToDate(CurrKodSetup+1)-1;
//  DateEdit.Properties.MinDate:=ConvertKodToDate();
//  DateEdit.Properties.MaxDate:=ConvertKodToDate(PParameter.Kod_Setup2+1)-1;
//******************************************************************************

  if((PNum_predpr=2)or(PNum_predpr=3)or(PNum_predpr=4)or(PNum_predpr=7)or(PNum_predpr=5))then
  begin
    cxLabel1.Visible:=false;
    MaskEditPM.Visible:=false;
    cxLabel2.Visible:=false;
    MaskEditPercent.Visible:=false;
    CheckBoxVidOpl.Visible:=false;
    BoxVidOpl.Visible:=false;
    CheckBoxDepartment.Visible:=false;
    BoxDepartment.Visible:=false;
    //CheckBoxSmeta.Visible:=false;
    //BoxSmeta.Visible:=false;
    CheckBoxKatStud.Visible:=false;
    CheckBoxKurs.Visible:=false;
    BoxCatStud.Visible:=false;
    CheckBoxProp.Visible:=false;
    BoxProp.Visible:=false;
    CheckBoxIsDelete.Visible:=true;
    CheckBoxSmeta.Top:=36;
    CheckBoxSmeta.Left:=-1;
    BoxSmeta.Top:=54;
    BoxSmeta.Left:=-2;
    BtnOk.Top:=95;

    BtnCancel.Top:=95;

    self.Height:=160;
  end else
  begin
    try
      DSetCatStud.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CN_STUD_CAT_S';
      DSetCatStud.Open;
      DSetPM.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_CONST_SUM(1,'+IntToStr(CurrKodSetup)+',''T'')';
      DSetPM.Open;
      DSetProp.SQLs.SelectSQL.Text       := 'SELECT * FROM Z_SP_PEOPLE_PROP_SEL(''T'')';
      DsetProp.Open;
      PropEdit.Properties.ListFieldNames := 'NAME_PEOPLE_PROP';
      PropEdit.Properties.KeyFieldNames  :='ID_PEOPLE_PROP';
      PropEdit.Properties.DataController.DataSource := DSourceProp;
    except
      on E:Exception do
      begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
      end;
    end;
    MaskEditPM.Text:=DSetPM['VALUE_SUM'];
  end;
end;

procedure TFIndexCount.CheckBoxVidOplClick(Sender: TObject);
begin
  EditVidOpl.Enabled:=not EditVidOpl.Enabled;
  LabelVidOplData.Enabled:=not LabelVidOplData.Enabled;
end;

procedure TFIndexCount.CheckBoxDepartmentClick(Sender: TObject);
begin
  EditDepartment.Enabled        :=not  EditDepartment.Enabled;
  LabelDepartmentData.Enabled   :=not  LabelDepartmentData.Enabled;
  DateEdit.Enabled              :=not  DateEdit.Enabled;
end;

procedure TFIndexCount.CheckBoxSmetaClick(Sender: TObject);
begin
  EditSmeta.Enabled:=not EditSmeta.Enabled;
  LabelSmetaData.Enabled:=not LabelSmetaData.Enabled;
end;

procedure TFIndexCount.CheckBoxKatStudClick(Sender: TObject);
begin
  ComboBoxCategory.Enabled:=not ComboBoxCategory.Enabled;
end;

procedure TFIndexCount.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
  if EditVidOpl.Text<>'' then
  begin
    VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,PDb_Handle,ValueFieldZSetup(PDb_Handle,'GR_ID_SYSTEM'),0);
    if VarArrayDimCount(VidOpl)>0 then
    begin
      PId_VidOpl:=VidOpl[0];
      LabelVidOplData.Caption := VidOpl[2];
    end
    else
      EditVidOpl.SetFocus;
  end;
end;

procedure TFIndexCount.EditVidOplPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
  VidOPl:=LoadVidOpl(self,
                     PDb_Handle,zfsModal,
                     0,
                     ValueFieldZSetup(PDb_Handle,'GR_ID_SYSTEM'));
  if VarArrayDimCount(VidOpl)>0 then
  begin
    PId_VidOpl:=VidOpl[0];
    LabelVidOplData.Caption := VidOpl[1];
    EditVidOpl.Text := VarToStrDef(VidOpl[2],'');
  end
  else
    EditVidOpl.SetFocus;
end;

procedure TFIndexCount.EditDepartmentExit(Sender: TObject);
var Department:Variant;
begin
  if EditDepartment.Text<>PCode_department then
  begin
    Department:=DepartmentByKod(EditDepartment.Text,PDb_Handle);
    if VarArrayDimCount(Department)>0 then
    begin
      PId_department:=Department[0];
      LabelDepartmentData.Caption := Department[2];
    end
    else
      EditDepartment.SetFocus;
  end;
end;

procedure TFIndexCount.EditDepartmentPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var sp: TSprav;
begin
  sp := GetSprav('SpDepartment');
  if sp <> nil then
  begin
        // заполнить входные параметры
    with sp.Input do
    begin
      Append;
      FieldValues['DBHandle'] := Integer(PDb_Handle);
      FieldValues['ShowStyle'] := 0;
      FieldValues['Select'] := 1;
      FieldValues['Actual_Date'] := DateEdit.EditValue;
      Post;
    end;
  end;
  sp.Show;
  if sp.Output = nil then
    ShowMessage('BUG: Output is NIL!!!')
  else
    if not sp.Output.IsEmpty then
    begin
      EditDepartment.Text := varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
      LabelDepartmentData.Caption := varToStrDef(sp.Output['NAME_FULL'],'');
      PId_department := sp.Output['ID_DEPARTMENT'];
      PCode_department := EditDepartment.Text;
    end;
  sp.Free;
end;

procedure TFIndexCount.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
  Smeta:=GetSmets(self,PDB_Handle,Date,psmSmet);
  if VarArrayDimCount(Smeta)> 0 then
  if Smeta[0]<>NULL then
  begin
    PId_smeta := Smeta[0];
    EditSmeta.Text := VarToStrDef(Smeta[3],'');
    LabelSmetaData.Caption := Smeta[2];
  end;
end;

procedure TFIndexCount.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
  if EditSmeta.Text<>'' then
  begin
    Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),PDb_Handle);
    if VarArrayDimCount(Smeta)>0 then
    begin
      PId_smeta:=Smeta[0];
      LabelSmetaData.Caption := Smeta[2];
    end
    else
      EditSmeta.SetFocus;
  end;
end;

procedure TFIndexCount.BtnCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFIndexCount.BtnOkClick(Sender: TObject);
var PKod_setup:integer;
    wf:TForm;
begin
  PKod_Setup:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
  if((PNum_predpr=2)or(PNum_predpr=3)or(PNum_predpr=4)or(PNum_predpr=7) or (PNum_predpr=5))then
  begin
    wf:=gr_uWaitForm.ShowWaitForm(self,wfSelectData);
    try
      StProc.StoredProcName:='GR_COUNT_INDEX_FULL';
      StProc.Transaction.StartTransaction;
      StProc.Prepare;
      StProc.ParamByName('KOD_SETUP').AsInteger       :=PKod_setup;
      StProc.ParamByName('IS_FLAG').AsString          :=CheckBoxIsDelete.EditValue;
      if(CheckBoxSmeta.Checked=true)then
        StProc.ParamByName('IN_ID_SMETA').AsInteger      :=PId_smeta;
      if(TgrIndexacParam(PParam).id_man <> null)then
        StProc.ParamByName('id_man_IN').AsInteger      :=TgrIndexacParam(PParam).id_man
      else  StProc.ParamByName('id_man_IN').AsInteger  :=-1;
      StProc.ExecProc;
      StProc.Transaction.Commit;
    except
      on E:Exception do
      begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
      end;
    end;
    CloseWaitForm(wf);
  end else
  begin
    try
      StProc.StoredProcName:='GR_COUNT_INDEX';
      StProc.Transaction.StartTransaction;
      StProc.Prepare;
      StProc.ParamByName('KOD_SETUP').AsInteger       :=PKod_setup;

      StProc.ParamByName('PERCENT').AsCurrency        :=StrToFloat(MaskEditPercent.Text);
      StProc.ParamByName('SUMMA_PM').AsCurrency       :=StrToFloat(MaskEditPM.Text);
      if(CheckBoxVidOpl.Checked=true)then
        StProc.ParamByName('ID_VIDOPL').AsInteger     :=PId_VidOpl;
      if(CheckBoxDepartment.Checked=true)then
        StProc.ParamByName('ID_DEPARTMENT').AsInteger :=PId_department;
      if(CheckBoxSmeta.Checked=true)then
        StProc.ParamByName('ID_SMETA').AsInteger      :=PId_smeta;
      if(CheckBoxKatStud.Checked=true)then
        StProc.ParamByName('ID_KAT_STUD').AsInteger   :=ComboBoxCategory.EditValue;
      if(CheckBoxKurs.Checked=true)then
        StProc.ParamByName('KURS').AsInteger   :=EditKurs.Value;

      if(CheckBoxProp.Checked=true)then
      begin
        DSetProp.Locate('NAME_PEOPLE_PROP',PropEdit.text,[] );
        StProc.ParamByName('ID_PEOPLE_PROP').AsInteger   :=DSetProp['ID_PEOPLE_PROP'];
      end;
      StProc.ExecProc;
      StProc.Transaction.Commit;
    except
      on E:Exception do
      begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
      end;
    end;
  end;
  if (TgrIndexacParam(PParam).id_man = null) then
  grShowMessage('Завершення','Операцію було завершено!',mtInformation,[mbOk]);
  ModalResult:=mrYes
end;

procedure TFIndexCount.YearSpinEditPropertiesChange(Sender: TObject);
var PKod_Setup:Integer;
begin
  PKod_Setup:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
  if DSetPM.Active=true then
  begin
    DSetPM.Close;
    DSetPM.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_CONST_SUM(1,'+IntToStr(PKod_Setup)+',''T'')';
    DSetPM.Open;
    MaskEditPM.Text:=DSetPM['VALUE_SUM'];
  end;
end;


procedure TFIndexCount.CheckBoxPropClick(Sender: TObject);
begin
PropEdit.Enabled:=not PropEdit.Enabled;
end;

procedure TFIndexCount.CheckBoxKursClick(Sender: TObject);
begin
 Editkurs.Enabled:=not Editkurs.Enabled;
end;

end.

