unit uPrK_Zach_Rules_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AArray, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxSpinEdit, cxCheckBox;

type
  TFormPrK_Zach_Rules_Edit = class(TForm)
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxLabelPreim: TcxLabel;
    cxButtonEditPreim: TcxButtonEdit;
    cxSpinEditORDER_ZACH: TcxSpinEdit;
    cxLabelORDER_ZACH: TcxLabel;
    cxLabelIS_ZACH_RULE: TcxLabel;
    cxCheckBoxIIS_ZACH_RULE: TcxCheckBox;
    cxLabelKAT_PRI_D: TcxLabel;
    cxButtonEditKAT_PRI_D: TcxButtonEdit;
    cxLabelNOMER_PRAVIL: TcxLabel;
    cxTextEditNOMER_PRAVIL: TcxTextEdit;
    procedure cxButtonEditPreimPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditKAT_PRI_DPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
  private
    DataZR   :TAArray;
    LangEdit :Integer;
    procedure inicCaption;
  public
    constructor Create(aOwner: TComponent;aDataZR :TAArray);overload;
  end;

var
  FormPrK_Zach_Rules_Edit: TFormPrK_Zach_Rules_Edit;

implementation
uses
  uPrK_Resources,uConstants,uPrK_Zach_Rules,
  uPrK_Loader;
{$R *.dfm}

{ TFormPrK_Zach_Rules_Edit }

constructor TFormPrK_Zach_Rules_Edit.Create(aOwner: TComponent;
  aDataZR: TAArray);
begin
  DataZR    :=aDataZR;
  LangEdit  :=SelectLanguage;
  inherited Create(aOwner);
end;

procedure TFormPrK_Zach_Rules_Edit.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[LangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[LangEdit];
   ActionOK.Hint            :=nHintActiont_OK[LangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[LangEdit];

   cxLabelIS_ZACH_RULE.Caption    :=nLabelIS_ZACH_RULE[LangEdit];
   cxLabelKAT_PRI_D.Caption       :=nLabelKAT_PRI_D[LangEdit];
   cxLabelNOMER_PRAVIL.Caption    :=nLabelNOMER_PRAVIL[LangEdit];
   cxLabelORDER_ZACH.Caption      :=nLabelORDER_ZACH[LangEdit];
   cxLabelPreim.Caption           :=nLabelNAME_PREIM[LangEdit];
end;

procedure TFormPrK_Zach_Rules_Edit.cxButtonEditPreimPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPrK_Zach_Rules(Self.Owner).DataBasePrK.Handle,
                                    PrK_SP_PREIM,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataZR['ID_SP_PREIM'].AsInt64               := Res[0];
              DataZR['SHORT_NAME_PREIM'].AsString         := Res[2];
              cxButtonEditPreim.Text                      := DataZR['SHORT_NAME_PREIM'].AsString;
              cxButtonEditKAT_PRI_D.SetFocus;
          end;
    end;
end;

procedure TFormPrK_Zach_Rules_Edit.cxButtonEditKAT_PRI_DPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPrK_Zach_Rules(Self.Owner).DataBasePrK.Handle,
                                    PrK_SP_KAT_PRI_D,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataZR['ID_SP_KAT_PRI_D'].AsInt64           := Res[0];
              DataZR['SHORT_NAME_KAT_PRI_D'].AsString     := Res[2];
              cxButtonEditKAT_PRI_D.Text                      := DataZR['SHORT_NAME_KAT_PRI_D'].AsString;
              cxTextEditNOMER_PRAVIL.SetFocus;
          end;
    end;
end;

procedure TFormPrK_Zach_Rules_Edit.FormCreate(Sender: TObject);
begin
  inicCaption;
  cxButtonEditPreim.Text           :=DataZR['SHORT_NAME_PREIM'].AsString;
  cxButtonEditKAT_PRI_D.Text       :=DataZR['SHORT_NAME_KAT_PRI_D'].AsString;
  cxTextEditNOMER_PRAVIL.Text      :=DataZR['NOMER_PRAVIL'].AsString;
  cxSpinEditORDER_ZACH.Text        :=DataZR['ORDER_ZACH'].AsString;
  if DataZR['IS_ZACH_RULE'].AsInteger<>0
   then cxCheckBoxIIS_ZACH_RULE.Checked:=true
   else cxCheckBoxIIS_ZACH_RULE.Checked:=false;   
end;

procedure TFormPrK_Zach_Rules_Edit.ActionOKExecute(Sender: TObject);
begin
   if trim(cxButtonEditPreim.Text)='' then
   begin
     ShowMessage('Потрібно вибрати Переваги');
     cxButtonEditPreim.SetFocus;
     exit;
   end;
   if trim(cxButtonEditKAT_PRI_D.Text)='' then
   begin
     ShowMessage('Потрібно вибрати Категорію прийому документів');
     cxButtonEditKAT_PRI_D.SetFocus;
     exit;
   end;
   if trim(cxTextEditNOMER_PRAVIL.Text)='' then
   begin
     ShowMessage('Введіть номер правил');
     cxTextEditNOMER_PRAVIL.SetFocus;
     exit;
   end;
   if trim(cxSpinEditORDER_ZACH.Text)='' then
   begin
     ShowMessage('Введіть порядок, у котрому ураховуються правила зарахування ');
     cxSpinEditORDER_ZACH.SetFocus;
     exit;
   end;

   DataZR['NOMER_PRAVIL'].AsString :=cxTextEditNOMER_PRAVIL.Text;
   DataZR['ORDER_ZACH'].AsString   :=cxSpinEditORDER_ZACH.Text;

   if cxCheckBoxIIS_ZACH_RULE.Checked=true
   then DataZR['IS_ZACH_RULE'].AsInteger:=1
   else DataZR['IS_ZACH_RULE'].AsInteger:=0;

   ModalResult:=Mrok;
end;

procedure TFormPrK_Zach_Rules_Edit.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=MrCancel;
end;

end.
