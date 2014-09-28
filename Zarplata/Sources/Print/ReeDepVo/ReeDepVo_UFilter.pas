unit ReeDepVo_UFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxGroupBox, cxSpinEdit, cxDropDownEdit, GlobalSpr,
  IBase, PackageLoad, ZTypes,  FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, ZMessages, Unit_ZGlobal_Consts, ZProc, cxLabel, Unit_NumericConsts,
  ActnList, ExtCtrls, ReeDepVo_UDMPrint, Dates, uCommonSp, cxCalendar,
  cxRadioGroup, cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfzReeDepVOFilter = class(TForm)
    BoxSmeta: TcxGroupBox;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    CheckBoxDepartment: TcxCheckBox;
    BoxDepartment: TcxGroupBox;
    CheckBoxSmeta: TcxCheckBox;
    CheckBoxVidOpl: TcxCheckBox;
    BoxVidOpl: TcxGroupBox;
    LabelVidOplData: TcxLabel;
    LabelDepartmentData: TcxLabel;
    LabelSmetaData: TcxLabel;
    ActionList: TActionList;
    Action1: TAction;
    Bevel: TBevel;
    BoxKodSetup: TcxGroupBox;
    MonthesList1: TcxComboBox;
    YearSpinEdit1: TcxSpinEdit;
    MonthesList2: TcxComboBox;
    YearSpinEdit2: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxRadioGroup1: TcxRadioGroup;
    RadioBtnNar: TcxRadioButton;
    RadioBtnVed: TcxRadioButton;
    CheckBoxSumma: TcxCheckBox;
    EditDepartment: TcxButtonEdit;
    EditVidOpl: TcxButtonEdit;
    EditSmeta: TcxButtonEdit;
    Action2: TAction;
    CheckBoxVOPrint: TcxCheckBox;
    cxGroupBox3: TcxGroupBox;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    EditCat: TcxLookupComboBox;
    CheckBoxCat: TcxCheckBox;
    CheckBoxCatPrint: TcxCheckBox;
    DSetCat: TpFIBDataSet;
    DSourceCat: TDataSource;
    Transaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    cxGroupBox1: TcxGroupBox;
    EditProp: TcxLookupComboBox;
    CheckBoxProp: TcxCheckBox;
    DSourceProp: TDataSource;
    DSetProp: TpFIBDataSet;
    DateEdit: TcxDateEdit;
    procedure CheckBoxKodSetupClick(Sender: TObject);
    procedure CheckBoxDepartmentClick(Sender: TObject);
    procedure CheckBoxSmetaClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelBtnClick(Sender: TObject);
    procedure CheckBoxVidOplClick(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditDepartmentExit(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure MonthesListPropertiesChange(Sender: TObject);
    procedure CheckBoxSummaClick(Sender: TObject);
    procedure CheckBoxSummaPropertiesChange(Sender: TObject);
    procedure cxMaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxMaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure Action2Execute(Sender: TObject);
    procedure CheckBoxVOPrintClick(Sender: TObject);
    procedure CheckBoxCatPrintClick(Sender: TObject);
    procedure CheckBoxCatClick(Sender: TObject);
    procedure EditCatPropertiesChange(Sender: TObject);
    procedure ComboBoxPropPropertiesChange(Sender: TObject);
    procedure CheckBoxPropClick(Sender: TObject);
  private
    PDb_Handle:TISC_DB_HANDLE;
    PLanguageIndex:byte;
    PParameter:TzReeDepVOFilter;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;System:boolean);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfzReeDepVOFilter.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;System:boolean);
var CurrKodSetup:Integer;
begin
 inherited Create(AOwner);
 DB.Handle:=ADB_Handle;
 Transaction.StartTransaction;
 PDb_Handle:=ADB_Handle;
 PLanguageIndex:=LanguageIndex;
 PParameter.PSystem:=System;
