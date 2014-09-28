unit UWMainVedomost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ComCtrls, ToolWin, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  cxTextEdit, cxCurrencyEdit, ExtCtrls, cxDropDownEdit, cxCalendar,
  cxContainer, cxMaskEdit, cxLabel, dxStatusBar, FIBQuery, pFIBQuery,
  pFIBStoredProc, frxClass, frxDBSet;

type
  TfmUWMainVedomost = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    AAdd: TAction;
    AEdit: TAction;
    ADel: TAction;
    ARefresh: TAction;
    AExit: TAction;
    ATake: TAction;
    ToolButton6: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    DataSetVedomost: TpFIBDataSet;
    DataSetProv: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    DataSetProvID_DT_PROV_VEDOMOST: TFIBBCDField;
    DataSetProvID_DT_VEDOMOST: TFIBBCDField;
    DataSetProvID_MAN: TFIBBCDField;
    DataSetProvID_SCH: TFIBBCDField;
    DataSetProvID_SMETA: TFIBBCDField;
    DataSetProvID_RAZD: TFIBBCDField;
    DataSetProvID_STATE: TFIBBCDField;
    DataSetProvID_KEKV: TFIBBCDField;
    DataSetProvID_DOG: TFIBBCDField;
    DataSetProvKOD_DOG: TFIBBCDField;
    DataSetProvSUMA: TFIBBCDField;
    DataSetProvID_SP_BANKCARD: TFIBBCDField;
    DataSetProvFIO: TFIBStringField;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    Panel1: TPanel;
    cxComboBox1: TcxComboBox;
    cxDateEditBeg: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    DSInstall: TpFIBDataSet;
    ToolButton7: TToolButton;
    APrintVed: TAction;
    dxStatusBar1: TdxStatusBar;
    TrW: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Selectlang: TAction;
    DSDel: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    DataSetProvSCH_NUMBER: TFIBStringField;
    DataSetProvSCH_TYTLE: TFIBStringField;
    DataSetProvSMETA_KOD: TFIBIntegerField;
    DataSetProvSMETA_TYTLE: TFIBStringField;
    DataSetProvRAZD_NUM: TFIBIntegerField;
    DataSetProvRAZD_TYTLE: TFIBStringField;
    DataSetProvSTATE_KOD: TFIBIntegerField;
    DataSetProvSTATE_TYTLE: TFIBStringField;
    DataSetProvKEKV_KOD: TFIBIntegerField;
    DataSetProvKEKV_TYTLE: TFIBStringField;
    DataSetProvNUM_DOG: TFIBStringField;
    DataSetProvDATE_DOG: TFIBDateField;
    DataSetProvNAME_CUST: TFIBStringField;
    DataSetProvREG_DOG: TFIBStringField;
    DataSetProvLIC_BANKCARD: TFIBStringField;
    DataSetProvCOMENT_NANKCARD: TFIBStringField;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    DB: TpFIBDatabase;
    DSCombo: TpFIBDataSet;
    DataSetVedomostID_DT_VEDOMOST: TFIBStringField;
    DataSetVedomostNOMER: TFIBStringField;
    DataSetVedomostDATE_VEDOMOST: TFIBDateField;
    DataSetVedomostID_SP_TY_VEDOMOST: TFIBBCDField;
    DataSetVedomostINTO_ALL_DOC: TFIBSmallIntField;
    DataSetVedomostPK_ALL_DOC: TFIBBCDField;
    DataSetVedomostID_BANK: TFIBBCDField;
    DataSetVedomostNAME_VEDOMOST: TFIBStringField;
    DataSetVedomostID_DT_UW_REESTR: TFIBBCDField;
    DataSetVedomostNUMBER_REESTR: TFIBStringField;
    DataSetVedomostDATE_REESTR: TFIBDateField;
    DataSetVedomostSUM_VEDOMOST: TFIBBCDField;
    DS: TpFIBDataSet;
    frxReport1: TfrxReport;
    procedure AExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ARefreshExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure LoadCaption;
    procedure SelectlangExecute(Sender: TObject);
    procedure AEditExecute(Sender: TObject);
    procedure APrintVedExecute(Sender: TObject);
    procedure ATakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    index_lang : integer;
    ResValue : Variant;
    Ind1 : array of Int64;
    make_edit : boolean;
  public
    date_inst : integer;
    id_user_ : int64;
    id_type_v, id_dog_bankcard : int64;
    constructor Create(AOwner: TComponent; dbase : Tpfibdatabase; id_user : integer; editing, make_take : boolean; id_typ, id_dog : int64); reintroduce; overload;
  end;

