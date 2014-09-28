unit View_Dogs_Data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, ExtCtrls, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridLevel, cxGrid,
  cxLookAndFeelPainters, DB, FIBDataSet, pFIBDataSet, StdCtrls, cxButtons,
  cxMemo, cxCurrencyEdit;

type
  TView_Dogs_DataForm = class(TForm)
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    BottomPanel: TPanel;
    Name_Cust_Column: TcxGridColumn;
    Plan_Count_Column: TcxGridColumn;
    Deliver_Count_Column: TcxGridColumn;
    CancelButton: TcxButton;
    ApplyButton: TcxButton;
    DataSet: TpFIBDataSet;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_Product  : integer;
    id_Cat_Cust : integer;
    id_Object   : integer;
    Date_Beg    : TDate;
    Date_End    : TDate;
    ProdCoef    : currency;


    ResSum      : currency;
  end;

var
  View_Dogs_DataForm: TView_Dogs_DataForm;

implementation

uses DataModule;

{$R *.dfm}

procedure TView_Dogs_DataForm.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TView_Dogs_DataForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TView_Dogs_DataForm.FormShow(Sender: TObject);
var
 Last_id : integer;

 Stage_Beg : TDate;
 Stage_End : TDate;

 Multiplicator : Currency;
begin
 DataSet.SelectSQL.Text := 'select * from PROC_DT_CONTRACT_ANALYZE_EX('
 + IntToStr(id_Product) + ',' + IntToStr(id_Cat_Cust) + ',' + IntToStr(id_Object) + ','
 + QuotedStr(DateToStr(Date_Beg)) + ',' + QuotedStr(DateToStr(Date_End)) + ') order by ID_CUSTOMER';

 Last_id := -1;
 DataSet.Open;

 while not DataSet.Eof do with TableView.DataController do begin
  Stage_Beg := DataSet.FieldByName('STAGE_BEG').AsDateTime;
  Stage_End := DataSet.FieldByName('STAGE_END').AsDateTime;

  Multiplicator := 0;

  if (Stage_Beg < Date_Beg) and (Stage_End > Date_Beg)
  and (Stage_End < Date_End)
  then Multiplicator := (Stage_End - Date_Beg)/(Stage_End - Stage_Beg)
  else
   if (Stage_Beg >= Date_Beg) and (Stage_End <= Date_End)
   then Multiplicator := 1
   else
    if (Stage_Beg < Date_End) and (Stage_End > Date_End)
    then Multiplicator := (Date_End - Stage_Beg)/(Stage_End - Stage_Beg)
    else
     if (Stage_Beg < Date_Beg) and (Stage_End > Date_End)
     then Multiplicator := (Date_End - Date_Beg)/(Stage_End - Stage_Beg);


  if Last_id <> DataSet.FieldByName('ID_CUSTOMER').AsInteger then begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := DataSet.FieldByName('NAME_CUSTOMER').AsString;
   Values[RecordCount - 1, 1] := DataSet.FieldByName('PLAN_COUNT').AsCurrency * DataSet.FieldByName('COEFFICIENT').AsCurrency * Multiplicator / ProdCoef;
   Values[RecordCount - 1, 2] := DataSet.FieldByName('DELIVER_COUNT').AsCurrency * DataSet.FieldByName('COEFFICIENT').AsCurrency * Multiplicator / ProdCoef;

   Last_id := DataSet.FieldByName('ID_CUSTOMER').AsInteger;
  end
  else begin
   Values[RecordCount - 1, 1] := Values[RecordCount - 1, 1] + DataSet.FieldByName('PLAN_COUNT').AsCurrency * DataSet.FieldByName('COEFFICIENT').AsCurrency * Multiplicator / ProdCoef;
   Values[RecordCount - 1, 2] := Values[RecordCount - 1, 2] + DataSet.FieldByName('DELIVER_COUNT').AsCurrency * DataSet.FieldByName('COEFFICIENT').AsCurrency * Multiplicator / ProdCoef;
  end;

  DataSet.Next;
 end;

 DataSet.Close;

 Name_Cust_Column.SortOrder := soAscending;
end;

procedure TView_Dogs_DataForm.FormCreate(Sender: TObject);
begin
 Name_Cust_Column.DataBinding.ValueTypeClass     := TcxStringValueType;
 Plan_Count_Column.DataBinding.ValueTypeClass    := TcxCurrencyValueType;
 Deliver_Count_Column.DataBinding.ValueTypeClass := TcxCurrencyValueType;
end;

procedure TView_Dogs_DataForm.ApplyButtonClick(Sender: TObject);
var
 i : integer;
begin
 ResSum := 0;

 with TableView.DataController do begin
  for i := 0 to RecordCount - 1 do ResSum := ResSum + Values[i, 1];
 end;

 ModalResult := mrOk;
end;

end.
