unit gr_CountSheet_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxGroupBox, cxSpinEdit, cxDropDownEdit, uCommonSp,
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
    EdDepartmentEdit: TcxTextEdit;
    EdNameSmeta: TcxTextEdit;
    CheckBoxIdMan: TcxCheckBox;
    BoxIdMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
    EditName: TcxTextEdit;
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
   EdDepartmentEdit.Text := PParameter.Name_Department;
  end;
 if PParameter.Id_smeta<>0 then
  begin
   CheckBoxSmeta.Checked := True;
   BoxSmeta.Enabled := True;
   EditSmeta.Text := IntToStr(PParameter.Kod_Smeta);
   EdNameSmeta.Text := PParameter.Name_Smeta;
  end;
 if PParameter.Id_man<>0 then
  begin
   CheckBoxIdMan.Checked := True;
   BoxIdMan.Enabled := True;
   EditMan.Text := IntToStr(PParameter.tn);
   EditName.Text := PParameter.FIO;
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
if BoxDepartment.Enabled=False
then
 begin
 PParameter.Id_department:=0;
 PParameter.Kod_department:='';
 end
end;

procedure TUVVedViewFilter.CheckBoxSmetaClick(Sender: TObject);
begin
BoxSmeta.Enabled := not BoxSmeta.Enabled;
if BoxSmeta.Enabled=False
then
  begin
  PParameter.Id_smeta:=0;
  PParameter.Kod_Smeta:=0;
  end
end;

procedure TUVVedViewFilter.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var sp: TSprav;
begin
   try
      sp := GetSprav('SpDepartment');
      if sp <> nil then
      begin
        with sp.Input do
        begin
          Append;
          FieldValues['DBHandle'] := Integer(pDbHandle);
          FieldValues['ShowStyle'] := 0;
          FieldValues['Select'] := 1;
          FieldValues['Actual_Date'] := Date;
          FieldValues['Id_Property']:=4;
          Post;
        end;
      end;
    sp.Show;
   except
     on E:Exception do
      begin
       grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
      end;
   end;
    if sp.Output = nil then
     ShowMessage('BUG: Output is NIL!!!')
    else
     if not sp.Output.IsEmpty then
        begin
         PParameter.Id_department :=sp.Output['ID_DEPARTMENT'];
         PParameter.Name_Department:=varToStrDef(sp.Output['NAME_FULL'],'');
         PParameter.Kod_department :=varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
         EdDepartmentEdit.Text :=varToStrDef(sp.Output['NAME_FULL'],'');
         EditDepartment.Text :=varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
        end;
    sp.Free;
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

   EdNameSmeta.Text := PParameter.Name_Smeta;
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
if BoxIdMan.Enabled=False
then PParameter.tn:=0;
end;

procedure TUVVedViewFilter.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var man:Variant;
    AParameter: TgrSimpleParam;
begin
  AParameter:=TgrSimpleParam.Create;
  AParameter.Owner:=Self;
  AParameter.DB_Handle:=PDbHandle;
  man:=DoFunctionFromPackage(AParameter,Stud_StudentCards);
  if VarArrayDimCount(man)> 0 then
    if man[0]<>NULL then
    begin
      PParameter.Id_man:=man[0];
      PParameter.Tn:=grifThen(VarIsNull(Man[1]),0,Man[1]);
      PParameter.FIO:=man[2];
      EditName.Text := PParameter.FIO;
      EditMan.Text := IntToStr(PParameter.Tn);
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
    EditName.Text := PParameter.FIO;
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
    EdDepartmentEdit.Text := PParameter.Name_Department;
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
    EdNameSmeta.Text := PParameter.Name_Smeta;
   end
  else
   EditSmeta.SetFocus;
 end;
end;

end.