function VedomostEditing(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost : int64) : integer; stdcall;
function VedomostSelect(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost : int64) : Variant; stdcall;
function VedomostSelectPoDog(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost, id_dog_bankcard : int64) : Variant; stdcall;

    exports VedomostEditing, VedomostSelect, VedomostSelectPoDog;

implementation

uses DateUtils,
     UWAddVedomost,
     UWResourcesUnit,
     Registry,
     UWLoaderUnit,
     GlobalSPR;

{$R *.dfm}

function VedomostEditing(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost : int64) : integer;
var
    T : TfmUWMainVedomost;
begin
    T             := TfmUWMainVedomost.Create(ao, db, id_user, true, false, id_type_vedomost, -1);
    T.FormStyle   := fsMDIChild;
    T.WindowState := wsMaximized;
    T.Show;
    Result        := -1;
end;

function VedomostSelect(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost : int64) : Variant;
var
    T : TfmUWMainVedomost;
begin
    T             := TfmUWMainVedomost.Create(ao, db, id_user, false, true, id_type_vedomost, -1);
    T.FormStyle   := fsNormal;
    T.WindowState := wsNormal;
    T.ShowModal;
    Result        := T.ResValue;
    T.Free;
end;

function VedomostSelectPoDog(ao : Tcomponent; db : Tpfibdatabase; id_user : integer; id_type_vedomost, id_dog_bankcard : int64) : Variant; stdcall;
var
    T : TfmUWMainVedomost;
begin
    T             := TfmUWMainVedomost.Create(ao, db, id_user, false, true, id_type_vedomost, id_dog_bankcard);
    T.FormStyle   := fsNormal;
    T.WindowState := wsNormal;
    T.ShowModal;
    Result        := T.ResValue;
    T.Free;
end;

constructor TfmUWMainVedomost.Create(AOwner: TComponent; dbase: Tpfibdatabase; id_user: integer; editing, make_take: boolean; id_typ, id_dog : int64);
var
    i : integer;
begin
    inherited Create(AOwner);
    LoadCaption;
    id_type_v                   := id_typ;
    id_user_                    := id_user;
    id_dog_bankcard             := id_dog;

    DB                          := dbase;
    Transaction.DefaultDatabase := DB;
    dB.DefaultTransaction       := Transaction;

    DataSetVedomost.Database    := db;
    DataSetVedomost.Transaction := Transaction;

    DataSetProv.Database        := dB;
    DataSetProv.Transaction     := Transaction;

    DSInstall.Database          := dB;
    DSInstall.Transaction       := Transaction;

    DSCombo.Database            := dB;
    DSCombo.Transaction         := Transaction;

    DS.Database                 := dB;
    DS.Transaction              := Transaction;

    Transaction.StartTransaction;

    DSInstall.Close;
    DSInstall.sqls.selectSql.Text := 'Select * from UW_INSTALL';
    DSInstall.Open;
    date_inst := DSInstall.fbn('DATE_SHOW_LAST').AsInteger;
    DSInstall.Close;

    cxDateEditBeg.Date := IncDay(date, -date_inst);
    cxDateEditBeg.Date := StrToDate('01'+copy(cxDateEditBeg.text, 3, 8));
    cxDateEditEnd.Date := date;


    DSCombo.Close;
    DSCombo.sqls.selectSql.Text := 'Select * from UW_SP_TYPE_VEDOMOST';
    DSCombo.Open;
    DSCombo.FetchAll;
    SetLength(Ind1, DSCombo.RecordCount+1);
    DSCombo.First;

    cxComboBox1.Properties.Items.Clear;
    CxComboBox1.Properties.Items.Insert(0, UWResourcesUnit.VEDOMOST_SHOW_ALL_VEDOMOST[Index_lang]);
    Ind1[0] := -1;
    i := 0;
    while not DSCombo.Eof do
    begin
        Ind1[DSCombo.RecNo] := strToInt64(DSCombo.fbn('ID_SP_TYPE_VEDOMOST').AsString);
        if (strToInt64(DSCombo.fbn('ID_SP_TYPE_VEDOMOST').AsString) = id_type_v)
            then i := DSCombo.RecNo;
        CxComboBox1.Properties.Items.Insert(DSCombo.RecNo, DSCombo.fbn('NAME').AsString);
        DSCombo.Next;
    end;

    cxComboBox1.ItemIndex := i;
    DSCombo.Close;
    if id_type_v <> -1 then cxComboBox1.Enabled := false;

    make_edit     := true;
    if not editing then
    begin
        AAdd.Visible  := false;
        AEdit.Visible := false;
        ADel.Visible  := false;
        make_edit     := false;
    end;
    if not make_take then
    begin
        ATake.Visible := false;
    end else
    begin
        cxGrid1DBTableView1.OptionsSelection.MultiSelect := true;
    end;


    DataSetProv.SQLs.SelectSQL.Text := 'select * from UW_DT_PROV_VEDOMOST_SELECT(?ID_DT_VEDOMOST)';
    if id_dog_bankcard = -1 then
    begin
        if id_type_v = -1 then
        begin
            DataSetVedomost.Close;
            DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_SELECT('+IntToStr(0)+', '+IntToStr(1)+', '''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''')';
            DataSetVedomost.Open;
        end else
        begin
            DataSetVedomost.Close;
            DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_SELECT('+IntToStr(id_type_v)+', '+IntToStr(0)+', '''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''')';
            DataSetVedomost.Open;
        end;
    end else
    begin
        if id_type_v = -1 then
        begin
            DataSetVedomost.Close;
            DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_SELECT_DOG('+IntToStr(0)+', '+IntToStr(1)+', '''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''', '+IntToStr(id_dog_bankcard)+')';
            DataSetVedomost.Open;
        end else
        begin
            DataSetVedomost.Close;
            DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_SELECT_DOG('+IntToStr(id_type_v)+', '+IntToStr(0)+', '''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''', '+IntToStr(id_dog_bankcard)+')';
            DataSetVedomost.Open;
        end;
    end;
