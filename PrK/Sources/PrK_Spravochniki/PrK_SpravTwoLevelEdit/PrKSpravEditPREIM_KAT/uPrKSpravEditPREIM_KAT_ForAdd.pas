unit uPrKSpravEditPREIM_KAT_ForAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKSpravEditPREIM_KAT, cxLookAndFeelPainters, ActnList,
  cxCheckBox, StdCtrls, cxButtons, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls;

type
  TFormPrKSpravEditPREIM_KAT_ForAdd = class(TFormPrKSpravEditPREIM_KAT)
    Bevel1: TBevel;
    cxLabelNameSecLev: TcxLabel;
    cxTextEditNameSecLev: TcxTextEdit;
    cxLabelShortNameSecLev: TcxLabel;
    cxTextEditShortNameSecLev: TcxTextEdit;
    cxTextEditKodSecLev: TcxTextEdit;
    cxLabelKodSecLev: TcxLabel;
    cxLabelNPPSecLev: TcxLabel;
    cxTextEditNppSecLev: TcxTextEdit;
    procedure ActionOKExecute(Sender: TObject);
  private
    procedure inicCaption;override;
  public
    { Public declarations }
  end;

var
  FormPrKSpravEditPREIM_KAT_ForAdd: TFormPrKSpravEditPREIM_KAT_ForAdd;

implementation
uses uConstants;
{$R *.dfm}

procedure TFormPrKSpravEditPREIM_KAT_ForAdd.inicCaption;
begin
   cxLabelNameSecLev.Caption      := nLabelName[IndLangEdit]+      nCaptionSecondLevelPreim[IndLangEdit];
   cxLabelShortNameSecLev.Caption := nLabelShortName[IndLangEdit]+ nCaptionSecondLevelPreim[IndLangEdit];
   cxLabelKodSecLev.Caption       := nLabelKod[IndLangEdit]+       nCaptionSecondLevelPreim[IndLangEdit];;
   cxLabelNPPSecLev.Caption       := nLabelNPP[IndLangEdit]+       nCaptionSecondLevelPreim[IndLangEdit];;

   cxTextEditNameSecLev.Text      :='';
   cxTextEditShortNameSecLev.Text :='';

  inherited;
end;

procedure TFormPrKSpravEditPREIM_KAT_ForAdd.ActionOKExecute(
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
