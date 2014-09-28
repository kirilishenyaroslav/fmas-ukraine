unit PrintDogsMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, ImgList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  FIBDatabase, pFIBDatabase, Ibase, {frxClass,} DB, FIBDataSet, pFIBDataSet,
  {frxDBSet,} UConstant, frxClass, frxDBSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, frxExportImage, frxExportPDF, frxExportRTF, frxExportXLS,
  frxExportHTML, frxExportTXT, cn_Common_Types;

type
  TfmMainPrint = class(TForm)
    ButtonOk: TcxButton;
    ButtonCancel: TcxButton;
    ImageListPrint: TImageList;
    ActionList1: TActionList;
    ActionCancel: TAction;
    DatabasePrint: TpFIBDatabase;
    Tr_Read: TpFIBTransaction;
    DBDatasetPrintOpl: TfrxDBDataset;
    LabelTitel: TLabel;
    pFIBDataSetSelPoIdStud: TpFIBDataSet;
    Tr_Write: TpFIBTransaction;
    WriteProc: TpFIBStoredProc;
    frxReportOpl: TfrxReport;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxJPEGExport1: TfrxJPEGExport;
    acDebug: TAction;
    Label1: TLabel;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure acDebugExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
      id_student : int64;
      date_dog : TDate;
  public
    IsDebugMode: boolean;
    PathToPf : string;
    constructor Create(AParameter:TcnSimpleParamsEx); reintroduce; overload;
  end;

var
  fmMainPrint: TfmMainPrint;

implementation

{$R *.dfm}

constructor TfmMainPrint.Create(AParameter:TcnSimpleParamsEx);
begin
  inherited Create (AParameter.Owner);

  DatabasePrint.Handle := AParameter.Db_Handle;

  ButtonOk.Caption     := Dogs_Print_Opl_button;
  ButtonCancel.Caption := Dogs_Print_Opl_cancel;
  LabelTitel.Caption   := Dogs_Print_Opl_Titel;
  Caption              := Dogs_Print_Opl_Caption;

  id_student := AParameter.cnParamsToPakage.ID_STUD;
  date_dog   := AParameter.cnParamsToPakage.DATE_DOG;
end;

procedure TfmMainPrint.ActionCancelExecute(Sender: TObject);
begin
    close;
end;

procedure TfmMainPrint.ButtonOkClick(Sender: TObject);
var
    today, datenow, god : string;
    id_session : int64;
begin
    today   := DateToStr(Date);
    god     := today[9]+today[10];
    datenow := today[7] + today[8] + today[9] + today[10];

    WriteProc.StoredProcName := 'CN_ADD_TO_SYS_PRINT';
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('GOD_ALL').AsString := datenow;
    WriteProc.ExecProc;
    WriteProc.Transaction.Commit;

    //frxVariable['todayd'] :=today;
    pFIBDataSetSelPoIdStud.Close;
    pFIBDataSetSelPoIdStud.SQLs.SelectSQL.Text := 'SELECT * FROM CN_PRINT_SPR_ABOUT_OPL('+IntToStr(id_student)+','''+god+''','''+datenow+''')';
    pFIBDataSetSelPoIdStud.Open;

    if (pFIBDataSetSelPoIdStud['ID_SESSION'] <> null)
      then
       begin
        id_session := pFIBDataSetSelPoIdStud['ID_SESSION'];

        frxReportOpl.LoadFromFile(ExtractFilePath(Application.ExeName)+ PathToPf);// 'SprForOpl.fr3');
        frxReportOpl.Variables.Clear;

        frxReportOpl.Variables['DATE_DOG']:=''''+DateToStr(DATE_DOG)+'''';

        frxReportOpl.PrepareReport;
        if IsDebugMode
         then frxReportOpl.DesignReport
         else frxReportOpl.ShowReport;

        WriteProc.StoredProcName := 'CN_PAY_TMP_CLEAR';
        WriteProc.Transaction.StartTransaction;
        WriteProc.Prepare;
        WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session;
        WriteProc.ExecProc;
        WriteProc.Transaction.Commit;
        WriteProc.Close;

       close;
    end else
    begin
        ShowMessage(Dogs_Print_Opl_Error);
    end

end;

procedure TfmMainPrint.acDebugExecute(Sender: TObject);
begin
   if not IsDebugMode
    then
     begin
      IsDebugMode:=true;
      Label1.Caption:='*debug';
     End
    Else
     begin
      IsDebugMode:=False;
      Label1.Caption:='';
     End
end;

procedure TfmMainPrint.FormCreate(Sender: TObject);
var
  Virtual_DataSet: TpFIBDataSet;
  type_pf : string;
begin
  IsDebugMode:=false;
  Virtual_DataSet        := TpFIBDataSet.Create(nil);
  Virtual_DataSet.Database:= DatabasePrint;
  Virtual_DataSet.Transaction := Tr_Read;
  type_pf := '1';
  Virtual_DataSet.Close;
  Virtual_DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM cn_print_sel_path('''+type_pf+''')';
  Virtual_DataSet.Open;
  PathToPf := Virtual_DataSet['pathtoname'];
  Virtual_DataSet.Close;
  Virtual_DataSet.Free;
end;



end.
