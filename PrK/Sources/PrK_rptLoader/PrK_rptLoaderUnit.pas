unit PrK_rptLoaderUnit;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  frxDBSet, frxClass, frxCross, FIBDataSet, pFIBDataSet, Forms, Dialogs,
  AArray, ibase,ib_externals,DB,frxDCtrl,frxExportRTF,Variants;

type
  TrptLoader = class(TComponent)
  private
    FTransaction: TpFIBTransaction;
    FDatabase: TpFIBDatabase;
    FBDataSCRIPT: TpFIBQuery;
    FBDataSet1: TpFIBDataSet;
    FBDataSet2: TpFIBDataSet;
    FDBDataset1: TfrxDBDataset;
    FDBDataset2: TfrxDBDataset;
    DataSource1: TDataSource;
    FReport: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    procedure SetDatabase( value: TpFIBDatabase);
  public
    cErrorLog: TStrings;
    FReportFileName: String;
    constructor Create(AOwner: TComponent; xDatabase: TpFIBDatabase); overload;
    constructor Create(aOwner: TComponent; aParam :TAArray);overload;
    function LoadRPTini(cModuleName: String): Boolean;
    function ShowRPT(aParam :TAArray): Boolean; overload;
  published
    property  Database: TpFIBDatabase read FDatabase write SetDatabase;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

implementation

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
begin
   TrptLoader.Create(aowner,aParam);
end;

constructor TrptLoader.Create(aOwner: TComponent; aParam :TAArray);
var
  T :TrptLoader;
begin
  T:=TrptLoader.Create(aOwner);
  FReport       :=TfrxReport.Create(Self);
// для печати фото и прочих внешных данных указываем временную папку
  FReport.EngineOptions.TempDir:=GetEnvironmentVariable('TEMP');
//******************************************************************************
  frxRTFExport1 :=TfrxRTFExport.Create(Self);

  T.FReportFileName:='';
  FDatabase := TpFIBDatabase.Create(Self);
  if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
     FDatabase.SQLDialect  :=3;
     FDatabase.Handle      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
     Database               := FDatabase;
     ShowRPT(aParam);
   end
   else ShowMessage('Ошибка HANDLE`a базы');
  aParam.Free;
  aParam:=Nil;

    FTransaction.Free;
    FTransaction  :=Nil;
    FBDataSCRIPT.Free;
    FBDataSCRIPT  :=Nil;
    FBDataSet1.Free;
    FBDataSet1    :=Nil;
    FBDataSet2.Free;
    FBDataSet2    :=Nil;
    FDBDataset1.Free;
    FDBDataset1   :=Nil;
    FDBDataset2.Free;
    FDBDataset2   :=Nil;
    frxRTFExport1.free;
    frxRTFExport1 :=Nil;
    FReport.Free;
    FReport       :=Nil;
    FDatabase.Free;
    FDatabase     :=Nil;

  T.Free;
  T:=Nil;
end;

constructor TrptLoader.Create(AOwner: TComponent; xDatabase: TpFIBDatabase);
begin
  inherited Create(AOwner);
  FReport:=TfrxReport.Create(Self);
  FReportFileName:='';
  Database := xDatabase;
end;

procedure TrptLoader.SetDatabase( value: TpFIBDatabase);
begin
 { if value <> FDatabase then
  begin  }
//----------------------------------------------------------
    if not Assigned(FTransaction) then
      FTransaction:=TpFIBTransaction.Create(Self)
    else
      if FTransaction.InTransaction then FTransaction.Commit;

    if not Assigned(FBDataSCRIPT) then
      FBDataSCRIPT:=TpFIBQuery.Create(Self)
    else
      FBDataSCRIPT.Close;
//----------------------------------------------------------
    if not Assigned(FBDataSet1) then
      FBDataSet1:=TpFIBDataSet.Create(Self)
    else
      FBDataSet1.Close;

    if not Assigned(FDBDataset1) then
      FDBDataset1:=TfrxDBDataset.Create(Self)
    else
      FDBDataset1.DataSet.Active:=False;
//----------------------------------------------------------
    if not Assigned(FBDataSet2) then
      FBDataSet2:=TpFIBDataSet.Create(Self)
    else
      FBDataSet2.Close;

    if not Assigned(FDBDataset2) then
      FDBDataset2:=TfrxDBDataset.Create(Self)
    else
      FDBDataset2.DataSet.Active:=False;
//----------------------------------------------------------
    FDatabase := value;
//----------------------------------------------------------
    DataSource1:=TDataSource.Create(self);
    DataSource1.DataSet    := FBDataSet1;
    FBDataSet2.DataSource  := DataSource1; 
//----------------------------------------------------------
    FTransaction.AddDatabase(FDatabase);
    FBDataSCRIPT.Database:=FDatabase;
    FBDataSCRIPT.Transaction:=FTransaction;
    FBDataSCRIPT.SQL.Text:=
      'SELECT * FROM PRK_RPT_INI WHERE "MODULE_NAME"=:"MODULE_NAME"';
//----------------------------------------------------------
    FBDataSet1.Database:=FDatabase;
    FBDataSet1.Transaction:=FTransaction;
    FDBDataset1.DataSet:=FBDataSet1;
