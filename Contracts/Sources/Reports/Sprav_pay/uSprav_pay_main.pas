unit uSprav_pay_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, ImgList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  FIBDatabase, pFIBDatabase, Ibase, DB, FIBDataSet, pFIBDataSet, frxClass,
  frxDBSet, FIBQuery, pFIBQuery, pFIBStoredProc, frxExportImage, frxExportPDF,
  frxExportRTF, frxExportXLS, frxExportHTML, frxExportTXT, cn_Common_Types, cn_Common_Funcs,
  uZProc;

type
  TfrmSprav_pay_main = class(TForm)
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
    ComboBox_year: TcxComboBox;
    Label2: TLabel;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure acDebugExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
      id_student : int64;
  public
    IsDebugMode: boolean;
    PathToPf : string;
    constructor Create(AParameter:TcnSimpleParamsEx); reintroduce; overload;
  end;

  function ShowSprav_pay(AParameter:TcnSimpleParamsEx):Variant;stdcall;
  exports ShowSprav_pay;

var
  frmSprav_pay_main: TfrmSprav_pay_main;

implementation

{$R *.dfm}

function ShowSprav_pay(AParameter:TcnSimpleParamsEx):Variant;
var
 ViewForm : TfrmSprav_pay_main;
begin
  ViewForm := TfrmSprav_pay_main.Create(AParameter);
  ViewForm.FormStyle:= fsNormal;
  ViewForm.ShowModal;
  ViewForm.free;
end;

constructor TfrmSprav_pay_main.Create(AParameter:TcnSimpleParamsEx);
begin
  inherited Create (AParameter.Owner);
  DatabasePrint.Handle := AParameter.Db_Handle;
  ButtonOk.Caption     := 'Друкувати';
  ButtonCancel.Caption := 'Вiдмiнити';
  LabelTitel.Caption   := 'Довідка за ';
  Caption              := 'Друк довiдки';
  id_student           := AParameter.cnParamsToPakage.ID_STUD;
end;

procedure TfrmSprav_pay_main.ActionCancelExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmSprav_pay_main.ButtonOkClick(Sender: TObject);
var
    datenow, god : string;
    id_session : int64;
    Total_summ : Extended;
    Summ_str : string;
begin
    datenow := ComboBox_year.Text;
    god     := datenow[3] + datenow[4];

    WriteProc.StoredProcName := 'CN_ADD_TO_SYS_PRINT';
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('GOD_ALL').AsString := datenow;
    WriteProc.ExecProc;
    WriteProc.Transaction.Commit;

    pFIBDataSetSelPoIdStud.Close;
    pFIBDataSetSelPoIdStud.SQLs.SelectSQL.Text := 'SELECT * FROM CN_PRINT_SPR_ABOUT_OPL_BY_YEAR('+IntToStr(id_student)+','''+god+''','''+datenow+''')';
    pFIBDataSetSelPoIdStud.Open;

    Total_summ := 0;
    while not pFIBDataSetSelPoIdStud.Eof do
     Begin
      if pFIBDataSetSelPoIdStud['summ'] <> null
       Then Total_summ := Total_summ + pFIBDataSetSelPoIdStud['summ']
       else Total_summ := Total_summ + 0;
      pFIBDataSetSelPoIdStud.Next;
     end;

    pFIBDataSetSelPoIdStud.First;

    Summ_str := SumToString(Total_summ,cnLanguageIndex());

    if (pFIBDataSetSelPoIdStud['ID_SESSION'] <> null)  then
     begin
      id_session := pFIBDataSetSelPoIdStud['ID_SESSION'];

      frxReportOpl.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Contracts\Sprav_pay.fr3');
      frxReportOpl.Variables.Clear;

      frxReportOpl.Variables['TOTAL_SUMM']  := ''''+ Summ_str + '''';

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
     end
    else ShowMessage('Данi не сформовано, тому друк не можливий!');
end;

procedure TfrmSprav_pay_main.acDebugExecute(Sender: TObject);
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

procedure TfrmSprav_pay_main.FormCreate(Sender: TObject);
var
  i : Integer;
  year, month, day : word;
begin
  IsDebugMode:=false;

  DecodeDate(Now, year, month, day);

  ComboBox_year.Properties.Items.Clear;
  For i:= year downto 1950 do ComboBox_year.Properties.Items.Add(IntToStr(i));
  ComboBox_year.ItemIndex := 0;
end;



end.
