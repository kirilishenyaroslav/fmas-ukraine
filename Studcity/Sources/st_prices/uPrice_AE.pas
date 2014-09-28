unit uPrice_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit,
  cxCalendar, st_common_funcs, cxCheckBox;

type
  TfrmPrice_AE = class(TForm)
    Label_name_price: TcxLabel;
    Edit_price_name: TcxTextEdit;
    DateEdit_date_beg: TcxDateEdit;
    DateEdit_date_end: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    CheckBox_deleted: TcxCheckBox;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrice_AE: TfrmPrice_AE;

implementation

{$R *.dfm}

procedure TfrmPrice_AE.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmPrice_AE.cxButton1Click(Sender: TObject);
begin
  If Edit_price_name.Text = '' then
   Begin
    ShowMessage('Необхідно заповнити найменування!!!');
    exit;
   end;

  If DateEdit_date_beg.Date >= DateEdit_date_end.Date then
   Begin
    ShowMessage('Дата початку повинна буди менши дати закінчення!!!');
    exit;
   end;

  ModalResult := mrOk;
end;

procedure TfrmPrice_AE.FormCreate(Sender: TObject);
begin
  DateEdit_date_beg.Date := AcademicYear(Now).Date_Beg;
  DateEdit_date_end.Date := AcademicYear(Now).Date_end;
end;

end.
