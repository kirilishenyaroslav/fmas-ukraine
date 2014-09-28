{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkOstInvKart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, StdCtrls,
  cxButtons, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxTextEdit, cxDBEdit;

type
  TDocWorkOstInvKartForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    KartDataSource: TDataSource;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    KartDataSet: TpFIBDataSet;
    KartDataSetID_INV_KART: TFIBBCDField;
    KartDataSetINV_NUM_FULL: TFIBStringField;
    KartDataSetZAVNUM: TFIBStringField;
    KartDataSetMODE: TFIBIntegerField;
    WorkTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    CancelButton: TcxButton;
    cxGrid1DBTableView1ID_INV_KART: TcxGridDBColumn;
    cxGrid1DBTableView1INV_NUM_FULL: TcxGridDBColumn;
    cxGrid1DBTableView1ZAVNUM: TcxGridDBColumn;
    cxGrid1DBTableView1MODE: TcxGridDBColumn;
    KartDataSetKARTNUM: TFIBIntegerField;
    KartDataSetTIP_KART: TFIBStringField;
    KartDataSetBEG_PRICE: TFIBIntegerField;
    KartDataSetBEG_IZNOS: TFIBIntegerField;
    KartDataSetOST_PRICE: TFIBIntegerField;
    KartDataSetOST_IZNOS: TFIBIntegerField;
    KartDataSetDATE_OST: TFIBDateField;
    KartDataSetDATE_OPR: TFIBDateField;
    KartDataSetDATE_EXPL: TFIBDateField;
    KartDataSetDATE_UPDATE: TFIBDateField;
    KartDataSetDATE_OUT: TFIBDateField;
    cxGrid1DBTableView1BEG_IZNOS: TcxGridDBColumn;
    cxGrid1DBTableView1BEG_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_EXPL: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_OPR: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_OST: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_OUT: TcxGridDBColumn;
    cxGrid1DBTableView1DATE_UPDATE: TcxGridDBColumn;
    cxGrid1DBTableView1KARTNUM: TcxGridDBColumn;
    cxGrid1DBTableView1OST_IZNOS: TcxGridDBColumn;
    cxGrid1DBTableView1OST_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1TIP_KART: TcxGridDBColumn;
    Label1: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    KartDataSetGRPNUM: TFIBStringField;
    cxGrid1DBTableView1GRPNUM: TcxGridDBColumn;
    KartDataSetBAL_PRICE: TFIBIntegerField;
    lbl10: TLabel;
    lbl11: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    lbl12: TLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    lbl13: TLabel;
    cxDBTextEdit14: TcxDBTextEdit;
    KartDataSetNOTE: TFIBStringField;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocWorkOstInvKartForm: TDocWorkOstInvKartForm;

implementation

{$R *.dfm}

procedure TDocWorkOstInvKartForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkOstInvKartForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) or (Key=VK_ESCAPE) then
  Close;
end;

end.
