unit uPochasFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, EditControl,
  cxGridDBTableView, cxGrid, uPochasDataModule, Buttons, ExtCtrls,
  ActnList, ComCtrls, FieldControl, SpComboBox, uCommonSp, SpCommon, Mask,
  CheckEditUnit, cxTextEdit, cxMemo, cxDBEdit, cxContainer, cxLabel,
  cxDBLabel, cxTL, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit,
  cxCalendar, cxCurrencyEdit;

type
  TfmPCardPochasPage = class(TFrame)
    cxStyleRepository1: TcxStyleRepository;
    DS_Pochas: TDataSource;
    Panel1: TPanel;
    cxDBL_Inv: TcxDBLabel;
    cxDBL_Sprav: TcxDBLabel;
    cxDBL_Date: TcxDBLabel;
    cxDBM_Note: TcxDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBTL_Pochas: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTL_PochascxDBTreeListColumn1: TcxDBTreeListColumn;
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
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    Label4: TLabel;
    cxDBLabel1: TcxDBLabel;
    Label5: TLabel;
    cxDBLabel2: TcxDBLabel;
    procedure FrameExit(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure PochasGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBL_InvPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    DM:TdmPochas;
    id_pcard:integer;
    constructor Create(AOwner: TComponent; DMod: TdmPochas; Id_PC: Integer; modify :integer); reintroduce;
  end;

implementation

uses FIBDatabase;

{$R *.dfm}

constructor TfmPCardPochasPage.Create(AOwner: TComponent; DMod: TdmPochas; Id_PC: Integer; modify :integer);
begin
    inherited Create(AOwner);
    DM:=Dmod; id_pcard:=Id_PC;
    DS_Pochas.DataSet:=DM.PochasSelect;
    DM.PochasSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.PochasSelect.Open;
    cxDBL_InvPropertiesChange(cxDBL_Inv);
end;

procedure TfmPCardPochasPage.FrameExit(Sender: TObject);
begin
  DM.ReadTransaction.Commit;
end;

procedure TfmPCardPochasPage.FrameEnter(Sender: TObject);
begin
  DM.ReadTransaction.StartTransaction;
  DM.PochasSelect.Close;
  DM.PochasSelect.Open;
  cxDBL_InvPropertiesChange(Sender);
end;

procedure TfmPCardPochasPage.PochasGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (( Key = VK_F12) and (ssShift in Shift)) then
   ShowInfo(cxDBTL_Pochas.DataController.DataSource.DataSet);
end;

procedure TfmPCardPochasPage.cxDBL_InvPropertiesChange(Sender: TObject);
begin
{  cxDBL_Inv.Visible:=(not VarIsNull(DM.PochasSelect['inv_cher']));
  cxDBL_Sprav.Visible:=(not VarIsNull(DM.PochasSelect['inv_cher']));
  cxDBL_Date.Visible:=(not VarIsNull(DM.PochasSelect['inv_cher']));
  Label1.Visible:=(not VarIsNull(DM.PochasSelect['inv_cher']));
  Label2.Visible:=(not VarIsNull(DM.PochasSelect['inv_cher']));    }
end;

end.
