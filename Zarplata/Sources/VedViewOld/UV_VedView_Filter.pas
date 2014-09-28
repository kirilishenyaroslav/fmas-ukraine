unit UV_VedView_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxGroupBox, cxSpinEdit, cxDropDownEdit, Unit_VedView_Consts, GlobalSpr,
  IBase, PackageLoad, ZTypes, Dates, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, ZMessages;

type UVVedFilter = record
 Id_smeta:integer;
 Name_Smeta:String;
 Id_department:integer;
 Name_Department:String;
 Id_man:integer;
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
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    CheckBoxIdMan: TcxCheckBox;
    BoxIdMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PParameter:UVVedFilter;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:UVVedFilter);reintroduce;
    property Parameter:UVVedFilter read PParameter;
  end;

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:UVVedFilter):UVVedFilter;
implementation

{$R *.dfm}

function ViewFilter(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:UVVedFilter):UVVedFilter;
var Filter:TUVVedViewFilter;
    Res:UVVedFilter;
begin
Filter := TUVVedViewFilter.Create(AOwner,ADB_Handle,AParameter);
if Filter.ShowModal=mrYes then
   Res:=Filter.Parameter;
Res.ModalResult:=Filter.ModalResult;
Filter.Free;
ViewFilter:=Res;
end;

constructor TUVVedViewFilter.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:UVVedFilter);
begin
 inherited Create(AOwner);
 PParameter:=AParameter;
//******************************************************************************
 Caption     := TUVVedViewFilter_Caption;
 CheckBoxKodSetup.Properties.Caption   := TUVVedViewFilter_CheckBoxKodSetup_Caption;
 CheckBoxKod.Properties.Caption        := TUVVedViewFilter_CheckBoxKod_Caption;
 CheckBoxDepartment.Properties.Caption := TUVVedViewFilter_CheckBoxDepartment_Caption;
 CheckBoxSmeta.Properties.Caption      := TUVVedViewFilter_CheckBoxSmeta_Caption;
 CheckBoxIdMan.Properties.Caption      := TUVVedViewFilter_CheckBoxIdMan_Caption;
 YesBtn.Caption                        := TUVVedViewFilter_YesBtn_Caption;
 CancelBtn.Caption                     := TUVVedViewFilter_CancelBtn_Caption;
 MonthesList.Properties.Items.Text     := TUVVedViewFilter_MonthesList_Text;
//******************************************************************************
  DB.Handle := ADB_Handle;
  ReadTransaction.StartTransaction;
 if PParameter.Kod_Setup=0 then
  begin
   DSet.SQLs.SelectSQL.Text              := 'SELECT * FROM Z_KOD_SETUP_RETURN';
   DSet.Open;
   YearSpinEdit.Value:=YearMonthFromKodSetup(DSet.FieldValues['KOD_SETUP']);
   MonthesList.ItemIndex:= YearMonthFromKodSetup(DSet.FieldValues['KOD_SETUP'],false)-1;
  end
 else
  begin
   YearSpinEdit.Value:=YearMonthFromKodSetup(PParameter.Kod_Setup);
   MonthesList.ItemIndex:= YearMonthFromKodSetup(PParameter.Kod_Setup,false)-1;
   CheckBoxKodSetup.Checked := True;
   BoxKodSetup.Enabled := True;
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
   EditDepartment.Text := PParameter.Name_Department;
  end;
 if PParameter.Id_smeta<>0 then
  begin
   CheckBoxSmeta.Checked := True;
   BoxSmeta.Enabled := True;
   EditSmeta.Text := PParameter.Name_Smeta;
  end;
 if PParameter.Id_man<>0 then
  begin
   CheckBoxIdMan.Checked := True;
   BoxIdMan.Enabled := True;
   EditMan.Text := PParameter.FIO;
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
Department:=LoadDepartment(Self,DB.Handle,zfsNormal);
if VarArrayDimCount(Department)> 0 then
 if Department[0]<>NULL then
  begin
   EditDepartment.Text := Department[1];
   PParameter.Id_department := Department[0];
   PParameter.Name_Department := VarToStr(Department[1]);
  end;
end;

procedure TUVVedViewFilter.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,DB.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   EditSmeta.Text := Smeta[2];
   PParameter.Id_smeta := Smeta[0];
   PParameter.Name_Smeta := Smeta[2];
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
 ZShowMessage(TUVVedViewFilter_Caption_Error,TUVVedViewFilter_Data_Error_Text,mtWarning,[mbOK])
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
Man:=LoadPeopleModal(Self,DB.Handle);
if VarArrayDimCount(Man)> 0 then
 If Man[0]<>NULL then
  begin
   EditMan.Text := VarToStr(Man[4])+' - '+VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);
   PParameter.Id_man := Man[0];
   PParameter.FIO := EditMan.Text
  end;
end;

procedure TUVVedViewFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if ReadTransaction.InTransaction then ReadTransaction.Commit;
end;

end.
