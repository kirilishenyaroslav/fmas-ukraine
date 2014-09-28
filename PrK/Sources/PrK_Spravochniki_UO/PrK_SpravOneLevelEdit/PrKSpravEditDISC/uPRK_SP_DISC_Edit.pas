unit uPRK_SP_DISC_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrKKlassSpravEdit, cxLookAndFeelPainters, ActnList, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxMaskEdit, cxButtonEdit,uPRK_SP_DISC, uPrK_Resources;

type
  TFormPrK_SP_DISC_Edit = class(TFormPrKKlassSpravEdit)
    cxLabelTypeDisc: TcxLabel;
    cxButtonEditTypeDisc: TcxButtonEdit;
    procedure cxButtonEditSostavPKPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditTypeDiscKeyPress(Sender: TObject; var Key: Char);
  private
    DataPrKSpravEdit :TDataPrKSpravDISC;
    procedure inicCaption;override;
  public
     constructor Create(aOwner: TComponent; aDataPrKSprav :TDataPrKSpravDISC;aAllDataKods: variant;
                        aAllDataNpps: variant);overload;
  end;

var
  FormPrK_SP_DISC_Edit: TFormPrK_SP_DISC_Edit;

implementation
uses  uConstants,uPrK_Loader,AArray, uPrKKlassSprav, FIBDatabase;
{$R *.dfm}

{ TFormPrKKlassSpravEdit1 }

constructor TFormPrK_SP_DISC_Edit.Create(aOwner: TComponent;
  aDataPrKSprav: TDataPrKSpravDISC; aAllDataKods,
  aAllDataNpps: variant);
begin
  inherited Create(aOwner,aDataPrKSprav,aAllDataKods,aAllDataNpps);
  DataPrKSpravEdit:= aDataPrKSprav;
  cxButtonEditTypeDisc.Text :=DataPrKSpravEdit.TYPE_DISC_NAME;
end;

procedure TFormPrK_SP_DISC_Edit.inicCaption;
begin
  inherited;
  cxLabelTypeDisc.Caption :=nLabelTypeDisc[IndLangEdit];
end;

procedure TFormPrK_SP_DISC_Edit.cxButtonEditSostavPKPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
//  InOutParam :TAArray;
  Res:Variant;
  i:integer;
begin
  Res:=uPrK_Loader.ShowPrkSprav(Self,TFormPRK_SP_DISC(self.Owner).DataBasePrKSprav.Handle,PrK_SP_TYPE_DISC,fsNormal);
  if VarArrayDimCount(Res)>0 then
    begin
{      SHOWMESSAGE(INTTOSTR(VarArrayDimCount(Res)));
      for i:=0 to 4 do
        ShowMessage(Res[i]);      }
      DataPrKSpravEdit.ID_SP_TYPE_DISC    :=Res[0];//.AsInt64;
      DataPrKSpravEdit.TYPE_DISC_NAME     :=Res[2];//.AsString;
      cxButtonEditTypeDisc.Text           :=DataPrKSpravEdit.TYPE_DISC_NAME  ;
      cxTextEditKod.SetFocus;
    end;
{  InOutParam :=TAArray.Create;
    InOutParam['Name_Bpl'].AsString                     := 'PRK_SP_SOSTAV_PK.bpl';
    InOutParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_SP_DISC(self.Owner).DataBasePrKSprav.Handle);
    InOutParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InOutParam['Input']['GodNabora'].AsInt64            := TFormPRK_SP_DISC(self.Owner).ID_GOD_NABORA_GLOBAL;
    InOutParam['Input']['ID_USER_GLOBAL'].AsInt64       := TFormPRK_SP_DISC(self.Owner).ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(self,InOutParam);
  if  InOutParam['OutPut']['ID_SP_SOSTAV_PK'].AsVariant<>Null then
  begin
      DataPrKSpravEdit.ID_SP_TYPE_DISC    :=InOutParam['OutPut']['ID_SP_TYPE_DISC'].AsInt64;
      DataPrKSpravEdit.TYPE_DISC_NAME     :=InOutParam['OutPut']['TYPE_DISC_NAME'].AsString;
      cxButtonEditSostavPK.Text           :=DataPrKSpravEdit.TYPE_DISC_NAME  ;
      cxTextEditKod.SetFocus;
  end;
  InOutParam.Free;
  InOutParam:=nil;}
end;

procedure TFormPrK_SP_DISC_Edit.ActionOKExecute(Sender: TObject);
begin
 if Trim(cxButtonEditTypeDisc.Text)=''
    then DataPrKSpravEdit.ID_SP_TYPE_DISC:=-1;
  inherited;
end;

procedure TFormPrK_SP_DISC_Edit.cxButtonEditTypeDiscKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key:=chr(0);
end;

end.
