unit zPersonification2010Export_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Halcn6db, ComCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxTextEdit,ZMessages,
  cxMaskEdit, cxButtonEdit, FIBQuery, pFIBQuery, pFIBStoredProc,
  unit_zGlobal_Consts, zProc, cxLabel, cxShellDlgs, cxShellBrowserDialog,
  Dates;

type
  TFzPerosnification2010Export = class(TForm)
    DSetT5: TpFIBDataSet;
    DbfExportT5: THalcyonDataSet;
    NewDbfTableCreateT5: TCreateHalcyonDataSet;
    FilePath: TcxButtonEdit;
    DefaultTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StartBtn: TcxButton;
    ProgressBar: TcxProgressBar;
    cxLabel1: TcxLabel;
    DSetT6: TpFIBDataSet;
    DbfExportT6: THalcyonDataSet;
    NewDbfTableCreateT6: TCreateHalcyonDataSet;
    ProgressBar2: TcxProgressBar;
    DSetT7: TpFIBDataSet;
    DSetT8: TpFIBDataSet;
    DSetT9: TpFIBDataSet;
    DSetT10: TpFIBDataSet;
    DbfExportT8: THalcyonDataSet;
    DbfExportT9: THalcyonDataSet;
    DbfExportT10: THalcyonDataSet;
    NewDbfTableCreateT7: TCreateHalcyonDataSet;
    NewDbfTableCreateT8: TCreateHalcyonDataSet;
    NewDbfTableCreateT9: TCreateHalcyonDataSet;
    NewDbfTableCreateT10: TCreateHalcyonDataSet;
    DbfExportT7: THalcyonDataSet;
    BtnCaption: TcxButton;
    SaveDialog1: TcxShellBrowserDialog;
    procedure StartBtnClick(Sender: TObject);
    procedure FileNameEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnCaptionClick(Sender: TObject);
  private
    PDB_Handle:TISC_DB_HANDLE;
    pId:Integer;
    PLanguageIndex:byte;
    PeriodPath:string;
    Y,M,D:word;
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdReport:Int64;KodSetup:integer);reintroduce;
  end;


implementation

constructor TFzPerosnification2010Export.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;IdReport:Int64;KodSetup:integer);
var     Date:tdate;

begin
  inherited Create(AOwner);
  PLanguageIndex := LanguageIndex;
  PDB_Handle:=DB_HANDLE;
  pId := IdReport;
  Caption := ExportBtn_Caption[PLanguageIndex];
  StartBtn.Caption := ExportBtn_Caption[PLanguageIndex];
  PeriodPath:=KodSetupToPeriod(KodSetup,6) ;

  DecodeDate(strtodate(PeriodPath),Y,M,D );
  //  DSetAnk.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PERSONIFICATION_ANKETA_S_EXP('+IntToStr(IdReport)+') order by tin';