//******************************************************************************
 Caption                                     := FilterBtn_Caption[PLanguageIndex];
 CheckBoxDepartment.Properties.Caption       := LabelDepartment_Caption[PLanguageIndex];
 CheckBoxVidOpl.Properties.Caption           := LabelVidOpl_Caption[PLanguageIndex];
 CheckBoxSmeta.Properties.Caption            := LabelSmeta_Caption[PLanguageIndex];
 YesBtn.Caption                              := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption                           := CancelBtn_Caption[PLanguageIndex];
 YesBtn.Hint                                 := YesBtn.Caption;
 CancelBtn.Hint                              := CancelBtn.Caption+' (Esc)';
 MonthesList1.Properties.Items.Text          := MonthesList_Text[PLanguageIndex];
 MonthesList2.Properties.Items.Text          := MonthesList_Text[PLanguageIndex];
//******************************************************************************
 CurrKodSetup:=CurrentKodSetup(PDb_Handle);
 YearSpinEdit1.Value := YearMonthFromKodSetup(CurrKodSetup);
 MonthesList1.ItemIndex := YearMonthFromKodSetup(CurrKodSetup,False)-1;
 YearSpinEdit2.Value := YearMonthFromKodSetup(CurrKodSetup);
 MonthesList2.ItemIndex := YearMonthFromKodSetup(CurrKodSetup,False)-1;
 DateEdit.EditValue:=ConvertKodToDate(PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1)+1)-1;
 //DateEdit.Properties.MinDate:=ConvertKodToDate(PParameter.Kod_Setup1);   нахрен это было?
 //DateEdit.Properties.MaxDate:=ConvertKodToDate(PParameter.Kod_Setup2+1)-1;


 CheckBoxCat.Visible:=False;
 CheckBoxCatPrint.Visible:=False;
 cxGroupBox4.Visible:=False;
 EditCat.Visible:=False;
 PParameter.Is_Cat :=False; // в ЗП не нужно

 DSetProp.Close;

 DSetProp.SQLs.SelectSQL.Text        := ' SELECT * FROM z_sp_people_prop ' + IfThen(System,'where is_grant =''F''','where is_grant =''T''');


 EditProp.Properties.ListFieldNames  :='name_people_prop';
 EditProp.Properties.KeyFieldNames   :='id_people_prop';

 DSetProp.Open;
 DSetProp.First;

 EditProp.Properties.DataController.DataSource := DSourceProp;

 if not System then
 begin
   CheckBoxCat.Visible:=True;
   CheckBoxCatPrint.Visible:=False; //Пока не нужно!
   cxGroupBox4.Visible:=True;
   EditCat.Visible:=True;
   PParameter.Is_Cat:=True;

   PParameter.Is_CatPrint:=True;

   DsetCat.Close;
   //DSetProp.SQLs.SelectSQL.Text       := 'SELECT * FROM Z_SP_PEOPLE_PROP_SEL(''T'')';
   DSetCat.SQLs.SelectSQL.Text        := 'SELECT * FROM GR_CN_STUD_CAT_S';
   //EditProp.Properties.ListFieldNames := 'NAME_PEOPLE_PROP';
   //EditProp.Properties.KeyFieldNames  :='ID_PEOPLE_PROP';
   EditCat.Properties.ListFieldNames  :='NAME_FULL';
   EditCat.Properties.KeyFieldNames   :='ID_CAT_STUD';
   //DsetProp.Open;
   DsetCat.Open;
   DsetCat.First;
   //EditProp.Properties.DataController.DataSource := DSourceProp;
   EditCat.Properties.DataController.DataSource := DSourceCat;




 end

end;

procedure TfzReeDepVOFilter.CheckBoxKodSetupClick(Sender: TObject);
begin
  BoxKodSetup.Enabled := not BoxKodSetup.Enabled;
end;

procedure TfzReeDepVOFilter.CheckBoxDepartmentClick(Sender: TObject);
begin
  EditDepartment.Enabled:=CheckBoxDepartment.Checked;
  DateEdit.Enabled:=CheckBoxDepartment.Checked;
//BoxDepartment.Enabled := not BoxDepartment.Enabled;
end;

