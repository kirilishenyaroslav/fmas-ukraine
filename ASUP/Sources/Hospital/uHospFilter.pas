unit uHospFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, uBoolControl,
  StdCtrls, Buttons, ActnList;

type
  TfmHospFilter = class(TForm)
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
    constructor Create(AOwner: TComponent; NewVersion:Variant); reintroduce;
  end;

var
  fmHospFilter: TfmHospFilter;

implementation

uses qFTools;

{$R *.dfm}

procedure TfmHospFilter.AcceptActionExecute(Sender: TObject);
begin
    qFAutoSaveIntoRegistry(Self);
    ModalResult := mrOk;
end;

constructor TfmHospFilter.Create(AOwner: TComponent; NewVersion: Variant);
begin
    inherited Create(AOwner);
    if VarIsNUll(NewVersion) or (NewVersion = False) then
        RusFIO.Visible := False;
end;

procedure TfmHospFilter.FormCreate(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self);
end;

end.
