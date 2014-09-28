unit uBonusDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs;

type
  TdmBonus = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    BonusSelect: TpFIBDataSet;
    BonusSource: TDataSource;
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
  private
    { Private declarations }
  public
     procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    { Public declarations }
  end;

var
  dmBonus: TdmBonus;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}

procedure TdmBonus.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
begin
end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;
end.
