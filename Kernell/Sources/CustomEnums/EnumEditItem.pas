unit EnumEditItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons;

type
  TfrmEditEnumItem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    cxTextEdit1: TcxTextEdit;
    Panel3: TPanel;
    Label2: TLabel;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmEditEnumItem.cxButton1Click(Sender: TObject);
begin
   ModalResult:=mrYes;
end;

procedure TfrmEditEnumItem.cxButton2Click(Sender: TObject);
begin
   ModalResult:=mrNo;
end;

procedure TfrmEditEnumItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:=caFree;
end;

end.
