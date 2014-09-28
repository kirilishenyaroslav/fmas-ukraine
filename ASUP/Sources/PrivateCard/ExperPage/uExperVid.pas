unit uExperVid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAddModifForm, SpFormUnit, StdCtrls, Mask, CheckEditUnit,
  FieldControl, ExtCtrls, Buttons, ActnList, uFormControl, uExperDataModule;

type
  TExperVid = class(TAddModifForm)
    Panel1: TPanel;
    FC_NewName: TFieldControl;
    Label_Post: TLabel;
    CheckEdit_NewName: TCheckEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    qFFC_Staj: TqFFormControl;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Mode:TFormMode;
    constructor Create(AOwner: TComponent ; DMod: TdmExper; Mode: TFormMode; Where: Variant);

  end;

var
  ExperVid: TExperVid;

implementation

{$R *.dfm}

procedure TExperVid.btnOkClick(Sender: TObject);
begin
  qFFC_Staj.Ok;
end;

procedure TExperVid.btnCancelClick(Sender: TObject);
begin
  Close;
end;

constructor TExperVid.Create(AOwner: TComponent; DMod: TdmExper;
  Mode: TFormMode; Where: Variant);
begin
  inherited Create(AOwner);
	Self.Mode := Mode;
  qFFC_Staj.Prepare(DMod.VidStajDataSet,Mode,Where,Null);
end;

initialization
    RegisterClass(TExperVid);

end.
