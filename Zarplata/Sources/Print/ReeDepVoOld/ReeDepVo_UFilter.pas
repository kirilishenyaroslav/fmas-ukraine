unit ReeDepVo_UFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxGroupBox, cxSpinEdit, cxDropDownEdit, GlobalSpr,
  IBase, PackageLoad, ZTypes,  FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, ZMessages, Unit_ZGlobal_Consts, ZProc, cxLabel, Unit_NumericConsts,
  ActnList, ExtCtrls, ReeDepVo_UDMPrint, Dates, uCommonSp;

type
  TfzReeDepVOFilter = class(TForm)
    BoxSmeta: TcxGroupBox;
    EditSmeta: TcxButtonEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxKodSetup: TcxGroupBox;
    MonthesList1: TcxComboBox;
    YearSpinEdit1: TcxSpinEdit;
    CheckBoxDepartment: TcxCheckBox;
    BoxDepartment: TcxGroupBox;
    EditDepartment: TcxButtonEdit;
    CheckBoxSmeta: TcxCheckBox;
    CheckBoxVidOpl: TcxCheckBox;
    BoxVidOpl: TcxGroupBox;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    LabelDepartmentData: TcxLabel;
    LabelSmetaData: TcxLabel;
    ActionList: TActionList;
    Action1: TAction;
    Bevel: TBevel;
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
  private
    PDb_Handle:TISC_DB_HANDLE;
    PLanguageIndex:byte;
    PParameter:TzReeDepVOFilter;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfzReeDepVOFilter.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
var CurrKodSetup:Integer;
begin
 inherited Create(AOwner);
 PDb_Handle:=ADB_Handle;
 PLanguageIndex:=LanguageIndex;
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
//******************************************************************************
 CurrKodSetup:=CurrentKodSetup(PDb_Handle);
 YearSpinEdit1.Value := YearMonthFromKodSetup(CurrKodSetup);
 MonthesList1.ItemIndex := YearMonthFromKodSetup(CurrKodSetup,False)-1;
end;

procedure TfzReeDepVOFilter.CheckBoxKodSetupClick(Sender: TObject);
begin
BoxKodSetup.Enabled := not BoxKodSetup.Enabled;
end;

procedure TfzReeDepVOFilter.CheckBoxDepartmentClick(Sender: TObject);
begin
BoxDepartment.Enabled := not BoxDepartment.Enabled;
end;

procedure TfzReeDepVOFilter.CheckBoxSmetaClick(Sender: TObject);
begin
BoxSmeta.Enabled := not BoxSmeta.Enabled;
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
            FieldValues['Actual_Date'] := Date;
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
        PParameter.Code_department := EditDepartment.Text;
        PParameter.Title_department := '('+EditDepartment.Text+') '+LabelDepartmentData.Caption;
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
   LabelSmetaData.Caption := Smeta[2];
   PParameter.Title_Smeta:= '('+VarToStrDef(Smeta[3],' ')+') '+ VarToStrDef(Smeta[2],' ');
  end;
end;

procedure TfzReeDepVOFilter.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TfzReeDepVOFilter.CheckBoxVidOplClick(Sender: TObject);
begin
BoxVidOpl.Enabled := CheckBoxVidOpl.Checked;
end;

procedure TfzReeDepVOFilter.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,PDb_Handle,ValueFieldZSetup(PDb_Handle,'Z_ID_SYSTEM'),0);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PParameter.Id_VidOpl:=VidOpl[0];
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
VidOPl:=LoadVidOpl(self,
                   PDb_Handle,zfsModal,
                   0,
                   ValueFieldZSetup(PDb_Handle,'Z_ID_SYSTEM'));
 if VarArrayDimCount(VidOpl)>0 then
  begin
   PParameter.Id_VidOpl:=VidOpl[0];
   PParameter.Title_VidOpl:= '('+VarToStrDef(VidOPl[2],' ')+') '+ VarToStrDef(VidOpl[1],' ');
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
    LabelDepartmentData.Caption := Department[2];
   end
  else
   EditDepartment.SetFocus;
 end;
end;

procedure TfzReeDepVOFilter.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
if EditSmeta.Text<>'' then
 begin
  Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),PDb_Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PParameter.Id_smeta:=Smeta[0];
    LabelSmetaData.Caption := Smeta[2];
   end
  else
   EditSmeta.SetFocus;
 end;
end;

procedure TfzReeDepVOFilter.Action1Execute(Sender: TObject);
var PrintDM:TDM;
begin

if PParameter.Id_smeta=0 then CheckBoxSmeta.Checked:=False;
if PParameter.Id_department=0 then CheckBoxDepartment.Checked:=False;
if PParameter.Id_VidOpl=0 then CheckBoxVidOpl.Checked:=False;

PParameter.Is_Department := CheckBoxDepartment.Checked;
PParameter.Is_Smeta := CheckBoxSmeta.Checked;
PParameter.Is_VidOpl := CheckBoxVidOpl.Checked;

PParameter.Kod_Setup:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);

if (not PParameter.Is_Smeta) and
   (not PParameter.Is_Department) and
   (not PParameter.Is_VidOpl) then
 ZShowMessage(Error_Caption[PLanguageIndex],ZeNotInputData_Error_Text[PLanguageIndex],mtWarning,[mbOK])
else
 begin
  PrintDM := TDM.Create(self);
  PrintDM.PrintSpr(PDb_Handle,PParameter);
  PrintDM.Destroy;
 end;
end;

end.
