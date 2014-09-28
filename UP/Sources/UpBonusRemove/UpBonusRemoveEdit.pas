unit UpBonusRemoveEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, Buttons, cxCheckBox;
type
  TfrmBonusRemoveChangeDate = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    cxDateEdit1: TcxDateEdit;
    EditForAll: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmBonusRemoveChangeDate.FormCreate(Sender: TObject);
begin
     cxDateEdit1.Date:=Date;
end;

procedure TfrmBonusRemoveChangeDate.OkButtonClick(Sender: TObject);
begin





     ModalResult:=mrYes;
end;

procedure TfrmBonusRemoveChangeDate.CancelButtonClick(Sender: TObject);
begin





     ModalResult:=mrNo;
end;

end.
