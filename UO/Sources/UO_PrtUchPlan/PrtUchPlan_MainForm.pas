unit PrtUchPlan_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxLabel, cxMaskEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, IBASE,
  cn_Common_Types, cn_Common_Loader, frxCross, uPrK_Loader, uPrK_Resources,
  cxCheckBox, AArray, IB_Externals, frxDesgn;

type
  TfMainForm = class(TForm)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetHeader: TpFIBDataSet;
    DSetHeaderTypeLesson: TpFIBDataSet;
    DSetHeaderControl: TpFIBDataSet;
    rDSHeader: TfrxDBDataset;
    rDSHeaderTypeLesson: TfrxDBDataset;
    rDSHeaderControl: TfrxDBDataset;
    DSetMain: TpFIBDataSet;
    rDSMain: TfrxDBDataset;
    DSetDisc: TpFIBDataSet;
    rDSDisc: TfrxDBDataset;
    DSetGetIdUchPl: TpFIBDataSet;
    DSourceDisc: TDataSource;
    SpecBE: TcxButtonEdit;
    FormObuchBE: TcxButtonEdit;
    KatStudBE: TcxButtonEdit;
    GodNaboraBE: TcxButtonEdit;
    SpecializME: TcxMaskEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxButton1: TcxButton;
    frxCrossObject1: TfrxCrossObject;
    IsNullCB: TcxCheckBox;
    frxDesigner1: TfrxDesigner;
    Report: TfrxReport;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormObuchBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KatStudBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GodNaboraBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure SpecializMEPropertiesChange(Sender: TObject);
    procedure IsNullCBPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    pID_SP_UCH_PLAN:Int64;
    pIdSpec:Int64;
    pIdFrmStd:Int64;
    pIdKatStd:Int64;
    pIdGodNabora:Int64;
    pIdSpecialization:Int64;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

function View_UO_PrtUchPlan(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE):Variant; stdcall;
procedure ShowAllUoBpl(aOwner: TComponent;aParam :TAArray);stdcall;
exports View_UO_PrtUchPlan, ShowAllUoBpl;
implementation

{$R *.dfm}
function View_UO_PrtUchPlan(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE):Variant;
var ViewForm:TfMainForm;
begin
  ViewForm:=TfMainForm.Create(AOwner,ADB_HANDLE);
  ViewForm.ShowModal;
  ViewForm.Release;
end;

procedure ShowAllUoBpl(aOwner: TComponent;aParam :TAArray);
var ViewForm:TfMainForm;
begin
  ViewForm:=TfMainForm.Create(aOwner,PVoid(aParam['Input']['aDBHANDLE'].asInteger));
  ViewForm.pID_SP_UCH_PLAN:=aParam['Input']['ID_SP_UCH_PLAN'].AsInt64;
  ViewForm.cxButton1Click(nil);
end;

constructor TfMainForm.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DB.Handle:=ADB_HANDLE;
  ReadTransaction.Active:=True;
    pID_SP_UCH_PLAN:=-1;
    pIdSpec:=-1;
    pIdFrmStd:=-1;
    pIdKatStd:=-1;
    pIdGodNabora:=-1;
    pIdSpecialization:=-1;
end;

procedure TfMainForm.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  Res :variant;
begin
  AParameter                := TcnSimpleParams.Create;
  AParameter.Owner          := self;
  AParameter.Db_Handle      := DB.Handle;
  AParameter.Formstyle      := fsNormal;
  AParameter.WaitPakageOwner:= self;

  AParameter.DontShowGroups := False;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
  begin
      if ((Res[0]<>Null) and (Res[1]<>Null))  then
      begin
          pIdSpec:=Res[1];
{          DataVL['ID_CN_SP_FAK'].AsInt64        := Res[0];   // id_faculty;
          DataVL['ID_CN_SP_SPEC'].AsInt64       := Res[1];   // id_spec;
          DataVL['SHORT_NAME_FAK'].AsString     := Res[3];   //DM.DataSet['NAME'];
          DataVL['SHORT_NAME_SPEC'].AsString    := Res[4];   //DM_Detail_1.DataSet['NAME'];
          DataVL['ID_CN_JN_FACUL_SPEC'].AsInt64 := Res[6];   }

          SpecBE.Text        := Res[4];
{          ShowMessage(VarToStr(Res[0])+'; '+VarToStr(Res[1])+'; '+VarToStr(Res[2])+'; '+
          VarToStr(Res[3])+'; '+VarToStr(Res[4])+'; '+VarToStr(Res[5])+'; '+VarToStr(Res[6]));}
      end;
  end;
end;

