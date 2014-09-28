unit UAccDateEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Buttons;

type
  TfrmAccEdit = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmAccEdit.OkButtonClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmAccEdit.CancelButtonClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
