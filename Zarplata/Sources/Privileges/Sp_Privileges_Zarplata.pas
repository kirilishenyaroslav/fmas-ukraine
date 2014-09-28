unit Sp_Privileges_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLookAndFeels, dxBar, dxBarExtItems,
  SpPrivilegesZarplataControl, ActnList, Ztypes, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  IBase, ZProc, Kernel, cxTextEdit, cxCalendar, Unit_ZGlobal_Consts,
  dxStatusBar, zMessages;

type
  TFZ_Sp_Privileges = class(TForm)
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridClKod: TcxGridDBColumn;
    GridClName: TcxGridDBColumn;
    GridClMin: TcxGridDBColumn;
    GridClMax: TcxGridDBColumn;
    GridClKoefficient: TcxGridDBColumn;
    GridClDateBeg: TcxGridDBColumn;
    GridClDateEnd: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    BarManager: TdxBarManager;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DSource: TDataSource;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    StatusBar: TdxStatusBar;
    DetailBtn: TdxBarLargeButton;
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
    GridClKodPriv1DF: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InsertBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure GridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ButtonsUpdate(Sender:TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DetailBtnClick(Sender: TObject);
  private
    Ins_Resault: Variant;
    Ins_ZFormStyle:TZFormStyle;
    PLanguageIndex:byte;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild);reintroduce;
    property ZFormStyle:TZFormStyle read Ins_ZFormStyle;
    property Resault:Variant read Ins_Resault;
  end;

function View_FZ_Privileges_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;stdcall;
 exports View_FZ_Privileges_Sp;

implementation

uses Math;

{$R *.dfm}

function View_FZ_Privileges_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;
var ViewForm: TFZ_Sp_Privileges;
    Res:Variant;
begin
case ComeFormStyle of
 zfsChild:
  begin
   if not IsMDIChildFormShow(TFZ_Sp_Privileges) then
      ViewForm  :=  TFZ_Sp_Privileges.Create(AOwner, DB, zfsChild);
   res :=NULL;
  end;
 zfsNormal:
  begin
   ViewForm  :=  TFZ_Sp_Privileges.Create(AOwner, DB, zfsNormal);
   ViewForm.ShowModal;
   res:=NULL;
   ViewForm.Free;
  end;
 zfsModal:
  begin
   ViewForm  :=  TFZ_Sp_Privileges.Create(AOwner, DB, zfsModal);
   ViewForm.ShowModal;
   if (ViewForm.ModalResult=mrOk) then
    res:=ViewForm.Resault
   else
     res:=NULL;
   ViewForm.Free;
  end;
end;
View_FZ_Privileges_Sp:=res;
end;

constructor TFZ_Sp_Privileges.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild);
begin
 inherited Create(ComeComponent);
 PLanguageIndex:=LanguageIndex;
 self.Caption                                 := ZSp_Privilege_Caption[PLanguageIndex];
 case ComeFormStyle of
 zfsModal:
  begin
   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.SelectBtn.Visible := ivAlways;
   self.InsertBtn.Visible := ivNever;
   self.UpdateBtn.Visible := ivNever;
   self.DeleteBtn.Visible := ivNever;
   self.DetailBtn.Visible := ivNever;
   self.Position          := poOwnerFormCenter;
   StatusBar.Panels[0].Text := SelectBtn_Hint[PLanguageIndex];
   StatusBar.Panels[1].Text := RefreshBtn_Hint[PLanguageIndex];
   StatusBar.Panels[2].Text := ExitBtn_Hint[PLanguageIndex];
   StatusBar.Panels[5].Destroy;
   StatusBar.Panels[4].Destroy;
   StatusBar.Panels[3].Destroy;
  end;
 zfsChild:
  begin
   self.FormStyle         := fsMDIChild;
   self.BorderStyle       := bsSizeable;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poMainFormCenter;
   StatusBar.Panels[0].Text := InsertBtn_Hint[PLanguageIndex];
   StatusBar.Panels[1].Text := UpdateBtn_Hint[PLanguageIndex];
   StatusBar.Panels[2].Text := DeleteBtn_Hint[PLanguageIndex];
   StatusBar.Panels[3].Text := DetailBtn_Hint[PLanguageIndex];
   StatusBar.Panels[4].Text := RefreshBtn_Hint[PLanguageIndex];
   StatusBar.Panels[5].Text := ExitBtn_Hint[PLanguageIndex];
  end;
 zfsNormal:
  begin
   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.SelectBtn.Visible := ivNever;
   self.Position          := poOwnerFormCenter;
   StatusBar.Panels[0].Text := InsertBtn_Hint[PLanguageIndex];
   StatusBar.Panels[1].Text := UpdateBtn_Hint[PLanguageIndex];
   StatusBar.Panels[2].Text := DeleteBtn_Hint[PLanguageIndex];
   StatusBar.Panels[3].Text := DetailBtn_Hint[PLanguageIndex];
   StatusBar.Panels[4].Text := RefreshBtn_Hint[PLanguageIndex];
   StatusBar.Panels[5].Text := ExitBtn_Hint[PLanguageIndex];
  end;
