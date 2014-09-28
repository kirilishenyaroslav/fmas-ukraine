unit uPrKSpravEditFobProt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  uPRK_SP_FOB_PROT;

type
  TFormPrKSpravEditFobProt = class(TFormPrKKlassSpravEdit)
    cxTextEditVinitPadeg: TcxTextEdit;
    cxLabelVinitPadeg: TcxLabel;
    cxLabelRoditPadeg: TcxLabel;
    cxTextEditRoditPadeg: TcxTextEdit;
    procedure ActionOKExecute(Sender: TObject);
  private
     DataPrKSpravEdit :TDataPrKSpravFobProt;
     procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravFobProt;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrKSpravEditFobProt: TFormPrKSpravEditFobProt;

implementation
uses  uConstants;
{$R *.dfm}

constructor TFormPrKSpravEditFobProt.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravFobProt; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  cxTextEditVinitPadeg.Text := DataPrKSpravEdit.VinitPadeg;
  cxTextEditRoditPadeg.Text := DataPrKSpravEdit.RoditPadeg;
end;

procedure TFormPrKSpravEditFobProt.inicCaption;
begin
  inherited;
  cxLabelVinitPadeg.Caption:=nLabelVinitPadeg[IndLangEdit];
  cxLabelRoditPadeg.Caption:=nLabelRoditPadeg[IndLangEdit];
end;

procedure TFormPrKSpravEditFobProt.ActionOKExecute(Sender: TObject);
begin

  { Сделано не обязательными полями 21.03.07
  if trim(cxTextEditVinitPadeg.Text)='' then
     begin
       ShowMessage(nMsgEmptyVinitPadeg[IndLangEdit]);
       cxTextEditVinitPadeg.SetFocus;
       exit;
     end;

  if trim(cxTextEditRoditPadeg.Text)='' then
     begin
       ShowMessage(nMsgEmptyRoditPadeg[IndLangEdit]);
       cxTextEditRoditPadeg.SetFocus;
       exit;
     end;    }

  DataPrKSpravEdit.VinitPadeg:=cxTextEditVinitPadeg.Text;
  DataPrKSpravEdit.RoditPadeg:=cxTextEditRoditPadeg.Text;
  inherited;
end;

end.
