object fmPCardBonusPage: TfmPCardBonusPage
  Left = 0
  Top = 0
  Width = 772
  Height = 424
  TabOrder = 0
  OnExit = FrameExit
  object Panel1: TPanel
    Left = 0
    Top = 368
    Width = 772
    Height = 56
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 42
      Height = 13
      Caption = #1053#1072#1082#1072#1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 40
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
    object Ord: TcxDBLabel
      Left = 80
      Top = 22
      Width = 500
      Height = 17
      DataBinding.DataField = 'NUM_ORDER'
      DataBinding.DataSource = DS_Bonus
      Constraints.MinWidth = 500
      Properties.ShadowedColor = clBtnFace
      Properties.Transparent = True
      TabOrder = 0
    end
    object Date_Ord: TcxDBLabel
      Left = 80
      Top = 38
      Width = 500
      Height = 17
      DataBinding.DataField = 'DATE_ORDER'
      DataBinding.DataSource = DS_Bonus
      Constraints.MinWidth = 500
      Properties.ShadowedColor = clBtnFace
      Properties.Transparent = True
      TabOrder = 1
    end
    object cxCB_ShowOld: TcxCheckBox
      Left = 8
      Top = 0
      Width = 289
      Height = 21
      AutoSize = False
      Constraints.MinWidth = 160
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1089#1090#1072#1088#1110' '#1079#1072#1087#1080#1089#1080
      TabOrder = 2
      OnClick = cxCB_ShowOldClick
    end
  end
  object cxDBTL_Bonus: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 772
    Height = 368
    Styles.StyleSheet = cxTreeListStyleSheet1
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 400
      end>
    BufferedPaint = False
    DataController.DataSource = DS_Bonus
    DataController.ParentField = 'ID_PARENT'
    DataController.KeyField = 'ID'
    OptionsSelection.CellSelect = False
    OptionsView.CellAutoHeight = True
    OptionsView.ColumnAutoWidth = True
    RootValue = -1
    TabOrder = 1
    OnCustomDrawCell = cxDBTL_BonusCustomDrawCell
    OnKeyDown = BonusGridDBTableView1KeyDown
    object cxDBTLC_Name: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1079#1074#1072
      DataBinding.FieldName = 'ALL_NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 369
    end
    object cxDBTLC_Beg: TcxDBTreeListColumn
      Caption.Text = #1047
      DataBinding.FieldName = 'DATE_BEG'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 153
    end
    object cxDBTLC_End: TcxDBTreeListColumn
      Caption.Text = #1055#1086
      DataBinding.FieldName = 'DATE_END'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 152
    end
    object cxDBTLC_Bonus: TcxDBTreeListColumn
      Caption.Text = #1056#1086#1079#1084#1110#1088
      DataBinding.FieldName = 'THE_BONUS'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 96
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
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxTreeListStyleSheet1: TcxTreeListStyleSheet
      Caption = 'qizzStyle'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.Inactive = cxStyle6
      Styles.Selection = cxStyle10
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Footer = cxStyle5
      Styles.IncSearch = cxStyle7
      Styles.Indicator = cxStyle8
      Styles.Preview = cxStyle9
      BuiltIn = True
    end
  end
  object DS_Bonus: TDataSource
    DataSet = dmBonus.BonusSelect
    Left = 376
    Top = 88
  end
end
