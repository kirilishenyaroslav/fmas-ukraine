unit uDocFiltr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ibase,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, frxClass,
  frxDesgn, frxDBSet, uWate, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxCheckBox, uMainPerem;

type
  TPrintForm = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actlst1: TActionList;
    actPrint: TAction;
    actClose: TAction;
    db_print: TpFIBDatabase;
    ds_print: TpFIBDataSet;
    tr_print: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxReport1: TfrxReport;
    chbPrinter: TcxCheckBox;
    chbChoosePrinter: TcxCheckBox;
    lbl5: TLabel;
    cxCopies: TcxSpinEdit;
    cxCheckEdit: TcxCheckBox;
    actDesign: TAction;
    procedure actPrintExecute(Sender: TObject);
    procedure actDesignExecute(Sender: TObject);
  private
    { Private declarations }
  public
    DB_HANDLE:TISC_DB_HANDLE;
    d_beg, d_end:TDateTime;
    is_dk:Integer;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; DBEG:TDateTime; DEND:TDateTime; is_debkr:Integer);overload;
  end;

var
  PrintForm: TPrintForm;

implementation

{$R *.dfm}
constructor TPrintForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; DBEG:TDateTime; DEND:TDateTime; is_debkr:Integer);
begin
 inherited Create(AOwner);
  if Assigned(DBHandle)
  then begin
   Self.DB_HANDLE := DBHandle;
   Self.db_print.Close;
   Self.db_print.Handle:=DBHANDLE;
   self.ds_print.close;
   D_BEG:=DBEG;
   D_END:=DEND;
   is_dk:=is_debkr;
  end;
end;

procedure TPrintForm.actPrintExecute(Sender: TObject);
var Wf:TWateForm;
    text_zapros: string;
begin
 text_zapros:='SELECT * FROM PC_DT_DEB_KR_DOC(:DATE_BEG, :DATE_END, :IS_DEB_KR, :id_reg)';

 Wf:=TWateForm.Create(Self);
 Wf.cxLabel1.Caption:='';
 Wf.cxLabel1.Caption:='Увага! Триває збір даних за документами! ';
 Wf.Show;
 Wf.Update;

 ds_print.Close;
 ds_print.SelectSQL.Clear;

 ds_print.SelectSQL.Add(text_zapros);
 ds_print.Prepare;
 ds_print.ParamByName('DATE_BEG').AsDate:=D_BEG;
 ds_print.ParamByName('DATE_END').AsDate:=D_END;
 ds_print.ParamByName('IS_DEB_KR').AsInteger:=is_dk;
 ds_print.ParamByName('ID_REG').AsInteger:=ID_REG;
 ds_print.CloseOpen(False);

 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+ '\frReestrDoc.fr3');
  Wf.Free;
  frxReport1.PrepareReport;

  if cxCopies.Value>1 then
   frxReport1.PrintOptions.Copies:=cxCopies.Value;

  frxReport1.PrintOptions.ShowDialog:=chbChoosePrinter.Checked;
  frxReport1.PrintOptions.ShowDialog:=True;

  if cxCopies.Value>1 then
   frxReport1.PrintOptions.Copies:=cxCopies.Value;

  frxReport1.PrintOptions.ShowDialog:=chbChoosePrinter.Checked;

  if chbPrinter.Checked then  frxReport1.Print
  else frxReport1.ShowReport;

  if cxCheckEdit.Checked then  frxReport1.DesignReport;
end;

procedure TPrintForm.actDesignExecute(Sender: TObject);
begin
 cxCheckEdit.Visible:=not(cxCheckEdit.Visible) ;
end;

end.
