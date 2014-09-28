unit jo9_SpecOper_View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxLookAndFeelPainters, cxGridTableView, StdCtrls,
  cxButtons, ExtCtrls, cxGridLevel, cxGridCustomTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxCurrencyEdit,
  cxGridBandedTableView, cxButtonEdit, jo9_SpecOper, cxDropDownEdit;

type
  Tjo9_SpecOper_View_Form = class(TForm)
    ResGrid: TcxGrid;
    ResGridLevel: TcxGridLevel;
    Panel: TPanel;
    CancelButton: TcxButton;
    ResTableView: TcxGridBandedTableView;
    DB_RegNum_Column: TcxGridBandedColumn;
    DB_Sch_Column: TcxGridBandedColumn;
    DB_S_Column: TcxGridBandedColumn;
    DB_R_Column: TcxGridBandedColumn;
    DB_St_Column: TcxGridBandedColumn;
    DB_Kekv_Column: TcxGridBandedColumn;
    KR_Sch_Column: TcxGridBandedColumn;
    KR_S_Column: TcxGridBandedColumn;
    KR_R_Column: TcxGridBandedColumn;
    KR_St_Column: TcxGridBandedColumn;
    KR_Kekv_Column: TcxGridBandedColumn;
    KR_RegNum_Column: TcxGridBandedColumn;
    Summa_Column: TcxGridBandedColumn;
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
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxGridBandedTableViewStyleSheet1: TcxGridBandedTableViewStyleSheet;
    DbShape: TShape;
    Label8: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    S_Label: TLabel;
    R_Label: TLabel;
    St_Label: TLabel;
    Kekv_Label: TLabel;
    Label7: TLabel;
    Sch_Label: TLabel;
    KrShape: TShape;
    Label1: TLabel;
    Sch_Label2: TLabel;
    Label3: TLabel;
    S_Label2: TLabel;
    Label5: TLabel;
    R_Label2: TLabel;
    Label9: TLabel;
    St_Label2: TLabel;
    Label11: TLabel;
    Kekv_Label2: TLabel;
    DB_Sch_Name_Column: TcxGridBandedColumn;
    DB_S_Name_Column: TcxGridBandedColumn;
    DB_R_Name_Column: TcxGridBandedColumn;
    DB_St_Name_Column: TcxGridBandedColumn;
    DB_Kekv_Name_Column: TcxGridBandedColumn;
    KR_Sch_Name_Column: TcxGridBandedColumn;
    KR_S_Name_Column: TcxGridBandedColumn;
    KR_R_Name_Column: TcxGridBandedColumn;
    KR_St_Name_Column: TcxGridBandedColumn;
    KR_Kekv_Name_Column: TcxGridBandedColumn;
    DB_Name_Shablon_Column: TcxGridBandedColumn;
    KR_Name_Shablon_Column: TcxGridBandedColumn;
    DB_id_Dog_Column: TcxGridBandedColumn;
    KR_id_Dog_Column: TcxGridBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ResTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ResTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormResize(Sender: TObject);
    procedure DB_RegNum_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KR_RegNum_ColumnPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    res : PResProvArray;
    procedure SetLabels;
  end;

var
  jo9_SpecOper_View_Form: Tjo9_SpecOper_View_Form;

implementation

uses TagTypes, LoadDogManedger, DogLoaderUnit, tagLibUnit;

{$R *.dfm}

procedure Tjo9_SpecOper_View_Form.FormCreate(Sender: TObject);
begin
 DB_RegNum_Column.DataBinding.ValueTypeClass := TcxVariantValueType;
 DB_Sch_Column.DataBinding.ValueTypeClass    := TcxVariantValueType;
 DB_S_Column.DataBinding.ValueTypeClass      := TcxVariantValueType;
 DB_R_Column.DataBinding.ValueTypeClass      := TcxVariantValueType;
 DB_St_Column.DataBinding.ValueTypeClass     := TcxVariantValueType;
 DB_Kekv_Column.DataBinding.ValueTypeClass   := TcxVariantValueType;
 KR_Sch_Column.DataBinding.ValueTypeClass    := TcxVariantValueType;
 KR_S_Column.DataBinding.ValueTypeClass      := TcxVariantValueType;
 KR_R_Column.DataBinding.ValueTypeClass      := TcxVariantValueType;
 KR_St_Column.DataBinding.ValueTypeClass     := TcxVariantValueType;
 KR_Kekv_Column.DataBinding.ValueTypeClass   := TcxVariantValueType;
 KR_RegNum_Column.DataBinding.ValueTypeClass := TcxVariantValueType;
 Summa_Column.DataBinding.ValueTypeClass     := TcxVariantValueType;

 DB_Sch_Name_Column.DataBinding.ValueTypeClass  := TcxStringValueType;
 DB_S_Name_Column.DataBinding.ValueTypeClass    := TcxStringValueType;
 DB_R_Name_Column.DataBinding.ValueTypeClass    := TcxStringValueType;
 DB_St_Name_Column.DataBinding.ValueTypeClass   := TcxStringValueType;
 DB_Kekv_Name_Column.DataBinding.ValueTypeClass := TcxStringValueType;

 KR_Sch_Name_Column.DataBinding.ValueTypeClass  := TcxStringValueType;
 KR_S_Name_Column.DataBinding.ValueTypeClass    := TcxStringValueType;
 KR_R_Name_Column.DataBinding.ValueTypeClass    := TcxStringValueType;
 KR_St_Name_Column.DataBinding.ValueTypeClass   := TcxStringValueType;
 KR_Kekv_Name_Column.DataBinding.ValueTypeClass := TcxStringValueType;

 DB_Name_Shablon_Column.DataBinding.ValueTypeClass := TcxVariantValueType;
 KR_Name_Shablon_Column.DataBinding.ValueTypeClass := TcxVariantValueType;

 DB_id_Dog_Column.DataBinding.ValueTypeClass := TcxVariantValueType;
 KR_id_Dog_Column.DataBinding.ValueTypeClass := TcxVariantValueType;

 Sch_Label.Caption   := '';
 S_Label.Caption     := '';
 R_Label.Caption     := '';
 St_Label.Caption    := '';
 Kekv_Label.Caption  := '';

 Sch_Label2.Caption  := '';
 S_Label2.Caption    := '';
 R_Label2.Caption    := '';
 St_Label2.Caption   := '';
 Kekv_Label2.Caption := '';
