unit USpAbsGroupEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, CheckEditUnit, cxControls, cxContainer,
  cxEdit, cxCheckBox;

type
  TfrmGetAbsGroupName = class(TForm)
    Label5: TLabel;
    CE_Name: TCheckEdit;
    SbOk: TBitBtn;
    SbCancel: TBitBtn;
    cxchckbxIS_ABSORBING: TcxCheckBox;
    procedure SbOkClick(Sender: TObject);
    procedure SbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmGetAbsGroupName.SbOkClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmGetAbsGroupName.SbCancelClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