procedure TfMainForm.FormObuchBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  Res:Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
      if ((Res[0]<>Null) and (Res[1]<>Null))  then
      begin
          pIdFrmStd:=Res[0];
          FormObuchBE.Text:=Res[1];
      end;
end;

procedure TfMainForm.KatStudBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  Res:Variant; 
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
      if ((Res[0]<>Null) and (Res[1]<>Null))  then
      begin
          pIdKatStd:=Res[0];
          KatStudBE.Text:=Res[1];
      end;

end;

procedure TfMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReadTransaction.Active:=False;
end;


procedure TfMainForm.GodNaboraBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
  Res:=uPrK_Loader.ShowPrkSprav(self,DB.Handle,PrK_SP_GOD_NABORA,fsNormal);
  if VarArrayDimCount(res) > 0 then
      if ((Res[0]<>Null) and (Res[1]<>Null))  then
      begin
          pIdGodNabora:=Res[0];
          GodNaboraBE.Text:=Res[1];
      end;
end;

procedure TfMainForm.cxButton1Click(Sender: TObject);
begin
  if ((pIdSpec=-1) or
     (pIdFrmStd=-1) or
     (pIdKatStd=-1) or
     (pIdGodNabora=-1)) and (pID_SP_UCH_PLAN=-1) then
    Exit;

 if pID_SP_UCH_PLAN=-1 then
 begin
  if DSetGetIdUchPl.Active then  DSetGetIdUchPl.Close;

  DSetGetIdUchPl.ParamByName('ID_SP_SPEC').AsInt64:=pIdSpec;
  DSetGetIdUchPl.ParamByName('ID_SP_FORM_STUD').AsInt64:=pIdFrmStd;
  DSetGetIdUchPl.ParamByName('ID_SP_KAT_STUD').AsInt64:=pIdKatStd;
  DSetGetIdUchPl.ParamByName('ID_GOD_NABORA').AsInt64:=pIdGodNabora;
  if pIdSpecialization<>-1 then
    DSetGetIdUchPl.ParamByName('ID_SP_SPECIALIZATION').AsInt64:=pIdSpecialization
  else
    DSetGetIdUchPl.ParamByName('ID_SP_SPECIALIZATION').AsVariant:=NULL;

  DSetGetIdUchPl.Open;
  if DSetGetIdUchPl.IsEmpty or VarIsNull(DSetGetIdUchPl['ID_SP_UCH_PLAN']) then Exit;

  pID_SP_UCH_PLAN:=DSetGetIdUchPl['ID_SP_UCH_PLAN'];
  DSetGetIdUchPl.Close;
 end;

  DSetHeaderTypeLesson.CloseOpen(True);
  DSetHeaderControl.CloseOpen(True);

  if DSetHeader.Active then DSetHeader.Close;
  DSetHeader.ParamByName('ID_SP_UCH_PLAN').AsInt64:=pID_SP_UCH_PLAN;

{  DSetHeader.ParamByName('ID_SP_SPEC').AsInt64:=pIdSpec;
  DSetHeader.ParamByName('ID_SP_FORM_STUD').AsInt64:=pIdFrmStd;
  DSetHeader.ParamByName('ID_SP_KAT_STUD').AsInt64:=pIdKatStd;
  DSetHeader.ParamByName('ID_GOD_NABORA').AsInt64:=pIdGodNabora;
  if pIdSpecialization<>-1 then
    DSetHeader.ParamByName('ID_SP_SPECIALIZATION').AsInt64:=pIdSpecialization
  else
    DSetHeader.ParamByName('ID_SP_SPECIALIZATION').AsVariant:=NULL;      }
  DSetHeader.Open;

  if DSetDisc.Active then DSetDisc.Close;
  DSetDisc.ParamByName('ID_SP_UCH_PLAN').AsInt64:=pID_SP_UCH_PLAN;
  DSetDisc.Open;

  if DSetMain.Active then DSetMain.Close;
  DSetMain.ParamByName('ID_SP_UCH_PLAN').AsInt64:=pID_SP_UCH_PLAN;
  DSetMain.Open;

  Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\UO\RUchPlan_28_12_2007.fr3');
  Report.ShowReport;
                              
end;

procedure TfMainForm.SpecializMEPropertiesChange(Sender: TObject);
begin
    if  SpecializME.Text<>'' then
      pIdSpecialization:=StrToInt(SpecializME.Text)
    else
      pIdSpecialization:=-1
end;

procedure TfMainForm.IsNullCBPropertiesChange(Sender: TObject);
begin
  SpecializME.Enabled:=not IsNullCB.Checked;
  if IsNullCB.Checked then
    pIdSpecialization:=-1
  else
    SpecializMEPropertiesChange(Self);
end;

end.