end;

procedure Tjo9_SpecOper_View_Form.CancelButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure Tjo9_SpecOper_View_Form.ApplyButtonClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure Tjo9_SpecOper_View_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 SetFormParams(Self);
 Action := caFree;
end;

procedure Tjo9_SpecOper_View_Form.FormShow(Sender: TObject);
var
 i : integer;
begin
 GetFormParams(Self);

 with ResTableView.DataController do begin
  RecordCount := 0;

  for i := 0 to Length(res^) - 1 do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0]  := res^[i]._DB_Reg_Num;
   Values[RecordCount - 1, 1]  := res^[i]._DB_kod_Sch;
   Values[RecordCount - 1, 2]  := res^[i]._DB_kod_S;
   Values[RecordCount - 1, 3]  := res^[i]._DB_kod_R;
   Values[RecordCount - 1, 4]  := res^[i]._DB_kod_St;
   Values[RecordCount - 1, 5]  := res^[i]._DB_kod_Kekv;
   Values[RecordCount - 1, 6]  := res^[i]._KR_Reg_Num;
   Values[RecordCount - 1, 7]  := res^[i]._KR_kod_Sch;
   Values[RecordCount - 1, 8]  := res^[i]._KR_kod_S;
   Values[RecordCount - 1, 9]  := res^[i]._KR_kod_R;
   Values[RecordCount - 1, 10] := res^[i]._KR_kod_St;
   Values[RecordCount - 1, 11] := res^[i]._KR_kod_Kekv;
   Values[RecordCount - 1, 12] := res^[i]._Prov_Summa;

   Values[RecordCount - 1, 13] := res^[i]._DB_Name_Sch;
   Values[RecordCount - 1, 14] := res^[i]._DB_Name_S;
   Values[RecordCount - 1, 15] := res^[i]._DB_Name_R;
   Values[RecordCount - 1, 16] := res^[i]._DB_Name_St;
   Values[RecordCount - 1, 17] := res^[i]._DB_Name_Kekv;
   Values[RecordCount - 1, 18] := res^[i]._KR_Name_Sch;
   Values[RecordCount - 1, 19] := res^[i]._KR_Name_S;
   Values[RecordCount - 1, 20] := res^[i]._KR_Name_R;
   Values[RecordCount - 1, 21] := res^[i]._KR_Name_St;
   Values[RecordCount - 1, 22] := res^[i]._KR_Name_Kekv;

   Values[RecordCount - 1, 23] := res^[i]._DB_Name_Sh;
   Values[RecordCount - 1, 24] := res^[i]._KR_Name_Sh;
   Values[RecordCount - 1, 25] := res^[i]._DB_id_Dog;
   Values[RecordCount - 1, 26] := res^[i]._KR_id_Dog;
  end;

  if RecordCount > 0 then FocusedRecordIndex := 0;
 end;
end;

procedure Tjo9_SpecOper_View_Form.ResTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.Focused then begin
  ADone := False;
  Exit;
 end;

 if (AViewInfo.Item.Index in [0, 6, 12]) then ACanvas.Brush.Color := $00ECCEA6
 else begin
  ACanvas.Brush.Color := $00F7EAD9;
  ACanvas.Font.Color  := clNavy;
 end;
end;

procedure Tjo9_SpecOper_View_Form.SetLabels;
var
 k : integer;
