unit uKForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase, cxDropDownEdit, cxCalendar,
  cxSpinEdit, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, StdCtrls, DB, FIBDataSet, pFIBDataSet, ActnList, FIBQuery,
  pFIBQuery, pFIBStoredProc, frxClass, frxDBSet, frxDesgn, uMainPerem, DateUtils,
  cxLookAndFeelPainters, cxButtons;

type
  TKassForm = class(TForm)
    DatabaseWork: TpFIBDatabase;
    lbl2: TLabel;
    lbl7: TLabel;
    cxPrintForm: TcxComboBox;
    chbPrinter: TcxCheckBox;
    chbChoosePrinter: TcxCheckBox;
    lbl5: TLabel;
    cxCopies: TcxSpinEdit;
    cxDateBeg: TcxDateEdit;
    Label1: TLabel;
    cxDateEnd: TcxDateEdit;
    frxReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    Transaction: TpFIBTransaction;
    StPr: TpFIBStoredProc;
    actlst1: TActionList;
    actClose: TAction;
    actPrint: TAction;
    actdesigne: TAction;
    DataSetWork: TpFIBDataSet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxCheckEdit: TcxCheckBox;
    procedure actdesigneExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
     DBHANDLE : TISC_DB_HANDLE;
  public
     constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;
  procedure ShowKassDayForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE); stdcall;
  exports ShowKassDayForm;
var
  KassForm: TKassForm;

implementation

{$R *.dfm}
uses uWate;

constructor TKassForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.DatabaseWork.Close;
  Self.DatabaseWork.Handle:=DBHANDLE;
  Self.cxDateBeg.Date:=PERS_PAY_PERIOD;
  Self.cxDateEnd.Date:=PERS_PAY_PERIOD;
  self.cxPrintForm.ItemIndex:=0;
 end;
end;

procedure ShowKassDayForm(AOwner:TComponent;  DBHANDLE : TISC_DB_HANDLE);stdcall;
var
 form : TKassForm;
begin
 form := TKassForm.Create(AOwner, DBHANDLE);
 Form.Show;// = mrOk then Form.free;;
// Form.Free;
end;
procedure TKassForm.actdesigneExecute(Sender: TObject);
begin
 if cxCheckEdit.Visible = true then cxCheckEdit.Visible:=False
 else cxCheckEdit.Visible:=True;
end;

procedure TKassForm.actCloseExecute(Sender: TObject);
begin
Close;
end;

procedure TKassForm.actPrintExecute(Sender: TObject);
var Wf:TWateForm;
    period:string;
begin
 Wf:=TWateForm.Create(Self);
 Wf.cxLabel1.Caption:='';
 Wf.cxLabel1.Caption:='Увага! Триває збір даних за рахунками! ';
 Wf.Show;
 Wf.Update;

 DataSetWork.Close;
 DataSetWork.SelectSQL.Clear;
 DataSetWork.SelectSQL.Text:='select * from PC_KASS_DAY(:date_beg,:date_end,:id_reg)';
 DataSetWork.Prepare;
 DataSetWork.ParamByName('DATE_BEG').AsDateTime:=cxDateBeg.Date;
 DataSetWork.ParamByName('DATE_END').AsDateTime:=cxDateEnd.Date;
 DataSetWork.ParamByName('ID_REG').AsInteger:=ID_REG;
 DataSetWork.CloseOpen(False);
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+ '\KasOtch.fr3');
  period:='';

  if cxDateBeg.Date=cxDateEnd.Date then period:= DatetoStr(cxDateBeg.Date)
  else period:=' період з '+DateToStr(cxDateBeg.Date)+' по '+DateToStr(cxDateEnd.Date);
  frxReport.Variables['PERIOD']:=''''+period+'''';

  Wf.Free;
  frxReport.PrepareReport;
  if cxCopies.Value>1 then
  frxReport.PrintOptions.Copies:=cxCopies.Value;
  frxReport.PrintOptions.ShowDialog:=chbChoosePrinter.Checked;
  frxReport.PrintOptions.ShowDialog:=True;

  if cxCopies.Value>1 then
  frxReport.PrintOptions.Copies:=cxCopies.Value;

  frxReport.PrintOptions.ShowDialog:=chbChoosePrinter.Checked;

  if chbPrinter.Checked then  frxReport.Print
  else frxReport.ShowReport;

  if cxCheckEdit.Checked then  frxReport.DesignReport;
end;

end.
