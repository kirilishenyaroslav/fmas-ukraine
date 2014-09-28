unit Notes_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls,Ibase,TiCommonProc,TICommonLoader,
  cxCurrencyEdit,TiMessages;

type
  TNotesAddForm = class(TForm)
    InsertPanel: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ArticleTextEdit: TcxTextEdit;
    ShortNameTextEdit: TcxTextEdit;
    ArticleLabel: TcxLabel;
    ShortNameLabel: TcxLabel;
    FullNameLabel: TcxLabel;
    FullNameTextEdit: TcxTextEdit;
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
  NotesAddForm: TNotesAddForm;

implementation

{$R *.dfm}

constructor TNotesAddForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle            := Db_Handle;
end;

procedure TNotesAddForm.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TNotesAddForm.cxButton1Click(Sender: TObject);
begin
  if (ArticleTextEdit.Text = '')then
  begin
    TiShowMessage('Увага!','Заповніть статтю!',mtWarning,[mbOK]);
    ArticleTextEdit.SetFocus;
    Exit;
  end;

  if (ShortNameTextEdit.Text = '')then
  begin
    TiShowMessage('Увага!','Заповніть коротке найменування!',mtWarning,[mbOK]);
    ShortNameTextEdit.SetFocus;
    Exit;
  end;
    if (FullNameTextEdit.Text = '')then
  begin
    TiShowMessage('Увага!','Заповніть повне найменування!',mtWarning,[mbOK]);
    FullNameTextEdit.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

end.
