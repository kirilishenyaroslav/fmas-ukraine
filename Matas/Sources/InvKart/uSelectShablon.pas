{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uSelectShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, uResources;

type
  TfmSelectShablon = class(TForm)
    Button_Set_Print_form: TcxButton;
    Button_Cancel: TcxButton;
    LabelShabashName: TLabel;
    ComboBox_NameShabasha: TcxComboBox;
    procedure Button_Set_Print_formClick(Sender: TObject);
    procedure Button_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    ResultArray : Variant;
  end;
    function SetShablon(AOwneri:TComponent; flugi : Integer):Variant;
var
  fmSelectShablon: TfmSelectShablon;

implementation

{$R *.dfm}

function SetShablon(AOwneri:TComponent; flugi : Integer):Variant;
var
 form : TfmSelectShablon;
begin
    form                                  := TfmSelectShablon.Create(AOwneri);
    form.Button_Set_Print_form.Caption    := MAT_INV_Print;
    form.Button_Cancel.Caption            := MAT_INV_Cansel;
    form.Caption                          := MAT_INV_Print;
    form.LabelShabashName.Caption         := MAT_INV_print_sel_Shablon;

    form.ComboBox_NameShabasha.ItemIndex  := 0;

    form.ShowModal;
    SetShablon := form.ResultArray;
    form.Free;
end;

procedure TfmSelectShablon.Button_Set_Print_formClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := ComboBox_NameShabasha.ItemIndex;
    close;
end;

procedure TfmSelectShablon.Button_CancelClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := 255;
    close;
end;

end.
