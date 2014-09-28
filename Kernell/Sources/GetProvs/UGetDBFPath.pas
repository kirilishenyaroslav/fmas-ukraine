unit UGetDBFPath;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxCheckBox;

type
  TfrmGetDbfPath = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    EdAllDocDBF: TcxButtonEdit;
    EdAllProvDBF: TcxButtonEdit;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    cxCheckBox1: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure EdAllDocDBFPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdAllProvDBFPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation



{$R *.dfm}

procedure TfrmGetDbfPath.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmGetDbfPath.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetDbfPath.EdAllDocDBFPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
     if OpenDialog1.Execute
     then begin
               if FileExists(OpenDialog1.FileName)
               then EdAllDocDBF.Text:=OpenDialog1.FileName;
     end;
end;

procedure TfrmGetDbfPath.EdAllProvDBFPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
     if OpenDialog1.Execute
     then begin
               if FileExists(OpenDialog1.FileName)
               then EdAllProvDBF.Text:=OpenDialog1.FileName;
     end;

end;

procedure TfrmGetDbfPath.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     EdAllDocDBF.Enabled:=cxCheckBox1.Checked;
end;

end.