procedure TfzReeDepVOFilter.CheckBoxSmetaClick(Sender: TObject);
begin
//BoxSmeta.Enabled := not BoxSmeta.Enabled;
  EditSmeta.Enabled:=CheckBoxSmeta.Checked;
  EditSmeta.Properties.ReadOnly:=CheckBoxSmeta.Checked;
  EditSmeta.Properties.ReadOnly:=False;
end;

procedure TfzReeDepVOFilter.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
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
        PParameter.Id_department := sp.Output['ID_DEPARTMENT'];
        PParameter.Code_department := varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
        PParameter.Title_department := varToStrDef(sp.Output['NAME_FULL'],'');
        PParameter.IsDepSprav := True;
       end;
    sp.Free;
end;

procedure TfzReeDepVOFilter.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,PDB_Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   PParameter.Id_smeta := Smeta[0];
   EditSmeta.Text := VarToStrDef(Smeta[3],'');
   LabelSmetaData.Caption := VarToStrDef(Smeta[2],'');
  end;
end;

procedure TfzReeDepVOFilter.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfzReeDepVOFilter.CheckBoxVidOplClick(Sender: TObject);
begin
//BoxVidOpl.Enabled := CheckBoxVidOpl.Checked;
  EditVidOpl.Enabled:=CheckBoxVidOpl.Checked;
  BoxVidOpl.Enabled:=CheckBoxVidOpl.Checked;
end;

procedure TfzReeDepVOFilter.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>PParameter.Code_VidOpl then
 begin
  if(PParameter.PSystem=true)then
    VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,PDb_Handle,ValueFieldZSetup(PDb_Handle,'Z_ID_SYSTEM'),0)
  else
    VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,PDb_Handle,ValueFieldZSetup(PDb_Handle,'GR_ID_SYSTEM'),0);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PParameter.Id_VidOpl:=VidOpl[0];
    PParameter.Title_VidOpl:=VidOpl[2];
    PParameter.Code_VidOpl:=VidOpl[1];
    LabelVidOplData.Caption := VidOpl[2];
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TfzReeDepVOFilter.EditVidOplPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
if(PParameter.PSystem=true)then
VidOPl:=LoadVidOpl(self,
                   PDb_Handle,zfsModal,
                   0,
                   ValueFieldZSetup(PDb_Handle,'Z_ID_SYSTEM'))
else
VidOPl:=LoadVidOpl(self,
                   PDb_Handle,zfsModal,
                   0,
                   ValueFieldZSetup(PDb_Handle,'GR_ID_SYSTEM'));
 if VarArrayDimCount(VidOpl)>0 then
  begin
   PParameter.Id_VidOpl:=VidOpl[0];
   PParameter.Code_VidOpl:=VidOPl[2];
   PParameter.Title_VidOpl:=VidOpl[1];
   LabelVidOplData.Caption := VidOpl[1];
   EditVidOpl.Text := VarToStrDef(VidOpl[2],'');
  end
 else
  EditVidOpl.SetFocus;
end;

procedure TfzReeDepVOFilter.EditDepartmentExit(Sender: TObject);
var Department:Variant;
begin
if EditDepartment.Text<>PParameter.Code_department then
 begin
  Department:=DepartmentByKod(EditDepartment.Text,PDb_Handle);
  if VarArrayDimCount(Department)>0 then
   begin
    PParameter.Id_department:=Department[0];
    PParameter.Code_department:= Department[1];
    PParameter.Title_department:=  Department[2];
    LabelDepartmentData.Caption := Department[2];
   end
  else
   EditDepartment.SetFocus;
 end;
end;


procedure TfzReeDepVOFilter.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
if EditSmeta.Text<>PParameter.Code_Smet then
 begin
  Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),PDb_Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PParameter.Id_smeta:=Smeta[0];
    LabelSmetaData.Caption := Smeta[2];
    PParameter.Code_Smet:=Smeta[1];
   end
  else
   EditSmeta.SetFocus;
 end;
end;

procedure TfzReeDepVOFilter.Action1Execute(Sender: TObject);
var PrintDM:TDM;
begin

