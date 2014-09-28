unit KassaService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, MainFormKassa, Un_R_file_Alex;

type
  TfmKassaService = class(TForm)
    cxDateEdit1: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    myform : TfmMainForm;
  public
    constructor Create(mform : TfmMainForm); reintroduce; overload;
  end;
                       

 { TfmKassaService;}

implementation

uses DateUtils;

{$R *.dfm}

constructor TfmKassaService.Create(mform: TfmMainForm);
begin
    inherited Create(nil);
    myform                      := mform;
    Database                    := myform.Database;
    Transaction.DefaultDatabase := Database;
    StoredProc.Database         := Database;
    StoredProc.Transaction      := Transaction;
    Caption                     := Un_R_file_Alex.KASSA_PERESCHET_FORM;
    cxButton1.Caption           := Un_R_file_Alex.MY_PERESCHET;
    cxButton2.Caption           := Un_R_file_Alex.MY_OK;
    cxLabel1.Caption            := Un_R_file_Alex.KASSA_PERESCHET_SALDO_OB;

    cxDateEdit1.Date := Date;
end;

procedure TfmKassaService.cxButton1Click(Sender: TObject);
begin
    Transaction.StartTransaction;
    try
        StoredProc.StoredProcName:='KASSA_TEMP_DAY_PERESCHET';
        StoredProc.Prepare;
        StoredProc.ParamByName('D_DAY').AsDate         := IncDay(cxDateEdit1.Date, -1);
        StoredProc.ExecProc;
        Transaction.Commit;
        showmessage('Сальдо пересчиталось');
    except
        Transaction.Rollback;
        showmessage('Сальдо не пересчиталось');
    end;
end;


procedure TfmKassaService.cxButton2Click(Sender: TObject);
begin
    close;
end;

end.
