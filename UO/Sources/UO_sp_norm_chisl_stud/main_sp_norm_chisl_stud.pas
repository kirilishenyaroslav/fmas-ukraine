unit main_sp_norm_chisl_stud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxStatusBar, dxBar, dxBarExtItems, ImgList,
  ActnList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, IBase, AArray, ib_externals, cxCurrencyEdit;

type
  Tfmmain_sp_norm_chisl_stud = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    dxStatusBarSP: TdxStatusBar;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton3: TdxBarLargeButton;
    ActionList1: TActionList;
    AAdd: TAction;
    AChange: TAction;
    ADel: TAction;
    ARefresh: TAction;
    AExit: TAction;
    AVeiw: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    TWr: TpFIBTransaction;
    DataSource1: TDataSource;
    Stored: TpFIBStoredProc;
    DSID_SP_NORM_CHISL_STUD: TFIBBCDField;
    DSID_SP_FORM_OBUCH_KATEGORY: TFIBBCDField;
    DSID_SP_TYPE_KAT_STUD: TFIBBCDField;
    DSID_SPEC: TFIBBCDField;
    DSNORM_VAL: TFIBBCDField;
    DSNOTE: TFIBStringField;
    DSCODE_SPEC: TFIBStringField;
    DSFULL_NAME_SPEC: TFIBStringField;
    DSNAME_SPEC: TFIBStringField;
    DSSHORT_NAME_SPEC: TFIBStringField;
    DSSHORT_NAME_KAT: TFIBStringField;
    DSNAME_KAT: TFIBStringField;
    DSKOD_KAT: TFIBIntegerField;
    DSSHORT_NAME_OBUCH: TFIBStringField;
    DSNAME_OBUCH: TFIBStringField;
    DSKOD_OBUCH: TFIBIntegerField;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    procedure LoadCaption;
    procedure AExitExecute(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure AChangeExecute(Sender: TObject);
    procedure AVeiwExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ARefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    DBHANDLE      : TISC_DB_HANDLE;
    ResultArray   : TAArray;
    id_user       : int64;
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;
  end;

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray); stdcall;
  exports ShowAllUoBpl;

implementation
uses add_sp_norm_chisl_stud;
{$R *.dfm}

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var
    T : Tfmmain_sp_norm_chisl_stud;
begin
    T             := Tfmmain_sp_norm_chisl_stud.Create(aOwner, aParam);
    T.FormStyle   := aParam['Input']['aFrmStyle'].AsVariant;
    try T.id_user := aParam['Input']['id_user'].AsVariant; except T.id_user := -1; end;
    if T.id_user <=0 then
    begin
        showmessage('УВАГА!!! Несанкціонований визов довідника! Неможливо робити будь-які зміни.');
        T.AAdd.Enabled    := false;
        T.AChange.Enabled := false;
        T.ADel.Enabled    := false;
    end;
    case T.FormStyle of
    fsNormal:   begin
                    T.ShowModal;
//                    T.ActionVibrat.Enabled:=true;
//                    T.dxBarLargeButtonVibrat.Visible := ivAlways;
                end;
    fsMDIChild: begin
//                    T.ActionVibrat.Enabled:=false;
//                    T.dxBarLargeButtonVibrat.Visible := ivNever;
                end;
    else
        T.Free;
    end;
end;

{ Tfmmain_sp_norm_chisl_stud }

