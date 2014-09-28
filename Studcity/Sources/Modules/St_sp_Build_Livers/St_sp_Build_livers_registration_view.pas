unit St_sp_Build_livers_registration_view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxTextEdit, cxCalendar, cxCurrencyEdit, DB,
  cxDBData, cxLookAndFeelPainters, FIBDataSet, pFIBDataSet, cxDropDownEdit,
  StdCtrls, cxButtons, cxGridDBTableView, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, cxMaskEdit, cxCheckBox, cxContainer,
  cxGroupBox;

type
  TRegistration_Form = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    Full_Build_Label: TLabel;
    cxGrid2: TcxGrid;
    cxGridTableView_of_Live: TcxGridTableView;
    cxGridColumn3: TcxGridColumn;
    cxGridColumn0: TcxGridColumn;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    cxGridColumn5: TcxGridColumn;
    cxGridColumn6: TcxGridColumn;
    cxGridColumn7: TcxGridColumn;
    flag4: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox4: TcxGroupBox;
    Full_Cat_Label: TLabel;
    cxGrid1: TcxGrid;
    cxGridTableView1: TcxGridTableView;
    cxGridTableView1Column1: TcxGridColumn;
    cxGridTableView1Column2: TcxGridColumn;
    cxGridTableView1Column3: TcxGridColumn;
    cxGridTableView1Column4: TcxGridColumn;
    cxGridTableView1Column7: TcxGridColumn;
    flag3: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    cxTabSheet4: TcxTabSheet;
    cxGroupBox5: TcxGroupBox;
    Sub_Type_Label: TLabel;
    cxGrid3: TcxGrid;
    cxGridTableView2: TcxGridTableView;
    cxGridTableView2Column1: TcxGridColumn;
    cxGridTableView2Column2: TcxGridColumn;
    cxGridTableView2Column3: TcxGridColumn;
    cxGridTableView2Column4: TcxGridColumn;
    cxGridTableView2Column5: TcxGridColumn;
    cxGridTableView2Column6: TcxGridColumn;
    cxGridTableView2Column7: TcxGridColumn;
    cxGridTableView2Column8: TcxGridColumn;
    cxGridTableView2Column9: TcxGridColumn;
    cxGridTableView2Column10: TcxGridColumn;
    flag2: TcxGridColumn;
    cxGridLevel3: TcxGridLevel;
    cxTabSheet5: TcxTabSheet;
    cxGroupBox6: TcxGroupBox;
    Lgot_Full_Label: TLabel;
    cxGrid4: TcxGrid;
    cxGridTableView3: TcxGridTableView;
    cxGridTableView3Column1: TcxGridColumn;
    cxGridColumn8: TcxGridColumn;
    cxGridColumn9: TcxGridColumn;
    cxGridColumn13: TcxGridColumn;
    cxGridColumn16: TcxGridColumn;
    flag: TcxGridColumn;
    cxGridLevel4: TcxGridLevel;
    cxTabSheet6: TcxTabSheet;
    cxGroupBox11: TcxGroupBox;
    Image1: TImage;
    cxGrid5: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    IstFinance: TcxGridColumn;
    Summa: TcxGridColumn;
    id_smeta: TcxGridColumn;
    id_razdel: TcxGridColumn;
    id_stat: TcxGridColumn;
    id_kekv: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    Sum_Result: TcxCurrencyEdit;
    CancelButton: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    FIO_Label: TLabel;
    Fac_Label: TLabel;
    Kurs_Label: TLabel;
    DataRog_Label: TLabel;
    FIOCOMBO_Label: TLabel;
    cxGridTableView1Column5: TcxGridColumn;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGridTableView_of_LiveFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridTableView2FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridTableView3FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
  public
    procedure SortGridData;
    procedure SortGridData_Live;
    procedure SortGridData_Subsidy;
    procedure SortGridData_Lg;
  end;

var
  Registration_Form: TRegistration_Form;

implementation

{$R *.dfm}

