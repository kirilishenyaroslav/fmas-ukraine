unit Sp_Viplat_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems, ZProc,
  Unit_SpViplat_Consts, SpViplataZarplataControl, IBase,
  ActnList, ZTypes, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Kernel;

type
  TFZSpr_Viplat = class(TForm)
    BarManager: TdxBarManager;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    ColumnShortName: TcxGridDBColumn;
    ColumnFullName: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    DataSource: TDataSource;
    DataBase: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    Styles: TcxStyleRepository;
    ReadTransaction: TpFIBTransaction;
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
    GridDBTableView1DBColumn1: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsertBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure ButtonsUpdate(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridDblClick(Sender: TObject);
  private
    Ins_Resault:Variant;
    Ins_ZFormStyle:TZFormStyle;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild);reintroduce;
    property Resault:variant read Ins_Resault;
    property ZFormStyle:TZFormStyle read Ins_ZFormStyle;
  end;

function View_FZ_Viplat_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
 exports View_FZ_Viplat_Sp;

implementation

{$R *.dfm}

function View_FZ_Viplat_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;
var ViewForm: TFZSpr_Viplat;
    Res:Variant;
begin
case ComeFormStyle of
 zfsChild:
  begin
   if not IsMDIChildFormShow(TFZSpr_Viplat) then
    ViewForm  :=  TFZSpr_Viplat.Create(AOwner, DB, zfsChild);
   res :=NULL;
  end;
 zfsNormal:
  begin
   ViewForm  :=  TFZSpr_Viplat.Create(AOwner, DB, zfsNormal);
   ViewForm.ShowModal;
   res:=NULL;
   ViewForm.Free;
  end;
 zfsModal:
  begin
   ViewForm  :=  TFZSpr_Viplat.Create(AOwner, DB, zfsModal);
   ViewForm.ShowModal;
   if (ViewForm.ModalResult=mrYes) then
    res:=ViewForm.Resault
   else
     res:=NULL;
   ViewForm.Free;
  end;
end;
View_FZ_Viplat_Sp:=res;
end;


constructor TFZSpr_Viplat.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild);
begin
 inherited Create(ComeComponent);
self.Caption                                 := FZSp_Viplat_Caption;
case ComeFormStyle of
 zfsModal:
  begin
   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.SelectBtn.Visible := ivAlways;
   self.Position          := poOwnerFormCenter;
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
Ins_ZFormStyle:=ComeFormStyle;
//******************************************************************************
self.ColumnShortName.Caption                 := FZSp_Viplat_ColumnShortName_Caption;
self.ColumnFullName.Caption                  := FZSp_Viplat_ColumnFullName_Caption;
self.InsertBtn.Caption                       := InsertBtn_Caption;
self.UpdateBtn.Caption                       := UpdateBtn_Caption;
self.DeleteBtn.Caption                       := DeleteBtn_Caption;
self.RefreshBtn.Caption                      := 'Відновити'; //RefreshBtn_Caption;
self.SelectBtn.Caption                       := SelectBtn_Caption;
self.ExitBtn.Caption                         := ExitBtn_Caption;
self.BarManager.BarByName('ButtonsControlBar').Caption:=ButtonsControlBar_caption;
ColumnFullName.DataBinding.FieldName         := 'FULL_NAME_TYPE_PAYMENT';
ColumnShortName.DataBinding.FieldName        := 'SHORT_NAME_TYPE_PAYMENT';
//******************************************************************************
GridDBTableView1.DataController.DataSource   := DataSource;
Ins_Resault := VarArrayCreate([0,2],varVariant);
//******************************************************************************
DataSet.SQLs.SelectSQL.Text:='SELECT * FROM Z_SP_TYPE_PAYMENT_SELECT';
DataBase.Handle := ComeDB;
DataSet.Open;
if DataSet.VisibleRecordCount=0 then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  SelectBtn.Enabled := False;
 end;
end;

procedure TFZSpr_Viplat.ExitBtnClick(Sender: TObject);
begin
if self.ZFormStyle=zfsModal then
 self.ModalResult:=mrNo
else self.Close;
end;

procedure TFZSpr_Viplat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
if self.FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZSpr_Viplat.InsertBtnClick(Sender: TObject);
var InsertForm:TFormZSpr_Viplata_Control;
    Id_Type_Payment:Integer;
begin
InsertForm         := TFormZSpr_Viplata_Control.Create(self,DataBase.Handle, ReadTransaction);
InsertForm.Caption := FormZSp_Viplata_Control_InsertCaption;
InsertForm.ShowModal;
If InsertForm.ModalResult=mrYes then
 try
   StoredProc.Database                                         := DataBase;
   StoredProc.Transaction                                      := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName                                   := 'Z_SP_TYPE_PAYMENT_INSERT';
   StoredProc.Prepare;
   StoredProc.ParamByName('SHORT_NAME_TYPE_PAYMENT').AsString  := InsertForm.MaskEditShortName.Text;
   StoredProc.ParamByName('FULL_NAME_TYPE_PAYMENT').AsString   := InsertForm.MaskEditFullName.Text;
   StoredProc.ParamByName('id_rate_account').AsInt64           := InsertForm.id_rate_account;
   StoredProc.ExecProc;
   Id_Type_Payment                                             := StoredProc.ParamByName('ID_TYPE_PAYMENT').AsInteger;
   StoredProc.Transaction.Commit;
   DataSet.CloseOpen(True);
   DataSet.Locate('ID_TYPE_PAYMENT',Id_Type_Payment,[loCaseInsensitive,loPartialKey]);
 except
  on E: Exception do
   begin
    MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
    StoredProc.Transaction.Rollback;
   end;
 end;
