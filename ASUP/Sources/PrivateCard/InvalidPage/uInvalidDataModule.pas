unit uInvalidDataModule;

interface

uses
    SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
    FIBQuery, pFIBQuery, Dialogs;

type
    TdmInvalid = class(TDataModule)
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        InvalidSelect: TpFIBDataSet;
        name_invalid: TFIBStringField;
        InvalidSelectDATE_BEG: TFIBDateField;
        InvalidSelectDATE_END: TFIBDateField;
        InvalidSource: TDataSource;
        InvalidSelectid_invalid: TIntegerField;
        DeleteQuery: TpFIBQuery;
        InsertUpdate: TpFIBQuery;
    InvalidSelectINV_GROUP: TFIBIntegerField;
    InvalidSelectID_MAN: TFIBIntegerField;
    InvalidSelectREASON_INV: TFIBStringField;
    InvalidSelectNOM_INV: TFIBStringField;
        procedure InvalidSelectAfterOpen(DataSet: TDataSet);
    private
    { Private declarations }
    public
        procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
    { Public declarations }
    end;

var
    dmInvalid: TdmInvalid;

procedure ShowInfo(DataSet: TDataSet);

implementation

uses uInvalidHistory, uInvalidGroup;

{$R *.dfm}

procedure TdmInvalid.InvalidSelectAfterOpen(DataSet: TDataSet);
begin
    DataSet.FieldByName('Date_beg').OnGetText := GetText;
    DataSet.FieldByName('Date_end').OnGetText := GetText;
end;

procedure TdmInvalid.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

