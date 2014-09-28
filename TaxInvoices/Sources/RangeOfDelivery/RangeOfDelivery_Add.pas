unit RangeOfDelivery_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls,Ibase,TiCommonProc,TICommonLoader,
  cxCurrencyEdit;

type
  TRangeOfDeliveryAddForm = class(TForm)
    InsertPanel: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    KodRangeTextEdit: TcxTextEdit;
    NameRangeTextEdit: TcxTextEdit;
    KodRangeLabel: TcxLabel;
    NameRangeLabel: TcxLabel;
    PriceRangeLabel: TcxLabel;
    PriceRangeCurrencyEdit: TcxCurrencyEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    PRes           : Variant;
    PDb_Handle     : TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  RangeOfDeliveryAddForm: TRangeOfDeliveryAddForm;

implementation

{$R *.dfm}

constructor TRangeOfDeliveryAddForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle            := Db_Handle;
end;

procedure TRangeOfDeliveryAddForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TRangeOfDeliveryAddForm.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
