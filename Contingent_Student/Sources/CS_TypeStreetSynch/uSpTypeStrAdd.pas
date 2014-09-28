unit uSpTypeStrAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, ibase;

type
  TfmSpTypeStrAdd = class(TForm)
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    TextFullName: TcxTextEdit;
    TextShortName: TcxTextEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_type_street : variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

{var
  fmSpTypeStrAdd: TfmSpTypeStrAdd;  }

implementation

{$R *.dfm}
constructor TfmSpTypeStrAdd.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmSpTypeStrAdd.OkButtonClick(Sender: TObject);
begin
  if  (TextFullName.Text = '')  then
  Begin
    ShowMessage('Необхідно заповнити повну назву типу вулиці!');
    TextFullName.SetFocus;
    Exit;
  end;
  if  (TextShortName.Text = '')  then
  Begin
    ShowMessage('Необхідно заповнити коротку назву типу вулиці!');
    TextShortName.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfmSpTypeStrAdd.CancelButtonClick(Sender: TObject);
begin
   close;
end;

end.
