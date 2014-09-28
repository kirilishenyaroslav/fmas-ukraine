unit MainUWReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxDropDownEdit, cxCalendar, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, ExtCtrls, ComCtrls, ToolWin, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxSplitter, FIBDataSet, pFIBDataSet,
  ActnList, FIBDatabase, pFIBDatabase, ImgList, dxStatusBar, cxCurrencyEdit,
  Halcn6db, cxShellDlgs, cxShellBrowserDialog, {CustomizerUnit,} StdCtrls,
  CustomizerUnit, frxClass, frxDBSet;

type
  TfmMainUWReestr = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    cxDateEditBeg: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    StyleRepository: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ImageList1: TImageList;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    ActionList1: TActionList;
    AAdd: TAction;
    AEdit: TAction;
    ADel: TAction;
    ARefresh: TAction;
    AExit: TAction;
    Selectlang: TAction;
    TrW: TpFIBTransaction;
    DSReestr: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DSVed: TpFIBDataSet;
    dxStatusBar1: TdxStatusBar;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    DSReestrID_DT_UW_REESTR: TFIBBCDField;
    DSReestrDATE_REESTR: TFIBDateField;
    DSReestrNUMBER_REESTR: TFIBStringField;
    DSReestrID_ZAYAVKA: TFIBBCDField;
    DSReestrID_BANKCARD_DOGOVOR: TFIBBCDField;
    DSReestrSHORTNAME_DOG: TFIBStringField;
    DSReestrDATE_DOG: TFIBDateField;
    DSReestrNUMBER_DOG: TFIBStringField;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    DSInstall: TpFIBDataSet;
    DSVedDATE_VEDOM: TFIBDateField;
    DSVedNUMBER_VEDOM: TFIBStringField;
    DSVedID_DT_VEDOM: TFIBBCDField;
    DSDel: TpFIBDataSet;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    DSVedID_DOG: TFIBBCDField;
    DSVedSUM_VEDOMOST: TFIBBCDField;
    DSVedID_SP_TYPE_VEDOM: TFIBBCDField;
    ToolButton6: TToolButton;
    AImport: TAction;
    CreateHalcyonDataSet1: TCreateHalcyonDataSet;
    HalcyonDataSet1: THalcyonDataSet;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    agColumnCustomizer1: TagColumnCustomizer;
    Button1: TButton;
    DSProv: TpFIBDataSet;
    ToolButton7: TToolButton;
    Aprint: TAction;
    DS: TpFIBDataSet;
    DSPrint: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    DSPrintDATE_REESTR: TFIBDateField;
    DSPrintNUMBER_REESTR: TFIBStringField;
    DSPrintID_ZAYAVKA: TFIBBCDField;
    DSPrintID_BANKCARD_DOGOVOR: TFIBBCDField;
    DSPrintID_USER: TFIBBCDField;
    DSPrintNUMBER_VEDOMOST: TFIBStringField;
    DSPrintDATE_VEDOMOST: TFIBDateField;
    DSPrintCOUNT_MAN: TFIBIntegerField;
    DSPrintID_VEDOMOST: TFIBBCDField;
    DSPrintSUMMA_VEDOMOST: TFIBBCDField;
    DSPrintNAME_PREDPR: TFIBStringField;
    DSID_DT_PROV_VEDOMOST: TFIBBCDField;
    DSID_DT_VEDOMOST: TFIBBCDField;
    DSID_MAN: TFIBBCDField;
    DSID_SCH: TFIBBCDField;
    DSID_SMETA: TFIBBCDField;
    DSID_RAZD: TFIBBCDField;
    DSID_STATE: TFIBBCDField;
    DSID_KEKV: TFIBBCDField;
    DSID_DOG: TFIBBCDField;
    DSKOD_DOG: TFIBBCDField;
    DSSUMA: TFIBBCDField;
    DSID_SP_BANKCARD: TFIBBCDField;
    DSFIO: TFIBStringField;
    DSSCH_NUMBER: TFIBStringField;
    DSSCH_TYTLE: TFIBStringField;
    DSSMETA_KOD: TFIBIntegerField;
    DSSMETA_TYTLE: TFIBStringField;
    DSRAZD_NUM: TFIBIntegerField;
    DSRAZD_TYTLE: TFIBStringField;
    DSSTATE_KOD: TFIBIntegerField;
    DSSTATE_TYTLE: TFIBStringField;
    DSKEKV_KOD: TFIBIntegerField;
    DSKEKV_TYTLE: TFIBStringField;
    DSNUM_DOG: TFIBStringField;
    DSDATE_DOG: TFIBDateField;
    DSNAME_CUST: TFIBStringField;
    DSREG_DOG: TFIBStringField;
    DSLIC_BANKCARD: TFIBStringField;
    DSCOMENT_NANKCARD: TFIBStringField;
    DSNAME_SHABLON: TFIBStringField;
    DSDOLJNOST1: TFIBStringField;
    DSDOLJNOST2: TFIBStringField;
    DSNAME_PODPIS1: TFIBStringField;
    DSNAME_PODPIS2: TFIBStringField;
    DSTITLE_SHABLON: TFIBStringField;
    DSNAME_PRED: TFIBStringField;
    frxReport1: TfrxReport;
    frxReport2: TfrxReport;
    procedure AExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ARefreshExecute(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure AEditExecute(Sender: TObject);
    procedure SelectlangExecute(Sender: TObject);
    procedure LoadCaption;
    procedure AImportExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AprintExecute(Sender: TObject);
  private
    index_lang : smallint;
  public
    id_user : int64;
    date_inst : integer;
    constructor Create(AOwner: TComponent; dbase : Tpfibdatabase; id_us : integer); reintroduce; overload;
  end;

function UWReestrEditing(ao : Tcomponent; db : Tpfibdatabase; id_user : integer) : integer; stdcall;

    exports UWReestrEditing;

implementation

uses DateUtils,
     UWResourcesUnit,
     UWLoaderUnit,
     AddUWReestr,
     Registry,
     ShellApi,
     UWProgressForm,
     GlobalSPR;

{$R *.dfm}

function UWReestrEditing(ao : Tcomponent; db : Tpfibdatabase; id_user : integer) : integer; stdcall;
var
    T : TfmMainUWReestr;
begin
    T := TfmMainUWReestr.Create(ao, db, id_user);
    T.FormStyle := fsMDIChild;
    T.WindowState := wsMaximized;
    T.Show;
    Result := -1;
end;

constructor TfmMainUWReestr.Create(AOwner: TComponent; dbase: Tpfibdatabase;
  id_us: integer);
begin
    inherited Create(AOwner);
    id_user := id_us;

    DB                          := dbase;
    Tr.DefaultDatabase          := DB;
    db.DefaultTransaction       := Tr;

    DSReestr.Database           := db;
    DSReestr.Transaction        := Tr;

    DSVed.Database              := db;
    DSVed.Transaction           := Tr;

    DSInstall.Database          := db;
    DSInstall.Transaction       := Tr;

    DSProv.Database             := db;
    DSProv.Transaction          := Tr;

    DSPrint.Database            := db;
    DSPrint.Transaction         := Tr;

    DS.Database                 := db;
    DS.Transaction              := Tr;

    Tr.StartTransaction;

    DSInstall.Close;
    DSInstall.sqls.selectSql.Text := 'Select * from UW_INSTALL';
    DSInstall.Open;
    date_inst := DSInstall.fbn('DATE_SHOW_LAST').AsInteger;
    DSInstall.Close;

    cxDateEditBeg.Date := IncDay(date, -date_inst);
    cxDateEditBeg.Date := StrToDate('01'+copy(cxDateEditBeg.text, 3, 8));
    cxDateEditEnd.Date := date;

    DSVed.SQLs.SelectSQL.Text    := 'select * from UW_DT_REESTR_SELECT_VEDOMOST(?ID_DT_UW_REESTR)';
    DSReestr.Close;
    DSReestr.SQLs.SelectSQL.Text := 'select * from UW_DT_REESTR_SELECT('''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''')';
    DSReestr.Open;
    LoadCaption;

end;

procedure TfmMainUWReestr.AExitExecute(Sender: TObject);
begin
    close;
end;

procedure TfmMainUWReestr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmMainUWReestr.ARefreshExecute(Sender: TObject);
var
    id_l : int64;
begin
    if not DSReestr.IsEmpty then
    begin
        id_l := StrToInt64(DSReestr.fbn('ID_DT_UW_REESTR').AsString);
    end
        else id_l := -1; 
    DSReestr.Close;
    DSReestr.SQLs.SelectSQL.Text := 'select * from UW_DT_REESTR_SELECT('''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''')';
    DSReestr.Open;
    DSReestr.Locate('ID_DT_UW_REESTR', id_l, []);
end;

procedure TfmMainUWReestr.ADelExecute(Sender: TObject);
var
    i, j : int64;
    s : string;
begin
    if not DSReestr.IsEmpty then
    begin
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(UWResourcesUnit.VEDOMOST_REESTR_DELETE[index_lang] + '№ ' + DSReestr.fbn('NUMBER_REESTR').AsString + ' ?'), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrYes then
        begin
            TrW.DefaultDatabase         := DB;
            DSDel.Database              := DB;
            DSDel.Transaction           := TrW;
            TrW.StartTransaction;
            try
                j := StrToInt64(DSReestr.FieldByName('ID_DT_UW_REESTR').AsString);
                cxGrid1DBTableView1.Controller.GoToPrev(false);
                i := StrToInt64(DSReestr.FieldByName('ID_DT_UW_REESTR').AsString);
                DSReestr.locate('ID_DT_UW_REESTR', j, []);

                DSDel.Close;
                DSDel.SQLs.SelectSQL.Text := 'select * from UW_DT_REESTR_DELETE('+InttoStr(j)+', '+IntToStr(id_user)+')';
                DSDel.Open;
                if DSDel.fbn('RES_VALUE').AsInteger = 0 then
                begin
                    TrW.Commit;
                    ARefreshExecute(Sender);
                    DSReestr.locate('ID_DT_UW_REESTR', i, []);
                end else
                begin
                    TrW.Rollback;
                    Showmessage(UWResourcesUnit.VEDOMOST_REESTR_DONT_DELETE[index_lang]);
                end;
            except on E:Exception do begin
                TrW.Rollback;
                ShowMessage(E.Message);
            end;
            end;
        end;
    end;
end;

procedure TfmMainUWReestr.AAddExecute(Sender: TObject);
var
    R, RType, R_dog : variant;
    id_t, id_dog : int64;
    T : TfmAddUWReestr;
begin
    RType := UWLoaderUnit.LoadSelectVedomostTypeVd(self, db, id_user, true, false);
    if VarArrayDimCount(RType) > 0 then
    begin
        id_t  := RType[0];
        R_dog := UWLoaderUnit.LoadUVSpBankCardTakeDog(Self, id_user, db, false, true);
        if VarArrayDimCount(R_dog) > 0 then
        begin
            id_dog := R_dog[0];
            R      := UWLoaderUnit.LoadVedomostSelectPoDog(Self, db, id_user, id_t, id_dog);
            if VarArrayDimCount(R) > 0 then
            begin
                T := TfmAddUWReestr.Create(Self, Self, R, id_t, 1, id_dog);
                T.ShowModal;
                T.Free;
            end;
        end;
    end;
end;

procedure TfmMainUWReestr.AEditExecute(Sender: TObject);
var
    T : TfmAddUWReestr;
    id_dog : int64;
    r : variant;
begin
    if not DSReestr.IsEmpty then
    begin
        id_dog := strToInt64(DSReestr.fbn('ID_BANKCARD_DOGOVOR').AsString);
        R := -1;
        T := TfmAddUWReestr.Create(Self, Self, R, -1, 2, id_dog);
        T.ShowModal;
        T.Free;
        ARefreshExecute(Sender);
    end;
end;

procedure TfmMainUWReestr.SelectlangExecute(Sender: TObject);
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

procedure TfmMainUWReestr.LoadCaption;
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

    Caption                               := UWResourcesUnit.VEDOMOST_REESTR_CAPTION[index_lang];
    AAdd.Caption                          := UWResourcesUnit.MY_CONST_ADD[index_lang];
    AEdit.Caption                         := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ADel.Caption                          := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ARefresh.Caption                      := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    AExit.Caption                         := UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    Aprint.Caption                        := UWResourcesUnit.VEDOMOST_REESTR_PRINT[index_lang];

    cxLabel1.Caption                      := UWResourcesUnit.VEDOMOST_REESTR_OTOBRAJAT[index_lang];
    cxLabel2.Caption                      := UWResourcesUnit.MY_CONST_PO[index_lang];
    cxGrid1DBTableView1DBColumn1.Caption  := UWResourcesUnit.VEDOMOST_REESTR_NUMBER[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption  := UWResourcesUnit.VEDOMOST_REESTR_DATE[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption  := UWResourcesUnit.VEDOMOST_NAMEDOG[index_lang];
    cxGridDBTableView1DBColumn1.Caption   := UWResourcesUnit.VEDOMOST_NOMBER_VEDOM[index_lang];
    cxGridDBTableView1DBColumn2.Caption   := UWResourcesUnit.SPBANKCARD_DOG_DATE[index_lang];
    cxGridDBTableView1DBColumn3.Caption   := UWResourcesUnit.MY_CONST_SUMMA[index_lang];

    dxStatusBar1.Panels[0].Text          := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[3].Text          := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    dxStatusBar1.Panels[4].Text          := 'Ctrl+P-' + UWResourcesUnit.MY_CONST_THE_PRINT[index_lang];
    dxStatusBar1.Panels[5].Text          := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];

    ToolButton1.Hint                     := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    ToolButton2.Hint                     := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ToolButton3.Hint                     := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ToolButton4.Hint                     := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    ToolButton5.Hint                     := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    ToolButton7.Hint                     := 'Ctrl+P'  + UWResourcesUnit.VEDOMOST_REESTR_PRINT[index_lang];
end;

procedure TfmMainUWReestr.AImportExecute(Sender: TObject);
var
    dirname, dirname_small, name_file, s, c : string;
    i : integer;
    id_vedom : int64;
    T : TfmUWProgressForm;
begin
    if DSReestr.IsEmpty then exit;
    if cxShellBrowserDialog1.Execute then
    begin
        T := TfmUWProgressForm.Create(Self, 'test');
        T.Show;
        T.Repaint;
        dirname_small := intToStr(Yearof(date))+'_'+IntToStr(monthof(date))+'_'+IntToStr(dayof(date));
        dirname := DSReestr.fbn('NUMBER_REESTR').AsString+'_'+dirname_small;
        if not CreateDir(cxShellBrowserDialog1.Path+'\'+dirname) then
        begin
            T.Free;
            showmessage('don create dir');
            exit;
        end;

        HalcyonDataSet1.Close;
        HalcyonDataSet1.DatabaseName := ExtractFileDir(cxShellBrowserDialog1.Path)+'\'+dirname;
        DSVed.First;
        while not DSVed.Eof do
        begin
            name_file := cxShellBrowserDialog1.Path+'\'+dirname+'\'+DSVed.fbn('NUMBER_VEDOM').AsString+'_'+dirname_small;
            CopyFileA(Pchar(ExtractFilePath(Application.ExeName)+'\Reports\Vedomost\Vedomost_1000002.DBF'), Pchar(name_file + '.dbf'), false);
            HalcyonDataSet1.TableName := DSVed.fbn('NUMBER_VEDOM').AsString+'_'+dirname_small;

//           if (CreateHalcyonDataSet1.Execute) then
            begin
                HalcyonDataSet1.Exclusive:=True;
                HalcyonDataSet1.Open;
            end;
            while(not HalcyonDataSet1.Eof) do
            begin
                HalcyonDataSet1.Delete;
                HalcyonDataSet1.Next;
            end;

            HalcyonDataSet1.Close;
            HalcyonDataSet1.Exclusive := false;
            HalcyonDataSet1.Open;

            id_vedom := StrToInt64(DSVed.fbn('ID_DT_VEDOM').AsString);
            DSProv.Close;
            DSProv.SQLs.SelectSQL.Text := 'select * from UW_DT_PROV_VEDOMOST_SELECT('+IntToStr(id_vedom)+') order by FIO';
            DSProv.Open;
            DSProv.First;
            i := 0;
            while not DSProv.Eof do
            begin
                inc(i);
                s                            := StringReplace(DSProv.fbn('FIO').AsString, 'і', 'i', [rfReplaceAll]);
                s                            := StringReplace(s, 'І', 'I', [rfReplaceAll]);
                c                            := StringReplace(DSProv.fbn('COMENT_NANKCARD').AsString, 'і', 'i', [rfReplaceAll]);
                c                            := StringReplace(c, 'І', 'I', [rfReplaceAll]);
                HalcyonDataSet1.Insert;
                HalcyonDataSet1['NNP']       := i;
                HalcyonDataSet1['FIO']       := s;
                HalcyonDataSet1['TYPE_KART'] := c;
                HalcyonDataSet1['NO_KART']   := DSProv.fbn('LIC_BANKCARD').AsString;
                HalcyonDataSet1['SUMMA']     := DSProv.fbn('SUMA').AsCurrency;
    //            HalcyonDataSet1.InsertRecord([DSVed.fbn('NUMBER_VEDOM').Value, 'fioman', 'visa', '122334', DSVed.fbn('SUM_VEDOMOST').Value]);
                HalcyonDataSet1.Post;

                DSProv.Next;
            end;
            HalcyonDataSet1.Close;
            DSVed.Next;
        end;
        T.Free;
        ShowMessage('Выгрузка завершена');
    end;
end;

procedure TfmMainUWReestr.Button1Click(Sender: TObject);
begin
//    agColumnCustomizer1.Customize;
//    agColumnCustomizer1.LoadFromRegistry;

end;

procedure TfmMainUWReestr.FormActivate(Sender: TObject);
begin
    ARefreshExecute(Sender);
    LoadCaption;
end;

procedure TfmMainUWReestr.AprintExecute(Sender: TObject);
begin
    if not DSReestr.IsEmpty then
    begin
        DSPrint.Close;
        DSPrint.SQLs.SelectSQL.Text := 'select * from UW_DT_REESTR_PRINT('''+DSReestr.fbn('ID_DT_UW_REESTR').AsString+''')';
        DSPrint.Open;
        frxReport2.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_1000003.fr3');
        frxReport2.Variables['comp']     := QuotedStr(GetComputerNetName);
        frxReport2.Variables['id_user']  := QuotedStr(IntToStr(id_user));
        frxReport2.PrepareReport(true);
        frxReport2.ShowReport(true);

        DSPrint.First;
        while not DSPrint.Eof do
        begin
            DS.Close;
            DS.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_PRINT('''+DSPrint.fbn('ID_VEDOMOST').AsString+''')';
            DS.Open;

            frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_1000004.fr3');

            frxReport1.Variables['num_ved']  := QuotedStr(DSPrint.fbn('NUMBER_VEDOMOST').AsString);
            frxReport1.Variables['date_ved'] := QuotedStr(DSPrint.fbn('DATE_VEDOMOST').AsString);

            frxReport1.Variables['comp']     := QuotedStr(GetComputerNetName);
            frxReport1.Variables['id_user']  := QuotedStr(IntToStr(id_user));


            frxReport1.PrepareReport(false);
            frxReport1.ShowReport(false);
            DS.Close;
            DSPrint.Next;
        end;


    end;
end;

end.
