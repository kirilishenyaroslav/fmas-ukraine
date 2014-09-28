unit TITaxInvoices_SignDocHist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, StdCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls,IBase,TITaxInvoicesDM,
  ImgList, cxDBLabel, cxContainer, cxLabel, cxImage, cxCalendar, cxTextEdit;

type
  TTaxInvoicesSignReestrHistForm = class(TForm)
    Panel1: TPanel;
    SignDocHistGrid: TcxGrid;
    SignDocHistGridDBTableView: TcxGridDBTableView;
    SignDocHistGridLevel: TcxGridLevel;
    Panel2: TPanel;
    NumReestrLabel: TLabel;
    NumReestrValueLabel: TLabel;
    SignDocHistGridDBTableViewDB_NameUser: TcxGridDBColumn;
    SignDocHistGridDBTableViewDB_NameComputer: TcxGridDBColumn;
    SignDocHistGridDBTableViewDB_IPComputer: TcxGridDBColumn;
    SignDocHistGridDBTableViewDB_DataSignature: TcxGridDBColumn;
    SignDocHistGridDBTableViewDB_IsSignature: TcxGridDBColumn;
    NumNaklLabel: TLabel;
    NumNaklValueLabel: TLabel;
    ImageList: TImageList;
    PeriodLabel: TcxLabel;
    PeriodDBLabel: TcxDBLabel;
    NZPLabel: TcxLabel;
    DataNaklLabel: TcxLabel;
    NZPDBLabel: TcxDBLabel;
    DataNaklValueLabel: TcxLabel;
    cxImage1: TcxImage;
    cxImage2: TcxImage;
    IsSignatureLabel: TcxLabel;
    NotSignatureLabel: TcxLabel;
    procedure SignDocHistGridDBTableViewDB_IsSignatureCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    PRes           : Variant;
    PDb_Handle     : TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  TaxInvoicesSignReestrHistForm: TTaxInvoicesSignReestrHistForm;

implementation

{$R *.dfm}
constructor TTaxInvoicesSignReestrHistForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle        := Db_Handle;
end;
procedure TTaxInvoicesSignReestrHistForm.SignDocHistGridDBTableViewDB_IsSignatureCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ACanvas.FillRect(AViewInfo.Bounds);
  ImageList.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 40, AViewInfo.Bounds.Top, 1-AViewInfo.GridRecord.Values[SignDocHistGridDBTableViewDB_IsSignature.Index]);
  ADone := True;
end;

end.