if RadioBtnNar.Checked  then PParameter.P1:=True// ShowMessage('RadioBtnNar.Checked')//
else PParameter.P1:=False; //ShowMessage('RadioBtnNar.NOOOO_Checked');

PParameter.Kod_Setup1:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
PParameter.Kod_Setup2:=PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);

if PParameter.Id_smeta=0      then CheckBoxSmeta.Checked:=False;
if PParameter.Id_department=0 then CheckBoxDepartment.Checked:=False;
if PParameter.Id_VidOpl=0     then CheckBoxVidOpl.Checked:=False;
if PParameter.ID_Cat=0        then CheckBoxCat.Checked:=False;
if PParameter.id_prop=0       then CheckBoxProp.Checked:=False;

//DSetProp

PParameter.Is_Department := CheckBoxDepartment.Checked;
PParameter.Is_Smeta := CheckBoxSmeta.Checked;
PParameter.Is_VidOpl := CheckBoxVidOpl.Checked;
PParameter.Is_Prop   := CheckBoxProp.Checked;
PParameter.Is_Cat   := CheckBoxCat.Checked;

PParameter.Is_VidOplPrint := CheckBoxVOPrint.Checked;
//PParameter.Is_PropPrint   := CheckBoxPropPrint.Checked;
PParameter.Is_CatPrint    := CheckBoxCatPrint.Checked;


PParameter.Title_Smeta:=LabelSmetaData.Caption;
PParameter.Title_VidOpl:=LabelVidOplData.Caption;
PParameter.Title_department :=LabelDepartmentData.Caption;


if CheckBoxSumma.Checked<>False then
begin
  if  cxCurrencyEdit1.Text<>'' then
  begin
    PParameter.IsSummaLower:=True;
    PParameter.SummaLower:=cxCurrencyEdit1.Text;
  end
  else PParameter.IsSummaLower:=False;
  if  cxCurrencyEdit2.Text<>'' then
  begin
    PParameter.IsSummaHigh:=True;
    PParameter.SummaHigh:=cxCurrencyEdit2.Text;
  end
  else PParameter.IsSummaHigh:=False;
end;

  PrintDM := TDM.Create(self);
  PrintDM.PrintSpr(PDb_Handle,PParameter);
  PrintDM.Destroy;

end;

procedure TfzReeDepVOFilter.MonthesListPropertiesChange(Sender: TObject);
var
  f:integer;
begin
  f:=0;
  if Sender=YearSpinEdit1 then
    if YearSpinEdit1.Value=YearMonthFromKodSetup(PParameter.Kod_Setup1) then f:=1;
  if Sender=YearSpinEdit2 then
    if YearSpinEdit2.Value=YearMonthFromKodSetup(PParameter.Kod_Setup2) then
  if Sender=MonthesList1 then
    if MonthesList1.ItemIndex=YearMonthFromKodSetup(PParameter.Kod_Setup1,False)-1 then f:=1;
  if Sender=MonthesList2 then
    if MonthesList2.ItemIndex=YearMonthFromKodSetup(PParameter.Kod_Setup2,False)-1 then f:=1;
  if f<>1 then
  begin
    PParameter.Kod_Setup1:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
    PParameter.Kod_Setup2:=PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);
    if (Sender=MonthesList1) or (Sender=YearSpinEdit1) then
    begin
      if PParameter.Kod_Setup2<PParameter.Kod_Setup1 then
        PParameter.Kod_Setup2:=PParameter.Kod_Setup1;
      if PParameter.Kod_Setup2-PParameter.Kod_Setup1>=12 then
        PParameter.Kod_Setup2:=PParameter.Kod_Setup1+11;

      MonthesList2.ItemIndex:=YearMonthFromKodSetup(PParameter.Kod_Setup2,False)-1;
      YearSpinEdit2.Value:=YearMonthFromKodSetup(PParameter.Kod_Setup2);
    end
    else
    begin
      if PParameter.Kod_Setup2<PParameter.Kod_Setup1 then
        PParameter.Kod_Setup1:=PParameter.Kod_Setup2;
      if PParameter.Kod_Setup2-PParameter.Kod_Setup1>=12 then
        PParameter.Kod_Setup1:=PParameter.Kod_Setup2-11;

      MonthesList1.ItemIndex:=YearMonthFromKodSetup(PParameter.Kod_Setup1,False)-1;
      YearSpinEdit1.Value:=YearMonthFromKodSetup(PParameter.Kod_Setup1);
    end;
  end;
  DateEdit.EditValue:=ConvertKodToDate(PParameter.Kod_Setup2+1)-1;
  DateEdit.Properties.MinDate:=ConvertKodToDate(PParameter.Kod_Setup1);
  DateEdit.Properties.MaxDate:=ConvertKodToDate(PParameter.Kod_Setup2+1)-1;
