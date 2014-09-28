unit uKassDay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxCheckBox, cxSpinEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, frxClass, frxDesgn,
  frxDBSet, DB, FIBDataSet, pFIBDataSet, ActnList, PCLib, cxCalendar, DateUtils, uMAinPerem;

type
  TKasDayForm = class(TForm)
    DB: TpFIBDatabase;
    lbl2: TLabel;
    lbl4: TLabel;
    chbPrinter: TcxCheckBox;
    chbChoosePrinter: TcxCheckBox;
    lbl5: TLabel;
    cxCopies: TcxSpinEdit;
    cxPrintForm: TcxComboBox;
    lbl7: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    actPrint: TAction;
    actCancel: TAction;
    DS: TpFIBDataSet;
    TR: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxReport: TfrxReport;
    cxCheckEdit: TcxCheckBox;
    actDes: TAction;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    procedure actCancelExecute(Sender: TObject);
    procedure actDesExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowKassDayForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE); stdcall;
  exports ShowKassDayForm;
var
  KasDayForm: TKasDayForm;

implementation

{$R *.dfm}
procedure ShowKassDayForm(AOwner:TComponent;  DBHANDLE : TISC_DB_HANDLE);stdcall;
var
 form : TKasDayForm;
begin
 form := TKasDayForm.Create(AOwner, DBHANDLE);
 Form.Show;
end;

constructor TKasDayForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
begin
inherited Create(AOwner);
if Assigned(DBHandle)
then begin
 Self.DBHANDLE := DBHandle;
 Self.DB.Close;
 Self.DB.Handle:=DBHANDLE;
 self.cxDateEdit1.Date:=PERS_PAY_PERIOD;
 self.cxDateEdit2.Date:=PERS_PAY_PERIOD;
end;
end;

procedure TKasDayForm.actCancelExecute(Sender: TObject);
begin
Close;
end;

procedure TKasDayForm.actDesExecute(Sender: TObject);
begin
if cxCheckEdit.Visible = True then cxCheckEdit.Visible:=False
else cxCheckEdit.Visible:=True;
end;

procedure TKasDayForm.actPrintExecute(Sender: TObject);
var date_beg, date_end:TDateTime;
begin
date_beg:=cxDateEdit1.DAte;
date_end:=cxDateEdit2.Date;
ds.close;
ds.selectSql.Clear;
ds.selectSql.Text:='select * from pc_kass_day(:id_reg, :date_beg,:date_end)';
ds.prepare;
DS.ParamByName('ID_REG').AsInteger:=ID_REG;
DS.ParamByName('DATE_BEG').AsDateTime:=cxDateEdit1.Date;
DS.ParamByName('ID_REG').AsDateTIme:=cxDateEdit2.Date;
DS.CloseOpen(false);

if cxCheckEdit.Checked then  frxReport.DesignReport
else frxReport.ShowReport;


end;

end.
