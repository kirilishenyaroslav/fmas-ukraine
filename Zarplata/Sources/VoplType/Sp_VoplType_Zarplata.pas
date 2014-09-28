unit Sp_VoplType_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems,
  dxDockPanel, dxDockControl, VoplTypeControl,
  cxCheckBox, Unit_Sp_VidOpl_Consts, FIBDataSet,
  pFIBDataSet, cxPropertiesStore, ZTypes, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, IBase, ZProc, Kernel,
  cxSplitter, ExtCtrls;

type
  TFZ_Vopl_Type = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    BarEditLocate: TdxBarEdit;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    DataSourceParent: TDataSource;
    DataBase: TpFIBDatabase;
    DataSetParent: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Styles: TcxStyleRepository;
    PanelGridParent: TPanel;
    GridProp: TcxGrid;
    GridPropView1: TcxGridDBTableView;
    GridColumnName: TcxGridDBColumn;
    GridPropLevel1: TcxGridLevel;
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
    GridColumnDays: TcxGridDBColumn;
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
    procedure LocateNextBtnClick(Sender: TObject);
    procedure BarEditLocateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BarEditLocateEnter(Sender: TObject);
    procedure GridPropView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Ins_ZFormStyle:TZFormStyle;
    Ins_resault:variant;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsModal);reintroduce;
    property ZFormStyle:TZFormStyle read Ins_ZFormStyle;
    property Resault:Variant read Ins_resault;
  end;

function View_FVoplType_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
 exports View_FVoplType_Sp;



implementation

{$R *.dfm}
function View_FVoplType_Sp(AOwner : TComponent;DB_HANDLE:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;
var ViewForm: TFZ_Vopl_Type;
    Res:Variant;
begin
case ComeFormStyle of
 zfsChild:
  begin
   if not IsMDIChildFormShow(TFZ_Vopl_Type) then
    ViewForm  :=  TFZ_Vopl_Type.Create(AOwner, DB_HANDLE, ComeFormStyle);
   res :=NULL;
  end;
 zfsNormal:
  begin
   ViewForm  :=  TFZ_Vopl_Type.Create(AOwner, DB_HANDLE, ComeFormStyle);
   ViewForm.ShowModal;
   res:=NULL;
   ViewForm.Free;
  end;
 zfsModal:
  begin
   ViewForm  :=  TFZ_Vopl_Type.Create(AOwner, DB_HANDLE, ComeFormStyle);
   ViewForm.ShowModal;
   if (ViewForm.ModalResult=mrYes) then
    res:=ViewForm.Resault
   else
     res:=NULL;
   ViewForm.Free;
  end;
end;
View_FVoplType_Sp:=res;
end;

constructor TFZ_Vopl_Type.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsModal);
begin
 inherited Create(ComeComponent);
Ins_ZFormStyle := ComeFormStyle;
Ins_resault    := VarArrayCreate([0,1],varVariant);
//******************************************************************************//
self.Caption                             := 'Довідник типів видів операцій'; //FZ_Vopl_Type_Caption;
self.GridColumnName.Caption              := FZ_Vopl_Filter_GridColumnName_Caption;
self.BarEditLocate.Caption               := self.GridColumnName.Caption+':';
self.InsertBtn.Caption                   := InsertBtn_Caption;
self.UpdateBtn.Caption                   := UpdateBtn_Caption;
self.DeleteBtn.Caption                   := DeleteBtn_Caption;
self.RefreshBtn.Caption                  := 'Відновити'; //RefreshBtn_Caption;
self.SelectBtn.Caption                   := SelectBtn_Caption;
self.ExitBtn.Caption                     := ExitBtn_Caption;
GridPropView1.DataController.DataSource  := DataSourceParent;
GridColumnName.DataBinding.FieldName := 'NAME_VIDOPL_TYPE';
GridColumnDays.DataBinding.FieldName := 'P_DAY';

DataSetParent.SQLs.SelectSQL.Text:='SELECT * FROM Z_SP_VIDOPL_TYPE_S';

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
   self.Position                    := poOwnerFormCenter;
  end;
 zfsChild:
  begin
   self.FormStyle         := fsMDIChild;
   self.BorderStyle       := bsSizeable;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poMainFormCenter;
  end;
 zfsNormal:
  begin
   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poOwnerFormCenter;
  end;
end;
end;


procedure TFZ_Vopl_Type.InsertBtnClick(Sender: TObject);
var InsertForm:TFVoplTypeControl;
    PKeyFieldValue:Integer;
begin
InsertForm         := TFVoplTypeControl.Create(self);
InsertForm.Caption := VoplFilterControl_Caption_Insert;
InsertForm.ShowModal;
If InsertForm.ModalResult=mrYes then
 try
  StoredProc.Database:=DataBase;
  StoredProc.Transaction:=WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='Z_SP_VIDOPL_TYPE_I';
  StoredProc.Prepare;
  StoredProc.ParamByName('NAME_VIDOPL_TYPE').AsString:=InsertForm.MaskEditFullName.Text;
  StoredProc.ParamByName('P_DAY').AsString:=InsertForm.CBoxDays.EditValue;
  StoredProc.ExecProc;
  PKeyFieldValue:=StoredProc.ParamByName('ID_VIDOPL_TYPE').AsInteger;
  WriteTransaction.Commit;
  DataSetCloseOpen(DataSetParent);
  DataSetParent.Locate('ID_VIDOPL_TYPE',PKeyFieldValue,[loCaseInsensitive]);
 except
  on E: Exception do
   begin
    MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
    WriteTransaction.Rollback;
   end;
 end;