end;
Ins_ZFormStyle:=ComeFormStyle;
Ins_Resault := VarArrayCreate([0,7],varVariant);

DB.Handle := ComeDB;
self.InsertBtn.Caption                       := InsertBtn_Caption[PLanguageIndex];
self.UpdateBtn.Caption                       := UpdateBtn_Caption[PLanguageIndex];
self.DeleteBtn.Caption                       := DeleteBtn_Caption[PLanguageIndex];
self.DetailBtn.Caption                       := DetailBtn_Caption[PLanguageIndex];
self.RefreshBtn.Caption                      := 'Відновити'; //RefreshBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                       := SelectBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption                         := ExitBtn_Caption[PLanguageIndex];
self.GridClKod.DataBinding.FieldName         := 'KOD_PRIV';
self.GridClName.DataBinding.FieldName        := 'NAME_PRIV';
self.GridClMin.DataBinding.FieldName         := 'MIN_AMOUNT_PRIV';
self.GridClMax.DataBinding.FieldName         := 'MAX_AMOUNT_PRIV';
self.GridClKoefficient.DataBinding.FieldName := 'KOEFFICIENT_PRIV';
self.GridClDateBeg.DataBinding.FieldName     := 'DATE_BEG';
self.GridClDateEnd.DataBinding.FieldName     := 'DATE_END';
self.GridClKodPriv1DF.DataBinding.FieldName  := 'KOD_PRIV_1DF';
self.GridClKod.Caption                       := GridClKod_Caption[PLanguageIndex];
self.GridClName.Caption                      := GridClName_Caption[PLanguageIndex];
self.GridClMin.Caption                       := GridClMinAmount_Caption[PLanguageIndex];
self.GridClMax.Caption                       := GridClMaxAmount_Caption[PLanguageIndex];
self.GridClKoefficient.Caption               := GridClKoefficicent_Caption[PLanguageIndex];
self.GridClDateBeg.Caption                   := GridClBegPeriod_Caption[PLanguageIndex];
self.GridClDateEnd.Caption                   := GridClEndPeriod_Caption[PLanguageIndex];
self.GridClKodPriv1DF.Caption                := GridClKod1DF_Caption[PLanguageIndex];
GridDBTableView1.DataController.DataSource   := DSource;
DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SP_PRIVILEGES_SELECT';
DSet.Open;

FormResize(Self);
end;

procedure TFZ_Sp_Privileges.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
Action:=caFree;
end;

procedure TFZ_Sp_Privileges.InsertBtnClick(Sender: TObject);
var InsertForm:TFormSp_PrivilegesControl;
    Id_Priv:Integer;
