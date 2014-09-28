{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{               Модуль "Ввод продукции для периода поставки"                   }
{ Производит ввод данных о продукции договора на ВЦВ для конкретного периода   }
{ поставки с указанием плановых данных.                                        }
{                                                 ответственный: Гнибеда Антон }

unit dt_sched_deliver_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FIBQuery,
  pFIBQuery, pFIBStoredProc, Db,
  FIBDataSet, pFIBDataSet, Grids, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxButtons, DBGrids, cxDropDownEdit,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dogLoaderUnit, FIBDatabase, pFIBDatabase,
  cxCalendar;

type
   TFdt_sched_deliver_ADD = class(TForm)
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    VolPayEdit: TEdit;
    VolFulfilEdit: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    pFIBStoredProc1: TpFIBStoredProc;
    UMeasEdit1: TcxButtonEdit;
    CatEdit: TcxTextEdit;
    CountEdit: TcxTextEdit;
    CostEdit: TcxTextEdit;
    PlanCountEdit: TcxTextEdit;
    SummaEdit: TcxTextEdit;
    SummaNdsEdit: TcxTextEdit;
    CostEdit2: TcxTextEdit;
    SummaEdit2: TcxTextEdit;
    SummaNDSEdit2: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID_TYPE_PRODUCT_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PRODUCT_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CAT_CUST_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1COST_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_PRODUCT_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_PRODUCT_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_CAT_CUST_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_UNIT_MEAS_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1MAIN_PRODUCT_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1NEED_CAT_CUST_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1COST_CAN_CHANGE_PARAM: TcxGridDBColumn;
    cxGrid1DBTableView1NEED_OBJECTS_PARAM: TcxGridDBColumn;
    Label13: TLabel;
    PointEdit: TcxButtonEdit;
    UMeasEditS: TcxButtonEdit;
    Label14: TLabel;
    StrCostEdit: TcxTextEdit;
    StrCostEdit2: TcxTextEdit;
    pFIBQuery1: TpFIBQuery;
    pFIBQuery2: TpFIBQuery;
    ProductEdit: TcxButtonEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CostEditKeyPress(Sender: TObject; var Key: Char);
    procedure CostEditChange(Sender: TObject);
    procedure CountEditKeyPress(Sender: TObject; var Key: Char);
    procedure PlanCountEditChange(Sender: TObject);
    procedure UMeasEdit1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ProductEditChange(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure PointEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CostEdit2PropertiesChange(Sender: TObject);
    procedure ProductEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  public
    DateBeg, DateEnd : TDate;
    id_product   : integer;
    id_cat_cust  : integer;
    id_point     : integer;
    id_unit_meas : integer;
    id_unit_meas_sum : integer;
    koef1, koef_sum : integer;
    CostCount : integer;
    _nds : Currency;
  end;

var
  Fdt_sched_deliver_ADD: TFdt_sched_deliver_ADD;

implementation
uses dt_contract_form_add, add_product;
{$R *.DFM}

procedure TFdt_sched_deliver_ADD.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFdt_sched_deliver_ADD.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end; 
end;

procedure TFdt_sched_deliver_ADD.OKButtonClick(Sender: TObject);
var
 count1, pl_count1 : integer;
begin
 if id_product = -1 then begin
  agShowMessage('Необхідно вибрати продукцію.');
  exit;
 end;
 if PointEdit.Text = '' then begin
  agShowMessage('Необхідно вибрати точку підключення.');
  exit;
 end;
 if isFloat(CostEdit.Text) and isFloat(CountEdit.Text) and isFloat(PlanCountEdit.Text) then begin
//  count1 := StrToInt(CountEdit.Text) {* Koef1 / koef_sum};
//  Koef1 := 1;
//  CountEdit.Text := IntToStr(count1);
//  pl_count1 := StrToInt(PlanCountEdit.Text) {* Koef1 / koef_sum};
//  Koef2 := 1;
//  PlanCountEdit.Text := IntToStr(pl_count1);
  ModalResult := mrOk;
 end else agShowMessage('Уведено неприпустимі дані.');
end;

procedure TFdt_sched_deliver_ADD.FormCreate(Sender: TObject);
begin
 id_product  := -1;
 id_point    := -1;
 id_cat_cust := -1;
 CostCount   := 1;

 id_unit_meas := SYS_DEF_UNIT_MEAS;
 id_unit_meas_sum := SYS_DEF_UNIT_MEAS_SUM;
 UMeasEdit1.Text := SYS_DEF_NAME_UNIT_MEAS;
 UMeasEditS.Text := SYS_DEF_NAME_UNIT_MEAS_SUM;
 koef1 := SYS_DEF_UNIT_MEAS_COEF;
 koef_sum := SYS_DEF_UNIT_MEAS_SUM_COEF;
 pFIBDataSet1.DAtabase := (Owner as TFdt_contract_ADD).WorkDataBase;
//FIBStoredProc1.ExecProcedure('PROC_DT_SCHED_DELIVER_CALC_COST', [Self.DateBeg, Self.DateEnd, id_product, id_cat_cust]);
end;

procedure TFdt_sched_deliver_ADD.FormShow(Sender: TObject);
begin
{ if UMeasEdit1.Text = '' then begin
  Koef1 := 1;
  Koef2 := 1;
  pFIBStoredProc1.ExecProcedure('PROC_DT_CONTRACT_UNIT_MEAS_SEL', [SYS_DEF_UNIT_MEAS]);
  UMeasEdit1.Text := pFIBStoredProc1['NAME_UNIT_MEAS'].AsString;
  Koef1 := pFIBStoredProc1['COEFFICIENT'].AsInteger;
  Koef2 := pFIBStoredProc1['COEFFICIENT'].AsInteger;
  UMeasEdit2.Text := UMeasEdit1.Text;
  pFIBStoredProc1.Close;
 end;}
 CostEditChange(Self);
 PlanCountEditChange(Self);
 if GroupBox3.Visible then CountEdit.SetFocus;
end;


procedure TFdt_sched_deliver_ADD.CostEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 CheckFloat(Key);
end;

procedure TFdt_sched_deliver_ADD.CostEditChange(Sender: TObject);
begin
 if isFloat(CostEdit.Text) and (isFloat(CountEdit.Text)) then begin
  SummaEdit.Text := agCurrToStr( StrToCurr(CostEdit.Text) * StrToCurr(CountEdit.Text) * Koef1 / koef_sum);
  SummaNDSEdit.Text := agCurrToStr(StrToCurr(SummaEdit.Text) * _NDS);
//  SummaEdit2.Text := agCurrToStr( StrToCurr(CostEdit2.Text) * StrToCurr(PlanCountEdit.Text) * Koef1 / koef_sum);
//  SummaNDSEdit2.Text := agCurrToStr(StrToCurr(SummaEdit2.Text) * _NDS);
//  PlanCountEdit.Text := CountEdit.Text;
 end else begin
  SummaEdit.Text := agCurrToStr(0);
  SummaNDSEdit.Text := agCurrToStr(0);
 end;
 CostEdit2.Text := CostEdit.Text;
end;

procedure TFdt_sched_deliver_ADD.CountEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 CheckFloat(Key);
end;

procedure TFdt_sched_deliver_ADD.PlanCountEditChange(Sender: TObject);
begin
 if isFloat(CostEdit2.Text) and (isFloat(PlanCountEdit.Text)) then begin
  SummaEdit2.Text := agCurrToStr( StrToCurr(CostEdit2.Text) * StrToCurr(PlanCountEdit.Text) * Koef1 / koef_sum);
  SummaNDSEdit2.Text := agCurrToStr(StrToCurr(SummaEdit2.Text) * _NDS);
 end else begin
  SummaEdit2.Text := agCurrToStr(0);
  SummaNDSEdit2.Text := agCurrToStr(0);
 end;
end;

procedure TFdt_sched_deliver_ADD.UMeasEdit1ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
 prevk : integer;
 i, o  : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer((Owner as TFdt_contract_ADD).WorkDatabase.Handle);
 i.Values['ReadTransaction'] := Integer((Owner as TFdt_contract_ADD).ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer((Owner as TFdt_contract_ADD).WriteTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('WorkDog\ini_unit_meas.bpl', Self, i, o);
 if o['ModalResult'] = mrOk then begin
  id_unit_meas := o['ID_UNIT_MEAS'];
  UMeasEdit1.Text := o['NAME_UNIT_MEAS'];
  prevk := koef1;
  koef1 := o['KOEF'];
  if isFloat(CountEdit.Text) then CountEdit.Text := agCurrToStr(strToCurr(CountEdit.Text) / prevk * koef1);
  if isFloat(PlanCountEdit.Text) then PlanCountEdit.Text := agCurrToStr(strToCurr(PlanCountEdit.Text) / prevk * koef1);
  CostEditChange(Self);
  PlanCountEditChange(Self);
 end;
end;

procedure TFdt_sched_deliver_ADD.ProductEditChange(Sender: TObject);
begin
 pFIBDataSet1.Active := false;
 pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from PL_SELECT_PRICES_FOR_PLAN_3('
 + QuotedStr(ProductEdit.Text) + ',' + QuotedStr(DateToStr(DateBeg)) + ', '
 + QuotedStr(DateToStr(DateEnd)) + ')';
 pFIBDataSet1.Active := true;
end;

procedure TFdt_sched_deliver_ADD.cxGrid1DBTableView1DblClick(
  Sender: TObject);
begin
(* id_product := pFIBDataSet1['ID_PRODUCT_PARAM'];
 ProductEdit.Text := pFIBDataSet1['NAME_PRODUCT_PARAM'];
 id_cat_cust := pFIBDataSet1['ID_CAT_CUST_PARAM'];
 CatEdit.Text := pFIBDataSet1['NAME_CAT_CUST_PARAM'];
{ if Add_Product_Form.CheckBox3.Checked then begin
  CostEdit.Color := SYS_ENABLED_COLOR;
  CostEdit.ReadOnly := false;
 end else begin
  CostEdit.Color := SYS_DISABLED_COLOR;
  CostEdit.ReadOnly := true;
 end;}
 //Calc cost
 CostEdit.Text := pFIBDataSet1['COST_PARAM'] / pFIBDataSet1['QNT_UNIT_MEAS'];
 ProductEdit.DroppedDown := false; *)
end;

procedure TFdt_sched_deliver_ADD.PointEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer((Owner as TFdt_contract_ADD).WorkDatabase.Handle);
 i.Values['ReadTransaction'] := Integer((Owner as TFdt_contract_ADD).ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer((Owner as TFdt_contract_ADD).WriteTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('WorkDog\sp_object.bpl', Self, i, o);
 if o['ModalResult'] = mrOk then begin
  id_point := o['ID_OBJECT'];
  PointEdit.Text := o['NAME_OBJECT'];
 end; 
end;

procedure TFdt_sched_deliver_ADD.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o  : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer((Owner as TFdt_contract_ADD).WorkDatabase.Handle);
 i.Values['ReadTransaction'] := Integer((Owner as TFdt_contract_ADD).ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer((Owner as TFdt_contract_ADD).WriteTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('WorkDog\ini_unit_meas.bpl', Self, i, o);
 if o['ModalResult'] = mrOk then begin
  id_unit_meas_sum := o['ID_UNIT_MEAS'];
  UMeasEditS.Text := o['NAME_UNIT_MEAS'];
  koef_sum := o['KOEF'];
  CostEditChange(Self);
  PlanCountEditChange(Self);
 end;
end;

procedure TFdt_sched_deliver_ADD.CostEdit2PropertiesChange(
  Sender: TObject);
begin
 if isFloat(CostEdit2.Text) and (isFloat(PlanCountEdit.Text)) then begin
  SummaEdit2.Text := agCurrToStr( StrToCurr(CostEdit2.Text) * StrToCurr(PlanCountEdit.Text) * Koef1 / koef_sum);
  SummaNDSEdit2.Text := agCurrToStr(StrToCurr(SummaEdit2.Text) * _NDS);
 end else begin
  SummaEdit2.Text := agCurrToStr(0);
  SummaNDSEdit2.Text := agCurrToStr(0);
 end;
end;

procedure TFdt_sched_deliver_ADD.ProductEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Result : TResultArray;
 opt    : TSpravOptions;
 s1, s2, str : string;
begin
 Opt.canAdd := true;
 Opt.canDelete := true;
 Opt.canEdit := true;
 Opt.canSelect := true;
 Opt.canSelect2 := true;
 Opt.HideButtons := False;
 Opt.isModal := true;

// Add_Product.Date_Beg := Self.DateBeg;
// Add_Product.Date_End := Self.DateEnd;
 Add_Product.Date_Beg := (Owner as TFdt_contract_ADD).DateBegEdit.Date;
 Add_Product.Date_End := (Owner as TFdt_contract_ADD).DateEndEdit.Date;
 Result := Add_Product_Form.tagShow(opt, (Owner as TFdt_contract_ADD).WorkDatabase.Handle, (Owner as TFdt_contract_ADD).ReadTransaction.Handle);
 if Length(Result) > 0 then begin
  id_product := Result[0];
  ProductEdit.Text := Result[1];
  id_cat_cust := Result[2];
  CatEdit.Text := Result[3];
  if Add_Product_Form.CostCheck.Checked then CostEdit.Enabled := true
                                        else CostEdit.Enabled := false;

  s1 := (owner as TFdt_contract_ADD).cxGridTableView1.DataController.Values[(owner as TFdt_contract_ADD).cxGridTableView1.DataController.focusedRecordIndex, 0];
  s2 := (owner as TFdt_contract_ADD).cxGridTableView1.DataController.Values[(owner as TFdt_contract_ADD).cxGridTableView1.DataController.focusedRecordIndex, 1];
  pFIBQuery1.SQL.Text := 'SELECT TOTAL_COST, COST_COUNT FROM PROC_DOG_CALC_PROD_COST(' + IntToStr(id_product) + ', ' + IntToStr(id_cat_cust) + ', ''' + s1 + ''', ''' + s2 + ''')';
  pFIBQuery1.ExecQuery;
  if pFIBQuery1.RecordCount = 0 then begin
    CostEdit.Text := '0';
    CostEdit2.Text := CostEdit.Text;
    StrCostEdit.Text := '0';
    StrCostEdit2.Text := '0';
    CostCount := 0;
  end else begin
   if pFIBQuery1['COST_COUNT'].AsInteger > 1 then
   begin
     pFIBQuery2.SQL.Text := 'Select * from pl_find_product_price2(' + IntToStr(id_product) + ', ' + IntToStr(id_cat_cust) + ', ''' + s1 + ''', ''' + s2 + ''')';
     pFIBQuery2.ExecQuery;
     str := '';
     while not pFIBQuery2.Eof do
     begin
       if str <> '' then str := str + ' / ' + pFIBQuery2['COST'].AsString else str := pFIBQuery2['COST'].AsString;
       pFIBQuery2.Next;
     end;
     StrCostEdit.Text := str;
     StrCostEdit2.Text := str;
     pFIBQuery2.Close;
   end else
   begin
     StrCostEdit.Text := pFIBQuery1['TOTAL_COST'].AsString;
     StrCostEdit2.Text := pFIBQuery1['TOTAL_COST'].AsString;
   end;
   CostEdit.Text := pFIBQuery1['TOTAL_COST'].AsString;
   CostEdit2.Text := CostEdit.Text;
   CostCount := pFIBQuery1['COST_COUNT'].AsInteger;
//   cxGrid1TableView1.DataController.Values[i, IDX_real_COST] := pFIBQuery1['TOTAL_COST'].AsString;
//   cxGrid1TableView1.DataController.Values[i, IDX_P_COST] := pFIBQuery1['TOTAL_COST'].AsString;
//   cxGrid1TableView1.DataController.Values[i, 8] := pFIBQuery1['COST_COUNT'].AsString ;
   pFIBQuery1.Next;
  end;
  pFIBQuery1.Close;
 end;
//  CostEdit.Text := Result[8];
//  UMeasEdit1.Text := Result[4];
 Add_Product_Form.Free;
end;

end.
