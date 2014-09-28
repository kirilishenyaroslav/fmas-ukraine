unit UReestr_filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxCheckBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TfrmReestr_filter = class(TForm)
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxCheckBox4PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestr_filter: TfrmReestr_filter;

implementation

{$R *.dfm}

procedure TfrmReestr_filter.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  if not cxCheckBox1.Checked then
   if not cxCheckBox2.Checked then cxCheckBox2.Checked := True;
end;

procedure TfrmReestr_filter.cxCheckBox2PropertiesChange(Sender: TObject);
begin
  if not cxCheckBox2.Checked then
   if not cxCheckBox1.Checked then cxCheckBox1.Checked := True;
end;

procedure TfrmReestr_filter.cxCheckBox3PropertiesChange(Sender: TObject);
begin
  if not cxCheckBox3.Checked then
   if not cxCheckBox4.Checked then cxCheckBox4.Checked := True;
end;

procedure TfrmReestr_filter.cxCheckBox4PropertiesChange(Sender: TObject);
begin
  if not cxCheckBox4.Checked then
   if not cxCheckBox3.Checked then cxCheckBox3.Checked := True;
end;

procedure TfrmReestr_filter.FormCreate(Sender: TObject);
var
  year,month,day : Word;
begin
  DecodeDate(Now,year,month,day);
  cxDateEdit1.EditValue:=EncodeDate(year,month,1);
  cxDateEdit2.EditValue:=EncodeDate(year,month+1,1)-1;
end;

procedure TfrmReestr_filter.cxButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmReestr_filter.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;


end.