end;

procedure TfmUWMainVedomost.AExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmUWMainVedomost.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
    j : integer;
begin
    for j := 0 to Db.ActiveTransactionCount do
    begin
        if Db.Transactions[j].Active then
        begin
            try
                Db.Transactions[j].Active := false;
            finally
            end;
        end;
    end;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmUWMainVedomost.ARefreshExecute(Sender: TObject);
var
    id_refr : int64;
    i : integer;
begin
    if not DataSetVedomost.IsEmpty then
    begin
        id_refr := StrToInt64(DataSetVedomost.fbn('ID_DT_VEDOMOST').AsString);
    end else
        id_refr := -1;
    i := CxComboBox1.ItemIndex;
    if i = 0 then
    begin
        DataSetVedomost.Close;
        DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_SELECT('+IntToStr(0)+', '+IntToStr(1)+', '''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''')';
        DataSetVedomost.Open;
    end else
    begin
        DataSetVedomost.Close;
        DataSetVedomost.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_SELECT('+IntToStr(Ind1[i])+', '+IntToStr(0)+', '''+DateToStr(cxDateEditBeg.Date)+''', '''+DateToStr(cxDateEditEnd.Date)+''')';
        DataSetVedomost.Open;
    end;
    if not DataSetVedomost.IsEmpty then
    begin
        DataSetVedomost.locate('ID_DT_VEDOMOST', id_refr, []);
    end;
end;

procedure TfmUWMainVedomost.AAddExecute(Sender: TObject);
var
    T : TfmUWAddVedomost;
    id_type, id_bank_dog : int64;
    s, name_dog : string;
    f : boolean;
    R : Variant;
begin
    if not make_edit then exit;

    if CxComboBox1.ItemIndex = 0
        then id_type := -1
        else begin
             id_type := Ind1[CxComboBox1.ItemIndex];
        end;
    f           := true;
    id_bank_dog := -1;
    name_dog    := '';
    if id_type <> -1 then
    begin
        s := cxComboBox1.Text;
    end else
    begin
        R := UWLoaderUnit.LoadSelectVedomostTypeVd(Self, DB, id_user_, true, true);
        if VarArrayDimCount(R) > 0 then
        begin
            id_type  := R[0];
            s        := R[1];
        end else
            f := false;
    end;
    R := -1;
    R := UWLoaderUnit.LoadUVSpBankCardTakeDog(Self, id_user_, DB, true, true);
    if VarArrayDimCount(R) > 0 then
    begin
        id_bank_dog  := R[0];
        name_dog     := R[3];
    end else
        f := false;
    if f then
    begin
        T := TfmUWAddVedomost.Create(self, DB, id_type, id_bank_dog, self, 1, s, name_dog);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmUWMainVedomost.ADelExecute(Sender: TObject);
var
    i, j : int64;
    s : string;
