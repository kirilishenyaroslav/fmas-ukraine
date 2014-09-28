unit uPrKSpravEditTYPE_DOP_DOK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxMaskEdit, cxButtonEdit, cxCheckBox,uPRK_SP_TYPE_DOP_DOK;

type
  TFormPrKSpravEditTYPE_DOP_DOK = class(TFormPrKKlassSpravEdit)
    cxLabelISPIT_VEDOM_TYPE: TcxLabel;
    cxButtonEditISPIT_VEDOM_TYPE: TcxButtonEdit;
    cxCheckBoxIsOCENKA: TcxCheckBox;
    cxLabelIS_OCENKA: TcxLabel;
    cxLabelPredm: TcxLabel;
    cxButtonEditPredm: TcxButtonEdit;
    cxCheckBoxIsNoRozpiska: TcxCheckBox;
    cxLabelIsNoRozpiska: TcxLabel;
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditISPIT_VEDOM_TYPEPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxButtonEditISPIT_VEDOM_TYPEKeyPress(Sender: TObject;
      var Key: Char);
    procedure cxCheckBoxIsOCENKAPropertiesChange(Sender: TObject);
    procedure cxButtonEditPredmPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    DataPrKSpravEdit :TDataPrKSpravDOP_DOK;
    procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravDOP_DOK;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrKSpravEditTYPE_DOP_DOK: TFormPrKSpravEditTYPE_DOP_DOK;

implementation
uses  uConstants,uPrK_Loader,uPrK_Resources;
{$R *.dfm}

{ TFormPrKSpravEditTYPE_DOP_DOK }

constructor TFormPrKSpravEditTYPE_DOP_DOK.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravDOP_DOK; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  if DataPrKSpravEdit.IsOcenka=0
   then begin
     cxCheckBoxIsOCENKA.Checked           := false;
     cxButtonEditISPIT_VEDOM_TYPE.Enabled := false;
     cxButtonEditPredm.Enabled            := false;
   end
   else cxCheckBoxIsOCENKA.Checked := true;

  if DataPrKSpravEdit.IsNoRozpiska=0
   then cxCheckBoxIsNoRozpiska.Checked   := false
   else cxCheckBoxIsNoRozpiska.Checked   := true;


 cxButtonEditISPIT_VEDOM_TYPE.Text :=DataPrKSpravEdit.ShortNameVedomType;
 cxButtonEditPredm.Text            :=DataPrKSpravEdit.ShortNamePredm;
end;

procedure TFormPrKSpravEditTYPE_DOP_DOK.inicCaption;
begin
  inherited;
  cxLabelISPIT_VEDOM_TYPE.Caption    :=nLabelISPIT_VEDOM_TYPE[IndLangEdit];
  cxLabelIS_OCENKA.Caption           :=nLabelIS_OCENKA_VSTUP[IndLangEdit];
  cxLabelPredm.Caption               :=nLabelPredm[IndLangEdit];
  cxLabelIsNoRozpiska.Caption        :=nLabelIsNoRozpiska[IndLangEdit];
end;

procedure TFormPrKSpravEditTYPE_DOP_DOK.ActionOKExecute(Sender: TObject);
begin
  if cxCheckBoxIsOCENKA.Checked=false
   then DataPrKSpravEdit.IsOcenka:=0
   else begin
     DataPrKSpravEdit.IsOcenka:=1;
     if trim(cxButtonEditISPIT_VEDOM_TYPE.Text)='' then
      begin
        ShowMessage(nMsgEmptyISPIT_VEDOM_TYPE[IndLangEdit]);
        cxButtonEditISPIT_VEDOM_TYPE.Properties.OnButtonClick(self,0);;
        exit;
      end;

     if trim(cxButtonEditPredm.Text)='' then
      begin
        ShowMessage(nMsgEmptyPredm[IndLangEdit]);
        cxButtonEditPredm.Properties.OnButtonClick(self,0);;
        exit;
      end;
   end;

  if cxCheckBoxIsNoRozpiska.Checked=false
    then DataPrKSpravEdit.IsNoRozpiska:=0
    else DataPrKSpravEdit.IsNoRozpiska:=1;
    
  inherited;
end;

procedure TFormPrKSpravEditTYPE_DOP_DOK.cxButtonEditISPIT_VEDOM_TYPEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 res :variant;
begin
   res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_TYPE_DOP_DOK(self.Owner).DataBasePrKSprav.Handle,
                                    PrK_SP_ISPIT_VEDOM_TYPE,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataPrKSpravEdit.IdSpIspitVedomType :=StrToInt64(res[0]);
              DataPrKSpravEdit.ShortNameVedomType :=res[2];
              cxButtonEditISPIT_VEDOM_TYPE.Text   :=res[2];
              cxButtonEditPredm.SetFocus;
          end;
    end;
end;

procedure TFormPrKSpravEditTYPE_DOP_DOK.cxButtonEditISPIT_VEDOM_TYPEKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key:=Chr(0);
end;

procedure TFormPrKSpravEditTYPE_DOP_DOK.cxCheckBoxIsOCENKAPropertiesChange(
  Sender: TObject);
begin
  if cxCheckBoxIsOCENKA.Checked= true
   then begin
    cxButtonEditISPIT_VEDOM_TYPE.Enabled:=true;
    cxButtonEditPredm.Enabled           :=true;
   end
   else begin
    cxButtonEditISPIT_VEDOM_TYPE.Enabled:=false;
    cxButtonEditPredm.Enabled           :=false;
   end;
end;

procedure TFormPrKSpravEditTYPE_DOP_DOK.cxButtonEditPredmPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 res :variant;
begin
   res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_SP_TYPE_DOP_DOK(self.Owner).DataBasePrKSprav.Handle,
                                    PrK_SP_PREDM_u,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataPrKSpravEdit.IdSpPredm :=StrToInt64(res[0]);
              DataPrKSpravEdit.ShortNamePredm     :=res[2];
              cxButtonEditPredm.Text              :=res[2];
              cxTextEditName.SetFocus;
          end;
    end;
end;

end.
