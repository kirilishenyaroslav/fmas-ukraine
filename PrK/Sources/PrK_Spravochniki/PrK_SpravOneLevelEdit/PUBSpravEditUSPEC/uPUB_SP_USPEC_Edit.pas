unit uPUB_SP_USPEC_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxMaskEdit, cxButtonEdit,uPUB_SP_USPEC, uPrK_Resources;

type
  TFormPUB_SP_USPEC_Edit = class(TFormPrKKlassSpravEdit)
    cxLabelMinPerelikSpec: TcxLabel;
    cxButtonEditMinPerelikSpec: TcxButtonEdit;
    procedure cxButtonEditMinPerelikSpecPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditMinPerelikSpecKeyPress(Sender: TObject; var Key: Char);
  private
    DataPrKSpravEdit :TDataPrKSpravUSPEC;
    procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravUSPEC;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPUB_SP_USPEC_Edit: TFormPUB_SP_USPEC_Edit;

implementation
uses  uConstants,uPrK_Loader,AArray, uPrKKlassSprav, FIBDatabase;
{$R *.dfm}

{ TFormPrKKlassSpravEdit1 }

constructor TFormPUB_SP_USPEC_Edit.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravUSPEC; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  cxButtonEditMinPerelikSpec.Text :=DataPrKSpravEdit.MIN_PERELIK_SPEC_NAME;
end;

procedure TFormPUB_SP_USPEC_Edit.inicCaption;
begin
  inherited;
  cxLabelMinPerelikSpec.Caption :=nLabelMinPerelikSpec[IndLangEdit];
end;

procedure TFormPUB_SP_USPEC_Edit.cxButtonEditMinPerelikSpecPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
//  InOutParam :TAArray;
  Res:Variant;
  i:integer;
begin
  Res:=uPrK_Loader.ShowPrkSprav(Self,TFormPUB_SP_USPEC(self.Owner).DataBasePrKSprav.Handle,PrK_SP_MIN_PERELIK_SPEC,fsNormal);
  if VarArrayDimCount(Res)>0 then
    begin
{      SHOWMESSAGE(INTTOSTR(VarArrayDimCount(Res)));
      for i:=0 to 4 do
        ShowMessage(Res[i]);      }
      DataPrKSpravEdit.ID_SP_MIN_PERELIK_SPEC    :=Res[0];//.AsInt64;
      DataPrKSpravEdit.MIN_PERELIK_SPEC_NAME     :=Res[1];//.AsString;
      cxButtonEditMinPerelikSpec.Text           :=DataPrKSpravEdit.MIN_PERELIK_SPEC_NAME  ;
      cxTextEditKod.SetFocus;
    end;
end;

procedure TFormPUB_SP_USPEC_Edit.ActionOKExecute(Sender: TObject);
begin
 if Trim(cxButtonEditMinPerelikSpec.Text)=''
    then DataPrKSpravEdit.ID_SP_MIN_PERELIK_SPEC:=-1;
  inherited;
end;

procedure TFormPUB_SP_USPEC_Edit.cxButtonEditMinPerelikSpecKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key:=chr(0);
end;

end.
