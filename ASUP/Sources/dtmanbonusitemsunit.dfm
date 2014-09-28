inherited DtManBonusItemsForm: TDtManBonusItemsForm
  Top = 182
  Caption = #1058#1077#1082#1089#1090#1080' '#1087#1091#1085#1082#1090#1110#1074' '#1085#1072#1082#1072#1079#1091
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    DataSource = nil
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_ITEM'
        Title.Caption = #8470' '#1087#1091#1085#1082#1090#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEXT'
        Title.Caption = #1058#1077#1082#1089#1090' '#1087#1091#1085#1082#1090#1091' '#1085#1072#1082#1072#1079#1091
        Width = 505
        Visible = True
      end>
  end
  object cxGrid1: TcxGrid [3]
    Left = 0
    Top = 49
    Width = 679
    Height = 331
    Align = alClient
    TabOrder = 3
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyDown = cxGrid1DBTableView1KeyDown
      DataController.DataSource = SpDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088
        SortOrder = soAscending
        Width = 71
        DataBinding.FieldName = 'NUM_ITEM'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1058#1077#1082#1089#1090
        Width = 606
        DataBinding.FieldName = 'TEXT'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  inherited SpDataSource: TDataSource
    Top = 368
  end
  inherited ResultQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    SQL.Strings = (
      'SELECT * FROM DT_MAN_BONUS_ORDER_ITEM_SELECT(:ID_ORDER)')
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_ORDER'
        ParamType = ptUnknown
      end>
    object ResultQueryID_TEXT_ITEM: TIntegerField
      FieldName = 'ID_TEXT_ITEM'
      Origin = 'DT_MAN_BONUS_ORDER_ITEM_SELECT.ID_TEXT_ITEM'
    end
    object ResultQueryNUM_ITEM: TIntegerField
      FieldName = 'NUM_ITEM'
      Origin = 'DT_MAN_BONUS_ORDER_ITEM_SELECT.NUM_ITEM'
    end
    object ResultQueryTEXT: TMemoField
      FieldName = 'TEXT'
      Origin = 'DT_MAN_BONUS_ORDER_ITEM_SELECT.TEXT'
      BlobType = ftMemo
      Size = 8
    end
  end
  inherited WorkQuery: TIBQuery
    Top = 368
  end
end
