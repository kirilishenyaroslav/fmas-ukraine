unit jo9_Preview_jo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxLookAndFeelPainters, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, StdCtrls, cxButtons, ExtCtrls, cxGridLevel, cxGrid,
  cxGridBandedTableView, cxContainer, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxGridDBBandedTableView, RxMemDS, cxMemo, cxButtonEdit, cxRadioGroup,
  cxExport, cxExportGrid4Link,

  jo9_Print, TagTypes, Menus, cxCurrencyEdit;

type
  Tjo9_Preview_joForm = class(TForm)
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    Panel: TPanel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
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
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    TableView: TcxGridDBBandedTableView;
    DataSource: TDataSource;
    TableViewState: TcxGridDBBandedColumn;
    TableViewRegNum: TcxGridDBBandedColumn;
    TableViewDate_Ost: TcxGridDBBandedColumn;
    TableViewDate_Move: TcxGridDBBandedColumn;
    TableViewIn_Db: TcxGridDBBandedColumn;
    TableViewIn_Kr: TcxGridDBBandedColumn;
    TableViewIn_Sch: TcxGridDBBandedColumn;
    TableViewIn_S: TcxGridDBBandedColumn;
    TableViewIn_R: TcxGridDBBandedColumn;
    TableViewIn_St: TcxGridDBBandedColumn;
    TableViewIn_Kekv: TcxGridDBBandedColumn;
    TableViewDb_Doc: TcxGridDBBandedColumn;
    TableViewDb_Date: TcxGridDBBandedColumn;
    TableViewDb_Sch_Db: TcxGridDBBandedColumn;
    TableViewDb_Sch_Kr: TcxGridDBBandedColumn;
    TableViewDb_Sum: TcxGridDBBandedColumn;
    TableViewDb_S: TcxGridDBBandedColumn;
    TableViewDb_R: TcxGridDBBandedColumn;
    TableViewDb_St: TcxGridDBBandedColumn;
    TableViewDb_Kekv: TcxGridDBBandedColumn;
    TableViewKr_Doc: TcxGridDBBandedColumn;
    TableViewKr_Date: TcxGridDBBandedColumn;
    TableViewKr_Sch_Db: TcxGridDBBandedColumn;
    TableViewKr_Sch_Kr: TcxGridDBBandedColumn;
    TableViewKr_Sum: TcxGridDBBandedColumn;
    TableViewKr_S: TcxGridDBBandedColumn;
    TableViewKr_R: TcxGridDBBandedColumn;
    TableViewKr_St: TcxGridDBBandedColumn;
    TableViewKr_Kekv: TcxGridDBBandedColumn;
    TableViewOut_Db: TcxGridDBBandedColumn;
    TableViewOut_Kr: TcxGridDBBandedColumn;
    TableViewOut_Sch: TcxGridDBBandedColumn;
    TableViewOut_S: TcxGridDBBandedColumn;
    TableViewOut_R: TcxGridDBBandedColumn;
    TableViewOut_St: TcxGridDBBandedColumn;
    TableViewOut_Kekv: TcxGridDBBandedColumn;
    Label1: TLabel;
    TableViewCustNum: TcxGridDBBandedColumn;
    TableViewDb_Date_Reg: TcxGridDBBandedColumn;
    TableViewKr_Date_Reg: TcxGridDBBandedColumn;
    TableViewNameCustFilter: TcxGridDBBandedColumn;
    SearchEdit: TcxButtonEdit;
    RadioGroup: TcxRadioGroup;
    GridLevelOst: TcxGridLevel;
    TableViewOst: TcxGridDBBandedTableView;
    TableViewOstNum: TcxGridDBBandedColumn;
    TableViewOstNameCustomer: TcxGridDBBandedColumn;
    TableViewOstSch: TcxGridDBBandedColumn;
    TableViewOstS: TcxGridDBBandedColumn;
    TableViewOstR: TcxGridDBBandedColumn;
    TableViewOstSt: TcxGridDBBandedColumn;
    TableViewOstKEKV: TcxGridDBBandedColumn;
    TableViewOstSum: TcxGridDBBandedColumn;
    TableViewOstNameCustFilter: TcxGridDBBandedColumn;
    GridLevelCustSch: TcxGridLevel;
    TableViewCustSch: TcxGridDBBandedTableView;
    TableViewCustSch_State: TcxGridDBBandedColumn;
    TableViewCustSch_RegNum: TcxGridDBBandedColumn;
    TableViewCustSch_DateOst: TcxGridDBBandedColumn;
    TableViewCustSch_DateMove: TcxGridDBBandedColumn;
    TableViewCustSch_InSch: TcxGridDBBandedColumn;
    TableViewCustSch_InDb: TcxGridDBBandedColumn;
    TableViewCustSch_InKr: TcxGridDBBandedColumn;
    TableViewCustSch_Note: TcxGridDBBandedColumn;
    TableViewCustSch_Num: TcxGridDBBandedColumn;
    TableViewCustSch_DbDoc: TcxGridDBBandedColumn;
    TableViewCustSch_DbPeriod: TcxGridDBBandedColumn;
    TableViewCustSch_DbSum: TcxGridDBBandedColumn;
    TableViewCustSch_KrDoc: TcxGridDBBandedColumn;
    TableViewCustSch_KrPeriod: TcxGridDBBandedColumn;
    TableViewCustSch_KrSum: TcxGridDBBandedColumn;
    TableViewCustSch_OutSch: TcxGridDBBandedColumn;
    TableViewCustSch_OutDb: TcxGridDBBandedColumn;
    TableViewCustSch_OutKr: TcxGridDBBandedColumn;
    TableViewCustSch_DbSch: TcxGridDBBandedColumn;
    TableViewCustSch_KrSch: TcxGridDBBandedColumn;
    TableViewCustSch_CustFilter: TcxGridDBBandedColumn;
    cxButton1: TcxButton;
    PopupMenu: TPopupMenu;
    rcgjhn1: TMenuItem;
    HTMLhtml1: TMenuItem;
    exttxt1: TMenuItem;
    XMLxml1: TMenuItem;
    SaveDialog: TSaveDialog;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    procedure ApplyButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure SerachEditPropertiesChange(Sender: TObject);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RadioGroupPropertiesChange(Sender: TObject);
    procedure rcgjhn1Click(Sender: TObject);
    procedure HTMLhtml1Click(Sender: TObject);
    procedure XMLxml1Click(Sender: TObject);
    procedure exttxt1Click(Sender: TObject);
    procedure TableViewCustSchCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
  private
    Flag : Boolean;
  public
    SchVisible : boolean;
    procedure MakeColumnsOst(rx : TRxMemoryData; index : integer; periods : POstPeriodsArray); // Добавляю динамически колонки для отчета по задолженности
  end;

