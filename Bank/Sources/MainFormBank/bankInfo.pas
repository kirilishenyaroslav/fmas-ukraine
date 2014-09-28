unit bankInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, jpeg;

type
  TfmBankInfo = class(TForm)
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Image1: TImage;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBankInfo: TfmBankInfo;

implementation
uses Un_R_file_Alex;

{$R *.dfm}

procedure TfmBankInfo.cxButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfmBankInfo.FormCreate(Sender: TObject);
begin
    cxLabel2.Caption := Un_R_file_Alex.BANK_INFO_SYSTEM;
    cxLabel3.Caption := Un_R_file_Alex.BANK_CLBANK_INFO_RAZRAB;
    cxLabel4.Caption := Un_R_file_Alex.BANK_INFO_VERSION;
    cxLabel1.Caption := Un_R_file_Alex.BANK_INFO_PRAVA;

end;

end.
