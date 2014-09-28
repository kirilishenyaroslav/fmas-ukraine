unit uMeter_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxCurrencyEdit, cxGroupBox, uCommon_Messages;

type
  TfrmMeter_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    DateSet: TcxDateEdit;
    Label_meter_date: TcxLabel;
    Label_meter: TcxLabel;
    Label_ADJUSTMENT_VOLUME: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    Button_ok: TcxButton;
    Button_Cancel: TcxButton;
    MeterBeg: TcxCurrencyEdit;
    AdjustVolume: TcxCurrencyEdit;
    procedure Button_CancelClick(Sender: TObject);
    procedure Button_okClick(Sender: TObject);
    procedure MeterBegKeyPress(Sender: TObject; var Key: Char);
    procedure AdjustVolumeKeyPress(Sender: TObject; var Key: Char);
  private

  public
    Last_date : TDate;
  end;

var
  frmMeter_AE: TfrmMeter_AE;

implementation

{$R *.dfm}

procedure TfrmMeter_AE.Button_CancelClick(Sender: TObject);
begin
 close;
end;

procedure TfrmMeter_AE.Button_okClick(Sender: TObject);
begin
  if DateSet.Text = '' then
  Begin
     bsShowMessage(Application.Title,'Необхідно ввести дату!', mtInformation, [mbOK]);
     DateSet.SetFocus;
     Exit;
  end;

  if MeterBeg.Text = '' then
  Begin
    bsShowMessage(Application.Title,'Необхідно ввести показання!', mtInformation, [mbOK]);
    MeterBeg.SetFocus;
    Exit;
  end;

  if AdjustVolume.Text = '' then
  Begin
    bsShowMessage(Application.Title,'Необхідно ввести корегующий об''єм!', mtInformation, [mbOK]);
    AdjustVolume.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmMeter_AE.MeterBegKeyPress(Sender: TObject; var Key: Char);
begin
   if ((Key in ['0'..'9']) or (Key=#8)) then MeterBeg.Properties.ReadOnly:=False
   else MeterBeg.Properties.ReadOnly:=True;
end;

procedure TfrmMeter_AE.AdjustVolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ((Key in ['0'..'9']) or (Key=#8)) then MeterBeg.Properties.ReadOnly:=False
   else MeterBeg.Properties.ReadOnly:=True;
end;

end.
