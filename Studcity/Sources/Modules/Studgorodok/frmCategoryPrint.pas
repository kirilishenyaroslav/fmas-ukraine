unit frmCategoryPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  ActnList, DB, FIBDataSet, pFIBDataSet, frxExportXLS, frxExportHTML,
  frxExportRTF, frxClass, frxExportPDF, frxDesgn, frxDBSet, ibase;

type
  TfrmPrint = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    dtBegCheck: TcxDateEdit;
    dtEndCheck: TcxDateEdit;
    frxDBDataset: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    ReadDataSet: TpFIBDataSet;
    ActionList1: TActionList;
    DebugPrintAction: TAction;
    BarStatic: TLabel;
    frxReport: TfrxReport;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtBegCheckKeyPress(Sender: TObject; var Key: Char);
    procedure dtEndCheckKeyPress(Sender: TObject; var Key: Char);
    procedure DebugPrintActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    DBh : TISC_DB_HANDLE;
  end;

  
  var designer_rep:Integer;
  
implementation

{$R *.dfm}

procedure TfrmPrint.CancelButtonClick(Sender: TObject);
begin
Close;
end;

procedure TfrmPrint.OkButtonClick(Sender: TObject);
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\'+'st_che_CategoryList'+'.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['BEG_CHECK']:= ''''+ DateToStr(dtBegCheck.Date) +'''';
  frxReport.Variables['END_CHECK']:= ''''+ DateToStr(dtEndCheck.Date) +'''';

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_SP_CATEGORY_LIST_PRINT(' +
                                 '''' + DateToStr(dtBegCheck.Date) + '''' + ',' +
                                 '''' + DateToStr(dtEndCheck.Date) + '''' +
                                  ') order by NUM_KATEGORIYA';

  ReadDataSet.Open;
  ReadDataSet.FetchAll;

  frxReport.PrepareReport(true);
  frxReport.ShowReport;
  if designer_rep=1 then
    begin
      frxReport.DesignReport;
    end;
  ReadDataSet.Close;
  
end;

procedure TfrmPrint.FormCreate(Sender: TObject);
begin
dtBegCheck.Date := Now;
dtEndCheck.Date := StrToDate('01.01.2050');
designer_rep:=0;
end;

procedure TfrmPrint.FormShow(Sender: TObject);
begin
 dtBegCheck.SetFocus;
end;

procedure TfrmPrint.dtBegCheckKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmPrint.dtEndCheckKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then Self.FindNextControl(Self.ActiveControl,True,true,False).SetFocus;
end;

procedure TfrmPrint.DebugPrintActionExecute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    BarStatic.Caption:='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    BarStatic.Caption:='';
  end;
end;

end.
