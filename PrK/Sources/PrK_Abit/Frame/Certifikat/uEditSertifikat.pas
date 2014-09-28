unit uEditSertifikat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxControls, cxContainer, cxEdit, cxLabel;

type
  TfrmEditSertifikat = class(TForm)
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxLabelNOMER: TcxLabel;
    cxLabelPIN: TcxLabel;
    cxMaskEditNOMER: TcxMaskEdit;
    cxMaskEditPIN: TcxMaskEdit;
    cxLabelYEAR: TcxLabel;
    cxMaskEditYEAR: TcxMaskEdit;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
  private
    ILLangEdit: integer;
    procedure inicCaption;
  public     
    constructor Create(aOwner: TComponent);overload;
  end;

implementation
uses uPrK_Resources,uConstants,uPRK_DT_ABIT;

{$R *.dfm}

constructor TfrmEditSertifikat.Create(aOwner: TComponent);
begin
  ILLangEdit:=SelectLanguage;
  inherited Create(aOwner);

  inicCaption;
end;

procedure TfrmEditSertifikat.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[ILLangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[ILLangEdit];

   ActionOK.Hint            :=nHintActiont_OK[ILLangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[ILLangEdit];

   cxLabelNOMER.Caption     :=nLabelSertifikatNumber[ILLangEdit];
   cxLabelPIN.Caption       :=nLabelSertifikatPIN[ILLangEdit];
   cxLabelYEAR.Caption      :=nLabelSertifikatYEAR[ILLangEdit];
end;

procedure TfrmEditSertifikat.ActionOKExecute(Sender: TObject);
begin
    if trim(cxMaskEditNOMER.Text)=''
    then begin
        ShowMessage(nMsgSertifikarEmptyNomer[ILLangEdit]);
        cxMaskEditNOMER.SetFocus;
        exit;
    end;
    if trim(cxMaskEditPIN.Text)=''
    then begin
        ShowMessage(nMsgSertifikarEmptyPIN[ILLangEdit]);
        cxMaskEditPIN.SetFocus;
        exit;
    end;
    if cxMaskEditYEAR.Text=''
    then begin
        ShowMessage(nMsgSertifikarEmptyYEAR[ILLangEdit]);
        cxMaskEditYEAR.SetFocus;
        Exit;
    end;
    ModalResult := mrOk;
end;

procedure TfrmEditSertifikat.ActionCanselExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.
