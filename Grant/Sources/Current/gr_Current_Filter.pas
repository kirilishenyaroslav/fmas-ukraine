unit gr_Current_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxGroupBox, cxSpinEdit, cxDropDownEdit, GlobalSpr,
  IBase, PackageLoad, Dates, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, ActnList, ExtCtrls, cxLabel, Unit_NumericConsts,
  gr_uMessage, gr_uCommonConsts, gr_uCommonProc, gr_uCommonLoader, Gr_AccDepart;


type TgrCurrentFilter = record
 Is_Smeta:boolean;
 Is_Department:boolean;
 Is_Man:boolean;
 Is_VidOpl:boolean;
 Is_KodSetup:boolean;
 Is_OperationsFilter:boolean;
 Is_Prikaz:boolean;
 Id_smeta:integer;
 Kod_Smeta:integer;
 Name_Smeta:String;
 Id_department:integer;
 Kod_department:string[10];
 Name_Department:String;
 Id_man:integer;
 Tn:integer;
 FIO:string;
 Id_VidOpl:integer;
 Kod_VidOpl:integer;
 Name_VidOpl:string;
 Kod_Setup1:integer;
 Kod_Setup2:integer;
 Prikaz:string[50];
 ModalResult:TModalResult;
end;

type
  TfzCurrentFilter = class(TForm)
    BoxSmeta: TcxGroupBox;
    EditSmeta: TcxButtonEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxKodSetup: TcxGroupBox;
    MonthesList1: TcxComboBox;
    YearSpinEdit1: TcxSpinEdit;
    CheckBoxKodSetup: TcxCheckBox;
    CheckBoxDepartment: TcxCheckBox;
    BoxDepartment: TcxGroupBox;
    EditDepartment: TcxButtonEdit;
    CheckBoxSmeta: TcxCheckBox;
    CheckBoxIdMan: TcxCheckBox;
    BoxIdMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
    CheckBoxVidOpl: TcxCheckBox;
    BoxVidOpl: TcxGroupBox;
    EditVidOpl: TcxButtonEdit;
    LabelManData: TcxLabel;
    LabelVidOplData: TcxLabel;
    LabelDepartmentData: TcxLabel;
    LabelSmetaData: TcxLabel;
    ActionList: TActionList;
    Action1: TAction;
    MonthesList2: TcxComboBox;
    YearSpinEdit2: TcxSpinEdit;
    cxLabel1: TcxLabel;
    CheckBoxOperationsFilter: TcxCheckBox;
    Bevel: TBevel;
    CheckBoxPrikaz: TcxCheckBox;
    BoxPrikaz: TcxGroupBox;
    EditPrikaz: TcxMaskEdit;
    procedure CheckBoxKodSetupClick(Sender: TObject);
    procedure CheckBoxDepartmentClick(Sender: TObject);
    procedure CheckBoxSmetaClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelBtnClick(Sender: TObject);
    procedure k(Sender: TObject);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxVidOplClick(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditDepartmentExit(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure CheckBoxOperationsFilterClick(Sender: TObject);
    procedure EditPrikazKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxPrikazClick(Sender: TObject);
    procedure EditManPropertiesEditValueChanged(Sender: TObject);
    procedure ActionEnterExecute(Sender: TObject);
  private
    PParameter:TgrCurrentFilter;
    PDb_Handle:TISC_DB_HANDLE;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TgrCurrentFilter);reintroduce;
    property Parameter:TgrCurrentFilter read PParameter;
  end;

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TgrCurrentFilter):TgrCurrentFilter;stdcall;
implementation

{$R *.dfm}
function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TgrCurrentFilter):TgrCurrentFilter;stdcall;
var Filter:TfzCurrentFilter;
    Res:TgrCurrentFilter;
begin
Filter := TfzCurrentFilter.Create(AOwner,ADB_Handle,AParameter);
if Filter.ShowModal=mrYes then
   Res:=Filter.Parameter
else Res:=AParameter;
Res.ModalResult:=Filter.ModalResult;
Filter.Free;
ViewFilter:=Res;
end;

constructor TfzCurrentFilter.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TgrCurrentFilter);
begin
 inherited Create(AOwner);
 PParameter:=AParameter;
 PDb_Handle:=ADB_Handle;
 PLanguageIndex:=IndexLanguage;
