unit uPI_Resources;

interface

uses Dialogs, StdCtrls, Classes, IBase, FIBDataSet, pFIBDataSet, FIBDatabase,
    pFIBDatabase, IniFiles, PI_DM, SysUtils, variants, Controls, Forms;


type
    TWrongDataPrKSpr = (EmptyName, EmptyShortName, EmptyKod, ZerroKod, ThisKodExist,
        EmptyNpp, ZerroNpp, ThisNppExist, EmptyVinitPadeg,
        EmptyRoditPadeg, AllDataOk);
type
    RejimPrK = (AddPrK, ChangePrk, ViewPrK, DelPrK);

type
    TDataPrKSprav = class
    private
        FKod: integer;
        FShortName: string;
        FName: string;
        FId: Int64;
        FNpp: integer;
        procedure SetKod(const Value: integer);
        procedure SetName(const Value: string);
        procedure SetShortName(const Value: string);
        procedure SetId(const Value: Int64);
        procedure SetNpp(const Value: integer);
    public
        constructor Create(aKodMax: Integer; aNppMax: Integer); overload; virtual;
        constructor Create(aKodMax: Integer; aNppMax: Integer; aShortName: string); overload; virtual;
        constructor Create(aId: int64; aName: string; aShortName: string;
            aKod: integer; aNpp: Integer); overload;

     // Функция которая при добавлении(изм) данных проверяет их правильность
        function AddChangeData(aId: Int64; aName, aShortName: string;
            aKod: integer; aAllDataKods: variant;
            aNpp: integer; aAllDataNpps: variant): TWrongDataPrKSpr;

        property Id: Int64 read FId write SetId;
        property Kod: integer read FKod write SetKod;
        property Npp: integer read FNpp write SetNpp;
        property Name: string read FName write SetName;
        property ShortName: string read FShortName write SetShortName;
    end;

type TZFormStyle = (zfsModal, zfsNormal, zfsChild);
type TPIMode =  (CSShow, CSSelect, CSEdit, CSAdd, CSUpdate, CSDelete, CSInsert);

type TpiSimpleParam = class(TObject)
  DB_Handle:TISC_DB_HANDLE;
  Owner:TComponent;
end;

type TpiParamPacks= class(TpiSimpleParam)
            Formstyle: TFormStyle;
            mode:integer;
            ID_SESSION: Int64;
            ID_User : Int64;
            ID_Locate : int64;
            ID_Locate_1 : int64;
            ID_Locate_2 : int64;
            str_text : string;
end;

type TPIPaymentTypeParam = class(TpiSimpleParam)    //тип выплаты контингента
  Mode: set of TPIMode;  //тип множества
  ID_PAYMENT_TYPE:Int64;
  NAME_PAYMENT_TYPE:string;
  ID_VIDOPL:Int64;
  ID_TYPE_CALC: integer;
end;


Type TPIVidOplParam = class(TpiSimpleParam)        // для подгрузки видов оплат. спионерил из ЗарплатаДПК, дабы его не привязывать
  PIFormStyle:TZFormStyle;
end;

function SelectLanguage: integer; stdcall;
function SelectShemaColor: integer; stdcall;
//exports  SelectLanguage;
function VoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Id_System:integer =999):variant;

function GetImageDBHandle(MAIN_DB_HANDLE: TISC_DB_HANDLE): TISC_DB_HANDLE; // Получаем хэндл базы фотографий

function PiMessageDlg(const Caption: string; const Msg: string; const DlgType: TMsgDlgType;
    const Buttons: TMsgDlgButtons; aIndexLanguage: integer): word; stdcall;
//exports  agMessageDlg;

implementation

uses   Windows, registry, uPI_Constants, AccMgmt;
{ TDataPrKSprav }

constructor TDataPrKSprav.Create(aKodMax: Integer; aNppMax: Integer);
begin
    Kod := aKodMax + 1;
    Npp := aNppMax + 1;
    Name := '';
    ShortName := '';
end;

constructor TDataPrKSprav.Create(aKodMax: Integer; aNppMax: Integer; aShortName: string);
begin
    Kod := aKodMax + 1;
    Npp := aNppMax + 1;
    Name := '';
    ShortName := aShortName;
end;

function TDataPrKSprav.AddChangeData(aId: Int64; aName, aShortName: string;
    aKod: integer; aAllDataKods: variant;
    aNpp: integer; aAllDataNpps: variant): TWrongDataPrKSpr;
var
    i, razmer: integer;
