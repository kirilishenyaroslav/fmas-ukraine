unit _uInvalidGroupEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  T_frmGroupEdit = class(TForm)
    InvEdit: TEdit;
    Label1: TLabel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _frmGroupEdit: T_frmGroupEdit;

implementation

uses _uInvalidGroup;

{$R *.dfm}

procedure T_frmGroupEdit.BtnOkClick(Sender: TObject);
begin
    ModalResult:=mrOk;
end;

procedure T_frmGroupEdit.BtnCancelClick(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

end.
