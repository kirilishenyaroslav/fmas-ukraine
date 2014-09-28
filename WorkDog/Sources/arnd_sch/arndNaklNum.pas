unit arndNaklNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit;

type
  TTNaklNumForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    NumNaklEdit: TEdit;
    cxSpinEdit1: TcxSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TNaklNumForm: TTNaklNumForm;

implementation

{$R *.dfm}

  


end.
