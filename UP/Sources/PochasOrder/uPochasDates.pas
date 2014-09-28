unit uPochasDates;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLabel, StdCtrls, Buttons, cxControls, cxContainer, cxEdit,
    cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
    TfrmPochasDates = class(TForm)
        DateBegEdit: TcxDateEdit;
        DateEndEdit: TcxDateEdit;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        cxLabel1: TcxLabel;
        cxLabel2: TcxLabel;
        procedure btnCancelClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmPochasDates: TfrmPochasDates;

implementation

{$R *.dfm}

procedure TfrmPochasDates.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmPochasDates.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmPochasDates.FormCreate(Sender: TObject);
var
    y, m, d: word;
begin
    DecodeDate(now, y, m, d);
    DateBegEdit.Date := EncodeDate(y, m, 1);
    DateEndEdit.Date := EncodeDate(y, m + 1, 1) - 1;
end;

procedure TfrmPochasDates.FormShow(Sender: TObject);
begin
    DateBegEdit.SetFocus;
end;

end.