var
  jo9_Preview_joForm: Tjo9_Preview_joForm;

implementation

uses DateUtils;

{$R *.dfm}

procedure Tjo9_Preview_joForm.ApplyButtonClick(Sender: TObject);
begin
 (Owner as Tjo9_PrintForm).ShowReport;
 flag:=False;
 Close;
end;

procedure Tjo9_Preview_joForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure Tjo9_Preview_joForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if(flag)then
 begin
   (Owner as Tjo9_PrintForm).Report.PreviewForm.Free;
   (Owner as Tjo9_PrintForm).DBDataset.Free;
   (Owner as Tjo9_PrintForm).JODataset.Free;
   (Owner as Tjo9_PrintForm).SecDataset.Free;
 end;
 Action := caFree;
end;

procedure Tjo9_Preview_joForm.TableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 ACanvas.Font.Color := clBlack;

 if AViewInfo.Item.Index in [36, 1] then begin
  if AViewInfo.RecordViewInfo.Focused then ACanvas.Brush.Color := $00FCE9C9
  else ACanvas.Brush.Color := clWhite;

  ACanvas.Font.Style  := [];

  if AViewInfo.GridRecord.Values[0] = 'Summs' then begin
   if not AViewInfo.RecordViewInfo.Focused then ACanvas.Brush.Color := $00EAEAEA;
  end
  else if AViewInfo.GridRecord.Values[0] = 'NameCust' then ACanvas.Font.Style := [fsBold]
  else if AViewInfo.GridRecord.Values[0] = 'NameCustBad' then begin
   ACanvas.Font.Style  := [fsBold];
   if not AViewInfo.RecordViewInfo.Focused then ACanvas.Brush.Color := $00847AFC;
  end
  else if AViewInfo.GridRecord.Values[0] = 'BadDoc' then if not AViewInfo.RecordViewInfo.Focused then ACanvas.Brush.Color := $00847AFC;
 end
 else begin
  if not AViewInfo.RecordViewInfo.Focused then begin
   if AViewInfo.GridRecord.Values[0] = 'Summs' then ACanvas.Brush.Color := $00EAEAEA
   else if AViewInfo.GridRecord.Values[0] = 'BadDoc' then ACanvas.Brush.Color := $00847AFC
   else ACanvas.Brush.Color :=  clWhite;
  end
  else ACanvas.Brush.Color := $00FCE9C9;
 end;
 //
 if AViewInfo.GridRecord.Values[0] = 'NoMoove' then  ACanvas.Font.Color := clBlue;
 //
