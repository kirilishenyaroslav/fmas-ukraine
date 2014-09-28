unit SpReeVedUVControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, IBase,
  Unit_ZGlobal_Consts, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxBar, dxBarExtItems, cxTextEdit, ZProc, Dates;

type
  TFUV_ReeVed_Control = class(TForm)
    GridSch: TcxGrid;
    GridSchView1: TcxGridDBTableView;
    GrColAddReeVedFullNameSch: TcxGridDBColumn;
    GridSchLevel1: TcxGridLevel;
    GrColAddReeVedSumma: TcxGridDBColumn;
    GrColAddReeVedFullNumberSch: TcxGridDBColumn;
    GrColAddReeVedViplata: TcxGridDBColumn;
    DataBase: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    DefaultTransaction: TpFIBTransaction;
    DataSource: TDataSource;
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
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    GrColAddReeKodSetup: TcxGridDBColumn;
    procedure GridSchView1KeyPress(Sender: TObject; var Key: Char);
    procedure GridSchView1DblClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure GridSchView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GrColAddReeKodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
  private
    Ins_Id_Sch:LongWord;
    TypeForm:byte;
    PLanguageIndex:byte;
  public
    constructor Create(ComeComponent:TComponent;DB:TISC_DB_HANDLE;ComeTypeForm:byte;system:Boolean);reintroduce;
    property DSet: TpFIBDataSet read DataSet;
  end;


implementation

{$R *.dfm}

constructor TFUV_ReeVed_Control.Create(ComeComponent:TComponent;DB:TISC_DB_HANDLE;ComeTypeForm:byte;system:boolean);
begin
  inherited Create(ComeComponent);
  PLanguageIndex:=LanguageIndex;
  TypeForm:=ComeTypeForm;

  Caption                                           := ReeVed_Control_Caption[PLanguageIndex];

  GrColAddReeVedFullNameSch.Caption                 := GridClFullNameSch_Caption[PLanguageIndex];
  GrColAddReeVedSumma.Caption                       := GridClSumma_Caption[PLanguageIndex];
  GrColAddReeVedFullNumberSch.Caption               := GridClFullNumberSch_Caption[PLanguageIndex];
  GrColAddReeVedViplata.Caption                     := GridClViplata_Caption[PLanguageIndex];
  GrColAddReeKodSetup.Caption                       := GridClKodSetup_Caption[PLanguageIndex];

  RefreshBtn.Caption                                := RefreshBtn_Caption[PLanguageIndex];
  SelectBtn.Caption                                 := SelectBtn_Caption[PLanguageIndex];
  ExitBtn.Caption                                   := ExitBtn_Caption[PLanguageIndex];

  GrColAddReeVedFullNameSch.DataBinding.FieldName   := 'FULL_NAME_SCH';
  GrColAddReeVedFullNumberSch.DataBinding.FieldName := 'FULL_NUMBER_SCH';
  GrColAddReeVedSumma.DataBinding.FieldName         := 'SUMMA';
  GrColAddReeVedViplata.DataBinding.FieldName       := 'NAME_VIPLATA';
  GrColAddReeKodSetup.DataBinding.FieldName         := 'KOD_SETUP';

  GrColAddReeVedViplata.Visible                     :=  not(NumPredpr(DB) = 2);

  DataBase.Handle                                   := DB;

  if system
  then DataSet.SQLs.SelectSQL.Text                  := 'SELECT * FROM UV_GRSHEET_SELECTSCH(1000)'
  else DataSet.SQLs.SelectSQL.Text                  := 'SELECT * FROM UV_GRSHEET_SELECTSCH(999)';
  DataSet.Open;

  GridSchView1.ViewData.Expand(true);
end;

procedure TFUV_ReeVed_Control.GridSchView1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
 begin
   Ins_Id_Sch:=DataSet.FieldValues['ID_SCH'];
   ModalResult:=mrYes;
 end;
end;

procedure TFUV_ReeVed_Control.GridSchView1DblClick(Sender: TObject);
begin
if (SelectBtn.Enabled) and (SelectBtn.Visible=ivAlways) then SelectBtnClick(Sender);
end;

procedure TFUV_ReeVed_Control.ExitBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFUV_ReeVed_Control.SelectBtnClick(Sender: TObject);
begin
 Ins_Id_Sch:=DataSet.FieldValues['ID_SCH'];
 ModalResult:=mrYes;
end;

procedure TFUV_ReeVed_Control.GridSchView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
SelectBtn.Enabled:=not(AFocusedRecord=nil);
end;

procedure TFUV_ReeVed_Control.FormCreate(Sender: TObject);
begin
GridSchView1FocusedRecordChanged(GridSchView1,nil,GridSchView1.Controller.FocusedRecord,True);
end;

procedure TFUV_ReeVed_Control.GrColAddReeKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText<>'' then AText:=KodSetupToPeriod(strToInt(AText),1);
end;

end.
