{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkReestrPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, uMatasVars, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxButtonEdit,
  cxCheckBox, uSpTipDocMulti, ibase, FR_DSet, FR_DBSet, FR_Class, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxSpinEdit, uMatasUtils, ActnList;

type
  TDocWorkReestrPrint = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    frReportReestr: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    RepDataSet: TpFIBDataSet;
    cxCheckEdit: TcxCheckBox;
    WorkDataSource: TDataSource;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label5: TLabel;
    cxCopies: TcxSpinEdit;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    Label6: TLabel;
    cxReport: TcxComboBox;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
    DBHANDLE : TISC_DB_HANDLE;
  public
    ID_REESTR: Integer;
    NUM_REESTR: string;
    DATE_REESTR: TDateTime;
  end;

var
  DocWorkReestrPrint: TDocWorkReestrPrint;

implementation

{$R *.dfm}
procedure TDocWorkReestrPrint.FormCreate(Sender: TObject);
begin
 cxReport.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
end;

procedure TDocWorkReestrPrint.OkButtonClick(Sender: TObject);
begin
  RepDataSet.Close;
  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT * FROM MAT_DT_DOC_REESTR_SELECT_DOC(:ID_DOC_REESTR)');
   Add('ORDER BY ID_MO_IN, DATE_DOC, TIPD, NUM_DOC')
  end;
  RepDataSet.Prepare;
  RepDataSet.ParamByName('ID_DOC_REESTR').Value:=ID_REESTR;
  RepDataSet.CloseOpen(false);
  if cxReport.ItemIndex=0 then
   frReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\reestr_doc1.frf');
  if cxReport.ItemIndex=1 then
   frReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\reestr_doc2.frf');
  frVariables['NUM_REESTR']:=NUM_REESTR;
  frVariables['DATE_REESTR']:=DATE_REESTR;
  frVariables['ORG_NAME']:=_ORG_FULL_NAME;
  frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
  frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
  frReportReestr.PrepareReport;
  if cxCopies.Value>1 then
   frReportReestr.DefaultCopies:=cxCopies.Value;
  if cxCheckOnPrinter.Checked then
  begin
   if cxSelectPrinter.Checked then
    frReportReestr.PrintPreparedReportDlg
   else
    frReportReestr.PrintPreparedReport('', cxCopies.Value, false, frAll);
  end
  else
   frReportReestr.ShowReport;
  if cxCheckEdit.Checked then
   frReportReestr.DesignReport;
end;

procedure TDocWorkReestrPrint.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkReestrPrint.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

end.
