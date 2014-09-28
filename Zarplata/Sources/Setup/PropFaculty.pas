unit PropFaculty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, dxBar,
  dxBarExtItems, cxClasses, cxStyles, cxGridTableView, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, ibase, ZProc, Unit_ZGlobal_Consts;

type
  TZFPropFaculty = class(TForm)
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
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    GridDBTableView1DBNameProperty: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
  private
    PlanguageIndex:byte;
  public
    Result:variant;
    constructor Create(AOwner:TComponent;DB:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}
const
  ZFPropFaculty_Caption                 :array[1..2] of string = ('Властивості факультетів','Свойства факультетов');
  NameProperty_Caption                  :array[1..2] of string = ('Властивість','Свойство');

constructor TZFPropFaculty.Create(AOwner:TComponent;DB:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PlanguageIndex:=LanguageIndex;

  Database.Handle          :=DB;
  DataSet.SelectSQL.Text   :='SELECT * FROM SP_DEP_PROP';
  Database.Open;
  DataSet.Open;
//******************************************************************************
  self.Caption                           := ZFPropFaculty_Caption[PlanguageIndex];
  RefreshBtn.Caption                     := RefreshBtn_Caption[PlanguageIndex];
  SelectBtn.Caption                      := SelectBtn_Caption[PlanguageIndex];
  ExitBtn.Caption                        := ExitBtn_Caption[PlanguageIndex];
  GridDBTableView1DBNameProperty.Caption := NameProperty_Caption[PlanguageIndex];
end;

procedure TZFPropFaculty.ExitBtnClick(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

procedure TZFPropFaculty.RefreshBtnClick(Sender: TObject);
begin
  DataSet.FullRefresh;
end;

procedure TZFPropFaculty.SelectBtnClick(Sender: TObject);
begin
  Result:= VarArrayCreate([0,1], varVariant);
  Result[0]:=DataSet['ID_PROPERTY'];
  Result[1]:=DataSet['NAME_PROPERTY'];
  ModalResult:=mrYes;
end;

end.
