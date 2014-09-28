unit f1df_export;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Halcn6db, ComCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxTextEdit,ZMessages,
  cxMaskEdit, cxButtonEdit, FIBQuery, pFIBQuery, pFIBStoredProc,
  unit_zGlobal_Consts, zProc;

  function ExportToDBF(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          Id1Df:Integer):Variant;stdcall;

type
  TBankExportForm = class(TForm)
    ResultDataset: TpFIBDataSet;
    DbfExport: THalcyonDataSet;
    NewDbfTableCreate: TCreateHalcyonDataSet;
    SaveDialog: TSaveDialog;
    FileNameEdit: TcxButtonEdit;
    StProc: TpFIBStoredProc;
    DefaultTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StartBtn: TcxButton;
    ProgressBar: TcxProgressBar;
    procedure StartBtnClick(Sender: TObject);
    procedure FileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PYear:integer;
    PKvartal:Integer;
    PDB_Handle:TISC_DB_HANDLE;
    pOkpo:string;
    pId1Df:Integer;
    PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;Id1Df:Integer);reintroduce;
  end;


implementation

function ExportToDBF(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          Id1Df:Integer):Variant;
var
  form:TBankExportForm;
begin

  form:=TBankExportForm.Create(AOwner,DB_HANDLE,Id1Df);
  form.ShowModal;
  form.Free;
end;

Constructor TBankExportForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;Id1Df:Integer);
begin
  inherited Create(AOwner);
  PLanguageIndex := LanguageIndex;
  ResultDataset.SQLs.SelectSQL.Text := 'SELECT * FROM Z_1DF_REPORT_S('+IntToStr(Id1Df)+') order by tin_pasport,kod_1df';
  PDB_Handle:=DB_HANDLE;
  pId1Df := Id1Df;
  Caption := ExportBtn_Caption[PLanguageIndex];
  StartBtn.Caption := ExportBtn_Caption[PLanguageIndex];
end;

{$R *.dfm}

procedure TBankExportForm.StartBtnClick(Sender: TObject);
var
  TotalRecord:Integer;
  i:integer;
  S_Nar,S_Dox,S_TaxN,S_TaxP:Double;
