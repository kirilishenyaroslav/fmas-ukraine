unit uEditInLang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AArray, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList;

type
  TFormEditInLang = class(TForm)
    cxLabelIN_LANG: TcxLabel;
    cxButtonEditIN_LANG: TcxButtonEdit;
    cxLabelLEVEL_VLADEN: TcxLabel;
    cxButtonEditLEVEL_VLADEN: TcxButtonEdit;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditIN_LANGPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditLEVEL_VLADENPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
  private
    ILLangEdit  :integer;
    DataIL      :TAArray;
    procedure   inicCaption;
  public
    constructor Create(aOwner: TComponent;aDataDE :TAArray);overload;
  end;

var
  FormEditInLang: TFormEditInLang;

implementation
uses
    uPrK_Resources,uConstants,uPRK_DT_ABIT,uPrK_Loader;
{$R *.dfm}

{ TFormEditInLang }

constructor TFormEditInLang.Create(aOwner: TComponent; aDataDE: TAArray);
begin
  DataIL    :=aDataDE;
  ILLangEdit:=SelectLanguage;
  inherited Create(aOwner);

  inicCaption;
end;

procedure TFormEditInLang.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[ILLangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[ILLangEdit];

   ActionOK.Hint            :=nHintActiont_OK[ILLangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[ILLangEdit];

   cxLabelIN_LANG.Caption      :=nLabelIN_LANG[ILLangEdit];
   cxLabelLEVEL_VLADEN.Caption :=nLabelLEVEL_VLADEN[ILLangEdit];
end;

procedure TFormEditInLang.FormCreate(Sender: TObject);
begin
 cxButtonEditIN_LANG.Text      :=DataIL['SHORT_NAME_IN_LANG'].asString;
 cxButtonEditLEVEL_VLADEN.Text :=DataIL['SHORT_NAME_LEVEL_VLADEN'].asString;
end;

procedure TFormEditInLang.ActionCanselExecute(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TFormEditInLang.ActionOKExecute(Sender: TObject);
begin
   if trim(cxButtonEditIN_LANG.Text)='' then
   begin
     ShowMessage(nMsgEmptyIN_LANG[ILLangEdit]);
     cxButtonEditIN_LANG.SetFocus;
     exit;
   end;

   if trim(cxButtonEditLEVEL_VLADEN.Text)='' then
   begin
     ShowMessage(nMsgEmptyLEVEL_VLADEN[ILLangEdit]);
     cxButtonEditLEVEL_VLADEN.SetFocus;
     exit;
   end;

   ModalResult :=mrOk;
end;

procedure TFormEditInLang.cxButtonEditIN_LANGPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT.Handle,
                                    PrK_SP_IN_LANG,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataIL['ID_SP_IN_LANG'].AsInt64          := Res[0];
              DataIL['SHORT_NAME_IN_LANG'].AsString    := Res[2];
              cxButtonEditIN_LANG.Text                 := DataIL['SHORT_NAME_IN_LANG'].AsString;
              cxButtonEditLEVEL_VLADEN.SetFocus;
          end;
    end;
end;

procedure TFormEditInLang.cxButtonEditLEVEL_VLADENPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT.Handle,
                                    PrK_SP_LEVEL_VLADEN,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataIL['ID_SP_LEVEL_VLADEN'].AsInt64          := Res[0];
              DataIL['SHORT_NAME_LEVEL_VLADEN'].AsString    := Res[2];
              cxButtonEditLEVEL_VLADEN.Text                 := DataIL['SHORT_NAME_LEVEL_VLADEN'].AsString;
          end;
    end;
end;

end.
