unit KodTovar_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls,Ibase,TiCommonProc,TICommonLoader,
  cxCurrencyEdit, TiMessages;

type
  TKodTovarAddForm = class(TForm)
    InsertPanel: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    NumKodTovarTextEdit: TcxTextEdit;
    NameKodTovarTextEdit: TcxTextEdit;
    NumKodTovarLabel: TcxLabel;
    NameKodTovarLabel: TcxLabel;
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
  KodTovarAddForm: TKodTovarAddForm;

implementation

{$R *.dfm}

constructor TKodTovarAddForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
end;

procedure TKodTovarAddForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TKodTovarAddForm.cxButton1Click(Sender: TObject);
begin
  if (NumKodTovarTextEdit.Text = '')then
  begin
   TiShowMessage('Увага!','Заповніть код товару!',mtWarning,[mbOK]);
   NumKodTovarTextEdit.SetFocus;
   Exit;
  end;

  if (NameKodTovarTextEdit.Text = '')then
  begin
   TiShowMessage('Увага!','Заповніть найменування коду товару!',mtWarning,[mbOK]);
   NameKodTovarTextEdit.SetFocus;
   Exit;
  end;

  ModalResult := mrOk;
end;

end.
