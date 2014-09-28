//******************************************************************************
//Возвращает вариантній массив:
//индекс[0] - идентификатор подразделения
//индекс[1] - название подразделения
//индекс[2] - модальный результат: mrOk или mrAll
//******************************************************************************
unit uAvansData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, dxBar, dxBarExtItems, ExtCtrls, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  dxDockControl, dxDockPanel, cxPropertiesStore, StdCtrls,
  cxLookAndFeelPainters, cxButtons, cxContainer, cxTextEdit, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ZTypes, Unit_ZGlobal_Consts, IBase, ZProc,
  ZSvodTypesUnit,ZMessages,zSvodLoaderUnit, cxCheckBox, ZcxLocateBar,
  cxSpinEdit, cxCalc, RxMemDS, ActnList, MemTable, cxCurrencyEdit,
  z_uWaitForm, PackageLoad;

type
  TFAvansData = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    SelectAllBtn: TdxBarLargeButton;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSourceParent: TDataSource;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    PrintBtn: TdxBarLargeButton;
    TreeList: TcxDBTreeList;
    GridClText: TcxDBTreeListColumn;
    GridClSumma: TcxDBTreeListColumn;
    GridClPercent: TcxDBTreeListColumn;
    GridClRealSumma: TcxDBTreeListColumn;
    GridClChecked: TcxDBTreeListColumn;
    RxMemoryData: TRxMemoryData;
    ActionList: TActionList;
    ActionYes: TAction;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBTransaction1: TpFIBTransaction;
    BarEditSumma: TdxBarEdit;
    GridClId: TcxDBTreeListColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure GridClPercentPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure ActionYesExecute(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure TreeListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function dtAvansEdit(Sender:TObject;Percent:variant;Checked:variant):boolean;
    procedure SelectAllBtnClick(Sender: TObject);
  private
    PResault: Variant;
    PLanguageIndex:Byte;
    PBarLocate:TZBarLocate;
    pValidating:boolean;
    procedure UpdatePostions(Node:TcxTreeListNode);
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild);reintroduce;
    property Resault:Variant read PResault;
  end;

function View_Form(AOwner :TComponent;DB:TISC_DB_HANDLE):Variant; stdcall;
 exports View_Form;

implementation

{$R *.dfm}

function View_Form(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFAvansData;
begin
  Result:=NULL;
  ViewForm  :=  TFAvansData.Create(AOwner, DB);
  ViewForm.ShowModal;
  ViewForm.Free;
end;

constructor TFAvansData.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild);
begin
  inherited Create(ComeComponent);
  PLanguageIndex:=LanguageIndex;
//******************************************************************************
  Caption                      := 'Конфігурація формування відомостей після розрахунку авансу';
  SelectAllBtn.Caption         := 'Сформувати відомості';
  RefreshBtn.Caption           := RefreshBtn_Caption[PLanguageIndex];
  ExitBtn.Caption              := ExitBtn_Caption[PLanguageIndex];

  GridClText.Caption.Text      := GridClName_Caption[PLanguageIndex];
  GridClSumma.Caption.Text     := GridClSumma_Caption[PLanguageIndex];
  GridClRealSumma.Caption.Text := GridClCount_Caption[PLanguageIndex];
  GridClPercent.Caption.Text   := GridClPercent_Caption[PLanguageIndex];
  GridClChecked.Caption.Text   := '';
//******************************************************************************
  DB.Handle                    := ComeDB;
  DSet.SQLs.SelectSQL.Text     := 'SELECT * FROM Z_DT_AVANS_S';
  DSet.Open;
  TreeList.GotoBOF;
  TreeListFocusedNodeChanged(TreeList,nil,TreeList.FocusedNode);
//******************************************************************************
  PBarLocate:=TZBarLocate.Create(BarManager);
  PBarLocate.DataSet := DSet;
  PBarLocate.BorderStyle := bbsNone;
  PBarLocate.AddLocateItem('TEXT',GridClText.Caption.Text,[loCaseInsensitive,loPartialKey]);
  PBarLocate.FieldSelectVisible := False;
//******************************************************************************
  //TreeList.FullExpand;
  WindowState:=wsMaximized;
//******************************************************************************
  Dset.SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';
  DSet.SQLs.RefreshSQL.Text := 'select * from z_dt_avans_s_by_id(?ID)';
end;