begin
InsertForm         := TFormSp_PrivilegesControl.Create(self);
InsertForm.Caption := ZSp_Privilege_Caption_Insert[PLanguageIndex];
InsertForm.DateEnd.Date := StrToDate('31.12.2050');
InsertForm.DateEnd.Enabled:=False;
InsertForm.ShowModal;
If InsertForm.ModalResult=mrYes then
 try
  StoredProc.Database       := DB;
  StoredProc.Transaction    := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName := 'Z_SP_PRIVILEGES_INSERT';
  StoredProc.Prepare;
  StoredProc.ParamByName('KOD_PRIV').AsInteger        := StrToInt(InsertForm.KodEdit.Text);
  StoredProc.ParamByName('NAME_PRIV').AsString        := InsertForm.NameEdit.Text;
  StoredProc.ParamByName('MIN_AMOUNT_PRIV').AsInteger := StrToInt(InsertForm.MinSpinEdit.Text);
  StoredProc.ParamByName('MAX_AMOUNT_PRIV').AsInteger := StrToInt(InsertForm.MaxSpinEdit.Text);
  StoredProc.ParamByName('KOEFFICIENT_PRIV').AsFloat  := StrToFloat(InsertForm.KoefficientEdit.Text);
  StoredProc.ParamByName('DATE_BEG').AsDate           := InsertForm.DateBeg.Date;
  StoredProc.ParamByName('DATE_END').AsDate           := InsertForm.DateEnd.Date;
  StoredProc.ParamByName('KOD_PRIV_1DF').AsInteger    := StrToInt(InsertForm.MaskEditKodPriv1DF.Text);
  StoredProc.ExecProc;
  Id_Priv:=StoredProc.ParamByName('ID_PRIV').AsInteger;
  WriteTransaction.Commit;
  DSet.CloseOpen(True);
  DSet.Locate('ID_PRIV',Id_Priv,[loCaseInsensitive,loPartialKey]);
 except
  on E: Exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
    WriteTransaction.Rollback;
   end;
 end;
InsertForm.Free;
end;

procedure TFZ_Sp_Privileges.RefreshBtnClick(Sender: TObject);
begin
  DataSetCloseOpen(DSet, 'ID_PRIV');
end;

procedure TFZ_Sp_Privileges.ExitBtnClick(Sender: TObject);
begin
if Ins_ZFormStyle=zfsModal then
 ModalResult:=mrNo
else Close;
end;

procedure TFZ_Sp_Privileges.UpdateBtnClick(Sender: TObject);
var UpdateForm:TFormSp_PrivilegesControl;
    RecInfo:RECORD_INFO_STRUCTURE;
//    ResultInfo:RESULT_STRUCTURE;
begin
try
 StoredProc.Database       := DB;
 StoredProc.Transaction    := WriteTransaction;
 StoredProc.Transaction.StartTransaction;
    RecInfo.TRHANDLE       := WriteTransaction.Handle;
    RecInfo.DBHANDLE       := DB.Handle;
    RecInfo.ID_RECORD      := VarArrayOf([DSet.FieldValues['ID_PRIV']]);
    RecInfo.PK_FIELD_NAME  := VarArrayOf(['ID_PRIV']);
    RecInfo.TABLE_NAME     := 'Z_SP_PRIVILEGES';
    RecInfo.RAISE_FLAG     := True;
    LockRecord(@RecInfo);
 UpdateForm                        := TFormSp_PrivilegesControl.Create(self);
 UpdateForm.Caption                := ZSp_Privilege_Caption_Update[PLanguageIndex];
 UpdateForm.KodEdit.Text           := IntToStr(DSet.FieldValues['KOD_PRIV']);
 UpdateForm.NameEdit.Text          := DSet.FieldValues['NAME_PRIV'];
 UpdateForm.KoefficientEdit.Text   := DSet.FieldValues['KOEFFICIENT_PRIV'];
 UpdateForm.MinSpinEdit.Value      := DSet.FieldValues['MIN_AMOUNT_PRIV'];
 UpdateForm.MaxSpinEdit.Value      := DSet.FieldValues['MAX_AMOUNT_PRIV'];
 UpdateForm.DateBeg.Date           := DSet.FieldValues['DATE_BEG'];
 UpdateForm.DateEnd.Date           := DSet.FieldValues['DATE_END'];
 UpdateForm.MaskEditKodPriv1DF.Text:= IntToStr(DSet.FieldValues['KOD_PRIV_1DF']);
 UpdateForm.DateEnd.Enabled        := False;
 UpdateForm.ShowModal;
 If UpdateForm.ModalResult=mrYes then
  begin
   StoredProc.Database       := DB;
   StoredProc.Transaction    := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName                           := 'Z_SP_PRIVILEGES_UPDATE';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_PRIV').AsInteger         := DSet.FieldValues['ID_PRIV'];
   StoredProc.ParamByName('KOD_PRIV').AsInteger        := StrToInt(UpdateForm.KodEdit.Text);
   StoredProc.ParamByName('NAME_PRIV').AsString        := UpdateForm.NameEdit.Text;
   StoredProc.ParamByName('MIN_AMOUNT_PRIV').AsInteger := StrToInt(UpdateForm.MinSpinEdit.Text);
   StoredProc.ParamByName('MAX_AMOUNT_PRIV').AsInteger := StrToInt(UpdateForm.MaxSpinEdit.Text);
   StoredProc.ParamByName('KOEFFICIENT_PRIV').AsFloat  := StrToFloat(UpdateForm.KoefficientEdit.Text);
   StoredProc.ParamByName('DATE_BEG').AsDate           := UpdateForm.DateBeg.Date;
   StoredProc.ParamByName('DATE_END').AsDate           := UpdateForm.DateEnd.Date;
   StoredProc.ParamByName('KOD_PRIV_1DF').AsInteger    := StrToInt(UpdateForm.MaskEditKodPriv1DF.Text);
   StoredProc.ExecProc;
  end;
 WriteTransaction.Commit;
 If UpdateForm.ModalResult=mrYes then DataSetCloseOpen(DSet,'ID_PRIV');
 UpdateForm.Free;
