unit uo_kontingent_4_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Menus, ActnList, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc, ImgList,
  dxBar, dxBarExtItems, AArray, ibase, ib_externals, dxStatusBar;

type
  Tfm_uo_kontingent_4_main = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
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
    ImageListButton: TImageList;
    Stored: TpFIBStoredProc;
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
    DS: TpFIBDataSet;
    DataSource1: TDataSource;
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
    PopupMenuPapka: TPopupMenu;
    ActionAdd1: TMenuItem;
    ActionChange1: TMenuItem;
    ActionDelete1: TMenuItem;
    ActionCopy1: TMenuItem;
    ActionMoveTo1: TMenuItem;
    ActionRefresh2: TMenuItem;
    ActionFind1: TMenuItem;
    ActionPrint1: TMenuItem;
    prop1: TMenuItem;
    ActionCancel1: TMenuItem;
    dxStatusBarSP: TdxStatusBar;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    DSID_SP_FORM_STUD: TFIBBCDField;
    DSID_SP_KAT_STUD: TFIBBCDField;
    DSID_SP_SPEC: TFIBBCDField;
    DSID_DT_KONTINGENT: TFIBBCDField;
    DSID_SP_DEPARTMENT_FAK: TFIBBCDField;
    DSID_SP_DEPARTMENT_GR: TFIBBCDField;
    DSID_SP_DERG_ZAKAZ: TFIBBCDField;
    DSNAME_FORM_STUD: TFIBStringField;
    DSSHORT_NAME_FORM_STUD: TFIBStringField;
    DSNAME_KAT_STUD: TFIBStringField;
    DSSHORT_NAME_KAT_STUD: TFIBStringField;
    DSNAME_SPEC: TFIBStringField;
    DSSHORT_NAME_SPEC: TFIBStringField;
    DSCODE_SPEC_SPEC: TFIBStringField;
    DSSHORT_NAME_POTOK: TFIBStringField;
    DSSHORT_NAME_ZAKAZ: TFIBStringField;
    DSNAME_ZAKAZ: TFIBStringField;
    DSID_SP_GOD_NABORA: TFIBBCDField;
    DSNAME_GOD: TFIBStringField;
    DSSHORT_NAME_GOD: TFIBStringField;
    DSCUR_DAT: TFIBDateField;
    DSKOLVO: TFIBIntegerField;
    DSNAME_GROUP: TFIBStringField;
    DSSHORT_NAME_MOVA: TFIBStringField;
    DSNAME_MOVA: TFIBStringField;
    DSNAME_FAK: TFIBStringField;
    DSID_SP_TYPE_DISC: TFIBBCDField;
    DSSHORT_NAME_TYPE_DISP: TFIBStringField;
    DSNAME_TYPE_DISP: TFIBStringField;
    DSID_SP_KURS: TFIBBCDField;
    DSNAME_KURS: TFIBStringField;
    DSSHORT_NAME_KURS: TFIBStringField;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadCaption;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure DSAfterScroll(DataSet: TDataSet);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
  private
    ResultArray   : TAArray;
  public
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;
  end;

procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports   ShowAllUoBpl;

implementation
uses uo_kontingent_4_potok;
{$R *.dfm}

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var
    T : Tfm_uo_kontingent_4_main;
begin
    T := Tfm_uo_kontingent_4_main.Create(aOwner, aParam);

    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
       fsNormal:   begin
                       T.ShowModal;
                       T.ActionTake.Enabled:=true;
//                   T.dxBarLargeButtonVibrat.Visible := ivAlways;
                   end;
       fsMDIChild: begin
                       T.ActionTake.Enabled:=false;
//                   T.dxBarLargeButtonVibrat.Visible := ivNever;
                   end;
     else
        T.Free;
   end;
end;

