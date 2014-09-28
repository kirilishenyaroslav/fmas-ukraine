object frmProdDate: TfrmProdDate
  Left = 318
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1058#1077#1088#1084#1110#1085' '#1079#1084#1110#1085#1080' '#1074#1072#1088#1090#1110#1089#1090#1110
  ClientHeight = 232
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid3: TcxGrid
    Left = 5
    Top = 8
    Width = 428
    Height = 185
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object DBGrid3DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      Styles.StyleSheet = Fdt_contract_ADD.GridTableViewStyleSheetDevExpress
      object DBGrid3DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1055#1086#1095#1072#1090#1086#1082
        HeaderAlignmentHorz = taCenter
        SortOrder = soAscending
        Width = 103
        DataBinding.FieldName = 'DATE_BEG_OUT'
      end
      object DBGrid3DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1050#1110#1085#1077#1094#1100
        HeaderAlignmentHorz = taCenter
        Width = 108
        DataBinding.FieldName = 'DATE_END_OUT'
      end
      object DBGrid3DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        HeaderAlignmentHorz = taCenter
        Width = 215
        DataBinding.FieldName = 'COST'
      end
    end
    object DBGrid3Level1: TcxGridLevel
      GridView = DBGrid3DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 328
    Top = 200
    Width = 107
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    Default = True
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = Fdt_contract_ADD.WorkDatabase
    Transaction = Fdt_contract_ADD.ReadTransaction
    SelectSQL.Strings = (
      
        'Select * from pl_find_product_price2(:id_product, :id_cat_cust, ' +
        ':stage_beg, :stage_end)')
    Left = 40
    Top = 192
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 80
    Top = 200
  end
end
