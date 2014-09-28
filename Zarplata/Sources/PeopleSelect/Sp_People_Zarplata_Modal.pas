unit Sp_People_Zarplata_Modal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, Unit_Sp_People_Modal_Consts,
  ComCtrls, ToolWin, FIBDatabase,ZProc,
  pFIBDatabase, FIBDataSet, pFIBDataSet, IBase, dxBar, dxBarExtItems;

type
  TFZ_Sp_People_Modal = class(TForm)
    DSource: TDataSource;
    DataBase: TpFIBDatabase;
    DSet: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
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
    BarManager: TdxBarManager;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridColumnTin: TcxGridDBColumn;
    GridColumnFamiliya: TcxGridDBColumn;
    GridColumnImya: TcxGridDBColumn;
    gridColumnOtchestvo: TcxGridDBColumn;
    GridColumnBirthday: TcxGridDBColumn;
    GridColumnSex: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridColumnTn: TcxGridDBColumn;
    procedure GridDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GridColumnSexGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
  private
    Ins_Resault:Variant;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
    property Resault: Variant read Ins_Resault;
  end;

function View_FZ_PeopleModal_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant; stdcall;
 exports  View_FZ_PeopleModal_Sp;

implementation

{$R *.dfm}

function View_FZ_PeopleModal_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm:TFZ_Sp_People_Modal;
    res:Variant;
begin
ViewForm  :=  TFZ_Sp_People_Modal.Create(AOwner,DB);
ViewForm.ShowModal;
if ViewForm.ModalResult = mrYes then
  res := ViewForm.Resault
else
  res := NULL;
ViewForm.Free;
View_FZ_PeopleModal_Sp:=res;
end;

constructor TFZ_Sp_People_Modal.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);
begin
inherited Create(ComeComponent);
DataBase.Handle := ComeDB;
Ins_Resault     := VarArrayCreate([0,4],varVariant);
//******************************************************************************
InsertBtn.Caption  := InsertBtn_Caption;
UpdateBtn.Caption  := UpdateBtn_Caption;
DeleteBtn.Caption  := DeleteBtn_Caption;
SelectBtn.Caption  := SelectBtn_Caption;
RefreshBtn.Caption := RefreshBtn_Caption;
ExitBtn.Caption    := ExitBtn_Caption;

GridColumnTin.DataBinding.FieldName:=FZ_Sp_People_Modal_DSet_Field_TIN_Name;
GridColumnFamiliya.DataBinding.FieldName:=FZ_Sp_People_Modal_DSet_Field_FAMILIYA_Name;
GridColumnImya.DataBinding.FieldName:=FZ_Sp_People_Modal_DSet_Field_IMYA_Name;
gridColumnOtchestvo.DataBinding.FieldName:=FZ_Sp_People_Modal_DSet_Field_OTCHESTVO_Name;
GridColumnBirthday.DataBinding.FieldName:=FZ_Sp_People_Modal_DSet_Field_BIRTH_DATE_Name;
GridColumnSex.DataBinding.FieldName:=FZ_Sp_People_Modal_DSet_Field_ID_SEX_Name;
GridColumnTn.DataBinding.FieldName:=FZ_Sp_People_Modal_DSet_Field_Tn_Name;
//******************************************************************************
self.Caption := FZ_Sp_People_Modal_Caption;
GridColumnTin.Caption:=FZ_Sp_People_Modal_ColumnTin_Caption;
GridColumnFamiliya.Caption:=FZ_Sp_People_Modal_ColumnFamiliya_Caption;
GridColumnImya.Caption := FZ_Sp_People_Modal_ColumnImya_Caption;
gridColumnOtchestvo.Caption := FZ_Sp_People_Modal_ColimnOtchestvo_Caption;
GridColumnBirthday.Caption := FZ_Sp_People_Modal_ColumnBirthDay_Caption;
GridColumnSex.Caption := FZ_Sp_People_Modal_ColumnSex_Caption;
GridColumnTn.Caption := FZ_Sp_People_Modal_ColumnTn_Caption;
//******************************************************************************
GridDBTableView1.DataController.DataSource:=DSource;
DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_SP_PEOPLE_SELECT';
DSet.Open;
end;

procedure TFZ_Sp_People_Modal.GridDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
  SelectBtnClick(Sender);
if key=#27 then
  ModalResult:=mrNo;
end;

procedure TFZ_Sp_People_Modal.GridDBTableView1DblClick(Sender: TObject);
begin
  SelectBtnClick(Sender);
end;

procedure TFZ_Sp_People_Modal.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZ_Sp_People_Modal.SelectBtnClick(Sender: TObject);
begin
  Ins_Resault[0] := DSet.FieldValues[FZ_Sp_People_Modal_DSet_Field_ID_MAN_Name];
  Ins_Resault[1] := DSet.FieldValues[FZ_Sp_People_Modal_DSet_Field_FAMILIYA_Name];
  Ins_Resault[2] := DSet.FieldValues[FZ_Sp_People_Modal_DSet_Field_IMYA_Name];
  Ins_Resault[3] := DSet.FieldValues[FZ_Sp_People_Modal_DSet_Field_OTCHESTVO_Name];
  Ins_Resault[4] := DSet.FieldValues[FZ_Sp_People_Modal_DSet_Field_Tn_Name];
  ModalResult:=mrYes;
end;

procedure TFZ_Sp_People_Modal.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
If AFocusedRecord = nil then
 SelectBtn.Enabled := False
else SelectBtn.Enabled := True;
end;

procedure TFZ_Sp_People_Modal.RefreshBtnClick(Sender: TObject);
begin
DataSetCloseOpen(DSet,'ID_MAN');
end;

procedure TFZ_Sp_People_Modal.GridColumnSexGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='1' then
 AText:=FZ_Sp_People_Modal_ColumnSex_Man_Text;
if AText='2' then
 AText:=FZ_Sp_People_Modal_ColumnSex_Woman_Text;
end;

end.
