unit uPRK_SP_SOSTAV_PK_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AArray, cxLookAndFeelPainters, ActnList, ExtCtrls, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit,
  cxMaskEdit, cxButtonEdit;

type
  TFormPRK_SP_SOSTAV_PK_Edit = class(TForm)
    cxLabelFormCaption: TcxLabel;
    cxButtonCloseForm: TcxButton;
    ImageSpravEdit: TImage;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxLabelFIO: TcxLabel;
    cxButtonEditFIO: TcxButtonEdit;
    cxLabelDOLJNOST: TcxLabel;
    cxButtonEditDOLJNOST: TcxButtonEdit;
    cxLabelPRIM: TcxLabel;
    cxTextEditPRIM: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure cxLabelFormCaptionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditFIOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditDOLJNOSTPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    LangEdit    :integer;
    DataSP      :TAArray;
    procedure inicCaption;
  public
    constructor Create(aOwner: TComponent;aDataSP :TAArray);overload;
  end;

var
  FormPRK_SP_SOSTAV_PK_Edit: TFormPRK_SP_SOSTAV_PK_Edit;

implementation
uses
    uPrK_Resources,uConstants,uPrK_Loader,
    AllPeopleUnit,uPRK_SP_SOSTAV_PK;
{$R *.dfm}

{ TFormPRK_SP_SOSTAV_PK_Edit }

constructor TFormPRK_SP_SOSTAV_PK_Edit.Create(aOwner: TComponent;
  aDataSP: TAArray);
begin
  DataSP    :=aDataSP;
  LangEdit  :=SelectLanguage;
  inherited Create(aOwner);

  cxLabelFormCaption.Top   :=0;
  inicCaption;
end;

procedure TFormPRK_SP_SOSTAV_PK_Edit.FormCreate(Sender: TObject);
begin
  cxButtonEditFIO.Text            :=DataSP['FIO'].AsString;
  cxButtonEditDOLJNOST.Text       :=DataSP['SHORT_NAME_DOLGNOST_PK'].AsString;
  cxTextEditPRIM.Text             :=DataSP['PRIM'].AsString;
end;

procedure TFormPRK_SP_SOSTAV_PK_Edit.FormShow(Sender: TObject);
begin
                                       {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[LangEdit]),KLF_ACTIVATE);
end;

procedure TFormPRK_SP_SOSTAV_PK_Edit.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TFormPRK_SP_SOSTAV_PK_Edit.cxLabelFormCaptionMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormPRK_SP_SOSTAV_PK_Edit.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[LangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[LangEdit];
   ActionOK.Hint            :=nHintActiont_OK[LangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[LangEdit];

   cxLabelFIO.Caption         :=nLabelFIO[LangEdit];
   cxLabelDOLJNOST.Caption    :=nLabelDOLJNOST[LangEdit];
   cxLabelPRIM.Caption        :=nLabelPRIM[LangEdit];
end;

procedure TFormPRK_SP_SOSTAV_PK_Edit.ActionOKExecute(Sender: TObject);
begin

   if trim(cxButtonEditFIO.Text)='' then
   begin
     ShowMessage(nMsgEmptyFIO[LangEdit]);
     cxButtonEditFIO.SetFocus;
     exit;
   end;

   if trim(cxButtonEditDOLJNOST.Text)='' then
   begin
     ShowMessage(nMsgEmptyDOLJNOST[LangEdit]);
     cxButtonEditDOLJNOST.SetFocus;
     exit;
   end;

  DataSP['PRIM'].AsString  :=cxTextEditPRIM.Text;

  ModalResult:=mrOk;
end;

procedure TFormPRK_SP_SOSTAV_PK_Edit.cxButtonEditFIOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   res : Variant;
begin
   res:=AllPeopleUnit.GetMan(Self, TFormPRK_SP_SOSTAV_PK(self.Owner).DataBasePrKSostPK.Handle, false, true);
   if   VarArrayDimCount(res) > 0 then
    begin
      if (res[0]<>null) and (res[1]<>null) then
      begin
        DataSP['ID_MAN'].AsInt64   := res[0];
        DataSP['FIO'].AsString     := VarToStr(res[1]);
        cxButtonEditFIO.Text       := DataSP['FIO'].AsString;
        cxButtonEditDOLJNOST.SetFocus;
      end;
    end;
end;

procedure TFormPRK_SP_SOSTAV_PK_Edit.cxButtonEditDOLJNOSTPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_SOSTAV_PK(Self.Owner).DataBasePrKSostPK.Handle,
                                    PrK_SP_DOLGNOST_PK,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataSP['ID_SP_DOLGNOST_PK'].AsInt64         := Res[0];
              DataSP['SHORT_NAME_DOLGNOST_PK'].AsString   := Res[2];
              cxButtonEditDOLJNOST.Text                   := DataSP['SHORT_NAME_DOLGNOST_PK'].AsString;
              cxTextEditPRIM.SetFocus;
          end;
    end;
end;

end.
