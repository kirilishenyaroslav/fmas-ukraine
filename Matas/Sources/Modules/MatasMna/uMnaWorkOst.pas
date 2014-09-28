{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Картотека МНА и МБП                                   }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMnaWorkOst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uResources, Buttons, ibase, FIBDatabase, pFIBDatabase,
  DB, FIBDataSet, pFIBDataSet, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, cxClasses;

type
  TMnaWorkOstForm = class(TForm)
    Panel1: TPanel;
    RefreshButton: TSpeedButton;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    WorkDataBase: TpFIBDatabase;
    OstDataSet: TpFIBDataSet;
    WorkTransaction: TpFIBTransaction;
    DataSource1: TDataSource;
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
    cxGridKart: TcxGrid;
    cxGridKartDBTableView1: TcxGridDBTableView;
    cxGridKartLevel1: TcxGridLevel;
    cxGridKartDBTableView1NOMN: TcxGridDBColumn;
    cxGridKartDBTableView1NAME: TcxGridDBColumn;
    cxGridKartDBTableView1KOL_MAT: TcxGridDBColumn;
    cxGridKartDBTableView1PRICE: TcxGridDBColumn;
    cxGridKartDBTableView1SUMMA: TcxGridDBColumn;
    cxGridKartDBTableView1SCH_NUMBER: TcxGridDBColumn;
    OstDataSetID_OST: TFIBBCDField;
    OstDataSetID_NOMN: TFIBBCDField;
    OstDataSetNOMN: TFIBStringField;
    OstDataSetLINKTO: TFIBBCDField;
    OstDataSetNAME: TFIBStringField;
    OstDataSetID_UNIT: TFIBBCDField;
    OstDataSetUNIT: TFIBStringField;
    OstDataSetKOL_MAT: TFIBBCDField;
    OstDataSetPRICE: TFIBBCDField;
    OstDataSetSUMMA: TFIBBCDField;
    OstDataSetID_PRH: TFIBBCDField;
    OstDataSetID_DOC: TFIBBCDField;
    OstDataSetID_SCH: TFIBBCDField;
    OstDataSetSCH_NUMBER: TFIBStringField;
    OstDataSetSCH_TITLE: TFIBStringField;
    OstDataSetTIPD: TFIBStringField;
    OstDataSetNUM_DOC: TFIBStringField;
    OstDataSetDATE_DOC: TFIBDateField;
    OstDataSetKOL_DOC: TFIBBCDField;
    OstDataSetSUM_DOC: TFIBBCDField;
    OstDataSetDATE_OPR: TFIBDateField;
    OstDataSetDATE_EXPL: TFIBDateField;
    OstDataSetKOD_SYSTEM: TFIBIntegerField;
    OstDataSetIS_ACC_PRICE: TFIBIntegerField;
    procedure RefreshButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_OST, id_mo, id_nomn: integer;
   constructor Create(AOwner: TComponent; aDBHANDLE: TISC_DB_HANDLE; aID_NOMN: integer; aID_MO: integer; aID_SCH: integer);overload;
  end;

var
  MnaWorkOstForm: TMnaWorkOstForm;

implementation

{$R *.dfm}

constructor TMnaWorkOstForm.Create(AOwner: TComponent; aDBHANDLE: TISC_DB_HANDLE; aID_NOMN: integer; aID_MO: integer; aID_SCH: integer);
begin
 inherited Create(AOwner);
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_MNA+'::Залишки ТМЦ';
 if Assigned(aDBHANDLE) then
 begin
  Self.WorkDataBase.Close;
  Self.DBHANDLE := aDBHandle;
  Self.WorkDataBase.Handle := aDBHANDLE;
  Self.WorkDataBase.Open;
 end;
 Self.OstDataSet.ParamByName('ID_MO').Value:=aID_MO;
 Self.OstDataSet.ParamByName('ID_NOMN').Value:=aID_NOMN;
 Self.OstDataSet.CloseOpen(false);
 Self.RefreshButton.Caption:=MAT_ACTION_REFRESH_CONST;
 Self.OkButton.Caption:=MAT_ACTION_CHOOSE_CONST;
 Self.CancelButton.Caption:=MAT_ACTION_CLOSE_CONST;
 ID_OST:=-1;
 id_mo:=aID_MO;
 id_nomn:=aID_NOMN;
end;

procedure TMnaWorkOstForm.RefreshButtonClick(Sender: TObject);
begin
 OstDataSet.Close;
 OstDataSet.ParamByName('ID_MO').Value:=ID_MO;
 OstDataSet.ParamByName('ID_NOMN').Value:=ID_NOMN;
 OstDataSet.CloseOpen(false);
end;

procedure TMnaWorkOstForm.OkButtonClick(Sender: TObject);
begin
 ID_OST:=OstDataSet.FieldByName('ID_OST').AsInteger;
 Close;
end;

procedure TMnaWorkOstForm.CancelButtonClick(Sender: TObject);
begin
 ID_OST:=-1;
 Close;
end;

end.

