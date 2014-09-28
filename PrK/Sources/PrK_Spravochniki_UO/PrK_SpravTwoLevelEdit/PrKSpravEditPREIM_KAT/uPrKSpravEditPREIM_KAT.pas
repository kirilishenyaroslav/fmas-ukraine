unit uPrKSpravEditPREIM_KAT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxCheckBox,uPRK_SP_PREIM;

type
  TFormPrKSpravEditPREIM_KAT = class(TFormPrKKlassSpravEdit)
    cxCheckBoxIS_FIZL_LGOTA: TcxCheckBox;
    cxLabelIS_FIZL_LGOTA: TcxLabel;
    procedure ActionOKExecute(Sender: TObject);
  private
     DataPrKSpravEdit :TDataPrKSpravPreimKat;
  public
     procedure inicCaption;override;
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravPreimKat;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrKSpravEditPREIM_KAT: TFormPrKSpravEditPREIM_KAT;

implementation
uses uConstants;
{$R *.dfm}

{ TFormPrKSpravEditPREIM_KAT }

constructor TFormPrKSpravEditPREIM_KAT.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravPreimKat; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  if DataPrKSpravEdit.IS_FIZL_LGOTA=0
   then cxCheckBoxIS_FIZL_LGOTA.Checked := false
   else cxCheckBoxIS_FIZL_LGOTA.Checked := true;
end;

procedure TFormPrKSpravEditPREIM_KAT.inicCaption;
begin
  inherited;
  cxLabelName.Caption      := nLabelName[IndLangEdit]+nCaptionFirstLevelPreim[IndLangEdit];
  cxLabelShortName.Caption := nLabelShortName[IndLangEdit]+nCaptionFirstLevelPreim[IndLangEdit];
  cxLabelIS_FIZL_LGOTA.Caption:=nLabelIS_FIZL_LGOTA[IndLangEdit];
end;

procedure TFormPrKSpravEditPREIM_KAT.ActionOKExecute(Sender: TObject);
begin
  if cxCheckBoxIS_FIZL_LGOTA.Checked=false
   then DataPrKSpravEdit.IS_FIZL_LGOTA:=0
   else DataPrKSpravEdit.IS_FIZL_LGOTA:=1;

  inherited;

end;

end.
