unit gr_Filter_Stud_Group;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxButtonEdit, cxCheckBox, cxSpinEdit,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls,
  cxGroupBox, ActnList, StdCtrls, cxButtons, ExtCtrls,gr_uCommonConsts,
  cxLabel,gr_uCommonProc, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,Dates,gr_uMessage,IBase,
  uCommonSp,gr_uCommonLoader,gr_uCommonTypes,GrAccDepart_GG, cxCurrencyEdit;

type
  TFFilter = class(TForm)
    Panel1: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    Actions: TActionList;
    ActionYes: TAction;
    GroupBoxPeriod: TcxGroupBox;
    GroupBoxContractButget: TcxGroupBox;
    GroupBoxDep: TcxGroupBox;
    EditMonth: TcxComboBox;
    EditYear: TcxSpinEdit;
    CheckBoxContrakt: TcxCheckBox;
    CheckBoxButget: TcxCheckBox;
    EditDep: TcxButtonEdit;
    GroupBoxProp: TcxGroupBox;
    GroupBoxFiz: TcxGroupBox;
    CheckBoxProp: TcxCheckBox;
    CheckBoxFiz: TcxCheckBox;
    Transaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    DSourceProp: TDataSource;
    DSetProp: TpFIBDataSet;
    EditProp: TcxLookupComboBox;
    ActionCancel: TAction;
    cxGroupBox1: TcxGroupBox;
    CheckBoxCat: TcxCheckBox;
    CheckBoxDep: TcxCheckBox;
    CheckBoxPeriod: TcxCheckBox;
    EditCat: TcxLookupComboBox;
    DSetCat: TpFIBDataSet;
    DSourceCat: TDataSource;
    EditMan: TcxButtonEdit;
    EditManFio: TcxLabel;
    Action1: TAction;
    cxGroupBox2: TcxGroupBox;
    cxCheckBoxSB: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCurrencyEditOt: TcxCurrencyEdit;
    cxCurrencyEditDo: TcxCurrencyEdit;
    procedure CheckBoxDepPropertiesChange(Sender: TObject);
    procedure CheckBoxPropPropertiesChange(Sender: TObject);
    procedure CheckBoxFizPropertiesChange(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditDepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxButgetPropertiesChange(Sender: TObject);
    procedure CheckBoxContraktPropertiesChange(Sender: TObject);
    procedure CheckBoxPeriodPropertiesChange(Sender: TObject);
    procedure CheckBoxCatPropertiesChange(Sender: TObject);
    procedure EditManPropertiesEditValueChanged(Sender: TObject);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure cxCheckBoxSBPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FParam:TParamFilter;
    PLanguageIndex:byte;
    ViewForm:TFGrAccDep;
    constructor create(Param: TParamFilter);reintroduce;
  end;
function View_FormFilter(Param: TParamFilter):Boolean;



implementation



{$R *.dfm}
function View_FormFilter(  Param: TParamFilter):Boolean ;
var Form:TFFilter;
begin
Form:=TFFilter.create(Param);
if Form.ShowModal=mrYes then
begin
  Param:=Form.FParam;
  Result:=True;
end
  else Result:=False;
Form.Destroy;
end;

constructor TFFilter.create(Param: TParamFilter);
begin

  inherited create(Param.AOwner);
  FParam          :=TParamFilter.Create;
  Fparam          :=Param;
  DB.Handle       :=Param.Db_Handle;
  PLanguageIndex  :=IndexLanguage ;
  //****************************************************************************
  Caption                                         := DataStud_Caption[PLanguageIndex]+' ['+
                                                     Filter_Text[PLanguageIndex]+']';
  EditMonth.Properties.Items.Text                 := MonthesList_Text[PLanguageIndex];
  CheckBoxDep.Properties.Caption                  := Group_Caption[PLanguageIndex];
  CheckBoxProp.Properties.Caption                 := GridClPropertyName_Caption[PLanguageIndex];
  CheckBoxFiz.Properties.Caption                  := Man_Caption[PLanguageIndex];
  ButtonYes.Caption                               := YesBtn_Caption[PLanguageIndex];
  ButtonCancel.Caption                            := CancelBtn_Caption[PLanguageIndex];
  CheckBoxContrakt.Properties.Caption             :=LabelContracts_Caption[PLanguageIndex];
  CheckBoxButget.Properties.Caption               :=LabelButgets_Caption[PLanguageIndex];
  CheckBoxPeriod.Properties.Caption               :=GridClKodSetup_Caption[PLanguageIndex];
  CheckBoxCat.Properties.Caption                  :=LabelCategory_Caption[PLanguageIndex];
  cxCheckBoxSB.Properties.Caption                 :=GridClBal_Caption[PLanguageIndex];
  //****************************************************************************
  if  DsetProp.Active then DsetProp.Close;
  DSetProp.SQLs.SelectSQL.Text       := 'SELECT * FROM Z_SP_PEOPLE_PROP_SEL(''T'')';
  DSetCat.SQLs.SelectSQL.Text        := 'SELECT * FROM GR_CN_STUD_CAT_S';
  EditProp.Properties.ListFieldNames := 'NAME_PEOPLE_PROP';
  EditProp.Properties.KeyFieldNames  :='ID_PEOPLE_PROP';
  EditCat.Properties.ListFieldNames  :='NAME_FULL';
  EditCat.Properties.KeyFieldNames   :='ID_CAT_STUD';
  DsetProp.Open;
  DsetCat.Open;
  EditProp.Properties.DataController.DataSource := DSourceProp;
  EditCat.Properties.DataController.DataSource := DSourceCat;
  //****************************************************************************

  if Param.KodSetup<>null then
    CheckBoxPeriod.Checked:=true
  else
    CheckBoxPeriod.Checked:=false;
  EditMonth.ItemIndex := Param.Month-1;
  EditYear.Value      :=Param.Year;
  if Param.Butget='T' then
    CheckBoxButget.Checked:=true
  else  CheckBoxButget.Checked:=False;
  if Param.Contract='T' then
    CheckBoxContrakt.Checked:=true
  else  CheckBoxContrakt.Checked:=False;
  if Param.id_dep<>null then
    CheckBoxDep.Checked:=True;
  if Param.id_prop<>null then
    CheckBoxProp.Checked:=True;
  if Param.id_cat<>null then
    CheckBoxCat.Checked:=True;
  if Param.id_man<>null then
    CheckBoxFiz.Checked:=True;
  if (Param.Bal_B<>'') or (Param.Bal_E<>'') then
    cxCheckBoxSB.Checked:=True;
  EditDep.text:=FParam.DepCaption;
  EditMan.Text:=FParam.Tn;
  EditManFio.Caption:=FParam.ManCaption;
  EditProp.EditValue:=FParam.id_prop;
  EditCat.EditValue:=FParam.id_cat;
  //cxCurrencyEditOt.Value:=StrToFloat(FParam.Bal_B);
  //cxCurrencyEditDo.Value:=StrToFloat(FParam.Bal_E);
  //****************************************************************************
end;

procedure TFFilter.CheckBoxDepPropertiesChange(Sender: TObject);
begin
  EditDep.Enabled         :=not   EditDep.Enabled;
end;

procedure TFFilter.CheckBoxPropPropertiesChange(Sender: TObject);
begin
  EditProp.Enabled:= not EditProp.Enabled
end;

procedure TFFilter.CheckBoxFizPropertiesChange(Sender: TObject);
begin
  EditMan.Enabled    :=not EditMan.Enabled;
  EditManFio.Enabled :=not EditManFio.Enabled;
end;

procedure TFFilter.ActionYesExecute(Sender: TObject);
begin
  if not(CheckBoxPeriod.Checked) then
    FParam.KodSetup:=null
  else
  begin
    FParam.Month:=EditMonth.ItemIndex+1;
    FParam.Year:=EditYear.Value;
    FParam.KodSetup:=PeriodToKodSetup(FParam.Year,FParam.Month);
  end;

  if CheckBoxButget.Checked then
    FParam.Butget:='T'
  else
    FParam.Butget:='F';

  if CheckBoxContrakt.Checked then
    FParam.Contract:='T'
  else
    FParam.Contract:='F';

  if not(CheckBoxDep.Checked) then
    FParam.id_dep:=null;

  if not(CheckBoxProp.Checked) then
    FParam.id_prop:=null
  else
  begin
    FParam.id_prop:=EditProp.EditValue;
    FParam.PropCaption:=EditProp.text;
  end;

  if not(CheckBoxCat.Checked) then
    FParam.id_cat:=null
  else
  begin
    FParam.id_cat:=EditCat.EditValue;
    FParam.CatCaption:=EditCat.text;
  end;

  if not(CheckBoxFiz.Checked) then
    FParam.id_man:=null;

  if not(cxCheckBoxSB.Checked) then
    begin
    FParam.Bal_B:='';
    FParam.Bal_E:='';
    end
  else
    begin
    if cxCurrencyEditOt.Value=0 then FParam.Bal_B:=''
    else  FParam.Bal_B:=FloatToStr(cxCurrencyEditOt.Value);
    if cxCurrencyEditDo.Value=0 then FParam.Bal_E:=''
    else FParam.Bal_E:=FloatToStr(cxCurrencyEditDo.Value);
    end;
  ModalResult:=mrYes;
end;

procedure TFFilter.EditDepPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var select :variant;
begin
 if ViewForm=nil then ViewForm:=TfGrAccDep.Create(self,DB.Handle);
 ViewForm.NKodSetup:= PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1);
 if ViewForm.ShowModal=mrYes then Select:=ViewForm.Result
                             else Select:=NULL;
 if select<>Null then
   begin
     EditDep.Text          :=ViewForm.ResultNameDep;
     FParam.id_dep         :=Select[0]  ;
     FParam.depCaption     := EditDep.Text ;
   end;
