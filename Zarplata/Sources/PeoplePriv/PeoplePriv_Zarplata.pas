unit PeoplePriv_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_PeoplePriv_Consts,
  ComCtrls;

type
  TFZPeoplePriv = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    OtherBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
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
    Grid_FIODBTableView1: TcxGridDBTableView;
    Grid_FIOLevel1: TcxGridLevel;
    Grid_FIO: TcxGrid;
    Pages: TPageControl;
    cxSplitter1: TcxSplitter;
    Page_IdMan: TTabSheet;
    Grid_FIO_ColumnFIO: TcxGridDBColumn;
    DSource_FIO: TDataSource;
    DSource_PeoplePriv: TDataSource;
    Grid_PeoplePrivDBTableView1: TcxGridDBTableView;
    Grid_PeoplePrivLevel1: TcxGridLevel;
    Grid_PeoplePriv: TcxGrid;
    DB: TpFIBDatabase;
    DSet_FIO: TpFIBDataSet;
    DSet_PeoplePriv: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    Grid_FIO_ColumnTn: TcxGridDBColumn;
    Grid_PeoplePriv_Column_PrivKod: TcxGridDBColumn;
    InsertChildBtn: TdxBarLargeButton;
    UpdateChildBtn: TdxBarLargeButton;
    DeleteChildBtn: TdxBarLargeButton;
    dxBarDockControl2: TdxBarDockControl;
    Grid_PeoplePriv_Column_PrivName: TcxGridDBColumn;
    Grid_PeoplePriv_Column_Expense: TcxGridDBColumn;
    Grid_PeoplePriv_Column_DateEnd: TcxGridDBColumn;
    Grid_PeoplePriv_Column_DateBeg: TcxGridDBColumn;
    ViewChildBtn: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitBtnClick(Sender: TObject);
    procedure Grid_FIODBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure Grid_PeoplePrivDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure OtherBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grid_FIODBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure InsertChildBtnClick(Sender: TObject);
    procedure UpdateChildBtnClick(Sender: TObject);
    procedure DeleteChildBtnClick(Sender: TObject);
    procedure ViewChildBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;

