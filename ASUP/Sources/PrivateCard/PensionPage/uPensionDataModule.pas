unit uPensionDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs, pFIBStoredProc;

type
  TdmPension = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    PensionSelect: TpFIBDataSet;
    PensionSource: TDataSource;
    InsertUpdate: TpFIBQuery;
    DeleteQ: TpFIBQuery;
    InfinityDate: TpFIBDataSet;
    InfinityDateINFINITY_DATE: TFIBDateTimeField;
    StorProc: TpFIBStoredProc;
    procedure PensionSelectAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
     procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    { Public declarations }
  end;

var
  dmPension: TdmPension;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}

procedure TdmPension.PensionSelectAfterOpen(DataSet: TDataSet);
begin
  //DataSet.FieldByName('Date_beg').OnGetText:=GetText;
  //DataSet.FieldByName('Date_end').OnGetText:=GetText;
end;

procedure TdmPension.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
begin
  Text:=DateToStr(Sender.Value);
  if (Sender.Value=StrToDate('01.01.1900')) then
   Text := 'з дитинства';
  if (Sender.Value>=StrToDate('31.12.2049')) then
   Text := 'безстроково';
end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;
end.
