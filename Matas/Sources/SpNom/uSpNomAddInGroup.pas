unit uSpNomAddInGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxClasses,
  cxGridTableView, uSpNom, ActnList, StdCtrls, Buttons, ExtCtrls, DB,
  FIBDataSet, pFIBDataSet;

type
  TAddInGroupForm = class(TForm)
    StyleRepository: TcxStyleRepository;
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
    cxNomTree: TcxDBTreeList;
    cxDBTreeList1KOD: TcxDBTreeListColumn;
    cxDBTreeList1NOMN: TcxDBTreeListColumn;
    cxDBTreeList1NAME: TcxDBTreeListColumn;
    cxDBTreeList1SCH: TcxDBTreeListColumn;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    ActionList1: TActionList;
    acOk: TAction;
    AddInGroupDataSet: TpFIBDataSet;
    AddInGroupDataSetLINKTO: TFIBBCDField;
    AddInGroupDataSetNOMN: TFIBStringField;
    AddInGroupDataSetNAME: TFIBStringField;
    AddInGroupDataSetID_UNIT: TFIBBCDField;
    AddInGroupDataSetPRICE: TFIBBCDField;
    AddInGroupDataSetTIP: TFIBBooleanField;
    AddInGroupDataSetID_SCH: TFIBBCDField;
    AddInGroupDataSetNAME_SCH: TFIBStringField;
    AddInGroupDataSetID_NOMN: TFIBBCDField;
    AddInGroupDataSetSCH_NUMBER: TFIBStringField;
    AddInGroupDataSetNTYPE: TFIBSmallIntField;
    AddInGroupDataSetKOD: TFIBStringField;
    AddInGroupDataSource: TDataSource;
    ProverkaDataSet: TpFIBDataSet;
    procedure acOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    linkto:Integer;
     proverka:Integer;
  end;

var
  AddInGroupForm: TAddInGroupForm;

implementation

{$R *.dfm}

procedure TAddInGroupForm.acOkExecute(Sender: TObject);

begin
  proverka:=1;
  linkto:=AddInGroupDataSet.FieldValues['ID_NOMN'];
   // if linkto>0 then
  // begin
    ProverkaDataSet.Close;
    ProverkaDataSet.SelectSQL.Clear;
    ProverkaDataSet.SelectSQL.Add('SELECT * FROM MAT_SP_NOM_BASE WHERE LINKTO=:LINKTO AND TIP=0');
    ProverkaDataSet.Prepare;
    ProverkaDataSet.ParamByName('LINKTO').Value:=linkto;
    ProverkaDataSet.CloseOpen(false);
    if ProverkaDataSet.IsEmpty then
    proverka:=0;
  // end;
  ModalResult:=mrOk;
end;

procedure TAddInGroupForm.FormCreate(Sender: TObject);
var fm:TSpNomForm;
    linkto:Integer;
begin
  AddInGroupDataSet.SelectSQL.Add('ORDER BY LINKTO, NAME');
  AddInGroupDataSet.Prepare;
  AddInGroupDataSet.CloseOpen(false);
  linkto:= (Owner as TSpNomForm).TreeDataSet.FieldValues['ID_NOMN'];
  AddInGroupDataSet.Locate('ID_NOMN',linkto,[]);
  cxNomTree.FocusedNode.Expand(false);
end;

end.
