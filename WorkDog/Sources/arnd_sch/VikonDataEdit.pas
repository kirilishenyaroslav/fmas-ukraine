unit VikonDataEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxTextEdit,
  ExtCtrls, cxMemo;

type
  TVikonEdit = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    DateBeg: TcxDateEdit;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    cxButton1: TcxButton;
    OldEdit: TcxMemo;
    procedure cxButton1Click(Sender: TObject);
    procedure OldEditPropertiesEditValueChanged(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VikonEdit: TVikonEdit;

implementation

{$R *.dfm}

procedure TVikonEdit.cxButton1Click(Sender: TObject);
begin
 cxButton1.Enabled:=false;
end;

procedure TVikonEdit.OldEditPropertiesEditValueChanged(Sender: TObject);
begin
 cxButton1.Enabled:=true; 
end;

procedure TVikonEdit.ApplyButtonClick(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

end.

