unit uCopy_param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxMaskEdit, cxButtonEdit,
  ActnList, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxCurrencyEdit, cxCheckBox, cxDropDownEdit, cn_Common_Funcs,
  cnConsts;

type
  TfrmCopy_param = class(TForm)
    koeffic: TcxCurrencyEdit;
    Ok_Button: TcxButton;
    Cancel_Button: TcxButton;
    ActionList1: TActionList;
    Nac_Text: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cancel_act: TAction;
    Ok_act: TAction;
    nac_Check: TcxCheckBox;
    round_ComboBox: TcxComboBox;
    round_summa: TcxLabel;
    procedure cancel_actExecute(Sender: TObject);
    procedure Ok_actExecute(Sender: TObject);
    procedure koefficExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NacTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure nac_CheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    PLanguageIndex  : byte;
    id_Nac:int64;
    { Public declarations }
  end;

var
  frmCopy_param: TfrmCopy_param;

implementation

Uses UGetParamValue_ex, PricesMain_ex;

{$R *.dfm}

procedure TfrmCopy_param.cancel_actExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmCopy_param.Ok_actExecute(Sender: TObject);
begin
  If ((id_Nac=-1) and (nac_Check.Checked)) then
   Begin
    ShowMEssage('Ботва!');
    exit;
   End;

  ModalResult:=mrOk;
end;

procedure TfrmCopy_param.koefficExit(Sender: TObject);
begin
  if ((koeffic.Text='')or(koeffic.EditValue<=0)) then koeffic.EditValue:=1;
end;

procedure TfrmCopy_param.FormCreate(Sender: TObject);
begin
  id_Nac:=-1;
  round_ComboBox.ItemIndex:=2;

  PLanguageIndex        := cn_Common_Funcs.cnLanguageIndex;

  Ok_Button.Caption:=cn_Accept[PLanguageIndex];
  Ok_Button.Hint:=cn_Accept[PLanguageIndex];

  Cancel_Button.Caption:=cn_cancel[PLanguageIndex];
  Cancel_Button.Hint:=cn_cancel[PLanguageIndex];
end;

procedure TfrmCopy_param.NacTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
Var
  T:TfrmGetParamValue;
begin
  T:=TfrmGetParamValue.Create(self,
                              3,
                              nil,
                              TfrmPricesMain_ex(self.Owner).WorkDatabase.Handle);
  if T.ShowModal=mrYes then
   begin
    Nac_Text.Text     :=T.ResultText;
    id_Nac            :=T.ResultId;
    koeffic.SetFocus;
   end;
  T.Free;
end;

procedure TfrmCopy_param.nac_CheckClick(Sender: TObject);
begin
  if nac_Check.Checked then Nac_Text.Enabled:=true
                       else Nac_Text.Enabled:=false;
end;

end.