end;

procedure TfzReeDepVOFilter.CheckBoxSummaClick(Sender: TObject);
begin
cxCurrencyEdit1.Enabled:=CheckBoxSumma.Checked;
PParameter.IsSummaLower:=cxCurrencyEdit1.Enabled;
cxCurrencyEdit2.Enabled:=CheckBoxSumma.Checked;
PParameter.IsSummaHigh:=cxCurrencyEdit2.Enabled;
end;

procedure TfzReeDepVOFilter.CheckBoxSummaPropertiesChange(Sender: TObject);
begin
{if CheckBoxSumma.Checked=True then
begin
  cxCurrencyEdit1.Enabled:=True;
  cxCurrencyEdit2.Enabled:=True;
end
else
begin
  cxCurrencyEdit1.Enabled:=False;
  cxCurrencyEdit2.Enabled:=False;
end;  }

end;

procedure TfzReeDepVOFilter.cxMaskEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=',') 
then key:='.';
end;

procedure TfzReeDepVOFilter.cxMaskEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=',')
then key:='.';
end;

procedure TfzReeDepVOFilter.Action2Execute(Sender: TObject);
begin
if YesBtn.Focused then
begin
Action1.Execute();
exit;
end;
if CancelBtn.Focused then ModalResult:=mrCancel
else  selectnext(ActiveControl as TWinControl, true, true);
end;

procedure TfzReeDepVOFilter.CheckBoxVOPrintClick(Sender: TObject);
begin
  PParameter.Is_VidOplPrint :=CheckBoxVOPrint.Checked;
end;

procedure TfzReeDepVOFilter.CheckBoxCatPrintClick(Sender: TObject);
begin
//  PParameter.Is_CatPrint    :=CheckBoxCatPrint.Checked;
end;

procedure TfzReeDepVOFilter.CheckBoxCatClick(Sender: TObject);
begin
  EditCat.Enabled:=CheckBoxCat.Checked;
  cxGroupBox4.Enabled:=CheckBoxCat.Checked;
  PParameter.Is_Cat:=CheckBoxCat.Checked;

end;

procedure TfzReeDepVOFilter.EditCatPropertiesChange(Sender: TObject);
var temp:string;  //Для с большой буквы
begin
  PParameter.ID_Cat := EditCat.EditValue;
  PParameter.Title_CAT := EditCat.Text;
  PParameter.Title_CAT:= AnsiLowerCase(PParameter.Title_CAT);
  temp  :=  Copy(PParameter.Title_CAT,1,1);
  temp  := AnsiUpperCase(temp)+Copy(PParameter.Title_CAT,2,Length(PParameter.Title_CAT)-1);
  PParameter.Title_CAT :=temp;
end;

procedure TfzReeDepVOFilter.ComboBoxPropPropertiesChange(Sender: TObject);
begin
  PParameter.id_prop := EditProp.EditValue;
  PParameter.Title_Prop := EditProp.Text;
end;

procedure TfzReeDepVOFilter.CheckBoxPropClick(Sender: TObject);
begin
  EditProp.Enabled:=CheckBoxProp.Checked;
  cxGroupBox1.Enabled:=CheckBoxProp.Checked;
  PParameter.Is_Cat:=CheckBoxProp.Checked;
end;

end.

