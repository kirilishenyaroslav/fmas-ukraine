unit uPrKSpravEditSecLevelAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls;

type
  TFormPrKSpravEditSecLevelAdd = class(TFormPrKKlassSpravEdit)
    Bevel1: TBevel;
    cxLabelNameSecLev: TcxLabel;
    cxTextEditNameSecLev: TcxTextEdit;
    cxLabelShortNameSecLev: TcxLabel;
    cxTextEditShortNameSecLev: TcxTextEdit;
    cxLabelKodSecLev: TcxLabel;
    cxTextEditKodSecLev: TcxTextEdit;
    cxLabelNPPSecLev: TcxLabel;
    cxTextEditNppSecLev: TcxTextEdit;
    procedure ActionOKExecute(Sender: TObject);
  private
  public
    procedure inicCaption;override;
  end;

var
  FormPrKSpravEditSecLevelAdd: TFormPrKSpravEditSecLevelAdd;

implementation
uses uConstants;
{$R *.dfm}

{ TFormPrKSpravEditSecLevelAdd }

procedure TFormPrKSpravEditSecLevelAdd.inicCaption;
begin

   cxLabelNameSecLev.Caption      := nLabelName[IndLangEdit];
   cxLabelShortNameSecLev.Caption := nLabelShortName[IndLangEdit];
   cxLabelKodSecLev.Caption       := nLabelKod[IndLangEdit];
   cxLabelNPPSecLev.Caption       := nLabelNPP[IndLangEdit];

   cxTextEditNameSecLev.Text      :='';
   cxTextEditShortNameSecLev.Text :='';

  inherited;
end;

procedure TFormPrKSpravEditSecLevelAdd.ActionOKExecute(Sender: TObject);
begin
  if trim(cxTextEditNameSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLangEdit]);
     cxTextEditName.SetFocus;
     exit;
   end;
   
  if trim(cxTextEditShortNameSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLangEdit]);
     cxTextEditName.SetFocus;
     exit;
   end;

  if trim(cxTextEditKodSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLangEdit]);
     cxTextEditName.SetFocus;
     exit;
   end;

  if trim(cxTextEditNppSecLev.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLangEdit]);
     cxTextEditName.SetFocus;
     exit;
   end;

  inherited;
end;

end.
