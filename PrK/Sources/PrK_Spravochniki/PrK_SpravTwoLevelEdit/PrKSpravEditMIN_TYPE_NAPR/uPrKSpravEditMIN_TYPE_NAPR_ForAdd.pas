unit uPrKSpravEditMIN_TYPE_NAPR_ForAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKSpravEditMIN_TYPE_NAPR, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls;

type
  TFormPrKSpravEditMIN_TYPE_NAPR_ForAdd = class(TFormPrKSpravEditMIN_TYPE_NAPR)
    Bevel1: TBevel;
    cxLabelNameSecLev: TcxLabel;
    cxTextEditNameSecLev: TcxTextEdit;
    cxLabelShortNameSecLev: TcxLabel;
    cxTextEditShortNameSecLev: TcxTextEdit;
    cxLabelKodSecLev: TcxLabel;
    cxTextEditKodSecLev: TcxTextEdit;
    cxLabelNPPSecLev: TcxLabel;
    cxTextEditNppSecLev: TcxTextEdit;
    cxLabelSHIFRSecLev: TcxLabel;
    cxTextEditSHIFRSecLev: TcxTextEdit;
    procedure ActionOKExecute(Sender: TObject);
  private
    procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPrKSpravEditMIN_TYPE_NAPR_ForAdd: TFormPrKSpravEditMIN_TYPE_NAPR_ForAdd;

implementation
uses uConstants;
{$R *.dfm}

{ TFormPrKSpravEditMIN_TYPE_NAPR_ForAdd }

procedure TFormPrKSpravEditMIN_TYPE_NAPR_ForAdd.inicCaption;
begin
  inherited;
   cxLabelNameSecLev.Caption      := nLabelName[IndLangEdit]+      nCaptionSecondLevelNapr[IndLangEdit];
   cxLabelShortNameSecLev.Caption := nLabelShortName[IndLangEdit]+ nCaptionSecondLevelNapr[IndLangEdit];
   cxLabelKodSecLev.Caption       := nLabelKod[IndLangEdit]+       nCaptionSecondLevelNapr[IndLangEdit];;
   cxLabelNPPSecLev.Caption       := nLabelNPP[IndLangEdit]+       nCaptionSecondLevelNapr[IndLangEdit];;
   cxLabelSHIFRSecLev.Caption     := nLabelSHIFR[IndLangEdit]+     nCaptionSecondLevelNapr[IndLangEdit];

   cxTextEditSHIFRSecLev.Text     :='';
   cxTextEditNameSecLev.Text      :='';
   cxTextEditShortNameSecLev.Text :='';

   cxLabelName.Caption      := nLabelName[IndLangEdit]+      nCaptionFirstLevelNapr[IndLangEdit];
   cxLabelShortName.Caption := nLabelShortName[IndLangEdit]+ nCaptionFirstLevelNapr[IndLangEdit];
   cxLabelKod.Caption       := nLabelKod[IndLangEdit]+       nCaptionFirstLevelNapr[IndLangEdit];;
   cxLabelNPP.Caption       := nLabelNPP[IndLangEdit]+       nCaptionFirstLevelNapr[IndLangEdit];;
   cxLabelSHIFR.Caption     := nLabelSHIFR[IndLangEdit]+     nCaptionFirstLevelNapr[IndLangEdit];

end;

procedure TFormPrKSpravEditMIN_TYPE_NAPR_ForAdd.ActionOKExecute(
  Sender: TObject);
begin
  if trim(cxTextEditNameSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLangEdit]);
     cxTextEditNameSecLev.SetFocus;
     exit;
   end;

  if trim(cxTextEditShortNameSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLangEdit]);
     cxTextEditShortNameSecLev.SetFocus;
     exit;
   end;

   if trim(cxTextEditSHIFRSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyShifr[IndLangEdit]);
     cxTextEditSHIFRSecLev.SetFocus;
     exit;
   end;

  if trim(cxTextEditKodSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLangEdit]);
     cxTextEditKodSecLev.SetFocus;
     exit;
   end;

  if trim(cxTextEditNppSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLangEdit]);
     cxTextEditNppSecLev.SetFocus;
     exit;
   end;
  inherited;
end;

end.