constructor Tfm_uo_kontingent_4_main.Create(aOwner: TComponent;
  aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        inherited Create(aOwner);
        ResultArray           := aParam;
        DB.Handle             := PVoid(aParam['Input']['aDBHANDLE'].asInteger);

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
        DS.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_4_SELECT';
        DS.Open;

        if not DS.IsEmpty then
        begin
            cxGrid1DBTableView1.DataController.GotoFirst;
            while not cxGrid1DBTableView1.DataController.IsEOF do
            begin
                cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
                cxGrid1DBTableView1.DataController.GotoNext;
            end;
            cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
        end;

    end
    else ShowMessage('Ошибка Handl`a Базы');
end;

procedure Tfm_uo_kontingent_4_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure Tfm_uo_kontingent_4_main.LoadCaption;
begin
    Caption                 := 'Контінгент';
    ActionADD.Caption       := 'Додати';
    ActionAddKoren.Caption  := 'Додати кореневу гілку';
    ActionChange.Caption    := 'Змінити';
    ActionDelete.Caption    := 'Видалити';
    ActionView.Caption      := 'Показати';
    ActionRefresh.Caption   := 'Оновити';
    ActionTake.Caption      := 'Вибрати';
    ActionClose.Caption     := 'Відміна';
    ActionPrintMan.Caption  := 'Друк';

    ActionADD.Hint          := 'Ins - Додати';
    ActionChange.Hint       := 'F2 - Змінити';
    ActionDelete.Hint       := 'Del - Видалити';
    ActionView.Hint         := 'F3 - Показати';
    ActionRefresh.Hint      := 'F5 - Оновити';
    ActionTake.Hint         := 'Enter - Вибрати';
    ActionClose.Hint        := 'Esc - Відміна';
    ActionPrintman.Hint     := 'Друкувати учбовий план';
    ActionAddKoren.Hint     := 'Shift+Ins - Додати кореневу гілку';

    dxStatusBarSP.Panels[0].Text          := 'Ins - Додати';
    dxStatusBarSP.Panels[1].Text          := 'Shift+Ins - Додати кореневу';
    dxStatusBarSP.Panels[2].Text          := 'F2 - Змінити';
    dxStatusBarSP.Panels[3].Text          := 'Del - Видалити';
    dxStatusBarSP.Panels[4].Text          := 'F5 - Оновити';
    dxStatusBarSP.Panels[5].Text          := 'F3 - Показати';
    dxStatusBarSP.Panels[6].Text          := 'Enter - Вибрати';
end;

procedure Tfm_uo_kontingent_4_main.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfm_uo_kontingent_4_main.ActionRefreshExecute(Sender: TObject);
var
    id : int64;
begin
    if not DS.isEmpty then
    begin
        try id := StrToInt64(DS.fbn('ID_DT_KONTINGENT').AsString) except id := -1; end;
        DS.Close;
        DS.SQLs.SelectSQL.Text := 'select * from UO_DT_KONTINGENT_4_SELECT';
        DS.Open;

        if not DS.IsEmpty then
        begin
            cxGrid1DBTableView1.DataController.GotoFirst;
            while not cxGrid1DBTableView1.DataController.IsEOF do
            begin
                cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
                cxGrid1DBTableView1.DataController.GotoNext;
            end;
            cxGrid1DBTableView1.Controller.FocusedRecord.Expand(true);
        end;

        DS.Locate('ID_DT_KONTINGENT', id, []);
    end;
end;

procedure Tfm_uo_kontingent_4_main.DSAfterScroll(DataSet: TDataSet);
begin
    if not DS.isEmpty then
    begin
        if DS.fbn('ID_DT_KONTINGENT').IsNull
            then begin
                ActionChange.Enabled := false;
            end else begin
                ActionChange.Enabled := true;
            end;
    end;

end;

procedure Tfm_uo_kontingent_4_main.ActionAddExecute(Sender: TObject);
var
    T : Tfmuo_kontingent_4_potok;
begin
    if DS.isEmpty then exit;
    T := Tfmuo_kontingent_4_potok.Create(Self, Self, 1);
    T.ShowModal;
    T.Free;
    ActionRefreshExecute(Sender);
end;

procedure Tfm_uo_kontingent_4_main.ActionChangeExecute(Sender: TObject);
var
    T : Tfmuo_kontingent_4_potok;
begin
    if DS.isEmpty then exit;
    T := Tfmuo_kontingent_4_potok.Create(Self, Self, 2);
    T.ShowModal;
    T.Free;
    ActionRefreshExecute(Sender);
end;

procedure Tfm_uo_kontingent_4_main.ActionViewExecute(Sender: TObject);
var
    T : Tfmuo_kontingent_4_potok;
begin
    if DS.isEmpty then exit;
    T := Tfmuo_kontingent_4_potok.Create(Self, Self, 3);
    T.ShowModal;
    T.Free;
end;

end.
