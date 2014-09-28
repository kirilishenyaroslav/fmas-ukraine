unit f1df_exportmXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Halcn6db, ComCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxTextEdit,ZMessages,
  cxMaskEdit, cxButtonEdit, FIBQuery, pFIBQuery, pFIBStoredProc,
  unit_zGlobal_Consts, zProc, f1df_DMm;

  function ExportToXML(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          Id1Df:Integer):Variant;stdcall;

type
  TBankExportFormXML = class(TForm)
    ResultDataset: TpFIBDataSet;
    SaveDialog: TSaveDialog;
    FileNameEdit: TcxButtonEdit;
    StProc: TpFIBStoredProc;
    DefaultTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StartBtn: TcxButton;
    ProgressBar: TcxProgressBar;
    DSet5: TpFIBDataSet;
    DSource5: TDataSource;
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
    Pzv_mes:string;
    PFIRM_NAME:String;
    PKOD_DPI:String;
    PADDRESS_UR_OSOBA:String;
    PDPI:String;
    PTIN_DIRECTOR:String;
    PDIRECTOR:String;
    PTEL_DIRECTOR:String;
    PTIN_GLAVBUHG:String;
    PGLAVBUHG:String;
    PTEL_GLAVBUHG:String;
    Pkod_obl:string;
    Pkod_adm_ray:string;
    PCNT_SHTAT:string;
    PCNT_SOVMEST:string;
    PC_DOC_SUB:string;
    PC_DOC_VER:string;
    PC_DOC_TYPE:string;
    PC_DOC_STAN:string;
    PC_STI_ORIG:string;
    PC_DOC_CNT:string;
    PPERIOD_TYPE:string;
    
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;Id1Df:Integer);reintroduce;
  end;


implementation


function ExportToXML(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                          Id1Df:Integer):Variant;
var
  form:TBankExportFormXML;
begin

  form:=TBankExportFormXML.Create(AOwner,DB_HANDLE,Id1Df);
  form.ShowModal;
  form.Free;
end;

Constructor TBankExportFormXML.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;Id1Df:Integer);
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

procedure TBankExportFormXML.StartBtnClick(Sender: TObject);
var
  TotalRecord:Integer;
  i:integer;
  d: integer;
  s: string;
  S_Nar,S_Dox,S_TaxN,S_TaxP:Double;
  f:TextFile;
  FileDir, tstr, what:String;
  R01G03A:Double;
  R01G03:Double;
  R01G04A:Double;
  R01G04:Double;
