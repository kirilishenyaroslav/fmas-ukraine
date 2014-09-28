unit SelectAddKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxRadioGroup;

type
  TSelectAddKind_Form = class(TForm)
    RadioGroup: TcxRadioGroup;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    procedure ApplyButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  SelectAddKind_Form: TSelectAddKind_Form;

implementation

{$R *.dfm}

procedure TSelectAddKind_Form.ApplyButtonClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TSelectAddKind_Form.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

destructor TSelectAddKind_Form.Destroy;
begin
 SelectAddKind_Form := nil;
 inherited;
end;

procedure TSelectAddKind_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

end.
