unit DiscSpec_ParEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxSpinEdit, cxLabel, FIBDatabase,
  pFIBDatabase, cxLookAndFeelPainters, StdCtrls, cxButtons,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  ActnList, ExtCtrls;

type
  TfParEditor = class(TForm)
    mePercent: TcxMaskEdit;
    lPercent: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActionList1: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    Bevel1: TBevel;
    procedure CancelActionExecute(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pValue:Extended;
    constructor Create(AOwner:TComponent;APercent:Extended); reintroduce;
  end;

function SetPercent(AOwner : TComponent;APercent:Extended):Extended;

implementation

{$R *.dfm}

function SetPercent(AOwner : TComponent;APercent:Extended):Extended;
var ViewForm:TfParEditor;
begin
  Result:=APercent;
  ViewForm:=TfParEditor.Create(AOwner,APercent);
  if ViewForm.ShowModal=mrOk then
    Result:=ViewForm.pValue;
  ViewForm.Free;
end;

constructor TfParEditor.Create(AOwner:TComponent;APercent:Extended);
begin
 inherited Create(AOwner);
//******************************************************************************
 mePercent.Text:=FloatToStr(APercent);
end;

procedure TfParEditor.CancelActionExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfParEditor.OkActionExecute(Sender: TObject);
begin
  pValue:=StrToFloat(mePercent.Text);
  ModalResult:=mrOk;
end;

end.
