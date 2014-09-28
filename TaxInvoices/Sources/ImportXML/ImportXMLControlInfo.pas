unit ImportXMLControlInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,TiCommonTypes,ibase;

type
  TControlInfoForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ControlMemo: TMemo;
    ControlLabel: TLabel;
    LabelPeriodReestr: TLabel;
  private
    { Private declarations }
  public
    PDb_Handle    : TISC_DB_HANDLE;
    ReestrParamIn : TReestrParam;
    constructor Create (AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE; ReestrParam:TReestrParam);reintroduce;
  end;

var
  ControlInfoForm: TControlInfoForm;

implementation

uses ImportXML_DM;

{$R *.dfm}
constructor TControlInfoForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;ReestrParam:TReestrParam);
//var
 // ImportXMLDM :TimportXMLDM;
begin
  inherited Create(AOwner);
  PDb_Handle := DB_HANDLE;
  ReestrParamIn := ReestrParam;
  LabelPeriodReestr.Caption := 'ѕер≥од реЇстру: з ' +DateToStr(ReestrParamIn.DATABEG_REESTR) + ' по '+ DateToStr(ReestrParamIn.DATAEND_REESTR);
end;

end.
