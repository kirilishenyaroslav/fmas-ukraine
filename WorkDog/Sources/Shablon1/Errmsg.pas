unit Errmsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TFormErr = class(TForm)
    Label9: TLabel;
    RahLbl: TLabel;
    Label2: TLabel;
    BgtLbl: TLabel;
    Label4: TLabel;
    cxButton_cancel: TcxButton;
    cxButton1: TcxButton;
    cxComboBox1: TcxComboBox;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormErr: TFormErr;

implementation

{$R *.dfm}

procedure TFormErr.cxButton_cancelClick(Sender: TObject);
begin
 ModalResult:=mrOk;
// BuSchCheckNativeAcc.Form4.Show;
end;

procedure TFormErr.cxButton1Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFormErr.FormCreate(Sender: TObject);
begin
 cxComboBox1.ItemIndex:=0; 
end;

end.
