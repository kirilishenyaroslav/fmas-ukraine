unit Sp_Ved_UV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, cxLabel, cxContainer, zMessages,
  cxTextEdit, cxMaskEdit, cxDBEdit, ExtCtrls, cxSplitter, Ztypes,
  Unit_ZGlobal_Consts, dxBarExtItems, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, IBase, ZProc, FIBQuery, pFIBQuery, pFIBStoredProc, Dates,
  ZSvodTypesUnit;

type
  TFUV_Ved = class(TForm)
    Grid: TcxGrid;
    GridView1: TcxGridDBTableView;
    GrColNumber: TcxGridDBColumn;
    GrColPeriod: TcxGridDBColumn;
    GrColTypePayment: TcxGridDBColumn;
    GrColViplata: TcxGridDBColumn;
    GrColKodSmeta: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    Panel1: TPanel;
    DBMaskEditNameSmeta: TcxDBMaskEdit;
    LabelNameSmeta: TcxLabel;
    LabelNameDepartment: TcxLabel;
    DBMaskEditNameDepartment: TcxDBMaskEdit;
    cxSplitter1: TcxSplitter;
    GrColTypeSheet: TcxGridDBColumn;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    DataSource: TDataSource;
    DataBase: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
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
    GrColID: TcxGridDBColumn;
    DataSet: TpFIBDataSet;
    GrColDep: TcxGridDBColumn;
    procedure SelectBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure GridView1FocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridView1CanSelectRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure GrColPeriodGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridView1SelectionChanged(Sender: TcxCustomGridTableView);
    procedure FormCreate(Sender: TObject);
  private
    PId_Reestr:LongWord;
    PlanguageIndex:byte;
  public
    constructor Create(ComeComponent:TComponent;DB:TISC_DB_HANDLE;Come_Id_Reestr:LongWord;system:Boolean);reintroduce;
  end;


var PArrayID:array of Integer;

implementation

{$R *.dfm}

constructor TFUV_Ved.Create(ComeComponent:TComponent;DB:TISC_DB_HANDLE;Come_Id_Reestr:LongWord;system:Boolean);
begin
  inherited Create(ComeComponent);
  PId_reestr:=Come_Id_Reestr;
  PlanguageIndex:=LanguageIndex;
//******************************************************************************
Caption                                := ReeVed_VedToAdd_Caption[PlanguageIndex];
GrColNumber.Caption                    := GridClNumber_Caption[PlanguageIndex];
GrColPeriod.Caption                    := GridClKodSetup_Caption[PlanguageIndex];
GrColTypePayment.Caption               := GridClTypePayment_Caption[PlanguageIndex];
GrColViplata.Caption                   := GridClViplata_Caption[PlanguageIndex];
GrColKodSmeta.Caption                  := GridClKodSmeta_Caption[PlanguageIndex];
GrColTypeSheet.Caption                 := GridClTypeSheet_Caption[PlanguageIndex];
GrColDep.Caption                       := LabelDepartment_Caption[PlanguageIndex];

LabelNameSmeta.Caption                 := LabelSmeta_Caption[PlanguageIndex];
LabelNameDepartment.Caption            := LabelDepartment_Caption[PlanguageIndex];
RefreshBtn.Caption                     := RefreshBtn_Caption[PlanguageIndex];
SelectBtn.Caption                      := SelectBtn_Caption[PlanguageIndex];
ExitBtn.Caption                        := ExitBtn_Caption[PlanguageIndex];
//******************************************************************************
GrColNumber.DataBinding.FieldName      := 'KOD_SHEET';
GrColPeriod.DataBinding.FieldName      := 'KOD_SETUP';
GrColTypePayment.DataBinding.FieldName := 'NAME_PAYMENT';
GrColTypeSheet.DataBinding.FieldName   := 'NAME_TYPE_SHEET';
GrColViplata.DataBinding.FieldName     := 'GRSUMMA';
GrColKodSmeta.DataBinding.FieldName    := 'KOD_SMETA';
GrColDep.DataBinding.FieldName         := 'NAME_DEPARTMENT';
//******************************************************************************
DBMaskEditNameSmeta.DataBinding.DataField      := 'NAME_SMETA';
DBMaskEditNameDepartment.DataBinding.DataField := 'NAME_DEPARTMENT';
//******************************************************************************
Panel1.Color:=GridView1.Styles.Background.Color;
cxSplitter1.Color:=GridView1.Styles.Content.Color;
//******************************************************************************

if system
then DataSet.SQLs.SelectSQL.Text            := 'SELECT * FROM UV_GRSHEET_SELECTFORADD('+IntToStr(Come_Id_Reestr)+',1000)'
else DataSet.SQLs.SelectSQL.Text            := 'SELECT * FROM UV_GRSHEET_SELECTFORADD('+IntToStr(Come_Id_Reestr)+',999)';

DataBase.Handle                        := DB;
DataSet.Open;
SetLength(PArrayID,0);
end;

procedure TFUV_Ved.SelectBtnClick(Sender: TObject);
var i:integer;
begin
 try
  StoredProc.Database                            := DataBase;
  StoredProc.Transaction                         := WriteTransaction;
  StoredProc.Transaction.DefaultDatabase         := DataBase;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                      := 'UV_GRSHEET_INSINREESTR';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_REESTR').AsInteger  := PId_Reestr;
  for i:=0 to GridView1.Controller.SelectedRowCount-1 do
   begin
    StoredProc.ParamByName('ID_GRSHEET').AsInteger := GridView1.Controller.SelectedRows[i].Values[GrColID.Index];
    StoredProc.ExecProc;
    SetLength(PArrayID,length(PArrayID)+1);
    PArrayID[Length(PArrayID)-1]:=GridView1.Controller.SelectedRows[i].Values[GrColID.Index];
   end;
  StoredProc.Transaction.Commit;
  DataSetCloseOpen(DataSet);
 except
 on E:Exception do
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   WriteTransaction.Rollback;
  end;
 end;
end;

procedure TFUV_Ved.ExitBtnClick(Sender: TObject);
begin
close;
end;

procedure TFUV_Ved.GridView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.IsData=False) then
 begin
//  SelectBtn.Enabled:=False;
  DBMaskEditNameSmeta.DataBinding.DataSource:=nil;
  DBMaskEditNameDepartment.DataBinding.DataSource:=nil;
 end
else
 begin
//  SelectBtn.Enabled:=True;
  DBMaskEditNameSmeta.DataBinding.DataSource:=DataSource;
  DBMaskEditNameDepartment.DataBinding.DataSource:=DataSource;
 end;
end;

procedure TFUV_Ved.GridView1CanSelectRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
AAllow := not ARecord.Expandable;
end;

procedure TFUV_Ved.GrColPeriodGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
AText:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFUV_Ved.GridView1SelectionChanged(
  Sender: TcxCustomGridTableView);
begin
SelectBtn.Enabled :=(GridView1.Controller.SelectedRowCount>0);
end;

procedure TFUV_Ved.FormCreate(Sender: TObject);
begin
GridView1FocusedRecordChanged(GridView1,nil,GridView1.Controller.FocusedRecord,True);
GridView1SelectionChanged(GridView1);
end;

end.
