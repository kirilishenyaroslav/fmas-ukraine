{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль данных                                                }
{                                               ответственный: Тимофеев Антон  }
unit U_SPPost_DataModule;

interface

uses
    SysUtils, Classes, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, DB,
    FIBDataSet, pFIBDataSet, Variants, Messages, Dialogs, IBCustomDataSet,
    Controls, FIBSQLMonitor, pFIBStoredProc;

type
    TDMSPPost = class(TDataModule)
        FIBDatabase: TpFIBDatabase;
        FIBDS_SPPost: TpFIBDataSet;
        FIBReadTransaction: TpFIBTransaction;
        FIBWriteTransaction: TpFIBTransaction;
        FIBQuery: TpFIBQuery;
        FIBDS_Insert: TpFIBDataSet;
        FIBDS_SPCategory: TpFIBDataSet;
        FIBDS_SPTypePost: TpFIBDataSet;
        pFIBDS_GetSession: TpFIBDataSet;
        RefSalarySelect: TpFIBDataSet;
        RefSalarySelectID_POST_BASE_SALARY: TIntegerField;
        RefSalarySelectBASE_SALARY_NAME: TStringField;
        DigitSalary: TpFIBDataSet;
        RefSalarySelectBASE_OKLAD: TFloatField;
        PubSysData: TpFIBDataSet;
        HolidayLongQuery: TpFIBDataSet;
        HolidayLongQueryID_POST_HOLIDAY: TFIBIntegerField;
        HolidayLongQueryHOLIDAY_LONG: TFIBIntegerField;
        HolidayLongQueryID_HOLIDAY: TFIBBCDField;
        HolidayLongQueryHOLIDAY_TYPE_FULL_NAME: TFIBStringField;
        HolidayLong: TDataSource;
        HolidayType: TpFIBDataSet;
        HolidayTypeID_TYPE_HOLIDAY: TFIBBCDField;
        HolidayTypeFULL_NAME: TFIBStringField;
        SpGroupDS: TpFIBDataSet;
        SpGroupDSID_POST_GROUP: TFIBIntegerField;
        SpGroupDSNAME_POST_GROUP: TFIBStringField;
        GroupDataSource: TDataSource;
        PostSource: TDataSource;
        FIBDS_SPPostID_POST: TFIBIntegerField;
        FIBDS_SPPostNAME_POST: TFIBStringField;
        FIBDS_SPPostPOST_CODE: TFIBStringField;
        FIBDS_SPPostNOT_DIGIT: TFIBStringField;
        FIBDS_SPPostDISPLAY_ORDER: TFIBIntegerField;
        FIBDS_SPPostID_POST_CATEGORY: TFIBIntegerField;
        FIBDS_SPPostDATE_BEG: TFIBDateField;
        FIBDS_SPPostDATE_END: TFIBDateField;
        FIBDS_SPPostADDITIONAL: TFIBStringField;
        FIBDS_SPPostID_GROUP: TFIBIntegerField;
        FIBDS_SPPostNAME_GROUP: TFIBStringField;
        IntegrityDSID: TFIBIntegerField;
        IntegrityDSNAME_TABLE: TFIBStringField;
        IntegrityDSNAME_TABLE_USER: TFIBStringField;
        IntegrityDSERROR_STRING: TFIBStringField;
        IntegrityDS: TpFIBDataSet;
        SpPostAfterEdit: TpFIBQuery;
        DigitsSelect: TpFIBDataSet;
        TarifSelect: TpFIBDataSet;
        TarifSalary: TpFIBDataSet;
        RefSalarySelectuse_digit: TIntegerField;
        StProInsertLog: TpFIBStoredProc;
        procedure FIBDS_SPPostAfterOpen(DataSet: TDataSet);
        procedure FIBDS_SPCategoryAfterScroll(DataSet: TDataSet);
        procedure FIBDS_SPPostAfterScroll(DataSet: TDataSet);
        procedure DataModuleCreate(Sender: TObject);
    private

    public
        Act_Date: TDate;
        Base_Date: TDate;
        error:Boolean;
        procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
    end;

var
    DMSPPost: TDMSPPost;
    Infinity_Date: TDate;

function TextOk(Txt: string): Boolean;
procedure ShowInfo(DataSet: TDataSet);


implementation

uses DateUtils, Registry, Windows;

{$R *.dfm}

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i: integer;
begin
    text := '';
    for i := 1 to DataSet.Fields.Count do
        text := text + DataSet.Fields[i - 1].FieldName + ' : ' + DataSet.Fields[i - 1].DisplayText + #13;
    ShowMessage(text);
end;

function TextOk(Txt: string): Boolean;
var p: integer;
begin
    p := Pos(' ', Txt);
    while (p <> 0) and (Length(Txt) <> 0) do
    begin
        Delete(Txt, p, 1);
        p := Pos(' ', Txt);
    end;
    if (Length(Txt) = 0)
        then Result := False
    else Result := True;
end;

procedure TDMSPPost.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if (Sender.Value = 'T') then
        Text := 'Так';
    if (Sender.Value = 'F') then
        Text := 'Ні';
end;


procedure TDMSPPost.FIBDS_SPPostAfterOpen(DataSet: TDataSet);
begin
    DataSet.FieldByName('Not_digit').OnGetText := GetText;
    FIBDS_SPPostAfterScroll(DataSet);
end;

procedure TDMSPPost.FIBDS_SPCategoryAfterScroll(DataSet: TDataSet);
begin
        // если фильтра по категориям не было, то и хорошо
    if VarIsNULL(FIBDS_SPPost.ParamByName('Id_Category').AsVariant) then Exit;
     
    FIBDS_SPPost.Close;
    if FIBDS_SPCategory['ID_Category'] <> Null then
        FIBDS_SPPost.ParamByName('ID_Category').AsInteger := FIBDS_SPCategory['ID_Category']
    else FIBDS_SPPost.ParamByName('ID_Category').AsVariant := Null;
    FIBDS_SPPost.ParamByName('ActDate').AsDate := Date;
    FIBDS_SPPost.Open;
end;

procedure TDMSPPost.FIBDS_SPPostAfterScroll(DataSet: TDataSet);
begin
    FIBDS_SPTypePost.Close;
    if FIBDS_SPPost['ID_Post'] <> Null then
        FIBDS_SPTypePost.ParamByName('ID_Post').AsInteger := FIBDS_SPPost['ID_Post']
    else FIBDS_SPTypePost.ParamByName('ID_Post').AsVariant := Null;
    FIBDS_SPTypePost.Open;
end;

procedure TDMSPPost.DataModuleCreate(Sender: TObject);
var
    Registry: TRegistry;
begin
        // считать из реестра дату добавления
    Registry := TRegistry.Create(KEY_READ);
    try
        Registry.RootKey := HKEY_CURRENT_USER;
        Registry.OpenKey('Software\Asup\SpPost', False);
        try
            Base_Date := Registry.ReadDate('Base_Date');
        except
            Base_Date := EncodeDate(YearOf(Date), 1, 1);
           // ShowMessage(IntToStr(YearOf(Date)));
        end;
    finally
        Registry.Free;
    end;
    error:=False;
end;


end.

