{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkPrintMatRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxCheckBox, uMatasVars, uMatasUtils, uResources, frxDesgn, frxClass,
  frxDBSet, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,DateUtils,
  frxExportPDF, frxExportRTF, frxExportXML, frxExportHTML, cxLabel,
  ActnList;

type
  TDocWorkPrintMatRep = class(TForm)
    Label5: TLabel;
    Label6: TLabel;
    cxCheckEdit: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    cxReport: TcxComboBox;
    pFIBDatabase1: TpFIBDatabase;
    ReportDataset: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxReport: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    cxExportExel: TcxCheckBox;
    cxCheckBalSch: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxSpinEditLevel: TcxSpinEdit;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   MatasMonth1, MatasYear1: Word;
   MatasMonth2, MatasYear2: Word;
  end;

var
  DocWorkPrintMatRep: TDocWorkPrintMatRep;

implementation

{$R *.dfm}
uses uDocWork;

procedure TDocWorkPrintMatRep.FormCreate(Sender: TObject);
begin
 cxReport.ItemIndex:=0;
 Caption:=MAT_SYS_PREFIX+MAT_DOC_STR_PRINT_MAT;
 cxCopies.Value:=1;
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 cxCheckEdit.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
 OkButton.Caption:=MAT_ACTION_PRINT_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
end;

procedure TDocWorkPrintMatRep.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkPrintMatRep.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 type_doc: string;
 prefix, cond: string;
 GrpBand: TfrxBand;
 fMemo: TfrxMemoView;
 FILTER_STR: TStrings;
 i: integer;
begin
  FILTER_STR:=TStringList.Create;

  DBEG:=(Owner as TDocWorkForm).cxFilterDateBeg.EditValue;
  DEND:=(Owner as TDocWorkForm).cxFilterDateEnd.EditValue;

  ReportDataSet.Close;
  ReportDataSet.SelectSQL.Clear;
  ReportDataSet.SelectSQL.Add('SELECT * FROM MAT_DT_DOC_REPORT_SELECT(:PDATE_BEG, :PDATE_END,');
  ReportDataSet.SelectSQL.Add(':PID_TIPD, :P_ID_FILTER)');

  if (Owner as TDocWorkForm).F_CONDITION then
   cond:='OR '
  else
   cond:='AND ';
  prefix:='WHERE ';
  FILTER_STR.Add('Параметри фільтрації:');
  FILTER_STR.Add('');
  if (Owner as TDocWorkForm).F_CONDITION then prefix:=prefix+' (';
  if (Owner as TDocWorkForm).F_ID_MO_IN>0 then
  begin
   ReportDataSet.SelectSQL.Add(prefix+'ID_IN='+IntToStr((Owner as TDocWorkForm).F_ID_MO_IN));
   prefix:=cond;
   FILTER_STR.Add('МВО (кому):'+(Owner as TDocWorkForm).F_FIO_MO_IN);
  end;
  if (Owner as TDocWorkForm).F_ID_MO_OUT>0 then
  begin
   ReportDataSet.SelectSQL.Add(prefix+'ID_OUT='+IntToStr((Owner as TDocWorkForm).F_ID_MO_OUT));
   prefix:=cond;
   FILTER_STR.Add('МВО (від кого):'+(Owner as TDocWorkForm).F_FIO_MO_OUT);
  end;
  if (Owner as TDocWorkForm).F_ID_CUST>0 then
  begin
   ReportDataSet.SelectSQL.Add(prefix+'ID_CUST='+IntToStr((Owner as TDocWorkForm).F_ID_CUST));
   prefix:=cond;
   FILTER_STR.Add('Контрагент:'+(Owner as TDocWorkForm).F_NAME_CUST);
  end;

  if (Owner as TDocWorkForm).F_CONDITION then ReportDataSet.SelectSQL.Add(' )');

  cond:='AND ';

  if  (Owner as TDocWorkForm).F_NUM_DOC<>'' then
  begin
   ReportDataSet.SelectSQL.Add(prefix+'NUM_DOC LIKE '+QuotedStr(trim((Owner as TDocWorkForm).F_NUM_DOC)+'%'));
   prefix:=cond;
   FILTER_STR.Add('№ документа:'+(Owner as TDocWorkForm).F_NUM_DOC+'%');
  end;
  if  (Owner as TDocWorkForm).F_DOC_WORK=1 then
  begin
   if (Owner as TDocWorkForm).F_WORK_PERIOD then
   begin
    ReportDataSet.SelectSQL.Add(prefix+'DATE_REC BETWEEN :WORK_BEG AND :WORK_END');
    FILTER_STR.Add('Відпрацьовано: з '+DateToStr((Owner as TDocWorkForm).F_WORK_DATE_BEG)+' по '+DateToStr((Owner as TDocWorkForm).F_WORK_DATE_END));
   end
   else
   begin
    ReportDataSet.SelectSQL.Add(prefix+'DATE_REC IS NOT NULL');
    FILTER_STR.Add('Відпрацьовано: ДА');
   end;
   prefix:=cond;
  end;
  if  (Owner as TDocWorkForm).F_DOC_WORK=2 then
  begin
   ReportDataSet.SelectSQL.Add(prefix+'DATE_REC IS NULL');
   prefix:=cond;
   FILTER_STR.Add('Відпрацьовано: НІ');
  end;

  if not (Owner as TDocWorkForm).F_IS_NOMN then
  begin
    if (Owner as TDocWorkForm).F_NAME_TMC<>'' then
    begin
      ReportDataSet.SelectSQL.Add(prefix+'NAME LIKE '+QuotedStr(AnsiUpperCase((Owner as TDocWorkForm).F_NAME_TMC+'%')));
    end
  end;

  if (Owner as TDocWorkForm).F_NAME_TMC<>'' then
  begin
    FILTER_STR.Add('Назва ТМЦ:'+(Owner as TDocWorkForm).F_NAME_TMC+'%');
  end;

  if (Owner as TDocWorkForm).F_TIPD<>'' then
  begin
    FILTER_STR.Add('Тип документа:'+(Owner as TDocWorkForm).F_TIPD);
  end;

  if (Owner as TDocWorkForm).F_GROUP_LIST<>'' then
  begin
    FILTER_STR.Add('Групи ТМЦ:'+(Owner as TDocWorkForm).F_GROUP_LIST);
  end;

  if (Owner as TDocWorkForm).F_SCH_LIST<>'' then
  begin
    FILTER_STR.Add('Рахунки:'+(Owner as TDocWorkForm).F_SCH_LIST);
  end;

  if (Owner as TDocWorkForm).F_OPER_PARAM<>'' then
  begin
    FILTER_STR.Add('Операція:'+(Owner as TDocWorkForm).F_OPER_PARAM);
  end;

  if cxReport.ItemIndex=0 then
  begin
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MatRepOnPrihod.fr3');
    type_doc:='прихід';
    ReportDataSet.SelectSQL.Add('ORDER BY BAL_DB_SCH_NUMBER, DB_SCH_NUMBER, NAME_GROUP4, NAME_GROUP3, NAME_GROUP2, NAME_GROUP1, NAME_OUT, NAME');
  end;

  if cxReport.ItemIndex=1 then
  begin
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MatRepOnPrihod1.fr3');
    type_doc:='прихід';
    ReportDataSet.SelectSQL.Add('ORDER BY NAME_OUT, BAL_DB_SCH_NUMBER, DB_SCH_NUMBER, NAME_GROUP4, NAME_GROUP3, NAME_GROUP2, NAME_GROUP1, NAME');
  end;

  if cxReport.ItemIndex=2 then
  begin
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MatRepOnRashod.fr3');
    ReportDataSet.SelectSQL.Add('ORDER BY BAL_KR_SCH_NUMBER, KR_SCH_NUMBER, NAME_GROUP4, NAME_GROUP3, NAME_GROUP2, NAME_GROUP1, NAME_IN, NAME');
    type_doc:='видаток';
  end;

  if cxReport.ItemIndex=3 then
  begin
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\MatRepOnRashod1.fr3');
    ReportDataSet.SelectSQL.Add('ORDER BY NAME_IN, BAL_KR_SCH_NUMBER, KR_SCH_NUMBER, NAME_GROUP4, NAME_GROUP3, NAME_GROUP2, NAME_GROUP1, NAME');
    type_doc:='видаток';
  end;

  ReportDataSet.Prepare;
  if (((Owner as TDocWorkForm).F_DOC_WORK=1) and (Owner as TDocWorkForm).F_WORK_PERIOD) then
  begin
   ReportDataSet.ParamByName('WORK_BEG').Value:=(Owner as TDocWorkForm).F_WORK_DATE_BEG;
   ReportDataSet.ParamByName('WORK_END').Value:=(Owner as TDocWorkForm).F_WORK_DATE_END;
  end;
  ReportDataSet.ParamByName('PDATE_BEG').Value:=(Owner as TDocWorkForm).F_DATE_BEG;
  ReportDataSet.ParamByName('PDATE_END').Value:=(Owner as TDocWorkForm).F_DATE_END;
  ReportDataSet.ParamByName('PID_TIPD').Value:=(Owner as TDocWorkForm).F_ID_TIPD;
  ReportDataSet.ParamByName('P_ID_FILTER').Value:=(Owner as TDocWorkForm).FILTER_ID_SESSION;
  ReportDataSet.CloseOpen(false);

  if not cxExportExel.Checked then
  begin
    fMemo:=frxReport.FindObject('MemoFilter') as TfrxMemoView;
    for i:=0 to FILTER_STR.Count-1 do
      fMemo.Memo.Add(FILTER_STR.Strings[i]);
    fMemo.Memo.Add('');

    if not cxCheckBalSch.Checked then
    begin
      GrpBand:=frxReport.FindObject('GroupHeaderBalSch') as TfrxBand;
      GrpBand.Visible:=false;
      GrpBand:=frxReport.FindObject('GroupFooterBalSch') as TfrxBand;
      GrpBand.Visible:=false;
    end;
    if cxSpinEditLevel.Value<4 then
    begin
      GrpBand:=frxReport.FindObject('GroupHeaderGrp1') as TfrxBand;
      GrpBand.Visible:=false;
      GrpBand:=frxReport.FindObject('GroupFooterGrp1') as TfrxBand;
      GrpBand.Visible:=false;
    end;
    if cxSpinEditLevel.Value<3 then
    begin
      GrpBand:=frxReport.FindObject('GroupHeaderGrp2') as TfrxBand;
      GrpBand.Visible:=false;
      GrpBand:=frxReport.FindObject('GroupFooterGrp2') as TfrxBand;
      GrpBand.Visible:=false;
    end;
    if cxSpinEditLevel.Value<2 then
    begin
      GrpBand:=frxReport.FindObject('GroupHeaderGrp3') as TfrxBand;
      GrpBand.Visible:=false;
      GrpBand:=frxReport.FindObject('GroupFooterGrp3') as TfrxBand;
      GrpBand.Visible:=false;
    end;
    if cxSpinEditLevel.Value<1 then
    begin
      GrpBand:=frxReport.FindObject('GroupHeaderGrp4') as TfrxBand;
      GrpBand.Visible:=false;
      GrpBand:=frxReport.FindObject('GroupFooterGrp4') as TfrxBand;
      GrpBand.Visible:=false;
    end;

    frxReport.Variables['DateB']:= ''''+DateToStr(DBEG)+'''';
    frxReport.Variables['DateE']:= ''''+DateToStr(DEND)+'''';
    frxReport.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
    frxReport.Variables['ORG_SHORT_NAME']:=''''+_ORG_SHORT_NAME+'''';
    frxReport.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
    frxReport.Variables['TYPE']:=''''+type_doc+'''';
    frxReport.Variables['FILTER_STR']:=QuotedStr(''); //''''+FILTER_STR+'''';
    frxReport.PrintOptions.Copies:=cxCopies.Value;
    frxReport.PrintOptions.ShowDialog:=cxSelectPrinter.Checked;
    if cxCheckOnPrinter.Checked then
      frxReport.Print
    else
      frxReport.ShowReport;
    if cxCheckEdit.Checked then
      frxReport.DesignReport;
  end
  else
  begin
   ExportDataSet(Self,  ReportDataset);
  end;
end;

procedure TDocWorkPrintMatRep.ActionOkExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

procedure TDocWorkPrintMatRep.ActionCancelExecute(Sender: TObject);
begin
  Close;
end;

end.

