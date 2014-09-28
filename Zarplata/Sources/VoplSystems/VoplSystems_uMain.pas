unit VoplSystems_uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems,
  dxDockPanel, dxDockControl, cxCheckBox, Unit_ZGlobal_Consts, FIBDataSet,
  pFIBDataSet, cxPropertiesStore, ZTypes, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, IBase, ZProc, Kernel,
  cxSplitter, ExtCtrls, RxMemDS, ZMessages, cxTextEdit, ActnList, zcxLocateBar;

type
  TFZVoSystems = class(TForm)
    BarManager: TdxBarManager;
    DataSourceParent: TDataSource;
    DataSourceChild: TDataSource;
    DataBase: TpFIBDatabase;
    DataSetParent: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DataSetChild: TpFIBDataSet;
    Styles: TcxStyleRepository;
    PanelGridParent: TPanel;
    Grid1: TcxGrid;
    Grid1View1: TcxGridDBTableView;
    GridClName: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    PanelGridChild: TPanel;
    Grid2: TcxGrid;
    Grid2View1: TcxGridDBTableView;
    GridClSystems: TcxGridDBColumn;
    GridClYesNo: TcxGridDBColumn;
    Grid2Level1: TcxGridLevel;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    SplitterGridChildControl: TcxSplitter;
    LocateBarDockControl: TdxBarDockControl;
    GridClKod: TcxGridDBColumn;
    GridClGroup: TcxGridDBColumn;
    GridClNachicl: TcxGridDBColumn;
    ActionList: TActionList;
    SystemAction: TAction;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectBtnClick(Sender: TObject);
    procedure BarEditLocateEnter(Sender: TObject);
    procedure Grid2View1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridClNachiclGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Grid2View1DblClick(Sender: TObject);
    procedure SystemActionExecute(Sender: TObject);
    procedure Grid1View1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    Ins_ZFormStyle:TZFormStyle;
    Ins_resault:variant;
    Ins_IsSaved:boolean;
    PLanguageIndex:byte;
    BarLocate:TZBarLocate;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
    property Resault:Variant read Ins_resault;
  end;

function View_FVOSystems_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;stdcall;
 exports View_FVoSystems_Sp;



implementation

{$R *.dfm}
function View_FVoSystems_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE):Variant;
var ViewForm: TFZVoSystems;
begin
 if not IsMDIChildFormShow(TFZVoSystems) then
    ViewForm  :=  TFZVoSystems.Create(AOwner, DB_HANDLE);
 Result:=NULL;
end;

constructor TFZVoSystems.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);
begin
 inherited Create(ComeComponent);
PLanguageIndex:=LanguageIndex;
Ins_resault    := VarArrayCreate([0,1],varVariant);
Ins_IsSaved    := False;
//******************************************************************************//
Caption               := VoplSystems_Caption[PLanguageIndex];
GridClSystems.Caption := GridClSystems_Caption[PLanguageIndex];
GridClYesNo.Caption   := GridClYesNo_Caption[PLanguageIndex];
GridClGroup.Caption   := FZSp_VidOpl_GridColumnOptionsGroup_Caption[PLanguageIndex];
GridClKod.Caption     := GridClKodVidOpl_Caption[PLanguageIndex];
GridClName.Caption    := GridClNameVidopl_Caption[PLanguageIndex];
GridClNachicl.Caption := GridClP1_Caption[PLanguageIndex];
DataSetParent.SQLs.SelectSQL.Text:='Select * from Z_SP_VIDOPL_SIMPLE_S';
DataSetChild.SQLs.SelectSQL.Text :='Select * from Z_VIDOPL_SYSTEMS_S(?ID_VIDOPL,NULL)';
DataBase.Handle:= ComeDB;
DataSetParent.Open;
DataSetChild.Open;

   self.FormStyle         := fsMDIChild;
   self.BorderStyle       := bsSizeable;
   self.Position          := poMainFormCenter;
   self.WindowState       := wsMaximized;

Grid1View1.DataController.DataSource  := DataSourceParent;
Grid1View1FocusedRecordChanged(Grid1View1,nil,Grid1View1.Controller.FocusedRecord,True);
//******************************************************************************
 BarLocate := TZBarLocate.Create(BarManager);
 with BarLocate do
  begin
   DataSet := DataSetParent;
   BorderStyle := bbsNone;
   AddLocateItem('KOD_VIDOPL',GridClKod.Caption,[loCaseInsensitive]);
   AddLocateItem('NAME_VIDOPL',GridClName.Caption,[loCaseInsensitive,loPartialKey]);
   DigitalField := 'KOD_VIDOPL';
   DockControl  := LocateBarDockControl;
  end;
end;


procedure TFZVoSystems.ExitBtnClick(Sender: TObject);
begin
if Ins_ZFormStyle=zfsModal then ModalResult:=mrNo
else Close;
end;

procedure TFZVoSystems.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
If FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZVoSystems.SelectBtnClick(Sender: TObject);
begin
Ins_resault[0]      := DataSetParent.FieldValues['ID_VOPL_PROP'];
Ins_resault[1]      := DataSetParent.FieldValues['NAME_VOPL_PROP'];
ModalResult:=mrYes;
end;

procedure TFZVoSystems.BarEditLocateEnter(Sender: TObject);
begin
Grid1.SetFocus;
end;

procedure TFZVoSystems.Grid2View1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_SPACE then Grid2View1DblClick(Sender);
end;

procedure TFZVoSystems.GridClNachiclGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='T' then AText := GridClP1_Text_True[PLanguageIndex]
else AText := GridClP1_Text_False[PLanguageIndex];
end;

procedure TFZVoSystems.Grid2View1DblClick(Sender: TObject);
begin
with StoredProc do
 try
  Transaction := WriteTransaction;
  Transaction.StartTransaction;
  StoredProcName := 'Z_VIDOPL_SYSTEMS_U';
  Prepare;
  ParamByName('ID_VIDOPL').AsInteger := DataSetParent['ID_VIDOPL'];
  ParamByName('ID_SYSTEM').AsInteger := DataSetChild['ID_SYSTEM'];
  ParamByName('OLD_IN_USE').AsString := DataSetChild['IN_USE'];
  ExecProc;
  Transaction.Commit;
  DataSetChild.SQLs.UpdateSQL.Text  := 'execute procedure z_empty_proc';
  DataSetChild.SQLs.RefreshSQL.Text := 'select * from Z_VIDOPL_SYSTEMS_S('+
                                    (VarToStr(DataSetParent['ID_VIDOPL']))+','+
                                    (VarToStr(DataSetChild['ID_SYSTEM']))+')';
  DataSetChild.Edit;
  DataSetChild.Post;
 except
  on e:exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbok]);
    Transaction.Rollback;
   end;
 end;
end;

procedure TFZVoSystems.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System Message',
             'ID_VIDOPL='+VarToStrDef(DataSetParent['ID_VIDOPL'],'NULL')+#13+
             'ID_SYSTEM='+VarToStrDef(DataSetChild['ID_SYSTEM'],'NULL'),mtInformation,[mbOk]);
end;

procedure TFZVoSystems.Grid1View1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then Grid2View1.DataController.DataSource := nil
else Grid2View1.DataController.DataSource := DataSourceChild;
end;

end.