InsertForm.Free;
end;

procedure TFZSpr_Viplat.DeleteBtnClick(Sender: TObject);
begin
If MessageBox(self.Handle,PChar(DeleteRecord_Text),PChar(DeleteRecord_Caption),MB_YESNO+MB_ICONQUESTION) = mrYes then
 try
   StoredProc.Database                                         := DataBase;
   StoredProc.Transaction                                      := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName                                   := 'Z_SP_TYPE_PAYMENT_DELETE';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_TYPE_PAYMENT').AsInteger         := DataSet.FieldValues['ID_TYPE_PAYMENT'];
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   DataSetCloseOpen(DataSet);
 except
  on E: Exception do
   begin
    MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
    StoredProc.Transaction.Rollback;
   end;
  end;
end;

procedure TFZSpr_Viplat.UpdateBtnClick(Sender: TObject);
var UpdateForm:TFormZSpr_Viplata_Control;
    RecInfo:RECORD_INFO_STRUCTURE;
//    ResultInfo:RESULT_STRUCTURE;
begin
if DataSet.RecordCount>0
then begin
          UpdateForm                        := TFormZSpr_Viplata_Control.Create(self, DataBase.Handle,ReadTransaction);
          UpdateForm.id_rate_account         :=TFIBBCDField(DataSet.FieldByName('id_rate_account')).asInt64;
          UpdateForm.cxButtonEdit1.Text      :=DataSet.FieldByName('rate_acc_info').AsString;
          try
           StoredProc.Database                                         := DataBase;
           StoredProc.Transaction                                      := WriteTransaction;
           StoredProc.Transaction.StartTransaction;
              RecInfo.TRHANDLE       :=WriteTransaction.Handle;
              RecInfo.DBHANDLE       :=Database.Handle;
              RecInfo.ID_RECORD      :=VarArrayOf([DataSet.FieldValues['ID_TYPE_PAYMENT']]);
              RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_TYPE_PAYMENT']);
              RecInfo.TABLE_NAME     :='Z_SP_TYPE_PAYMENT';
              RecInfo.RAISE_FLAG     :=True;
              LockRecord(@RecInfo);
           UpdateForm.Caption                := FormZSp_Viplata_Control_UpdateCaption;
           UpdateForm.MaskEditShortName.Text := DataSet.FieldValues['SHORT_NAME_TYPE_PAYMENT'];
           UpdateForm.MaskEditFullName.Text  := DataSet.FieldValues['FULL_NAME_TYPE_PAYMENT'];
           UpdateForm.ShowModal;
           If UpdateForm.ModalResult=mrYes then
            begin
             StoredProc.StoredProcName                                   := 'Z_SP_TYPE_PAYMENT_UPDATE';
             StoredProc.Prepare;
             StoredProc.ParamByName('ID_TYPE_PAYMENT').AsInteger         := DataSet.FieldValues['ID_TYPE_PAYMENT'];
             StoredProc.ParamByName('SHORT_NAME_TYPE_PAYMENT').AsString  := UpdateForm.MaskEditShortName.Text;
             StoredProc.ParamByName('FULL_NAME_TYPE_PAYMENT').AsString   := UpdateForm.MaskEditFullName.Text;
             StoredProc.ParamByName('id_rate_account').AsInt64           := UpdateForm.id_rate_account;
             StoredProc.ExecProc;
           end;
          StoredProc.Transaction.Commit;
           If UpdateForm.ModalResult=mrYes then DataSetCloseOpen(DataSet, 'ID_TYPE_PAYMENT');
          except
           on E: Exception do
            begin
             MessageBox(self.Handle,PChar(E.Message),PChar(Error_caption),MB_OK+MB_ICONERROR);
             StoredProc.Transaction.Rollback;
            end;
        end;
        UpdateForm.Free;
end;
end;

procedure TFZSpr_Viplat.RefreshBtnClick(Sender: TObject);
begin
DataSetCloseOpen(DataSet);
end;

procedure TFZSpr_Viplat.SelectBtnClick(Sender: TObject);
begin
  Ins_Resault[0]  := DataSet.FieldValues['ID_TYPE_PAYMENT'];
  Ins_Resault[1]  := DataSet.FieldValues['FULL_NAME_TYPE_PAYMENT'];
  Ins_Resault[2]  := DataSet.FieldValues['SHORT_NAME_TYPE_PAYMENT'];
  self.ModalResult:=mrYes;
end;

procedure TFZSpr_Viplat.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
If AFocusedRecord=nil then
  begin
   UpdateBtn.Enabled:=False;
   DeleteBtn.Enabled:=False;
   SelectBtn.Enabled:=False;
  end
else
 begin
   UpdateBtn.Enabled:=True;
   DeleteBtn.Enabled:=True;
   SelectBtn.Enabled:=True;
 end;
end;

procedure TFZSpr_Viplat.ButtonsUpdate(Sender: TObject);
begin
if DataSet.VisibleRecordCount=0 then
 begin
  UpdateBtn.Enabled := False;
  DeleteBtn.Enabled := False;
  SelectBtn.Enabled := False;
 end;
end;

procedure TFZSpr_Viplat.GridDblClick(Sender: TObject);
begin
if (SelectBtn.Enabled) and (SelectBtn.Visible=ivAlways) then SelectBtnClick(Sender);
end;

end.
