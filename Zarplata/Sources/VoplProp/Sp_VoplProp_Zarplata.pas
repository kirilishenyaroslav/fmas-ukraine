unit Sp_VoplProp_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems, CheckListVoplProp,
  dxDockPanel, dxDockControl, cxCheckBox, Unit_Sp_VidOpl_Consts, FIBDataSet,
  pFIBDataSet, cxPropertiesStore, ZTypes, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, IBase, ZProc, Kernel,
  cxSplitter, ExtCtrls, RxMemDS, ZMessages;

type
  TFZMain_VoplProp = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    BarEditLocate: TdxBarEdit;
    UpdateAllBtn: TdxBarLargeButton;
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
    GridProp: TcxGrid;
    GridPropView1: TcxGridDBTableView;
    GridColumnName: TcxGridDBColumn;
    GridPropLevel1: TcxGridLevel;
    PanelGridChild: TPanel;
    GridGroup: TcxGrid;
    GridGroupView1: TcxGridDBTableView;
    GridChColumnGroupName: TcxGridDBColumn;
    GridChColumnGroupUse: TcxGridDBColumn;
    GridGroupLevel1: TcxGridLevel;
    BarDockControlOptions: TdxBarDockControl;
    LocateBarDockControl: TdxBarDockControl;
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
    RxDSetChild: TRxMemoryData;
    SaveBtn: TdxBarLargeButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpdateAllBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GridPropView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure LocateNextBtnClick(Sender: TObject);
    procedure BarEditLocateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BarEditLocateEnter(Sender: TObject);
    procedure GridPropView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridGroupView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridGroupView1DblClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure RefreshData(Sender: TObject);
  private
    Ins_ZFormStyle:TZFormStyle;
    Ins_resault:variant;
    Ins_NameParent:string[255];
    Ins_ID_parent:integer;
    Ins_Array:array of string[1];
    Ins_IsSaved:boolean;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsModal);reintroduce;
    property ZFormStyle:TZFormStyle read Ins_ZFormStyle;
    property Resault:Variant read Ins_resault;
  end;

function View_FVoplProp_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
 exports View_FVoplProp_Sp;



implementation

{$R *.dfm}
function View_FVoplProp_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;
var ViewForm: TFZMain_VoplProp;
    Res:Variant;
begin
case ComeFormStyle of
 zfsChild:
  begin
   if not IsMDIChildFormShow(TFZMain_VoplProp) then
    ViewForm  :=  TFZMain_VoplProp.Create(AOwner, DB_HANDLE, ComeFormStyle);
   res :=NULL;
  end;
 zfsNormal:
  begin
   ViewForm  :=  TFZMain_VoplProp.Create(AOwner, DB_HANDLE, ComeFormStyle);
   ViewForm.ShowModal;
   res:=NULL;
   ViewForm.Free;
  end;
 zfsModal:
  begin
   ViewForm  :=  TFZMain_VoplProp.Create(AOwner, DB_HANDLE, ComeFormStyle);
   ViewForm.ShowModal;
   if (ViewForm.ModalResult=mrYes) then
    res:=ViewForm.Resault
   else
     res:=NULL;
   ViewForm.Free;
  end;
end;
View_FVoplProp_Sp:=res;
end;

constructor TFZMain_VoplProp.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsModal);
begin
 inherited Create(ComeComponent);
Ins_ZFormStyle := ComeFormStyle;
Ins_resault    := VarArrayCreate([0,1],varVariant);
Ins_IsSaved    := False;
//******************************************************************************//
self.Caption                             := FZ_Vopl_Prop_Caption;
self.GridColumnName.Caption              := FZ_Vopl_Prop_GridColumnName_Caption;
self.GridChColumnGroupName.Caption       := FZ_Vopl_Prop_GridChColumnGroupName_Caption;
self.GridChColumnGroupUse.Caption        := FZ_Vopl_Prop_GridChColumnGroupUse_Caption;
self.RefreshBtn.Caption                  := 'Відновити'; //RefreshBtn_Caption;
self.SelectBtn.Caption                   := SelectBtn_Caption;
self.ExitBtn.Caption                     := ExitBtn_Caption;
self.UpdateAllBtn.Caption                := UpdateAllBtn_Caption;
self.BarEditLocate.Caption               := self.GridColumnName.Caption+':';
self.SaveBtn.Caption                     := SaveBtn_Caption;
GridColumnName.DataBinding.FieldName     := 'NAME_VOPL_PROP';
GridChColumnGroupName.DataBinding.FieldName := 'NAME_CHILD';
GridChColumnGroupUse.DataBinding.FieldName  := 'IN_USE';
DataSetParent.SQLs.SelectSQL.Text:='Select * from Z_SP_VOPL_PROP_SELECT(NULL)';
DataSetChild.SQLs.SelectSQL.Text :='Select * from VOPL_PROP_GROUP_SELECT(:ID_VOPL_PROP,1)';
DataBase.Handle:= ComeDB;
RxDSetChild.Open;
DataSetParent.Open;

