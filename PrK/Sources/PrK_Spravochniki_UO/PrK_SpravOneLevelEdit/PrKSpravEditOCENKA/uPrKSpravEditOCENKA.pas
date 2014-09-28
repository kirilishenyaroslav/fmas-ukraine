unit uPrKSpravEditOCENKA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxCheckBox, cxMaskEdit, cxSpinEdit,uPRK_SP_OCENKA;

type
  TFormPrKSpravEditOCENKA = class(TFormPrKKlassSpravEdit)
    cxCheckBoxIsSpivbesida: TcxCheckBox;
    cxSpinEditOcenka: TcxSpinEdit;
    cxLabelOcenka: TcxLabel;
    cxCheckBoxIsZalik: TcxCheckBox;
    cxLabelIsSpivbesida: TcxLabel;
    cxLabelIsZalik: TcxLabel;
    procedure ActionOKExecute(Sender: TObject);
  private
     DataPrKSpravEdit :TDataPrKSpravOcenka;
     procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravOcenka;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrKSpravEditOCENKA: TFormPrKSpravEditOCENKA;

implementation
uses  uConstants;
{$R *.dfm}

{ TFormPrKSpravEditOCENKA }

constructor TFormPrKSpravEditOCENKA.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravOcenka; aAllDataKods, aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  if DataPrKSpravEdit.IsSpivbesida=0
   then cxCheckBoxIsSpivbesida.Checked := false
   else cxCheckBoxIsSpivbesida.Checked := true;
  if DataPrKSpravEdit.IsZaliK=0
   then cxCheckBoxIsZalik.Checked    := false
   else cxCheckBoxIsZalik.Checked    := true;
  cxSpinEditOcenka.Value         := DataPrKSpravEdit.Ocenka_Num;
end;

procedure TFormPrKSpravEditOCENKA.inicCaption;
begin
  inherited;
  cxLabelIsSpivbesida.Caption:=nLabelIsSpivbesida[IndLangEdit];
  cxLabelIsZalik.Caption     :=nLabelIsZalik[IndLangEdit];
  cxLabelOcenka.Caption      :=nLabelOcenka[IndLangEdit];
end;

procedure TFormPrKSpravEditOCENKA.ActionOKExecute(Sender: TObject);
begin

  if cxCheckBoxIsSpivbesida.Checked=false
   then DataPrKSpravEdit.IsSpivbesida:=0
   else DataPrKSpravEdit.IsSpivbesida:=1;

  if cxCheckBoxIsZalik.Checked=false
   then DataPrKSpravEdit.IsZaliK:=0
   else DataPrKSpravEdit.IsZaliK:=1;

  DataPrKSpravEdit.Ocenka_Num:=cxSpinEditOcenka.Value;

  inherited;

end;

end.