end;

procedure Tjo9_Preview_joForm.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then Grid.SetFocus;
end;

procedure Tjo9_Preview_joForm.SerachEditPropertiesChange(Sender: TObject);
begin
 if GridLevel.Visible then begin
  with TableView.DataController.Filter.Root do begin
   Clear;

   if SearchEdit.Text <> '' then begin
    if RadioGroup.ItemIndex = 0 then
     AddItem(TableViewNameCustFilter, foLike, '%' + AnsiUpperCase(SearchEdit.Text) + '%', SearchEdit.Text)
    else
     AddItem(TableViewNameCustFilter, foLike, AnsiUpperCase(SearchEdit.Text) + '%', SearchEdit.Text);
   end;
  end;

  TableView.DataController.Filter.Active := True;
 end
 else if GridLevelOst.Visible then begin
  with TableViewOst.DataController.Filter.Root do begin
   Clear;

   if SearchEdit.Text <> '' then begin
    if RadioGroup.ItemIndex = 0 then
     AddItem(TableViewOstNameCustFilter, foLike, '%' + AnsiUpperCase(SearchEdit.Text) + '%', SearchEdit.Text)
    else
     AddItem(TableViewOstNameCustFilter, foLike, AnsiUpperCase(SearchEdit.Text) + '%', SearchEdit.Text);
   end;
  end;

  TableViewOst.DataController.Filter.Active := True;
 end
 else begin
  with TableViewCustSch.DataController.Filter.Root do begin
   Clear;

   if SearchEdit.Text <> '' then begin
    if RadioGroup.ItemIndex = 0 then
     AddItem(TableViewCustSch_CustFilter, foLike, '%' + AnsiUpperCase(SearchEdit.Text) + '%', SearchEdit.Text)
    else
     AddItem(TableViewCustSch_CustFilter, foLike, AnsiUpperCase(SearchEdit.Text) + '%', SearchEdit.Text);
   end;
  end;

  TableViewCustSch.DataController.Filter.Active := True;
 end;
end;

procedure Tjo9_Preview_joForm.TableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key in ['0'..'9', 'A'..'Z', 'a'..'z', 'А'..'Я', 'а'..'я'] then begin
  SearchEdit.Text     := Key;
  SearchEdit.SetFocus;
  SearchEdit.SelStart := 1;
 end;
end;

procedure Tjo9_Preview_joForm.SearchEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
 if GridLevel.Visible then begin
  TableView.DataController.Filter.Active := False;
  TableView.DataController.Filter.Root.Clear;
 end
 else if GridLevelOst.Visible then begin
  TableViewOst.DataController.Filter.Active := False;
  TableViewOst.DataController.Filter.Root.Clear;
 end
 else begin
  TableViewCustSch.DataController.Filter.Active := False;
  TableViewCustSch.DataController.Filter.Root.Clear;
 end;

 SearchEdit.Text := '';
end;