end;




procedure TFFilter.CheckBoxButgetPropertiesChange(Sender: TObject);
begin
  if not((CheckBoxButget.Checked) or(CheckBoxContrakt.Checked)) then
  begin
    grShowMessage(ECaption[PLanguageIndex],EVidTraining_Text[PLanguageIndex],mtError,[mbOK]);
    CheckBoxButget.Checked:=true;
  end;
end;

procedure TFFilter.CheckBoxContraktPropertiesChange(Sender: TObject);
begin
if not((CheckBoxButget.Checked) or(CheckBoxContrakt.Checked)) then
  begin
    grShowMessage(ECaption[PLanguageIndex],EVidTraining_Text[PLanguageIndex],mtError,[mbOK]);
    CheckBoxContrakt.Checked:=true;
  end;
end;

procedure TFFilter.CheckBoxPeriodPropertiesChange(Sender: TObject);
begin
  EditYear.Enabled         :=not   EditYear.Enabled;
  EditMonth.Enabled        :=not   EditMonth.Enabled;
end;

procedure TFFilter.CheckBoxCatPropertiesChange(Sender: TObject);
begin
  EditCat.Enabled         :=not   EditCat.Enabled;
end;

procedure TFFilter.EditManPropertiesEditValueChanged(Sender: TObject);
var man:Variant;
begin
if EditMan.Text<>'' then
 begin
  if StrToInt(EditMan.Text)=FParam.Tn then Exit;
  man:=grManByShifr(StrToInt(EditMan.Text),DB.Handle);
  if VarArrayDimCount(man)>0 then
   begin
    FParam.Id_man:=man[0];
    FParam.Tn:=man[1];
    FParam.ManCaption:=man[2];
    EditManFio.Caption := FParam.ManCaption;
   end
  else
   EditMan.SetFocus;
 end;
