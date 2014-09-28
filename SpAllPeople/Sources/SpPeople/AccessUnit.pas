unit AccessUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit;

type
  TAccessForm = class(TForm)
    LabSeria: TLabel;
    LabNomer: TLabel;
    SeriaEdit: TcxMaskEdit;
    NomerEdit: TcxMaskEdit;
    LabText: TLabel;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    ActionList1: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
  private
    { Private declarations }
  public
    { Private declarations }
  end;

var
  AccessForm: TAccessForm;

implementation

{$R *.dfm}

end.