procedure TRegistration_Form.SortGridData;
var
  i : integer;
  temp_kod_category : Smallint;
  doNew : boolean;
  temp_date_beg, temp_date_end : TDate;
  temp_Kategoriya : integer;
  temp_flag, temp_SHORT_NAME_CATEGORY : string;
  temp_sum : Double;
begin
  if cxGridTableView1.DataController.RecordCount < 2 then exit;

  doNew := true;
  while doNew do
   begin
    doNew := false;
    for i := 0 to cxGridTableView1.DataController.RecordCount - 2 do
     begin
      if (cxGridTableView1.DataController.Values[i, 1] <= cxGridTableView1.DataController.Values[i + 1, 2]) and
         (cxGridTableView1.DataController.Values[i, 2] < cxGridTableView1.DataController.Values[i + 1, 2]) then
       begin
        temp_flag                :='';
        temp_kod_category        := cxGridTableView1.DataController.Values[i, 0];
        temp_date_beg            := cxGridTableView1.DataController.Values[i, 1];
        temp_date_end            := cxGridTableView1.DataController.Values[i, 2];
        temp_Kategoriya          := cxGridTableView1.DataController.Values[i, 3];
        temp_SHORT_NAME_CATEGORY := cxGridTableView1.DataController.Values[i, 4];
        temp_sum                 := cxGridTableView1.DataController.Values[i, 6];

        If cxGridTableView1.DataController.Values[i, 5] <> null then
         begin
          temp_flag := cxGridTableView1.DataController.Values[i, 5];
          cxGridTableView1.DataController.Values[i, 5]:= '';
         end;

        cxGridTableView1.DataController.Values[i, 0] := cxGridTableView1.DataController.Values[i + 1, 0];
        cxGridTableView1.DataController.Values[i, 1] := cxGridTableView1.DataController.Values[i + 1, 1];
        cxGridTableView1.DataController.Values[i, 2] := cxGridTableView1.DataController.Values[i + 1, 2];
        cxGridTableView1.DataController.Values[i, 3] := cxGridTableView1.DataController.Values[i + 1, 3];
        cxGridTableView1.DataController.Values[i, 4] := cxGridTableView1.DataController.Values[i + 1, 4];
        cxGridTableView1.DataController.Values[i, 6] := cxGridTableView1.DataController.Values[i + 1, 6];
        if cxGridTableView1.DataController.Values[i + 1, 5] <> null then
         begin
          cxGridTableView1.DataController.Values[i, 5] := cxGridTableView1.DataController.Values[i + 1, 5];
          cxGridTableView1.DataController.Values[i + 1, 5]:='';
         end;

        cxGridTableView1.DataController.Values[i + 1, 0] := temp_kod_category;
        cxGridTableView1.DataController.Values[i + 1, 1] := temp_date_beg;
        cxGridTableView1.DataController.Values[i + 1, 2] := temp_date_end;
        cxGridTableView1.DataController.Values[i + 1, 3] := temp_Kategoriya;
        cxGridTableView1.DataController.Values[i + 1, 4] := temp_SHORT_NAME_CATEGORY;
        cxGridTableView1.DataController.Values[i + 1, 6] := temp_sum;
        if temp_flag <> '' then  cxGridTableView1.DataController.Values[i + 1, 5] := temp_flag;
        doNew := true;
       end;
     end;
   end;
end;

