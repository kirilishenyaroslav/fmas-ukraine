unit zViewSheet_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxGroupBox, cxSpinEdit, cxDropDownEdit,
  gr_uCommonProc, gr_uCommonLoader, gr_uCommonConsts, gr_uCommonTypes,
  GlobalSpr,
  IBase, Dates, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, gr_uMessage,
  cxLabel;

type UVVedFilter = record
 Id_smeta:integer;
 Kod_Smeta:integer;
 Name_Smeta:String;
 Id_department:integer;
 Kod_department:string[10];
 Name_Department:String;
 Id_man:integer;
 tn:integer;
 FIO:string;
 Kod_Setup:integer;
 Kod:integer;
 ModalResult:TModalResult;
end;

type
  TUVVedViewFilter = class(TForm)
    BoxSmeta: TcxGroupBox;
    EditSmeta: TcxButtonEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxKodSetup: TcxGroupBox;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    CheckBoxKodSetup: TcxCheckBox;
    CheckBoxKod: TcxCheckBox;
    BoxKod: TcxGroupBox;
    CheckBoxDepartment: TcxCheckBox;
    BoxDepartment: TcxGroupBox;
    EditDepartment: TcxButtonEdit;
    CheckBoxSmeta: TcxCheckBox;
    EditKod: TcxMaskEdit;
    CheckBoxIdMan: TcxCheckBox;
    BoxIdMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
    LabelDepartmentName: TcxLabel;
    LabelSmetaName: TcxLabel;
    LabelFIO: TcxLabel;
    procedure CheckBoxKodSetupClick(Sender: TObject);
    procedure CheckBoxKodClick(Sender: TObject);
    procedure CheckBoxDepartmentClick(Sender: TObject);
    procedure CheckBoxSmetaClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CancelBtnClick(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
    procedure CheckBoxIdManClick(Sender: TObject);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManExit(Sender: TObject);
    procedure EditDepartmentExit(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
  private
    PParameter:UVVedFilter;
    pDbHandle:TISC_DB_HANDLE;
    pLanguageIndex:byte;
    pTypeView:TgrUVParam;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:UVVedFilter;ATypeView:TgrUVParam);reintroduce;
    property Parameter:UVVedFilter read PParameter;
  end;

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:UVVedFilter;ATypeView:TgrUVParam):UVVedFilter;
implementation

{$R *.dfm}

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:UVVedFilter;ATypeView:TgrUVParam):UVVedFilter;
var Filter:TUVVedViewFilter;
begin
Result:=AParameter;
Filter := TUVVedViewFilter.Create(AOwner,ADB_Handle,AParameter,ATypeView);
if Filter.ShowModal=mrYes then
   Result:=Filter.Parameter;
Result.ModalResult:=Filter.ModalResult;
Filter.Free;
end;

constructor TUVVedViewFilter.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:UVVedFilter;ATypeView:TgrUVParam);
var curr_ks:integer;
begin
 inherited Create(AOwner);
 PParameter:=AParameter;
 pLanguageIndex := IndexLanguage;
 pDbHandle := ADB_Handle;
 pTypeView := ATypeView;
//******************************************************************************
 Caption := FilterBtn_Caption[pLanguageIndex];
 CheckBoxDepartment.Properties.Caption := LabelDepartment_Caption[pLanguageIndex];
 CheckBoxSmeta.Properties.Caption := LabelSmeta_Caption[pLanguageIndex];
 CheckBoxKodSetup.Properties.Caption := LabelPeriod_Caption[pLanguageIndex];
 CheckBoxIdMan.Properties.Caption := LabelStudent_Caption[pLanguageIndex];
 CheckBoxKod.Properties.Caption := LabelKod_Caption[pLanguageIndex];
 YesBtn.Caption := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[pLanguageIndex];
 MonthesList.Properties.Items.Text := MonthesList_Text[pLanguageIndex];
//******************************************************************************
 if PParameter.Kod_Setup=0 then
  begin
   curr_ks := grKodSetup(pDbHandle);
   YearSpinEdit.Value:=YearMonthFromKodSetup(curr_ks);
   MonthesList.ItemIndex:= YearMonthFromKodSetup(curr_ks,false)-1;
  end
 else
  begin
   YearSpinEdit.Value:=YearMonthFromKodSetup(PParameter.Kod_Setup);
   MonthesList.ItemIndex:= YearMonthFromKodSetup(PParameter.Kod_Setup,false)-1;
   CheckBoxKodSetup.Checked := True;
   BoxKodSetup.Enabled := True;
  end;
 if pTypeView<>uvpFilter then
  begin
   CheckBoxKodSetup.Checked:=True;
   CheckBoxKodSetup.Enabled:=false;
   BoxKodSetup.Enabled := False;
  end;
 if PParameter.Kod<>0 then
  begin
   CheckBoxKod.Checked := True;
   BoxKod.Enabled := True;
   EditKod.Text := IntToStr(PParameter.Kod);
  end;
 if PParameter.Id_department<>0 then
  begin
   CheckBoxDepartment.Checked := True;
   BoxDepartment.Enabled := True;
   EditDepartment.Text := PParameter.Kod_department;
   LabelDepartmentName.Caption := PParameter.Name_Department;
  end;
 if PParameter.Id_smeta<>0 then
  begin
   CheckBoxSmeta.Checked := True;
   BoxSmeta.Enabled := True;
   EditSmeta.Text := IntToStr(PParameter.Kod_Smeta);
   LabelSmetaName.Caption := PParameter.Name_Smeta;
  end;
 if PParameter.Id_man<>0 then
  begin
   CheckBoxIdMan.Checked := True;
   BoxIdMan.Enabled := True;
   EditMan.Text := IntToStr(PParameter.tn);
   LabelFio.Caption := PParameter.FIO;
  end;
