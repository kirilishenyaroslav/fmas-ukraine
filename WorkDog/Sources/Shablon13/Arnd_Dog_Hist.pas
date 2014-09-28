unit Arnd_Dog_Hist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxSplitter,
  ExtCtrls,

  Arnd_Contract_Add, cxTextEdit, cxCurrencyEdit, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxGridBandedTableView, cxGridDBBandedTableView,
  cxCalendar, FIBDataSet, pFIBDataSet, ActnList, cxButtonEdit;

type
  TArnd_Dog_Hist_Form = class(TForm)
    BottomPanel: TPanel;
    SmetaPanel: TPanel;
    PerPanel: TPanel;
    CloseButton: TcxButton;
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
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
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
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    HistDataSet: TpFIBDataSet;
    PeriodDataSet: TpFIBDataSet;
    SmetaDataSet: TpFIBDataSet;
    PeriodDataSource: TDataSource;
    SmetaDataSource: TDataSource;
    HistGrid: TcxGrid;
    HistGridLevel: TcxGridLevel;
    PeriodGrid: TcxGrid;
    PeriodTableView: TcxGridDBTableView;
    id_Period_Column: TcxGridDBColumn;
    Date_Beg_Column: TcxGridDBColumn;
    Date_End_Column: TcxGridDBColumn;
    Sum_Column: TcxGridDBColumn;
    PeriodGridLevel: TcxGridLevel;
    HistSGrid: TcxGrid;
    HistSGridLevel: TcxGridLevel;
    SmetaGrid: TcxGrid;
    SmetaTableView: TcxGridDBTableView;
    S_Column: TcxGridDBColumn;
    R_Column: TcxGridDBColumn;
    St_Column: TcxGridDBColumn;
    SSum_Column: TcxGridDBColumn;
    SmetaGridLevel: TcxGridLevel;
    SHistDataSet: TpFIBDataSet;
    St_Label: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    S_Label: TLabel;
    R_Label: TLabel;
    S_Name_Column: TcxGridDBColumn;
    R_Name_Column: TcxGridDBColumn;
    St_Name_Column: TcxGridDBColumn;
    ActionList1: TActionList;
    Action3: TAction;
    HistTableView: TcxGridBandedTableView;
    Use_Beg_Column: TcxGridBandedColumn;
    Use_End_Column: TcxGridBandedColumn;
    HistSTableView: TcxGridBandedTableView;
    SUseEndColumn: TcxGridBandedColumn;
    SUseBegColumn: TcxGridBandedColumn;
    Kekv_Column: TcxGridDBColumn;
    Kekv_Name_Column: TcxGridDBColumn;
    Label15: TLabel;
    KEKV_Label: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HistTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure PeriodTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure HistSTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure SmetaTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Action3Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
   id_Dog : int64;

   destructor Destroy; override;
  end;

var
  Arnd_Dog_Hist_Form: TArnd_Dog_Hist_Form;

implementation

{$R *.dfm}

{ TArnd_Dog_Hist_Form }

destructor TArnd_Dog_Hist_Form.Destroy;
begin
  Arnd_Dog_Hist_Form := nil;
  inherited;
end;

procedure TArnd_Dog_Hist_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TArnd_Dog_Hist_Form.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TArnd_Dog_Hist_Form.FormShow(Sender: TObject);
begin

// ShowMessage('id_Dog = ' + IntToStr(id_Dog));

 HistDataSet.SelectSQL.Text := 'select distinct * from DOG_DT_ARENDA_P_HIST_SEL_ALL('
 + IntToStr(id_Dog) + ') order by USE_DATE_PARAM';

 HistDataSet.Open;

// if (HistDataSet.RecordCount <> 0) then
// begin
//   ShowMessage('Someone Loaded');
// end;

 with HistTableView.DataController do begin
  while not HistDataSet.Eof do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := HistDataSet.FieldValues['USE_DATE_PARAM'];

   if RecordCount > 1 then Values[RecordCount - 2, 1] := Values[RecordCount - 1, 0];

   HistDataSet.Next;
  end;

  HistDataSet.Close;

  if RecordCount > 0 then begin
   Values[RecordCount - 1, 1] := StrToDateTime('30.12.9999');
   FocusedRowIndex := 0;

  end;
 end;
end;