procedure TRegistration_Form.SortGridData_Live;
var
 i, temp_Type_Room, temp_kod_build     : integer;
 doNew : boolean;
 temp_date_beg, temp_date_end : TDate;
 temp_flag,temp_obsh, temp_komnata, temp_N_Room, temp_Short_Name_Build: string;
 begin
 if cxGridTableView_of_Live.DataController.RecordCount < 2 then exit;
 doNew := true;
 while doNew do begin
  doNew := false;
  for i := 0 to cxGridTableView_of_Live.DataController.RecordCount - 2 do
  begin
  if (cxGridTableView_of_Live.DataController.Values[i, 2] <= cxGridTableView_of_Live.DataController.Values[i + 1, 3])
     and (cxGridTableView_of_Live.DataController.Values[i, 3] < cxGridTableView_of_Live.DataController.Values[i + 1, 3]) then begin
  temp_flag :='';
   temp_obsh:= cxGridTableView_of_Live.DataController.Values[i, 0];
   temp_komnata:= cxGridTableView_of_Live.DataController.Values[i, 1];
   temp_date_beg := cxGridTableView_of_Live.DataController.Values[i, 2];
   temp_date_end := cxGridTableView_of_Live.DataController.Values[i, 3];
   temp_kod_build:= cxGridTableView_of_Live.DataController.Values[i, 4];
   temp_N_Room:= cxGridTableView_of_Live.DataController.Values[i, 5];
   temp_Type_Room := cxGridTableView_of_Live.DataController.Values[i, 6];
   temp_Short_Name_Build := cxGridTableView_of_Live.DataController.Values[i,7];
 if cxGridTableView_of_Live.DataController.Values[i, 8]<> null then
begin
   temp_flag := cxGridTableView_of_Live.DataController.Values[i, 8];
   cxGridTableView_of_Live.DataController.Values[i, 8]:= '';
end;
   cxGridTableView_of_Live.DataController.Values[i, 0] := cxGridTableView_of_Live.DataController.Values[i + 1, 0];
   cxGridTableView_of_Live.DataController.Values[i, 1] := cxGridTableView_of_Live.DataController.Values[i + 1, 1];
   cxGridTableView_of_Live.DataController.Values[i, 2] := cxGridTableView_of_Live.DataController.Values[i + 1, 2];
   cxGridTableView_of_Live.DataController.Values[i, 3] := cxGridTableView_of_Live.DataController.Values[i + 1, 3];
   cxGridTableView_of_Live.DataController.Values[i, 4] := cxGridTableView_of_Live.DataController.Values[i + 1, 4];
   cxGridTableView_of_Live.DataController.Values[i, 5] := cxGridTableView_of_Live.DataController.Values[i + 1, 5];
   cxGridTableView_of_Live.DataController.Values[i, 6] := cxGridTableView_of_Live.DataController.Values[i + 1, 6];
   cxGridTableView_of_Live.DataController.Values[i, 7] := cxGridTableView_of_Live.DataController.Values[i + 1, 7];
 if cxGridTableView_of_Live.DataController.Values[i + 1, 8]<> null then
begin
   cxGridTableView_of_Live.DataController.Values[i, 8] := cxGridTableView_of_Live.DataController.Values[i + 1, 8];
   cxGridTableView_of_Live.DataController.Values[i + 1, 8]:='';
   end;

   cxGridTableView_of_Live.DataController.Values[i + 1, 0] := temp_obsh;
   cxGridTableView_of_Live.DataController.Values[i + 1, 1] := temp_komnata;
   cxGridTableView_of_Live.DataController.Values[i + 1, 2] := temp_date_beg;
   cxGridTableView_of_Live.DataController.Values[i + 1, 3] := temp_date_end;
   cxGridTableView_of_Live.DataController.Values[i + 1, 4] := temp_kod_build;
   cxGridTableView_of_Live.DataController.Values[i + 1, 5] := temp_N_Room;
   cxGridTableView_of_Live.DataController.Values[i + 1, 6] := temp_Type_Room;
   cxGridTableView_of_Live.DataController.Values[i + 1, 7] := temp_Short_Name_Build;
if temp_flag<>'' then  cxGridTableView_of_Live.DataController.Values[i + 1, 8] := temp_flag;
   doNew := true;
   end;
  end;
 end;
end;


procedure TRegistration_Form.SortGridData_Subsidy;

