{*******************************************************************************
* qFTools                                                                      *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Утилиты для работы со множеством контролов                                   *
* (проверить все, считать из базы, преобразовать текст запроса)                *
* Copyright ©  2005, Олег Г. Волков, Донецкий Национальный Университет         *
*******************************************************************************}

unit qFTools;

interface

uses Classes, DB, Forms, Registry, Windows, Controls;

function qFCheckAll(Owner: TComponent; Parent: TComponent = nil): Boolean;
procedure qFReadData(DataSet: TDataSet; Owner: TComponent; Parent: TComponent = nil);
function qFSubsParams(SQL: string; Owner: TComponent; Parent: TComponent = nil): string;
procedure qFBlock(Flag: Boolean; Owner: TComponent; Parent: TComponent = nil);

procedure qFErrorDialog(error: string);
procedure qFInformDialog(Inform: string);
function qFConfirmEx(msg: string; YesFocus: Boolean = True): Boolean;
function qFConfirm(msg: string): Boolean;

function qFNotEmpty(value: Variant): Boolean;
function qFVariantToString(value: Variant): string;
function Coalesce(MainValue, DefaultValue: Variant): Variant;

procedure qFAutoLoadFromRegistry(Owner: TComponent; Parent: TComponent = nil); // vallkor
procedure qFAutoSaveIntoRegistry(Owner: TComponent; Parent: TComponent = nil); // vallkor

procedure qFSafeFocusControl(Control: TWinControl);
procedure qFSetFocus(Owner: TComponent; Parent: TComponent = nil);

implementation

uses uFControl, Dialogs, SysUtils, uLogicCheck, qFStrings, uSpravControl,
    StdCtrls, Variants;

function Coalesce(MainValue, DefaultValue: Variant): Variant;
begin
    if VarIsNull(MainValue) then Result := DefaultValue
    else Result := MainValue;
end;

procedure qFSafeFocusControl(Control: TWinControl);
begin
    try
        Control.SetFocus;
    except
    end;
end;

function qFConfirm(msg: string): Boolean;
begin
    Result := qFConfirmEx(msg);
end;

function qFConfirmEx(msg: string; YesFocus: Boolean = True): Boolean;
var
    dlg: TForm;
    i: Integer;
    b: TButton;
begin
    dlg := CreateMessageDialog(msg, mtConfirmation, [mbYes, mbNo]);
    dlg.Caption := qFConfirmCaption;
    for i := 0 to dlg.ComponentCount - 1 do
        if dlg.Components[i] is TButton then
        begin
            b := dlg.Components[i] as TButton;
            if b.Name = 'Yes' then
            begin
                b.Caption := qFYesCaption;
                if YesFocus then dlg.ActiveControl := b;
            end;
            if b.Name = 'No' then
            begin
                b.Caption := qFNoCaption;
                if not YesFocus then dlg.ActiveControl := b;
            end;
        end;
    Result := (dlg.ShowModal = mrYes);
    dlg.Free;
end;

procedure qFErrorDialog(error: string);
var
    dlg: TForm;
begin
    dlg := CreateMessageDialog(error, mtError, [mbOk]);
    dlg.Caption := qFErrorCaption;
    dlg.ShowModal;
    dlg.Free;
end;

procedure qFInformDialog(Inform: string); // vallkor
var
    dlg: TForm;
begin
    dlg := CreateMessageDialog(Inform, mtInformation, [mbOk]);
    dlg.Caption := qFInformCaption;
    dlg.ShowModal;
    dlg.Free;
end;

function qFCheckAll(Owner: TComponent; Parent: TComponent = nil): Boolean;
var
    i: Integer;
    first, ctrl: TqFControl;
    firstErr, err: string;
    check, badcheck: TqFLogicCheck;