procedure TArnd_Dog_Hist_Form.HistTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 PeriodDataSet.Close;

 if AFocusedRecord = nil then begin
  SmetaDataSet.Close;
  Exit;
 end;

 if AFocusedRecord.Values[1] = StrToDate('30.12.9999') then
  PeriodDataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_SEL_PER('
  + IntToStr(id_Dog) + ')'
 else
  PeriodDataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_P_HIST_SEL_PER('
  + IntToStr(id_Dog) + ',' + QuotedStr(DateTimeToStr(AFocusedRecord.Values[0]))
  + ',' + QuotedStr(DateTimeToStr(AFocusedRecord.Values[1])) + ')';

 PeriodDataSet.Open;
end;

procedure TArnd_Dog_Hist_Form.PeriodTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if AFocusedRecord = nil then Exit;

 SHistDataSet.SelectSQL.Text := 'select distinct * from DOG_DT_ARENDA_S_HIST_SEL_ALL('
 + IntToStr(AFocusedRecord.Values[0]) + ') order by USE_DATE_PARAM';

 SHistDataSet.Open;

 with HistSTableView.DataController do begin
  RecordCount := 0;

  while not SHistDataSet.Eof do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := SHistDataSet.FieldValues['USE_DATE_PARAM'];

   if RecordCount > 1 then Values[RecordCount - 2, 1] := Values[RecordCount - 1, 0];

   SHistDataSet.Next;
  end;

  SHistDataSet.Close;

  if RecordCount > 0 then begin
   Values[RecordCount - 1, 1] := StrToDateTime('30.12.9999');
   FocusedRowIndex := 0;
  end;
 end;
end;

procedure TArnd_Dog_Hist_Form.HistSTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
 k : integer;
begin
 k := PeriodTableView.DataController.FocusedRecordIndex;
 if K < 0 then Exit;

 SmetaDataSet.Close;

 if AFocusedRecord = nil then Exit;

 if AFocusedRecord.Values[1] = StrToDate('30.12.9999') then
  SmetaDataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_SEL('
  + IntToStr(PeriodTableView.DataController.Values[k, 0]) + ')'
 else
  SmetaDataSet.SelectSQL.Text := 'select * from DOG_DT_ARENDA_S_HIST_SEL_SMET('
  + IntToStr(PeriodTableView.DataController.Values[k, 0]) + ','
  + QuotedStr(DateTimeToStr(AFocusedRecord.Values[0])) + ','
  + QuotedStr(DateTimeToStr(AFocusedRecord.Values[1])) + ')';

 SmetaDataSet.Open;
end;

procedure TArnd_Dog_Hist_Form.SmetaTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 S_Label.Caption    := '';
 R_Label.Caption    := '';
 St_Label.Caption   := '';
 KEKV_Label.Caption := '';

 if AFocusedRecord <> nil then
 begin
   if VarIsNull(AFocusedRecord.Values[5]) then S_Label.Caption    := '' else S_Label.Caption    := AFocusedRecord.Values[5];
   if VarIsNull(AFocusedRecord.Values[6]) then R_Label.Caption    := '' else R_Label.Caption    := AFocusedRecord.Values[6];
   if VarIsNull(AFocusedRecord.Values[7]) then St_Label.Caption   := '' else St_Label.Caption   := AFocusedRecord.Values[7];
   if VarIsNull(AFocusedRecord.Values[8]) then KEKV_Label.Caption := '' else KEKV_Label.Caption := AFocusedRecord.Values[8];
  // showmessage('Updated :)');
 end;

// S_Label.Caption    := S_Label.Hint;
// R_Label.Caption    := R_Label.Hint;
// St_Label.Caption   := St_Label.Hint;
// KEKV_Label.Caption := KEKV_Label.Hint;
end;

procedure TArnd_Dog_Hist_Form.Action3Execute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure TArnd_Dog_Hist_Form.FormCreate(Sender: TObject);
begin
 Use_Beg_Column.DataBinding.ValueTypeClass := TcxDateTimeValueType;
 Use_End_Column.DataBinding.ValueTypeClass := TcxDateTimeValueType;

 SUseEndColumn.DataBinding.ValueTypeClass := TcxDateTimeValueType;
 SUseBegColumn.DataBinding.ValueTypeClass := TcxDateTimeValueType;
end;

procedure TArnd_Dog_Hist_Form.FormResize(Sender: TObject);
begin
 SmetaPanel.Height := (Height - 57) div 2;
 PeriodGrid.Width := Width div 2;
 SmetaGrid.Width := Width div 2;
end;

end.
