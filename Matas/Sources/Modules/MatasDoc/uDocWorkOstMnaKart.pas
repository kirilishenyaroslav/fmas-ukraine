{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkOstMnaKart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, StdCtrls,
  cxButtons, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TDocWorkOstMnaKartForm = class(TForm)
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
    WorkTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    CancelButton: TcxButton;
    KartDataSetID_MNA_KART: TFIBBCDField;
    KartDataSetMNA_INV_NUM: TFIBStringField;
    KartDataSetNNUM_FULL: TFIBStringField;
    KartDataSetZAVNUM: TFIBStringField;
    KartDataSetMODE: TFIBIntegerField;
    cxGrid1DBTableView1ID_MNA_KART: TcxGridDBColumn;
    cxGrid1DBTableView1MNA_INV_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1NNUM_FULL: TcxGridDBColumn;
    cxGrid1DBTableView1ZAVNUM: TcxGridDBColumn;
    cxGrid1DBTableView1MODE: TcxGridDBColumn;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocWorkOstMnaKartForm: TDocWorkOstMnaKartForm;

implementation

{$R *.dfm}

procedure TDocWorkOstMnaKartForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkOstMnaKartForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_RETURN) or (Key=VK_ESCAPE) then
  Close;
end;

end.
