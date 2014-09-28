unit MainPrintDocChP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxDropDownEdit, cxCalendar, frxDesgn, frxClass,
  frxDBSet, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,IBase,
  cxRadioGroup, cxLookAndFeelPainters, StdCtrls, cxButtons, frxExportPDF,
  frxExportImage, frxExportRTF, frxExportXML, frxExportXLS, frxExportHTML,
  frxExportTXT, ExtCtrls, cxCalc, ConstClBank, cxButtonEdit, DogLoaderUnit;

type
  TfrmMainPrintDocChP = class(TForm)
    StatusBar1: TStatusBar;
    cxLabel1: TcxLabel;
    cxLabelBegin: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxDateEditBegin: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    Database: TpFIBDatabase;
    pFIBDataSetPrint: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    frxDBDatasetPrint: TfrxDBDataset;
    frxDesigner: TfrxDesigner;
    cxButtonOK: TcxButton;
    cxButtonClose: TcxButton;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    RadioGroupTypeDoc: TRadioGroup;
    cxMaskEditBegin: TcxMaskEdit;
    cxMaskEditEnd: TcxMaskEdit;
    cxButtonEditRSPost: TcxButtonEdit;
    cxLabel6: TcxLabel;
    frxReport: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
    procedure cxButtonEditRSPostPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Variant);overload;
  public
    id_customer : int64;
  end;

function PrintDocChP(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Variant):Integer;stdcall;
exports PrintDocChP;

var
  frmMainPrintDocChP: TfrmMainPrintDocChP;

implementation

{$R *.dfm}

function PrintDocChP(AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Variant):Integer;
var
  print:TfrmMainPrintDocChP;
begin
  print:=TfrmMainPrintDocChP.Create(AOwner,DB,Type_print);
end;


constructor TfrmMainPrintDocChP.Create (AOwner : TComponent;DB:TISC_DB_HANDLE;Type_print:Variant);
begin
  inherited Create(AOwner);
  Database.Handle:=DB;

  pFIBDataSetPrint.Database:=Database;
  pFIBDataSetPrint.Transaction:=ReadTransaction;

  Caption               := ConstClBank.Clbank_report_ChP;
  cxLabelBegin.Caption  := ConstClBank.ClBank_Begin;
  cxLabel1.Caption      := ConstClBank.ClBank_OKPO;
  cxLabel2.Caption      := ConstClBank.ClBank_End;
  cxLabel3.Caption      := ConstClBank.ClBank_date_prov;
  cxLabel4.Caption      := ConstClBank.ClBank_Begin;
  cxLabel5.Caption      := ConstClBank.ClBank_End;
  cxLabel6.Caption      := ConstClBank.ClBank_customer;

end;

procedure TfrmMainPrintDocChP.FormCreate(Sender: TObject);
var
  NDate:TDate;
  dd,mm,yyyy:Word;
begin
  NDate:=Date;

  DecodeDate(NDate,yyyy,mm,dd);
{  if mm=1 then
    begin
      mm:=12;
      yyyy:=yyyy-1;
    end
    else
    begin
      mm:=mm-1;
    end;}
  cxDateEditEnd.Date:=EncodeDate(yyyy,mm,1)-1;


  DecodeDate(NDate,yyyy,mm,dd);
  case mm of
   1:
     begin
       mm:=10;
       yyyy:=yyyy-1;
     end;
   2:
     begin
       mm:=11;
       yyyy:=yyyy-1;
     end;
   3:
     begin
       mm:=12;
     end;
   else mm:=mm-3;
  end;
  cxDateEditBegin.Date:=EncodeDate(yyyy,mm,1);



end;

procedure TfrmMainPrintDocChP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainPrintDocChP.cxButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainPrintDocChP.cxButtonOKClick(Sender: TObject);
begin
    pFIBDataSetPrint.Active:=false;
    pFIBDataSetPrint.SQLs.SelectSQL.Clear;
    pFIBDataSetPrint.SQLs.SelectSQL.Text:='select CLBANK_PRINT_DOC_PEOPLE.* from CLBANK_PRINT_DOC_PEOPLE(:param_date_beg,:param_date_end,:param_okpo_beg,:param_okpo_end) ';
    if RadioGroupTypeDoc.ItemIndex>0 then
    begin
        if RadioGroupTypeDoc.ItemIndex=1 then
        begin
            pFIBDataSetPrint.SQLs.SelectSQL.Add(' where TYPE_DOC=1');
        end;
        if RadioGroupTypeDoc.ItemIndex=2 then
        begin
            pFIBDataSetPrint.SQLs.SelectSQL.Add(' where TYPE_DOC=0');
        end;
    end;
    if (cxButtonEditRSPost.Text<>'') and (RadioGroupTypeDoc.ItemIndex>0) then
    begin
        pFIBDataSetPrint.SQLs.SelectSQL.Add(' and id_customer='+IntToStr(id_customer)+'');
    end else
    if (cxButtonEditRSPost.Text<>'') and ((RadioGroupTypeDoc.ItemIndex=0)or (RadioGroupTypeDoc.ItemIndex=1)) then
    begin
        pFIBDataSetPrint.SQLs.SelectSQL.Add(' where id_customer='+IntToStr(id_customer)+'');
    end;

    pFIBDataSetPrint.SQLs.SelectSQL.Add(' order by CLBANK_PRINT_DOC_PEOPLE.date_prov,CLBANK_PRINT_DOC_PEOPLE.name');
    pFIBDataSetPrint.ParamByName('param_date_beg').AsDate:=cxDateEditBegin.Date;
    pFIBDataSetPrint.ParamByName('param_date_end').AsDate:=cxDateEditEnd.Date;
    pFIBDataSetPrint.ParamByName('param_okpo_beg').AsInt64:=StrToInt64(cxMaskEditBegin.text);
    pFIBDataSetPrint.ParamByName('param_okpo_end').AsInt64:=StrToInt64(cxMaskEditEnd.text);
    pFIBDataSetPrint.Active:=true;

    frxReport.Clear;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\ClBank\PrintDocChP.fr3');

    //  frxReport.DesignReport;
    frxReport.PrepareReport(true);
    frxReport.ShowReport(true);
end;

procedure TfrmMainPrintDocChP.cxButtonEditRSPostPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  i, o : TSpravParams;
begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(Database.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['show_all']     := 1;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
      begin
       // id_acc_cust := o['ID_RATE_ACCOUNT'];
        cxButtonEditRSPost.Text:= o['NAME_CUSTOMER'];
        id_customer := o['ID_CUSTOMER'];
        //cxTextEditMFOPost.Text := 'Ã‘Œ '+ VarToStr(o['MFO'])+' ·‡ÌÍ '+VarToStr(o['NAME_BANK']);
        //cxTextEditPSPost.Text := VarToStr(o['RATE_ACCOUNT']);
      end;
    i.Free;
    o.Free;
end;

end.
