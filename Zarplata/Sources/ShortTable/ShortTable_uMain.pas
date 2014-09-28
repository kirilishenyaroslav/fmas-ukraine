{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit ShortTable_uMain;

interface

uses pFIBDataSet, cxGridDBBandedTableView, DB, pFIBDataBase,
     cxGridCustomView, cxGrid, SysUtils, Forms,
     cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
     cxDataStorage, cxEdit, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
     cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
     ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
     cxGridDBTableView, cxClasses, cxControls,
     dxDockPanel, dxDockControl, cxMemo, z_dmCommonStyles, zProc, unit_zGlobal_Consts,
     FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, FIBDataSet, IBase,
     cxCheckListBox, cxGridBandedTableView, dxStatusBar, ActnList, Variants, pFIBProps;

function GetTable(DSource:TDataSource;PeriodFieldName:string):TcxGridDBBandedTableView;stdcall;
 exports GetTable;

implementation

uses Classes;

function GetTable(DSource:TDataSource;PeriodFieldName:string):TcxGridDBBandedTableView;
var tmpColumn:TcxGridDBBandedColumn;
    pLanguageIndex:Byte;
begin
 Result := TcxGridDBBandedTableView.Create(nil);
 pLanguageIndex := LanguageIndex;

 with Result do
  begin
    with Bands.Add do
     Caption := TableBtn_Caption[pLanguageIndex];
    with Bands.Add do
     Caption := GridClPlan_Caption[pLanguageIndex];
    with Bands.Add do
     Caption := GridClFact_Caption[pLanguageIndex];
    with Bands.Add do
     Caption := GridClKodSetup_Caption[pLanguageIndex];
    with Bands.Add do
     Caption := ZRemont_Caption_Short[PLanguageIndex];

    tmpColumn := CreateColumn;
    with tmpColumn do
     begin
      PropertiesClass := tcxTextEditProperties;
      (Properties as tcxTextEditProperties).Alignment.Horz := taRightJustify;
      (Properties as tcxTextEditProperties).Alignment.Vert := taVCenter;
      HeaderAlignmentHorz := taCenter;
      HeaderAlignmentVert := vaCenter;
      DataBinding.FieldName := 'TARIF';
      Position.BandIndex := 0;
      Position.RowIndex  := 0;
      Position.ColIndex  := 0;
      Name               := 'GridTableClTARIF';
      FooterAlignmentHorz:=taCenter;
      Caption := GridClTarif_Caption[PLanguageIndex];
     end;

    with DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
      begin
        Column := tmpColumn;
        Kind := skCount;
        Format := '=====';
      end;

    tmpColumn := CreateColumn;
    with tmpColumn do
     begin
      PropertiesClass := TcxMaskEditProperties;
      (Properties as TcxMaskEditProperties).Alignment.Horz := taRightJustify;
      (Properties as TcxMaskEditProperties).Alignment.Vert := taVCenter;
      HeaderAlignmentHorz := taCenter;
      HeaderAlignmentVert := vaCenter;
      DataBinding.FieldName := 'GHOURS';
      Position.BandIndex := 1;
      Position.RowIndex  := 0;
      Position.ColIndex  := 0;
      Name               := 'GridTableClGHOURS';
      FooterAlignmentHorz:= taCenter;
      Caption :=  GridClClock_Caption[PLanguageIndex];
     end;

    with DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
      begin
        Column := tmpColumn;
        Kind := skSum;
        Format := '0.00;-0.00';
      end;


    tmpColumn := CreateColumn;
    with tmpColumn do
     begin
      PropertiesClass := TcxCheckBoxProperties;
      (Properties as TcxCheckBoxProperties).Alignment := taCenter;
      (Properties as TcxCheckBoxProperties).ValueChecked   := 1;
      (Properties as TcxCheckBoxProperties).ValueGrayed    := NULL;
      (Properties as TcxCheckBoxProperties).ValueUnchecked := 0;
      HeaderAlignmentHorz := taCenter;
      HeaderAlignmentVert := vaCenter;
      DataBinding.FieldName := 'GWDAY';
      Position.BandIndex := 1;
      Position.RowIndex  := 0;
      Position.ColIndex  := 1;
      Name               := 'GridTableClGWDAY';
      FooterAlignmentHorz:= taCenter;
      Caption :=  GridClNDay_Caption[PLanguageIndex];
     end;

    with DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
      begin
        Column := tmpColumn;
        Kind := skSum;
        Format := '0';
      end;

    tmpColumn := CreateColumn;
    with tmpColumn do
     begin
      PropertiesClass := tcxTextEditProperties;
      (Properties as tcxTextEditProperties).Alignment.Horz := taRightJustify;
      (Properties as tcxTextEditProperties).Alignment.Vert := taVCenter;
      HeaderAlignmentHorz := taCenter;
      HeaderAlignmentVert := vaCenter;
      DataBinding.FieldName := 'HOURS';
      Position.BandIndex := 2;
      Position.RowIndex  := 0;
      Position.ColIndex  := 0;
      Name               := 'GridTableClHOURS';
      Caption            := GridClClock_Caption[PLanguageIndex];
     end;

    with DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
      begin
        Column := tmpColumn;
        Kind := skSum;
        Format := '0.00;-0.00';
      end;

    tmpColumn := CreateColumn;
    with tmpColumn do
     begin
      PropertiesClass := TcxCheckBoxProperties;
      (Properties as TcxCheckBoxProperties).Alignment := taCenter;
      (Properties as TcxCheckBoxProperties).ValueChecked   := 1;
      (Properties as TcxCheckBoxProperties).ValueGrayed    := NULL;
      (Properties as TcxCheckBoxProperties).ValueUnchecked := 0;
      HeaderAlignmentHorz := taCenter;
      HeaderAlignmentVert := vaCenter;
      DataBinding.FieldName := 'WDAY';
      Position.BandIndex := 2;
      Position.RowIndex  := 0;
      Position.ColIndex  := 1;
      Name               := 'GridTableClWDAY';
      FooterAlignmentHorz:= taCenter;
      Caption :=  GridClNDay_Caption[PLanguageIndex];
     end;

    with DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
      begin
        Column := tmpColumn;
        Kind := skSum;
        Format := '0';
      end;

    tmpColumn := CreateColumn;
    with tmpColumn do
     begin
      PropertiesClass := tcxTextEditProperties;
      (Properties as tcxTextEditProperties).Alignment.Horz := taCenter;
      (Properties as tcxTextEditProperties).Alignment.Vert := taVCenter;
      HeaderAlignmentHorz := taCenter;
      HeaderAlignmentVert := vaCenter;
      DataBinding.FieldName := 'DAYMONTH';
      Position.BandIndex := 3;
      Position.RowIndex  := 0;
      Position.ColIndex  := 0;
      Name               := 'GridTableClDAYMONTH';
      FooterAlignmentHorz:=taCenter;
      Caption := GridClDayMonth_Caption[PLanguageIndex];
     end;

    with DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
      begin
        Column := tmpColumn;
        Kind := skCount;
        Format := '0';
      end;

    tmpColumn := CreateColumn;
    with tmpColumn do
     begin
      PropertiesClass := tcxTextEditProperties;
      (Properties as tcxTextEditProperties).Alignment.Horz := taRightJustify;
      (Properties as tcxTextEditProperties).Alignment.Vert := taVCenter;
      HeaderAlignmentHorz := taCenter;
      HeaderAlignmentVert := vaCenter;
      DataBinding.FieldName := 'TARIF_REMONT';
      Position.BandIndex := 4;
      Position.RowIndex  := 0;
      Position.ColIndex  := 0;
      Name               := 'GridTableTARIF_REMONT';
      FooterAlignmentHorz:=taCenter;
      Caption := GridClTarif_Caption[PLanguageIndex];
     end;

    with DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
      begin
        Column := tmpColumn;
        Kind := skCount;
        Format := '0';
      end;

    tmpColumn := CreateColumn;
    with tmpColumn do
     begin
      PropertiesClass := tcxTextEditProperties;
      (Properties as tcxTextEditProperties).Alignment.Horz := taRightJustify;
      (Properties as tcxTextEditProperties).Alignment.Vert := taVCenter;
      HeaderAlignmentHorz := taCenter;
      HeaderAlignmentVert := vaCenter;
      DataBinding.FieldName := 'CLOCK_REMONT';
      Position.BandIndex := 4;
      Position.RowIndex  := 0;
      Position.ColIndex  := 1;
      Name               := 'GridTableCLOCK_REMONT';
      Caption := GridClClock_Caption[PLanguageIndex];
     end;

    with DataController.Summary.FooterSummaryItems.Add as TcxGridDBBandedTableSummaryItem do
      begin
        Column := tmpColumn;
        Kind := skSum;
        Format := '0.000;-0.000';
      end;

    OptionsSelection.CellSelect := False;
    OptionsView.Footer := True;
    OptionsCustomize.ColumnFiltering        := False;
    OptionsCustomize.ColumnSorting          := False;
    OptionsCustomize.ColumnGrouping         := False;
    OptionsCustomize.ColumnHiding           := False;
    OptionsCustomize.ColumnVertSizing       := False;
    OptionsCustomize.ColumnHidingOnGrouping := False;
    OptionsCustomize.ColumnHorzSizing       := True;
    OptionsCustomize.ColumnMoving           := False;

    OptionsCustomize.BandHiding             := False;
    OptionsCustomize.BandMoving             := False;
    OptionsCustomize.BandSizing             := True;

    OptionsView.GroupByBox                  := False;
    OptionsView.ColumnAutoWidth             := True;
    OptionsView.CellAutoHeight              := True;
     
    DataController.Summary.Options := [soNullIgnore];
    DataController.DataSource                                            := TDataSource.Create(nil);
    DataController.DataSource.DataSet                                    := TpFIBDataSet.Create(nil);
   (DataController.DataSource.DataSet as TpFIBDataSet).DetailConditions  := [dcWaitEndMasterScroll];
   (DataController.DataSource.DataSet as TpFIBDataSet).Database          := (DSource.DataSet as TpFIBDataSet).Database;
   (DataController.DataSource.DataSet as TpFIBDataSet).Transaction       := (DSource.DataSet as TpFIBDataSet).Transaction;
   (DataController.DataSource.DataSet as TpFIBDataSet).UpdateTransaction := (DataController.DataSource.DataSet as TpFIBDataSet).UpdateTransaction;
   (DataController.DataSource.DataSet as TpFIBDataSet).DataSource        := DSource;
   (DataController.DataSource.DataSet as TpFIBDataSet).SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_TABLE(?ID_MAN,?'+PeriodFieldName+') order by rmoving,daymonth';
   (DataController.DataSource.DataSet as TpFIBDataSet).Open;
  end;
end;

end.
