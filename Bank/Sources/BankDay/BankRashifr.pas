unit BankRashifr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox,
  cxControls, cxContainer, cxEdit, cxLabel, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, frxClass,
  frxDBSet, BankDayForm;

type
  TfmBankRashifr = class(TForm)
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DBDatasetRashifr: TfrxDBDataset;
    DataSetR_ID_SMETA: TFIBBCDField;
    DataSetR_ID_SCH: TFIBBCDField;
    DataSetR_ID_RAZD: TFIBBCDField;
    DataSetR_ID_STATE: TFIBBCDField;
    DataSetR_ID_KEKV: TFIBBCDField;
    DataSetR_SCH_KOD: TFIBStringField;
    DataSetR_SCH_TYTLE: TFIBStringField;
    DataSetR_NAME_PRED: TFIBStringField;
    DataSetR_OBOROT_D: TFIBBCDField;
    DataSetR_OBOROT_K: TFIBBCDField;
    DataSetR_NAME: TFIBStringField;
    DataSetR_ALL_O_D: TFIBBCDField;
    DataSetR_ALL_O_K: TFIBBCDField;
    DataSetR_LEVEL: TFIBIntegerField;
    DataSetSALDO_BEGIN: TFIBBCDField;
    DataSetSALDO_END: TFIBBCDField;
    DataSetOB_D: TFIBBCDField;
    DataSetOB_K: TFIBBCDField;
    DataSetR_IS_SPRAVKA: TFIBIntegerField;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
    cxCheckBox5: TcxCheckBox;
    ReportRashifr: TfrxReport;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    id_sp_ras : int64;
    myform : TfmBankDayForm;
    day : Tdate;
    constructor Create(AOwner: TComponent;  db : TpFIBDatabase; m: TfmBankDayForm);
  end;

{var
  TfmBankRashifr: TTfmBankRashifr; }

implementation
uses  Un_R_file_Alex, BankProgressClose,Math, GlobalSPR;

{$R *.dfm}

constructor TfmBankRashifr.Create(AOwner: TComponent;  db : TpFIBDatabase; m: TfmBankDayForm);
var
   i, j, days_ago_show : int64;
begin
    inherited Create (AOwner);
    Database                      := DB;
    myform  := m;
    Transaction.DefaultDatabase   := Database;
    Database.DefaultTransaction   := Transaction;

    DataSet.Database              := Database;
    DataSet.Transaction           := Transaction;

    Caption                       := Un_R_file_Alex.BANK_PRINT_B_RZ_ST_KEKV;


    day        := myform.DataSetDayBank['DAY_BANK'];
    id_sp_ras  := myform.DataSetDayBank['ID_SP_RAS'];

end;

procedure TfmBankRashifr.cxButton1Click(Sender: TObject);
var sm, rz, st, kekv: smallint;
begin

    if (cxCheckBox2.Checked) then sm  := 1 else sm  := -1;

    if (cxCheckBox3.Checked) then rz  := 2 else rz  := -1;

    if (cxCheckBox4.Checked) then st  := 3 else st  := -1;

    if (cxCheckBox5.Checked) then kekv  := 4 else kekv  := -1;


    DataSet.Close;
    DataSet.SQLs.SelectSQL.Text := 'select * from BANK_SELECT_OBOR_ON_DATE('+quotedstr(dateTostr(day))+', '+IntToStr(myform.id_s)+', '+IntToStr(sm)+', '+IntToStr(rz)+', '+IntToStr(st)+', '+IntToStr(kekv)+')';
    DataSet.Open;
    DataSet.FetchAll;

    ReportRashifr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_rashirf_b_r_st_kekv.fr3');

    ReportRashifr.Variables['day']         := QuotedStr(datetostr(day));
    ReportRashifr.Variables['comp']        := QuotedStr(GetComputerNetName);
    ReportRashifr.Variables['id_user']     := QuotedStr(IntToStr(myform.id_user));
    ReportRashifr.Variables['sm']          := QuotedStr(inttostr(sm));
    ReportRashifr.Variables['rz']          := QuotedStr(inttostr(rz));
    ReportRashifr.Variables['st']          := QuotedStr(inttostr(st));
    ReportRashifr.Variables['kekv']        := QuotedStr(inttostr(kekv));
    ReportRashifr.PrepareReport(true);
    ReportRashifr.ShowReport(true);
end;

procedure TfmBankRashifr.cxButton2Click(Sender: TObject);
begin
    close;
end;

end.