//******************************************************************************
end;

procedure TUVVedViewFilter.CheckBoxKodSetupClick(Sender: TObject);
begin
BoxKodSetup.Enabled := not BoxKodSetup.Enabled;
end;

procedure TUVVedViewFilter.CheckBoxKodClick(Sender: TObject);
begin
BoxKod.Enabled := not BoxKod.Enabled;
end;

procedure TUVVedViewFilter.CheckBoxDepartmentClick(Sender: TObject);
begin
BoxDepartment.Enabled := not BoxDepartment.Enabled;
end;

procedure TUVVedViewFilter.CheckBoxSmetaClick(Sender: TObject);
begin
BoxSmeta.Enabled := not BoxSmeta.Enabled;
end;

procedure TUVVedViewFilter.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Department:Variant;
begin
Department:=ShowSpDepartment(pDbHandle);
if VarArrayDimCount(Department)> 0 then
 if Department[0]<>NULL then
  begin
   LabelDepartmentName.Caption := Department[3];
   EditDepartment.Text := Department[1];
   PParameter.Id_department := Department[0];
   PParameter.Kod_department := Department[1];
   PParameter.Name_Department := VarToStr(Department[3]);
  end;
end;

procedure TUVVedViewFilter.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,pDbHandle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   PParameter.Id_smeta := Smeta[0];
   PParameter.Kod_Smeta := Smeta[3];
   PParameter.Name_Smeta := Smeta[2];

   LabelSmetaName.Caption := PParameter.Name_Smeta;
   EditSmeta.Text := IntToStr(PParameter.Kod_Smeta);
  end;
end;

procedure TUVVedViewFilter.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TUVVedViewFilter.YesBtnClick(Sender: TObject);
begin
If ((PParameter.Id_smeta=0) or (not CheckBoxSmeta.Checked)) and
   ((PParameter.Id_department=0) or (not CheckBoxDepartment.Checked)) and
   ((PParameter.Id_man=0) or (not CheckBoxIdMan.Checked)) and
   (not CheckBoxKodSetup.Checked) and
   ((EditKod.Text='') or (not CheckBoxKod.Checked)) then
 grShowMessage(ECaption[pLanguageIndex],EnotInputData_Text[pLanguageIndex],mtWarning,[mbOK])
else
 begin
  if (not CheckBoxDepartment.Checked) then
     PParameter.Id_department:=0;
  if not CheckBoxSmeta.Checked then
     PParameter.Id_smeta:=0;
  if not CheckBoxIdMan.Checked then
     PParameter.Id_man:=0;
  if CheckBoxKodSetup.Checked then
     PParameter.Kod_Setup := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1)
  else
     PParameter.Kod_Setup:=0;
  if (CheckBoxKod.Checked) and (EditKod.Text<>'') then
     PParameter.Kod := StrToInt(EditKod.Text)
  else
     PParameter.Kod:=0;
  ModalResult:=mrYes;
 end;
end;

procedure TUVVedViewFilter.CheckBoxIdManClick(Sender: TObject);
begin
BoxIdMan.Enabled := not BoxIdMan.Enabled;
end;

procedure TUVVedViewFilter.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:Variant;
begin
Man:=ShowSpPeople(Self,pDbHandle);
if VarArrayDimCount(Man)> 0 then
 If Man[0]<>NULL then
  begin
   PParameter.Id_man := Man[0];
   PParameter.tn :=  Man[4];
   PParameter.FIO := VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);

   EditMan.Text := IntToStr(PParameter.tn);
   LabelFio.Caption := PParameter.FIO;
  end;
end;

procedure TUVVedViewFilter.EditManExit(Sender: TObject);
var man:Variant;
begin
if EditMan.Text<>'' then
 begin
  if StrToInt(EditMan.Text)=PParameter.Tn then Exit;
  man:=grManByTn(StrToInt(EditMan.Text),pDbHandle);
  if VarArrayDimCount(man)>0 then
   begin
    PParameter.Id_man:=man[0];
    PParameter.Tn:=man[1];
    PParameter.FIO:=man[2];
    LabelFio.Caption := PParameter.FIO;
   end
  else
   EditMan.SetFocus;
 end;
end;

procedure TUVVedViewFilter.EditDepartmentExit(Sender: TObject);
var Department:Variant;
begin
if EditDepartment.Text<>'' then
 begin
  if EditDepartment.Text=PParameter.Kod_department then Exit;
  Department:=grDepartmentByKod(EditDepartment.Text,PDbHandle);
  if VarArrayDimCount(Department)>0 then
   begin
    PParameter.Id_department:=Department[0];
    PParameter.Kod_department:=Department[1];
    PParameter.Name_Department:=Department[2];
    LabelDepartmentName.Caption := PParameter.Name_Department;
   end
  else
   EditDepartment.SetFocus;
 end;
end;

procedure TUVVedViewFilter.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
if EditSmeta.Text<>'' then
 begin
  if StrToInt(EditSmeta.Text)=PParameter.Kod_Smeta then Exit;
  Smeta:=grSmetaByKod(StrToInt(EditSmeta.Text),PDbHandle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PParameter.Id_smeta:=Smeta[0];
    PParameter.Kod_Smeta:=Smeta[1];
    PParameter.Name_Smeta:=Smeta[2];
    LabelSmetaName.Caption := PParameter.Name_Smeta;
   end
  else
   EditSmeta.SetFocus;
 end;
end;

end.
