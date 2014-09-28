unit ShowSpravParamsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, dogLoaderUnit, cxTL, cxTextEdit, cxTimeEdit;

type
  TfrmSpravParams = class(TForm)
    Panel1: TPanel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxButton1: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpravParams: TfrmSpravParams;

  procedure Load(AOwner : TComponent; params : TSpravParams); stdcall;
  exports Load;
implementation

{$R *.dfm}

procedure Load(AOwner : TComponent; params : TSpravParams); stdcall;
var
 frm : TfrmSpravParams;
 i   : Integer;
begin
  frm := TfrmSpravParams.Create(AOwner);
  frm.cxGrid1TableView1.DataController.RecordCount := params.ParamCount;
  if params.ParamCount <> 0 then
  begin
    for i := 0 to params.ParamCount - 1 do
    begin
      frm.cxGrid1TableView1.DataController.Values[i, 0] := params.Name[i];
      frm.cxGrid1TableView1.DataController.Values[i, 1] := VarToStr(IfNull(params[params.Name[i]], '<null>'));
    end;
  end;
  frm.ShowModal;
  frm.Free;
end;

procedure TfrmSpravParams.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmSpravParams.FormCreate(Sender: TObject);
begin
  cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
end;

end.