begin
if ( FileNameEdit.Text<>'') then
    begin


    ResultDataSet.Open;
    ResultDataset.Last;
    Totalrecord:=ResultDataSet.RecordCount;
    ResultDataset.First;

    ProgressBar.Properties.Max:=TotalRecord+3;


    AssignFile(f,FileNameEdit.Text);
    Rewrite(f);
    CloseFile(f);
    Append(f);
    Writeln(f,'<?xml version="1.0" encoding="windows-1251" ?> ');
    Writeln(f,'<DECLAR xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="J0500104.xsd"> ');
    Writeln(f,'<DECLARHEAD>');

   {         DbfExport['NP']:=99992;
        DbfExport['PERIOD']:=PKvartal;
        DbfExport['RIK']:=PYear;
        DbfExport['KOD']:=pOkpo;
        DbfExport['TYP']:=0;
        DbfExport['TIN']:=StProc.ParamByName('TIN_GLAVBUHG').asVariant;
        DbfExport['S_NAR']:=NULL;
        DbfExport['S_DOX']:=StProc.ParamByName('TEL_GLAVBUHG').asVariant;
    }
    Writeln(f,'<TIN>'+pOkpo+'</TIN>');
    Writeln(f,'<C_DOC>'+'J05'+'</C_DOC>');

    Writeln(f,'<C_DOC_SUB>'+PC_DOC_SUB+'</C_DOC_SUB>');
    Writeln(f,'<C_DOC_VER>'+PC_DOC_VER+'</C_DOC_VER>');
    Writeln(f,'<C_DOC_TYPE>'+PC_DOC_TYPE+'</C_DOC_TYPE>');
    Writeln(f,'<C_DOC_CNT>'+PC_DOC_CNT+'</C_DOC_CNT>');
    Writeln(f,'<C_REG>'+Pkod_obl+'</C_REG>');
    Writeln(f,'<C_RAJ>'+Pkod_adm_ray+'</C_RAJ>');
    Writeln(f,'<PERIOD_MONTH>'+Pzv_mes+'</PERIOD_MONTH>');
    Writeln(f,'<PERIOD_TYPE>'+PPERIOD_TYPE+'</PERIOD_TYPE>');
    Writeln(f,'<PERIOD_YEAR>'+IntToStr(PYear)+'</PERIOD_YEAR>');

    Writeln(f,'<C_STI_ORIG>'+Pkod_obl+Pkod_adm_ray+'</C_STI_ORIG>');
    Writeln(f,'<C_DOC_STAN>'+PC_DOC_STAN+'</C_DOC_STAN>');
    Writeln(f,'<LINKED_DOCS xsi:nil="true" />');

    tstr:=DateToStr(Date);
    what:='.';
    while pos(what, tstr)>0 do
    tstr:=copy(tstr,1,pos(what,tstr)-1) + copy(tstr,pos(what,tstr)+length(what),length(tstr));

    Writeln(f,'<D_FILL>'+tstr+'</D_FILL>');
    Writeln(f,'<SOFTWARE>'+'FMAS'+'</SOFTWARE>');

    Writeln(f,'</DECLARHEAD>');

    Writeln(f,'<DECLARBODY>');
    Writeln(f,'<HTIN>'+pOkpo+'</HTIN>');
    Writeln(f,'<HPAGES>'+varToStrDef((ResultDataset.recordCount div 53)+1,'')+'</HPAGES>');
    Writeln(f,'<HZ>'+'1'+'</HZ>');
    Writeln(f,'<HNAME>'+PFIRM_NAME+'</HNAME>');
    Writeln(f,'<HLOC>'+PADDRESS_UR_OSOBA+'</HLOC>');
    Writeln(f,'<HTINSTI>'+PKOD_DPI+'</HTINSTI>');
    Writeln(f,'<HSTI>'+Pkod_obl+Pkod_adm_ray+' '+AnsiUpperCase(PDPI)+'</HSTI>');
    Writeln(f,'<HZKV>'+IntToStr(PKvartal)+'</HZKV>');
    Writeln(f,'<HZY>'+IntToStr(PYear)+'</HZY>');
    Writeln(f,'<R00G01I>'+PCNT_SHTAT+'</R00G01I>');
    Writeln(f,'<R00G02I>'+PCNT_SOVMEST+'</R00G02I>');
    Writeln(f,'<R00G03I>'+'1' +'</R00G03I>');
    //Writeln(f,'<R00G04 xsi:nil="true" />');


    //Writeln(f,'<R00G04>'+'0.00'+'</R00G04>');
    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      Writeln(f,'<T1RXXXXG02 ROWNUM="'+inttostr(i)+'">'+varToStrDef(ResultDataset['TIN_PASPORT'],'')+'</T1RXXXXG02>');
      inc(i);
      ResultDataset.next;
    end;

    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      Writeln(f,'<T1RXXXXG03A ROWNUM="'+inttostr(i)+'">'+StringReplace(FloatToStrF(ResultDataset['SUM_NAR'],ffFixed,10,2), ',', '.', [rfReplaceAll, rfIgnoreCase])+'</T1RXXXXG03A>');
      inc(i);                                                                      //SUM_NAR
      ResultDataset.next;
    end;

    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      Writeln(f,'<T1RXXXXG03 ROWNUM="'+inttostr(i)+'">'+StringReplace(FloatToStrF(ResultDataset['SUM_VIPL'],ffFixed,10,2), ',', '.', [rfReplaceAll, rfIgnoreCase]) +'</T1RXXXXG03>');
      inc(i);
      ResultDataset.next;
    end;

    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      Writeln(f,'<T1RXXXXG04A ROWNUM="'+inttostr(i)+'">'+StringReplace(FloatToStrF(ResultDataset['SUM_UD'],ffFixed,10,2), ',', '.', [rfReplaceAll, rfIgnoreCase]) +'</T1RXXXXG04A>');
      inc(i);
      ResultDataset.next;
    end;

    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      Writeln(f,'<T1RXXXXG04 ROWNUM="'+inttostr(i)+'">'+StringReplace(FloatToStrF(ResultDataset['SUM_PERER'],ffFixed,10,2), ',', '.', [rfReplaceAll, rfIgnoreCase]) +'</T1RXXXXG04>');
      inc(i);
      ResultDataset.next;
    end;
    
    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      Writeln(f,'<T1RXXXXG05 ROWNUM="'+inttostr(i)+'">'+varToStrDef(ResultDataset['KOD_1DF'],'')+'</T1RXXXXG05>');
      inc(i);
      ResultDataset.next;
    end;


    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      if VarIsNull(ResultDataset['DATE_CAME_XML']) then
        Writeln(f,'<T1RXXXXG06D ROWNUM="'+inttostr(i)+'" xsi:nil="true" />')
      else Writeln(f,'<T1RXXXXG06D ROWNUM="'+inttostr(i)+'">'+varToStr(ResultDataset['DATE_CAME_XML'])+'</T1RXXXXG06D>');
      inc(i);
      ResultDataset.next;
    end;

    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      if VarIsNull(ResultDataset['DATE_LEAVE_XML']) then
        Writeln(f,'<T1RXXXXG07D ROWNUM="'+inttostr(i)+'" xsi:nil="true" />')
      else Writeln(f,'<T1RXXXXG07D ROWNUM="'+inttostr(i)+'">'+varToStr(ResultDataset['DATE_LEAVE_XML'])+'</T1RXXXXG07D>');
      inc(i);
      ResultDataset.next;
    end;

    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      if VarIsNull(ResultDataset['KOD_PRIV']) or (varToStr(ResultDataset['KOD_PRIV'])='0') then
        Writeln(f,'<T1RXXXXG08 ROWNUM="'+inttostr(i)+'" xsi:nil="true" />')
      else Writeln(f,'<T1RXXXXG08 ROWNUM="'+inttostr(i)+'">'+ifthen((Length(varToStr(ResultDataset['KOD_PRIV']))<2),'0'+varToStr(ResultDataset['KOD_PRIV']),varToStr(ResultDataset['KOD_PRIV'])) +'</T1RXXXXG08>');

      inc(i);
      ResultDataset.next;
    end;

    ResultDataset.First;
    i:=1;
    while not ResultDataset.Eof do
    begin
      Writeln(f,'<T1RXXXXG09 ROWNUM="'+inttostr(i)+'">'+ifthen(varToStrDef(ResultDataset['IS_ADD'],'')='F','1','0')+'</T1RXXXXG09>');
      inc(i);
      ResultDataset.next;
    end;


    ResultDataset.First;
    R01G03A:=0;
    R01G03:=0;
    R01G04A:=0;
    R01G04:=0;
    while not ResultDataset.Eof do
    begin
      R01G03A:=R01G03A+ VarAsType(ResultDataset['SUM_NAR'],varDouble);
      R01G03:=R01G03+ VarAsType(ResultDataset['SUM_VIPL'],varDouble);
      R01G04A:=R01G04A+ VarAsType(ResultDataset['SUM_UD'],varDouble);
      R01G04:=R01G04+ VarAsType(ResultDataset['SUM_PERER'],varDouble);
      ResultDataset.next;
    end;

    Writeln(f,'<R01G03A>'+ StringReplace(FloatToStrF(R01G03A,ffFixed,10,2), ',', '.', [rfReplaceAll, rfIgnoreCase]) +'</R01G03A>');
    Writeln(f,'<R01G03>'+ StringReplace(FloatToStrF(R01G03,ffFixed,10,2), ',', '.', [rfReplaceAll, rfIgnoreCase]) +'</R01G03>');
    Writeln(f,'<R01G04A>'+ StringReplace(FloatToStrF(R01G04A,ffFixed,10,2), ',', '.', [rfReplaceAll, rfIgnoreCase]) +'</R01G04A>');
    Writeln(f,'<R01G04>'+ StringReplace(FloatToStrF(R01G04,ffFixed,10,2), ',', '.', [rfReplaceAll, rfIgnoreCase]) +'</R01G04>');

    Dset5.Close;
    Dset5.SQLs.SelectSQL.Text := 'SELECT Count(*) as col FROM Z_1DF_REPORT WHERE id_1df_header=' + IntToStr(pId1Df);
    Dset5.Open;
    Writeln(f,'<R02G01I>'+StringReplace(varToStrDef(Dset5['col'],''), ',' , '.',
                          [rfReplaceAll, rfIgnoreCase])+'</R02G01I>');

    Dset5.Close;
    Dset5.SQLs.SelectSQL.Text := 'SELECT distinct Count(TIN) as col FROM Z_1DF_REPORT WHERE id_1df_header=' + IntToStr(pId1Df);
    Dset5.Open;
    Writeln(f,'<R02G02I>'+StringReplace(varToStrDef(Dset5['col'],''), ',' , '.',
                          [rfReplaceAll, rfIgnoreCase])+'</R02G02I>');

    Writeln(f,'<R02G03I>'+'1'+'</R02G03I>');

    s:=DateToStr(Date);
    d := pos('.', s);
    delete(s, d, 1);
    d := pos('.', s);
    delete(s, d, 1);

    Writeln(f,'<HFILL>'+S+'</HFILL>');

    Writeln(f,'<HKBOS>'+PTIN_DIRECTOR+'</HKBOS>');
    Writeln(f,'<HBOS>'+PDIRECTOR+'</HBOS>');
    Writeln(f,'<HTELBOS>'+PTEL_DIRECTOR+'</HTELBOS>');
    Writeln(f,'<HKBUH>'+PTIN_GLAVBUHG+'</HKBUH>');
    Writeln(f,'<HBUH>'+PGLAVBUHG+'</HBUH>');
    Writeln(f,'<HTELBUH>'+PTEL_GLAVBUHG+'</HTELBUH>');

    Writeln(f,'</DECLARBODY>');
    Writeln(f,'</DECLAR>');

  //<T1RXXXXG02 ROWNUM="3">2886313488</T1RXXXXG02>

    //Flush(f);
    CloseFile(f);






         end ;ModalResult := mrOk;
