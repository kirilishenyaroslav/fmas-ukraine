unit uo_kontingent_4_potok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxStatusBar, cxGridTableView,
  ImgList, ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, dxBarExtItems, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxContainer, cxLabel, ExtCtrls, uo_kontingent_4_main, AArray,
  FIBQuery, pFIBQuery, pFIBStoredProc, cxGridBandedTableView,
  cxGridDBBandedTableView, cxSplitter;

type
  Tfmuo_kontingent_4_potok = class(TForm)
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
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    Stored: TpFIBStoredProc;
    DSLang: TpFIBDataSet;
    DataSource2: TDataSource;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
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
    DSID_SP_KURS: TFIBBCDField;
    DSID_SP_DERG_ZAKAZ: TFIBBCDField;
    DSKOLVO: TFIBIntegerField;
    DSID_SP_TYPE_DISC: TFIBBCDField;
    DSNAME_KURS: TFIBStringField;
    DSSHORT_NAME_KURS: TFIBStringField;
    DSNAME_ZAKAZ: TFIBStringField;
    DSSHORT_NAME_ZAKAZ: TFIBStringField;
    DSNAME_TYPE_DISP: TFIBStringField;
    DSSHORT_NAME_TYPE_DISP: TFIBStringField;
    DSID_DT_KONTINGENT: TFIBBCDField;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure dxBarLargeButtonOtmenaClick(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
  private
    myform : Tfm_uo_kontingent_4_main;
    reg : smallint;
  public
    id_potok : int64;
    id_kon, id_god, id_fak, id_form, id_kat, id_kurs, id_spec : int64;
    date_work, name_spec : string;
    constructor Create(aOwner: TComponent; mform : Tfm_uo_kontingent_4_main; r : smallint); reintroduce; overload;
  end;

implementation
uses uUO_Loader,
     uo_kontingent_4_potok_add,
     uCommonSp;
{$R *.dfm}

constructor Tfmuo_kontingent_4_potok.Create(aOwner: TComponent;
  mform: Tfm_uo_kontingent_4_main; r: smallint);
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
    id_god    := StrToInt64(myform.ds.fbn('ID_SP_GOD_NABORA').AsString);
    id_fak    := StrToInt64(myform.ds.fbn('ID_SP_DEPARTMENT_FAK').AsString);
    id_form   := StrToInt64(myform.ds.fbn('ID_SP_FORM_STUD').AsString);
    id_kat    := StrToInt64(myform.ds.fbn('ID_SP_KAT_STUD').AsString);
    id_kurs   := StrToInt64(myform.ds.fbn('ID_SP_KURS').AsString);

//    DSLang.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_IN_S(?ID_DT_KONTINGENT)';

    if (reg = 2) or (reg = 3) then
        if not myform.DS.FBN('ID_DT_KONTINGENT').IsNull then
        begin
//            cxGrid1.SetFocus;
            id_kon    := StrToInt64(myform.DS.FBN('ID_DT_KONTINGENT').AsString);
            id_potok  := StrToInt64(myform.DS.FBN('ID_SP_DEPARTMENT_GR').AsString);
            DS.Close;
            DS.SQLs.SelectSQL.Text  := 'select * from UO_DT_KONTINGENT_4_SELECT_KAFED('+IntToStr(id_potok)+', '+IntToStr(id_spec)+', '+IntToStr(id_god)+', '+IntToStr(id_fak)+', '+IntToStr(id_form)+', '+IntToStr(id_kat)+', '+IntToStr(id_kurs)+')';
            DS.Open;
        end;

    if reg = 3 then
    begin
        ActionAdd.Enabled    := false;
        ActionChange.Enabled := false;
        ActionDelete.Enabled := false;

    end;

end;

procedure Tfmuo_kontingent_4_potok.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp : TSprav;
begin
    if not DS.isEmpty then
    begin
        showmessage('Неможливо змінити кафедру! Зпочатку вилучить всі записи по типам робіт.');
        exit;
    end;
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle']     := Integer(DB.Handle);
            FieldValues['ShowStyle']    := 0;
            FieldValues['Select']       := 1;
            FieldValues['Actual_Date']  := date;
            FieldValues['Id_Property']  := 77;
            Post;
        end;
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            id_potok           := sp.Output['Id_Department'];
            cxButtonEdit1.Text := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure Tfmuo_kontingent_4_potok.dxBarLargeButtonOtmenaClick(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_kontingent_4_potok.ActionRefreshExecute(Sender: TObject);
begin
    if id_potok > 0 then
    begin
        DS.Close;
//        DSLang.Close;
//        DSLang.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_IN_S(?ID_DT_KONTINGENT)';

        DS.SQLs.SelectSQL.Text  := 'select * from UO_DT_KONTINGENT_4_SELECT_KAFED('+IntToStr(id_potok)+', '+IntToStr(id_spec)+', '+IntToStr(id_god)+', '+IntToStr(id_fak)+', '+IntToStr(id_form)+', '+IntToStr(id_kat)+', '+IntToStr(id_kurs)+')';
        DS.Open;
    end;
end;

procedure Tfmuo_kontingent_4_potok.ActionDeleteExecute(Sender: TObject);
var
    id_del_l, id_del_t : int64;
begin
    if not DS.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте цей запис?'{ + DS.FieldByName('NAME_GROUP').AsString + ' кількістю ' + DS.FieldByName('KOLVO').AsString}), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            id_del_t           := StrToInt64(DS.FieldByName('ID_DT_KONTINGENT').AsString);
            cxGrid1DBTableView1.Controller.GoToPrev(false);
            id_del_l           := StrToInt64(DS.FieldByName('ID_DT_KONTINGENT').AsString);
            cxGrid1DBTableView1.Controller.GoToNext(false);
            Stored.Database    := DB;
            Stored.Transaction := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_DT_KONTINGENT_4_DELETE';
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

procedure Tfmuo_kontingent_4_potok.ActionAddExecute(Sender: TObject);
var
    T : Tfmuo_kontingent_4_potok_add;
begin
    if id_potok <= 0 then
    begin
        cxButtonEdit1PropertiesButtonClick(Sender, 0);
        if id_potok <=0 then exit;
    end;
{    if not DS.IsEmpty then
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
    end;   }
    T := Tfmuo_kontingent_4_potok_add.Create(Self, Self, 1);
    T.Showmodal;
    T.Free;

end;

procedure Tfmuo_kontingent_4_potok.ActionChangeExecute(Sender: TObject);
var
    T : Tfmuo_kontingent_4_potok_add;
begin
    if not DS.IsEmpty then
    begin
        T := Tfmuo_kontingent_4_potok_add.Create(Self, Self, 2);
        T.Showmodal;
        T.Free;
    end;
end;

procedure Tfmuo_kontingent_4_potok.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

end.
