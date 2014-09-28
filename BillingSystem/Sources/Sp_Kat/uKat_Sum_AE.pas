unit uKat_Sum_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCurrencyEdit, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxControls,
  cxGroupBox, cxButtons, uConsts;

type
  TfrmKat_sum_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit_Date_beg: TcxDateEdit;
    DateEdit_Date_end: TcxDateEdit;
    CurrencyEdit_Summa: TcxCurrencyEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Use_end : TDate;
    PLanguageIndex : byte;
  end;

var
  frmKat_sum_AE: TfrmKat_sum_AE;

implementation

{$R *.dfm}

procedure TfrmKat_sum_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmKat_sum_AE.OkButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmKat_sum_AE.FormShow(Sender: TObject);
var
  Year, month, day : Word;
begin
  OkButton.Caption     := uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption := uConsts.bs_Cancel[PLanguageIndex];
  NameLabel.Caption    := uConsts.bs_Date_Beg_Label[PLanguageIndex];
  Label1.Caption       := uConsts.bs_Date_End_Label[PLanguageIndex];
  Label2.Caption       := uConsts.bs_Summa_Column[PLanguageIndex];

  DecodeDate(Now, Year, Month, Day);

  DateEdit_Date_beg.EditValue := EncodeDate(Year,month,1);
  //DateEdit_Date_end.EditValue := EncodeDate(Year,month+1,1)-1;
  DateEdit_Date_end.EditValue := Use_end;
end;

end.
