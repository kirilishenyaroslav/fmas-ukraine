unit ImportMainSpBankCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pFibDatabase, FIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, StdCtrls, RxMemDS,
  Gauges, ExtCtrls, Halcn6db, FIBQuery, pFIBQuery, pFIBStoredProc,
  cxLookAndFeelPainters, cxButtons, cxLabel, ActnList, frxClass, frxDBSet;

type
  TfmImportMainSpBankCard = class(TForm)
    DS: TpFIBDataSet;
    Tr: TpFIBTransaction;
    DB: TpFIBDatabase;
    cxMemo: TcxMemo;
    Section: TComboBox;
    RxSection: TRxMemoryData;
    GaugeAll: TGauge;
    Timer: TTimer;
    HTable: THalcyonDataSet;
    SProc: TpFIBStoredProc;
    bar: TGauge;
    TWr: TpFIBTransaction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    ActionList1: TActionList;
    SlectLang: TAction;
    cxButton3: TcxButton;
    DSError: TpFIBDataSet;
    DSErrorTIN: TFIBStringField;
    DSErrorCOMENT: TFIBStringField;
    DSErrorBIRTHDAY: TFIBDateField;
    DSErrorFAMILIYA: TFIBStringField;
    DSErrorIMYA: TFIBStringField;
    DSErrorOTCHESTVO: TFIBStringField;
    DSErrorNAME_USER_IMP: TFIBStringField;
    DSErrorLIC_SCH: TFIBStringField;
    DSErrorN_COMMENT: TFIBStringField;
    DSErrorTIME_IMPORT: TFIBDateTimeField;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure zapusk(names : string);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SlectLangExecute(Sender: TObject);
    procedure Loadcaption;
    procedure FormActivate(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    TimeS : TTime;
    id_user, id_type_dog, id_session : int64;
    datetimeimport : TDateTime;
    index_lang : smallint;
    name_dog : string;
  public
    constructor Create(AOwner: TComponent; dbase : Tpfibdatabase; id_us, id_dog : int64); reintroduce; overload;
  end;

function ImportBankCard (Aowner : TComponent; db : TpFibDatabase; id_user : int64) : integer; stdcall;
    exports ImportBankCard;


implementation
uses UWLoaderUnit,
     IniFiles,
     Registry,
     UWResourcesUnit,
     GlobalSPR;
{$R *.dfm}

function ImportBankCard (Aowner : TComponent; db : TpFibDatabase; id_user : int64) : integer; stdcall;
var
    id_dog : int64;
    Res : Variant;
    T : TfmImportMainSpBankCard;
begin
    res := UWLoaderUnit.LoadUVSpBankCardTakeDog(Aowner, id_user, db, false, true);
    if VarArrayDimCount(Res) > 0 then
    begin
        id_dog := Res[0];
        T := TfmImportMainSpBankCard.Create(Aowner, db, id_user, id_dog);
        T.FormStyle := fsMDIChild;
        T.name_dog  := Res[3];
        T.Show;
    end;
    Result := -1;
end;

{ TfmImportMainSpBankCard }

constructor TfmImportMainSpBankCard.Create(AOwner: TComponent;
  dbase: Tpfibdatabase; id_us, id_dog: int64);
var
   Ini:TiniFile;
   i : integer;
begin
    inherited Create(AOwner);
    id_user               := id_us;
    id_type_dog           := id_dog;
    Loadcaption;
    DB                    := dbase;
    Tr.DefaultDatabase    := DB;
    TWr.DefaultDatabase   := DB;
    DB.DefaultTransaction := Tr;

    DS.Database           := DBase;
    DS.Transaction        := Tr;

    DSError.Database      := DBase;
    DSError.Transaction   := Tr;

    SProc.Database        := DBase;
    SProc.Transaction     := TWr;

    Tr.StartTransaction;

    Ds.Close;
    DS.SQLs.SelectSQL.Text := 'select * from UW_CREATE_ID('''+'GEN_BANKCARD_IMPORT_SESSION'+''')';
    Ds.Open;
    id_session := StrToint64(ds.fbn('RET_VALUE').AsString);
    Ds.Close;


    cxMemo.Clear;
    cxMemo.Lines.Add(TimeToStr(Now));
    datetimeimport := now;
    cxMemo.Lines.Add('Начинаем подготовку к забору данных.Формирование списка таблиц и процедур.');

    Section.Items.Clear;
    ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Vedomost\ImportBankCard.ini');
    ini.ReadSections(Section.Items);
    RxSection.EmptyTable;
    GaugeAll.MaxValue := Section.Items.Count;
    for i := 0 to Section.Items.Count-1 do
    begin
        RxSection.Open;
        RxSection.Insert;
        RxSection.FieldByName('RxSection').Value := Section.Items[i];
        RxSection.Post;
    end;
    cxMemo.Lines.Add('Подготовка завершена.');
    //Начинаем анализировать секции и запускаем затем соответствующие функции
    RxSection.Last;
    Timer.Enabled := true;
    TimeS         := Now;
//    prevSection:='';
end;

procedure TfmImportMainSpBankCard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmImportMainSpBankCard.TimerTimer(Sender: TObject);
begin
    if TimeS-Now>=15000 then
    begin
        TimeS:=Now;
        Refresh;
    end;
end;

procedure TfmImportMainSpBankCard.zapusk(names: string);
var
    My_file : TINIFile;
    PathDBF : string;
    SPName  : string;
    i, pcount, j, rcount : integer;
    TFields : array of string;
    TFieldsSP : array of string;
begin
    cxButton2.Enabled := false;
    My_file := nil;

    SProc.Database    := DB;
    SProc.Transaction := TWr;
    TWr.startTransaction;
    
    try
        My_file          := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\Vedomost\ImportBankCard.ini');
        PathDBF          := My_file.ReadString(names, 'PathDBF', 'ERROR');
        cxMemo.Lines.Add('Обработка секции '+ names);
        HTable.Active    := false;
        cxMemo.Lines.Add(PathDBF);
        HTable.TableName := PathDBF;
        HTable.IndexFiles.Clear;
        SPName           := My_file.ReadString(names, 'ProcNAME', 'ERROR');
//        sp_delete:=My_file.ReadString(names,'SPDelete','ERROR');
    except
    begin
        cxMemo.Lines.Add('Непривильная структура файла конфигурации');
        ShowMessage('Непривильная структура файла конфигурации');
        close;
    end;
    end;

        HTable.Active := true;
        HTable.Append;
    try
        HTable.IndexFileInclude(My_file.ReadString(names, 'CDX', 'ERROR'));
    except
    begin
        cxMemo.Lines.Add('у dbf-файла нет cdx-файла');
//        HTable.Active := false;
    end;
    end;

    try

    if HTable.RecordCount = 0 then
    begin
        cxMemo.Lines.Add('dbf-файл пустой');
        TWr.Rollback;
        ShowMessage('dbf-файл пустой');
        close;
    end;

    SProc.StoredProcName := SPName;

    pcount               := SProc.ParamCount;
    rcount               := HTable.RecordCount;

    cxMemo.Lines.Add('В dbf-файле '+IntToStr(rcount)+' записей');
    SetLength(TFields, pcount-4);
    SetLength(TFieldsSP, pcount-4);
    j := 0;
    for i := 0 to pcount-1 do
    begin
        if (SProc.Params[i].Name <> 'TIME_IMPORT') and
           (SProc.Params[i].Name <> 'ID_USER_IMPORT') and
           (SProc.Params[i].Name <> 'ID_SESSION') and
           (SProc.Params[i].Name <> 'ID_DOG_BANKCARD') then
        begin
            TFields[j]   := My_file.ReadString(names, SProc.Params[i].Name, 'ERROR');
            TFieldsSP[j] := SProc.Params[i].Name;
            Inc(j);
        end;
    end;

    try
        for i := 1 to pcount-4 do
        begin
            if TFields[i-1] <> 'null' then
                HTable.FieldValues[TFields[i-1]];
        end;
    except
    begin
        cxMemo.Lines.Add('Неверная структура dbf-файла');
        TWr.Rollback;
        showmessage('Неверная структура dbf-файла');
        close;
        exit;
    end;
    end;

{    FIBSProc.StoredProcName:=sp_delete;
    FIBSProc.Prepare;
    FIBSProc.ExecProc;
    FIBTrans.Commit;
 }
    cxMemo.Lines.Add('Начало импорта данных');
    HTable.First;
    Bar.MaxValue := RCount;


    SProc.Prepare;
    for j:=1 to rcount do
    begin
        for i:=1 to pcount-4 do
        begin
            if (TFieldsSP[i-1]='ID_CARD_INO_BANK') and (TFields[i-1]<>'null') then
            begin
                SProc.ParamByName(TFieldsSP[i-1]).AsInt64 := HTable.FieldValues[TFields[i-1]];
            end
            else
            begin
                if (TFieldsSP[i-1]='TIN') and (TFields[i-1]<>'null') then
                begin
                    SProc.ParamByName(TFieldsSP[i-1]).AsString := HTable.FieldValues[TFields[i-1]];
                end
                else
                begin
                    if (TFields[i-1]<>'null') then
                        SProc.ParamByName(TFieldsSP[i-1]).Value := HTable.FieldValues[TFields[i-1]];
                end;
            end;
        end;
        SProc.ParamByName('ID_USER_IMPORT').AsInt64  := id_user;
        SProc.ParamByName('ID_DOG_BANKCARD').AsInt64 := id_type_dog;
        SProc.ParamByName('ID_SESSION').AsInt64      := id_session;
        SProc.ParamByName('TIME_IMPORT').AsDateTime  := datetimeimport;
        try
            SProc.ExecProc;
        Except
        begin
            cxMemo.Lines.Add('Ошибка при выполнении процедуры');
            Refresh;
        end;
        end;
        bar.Progress:=j;
        HTable.Next;
    end;
    Refresh;
    TWr.Commit;
    cxMemo.Lines.Add('Чтение dbf-файла завершилось успешно для секции '+names);

    TWr.StartTransaction;
    SProc.StoredProcName := 'PUB_SP_BANKCARD_PEOPLE_BUFF_OBR';
    SProc.Prepare;
    SProc.ParamByName('D_ID_SESSION').AsInt64 := id_session;
    SProc.ExecProc;


    TWr.Commit;
    cxButton3.Visible := true;
    except on E:Exception do begin
        TWr.Rollback;
        Showmessage(E.Message);
        exit;
    end;
    end;
    cxMemo.Lines.Add(DateTimeToStr(Now));
    cxButton2.Enabled := true;
end;

procedure TfmImportMainSpBankCard.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmImportMainSpBankCard.cxButton1Click(Sender: TObject);
begin
    RxSection.First;
    while not RxSection.Eof do
    begin
        zapusk(RxSection.FieldByName('RxSection').AsString);
        cxMemo.Lines.Add(RxSection.FieldByName('RxSection').AsString);
        GaugeAll.Progress := RxSection.RecNo+1;
        RxSection.Prior;

        RxSection.Next;
    end;
end;

procedure TfmImportMainSpBankCard.SlectLangExecute(Sender: TObject);
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\',true) then
        begin
            if index_lang + 1 > UWResourcesUnit.IndexLang
                then reg.writeString('index', '1')
                else reg.writeString('index', IntToStr(index_lang + 1));
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    LoadCaption;
end;

procedure TfmImportMainSpBankCard.Loadcaption;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\', False) then
        begin
            index_lang := StrToInt(reg.ReadString('index'));
        end else
            index_lang := 1;
    finally
        reg.Free;
    end;

    Caption                               := UWResourcesUnit.VEDOMOST_IMPORT_CAPTION[index_lang];
    cxLabel1.Caption                      := UWResourcesUnit.VEDOMOST_IMPORT_SCROL_1[index_lang];
    cxLabel2.Caption                      := UWResourcesUnit.VEDOMOST_IMPORT_SCROL_2[index_lang];
    cxButton1.Caption                     := UWResourcesUnit.VEDOMOST_IMPORT_ZAPUSK[index_lang];
    cxButton2.Caption                     := UWResourcesUnit.MY_CONST_BUTTON_CANCEL[index_lang];
    cxButton3.Caption                     := UWResourcesUnit.VEDOMOST_IMPORT_PRINT_CAP[index_lang];
end;

procedure TfmImportMainSpBankCard.FormActivate(Sender: TObject);
begin
    Loadcaption;
end;

procedure TfmImportMainSpBankCard.cxButton3Click(Sender: TObject);
begin
    DSError.Close;
    DSError.SQLs.SelectSQL.Text := 'select * from PUB_SP_BANKCARD_PEOPLE_BUFF_PR('+IntToStr({9900000000000018}id_session)+')';
    DSError.Open;
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_1000002.fr3');
    frxReport1.Variables['name_dog'] := QuotedStr(name_dog);

    frxReport1.Variables['comp']     := QuotedStr(GetComputerNetName);
    frxReport1.Variables['id_user']  := QuotedStr(IntToStr(id_user));


    frxReport1.PrepareReport(true);
    frxReport1.ShowReport(true);
    DSError.Close;
end;

end.
