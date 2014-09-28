unit Bank_service;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BankMainForm, cxControls, cxGroupBox, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxContainer, cxEdit, cxLabel, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, cxCheckBox;

type
  TfmBankService = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxButton1: TcxButton;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    cxDateEdit2: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxCheckBox1: TcxCheckBox;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    myform : TfmBankMainForm;
  public
    constructor Create(mform : TfmBankMainForm); reintroduce; overload;
  end;

implementation

uses DateUtils;

{$R *.dfm}

{ TfmBankService }

constructor TfmBankService.Create(mform: TfmBankMainForm);
begin
    inherited Create(nil);
    myform                      := mform;
    Database                    := myform.Database;
    Transaction.DefaultDatabase := Database;
    StoredProc.Database         := Database;
    StoredProc.Transaction      := Transaction;

end;

procedure TfmBankService.cxButton1Click(Sender: TObject);
begin
    Transaction.StartTransaction;
    try
        StoredProc.StoredProcName:='BANK_IMPORT_FROM_ALL_PROV';
        StoredProc.Prepare;
        StoredProc.ParamByName('DATE_BEGIN').AsDateTime  := cxDateEdit1.Date;
        StoredProc.ParamByName('DATE_END').AsDateTime    := cxDateEdit2.Date;
        try StoredProc.ParamByName('D_ID_RAS').AsInt64 := StrToInt64(cxTextEdit1.Text) except StoredProc.ParamByName('D_ID_RAS').AsInt64 := 0 end;
        if cxCheckBox1.Checked
            then StoredProc.ParamByName('D_FLAG_ONE_RAS').AsInteger := 1
            else StoredProc.ParamByName('D_FLAG_ONE_RAS').AsInteger := 0;
        StoredProc.ExecProc;

        if cxCheckBox1.Checked
        then begin
                StoredProc.StoredProcName:='BANK_PERESCHET_SALDO';
                StoredProc.Prepare;
                try StoredProc.ParamByName('D_ID_RAS').AsInt64 := StrToInt64(cxTextEdit1.Text) except StoredProc.ParamByName('D_ID_RAS').AsInt64 := 0 end;
                StoredProc.ParamByName('D_DAY').AsDate         := IncDay(cxDateEdit1.Date, -1);
                StoredProc.ExecProc;
        end;
        Transaction.Commit;
        showmessage('Сальдо пересчиталось');
    except
        Transaction.Rollback;
        showmessage('Сальдо не пересчиталось');
    end;
end;

procedure TfmBankService.cxButton2Click(Sender: TObject);
begin
    close;
end;

end.
