unit uPrKKlass_VL_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit, cxLabel,
  StdCtrls, cxButtons, ActnList, ExtCtrls,AArray;

type
  TFormPrKKlass_VL_Edit = class(TForm)
    ImageSpravEdit: TImage;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxLabelFormCaption: TcxLabel;
    cxButtonCloseForm: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cxLabelFormCaptionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionCanselExecute(Sender: TObject);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
  public
    VLLangEdit    :integer;
    DataVL: TAArray;
    procedure inicCaption;virtual;
    constructor Create(aOwner: TComponent;aDataVL :TAArray);overload;
  end;

var
  FormPrKKlass_VL_Edit: TFormPrKKlass_VL_Edit;

implementation
uses
    uPrK_Resources,uConstants;
{$R *.dfm}

constructor TFormPrKKlass_VL_Edit.Create(aOwner: TComponent;
  aDataVL: TAArray);
begin
  DataVL    :=aDataVL;
  VLLangEdit:=SelectLanguage;
  inherited Create(aOwner);

  cxLabelFormCaption.Top   :=0;
  inicCaption;
end;

procedure TFormPrKKlass_VL_Edit.FormShow(Sender: TObject);
begin
                                         {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[VLLangEdit]),KLF_ACTIVATE);
end;

procedure TFormPrKKlass_VL_Edit.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[VLLangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[VLLangEdit];

   ActionOK.Hint            :=nHintActiont_OK[VLLangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[VLLangEdit];
end;

procedure TFormPrKKlass_VL_Edit.cxLabelFormCaptionMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormPrKKlass_VL_Edit.ActionCanselExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
