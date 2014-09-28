object fmPCardOrdersPage: TfmPCardOrdersPage
  Left = 0
  Top = 0
  Width = 772
  Height = 424
  TabOrder = 0
  OnEnter = FrameEnter
  OnExit = FrameExit
  object OrdersGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 772
    Height = 424
    Align = alClient
    TabOrder = 0
    object OrdersGridDBTableView1: TcxGridDBTableView
      OnKeyDown = OrdersGridDBTableView1KeyDown
      DataController.DataSource = DS_Orders
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object OrdersGridDBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1077#1082#1090#1091
        PropertiesClassName = 'TcxLabelProperties'
        MinWidth = 100
        Width = 100
        DataBinding.FieldName = 'NUM_PROJECT'
      end
      object OrdersGridDBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1082#1072#1085#1094'.'
        PropertiesClassName = 'TcxLabelProperties'
        MinWidth = 100
        Width = 100
        DataBinding.FieldName = 'NUM_ORDER'
      end
      object OrdersGridDBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1077#1082#1090#1091
        MinWidth = 100
        SortOrder = soAscending
        Width = 115
        DataBinding.FieldName = 'DATE_PROJECT'
      end
      object OrdersGridDBTableView1DBColumn5: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1082#1072#1085#1094'.'
        MinWidth = 100
        Width = 100
        DataBinding.FieldName = 'date_order'
      end
      object OrdersGridDBTableView1DBColumn6: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1085#1072#1082#1072#1079#1091
        Width = 400
        DataBinding.FieldName = 'NAME_TYPE'
      end
    end
    object OrdersGridLevel1: TcxGridLevel
      GridView = OrdersGridDBTableView1
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 504
    Top = 120
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13106942
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11793652
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13302779
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'KlugStyle'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object DS_Orders: TDataSource
    DataSet = dmOrders.OrdersSelect
    Left = 376
    Top = 88
  end
end
