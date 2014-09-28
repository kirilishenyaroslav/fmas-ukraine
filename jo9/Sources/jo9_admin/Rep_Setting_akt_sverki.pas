unit Rep_Setting_akt_sverki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxTextEdit, cxMemo, cxControls, cxContainer, cxEdit,
  cxLabel, cxLookAndFeelPainters, cxButtons, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TSetPropAktForm = class(TForm)
    GroupBox1: TGroupBox;
    MemoFooter2: TcxMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    Label7: TLabel;
    MemoFooter1: TcxMemo;
    GroupBox2: TGroupBox;
    cxMemoReportHeader: TcxMemo;
    cxTypeForm: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    pkod_sys:string;
  end;

var
  SetPropAktForm: TSetPropAktForm;

implementation

{$R *.dfm}

procedure TSetPropAktForm.cxButton1Click(Sender: TObject);
begin
try
 StProc.Close;
 StProc.Transaction := Transaction;
 StProc.Transaction.StartTransaction;
 StProc.StoredProcName:='JO9_REPORTS_PRINT_CAPTION_U';
 StProc.Prepare;
 StProc.ParamByName('ID_REPORT').AsInteger   :=15;
 StProc.ParamByName('KOD_SYS').Value     :=pkod_sys;
 StProc.ParamByName('TYPE_FORM').AsString    :=cxTypeForm.Text;
 StProc.ParamByName('NAKAZ_FORM').AsString   :='';
 StProc.ParamByName('REPORT_HEADER').AsString:=cxMemoReportHeader.Text;
 StProc.ParamByName('FOOTER1').AsString      :=MemoFooter1.Text;
 StProc.ParamByName('FOOTER2').AsString      :=MemoFooter2.Text;
 StProc.ExecProc;
 StProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StProc.Transaction.Rollback;
  exit;
    end;
end;
ModalResult:=mrOk;

end;

procedure TSetPropAktForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

procedure TSetPropAktForm.FormShow(Sender: TObject);
begin
 with StProc do
  try
    Transaction.StartTransaction;
    StoredProcName:='JO9_REPORTS_PRINT_CAPTION_S';
    Prepare;
    ParamByName('ID_REPORT').AsInteger :=15;
    ParamByName('KOD_SYS').Value   :=pkod_sys;
    ExecProc;
    MemoFooter2.Text      :=ParamByName('FOOTER2').AsString;
    MemoFooter1.Text      :=ParamByName('FOOTER1').AsString;
    cxTypeForm.Text       :=ParamByName('TYPE_FORM').AsString;
    cxMemoReportHeader.Text :=ParamByName('REPORT_HEADER').AsString;
    Transaction.Commit;
  except
  end
end;

end.
