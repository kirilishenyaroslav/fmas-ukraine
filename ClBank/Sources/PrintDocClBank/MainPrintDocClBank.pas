unit MainPrintDocClBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxCheckBox,IBase, FIBDatabase,
  pFIBDatabase, frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet, frxDesgn,
  LoadDogManedger,DogLoaderUnit;

type
  TfrmMainPrint = class(TForm)
    StatusBar1: TStatusBar;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButtonEditRS: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDateEditDate: TcxDateEdit;
    GroupBox1: TGroupBox;
    cxCheckBoxPR: TcxCheckBox;
    cxCheckBoxALL: TcxCheckBox;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    pFIBDataSetPrint: TpFIBDataSet;
    frxDBDatasetPrint: TfrxDBDataset;
    frxDesigner: TfrxDesigner;
    frxReport: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEditRSPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Variant);overload;
    { Private declarations }
  public
    { Public declarations }
  end;
function PrintDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Variant):Integer;stdcall;
exports PrintDocClBank;

var
  frmMainPrint: TfrmMainPrint;
  id_rs:Int64;
  rate_acc_un:Int64;
implementation
uses Accmgmt;

{$R *.dfm}

function PrintDocClBank(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Variant):Integer;
var
  print:TfrmMainPrint;
begin
  print:=TfrmMainPrint.Create(AOwner,DB,Type_print);
end;

constructor TfrmMainPrint.Create (AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Variant);
begin
  inherited Create(AOwner);
  Database.Handle:=DB;
end;


procedure TfrmMainPrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfrmMainPrint.cxButton1Click(Sender: TObject);
begin
if cxCheckBoxPR.Checked=true then
  begin
    pFIBDataSetPrint.Active:=false;
    pFIBDataSetPrint.SelectSQL.Text:='select * from CLBANK_PRINT_DOCRAS(:param_rs,:param_date) order by summa';
    pFIBDataSetPrint.ParamByName('param_rs').AsInt64:=id_rs;
    pFIBDataSetPrint.ParamByName('param_date').AsDate:=cxDateEditDate.Date;
    pFIBDataSetPrint.Active:=true;

    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\ClBank\PrintReestr.fr3');
    frxReport.Variables['DATE_BEG']:= ''''+DateToStr(cxDateEditDate.Date)+'''';

    frxReport.PrepareReport(true);
    frxReport.ShowReport(true);

//    frxReport.DesignReport;
  end;
if cxCheckBoxALL.Checked=true then
  begin
    pFIBDataSetPrint.Active:=false;
    pFIBDataSetPrint.SelectSQL.Text:='select * from clbank_print_docall(:param_rs,:param_date)order by sum_prihod,sum_ras';
    pFIBDataSetPrint.ParamByName('param_rs').AsInt64:=id_rs;
    pFIBDataSetPrint.ParamByName('param_date').AsDate:=cxDateEditDate.Date;
    pFIBDataSetPrint.Active:=true;

    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\ClBank\PrintVip.fr3');
    frxReport.Variables['DATE_BEG']:= ''''+DateToStr(cxDateEditDate.Date)+'''';

    frxReport.Variables['name_buh']    := QuotedStr(GetUserFIO);

    if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then
      frxReport.DesignReport
    else frxReport.ShowReport;
    //frxReport.PrepareReport(true);
    //frxReport.ShowReport(true);

   // frxReport.DesignReport;

  end;
end;

procedure TfrmMainPrint.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainPrint.cxButtonEditRSPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret:Variant;
begin
ret :=LoadDogManedger.WorkSpMfoRsch(self,Database.Handle, fsNormal, 'get', -1);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      rate_acc_un := ret[0][0];
      cxButtonEditRS.Text :=ret[0][4]+' Ã‘Œ '+ret[0][2]+' –/– '+ret[0][3];
      id_rs:=rate_acc_un;
    end;
  end;
end;

end.
