unit USmGrEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TfrmSmGlObjectEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxCheckBox1: TcxCheckBox;
    ObjectName: TcxTextEdit;
    Label1: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmSmGlObjectEdit.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmSmGlObjectEdit.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