case ComeFormStyle of
 zfsModal:
  begin
   self.FormStyle                   := fsNormal;
   self.BorderStyle                 := bsDialog;
   self.SelectBtn.Visible           := ivAlways;
   PanelGridChild.Visible           := False;
   SplitterGridChildControl.Visible := False;
   self.Position                    := poOwnerFormCenter;
   self.GridPropView1.OptionsView.Indicator := True;
   self.GridPropView1.OptionsSelection.MultiSelect := True;
   DataSetChild.Open;
  end;
 zfsChild:
  begin
   self.FormStyle         := fsMDIChild;
   self.BorderStyle       := bsSizeable;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poMainFormCenter;
   DataSetChild.Open;
  end;
 zfsNormal:
  begin
   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poMainFormCenter;
   DataSetChild.Open;
  end;
end;
GridPropView1.DataController.DataSource  := DataSourceParent;
GridGroupView1.DataController.DataSource := DataSourceChild;
//GridPropView1FocusedRecordChanged(GridPropView1,nil,GridPropView1.Controller.FocusedRecord,True);
end;


procedure TFZMain_VoplProp.ExitBtnClick(Sender: TObject);
begin
if Ins_ZFormStyle=zfsModal then ModalResult:=mrNo
else Close;
end;

procedure TFZMain_VoplProp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
If FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZMain_VoplProp.UpdateAllBtnClick(Sender: TObject);
var DataForm: TFCheckList;
    _recno: LongWord;
    RecInfo:RECORD_INFO_STRUCTURE;
//    ResultInfo:RESULT_STRUCTURE;
begin
try
    StoredProc.Database                               := DataBase;
    StoredProc.Transaction                            := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    RecInfo.TRHANDLE       :=WriteTransaction.Handle;
    RecInfo.DBHANDLE       :=Database.Handle;
    RecInfo.ID_RECORD      :=VarArrayOf([DataSetParent.FieldValues['ID_VOPL_PROP']]);
    RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_VOPL_PROP']);
    RecInfo.TABLE_NAME     :='VOPL_PROP_GROUP';
    RecInfo.RAISE_FLAG     :=True;
//    LockRecord(@RecInfo);
_recno:=DataSetChild.RecNo;
DataForm := TFCheckList.Create(self);
DataForm.Caption := FSpVoplIniPropGroupControl_Caption;
DataSetChild.First;
while not(DataSetChild.Eof) do
 begin
  DataForm.CheckListBox.AddItem(DataSetChild.FieldValues['NAME_CHILD']);
  if DataSetChild.FieldValues['IN_USE']='T' then
    DataForm.CheckListBox.Items.Items[DataSetChild.RecNo-1].State:=cbsChecked;
    DataSetChild.Next;
 end;
DataForm.ShowModal;
if DataForm.ModalResult=mrYes then
 begin
 DataSetChild.First;
 while not(DataSetChild.Eof) do
  begin
   if ((DataSetChild.FieldValues['IN_USE']='T') and
     (DataForm.CheckListBox.Items.Items[DataSetChild.RecNo-1].State<>cbsChecked)) or
     ((DataSetChild.FieldValues['IN_USE']='F') and
     (DataForm.CheckListBox.Items.Items[DataSetChild.RecNo-1].State<>cbsUnChecked))
     then
      begin
       StoredProc.StoredProcName                         := 'VOPL_PROP_GROUP_UPDATE';
       StoredProc.ParamByName('ID_VOPL_PROP').AsInteger := DataSetParent.FieldValues['ID_VOPL_PROP'];
       StoredProc.ParamByName('ID_VOPL_PROP_GROUP').AsInteger     := DataSetChild.FieldValues['ID_CHILD'];
       StoredProc.ParamByName('IS_GROUP').AsString         := DataSetChild.FieldValues['IN_USE'];
       StoredProc.ExecProc;
      end;
   DataSetChild.Next;
  end;
 end;
StoredProc.Transaction.Commit;
DataForm.Free;
DataSetCloseOpen(DataSetChild);
DataSetChild.RecNo:=_recno;
except
 on E:Exception do
  begin
   MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
   StoredProc.Transaction.Rollback;
  end;
end;
end;

procedure TFZMain_VoplProp.SelectBtnClick(Sender: TObject);
begin
Ins_resault[0]      := DataSetParent.FieldValues['ID_VOPL_PROP'];
Ins_resault[1]      := DataSetParent.FieldValues['NAME_VOPL_PROP'];
ModalResult:=mrYes;
end;

procedure TFZMain_VoplProp.RefreshBtnClick(Sender: TObject);
var Val1,Val2:Variant;
begin
GridProp.BeginUpdate;
GridGroup.BeginUpdate;
GridPropView1.OnFocusedRecordChanged:=nil;
Val1:=DataSetParent['ID_VOPL_PROP'];
Val2:=RxDSetChild['ID_CHILD'];
if RxDSetChild.Active then RxDSetChild.Close;
DataSetChild.Close;
DataSetParent.Close;
DataSetParent.Open;
GridPropView1.DataController.LocateByKey(Val1);
DataSetChild.Open;
GridGroupView1.DataController.LocateByKey(Val2);
RxDSetChild.Open;
GridGroup.EndUpdate;
GridProp.EndUpdate;
GridPropView1.OnFocusedRecordChanged:=GridPropView1FocusedRecordChanged;
RefreshData(Sender);
end;