begin
    if not make_edit then exit;
    if not DataSetVedomost.IsEmpty then
    begin
        s := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(UWResourcesUnit.VEDOMOST_DELETE[index_lang] + '¹ ' + DataSetVedomost.fbn('NOMER').AsString ), Pchar(s), MB_YESNO + MB_DEFBUTTON2) = mrYes then
        begin
            TrW.DefaultDatabase         := DB;
            DSDel.Database              := DB;
            DSDel.Transaction           := TrW;
            TrW.StartTransaction;
            try
                j := StrToInt64(DataSetVedomost.FieldByName('ID_DT_VEDOMOST').AsString);
                cxGrid1DBTableView1.Controller.GoToPrev(false);
                i := StrToInt64(DataSetVedomost.FieldByName('ID_DT_VEDOMOST').AsString);
                DataSetVedomost.locate('ID_DT_VEDOMOST', j, []);

                DSDel.Close;
                DSDel.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST_DELETE('+InttoStr(j)+', '+intToStr(id_user_)+')';
                DSDel.Open;
                if DSDel.fbn('R_VEL').AsInteger = 0 then
                begin
                    TrW.Commit;
                    ARefreshExecute(Sender);
                    DataSetVedomost.locate('ID_DT_VEDOMOST', i, []);
                end else
                begin
                    TrW.Rollback;
                    Showmessage(UWResourcesUnit.VEDOMOST_DONT_DELETE[index_lang]);
                end;
            except on E:Exception do begin
                TrW.Rollback;
                ShowMessage(E.Message);
            end;
            end;
        end;
    end;
end;

procedure TfmUWMainVedomost.LoadCaption;
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

    Caption                              := UWResourcesUnit.VEDOMOST_CAPTION[index_lang];
    AAdd.Caption                         := UWResourcesUnit.MY_CONST_ADD[index_lang];
    AEdit.Caption                        := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ADel.Caption                         := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ARefresh.Caption                     := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    AExit.Caption                        := UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    ATake.Caption                        := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    APrintVed.Caption                    := UWResourcesUnit.MY_CONST_THE_PRINT[index_lang];

    AAdd.Hint                            := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    AEdit.Hint                           := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ADel.Hint                            := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ARefresh.Hint                        := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    AExit.Hint                           := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    ATake.Hint                           := 'Enter-'  + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    APrintVed.Hint                       := 'Ctrl+P-' + UWResourcesUnit.MY_CONST_THE_PRINT[index_lang];

    cxGrid1DBTableView1DBColumn1.Caption := UWResourcesUnit.MY_CONST_NOMER[index_lang];
    cxGrid1DBTableView1DBColumn2.Caption := UWResourcesUnit.MY_CONST_DATE[index_lang];
    cxGrid1DBTableView1DBColumn3.Caption := UWResourcesUnit.VEDOMOST_NAME[index_lang];
    cxGrid1DBTableView1DBColumn4.Caption := UWResourcesUnit.VEDOMOST_REESTR_NUMBER[index_lang];
    cxGridDBTableView1DBColumn1.Caption  := UWResourcesUnit.MY_CONST_FIO[index_lang];
    cxGridDBTableView1DBColumn2.Caption  := UWResourcesUnit.MY_CONST_SUMMA[index_lang];

    dxStatusBar1.Panels[0].Text          := 'Ins-'    + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBar1.Panels[1].Text          := 'F2-'     + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBar1.Panels[2].Text          := 'Del-'    + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBar1.Panels[3].Text          := 'F5-'     + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    dxStatusBar1.Panels[4].Text          := 'Ctrl+P-' + UWResourcesUnit.MY_CONST_THE_PRINT[index_lang];
    dxStatusBar1.Panels[5].Text          := 'Esc-'    + UWResourcesUnit.MY_CONST_CLOSE[index_lang];
    dxStatusBar1.Panels[6].Text          := 'Enter-'  + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];

    cxLabel1.Caption                     := UWResourcesUnit.VEDOMOST_OTOBRAJAT[index_lang];
    cxLabel2.Caption                     := UWResourcesUnit.MY_CONST_PO[index_lang];
    cxLabel3.Caption                     := UWResourcesUnit.VEDOMOST_OTOBRAJAT_TYPE[index_lang];
end;

procedure TfmUWMainVedomost.SelectlangExecute(Sender: TObject);
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

procedure TfmUWMainVedomost.AEditExecute(Sender: TObject);
var
    i : int64;
    T : TfmUWAddVedomost;
    id_type_v, id_bank : Int64;

