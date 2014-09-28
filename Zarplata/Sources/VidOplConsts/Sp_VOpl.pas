unit Sp_VOpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxGridTableView, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ibase,
  Zproc, Unit_ZGlobal_Consts;

type
  TFZSpVOpl = class(TForm)
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    GridDBTableView1DBIDVIDOPL: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
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
    RTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    DB: TpFIBDatabase;
    procedure SelectBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    PLanguageIndex:byte;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
  end;

function View_FZ_VOpl_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;stdcall;

implementation
var
  Ins_Result: variant;

{$R *.dfm}
function View_FZ_VOpl_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE):variant;
var ViewVOpl: TFZSpVOpl;
begin
   ViewVOpl:=TFZSpVOpl.Create(AOwner, DB);
   ViewVOpl.ShowModal;
   ViewVOpl.Free;
   Result:=Ins_Result;
end;

constructor TFZSpVOpl.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);
begin
 inherited Create(ComeComponent);
 PLanguageIndex:=LanguageIndex;
// self.Caption       := [PLanguageIndex];

   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.Position          := poOwnerFormCenter;

self.RefreshBtn.Caption                      := RefreshBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                       := SelectBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption                         := ExitBtn_Caption[PLanguageIndex];

DB.Handle := ComeDB;
DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM SP_VIDOPL';
DataSet.Open;
end;

procedure TFZSpVOpl.SelectBtnClick(Sender: TObject);
begin
Ins_Result:=DataSet['ID_VIDOPL'];
self.ModalResult:=mrOk;
end;

procedure TFZSpVOpl.RefreshBtnClick(Sender: TObject);
begin
  DataSetCloseOpen(DataSet, 'ID_VIDOPL');
end;

procedure TFZSpVOpl.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
