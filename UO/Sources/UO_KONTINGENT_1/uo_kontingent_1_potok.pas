unit uo_kontingent_1_potok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxStatusBar, cxGridTableView,
  ImgList, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxContainer, cxLabel, ExtCtrls, uo_kontingent_1_main, AArray,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxGridBandedTableView,
  cxGridDBBandedTableView, cxSplitter;

type
  Tfmuo_kontingent_1_potok = class(TForm)
    dxBarManager_sp_type: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    DataSource1: TDataSource;
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    TWr: TpFIBTransaction;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionClose: TAction;
    ActionPrint: TAction;
    ActionFind: TAction;
    ActionUp: TAction;
    ActionCancel: TAction;
    ActionRefresh: TAction;
    ActionProperties: TAction;
    ActionProp: TAction;
    ActionCopy: TAction;
    ActionMoveTo: TAction;
    ActionLast: TAction;
    ActionPrintMan: TAction;
    ActionTake: TAction;
    ActionView: TAction;
    ActionFullCollaps: TAction;
    ActionFullExpand: TAction;
    ActionAddKoren: TAction;
    Action1: TAction;
    ImageListButton: TImageList;
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
    dxStatusBarSP: TdxStatusBar;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarListItem1: TdxBarListItem;
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    dxBarSubItem3: TdxBarSubItem;
    dxBarToolbarsListItem1: TdxBarToolbarsListItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    cxButtonEdit1: TcxButtonEdit;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    Stored: TpFIBStoredProc;
    cxSplitter1: TcxSplitter;
    DSLang: TpFIBDataSet;
    DataSource2: TDataSource;
    Panel2: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid2DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    AAddLang: TAction;
    AChangeLang: TAction;
    ADelLang: TAction;
    dxBarLargeButton6: TdxBarLargeButton;
    DSLangID_DT_KONTINGENT_IN: TFIBBCDField;
    DSLangID_DT_KONTINGENT: TFIBBCDField;
    DSLangID_SP_IN_LANG: TFIBBCDField;
    DSLangKOLVE: TFIBIntegerField;
    DSLangKOD_LANG: TFIBIntegerField;
    DSLangNAME_LANG: TFIBStringField;
    DSLangSHORT_NAME_LANG: TFIBStringField;
    DSave: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    DSID_SP_SPEC: TFIBBCDField;
    DSKOLVO: TFIBIntegerField;
    DSID_SP_DEPARTMENT_GR: TFIBBCDField;
    DSNAME_GROUP: TFIBStringField;
    DSCODE_SPEC: TFIBStringField;
    DSFULL_NAME_SPEC: TFIBStringField;
    DSID_DT_KONTINGENT: TFIBBCDField;
    DSID_SP_DEPARTMENT_FAK: TFIBBCDField;
    DSID_SP_DERG_ZAKAZ: TFIBBCDField;
    DSID_SP_FORM_STUD: TFIBBCDField;
    DSID_SP_GOD_NABORA: TFIBBCDField;
    DSID_SP_KAT_STUD: TFIBBCDField;
    DSID_SP_KURS: TFIBBCDField;
    DSNAME_ZAKAZ: TFIBStringField;
    DSSHORT_NAME_ZAKAZ: TFIBStringField;
    DSNAME_MOVA: TFIBStringField;
    DSSHORT_NAME_MOVA: TFIBStringField;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dxBarLargeButtonOtmenaClick(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ADelLangExecute(Sender: TObject);
    procedure AAddLangExecute(Sender: TObject);
    procedure AChangeLangExecute(Sender: TObject);
  private
    myform : Tfm_uo_kontingent_1_main;
    reg : smallint;
  public
    id_potok : int64;
    id_kon, id_god, id_fak, id_form, id_kat, id_kurs, id_spec : int64;
    date_work, name_spec : string;
    constructor Create(aOwner: TComponent; mform : Tfm_uo_kontingent_1_main; r : smallint); reintroduce; overload;
  end;

implementation
uses uUO_Loader,
     uo_kontingent_1_potok_add,
     uo_kontingent_1_potok_lang;
{$R *.dfm}

constructor Tfmuo_kontingent_1_potok.Create(aOwner: TComponent;
  mform: Tfm_uo_kontingent_1_main; r: smallint);
begin
    inherited Create(aOwner);
    reg    := r;
    myform := mform;
    DB                      := myform.db;
    Tr.DefaultDatabase      := DB;
    TWr.DefaultDatabase     := DB;
    DB.DefaultTransaction   := Tr;

    DS.Database             := DB;
    DS.Transaction          := Tr;

    DSLang.Database         := DB;
    DSLang.Transaction      := Tr;

    Tr.StartTransaction;

    date_work := myform.DS.FBN('CUR_DAT').AsString;
    id_spec   := StrToInt64(myform.ds.fbn('ID_SP_SPEC').AsString);
    name_spec := myform.ds.fbn('NAME_SPEC').AsString;


    DSLang.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_IN_S(?ID_DT_KONTINGENT)';

    if (reg = 2) or (reg = 3) then
        if not myform.DS.FBN('ID_DT_KONTINGENT').IsNull then
        begin
//            cxGrid1.SetFocus;
            id_kon    := StrToInt64(myform.DS.FBN('ID_DT_KONTINGENT').AsString);
            id_potok  := StrToInt64(myform.DS.FBN('ID_SP_POTOK').AsString);
            cxButtonEdit1.Text := myform.DS.FBN('NAME_POTOK').AsString;
            DS.Close;
            DS.SQLs.SelectSQL.Text  := 'select * from UO_DT_KONTINGENT_SELECT_POTOK('+IntToStr(id_potok)+', '''+date_work+''')';
            DS.Open;
        end;

    if reg = 3 then
    begin
        ActionAdd.Enabled    := false;
        ActionChange.Enabled := false;
        ActionDelete.Enabled := false;

        AAddLang.Enabled     := false;
        AChangeLang.Enabled  := false;
        ADelLang.Enabled     := false;
    end;

end;

procedure Tfmuo_kontingent_1_potok.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'uo_sp_potok.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
    uUO_Loader.ShowAllUOBpl(self, InputParam);

    id_potok          := InputParam['OutPut']['ID_SP_POTOK'].AsInt64;
    if id_potok > 0 then
    begin
        cxButtonEdit1.Text := InputParam['OutPut']['NAME'].AsString + '(' + InputParam['OutPut']['SHORT_NAME'].AsString + ')';
    end;
    InputParam.Free;
end;

procedure Tfmuo_kontingent_1_potok.dxBarLargeButtonOtmenaClick(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_kontingent_1_potok.ActionRefreshExecute(Sender: TObject);
begin
    if id_potok > 0 then
    begin
        DS.Close;
        DSLang.Close;
        DSLang.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_IN_S(?ID_DT_KONTINGENT)';

        DS.SQLs.SelectSQL.Text  := 'select * from UO_DT_KONTINGENT_SELECT_POTOK('+IntToStr(id_potok)+', '''+date_work+''')';
        DS.Open;
    end;
end;

procedure Tfmuo_kontingent_1_potok.ActionDeleteExecute(Sender: TObject);
var
    id_del_l, id_del_t : int64;
begin
    if not DS.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити групу ' + DS.FieldByName('NAME_GROUP').AsString + ' кількістю ' + DS.FieldByName('KOLVO').AsString), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            id_del_t           := StrToInt64(DS.FieldByName('ID_DT_KONTINGENT').AsString);
            cxGrid1DBTableView1.Controller.GoToPrev(false);
            id_del_l           := StrToInt64(DS.FieldByName('ID_DT_KONTINGENT').AsString);
            cxGrid1DBTableView1.Controller.GoToNext(false);
            Stored.Database    := DB;
            Stored.Transaction := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_DT_KONTINGENT_DELETE';
                Stored.ParamByName('ID_DT_KONTINGENT').AsInt64 := id_del_t;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ActionRefreshExecute(Sender);
            DS.Locate('ID_DT_KONTINGENT', id_del_l, []);
        end;
    end;
end;

procedure Tfmuo_kontingent_1_potok.ActionAddExecute(Sender: TObject);
var
    T : Tfmuo_kontingent_1_potok_add;
begin
    if id_potok <= 0 then
    begin
        cxButtonEdit1PropertiesButtonClick(Sender, 0);
        if id_potok <=0 then exit;
    end;
    if not DS.IsEmpty then
    begin
        id_god   := StrToInt64(ds.fbn('ID_SP_GOD_NABORA').AsString);
        id_fak   := StrToInt64(ds.fbn('ID_SP_DEPARTMENT_FAK').AsString);
        id_form  := StrToInt64(ds.fbn('ID_SP_FORM_STUD').AsString);
        id_kat   := StrToInt64(ds.fbn('ID_SP_KAT_STUD').AsString);
        id_kurs  := StrToInt64(ds.fbn('ID_SP_KURS').AsString);
        id_spec  := StrToInt64(ds.fbn('ID_SP_SPEC').AsString);
    end else
    begin
        id_god   := StrToInt64(myform.ds.fbn('ID_SP_GOD_NABORA').AsString);
        try id_fak   := StrToInt64(myform.ds.fbn('ID_SP_DEPARTMENT_FAK').AsString); except id_fak := 1; end;
        id_form  := StrToInt64(myform.ds.fbn('ID_SP_FORM_STUD').AsString);
        id_kat   := StrToInt64(myform.ds.fbn('ID_SP_KAT_STUD').AsString);
        id_kurs  := StrToInt64(myform.ds.fbn('ID_SP_KURS').AsString);
        id_spec  := StrToInt64(myform.ds.fbn('ID_SP_SPEC').AsString);
    end;
    T := Tfmuo_kontingent_1_potok_add.Create(Self, Self, 1);
    T.Showmodal;
    T.Free;

end;

procedure Tfmuo_kontingent_1_potok.ActionChangeExecute(Sender: TObject);
var
    T : Tfmuo_kontingent_1_potok_add;
begin
    if not DS.IsEmpty then
    begin
        T := Tfmuo_kontingent_1_potok_add.Create(Self, Self, 2);
        T.Showmodal;
        T.Free;
    end;
end;

procedure Tfmuo_kontingent_1_potok.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_kontingent_1_potok.ADelLangExecute(Sender: TObject);
var
    id_del_l, id_del_t : int64;
begin
    if not DSLang.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити мову ' + DSLang.FieldByName('NAME_LANG').AsString + '?'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            id_del_t           := StrToInt64(DSLang.FieldByName('ID_DT_KONTINGENT_IN').AsString);
            id_del_l           := StrToInt64(DS.FieldByName('ID_DT_KONTINGENT').AsString);
            Stored.Database    := DB;
            Stored.Transaction := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_DT_KONTINGENT_IN_D';
                Stored.ParamByName('D_ID_KONTINGENT_IN').AsInt64 := id_del_t;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ActionRefreshExecute(Sender);
            DS.Locate('ID_DT_KONTINGENT', id_del_l, []);
        end;
    end;
end;

procedure Tfmuo_kontingent_1_potok.AAddLangExecute(Sender: TObject);
var
    id_l, id_kon : int64;
    name, kolvo : string;
begin
    if DS.IsEmpty then exit;
    id_kon := StrToint64(DS.fbn('ID_DT_KONTINGENT').AsString);
    id_l   := -1;
    name   := '';
    kolvo  := '';
    if showlang_kontingent(Self, id_l, name, kolvo) then
    begin
        try
            DSave.Database      := DB;
            DSave.Transaction   := TWr;
            TWr.StartTransaction;

            DSave.Close;
            DSave.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_IN_I('+InttoStr(id_kon)+', '+InttoStr(id_l)+', '''+kolvo+''')';
            DSave.Open;
            if StrToInt64(DSave.fbn('ID_DT_KONTINGENT_IN').AsString) <= 0 then
            begin
                TWr.Rollback;
                showmessage('Помилка! Данні не збережені!');
                exit;
            end;
//            id := StrToint64(DSave.fbn('ID_DT_KONTINGENT_IN').AsString);
            DSave.Close;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;
        ActionRefreshExecute(Sender);
        DS.Locate('ID_DT_KONTINGENT', id_kon, []);
//        DSLang.Locate('ID_DT_KONTINGENT_IN', id, []);

    end;
end;

procedure Tfmuo_kontingent_1_potok.AChangeLangExecute(Sender: TObject);
var
    id_l, id_kon, lang : int64;
    name, kolvo : string;
begin
    if DS.IsEmpty then exit;
    if DSLang.IsEmpty then exit;
    id_kon := StrToint64(DS.fbn('ID_DT_KONTINGENT').AsString);
    id_l   := StrToint64(DSLang.fbn('ID_DT_KONTINGENT_IN').AsString);
    lang   := StrToint64(DSLang.fbn('ID_SP_IN_LANG').AsString);
    name   := DSLang.fbn('NAME_LANG').AsString;
    kolvo  := DSLang.fbn('KOLVE').AsString;
    if showlang_kontingent(Self, lang, name, kolvo) then
    begin
        try
            Stored.Database      := DB;
            Stored.Transaction   := TWr;
            TWr.StartTransaction;

            Stored.StoredProcName := 'UO_DT_KONTINGENT_IN_U';
            Stored.ParamByName('ID_DT_KONTINGENT_IN').AsInt64     := id_l;
            Stored.ParamByName('ID_SP_IN_LANG').AsInt64           := lang;
            Stored.ParamByName('KOLVE').AsInteger                 := StrToInt(kolvo);
            Stored.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
            exit;
        end;
        end;
        ActionRefreshExecute(Sender);
        DS.Locate('ID_DT_KONTINGENT', id_kon, []);
//        DSLang.Locate('ID_DT_KONTINGENT_IN', id_l, []);

    end;
end;

end.