//  DSetInd.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PERSONIFICTION_EXPORT_S('+IntToStr(IdReport)+') order by tin';
  if Y<=2010 then
  begin
    DSetT5.SQLs.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_2010_EXPORT_5('+IntToStr(IdReport)+','+IntToStr(KodSetup)+')';
    DSetT6.SQLs.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_2010_EXPORT_6('+IntToStr(IdReport)+','+IntToStr(KodSetup)+')';
    DSetT7.SQLs.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_2010_EXPORT_7('+IntToStr(IdReport)+','+IntToStr(KodSetup)+')';
    DSetT8.SQLs.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_2010_EXPORT_8('+IntToStr(KodSetup)+','+IntToStr(IdReport)+')';
  end
  else
  begin
    DSetT5.SQLs.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_2011_EXPORT_5('+IntToStr(IdReport)+','+IntToStr(KodSetup)+')';
    DSetT6.SQLs.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_2011_EXPORT_6('+IntToStr(IdReport)+','+IntToStr(KodSetup)+')';
    DSetT7.SQLs.SelectSQL.Text:='SELECT * FROM Z_PERSONIFICATION_2011_EXPORT_7('+IntToStr(KodSetup)+','+IntToStr(IdReport)+')';
    DSetT8.SQLs.SelectSQL.Text:='';
    NewDbfTableCreateT5.CreateFields.text:='PERIOD_M;N;2;0'+#13+
                                           'PERIOD_Y;N;4;0'+#13+
                                           'ROWNUM;N;6;0'+#13+
                                           'UKR_GROMAD;N;1;0'+#13+
                                           'ZO;N;2;0'+#13+
                                           'NUMIDENT;C;10;0'+#13+
                                           'LN;C;100;0'+#13+
                                           'NM;C;100;0'+#13+
                                           'FTN;C;100;0'+#13+
                                           'START_DT;N;2;0'+#13+
                                           'END_DT;N;2;0'+#13+
                                           'NRM_DT;C;8;0'+#13+
                                           'PID_ZV;C;150;0'+#13+
                                           'DOG_CPH;N;1;0';

    NewDbfTableCreateT6.CreateFields.text:='PERIOD_M;N;2;0'+#13+
                                           'PERIOD_Y;N;4;0'+#13+
                                           'ROWNUM;N;6;0'+#13+
                                           'UKR_GROMAD;N;1;0'+#13+
                                           'ST;N;1;0'+#13+
                                           'NUMIDENT;C;10;0'+#13+
                                           'LN;C;100;0'+#13+
                                           'NM;C;100;0'+#13+
                                           'FTN;C;100;0'+#13+
                                           'ZO;N;2;0'+#13+
                                           'PAY_TP;N;3;0'+#13+
                                           'PAY_MNTH;N;2;0'+#13+
                                           'PAY_YEAR;N;4;0'+#13+
                                           'KD_NP;N;3;0'+#13+
                                           'KD_NZP;N;3;0'+#13+
                                           'KD_PTV;N;3;0'+#13+
                                           'SUM_TOTAL;N;16;2'+#13+
                                           'SUM_MAX;N;16;2'+#13+
                                           'SUM_INS;N;16;2'+#13+
                                           'OTK;N;1;0'+#13+
                                           'EXP;N;1;0'+#13+
                                           'NRM;N;1;0'+#13+
                                           'KD_VP;N;3;0';



    NewDbfTableCreateT7.CreateFields.text:='PERIOD_M;N;2;0'+#13+
                                           'PERIOD_Y;N;4;0'+#13+
                                           'ROWNUM;N;6;0'+#13+
                                           'UKR_GROMAD;N;1;0'+#13+
                                           'NUMIDENT;C;10;0'+#13+
                                           'LN;C;100;0'+#13+
                                           'NM;C;100;0'+#13+
                                           'FTN;C;100;0'+#13+
                                           'C_PID;C;9;0'+#13+
                                           'START_DT;N;2;0'+#13+
                                           'STOP_DT;N;2;0'+#13+
                                           'DAYS;N;4;0'+#13+
                                           'NORMZ;N;4;0'+#13+
                                           'HH;N;4;0'+#13+
                                           'MM;N;2;0'+#13+
                                           'NORMA;N;6;0'+#13+
                                           'NUM_NAK;C;8;0'+#13+
                                           'DT_NAK;N;8;0'+#13+
                                           'SEAZON;N;1;0';

  end
end;

{$R *.dfm}

procedure TFzPerosnification2010Export.StartBtnClick(Sender: TObject);
var i:integer;
    j:Integer;
    k:Integer;
    s,str:PAnsiChar;
    st:String;