begin
 Sch_Label.Caption   := '';
 S_Label.Caption     := '';
 R_Label.Caption     := '';
 St_Label.Caption    := '';
 Kekv_Label.Caption  := '';

 Sch_Label2.Caption  := '';
 S_Label2.Caption    := '';
 R_Label2.Caption    := '';
 St_Label2.Caption   := '';
 Kekv_Label2.Caption := '';

 k := ResTableView.DataController.FocusedRecordIndex;
 if k >= 0 then with ResTableView.DataController do begin
  if not VarIsNull(Values[k, 13]) then Sch_Label.Caption   := Values[k, 13];
  if not VarIsNull(Values[k, 14]) then S_Label.Caption     := Values[k, 14];
  if not VarIsNull(Values[k, 15]) then R_Label.Caption     := Values[k, 15];
  if not VarIsNull(Values[k, 16]) then St_Label.Caption    := Values[k, 16];
  if not VarIsNull(Values[k, 17]) then Kekv_Label.Caption  := Values[k, 17];

  if not VarIsNull(Values[k, 18]) then Sch_Label2.Caption  := Values[k, 18];
  if not VarIsNull(Values[k, 19]) then S_Label2.Caption    := Values[k, 19];
  if not VarIsNull(Values[k, 20]) then R_Label2.Caption    := Values[k, 20];
  if not VarIsNull(Values[k, 21]) then St_Label2.Caption   := Values[k, 21];
  if not VarIsNull(Values[k, 22]) then Kekv_Label2.Caption := Values[k, 22];
 end;

 Sch_Label.Hint   := Sch_Label.Caption;
 S_Label.Hint     := S_Label.Caption;
 R_Label.Hint     := R_Label.Caption;
 St_Label.Hint    := St_Label.Caption;
 Kekv_Label.Hint  := Kekv_Label.Caption;

 Sch_Label2.Hint  := Sch_Label2.Caption;
 S_Label2.Hint    := S_Label2.Caption;
 R_Label2.Hint    := R_Label2.Caption;
 St_Label2.Hint   := St_Label2.Caption;
 Kekv_Label2.Hint := Kekv_Label2.Caption;
end;

procedure Tjo9_SpecOper_View_Form.ResTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 SetLabels;
end;

procedure Tjo9_SpecOper_View_Form.FormResize(Sender: TObject);
begin
 DbShape.Width := Panel.Width div 2  -  2;
 KrShape.Width := Panel.Width div 2  -  2;

 KrShape.Left  := DbShape.Left + DbShape.Width + 2;

 Label1.Left  := KrShape.Left + 15;
 Label3.Left  := KrShape.Left + 6;
 Label5.Left  := KrShape.Left + 23;
 Label9.Left  := KrShape.Left + 22;
 Label11.Left := KrShape.Left + 28;

 Sch_Label2.Left  := KrShape.Left + 63;
 S_Label2.Left    := KrShape.Left + 63;
 R_Label2.Left    := KrShape.Left + 63;
 St_Label2.Left   := KrShape.Left + 63;
 Kekv_Label2.Left := KrShape.Left + 63;

 Sch_Label2.Width  := KrShape.Width - 63 - 2;
 S_Label2.Width    := KrShape.Width - 63 - 2;
 R_Label2.Width    := KrShape.Width - 63 - 2;
 St_Label2.Width   := KrShape.Width - 63 - 2;
 Kekv_Label2.Width := KrShape.Width - 63 - 2;

 Sch_Label.Width  := DbShape.Width - 63 - 2;
 S_Label.Width    := DbShape.Width - 63 - 2;
 R_Label.Width    := DbShape.Width - 63 - 2;
 St_Label.Width   := DbShape.Width - 63 - 2;
 Kekv_Label.Width := DbShape.Width - 63 - 2;
end;

procedure Tjo9_SpecOper_View_Form.DB_RegNum_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k       : integer;
 ResProc : TResProc;
begin
 k := ResTableView.DataController.FocusedRecordIndex;

 ResProc := nil;

 with ResTableView.DataController do begin
  if VarIsNull(Values[k, 23]) then Exit;
  if VarIsNull(Values[k, 25]) then Exit;

  LoadDogManedger.LoadShablon(self, (Owner as Tjo9_SpecOper_Form).Database.Handle, fsMDIChild, Values[k, 25], 'prosmotr', -1, PChar(String(Values[k, 23])), ResProc);
 end;
end;

procedure Tjo9_SpecOper_View_Form.KR_RegNum_ColumnPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 k       : integer;
 ResProc : TResProc;
begin
 k := ResTableView.DataController.FocusedRecordIndex;

 ResProc := nil;

 with ResTableView.DataController do begin
  if VarIsNull(Values[k, 24]) then Exit;
  if VarIsNull(Values[k, 26]) then Exit;

  LoadDogManedger.LoadShablon(self, (Owner as Tjo9_SpecOper_Form).Database.Handle, fsMDIChild, Values[k, 26], 'prosmotr', -1, PChar(String(Values[k, 24])), ResProc);
 end;
end;

end.
