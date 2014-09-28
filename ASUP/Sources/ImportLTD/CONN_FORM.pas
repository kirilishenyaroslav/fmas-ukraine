unit CONN_FORM;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ADODB, Db, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, StdCtrls,
    FIBQuery, pFIBQuery, pFIBStoredProc, Buttons, Halcn6db, variants, crc32,
    ComCtrls, ExtCtrls;
type
    TForm1 = class(TForm)
        Box1: TGroupBox;
        done_Edit: TRichEdit;
        Box2: TGroupBox;
        Panel: TPanel;
        CloseButton: TSpeedButton;
        ExchangeButton: TSpeedButton;
        Bar: TProgressBar;
        upvchm_database: TpFIBDatabase;
        u_dataset: TpFIBDataSet;
        u_StoredProc: TpFIBStoredProc;
        write_u: TpFIBTransaction;
        read_u: TpFIBTransaction;
        HalcyonDataSet: THalcyonDataSet;
        GroupBox3: TGroupBox;
        table_name: TLabel;
        table: TLabel;
        Label1: TLabel;
        Label3: TLabel;
        all: TLabel;
        done: TLabel;
        GroupBox4: TGroupBox;
        sp_podrb: TCheckBox;
        waccount: TCheckBox;
        nachisl: TCheckBox;
        error_edit: TRichEdit;
    Clear_WAccount: TpFIBQuery;
        procedure ReadIniFile(const name: string);
        procedure ReadInihalc(const name: string);
        procedure zabor_sp_PODRB;
        procedure zabor_WACCOUNT;
        procedure zabor_NACHISL;
        procedure sys_options;
        procedure FormCreate(Sender: TObject);
        procedure ExchangeButtonClick(Sender: TObject);
        procedure CloseButtonClick(Sender: TObject);
        function read_ini(const table: string): string;
        procedure add_error(error: string; no_r: integer);
        procedure add_done(done: string; no_r: integer; name: string);
        function compare_crc32(crc32_read: string): boolean;
        procedure HalcyonDataSetNewRecord(DataSet: TDataSet);
        procedure done_EditChange(Sender: TObject);
        procedure error_EditChange(Sender: TObject);

//    procedure Button1Click(Sender: TObject);
    //    procedure Button1Click(Sender: TObject);
//    function chislo(const a:string;var t:integer;var l:integer):string;
    private
        clearMonthData: array of Integer;
        clearYearData: array of Integer;
        
    public
    { Public declarations }
    end;
function VFloatToString(field: TField): string;

var
    Form1: TForm1;

implementation
uses inifiles;
const INI_FILENAME = 'App.Ini';
const INI_FNN = 'not_null.ini';
const log_error = 'log_error.txt';
const log_done = 'log_done.txt';
    fname = 'log.ini';
var APP_PATH,
    DB_PATH,
        DB_USER,
        DB_PASSWORD, ID,
        ADO_STRING, SYSTEM_F, L_SYSTEM_F, crc32_: string;
    MAX_TIMESTAMP, Min_TIMESTAMP, id_server: string;
    crc32_str, fieldname: string;
    val: variant;
    crc32_mine: string;
    date_form: TFormatSettings;
    f: boolean;
    k_kod_podr, b_kod_podr, INDEX: string;
    no_r: integer;
    a: array[1..4] of char;
    field: Tfield;
    res: integer;
    fi, error_f, done_f: text;

{$R *.DFM}

procedure TForm1.sys_options;
var
    IniFile: TIniFile;
    L_name_parent: string;
begin
    u_dataset.active := false;
    u_dataset.SQLs.SelectSQL.Text := 'select * from SYS_OPTIONS';
    try
        u_dataset.active := true;
        MAX_TIMESTAMP := u_dataset.FieldByName('MAX_TIMESTAMP').ASSTRING;
        MIN_TIMESTAMP := u_dataset.FieldByName('MIN_TIMESTAMP').ASSTRING;
        ID_SERVER := u_dataset.FieldByName('ID_SERVER').ASSTRING;
    except
        add_error('empty sys_options', 1);
        MAX_TIMESTAMP := '30.12.9999 00:00';
        MIN_TIMESTAMP := '01.01.1975 00:00';
        ID_SERVER := '1';
    end;
    APP_PATH := GetCurrentDir + '\';
    if not FileExists(APP_PATH + INI_FNN) then
    begin
        add_error('not', 21);
        exit;
    end;
    IniFile := TIniFile.Create(APP_PATH + INI_FNN);
    L_name_parent := IniFile.ReadString('sp_podrb', 'name_parent', L_name_parent);
    IniFile.Free;
    u_StoredProc.Transaction := Write_u;
    u_StoredProc.Transaction.StartTransaction;
    with u_dataset do
    begin
        active := false;
        SQLs.SelectSQL.Text := 'select ID_department from sp_podrb where id_podrb=' + '-' +
            id_server;
        active := true;                                     
        if (RecordCount = 0)
            then
            u_StoredProc.ExecProcedure('SP_PODRB_INSERT', [L_name_parent, -STRTOINT(id_server), strtoint(id_server), -strtoint(id_server), -strtoint(id_server)]);
    end;
    u_StoredProc.Transaction.Commit;
end;


procedure TForm1.add_error(error: string; no_r: integer);
var
    i, type_error: integer;
