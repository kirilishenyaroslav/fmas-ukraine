unit uDocWorkMarksEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxButtons;

type
  TDocWorkMarksEdit = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxName: TcxTextEdit;
    cxShort: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocWorkMarksEdit: TDocWorkMarksEdit;

implementation

{$R *.dfm}

end.