begin
    if not make_edit then exit;
    i := StrToInt64(DataSetVedomost.FieldByName('ID_DT_VEDOMOST').AsString);
    TrW.DefaultDatabase         := DB;
    DSDel.Database              := DB;
    DSDel.Transaction           := TrW;
    TrW.StartTransaction;
    DSDel.Close;
    DSDel.SQLs.SelectSQL.Text := 'select * from UW_DT_VEDOMOST where ID_DT_VEDOMOST='+IntToStr(i)+'';
    DSDel.Open;
    if DSDel.RecordCount = 0 then
    begin
        TrW.Rollback;
        Showmessage(UWResourcesUnit.VEDOMOST_DONT_ZAPIS[index_lang]);
        ARefreshExecute(Sender);
        exit;
    end;

    if DSDel.fbn('INTO_ALL_DOC').AsInteger = 1 then
    begin
        TrW.Rollback;
        Showmessage(UWResourcesUnit.VEDOMOST_DONT_EDIT[index_lang]);
        exit;
    end;

    if StrToInt64(DSDel.fbn('ID_DT_UW_REESTR').AsString) > 0 then
    begin
        TrW.Rollback;
        Showmessage(UWResourcesUnit.VEDOMOST_DONT_EDIT_REESTR[index_lang]);
        exit;
    end;

    DSDel.Close;
    TrW.Rollback;

    id_type_v := StrToint64(DataSetVedomost.FieldByName('ID_SP_TY_VEDOMOST').AsString);
    id_bank   := StrToint64(DataSetVedomost.FieldByName('ID_BANK').AsString);
    T := TfmUWAddVedomost.Create(self, DB, id_type_v, id_bank, self, 2, '', '');
    T.ShowModal;
    T.Free;
end;

procedure TfmUWMainVedomost.APrintVedExecute(Sender: TObject);
var
    id_type_vedom : int64;
begin
    id_type_vedom := StrToint64(DataSetVedomost.fbn('ID_SP_TY_VEDOMOST').AsString);
    DS.Close;
    DS.SQLs.SelectSQL.Text := 'select * from UW_PRINT_SSHABLON_SELECT('+IntToStr(id_type_vedom)+')';
    DS.Open;

    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Vedomost\Vedomost_1000001.fr3');
    frxReport1.Variables['podpis2']  := QuotedStr(DS.fbn('NAME_PODPIS2').AsString);
    frxReport1.Variables['podpis1']  := QuotedStr(DS.fbn('NAME_PODPIS1').AsString);
    frxReport1.Variables['dolj1']    := QuotedStr(DS.fbn('DOLJNOST1').AsString);
    frxReport1.Variables['dolj2']    := QuotedStr(DS.fbn('DOLJNOST2').AsString);
    frxReport1.Variables['title_s']  := QuotedStr(DS.fbn('TITLE_SHABLON').AsString);
    frxReport1.Variables['name_s']   := QuotedStr(DS.fbn('NAME_SHABLON').AsString);
    frxReport1.Variables['name_pr']  := QuotedStr(DS.fbn('NAME_PRED').AsString);

    frxReport1.Variables['num_ved']  := QuotedStr(DataSetVedomost.fbn('NOMER').AsString);
    frxReport1.Variables['date_ved'] := QuotedStr(DataSetVedomost.fbn('DATE_VEDOMOST').AsString);

    frxReport1.Variables['comp']     := QuotedStr(GetComputerNetName);
    frxReport1.Variables['id_user']  := QuotedStr(IntToStr(id_user_));


    frxReport1.PrepareReport(true);
    frxReport1.ShowReport(true);
    DS.Close;
end;

procedure TfmUWMainVedomost.ATakeExecute(Sender: TObject);
var
    count_multy, i : integer;
    id_loc : int64;
begin
    if not DataSetVedomost.isEmpty then
    begin
        count_multy := cxGrid1DBTableView1.DataController.GetSelectedCount;
        ResValue    := VarArrayCreate([0, count_multy-1], varVariant);
        for i := 0 to count_multy-1 do
        begin
            id_loc := cxGrid1DBTableView1.DataController.GetRecordId(cxGrid1DBTableView1.Controller.SelectedRecords[i].RecordIndex);
            DataSetVedomost.Locate('ID_DT_VEDOMOST', id_loc, []);
            ResValue[i] := VarArrayOf([DataSetVedomost.FieldByName('ID_DT_VEDOMOST').AsString,
                                       DataSetVedomost.FieldByName('NOMER').AsString,
                                       DataSetVedomost.FieldByName('DATE_VEDOMOST').AsDateTime,
                                       DataSetVedomost.FieldByName('ID_SP_TY_VEDOMOST').AsString,
                                       DataSetVedomost.FieldByName('NAME_VEDOMOST').AsString,
                                       DataSetVedomost.FieldByName('SUM_VEDOMOST').AsCurrency
                                       ]);
        end;
        Close;
    end;
end;

procedure TfmUWMainVedomost.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ATakeExecute(Sender);
end;

end.