var
 i  ,temp_id_subsidy, temp_id_state    : integer;
 doNew : boolean;
 temp_date_beg, temp_date_end : TDate;
 temp_summa, temp_kol_month, temp_sostoyanie, temp_Comment, temp_fullname, temp_short_name:string  ;
 temp_flag : string;
 begin
 if cxGridTableView2.DataController.RecordCount < 2 then exit;
 doNew := true;
 while doNew do begin
  doNew := false;
  for i := 0 to cxGridTableView2.DataController.RecordCount - 2 do
  begin
  temp_flag :='';
  if (cxGridTableView2.DataController.Values[i, 0] <= cxGridTableView2.DataController.Values[i + 1, 1]) and
     (cxGridTableView2.DataController.Values[i, 1] < cxGridTableView2.DataController.Values[i + 1, 1]) then begin
   temp_date_beg := cxGridTableView2.DataController.Values[i, 0];
   temp_date_end := cxGridTableView2.DataController.Values[i, 1];
   temp_summa := cxGridTableView2.DataController.Values[i, 2];
   temp_kol_month := cxGridTableView2.DataController.Values[i, 3];
   temp_sostoyanie := cxGridTableView2.DataController.Values[i, 4];
   temp_id_subsidy := cxGridTableView2.DataController.Values[i, 5];
   temp_id_state := cxGridTableView2.DataController.Values[i, 6];
   if cxGridTableView2.DataController.Values[i, 7] <> null then   temp_Comment := cxGridTableView2.DataController.Values[i, 7]
   else temp_Comment :='';
   temp_fullname := cxGridTableView2.DataController.Values[i, 8];
   temp_short_name := cxGridTableView2.DataController.Values[i, 9];
   if cxGridTableView2.DataController.Values[i, 10]<> null then
   begin
   temp_flag := cxGridTableView2.DataController.Values[i, 10];
   cxGridTableView2.DataController.Values[i, 10]:= '';
   end;

   cxGridTableView2.DataController.Values[i, 0] := cxGridTableView2.DataController.Values[i + 1, 0];
   cxGridTableView2.DataController.Values[i, 1] := cxGridTableView2.DataController.Values[i + 1, 1];
   cxGridTableView2.DataController.Values[i, 2] := cxGridTableView2.DataController.Values[i + 1, 2];
   cxGridTableView2.DataController.Values[i, 3] := cxGridTableView2.DataController.Values[i + 1, 3];
   cxGridTableView2.DataController.Values[i, 4] := cxGridTableView2.DataController.Values[i + 1, 4];
   cxGridTableView2.DataController.Values[i, 5] := cxGridTableView2.DataController.Values[i + 1, 5];
   cxGridTableView2.DataController.Values[i, 6] := cxGridTableView2.DataController.Values[i + 1, 6];
   cxGridTableView2.DataController.Values[i, 7] := cxGridTableView2.DataController.Values[i + 1, 7];
   cxGridTableView2.DataController.Values[i, 8] := cxGridTableView2.DataController.Values[i + 1, 8];
   cxGridTableView2.DataController.Values[i, 9] := cxGridTableView2.DataController.Values[i + 1, 9];
   if cxGridTableView2.DataController.Values[i + 1, 10]<> null then
   begin
   cxGridTableView2.DataController.Values[i, 10] := cxGridTableView2.DataController.Values[i + 1, 10];
   cxGridTableView2.DataController.Values[i + 1, 10]:='';
   end;

   cxGridTableView2.DataController.Values[i + 1, 0] := temp_date_beg;
   cxGridTableView2.DataController.Values[i + 1, 1] := temp_date_end;
   cxGridTableView2.DataController.Values[i + 1, 2] := temp_summa;
   cxGridTableView2.DataController.Values[i + 1, 3] := temp_kol_month;
   cxGridTableView2.DataController.Values[i + 1, 4] := temp_sostoyanie;
   cxGridTableView2.DataController.Values[i + 1, 5] := temp_id_subsidy;
   cxGridTableView2.DataController.Values[i + 1, 6] := temp_id_state;
   cxGridTableView2.DataController.Values[i + 1, 7] := temp_Comment;
   cxGridTableView2.DataController.Values[i + 1, 8] := temp_fullname;
   cxGridTableView2.DataController.Values[i + 1, 9] := temp_short_name;
   if temp_flag<>'' then  cxGridTableView2.DataController.Values[i + 1, 10] := temp_flag;
   doNew := true;
   end;
  end;
 end;
end;

procedure TRegistration_Form.SortGridData_Lg;