begin
    first := nil;
    for i := 0 to Owner.ComponentCount - 1 do
        if Owner.Components[i] is TqFControl then
        begin
            ctrl := Owner.Components[i] as TqFControl;

            if not ctrl.Enabled then continue;

            if (Parent <> nil) and (ctrl.Parent <> Parent) then continue;

            ctrl.Highlight(False);
            err := ctrl.Check;

            if (first = nil) and (err <> '') then
            begin
                first := ctrl;
                firstErr := err;
            end;

            if err <> '' then ctrl.Highlight(True);
        end;

    badcheck := nil;
    for i := 0 to Owner.ComponentCount - 1 do
        if Owner.Components[i] is TqFLogicCheck then
        begin
            check := Owner.Components[i] as TqFLogicCheck;

            if (Parent <> nil) and (check.Parent <> Parent) then continue;

            check.Highlight(False);
            if not check.Check then
            begin
                check.Highlight(True);
                if badcheck = nil then badcheck := check;
            end;
        end;

    if first <> nil then
    begin
        qFErrorDialog(firstErr);
        first.ShowFocus;
        Result := False;
    end
    else
        if badcheck <> nil then
        begin
            qFErrorDialog(badcheck.Error);
            Result := False;
        end
        else Result := True;
end;

procedure qFReadData(DataSet: TDataSet; Owner: TComponent; Parent: TComponent = nil);
var
    i: Integer;
    ctrl: TqFControl;
begin
    for i := 0 to Owner.ComponentCount - 1 do
        if Owner.Components[i] is TqFControl then
        begin
            ctrl := Owner.Components[i] as TqFControl;

            if (Parent <> nil) and (ctrl.Parent <> Parent) then continue;

            ctrl.Load(DataSet);
        end;
end;

procedure qFAutoLoadFromRegistry(Owner: TComponent; Parent: TComponent = nil); // vallkor
var
    i: Integer;
    ctrl: TqFControl;
    reg: TRegistry;
    key, ownerName: string;
begin
    for i := 0 to Owner.ComponentCount - 1 do
        if Owner.Components[i] is TqFControl then
        begin
            ctrl := Owner.Components[i] as TqFControl;

            if (Parent <> nil) and (ctrl.Parent <> Parent) then continue;

            if not ctrl.AutoSaveToRegistry then
                continue;

            reg := TRegistry.Create;

            try
                reg.RootKey := HKEY_CURRENT_USER;

                if Owner <> nil then ownerName := Owner.Name
                else ownerName := '<unknown owner>';

                key := '\Software\Qizz Software\TqFControl\' +
                    ExtractFileName(Application.ExeName) + '\' + ownerName + '\' + ctrl.Name;

                if reg.OpenKey(key, False) then
                begin
                    ctrl.LoadFromRegistry(reg);
                    reg.CloseKey;
                end;

            except;
            end;

            reg.Free;

        end;
end;

procedure qFAutoSaveIntoRegistry(Owner: TComponent; Parent: TComponent = nil); // vallkor
var
    i: Integer;
    ctrl: TqFControl;
    reg: TRegistry;
    key, ownerName: string;
begin
    for i := 0 to Owner.ComponentCount - 1 do
        if Owner.Components[i] is TqFControl then
        begin
            ctrl := Owner.Components[i] as TqFControl;

            if (Parent <> nil) and (ctrl.Parent <> Parent) then continue;

            if not ctrl.AutoSaveToRegistry then
                continue;

            reg := TRegistry.Create;

            try
                reg.RootKey := HKEY_CURRENT_USER;

                if Owner <> nil then
                    ownerName := Owner.Name
                else
                    ownerName := '<unknown owner>';

                key := '\Software\Qizz Software\TqFControl\' +
                    ExtractFileName(Application.ExeName) + '\' + ownerName + '\' + ctrl.Name;

                if reg.OpenKey(key, True) then
                begin
                    ctrl.SaveIntoRegistry(reg);
                    Reg.CloseKey;
                end;
            finally
                reg.Free;
            end;

        end;
end;

procedure qFBlock(Flag: Boolean; Owner: TComponent; Parent: TComponent = nil);
var
    i: Integer;
    ctrl: TqFControl;
