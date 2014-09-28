unit ErrFormSch4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls, cxButtons;

type
  TErrFormSh4 = class(TForm)
    Label9: TLabel;
    RahLbl: TLabel;
    Label2: TLabel;
    BgtLbl: TLabel;
    Label4: TLabel;
    cxButton_cancel: TcxButton;
    cxButton1: TcxButton;
    cxComboBox1: TcxComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ErrFormSh4: TErrFormSh4;

implementation

{$R *.dfm}

procedure TErrFormSh4.FormShow(Sender: TObject);
begin
 cxComboBox1.ItemIndex:=1;
end;

end.
