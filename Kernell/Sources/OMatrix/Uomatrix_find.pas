unit Uomatrix_find;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxCheckBox;

type
  TfrmFind = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ChKrCoord: TcxCheckBox;
    ChDbCoord: TcxCheckBox;
    EdKrCoord: TcxTextEdit;
    EdDbCoord: TcxTextEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ChKrCoordPropertiesChange(Sender: TObject);
    procedure ChDbCoordPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TfrmFind.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmFind.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmFind.ChKrCoordPropertiesChange(Sender: TObject);
begin
    EdKrCoord.Enabled:=ChKrCoord.Checked;
end;

procedure TfrmFind.ChDbCoordPropertiesChange(Sender: TObject);
begin
    EdDbCoord.Enabled:=ChDbCoord.Checked;
end;

end.
