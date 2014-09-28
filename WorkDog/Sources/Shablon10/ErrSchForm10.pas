unit ErrSchForm10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls, cxButtons;

type
  TFrmErrSch10 = class(TForm)
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
  FrmErrSch10: TFrmErrSch10;

implementation

{$R *.dfm}

procedure TFrmErrSch10.cxButton_cancelClick(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

procedure TFrmErrSch10.cxButton1Click(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TFrmErrSch10.FormCreate(Sender: TObject);
begin
 cxComboBox1.ItemIndex:=0;
end;

end.
