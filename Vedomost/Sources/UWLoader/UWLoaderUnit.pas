unit UWLoaderUnit;

interface

uses Forms, Windows, {Ibase,} Dialogs, SysUtils, Variants, Classes, Controls, pFIBDataBase, AArray;

resourcestring
     ErrorLLibrary   =           'Внимание, ошибка при работе с библиотекой ';
     ErrorWarningC   =           'Внимание ошибка!';

const Ved = 'Vedomost\';

function LoadUVSpBankCardEditing(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase) : Integer;stdcall;

function LoadUVSpBankCardEditingDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Integer; stdcall;

function LoadVedomostEditing(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_t : int64) : integer; stdcall;

function LoadVedomostSelect(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_t : int64) : Variant; stdcall;

function LoadUVSpBankCardTake(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean) : Variant; stdcall;

function LoadSelectVedomostTypeVd(Ao : TComponent; DB : TpfibDatabase; id_user : int64; SelectData, CanEdit : boolean) : variant; stdcall;

function LoadUVSpBankCardTakeDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Variant; stdcall;

function LoadUVSpBankCardTakePoDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean; id_dog : int64) : Variant; stdcall;

function LoadUWReestrEditing(ao : Tcomponent; db : Tpfibdatabase; id_user : integer) : integer; stdcall;

function LoadVedomostSelectPoDog(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost, id_dog_bankcard : int64) : Variant; stdcall;

function LoadImportBankCard (Aowner : TComponent; db : TpFibDatabase; id_user : int64) : integer; stdcall;

function LoadSelectVedomostOutput(Ao : Tcomponent; DB : TpfibDatabase; id_user, id_sp_type_vedom : int64; Date_beg, date_end : Tdate) : Variant; stdcall;

procedure ShowAllUwBpl (aOwner: TComponent; aParam :TAArray);


implementation

procedure ShowAllUwBpl (aOwner: TComponent;aParam :TAArray);
var
  HandlePack: HModule;
  MDIFUNC   : procedure(aOwner: TComponent;aParam :TAArray);stdcall;
begin
    HandlePack := GetModuleHandle(Pchar(aParam['Name_Bpl'].AsString));
    if HandlePack<32
    then begin
        Screen.Cursor := crHourGlass;
        HandlePack    := LoadPackage(ExtractFilePath(Application.ExeName) + Ved + aParam['Name_Bpl'].AsString);
        Screen.Cursor := crDefault;
    end;
    if HandlePack > 0 then
    begin
        @MDIFUNC := GetProcAddress(HandlePack,PChar('ShowAllUwBpl'));
        if @MDIFUNC<>nil then
        begin
            MDIFUNC(aOwner, aParam);
        end;
    end
    else begin
        MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + ' ' +aParam['Name_Bpl'].AsString), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
    end;
end;

function LoadUVSpBankCardEditing(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase) : Integer;stdcall;
var
    func : function(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase):integer; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('SpBankCard.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'SpBankCard.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack,PChar('UVSpBankCardEditing'));
        if @func<>nil
            then LoadUVSpBankCardEditing := func(AOwner, id_user, DBHandle)
            else begin
                LoadUVSpBankCardEditing := -1;
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'SpBankCard.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadUVSpBankCardEditing := -1;

end;

function LoadUVSpBankCardEditingDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Integer; stdcall;
var
    func : function(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean):integer; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('SpBankCard.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'SpBankCard.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack,PChar('UVSpBankCardEditingDog'));
        if @func<>nil
            then LoadUVSpBankCardEditingDog := func(AOwner, id_user, DBHandle, flag_edit, flag_only_dog)
            else begin
                LoadUVSpBankCardEditingDog := -1;
                MessageBox(TForm(AOwner).Handle,PChar(ErrorLLibrary + 'SpBankCard.bpl'),PChar(ErrorWarningC),MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadUVSpBankCardEditingDog := -1;

end;

function LoadVedomostEditing(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_t : int64) : Integer; stdcall;
var
    func : function(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_t : int64):integer; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('UwVedomost.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Ved +'UwVedomost.bpl');
    end;
    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('VedomostEditing'));
        if @func <> nil
            then begin
                LoadVedomostEditing := func(AO, DB, id_user, id_t);
            end
            else begin
                LoadVedomostEditing := -1;
                MessageBox(TForm(AO).Handle, PChar(ErrorLLibrary + 'UwVedomost.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadVedomostEditing := -1;

end;

function LoadVedomostSelect(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_t : int64) : Variant; stdcall;
var
    func : function(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_t : int64) : Variant; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('UwVedomost.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Ved + 'UwVedomost.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack,PChar('VedomostSelect'));
        if @func<>nil
            then LoadVedomostSelect := func(AO, DB, id_user, id_t)
            else begin
                LoadVedomostSelect := -1;
                MessageBox(TForm(AO).Handle, PChar(ErrorLLibrary + 'UwVedomost.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadVedomostSelect := -1;
end;

function LoadUVSpBankCardTake(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean) : Variant; stdcall;
var
    func : function(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean) : Variant; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('SpBankCard.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'SpBankCard.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('UVSpBankCardTake'));
        if @func<>nil
            then LoadUVSpBankCardTake := func(AOwner, id_user, DBHandle, flag_edit)
            else begin
                LoadUVSpBankCardTake := -1;
                MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'SpBankCard.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadUVSpBankCardTake := -1;
end;

function LoadSelectVedomostTypeVd(Ao : TComponent; DB : TpfibDatabase; id_user : int64; SelectData, CanEdit : boolean) : variant; stdcall;
var
    func : function(Ao : TComponent; DB : TpfibDatabase; id_user : int64; SelectData, CanEdit : boolean) : Variant; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('UWSpTypeVedomost.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Ved + 'UWSpTypeVedomost.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('SelectVedomostTypeVd'));
        if @func<>nil
            then LoadSelectVedomostTypeVd := func(Ao, DB, id_user, SelectData, CanEdit)
            else begin
                LoadSelectVedomostTypeVd := -1;
                MessageBox(TForm(AO).Handle, PChar(ErrorLLibrary + 'UWSpTypeVedomost.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadSelectVedomostTypeVd := -1;
end;

function LoadUVSpBankCardTakeDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Variant; stdcall;
var
    func : function(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit, flag_only_dog : boolean) : Variant; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('SpBankCard.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'SpBankCard.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('UVSpBankCardTakeDog'));
        if @func<>nil
            then LoadUVSpBankCardTakeDog := func(AOwner, id_user, DBHandle, flag_edit, flag_only_dog)
            else begin
                LoadUVSpBankCardTakeDog := -1;
                MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'SpBankCard.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadUVSpBankCardTakeDog := -1;
end;

function LoadUVSpBankCardTakePoDog(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean; id_dog : int64) : Variant; stdcall;
var
    func : function(AOwner : TComponent; id_user : int64; DBHandle : TpFIBDatabase; flag_edit : boolean; id_dog : int64) : Variant; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('SpBankCard.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + 'SpBankCard.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('UVSpBankCardTakePoDog'));
        if @func<>nil
            then LoadUVSpBankCardTakePoDog := func(AOwner, id_user, DBHandle, flag_edit, id_dog)
            else begin
                LoadUVSpBankCardTakePoDog := -1;
                MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'SpBankCard.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadUVSpBankCardTakePoDog := -1;
end;

function LoadUWReestrEditing(ao : Tcomponent; db : Tpfibdatabase; id_user : integer) : integer; stdcall;
var
    func : function(ao : Tcomponent; db : Tpfibdatabase; id_user : integer) : integer; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('UWReestr.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Ved + 'UWReestr.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('UWReestrEditing'));
        if @func<>nil
            then LoadUWReestrEditing := func(AO, db, id_user)
            else begin
                LoadUWReestrEditing := -1;
                MessageBox(TForm(AO).Handle, PChar(ErrorLLibrary + 'UWReestr.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadUWReestrEditing := -1;
end;

function LoadVedomostSelectPoDog(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost, id_dog_bankcard : int64) : Variant; stdcall;
var
    func : function(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost, id_dog_bankcard : int64) : Variant; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('UwVedomost.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Ved + 'UwVedomost.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('VedomostSelectPoDog'));
        if @func<>nil
            then LoadVedomostSelectPoDog := func(AO, DB, id_user, id_type_vedomost, id_dog_bankcard)
            else begin
                LoadVedomostSelectPoDog := -1;
                MessageBox(TForm(AO).Handle, PChar(ErrorLLibrary + 'UwVedomost.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadVedomostSelectPoDog := -1;
end;

function LoadImportBankCard (Aowner : TComponent; db : TpFibDatabase; id_user : int64) : integer; stdcall;
var
    func : function(Aowner : TComponent; db : TpFibDatabase; id_user : int64) : integer; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('ImportBankCard.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Ved + 'ImportBankCard.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('ImportBankCard'));
        if @func<>nil
            then LoadImportBankCard := func(AOwner, DB, id_user)
            else begin
                LoadImportBankCard := -1;
                MessageBox(TForm(AOwner).Handle, PChar(ErrorLLibrary + 'ImportBankCard.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadImportBankCard := -1;
end;

function LoadSelectVedomostOutput(Ao : Tcomponent; DB : TpfibDatabase; id_user, id_sp_type_vedom : int64; Date_beg, date_end : Tdate) : Variant; stdcall;
var
    func : function(Ao : Tcomponent; DB : TpfibDatabase; id_user, id_sp_type_vedom : int64; Date_beg, date_end : Tdate) : Variant; stdcall;
    HandlePack : HModule;
begin
    HandlePack := GetModuleHandle('UWOutputVedomost.bpl');
    if HandlePack < 32
    then begin
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Ved + 'UWOutputVedomost.bpl');
    end;

    if HandlePack > 0 then
    begin
        @func := GetProcAddress(HandlePack, PChar('SelectVedomostOutput'));
        if @func<>nil
            then LoadSelectVedomostOutput := func(Ao, DB, id_user, id_sp_type_vedom, Date_beg, date_end)
            else begin
                LoadSelectVedomostOutput := -1;
                MessageBox(TForm(AO).Handle, PChar(ErrorLLibrary + 'UWOutputVedomost.bpl'), PChar(ErrorWarningC), MB_OK and MB_ICONWARNING);
            end;

    end else
        LoadSelectVedomostOutput := -1;
end;


end.
