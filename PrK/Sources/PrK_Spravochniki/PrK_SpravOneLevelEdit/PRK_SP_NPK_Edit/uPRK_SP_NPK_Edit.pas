unit uPRK_SP_NPK_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxMaskEdit, cxButtonEdit,uPRK_SP_NPK;

type
  TFormPrK_SP_NPK_Edit = class(TFormPrKKlassSpravEdit)
    cxLabelSostavPK: TcxLabel;
    cxButtonEditSostavPK: TcxButtonEdit;
    procedure cxButtonEditSostavPKPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditSostavPKKeyPress(Sender: TObject; var Key: Char);
  private
    DataPrKSpravEdit :TDataPrKSpravNPK;
    procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravNPK;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrK_SP_NPK_Edit: TFormPrK_SP_NPK_Edit;

implementation
uses  uConstants,uPrK_Loader,AArray, uPrKKlassSprav, FIBDatabase;
{$R *.dfm}

{ TFormPrKKlassSpravEdit1 }

constructor TFormPrK_SP_NPK_Edit.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravNPK; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  cxButtonEditSostavPK.Text :=DataPrKSpravEdit.FIO;
end;

procedure TFormPrK_SP_NPK_Edit.inicCaption;
begin
  inherited;
  cxLabelSostavPK.Caption :=nLabelZamestitel[IndLangEdit];
end;

procedure TFormPrK_SP_NPK_Edit.cxButtonEditSostavPKPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  InOutParam :TAArray;
begin

  InOutParam :=TAArray.Create;
    InOutParam['Name_Bpl'].AsString                     := 'PRK_SP_SOSTAV_PK.bpl';
    InOutParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_SP_NPK(self.Owner).DataBasePrKSprav.Handle);
    InOutParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InOutParam['Input']['GodNabora'].AsInt64            := TFormPRK_SP_NPK(self.Owner).ID_GOD_NABORA_GLOBAL;
    InOutParam['Input']['ID_USER_GLOBAL'].AsInt64       := TFormPRK_SP_NPK(self.Owner).ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InOutParam);
  if  InOutParam['OutPut']['ID_SP_SOSTAV_PK'].AsVariant<>Null then
  begin
      DataPrKSpravEdit.ID_SP_SOSTAV_PK    :=InOutParam['OutPut']['ID_SP_SOSTAV_PK'].AsInt64;
      DataPrKSpravEdit.FIO                :=InOutParam['OutPut']['FIO'].AsString;
      cxButtonEditSostavPK.Text           :=DataPrKSpravEdit.FIO  ;
      cxTextEditKod.SetFocus;
  end;
  InOutParam.Free;
  InOutParam:=nil;
end;

procedure TFormPrK_SP_NPK_Edit.ActionOKExecute(Sender: TObject);
begin
 if Trim(cxButtonEditSostavPK.Text)=''
    then DataPrKSpravEdit.ID_SP_SOSTAV_PK:=-1;
  inherited;
end;

procedure TFormPrK_SP_NPK_Edit.cxButtonEditSostavPKKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key:=chr(0);
end;

end.
