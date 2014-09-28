unit BsClientSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxCheckBox, uConsts, uCommon_Funcs;

type
  TfrmClientSum = class(TForm)
    CntClientAccount: TcxCheckBox;
    CntTenants: TcxCheckBox;
    CntLgots: TcxCheckBox;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    BIniLang:Byte;
  public
    { Public declarations }
  end;

var
  frmClientSum: TfrmClientSum;

implementation

{$R *.dfm}

procedure TfrmClientSum.btnOkClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfrmClientSum.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmClientSum.FormCreate(Sender: TObject);
begin
   BIniLang:=uCommon_Funcs.bsLanguageIndex();
   btnOk.Caption:=uConsts.bs_Accept[BIniLang];
   btnCancel.Caption:=uConsts.bs_Cancel[BIniLang];
end;

end.