//******************************************************************************
 Caption     := FilterBtn_Caption[PLanguageIndex];
 CheckBoxKodSetup.Properties.Caption         := LabelPeriod_Caption[PLanguageIndex];
 CheckBoxDepartment.Properties.Caption       := LabelDepartment_Caption[PLanguageIndex];
 CheckBoxVidOpl.Properties.Caption           := LabelVidOpl_Caption[PLanguageIndex];
 CheckBoxSmeta.Properties.Caption            := LabelSmeta_Caption[PLanguageIndex];
 CheckBoxIdMan.Properties.Caption            := LabelStudent_Caption[PLanguageIndex];

 CheckBoxPrikaz.Properties.Caption           := LabelPrikaz_Caption[PLanguageIndex];
 CheckBoxOperationsFilter.Properties.Caption := LabelOperationsFilter_Caption[PLanguageIndex];
 YesBtn.Caption                              := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption                           := CancelBtn_Caption[PLanguageIndex];
 YesBtn.Hint                                 := YesBtn.Caption;
 CancelBtn.Hint                              := CancelBtn.Caption+' (Esc)';
 MonthesList1.Properties.Items.Text          := MonthesList_Text[PLanguageIndex];
 MonthesList2.Properties.Items.Text          := MonthesList_Text[PLanguageIndex];
//******************************************************************************
 CheckBoxKodSetup.Checked := PParameter.Is_KodSetup;
 CheckBoxDepartment.Checked := PParameter.Is_Department;
 CheckBoxSmeta.Checked := PParameter.Is_Smeta;
 CheckBoxIdMan.Checked := PParameter.Is_Man;
 CheckBoxVidOpl.Checked := PParameter.Is_VidOpl;
 CheckBoxOperationsFilter.Checked := PParameter.Is_OperationsFilter;
 CheckBoxPrikaz.Checked := PParameter.Is_Prikaz;

 BoxPrikaz.Enabled := CheckBoxPrikaz.Checked;
 BoxKodSetup.Enabled := CheckBoxKodSetup.Checked;
 BoxSmeta.Enabled := CheckBoxSmeta.Checked;
 BoxDepartment.Enabled := CheckBoxDepartment.Checked;
 BoxIdMan.Enabled := CheckBoxIdMan.Checked;
 BoxVidOpl.Enabled := CheckBoxVidOpl.Checked;
 LabelManData.Caption := PParameter.FIO;
 LabelVidOplData.Caption := PParameter.Name_VidOpl;
 LabelDepartmentData.Caption := PParameter.Name_Department;
 LabelSmetaData.Caption := PParameter.Name_Smeta;
 EditSmeta.Text := grIfThen(PParameter.Kod_Smeta=0,'',IntToStr(PParameter.Kod_Smeta));
 EditDepartment.Text := PParameter.Kod_department;
 EditMan.Text := grIfThen(PParameter.Tn=0,'',IntToStr(PParameter.Tn));
 EditVidOpl.Text := grIfThen(PParameter.Kod_VidOpl=0,'',IntToStr(PParameter.Kod_VidOpl));
//******************************************************************************
 if PParameter.Kod_Setup1=0 then
   PParameter.Kod_Setup1:=grKodSetup(PDb_Handle);
 YearSpinEdit1.Value := YearMonthFromKodSetup(PParameter.Kod_Setup1);
 MonthesList1.ItemIndex := YearMonthFromKodSetup(PParameter.Kod_Setup1,False)-1;
 if PParameter.Kod_Setup2=0 then
   PParameter.Kod_Setup2:=grKodSetup(PDb_Handle);
 YearSpinEdit2.Value := YearMonthFromKodSetup(PParameter.Kod_Setup2);
 MonthesList2.ItemIndex := YearMonthFromKodSetup(PParameter.Kod_Setup2,False)-1;
end;

procedure TfzCurrentFilter.CheckBoxKodSetupClick(Sender: TObject);
begin
BoxKodSetup.Enabled := not BoxKodSetup.Enabled;
end;

procedure TfzCurrentFilter.CheckBoxDepartmentClick(Sender: TObject);
begin
BoxDepartment.Enabled := not BoxDepartment.Enabled;
end;

procedure TfzCurrentFilter.CheckBoxSmetaClick(Sender: TObject);
begin
BoxSmeta.Enabled := not BoxSmeta.Enabled;
end;

procedure TfzCurrentFilter.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Department:Variant;
ViewForm:TfGrAccDepart;
begin
ViewForm:=TfGrAccDepart.Create(self,PDB_Handle);
ViewForm.NKodSetup:=PeriodToKodSetup(YearSpinEdit1.EditValue,MonthesList1.ItemIndex+1);
if ViewForm.ShowModal=mrYes then Department:=ViewForm.Result;

if VarArrayDimCount(Department)> 0 then
 if Department[0]<>NULL then
  begin
   PParameter.Id_department := Department[0];
   PParameter.Name_Department := VarToStr(Department[2]);
   PParameter.Kod_department := VarToStr(Department[1]);
   LabelDepartmentData.Caption := PParameter.Name_Department;
   EditDepartment.Text := PParameter.Kod_department;
  end;