procedure TFZMain_VoplProp.GridPropView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if AFocusedRecord<>APrevFocusedRecord then
 begin
  SelectBtn.Enabled := not(AFocusedRecord = nil);
  RefreshData(Sender);
 end;
end;

procedure TFZMain_VoplProp.LocateNextBtnClick(Sender: TObject);
begin
 DataSetparent.LocateNext('NAME_VOPL_PROP',BarEditLocate.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFZMain_VoplProp.BarEditLocateKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
DataSetParent.Locate('NAME_VOPL_PROP', BarEditLocate.CurText, [loCaseInsensitive, loPartialKey]);
BarEditLocate.Text:=BarEditLocate.CurText;
end;

procedure TFZMain_VoplProp.BarEditLocateEnter(Sender: TObject);
begin
GridProp.SetFocus;
end;

procedure TFZMain_VoplProp.GridPropView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 BarEditLocate.Text :=  GridPropView1.Controller.IncSearchingText;
end;

procedure TFZMain_VoplProp.GridGroupView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key=VK_SPACE then
   GridGroupView1DblClick(Sender);
end;

procedure TFZMain_VoplProp.GridGroupView1DblClick(Sender: TObject);
begin
RxDSetChild.Edit;
RxDSetChild['IN_USE']:=IfThen(RxDSetChild['IN_USE']='T','F','T');
RxDSetChild.Post;
end;

procedure TFZMain_VoplProp.SaveBtnClick(Sender: TObject);
var Recno:integer;
begin
 GridProp.BeginUpdate;
try
 recno:=RxDSetChild.RecNo;
 StoredProc.Transaction.StartTransaction;
 RxDSetChild.First;
 while not(RxDSetChild.Eof) do
  begin
   if (RxDSetChild['IN_USE']<>Ins_Array[RxDSetChild.Recno-1]) then
    begin
     StoredProc.StoredProcName                         := 'VOPL_PROP_GROUP_UPDATE';
     StoredProc.ParamByName('ID_VOPL_PROP').AsInteger := Ins_ID_parent;
     StoredProc.ParamByName('ID_VOPL_PROP_GROUP').AsInteger   := RxDSetChild['ID_CHILD'];
     StoredProc.ParamByName('IS_GROUP').AsString              := ins_array[RxDSetChild.recno-1];
     StoredProc.ExecProc;
    end;
   RxDSetChild.Next;
  end;
 StoredProc.Transaction.Commit;
 RxDSetChild.RecNo:=recno;
 Ins_IsSaved:=true;
except
 on E:Exception do
  begin
   ZShowMessage(Error_Caption,E.Message,mtError,[mbOK]);
   StoredProc.Transaction.Rollback;
  end;
end;
 GridProp.EndUpdate;
end;

procedure TFZMain_VoplProp.RefreshData(Sender: TObject);
begin
  GridGroup.BeginUpdate;
  RxDSetChild.Open;
  RxDSetChild.First;
  if not Ins_IsSaved then
   while not RxDSetChild.Eof do
    begin
     if RxDSetChild['IN_USE']<>Ins_Array[RxDSetChild.RecNo-1] then
      begin
       GridGroup.EndUpdate;
       if ZShowMessage(SavePropsBtn_Caption,SavePropsBtn_Text1+Ins_NameParent+#13+SavePropsBtn_Text2,mtConfirmation,[mbYes,mbNo])=mrYes then
        begin
         SaveBtnClick(Sender);
         Break;
        end;
       GridGroup.BeginUpdate;
      end;
     RxDSetChild.Next;
    end;
//  GridGroup.EndUpdate;
  GridGroupView1.DataController.DataSource:=nil;
  RxDSetChild.EmptyTable;

//  GridGroup.BeginUpdate;
  DataSetChild.Last;
  Ins_IsSaved:=False;

  while not DataSetChild.Bof do
   begin
     RxDSetChild.Insert;
     RxDSetChild.FieldValues['ID_CHILD']:=DataSetChild['ID_CHILD'];
     RxDSetChild.FieldValues['NAME_CHILD']:=DataSetChild['NAME_CHILD'];
     RxDSetChild.FieldValues['IN_USE']:=DataSetChild['IN_USE'];
     RxDSetChild.Post;
     DataSetChild.Prior;
   end;

  SetLength(Ins_Array,RxDSetChild.RecordCount);
  RxDSetChild.First;
  while not RxDSetChild.Eof do
   begin
    Ins_Array[RxDSetChild.RecNo-1]:=copy(VarToStr(RxDSetChild['IN_USE']),1,1);
    RxDSetChild.Next;
   end;

  Ins_NameParent:=DataSetParent['NAME_VOPL_PROP'];
  Ins_ID_parent:=DataSetParent['ID_VOPL_PROP'];
  GridGroupView1.DataController.DataSource:=DataSourceChild;
  GridGroup.EndUpdate;
end;

end.