begin
    if Trim(aName) = '' then
    begin
        result := EmptyName;
        exit;
    end;

    if Trim(aShortName) = '' then
    begin
        result := EmptyShortName;
        exit;
    end;

    if aKod = 0 then
    begin
        result := ZerroKod;
        exit;
    end;

    if aKod = Unassigned then
    begin
        result := EmptyKod;
        exit;
    end;

    if aNpp = 0 then
    begin
        result := ZerroNpp;
        exit;
    end;

    if aNpp = Unassigned then
    begin
        result := EmptyNpp;
        exit;
    end;

    if (aKod <> Kod) and (VarArrayDimCount(aAllDataKods) > 0) then
    begin
        razmer := VarArrayHighBound(aAllDataKods, 1) - VarArrayLowBound(aAllDataKods, 1);
        for i := 0 to razmer do
        begin
            if aAllDataKods[i] = aKod then
            begin
                result := ThisKodExist;
                exit;
            end;
        end;
    end;

    if (aNpp <> Npp) and (VarArrayDimCount(aAllDataNpps) > 0) then
    begin
        razmer := VarArrayHighBound(aAllDataNpps, 1) - VarArrayLowBound(aAllDataNpps, 1);
        for i := 0 to razmer do
        begin
            if aAllDataNpps[i] = aNpp then
            begin
                result := ThisNppExist;
                exit;
            end;
        end;
    end;

    Id := aId;
    Name := aName;
    ShortName := aShortName;
    Kod := aKod;
    Npp := aNpp;

    result := AllDataOk;
end;

constructor TDataPrKSprav.Create(aId: int64; aName, aShortName: string;
    aKod: integer; aNpp: Integer);
begin
    Id := aId;
    Kod := aKod;
    Npp := aNpp;
    Name := aName;
    ShortName := aShortName;
end;

procedure TDataPrKSprav.SetId(const Value: Int64);
begin
    FId := Value;
end;

procedure TDataPrKSprav.SetKod(const Value: integer);
begin
    FKod := Value;
end;

procedure TDataPrKSprav.SetNpp(const Value: integer);
begin
    FNpp := Value;
end;

procedure TDataPrKSprav.SetName(const Value: string);
begin
    FName := Value;
end;

procedure TDataPrKSprav.SetShortName(const Value: string);
begin
    FShortName := Value;
end;

{ выбор языка:  0-украинский, 1-русский}

function SelectLanguage: integer;
var
    reg: TRegistry;
    RegisterValue: integer;
begin
   //вслучае боков по умолчанию будет украинский язык
    RegisterValue := 0;
   //чтение из регистра
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PI\Languages\', false) then
        begin
            RegisterValue := reg.ReadInteger('Index');
        end;
    finally
        reg.Free;
    end;
    result := RegisterValue;
end;

{ выбор цветовой схемы:  0-желтая, 1-голубая}

function SelectShemaColor: integer;
var
    reg: TRegistry;
    RegisterValue: integer;
begin
   //вслучае боков по умолчанию будет желтая схема язык
    RegisterValue := 0;
   //чтение из регистра
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\PI\ShemaColor\', false) then
        begin
            RegisterValue := reg.ReadInteger('Color');
        end;
    finally
        reg.Free;
    end;
    result := RegisterValue;
end;

{Переделанный MessageDlg}

function PIMessageDlg(const Caption: string; const Msg: string;
    const DlgType: TMsgDlgType; const Buttons: TMsgDlgButtons;
    aIndexLanguage: integer): word;
var
    formD: TForm;
    i: integer;
