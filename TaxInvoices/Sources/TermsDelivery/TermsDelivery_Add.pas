unit TermsDelivery_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls,Ibase,TiCommonProc,TICommonLoader,
  cxCurrencyEdit, TiMessages;

type
  TTermsDeliveryAddForm = class(TForm)
    InsertPanel: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    NumTermsDeliveryTextEdit: TcxTextEdit;
    NameTermsDeliveryTextEdit: TcxTextEdit;
    NumTermsDeliveryLabel: TcxLabel;
    NameTermsDeliveryLabel: TcxLabel;
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
  TermsDeliveryAddForm: TTermsDeliveryAddForm;

implementation

{$R *.dfm}

constructor TTermsDeliveryAddForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
end;

procedure TTermsDeliveryAddForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TTermsDeliveryAddForm.cxButton1Click(Sender: TObject);
begin
  if (NumTermsDeliveryTextEdit.Text = '')then
  begin
   TiShowMessage('Увага!','Заповніть код!',mtWarning,[mbOK]);
   NumTermsDeliveryTextEdit.SetFocus;
   Exit;
  end;

  if (NameTermsDeliveryTextEdit.Text = '')then
  begin
   TiShowMessage('Увага!','Заповніть найменування!',mtWarning,[mbOK]);
   NameTermsDeliveryTextEdit.SetFocus;
   Exit;
  end;

  ModalResult := mrOk;
end;

end.
