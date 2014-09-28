unit PDVTaxInvoces_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TiCommonProc, PDVTaxInvoces_Add, TiMessages, TICommonDates, DateUtils;

type
  TPDVTaxInvocesMainForm = class(TForm)
    PDVTaxInvocesGridDBTableView: TcxGridDBTableView;
    PDVTaxInvocesGridLevel: TcxGridLevel;
    PDVTaxInvocesGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PDVTaxInvocesGridDBTableViewDB_DATABEG: TcxGridDBColumn;
    PDVTaxInvocesGridDBTableViewDB_DATAEND: TcxGridDBColumn;
    PDVTaxInvocesGridDBTableViewDB_Price: TcxGridDBColumn;
    InsertButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PDVTaxInvocesGridDBTableViewDblClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    PRes               :Variant;
    pLanguageIndex     :Byte;
    pStylesDM          :TStyleDM;
    PDb_Handle         :TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  PDVTaxInvocesMainForm: TPDVTaxInvocesMainForm;

implementation

uses PDVTaxInvoces_DM, cxCalendar, cxCurrencyEdit;

{$R *.dfm}
constructor TPDVTaxInvocesMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  PDVTaxInvocesDM      := TPDVTaxInvocesDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('PDVTaxinvoices',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  PDVTaxInvocesGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  PDVTaxInvocesDM.PDVTaxInvocesDSet.Close;
  PDVTaxInvocesDM.PDVTaxInvocesDSet.SelectSQL.Text:='select * from TI_SP_PDV_TAXINVOICES';
  PDVTaxInvocesDM.PDVTaxInvocesDSet.Open;
end;

procedure TPDVTaxInvocesMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TPDVTaxInvocesMainForm.SelectButtonClick(Sender: TObject);
begin
  {PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=PDVTaxInvocesDM.PDVTaxInvocesDSet['id_range_of_delivery'];
  PRes[1]:=PDVTaxInvocesDM.PDVTaxInvocesDSet['name_range_of_delivery'];
  ModalResult:=mrYes;}
end;

procedure TPDVTaxInvocesMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   PDVTaxInvocesDM.Free;
end;

procedure TPDVTaxInvocesMainForm.PDVTaxInvocesGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TPDVTaxInvocesMainForm.InsertButtonClick(Sender: TObject);
var
  ViewForm           : TPDVTaxInvocesAddForm;
  id_PDV_TaxInvoices : Integer;
  kod_setup          : Integer;
  databeg            : TDate;
begin
  ViewForm      := TPDVTaxInvocesAddForm.Create(Self,PDVTaxInvocesDM.DB.Handle);
  kod_setup := ConvertDateToKod(Now);
  databeg   := ConvertKodToDate(kod_setup);
  ViewForm.DataBegDateEdit.Date := databeg;
  ViewForm.DataEndDateEdit.Date := EncodeDate(YearOf(dataBeg), MonthOf(dataBeg), 1) + DaysInMonth(dataBeg) - 1;
  ViewForm.PercentPDVCurrencyEdit.Text := '';
  ViewForm.Caption                 := GetConst('PDVTaxinvoices',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      PDVTaxInvocesDM.WriteTransaction.StartTransaction;
      PDVTaxInvocesDM.pFIBStoredProc.StoredProcName                   := 'TI_SP_PDV_TAXINVOICES_INS';
      PDVTaxInvocesDM.pFIBStoredProc.ParamByName('databeg').Value     := ViewForm.DataBegDateEdit.Date;
      PDVTaxInvocesDM.pFIBStoredProc.ParamByName('dataend').Value     := ViewForm.DataEndDateEdit.Date;
      PDVTaxInvocesDM.pFIBStoredProc.ParamByName('percent_pdv').Value := ViewForm.PercentPDVCurrencyEdit.Value;
      PDVTaxInvocesDM.pFIBStoredProc.ExecProc;
      PDVTaxInvocesDM.WriteTransaction.Commit;
      id_PDV_TaxInvoices := PDVTaxInvocesDM.pFIBStoredProc.ParamByName('id_pdv_taxinvoices_').AsInteger;
      PDVTaxInvocesDM.PDVTaxInvocesDSet.Close;
      PDVTaxInvocesDM.PDVTaxInvocesDSet.Open;
      PDVTaxInvocesDM.PDVTaxInvocesDSet.Locate('id_pdv_taxinvoices',IntToStr(id_PDV_TaxInvoices),[]);
    end;
end;

procedure TPDVTaxInvocesMainForm.UpdateButtonClick(Sender: TObject);
var
  ViewForm : TPDVTaxInvocesAddForm;
  id_PDV_TaxInvoices:Integer;
begin
  if (not(PDVTaxInvocesDM.PDVTaxInvocesDSet.IsEmpty)) then
  begin
    id_PDV_TaxInvoices := PDVTaxInvocesDM.PDVTaxInvocesDSet['id_pdv_taxinvoices'];
    ViewForm := TPDVTaxInvocesAddForm.Create(Self,PDVTaxInvocesDM.DB.Handle);
    ViewForm.DataBegDateEdit.Date        := PDVTaxInvocesDM.PDVTaxInvocesDSet['databeg'];
    ViewForm.DataEndDateEdit.Date        := PDVTaxInvocesDM.PDVTaxInvocesDSet['dataend'];
    ViewForm.PercentPDVCurrencyEdit.Text := FloatToStr(PDVTaxInvocesDM.PDVTaxInvocesDSet['percent_pdv']);
    ViewForm.Caption := GetConst('PDVTaxinvoices',tcForm);
    ViewForm.ShowModal;
    if (ViewForm.ModalResult=mrOk) then
    begin
      PDVTaxInvocesDM.WriteTransaction.StartTransaction;
      PDVTaxInvocesDM.pFIBStoredProc.StoredProcName := 'TI_SP_PDV_TAXINVOICES_UPD';
      PDVTaxInvocesDM.pFIBStoredProc.ParamByName('databeg').Value            := ViewForm.DataBegDateEdit.Date;
      PDVTaxInvocesDM.pFIBStoredProc.ParamByName('dataend').Value            := ViewForm.DataEndDateEdit.Date;
      PDVTaxInvocesDM.pFIBStoredProc.ParamByName('percent_pdv').Value        := ViewForm.PercentPDVCurrencyEdit.Value;
      PDVTaxInvocesDM.pFIBStoredProc.ParamByName('id_pdv_taxinvoices').Value := PDVTaxInvocesDM.PDVTaxInvocesDSet['id_pdv_taxinvoices'];
      PDVTaxInvocesDM.pFIBStoredProc.ExecProc;
      PDVTaxInvocesDM.WriteTransaction.Commit;
      PDVTaxInvocesDM.PDVTaxInvocesDSet.Close;
      PDVTaxInvocesDM.PDVTaxInvocesDSet.Open;
      PDVTaxInvocesDM.PDVTaxInvocesDSet.Locate('id_pdv_taxinvoices',IntToStr(id_PDV_TaxInvoices),[]);
    end;
  end;
end;

procedure TPDVTaxInvocesMainForm.DeleteButtonClick(Sender: TObject);
begin
  if (not(PDVTaxInvocesDM.PDVTaxInvocesDSet.IsEmpty)) then
  begin
    if TiShowMessage('Увага!','Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo])=mrYes then
    begin
     try
      PDVTaxInvocesDM.WriteTransaction.StartTransaction;
      PDVTaxInvocesDM.pFIBStoredProc.StoredProcName:='TI_SP_PDV_TAXINVOICES_DEL';
      PDVTaxInvocesDM.pFIBStoredProc.ParamByName('id_pdv_taxinvoices').Value:=PDVTaxInvocesDM.PDVTaxInvocesDSet['id_pdv_taxinvoices'];
      PDVTaxInvocesDM.pFIBStoredProc.ExecProc;
      PDVTaxInvocesDM.WriteTransaction.Commit;
      PDVTaxInvocesDM.PDVTaxInvocesDSet.Close;
      PDVTaxInvocesDM.PDVTaxInvocesDSet.Open;
     except on E:Exception do
      begin
        MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
        PDVTaxInvocesDM.WriteTransaction.Rollback;
      end;
     end;
    end;
  end;
end;

end.
