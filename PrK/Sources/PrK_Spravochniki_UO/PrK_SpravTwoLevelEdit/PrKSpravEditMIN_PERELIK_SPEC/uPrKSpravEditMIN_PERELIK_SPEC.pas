unit uPrKSpravEditMIN_PERELIK_SPEC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxMaskEdit, cxButtonEdit,uPRK_SP_MIN_PERELIK_SPEC;

type
  TFormPrKSpravEditMIN_PERELIK_SPEC = class(TFormPrKKlassSpravEdit)
    cxLabelMinPerelikPrim: TcxLabel;
    cxButtonEditMinPerelikPrim: TcxButtonEdit;
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditMinPerelikPrimPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButtonEditMinPerelikPrimKeyPress(Sender: TObject;
      var Key: Char);
  private
     DataPrKSpravEdit :TDataPrKSpravMinPerelikSpec;
     procedure inicCaption;override;
  public
    constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravMinPerelikSpec;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrKSpravEditMIN_PERELIK_SPEC: TFormPrKSpravEditMIN_PERELIK_SPEC;

implementation
uses uConstants,uPrK_Loader,uPrK_Resources;
{$R *.dfm}

{ TFormPrKSpravEditMIN_PERELIK_SPEC }

constructor TFormPrKSpravEditMIN_PERELIK_SPEC.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravMinPerelikSpec; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit := aDataPrKSprav;
  cxButtonEditMinPerelikPrim.Text :=DataPrKSpravEdit.ShortNamePRIM;
end;

procedure TFormPrKSpravEditMIN_PERELIK_SPEC.inicCaption;
begin
  inherited;
  cxLabelMinPerelikPrim.Caption :=nLabelMinPerelikPrim[IndLangEdit];
end;

procedure TFormPrKSpravEditMIN_PERELIK_SPEC.ActionOKExecute(
  Sender: TObject);
begin
  if trim(cxButtonEditMinPerelikPrim.Text)='' then
     begin
       ShowMessage(nMsgEmptyMinPerelikPrim[IndLangEdit]);
       cxButtonEditMinPerelikPrim.Properties.OnButtonClick(self,0);;
       exit;
     end;
  inherited;
end;

procedure TFormPrKSpravEditMIN_PERELIK_SPEC.cxButtonEditMinPerelikPrimPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_MIN_PERELIK_SPEC(self.Owner).DataBasePrKSprav.Handle,
                                    PrK_SP_MIN_PERELIK_PRIM,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataPrKSpravEdit.IdMinPerelikPRIM :=StrToInt64(res[0]);
              DataPrKSpravEdit.ShortNamePRIM    :=res[2];
              cxButtonEditMinPerelikPrim.Text   :=res[2];
              cxTextEditName.SetFocus;
          end;
    end;
end;

procedure TFormPrKSpravEditMIN_PERELIK_SPEC.cxButtonEditMinPerelikPrimKeyPress(
  Sender: TObject; var Key: Char);
begin
    Key := Chr(0);
end;

end.
