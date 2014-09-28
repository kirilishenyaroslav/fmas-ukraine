unit uLgot_Sum_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxGroupBox,
  cxButtons, cxCurrencyEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, uConsts;

type
  TfrmLgot_Sum_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    DateEdit_Date_beg: TcxDateEdit;
    CurrencyEdit_Procent: TcxCurrencyEdit;
    Label2: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    PLanguageIndex : byte;
  end;

var
  frmLgot_Sum_AE: TfrmLgot_Sum_AE;

implementation

{$R *.dfm}

procedure TfrmLgot_Sum_AE.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLgot_Sum_AE.OkButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmLgot_Sum_AE.FormShow(Sender: TObject);
var
  Year, month, day : Word;
begin
  OkButton.Caption     := uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption := uConsts.bs_Cancel[PLanguageIndex];
  NameLabel.Caption    := uConsts.bs_Date_Beg_Label[PLanguageIndex];
  Label2.Caption       := uConsts.bs_Persent_Column[PLanguageIndex];

  DecodeDate(Now, Year, Month, Day);

  DateEdit_Date_beg.EditValue := EncodeDate(Year,month,1);
end;

end.