begin
if ( FileNameEdit.Text<>'') then
    begin


    ResultDataSet.Open;
    ResultDataset.Last;
    Totalrecord:=ResultDataSet.RecordCount;
    ResultDataset.First;

    ProgressBar.Properties.Max:=TotalRecord+3;

    if (NewDbfTableCreate.Execute) then
    begin
        DbfExport.Exclusive:=True;
        DbfExport.Open;
    end
        else
        begin
            ZShowMessage(Error_Caption[PLanguageIndex],EFileCanNotCreate_Caption[PLanguageIndex],mtError,[mbOk]);
            Exit;
        end;

      while(not DbfExport.Eof)
      do
        begin
          DbfExport.Delete;
          DbfExport.Next;
        end;



    DbfExport.Close;
    DbfExport.Exclusive:=False;
    DbfExport.Open;

    i:=1;
    S_Nar := 0;
    S_Dox := 0;
    S_TaxN:= 0;
    S_TaxP:= 0;
    While not(ResultDataSet.Eof)
    do
      begin
        DbfExport.Append;

        DbfExport['NP']:=i;
        DbfExport['PERIOD']:=PKvartal;
        DbfExport['RIK']:=PYear;
        DbfExport['KOD']:=pOkpo;
        DbfExport['TYP']:=0;
        DbfExport['TIN']:=ResultDataset['TIN_PASPORT'];
        DbfExport['S_NAR']:=ResultDataset['SUM_NAR'];
        DbfExport['S_DOX']:=ResultDataset['SUM_VIPL'];
        DbfExport['S_TAXN']:=ResultDataset['SUM_UD'];
        DbfExport['S_TAXP']:=ResultDataset['SUM_PERER'];
        DbfExport['OZN_DOX']:=ResultDataset['KOD_1DF'];
        DbfExport['D_PRIYN']:=ResultDataset['DATE_CAME'];
        DbfExport['D_ZVILN']:=ResultDataset['DATE_LEAVE'];
        DbfExport['OZN_PILG']:=ResultDataset['KOD_PRIV'];
        DbfExport['OZNAKA']:=ifThen(VarIsNULL(ResultDataset['IS_ADD']) or (ResultDataset['IS_ADD']='T'),0,1);

        S_Nar := S_Nar + ResultDataset['SUM_NAR'];
        S_Dox := S_Dox + ResultDataset['SUM_VIPL'];
        S_TaxN:= S_TaxN+ ResultDataset['SUM_UD'];
        S_TaxP:= S_TaxP+ ResultDataset['SUM_PERER'];
        inc(i);

        DbfExport.Post;
        ResultDataSet.Next;
        ProgressBar.Position:=ProgressBar.Position+1;
        Application.ProcessMessages;


      end;

        DbfExport.Append;

        DbfExport['NP']:=99991;
        DbfExport['PERIOD']:=PKvartal;
        DbfExport['RIK']:=PYear;
        DbfExport['KOD']:=pOkpo;
        DbfExport['TYP']:=0;
        DbfExport['TIN']:=StProc.ParamByName('TIN_DIRECTOR').asVariant;
        DbfExport['S_NAR']:=NULL;
        DbfExport['S_DOX']:=StProc.ParamByName('TEL_DIRECTOR').asVariant;
        DbfExport['S_TAXN']:=NULL;
        DbfExport['S_TAXP']:=NULL;
        DbfExport['OZN_DOX']:=NULL;
        DbfExport['D_PRIYN']:=NULL;
        DbfExport['D_ZVILN']:=NULL;
        DbfExport['OZN_PILG']:=NULL;
        DbfExport['OZNAKA']:=NULL;

        DbfExport.Post;
        ProgressBar.Position:=ProgressBar.Position+1;
        Application.ProcessMessages;

        DbfExport.Append;

        DbfExport['NP']:=99992;
        DbfExport['PERIOD']:=PKvartal;
        DbfExport['RIK']:=PYear;
        DbfExport['KOD']:=pOkpo;
        DbfExport['TYP']:=0;
        DbfExport['TIN']:=StProc.ParamByName('TIN_GLAVBUHG').asVariant;
        DbfExport['S_NAR']:=NULL;
        DbfExport['S_DOX']:=StProc.ParamByName('TEL_GLAVBUHG').asVariant;
        DbfExport['S_TAXN']:=NULL;
        DbfExport['S_TAXP']:=NULL;
        DbfExport['OZN_DOX']:=NULL;
        DbfExport['D_PRIYN']:=NULL;
        DbfExport['D_ZVILN']:=NULL;
        DbfExport['OZN_PILG']:=NULL;
        DbfExport['OZNAKA']:=NULL;

        DbfExport.Post;
        ProgressBar.Position:=ProgressBar.Position+1;
        Application.ProcessMessages;


        DbfExport.Append;

        DbfExport['NP']:=99999;
        DbfExport['PERIOD']:=PKvartal;
        DbfExport['RIK']:=PYear;
        DbfExport['KOD']:=pOkpo;
        DbfExport['TYP']:=0;
        DbfExport['TIN']:=NULL;
        DbfExport['S_NAR']:=S_Nar;
        DbfExport['S_DOX']:=S_Dox;
        DbfExport['S_TAXN']:=S_TaxN;
        DbfExport['S_TAXP']:=S_TaxP;
        DbfExport['OZN_DOX']:=NULL;
        DbfExport['D_PRIYN']:=NULL;
        DbfExport['D_ZVILN']:=NULL;
        DbfExport['OZN_PILG']:=NULL;
        DbfExport['OZNAKA']:=NULL;

        DbfExport.Post;
        ProgressBar.Position:=ProgressBar.Position+1;
        Application.ProcessMessages;

        DbfExport.Close;
        ZShowMessage(Finish_Caption[PLanguageIndex],GoodFinish_Text[PLanguageIndex],mtInformation,
                        [mbOk]);
        ModalResult := mrOk;
      end
      else
        begin
            ZShowMessage(Error_Caption[PLanguageIndex],EFileNotSelected_Caption[PLanguageIndex],mtInformation,
                            [mbOk]);
        end;


end;

procedure TBankExportForm.FileNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    NameF:String;
begin

  try
   DB.Handle := pDB_HANDLE;
   StProc.StoredProcName := 'Z_1DF_PRINT_GLOBALDATA';
   StProc.Transaction.StartTransaction;
   StProc.Prepare;
   StProc.ParamByName('ID_1DF').AsInteger := pId1Df;
   StProc.ExecProc;
   PYear :=  StProc.ParamByName('YEAR_1DF').asInteger;
   PKvartal :=  StProc.ParamByName('KVARTAL_1DF').asInteger;
   pOkpo :=  StProc.ParamByName('OKPO').asString;
   NameF:=StProc.ParamByName('FILE_DA').AsString;

  // StProc.Transaction.Commit;
   SaveDialog.FileName:=NameF;
   SaveDialog.DefaultExt := IntToStr(PKvartal);

   if (SaveDialog.Execute) then
        begin

            FileNameEdit.Text:=SaveDialog.FileName;
            DbfExport.DatabaseName:=ExtractFileDir(FileNameEdit.Text);
            DbfExport.TableName:=ExtractFileName(FileNameEdit.Text);

        end;
  except
  on e:exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
    StProc.Transaction.Rollback;
   end;
  end;
end;

end.