procedure Tjo9_Preview_joForm.RadioGroupPropertiesChange(Sender: TObject);
begin
 SerachEditPropertiesChange(Sender);
end;

procedure Tjo9_Preview_joForm.MakeColumnsOst(rx : TRxMemoryData; index : integer; periods : POstPeriodsArray);
var
 i : integer;
 k : integer;
begin
 if not SchVisible then begin
  TableViewOstSch.Visible  := False;
  TableViewOstS.Visible    := False;
  TableViewOstR.Visible    := False;
  TableViewOstSt.Visible   := False;
  TableViewOstKEKV.Visible := False;
 end;

 for i := index to rx.FieldDefs.Count - 2 do begin
  k := i - index;

  with TableViewOst.CreateColumn do begin
   DataBinding.FieldName := rx.FieldDefs[i].Name;

   if not VarIsNull(periods^[k]._Month) then Caption := TagTypes.GetMonthName(periods^[k]._Month) + ' ' + IntToStr(periods^[k]._Year)
   else Caption := IntToStr(periods^[k]._Year);

   HeaderAlignmentHorz := taCenter;
   HeaderAlignmentVert := vaCenter;

   Position.BandIndex := 1;
  end;
 end;
end;

procedure Tjo9_Preview_joForm.rcgjhn1Click(Sender: TObject);
begin
 SaveDialog.Filter := 'Книга Microsoft Office Excel (*.xls)|*.xls';
 if not SaveDialog.Execute then Exit;

// ExportGrid4ToExcel(SaveDialog.FileName, Grid, True, True, False);
 ExportGrid4ToExcel(SaveDialog.FileName, Grid);
end;

procedure Tjo9_Preview_joForm.HTMLhtml1Click(Sender: TObject);
begin
 SaveDialog.Filter := 'Файл HTML (*.html)|*.html';
 if not SaveDialog.Execute then Exit;

 ExportGrid4ToHTML(SaveDialog.FileName, Grid);
end;

procedure Tjo9_Preview_joForm.XMLxml1Click(Sender: TObject);
begin
 SaveDialog.Filter := 'Файл XML (*.xml)|*.xml';
 if not SaveDialog.Execute then Exit;

 ExportGrid4ToXML(SaveDialog.FileName, Grid);
end;

procedure Tjo9_Preview_joForm.exttxt1Click(Sender: TObject);
begin
 SaveDialog.Filter := 'Текстовий файл (*.txt)|*.txt';
 if not SaveDialog.Execute then Exit;

 ExportGrid4ToText(SaveDialog.FileName, Grid);
end;

procedure Tjo9_Preview_joForm.TableViewCustSchCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 ACanvas.Font.Color := clBlack;

 if AViewInfo.RecordViewInfo.Focused then begin
  ACanvas.Brush.Color := $00FCE9C9;
  Exit;
 end
 else ACanvas.Brush.Color := clWhite;

 if AViewInfo.RecordViewInfo.GridRecord.Values[0] = 'NameCust' then begin
  ACanvas.Font.Style := [fsBold];
  ACanvas.Brush.Color := $00D3D3D3;
  Exit;
 end;

 if AViewInfo.RecordViewInfo.GridRecord.Values[0] = 'ResSumms' then begin
  ACanvas.Brush.Color := $00D3D3D3;
  ACanvas.Font.Style := [fsBold];
  Exit;
 end;

 if (AViewInfo.Item as TcxGridDBBandedColumn).Position.BandIndex in [3, 5] then ACanvas.Brush.Color := $00ECCCB9//$00F2F2F2
 else if (AViewInfo.Item as TcxGridDBBandedColumn).Position.BandIndex in [2, 7] then ACanvas.Brush.Color := $00AFE4BF;//$00FEF8F3;
end;

procedure Tjo9_Preview_joForm.FormShow(Sender: TObject);
begin
 TableViewCustSch_OutSch.Width := 50;

 TableViewDb_S.Width           := 64;
 TableViewKr_S.Width           := 64;

 TableView.Bands[3].Width := 660;
 TableView.Bands[4].Width := 660;
 Flag:=True;
end;

end.