procedure TFAvansData.ExitBtnClick(Sender: TObject);
begin
     if MessageBox(Handle, 'Ви хочете відмовитися від розрахунка відомостей?', 
       'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES then
     begin
          Close;
     end;
end;

procedure TFAvansData.RefreshBtnClick(Sender: TObject);
begin
 DataSetCloseOpen(DSet,'ID')
end;

procedure TFAvansData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ReadTransaction.Commit;
     If self.FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFAvansData.TreeListFocusedNodeChanged(
  Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
if AFocusedNode<>nil then
 begin
  PrintBtn.Enabled := True;
  SelectBtn.Enabled := True;
  SelectAllBtn.Enabled := True;
 end
else
 begin
  PrintBtn.Enabled := False;
  SelectBtn.Enabled := False;
  SelectAllBtn.Enabled := False;
 end;
end;

procedure TFAvansData.GridClPercentPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
   if pValidating then Exit;
   pValidating:=True;
   dtAvansEdit(sender,DisplayValue,null);
   pValidating:=False;
end;

procedure TFAvansData.ActionYesExecute(Sender: TObject);
begin
 ShowMessage('CHECKED = '+VarToStrDef(DSet['CHECKED'],'NULL')+#13+
             'PERCENT = '+VarToStrDef(DSet['PERCENT'],'NULL')+#13+
             'ID = '+VarToStrDef(DSet['ID'],'NULL')+#13+
             'AbsoluteIndex = '+IntToStr(TreeList.FocusedNode.AbsoluteIndex)+#13+
             'RecNo = '+IntToStr(DSet.RecNo)+#13+
             'RecordIndex = '+IntToStr(TreeList.FocusedNode.RecordIndex)+#13+
             'Index = '+IntToStr(TreeList.FocusedNode.Index));
end;

procedure TFAvansData.SaveBtnClick(Sender: TObject);
var i:integer;
begin
 for i:=0 to TreeList.Nodes.Count-1 do
  begin

  end;
end;

procedure TFAvansData.TreeListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=vk_Space then dtAvansEdit(Sender,ifThen(DSet['CHECKED']='T',0,100),DSet['CHECKED']);
   if Key=VK_RIGHT then begin
                             if TreeList.FocusedNode<>nil
                             then if TreeList.FocusedNode.CanExpand
                             then TreeList.FocusedNode.Expand(false);
                    end;
   if Key=VK_LEFT	  then begin
                             if TreeList.FocusedNode<>nil
                             then if TreeList.FocusedNode.CanCollapse
                             then TreeList.FocusedNode.Collapse(false);
                   end;
end;

function TFAvansData.dtAvansEdit(Sender:TObject;Percent:variant;Checked:variant):boolean;
var StProc:TpFIBStoredProc;
    StProcTran:TpFIBTransaction;
begin
   Result:=true;
   StProc := TpFIBStoredProc.Create(nil);
   StProcTran := TpFIBTransaction.Create(nil);
   StProc.Database := DB;
   StProc.Transaction := StProcTran;
   StProcTran.DefaultDatabase := DB;
   StProc.Transaction.StartTransaction;
   with StProc do
    try
      StoredProcName := 'Z_DT_AVANS_U';
      Prepare;
      ParamByName('PERCENT').AsVariant := Percent;
      ParamByName('CHECKED').AsVariant:= Checked;
      ParamByName('ID').AsVariant := DSet['ID'];
      ExecProc;
      Transaction.Commit;
    except
      on E:Exception do
      begin
            Transaction.Rollback;
            ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
            Result:=False;
      end;
    end;
   StProcTran.Destroy;
   StProc.Destroy;
   DSet.Edit;
   DSet.Post;

   UpdatePostions(TreeList.FocusedNode);
end;

procedure TFAvansData.SelectAllBtnClick(Sender: TObject);
var StProc:TpFIBStoredProc;
    StProcTran:TpFIBTransaction;
    wf:TForm;
    IsOk:boolean;
begin
 IsOk:=False;
 wf:=ShowWaitForm(self,zwfDoFunction);
   StProc := TpFIBStoredProc.Create(nil);
   StProcTran := TpFIBTransaction.Create(nil);
   StProc.Database := DB;
   StProc.Transaction := StProcTran;
   StProcTran.DefaultDatabase := DB;
   StProc.Transaction.StartTransaction;
 try
   with StProc do
    try
      StoredProcName := 'Z_AVANS_TAXED';
      Prepare;
      ExecProc;
      Transaction.Commit;
      IsOk:=True;
    except
      on E:Exception do
       begin
        Transaction.Rollback;
        ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
       end;
    end;
 finally
  StProcTran.Destroy;
  StProc.Destroy;
  CloseWaitForm(wf);
  if IsOk then
  begin
    uvFormSheet(self,DB.Handle,7,BarEditSumma.Text);
  end;
 end;

 ModalResult:=mrYes;
end;

procedure TFAvansData.UpdatePostions(Node: TcxTreeListNode);
var RecNo:Integer;
    Id, i:integer;
    CNode:TcxTreeListNode;
begin
     if Node<>nil
     then begin
                try
                      TreeList.BeginUpdate;
                      id:=Node.Values[5];
                      DSet.CloseOpen(true);
                      Dset.Locate('id',Id,[]);
                      TreeList.FocusedNode:=Node;
                      //TreeList.FocusedNode.Expand(true);
                      TreeList.EndUpdate;
                      except on E :Exception do begin end;
                end;
    end;
end;

end.
