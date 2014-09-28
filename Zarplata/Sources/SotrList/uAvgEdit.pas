unit uAvgEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit;

type
  TAvgEditForm = class(TForm)
    Label1: TLabel;
    EditAvgSumma: TcxMaskEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AvgEditForm: TAvgEditForm;

implementation

{$R *.dfm}

end.
