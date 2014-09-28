unit Sp_VoplPropGroup_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems,
  dxDockPanel, dxDockControl, VoplPropGroupControl,
  cxCheckBox, Unit_Sp_VidOpl_Consts, FIBDataSet,
  pFIBDataSet, cxPropertiesStore, ZTypes, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, IBase, ZProc,
  cxSplitter, ExtCtrls, Kernel, cxTextEdit, ZMessages;

type
  TFZ_Vopl_PropGroup = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    BarEditLocate: TdxBarEdit;
    LocateNextBtn: TdxBarButton;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
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
    GridColumnKod: TcxGridDBColumn;
    GridColumnGroupName: TcxGridDBColumn;
    GridColumnIsEdit: TcxGridDBColumn;
    GridColumnIsDelete: TcxGridDBColumn;
    procedure InsertBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ButtonsUpdate(Sender: TObject);
    procedure GridPropView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridPropView1KeyPress(Sender: TObject; var Key: Char);
    procedure LocateNextBtnClick(Sender: TObject);
    procedure BarEditLocateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridGroupView1DblClick(Sender: TObject);
    procedure BarEditLocateKeyPress(Sender: TObject; var Key: Char);
    procedure GridGroupView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Ins_ZFormStyle:TZFormStyle;
    Ins_resault:variant;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsModal);reintroduce;
    property ZFormStyle:TZFormStyle read Ins_ZFormStyle;
    property Resault:Variant read Ins_resault;
  end;

function View_FVoplPropGroup_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
 exports View_FVoplPropGroup_Sp;



implementation

uses cxDBLookupComboBox;

{$R *.dfm}
function View_FVoplPropGroup_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;
var ViewForm: TFZ_Vopl_PropGroup;
    Res:Variant;
begin
case ComeFormStyle of
 zfsChild:
  begin
   if not IsMDIChildFormShow(TFZ_Vopl_PropGroup) then
    ViewForm  :=  TFZ_Vopl_PropGroup.Create(AOwner, DB_HANDLE, ComeFormStyle);
   res :=NULL;
  end;
 zfsNormal:
  begin
   ViewForm  :=  TFZ_Vopl_PropGroup.Create(AOwner, DB_HANDLE, ComeFormStyle);
   ViewForm.ShowModal;
   res:=NULL;
   ViewForm.Free;
  end;
 zfsModal:
  begin
   ViewForm  :=  TFZ_Vopl_PropGroup.Create(AOwner, DB_HANDLE, ComeFormStyle);
   ViewForm.ShowModal;
   if (ViewForm.ModalResult=mrYes) then
    res:=ViewForm.Resault
   else
     res:=NULL;
   ViewForm.Free;
  end;
end;
View_FVoplPropGroup_Sp:=res;
end;

constructor TFZ_Vopl_PropGroup.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsModal);
begin
 inherited Create(ComeComponent);
Ins_ZFormStyle := ComeFormStyle;
Ins_resault    := VarArrayCreate([0,1],varVariant);
//******************************************************************************//
self.Caption                             := FZ_Vopl_PropGroup_Caption;
self.GridColumnName.Caption              := FZ_Vopl_PropGroup_GridColumnName_Caption;
self.GridColumnKod.Caption               := FZ_Vopl_PropGroup_GridColumnKod_Caption;
self.GridColumnGroupName.Caption         := FZ_Vopl_PropGroup_GridColumnnameGroup_Caption;
self.GridChColumnGroupName.Caption       := FZ_Vopl_PropGroup_GridChColumnGroupName_Caption;
self.GridChColumnGroupUse.Caption        := FZ_Vopl_PropGroup_GridChColumnGroupUse_Caption;
self.InsertBtn.Caption                   := InsertBtn_Caption;
self.UpdateBtn.Caption                   := UpdateBtn_Caption;
self.DeleteBtn.Caption                   := DeleteBtn_Caption;
self.RefreshBtn.Caption                  := 'Відновити'; //RefreshBtn_Caption;
self.SelectBtn.Caption                   := SelectBtn_Caption;
self.ExitBtn.Caption                     := ExitBtn_Caption;
self.LocateNextBtn.Caption               := LocateNextBtn_Caption;
self.BarEditLocate.Caption               := GridColumnName.Caption+': ';
GridPropView1.DataController.DataSource  := DataSourceParent;
GridGroupView1.DataController.DataSource := DataSourceChild;
DataSetParent.SQLs.SelectSQL.Text:='Select * from SP_VIDOPL_PROP_GROUP_S(NULL) ORDER BY NAME_VOPL_PROP_GROUP_FILTER,KOD_VOPL_PROP_GROUP';
DataBase.Handle:= ComeDB;
DataSetParent.Open;
case ComeFormStyle of
 zfsModal:
  begin
   self.FormStyle                   := fsNormal;
   self.BorderStyle                 := bsDialog;
   self.SelectBtn.Visible           := ivAlways;
   self.InsertBtn.Visible           := ivNever;
   self.DeleteBtn.Visible           := ivNever;
   self.UpdateBtn.Visible           := ivNever;
   PanelGridChild.Visible           := False;
   SplitterGridChildControl.Visible := False;
   self.Position                    := poOwnerFormCenter;
{   self.GridPropView1.OptionsView.Indicator := True;
   self.GridPropView1.OptionsSelection.MultiSelect := True;}
  end;
 zfsChild:
  begin
   self.FormStyle         := fsMDIChild;
   self.BorderStyle       := bsSizeable;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poMainFormCenter;
   DataSetChild.SQLs.SelectSQL.Text :='Select * from VOPL_PROP_GROUP_SELECT(:ID_VOPL_PROP_GROUP,2) order by Name_Child';
   DataSetChild.Open;
  end;
 zfsNormal:
  begin
   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poMainFormCenter;
   DataSetChild.SQLs.SelectSQL.Text :='Select * from VOPL_PROP_GROUP_SELECT(:ID_VOPL_PROP_GROUP,2) order by Name_Child';
   DataSetChild.Open;
  end;