end;

procedure TFFilter.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var man:Variant;
    AParameter: TgrSimpleParam;
begin
  AParameter:=TgrSimpleParam.Create;
  AParameter.Owner:=Self;
  AParameter.DB_Handle:=DB.Handle;
  man:=DoFunctionFromPackage(AParameter,Stud_StudentCards);
  if VarArrayDimCount(man)> 0 then
    if man[0]<>NULL then
    begin
      FParam.Id_man:=man[0];
      FParam.Tn:=grifThen(VarIsNull(Man[1]),0,Man[1]);
      FParam.ManCaption:=man[2];
      EditManFio.Caption := FParam.ManCaption;
      EditMan.Text := IntToStr(FParam.Tn);
    end;
end;

procedure TFFilter.Action1Execute(Sender: TObject);
begin

  if  ButtonCancel.Focused=True then ModalResult:=mrCancel;
  if  ButtonYes.Focused=true then  ActionYesExecute(Sender);
  if  cxCurrencyEditDo.Focused then ButtonYes.SetFocus;
  if  cxCurrencyEditOt.Focused then cxCurrencyEditDo.SetFocus;
  if  cxCheckBoxSB.Focused then ButtonYes.SetFocus;
  if  (EditCat.Focused=True) and (cxCurrencyEditOt.Enabled=True)  then  cxCurrencyEditOt.SetFocus
  else if (EditCat.Focused=True) then cxCheckBoxSB.SetFocus;
  if  (CheckBoxCat.Focused=true) and (EditCat.Enabled=True) then EditCat.SetFocus
  else if CheckBoxCat.Focused=true then cxCheckBoxSB.SetFocus;
  if  (CheckBoxCat.Focused=True) and (EditCat.Enabled=true) then EditCat.SetFocus
  else if CheckBoxCat.Focused=True  then   ButtonYes.SetFocus;
  if  EditMan.Focused=true then CheckBoxCat.SetFocus;
  if  (CheckBoxFiz.Focused=True) and  (EditMan.Enabled=true) then  EditMan.SetFocus
  else if  CheckBoxFiz.Focused=True then  CheckBoxCat.SetFocus;
  if  EditProp.Focused=true then  CheckBoxFiz.SetFocus;
  if  (CheckBoxProp.Focused=true) and (EditProp.Enabled=true) then   EditProp.SetFocus
  else if  CheckBoxProp.Focused=true then CheckBoxFiz.SetFocus;
  if  EditDep.Focused=true  then  CheckBoxProp.SetFocus;
  if  (CheckBoxDep.Focused=True) and (EditDep.Enabled=True)  then EditDep.SetFocus
  else if CheckBoxDep.Focused=True then CheckBoxProp.SetFocus;
  if  CheckBoxButget.Focused=true then CheckBoxDep.SetFocus;
  if  CheckBoxContrakt.Focused=true then CheckBoxButget.SetFocus;
  if  EditMonth.Focused=true then  CheckBoxContrakt.SetFocus;
  if  EditYear.Focused=true then  EditMonth.SetFocus;
  if  (CheckBoxPeriod.Focused=True) and (EditYear.enabled=True) then EditYear.SetFocus
  else  if CheckBoxPeriod.Focused=True  then  CheckBoxContrakt.SetFocus;
  