var
 i  ,temp_id_lg , temp_kod_lg  : integer;
 doNew : boolean;
 temp_date_beg, temp_date_end : TDate;
 temp_flag, temp_fullname : string  ;
 begin
 if cxGridTableView3.DataController.RecordCount < 2 then exit;
 doNew := true;
 while doNew do begin
  doNew := false;
  for i := 0 to cxGridTableView3.DataController.RecordCount - 2 do
  begin
  temp_flag :='';
  if cxGridTableView3.DataController.Values[i, 1] <= cxGridTableView3.DataController.Values[i + 1, 2]
  and (cxGridTableView3.DataController.Values[i, 2] < cxGridTableView3.DataController.Values[i + 1, 2]) then begin
   temp_kod_lg   := cxGridTableView3.DataController.Values[i, 0];
   temp_date_beg := cxGridTableView3.DataController.Values[i, 1];
   temp_date_end := cxGridTableView3.DataController.Values[i, 2];
   temp_id_lg    := cxGridTableView3.DataController.Values[i, 3];
   temp_fullname := cxGridTableView3.DataController.Values[i, 4];
if cxGridTableView3.DataController.Values[i, 5]<> null then
begin
   temp_flag := cxGridTableView3.DataController.Values[i, 5];
   cxGridTableView3.DataController.Values[i, 5]:= '';
end;
   cxGridTableView3.DataController.Values[i, 0] := cxGridTableView3.DataController.Values[i + 1, 0];
   cxGridTableView3.DataController.Values[i, 1] := cxGridTableView3.DataController.Values[i + 1, 1];
   cxGridTableView3.DataController.Values[i, 2] := cxGridTableView3.DataController.Values[i + 1, 2];
   cxGridTableView3.DataController.Values[i, 3] := cxGridTableView3.DataController.Values[i + 1, 3];
   cxGridTableView3.DataController.Values[i, 4] := cxGridTableView3.DataController.Values[i + 1, 4];
if cxGridTableView3.DataController.Values[i + 1, 5]<> null then
begin
   cxGridTableView3.DataController.Values[i, 5] := cxGridTableView3.DataController.Values[i + 1, 5];
   cxGridTableView3.DataController.Values[i + 1, 5]:='';
   end;

   cxGridTableView3.DataController.Values[i + 1, 0] := temp_kod_lg;
   cxGridTableView3.DataController.Values[i + 1, 1] := temp_date_beg;
   cxGridTableView3.DataController.Values[i + 1, 2] := temp_date_end;
   cxGridTableView3.DataController.Values[i + 1, 3] := temp_id_lg;
   cxGridTableView3.DataController.Values[i + 1, 4] := temp_fullname;
 if temp_flag<>'' then  cxGridTableView3.DataController.Values[i + 1, 5] := temp_flag;
   doNew := true;
   end;
  end;
 end;
end;

procedure TRegistration_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TRegistration_Form.FormCreate(Sender: TObject);
begin
  with  cxGridTableView_of_Live do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[4].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxIntegerValueType;;
    Items[7].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
   end;

  with  cxGridTableView1 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxSmallintValueType;
    Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxFloatValueType;
   end;

  with cxGridTableView2 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[6].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[7].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[9].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[10].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[11].DataBinding.ValueTypeClass := TcxIntegerValueType;
   end;

  with cxGridTableView3 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxSmallintValueType;
    Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[7].DataBinding.ValueTypeClass := TcxStringValueType;
   end;

  with cxGrid1TableView1 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[1].DataBinding.ValueTypeClass := TcxFloatValueType;
    Items[2].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[4].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
   end;
end;

procedure TRegistration_Form.cxGridTableView_of_LiveFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7] <> null then
Full_Build_Label.Caption:=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7];
end;

procedure TRegistration_Form.cxGridTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 4] <> null then
Full_Cat_Label.Caption:=cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 4];
end;

procedure TRegistration_Form.cxGridTableView2FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 8] <> null then
Sub_Type_Label.Caption:=cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 8];
end;

procedure TRegistration_Form.cxGridTableView3FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4] <> null then
Lgot_Full_Label.Caption:=cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4];
end;

end.
