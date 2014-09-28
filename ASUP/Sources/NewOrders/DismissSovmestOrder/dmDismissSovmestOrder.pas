unit dmDismissSovmestOrder;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, DateUtils, Controls, DB,
  FIBDataSet, pFIBDataSet, RxMemDS, FIBQuery, pFIBQuery, Messages, Dialogs;

type
  TDM = class(TDataModule)
    LocalWriteTransaction: TpFIBTransaction;
    LocalReadTransaction: TpFIBTransaction;
    LocalDatabase: TpFIBDatabase;
    ResultDataSource: TDataSource;
    SelectDismissedInfo: TpFIBDataSet;
    RxMD_Dismissed: TRxMemoryData;
    SelectDismissedInfoTN: TFIBIntegerField;
    SelectDismissedInfoFIO: TFIBStringField;
    SelectDismissedInfoID_MAN: TFIBIntegerField;
    SelectDismissedInfoID_DEPARTMENT: TFIBIntegerField;
    SelectDismissedInfoNAME_DEP: TFIBStringField;
    SelectDismissedInfoID_POST: TFIBIntegerField;
    SelectDismissedInfoNAME_POST: TFIBStringField;
    SelectDismissedInfoPERIOD: TFIBStringField;
    SelectDismissedInfoDAY_COUNT: TFIBIntegerField;
    SelectDismissedInfoID_MAN_MOVING: TFIBIntegerField;
    SelectDismissedInfoID_MAN_DISMISSION: TFIBIntegerField;
    pFIBQ_Dismiss: TpFIBQuery;
    WorkQuery: TpFIBDataSet;
    RxMD_DismissedTN: TIntegerField;
    RxMD_DismissedFIO: TStringField;
    RxMD_DismissedID_man: TIntegerField;
    RxMD_DismissedID_Department: TIntegerField;
    RxMD_DismissedName_dep: TStringField;
    RxMD_DismissedID_post: TIntegerField;
    RxMD_DismissedName_post: TStringField;
    RxMD_Dismissedperiod: TStringField;
    RxMD_Dismissedday_count: TIntegerField;
    RxMD_Dismissedid_man_moving: TIntegerField;
    RxMD_Dismissedid_man_dismission: TIntegerField;
    pFIBQ_Edit: TpFIBQuery;
    SelectDismissedInfoINTRO: TFIBStringField;
    SelectDismissedInfoPARENT_DEPARTMENT: TFIBStringField;
    SelectDismissedInfoCITY: TFIBStringField;
    SelectDismissedInfoFIRM_NAME: TFIBStringField;
    procedure SelectDismissedInfoAfterOpen(DataSet: TDataSet);
    procedure RxMD_DismissedAfterScroll(DataSet: TDataSet);
    procedure RxMD_DismissedBeforeEdit(DataSet: TDataSet);
    procedure RxMD_DismissedAfterEdit(DataSet: TDataSet);
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

procedure ShowInfo(DataSet: TDataSet);

implementation

uses Variants;

{$R *.dfm}

procedure TDM.SelectDismissedInfoAfterOpen(DataSet: TDataSet);
begin
  if Printed then exit;
  RxMD_Dismissed.Close;
  RxMD_Dismissed.Open;
  RxMD_Dismissed.Edit;
  RxMD_Dismissed.ClearFields;
  RxMD_Dismissed.Close;
  RxMD_Dismissed.Open;
  DataSet.First;
  while not DataSet.Eof do
  begin
    RxMD_Dismissed.Append;
    RxMD_Dismissed['TN']:=DataSet['TN'];
    RxMD_Dismissed['FIO']:=DataSet['FIO'];
    RxMD_Dismissed['ID_MAN']:=DataSet['ID_MAN'];
    RxMD_Dismissed['ID_DEPARTMENT']:=DataSet['ID_DEPARTMENT'];
    RxMD_Dismissed['NAME_DEP']:=DataSet['NAME_DEP'];
    RxMD_Dismissed['ID_POST']:=DataSet['ID_POST'];
    RxMD_Dismissed['NAME_POST']:=DataSet['NAME_POST'];
    RxMD_Dismissed['PERIOD']:=DataSet['PERIOD'];
    RxMD_Dismissed['DAY_COUNT']:=DataSet['DAY_COUNT'];
    RxMD_Dismissed['ID_MAN_MOVING']:=DataSet['ID_MAN_MOVING'];
    RxMD_Dismissed['ID_MAN_DISMISSION']:=DataSet['ID_MAN_DISMISSION'];
    RxMD_Dismissed.Post;
    DataSet.Next;
  end;
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

procedure TDM.RxMD_DismissedAfterScroll(DataSet: TDataSet);
begin
  if (VarIsNull(RxMD_Dismissed['id_man_dismission'])) then exit;
  OldValue:=RxMD_Dismissed['day_count'];
//  ShowMessage(IntToStr(OldValue));
end;

procedure TDM.RxMD_DismissedBeforeEdit(DataSet: TDataSet);
begin
  if (VarIsNull(DataSet['id_man_dismission'])) then exit;
   OldValue:=DataSet['day_count'];
end;

procedure TDM.RxMD_DismissedAfterEdit(DataSet: TDataSet);
begin
  if (VarIsNull(DataSet['id_man_dismission'])) then exit;
  if (VarIsNull(DataSet['day_count'])) then exit;
   NewValue:=DataSet['day_count'];
end;

end.
