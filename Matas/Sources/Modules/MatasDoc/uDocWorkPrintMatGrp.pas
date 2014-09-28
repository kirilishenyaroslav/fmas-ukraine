{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkPrintMatGrp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxCheckBox, uMatasVars, uMatasUtils, uResources, frxDesgn, frxClass,
  frxDBSet, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,DateUtils,
  frxExportPDF, frxExportRTF, frxExportXML, frxExportHTML, ActnList;

type
  TDocWorkPrintMatGrp = class(TForm)
    Label5: TLabel;
    Label6: TLabel;
    cxCheckEdit: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    cxReport: TcxComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    pFIBDatabase1: TpFIBDatabase;
    ReportDataset: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   MatasMonth1, MatasYear1: Word;
   MatasMonth2, MatasYear2: Word;
  end;

var
  DocWorkPrintMatGrp: TDocWorkPrintMatGrp;

implementation

{$R *.dfm}

procedure TDocWorkPrintMatGrp.FormCreate(Sender: TObject);
var
 dy, dm, dd: Word;
begin
 cxReport.ItemIndex:=0;
 Caption:=MAT_SYS_PREFIX+MAT_DOC_STR_PRINT_MAT;
 DecodeDate(_MATAS_PERIOD, dy, dm,  dd);
 MatasYear1:=dy;
 MatasMonth1:=dm;
 LoadMonthTocxComboBox(self.cxMonthBeg);
 LoadMonthTocxComboBox(self.cxMonthEnd);
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 OkButton.Caption:=MAT_ACTION_PRINT_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 cxMonthBeg.ItemIndex:=MatasMonth1-1;
 cxYearBeg.Value:=MatasYear1;
 cxMonthEnd.ItemIndex:=MatasMonth1-1;
 cxYearEnd.Value:=MatasYear1;
end;

procedure TDocWorkPrintMatGrp.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkPrintMatGrp.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 MatasMonth1, MatasYear1: Word;
 MatasMonth2, MatasYear2: Word;
 type_doc:string;
begin
  MatasYear1:=cxYearBeg.Value;
  MatasMonth1:=cxMonthBeg.ItemIndex+1;
  DBEG:=StartOfAMonth(MatasYear1, MatasMonth1);
  MatasYear2:=cxYearEnd.Value;
  MatasMonth2:=cxMonthEnd.ItemIndex+1;
  DEND:=EndOfAMonth(MatasYear2, MatasMonth2);

  ReportDataSet.Close;
  ReportDataSet.SelectSQL.Clear;
  ReportDataSet.SelectSQL.Add('SELECT * FROM MAT_SEL_NOMN_BY_PERIOD_EX(:PDATE_BEG,:PDATE_END,:PTIP)');

  if cxReport.ItemIndex=0 then
  begin
    ReportDataSet.SelectSQL.Add('ORDER BY BAL_DB_SCH_NUMBER, DB_SCH_NUMBER, NAME_GROUP1, NAME_GROUP2, NAME');
    ReportDataSet.ParamByName('PTIP').Value:=0;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\RepOnPrihod.fr3');
    type_doc:='приходу';
  end;

  if cxReport.ItemIndex=1 then
  begin
    ReportDataSet.SelectSQL.Add('ORDER BY BAL_KR_SCH_NUMBER, KR_SCH_NUMBER, NAME_GROUP1, NAME_GROUP2, NAME');
    ReportDataSet.ParamByName('PTIP').Value:=1;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\RepOnRashod.fr3');
    type_doc:='видатку';
  end;

  ReportDataSet.ParamByName('PDATE_BEG').Value:=DBEG;
  ReportDataSet.ParamByName('PDATE_END').Value:=DEND;
  ReportDataSet.CloseOpen(false);
  frxReport.Variables['DateB']:= ''''+DateToStr(DBEG)+'''';
  frxReport.Variables['DateE']:= ''''+DateToStr(DEND)+'''';
  frxReport.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
  frxReport.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
  frxReport.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
  frxReport.Variables['TYPE']:=''''+type_doc+'''';
  frxReport.PrintOptions.Copies:=cxCopies.Value;
  frxReport.PrintOptions.ShowDialog:=cxSelectPrinter.Checked;
  if cxCheckOnPrinter.Checked then
    frxReport.Print
  else
    frxReport.ShowReport;
  if cxCheckEdit.Checked then frxReport.DesignReport;
end;

procedure TDocWorkPrintMatGrp.ActionCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TDocWorkPrintMatGrp.ActionOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

end.
