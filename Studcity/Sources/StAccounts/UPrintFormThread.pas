unit UPrintFormThread;

interface

uses
  Classes, Forms, SysUtils, Variants, Windows;

type
  TPrintFormThread = class(TThread)
  private
    { Private declarations }
    Form:TForm;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean; Form:TForm);overload;
  end;

implementation

uses UMainAccounts, UDocPrinting;

constructor TPrintFormThread.Create(CreateSuspended: Boolean; Form: TForm);
begin
     inherited Create(true);
     self.Form:=Form;
end;

procedure TPrintFormThread.Execute;
begin
       if TfrmDocPrinting(Form).PrintDataSet.Active then TfrmDocPrinting(Form).PrintDataSet.Close;

       if(TfrmDocPrinting(Form).Id_Report=1)
       then begin
               TfrmDocPrinting(Form).PrintDataSet.SelectSQL.Text:='SELECT * FROM ST_ACCOUNTS_PRINT('+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('ID_ACCOUNT').AsString+','+
                                             TfrmDocPrinting(Form).FIXED_ID_SM+','+
                                             TfrmDocPrinting(Form).FIXED_ID_RZ+','+
                                             TfrmDocPrinting(Form).FIXED_ID_ST+','+
                                             TfrmDocPrinting(Form).FIXED_ID_KEKV+','+
                                             TfrmDocPrinting(Form).FIXED_TYPE_CALC+','+
                                             TfrmDocPrinting(Form).FIXED_TYPE_STUD+')';

               TfrmDocPrinting(Form).PrintDataSet.Open;
               TfrmDocPrinting(Form).PrintDataSet.FetchAll;
               TfrmDocPrinting(Form).frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\st_account_doc_report.fr3',true);

               TfrmDocPrinting(Form).frxReport1.Variables.Clear;
               TfrmDocPrinting(Form).frxReport1.Variables[' '+'User Category']:=NULL;
               TfrmDocPrinting(Form).frxReport1.Variables.AddVariable('User Category','DN',''''+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('NUM_SCH').AsString+'''');
               TfrmDocPrinting(Form).frxReport1.Variables.AddVariable('User Category','DATE_BEG',''''+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('DATE_BEG').AsString+'''');
               TfrmDocPrinting(Form).frxReport1.Variables.AddVariable('User Category','DATE_END',''''+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('DATE_END').AsString+'''');
      end;

      if(TfrmDocPrinting(Form).Id_Report=2)
      then begin
               TfrmDocPrinting(Form).PrintDataSet.SelectSQL.Text:='SELECT * FROM ST_ACCOUNTS_GET_OBOR_VED_DATA('+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('ID_ACCOUNT').AsString+','+
                                             TfrmDocPrinting(Form).FIXED_ID_SM+','+
                                             TfrmDocPrinting(Form).FIXED_ID_RZ+','+
                                             TfrmDocPrinting(Form).FIXED_ID_ST+','+
                                             TfrmDocPrinting(Form).FIXED_ID_KEKV+','+
                                             TfrmDocPrinting(Form).FIXED_TYPE_CALC+','+
                                             TfrmDocPrinting(Form).FIXED_TYPE_STUD+') ORDER BY BUILD_TEXT, FAK_TEXT ';

               TfrmDocPrinting(Form).PrintDataSet.Open;
               TfrmDocPrinting(Form).PrintDataSet.FetchAll;
               TfrmDocPrinting(Form).frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\st_accounts_obor_ved.fr3',true);

               TfrmDocPrinting(Form).frxReport1.Variables.Clear;
               TfrmDocPrinting(Form).frxReport1.Variables[' '+'User Category']:=NULL;
               TfrmDocPrinting(Form).frxReport1.Variables.AddVariable('User Category','DATE_BEG',''''+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('DATE_BEG').AsString+'''');
               TfrmDocPrinting(Form).frxReport1.Variables.AddVariable('User Category','DATE_END',''''+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('DATE_END').AsString+'''');
      end;

      if(TfrmDocPrinting(Form).Id_Report=3)
      then begin
               TfrmDocPrinting(Form).PrintDataSet.SelectSQL.Text:=' SELECT ID_SM, BUDGETS, SUM(IN_DOLG_SUMMA)  AS IN_DOLG_SUMMA ,'+
                                                                  '                        SUM(IN_PERE_SUMMA)  AS IN_PERE_SUMMA ,'+
                                                                  '                        SUM(IN_SALDO)       AS IN_SALDO,      '+
                                                                  '                        SUM(CUR_NACH)       AS CUR_NACH,      '+
                                                                  '                        SUM(CUR_PAY)        AS CUR_PAY,       '+
                                                                  '                        SUM(CUR_REST)       AS CUR_REST,      '+
                                                                  '                        SUM(OUT_DOLG_SUMMA) AS OUT_DOLG_SUMMA,'+
                                                                  '                        SUM(OUT_PERE_SUMMA) AS OUT_PERE_SUMMA,'+
                                                                  '                        SUM(OUT_SALDO)      AS OUT_SALDO      '+
                                                                  '   FROM ST_ACCOUNTS_GET_SVOD_VED_DATA_A('+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('ID_ACCOUNT').AsString+','+
                                                                  {TfrmDocPrinting(Form).FIXED_ID_SM+}    '-1,'+
                                                                  {TfrmDocPrinting(Form).FIXED_ID_RZ+}    '-1,'+
                                                                  {TfrmDocPrinting(Form).FIXED_ID_ST+}    '-1,'+
                                                                  {TfrmDocPrinting(Form).FIXED_ID_KEKV+}  '-1,'+
                                                                  {TfrmDocPrinting(Form).FIXED_TYPE_CALC+}'-1,'+
                                                                  TfrmDocPrinting(Form).FIXED_TYPE_STUD+') '+
                                                                  '  GROUP BY ID_SM, BUDGETS '+
                                                                  '  ORDER BY ID_SM, BUDGETS ';

               TfrmDocPrinting(Form).PrintDataSet.Open;
               TfrmDocPrinting(Form).PrintDataSet.FetchAll;
               TfrmDocPrinting(Form).frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\st_account_svod_report.fr3',true);

               TfrmDocPrinting(Form).frxReport1.Variables.Clear;
               TfrmDocPrinting(Form).frxReport1.Variables[' '+'User Category']:=NULL;
               TfrmDocPrinting(Form).frxReport1.Variables.AddVariable('User Category','DATE_BEG',''''+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('DATE_BEG').AsString+'''');
               TfrmDocPrinting(Form).frxReport1.Variables.AddVariable('User Category','DATE_END',''''+TfrmAccountMain(Form.Owner).AccDataSet.FieldByName('DATE_END').AsString+'''');
      end;

      TfrmDocPrinting(Form).frxReport1.PrepareReport(true);

end;

end.
