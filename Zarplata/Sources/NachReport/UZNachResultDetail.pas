unit UZNachResultDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxSplitter, ExtCtrls, cxClasses, cxStyles, cxGridBandedTableView,
  Ibase, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBBandedTableView, cxGridCustomView, cxGrid,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ZWait,
  frxExportXML, frxExportRTF, frxExportPDF, frxExportImage, frxExportHTML;

type
  TfrmNachDetailReport = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
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
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Panel3: TPanel;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGrid3: TcxGrid;
    OborView: TcxGridDBBandedTableView;
    SmColumn: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    fzp1: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    fsp: TcxGridDBBandedColumn;
    fss: TcxGridDBBandedColumn;
    fbl: TcxGridDBBandedColumn;
    fss1: TcxGridDBBandedColumn;
    fbl1: TcxGridDBBandedColumn;
    ResultsDataSet: TpFIBDataSet;
    ResultsDataSource: TDataSource;
    ResultsVidOpl: TpFIBDataSet;
    DataSourceVidOpl: TDataSource;
    cxGridDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    BPrint: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    DSet_Print: TpFIBDataSet;
    DSource_Print: TDataSource;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxXMLExport1: TfrxXMLExport;
    procedure cxButton2Click(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime;id_sm,id_sm_gr,id_pkv,id_tf,id_dep,id_tp, id_p, id_vo:Variant;DbHandle:Tisc_DB_handle);reintroduce;
  end;

var
  frmNachDetailReport: TfrmNachDetailReport;

implementation

{$R *.dfm}

constructor TfrmNachDetailReport.Create(AOwner: TComponent; DateBeg,
  DateEnd: TDateTime; id_sm, id_sm_gr, id_pkv, id_tf, id_dep,
  id_tp, id_p, id_vo: Variant; DbHandle: Tisc_DB_handle);
begin
    inherited Create(Aowner);

    WorkDatabase.Handle:=DbHandle;
    ReadTransaction.StartTransaction;
    ResultsDataSet.Close;
    ResultsDataSet.SelectSQL.Text:='SELECT ID_MAN, FIO,  SUM(FZP) as FZP, SUM(FSS) AS FSS, SUM(FBL) AS FBL FROM Z_UTIL_NACH_REPORT_DETAIL_EX(:param1, :param2, :param3, :param4, :param5, :param6, :param7, :param8, :param9, :param10) group by fio, ID_MAN order by fio collate win1251_ua';
    ResultsDataSet.Prepare;
    ResultsDataSet.ParamByName('param1').Value :=DateBeg;
    ResultsDataSet.ParamByName('param2').Value :=DateEnd;
    ResultsDataSet.ParamByName('param3').Value :=id_sm;
    ResultsDataSet.ParamByName('param4').Value :=id_sm_gr;
    ResultsDataSet.ParamByName('param5').Value :=id_pkv;
    ResultsDataSet.ParamByName('param6').Value :=id_tf;
    ResultsDataSet.ParamByName('param7').Value :=id_dep;
    ResultsDataSet.ParamByName('param8').Value :=id_tp;
    ResultsDataSet.ParamByName('param9').Value :=id_p;
    ResultsDataSet.ParamByName('param10').Value:=id_vo;
    ResultsDataSet.Open;


    ResultsVidOpl.Close;
    ResultsVidOpl.SelectSQL.Text:=' SELECT * FROM Z_UTIL_NACH_REPORT_DETAIL_EX2( ?ID_MAN, :param1, :param2, :param3, :param4, :param5, :param6, :param7, :param8, :param9, :param10)';
    ResultsVidOpl.Prepare;
    ResultsVidOpl.ParamByName('param1').Value  :=DateBeg;
    ResultsVidOpl.ParamByName('param2').Value  :=DateEnd;
    ResultsVidOpl.ParamByName('param3').Value  :=id_sm;
    ResultsVidOpl.ParamByName('param4').Value  :=id_sm_gr;
    ResultsVidOpl.ParamByName('param5').Value  :=id_pkv;
    ResultsVidOpl.ParamByName('param6').Value  :=id_tf;
    ResultsVidOpl.ParamByName('param7').Value  :=id_dep;
    ResultsVidOpl.ParamByName('param8').Value  :=id_tp;
    ResultsVidOpl.ParamByName('param9').Value  :=id_p;
    ResultsVidOpl.ParamByName('param10').Value :=id_vo;
    ResultsVidOpl.Open;


    DSet_Print.SelectSQL.Text:='SELECT id_man, vidopl_code, vidopl_full, period, id_sm, smeta_kod, fio, fzp, fss, fbl FROM Z_UTIL_NACH_REPORT_PRINT(:param1, :param2, :param3, :param4, :param5, :param6, :param7, :param8, :param9, :param10) order by fio collate win1251_ua, ID_MAN, period';
    DSet_Print.Prepare;
    DSet_Print.ParamByName('param1').Value :=DateBeg;
    DSet_Print.ParamByName('param2').Value :=DateEnd;
    DSet_Print.ParamByName('param3').Value :=id_sm;
    DSet_Print.ParamByName('param4').Value :=id_sm_gr;
    DSet_Print.ParamByName('param5').Value :=id_pkv;
    DSet_Print.ParamByName('param6').Value :=id_tf;
    DSet_Print.ParamByName('param7').Value :=id_dep;
    DSet_Print.ParamByName('param8').Value :=id_tp;
    DSet_Print.ParamByName('param9').Value :=id_p;
    DSet_Print.ParamByName('param10').Value:=id_vo;
    DSet_Print.Open;
end;

procedure TfrmNachDetailReport.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmNachDetailReport.BPrintClick(Sender: TObject);
var wf:TForm;
begin
    wf:=ShowWaitForm(Self);

    frxReport1.Clear;
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\ReestrNachisleniy.fr3',True);
    frxReport1.PrepareReport;
    CloseWaitForm(wf);
    frxReport1.ShowPreparedReport;


end;

end.
