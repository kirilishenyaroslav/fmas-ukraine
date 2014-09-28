unit uSpTipDocTeplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxMaskEdit, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons;

type
  TSpTipDocTemplForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxName: TcxTextEdit;
    cxFile: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    OpenFileDialog: TOpenDialog;
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SpTipDocTemplForm: TSpTipDocTemplForm;

implementation

{$R *.dfm}

procedure TSpTipDocTemplForm.OkButtonClick(Sender: TObject);
begin
 if (cxName.Text='') or (cxFile.Text='') then ModalResult:=mrNone
  else ModalResult:=mrOk;
end;

end.