except
 on E: Exception do
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
   WriteTransaction.Rollback;
  end;
end;
end;

procedure TFZ_Sp_Privileges.DeleteBtnClick(Sender: TObject);
var CloseRecordForm:TFormSp_PrivilegesControl;
begin
CloseRecordForm                            := TFormSp_PrivilegesControl.Create(self);
CloseRecordForm.Caption                    := ZSp_Privilege_Caption_Delete[PLanguageIndex];
CloseRecordForm.KodEdit.Text               := IntToStr(DSet.FieldValues['KOD_PRIV']);
CloseRecordForm.NameEdit.Text              := DSet.FieldValues['NAME_PRIV'];
CloseRecordForm.KoefficientEdit.Text       := DSet.FieldValues['KOEFFICIENT_PRIV'];
CloseRecordForm.MinSpinEdit.Value          := DSet.FieldValues['MIN_AMOUNT_PRIV'];
CloseRecordForm.MaxSpinEdit.Value          := DSet.FieldValues['MAX_AMOUNT_PRIV'];
CloseRecordForm.DateBeg.Date               := DSet.FieldValues['DATE_BEG'];
CloseRecordForm.DateEnd.Date               := DSet.FieldValues['DATE_END'];
CloseRecordForm.MaskEditKodPriv1DF.Text    := IntToStr(DSet.FieldValues['KOD_PRIV_1DF']);
CloseRecordForm.MaskEditKodPriv1DF.Enabled := False;
CloseRecordForm.KodEdit.Enabled            := False;
CloseRecordForm.NameEdit.Enabled           := False;
CloseRecordForm.KoefficientEdit.Enabled    := False;
CloseRecordForm.MinSpinEdit.Enabled        := False;
CloseRecordForm.MaxSpinEdit.Enabled        := False;
CloseRecordForm.DateBeg.Enabled            := False;
CloseRecordForm.ShowModal;
If CloseRecordForm.ModalResult=mrYes then
 try
  StoredProc.Database       := DB;
  StoredProc.Transaction    := WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName                           := 'Z_SP_PRIVILEGES_CLOSERECORD';
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_PRIV').AsInteger         := DSet.FieldValues['ID_PRIV'];
  StoredProc.ParamByName('DATE_END').AsDate           := CloseRecordForm.DateEnd.Date;
  StoredProc.ExecProc;
  WriteTransaction.Commit;
  DataSetCloseOpen(DSet);
 except
  on E: Exception do
   begin
    ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
    WriteTransaction.Rollback;
   end;
 end;
CloseRecordForm.Free;
end;

