unit Subdivision_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls,Ibase,TiCommonProc,TICommonLoader,
  cxCurrencyEdit, TiMessages;

type
  TSubdivisionAddForm = class(TForm)
    InsertPanel: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    NameSubdivisionTextEdit: TcxTextEdit;
    NameSubdivisionLabel: TcxLabel;
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
  SubdivisionAddForm: TSubdivisionAddForm;

implementation

{$R *.dfm}

constructor TSubdivisionAddForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle := Db_Handle;
end;

procedure TSubdivisionAddForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TSubdivisionAddForm.cxButton1Click(Sender: TObject);
begin
  if (NameSubdivisionTextEdit.Text = '')then
  begin
   TiShowMessage('Увага!','Заповніть найменування підрозділу!',mtWarning,[mbOK]);
   NameSubdivisionTextEdit.SetFocus;
   Exit;
  end;

  ModalResult := mrOk;
end;

end.
