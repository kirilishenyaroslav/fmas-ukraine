{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник надбавок"                             }
{                 Модуль данных                                                }
{                                               ответственный: Тимофеев Антон  }
unit U_SPRaise_DataModule;

interface

uses
    SysUtils, Classes, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, DB,
    FIBDataSet, pFIBDataSet, Dialogs;

type
    TDMSPRaise = class(TDataModule)
        FIBDatabase: TpFIBDatabase;
        FIBDataSet: TpFIBDataSet;
        FIBReadTransaction: TpFIBTransaction;
        FIBWriteTransaction: TpFIBTransaction;
        FIBQuery: TpFIBQuery;
        FIBDataSetHist: TpFIBDataSet;
    AbsorbeDataSet: TpFIBDataSet;
    AbsorbeDataSource: TDataSource;
    CalcTypeDSet: TpFIBDataSet;
        procedure FIBDataSetAfterOpen(DataSet: TDataSet);
    private
    { Private declarations }
    public
        procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
    { Public declarations }
    end;

var
    DMSPRaise: TDMSPRaise;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}


procedure TDMSPRaise.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if (Sender.Value = 'T') then
        Text := 'Так'
    else
        Text := 'Ні';
end;


procedure TDMSPRaise.FIBDataSetAfterOpen(DataSet: TDataSet);
begin
    DataSet.FieldByName('Special').OnGetText := GetText;
end;

procedure ShowInfo(DataSet: TDataSet);
var
    text: string;
    i: integer;
begin
    text := '';
    for i := 1 to DataSet.Fields.Count do
        text := text + DataSet.Fields[i - 1].FieldName + ' : ' + DataSet.Fields[i - 1].DisplayText + #13;
    ShowMessage(text);
end;

end.

