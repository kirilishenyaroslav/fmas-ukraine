unit UpCommandMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Ibase, uFControl, uLabeledFControl,
  uSpravControl, FIBDatabase, pFIBDatabase, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxPropertiesStore,
  frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet, cxCheckBox,
  pFibStoredProc, cxMemo, uCharControl, uIntControl, cxLabel,Registry,
  ActnList, NagScreenUnit, cxDropDownEdit, accmgmt, UpKernelUnit;

type
  TfrmCommandPrint = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    CertDBSet: TfrxDBDataset;
    OrderDBSet: TfrxDBDataset;
    Label2: TLabel;
    SizeFont: TcxTextEdit;
    ActionList1: TActionList;
    Pereform: TAction;
    lblFont: TLabel;
    RectorSpr: TcxButtonEdit;
    lblRector: TcxLabel;
    lblProrector: TcxLabel;
    ProrectorSpr: TcxButtonEdit;
    ReadTrans: TpFIBTransaction;
    CommandDB: TpFIBDatabase;
    OrderDSet: TpFIBDataSet;
    CertDSet: TpFIBDataSet;
    NamePost: TcxTextEdit;
    ReportPrint: TfrxReport;
    procedure CancelButtonClick(Sender: TObject);
    procedure SizeFontKeyPress(Sender: TObject; var Key: Char);
    procedure OkButtonClick(Sender: TObject);
    procedure ProrectorSprPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RectorSprPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    id_order_in:Int64;
    NagScreen     : TNagScreen;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_order:Int64);reintroduce;

  end;

procedure GetExtReport(DBHandle:TISC_DB_HANDLE;id_order:Int64);stdcall;
exports GetExtReport;

implementation

uses uUnivSprav, RxMemDS, BaseTypes;

{$R *.dfm}
procedure GetExtReport(DBHandle:TISC_DB_HANDLE;id_order:Int64);
begin
     with TfrmCommandPrint.Create(Application.MainForm,DBHandle,id_order) do
     begin
          ShowModal;
          Free;
     end;
end;


procedure TfrmCommandPrint.CancelButtonClick(Sender: TObject);
begin
   Close;
end;

constructor TfrmCommandPrint.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE;id_order:Int64);
begin
   try
     inherited Create(AOwner);
     CommandDB.handle:=DbHandle;
     ReadTrans.StartTransaction;
     self.id_order_in:=id_order;
     RectorSpr.Text:=KYVLoadFromRegistry('CommandRector',GetUserId);
     ProrectorSpr.Text:=KYVLoadFromRegistry('CommandProrector',GetUserId);
     NamePost.Text:=KYVLoadFromRegistry('CommandRectorPost', GetUserId);
   except on E:Exception do
          begin
            agMessageDlg(Application.Title, E.Message, mtInformation, [mbOK]);
          end;
   end;
end;

procedure TfrmCommandPrint.SizeFontKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((key<>#8) and ((key > '9') or (key < '0'))) then
    key := Chr(0);
end;

procedure TfrmCommandPrint.OkButtonClick(Sender: TObject);
begin

   if CertDSet.Active then CertDSet.Close;
   CertDSet.SQLs.SelectSQL.Text:='Select Distinct * From Up_Command_Certificate_Print(:Id_Order)';
   CertDSet.ParamByName('Id_Order').AsInt64:=id_order_in;
   CertDSet.Open;

   if OrderDSet.Active then OrderDSet.Close;
   OrderDSet.SQLs.SelectSQL.Text:='Select Distinct * From Up_Command_Order_Print(:Id_Order)';
   OrderDSet.ParamByName('Id_Order').AsInt64:=id_order_in;
   OrderDSet.Open;

   if ((not CertDSet.IsEmpty) and (not OrderDSet.IsEmpty)) then
   begin
      ReportPrint.Clear;
      ReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Up\UpCommandPrint.fr3', True);
      ReportPrint.Variables['Rector'] :=''''+RectorSpr.Text+'''';
      ReportPrint.Variables['Prorector'] :=''''+ProrectorSpr.Text+'''';
      ReportPrint.Variables['RectorPost'] := ''''+NamePost.Text+'''';
      ReportPrint.ShowReport;
   end;
end;

procedure TfrmCommandPrint.ProrectorSprPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:=' ';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.TableName:='up_get_text_shablon(6)';
  Params.Fields:='text1,text2,id_shablon';
  Params.FieldsName:='ПІБ,Посада';
  Params.KeyField:='ID_shablon';
  Params.ReturnFields:='text1,text2';
  Params.DBHandle:=Integer(CommandDB.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut) then
  begin
     ProrectorSpr.Text:=VarToStr(output['text1']);
     KYVSaveIntoRegistry('CommandProrector',ProrectorSpr.Text,GetUserId);
  end;
end;

procedure TfrmCommandPrint.RectorSprPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
begin
  Params.FormCaption:=' ';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbExit];
  Params.TableName:='up_get_text_shablon(6)';
  Params.Fields:='text1,text2,id_shablon';
  Params.FieldsName:='ПІБ,Посада';
  Params.KeyField:='ID_shablon';
  Params.ReturnFields:='text1,text2';
  Params.DBHandle:=Integer(CommandDB.Handle);

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut) then
  begin
     RectorSpr.Text:=VarToStr(output['text1']);
     NamePost.Text:=VarToStr(output['text2']);
     KYVSaveIntoRegistry('CommandRector',RectorSpr.Text,GetUserId);
     KYVSaveIntoRegistry('CommandRectorPost', NamePost.Text, GetUserId);
  end;

end;

procedure TfrmCommandPrint.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i:Byte;
begin
   for i:=0 to CommandDB.TransactionCount-1 do
   begin
      if CommandDB.Transactions[i].Active then CommandDB.Transactions[i].RollBack;
   end;
   CommandDB.Close;
   CanClose:=True;
end;

end.
