unit uMovingsDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  Dialogs, Controls;

type
  TdmMovings = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    MovingsSelect: TpFIBDataSet;
    MovingsSource: TDataSource;
    BonusSelect: TpFIBDataSet;
    pFIBDS_Format: TpFIBDataSet;
    pFIBDS_FormatSTAVKI_DISP_FORMAT: TFIBStringField;
    MovingsSelectDEPARTMENT_NAME: TFIBStringField;
    MovingsSelectPOST_NAME: TFIBStringField;
    MovingsSelectSMETA_NAME: TFIBStringField;
    MovingsSelectKOL_STAVOK: TFIBFloatField;
    MovingsSelectOKLAD: TFIBFloatField;
    MovingsSelectDATE_BEG: TFIBDateField;
    MovingsSelectDATE_END: TFIBDateField;
    MovingsSelectPERIOD: TFIBStringField;
    MovingsSelectNUM_ORDER: TFIBStringField;
    MovingsSelectDATE_ORDER: TFIBDateField;
    MovingsSelectID_MAN_MOVING: TFIBIntegerField;
    MovingsSelectID: TFIBIntegerField;
    MovingsSelectID_PARENT: TFIBIntegerField;
    MovingsSelectALL_NAME: TFIBStringField;
    MovingsSelectTYPE_PERS: TFIBStringField;
    MovingsSelectNAME_SOVMEST: TFIBStringField;
    MovingsSelectIS_MAIN_POST: TFIBStringField;
    MovingsSelectSTD: TFIBStringField;
    BonusSelectNUM_ORDER: TFIBStringField;
    BonusSelectDATE_ORDER: TFIBDateField;
    BonusSelectID_MAN_BONUS: TFIBIntegerField;
    BonusSelectID_BONUS: TFIBIntegerField;
    BonusSelectIS_PERCENT: TFIBStringField;
    BonusSelectPERCENT: TFIBFloatField;
    BonusSelectSUMMA: TFIBFloatField;
    BonusSelectID_ORDER: TFIBIntegerField;
    BonusSelectNAME_BONUS: TFIBStringField;
    BonusSelectTHE_BONUS: TFIBStringField;
    BonusSelectTYPE_BONUS: TFIBStringField;
    BonusSelectDATE_BEG: TFIBDateField;
    BonusSelectDATE_END: TFIBDateField;
    BonusSelectPERIOD: TFIBStringField;
    BonusSelectID: TFIBIntegerField;
    BonusSelectID_PARENT: TFIBIntegerField;
    BonusSelectALL_NAME: TFIBStringField;
    BonusSelectID_MAN_MOVING: TFIBIntegerField;
    BonusSelectid_man_bonus_smet: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMovings: TdmMovings;
  ActualDate: TDate;
 
procedure ShowInfo(DataSet: TDataSet);

implementation

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;
{$R *.dfm}


end.
