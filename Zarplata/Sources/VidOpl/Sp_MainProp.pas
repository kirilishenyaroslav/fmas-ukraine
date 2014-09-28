unit Sp_MainProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLookAndFeels, dxBar, dxBarExtItems,
  ActnList, Ztypes, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  IBase, ZProc, Kernel, cxTextEdit, cxCalendar, Unit_ZGlobal_Consts,
  dxStatusBar, zMessages;

type
  TFZSpMainProps = class(TForm)
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridClKod: TcxGridDBColumn;
    GridClName: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DSource: TDataSource;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    StatusBar: TdxStatusBar;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    Ins_Result: Variant;
    PLanguageIndex:byte;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;TypeProps:Integer);reintroduce;
    property Result:Variant read Ins_Result;
  end;

function View_FZ_MainProps_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;TypeProps:Integer):Variant;stdcall;

implementation

uses Math;

{$R *.dfm}

function View_FZ_MainProps_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;TypeProps:Integer):Variant;
var ViewForm: TFZSpMainProps;
begin
   Result:=NULL;
   ViewForm  :=  TFZSpMainProps.Create(AOwner, DB, TypeProps);
   ViewForm.ShowModal;
   ViewForm.Free;
end;

constructor TFZSpMainProps.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;TypeProps:Integer);
begin
 inherited Create(ComeComponent);
 PLanguageIndex:=LanguageIndex;
 self.Caption                                 := ZSp_Privilege_Caption[PLanguageIndex];

   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.Position          := poOwnerFormCenter;
   StatusBar.Panels[0].Text := RefreshBtn_Hint[PLanguageIndex];
   StatusBar.Panels[1].Text := SelectBtn_Hint[PLanguageIndex];
   StatusBar.Panels[2].Text := ExitBtn_Hint[PLanguageIndex];

Ins_Result := VarArrayCreate([0,2],varVariant);

self.RefreshBtn.Caption                      := RefreshBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                       := SelectBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption                         := ExitBtn_Caption[PLanguageIndex];
self.GridClKod.Caption                       := GridClKod_Caption[PLanguageIndex];
self.GridClName.Caption                      := GridClName_Caption[PLanguageIndex];

DB.Handle := ComeDB;
DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SP_VIDOPL_CORRESPOND_S('+IntToStr(TypeProps)+') order by KOD_PROP';
DSet.Open;

FormResize(Self);
end;

procedure TFZSpMainProps.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
Action:=caFree;
end;

procedure TFZSpMainProps.RefreshBtnClick(Sender: TObject);
begin
  DataSetCloseOpen(DSet, 'ID_PRIV');
end;

procedure TFZSpMainProps.ExitBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TFZSpMainProps.SelectBtnClick(Sender: TObject);
begin
Ins_Result[0] := DSet['ID_PROP'];
Ins_Result[1] := DSet['KOD_PROP'];
Ins_Result[2] := DSet['NAME_PROP'];
self.ModalResult:=mrOk;
end;

procedure TFZSpMainProps.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 SelectBtn.Enabled := AFocusedRecord<>nil;
end;

procedure TFZSpMainProps.FormCreate(Sender: TObject);
begin
GridDBTableView1FocusedRecordChanged(GridDBTableView1,GridDBTableView1.Controller.FocusedRecord,
                                     GridDBTableView1.Controller.FocusedRecord,false);
end;

procedure TFZSpMainProps.GridDBTableView1DblClick(Sender: TObject);
begin
if (SelectBtn.Visible = ivAlways) and
   (SelectBtn.Enabled) and (GridDBTableView1.Controller.FocusedRecord<>nil) then
 SelectBtnClick(sender);
end;

procedure TFZSpMainProps.FormResize(Sender: TObject);
var i:byte;
begin
if StatusBar.Panels.Count=0 then Exit;
 for i:=0 to StatusBar.Panels.Count-1 do
  StatusBar.Panels[i].Width := StatusBar.Width div StatusBar.Panels.Count;
end;

end.
