unit uPCardFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, uBoolControl,
  StdCtrls, Buttons, ActnList;

type
  TfmPCardFilter = class(TForm)
    FilterString: TqFCharControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    RusFIO: TqFBoolControl;
    ActionList1: TActionList;
    AcceptAction: TAction;
    procedure AcceptActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPCardFilter: TfmPCardFilter;

implementation

uses qFTools;

{$R *.dfm}

procedure TfmPCardFilter.AcceptActionExecute(Sender: TObject);
begin
    qFAutoSaveIntoRegistry(Self);
    ModalResult := mrOk;
end;

procedure TfmPCardFilter.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
end;

end.
