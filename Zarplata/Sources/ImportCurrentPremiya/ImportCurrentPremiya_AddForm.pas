unit ImportCurrentPremiya_AddForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGroupBox,
  cxControls, cxContainer, cxEdit, cxCheckBox, cxLabel, cxSpinEdit,
  cxButtonEdit,IBase, cxLookAndFeelPainters, StdCtrls, ZMessages,Dates,Unit_sprSubs_Consts,
  cxButtons,ImportCurrentPremiya_DM, Unit_NumericConsts, PackageLoad,ZTypes,
  cxDBLabel;

type TimportAddform = record
 Is_KodSetup:boolean;
 Is_VidOpl:boolean;
 Id_VidOpl:integer;
 Kod_VidOpl:integer;
 Name_VidOpl:string;
 Kod_Setup:integer;
 Is_import:Boolean;

end;


type
  TfmAddForm = class(TForm)
    Bevel1: TBevel;
    BoxKodSetup: TcxGroupBox;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    cxGroupBox2: TcxGroupBox;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    LabelKodSetup: TcxLabel;
    LabelVidOpl: TcxLabel;
    cxLabel1: TcxLabel;
    LabelNumOrder: TcxDBLabel;
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
  private
    PParameter:TimportAddform;
    PDb_Handle:TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TimportAddform);reintroduce;
    property Parameter:TimportAddform read PParameter;
  end;

var
  fmAddForm: TfmAddForm;
function ViewAddForm(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TimportAddform):TimportAddform;stdcall;
implementation
uses ZProc;
 {$R *.dfm}

function ViewAddForm(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TimportAddform):TimportAddform;stdcall;
var AddForm:TfmAddForm;
    Res:TimportAddform;
begin
 AddForm := TfmAddForm.Create(AOwner,ADB_Handle,AParameter);

 if AddForm.ShowModal=mrYes then
   Res := AddForm.Parameter
 else Res := AParameter;

 AddForm.Free;
 ViewAddForm:=Res;
end;

constructor TfmAddForm.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AParameter:TimportAddform);
begin
 inherited Create(AOwner);
 PParameter := AParameter;
 PDb_Handle := ADB_Handle;
//******************************************************************************
 LabelKodSetup.Caption             := GetConst('KodSetup',tcLabel);
 LabelVidOpl.Caption               := GetConst('VidOpl',tcLabel);
 LabelVidOplData.Caption           := PParameter.Name_VidOpl;
 MonthesList.Properties.Items.Text := GetMonthList;
 EditVidOpl.Text                   := IfThen(PParameter.Kod_VidOpl=0,'',IntToStr(PParameter.Kod_VidOpl));
  //if PParameter.Kod_Setup=0 then
 PParameter.Kod_Setup := CurrentKodSetup(PDb_Handle);
 YearSpinEdit.Value    := YearMonthFromKodSetup(PParameter.Kod_Setup);
 MonthesList.ItemIndex := YearMonthFromKodSetup(PParameter.Kod_Setup-1,False);
end;



procedure TfmAddForm.EditVidOplPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   PDb_Handle,zfsModal,
                   0,
                   ValueFieldZSetup(PDb_Handle,'Z_ID_SYSTEM'));
 if VarArrayDimCount(VidOpl)>0 then
  begin
   PParameter.Is_VidOpl    := True;
   PParameter.Id_VidOpl    := VidOpl[0];
   PParameter.Kod_VidOpl   := VidOPl[2];
   PParameter.Name_VidOpl  := VidOpl[1];
   LabelVidOplData.Caption := PParameter.Name_VidOpl;
   EditVidOpl.Text         := IntToStr(PParameter.Kod_VidOpl);
  end
 else
  EditVidOpl.SetFocus;
end;


procedure TfmAddForm.cxButton2Click(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TfmAddForm.cxButton1Click(Sender: TObject);
begin
if (not PParameter.Is_VidOpl)   then
  begin
   //MessageDlg('Оберіть вид операції', mtWarning, [mbOK], 0);
   ZShowMessage(TFSprSubs_InputError_Caption,'Оберіть вид операції',mtWarning,[mbOK]);
   PParameter.Is_import := false;
   Exit;
  end
else
  begin
   PParameter.Is_import := True;
   PParameter.Kod_Setup := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
   ModalResult          := mrOk;
  end;
end;

procedure TfmAddForm.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PParameter.Kod_VidOpl then Exit;
  VidOpl := VoByKod(StrToInt(EditVidOpl.Text),date,PDb_Handle,ZCurrentVidOplProp);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PParameter.Is_VidOpl    := True;
    PParameter.Id_VidOpl    := VidOpl[0];
    PParameter.Kod_VidOpl   := VidOPl[1];
    PParameter.Name_VidOpl  := VidOpl[2];
    LabelVidOplData.Caption := PParameter.Name_VidOpl;
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

end.