InsertForm.Free;
end;

procedure TFZ_Vopl_Type.FormCreate(Sender: TObject);
begin
GridPropView1FocusedRecordChanged(GridPropView1,nil,GridPropView1.Controller.FocusedRecord,true);
end;

procedure TFZ_Vopl_Type.ExitBtnClick(Sender: TObject);
begin
if Ins_ZFormStyle=zfsModal then ModalResult:=mrNo
else Close;
end;

procedure TFZ_Vopl_Type.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
If FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZ_Vopl_Type.UpdateBtnClick(Sender: TObject);
var UpdateForm:TFVoplTypeControl;
begin
UpdateForm         := TFVoplTypeControl.Create(self);
UpdateForm.Caption := VoplFilterControl_Caption_Update;
UpdateForm.MaskEditFullName.Text := DataSetParent.FieldValues['NAME_VIDOPL_TYPE'];
UpdateForm.CBoxDays.EditValue:=DataSetParent.FieldValues['P_DAY'];
UpdateForm.ShowModal;
If UpdateForm.ModalResult=mrYes then
 try
  StoredProc.Database:=DataBase;
  StoredProc.Transaction:=WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='Z_SP_VIDOPL_TYPE_U';
  StoredProc.ParamByName('ID_VIDOPL_TYPE').AsInteger:=DataSetParent.FieldValues['ID_VIDOPL_TYPE'];
  StoredProc.ParamByName('NAME_VIDOPL_TYPE').AsString:=UpdateForm.MaskEditFullName.Text;
  StoredProc.ParamByName('P_DAY').AsString:=UpdateForm.CBoxDays.EditValue;
  StoredProc.ExecProc;
  WriteTransaction.Commit;
  DataSetCloseOpen(DataSetParent,'ID_VIDOPL_TYPE');
 except
  on E: Exception do
   begin
    MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
    WriteTransaction.Rollback;
   end;
 end;
UpdateForm.Free;
end;

procedure TFZ_Vopl_Type.DeleteBtnClick(Sender: TObject);
//var DeleteForm:TFVoplIniGroupControl;
begin
if MessageBox(self.Handle,PChar(deleteRecord_text),PChar(DeleteRecord_Caption),MB_YESNO+MB_ICONQUESTION)=IDYes then
 try
  StoredProc.Database:=DataBase;
  StoredProc.Transaction:=WriteTransaction;
  StoredProc.SQL.Clear;
  StoredProc.SQL.Add('EXECUTE PROCEDURE Z_SP_VIDOPL_TYPE_D '+IntToStr(DataSetParent.FieldValues['ID_VIDOPL_TYPE']));
  WriteTransaction.StartTransaction;
  StoredProc.ExecQuery;
  WriteTransaction.Commit;
  DataSetParent.CloseOpen(True);
 except
  on E: Exception do
   begin
    MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
    WriteTransaction.Rollback;
   end;
 end;
end;

procedure TFZ_Vopl_Type.SelectBtnClick(Sender: TObject);
begin
Ins_resault[0]      := DataSetParent.FieldValues['ID_VIDOPL_TYPE'];
Ins_resault[1]      := DataSetParent.FieldValues['NAME_VIDOPL_TYPE'];
ModalResult:=mrYes;
end;

procedure TFZ_Vopl_Type.RefreshBtnClick(Sender: TObject);
begin
DataSetCloseOpen(DataSetParent);
end;

procedure TFZ_Vopl_Type.ButtonsUpdate(Sender: TObject);
begin
if DataSetParent.VisibleRecordCount=0 then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  SelectBtn.Enabled := False;
 end;
end;

procedure TFZ_Vopl_Type.GridPropView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 If AFocusedRecord = nil then
  begin
   UpdateBtn.Enabled := False;
   DeleteBtn.Enabled := False;
   SelectBtn.Enabled := False;
  end
 else
  begin
   UpdateBtn.Enabled := True;
   DeleteBtn.Enabled := True;
   SelectBtn.Enabled := True;
 end;
end;

procedure TFZ_Vopl_Type.LocateNextBtnClick(Sender: TObject);
begin
 DataSetparent.LocateNext('NAME_VIDOPL_TYPE',BarEditLocate.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFZ_Vopl_Type.BarEditLocateKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
DataSetParent.Locate('NAME_VIDOPL_TYPE', BarEditLocate.CurText, [loCaseInsensitive, loPartialKey]);
BarEditLocate.Text:=BarEditLocate.CurText;
end;

procedure TFZ_Vopl_Type.BarEditLocateEnter(Sender: TObject);
begin
GridProp.SetFocus;
end;

procedure TFZ_Vopl_Type.GridPropView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
BarEditLocate.Text:=GridPropView1.Controller.IncSearchingText;
end;

end.