begin
    for i := 0 to Owner.ComponentCount - 1 do
        if Owner.Components[i] is TqFControl then
        begin
            ctrl := Owner.Components[i] as TqFControl;
            if ctrl.Enabled then
            begin
                ctrl.Block(Flag);
                ctrl.Asterisk := False;
            end;
        end;
end;

function qFSubsParams(SQL: string; Owner: TComponent; Parent: TComponent = nil): string;
var
    i, curr, state: Integer;
    c: char;
    param: string;
    ctrl: TqFControl;
    found: Boolean;
begin
    Result := '';

    SQL := SQL + ' '; // чтоб всегда находили последний параметр
    state := 1;
    for curr := 1 to Length(SQL) do
    begin
        c := SQL[curr];
        case state of
            1: // ищем двоеточие или кавычку
                case c of
                    ':': begin param := ''; state := 3; end;
                    '''': begin Result := Result + c; state := 2; end;
                else Result := Result + c;
                end;
            2: // ищем вторую кавычку
                case c of
                    '''': begin Result := Result + c; state := 1; end;
                else Result := Result + c;
                end;
            3: // ищем конец параметра
                if not (((c >= 'A') and (c <= 'Z'))
                    or
                    ((c >= 'a') and (c <= 'z'))
                    or
                    ((c >= '0') and (c <= '9'))
                    or (c = '_'))
                    then // параметр кончился
                begin
                    found := False;
                    for i := 0 to Owner.ComponentCount - 1 do
                        if Owner.Components[i] is TqFControl then
                        begin
                            ctrl := Owner.Components[i] as TqFControl;

                            if not ctrl.Enabled then continue;

                            if (Parent <> nil) and (ctrl.Parent <> Parent)
                                then continue;

                            if UpperCase(ctrl.FieldName) = UpperCase(param) then
                            begin
                                Result := Result + ctrl.ToString + c;
                                state := 1;
                                found := True;
                                break;
                            end;
                        end;
                    if not found then
                    begin
                        Result := Result + ':' + param + c;
                        state := 1;
                    end;
                end
                else param := param + c;
        end;
    end;
end;


function qFNotEmpty(value: Variant): Boolean;
begin
    if VarIsNull(value) or VarIsNull(value) then
    begin
        Result := False;
        Exit;
    end;
    if VarType(value) = varString then
        Result := value <> ''
    else Result := True;
end;

function qFVariantToString(value: Variant): string;
var
    h, m, s, msec: Word;
    mstr: string;
    ds: Char;
begin
    case VarType(value) of
        varNull, varEmpty:
            Result := 'Null';
        varInteger, varSmallint, varByte, varWord, varInt64:
            Result := IntToStr(value);
        varString:
            Result := value;
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
            end;
        varBoolean:
            begin
                if Value then Result := '1'
                else Result := '0';
            end;
    else
        Result := Unassigned;
    end;
end;

procedure qFSetFocus(Owner: TComponent; Parent: TComponent = nil);
var
    i: Integer;
    ctrl: TqFControl;
    minTabOrder: Integer;
begin
    minTabOrder := 666;

    for i := 0 to Owner.ComponentCount - 1 do
        if Owner.Components[i] is TqFControl then
        begin
            ctrl := Owner.Components[i] as TqFControl;

            if (Parent <> nil) and (ctrl.Parent <> Parent) then continue;

            if not ctrl.Blocked and (ctrl.TabOrder < minTabOrder) then
                minTabOrder := ctrl.TabOrder;
        end;

    for i := 0 to Owner.ComponentCount - 1 do
        if Owner.Components[i] is TqFControl then
        begin
            ctrl := Owner.Components[i] as TqFControl;

            if (Parent <> nil) and (ctrl.Parent <> Parent) then continue;

            if not ctrl.Blocked and (ctrl.TabOrder = minTabOrder) then
            begin
                ctrl.ShowFocus;
                break;
            end;
        end;
end;


end.

