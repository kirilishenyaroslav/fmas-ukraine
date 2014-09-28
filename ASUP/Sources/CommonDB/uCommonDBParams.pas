unit uCommonDBParams;

interface

uses Variants, DB, Controls;

type

    TCommonDBParams = class(TObject)
    private
        FParamNames: array of string;
        FParamValues: array of Variant;

        function ReadValue(s: string): Variant;
        procedure SetValue(s: string; value: Variant);
    public
        property Values[s: string]: Variant read ReadValue write SetValue; default;

        procedure SetDate(s: string; Date: TDate);

        function Substitute(s: string; params: string;
            QuoteStr: Boolean = True): string;

        procedure StoreFields(DataSet: TDataSet; Fields: string);

        procedure Clear;
    end;

resourcestring
    errCommonDBParamNotFound = 'TCommonDBParams.ReadValue: Параметр не знайдено!';

function VariantToString(value: Variant; QuoteStr: Boolean = True): string;

implementation

uses Math, SysUtils;

procedure TCommonDBParams.StoreFields(DataSet: TDataSet; Fields: string);
var
    p: Integer;
    fieldName: string;
    field: TField;
begin
    if DataSet.IsEmpty then Exit;

    fields := Trim(fields) + ',';
    repeat
        p := Pos(',', fields);
        fieldName := Copy(fields, 1, p - 1);
        fields := Trim(Copy(fields, p + 1, Length(fields)));

        field := DataSet.FindField(fieldName);
        if field <> nil then
            SetValue(fieldName, field.Value);
    until fields = '';
end;

function TCommonDBParams.Substitute(s: string; params: string;
    QuoteStr: Boolean = True): string;
var
    p: Integer;
    param: string;
    value: Variant;
    valStr: string;
begin
    params := Trim(params) + ',';
    repeat
        p := Pos(',', params);
        param := Copy(params, 1, p - 1);
        params := Trim(Copy(params, p + 1, Length(params)));

        value := ReadValue(param);
        valStr := VariantToString(value, QuoteStr);

        s := StringReplace(s, ':' + param, valStr, [rfReplaceAll, rfIgnoreCase]);
    until params = '';
    Result := s;
end;

function VariantToString(value: Variant; QuoteStr: Boolean = True): string;
var
    h, m, s, msec: Word;
    mstr: string;
    ds: Char;
begin
    case VarType(value) of
        varNull, varEmpty: Result := 'Null';
        varInteger, varSmallint, varByte, varWord: Result := IntToStr(value);
        varString:
            if QuoteStr then Result := QuotedStr(value)
            else Result := value;
        varDouble, varSingle:
            begin
                ds := DecimalSeparator;
                DecimalSeparator := '.';
                Result := FloatToStr(value);
                DecimalSeparator := ds;
            end;
        varDate:
            if value < StrToDate('01.01.1900') then
            begin
                Result := '''';
                DecodeTime(value, h, m, s, msec);
                mstr := IntToStr(m);
                if Length(mstr) < 2 then mstr := '0' + mstr;
                Result := Result + IntToStr(h) + ':' + mstr;

                if s <> 0 then
                begin
                    mstr := IntToStr(s);
                    if Length(mstr) < 2 then mstr := '0' + mstr;
                    Result := Result + ':' + mstr;
                end;

                Result := Result + ''''
            end
            else Result := QuotedStr(DateTimeToStr(value));
        varCurrency:
            begin
                ds := DecimalSeparator;
                DecimalSeparator := '.';
                Result := CurrToStr(value);
                DecimalSeparator := ds;
            end
    else
        if QuoteStr then Result := QuotedStr(value.AsString)
        else Result := value.AsString;
    end;
end;

function TCommonDBParams.ReadValue(s: string): Variant;
var
    i: Integer;
begin
    Result := Null;

    s := AnsiUpperCase(Trim(s));

    for i := 0 to High(FParamNames) do
        if FParamNames[i] = s then
        begin
            Result := FParamValues[i];
            Exit;
        end;
    raise Exception.Create(errCommonDBParamNotFound + ' (' + s + ')');
end;

procedure TCommonDBParams.SetValue(s: string; value: Variant);
var
    i: Integer;
begin
    s := AnsiUpperCase(Trim(s));

    for i := 0 to High(FParamNames) do
        if FParamNames[i] = s then
        begin
            FParamValues[i] := value;
            Exit;
        end;
    SetLength(FParamNames, Length(FParamNames) + 1);
    SetLength(FParamValues, Length(FParamValues) + 1);
    FParamNames[High(FParamNames)] := s;
    FParamValues[High(FParamValues)] := value;
end;

procedure TCommonDBParams.SetDate(s: string; Date: TDate);
var
    val: Variant;
begin
    val := Date;
    SetValue(s, val);
end;

procedure TCommonDBParams.Clear;
begin
    SetLength(FParamNames, 0);
    SetLength(FParamValues, 0);
end;

end.
