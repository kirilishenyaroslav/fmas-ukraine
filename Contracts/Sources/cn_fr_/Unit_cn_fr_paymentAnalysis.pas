unit Unit_cn_fr_paymentAnalysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxRadioGroup, iBase, cn_common_types;

type
  Tform_cn_fr_paymentAnalysis = class(TForm)
    pFIBDatabase1: TpFIBDatabase;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxRadioButton4: TcxRadioButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
   constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
    { Public declarations }
  end;
  Function FrCooseReport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
  exports FrCooseReport;
var
  form_cn_fr_paymentAnalysis: Tform_cn_fr_paymentAnalysis;

implementation

{$R *.dfm}
Function FrCooseReport(AParameter:TcnSimpleParamsEx):Variant;stdcall;
 var
 t:Tform_cn_fr_paymentAnalysis;
begin
 t:=Tform_cn_fr_paymentAnalysis.Create(AParameter);
 t.ShowModal;
 t.Free;
End;

constructor Tform_cn_fr_paymentAnalysis.Create(AParameter:TcnSimpleParamsEx);
begin
 inherited Create(AParameter.Owner);
 if Assigned(AParameter.Db_Handle) then
 begin
  self.pFIBDatabase1.Handle:=AParameter.Db_Handle;
  self.pFIBDatabase1.Open;
 end;
end;

procedure Tform_cn_fr_paymentAnalysis.cxButton2Click(Sender: TObject);
begin
 close;
end;

end.