begin
    if Buttons = [] then begin
        Result := 0;
        exit;
    end;
    formD := CreateMessageDialog(Msg, DlgType, Buttons);
    formD.Caption := Caption;
    for i := 0 to formD.ComponentCount - 1 do if formD.Components[i] is TButton then begin
            if UpperCase(TButton(formD.Components[i]).Caption) = 'OK' then TButton(formD.Components[i]).Caption := nMsgDlgOk[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = 'CANCEL' then TButton(formD.Components[i]).Caption := nMsgDlgCansel[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = '&YES' then TButton(formD.Components[i]).Caption := nMsgDlgYes[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = '&NO' then TButton(formD.Components[i]).Caption := nMsgDlgNo[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = '&ABORT' then TButton(formD.Components[i]).Caption := nMsgDlgAbort[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = '&RETRY' then TButton(formD.Components[i]).Caption := nMsgDlgRetry[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = '&IGNORE' then TButton(formD.Components[i]).Caption := nMsgDlgIgnore[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = '&ALL' then TButton(formD.Components[i]).Caption := nMsgDlgAll[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = '&HELP' then TButton(formD.Components[i]).Caption := nMsgDlgHelp[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = 'N&O TO ALL' then TButton(formD.Components[i]).Caption := nMsgDlgNoToAll[aIndexLanguage];
            if UpperCase(TButton(formD.Components[i]).Caption) = 'YES TO &ALL' then TButton(formD.Components[i]).Caption := nMsgDlgYesToAll[aIndexLanguage];
        end;
    Result := formD.ShowModal;
end;

function GetImageDBHandle(MAIN_DB_HANDLE: TISC_DB_HANDLE): TISC_DB_HANDLE;
var
    CurrUserInfo: AccMgmt.TUserInfo;
    ResultInfo: AccMgmt.TResultInfo;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    pShowFoto: Variant;
    F: TIniFile;
    ImagePath: string;
begin
    CurrUserInfo := AccMgmt.fibGetCurrentUserInfo;
{ Первый шаг проверки - разрешено ли использование пакета фотографий,
  второй шаг - проверка на наличие базы, т.к. мало ли что можно отметить в таблице}
// Первый шаг

    Result := nil;
    DB := TpFIBDatabase.Create(nil);
    ReadTransaction := TpFIBTransaction.Create(nil);
    DSet := TpFIBDataSet.Create(nil);

    ReadTransaction.DefaultDatabase := DB;
    DB.DefaultTransaction := ReadTransaction;
    DSet.Database := DB;
    DSet.Transaction := ReadTransaction;

    DB.Handle := MAIN_DB_HANDLE;
    ReadTransaction.Active := True;
    DSet.SQLs.SelectSQL.Text := 'SELECT SHOW_FOTO FROM PUB_SYS_DATA';
    DSet.Open;
    pShowFoto := DSet['SHOW_FOTO'];

    ReadTransaction.Active := False;
    DSet.Free;
    ReadTransaction.Free;
    DB.Free;

    if pShowFoto <> 1 then Exit; // Не повезло.

// Второй шаг

// Проверяем на наличие базы по ее пути в config.ini
    F := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\config.ini');
    try
        ImagePath := F.ReadString('IMAGE_CONNECTION', 'Path', '');
    finally;
        F.Free;
    end;

    if ImagePath = '' then Exit; // Не повезло.

// Пытаемся установить подключение
    ResultInfo := AccMgmt.fibInitImageConnection(CurrUserInfo.UserName, CurrUserInfo.Password);
    if ResultInfo.ErrorCode <> ACCMGMT_OK then // ошибка
        if ResultInfo.ErrorCode = -12 then
    {... т.е. если ошибка "Невірне ім'я або пароль"(а она появляется при повторной
    загрузке справочника физических лиц, то мы вызываем fibInitImageConnection
    снова и база, закрытая предыдущим вызовом, вновь открывается. Вот так вот,
    и не надо нигде запоминать хэндл базы.}
        begin
            ResultInfo := AccMgmt.fibInitImageConnection(CurrUserInfo.UserName, CurrUserInfo.Password);
            if ResultInfo.ErrorCode <> ACCMGMT_OK then // ошибка, мало ли чего...
                Result := nil
            else
                Result := ResultInfo.DBHandle;
        end
        else
            Result := nil
    else
        Result := ResultInfo.DBHandle;
end;

function VoByKod(Kod:integer;ActualDate:Tdate;DB_Handle:TISC_DB_HANDLE;Id_System:integer =999):variant;
var DM:TPI_DataMod;
    res:variant;
begin

 Res:=Null;
 DM := TPI_DataMod.Create(Application.MainForm);

 DM.DB.Handle := DB_Handle;

 with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName := 'CS_VIDOPL_BY_KOD';
   Prepare;

   ParamByName('AKOD_VIDOPL').AsInteger := Kod;
   ParamByName('ACTUAL_DATE').AsDate    := ActualDate;
   ParamByName('ID_SYSTEM').AsInteger   := Id_System;

   ExecProc;

   res:=VarArrayCreate([0,2],varVariant);
   Res[0] := ParamByName('ID_VIDOPL').AsVariant;
   Res[1] := ParamByName('KOD_VIDOPL').AsVariant;
   Res[2] := ParamByName('NAME_VIDOPL').AsVariant;
   Transaction.Commit;
  except
   on E:exception do
    begin
     ShowMessage('Помилка відоплати');
     Transaction.Rollback;
    end;
  end;
  DM.Free;
 Result:=res;
end;

end.
