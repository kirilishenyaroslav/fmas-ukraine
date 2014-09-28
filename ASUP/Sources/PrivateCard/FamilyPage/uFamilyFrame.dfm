object fmPCardFamilyPage: TfmPCardFamilyPage
  Left = 0
  Top = 0
  Width = 772
  Height = 424
  TabOrder = 0
  OnEnter = FrameEnter
  OnExit = FrameExit
  object FamilyGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 772
    Height = 369
    Align = alClient
    TabOrder = 0
    object FamilyGridDBTableView1: TcxGridDBTableView
      OnKeyDown = FamilyGridDBTableView1KeyDown
      DataController.DataSource = DS_Family
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object FamilyGridDBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1060#1030#1054
        SortOrder = soAscending
        Width = 329
        DataBinding.FieldName = 'fio'
      end
      object FamilyGridDBTableView1DBColumn5: TcxGridDBColumn
        Caption = #1056#1086#1076#1080#1085#1085#1080#1081' '#1079#1074#39#1103#1079#1086#1082
        Width = 325
        DataBinding.FieldName = 'name_relation'
      end
      object FamilyGridDBTableView1DBColumn6: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
        Width = 116
        DataBinding.FieldName = 'BIRTH_DATE'
      end
    end
    object FamilyGridLevel1: TcxGridLevel
      GridView = FamilyGridDBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 369
    Width = 772
    Height = 55
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 55
      Height = 13
      Caption = #1057#1087#1088#1072#1074#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 192
      Top = 32
      Width = 35
      Height = 13
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 264
      Top = 8
      Width = 60
      Height = 13
      Caption = #1055#1088#1080#1084#1110#1090#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxDBL_Inv: TcxDBLabel
      Left = 16
      Top = 8
      Width = 71
      Height = 17
      DataBinding.DataField = 'inv_cher'
      DataBinding.DataSource = DS_Family
      ParentFont = False
      Properties.OnChange = cxDBL_InvPropertiesChange
      Properties.Transparent = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clPurple
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxDBL_Sprav: TcxDBLabel
      Left = 64
      Top = 30
      Width = 74
      Height = 17
      DataBinding.DataField = 'SPRAV'
      DataBinding.DataSource = DS_Family
      Properties.Transparent = True
      TabOrder = 1
    end
    object cxDBL_Date: TcxDBLabel
      Left = 232
      Top = 30
      Width = 69
      Height = 17
      DataBinding.DataField = 'DATE_SPRAV'
      DataBinding.DataSource = DS_Family
      Properties.Transparent = True
      TabOrder = 2
    end
    object cxDBM_Note: TcxDBMemo
      Left = 328
      Top = 1
      Width = 443
      Height = 53
      Align = alRight
      DataBinding.DataField = 'note'
      DataBinding.DataSource = DS_Family
      Properties.ScrollBars = ssVertical
      Style.Color = clInfoBk
      TabOrder = 3
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
  object DS_Family: TDataSource
    Left = 376
    Top = 88
  end
end