end;

procedure TfzCurrentFilter.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,PDB_Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   PParameter.Id_smeta := Smeta[0];
   PParameter.Name_Smeta := Smeta[2];
   PParameter.Kod_Smeta := Smeta[3];
   EditSmeta.Text := IntToStr(PParameter.Kod_Smeta);
   LabelSmetaData.Caption := PParameter.Name_Smeta;
  end;
end;

procedure TfzCurrentFilter.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TfzCurrentFilter.k(Sender: TObject);
begin
BoxIdMan.Enabled := not BoxIdMan.Enabled;
end;

procedure TfzCurrentFilter.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var man:Variant;
    AParameter: TgrSimpleParam;
begin
  AParameter:=TgrSimpleParam.Create;
  AParameter.Owner:=Self;
  AParameter.DB_Handle:=PDb_Handle;
  man:=DoFunctionFromPackage(AParameter,Stud_StudentCards);
  if VarArrayDimCount(man)> 0 then
    if man[0]<>NULL then
    begin
      PParameter.Id_man:=man[0];
      PParameter.Tn:=grifThen(VarIsNull(Man[1]),0,Man[1]);
      PParameter.FIO:=man[2];
      LabelManData.Caption := PParameter.FIO;
      EditMan.Text := IntToStr(PParameter.Tn);
    end;
end;

procedure TfzCurrentFilter.CheckBoxVidOplClick(Sender: TObject);
begin
  BoxVidOpl.Enabled := CheckBoxVidOpl.Checked;
end;

procedure TfzCurrentFilter.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PParameter.Kod_VidOpl then Exit;
  VidOpl:=grVoByKod(StrToInt(EditVidOpl.Text),date,PDb_Handle);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PParameter.Id_VidOpl:=VidOpl[0];
    PParameter.Kod_VidOpl:=VidOPl[1];
    PParameter.Name_VidOpl:=VidOpl[2];
    LabelVidOplData.Caption := PParameter.Name_VidOpl;
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TfzCurrentFilter.EditVidOplPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=ShowSpVidOpl(self,PDb_Handle);
 if VarArrayDimCount(VidOpl)>0 then
  begin
   PParameter.Id_VidOpl:=VidOpl[0];
   PParameter.Kod_VidOpl:=VidOPl[2];
   PParameter.Name_VidOpl:=VidOpl[1];
   LabelVidOplData.Caption := PParameter.Name_VidOpl;
   EditVidOpl.Text := IntToStr(PParameter.Kod_VidOpl);
  end
 else
  EditVidOpl.SetFocus;
end;

procedure TfzCurrentFilter.EditDepartmentExit(Sender: TObject);
var Department:Variant;
begin
if EditDepartment.Text<>'' then
 begin
  if EditDepartment.Text=PParameter.Kod_department then Exit;
  Department:=grDepartmentByKod(EditDepartment.Text,PDb_Handle);
  if VarArrayDimCount(Department)>0 then
   begin
    PParameter.Id_department:=Department[0];
    PParameter.Kod_department:=Department[1];
    PParameter.Name_Department:=Department[2];
    LabelDepartmentData.Caption := PParameter.Name_Department;
   end
  else
   EditDepartment.SetFocus;
 end;
end;

procedure TfzCurrentFilter.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
if EditSmeta.Text<>'' then
 begin
  if StrToInt(EditSmeta.Text)=PParameter.Kod_Smeta then Exit;
  Smeta:=grSmetaByKod(StrToInt(EditSmeta.Text),PDb_Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PParameter.Id_smeta:=Smeta[0];
    PParameter.Kod_Smeta:=Smeta[1];
    PParameter.Name_Smeta:=Smeta[2];
    LabelSmetaData.Caption := PParameter.Name_Smeta;
   end
  else
   EditSmeta.SetFocus;
 end;
end;

procedure TfzCurrentFilter.Action1Execute(Sender: TObject);
begin
if PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1)>
   PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1) then
 begin
  MonthesList1.SetFocus;
  Exit;
 end;
YesBtn.SetFocus;
   PParameter.Prikaz := EditPrikaz.Text;
if PParameter.Id_smeta=0 then CheckBoxSmeta.Checked:=False;
if PParameter.Id_department=0 then CheckBoxDepartment.Checked:=False;
if PParameter.Id_man=0 then CheckBoxIdMan.Checked:=False;
if PParameter.Id_VidOpl=0 then CheckBoxVidOpl.Checked:=False;
if PParameter.Prikaz='' then CheckBoxPrikaz.Enabled:=False;

