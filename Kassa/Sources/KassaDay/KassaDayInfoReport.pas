unit KassaDayInfoReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxControls, cxContainer, cxEdit, cxLabel, KassaDayForm;

type
  TfmKassaDayInfoReport = class(TForm)
    Database: TpFIBDatabase;
    DataSetInfo: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
  private
    myform : TfmKassaDayForm;
    day, id_sp_kass : string;
   public
    constructor Create(mform : TfmKassaDayForm); reintroduce; overload;
  end;

//var
  //fmKassaDayInfoReport: TfmKassaDayInfoReport;

implementation

uses Un_R_file_Alex;

{$R *.dfm}

constructor TfmKassaDayInfoReport.Create(mform: TfmKassaDayForm);
begin
    inherited Create(nil);
    myform := mform;

    Database := myform.Database;
    Transaction.DefaultDatabase := Database;

    DataSetInfo.Database    := Database;
    DataSetInfo.Transaction := Transaction;

    day        := myform.DataSetDay.FieldByName('DAY_KASSA').AsString;
    id_sp_kass := myform.DataSetDay.FieldByName('ID_SP_KASS').AsString;

    Caption    := Un_R_file_Alex.KASSA_PRINT_COM_OTCHET_CAPTION+day;

    DataSetInfo.Close;
    DataSetInfo.SQLs.SelectSQL.Text := 'select * from KASSA_GET_OTCHET_INFO(''' + day +''', '''+id_sp_kass+''')';
    DataSetInfo.Open;

    try cxLabel1.Caption := DataSetInfo.FieldByName('PARAM_PRINT').AsString  except cxLabel1.Caption := ''; end;
    try cxLabel2.Caption := DataSetInfo.FieldByName('PARAM_PRINT_VAR2').AsString  except cxLabel2.Caption := ''; end;
    try cxLabel3.Caption := DataSetInfo.FieldByName('PARAM_PRINT_KAS_BOOK').AsString  except cxLabel2.Caption := ''; end;
end;


end.
