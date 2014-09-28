unit uPrK_Zach_Fraza_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxMemo,AArray;

type
  TFormPrK_Zach_Fraza_Edit = class(TForm)
    cxLabelFraza_Protokola: TcxLabel;
    cxSpinEditNpp: TcxSpinEdit;
    cxLabelNPP: TcxLabel;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxMemoFraza_Protokola: TcxMemo;
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
  private
    DataZF   :TAArray;
    LangEdit :Integer;
    procedure inicCaption;
  public
    constructor Create(aOwner: TComponent;aDataZF :TAArray);overload;
  end;

var
  FormPrK_Zach_Fraza_Edit: TFormPrK_Zach_Fraza_Edit;

implementation
uses
  uPrK_Resources,uConstants,uPrK_Zach_Rules;
{$R *.dfm}

constructor TFormPrK_Zach_Fraza_Edit.Create(aOwner: TComponent;
  aDataZF: TAArray);
begin
  DataZF    :=aDataZF;
  LangEdit  :=SelectLanguage;
  inherited Create(aOwner);
end;


procedure TFormPrK_Zach_Fraza_Edit.inicCaption;
begin
   ActionOK.Caption                 :=nActiont_OK[LangEdit];
   ActionCansel.Caption             :=nActiont_Cansel[LangEdit];
   ActionOK.Hint                    :=nHintActiont_OK[LangEdit];
   ActionCansel.Hint                :=nHintActiont_Cansel[LangEdit];

   cxLabelFraza_Protokola.Caption   :=nLabelFRAZA_Protokola[LangEdit];
   cxLabelNPP.Caption               :=nLabelNPP[LangEdit];
end;

procedure TFormPrK_Zach_Fraza_Edit.FormCreate(Sender: TObject);
begin
   inicCaption;
   cxMemoFraza_Protokola.Text       :=DataZF['FRAZA'].AsString;
   cxSpinEditNpp.Text               :=DataZF['NPP'].AsString;
end;

procedure TFormPrK_Zach_Fraza_Edit.ActionOKExecute(Sender: TObject);
begin
   if trim(cxMemoFraza_Protokola.Text)='' then
   begin
     ShowMessage('Введіть Фразу Протокола');
     cxMemoFraza_Protokola.SetFocus;
     exit;
   end;
   if trim(cxSpinEditNpp.Text)='' then
   begin
     ShowMessage('Введіть Номер за порядком');
     cxSpinEditNpp.SetFocus;
     exit;
   end;

   DataZF['FRAZA'].AsString :=cxMemoFraza_Protokola.Text;
   DataZF['NPP'].AsString   :=cxSpinEditNpp.Text;

   ModalResult:=Mrok;
end;

procedure TFormPrK_Zach_Fraza_Edit.ActionCanselExecute(Sender: TObject);
begin
    close;
end;

end.
