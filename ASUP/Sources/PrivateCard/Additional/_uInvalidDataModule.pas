unit _uInvalidDataModule;

interface

uses
    SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
    FIBQuery, pFIBQuery, Dialogs;

type
    T_dmInvalid = class(TDataModule)
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        InvalidSelect: TpFIBDataSet;
        InvalidSource: TDataSource;
        DeleteQuery: TpFIBQuery;
        InsertUpdate: TpFIBQuery;
        procedure InvalidSelectAfterOpen(DataSet: TDataSet);
    private
    { Private declarations }
    public
        procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
    { Public declarations }
    end;

var
    _dmInvalid: T_dmInvalid;

procedure ShowInfo(DataSet: TDataSet);

implementation

uses _uInvalidHistory, _uInvalidGroup;

{$R *.dfm}

procedure T_dmInvalid.InvalidSelectAfterOpen(DataSet: TDataSet);
begin
    DataSet.FieldByName('Date_beg').OnGetText := GetText;
    DataSet.FieldByName('Date_end').OnGetText := GetText;
end;

procedure T_dmInvalid.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
    Text := DateToStr(Sender.Value);
    if (Sender.Value = StrToDate('01.01.1900')) then
        Text := 'з дитинства';
    if (Sender.Value = StrToDate('31.12.9999')) then
        Text := 'безстроково';
end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i: integer;
begin
    text := '';
    for i := 1 to DataSet.Fields.Count do
        text := text + DataSet.Fields[i - 1].FieldName + ' : ' + DataSet.Fields[i - 1].DisplayText + #13;
    ShowMessage(text);
end;
end.

