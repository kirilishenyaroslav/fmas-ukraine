unit uPrintWorkedDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxButtonEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls,
  cxButtons, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, uMatasUtils, uMatasVars, ibase,
  uResources, uSpTipDocMulti, DateUtils, frxClass, frxDBSet, cxCheckBox,
  cxSpinEdit;

type
  TPrintWorkedForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDatebeg: TcxDateEdit;
    cxDateEnd: TcxDateEdit;
    cxTIPD: TcxButtonEdit;
    WorkDatabase: TpFIBDatabase;
    WorkDataSet: TpFIBDataSet;
    WorkStoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    WorkDataSetID_DOC: TFIBBCDField;
    WorkDataSetID_TIPD: TFIBBCDField;
    WorkDataSetDATE_DOC: TFIBDateField;
    WorkDataSetNUM_DOC: TFIBStringField;
    WorkDataSetID_MO_IN: TFIBBCDField;
    WorkDataSetID_MO_OUT: TFIBBCDField;
    WorkDataSetSUMMA_DOC: TFIBBCDField;
    WorkDataSetID_NOMN: TFIBBCDField;
    WorkDataSetKOL_MAT: TFIBBCDField;
    WorkDataSetPRICE: TFIBBCDField;
    WorkDataSetSUMMA_POS: TFIBBCDField;
    WorkDataSetID_OPER: TFIBBCDField;
    WorkDataSetSUMMA_PROV: TFIBBCDField;
    WorkDataSetNAME: TFIBStringField;
    WorkDataSetFIO_IN: TFIBStringField;
    WorkDataSetNAME_DEP_IN: TFIBStringField;
    WorkDataSetFIO_OUT: TFIBStringField;
    WorkDataSetNAME_DEP_OUT: TFIBStringField;
    WorkDataSetOTIPD: TFIBStringField;
    WorkDataSetNAME_CUSTOMER: TFIBStringField;
    WorkDataSetDB_ID_SCH: TFIBBCDField;
    WorkDataSetKR_ID_SCH: TFIBBCDField;
    WorkDataSetDB_SCH: TFIBStringField;
    WorkDataSetKR_SCH: TFIBStringField;
    WorkDataSetID_CUST: TFIBBCDField;
    WorkDataSetID_POS: TFIBBCDField;
    ckbox: TcxCheckBox;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    lbl4: TLabel;
    cxCopies: TcxSpinEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxTIPDPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    FILTER_ID_SESSION: Integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; dbeg:TDate; dend:TDate);overload;
  end;

var
  PrintWorkedForm: TPrintWorkedForm;

implementation

{$R *.dfm}

constructor TPrintWorkedForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; dbeg:TDate; dend:TDate);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.WorkDatabase.Close;
  Self.WorkDatabase.Handle:=DBHANDLE;
 end;
 FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION', 1);
 cxDatebeg.EditValue:= dbeg;
 cxDateEnd.EditValue:=dend;
 ckbox.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
end;

procedure TPrintWorkedForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

procedure TPrintWorkedForm.cxTIPDPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  FormResult: Boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
  Res:=uSpTipDocMulti.GetTipDocMulti(self, self.DBHANDLE, 0, FILTER_ID_SESSION, FormResult);
  if FormResult then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxTIPD.Text := s;
  end
 end

end;

procedure TPrintWorkedForm.cxButton1Click(Sender: TObject);
begin
WorkDataSet.Close;
WorkDataSet.SelectSQL.Clear;
WorkDataSet.SelectSQL.Add('SELECT * FROM MAT_PRINT_WORKED_DOC(:DATE_BEG, :DATE_END, :ID_SESSION) ORDER BY id_tipd,  date_doc, num_doc');
WorkDataSet.Prepare;
WorkDataSet.ParamByName('date_beg').AsDate:=cxDatebeg.EditValue;
WorkDataSet.ParamByName('date_end').AsDate:=cxDateEnd.EditValue;
WorkDataSet.ParamByName('id_session').AsInteger:=FILTER_ID_SESSION;
workdataset.CloseOpen(False);

 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\PrintWorkedDoc.fr3');
 if cxCopies.Value>1 then
  frxReport1.PrintOptions.Copies:=cxCopies.Value;
  frxReport1.PrintOptions.ShowDialog:=cxSelectPrinter.Checked;
 if cxCheckOnPrinter.Checked then frxReport1.Print
 else frxReport1.ShowReport;
 if ckbox.Checked then frxReport1.DesignReport;
end;

end.
