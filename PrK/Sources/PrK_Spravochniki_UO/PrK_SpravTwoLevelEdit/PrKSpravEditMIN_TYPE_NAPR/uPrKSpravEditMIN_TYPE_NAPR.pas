unit uPrKSpravEditMIN_TYPE_NAPR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  uPRK_SP_MIN_PERELIK_SPEC;

type
  TFormPrKSpravEditMIN_TYPE_NAPR = class(TFormPrKKlassSpravEdit)
    cxLabelSHIFR: TcxLabel;
    cxTextEditSHIFR: TcxTextEdit;
    procedure ActionOKExecute(Sender: TObject);
  private
    DataPrKSpravEdit :TDataPrKSpravMinNapr;
  public
     procedure inicCaption;override;
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravMinNapr;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrKSpravEditMIN_TYPE_NAPR: TFormPrKSpravEditMIN_TYPE_NAPR;

implementation
uses uConstants;
{$R *.dfm}

{ TFormPrKSpravEditMIN_TYPE_NAPR }

constructor TFormPrKSpravEditMIN_TYPE_NAPR.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravMinNapr; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit := aDataPrKSprav;
  cxTextEditSHIFR.Text :=DataPrKSpravEdit.SHIFR;
end;

procedure TFormPrKSpravEditMIN_TYPE_NAPR.inicCaption;
begin
  inherited;
  cxLabelSHIFR.Caption := nLabelSHIFR[IndLangEdit];
end;

procedure TFormPrKSpravEditMIN_TYPE_NAPR.ActionOKExecute(Sender: TObject);
begin
  if trim(cxTextEditSHIFR.Text)='' then
     begin
       ShowMessage(nMsgEmptySHIFR[IndLangEdit]);
       cxTextEditSHIFR.SetFocus;
       exit;
     end;
  DataPrKSpravEdit.SHIFR := cxTextEditSHIFR.Text;
  inherited;
end;

end.