constructor Tfmmain_sp_norm_chisl_stud.Create(aOwner: TComponent;
  aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE := PVoid(aParam['Input']['aDBHANDLE'].asInteger);

        inherited Create(aOwner);
        ResultArray           := aParam;
        DB.Handle             := DBHANDLE;

        Tr.DefaultDatabase    := DB;
        TWr.DefaultDatabase   := DB;

        DB.DefaultTransaction := Tr;

        DS.Database           := DB;
        DS.Transaction        := Tr;

        Stored.Database       := DB;
        Stored.Transaction    := TWr;

        Tr.StartTransaction;

        LoadCaption;
        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select * from UO_SP_NORM_CHISL_STUD_SELECT';
        DS.Open;
    end
    else ShowMessage('Ошибка Handl`a Базы');
end;

procedure Tfmmain_sp_norm_chisl_stud.LoadCaption;
begin
    Caption := 'Довідник нормативів чисельності студентів';

    ADel.Caption      := 'Видалити';
    AAdd.Caption      := 'Додати';
    AChange.Caption   := 'Змінити';
    ARefresh.Caption  := 'Відновити';
    AVeiw.Caption     := 'Перегляд';
    AExit.Caption     := 'Вийти';

    cxGrid1DBTableView1DBColumn1.Caption := 'Освіт.-кваліфікаційний рівень';
    cxGrid1DBTableView1DBColumn2.Caption := 'Категорія форми навчання';
    cxGrid1DBTableView1DBColumn3.Caption := 'Спеціальність';
    cxGrid1DBTableView1DBColumn4.Caption := 'Норматив';

    dxStatusBarSP.Panels[0].Text          := 'Ins - Додати';
    dxStatusBarSP.Panels[1].Text          := 'F2 - Змінити';
    dxStatusBarSP.Panels[2].Text          := 'Del - Видалити';
    dxStatusBarSP.Panels[3].Text          := 'F3 - Перегляд';
    dxStatusBarSP.Panels[4].Text          := 'F5 - Відновити';
    dxStatusBarSP.Panels[5].Text          := 'Esc - Вийти';

end;

procedure Tfmmain_sp_norm_chisl_stud.AExitExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfmmain_sp_norm_chisl_stud.ADelExecute(Sender: TObject);
var
    id_del_l : int64;
begin
    if not DS.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити норматив ' + DS.FieldByName('NORM_VAL').AsString + '?'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            id_del_l           := StrToInt64(DS.FieldByName('ID_SP_NORM_CHISL_STUD').AsString);
            Stored.Transaction := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_SP_NORM_CHISL_STUD_DELETE';
                Stored.ParamByName('ID_SP_NORM_CHISL_STUD').AsInt64 := StrToInt64(ds.FieldByName('ID_SP_NORM_CHISL_STUD').AsString);
                Stored.ParamByName('ID_USER').AsInt64               := id_user;
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ARefreshExecute(Sender);
            DS.Locate('ID_SP_NORM_CHISL_STUD', id_del_l, []);
        end;
    end;
end;

procedure Tfmmain_sp_norm_chisl_stud.AAddExecute(Sender: TObject);
var
    T : Tfmadd_sp_norm_chisl_stud;
begin
    T := Tfmadd_sp_norm_chisl_stud.Create(Self, Self, 1);
    T.ShowModal;
    T.Free;
end;

procedure Tfmmain_sp_norm_chisl_stud.AChangeExecute(Sender: TObject);
var
    T : Tfmadd_sp_norm_chisl_stud;
begin
    if not DS.IsEmpty then
    begin
        T := Tfmadd_sp_norm_chisl_stud.Create(Self, Self, 2);
        T.ShowModal;
        T.Free;
    end;
end;

procedure Tfmmain_sp_norm_chisl_stud.AVeiwExecute(Sender: TObject);
var
    T : Tfmadd_sp_norm_chisl_stud;
begin
    if not DS.IsEmpty then
    begin
        T := Tfmadd_sp_norm_chisl_stud.Create(Self, Self, 3);
        T.ShowModal;
        T.Free;
    end;
end;

procedure Tfmmain_sp_norm_chisl_stud.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDICHild then Action := CaFree;
end;

procedure Tfmmain_sp_norm_chisl_stud.ARefreshExecute(Sender: TObject);
var
    id_ref : int64;
begin
    try id_ref := StrToInt64(ds.fbn('ID_SP_NORM_CHISL_STUD').AsString); except id_ref := -1; end;
    DS.CloseOpen(false);
    DS.Locate('ID_SP_NORM_CHISL_STUD', id_ref, []);
end;

end.
