unit Gr_AccDepart_Corrent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, IBase, cxGridBandedTableView,
  cxClasses, cxGridTableView, cxMaskEdit, cxTextEdit, cxCurrencyEdit,
  dxBar, dxBarExtItems, ZcxLocateBar, gr_uCommonLoader, gr_uCommonConsts, ZProc,
  dxStatusBar, Dates, gr_dmCommonStyles, gr_uWaitForm, gr_uCommonProc;

type
  TfGrAccDepart = class(TForm)
    Database: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DSource: TDataSource;
    DepartmentTreeList: TcxDBTreeList;
    DivisionTreeListColumnDepartment: TcxDBTreeListColumn;
    DivisionTreeListColumnTotal: TcxDBTreeListColumn;
    DivisionTreeListColumnGranted: TcxDBTreeListColumn;
    DivisionTreeListColumnSumma: TcxDBTreeListColumn;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    dxStatusBar1: TdxStatusBar;
    PeriodDockControl: TdxBarDockControl;
    dxBarCombo1: TdxBarCombo;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarProgressItem1: TdxBarProgressItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure DepartmentTreeListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PStyles : TStylesDM;
    PBarLocate:TZBarLocate;
    PLanguageIndex:Integer;
    OKodSetup: integer;
  public
    { Public declarations }
    Result:variant;
    ResultNameDep:string;
    NKodSetup: integer;
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfGrAccDepart.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
var ZILRec:TZItemLocate;
  i:integer;
begin
 inherited Create(AOwner);
 OKodSetup:=0;
//******************************************************************************
 PStyles:=TStylesDM.Create(self);
 DepartmentTreeList.Styles.StyleSheet:=PStyles.TreeListStyleSheetDevExpress;
//******************************************************************************
 PLanguageIndex:=LanguageIndex;
 Caption:=AccDepart_Text[PLanguageIndex];
 RefreshBtn.Caption:=RefreshBtn_Caption[PLanguageIndex];
 SelectBtn.Caption :=SelectBtn_Caption[PLanguageIndex];
 ExitBtn.Caption   :=ExitBtn_Caption[PLanguageIndex];
 DivisionTreeListColumnDepartment.Caption.Text:=GridClNameDepartment_Caption[PLanguageIndex];
 DivisionTreeListColumnSumma.Caption.Text     :=GridClSumma_Caption[PLanguageIndex];
 DivisionTreeListColumnTotal.Caption.Text     :=TreeClTotal_Caption[PLanguageIndex];
 DivisionTreeListColumnGranted.Caption.Text   :=TreeClGranted_Caption[PLanguageIndex];
 //******************************************************************************
 Database.Handle:=AHandle;
 Transaction.DefaultDatabase:=Database;
 DSet1.Database:=Database;
 DSet1.Transaction:=Transaction;
 DSource.DataSet:=DSet1;
//******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DSet1;
 PBarLocate.BorderStyle := bbsNone;
 ZILRec.NameField    :='NAME_FULL';
 ZILRec.Caption      :=DivisionTreeListColumnDepartment.Caption.Text;
 ZILRec.LocateOptions:=[loCaseInsensitive];
 PBarLocate.AddLocateItem(ZILRec);

 ZILRec.NameField    :='ID_DEPARTMENT';
 ZILRec.Caption      :=LabelKod_Caption[PLanguageIndex];
 ZILRec.LocateOptions:=[loCaseInsensitive];
 PBarLocate.AddLocateItem(ZILRec);

 PBarLocate.FieldSelectVisible := True;
 PBarLocate.DockControl := BarDockLocate;
//******************************************************************************
 dxStatusBar1.Panels[0].Text:= 'F5 - '+RefreshBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text:= 'F10 - '+SelectBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[2].Text:= 'Esc - '+ExitBtn_Caption[PLanguageIndex];
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

//******************************************************************************
 Result:=Null;
end;


procedure TfGrAccDepart.FormCreate(Sender: TObject);
begin
  if DepartmentTreeList.FocusedNode=nil then
    SelectBtn.Enabled:=false
  else
    DepartmentTreeList.FocusedNode.Collapse(true);
end;

procedure TfGrAccDepart.RefreshBtnClick(Sender: TObject);
var wf:TForm;
begin
  if DSet1.Active then Dset1.Close;
  DSet1.SQLs.SelectSQL.Text:='SELECT '+
    'ID_PARENT,'+
    'ID_DEPARTMENT,'+
    'NAME_FULL,'+
    'DEPARTMENT_CODE,'+
    'TOTAL,'+
    'GRANTED,'+
    'SUMMA '+
  'FROM '+
    'GR_DT_GRANT_FILTER(:KOD_SETUP)';
 DSet1.ParamByName('KOD_SETUP').AsInteger:=NKodSetup;
 wf:=ShowWaitForm(self,wfSelectData);
 DSet1.Open;
 CloseWaitForm(wf);
end;

procedure TfGrAccDepart.SelectBtnClick(Sender: TObject);
var text,id_text:string;
begin
 Result:=VarArrayCreate([0,2], varVariant);
 Result[0]:= DSet1['ID_DEPARTMENT'];
 Result[1]:= DSet1['DEPARTMENT_CODE'];
 Result[2]:=DSet1['NAME_FULL'];

 ResultNameDep:=DSet1['NAME_FULL'];
 ModalResult:=mrYes;
 {if DSet1['ID_PARENT']=99 then  Exit;
 ResultNameDep:=DSet1.Lookup('ID_DEPARTMENT',DSet1['ID_PARENT'],'NAME_FULL')+' - '+ResultNameDep;
 DSet1.Locate('ID_DEPARTMENT',DSet1['ID_PARENT'],[]);

 if DSet1['ID_PARENT']=99 then  Exit;
 ResultNameDep:=DSet1.Lookup('ID_DEPARTMENT',DSet1['ID_PARENT'],'NAME_FULL')+' - '+ResultNameDep;
 DSet1.Locate('ID_DEPARTMENT',DSet1['ID_PARENT'],[]) ;

 if DSet1['ID_PARENT']=99 then  Exit;
 ResultNameDep:=DSet1.Lookup('ID_DEPARTMENT',DSet1['ID_PARENT'],'NAME_FULL')+' - '+ResultNameDep;
 DSet1.Locate('ID_DEPARTMENT',DSet1['ID_PARENT'],[]);
 ResultNameDep:='...'+ResultNameDep;     }


end;

procedure TfGrAccDepart.ExitBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfGrAccDepart.DepartmentTreeListFocusedNodeChanged(
  Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  if AFocusedNode=nil then
    SelectBtn.Enabled:=false
  else
    SelectBtn.Enabled:=true;
end;

procedure TfGrAccDepart.FormShow(Sender: TObject);
begin
  if(OKodSetup<>NKodSetup)then
    RefreshBtn.Click;
  OKodSetup:=NKodSetup;
end;

end.
