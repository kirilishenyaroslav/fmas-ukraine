unit uPrintOst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, StdCtrls, cxLookAndFeelPainters, cxButtons, cxSpinEdit,
  cxCheckBox, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ibase, cxDropDownEdit,
  cxCalendar, ActnList, DateUtils, uMatasVars, frxDesgn,
  frxClass, frxDBSet, frxExportXLS, uMatasUtils, uPackageManager,
  frxExportRTF, frxExportPDF, frxExportHTML;

type
  TPrintOstForm = class(TForm)
    lbl1: TLabel;
    BEGrTMC: TcxButtonEdit;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    lbl2: TLabel;
    cxExportExel: TcxCheckBox;
    cxCopies: TcxSpinEdit;
    cxCheckEditRep: TcxCheckBox;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    DB_Print: TpFIBDatabase;
    DS_Print: TpFIBDataSet;
    TR_Print: TpFIBTransaction;
    ST_Print: TpFIBStoredProc;
    cxFilterDateBeg: TcxDateEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    cxFilterDateEnd: TcxDateEdit;
    actlst1: TActionList;
    actPrint: TAction;
    actCancel: TAction;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxXLSExport1: TfrxXLSExport;
    lbl5: TLabel;
    CB: TcxComboBox;
    frxReport1: TfrxReport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport2: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    procedure BEGrTMCPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actClearExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
    ID_USER : Int64;
  public
    ID_SESSION:Integer;
    Priznak:Integer;
    id:Variant;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);overload;
  end;

procedure ShowPrintOstForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);stdcall;

exports ShowPrintOstForm;
var
  PrintOstForm: TPrintOstForm;

implementation

{$R *.dfm}
procedure ShowPrintOstForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64);stdcall;
var
    form : TPrintOstForm;
begin
    form := TPrintOstForm.Create(AOwner, DBHANDLE,ID_USER);
   // form.ID_USER := ID_USER;
    Form.Show;

//    form.Free;

end;

constructor TPrintOstForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.DB_Print.Close;
   Self.DB_Print.Handle:=DBHANDLE;
   Self.Priznak:=PRIZNAK;
   self.cxFilterDateBeg.Date:=StartOfTheMonth(_MATAS_PERIOD);
   self.cxFilterDateEnd.Date:=EndOfTheMonth(_MATAS_PERIOD);
   ID_SESSION:=DB_Print.Gen_Id('MAT_ID_SESSION',1,TR_Print);
   CB.ItemIndex:=0;
   cxCheckEditRep.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
 end;
end;

procedure TPrintOstForm.BEGrTMCPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 // FM:=TInvAddGroupForm.Create(Self,DBHANDLE, ID_USER, ID_SESSION, 5, _MATAS_PERIOD);

  BEGrTMC.Text:=VarToStr(uPackageManager.GetGruppTMC(Self,DBHANDLE, ID_USER, ID_SESSION, 5, _MATAS_PERIOD, 'группи ТМЦ',1));

//  st_gruppa:=BEGrTMC.Text;

end;

procedure TPrintOstForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
   TR_Print.StartTransaction;
   ST_Print.StoredProcName:='MAT_FILTER_CLEANER';
   ST_Print.Prepare;

   ST_Print.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   ST_Print.ParamByName('ID_OBJECT').AsInt64:=5;

   ST_Print.ExecProc;
   ST_Print.Transaction.Commit;
   except on E : Exception
    do begin
    ShowMessage(E.Message);
    ST_Print.Transaction.Rollback;
    Exit;
  end;
 end;
 BEGrTMC.Text:='';
  if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TPrintOstForm.actClearExecute(Sender: TObject);
begin
 try
   TR_Print.StartTransaction;
   ST_Print.StoredProcName:='MAT_FILTER_CLEANER';
   ST_Print.Prepare;

   ST_Print.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   ST_Print.ParamByName('ID_OBJECT').AsInt64:=5;

   ST_Print.ExecProc;
   ST_Print.Transaction.Commit;
   except on E : Exception
    do begin
    ShowMessage(E.Message);
    ST_Print.Transaction.Rollback;
    Exit;
  end;
 end;
BEGrTMC.Text:='';  
end;

procedure TPrintOstForm.actPrintExecute(Sender: TObject);
var zapros:string;
    w: TForm;
begin
  w:=ShowWaitWindow(self);
  PRIZNAK:=CB.ItemIndex;
  Zapros:=' SELECT A.* FROM MAT_INV_SEL_TO_GRID_EX_2(' +IntToStr(ID_SESSION)+') A ';

  if priznak = 0 then
  Zapros:= Zapros + ' WHERE A.DATE_EXPL BETWEEN :DATE_BEG AND :DATE_END';

  if priznak = 1 then
  Zapros:= Zapros + ' WHERE  A.DATE_OUT BETWEEN :DATE_BEG AND :DATE_END';

  if Priznak = 2 then
  begin
   Zapros:=' SELECT A.* FROM MAT_INV_SEL_TO_GRID_EX_3(' +IntToStr(ID_SESSION)+') A ';
   Zapros:= Zapros + ' WHERE  A.DATE_DOC BETWEEN :DATE_BEG AND :DATE_END';
  end;

  if Priznak = 2 then
  Zapros:=Zapros+' ORDER BY A.NUM_SCH, A.FIO_MOL_NEW, A.INV_NUM'
  else
  Zapros:=Zapros+' ORDER BY A.NUM_SCH, A.FIO_MOL';
 
  DS_Print.Close;
  DS_Print.SelectSQL.Clear;
  DS_Print.SelectSQL.Add(Zapros);
  DS_Print.Prepare;
  DS_Print.ParamByName('DATE_BEG').AsDate:= cxFilterDateBeg.EditValue;
  DS_Print.ParamByName('DATE_END').AsDate:= cxFilterDateEnd.EditValue;
  DS_Print.CloseOpen(False);

  CloseWaitWindow(w);

  if Priznak = 2 then
   frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\InvKartVnutrPerem.fr3')
  else
   frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\InvKartDateExpl.fr3');

  frxReport1.Variables['ORG_NAME']:=''''+_ORG_FULL_NAME+'''';
  frxReport1.Variables['ORG_KOD_OKPO']:=''''+_ORG_KOD_OKPO+'''';
  frxReport1.Variables['DATE_BEG']:=''''+DateToStr(cxFilterDateBeg.EditValue)+'''';
  frxReport1.Variables['DATE_END']:=''''+DateToStr(cxFilterDateEnd.EditValue)+'''';
  
  if priznak = 0 then
  frxReport1.Variables['TIP']:='''введених до''';

  if priznak = 1 then
  frxReport1.Variables['TIP']:='''виведених з''';

  if priznak = 2 then
  frxReport1.Variables['TIP']:='''Внутрішнє переміщення''';


  if not cxExportExel.Checked then
  begin
  frxReport1.PrepareReport;
    frxReport1.PrintOptions.ShowDialog:=True;

   if cxCopies.Value>1 then
    frxReport1.PrintOptions.Copies:=cxCopies.Value;

    if cxCheckOnPrinter.Checked then
    frxReport1.Print
    else
    if cxCheckEditRep.Checked then
     frxReport1.DesignReport
     else
     frxReport1.ShowReport;
    end
    else
    ExportDataSet(Self,  DS_Print);

end;

procedure TPrintOstForm.actCancelExecute(Sender: TObject);
begin
close;//if FormStyle = fsMDIChild then Action := caFree;
end;

end.
