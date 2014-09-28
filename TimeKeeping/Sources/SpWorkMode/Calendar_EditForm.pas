unit Calendar_EditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, StdCtrls, cxButtons, ExtCtrls;

type
  TFormEditCalendar = class(TForm)
    Panel1: TPanel;
    ButtonOK: TcxButton;
    ButtonCancel: TcxButton;
    Panel2: TPanel;
    EditHOURS: TcxMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditCalendar: TFormEditCalendar;

implementation

{$R *.dfm}

end.
