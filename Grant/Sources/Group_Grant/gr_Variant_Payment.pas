unit gr_Variant_Payment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxRadioGroup, gr_uCommonLoader, ActnList,
  pfibStoredProc, pfibDataSet, pfibDataBase, gr_ucommonConsts,   zProc;

type
  TFVariantPayment = class(TForm)
    cxRadioGroup1: TcxRadioGroup;
    Panel1: TPanel;
    ButtonYes: TcxButton;
    Cancel: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure cxRadioGroup1PropertiesChange(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
   PLanguageIndex:Integer;
  public
    Param: TParamGG;
    Constructor Create(ParamGG: TParamGG);
  end;

function ViewVarPayment(ParamGG: TParamGG): boolean;


var
  FVariantPayment: TFVariantPayment;

implementation

{$R *.dfm}


Constructor TFVariantPayment.Create(ParamGG: TParamGG);
begin
Param:=TParamGG.create;
Param:=ParamGG;
inherited Create(Param.Owner);
cxRadioGroup1.ItemIndex:=0;
end;

function ViewVarPayment(ParamGG: TParamGG): boolean;
var  FVariantPayment: TFVariantPayment;
begin
FVariantPayment:=TFVariantPayment.Create(ParamGG);
if FVariantPayment.ShowModal=mrYes then Result:=True
else  Result:=False;
end;

procedure TFVariantPayment.cxRadioGroup1PropertiesChange(Sender: TObject);
begin
PLanguageIndex:=LanguageIndex;
cxRadioGroup1.Properties.Items[0].Caption:=Current_Text[PLanguageIndex];
cxRadioGroup1.Properties.Items[1].Caption:=Grant_Text[PLanguageIndex];


if cxRadioGroup1.ItemIndex=0 then
Param.TypePayment:='P'
else Param.TypePayment:='G';

end;

procedure TFVariantPayment.Action1Execute(Sender: TObject);
begin
ModalResult:=mrYes;
end;

procedure TFVariantPayment.Action3Execute(Sender: TObject);
begin
if Cancel.focused=true then close();
if ButtonYes.focused=true then Action1.Execute;
if cxRadioGroup1.focused then  ButtonYes.setFocus;
end;

end.
