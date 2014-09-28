unit uFamilyFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, EditControl,
  cxGridDBTableView, cxGrid, uFamilyDataModule, Buttons, ExtCtrls,
  ActnList, ComCtrls, FieldControl, SpComboBox, uCommonSp, SpCommon, Mask,
  CheckEditUnit, cxTextEdit, cxMemo, cxDBEdit, cxContainer, cxLabel,
  cxDBLabel, cxTL;

type
  TfmPCardFamilyPage = class(TFrame)
    FamilyGridDBTableView1: TcxGridDBTableView;
    FamilyGridLevel1: TcxGridLevel;
    FamilyGrid: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    DS_Family: TDataSource;
    FamilyGridDBTableView1DBColumn4: TcxGridDBColumn;
    FamilyGridDBTableView1DBColumn5: TcxGridDBColumn;
    FamilyGridDBTableView1DBColumn6: TcxGridDBColumn;
    Panel1: TPanel;
    cxDBL_Inv: TcxDBLabel;
    cxDBL_Sprav: TcxDBLabel;
    cxDBL_Date: TcxDBLabel;
    cxDBM_Note: TcxDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    procedure FrameExit(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
    procedure FamilyGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBL_InvPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    DM:TdmFamily;
    id_pcard:integer;
    constructor Create(AOwner: TComponent; DMod: TdmFamily; Id_PC: Integer; modify :integer); reintroduce;
  end;

implementation

uses FIBDatabase;

{$R *.dfm}

constructor TfmPCardFamilyPage.Create(AOwner: TComponent; DMod: TdmFamily; Id_PC: Integer; modify :integer);
begin
    inherited Create(AOwner);
    DM:=Dmod; id_pcard:=Id_PC;
    DS_Family.DataSet:=DM.FamilySelect;
    DM.FamilySelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.FamilySelect.Open;
    cxDBL_InvPropertiesChange(cxDBL_Inv);
end;

procedure TfmPCardFamilyPage.FrameExit(Sender: TObject);
begin
  DM.ReadTransaction.CommitRetaining;
end;

procedure TfmPCardFamilyPage.FrameEnter(Sender: TObject);
begin
      if not DM.ReadTransaction.InTransaction
      then DM.ReadTransaction.StartTransaction;

      if DM.FamilySelect.Active
      then DM.FamilySelect.Close;
      
      DM.FamilySelect.Open;
      cxDBL_InvPropertiesChange(Sender);
end;

procedure TfmPCardFamilyPage.FamilyGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (( Key = VK_F12) and (ssShift in Shift)) then
   ShowInfo(FamilyGridDBTableView1.DataController.DataSource.DataSet);
end;

procedure TfmPCardFamilyPage.cxDBL_InvPropertiesChange(Sender: TObject);
begin
  cxDBL_Inv.Visible:=(not VarIsNull(DM.FamilySelect['inv_cher']));
  cxDBL_Sprav.Visible:=(not VarIsNull(DM.FamilySelect['inv_cher']));
  cxDBL_Date.Visible:=(not VarIsNull(DM.FamilySelect['inv_cher']));
  Label1.Visible:=(not VarIsNull(DM.FamilySelect['inv_cher']));
  Label2.Visible:=(not VarIsNull(DM.FamilySelect['inv_cher']));
end;

end.
