unit uPUB_SP_SPEC_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxMaskEdit, cxButtonEdit,uPUB_SP_SPEC, uPrK_Resources;

type
  TFormPUB_SP_SPEC_Edit = class(TFormPrKKlassSpravEdit)
    cxLabelUSpec: TcxLabel;
    cxButtonEditUSpec: TcxButtonEdit;
    cxTextEditFullName: TcxTextEdit;
    cxLabelFullName: TcxLabel;
    cxButtonEditMova: TcxButtonEdit;
    cxLabelMova: TcxLabel;
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditUSpecKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditUSpecPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditMovaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    DataPrKSpravEdit :TDataPrKSpravSPEC;
    procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravSPEC;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPUB_SP_SPEC_Edit: TFormPUB_SP_SPEC_Edit;

implementation
uses  uConstants,uPrK_Loader,AArray, uPrKKlassSprav, FIBDatabase;
{$R *.dfm}

{ TFormPrKKlassSpravEdit1 }

constructor TFormPUB_SP_SPEC_Edit.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravSPEC; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  cxButtonEditUSpec.Text :=DataPrKSpravEdit.USPEC_NAME;
  cxButtonEditMova.Text  :=DataPrKSpravEdit.MOVA_NAME;
  cxTextEditFullName.Text:=DataPrKSpravEdit.FullName;
end;

procedure TFormPUB_SP_SPEC_Edit.inicCaption;
begin
  inherited;
{  cxLabelUSpec.Caption :=nLabelMinPerelikSpec[IndLangEdit];
  cxLabelMova.Caption  :=nLabelMinPerelikSpec[IndLangEdit];  }
end;

procedure TFormPUB_SP_SPEC_Edit.ActionOKExecute(Sender: TObject);
begin
 if Trim(cxButtonEditUSpec.Text)=''
    then DataPrKSpravEdit.ID_SP_USPEC:=-1;
 if Trim(cxButtonEditMova.Text)=''
    then DataPrKSpravEdit.ID_SP_MOVA:=-1;
 DataPrKSpravEdit.FullName:=cxTextEditFullName.Text;
  inherited;
end;

procedure TFormPUB_SP_SPEC_Edit.cxButtonEditUSpecKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key:=chr(0);
end;

procedure TFormPUB_SP_SPEC_Edit.cxButtonEditUSpecPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
//  InOutParam :TAArray;
  Res:Variant;
  i:integer;
begin
  Res:=uPrK_Loader.ShowPrkSprav(Self,TFormPUB_SP_SPEC(self.Owner).DataBasePrKSprav.Handle,PUB_SP_USPEC,fsNormal);
  if VarArrayDimCount(Res)>0 then
    begin
{      SHOWMESSAGE(INTTOSTR(VarArrayDimCount(Res)));
      for i:=0 to 4 do
        ShowMessage(Res[i]);      }
      DataPrKSpravEdit.ID_SP_USPEC    :=Res[0];//.AsInt64;
      DataPrKSpravEdit.USPEC_NAME     :=Res[2];//.AsString;
      cxButtonEditUSpec.Text           :=DataPrKSpravEdit.USPEC_NAME  ;
      cxTextEditKod.SetFocus;
    end;
end;
procedure TFormPUB_SP_SPEC_Edit.cxButtonEditMovaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
//  InOutParam :TAArray;
  Res:Variant;
  i:integer;
begin
  Res:=uPrK_Loader.ShowPrkSprav(Self,TFormPUB_SP_SPEC(self.Owner).DataBasePrKSprav.Handle,PUB_SP_MOVA,fsNormal);
  if VarArrayDimCount(Res)>0 then
    begin
{      SHOWMESSAGE(INTTOSTR(VarArrayDimCount(Res)));
      for i:=0 to 4 do
        ShowMessage(Res[i]);      }
      DataPrKSpravEdit.ID_SP_MOVA    :=Res[0];//.AsInt64;
      DataPrKSpravEdit.MOVA_NAME     :=Res[2];//.AsString;
      cxButtonEditMova.Text           :=DataPrKSpravEdit.MOVA_NAME  ;
      cxTextEditKod.SetFocus;
    end;
end;

end.
