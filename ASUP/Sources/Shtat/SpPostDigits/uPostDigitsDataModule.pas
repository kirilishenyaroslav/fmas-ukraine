unit uPostDigitsDataModule;

interface

uses
    SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
    TdmPostDigits = class(TDataModule)
        Database: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        DefaultTransaction: TpFIBTransaction;
        SelectPostDigits: TpFIBDataSet;
        PostDigitsSource: TDataSource;
        SelectPostDigitsID_POST_DIGIT: TFIBIntegerField;
        SelectPostDigitsNUM_DIGIT: TFIBIntegerField;
        SelectPostDigitsDATE_BEG: TFIBDateField;
        SelectPostDigitsDATE_END: TFIBDateField;
        SelectPostDigitsKOEFF: TFIBFloatField;
        CheckPost: TpFIBDataSet;
        SelectPostDigitsDIG_BEG: TFIBDateField;
        SelectPostDigitsDIG_END: TFIBDateField;
        SelectPostDigitsSUMMA: TFIBFloatField;
        SelectPostDigitsKOEFF_STR: TStringField;
        procedure SelectPostDigitsCalcFields(DataSet: TDataSet);
        procedure SelectPostDigitsAfterScroll(DataSet: TDataSet);
        procedure SelectPostDigitsAfterOpen(DataSet: TDataSet);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    dmPostDigits: TdmPostDigits;

implementation

{$R *.dfm}

procedure TdmPostDigits.SelectPostDigitsCalcFields(DataSet: TDataSet);
begin
//    if not DataSet.IsEmpty then
    DataSet['Koeff_Str'] := FormatFloat('###0.00', DataSet['Koeff']) +
        ' (з ' + DateToStr(DataSet['Dig_Beg']) + ' по ' +
        DateToStr(DataSet['Dig_End']) + ')';
end;

procedure TdmPostDigits.SelectPostDigitsAfterScroll(DataSet: TDataSet);
begin
    if not DataSet.IsEmpty then
        SelectPostDigitsCalcFields(DataSet);
end;

procedure TdmPostDigits.SelectPostDigitsAfterOpen(DataSet: TDataSet);
begin
    if not DataSet.IsEmpty then
        SelectPostDigitsCalcFields(DataSet);
end;

end.

