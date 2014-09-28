unit Jo5_InsertUpdateDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfmInsertUpdateDoc = class(TForm)
    cxDateEdit1: TcxDateEdit;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxButton1: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInsertUpdateDoc: TfmInsertUpdateDoc;

implementation

{$R *.dfm}

end.
