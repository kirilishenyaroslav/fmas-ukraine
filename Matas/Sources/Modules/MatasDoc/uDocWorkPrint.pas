unit uDocWorkPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, DB, FIBDataSet,
  pFIBDataSet, cxControls, cxContainer, cxEdit, cxRadioGroup, FR_DSet,
  FR_DBSet, FR_Class, ExtCtrls, FIBDatabase, pFIBDatabase, FR_Desgn,
  cxTextEdit;

type
  TDocWorkPrint = class(TForm)
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    pFIBDataSetPrihod: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDatabase1: TpFIBDatabase;
    pFIBDataSetPeredacha: TpFIBDataSet;
    PrintDialog1: TPrintDialog;
    frDesigner1: TfrDesigner;
    pFIBDataSetRashod: TpFIBDataSet;
    cxButtonClose: TcxButton;
    cxButtonPrrint: TcxButton;
    cxTemplate: TcxTextEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocWorkPrint: TDocWorkPrint;

implementation

{$R *.dfm}

procedure TDocWorkPrint.FormCreate(Sender: TObject);
begin
 cxButtonClose.Caption:='Отмена';
 cxButtonPrrint.Caption:='Печать';
end;

procedure TDocWorkPrint.cxButtonCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkPrint.cxButtonPrrintClick(Sender: TObject);
begin
 frDBDataSet1.DataSet := pFIBDataSetPrihod;
 pFIBDataSetPrihod.Close;
 pFIBDataSetPrihod.Open;
 frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ '\Report\'+cxTemplate.Text);
 frReport1.PrepareReport;
 frReport1.ShowReport;
// frReport1.DesignReport;
 Close;
end;

end.
