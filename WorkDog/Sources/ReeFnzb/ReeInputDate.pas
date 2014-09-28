unit ReeInputDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxGroupBox, cxCheckBox;


  resourcestring
  errNotDate = 'Виберіть дату.';
//  errNotRsch = 'Виберіть рахунок.';

type
  TfrmDateRee = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ReeDateEdit: TcxDateEdit;
    cxCheckBox1: TcxCheckBox;
    NumEdit: TcxTextEdit;
    Label1: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ReeDateEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDateRee: TfrmDateRee;

implementation

{$R *.dfm}

procedure TfrmDateRee.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDateRee.OKButtonClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfrmDateRee.FormShow(Sender: TObject);
begin
 ReeDateEdit.Date := Date;
 ReeDateEdit.SetFocus;
end;

procedure TfrmDateRee.ReeDateEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then cxButton1.SetFocus;
end;

procedure TfrmDateRee.cxButton1Click(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfrmDateRee.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmDateRee.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  NumEdit.Enabled := cxCheckBox1.Checked;
 if NumEdit.Enabled then NumEdit.Style.Color := clMoneyGreen else NumEdit.Style.Color := clSilver;
end;

end.
