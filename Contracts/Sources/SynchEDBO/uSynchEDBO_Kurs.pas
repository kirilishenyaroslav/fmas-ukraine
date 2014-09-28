unit uSynchEDBO_Kurs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, cxMaskEdit, cxButtonEdit,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  cn_Common_Types, cn_Common_Loader;

type
  TfrmSynchEDBO_kurs = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxLabel1: TcxLabel;
    TextEdit_kurs_edbo: TcxTextEdit;
    cxLabel2: TcxLabel;
    TextEdit_kurs: TcxTextEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frmSynchEDBO_kurs: TfrmSynchEDBO_kurs;

implementation

{$R *.dfm}

procedure TfrmSynchEDBO_kurs.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSynchEDBO_kurs.OkButtonClick(Sender: TObject);
begin
  If TextEdit_kurs.Text = '' then
   begin
     ShowMessage('Необхідно ввести курс навчання!');
     Exit;
   end;

  ModalResult := mrOk;
end;

procedure TfrmSynchEDBO_kurs.FormShow(Sender: TObject);
begin
  TextEdit_kurs.SetFocus;
end;

end.
