object fmPCardPochasPage: TfmPCardPochasPage
  Left = 0
  Top = 0
  Width = 772
  Height = 424
  TabOrder = 0
  OnEnter = FrameEnter
  OnExit = FrameExit
  object Panel1: TPanel
    Left = 0
    Top = 369
    Width = 772
    Height = 55
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 26
      Height = 13
      Caption = #1040#1082#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 136
      Top = 4
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
      Left = 384
      Top = 4
      Width = 43
      Height = 13
      Caption = #1058#1072#1088#1080#1092':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 20
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
    object Label5: TLabel
      Left = 136
      Top = 20
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
    object cxDBL_Inv: TcxDBLabel
      Left = 8
      Top = 34
      Width = 417
      Height = 15
      DataBinding.DataField = 'SMETA_NAME'
      DataBinding.DataSource = DS_Pochas
      AutoSize = False
      ParentFont = False
      Properties.OnChange = cxDBL_InvPropertiesChange
      Properties.WordWrap = True
      Properties.Transparent = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clPurple
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxDBL_Sprav: TcxDBLabel
      Left = 48
      Top = 2
      Width = 74
      Height = 17
      DataBinding.DataField = 'NUM_AKT'
      DataBinding.DataSource = DS_Pochas
      AutoSize = False
      Properties.Transparent = True
      TabOrder = 1
    end
    object cxDBL_Date: TcxDBLabel
      Left = 176
      Top = 2
      Width = 69
      Height = 17
      DataBinding.DataField = 'DATE_AKT'
      DataBinding.DataSource = DS_Pochas
      Properties.Transparent = True
      TabOrder = 2
    end
    object cxDBM_Note: TcxDBMemo
      Left = 432
      Top = 1
      Width = 339
      Height = 53
      Align = alRight
      DataBinding.DataField = 'TARIF_TYPE_NAME'
      DataBinding.DataSource = DS_Pochas
      Properties.ScrollBars = ssVertical
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object cxDBLabel1: TcxDBLabel
      Left = 48
      Top = 18
      Width = 74
      Height = 17
      DataBinding.DataField = 'NUM_ORDER'
      DataBinding.DataSource = DS_Pochas
      AutoSize = False
      Properties.Transparent = True
      TabOrder = 4
    end
    object cxDBLabel2: TcxDBLabel
      Left = 176
      Top = 18
      Width = 66
      Height = 17
      DataBinding.DataField = 'DATE_ORDER'
      DataBinding.DataSource = DS_Pochas
      Properties.Transparent = True
      TabOrder = 5
    end
  end
  object cxDBTL_Pochas: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 772
    Height = 369
    Styles.StyleSheet = cxTreeListStyleSheet1
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 300
      end>
    BufferedPaint = False
    DataController.DataSource = DS_Pochas
    DataController.ParentField = 'ID_PARENT'
    DataController.KeyField = 'ID'
    OptionsData.Editing = False
    OptionsSelection.CellSelect = False
    OptionsView.CellAutoHeight = True
    OptionsView.ColumnAutoWidth = True
    RootValue = -1
    TabOrder = 1
    object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1079#1074#1072
      DataBinding.FieldName = 'NAME'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 568
    end
    object cxDBTL_PochascxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.Text = #1043#1086#1076#1080#1085
      DataBinding.FieldName = 'KOL_HOURS'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 64
    end
    object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
      Caption.Text = #1047':'
      DataBinding.FieldName = 'DATE_BEG'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      Width = 69
    end
    object cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn
      Caption.Text = #1055#1086':'
      DataBinding.FieldName = 'DATE_END'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 69
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
  object DS_Pochas: TDataSource
    DataSet = dmPochas.PochasSelect
    Left = 376
    Top = 88
  end
end