end;
end;


procedure TFZ_Vopl_PropGroup.InsertBtnClick(Sender: TObject);
var InsertForm:TFVoplPropGroupControl;
    Id:integer;
begin
InsertForm         := TFVoplPropGroupControl.Create(self,DataBase.Handle);
InsertForm.Caption := VoplPropGroupControl_Caption_Insert;
InsertForm.ShowModal;
If InsertForm.ModalResult=mrYes then
 try
  StoredProc.Database:=DataBase;
  StoredProc.Transaction:=WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'SP_VIDOPL_PROP_GROUP_I';
  StoredProc.Prepare;
  StoredProc.ParamByName('NAME_VOPL_PROP_GROUP').AsString := InsertForm.MaskEditFullName.Text;
  if InsertForm.MaskEditKod.Text='' then
   StoredProc.ParamByName('KOD_VOPL_PROP_GROUP').AsVariant := NULL
  else
   StoredProc.ParamByName('KOD_VOPL_PROP_GROUP').AsInteger := StrToInt(InsertForm.MaskEditKod.Text);
  StoredProc.ParamByName('TYPE_VOPL_PROP_GROUP').AsInteger:= InsertForm.ComboBoxFilter.EditValue;
  StoredProc.ExecProc;
  Id := StoredProc.ParamByName('ID_VOPL_PROP_GROUP').AsInteger;
  WriteTransaction.Commit;
  DataSetParent.SQLs.InsertSQL.Text:='execute procedure Z_EMPTY_PROC';
  DataSetParent.SQLs.RefreshSQL.Text:='Select * from SP_VIDOPL_PROP_GROUP_S(NULL) WHERE ID_VOPL_PROP_GROUP='+
      IntToStr(Id);
  DataSetParent.Insert;
  DataSetParent.Post;
  DataSetParent.SQLs.InsertSQL.Text:='';
  GridPropView1.DataController.LocateByKey(ID)
 except
  on E: Exception do
   begin
    MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
    WriteTransaction.Rollback;
   end;
 end;
InsertForm.Free;
end;

procedure TFZ_Vopl_PropGroup.FormCreate(Sender: TObject);
begin
ButtonsUpdate(Sender);
end;

procedure TFZ_Vopl_PropGroup.ExitBtnClick(Sender: TObject);
begin
if Ins_ZFormStyle=zfsModal then ModalResult:=mrNo
else Close;
end;

procedure TFZ_Vopl_PropGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
If FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZ_Vopl_PropGroup.UpdateBtnClick(Sender: TObject);
var UpdateForm:TFVoplPropGroupControl;
    RecInfo:RECORD_INFO_STRUCTURE;
