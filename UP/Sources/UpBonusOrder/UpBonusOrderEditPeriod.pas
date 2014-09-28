unit UpBonusOrderEditPeriod;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
    cxMaskEdit, cxDropDownEdit, cxCalendar, Buttons, cxCheckBox;

type
    TfrmEditPeriod = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DateBeg: TcxDateEdit;
        DateEnd: TcxDateEdit;
        Label6: TLabel;
        Label1: TLabel;
        ForAll: TcxCheckBox;
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

implementation

{$R *.dfm}

procedure TfrmEditPeriod.OkButtonClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

end.
