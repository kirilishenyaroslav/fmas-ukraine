{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{          Модуль "Ввод продукции для всех периодов поставки"                  }
{ Производит ввод данных о продукции договора на ВЦВ для всех периодов         }
{ поставки с указанием плановых данных.                                        }
{                                                 ответственный: Гнибеда Антон }

unit dt_sched_deliver_FORM_ADD2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, Variants, cxCurrencyEdit, cxMaskEdit,
  cxButtonEdit, cxLabel, FIBQuery, pFIBQuery, dogLoaderUnit, cxTL,
  cxCalendar;

type
  TFdt_sched_deliver_ADD2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    cxGrid1TableView1Column3: TcxGridColumn;
    cxGrid1TableView1Column4: TcxGridColumn;
    cxGrid1TableView1Column5: TcxGridColumn;
    cxGrid1TableView1Column6: TcxGridColumn;
    cxGrid1TableView1Column7: TcxGridColumn;
    cxGrid1TableView1Column8: TcxGridColumn;
    ProductEdit: TcxTextEdit;
    CatEdit: TcxTextEdit;
    Button1: TcxButton;
    CancelButton: TcxButton;
    Label13: TLabel;
    PointEdit: TcxButtonEdit;
    UMeasEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    Label14: TLabel;
    UMeasEditS: TcxButtonEdit;
    pFIBQuery1: TpFIBQuery;
    cxLabel2: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1TableView1Column9: TcxGridColumn;
    cxGrid1TableView1Column10: TcxGridColumn;
    pFIBQuery2: TpFIBQuery;
    procedure CancelButtonClick(Sender: TObject);
    procedure StringGrid1xSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1TableView1Column3PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1TableView1Column6PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1TableView1Column4PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure PointEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure UMeasEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure UMeasEditSPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGrid1TableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxGrid1TableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1TableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Costs : array of array of Currency;    
  public
    id_product   : integer;
    id_cat_cust  : integer;
    id_point     : integer;
    id_unit_meas : integer;
    id_unit_meas_sum : integer;
    koef         : integer;
    koef_sum     : integer;
    cost         : currency;
    function ShowProductForm : boolean;
  end;

var
//  Fdt_sched_deliver_ADD2: TFdt_sched_deliver_ADD2;

  IDX_DATE_BEG : integer = 0;
  IDX_DATE_END : integer = 1;
  IDX_COUNT    : integer = 2;
  IDX_COST     : integer = 3;
  IDX_SUMMA    : integer = 4;
  IDX_P_COUNT  : integer = 5;
  IDX_P_COST   : integer = 6;
  IDX_P_SUMMA  : integer = 7;
  idx_cost_count : integer = 8;
  idx_real_cost : integer = 9;

implementation
uses add_product, dt_contract_FORM_ADD,
  prodDateUnit;
{$R *.DFM}

function TFdt_sched_deliver_ADD2.ShowProductForm : boolean;
var
 Res : TResultArray;
 opt : TSpravOptions;
begin
 Result := true;
 Opt.canAdd := true;
 Opt.canDelete := true;
 Opt.canEdit := true;
 Opt.canSelect := true;
 Opt.canSelect2 := true;
 Opt.HideButtons := False;
 Opt.isModal := true;

 Add_Product.Date_Beg := (Owner as TFdt_contract_ADD).DateBegEdit.Date;
 Add_Product.Date_End := (Owner as TFdt_contract_ADD).DateEndEdit.Date;
 Res := Add_Product_Form.tagShow(opt, (Owner as TFdt_contract_ADD).WorkDatabase.Handle, (Owner as TFdt_contract_ADD).ReadTransaction.Handle);
 if Length(Res) > 0 then begin
  id_product := Res[0];
  ProductEdit.Text := Res[1];
  id_cat_cust := Res[2];
  CatEdit.Text := Res[3];
  //Calc cost
  Cost := Res[8];
 end else Result := false;
 Add_Product_Form.Free;
end;


procedure TFdt_sched_deliver_ADD2.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFdt_sched_deliver_ADD2.StringGrid1xSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
 if (ACol = IDX_DATE_BEG) or (ACol = IDX_DATE_END) or
    (ACol = IDX_SUMMA) or (ACol = IDX_P_SUMMA) then CanSelect := false;
end;

procedure TFdt_sched_deliver_ADD2.FormShow(Sender: TObject);
var
 r : TGridRect;
 i, j : integer;
 offset : integer;
 s1, s2 : string;
 str : string;
begin
 cxGrid1TableView1.DataController.FocusedRecordIndex := 0;
 cxGrid1TableView1.Controller.FocusedColumnIndex := 2;
 SetLength(Costs, cxGrid1TableView1.DataController.RecordCount);
 for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do begin
  cxGrid1TableView1.DataController.Values[i, IDX_COUNT] := 0;
  cxGrid1TableView1.DataController.Values[i, IDX_P_COUNT] := 0;
  cxGrid1TableView1.DataController.Values[i, IDX_SUMMA] := 0;
  cxGrid1TableView1.DataController.Values[i, IDX_P_SUMMA] := 0;
//  cxGrid1TableView1.DataController.Values[i, IDX_COST] := agCurrToStr(cost);
//  cxGrid1TableView1.DataController.Values[i, IDX_P_COST] := agCurrToStr(cost);

  s1 := cxGrid1TableView1.DataController.Values[i, IDX_DATE_BEG];
  s2 := cxGrid1TableView1.DataController.Values[i, IDX_DATE_END];

  pFIBQuery1.SQL.Text := 'SELECT TOTAL_COST, COST_COUNT FROM PROC_DOG_CALC_PROD_COST(' + IntToStr(id_product) + ', ' + IntToStr(id_cat_cust) + ', ''' + s1 + ''', ''' + s2 + ''')';
  pFIBQuery1.ExecQuery;
  if pFIBQuery1.RecordCount = 0 then begin
   cxGrid1TableView1.DataController.Values[i, IDX_COST] := 0;
   cxGrid1TableView1.DataController.Values[i, IDX_real_COST] := 0;
   cxGrid1TableView1.DataController.Values[i, IDX_P_COST] := 0;
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
     cxGrid1TableView1.DataController.Values[i, IDX_COST] := str;
     pFIBQuery2.Close;
   end else cxGrid1TableView1.DataController.Values[i, IDX_COST] := pFIBQuery1['TOTAL_COST'].AsString;
   cxGrid1TableView1.DataController.Values[i, IDX_real_COST] := pFIBQuery1['TOTAL_COST'].AsString;
   cxGrid1TableView1.DataController.Values[i, IDX_P_COST] := pFIBQuery1['TOTAL_COST'].AsString;
   cxGrid1TableView1.DataController.Values[i, 8] := pFIBQuery1['COST_COUNT'].AsString ;
   pFIBQuery1.Next;
   while not pFIBQuery1.Eof do begin
    SetLength(Costs[i], Length(Costs[i]) + 1);
    Costs[i][Length(Costs[i]) - 1] := pFIBQuery1['TOTAL_COST'].AsCurrency;
    pFIBQuery1.Next;
   end;
  end;
  pFIBQuery1.Close;
 end;

 offset := 0;
 for i := 0 to Length(Costs) - 1 do if Length(Costs[i]) <> 0 then for j := 0 to Length(Costs[i]) - 1 do begin
  cxGrid1TableView1.DataController.InsertRecord(i + 1);
  cxGrid1TableView1.DataController.Values[i + 1 + offset, IDX_COST] := Costs[i][j];
  cxGrid1TableView1.DataController.Values[i + 1 + offset, IDX_real_COST] := Costs[i][j];
  cxGrid1TableView1.DataController.Values[i + 1 + offset, IDX_COUNT] := 0;
  cxGrid1TableView1.DataController.Values[i + 1 + offset, IDX_P_COUNT] := 0;
  cxGrid1TableView1.DataController.Values[i + 1 + offset, IDX_SUMMA] := 0;
  cxGrid1TableView1.DataController.Values[i + 1 + offset, IDX_P_SUMMA] := 0;
//  cxGrid1TableView1.DataController.Values[i + 1 + offset, IDX_real_cost] := 0;
  inc(offset);
 end; 
end;

procedure TFdt_sched_deliver_ADD2.Button1Click(Sender: TObject);
var
 i   : integer;
 err : boolean;
begin
 if PointEdit.Text = '' then begin
  agShowMessage('Необхідно вибрати точку підключення.');
  exit;
 end;
 err := false;
(* for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do begin
{  if not isFloat(cxGrid1TableView1.DataController.DisplayTexts[i, IDX_COUNT]) or
     not isFloat(cxGrid1TableView1.DataController.DisplayTexts[i, IDX_COST]) or
     not isFloat(cxGrid1TableView1.DataController.DisplayTexts[i, IDX_P_COUNT]) or
     not isFloat(cxGrid1TableView1.DataController.DisplayTexts[i, IDX_P_COST]) then begin}
  if cxGrid1TableView1.DataController.DisplayTexts[i, IDX_COUNT] = '0' + DecimalSeparator + '00' then begin
   err := true;
   cxGrid1TableView1.Controller.FocusedColumnIndex := IDX_COUNT;
   break;
  end;
  if cxGrid1TableView1.DataController.DisplayTexts[i, IDX_COST]= '0' + DecimalSeparator + '00' then begin
   err := true;
   cxGrid1TableView1.Controller.FocusedColumnIndex := IDX_COST;
   break;
  end;
  if cxGrid1TableView1.DataController.DisplayTexts[i, IDX_P_COUNT] = '0' + DecimalSeparator + '00' then begin
   err := true;
   cxGrid1TableView1.Controller.FocusedColumnIndex := IDX_P_COUNT;
   break;
  end;
 end;
 if err then begin
  ShowMessage('Необхідно заповнити всі періоди.');
  cxGrid1TableView1.DataController.FocusedRecordIndex := i;
  cxGrid1.SetFocus;
  exit;
 end;*)
 ModalResult := mrOk;
end;

procedure TFdt_sched_deliver_ADD2.FormCreate(Sender: TObject);
begin
 id_unit_meas := SYS_DEF_UNIT_MEAS;
 id_unit_meas_sum := SYS_DEF_UNIT_MEAS_SUM;
 UMeasEdit1.Text := SYS_DEF_NAME_UNIT_MEAS;
 UMeasEditS.Text := SYS_DEF_NAME_UNIT_MEAS_SUM;
 koef_sum := SYS_DEF_UNIT_MEAS_SUM_COEF;
 koef := SYS_DEF_UNIT_MEAS_COEF;

 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[4].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[5].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[6].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[7].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[9].DataBinding.ValueTypeClass := TcxFloatValueType;
end;

procedure TFdt_sched_deliver_ADD2.cxGrid1TableView1Column3PropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
 idx : integer;
 str : string;
begin
 str := DisplayValue;
 idx := pos('-', str);
 if idx <> 0 then Delete(str, idx, 1);
 if str = '' then str := '0' + DecimalSeparator + '000';
 DisplayValue := str;
 idx := cxGrid1TableView1.DataController.FocusedRecordIndex;

 cxGrid1TableView1.DataController.Values[idx, IDX_COUNT] := DisplayValue;
 cxGrid1TableView1.DataController.Values[idx, IDX_P_COUNT] := DisplayValue;
 if isFloat(cxGrid1TableView1.DataController.Values[idx, IDX_real_COST]) then cxGrid1TableView1.DataController.Values[idx, IDX_SUMMA] := cxGrid1TableView1.DataController.Values[idx, IDX_COUNT] * cxGrid1TableView1.DataController.Values[idx, IDX_real_COST] * (koef / koef_sum);
 cxGrid1TableView1Column6PropertiesValidate(Sender, DisplayValue, ErrorText, Error);
end;

procedure TFdt_sched_deliver_ADD2.cxGrid1TableView1Column6PropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
 idx : integer;
 str : string;
begin
 str := DisplayValue;
 idx := pos('-', str);
 if idx <> 0 then Delete(str, idx, 1);
 if str = '' then str := '0' + DecimalSeparator + '000';
 DisplayValue := str;
 idx := cxGrid1TableView1.DataController.FocusedRecordIndex;

 cxGrid1TableView1.DataController.Values[idx, IDX_P_COUNT] := DisplayValue;

 if isFloat(cxGrid1TableView1.DataController.Values[idx, IDX_real_COST]) then cxGrid1TableView1.DataController.Values[idx, IDX_P_SUMMA] := cxGrid1TableView1.DataController.Values[idx, IDX_P_COUNT] * cxGrid1TableView1.DataController.Values[idx, IDX_real_COST] * (Koef / koef_sum);
end;

procedure TFdt_sched_deliver_ADD2.cxGrid1TableView1Column4PropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
 idx : integer;
 str : string;
 val : variant;
begin
 str := DisplayValue;
 idx := pos('-', str);
 if idx <> 0 then Delete(str, idx, 1);
 if str = '' then str := '0' + DecimalSeparator + '000';
 DisplayValue := str;
 idx := cxGrid1TableView1.DataController.FocusedRecordIndex;

 cxGrid1TableView1.DataController.Values[idx, IDX_real_COST] := DisplayValue;
 cxGrid1TableView1.DataController.Values[idx, IDX_P_COST] := DisplayValue;
 if isFloat(cxGrid1TableView1.DataController.Values[idx, IDX_COUNT]) then cxGrid1TableView1.DataController.Values[idx, IDX_SUMMA] := cxGrid1TableView1.DataController.Values[idx, IDX_COUNT] * cxGrid1TableView1.DataController.Values[idx, IDX_real_COST] * (Koef / koef_sum);
 val := cxGrid1TableView1.DataController.Values[idx, IDX_P_COUNT];
 cxGrid1TableView1Column6PropertiesValidate(Sender, val, ErrorText, Error);
end;

procedure TFdt_sched_deliver_ADD2.PointEditPropertiesButtonClick(
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

procedure TFdt_sched_deliver_ADD2.UMeasEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 idx  : integer;
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
  koef := o['KOEF'];
  for idx := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do begin
   if isFloat(cxGrid1TableView1.DataController.Values[idx, IDX_real_COST]) then cxGrid1TableView1.DataController.Values[idx, IDX_SUMMA] := cxGrid1TableView1.DataController.Values[idx, IDX_COUNT] * cxGrid1TableView1.DataController.Values[idx, IDX_real_COST] * (koef / koef_sum);
   if isFloat(cxGrid1TableView1.DataController.Values[idx, IDX_real_COST]) then cxGrid1TableView1.DataController.Values[idx, IDX_P_SUMMA] := cxGrid1TableView1.DataController.Values[idx, IDX_P_COUNT] * cxGrid1TableView1.DataController.Values[idx, IDX_real_COST] * (Koef / koef_sum);
  end;
 end;
end;

procedure TFdt_sched_deliver_ADD2.UMeasEditSPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 idx : integer;
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
  for idx := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do begin
   if isFloat(cxGrid1TableView1.DataController.Values[idx, IDX_real_COST]) then cxGrid1TableView1.DataController.Values[idx, IDX_SUMMA] := cxGrid1TableView1.DataController.Values[idx, IDX_COUNT] * cxGrid1TableView1.DataController.Values[idx, IDX_real_COST] * (koef / koef_sum);
   if isFloat(cxGrid1TableView1.DataController.Values[idx, IDX_real_COST]) then cxGrid1TableView1.DataController.Values[idx, IDX_P_SUMMA] := cxGrid1TableView1.DataController.Values[idx, IDX_P_COUNT] * cxGrid1TableView1.DataController.Values[idx, IDX_real_COST] * (Koef / koef_sum);
  end;
 end;
end;

procedure TFdt_sched_deliver_ADD2.cxGrid1TableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 ADone := false;
 if (AViewInfo.Item.Index = IDX_COST) AND (AViewInfo.GridRecord.Values[cxGrid1TableView1Column9.Index] <> 1) then begin
  ACanvas.Font.Color := clBlue;
  ACanvas.Font.Style := [fsUnderline];
 end;
end;

procedure TFdt_sched_deliver_ADD2.cxGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
// if cxGrid1TableView1.DataController.FocusedRowIndex
end;

procedure TFdt_sched_deliver_ADD2.cxGrid1TableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
 frm : TfrmProdDate;
begin
 if {cxGrid1TableView1Column4.Focused } ACellViewInfo.Item.Index = IDX_COST then if cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 8] <> '1' then
 begin
   frm := TfrmProdDate.Create(Self);
   frm.pFIBDataSet1.ParamByName('ID_PRODUCT').AsInt64  := id_product;
   frm.pFIBDataSet1.ParamByName('ID_CAT_CUST').AsInt64 := id_cat_cust;
   frm.pFIBDataSet1.ParamByName('STAGE_BEG').AsDate := StrToDate(cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0]);
   frm.pFIBDataSet1.ParamByName('STAGE_END').AsDate := StrToDate(cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1]);
   frm.pFIBDataSet1.Active := true;
   frm.ShowModal;
   frm.pFIBDataSet1.Close;
   frm.Free;
 end;
end;

procedure TFdt_sched_deliver_ADD2.cxGrid1TableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
// if Key = VK_RETURN then cxGrid1.Controller.MouseDown(mbLeft, [], mouse.CursorPos.X, mouse.CursorPos.Y);
end;

end.