{  if  ButtonCancel.Focused=True then ModalResult:=mrCancel;
  if  ButtonYes.Focused=true then  ActionYesExecute(Sender);
  if  EditCat.Focused=True  then ButtonYes.SetFocus;
  if  (CheckBoxCat.Focused=True) and (EditCat.Enabled=true) then EditCat.SetFocus
  else if CheckBoxCat.Focused=True  then   ButtonYes.SetFocus;
  if  EditMan.Focused=true then CheckBoxCat.SetFocus;
  if  (CheckBoxFiz.Focused=True) and  (EditMan.Enabled=true) then  EditMan.SetFocus
  else if  CheckBoxFiz.Focused=True then  CheckBoxCat.SetFocus;
  if  EditProp.Focused=true then  CheckBoxFiz.SetFocus;
  if  (CheckBoxProp.Focused=true) and (EditProp.Enabled=true) then   EditProp.SetFocus
  else if  CheckBoxProp.Focused=true then CheckBoxFiz.SetFocus;
  if  EditDep.Focused=true  then  CheckBoxProp.SetFocus;
  if  (CheckBoxDep.Focused=True) and (EditDep.Enabled=True)  then EditDep.SetFocus
  else if CheckBoxDep.Focused=True then CheckBoxProp.SetFocus;
  if  CheckBoxButget.Focused=true then CheckBoxDep.SetFocus;
  if  CheckBoxContrakt.Focused=true then CheckBoxButget.SetFocus;
  if  EditMonth.Focused=true then  CheckBoxContrakt.SetFocus;
  if  EditYear.Focused=true then  EditMonth.SetFocus;
  if  (CheckBoxPeriod.Focused=True) and (EditYear.enabled=True) then EditYear.SetFocus
  else  if CheckBoxPeriod.Focused=True  then  CheckBoxContrakt.SetFocus;}
end;

procedure TFFilter.cxCheckBoxSBPropertiesChange(Sender: TObject);
begin
  cxCurrencyEditOt.Enabled         :=not   cxCurrencyEditOt.Enabled;
  cxCurrencyEditDo.Enabled         :=not   cxCurrencyEditDo.Enabled;
end;

end.
