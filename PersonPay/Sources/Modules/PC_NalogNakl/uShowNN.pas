unit uShowNN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uMainNN, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxClasses, FIBDataSet, pFIBDataSet, StdCtrls, ExtCtrls, FIBDatabase,
  pFIBDatabase, cxLookAndFeelPainters, frxClass, frxDBSet, frxDesgn,
  cxButtons, cxContainer, cxCheckBox, ActnList, uMainPerem, frxExportPDF,
  frxExportXLS, frxExportRTF;

type
  TShowNNForm = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    ds1: TDataSource;
    pFIBDataSet: TpFIBDataSet;
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSetID_DOG: TFIBBCDField;
    pFIBDataSetKOD_DOG: TFIBBCDField;
    pFIBDataSetID_SM: TFIBBCDField;
    pFIBDataSetID_ST: TFIBBCDField;
    pFIBDataSetID_RZ: TFIBBCDField;
    pFIBDataSetID_KEKV: TFIBBCDField;
    pFIBDataSetS_NACH: TFIBBCDField;
    pFIBDataSetSM_KOD: TFIBStringField;
    pFIBDataSetRZ_KOD: TFIBStringField;
    pFIBDataSetST_KOD: TFIBStringField;
    pFIBDataSetKEKV_KOD: TFIBStringField;
    pFIBDataSetFIO: TFIBStringField;
    pFIBDataSetNUM_DOG: TFIBStringField;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxButtonExit: TcxButton;
    cxButton1: TcxButton;
    frxDesigner: TfrxDesigner;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    cxCheckEdit: TcxCheckBox;
    actlst1: TActionList;
    act1: TAction;
    frxRTFExport1: TfrxRTFExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    pFIBDataSetID_CUSTOMER: TFIBBCDField;
    pFIBDataSetNAME_CUSTOMER: TFIBStringField;
    pFIBDataSetSUMMA_NACHISL_PERIOD: TFIBBCDField;
    pFIBDataSetSUMMA_OPLAT_PERIOD: TFIBBCDField;
    pFIBDataSetSUMMA_NACH: TFIBBCDField;
    pFIBDataSetSUMMA_OPL: TFIBBCDField;
    pFIBDataSetS_ALL_NACH: TFIBBCDField;
    pFIBDataSetDATE_NN_BEFORE: TFIBDateField;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn10: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn11: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn12: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn13: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn14: TcxGridDBColumn;
    procedure cxButtonExitClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure act1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    FIO_USER:string;
  end;

var
  ShowNNForm: TShowNNForm;

implementation

{$R *.dfm}

procedure TShowNNForm.cxButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TShowNNForm.cxButton1Click(Sender: TObject);
begin
frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+ '/rassh_nn.fr3');
frxReport.Variables['NAME']:=''''+lbl1.Caption+'''';
frxReport.Variables['USER']:=''''+FIO_USER+'''';
frxReport.PrepareReport;
frxReport.PrintOptions.ShowDialog:=True;
if cxCheckEdit.Checked then  frxReport.DesignReport
else frxReport.ShowReport;
end;

procedure TShowNNForm.act1Execute(Sender: TObject);
begin
 if cxCheckEdit.Visible = False then cxCheckEdit.Visible:=True
 else cxCheckEdit.Visible:=False;
end;

end.
