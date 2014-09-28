unit dmPremiaOrder2;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DateUtils, Controls, DB,
  FIBDataSet, pFIBDataSet, RxMemDS, FIBQuery, pFIBQuery, Messages, Dialogs,
  IBCustomDataSet, IBQuery, pFIBStoredProc,AccMgmt;

type
  TDM = class(TDataModule)
    LocalWriteTransaction: TpFIBTransaction;
    LocalReadTransaction: TpFIBTransaction;
    LocalDatabase: TpFIBDatabase;
    pFIBQ_Rnd: TpFIBQuery;
    WorkQuery: TpFIBDataSet;
    pFIBQ_Recalc: TpFIBQuery;
    InputQuery: TpFIBDataSet;
    DoneQuery: TpFIBDataSet;
    DoneQueryID_ORDER: TFIBIntegerField;
    DoneQueryID_ORDER_TYPE: TFIBIntegerField;
    DoneQueryID_STATUS: TFIBIntegerField;
    DoneQueryNUM_ORDER: TFIBStringField;
    DoneQueryDATE_ORDER: TFIBDateField;
    DoneQueryNOTE: TFIBStringField;
    OutputQuery: TIBQuery;
    InputQueryID_ORDER: TFIBIntegerField;
    InputQueryNUM_ORDER: TFIBStringField;
    InputQueryDATE_ORDER: TFIBDateField;
    InputQueryNOTE: TFIBStringField;
    InputQueryID_STATUS: TFIBIntegerField;
    InputQueryEXEC_DATETIME: TFIBDateTimeField;
    InputQueryPRINT_NAME: TFIBStringField;
    InputQueryINTRO: TFIBStringField;
    InputQueryISPOLNITEL: TFIBStringField;
    InputQueryOWNER_ID_USER: TFIBIntegerField;
    InputQueryNUM_ORDER_KADR: TFIBStringField;
    InputQueryNUM_ORDER_INTERNAL: TFIBStringField;
    InputQueryNAME_STATUS: TFIBStringField;
    InputQueryDATE_ORDER_KADR: TFIBDateField;
    InputQueryOWNER_FIO: TFIBStringField;
    InputQuerySUMMA_ALL: TFIBFloatField;
    procedure InputQueryAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    IdOrder : Integer;
    DateOrder : TDate;
  end;

var
  DM: TDM;
  OldValue, NewValue: integer;
  Printed : boolean;
  AdminMode:Boolean;
procedure ShowInfo(DataSet: TDataSet);

implementation

uses Variants, uPremiaOrderForm2;

{$R *.dfm}

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;

procedure TDM.InputQueryAfterScroll(DataSet: TDataSet);
begin
 if (InputQueryOWNER_ID_USER.Value = GetUserId) or (AdminMode) then begin
            fmPremiaOrderList.RecalcButton.Visible:=True;
            fmPremiaOrderList.RndButton.Visible:=True;
        end
        else begin
            fmPremiaOrderList.RecalcButton.Visible:=False;
            fmPremiaOrderList.RndButton.Visible:=False;

            fmPremiaOrderList.RecalcButton.Enabled:=True;
            fmPremiaOrderList.RndButton.Enabled:=True;
        end;
end;

end.
