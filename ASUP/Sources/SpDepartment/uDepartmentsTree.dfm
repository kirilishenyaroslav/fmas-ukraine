object fmDepartmentsTree: TfmDepartmentsTree
  Left = 0
  Top = 0
  Width = 679
  Height = 417
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  ParentFont = False
  TabOrder = 0
  object TreeList: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 679
    Height = 361
    Styles.Background = stBackground
    Styles.Content = stContent
    Styles.Selection = stSelection
    Styles.Footer = stFooter
    Styles.HotTrack = stContent
    Styles.IncSearch = stIncSearch
    Styles.Preview = stPreview
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 545
      end>
    BufferedPaint = False
    DataController.DataSource = TreeSource
    DataController.ParentField = 'ID_PARENT'
    DataController.KeyField = 'ID_DEPARTMENT'
    OptionsBehavior.CellHints = True
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsBehavior.HotTrack = True
    OptionsBehavior.Sorting = False
    OptionsBehavior.MultiSort = False
    OptionsCustomizing.BandCustomizing = False
    OptionsCustomizing.BandHorzSizing = False
    OptionsCustomizing.BandMoving = False
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnCustomizing = False
    OptionsCustomizing.ColumnHorzSizing = False
    OptionsCustomizing.ColumnMoving = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.Editing = False
    OptionsData.SmartRefresh = True
    OptionsSelection.CellSelect = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.ExtPaintStyle = True
    RootValue = -1
    TabOrder = 0
    OnClick = TreeListClick
    OnKeyDown = TreeListKeyDown
    OnKeyPress = TreeListKeyPress
    object TreeListID_DEPARTMENT: TcxDBTreeListColumn
      Caption.Text = 'ID_DEPARTMENT'
      DataBinding.FieldName = 'ID_DEPARTMENT'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 78
    end
    object TreeListDISPLAY_NAME: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1079#1074#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091
      DataBinding.FieldName = 'DISPLAY_NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 677
    end
    object TreeListNAME_SHORT: TcxDBTreeListColumn
      Caption.Text = 'NAME_SHORT'
      DataBinding.FieldName = 'NAME_SHORT'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 78
    end
    object TreeListNAME_FULL: TcxDBTreeListColumn
      Caption.Text = 'NAME_FULL'
      DataBinding.FieldName = 'NAME_FULL'
      Position.ColIndex = 8
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 78
    end
    object TreeListID_PARENT: TcxDBTreeListColumn
      Caption.Text = 'ID_PARENT'
      DataBinding.FieldName = 'ID_PARENT'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 78
    end
    object TreeListDISPLAY_ORDER: TcxDBTreeListColumn
      Caption.Text = 'DISPLAY_ORDER'
      DataBinding.FieldName = 'DISPLAY_ORDER'
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 78
    end
    object TreeListDISPLAY_ORDER2: TcxDBTreeListColumn
      Caption.Text = 'DISPLAY_ORDER2'
      DataBinding.FieldName = 'DISPLAY_ORDER2'
      Position.ColIndex = 7
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 78
    end
    object TreeListDEPARTMENT_CODE: TcxDBTreeListColumn
      DataBinding.FieldName = 'DEPARTMENT_CODE'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 87
    end
    object TreeListIsDELETED: TcxDBTreeListColumn
      DataBinding.FieldName = 'Is_Deleted'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 87
    end
  end
  inline SearchFrame: TfmSearch
    Left = 0
    Top = 361
    Width = 679
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    inherited AllLabel: TLabel
      Left = 555
      Height = 56
    end
    inherited InsideBox: TCheckBox
      Checked = False
      State = cbUnchecked
    end
  end
  object TreeSource: TDataSource
    Left = 208
    Top = 136
  end
  object StyleRepository: TcxStyleRepository
    Left = 240
    Top = 24
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object qizzStyle: TcxGridTableViewStyleSheet
      Styles.Background = stBackground
      Styles.Content = stContent
      Styles.ContentEven = stContentEven
      Styles.ContentOdd = stContentOdd
      Styles.Inactive = stInactive
      Styles.IncSearch = stIncSearch
      Styles.Selection = stSelection
      Styles.FilterBox = stFilterBox
      Styles.Footer = stFooter
      Styles.Group = stGroup
      Styles.GroupByBox = stGroupByBox
      Styles.Header = stHeader
      Styles.Indicator = stIndicator
      Styles.Preview = stPreview
      BuiltIn = True
    end
  end
  object qStyle: TcxStyleRepository
    Left = 384
    Top = 288
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
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
      Font.Color = clWhite
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
      Font.Color = clNavy
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
    object cxStyle15: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
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
end