begin
if ( FilePath.Text<>'') then
  try

    ProgressBar.Position := 0;
    ProgressBar2.Position := 0;
    ProgressBar2.Properties.Max:=100;

    DB.Handle := PDB_Handle;

    // Таблица 5
    cxLabel1.Caption:='Вивантаження таблиці № 5';
    DSetT5.Open;
    DSetT5.Last;
    ProgressBar.Properties.Max:=DSetT5.RecordCount;
    if FileExists(FilePath.Text+PeriodPath+'\'+DbfExportT5.TableName) then DeleteFile(FilePath.Text+PeriodPath+'\'+DbfExportT5.TableName);
    if not DirectoryExists(FilePath.Text+PeriodPath)then
      if CreateDir(FilePath.Text+PeriodPath) then
      else
      begin
        ZShowMessage(Error_Caption[PLanguageIndex],EFileCanNotCreate_Caption[PLanguageIndex],mtError,[mbOk]);
        Exit;
      end;

    if(NewDbfTableCreateT5.Execute)then
    begin
      DbfExportT5.Exclusive:=True;
      DbfExportT5.Open;
    end
    else
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],EFileCanNotCreate_Caption[PLanguageIndex],mtError,[mbOk]);
      Exit;
    end;

    while(not DbfExportT5.Eof)do
    begin
      DbfExportT5.Delete;
      DbfExportT5.Next;
    end;

    DbfExportT5.Close;
    DbfExportT5.Exclusive:=False;
    DbfExportT5.Open;
    DSetT5.First;

    j:=0;
    while not(DSetT5.Eof)do
    begin
      DbfExportT5.Append;
      for i:=0 to DbfExportT5.FieldList.Count-1 do
        DbfExportT5[DbfExportT5.FieldList[i].FieldName]:=DSetT5[DbfExportT5.FieldList[i].FieldName];

      DbfExportT5.Post;
      DSetT5.Next;
      ProgressBar.Position:=ProgressBar.Position+1;
      ProgressBar2.Position:=Round(j/(DSetT5.RecordCount)*25);
      j:=j+1;
      Application.ProcessMessages;
    end;
    DSetT5.Close;

    ProgressBar2.Position:=Round(100/4);

    // Таблица 6
    cxLabel1.Caption:='Вивантаження таблиці № 6';
    DSetT6.Open;
    DSetT6.Last;
    ProgressBar.Properties.Max:=DSetT6.RecordCount;
    ProgressBar.Position:=0;


    if FileExists(FilePath.Text+PeriodPath+'\'+DbfExportT6.TableName) then DeleteFile(FilePath.Text+PeriodPath+'\'+DbfExportT6.TableName);

    if(NewDbfTableCreateT6.Execute)then
    begin
      DbfExportT6.Exclusive:=True;
      DbfExportT6.Open;
    end
    else
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],EFileCanNotCreate_Caption[PLanguageIndex],mtError,[mbOk]);
      Exit;
    end;

    while(not DbfExportT6.Eof)do
    begin
      DbfExportT6.Delete;
      DbfExportT6.Next;
    end;

    DbfExportT6.Close;
    DbfExportT6.Exclusive:=False;
    DbfExportT6.Open;
    DSetT6.First;
    j:=0;
    while not(DSetT6.Eof)do
    begin
      DbfExportT6.Append;
      for i:=0 to DbfExportT6.FieldList.Count-1 do
        DbfExportT6[DbfExportT6.FieldList[i].FieldName]:=DSetT6[DbfExportT6.FieldList[i].FieldName];

      DbfExportT6.Post;
      DSetT6.Next;
      ProgressBar.Position:=ProgressBar.Position+1;
      ProgressBar2.Position:=Round(100/4)+Round(j/(DSetT6.RecordCount)*25);
      j:=j+1;
      Application.ProcessMessages;
    end;
    DSetT6.Close;

    ProgressBar2.Position:=Round(100/4)*2;
    // Таблица 7

    cxLabel1.Caption:='Вивантаження таблиці № 7';
    DSetT7.Open;
    DSetT7.Last;
    ProgressBar.Properties.Max:=DSetT7.RecordCount;
    ProgressBar.Position:=0;

    if FileExists(FilePath.Text+PeriodPath+'\'+DbfExportT7.TableName) then DeleteFile(FilePath.Text+PeriodPath+'\'+DbfExportT7.TableName);

    if(NewDbfTableCreateT7.Execute)then
    begin
      DbfExportT7.Exclusive:=True;
      DbfExportT7.Open;
    end
    else
    begin
      ZShowMessage(Error_Caption[PLanguageIndex],EFileCanNotCreate_Caption[PLanguageIndex],mtError,[mbOk]);
      Exit;
    end;

    while(not DbfExportT7.Eof)do
    begin
      DbfExportT7.Delete;
      DbfExportT7.Next;
    end;

    DbfExportT7.Close;
    DbfExportT7.Exclusive:=False;
    DbfExportT7.Open;
    DSetT7.First;
    j:=0;
    while not(DSetT7.Eof)do
    begin
      DbfExportT7.Append;
      for i:=0 to DbfExportT7.FieldList.Count-1 do
        DbfExportT7[DbfExportT7.FieldList[i].FieldName]:=DSetT7[DbfExportT7.FieldList[i].FieldName];

      DbfExportT7.Post;
      DSetT7.Next;
      ProgressBar.Position:=ProgressBar.Position+1;
      ProgressBar2.Position:=Round(100/4)*2+Round(j/(DSetT7.RecordCount)*25);
      j:=j+1;
      Application.ProcessMessages;
    end;
    DSetT7.Close;

    ProgressBar.Position:=0;
    ProgressBar2.Position:=Round(100/4)*3;
    // Таблица 8
    if  DSetT8.SQLs.SelectSQL.Text<>'' then
    begin
      cxLabel1.Caption:='Вивантаження таблиці № 8';
      DSetT8.Open;
      DSetT8.Last;
      ProgressBar.Properties.Max:=DSetT8.RecordCount;
      ProgressBar.Position:=0;

      if FileExists(FilePath.Text+PeriodPath+'\'+DbfExportT8.TableName) then DeleteFile(FilePath.Text+PeriodPath+'\'+DbfExportT8.TableName);

      if(NewDbfTableCreateT8.Execute)then
      begin
        DbfExportT8.Exclusive:=True;
        DbfExportT8.Open;
      end
      else
      begin
        ZShowMessage(Error_Caption[PLanguageIndex],EFileCanNotCreate_Caption[PLanguageIndex],mtError,[mbOk]);
        Exit;
      end;

      while(not DbfExportT8.Eof)do
      begin
        DbfExportT8.Delete;
        DbfExportT8.Next;
      end;

      DbfExportT8.Close;
      DbfExportT8.Exclusive:=False;
      DbfExportT8.Open;
      DSetT8.First;
      j:=0;
      while not(DSetT8.Eof)do
      begin
        DbfExportT8.Append;
        for i:=0 to DbfExportT8.FieldList.Count-1 do
          DbfExportT8[DbfExportT8.FieldList[i].FieldName]:=DSetT8[DbfExportT8.FieldList[i].FieldName];
        DbfExportT8.Post;
        DSetT8.Next;
        ProgressBar.Position:=ProgressBar.Position+1;
        ProgressBar2.Position:=Round(100/4)*3+Round(j/(DSetT8.RecordCount)*25);
        j:=j+1;
        Application.ProcessMessages;
      end;
      DSetT8.Close;
    end;
//    ProgressBar2.Position:=Round(100/6)*4;
//    ProgressBar.Position:=0;
      ZShowMessage(Finish_Caption[PLanguageIndex],GoodFinish_Text[PLanguageIndex],mtInformation,[mbOk]);
    ModalResult := mrOk;
   except
     on e:exception do
     begin
       ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
       if DSetT5.Active then DSetT5.Close;
       if DSetT6.Active then DSetT6.Close;
       if DSetT7.Active then DSetT7.Close;
       if DSetT8.Active then DSetT8.Close;
       if DefaultTransaction.InTransaction then DefaultTransaction.Rollback;
     end
   end
   else
   begin
     ZShowMessage(Error_Caption[PLanguageIndex],EFileNotSelected_Caption[PLanguageIndex],mtInformation,
                  [mbOk]);
   end;
end;

procedure TFzPerosnification2010Export.FileNameEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);

begin
  if(SaveDialog1.Execute)then
  begin

    FilePath.Text:=SaveDialog1.Path;
    if  FilePath.Text[Length(FilePath.Text)]<>'\' then  FilePath.Text:=FilePath.Text+'\' ;
    DbfExportT5.DatabaseName:=FilePath.Text+PeriodPath;
    DbfExportT6.DatabaseName:=FilePath.Text+PeriodPath;
    DbfExportT7.DatabaseName:=FilePath.Text+PeriodPath;
    DbfExportT8.DatabaseName:=FilePath.Text+PeriodPath;
    DbfExportT9.DatabaseName:=FilePath.Text+PeriodPath;
    DbfExportT10.DatabaseName:=FilePath.Text+PeriodPath;
    if((Y>=2013) and (M>=9))then
    begin
      DbfExportT5.TableName:='E04T05H.dbf ';
      DbfExportT6.TableName:='E04T06H.dbf';
      DbfExportT7.TableName:='E04T07H.dbf';
    end
    else if((Y>=2011) and (M>=9))then
    begin
      DbfExportT5.TableName:='E04T05D.dbf ';
      DbfExportT6.TableName:='E04T06D.dbf';
      DbfExportT7.TableName:='E04T07D.dbf';
    end else
    begin
      DbfExportT5.TableName:='P04t05b.dbf';
      DbfExportT6.TableName:='P04t06b.dbf';
      DbfExportT7.TableName:='P04t07b.dbf';
      DbfExportT8.TableName:='P04t08b.dbf';
      DbfExportT9.TableName:='P04t09b.dbf';
      DbfExportT10.TableName:='P04t010b.dbf';
    end
  end;
end;

procedure TFzPerosnification2010Export.BtnCaptionClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
