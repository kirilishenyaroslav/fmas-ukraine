unit uProsmDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, uDebKrDoc, FIBDataSet,
  pFIBDataSet, uMainPerem, ActnList;

type
  TProsmDocForm = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    NumDoc: TcxTextEdit;
    lbl2: TLabel;
    DateDoc: TcxTextEdit;
    lbl3: TLabel;
    SumDoc: TcxTextEdit;
    lbl4: TLabel;
    ContrDoc: TcxTextEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    cxGridSM_KOD: TcxGridDBColumn;
    cxGridRZ_KOD: TcxGridDBColumn;
    cxGridST_KOD: TcxGridDBColumn;
    cxGridKEKV_KOD: TcxGridDBColumn;
    cxGridSUMMA: TcxGridDBColumn;
    dsDS: TDataSource;
    ForProsmotr: TpFIBDataSet;
    ForProsmotrIS_OUR_DOC: TFIBIntegerField;
    ForProsmotrID_DOG: TFIBBCDField;
    ForProsmotrKOD_DOG: TFIBBCDField;
    ForProsmotrID_SM: TFIBBCDField;
    ForProsmotrID_RZ: TFIBBCDField;
    ForProsmotrID_ST: TFIBBCDField;
    ForProsmotrID_KEKV: TFIBBCDField;
    ForProsmotrSUMMA: TFIBBCDField;
    ForProsmotrFIO: TFIBStringField;
    ForProsmotrDATE_DOC: TFIBDateField;
    ForProsmotrPOPER_DB_ID_SCH: TFIBBCDField;
    ForProsmotrPOPER_KR_ID_SCH: TFIBBCDField;
    ForProsmotrKR_SCH_NUMBER: TFIBStringField;
    ForProsmotrDB_SCH_NUMBER: TFIBStringField;
    ForProsmotrSM_TITLE: TFIBStringField;
    ForProsmotrSM_KOD: TFIBIntegerField;
    ForProsmotrRZ_TITLE: TFIBStringField;
    ForProsmotrRZ_KOD: TFIBIntegerField;
    ForProsmotrST_TITLE: TFIBStringField;
    ForProsmotrST_KOD: TFIBIntegerField;
    ForProsmotrKEKV_TITLE: TFIBStringField;
    ForProsmotrKEKV_KOD: TFIBIntegerField;
    cxGridIS_OUR_DOC: TcxGridDBColumn;
    cxGridDB_SCH_NUMBER: TcxGridDBColumn;
    cxGridKR_SCH_NUMBER: TcxGridDBColumn;
    actlst1: TActionList;
    act1: TAction;
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure act1Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent; d_b:TDateTime; d_e:TDateTime; is_dk:Integer; id:Int64);overload;
  end;

var
  ProsmDocForm: TProsmDocForm;

implementation

{$R *.dfm}
 constructor TProsmDocForm.Create(AOwner:TComponent; d_b:TDateTime; d_e:TDateTime; is_dk:Integer; id:Int64);
begin
 inherited Create(AOwner);
  ForProsmotr.Close;
 ForProsmotr.Prepare;
 ForProsmotr.ParamByName('DATE_BEG').AsDate:=d_b;
 ForProsmotr.ParamByName('DATE_END').AsDate:=d_e;
 ForProsmotr.ParamByName('IS_DEB_KR').AsInteger:=is_dk;
 ForProsmotr.ParamByName('PK_ID').AsInt64:=id;
 ForProsmotr.ParamByName('ID_REG').AsInt64:=ID_REG;
 ForProsmotr.CloseOpen(False);
end;

procedure TProsmDocForm.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var   Arect : TRect;
begin
 Arect:=AViewInfo.Bounds;
  if (vartostr(AViewInfo.GridRecord.Values[7]) = '0')  then
  begin
      ACanvas.Canvas.Brush.Color := $00D2D2D2;
      ACanvas.Canvas.Font.Color:=4;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TProsmDocForm.act1Execute(Sender: TObject);
begin
 Close;
end;

procedure TProsmDocForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
act1Execute(Self);
end;

end.
