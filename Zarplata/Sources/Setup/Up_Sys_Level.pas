unit Up_Sys_Level;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, dxBarExtItems,
  dxBar, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ibase, ZProc,
  Unit_ZGlobal_Consts;

type
  TZFUpSysLevel = class(TForm)
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
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
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    GridDBTableView1DBLevelName: TcxGridDBColumn;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    procedure SelectBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
  private
    PlanguageIndex:byte;
  public
    Result:Variant;
    constructor Create(AOwner:TComponent;DB:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}
const
  ZFUPSysLevel_Caption                  :array[1..2] of string = ('Рівень','Уровень');
  LevelName_Caption                     :array[1..2] of string = ('Рівень','Уровень');

constructor TZFUpSysLevel.Create(AOwner:TComponent;DB:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PlanguageIndex:=LanguageIndex;

  Database.Handle          :=DB;
  DataSet.SelectSQL.Text   :='SELECT * FROM UP_SYS_LEVEL';
  Database.Open;
  DataSet.Open;
//******************************************************************************
  self.Caption                           := ZFUPSysLevel_Caption[PlanguageIndex];
  RefreshBtn.Caption                     := RefreshBtn_Caption[PlanguageIndex];
  SelectBtn.Caption                      := SelectBtn_Caption[PlanguageIndex];
  ExitBtn.Caption                        := ExitBtn_Caption[PlanguageIndex];
  GridDBTableView1DBLevelName.Caption    := LevelName_Caption[PlanguageIndex];
end;

procedure TZFUpSysLevel.SelectBtnClick(Sender: TObject);
begin
  Result:= VarArrayCreate([0,1],varVariant);
  Result[0]:=DataSet.FieldValues['ID_LEVEL'];
  Result[1]:=DataSet.FieldValues['LEVEL_NAME'];
  ModalResult:=mrYes;
end;

procedure TZFUpSysLevel.ExitBtnClick(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

procedure TZFUpSysLevel.RefreshBtnClick(Sender: TObject);
begin
  DataSet.FullRefresh;
end;

end.
