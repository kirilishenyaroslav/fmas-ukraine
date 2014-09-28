{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль просмотра остатков и оборотов                  }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uViewOstInvKart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxLookAndFeelPainters,
  FIBDataSet, pFIBDataSet, StdCtrls, cxButtons, cxGridTableView,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, uResources, ActnList, cxContainer,
  cxTextEdit, cxDBEdit;

type
  TOstInvKartForm = class(TForm)
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
    KartDataSetID_INV_KART: TFIBBCDField;
    KartDataSetINV_NUM_FULL: TFIBStringField;
    KartDataSetZAVNUM: TFIBStringField;
    KartDataSetMODE: TFIBIntegerField;
    KartDataSource: TDataSource;
    cxGrid1DBTableView1ID_INV_KART: TcxGridDBColumn;
    cxGrid1DBTableView1INV_NUM_FULL: TcxGridDBColumn;
    cxGrid1DBTableView1ZAVNUM: TcxGridDBColumn;
    cxGrid1DBTableView1MODE: TcxGridDBColumn;
    ActionList1: TActionList;
    Action1: TAction;
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
    KartDataSetGRPNUM: TFIBStringField;
    KartDataSetBAL_PRICE: TFIBIntegerField;
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
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
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
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    lbl13: TLabel;
    KartDataSetNOTE: TFIBStringField;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OstInvKartForm: TOstInvKartForm;

implementation

{$R *.dfm}

uses uViewOstBase;

procedure TOstInvKartForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOstInvKartForm.FormCreate(Sender: TObject);
begin
 CancelButton.Caption:=MAT_BUTTON_EXIT_CONST;
 Caption:=MAT_STR_COL_INV_NUMS;
 cxGrid1DBTableView1INV_NUM_FULL.Caption:=MAT_STR_COL_INV_NUM;
 cxGrid1DBTableView1ZAVNUM.Caption:=MAT_STR_COL_ZAV_NUM;
end;

procedure TOstInvKartForm.Action1Execute(Sender: TObject);
begin
 Close;
end;

end.