begin
try
 StoredProc.Database:=DataBase;
 StoredProc.Transaction:=WriteTransaction;
 StoredProc.Transaction.StartTransaction;
   RecInfo.TRHANDLE       :=WriteTransaction.Handle;
   RecInfo.DBHANDLE       :=DataBase.Handle;
   RecInfo.ID_RECORD      :=VarArrayOf([DataSetParent.FieldValues['ID_VOPL_PROP_GROUP']]);
   RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_VOPL_PROP_GROUP']);
   RecInfo.TABLE_NAME     :='SP_VIDOPL_PROP_GROUP';
   RecInfo.RAISE_FLAG     :=True;
   LockRecord(@RecInfo);
  UpdateForm         := TFVoplPropGroupControl.Create(self,DataBase.Handle);
  UpdateForm.Caption := VoplPropGroupControl_Caption_Update;
  UpdateForm.MaskEditFullName.Text := VarToStr(DataSetParent['NAME_VOPL_PROP_GROUP']);
  UpdateForm.MaskEditKod.Text := VarToStr(DataSetParent['KOD_VOPL_PROP_GROUP']);
  UpdateForm.ComboBoxFilter.EditValue := DataSetParent['TYPE_VOPL_PROP_GROUP'];
  UpdateForm.ShowModal;
  If UpdateForm.ModalResult=mrYes then
   begin
    StoredProc.StoredProcName := 'SP_VIDOPL_PROP_GROUP_U';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_VOPL_PROP_GROUP').AsInteger  := DataSetParent.FieldValues['ID_VOPL_PROP_GROUP'];
    StoredProc.ParamByName('NAME_VOPL_PROP_GROUP').AsString := UpdateForm.MaskEditFullName.Text;
    if UpdateForm.MaskEditKod.Text='' then
     StoredProc.ParamByName('KOD_VOPL_PROP_GROUP').AsVariant := NULL
    else
     StoredProc.ParamByName('KOD_VOPL_PROP_GROUP').AsInteger := StrToInt(UpdateForm.MaskEditKod.Text);
    StoredProc.ParamByName('TYPE_VOPL_PROP_GROUP').AsInteger:= UpdateForm.ComboBoxFilter.EditValue;
    StoredProc.ExecProc;
   end;
    WriteTransaction.Commit;
   If UpdateForm.ModalResult=mrYes then
    begin
     DataSetParent.SQLs.UpdateSQL.Text:='execute procedure Z_EMPTY_PROC';
     DataSetParent.SQLs.RefreshSQL.Text:='Select * from SP_VIDOPL_PROP_GROUP_S(NULL) WHERE ID_VOPL_PROP_GROUP='+
        VarToStr(DataSetParent['ID_VOPL_PROP_GROUP']);
     DataSetParent.Edit;
     DataSetParent.Post;
     DataSetParent.SQLs.UpdateSQL.Text:='';
     GridPropView1.DataController.LocateByKey(DataSetParent['ID_VOPL_PROP_GROUP'])
    end;
UpdateForm.Free;
except
 on E: Exception do
  begin
   MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
   WriteTransaction.Rollback;
  end;
end;
end;

procedure TFZ_Vopl_PropGroup.DeleteBtnClick(Sender: TObject);
begin
if MessageBox(self.Handle,PChar(deleteRecord_text),PChar(DeleteRecord_Caption),MB_YESNO+MB_ICONQUESTION)=IDYes then
 try
  DataSetParent.SQLs.DeleteSQL.Text := 'execute procedure SP_VIDOPL_PROP_GROUP_D('+
      VarToStr(DataSetParent['ID_VOPL_PROP_GROUP'])+')';
  DataSetParent.Delete;
  DataSetParent.SQLs.DeleteSQL.Text:='';
  GridPropView1.DataController.LocateByKey(DataSetParent['ID_VOPL_PROP_GROUP']);
 except
  on E: Exception do
   begin
    MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
   end;
 end;
end;

procedure TFZ_Vopl_PropGroup.SelectBtnClick(Sender: TObject);
begin
Ins_resault[0]      := DataSetParent.FieldValues['ID_VOPL_PROP_GROUP'];
Ins_resault[1]      := DataSetParent.FieldValues['NAME_VOPL_PROP_GROUP'];
ModalResult:=mrYes;
end;

procedure TFZ_Vopl_PropGroup.RefreshBtnClick(Sender: TObject);
var KeyParent:variant;
    KeyChild:variant;
begin
KeyParent:=DataSetParent['ID_VOPL_PROP_GROUP'];
KeyChild:=DataSetChild['ID_CHILD'];;
DataSetChild.Close;
DataSetParent.CloseOpen(True);
GridPropView1.DataController.LocateByKey(KeyParent);
DataSetChild.Open;
GridGroupView1.DataController.LocateByKey(KeyChild);
end;

procedure TFZ_Vopl_PropGroup.ButtonsUpdate(Sender: TObject);
begin
if DataSetParent.VisibleRecordCount=0 then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  SelectBtn.Enabled := False;
 end;
end;

procedure TFZ_Vopl_PropGroup.GridPropView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 If (AFocusedRecord = nil) or (AFocusedRecord.Expandable) then
  begin
   UpdateBtn.Enabled := False;
   DeleteBtn.Enabled := False;
   SelectBtn.Enabled := False;
   GridGroupView1.DataController.DataSource:=nil;
  end
 else
  begin
   UpdateBtn.Enabled := GridPropView1.Controller.FocusedRecord.Values[GridColumnIsEdit.Index]='T';
   DeleteBtn.Enabled := GridPropView1.Controller.FocusedRecord.Values[GridColumnIsDelete.Index]='T';
   SelectBtn.Enabled := True;
   GridGroupView1.DataController.DataSource:=DataSourceChild;
  end;
