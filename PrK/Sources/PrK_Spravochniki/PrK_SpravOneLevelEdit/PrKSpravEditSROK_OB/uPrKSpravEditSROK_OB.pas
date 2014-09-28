unit uPrKSpravEditSROK_OB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxMaskEdit, cxSpinEdit,uPRK_SP_SROK_OB;

type
  TFormPrKSpravEditSROK_OB = class(TFormPrKKlassSpravEdit)
    cxLabelYearsKolvo: TcxLabel;
    cxSpinEditYearsKolvo: TcxSpinEdit;
    cxLabelMonthesKolvo: TcxLabel;
    cxSpinEditMonthesKolvo: TcxSpinEdit;
    procedure ActionOKExecute(Sender: TObject);
  private
     DataPrKSpravEdit :TDataPrKSpravSrokOb;
     procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravSrokOb;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrKSpravEditSROK_OB: TFormPrKSpravEditSROK_OB;

implementation
uses  uConstants;
{$R *.dfm}

constructor TFormPrKSpravEditSROK_OB.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravSrokOb; aAllDataKods, aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  cxSpinEditYearsKolvo.Value      := DataPrKSpravEdit.Years_Kolvo;
  cxSpinEditMonthesKolvo.Value    := DataPrKSpravEdit.Monthes_Kolvo;
end;

procedure TFormPrKSpravEditSROK_OB.inicCaption;
begin
  inherited;
  cxLabelYearsKolvo.Caption      :=nLabelYearsKolvo[IndLangEdit];
  cxLabelMonthesKolvo.Caption    :=nLabelMonthesKolvo[IndLangEdit];
end;

procedure TFormPrKSpravEditSROK_OB.ActionOKExecute(Sender: TObject);
begin
  DataPrKSpravEdit.Years_Kolvo   :=cxSpinEditYearsKolvo.Value;
  DataPrKSpravEdit.Monthes_Kolvo :=cxSpinEditMonthesKolvo.Value;
  inherited;
end;

end.