end;

procedure TBankExportFormXML.FileNameEditPropertiesButtonClick(
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
   PYear :=  StProc.ParamByName('PERIOD_YEAR').asInteger;
   PKvartal :=  StProc.ParamByName('KVARTAL_1DF').asInteger;
   pOkpo :=  StProc.ParamByName('OKPO').asString;
   Pzv_mes:=StProc.ParamByName('PERIOD_MONTH').AsString;
   PFIRM_NAME:=StProc.ParamByName('FIRM_NAME').AsString;

   PKOD_DPI:=StProc.ParamByName('KOD_DPI_XML').AsString;
   PADDRESS_UR_OSOBA :=StProc.ParamByName('ADDRESS_UR_OSOBA').AsString;
   PDPI:=StProc.ParamByName('DPI').AsString;

   PTIN_DIRECTOR:=StProc.ParamByName('TIN_DIRECTOR').AsString;
   PDIRECTOR:=StProc.ParamByName('DIRECTOR').AsString;
   PTEL_DIRECTOR:=StProc.ParamByName('TEL_DIRECTOR').AsString;
   PTIN_GLAVBUHG:=StProc.ParamByName('TIN_GLAVBUHG').AsString;
   PGLAVBUHG:=StProc.ParamByName('GLAVBUHG').AsString;
   PTEL_GLAVBUHG:=StProc.ParamByName('TEL_GLAVBUHG').AsString;
   Pkod_obl:=inttostr(StProc.ParamByName('kod_obl').AsInteger);
   Pkod_adm_ray:=StProc.ParamByName('kod_adm_ray').AsString;
   PCNT_SOVMEST:=StProc.ParamByName('CNT_SOVMEST').AsString;
   PCNT_SHTAT:=StProc.ParamByName('cnt_shtat').AsString;
   PC_DOC_VER:=StProc.ParamByName('C_DOC_VER').AsString;
   PC_DOC_TYPE:=StProc.ParamByName('C_DOC_TYPE').AsString;
   PC_DOC_SUB:=StProc.ParamByName('C_DOC_SUB').AsString;
   PC_DOC_VER:=StProc.ParamByName('C_DOC_VER').AsString;
   PC_DOC_TYPE:=StProc.ParamByName('C_DOC_TYPE').AsString;
   PC_DOC_STAN:=StProc.ParamByName('C_DOC_STAN').AsString;
   PC_STI_ORIG:=StProc.ParamByName('C_STI_ORIG').AsString;
   PC_DOC_CNT:=StProc.ParamByName('C_DOC_CNT').AsString;
   PPERIOD_TYPE:=StProc.ParamByName('PERIOD_TYPE').AsString;


   NameF:=StProc.ParamByName('NAMEXML').AsString;


//   StProc.Transaction.Commit
//   NameF:='da'+Trim(pOkpo);
   SaveDialog.FileName:=NameF;
   SaveDialog.DefaultExt := 'xml'; //IntToStr(PKvartal);

   if (SaveDialog.Execute) then
        begin

            FileNameEdit.Text:=SaveDialog.FileName;
            //DbfExport.DatabaseName:=ExtractFileDir(FileNameEdit.Text);
            //DbfExport.TableName:=ExtractFileName(FileNameEdit.Text);

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
