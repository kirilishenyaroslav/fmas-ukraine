unit Order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommonSp, frxExportTXT, frxExportHTML, frxExportPDF, frxClass,
  frxExportRTF, frxDBSet, DB, FIBDataSet, pFIBDataSet, frxExportXML,
  frxExportXLS, FIBDatabase, pFIBDatabase;

type
    TUP_PrintOrder = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
    end;

function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

type
  TfmPrintOrder = class(TForm)
    DSBottom: TpFIBDataSet;
    DSBottomL_SIGNER_FIO: TFIBStringField;
    DSBottomL_SIGNER_POST: TFIBStringField;
    DSBottomL_TYPE_PRINT_NAME: TFIBStringField;
    DSBottomR_SIGNER_FIO: TFIBStringField;
    DSBottomR_SIGNER_POST: TFIBStringField;
    DSBottomR_TYPE_PRINT_NAME: TFIBStringField;
    DSBottomC_SIGNER_FIO: TFIBStringField;
    DSBottomC_SIGNER_POST: TFIBStringField;
    DSBottomC_TYPE_PRINT_NAME: TFIBStringField;
    DSBottomPRINT_NUM: TFIBIntegerField;
    frxDBDBottom: TfrxDBDataset;
    DSOrder: TpFIBDataSet;
    DSOrderNUM_ORDER: TFIBStringField;
    DSOrderDATE_PROJECT: TFIBDateField;
    DSOrderHASH_CODE: TFIBStringField;
    DSOrderHEADER_TEXT: TMemoField;
    DSOrderSIGNATURE_TEXT: TMemoField;
    DSOrderHEADER_FIO: TFIBStringField;
    DSOrderHEADER_POST: TFIBStringField;
    DSOrderBODY: TMemoField;
    DSOrderDATE_ORDER: TFIBDateField;
    DSOrderPRINT_NAME: TFIBStringField;
    DSOrderNAME_PRED: TFIBStringField;
    DSOrderCITY: TFIBStringField;
    DSOrderNUM_PROJECT: TFIBStringField;
    DSOrderID_LEVEL: TFIBBCDField;
    DSOrderDAY_O: TFIBStringField;
    DSOrderMONTH_O: TFIBStringField;
    DSOrderYEAR_O: TFIBStringField;
    frxDBOrder: TfrxDBDataset;
    RTFExport: TfrxRTFExport;
    DSVn: TpFIBDataSet;
    HTMLExport: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxReport_V: TfrxReport;
    frxTXTExport1: TfrxTXTExport;
    XLSExport: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    DSV: TpFIBDataSet;
    DSVBODY: TMemoField;
    DSVNUM_PUNKT: TFIBIntegerField;
    DSVNAME_PUNKT: TMemoField;
    DSVNAME_POST: TFIBStringField;
    DSVNUM_ORDER: TFIBStringField;
    DSVPRINT_NAME: TFIBStringField;
    DSVDATE_ORDER: TFIBDateField;
    DSVHEADER_POST: TFIBStringField;
    DSVHEADER_FIO: TFIBStringField;
    DSVFIRM_NAME: TFIBStringField;
    DSVCITY: TFIBStringField;
    DSVFIO_INS: TFIBStringField;
    DSVDAY_O: TFIBStringField;
    DSVMONTH_O: TFIBStringField;
    DSVYEAR_O: TFIBStringField;
    DSVNAME_DEPARTMENT: TFIBStringField;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    DSOrderORDER_PRINT_REPORT: TFIBStringField;
    frxR_Order: TfrxReport;
  private
    { Private declarations }
  public
    constructor Create(id_order, shrifts : int64); reintroduce; overload;
  end;

var
    id_ord, shrift : int64;

implementation
uses shellapi,
     IB_externals,
     IniFiles,
     uPwdDeCrypt;
{$R *.dfm}

{ TfmPrintOrder }

function CreateSprav: TSprav;
begin
    Result := TUP_PrintOrder.Create;
end;

constructor TUP_PrintOrder.Create;
begin
    inherited Create;
end;

procedure TUP_PrintOrder.Show;
var
    T : TfmPrintOrder;
begin
    T := TfmPrintOrder.Create(id_ord, shrift);
    T.Free;
end;

constructor TfmPrintOrder.Create(id_order, shrifts : int64);
var
    inif : TIniFile;
begin
    inherited Create(nil);

    try
        inif            := TIniFile.Create(ExtractFilePath(Application.ExeName) + '.\config.ini');
        DB.DatabaseName := inif.ReadString('CONNECTION', 'Server', '') + ':' + inif.ReadString('CONNECTION','Path', '');
		DB.DBParams.Add('user_name=' + inif.ReadString('Connection','User',''));
		DB.DBParams.Add('password=' + PwdDeCrypt(inif.ReadString('Connection', 'Password_Crypted', '')));
        inif.Free;
        DB.Open;
    except
    begin
        showmessage('�������! ���������� �� �������������!');
        close;
    end;
    end;

    Db.DefaultTransaction := Tr;
    Tr.DefaultDatabase    := Db;

    DSOrder.Database      := Db;
    DSOrder.Transaction   := Tr;

    DSBottom.Database     := Db;
    DSBottom.Transaction  := Tr;

    Tr.StartTransaction;

    DSOrder.Close;
    DSOrder.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDERS_PRINT_ORDER('+IntToStr(id_order)+')';
    DSOrder.Open;

    DSBottom.Close;
    DSBottom.SQLs.SelectSQL.Text := 'select * from UP_DT_ORDERS_PRINT_ORDER_BOTTOM('+IntToStr(id_order)+')';
    DSBottom.Open;

    frxR_Order.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\UP\'+DSOrder.fbn('order_print_report').AsString);//UP_OrderPrint.fr3');
    frxR_Order.Variables['font_doc']  := shrifts;
    if DSOrder.fbn('ID_LEVEL').IsNull
        then frxR_Order.Variables['chernetka'] := quotedStr(IntToStr(1))
        else frxR_Order.Variables['chernetka'] := quotedStr(IntToStr(0));

    frxR_Order.PrepareReport(True);
    frxR_Order.ShowReport(True);

end;

end.
