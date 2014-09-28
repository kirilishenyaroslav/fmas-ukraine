unit uPRK_SP_FORM_STUD_FOB_PROT_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxTextEdit, cxMaskEdit,
  cxButtonEdit, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls,AArray;

type
  TFormPRK_SP_FORM_STUD_FOB_PROT_Edit = class(TForm)
    ImageSpravEdit: TImage;
    cxLabelFormCaption: TcxLabel;
    cxButtonCloseForm: TcxButton;
    cxLabelCn_FORM_STUD: TcxLabel;
    cxButtonEditCn_FORM_STUD: TcxButtonEdit;
    cxLabelFOB_PROT: TcxLabel;
    cxButtonEditFOB_PROT: TcxButtonEdit;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxLabelFormCaptionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditFOB_PROTPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditFORM_STUDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    LangEdit    :integer;
    DataFP      :TAArray;
    procedure inicCaption;
  public
    constructor Create(aOwner: TComponent;aDataFP :TAArray);overload;
  end;

var
  FormPRK_SP_FORM_STUD_FOB_PROT_Edit: TFormPRK_SP_FORM_STUD_FOB_PROT_Edit;

implementation
uses
    uPrK_Resources,uConstants,uPrK_Loader,
    uPRK_SP_FORM_STUD_FOB_PROT,cn_Common_Loader,cn_Common_Types;
{$R *.dfm}

{ TFormPRK_SP_FORM_STUD_FOB_PROT_Edit }

constructor TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.Create(aOwner: TComponent;
  aDataFP: TAArray);
begin
  DataFP    :=aDataFP;
  LangEdit  :=SelectLanguage;
  inherited Create(aOwner);

  cxLabelFormCaption.Top   :=0;
  inicCaption;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.FormCreate(Sender: TObject);
begin
  cxButtonEditCn_FORM_STUD.Text  :=DataFP['SHORT_NAME_FORM_STUD'].AsString;
  cxButtonEditFOB_PROT.Text      :=DataFP['SHORT_NAME_FOB_PROT'].AsString;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[LangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[LangEdit];
   ActionOK.Hint            :=nHintActiont_OK[LangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[LangEdit];

   cxLabelCn_FORM_STUD.Caption  :=nLabelCnFormStud[LangEdit];
   cxLabelFOB_PROT.Caption      :=nLabelFOB_PROT[LangEdit];
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.FormShow(Sender: TObject);
begin
                                      {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[LangEdit]),KLF_ACTIVATE);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.cxLabelFormCaptionMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.ActionCanselExecute(
  Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.ActionOKExecute(
  Sender: TObject);
begin
   if trim(cxButtonEditCn_FORM_STUD.Text)='' then
   begin
     ShowMessage(nMsgEmptyCnFormStud[LangEdit]);
     cxButtonEditCn_FORM_STUD.SetFocus;
     exit;
   end;

   if trim(cxButtonEditFOB_PROT.Text)='' then
   begin
     ShowMessage(nMsgEmptyFOB_PROT[LangEdit]);
     cxButtonEditFOB_PROT.SetFocus;
     exit;
   end;

  ModalResult:=mrOk;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.cxButtonEditFOB_PROTPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_FORM_STUD_FOB_PROT(Self.Owner).DataBasePrKFSFP.Handle,
                                    PrK_SP_FOB_PROT,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataFP['ID_SP_FOB_PROT'].AsInt64            := Res[0];
              DataFP['SHORT_NAME_FOB_PROT'].AsString      := Res[2];
              cxButtonEditFOB_PROT.Text                   := DataFP['SHORT_NAME_FOB_PROT'].AsString;
              cxButtonEditCn_FORM_STUD.SetFocus;
          end;
    end;
end;

procedure TFormPRK_SP_FORM_STUD_FOB_PROT_Edit.cxButtonEditFORM_STUDPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  Res :variant;
begin
  AParameter                := TcnSimpleParams.Create;
  AParameter.Owner          := self;
  AParameter.Db_Handle      := TFormPRK_SP_FORM_STUD_FOB_PROT(self.Owner).DataBasePrKFSFP.Handle;
  AParameter.Formstyle      := fsNormal;
  AParameter.WaitPakageOwner:= self;
  res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
  begin
      if  Res[0]<>Null then   // Проверить - точно не знаю что именно и где возвращается
      begin
          DataFP['ID_CN_SP_FORM_STUD'].AsInt64      := Res[0];
          DataFP['SHORT_NAME_FORM_STUD'].AsString   := Res[1];
          cxButtonEditCn_FORM_STUD.Text             := DataFP['SHORT_NAME_FORM_STUD'].AsString;
          cxButtonOK.SetFocus;
      end;
  end;
end;

end.