PParameter.Is_Department := CheckBoxDepartment.Checked;
PParameter.Is_Smeta := CheckBoxSmeta.Checked;
PParameter.Is_Man := CheckBoxIdMan.Checked;
PParameter.Is_VidOpl := CheckBoxVidOpl.Checked;
PParameter.Is_KodSetup := CheckBoxKodSetup.Checked;
PParameter.Is_OperationsFilter := CheckBoxOperationsFilter.Checked;
PParameter.Is_Prikaz:= CheckBoxPrikaz.Checked;

PParameter.Kod_Setup1:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
PParameter.Kod_Setup2:=PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);

if (not PParameter.Is_Smeta) and
   (not PParameter.Is_Department) and
   (not PParameter.Is_VidOpl) and
   (not PParameter.Is_KodSetup) and
   (not PParameter.Is_Man) then
 grShowMessage(ECaption[PLanguageIndex],EnotInputData_Text[PLanguageIndex],mtWarning,[mbOK])
else   ModalResult:=mrYes;
end;

procedure TfzCurrentFilter.CheckBoxOperationsFilterClick(Sender: TObject);
begin
PParameter.Is_OperationsFilter := CheckBoxOperationsFilter.Checked;
end;

procedure TfzCurrentFilter.EditPrikazKeyPress(Sender: TObject;
  var Key: Char);
begin
if (Length(EditPrikaz.Text)=50) and
   (key<>#7) and (Key<>#8) then Key:=#0;
end;

procedure TfzCurrentFilter.CheckBoxPrikazClick(Sender: TObject);
begin
BoxPrikaz.Enabled := not BoxPrikaz.Enabled;
end;

procedure TfzCurrentFilter.EditManPropertiesEditValueChanged(
  Sender: TObject);
var man:Variant;
begin
if EditMan.Text<>'' then
 begin
  if StrToInt(EditMan.Text)=PParameter.Tn then Exit;
  man:=grManByShifr(StrToInt(EditMan.Text),PDb_Handle);
  if VarArrayDimCount(man)>0 then
   begin
    PParameter.Id_man:=man[0];
    PParameter.Tn:=man[1];
    PParameter.FIO:=man[2];
    LabelManData.Caption := PParameter.FIO;
   end
  else
   EditMan.SetFocus;
 end;
end;

procedure TfzCurrentFilter.ActionEnterExecute(Sender: TObject);
begin
if CancelBtn.Focused then ModalResult :=mrCancel;
if YesBtn.Focused then  Action1.Execute;
if CheckBoxOperationsFilter.Focused then YesBtn.SetFocus;
if EditPrikaz.Focused then  CheckBoxOperationsFilter.SetFocus;
if (CheckBoxPrikaz.Checked) and (CheckBoxPrikaz.Focused) then  EditPrikaz.SetFocus
else if CheckBoxPrikaz.Focused then CheckBoxOperationsFilter.SetFocus;

if (EditSmeta.Focused) and (CheckBoxPrikaz.Checked) then  EditPrikaz.SetFocus
else  if EditSmeta.Focused then CheckBoxPrikaz.SetFocus;

if (CheckBoxSmeta.Focused) and (CheckBoxSmeta.Checked) then  EditSmeta.SetFocus
else if CheckBoxSmeta.Focused then CheckBoxPrikaz.SetFocus;

if (EditDepartment.Focused) and  (CheckBoxSmeta.Checked) then EditSmeta.SetFocus
else if EditDepartment.Focused  then CheckBoxSmeta.SetFocus;

if CheckBoxDepartment.Focused and CheckBoxDepartment.Checked then EditDepartment.SetFocus
else if  CheckBoxDepartment.Focused  then CheckBoxSmeta.SetFocus;
if EditVidOpl.Focused and CheckBoxDepartment.Checked then  EditDepartment.SetFocus
else if EditVidOpl.Focused then CheckBoxDepartment.SetFocus;
if CheckBoxVidOpl.Focused and CheckBoxVidOpl.Checked then  EditVidOpl.SetFocus
else if  CheckBoxVidOpl.Focused then CheckBoxDepartment.SetFocus;

if EditMan.Focused and CheckBoxVidOpl.Checked then EditVidOpl.SetFocus
else if EditMan.Focused then CheckBoxVidOpl.SetFocus;

if CheckBoxIdMan.Focused and CheckBoxIdMan.Checked then  EditMan.SetFocus
else if  CheckBoxIdMan.Focused then CheckBoxVidOpl.SetFocus;

if  (YearSpinEdit2.Focused) and (CheckBoxIdMan.Checked) then EditMan.SetFocus
else if YearSpinEdit2.Focused then CheckBoxIdMan.SetFocus;
if MonthesList2.Focused then YearSpinEdit2.SetFocus;
if YearSpinEdit1.Focused then MonthesList2.SetFocus;
if MonthesList1.Focused then YearSpinEdit1.SetFocus;



end;

end.