procedure TFZ_Sp_Privileges.SelectBtnClick(Sender: TObject);
begin
Ins_Resault[0] := DSet['ID_PRIV'];
Ins_Resault[1] := DSet['NAME_PRIV'];
Ins_Resault[2] := DSet['MIN_AMOUNT_PRIV'];
Ins_Resault[3] := DSet['MAX_AMOUNT_PRIV'];
Ins_Resault[4] := DSet['DATE_BEG'];
Ins_Resault[5] := DSet['DATE_END'];
Ins_Resault[6] := DSet['KOD_PRIV'];
Ins_Resault[7] := DSet['KOD_PRIV_1DF'];
self.ModalResult:=mrOk;
end;

procedure TFZ_Sp_Privileges.GridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
if (AViewInfo.GridRecord.Values[6]<Date) and (AviewInfo.GridRecord.Focused=False) then
  begin
   ACanvas.Font.Style := [fsStrikeOut];
   ACanvas.Brush.Color := clSilver; //$00E2EFF1;//$0047D5FE;
  end;
end;

procedure TFZ_Sp_Privileges.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
If AFocusedRecord<>nil then
 If AFocusedRecord.Values[6]<Date then
  begin
   UpdateBtn.Enabled:=False;
   DeleteBtn.Enabled:=False;
  end
 else
  begin
   UpdateBtn.Enabled:=True;
   DeleteBtn.Enabled:=True;
  end
else
  begin
   UpdateBtn.Enabled:=False;
   DeleteBtn.Enabled:=False;
  end;
end;

procedure TFZ_Sp_Privileges.ButtonsUpdate(Sender: Tobject);
begin
 if DSet.VisibleRecordCount=0 then
  begin
   UpdateBtn.Enabled:=False;
   DeleteBtn.Enabled:=False;
  end
 else
  begin
   UpdateBtn.Enabled:=True;
   DeleteBtn.Enabled:=True;
  end;
end;

procedure TFZ_Sp_Privileges.FormCreate(Sender: TObject);
begin
ButtonsUpdate(Sender);
GridDBTableView1FocusedRecordChanged(GridDBTableView1,GridDBTableView1.Controller.FocusedRecord,
                                     GridDBTableView1.Controller.FocusedRecord,false);
end;

procedure TFZ_Sp_Privileges.GridDBTableView1DblClick(Sender: TObject);
begin
if (SelectBtn.Visible = ivAlways) and
   (SelectBtn.Enabled) and (GridDBTableView1.Controller.FocusedRecord<>nil) then
 SelectBtnClick(sender);
end;

procedure TFZ_Sp_Privileges.FormResize(Sender: TObject);
var i:byte;
begin
if StatusBar.Panels.Count=0 then Exit;
 for i:=0 to StatusBar.Panels.Count-1 do
  StatusBar.Panels[i].Width := StatusBar.Width div StatusBar.Panels.Count;
end;

procedure TFZ_Sp_Privileges.DetailBtnClick(Sender: TObject);
var ViewForm:TFormSp_PrivilegesControl;
begin
ViewForm                           := TFormSp_PrivilegesControl.Create(self);
ViewForm.Caption                   := ZSp_Privilege_Caption_Detail[PLanguageIndex];
ViewForm.KodEdit.Text              := IntToStr(DSet.FieldValues['KOD_PRIV']);
ViewForm.NameEdit.Text             := DSet.FieldValues['NAME_PRIV'];
ViewForm.KoefficientEdit.Text      := DSet.FieldValues['KOEFFICIENT_PRIV'];
ViewForm.MinSpinEdit.Value         := DSet.FieldValues['MIN_AMOUNT_PRIV'];
ViewForm.MaxSpinEdit.Value         := DSet.FieldValues['MAX_AMOUNT_PRIV'];
ViewForm.DateBeg.Date              := DSet.FieldValues['DATE_BEG'];
ViewForm.DateEnd.Date              := DSet.FieldValues['DATE_END'];
ViewForm.MaskEditKodPriv1DF.Text   := IntToStr(DSet.FieldValues['KOD_PRIV_1DF']);
ViewForm.IdentificationBox.Enabled := False;
ViewForm.OptionsBox.Enabled        := False;
ViewForm.PeriodBox.Enabled         := False;
ViewForm.YesBtn.Visible            := False;
ViewForm.CancelBtn.Caption         := CancelBtn_Caption[PLanguageIndex];
ViewForm.ShowModal;
ViewForm.Free;
end;

end.
