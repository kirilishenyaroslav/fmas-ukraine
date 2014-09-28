{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uViewOstMnaKart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxLookAndFeelPainters,
  FIBDataSet, pFIBDataSet, StdCtrls, cxButtons, cxGridTableView,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, uResources, ActnList;

type
  TOstMnaKartForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
    CancelButton: TcxButton;
    KartDataSet: TpFIBDataSet;
    KartDataSource: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
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
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OstMnaKartForm: TOstMnaKartForm;

implementation

{$R *.dfm}

uses uViewOstBase;

procedure TOstMnaKartForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOstMnaKartForm.FormCreate(Sender: TObject);
begin
 CancelButton.Caption:=MAT_BUTTON_EXIT_CONST;
 Caption:=MAT_STR_COL_NOM_NUMS;
 cxGrid1DBTableView1MNA_INV_NUM.Caption:=MAT_STR_COL_INV_NUM;
 cxGrid1DBTableView1NNUM_FULL.Caption:=MAT_STR_COL_NOM_NUM;
 cxGrid1DBTableView1ZAVNUM.Caption:=MAT_STR_COL_ZAV_NUM;
end;

procedure TOstMnaKartForm.Action1Execute(Sender: TObject);
begin
 Close;
end;

end.
