unit uOrdersFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, EditControl,
  cxGridDBTableView, cxGrid, uOrdersDataModule, Buttons, ExtCtrls,
  ActnList, ComCtrls, FieldControl, SpComboBox, uCommonSp, SpCommon, Mask,
  CheckEditUnit, cxLabel;

type
  TfmPCardOrdersPage = class(TFrame)
    OrdersGridDBTableView1: TcxGridDBTableView;
    OrdersGridLevel1: TcxGridLevel;
    OrdersGrid: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    DS_Orders: TDataSource;
    OrdersGridDBTableView1DBColumn4: TcxGridDBColumn;
    OrdersGridDBTableView1DBColumn5: TcxGridDBColumn;
    OrdersGridDBTableView1DBColumn6: TcxGridDBColumn;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    OrdersGridDBTableView1DBColumn1: TcxGridDBColumn;
    OrdersGridDBTableView1DBColumn2: TcxGridDBColumn;
    procedure FrameExit(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure OrdersGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    DM:TdmOrders;
    id_pcard:integer;
    constructor Create(AOwner: TComponent; DMod: TdmOrders; Id_PC: Integer; modify :integer); reintroduce;
  end;

implementation

uses FIBDatabase;

{$R *.dfm}

constructor TfmPCardOrdersPage.Create(AOwner: TComponent; DMod: TdmOrders; Id_PC: Integer; modify :integer);
begin
    inherited Create(AOwner);
    DM:=Dmod; id_pcard:=Id_PC;
    DS_Orders.DataSet:=DM.OrdersSelect;
    DM.OrdersSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.OrdersSelect.Open;
end;

procedure TfmPCardOrdersPage.FrameExit(Sender: TObject);
begin
  DM.ReadTransaction.Commit;
end;

procedure TfmPCardOrdersPage.FrameEnter(Sender: TObject);
begin
  DM.ReadTransaction.StartTransaction;
  DM.OrdersSelect.Close;
  DM.OrdersSelect.Open;
end;

procedure TfmPCardOrdersPage.OrdersGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (( Key = VK_F12) and (ssShift in Shift)) then
   ShowInfo(OrdersGridDBTableView1.DataController.DataSource.DataSet);
end;

end.
