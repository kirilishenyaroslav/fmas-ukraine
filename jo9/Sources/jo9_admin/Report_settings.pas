unit Report_settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, cxTextEdit, cxLabel, cxControls, cxContainer, cxEdit,
  cxRadioGroup, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, ibase;

type
  TReport_Settings_Form = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    TextEditTypeForm: TcxTextEdit;
    MemoNakazForm: TcxMemo;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    TextEditHeader: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    MemoFooter1: TcxMemo;
    MemoFooter2: TcxMemo;
    cxLabel11: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Panel1: TPanel;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    pid_report:integer;
    pkod_sys:string;
  public
    constructor Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE;id_report:integer;kod_sys:string);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TReport_Settings_Form.Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE;id_report:integer;kod_sys:string);
begin
 inherited Create(AOwner);
 DB.Handle := ADb_Handle;
 pid_report:=id_report;
 pkod_sys:=kod_sys;
end;


procedure TReport_Settings_Form.FormShow(Sender: TObject);
begin
  with StProc do
  try
    Transaction.StartTransaction;
    StoredProcName:='JO9_REPORTS_PRINT_CAPTION_S';
    Prepare;
    ParamByName('ID_REPORT').AsInteger :=pid_report;
    ParamByName('KOD_SYS').Value   :=pkod_sys;
    ExecProc;
    TextEditTypeForm.Text :=ParamByName('TYPE_FORM').AsString;
    MemoNakazForm.Text    :=ParamByName('NAKAZ_FORM').AsString;
    TextEditHeader.Text   :=ParamByName('REPORT_HEADER').AsString;
    MemoFooter1.Text      :=ParamByName('FOOTER1').AsString;
    MemoFooter2.Text      :=ParamByName('FOOTER2').AsString;
    Transaction.Commit;
  except
  end
end;

procedure TReport_Settings_Form.cxButton1Click(Sender: TObject);
begin
  with StProc do
  try
    Transaction.StartTransaction;
    StoredProcName:='JO9_REPORTS_PRINT_CAPTION_U';
    Prepare;
    ParamByName('ID_REPORT').AsInteger   :=pid_report;
    ParamByName('KOD_SYS').Value     :=pkod_sys;
    ParamByName('TYPE_FORM').AsString    :=TextEditTypeForm.Text;
    ParamByName('NAKAZ_FORM').AsString   :=MemoNakazForm.Text;
    ParamByName('REPORT_HEADER').AsString:=TextEditHeader.Text;
    ParamByName('FOOTER1').AsString      :=MemoFooter1.Text;
    ParamByName('FOOTER2').AsString      :=MemoFooter2.Text;
    ExecProc;
    Transaction.Commit;
    ModalResult:=mrOk;
  except
  end
end;

end.
