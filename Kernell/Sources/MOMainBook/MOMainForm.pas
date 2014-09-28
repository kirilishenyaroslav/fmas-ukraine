unit MOMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, FIBDatabase, pFIBDatabase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, ComCtrls, ToolWin, ImgList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  pFibDataSet, cxLookAndFeelPainters, cxContainer, cxRadioGroup, StdCtrls,
  cxButtons, ExtCtrls, cxMaskEdit, cxButtonEdit, FIBDataSet, frxClass,
  frxDBSet, frxCross, frxExportHTML, frxExportPDF, frxExportRTF,
  frxExportXML, frxExportXLS, cxDropDownEdit;

type
  TTMoMainForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    ResultsDataSet: TpFIBDataSet;
    frxCrossObject1: TfrxCrossObject;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    Panel4: TPanel;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    Label3: TLabel;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    ActualDate:TDateTime;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_User:Int64);reintroduce;
  end;

implementation

uses GlobalSpr, BaseTypes, Resources_unitb, DateUtils;

{$R *.dfm}

{ TTMoMainForm }

constructor TTMoMainForm.Create(AOwner: TComponent;
  DbHandle: TISC_DB_HANDLE; id_User: Int64);
var  I:Integer;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;

     self.ActualDate:=Date;

     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_12));

     for i:=BASE_YEAR to YearOf(ActualDate) do
     begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(i)));
     end;

     cbMonthBeg.ItemIndex:=MonthOf(ActualDate)-1;
     for i:=0 to cbYearBeg.Properties.Items.Count-1 do
     begin
         if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(ActualDate)))>0
         then begin
            cbYearBeg.ItemIndex:=i;
            break;
         end;
     end;
end;

procedure TTMoMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;


procedure TTMoMainForm.cxButton1Click(Sender: TObject);
begin
    ActualDate:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
    if ResultsDataSet.Active then ResultsDataSet.Close;
    ResultsDataSet.SelectSQL.Text:='select * from MBOOK_MO_GET_DATA('+''''+DateToStr(ActualDate)+''''+',0)';
    ResultsDataSet.Open;
    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportMOMain.fr3',true);
    frxReport1.Variables['DATA']:=ActualDate;
    frxReport1.PrepareReport(true);
    frxReport1.ShowPreparedReport;
end;

procedure TTMoMainForm.cxButton2Click(Sender: TObject);
begin
     Close;
end;

end.
