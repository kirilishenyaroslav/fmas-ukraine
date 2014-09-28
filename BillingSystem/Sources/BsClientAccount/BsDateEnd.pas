unit BsDateEnd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxLabel, uCommon_Types, uCommon_Funcs, uCommon_Messages;

type
  TfrmDateClose = class(TForm)
    lblDateEnd: TcxLabel;
    DateEnd: TcxDateEdit;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDateClose: TfrmDateClose;

implementation

{$R *.dfm}

procedure TfrmDateClose.FormCreate(Sender: TObject);
begin
   DateEnd.Date:=Date;
end;

procedure TfrmDateClose.btnOkClick(Sender: TObject);
begin
   if DateToStr(DateEnd.Date)='' then
   begin
      bsShowMessage('Увага!', 'Ви повинні обрати дату закриття!', mtInformation, [mbOK]);
      Exit;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmDateClose.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
