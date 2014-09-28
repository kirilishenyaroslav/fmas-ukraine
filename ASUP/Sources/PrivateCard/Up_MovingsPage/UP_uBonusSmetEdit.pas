unit UP_uBonusSmetEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uCharControl, uFloatControl, uFControl,
  uLabeledFControl, uDateControl, uFormControl, ActnList, UP_uMovingsDataModule,
  uIntControl;

type
  TForm2 = class(TForm)
    qFFC_Smet: TqFFormControl;
    qFDC_Real_date_end: TqFDateControl;
    qFFC_Summ: TqFFloatControl;
    qFFC_Summ_PPS: TqFFloatControl;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    Ok_Action: TAction;
    Cancel_Action: TAction;
    qFDC_date_beg: TqFDateControl;
    qFIC_kod_sm: TqFIntControl;
    qFIC_kod_sm_pps: TqFIntControl;
    procedure Cancel_ActionExecute(Sender: TObject);
    procedure Ok_ActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  	Mode:TFormMode;
    constructor Create(AOwner: TComponent; DM: TdmMovings; Mode:TFormMode; where: variant);
        reintroduce;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

constructor TForm2.Create(AOwner: TComponent; DM: TdmMovings; Mode:TFormMode; where: variant);
begin
  inherited Create(AOwner);
  Self.Mode:=Mode;
  qFFC_Smet.Prepare(DM.DB, Mode, Where, Null);
end;

procedure TForm2.Cancel_ActionExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TForm2.Ok_ActionExecute(Sender: TObject);
begin
  qFFC_Smet.Ok;
end;

end.
