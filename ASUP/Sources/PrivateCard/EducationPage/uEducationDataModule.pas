unit uEducationDataModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, Dialogs;

type
  TdmEducation = class(TDataModule)
    DB: TpFIBDatabase;
    DefaultTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    EducationSelect: TpFIBDataSet;
    EducationSource: TDataSource;
    DeleteQuery: TpFIBQuery;
    EducationSelectID_EDUC_KEY: TFIBIntegerField;
    EducationSelectNAME_SHORT: TFIBStringField;
    EducationSelectNAME_EDUC: TFIBStringField;
    EducationSelectDATE_BEG: TFIBDateField;
    EducationSelectDATE_END: TFIBDateField;
    EducationSelectAKREDITATION: TFIBIntegerField;
    EducationSelectNAME_SPEC: TFIBStringField;
    EducationSelectNAME_KVAL: TFIBStringField;
    EducationSelectDIPLOM_NUMBER: TFIBStringField;
    EducationSelectDIPLOM_DATE: TFIBDateField;
    DetailsQuery: TpFIBDataSet;
    DetailsQueryID_EDUC_KEY: TFIBIntegerField;
    DetailsQueryID_ORG: TFIBIntegerField;
    DetailsQueryDATE_BEG: TFIBDateField;
    DetailsQueryDATE_END: TFIBDateField;
    DetailsQueryID_SPEC: TFIBIntegerField;
    DetailsQueryID_KVAL: TFIBIntegerField;
    DetailsQueryID_EDUC: TFIBIntegerField;
    DetailsQueryDIPLOM_NUMBER: TFIBStringField;
    DetailsQueryDIPLOM_DATE: TFIBDateField;
    DetailsQueryAKREDITATION: TFIBIntegerField;
    DetailsQueryID_THEME: TFIBIntegerField;
    DetailsQueryID_ORDER: TFIBIntegerField;
    DetailsQueryNUM_ITEM: TFIBIntegerField;
    DetailsQueryIS_LEARNING: TFIBIntegerField;
    DetailsQueryIS_FSHR: TFIBStringField;
    pFIBDS_IsShow: TpFIBDataSet;
    pFIBDS_OldEduc: TpFIBDataSet;
    EducationSelectNAME_ORG_FULL: TFIBStringField;
  private
    { Private declarations }
  public
     procedure GetText(Sender: TField; var Text:String; DisplayText:Boolean);
    { Public declarations }
  end;

var
  dmEducation: TdmEducation;

procedure ShowInfo(DataSet: TDataSet);

implementation

{$R *.dfm}

procedure TdmEducation.GetText(Sender: TField; var Text:String; DisplayText:Boolean);
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
