unit uDate_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLabel, cn_Common_Funcs;

type
  TfrmDate_AE = class(TForm)
    Date_beg_Edit: TcxDateEdit;
    Date_End_Edit: TcxDateEdit;
    Date_Pay_Edit: TcxDateEdit;
    OK_Button: TcxButton;
    Cancel_Button: TcxButton;
    Date_Beg_Label: TcxLabel;
    Date_End_Label: TcxLabel;
    Date_Pay_Label: TcxLabel;
    procedure Cancel_ButtonClick(Sender: TObject);
    procedure OK_ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDate_AE: TfrmDate_AE;

implementation

{$R *.dfm}


procedure TfrmDate_AE.Cancel_ButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDate_AE.OK_ButtonClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmDate_AE.FormCreate(Sender: TObject);
begin
  Date_Beg_Edit.EditValue:=cn_Common_Funcs.AcademicYear(now).Date_Beg;
  Date_End_Edit.EditValue:=cn_Common_Funcs.AcademicYear(now).Date_End;
  Date_Pay_Edit.EditValue:=cn_Common_Funcs.AcademicYear(now).Date_End;
end;

end.