end;

procedure TFZ_Vopl_PropGroup.GridPropView1KeyPress(Sender: TObject;
  var Key: Char);
var TText:string;
    RecNo:integer;
begin
if (key<>#8) then
 begin
  If (Key in ['0'..'9']) then
   begin
    if BarEditLocate.Caption<>GridColumnKod.Caption+': ' then
     begin
      BarEditLocate.Text   := '';
      BarEditLocate.Caption :=GridColumnKod.Caption+': ';
    end;
   end
  else
   begin
    if BarEditLocate.Caption<>GridColumnName.Caption+': ' then
     begin
      BarEditLocate.Text   := '';
      BarEditLocate.Caption :=GridColumnName.Caption+': ';
     end;
   end;
  BarEditLocate.Text:=BarEditLocate.Text+Key;
 end
else
 begin
  TText:=BarEditLocate.Text;
  delete(TText,Length(TText),1);
  BarEditLocate.Text:=TText;
 end;
if BarEditLocate.Text<>'' then
 begin
  RecNo:=DataSetParent.RecNo;
  if BarEditLocate.Caption=GridColumnKod.Caption+': ' then TText:='KOD_VOPL_PROP_GROUP';
  if BarEditLocate.Caption=GridColumnName.Caption+': ' then TText:='NAME_VOPL_PROP_GROUP';
  if not DataSetParent.Locate(TText,BarEditLocate.Text,[loPartialKey,loCaseInsensitive]) then
    begin
     DataSetParent.RecNo:=RecNo;
     ZShowMessage(LocateResult_Caption,LocateResult_NotLocateText,mtInformation,[mbOK]);
    end;
     GridPropView1.DataController.LocateByKey(DataSetParent['ID_VOPL_PROP_GROUP']);
 end;
end;

procedure TFZ_Vopl_PropGroup.LocateNextBtnClick(Sender: TObject);
var TText:string;
    RecNo:integer;
begin
if BarEditLocate.Text<>'' then
 begin
  RecNo:=DataSetParent.RecNo;
  if BarEditLocate.Caption=GridColumnKod.Caption+': ' then TText:='KOD_VOPL_PROP_GROUP';
  if BarEditLocate.Caption=GridColumnName.Caption+': ' then TText:='NAME_VOPL_PROP_GROUP';
  if not DataSetParent.LocateNext(TText,BarEditLocate.Text,[loPartialKey,loCaseInsensitive]) then
    begin
     DataSetParent.RecNo:=RecNo;
     ZShowMessage(LocateResult_Caption,LocateResult_NotLocateText,mtInformation,[mbOK]);
    end;
     GridPropView1.DataController.LocateByKey(DataSetParent['ID_VOPL_PROP_GROUP']);
 end;
end;

procedure TFZ_Vopl_PropGroup.BarEditLocateKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
DataSetParent.Locate('NAME_VOPL_PROP_GROUP', BarEditLocate.CurText, [loCaseInsensitive, loPartialKey]);
BarEditLocate.Text:=BarEditLocate.CurText;
end;

procedure TFZ_Vopl_PropGroup.GridGroupView1DblClick(Sender: TObject);
begin
if (GridGroupView1.Controller.FocusedRecord=nil) or (GridGroupView1.Controller.FocusedRecord.Expandable)
then exit;

try
 DataSetChild.SQLs.UpdateSQL.Text:='Execute procedure VOPL_PROP_GROUP_UPDATE('+
        VarToStr(DataSetChild['ID_CHILD'])+','+VarToStr(DataSetParent['ID_VOPL_PROP_GROUP'])+','''+
        VarToStr(DataSetChild['IN_USE'])+''')';
 DataSetChild.SQLs.RefreshSQL.Text:='Select * from VOPL_PROP_GROUP_SELECT(:ID_VOPL_PROP_GROUP,2) where id_child='+
        VarToStr(DataSetChild['ID_CHILD'])+' order by Name_Child';
 DataSetChild.Edit;
 DataSetChild.Post;
except
 on E:exception do ZShowMessage(Error_Caption,e.Message,mtError,[mbOK]);
end;
end;

procedure TFZ_Vopl_PropGroup.BarEditLocateKeyPress(Sender: TObject;
  var Key: Char);
begin
GridPropView1KeyPress(Sender,key);
end;

procedure TFZ_Vopl_PropGroup.GridGroupView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=VK_SPACE then GridGroupView1DblClick(Sender);
end;

end.
