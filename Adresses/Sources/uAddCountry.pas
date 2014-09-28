unit uAddCountry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uCharControl, uFormControl,
  StdCtrls, Buttons, uAdr_DataModule, uAddModifForm;

type
  TAdd_Country_Form = class(TAddModifForm)
    qFFC_Country: TqFFormControl;
    qFCC_Name: TqFCharControl;
    CancelButton: TBitBtn;
    OkButton: TBitBtn;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    Mode:TFormMode;
    constructor Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
    { Public declarations }
  end;

var
  Add_Country_Form: TAdd_Country_Form;

implementation

uses uUnivSprav, RxMemDS;

{$R *.dfm}

constructor TAdd_Country_Form.Create(AOwner: TComponent ; DMod: TAdrDM; Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
	Self.Mode := Mode;
  qFFC_Country.Prepare(DMod.pFIBDB_Adr,Mode,Where,Null);
end;

procedure TAdd_Country_Form.OkButtonClick(Sender: TObject);
begin
  qFFC_Country.Ok;
end;

procedure TAdd_Country_Form.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

initialization
    RegisterClass(TAdd_Country_Form);

end.