function View_FZPeoplePriv(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_FZPeoplePriv;

implementation

uses Math;

{$R *.dfm}

function View_FZPeoplePriv(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZPeoplePriv;
begin
if not IsMDIChildFormShow(TFZPeoplePriv) then
   ViewForm  :=  TFZPeoplePriv.Create(AOwner, DB);
end;

constructor TFZPeoplePriv.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
//******************************************************************************
 Caption                                     := FZ_PeoplePriv_Caption;
 Page_IdMan.Caption                          := FZ_PeoplePriv_Page_Idman_Caption;
 OtherBtn.Caption                            := FZ_PeoplePriv_OtherBtn_Caption;
 RefreshBtn.Caption                          := FZ_PeoplePriv_RefreshBtn_Caption;
 ExitBtn.Caption                             := FZ_PeoplePriv_ExitBtn_Caption;
 InsertChildBtn.Caption                      := FZ_PeoplePriv_InsertChildBtn_Caption;
 UpdateChildBtn.Caption                      := FZ_PeoplePriv_UpdateChildBtn_Caption;
 DeleteChildBtn.Caption                      := FZ_PeoplePriv_DeleteChildBtn_Caption;
 ViewChildBtn.Caption                        := FZ_PeoplePriv_DetailChildBtn_Caption;
 Grid_FIO_ColumnTn.Caption                   := FZ_PeoplePriv_Grid_FIO_ColumnTn_Caption;
 Grid_FIO_ColumnFIO.Caption                  := FZ_PeoplePriv_Grid_FIO_ColumnFIO_Caption;
 Grid_PeoplePriv_Column_PrivKod.Caption      := FZ_PeoplePriv_Grid_PeoplePriv_Column_PrivKod_Caption;
 Grid_PeoplePriv_Column_PrivName.Caption     := FZ_PeoplePriv_Grid_PeoplePriv_Column_Privname_Caption;
 Grid_PeoplePriv_Column_DateBeg.Caption      := FZ_PeoplePriv_Grid_PeoplePriv_Column_DateBeg_Caption;
 Grid_PeoplePriv_Column_DateEnd.Caption      := FZ_PeoplePriv_Grid_PeoplePriv_Column_DateEnd_Caption;
 Grid_PeoplePriv_Column_Expense.Caption      := FZ_PeoplePriv_Grid_PeoplePriv_Column_Expense_Caption;
//******************************************************************************
 DSet_FIO.SQLs.SelectSQL.Text                := 'SELECT * FROM Z_PEOPLEPRIV_SELECT_FIO(NULL)';
 DSet_PeoplePriv.SQLs.SelectSQL.Text         := 'SELECT * FROM Z_PEOPLE_PRIV_S(?ID_MAN)';
//******************************************************************************
 Grid_FIO_ColumnFIO.DataBinding.FieldName                := 'FIO';
 Grid_FIO_ColumnTn.DataBinding.FieldName                 := 'TN';
 Grid_PeoplePriv_Column_PrivKod.DataBinding.FieldName    := 'KOD_PRIV';
 Grid_PeoplePriv_Column_PrivName.DataBinding.FieldName   := 'NAME_PRIV';
 Grid_PeoplePriv_Column_DateBeg.DataBinding.FieldName    := 'DATE_BEG';
 Grid_PeoplePriv_Column_DateEnd.DataBinding.FieldName    := 'DATE_END';
 Grid_PeoplePriv_Column_Expense.DataBinding.FieldName    := 'EXPENSE';
//******************************************************************************
 DB.Handle:=Db_Handle;
 DSet_FIO.Open;
 DSet_PeoplePriv.Open;
end;

procedure TFZPeoplePriv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DefaultTransaction.Commit;
Action:=caFree;
end;

procedure TFZPeoplePriv.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZPeoplePriv.Grid_FIODBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
//Grid_FIODBTableView1.OptionsBehavior
 If (Key in ['0'..'9']) then
  begin
   if (Grid_FIODBTableView1.OptionsBehavior.IncSearchItem.Name<>'Grid_FIO_ColumnTn')then
    begin
     Grid_FIODBTableView1.Controller.IncSearchingText   := '';
     Grid_FIODBTableView1.OptionsBehavior.IncSearchItem := Grid_FIO_ColumnTn;
    end
  end
 else
  if (Grid_FIODBTableView1.OptionsBehavior.IncSearchItem.Name<>'Grid_FIO_ColumnFIO')then
   begin
    Grid_FIODBTableView1.Controller.IncSearchingText   := '';
    Grid_FIODBTableView1.OptionsBehavior.IncSearchItem := Grid_FIO_ColumnFIO;
   end;
end;

procedure TFZPeoplePriv.Grid_PeoplePrivDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord<>nil then
 if AFocusedRecord.Expandable then
  begin
   UpdateChildBtn.Enabled:=False;
   DeleteChildBtn.Enabled:=False;
   ViewChildBtn.Enabled  :=False;
  end
 else
  begin
   UpdateChildBtn.Enabled:=True;
   DeleteChildBtn.Enabled:=True;
   ViewChildBtn.Enabled  :=True;
  end
else
  begin
   UpdateChildBtn.Enabled:=False;
   DeleteChildBtn.Enabled:=False;
   ViewChildBtn.Enabled  :=False;
  end;
end;

procedure TFZPeoplePriv.OtherBtnClick(Sender: TObject);
var Man:variant;
begin
Man := LoadPeopleModal(self,db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DSet_FIO.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DSet_FIO.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_DATAPEOPLE_BY_ID_MAN('+VarToStr(Man[0])+')';
   DSet_FIO.SQLs.InsertSQL.Text := 'SELECT * FROM Z_DATAPEOPLE_BY_ID_MAN(NULL)';
   DSet_FIO.Insert;
   DSet_FIO.Post;
{   DSet_FIO.close;
   DSet_FIO.SQLs.SelectSQL.Text := 'SELECT * FROM Z_PEOPLEPRIV_SELECT_FIO('+VarToStr(Man[0])+')';
   DSet_FIO.Open;
   DSet_FIO.Locate('ID_MAN',Man[0],[loCaseInsensitive]);
   DataSetCloseOpen(DSet_PeoplePriv);}
  end;
end;

procedure TFZPeoplePriv.FormCreate(Sender: TObject);
begin
Grid_FIODBTableView1FocusedRecordChanged(Grid_FIODBTableView1,
                                         nil,
                                         Grid_FIODBTableView1.Controller.FocusedRecord,
                                         true);
end;

procedure TFZPeoplePriv.Grid_FIODBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord=nil then
 InsertChildBtn.Enabled := False
else InsertChildBtn.Enabled := True;
Grid_PeoplePrivDBTableView1FocusedRecordChanged(Grid_PeoplePrivDBTableView1,
                                                nil,
                                                Grid_PeoplePrivDBTableView1.Controller.FocusedRecord,
                                                True);
end;

procedure TFZPeoplePriv.InsertChildBtnClick(Sender: TObject);
var Parameter:TZPeoplePrivParameters;
    ResLoad:variant;
begin
if not InsertChildBtn.Enabled then Exit;
Parameter.ID := DSet_FIO.FieldValues['ID_MAN'];
Parameter.TypeId := zppctIdPeople;
Parameter.ControlFormStyle := zcfsInsert;
ResLoad:=LoadPeoplePrivControl(self,DB.Handle,Parameter);
if VarArrayDimCount(ResLoad)>0 then
 if ResLoad[0]=mrYes then
  begin
   DSet_PeoplePriv.CloseOpen(True);
   DSet_PeoplePriv.Locate('ID_PEOPLE_PRIV',ResLoad,[loCaseInsensitive]);
  end;
end;

procedure TFZPeoplePriv.UpdateChildBtnClick(Sender: TObject);
var Parameter:TZPeoplePrivParameters;
    ResLoad:variant;
begin
if not UpdateChildBtn.Enabled then Exit;
Parameter.ID := DSet_PeoplePriv.FieldValues['ID_PEOPLE_PRIV'];
Parameter.TypeId := zppctIdPeoplePriv;
Parameter.ControlFormStyle := zcfsUpdate;
ResLoad:=LoadPeoplePrivControl(self,DB.Handle,Parameter);
if ResLoad[0]=mrYes then
   DataSetCloseOpen(DSet_PeoplePriv,'ID_PEOPLE_PRIV');
end;

procedure TFZPeoplePriv.DeleteChildBtnClick(Sender: TObject);
var Parameter:TZPeoplePrivParameters;
    ResLoad:variant;
begin
if not DeleteChildBtn.Enabled then Exit;
Parameter.ID := DSet_PeoplePriv.FieldValues['ID_PEOPLE_PRIV'];
Parameter.TypeId := zppctIdPeoplePriv;
Parameter.ControlFormStyle := zcfsDelete;
ResLoad:=LoadPeoplePrivControl(self,DB.Handle,Parameter);
if ResLoad[0]=mrYes then
   DataSetCloseOpen(DSet_PeoplePriv,'ID_PEOPLE_PRIV');
end;

procedure TFZPeoplePriv.ViewChildBtnClick(Sender: TObject);
var Parameter:TZPeoplePrivParameters;
begin
if not ViewChildBtn.Enabled then Exit;
Parameter.ID := DSet_PeoplePriv.FieldValues['ID_PEOPLE_PRIV'];
Parameter.TypeId := zppctIdPeoplePriv;
Parameter.ControlFormStyle := zcfsShowDetails;
LoadPeoplePrivControl(self,DB.Handle,Parameter);
end;

procedure TFZPeoplePriv.RefreshBtnClick(Sender: TObject);
begin
DataSetsCloseOpen(DSet_FIO,DSet_PeoplePriv,'ID_MAN','ID_PEOPLE_PRIV');
end;

end.
