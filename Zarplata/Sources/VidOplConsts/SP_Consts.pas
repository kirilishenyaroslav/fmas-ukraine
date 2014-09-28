unit SP_Consts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, dxBar, dxBarExtItems, cxClasses,
  ibase, Zproc, Unit_ZGlobal_Consts, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase;

type
  TFZSpConsts = class(TForm)
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
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    GridDBTableView1DBIDCONST: TcxGridDBColumn;
    GridDBTableView1DBNAMESHORT: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    Grid1DBTableView1DBNAMEFULL: TcxGridDBColumn;
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    procedure SelectBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    PLanguageIndex:byte;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
  end;

function View_FZ_Consts_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;

implementation
var
  Ins_Result: Variant;

{$R *.dfm}
function View_FZ_Consts_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;
var ViewForm: TFZSpConsts;
begin
   ViewForm  :=  TFZSpConsts.Create(AOwner, DB);
   ViewForm.ShowModal;
   ViewForm.Free;
   Result:=Ins_Result;
end;

constructor TFZSpConsts.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE);
begin
 inherited Create(ComeComponent);
 PLanguageIndex:=LanguageIndex;
// self.Cap := [PLanguageIndex];

   self.FormStyle         := fsNormal;
   self.BorderStyle       := bsDialog;
   self.Position          := poOwnerFormCenter;

Ins_Result := VarArrayCreate([0,2],varVariant);

self.RefreshBtn.Caption                      := RefreshBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                       := SelectBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption                         := ExitBtn_Caption[PLanguageIndex];

DB.Handle := ComeDB;
DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_INI_SP_VIDOPL_CONSTS';
DataSet.Open;
end;

procedure TFZSpConsts.SelectBtnClick(Sender: TObject);
begin
Ins_Result[0] := DataSet['ID_CONST'];
Ins_Result[1] := DataSet['NAME_SHORT'];
Ins_Result[2] := DataSet['NAME_FULL'];
self.ModalResult:=mrOk;
end;

procedure TFZSpConsts.RefreshBtnClick(Sender: TObject);
begin
  DataSetCloseOpen(DataSet, 'ID_CONST');
end;

procedure TFZSpConsts.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