//----------------------------------------------------------
    FBDataSet2.Database:=FDatabase;
    FBDataSet2.Transaction:=FTransaction;
    FDBDataset2.DataSet:=FBDataSet2;
//----------------------------------------------------------
    FDBDataset1.Name:='FDBDataset1';
    FDBDataset2.Name:='FDBDataset2';
  {end;}
end;

function TrptLoader.LoadRPTini(cModuleName: String): Boolean;
var i: Integer;
begin
//ShowMessage(value.Name);
  LoadRPTini:=False;
  if not Assigned(FBDataSCRIPT) then
    cErrorLog.Add('['+TimeToStr(Time)+'] Не задан DataSet, читающий служебную информацию (not Assigned(FBDataSCRIPT))')
  else
  begin
    FBDataSCRIPT.ParamByName('MODULE_NAME').AsString:=cModuleName;

    if not Assigned(FDatabase) then
      cErrorLog.Add('['+TimeToStr(Time)+'] Не задана база данных (not Assigned(FDatabase))')
    else if not FDatabase.Connected then
      cErrorLog.Add('['+TimeToStr(Time)+'] Нет соединения с базой данных (not FDatabase.Connected)')
    else
    begin
      if not FTransaction.InTransaction then FTransaction.StartTransaction;
      FReportFileName:='';
      FBDataSet1.SelectSQL.Text:='';
      FBDataSet2.SelectSQL.Text:='';
      FBDataSCRIPT.ExecQuery;
      while not FBDataSCRIPT.Eof do
      begin
        i:=FBDataSCRIPT.FieldByName('PARAMETER_NUMBER').AsInteger;
        case i of
          0: FReportFileName:=
              FBDataSCRIPT.FieldByName('PARAMETER_VALUE').AsString;
          1: FBDataSet1.SelectSQL.Text:=
              FBDataSCRIPT.FieldByName('PARAMETER_VALUE').AsString;
          2: FBDataSet2.SelectSQL.Text:=
              FBDataSCRIPT.FieldByName('PARAMETER_VALUE').AsString;
        end;
        FBDataSCRIPT.Next;
      end;
      FBDataSCRIPT.Close;
      LoadRPTini:=True;
      FTransaction.Commit;
    end;
  end;
end;  

function TrptLoader.ShowRPT(aParam: TAArray): Boolean;
var
  i: Integer;
  Dataset1ParCount,Dataset2ParCount:integer;
begin
  ShowRPT:=False;
  if LoadRPTini(aParam['Input']['aNameReport'].AsString) then
  begin
    // ViewArray(Nil, aParam);
    Dataset1ParCount:=FBDataSet1.ParamCount;
    for i:=0 to Dataset1ParCount-1 do
     begin
      if aParam['Input']['ParamTypes'][i+1].AsVariant=Null then
       begin
 {По умолчанию}  FBDataSet1.ParamByName(aParam['Input']['ParamNames'][i+1].AsString).AsInt64 :=
                                       aParam['Input']['ParamValues'][i+1].AsVariant;
       end
       else begin
         case aParam['Input']['ParamTypes'][i+1].AsInteger of
    {Int64}   1: FBDataSet1.ParamByName(aParam['Input']['ParamNames'][i+1].AsString).AsInt64 :=
                                       aParam['Input']['ParamValues'][i+1].AsVariant;
    {String}  2: FBDataSet1.ParamByName(aParam['Input']['ParamNames'][i+1].AsString).AsString:=
                                       aParam['Input']['ParamValues'][i+1].AsVariant;
         end;
       end;
     end;
    Dataset2ParCount:=FBDataSet2.ParamCount;
    for i:=Dataset1ParCount to aParam['Input']['Count_Param'].AsInteger-1 do
     begin
       if aParam['Input']['ParamTypes'][i+1].AsVariant=Null then
       begin
 {По умолчанию}  FBDataSet2.ParamByName(aParam['Input']['ParamNames'][i+1].AsString).AsInt64 :=
                                       aParam['Input']['ParamValues'][i+1].AsVariant;
       end
       else begin
         case aParam['Input']['ParamTypes'][i+1].AsInteger of
    {Int64}   1: FBDataSet2.ParamByName(aParam['Input']['ParamNames'][i+1].AsString).AsInt64 :=
                                       aParam['Input']['ParamValues'][i+1].AsVariant;
    {String}  2: FBDataSet2.ParamByName(aParam['Input']['ParamNames'][i+1].AsString).AsString:=
                                       aParam['Input']['ParamValues'][i+1].AsVariant;
         end;
       end; 

      {FBDataSet2.ParamByName(aParam['Input']['ParamNames'][i+1].AsString).AsInt64 :=
                             aParam['Input']['ParamValues'][i+1].AsVariant;}
     end;

    if not FTransaction.InTransaction then FTransaction.StartTransaction;

    if FBDataSet1.SelectSQL.Text <> '' then FBDataSet1.Open;
    if FBDataSet2.SelectSQL.Text <> '' then FBDataSet2.Open;



    FReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\PrK\'+FReportFileName);
    FReport.ShowReport(True);
    FBDataSet1.Close;
    FBDataSet2.Close;
    FTransaction.CommitRetaining;
  end;
end;

end.
