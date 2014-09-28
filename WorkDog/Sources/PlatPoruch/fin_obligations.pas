unit fin_obligations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, StdCtrls,
  cxButtons;

resourcestring
  errNotDate   = '¬ведите дату фин. об€зательства.';
  errNotNumber = '¬ведите номер фин. об€зательства.';

type
  TfrmFin_obl = class(TForm)
    cxButton_ok: TcxButton;
    cxButton_cancel: TcxButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cxDateEdit_fin_obl: TcxDateEdit;
    Label2: TLabel;
    cxTextEdit_number: TcxTextEdit;
    eNum_doc: TcxTextEdit;
    Label3: TLabel;
    eDatedoc: TcxDateEdit;
    Label4: TLabel;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cxDateEdit_uz_obl: TcxDateEdit;
    cxTextEdit_number_uz: TcxTextEdit;
    eNum_doc_uz: TcxTextEdit;
    eDate_doc_uz: TcxDateEdit;
    Label5: TLabel;
    cxU_number: TcxTextEdit;
    Label6: TLabel;
    cxF_number: TcxTextEdit;
    procedure cxButton_cancelClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxTextEdit_numberKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFin_obl: TfrmFin_obl;

implementation

{$R *.dfm}

procedure TfrmFin_obl.cxButton_cancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFin_obl.cxButton_okClick(Sender: TObject);
begin
{  if cxDateEdit_fin_obl.Text='' then begin
    ShowMessage(errNotDate);
    cxDateEdit_fin_obl.SetFocus;
    Exit;
  end;

  if cxTextEdit_number.Text='' then begin
    ShowMessage(errNotNumber);
    cxTextEdit_number.SetFocus;
    Exit;
  end;
}
  ModalResult := mrOk;
end;

procedure TfrmFin_obl.cxTextEdit_numberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['0'..'9'])  and (key <> #8)
  then    key := #0;
end;

procedure TfrmFin_obl.FormShow(Sender: TObject);
begin
  cxDateEdit_fin_obl.SetFocus;
end;

end.