begin
    type_error := 0;
    if (error = 'done')
        then type_error := 1;
    if (error = 'empty sys_options')
        then type_error := 2;
    if (error = 'block')
        then type_error := 3;
    if (error = 'id_action')
        then type_error := 4;
    if (error = 'system_f')
        then type_error := 5;
    if (error = 'cdx')
        then type_error := 6;
    if (error = 'dbf')
        then type_error := 7;
    if (error = 'database')
        then type_error := 8;
    if (error = 'inc')
        then type_error := 9;
    if (error = 'vo_k')
        then type_error := 10;
    if (error = 'id_postk')
        then type_error := 11;
    if (error = 'k_kod_podr')
        then type_error := 12;
    if (error = 'month')
        then type_error := 13;
    if (error = 'year')
        then type_error := 14;
    if (error = 'crc32')
        then type_error := 15;
    if (error = 'app')
        then type_error := 16;
    if (error = 'not')
        then type_error := 17;
    if (error = 'id_podrb')
        then type_error := 18;
    if (error = 'id_parent')
        then type_error := 19;
    case type_error of
        0:
            begin
                writeln(error_f, datetimetostr(NOW) + ' неизвестная ошибка в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' неизвестная ошибка в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        1:
            begin
                writeln(done_f, datetimetostr(NOW) + ' проигнорирована обработанная запись ' + inttostr(no_r) + ' в таблице ' + db_path);
                error_edit.lines.add(datetimetostr(NOW) + ' проигнорирована обработанная запись ' + inttostr(no_r) + ' в таблице ' + db_path);
            end;
        2:
            begin
                writeln(error_f, datetimetostr(NOW) + ' не удалось считать данные из таблицы SYS_OPTIONS');
                error_edit.lines.add(datetimetostr(NOW) + ' не удалось считать данные из таблицы SYS_OPTIONS');
            end;
        3:
            begin
                writeln(error_f, datetimetostr(NOW) + ' ошибка, не удалось заблокировать в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' ошибка, не удалось заблокировать в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        4:
            begin
                writeln(error_f, datetimetostr(NOW) + ' ошибка в поле ID_ACTION в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' ошибка в поле ID_ACTION в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        5:
            begin
                writeln(error_f, datetimetostr(NOW) + ' ошибка SYSTEM_F в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' ошибка SYSTEM_F в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        6:
            begin
                writeln(error_f, datetimetostr(NOW) + ' ошибка, не удалось подключить ' + DB_PATH + '.cdx');
                error_edit.lines.add(datetimetostr(NOW) + ' ошибка, не удалось подключить ' + DB_PATH + '.cdx');
            end;
        7:
            begin
                writeln(error_f, 'не удалось подключить dbf таблицу ' + db_path);
                error_edit.lines.add('не удалось подключить dbf таблицу ' + db_path);
            end;
        8:
            begin
                writeln(error_f, 'нет доступа к БД UPVCHM');
                error_edit.lines.add('нет доступа к БД UPVCHM');
            end;
        9:
            begin
                writeln(error_f, datetimetostr(NOW) + ' некорректность действий  ID_ACTION в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' некорректность действий  ID_ACTION в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        10:
            begin
                writeln(error_f, datetimetostr(NOW) + ' такого VO_K не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' такого VO_K не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        11:
            begin
                writeln(error_f, datetimetostr(NOW) + ' такого ID_POSTK не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' такого ID_POSTK не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        12:
            begin
                writeln(error_f, datetimetostr(NOW) + ' такого K_KOD_PODR не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' такого K_KOD_PODR не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        13:
            begin
                writeln(error_f, datetimetostr(NOW) + ' такого месяца не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' такого месяца не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        14:
            begin
                writeln(error_f, datetimetostr(NOW) + ' такого года не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' такого года не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        15:
            begin
                writeln(error_f, datetimetostr(NOW) + ' ошибка CRC32  в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' ошибка CRC32  в таблице ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        16:
            begin
                writeln(error_f, 'Ошибка, файл app.ini не существует');
                error_edit.lines.add('Ошибка, файл app.ini не существует');
            end;
        17:
            begin
                writeln(error_f, 'Ошибка, файл not_null.ini не существует');
                error_edit.lines.add('Ошибка, файл not_null.ini не существует');
            end;
        18:
            begin
                writeln(error_f, datetimetostr(NOW) + ' подразделение с таким ID существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' подразделение с таким ID существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        19:
            begin
                writeln(error_f, datetimetostr(NOW) + ' родительского подразделения не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
                error_edit.lines.add(datetimetostr(NOW) + ' родительского подразделения не существует  в базе данных,   таблица ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;

    end;

end;

procedure TForm1.add_done(done: string; no_r: integer; name: string);
var
    i, type_done: integer;
begin
    type_done := 0;
    if (done = 'add')
        then type_done := 1;
    if (done = 'edit')
        then type_done := 2;
    if (done = 'del')
        then type_done := 3;

    case type_done of
        0:
            begin
                writeln(done_f, datetimetostr(NOW) + ' ' + DB_PATH + ' запись ' + inttostr(no_r));
                done_edit.Lines.Add(datetimetostr(NOW) + ' ' + DB_PATH + ' запись ' + inttostr(no_r));
            end;
        1:
            begin
                writeln(done_f, datetimetostr(NOW) + ' запись ' + inttostr(no_r) + ' успешно добавлена в таблицу ' + name);
                done_edit.Lines.Add(datetimetostr(NOW) + ' запись ' + inttostr(no_r) + ' успешно добавлена в таблицу ' + name);
            end;
        2:
            begin
                writeln(done_f, datetimetostr(NOW) + ' запись ' + inttostr(no_r) + ' успешно изменена в таблице ' + name);
                done_edit.Lines.Add(datetimetostr(NOW) + ' запись ' + inttostr(no_r) + ' успешно изменена в таблице ' + name);
            end;
        3:
            begin
                writeln(done_f, datetimetostr(NOW) + ' запись ' + inttostr(no_r) + ' успешно удалена  из таблицы ' + name);
                done_edit.Lines.Add(datetimetostr(NOW) + ' запись ' + inttostr(no_r) + ' успешно удалена  из таблицы ' + name);
            end;
    end;

end;


procedure TForm1.ReadIniFile(const name: string);
var
    IniFile: TIniFile;
begin
    APP_PATH := GetCurrentDir + '\';
    if not FileExists(APP_PATH + INI_FILENAME) then exit;
    IniFile := TIniFile.Create(APP_PATH + INI_FILENAME);
    DB_PATH := IniFile.ReadString(name, 'Path', DB_PATH);
    DB_USER := IniFile.ReadString(name, 'User', DB_USER);
    DB_PASSWORD := IniFile.ReadString(name, 'Password', DB_PASSWORD);
    IniFile.Free;
end;

procedure TForm1.ReadInihalc(const name: string);
var
    IniFile: TIniFile;
begin
    APP_PATH := GetCurrentDir + '\';
 //name:='+name+';
    if not FileExists(APP_PATH + INI_FILENAME) then exit;
    IniFile := TIniFile.Create(APP_PATH + INI_FILENAME);
    DB_PATH := IniFile.ReadString(name, 'Path', DB_PATH);
    IniFile.Free;
end;

function TForm1.read_ini(const table: string): string;
var
    IniFile: TIniFile;
begin
    APP_PATH := GetCurrentDir + '\';
    if not FileExists(APP_PATH + INI_FNN) then exit;
    IniFile := TIniFile.Create(APP_PATH + INI_FNN);
    ID := IniFile.ReadString(table, 'ID', ID);
    IniFile.Free;
    Result := ID;
end;




procedure TForm1.zabor_sp_podrb;
var
    field: Tfield;
    IniFile: TIniFile;
    i, new_id, kol: INTEGER;
    fi: file;
    PARENT_NAME, NO_PARENT: string;
    ID_PODR: INTEGER;
    L_ID_PODRB, L_name_PARENT, L_PODR_NAME, L_ID_ACTION, L_DATE_PROCK, L_DATE_PROCB, L_TIME_PROCK, L_TIME_PROCB: string;
    ID_PODRB, ID_PARENT, PODR_NAME, ID_ACTION, DATE_PROCK, DATE_PROCB, TIME_PROCK, TIME_PROCB: string;
    id_department, id_parent_val: string;
    ERRor: BOOLEAN;
    l_crc32, id_pbkey: string;
    S: set of char;
label HOME, home1;
begin
    begin
        APP_PATH := GetCurrentDir + '\';
        if not FileExists(APP_PATH + INI_FILENAME) then
        begin
            add_error('app', 21);
            exit;
        end;
        IniFile := TIniFile.Create(APP_PATH + INI_FILENAME);
        ADO_STRING := IniFile.ReadString('ado', 'Conn_string', ADO_STRING);
        IniFile.Free;

        APP_PATH := GetCurrentDir + '\';

        if not FileExists(APP_PATH + INI_FNN) then
        begin
            add_error('not', 21);
            exit;
        end;
        IniFile := TIniFile.Create(APP_PATH + INI_FNN);
        L_SYSTEM_F := IniFile.ReadString('main', 'system_f', L_SYSTEM_F);
        L_crc32 := IniFile.ReadString('main', 'crc32', L_crc32);
// L_name_parent:= IniFile.ReadString('sp_podrb', 'name_parent', L_name_parent);
        IniFile.Free;
    end;

    halcyondataset.Active := false;
    READINIHALC('SP_PODRB');
    halcyondataset.TableName := DB_PATH;
    try
        halcyondataset.Active := true;
    except
        add_error('dbf', 1);
        exit;
    end;
    try
        Index := DB_PATH + '.cdx';
        halcyondataset.IndexFileInclude(index);
    except
        add_error('cdx', 1);
    end;
    table.Caption := 'Sp_podrb';
    table.Refresh;
    bar.Position := 1;
    bar.Max := halcyondataset.RecordCount;
    DONE.Caption := INTTOSTR(0);
    all.Caption := INTTOSTR(halcyondataset.RecordCount);
    all.Refresh;
    halcyondataset.first;
    while not halcyondataset.Eof do
    begin
        error := false;
        try
            halcyondataset.Edit;
        except
            no_r := halcyondataset.RecNo;
            add_error('block', halcyondataset.RecNo);
            error := true;
        end;

        if (error = true) then
            goto home;
        //halcyondataset.TranslateASCII:=FALSE;
        halcyondataset.TranslateASCII := true;
        ID_PBKey := halcyondataset.FieldByName('ID_PBKey').AsString;
        ID_ACTION := halcyondataset.FieldByName('ACTION').AsString;
        ID_PARENT := halcyondataset.FieldByName('ID_PARENT').AsString;
        ID_PODRB := halcyondataset.FieldByName('ID_PODRB').AsString;
        PODR_NAME := halcyondataset.FieldByName('PODR_NAME').AsString;
        DATE_PROCK := halcyondataset.FieldByName('DATE_PROCK').AsString;
        TIME_PROCK := halcyondataset.FieldByName('TIME_PROCK').AsString;
        DATE_PROCB := halcyondataset.FieldByName('DATE_PROCB').AsString;
        TIME_PROCB := halcyondataset.FieldByName('TIME_PROCB').AsString;
        SYSTEM_F := halcyondataset.FieldByName('SYSTEM_F').AsString;

        s := [Chr(0)..Chr(255)];

        halcyondataset.TranslateASCII := false;
        halcyondataset.Fields.FieldByName('CRC32').ValidChars := s;
        field := halcyondataset.FieldByName('CRC32');
        halcyondataset.TranslateASCII := TRUE;

        Field.ValidChars := S;
        field.GetData(@a, true);
        crc32_ := a[1] + a[2] + a[3] + a[4];

    ///////////////
    //ПРОВЕРКА НА КОРРЕКТНОЕ СЧИТЫВАНИЕ
        if (id_pbkey = '')
            then id_pbkey := '0';
        if (id_parent = '')
            then id_parent_val := '-' + id_server;

        if (system_f <> l_system_f)
            then
        begin
            add_error('system_f', halcyondataset.RecNo);
            goto HOME;
        end;

/////////ПРОВЕРКА ID_ACTION
        if (ID_ACTION <> '1') and (ID_ACTION <> '2') and (ID_ACTION <> '3')
            then
        begin
            add_error('id_action', halcyondataset.RecNo);
            goto home;
        end;
        //////////
///START ALL UPVCHM TRANSACTIONS

        u_StoredProc.Transaction := Write_u;
        u_StoredProc.Transaction.StartTransaction;


        if (DATE_PROCB <> '') and (DATE_PROCK = '') and (time_procb <> '') and (time_prock = '')
            then
        begin
          ////////////crc32 check
            f := compare_crc32(crc32_);
            if (f = false) and (l_crc32 = '1')
                then
            begin
                add_error('crc32', halcyondataset.RecNo);
                goto HOME;
            end;
        ////////ПРОВЕРКА НА ПУСТЫЕ ДАТЫ
            begin
                DATE_PROCK := datetimetostr(DATE);
                TIME_PROCK := datetimetostr(TIME);
                TIME_PROCK := copy(TIME_PROCK, 11, 9);
                if (TIME_PROCK[1] = ' ') then
                    TIME_PROCK := copy(TIME_PROCK, 2, 8)
                else
                    TIME_PROCK := copy(TIME_PROCK, 1, 8);
            end;
/////////////////PARENT
//u_dataset.FieldByName('id_department').AsString;
            if (id_parent <> '') then
                with u_dataset do
                begin
                    active := false;
                    SQLs.SelectSQL.Text := 'select ID_department from sp_podrb where id_podrb=' +
                        QuotedStr(id_parent);
                    active := true;
                    if (RecordCount = 0)
                        then
                    begin
                        add_error('id_parent', halcyondataset.RecNo);
                        goto home;
                    end
                    else
                    begin
                        id_parent_val := FieldByName('id_department').AsString;
                    end;
                    active := false;
                end;

////////////////

            if (ID_ACTION = '1') then
            begin
                with u_dataset do
                begin
                    active := false;
                    SQLs.SelectSQL.Text := 'select * from sp_podrb where id_podrb=' +
                        id_podrb;
                    active := true;
                    if (RecordCount <> 0)
                        then
                    begin
                        add_error('id_podrb', halcyondataset.RecNo);
                        goto home;
                    end;
                    active := false;
                end;

            end;
            if (id_action = '2') or (id_action = '3') then
                with u_dataset do
                begin
                    active := false;
                    SQLs.SelectSQL.Text := 'select id_department from sp_podrb where id_podrb=' +
                        id_podrb;
                    active := true;
                    if (RecordCount = 0)
                        then
                    begin
                        add_error('inc', halcyondataset.RecNo);
                        error := true;
                    end
                    else
                        id_department := FieldByName('id_department').AsString;
                    active := false;
                end;
            if error = true then goto home;
///////////////////////
            try
//////////////// ADD CUSTOMER TO SHADOW
                u_StoredProc.ExecProcedure('SH_SP_PODRB_INSERT', [ID_PODRB, ID_PARENT, strtoINT(ID_ACTION), PODR_NAME,
                    strtodate(DATE_PROCK), TIME_PROCK, strtodate(DATE_PROCB), TIME_PROCB, SYSTEM_F, CRC32_, STRTOINT(ID_SERVER), strtoint(ID_PBKEY)]);
                add_done('add', halcyondataset.RecNo, 'SH_SP_PODRB');
/////////////write to upvchm/////////////////////////
////////запись в УПВЧМ  при добавлении записи
                if (ID_ACTION = '1') then
                begin

                    u_StoredProc.ExecProcedure('SP_PODRB_INSERT', [PODR_NAME, STRTOINT(ID_PARENT_val), strtoint(id_server), id_podrb, id_parent]);
                    add_done('add', halcyondataset.RecNo, 'SP_PODRB');
                end; ////END ID_ACTION=1


                if (ID_ACTION = '2') then
                begin
                    u_StoredProc.ExecProcedure('SP_PODRB_UPDATE', [STRTOINT(ID_DEPARTMENT), PODR_NAME, STRTOINT(ID_PARENT_VAL), STRTOINT(ID_PODRB), STRTOINT(ID_PARENT)]);
                    add_done('edit', halcyondataset.RecNo, 'SP_PODRB');
                end;
                //END ID_ACTION=2
                if (ID_ACTION = '3') then
                begin
                    u_StoredProc.ExecProcedure('SP_PODRB_DEL', [STRTOINT(ID_DEPARTMENT), PODR_NAME, STRTOINT(ID_PARENT_VAL), STRTOINT(ID_PODRB), STRTOINT(ID_PARENT)]);
                    add_done('del', halcyondataset.RecNo, 'SP_PODRB');
                end; ////END ID_ACTION=3
///FINISH ALL TRANS
                u_StoredProc.Transaction.Commit;
                halcyondataset.FieldByName('DATE_PROCK').AsString := DATE_PROCK;
                halcyondataset.FieldByName('TIME_PROCK').AsString := TIME_PROCK;
                halcyondataset.Unlock;
///////////
            except
                add_error('done1', halcyondataset.RecNo);
            end;

        end
        else
        begin
            add_error('done', halcyondataset.RecNo);
        end;
        HOME:
        if not (halcyondataset.Eof) then
        begin
            halcyondataset.Next;
            bar.StepBy(1);
            done.Caption := INTTOSTR(halcyondataset.RecNo);
            done.Refresh;
        end;
    end;
end;



procedure TForm1.zabor_WACCOUNT;
var
    IniFile: TIniFile;
    i, new_id, kol, clear_data_ind: INTEGER;
    fi: file;
    PARENT_NAME: string;
    ID_PODR: INTEGER;
    l_month1, l_month2, l_year1, l_year2: string;
    l_id_postk, l_k_kod_podr, l_vo_k: string;
    DATE_IN, TIME_IN, DATE_PROC, TIME_PROC, ACTION, T_NUM, INK, YEAR_1, MONTH_1, YEAR_2, MONTH_2, VO_k, SUMMA, ID_POSTK: string;
    ID_PODRB, ID_PODRK, ID_BUDGET, ID_DIVISIO, ID_ITEM, s, s1, s2, s3, s4, s5, s6, s7: string;
    error: boolean;
    l_crc32, id_pbkey, crc32_: string;
    field: Tfield;
    needClear: Boolean;
label HOME;
begin
    begin
        APP_PATH := GetCurrentDir + '\';
        if not FileExists(APP_PATH + INI_FILENAME) then
        begin
            add_error('app', 1);
            exit;
        end;
        IniFile := TIniFile.Create(APP_PATH + INI_FILENAME);
        ADO_STRING := IniFile.ReadString('ado', 'Conn_string', ADO_STRING);
        IniFile.Free;

        APP_PATH := GetCurrentDir + '\';

        if not FileExists(APP_PATH + INI_FNN) then
        begin
            add_error('not', 1);
            exit;
        end;
        IniFile := TIniFile.Create(APP_PATH + INI_FNN);
        L_SYSTEM_F := IniFile.ReadString('main', 'system_f', L_SYSTEM_F);
        L_crc32 := IniFile.ReadString('main', 'crc32', L_crc32);
        L_month1 := IniFile.ReadString('waccount', 'month_1', L_month1);
        L_month2 := IniFile.ReadString('waccount', 'month_2', L_month2);
        L_year1 := IniFile.ReadString('waccount', 'year_1', L_year1);
        L_year2 := IniFile.ReadString('waccount', 'year_2', L_year2);
        L_vo_k := IniFile.ReadString('waccount', 'vo_k', L_vo_k);
        L_id_postk := IniFile.ReadString('waccount', 'id_postk', l_id_postk);
        L_k_kod_podr := IniFile.ReadString('waccount', 'k_kod_podr', l_k_kod_podr);
        IniFile.Free;
    end;
    halcyondataset.Active := false;
    READINIHALC('waccount');
    halcyondataset.TableName := DB_PATH;
    try
        halcyondataset.Active := true;
    except
        add_error('dbf', 1);
        exit;
    end;
    try
        Index := DB_PATH + '.cdx';
        halcyondataset.IndexFileInclude(index);
    except
        add_error('cdx', 1);
    end;
    table.Caption := 'Waccount';
    table.Refresh;
    bar.Position := 1;
    done.Caption := '0';
    done.Refresh;
    bar.Max := halcyondataset.RecordCount;
    all.Caption := inttostr(bar.Max);
    all.Refresh;
    halcyondataset.first;
    while not halcyondataset.Eof do
    begin
        error := false;
        try
            halcyondataset.Edit;
        except
            no_r := halcyondataset.RecNo;
            add_error('block', halcyondataset.RecNo);
            error := true;
        end;

        if (error = true) then
            goto home;
        ID_PBKEY := halcyondataset.FieldByName('ID_PBKEY').AsString;
        DATE_IN := halcyondataset.FieldByName('DATE_IN').AsString;
        TIME_IN := halcyondataset.FieldByName('TIME_IN').AsString;
        DATE_PROC := halcyondataset.FieldByName('DATE_PROC').AsString;
        TIME_PROC := halcyondataset.FieldByName('TIME_PROC').AsString;
        ACTION := halcyondataset.FieldByName('ACTION').AsString;
        T_NUM := halcyondataset.FieldByName('T_NUM').AsString;
        INK := halcyondataset.FieldByName('INK').AsString;
        YEAR_1 := halcyondataset.FieldByName('YEAR_1').AsString;
        MONTH_1 := halcyondataset.FieldByName('MONTH_1').AsString;
        YEAR_2 := halcyondataset.FieldByName('YEAR_2').AsString;
        MONTH_2 := halcyondataset.FieldByName('MONTH_2').AsString;
        VO_k := halcyondataset.FieldByName('VO_K').AsString;
        SUMMA := halcyondataset.FieldByName('SUMMA').AsString;
        ID_POSTK := halcyondataset.FieldByName('ID_POSTK').AsString;
        B_kod_podr := halcyondataset.FieldByName('B_kod_podr').AsString;
        K_kod_podr := halcyondataset.FieldByName('K_kod_podr').AsString;
        ID_BUDGET := halcyondataset.FieldByName('ID_BUDGET').AsString;
        ID_DIVISIO := halcyondataset.FieldByName('ID_DIVISIO').AsString;
        ID_ITEM := halcyondataset.FieldByName('ID_ITEM').AsString;
        SYSTEM_F := halcyondataset.FieldByName('SYSTEM_F').AsString;

        halcyondataset.TranslateASCII := false;
        field := halcyondataset.FieldByName('CRC32');
        halcyondataset.TranslateASCII := TRUE;


        field.GetData(@a, true);
        crc32_ := a[1] + a[2] + a[3] + a[4];
     //ПРОВЕРКА НА КОРРЕКТНОЕ СЧИТЫВАНИЕ
        s := ' ACTION="' + ACTION + '"';
        s1 := ' T_NUM="' + T_NUM + '"';
        s2 := ' INK="' + INK + '"';
        s3 := ' SUMMA="' + SUMMA + '"';
    /////////////////////////////////

    ///////////////


        if (system_f <> l_system_f)
            then
        begin
            add_error('system_f', halcyondataset.RecNo);
            goto HOME;
        end;
//////////////ПРОВЕРКА НА ПУСТЫЕ ПОЛЯ
        if id_pbkey = ''
            then id_pbkey := '0';

/////////ПРОВЕРКА ID_ACTION
        if (ACTION <> '1') and (ACTION <> '2') and (ACTION <> '3')
            then
        begin
            add_error('id_action', halcyondataset.RecNo);
            goto home;
        end;
        //////////
///START ALL UPVCHM TRANSACTIONS

        u_StoredProc.Transaction := Write_u;
        u_StoredProc.Transaction.StartTransaction;

////////////// ПРОВЕРКА НА ОБРАБОТКУ
        if (DATE_IN <> '') and (DATE_PROC = '') and (time_proc = '') and (time_IN <> '')
            then
        begin
        ////////ПРОВЕРКА НА ПУСТЫЕ ДАТЫ
            f := compare_crc32(crc32_);
            if (f = false) and (l_crc32 = '1') then
            begin
                add_error('crc32', halcyondataset.RecNo);
                goto HOME;
            end;

            begin
                DATE_proc := datetimetostr(DATE);
                TIME_proc := datetimetostr(TIME);
                TIME_proc := copy(TIME_proc, 11, 9);
                if (TIME_proc[1] = ' ') then
                    TIME_proc := copy(TIME_proc, 2, 8)
                else
                    TIME_proc := copy(TIME_proc, 1, 8);
            end;
////////////////////////
    {   if (ACTION='1')THEN
           BEGIN
                with u_dataset do
                begin
                     active:=false;
                     SQLs.SelectSQL.Text:='select * from waccount where t_num='+
                      t_num +' and vo_k='+vo_k;
                     active:=true;
                     if (RecordCount<>0)
                         then
                           begin
                             add_error('inc',halcyondataset.RecNo);
                             goto home;
                           end;
                     active:=false;
                end;

           end;}
            {if (action = '2') or (action = '3') then
                with u_dataset do
                begin
                    active := false;
                    SQLs.SelectSQL.Text := 'select * from waccount where t_num=' +
                        t_num + ' and vo_k=' + vo_k;
                    active := true;
                    if (RecordCount = 0)
                        then
                    begin
                        add_error('inc', halcyondataset.RecNo);
                        error := true;
                    end;

                    active := false;
                end;}
            if error = true then goto home;


//////////////////////


            if (l_vo_k = '1') then
                with u_dataset do
                begin
                    active := false;
                    SQLs.SelectSQL.Text := 'select * from sp_vidopl where id_vidopl=' +
                        vo_k;
                    active := true;
                    if (RecordCount = 0)
                        then
                    begin
                        add_error('VO_K', halcyondataset.RecNo);
                        goto home;
                    end;
                    active := false;
                end;
//////////////////
            if (l_id_postk = '1') then
                with u_dataset do
                begin
                    active := false;
                    SQLs.SelectSQL.Text := 'select * from sp_post where id_post=' +
                        id_postk;
                    active := true;
                    if (RecordCount = 0)
                        then
                    begin
                        add_error('id_postk', halcyondataset.RecNo);
                        goto home;
                    end;
                    active := false;
                end;
///////////////////////
            if (l_k_kod_podr = '1') then
                with u_dataset do
                begin
                    active := false;
                    SQLs.SelectSQL.Text := 'select * from sp_department where id_department=' +
                        k_kod_podr;
                    active := true;
                    if (RecordCount = 0)
                        then
                    begin
                        add_error('k_kod_podr', halcyondataset.RecNo);
                        goto home;
                    end;
                    active := false;
                end;
/////////////////
            if (month_1 < l_month1) and (month_1 > l_month2) then
            begin
                add_error('month', halcyondataset.RecNo);
                goto home;
            end;
            if (month_2 < l_month1) and (month_2 > l_month2) then
            begin
                add_error('month', halcyondataset.RecNo);
                goto home;
            end;
/////////////////
            if (year_2 < l_year1) and (year_2 > l_year2) then
            begin
                add_error('year', halcyondataset.RecNo);
                goto home;
            end;
            if (year_1 < l_year1) and (year_1 > l_year2) then
            begin
                add_error('year', halcyondataset.RecNo);
                goto home;
            end;
            try
//////////////// ADD CUSTOMER TO SHADOW
                u_StoredProc.ExecProcedure('SH_WACCOUNT_INSERT', [STRTODATE(DATE_IN), TIME_IN, STRTODATE(DATE_PROC),
                    TIME_PROC, STRTOINT(ACTION), STRTOINT(T_NUM), INK, STRTOINT(YEAR_1), STRTOINT(MONTH_1), STRTOINT(YEAR_2),
                        STRTOINT(MONTH_2), STRTOINT(VO_k), STRTOFLOAT(SUMMA), STRTOINT(ID_POSTK), STRTOINT(B_kod_podr),
                        STRTOINT(K_kod_podr), STRTOINT(ID_BUDGET), STRTOINT(ID_DIVISIO), STRTOINT(ID_ITEM), SYSTEM_F, CRC32_, strtoint(id_server), strtoint(id_pbkey)]);
                add_done('add', halcyondataset.RecNo, 'SH_WACCOUNT');
/////////////write to upvchm/////////////////////////
////////запись в УПВЧМ  при добавлении записи

                //if (ACTION = '1') then
                begin
                        // проверим, не надо ли очистить прошлые записи
                    needClear := True;
                    for clear_data_ind := 0 to High(clearmonthdata) do
                    begin
                        if ( clearMonthData[clear_data_ind] = StrToInt(MONTH_2) ) and
                          ( clearYearData[clear_data_ind] = StrToInt(YEAR_2) )  then
                          begin
                            needClear := False;
                            break;
                          end;
                    end;
                    if needClear then
                    begin
                        Clear_WAccount.SQL.Text := 'DELETE FROM WAccount WHERE Year_2 = '
                            + Year_2 + ' AND Month_2 = ' + Month_2;
                        Clear_WAccount.ExecQuery;
                        SetLength(clearMonthData, Length(clearMonthData)+1);
                        SetLength(clearYearData, Length(clearYearData)+1);
                        clearMonthData[High(clearMonthData)] := StrToInt(Month_2);
                        clearYearData[High(clearYearData)] := StrToInt(Year_2);
                    end;

                    u_StoredProc.ExecProcedure('WACCOUNT_INSERT', [STRTOINT(T_NUM), INK, STRTOINT(YEAR_1), STRTOINT(MONTH_1), STRTOINT(YEAR_2),
                        STRTOINT(MONTH_2), STRTOINT(VO_k), STRTOFLOAT(SUMMA), STRTOINT(ID_POSTK), STRTOINT(K_kod_podr),
                            B_kod_podr, STRTOINT(ID_BUDGET), STRTOINT(ID_DIVISIO), STRTOINT(ID_ITEM), strtoint(id_server)]);
                    add_done('add', halcyondataset.RecNo, 'WACCOUNT');
                end; ////END ID_ACTION=1


{                if (ACTION = '2') then
                begin
                    u_StoredProc.ExecProcedure('WACCOUNT_UPDATE', [STRTOINT(T_NUM), INK, STRTOINT(YEAR_1), STRTOINT(MONTH_1), STRTOINT(YEAR_2),
                        STRTOINT(MONTH_2), STRTOINT(VO_k), STRTOFLOAT(SUMMA), STRTOINT(ID_POSTK), STRTOINT(K_kod_podr),
                            B_kod_podr, STRTOINT(ID_BUDGET), STRTOINT(ID_DIVISIO), STRTOINT(ID_ITEM), strtoint(id_server)]);
                    add_done('edit', halcyondataset.RecNo, 'WACCOUNT');
                end; }
                //END ID_ACTION=2
{                if (ACTION = '3') then
                begin
                    u_StoredProc.ExecProcedure('WACCOUNT_DEL', [STRTOINT(T_NUM), INK, STRTOINT(YEAR_1), STRTOINT(MONTH_1), STRTOINT(YEAR_2),
                        STRTOINT(MONTH_2), STRTOINT(VO_k), STRTOFLOAT(SUMMA), STRTOINT(ID_POSTK), STRTOINT(K_kod_podr),
                            B_kod_podr, STRTOINT(ID_BUDGET), STRTOINT(ID_DIVISIO), STRTOINT(ID_ITEM), strtoint(id_server)]);
                    add_done('del', halcyondataset.RecNo, 'WACCOUNT');
                end;} ////END ID_ACTION=3   }
///FINISH ALL TRANS
                u_StoredProc.Transaction.Commit;
                halcyondataset.FieldByName('DATE_PROC').AsString := DATE_PROC;
                halcyondataset.FieldByName('TIME_PROC').AsString := TIME_PROC;
                halcyondataset.Unlock;
          ////////////
            except
                add_error('done1', halcyondataset.RecNo);
            end;
        end
        else
        begin
            add_error('done', halcyondataset.RecNo);
        end;
        HOME:
        if not (halcyondataset.Eof) then
        begin
            halcyondataset.Next;
            bar.StepBy(1);
            done.Caption := inttostr(halcyondataset.recno);
            done.Refresh;
        end;
    end;
end;

procedure TForm1.zabor_NACHISL;
var
    IniFile: TIniFile;
    i, new_id, kol: INTEGER;
    fi: file;
    PARENT_NAME: string;
    ID_PODR: INTEGER;
    l_month1, l_month2, l_year1, l_year2: string;
    L_ID_NACH, L_ID_BUDGET, L_ID_DIVISIO, L_ID_ITEM, DATE_IN, TIME_IN, DATE_PROC, TIME_PROC, ACTION, ID_NACH, INK, YEAR_1, MONTH_1, YEAR_2, MONTH_2, VO, SUMMA, ID_POSTK: string;
    ID_PODRB, ID_PODRK, ID_BUDGET, ID_DIVISIO, ID_ITEM, s, s1, s2, s3, s4, s5, s6, s7: string;
    error: boolean;
    l_crc32, id_pbkey: string;
    field: Tfield;
    no_r: integer;
label HOME;

begin

    begin
        APP_PATH := GetCurrentDir + '\';
        if not FileExists(APP_PATH + INI_FILENAME) then
        begin
            add_error('app', 1);
            exit;
        end;
        IniFile := TIniFile.Create(APP_PATH + INI_FILENAME);
        ADO_STRING := IniFile.ReadString('ado', 'Conn_string', ADO_STRING);
        IniFile.Free;

        APP_PATH := GetCurrentDir + '\';

        if not FileExists(APP_PATH + INI_FNN) then
        begin
            add_error('not', 1);
            exit;
        end;
        IniFile := TIniFile.Create(APP_PATH + INI_FNN);
        L_SYSTEM_F := IniFile.ReadString('main', 'system_f', L_SYSTEM_F);
        L_crc32 := IniFile.ReadString('main', 'crc32', L_crc32);
        L_month1 := IniFile.ReadString('nachisl', 'month_1', L_month1);
        L_month2 := IniFile.ReadString('nachisl', 'month_2', L_month2);
        L_year1 := IniFile.ReadString('nachisl', 'year_1', L_year1);
        L_year2 := IniFile.ReadString('nachisl', 'year_2', L_year2);
        IniFile.Free;
    end;

    halcyondataset.Active := false;
    READINIHALC('nachisl');
    halcyondataset.TableName := DB_PATH;
    try
        halcyondataset.Active := true;
    except
        add_error('dbf', 1);
        exit;
    end;
    try
        Index := DB_PATH + '.cdx';
        halcyondataset.IndexFileInclude(index);
    except
        add_error('cdx', 1);
    end;
    table.Caption := 'Nachisl';
    table.Refresh;
    bar.Position := 1;
    bar.Max := halcyondataset.RecordCount;
    done.Caption := INTTOSTR(halcyondataset.RecNo - 1);
    done.Refresh;
    all.Caption := inttostr(bar.Max);
    all.Refresh;
    halcyondataset.first;
    while not halcyondataset.Eof do
    begin
        error := false;
        try
            halcyondataset.Edit;
        except
            no_r := halcyondataset.RecNo;
            add_error('block', halcyondataset.RecNo);
            error := true;
        end;
        if (error = true) then
            goto home;
        id_pbkey := halcyondataset.FieldByName('id_pbkey').AsString;
        DATE_IN := halcyondataset.FieldByName('DATE_IN').AsString;
        TIME_IN := halcyondataset.FieldByName('TIME_IN').AsString;
        DATE_PROC := halcyondataset.FieldByName('DATE_PROC').AsString;
        TIME_PROC := halcyondataset.FieldByName('TIME_PROC').AsString;
        ACTION := halcyondataset.FieldByName('ACTION').AsString;
        YEAR_1 := halcyondataset.FieldByName('YEAR_1').AsString;
        MONTH_1 := halcyondataset.FieldByName('MONTH_1').AsString;
        YEAR_2 := halcyondataset.FieldByName('YEAR_2').AsString;
        MONTH_2 := halcyondataset.FieldByName('MONTH_2').AsString;
        SUMMA := halcyondataset.FieldByName('SUMMA').AsString;
        ID_NACH := halcyondataset.FieldByName('ID_NACH').AsString;
        ID_BUDGET := halcyondataset.FieldByName('ID_BUDGET').AsString;
        ID_DIVISIO := halcyondataset.FieldByName('ID_DIVISIO').AsString;
        ID_ITEM := halcyondataset.FieldByName('ID_ITEM').AsString;
        SYSTEM_F := halcyondataset.FieldByName('SYSTEM_F').AsString;

        halcyondataset.TranslateASCII := false;
        field := halcyondataset.FieldByName('CRC32');
        halcyondataset.TranslateASCII := TRUE;


        field.GetData(@a, true);
        crc32_ := a[1] + a[2] + a[3] + a[4];


     //ПРОВЕРКА НА КОРРЕКТНОЕ СЧИТЫВАНИЕ
    ///////////////
   //ПРОВЕРКА system_f
        if (system_f <> l_system_f)
            then
        begin
            add_error('system_f', halcyondataset.RecNo);
            goto HOME;
        end;
//////////////empty id_pbkey
        if (id_pbkey = '')
            then id_pbkey := '0';


/////////ПРОВЕРКА ID_ACTION
        if (ACTION <> '1') and (ACTION <> '2') and (ACTION <> '3')
            then
        begin
            add_error('id_action', halcyondataset.RecNo);
            goto home;
        end;
        //////////
///START ALL UPVCHM TRANSACTIONS

        u_StoredProc.Transaction := Write_u;
        u_StoredProc.Transaction.StartTransaction;

////////////// ПРОВЕРКА НА ОБРАБОТКУ
        if (DATE_IN <> '') and (DATE_PROC = '') and (time_proc = '') and (time_IN <> '')
            then
        begin
              ////////crc32 check
            f := compare_crc32(crc32_);
            if (f = false) and (l_crc32 = '1')
                then
            begin
                add_error('crc32', halcyondataset.RecNo);
                goto HOME;
            end;
        ////////ПРОВЕРКА НА ПУСТЫЕ ДАТЫ
            begin
                DATE_PROC := datetimetostr(DATE);
                TIME_PROC := datetimetostr(TIME);
                TIME_PROC := copy(TIME_PROC, 11, 9);
                if (TIME_PROC[1] = ' ') then
                    TIME_PROC := copy(TIME_PROC, 2, 8)
                else
                    TIME_PROC := copy(TIME_PROC, 1, 8);
            end;
///////////////
            if (month_1 < l_month1) and (month_1 > l_month2) then
            begin
                add_error('month', halcyondataset.RecNo);
                goto home;
            end;
            if (month_2 < l_month1) and (month_2 > l_month2) then
            begin
                add_error('month', halcyondataset.RecNo);
                goto home;
            end;
/////////////////
            if (year_2 < l_year1) and (year_2 > l_year2) then
            begin
                add_error('year', halcyondataset.RecNo);
                goto home;
            end;
            if (year_1 < l_year1) and (year_1 > l_year2) then
            begin
                add_error('year', halcyondataset.RecNo);
                goto home;
            end;
            try
//////////////// ADD CUSTOMER TO SHADOW
                u_StoredProc.ExecProcedure('SH_NACHISL_INSERT', [STRTODATE(DATE_IN), TIME_IN, STRTODATE(DATE_PROC),
                    TIME_PROC, STRTOINT(ACTION), STRTOINT(YEAR_1), STRTOINT(MONTH_1), STRTOINT(YEAR_2),
                        STRTOINT(MONTH_2), STRTOINT(ID_NACH), STRTOINT(ID_BUDGET), STRTOINT(ID_DIVISIO), STRTOINT(ID_ITEM), STRTOFLOAT(SUMMA), SYSTEM_F, CRC32_, STRTOINT(ID_SERVER), strtoint(id_pbkey)]);
                add_done('add', halcyondataset.RecNo, 'SH_NACHISL');
/////////////write to upvchm/////////////////////////
////////запись в УПВЧМ  при добавлении записи
                if (ACTION = '1') then
                begin
       /////
                    u_StoredProc.ExecProcedure('NACHISL_INSERT', [STRTOINT(YEAR_1), STRTOINT(MONTH_1), STRTOINT(YEAR_2),
                        STRTOINT(MONTH_2), STRTOINT(ID_NACH), STRTOINT(ID_BUDGET), STRTOINT(ID_DIVISIO), STRTOINT(ID_ITEM), STRTOFLOAT(SUMMA), STRTOINT(ID_SERVER)]);
                    add_done('add', halcyondataset.RecNo, 'WACCOUNT');
                end; ////END ID_ACTION=1


                if (ACTION = '2') then
                begin
                    u_StoredProc.ExecProcedure('NACHISL_UPDATE', [STRTOINT(YEAR_1), STRTOINT(MONTH_1), STRTOINT(YEAR_2),
                        STRTOINT(MONTH_2), STRTOINT(ID_NACH), STRTOINT(ID_BUDGET), STRTOINT(ID_DIVISIO), STRTOINT(ID_ITEM), STRTOFLOAT(SUMMA)]);
                    add_done('edit', halcyondataset.RecNo, 'WACCOUNT');
                end;
                //END ID_ACTION=2
                if (ACTION = '3') then
                begin
                    u_StoredProc.ExecProcedure('NACHISL_DEL', [STRTOINT(YEAR_1), STRTOINT(MONTH_1), STRTOINT(YEAR_2),
                        STRTOINT(MONTH_2), STRTOINT(ID_NACH), STRTOINT(ID_BUDGET), STRTOINT(ID_DIVISIO), STRTOINT(ID_ITEM), STRTOFLOAT(SUMMA)]);
                    add_done('del', halcyondataset.RecNo, 'WACCOUNT');
                end; ////END ID_ACTION=3   }
///FINISH ALL TRANS
                u_StoredProc.Transaction.Commit;
                halcyondataset.FieldByName('DATE_PROC').AsString := DATE_PROC;
                halcyondataset.FieldByName('TIME_PROC').AsString := TIME_PROC;
                halcyondataset.Unlock;
          ////////////
            except
                add_error('done1', halcyondataset.RecNo);
            end;
        end
        else
        begin
            add_error('done', halcyondataset.RecNo);
        end;
        HOME:
        if not (halcyondataset.Eof) then
        begin
            halcyondataset.Next;
            bar.StepBy(1);
            done.Caption := INTTOSTR(halcyondataset.RecNo);
            done.Refresh;
        end;
    end;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
    IniFile: TIniFile;
begin
    done_edit.Clear;
    error_edit.clear;
    closebutton.Enabled := true;
    exchangebutton.Enabled := true;
    try
        name := 'upvchm';
        ReadIniFile(name);
        upvchm_database.DBName := DB_PATH;
        upvchm_database.ConnectParams.UserName := DB_USER;
        upvchm_database.ConnectParams.Password := DB_PASSWORD;
        upvchm_database.Connected := true;
    except
        add_error('database', 1);
        Close;
        exchangebutton.Enabled := false;
    end;
    name := 'halcyon';
    readinihalc(name);
    halcyondataset.DatabaseName := db_path;
      //  compare.bufferset.DatabaseName:= db_path;


end;

procedure TForm1.ExchangeButtonClick(Sender: TObject);
begin
    SetLength(clearMonthData, 0);
    SetLength(clearYearData, 0);

    sp_podrb.Enabled := false;
    nachisl.Enabled := false;
    waccount.Enabled := false;
    Closebutton.Enabled := false;
    ExchangeButton.Enabled := FALSE;
    assignfile(error_f, log_error);
    assignfile(done_f, log_done);
    if not FileExists(APP_PATH + log_error) then
        rewrite(error_f)
    else
        append(error_f);
    writeln(error_f);

    if not FileExists(APP_PATH + log_done) then
        rewrite(done_f)
    else
        append(done_f);
    writeln(done_f);

    done_edit.Lines.Add('/=================================/');
    done_edit.Lines.Add('Начало сеанса забора ' + datetimetostr(now()));
    done_edit.Lines.Add('/=================================/');

    error_edit.Lines.Add('/=================================/');
    error_edit.Lines.Add('Начало сеанса забора ' + datetimetostr(now()));
    error_edit.Lines.Add('/=================================/');

    sys_options;
    writeln(error_f, '/=================================/');
    writeln(error_f, 'Начало сеанса забора ' + datetimetostr(now()));
    writeln(error_f, '/=================================/');

    writeln(done_f, '/=================================/');
    writeln(done_f, 'Начало сеанса забора ' + datetimetostr(now()));
    writeln(done_f, '/=================================/');

    writeln(done_f, ' ');
    writeln(done_f, ' ');

    done_edit.Lines.Add(' ');
    error_edit.Lines.Add(' ');

    writeln(error_f, 'ОБРАБОТКА ТАБЛИЦЫ SP_PODRB...');
    writeln(done_f, 'ОБРАБОТКА ТАБЛИЦЫ SP_PODRB...');

    done_edit.Lines.Add(' ');
    error_edit.Lines.Add(' ');

    done_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ SP_PODRB...');
    error_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ SP_PODRB...');

    if sp_podrb.Checked then
        zabor_sp_PODRB;

    table.Caption := '';
    table.Refresh;

    writeln(error_f, 'ОБРАБОТКА ТАБЛИЦЫ SP_PODRB ЗАВЕРШЕНА.');
    writeln(done_f, 'ОБРАБОТКА ТАБЛИЦЫ SP_PODRB ЗАВЕРШЕНА.');

    error_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ SP_PODRB ЗАВЕРШЕНА.');
    done_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ SP_PODRB ЗАВЕРШЕНА.');

    writeln(done_f, ' ');
    writeln(error_f, ' ');

    done_edit.Lines.Add(' ');
    error_edit.Lines.Add(' ');

    writeln(error_f, 'ОБРАБОТКА ТАБЛИЦЫ WACCOUNT...');
    writeln(done_f, 'ОБРАБОТКА ТАБЛИЦЫ WACCOUNT...');

    error_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ WACCOUNT...');
    done_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ WACCOUNT...');

    if waccount.Checked then
        zabor_WACCOUNT;

    table.Caption := '';
    table.Refresh;

    writeln(error_f, 'ОБРАБОТКА ТАБЛИЦЫ WACCOUNT ЗАВЕРШЕНА.');
    writeln(done_f, 'ОБРАБОТКА ТАБЛИЦЫ WACCOUNT ЗАВЕРШЕНА.');

    done_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ WACCOUNT ЗАВЕРШЕНА.');
    error_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ WACCOUNT ЗАВЕРШЕНА.');

    writeln(error_f, ' ');
    writeln(done_f, ' ');

    done_edit.Lines.Add(' ');
    error_edit.Lines.Add(' ');

    writeln(error_f, 'ОБРАБОТКА ТАБЛИЦЫ NACHISL...');
    writeln(done_f, 'ОБРАБОТКА ТАБЛИЦЫ NACHISL...');

    done_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ NACHISL...');
    error_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ NACHISL...');

    if nachisl.Checked then
        zabor_NACHISL;

    table.Caption := '';
    table.Refresh;

    writeln(error_f, 'ОБРАБОТКА ТАБЛИЦЫ NACHISL ЗАВЕРШЕНА.');
    writeln(done_f, 'ОБРАБОТКА ТАБЛИЦЫ NACHISL ЗАВЕРШЕНА.');

    done_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ NACHISL ЗАВЕРШЕНА.');
    error_edit.Lines.Add('ОБРАБОТКА ТАБЛИЦЫ NACHISL ЗАВЕРШЕНА.');

    writeln(error_f, ' ');
    writeln(done_f, ' ');

    done_edit.Lines.Add(' ');
    error_edit.Lines.Add(' ');

    writeln(error_f, '/=================================/');
    writeln(error_f, 'Окончание сеанса забора ' + datetimetostr(now()));
    writeln(error_f, '/=================================/');

    writeln(done_f, '/=================================/');
    writeln(done_f, 'Окончание сеанса забора ' + datetimetostr(now()));
    writeln(done_f, '/=================================/');

    done_edit.Lines.Add('/=================================/');
    done_edit.Lines.Add('Окончание сеанса забора ' + datetimetostr(now()));
    done_edit.Lines.Add('/=================================/');

    error_edit.Lines.Add('/=================================/');
    error_edit.Lines.Add('Окончание сеанса забора ' + datetimetostr(now()));
    error_edit.Lines.Add('/=================================/');
    done.Caption := '';
    all.Caption := '';
    Closebutton.Enabled := true;
    exchangebutton.Enabled := false;
    closefile(error_f);
    closefile(done_f);
    upvchm_database.Connected := false;
    halcyondataset.Active := false;
    box1.Enabled := true;
    box2.Enabled := true;
    done_edit.ScrollBars := ssVertical;
    error_edit.ScrollBars := ssVertical;
end;


procedure TForm1.CloseButtonClick(Sender: TObject);
var
    i, kol: integer;
    F: TEXTFILE;
begin
    close;
end;




function Tform1.compare_crc32(crc32_read: string): boolean;
var
    i: Integer;
    fieldName: string;
    field: TField;
    crc32_str: string;
    date_form: TFormatSettings;
begin

    date_form.ShortDateFormat := 'yyyymmdd';
    date_form.LongDateFormat := 'yyyymmdd';

    crc32_str := '';

    halcyondataset.TranslateASCII := False;
    for i := 0 to halcyondataset.FieldCount - 1
        do
    begin
        field := halcyondataset.Fields[i];
        fieldName := UpperCase(halcyondataset.Fields[i].FieldName);
   // CRC32_beg
        if (FieldName <> 'CRC32') and (FieldName <> 'SYSTEM_F')
            then
        begin

            case field.DataType of
                ftString: if not VarIsNull(field.Value)
                    then crc32_str := crc32_str + field.Value; // Если строка, то пишем её без концевых пробелов
       //else crc32_str := crc32_str + ' ';                            // Если пустая строка, то дополняем одним пробелом

                ftInteger: if not VarIsNull(field.Value)
                    then
                        crc32_str := crc32_str + IntToStr(field.Value)
                    else
                        crc32_str := crc32_str + '0';

                ftSmallInt: if not VarIsNull(field.Value)
                    then
                        crc32_str := crc32_str + IntToStr(field.Value)
                    else
                        crc32_str := crc32_str + '0';
                ftLargeInt: if not VarIsNull(field.Value)
                    then
                        crc32_str := crc32_str + IntToStr(field.Value)
                    else
                        crc32_str := crc32_str + '0';

                ftBoolean: if not VarIsNull(field.Value)
                    then
                    begin
                        if field.Value then
                            crc32_str := crc32_str + 'T'
                        else
                            crc32_str := crc32_str + 'F';
                    end
                    else
                        crc32_str := crc32_str + 'F';

                ftFloat: crc32_str := crc32_str + VFloatToString(field);

                ftDate: if not VarIsNull(field.Value)
                    then
                        crc32_str := crc32_str + DateToStr(field.Value, date_form)
                    else
                        crc32_str := crc32_str + '00000000';
            end;
        end;
   // CRC32_end
    end;

    halcyondataset.TranslateASCII := true;
    crc32_str := CrcToString(CalculateCrc32(crc32_str));
    res := COMPARESTR(crc32_str, crc32_read);
    if res <> 0 // (crc32_read<>crc32_str)
        then
        compare_crc32 := false
    else
        compare_crc32 := TRUE;

end;






function VFloatToString(field: TField): string; // Функция дописывает к дробному поля нули после запятой, т.е. было 250 стало 250.00
var
    SymbolsAfterDot: Integer;
    i: Integer;
    res_str: string;
begin
    if UpperCase(field.FieldName) = 'TARST'
        then
        SymbolsAfterDot := 3
    else
        SymbolsAfterDot := 2;

    if not VarIsNull(field.Value)
        then
        res_str := Field.Value
    else
        res_str := '0';

    res_str := StringReplace(res_str, ',', '.', [rfReplaceAll]);

    if POS('.', res_str) = 0 then res_str := res_str + '.';

    while POS('.', res_str) > Length(res_str) - SymbolsAfterDot
        do
        res_str := res_str + '0';

    result := res_str;

end;



{procedure TForm1.Button1Click(Sender: TObject);
VAR
  f:boolean;
  ID_pbkey,CRC32:STRING;
  kol_f,kol_r:integer;
  //fi:textfile;
begin
assignfile(fi,'my_crc.crc');
 APP_PATH:=GetCurrentDir+'\';
 if not FileExists(APP_PATH + 'my_crc.crc') then rewrite(fi)
    else rewrite(fi);//append(fi);
    writeln(fi);
halcyondataset.Active:=false;
halcyondataset.TableName:='sp_podrb';
try
halcyondataset.Active:=true;
except
showmessage('не удалось подключить dbf таблицу');
exit;
end;
kol_f:=0;
halcyondataset.first;
kol_r:=halcyondataset.RecordCount;
WHILE not halcyondataset.eof do
 begin

        halcyondataset.TranslateASCII:=false;
        field:=halcyondataset.FieldByName('CRC32');
        halcyondataset.TranslateASCII:=TRUE;
        field.GetData(@a,true);
        crc32:=a[1]+a[2]+a[3]+a[4];
  f:=compare_crc32(crc32);
  if (f=false) then
      inc(kol_f);
  writeln(fi,f);
  halcyondataset.next;

end;
writeln(fi,kol_f,' ',kol_r);
closefile(fi);
 end;}

procedure TForm1.HalcyonDataSetNewRecord(DataSet: TDataSet);
begin
    done.Caption := inttostr(Halcyondataset.RecNo);
end;

procedure TForm1.done_EditChange(Sender: TObject);
begin
//done_edit.
    done_edit.Refresh;
end;

procedure TForm1.error_EditChange(Sender: TObject);
begin
    error_edit.refresh;
end;

end.

