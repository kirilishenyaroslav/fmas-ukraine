unit ReeFilterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxCheckBox,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TfrmReeFilter = class(TForm)
    cbNumRee: TcxCheckBox;
    NumReeEdit: TcxTextEdit;
    cbSumRee: TcxCheckBox;
    SumReeEdit: TcxTextEdit;
    OKButton: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cbDate: TcxCheckBox;
    DateEdit: TcxDateEdit;
    cbNumDoc: TcxCheckBox;
    NumDocEdit: TcxTextEdit;
    procedure cbNumReeClick(Sender: TObject);
    procedure cbSumReeClick(Sender: TObject);
    procedure cbDateClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure NumReeEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SumReeEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NumDocEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbNumDocClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReeFilter: TfrmReeFilter;

implementation

{$R *.dfm}

procedure TfrmReeFilter.cbNumReeClick(Sender: TObject);
begin
 NumReeEdit.Enabled := cbNumRee.Checked;
 if NumReeEdit.Enabled then NumReeEdit.SetFocus;
end;

procedure TfrmReeFilter.cbSumReeClick(Sender: TObject);
begin
 SumReeEdit.Enabled := cbSumRee.Checked;
 if SumReeEdit.Enabled then SumReeEdit.SetFocus;
end;

procedure TfrmReeFilter.cbDateClick(Sender: TObject);
begin
 DateEdit.Enabled := cbDate.Checked;
 if DateEdit.Enabled then DateEdit.SetFocus;
end;

procedure TfrmReeFilter.cbNumDocClick(Sender: TObject);
begin
 NumDocEdit.Enabled := cbNumDoc.Checked;
 if NumDocEdit.Enabled then NumDocEdit.SetFocus;
end;

procedure TfrmReeFilter.OKButtonClick(Sender: TObject);
var
 i : integer;
 f : currency;
begin
  if (cbNumRee.Checked) then
  begin
    try
      i := StrToInt(NumReeEdit.Text);
    except
      showmessage('Номер реєстру повинен бути числом.');
      exit;
    end;
  end;

  if(cbSumRee.Checked) then
  begin
    try
      f := StrToFloat(SumReeEdit.Text);
    except
      showmessage('Сума реєстру повинна бути числом.');
      exit;
    end;
  end;

  if(cbNumDoc.Checked) then
  begin
    try
      f := StrToFloat(NumDocEdit.Text);
    except
      showmessage('Номер платіжного доручення повинен бути числом.');
      exit;
    end;
  end;

 ModalResult := mrOk;
end;

procedure TfrmReeFilter.cxButton2Click(Sender: TObject);
begin
  cbNumRee.Checked := false;
  cbSumRee.Checked := false;
  cbDate.Checked   := false;
  cbNumDoc.Checked := false;
  ModalResult := mrOk;

end;

procedure TfrmReeFilter.cxButton3Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmReeFilter.NumReeEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
 end;
end;

procedure TfrmReeFilter.SumReeEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
 end;
end;

procedure TfrmReeFilter.DateEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
 end;
end;

procedure TfrmReeFilter.NumDocEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then begin
  Key := 0;
  OKButton.SetFocus;
 end;
end;

end.
