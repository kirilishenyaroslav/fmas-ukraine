unit SP_Raises;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, IBase, dxBar, dxBarExtItems;

type
  TfrmSP_Raises = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DB: TpFIBDatabase;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
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
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
  private
    Ins_Resault: Variant;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE); reintroduce;
  end;

var frmSP_Raises:TfrmSP_Raises;
function getSP_Raises(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE):Variant;
exports getSP_Raises;

implementation

{$R *.dfm}

function getSP_Raises(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE):Variant;
var
  f:TfrmSP_Raises;
//  Res:Variant;  
begin
    f:=TfrmSP_Raises.Create(AOwner, DB_Handle);
    f.ShowModal;
//    res:=f.Ins_Resault;
    getSP_Raises:=f.Ins_Resault;
end;

constructor TfrmSP_Raises.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
    inherited Create(AOwner);

    Ins_Resault:=VarArrayCreate([0,1],varVariant);
    DB.Handle:=DB_Handle;
    if pFIBDataSet1.Active then pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text:='select distinct r.ID_VIDOPL, v.NAME_VIDOPL from SP_RAISE r, SP_VIDOPL v where r.ID_vidopl=v.ID_vidopl';
    pFIBDataSet1.Open;

end;


procedure TfrmSP_Raises.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    Ins_Resault[0]:=pFIBDataSet1['ID_VIDOPL'];
    Ins_Resault[1]:=pFIBDataSet1['NAME_VIDOPL'];
    self.ModalResult:=mrOk;
end;

procedure TfrmSP_Raises.SelectBtnClick(Sender: TObject);
begin
     cxGrid1DBTableView1DblClick(sender);
end;

procedure TfrmSP_Raises.RefreshBtnClick(Sender: TObject);
begin
    if pFIBDataSet1.Active then pFIBDataSet1.Close;
    pFIBDataSet1.SQLs.SelectSQL.Text:='select distinct r.ID_VIDOPL, v.NAME_VIDOPL from SP_RAISE r, SP_VIDOPL v where r.ID_vidopl=v.ID_vidopl';
    pFIBDataSet1.Open;
end;

end.
