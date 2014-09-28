unit uOptionInterfase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxRadioGroup, StdCtrls,
  cxLookAndFeelPainters, cxButtons, ActnList, cxLabel;

type
  TFormOptionInterfase = class(TForm)
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    GroupBoxMova: TGroupBox;
    cxRadioButtonRus: TcxRadioButton;
    cxRadioButtonUkr: TcxRadioButton;
    GroupBoxColorShem: TGroupBox;
    cxRadioButtonBlue: TcxRadioButton;
    cxRadioButtonYellow: TcxRadioButton;
    cxLabelMustOverload: TcxLabel;
    procedure ActionOKExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
  private
    IndLang:  Integer;
    procedure InicCaption;
  public
    { Public declarations }
  end;

var
  FormOptionInterfase: TFormOptionInterfase;

implementation
uses registry,uCS_Resources,uCS_Constants;
{$R *.dfm}

procedure TFormOptionInterfase.FormCreate(Sender: TObject);
begin
   IndLang:=SelectLanguage;
   case IndLang of
      0: cxRadioButtonUkr.Checked:=true;
      1: cxRadioButtonRus.Checked:=true;
   end;
  case SelectShemaColor of
      0: cxRadioButtonYellow.Checked:=true;
      1: cxRadioButtonBlue.Checked:=true;
  end;
  InicCaption;
end;

procedure TFormOptionInterfase.InicCaption;
begin
   TFormOptionInterfase(self).Caption:= nFormOptionInterfase_Caption[IndLang];

   cxLabelMustOverload.Caption :=ncxLabelMustOverload[IndLang];
   GroupBoxMova.Caption        :=nGroupBoxMova[IndLang];
   GroupBoxColorShem.Caption   :=nGroupBoxColorShem[IndLang];

   cxRadioButtonUkr.Caption    :=ncxRadioButtonUkr[IndLang];
   cxRadioButtonRus.Caption    :=ncxRadioButtonRus[IndLang];
   cxRadioButtonYellow.Caption :=ncxRadioButtonYellow[IndLang];
   cxRadioButtonBlue.Caption   :=ncxRadioButtonBlue[IndLang];

   ActionOK.Caption         :=nActiont_OK[IndLang];
   ActionCansel.Caption     :=nActiont_Cansel[IndLang];

   ActionOK.Hint            :=nHintActiont_OK[IndLang];
   ActionCansel.Hint        :=nHintActiont_Cansel[IndLang];
end;

procedure TFormOptionInterfase.ActionOKExecute(Sender: TObject);
var
   reg:   TRegistry;
   Languegies, ShemaColor: Integer;
begin
    if cxRadioButtonRus.Checked=true
       then Languegies:=1
       else Languegies:=0;

    if cxRadioButtonBlue.Checked=true
       then ShemaColor:=1
       else ShemaColor:=0;

    reg:=TRegistry.Create;
    try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\CS\Languages\',true) then
        begin
           reg.WriteInteger('Index', Languegies);
        end;
     finally
         reg.Free;
     end;

    reg:=TRegistry.Create;
    try
        reg.RootKey :=HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\CS\ShemaColor\',true) then
        begin
           reg.WriteInteger('Color', ShemaColor);
        end;
     finally
         reg.Free;
     end;

  close;
end;

procedure TFormOptionInterfase.ActionCanselExecute(Sender: TObject);
begin
   close;
end;

end.
