object fmBankTypeKassa: TfmBankTypeKassa
  Left = 450
  Top = 175
  Width = 695
  Height = 404
  Caption = 'fmBankTypeKassa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 97
    Width = 679
    Height = 269
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyDown = cxGrid1DBTableView1KeyDown
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyle17
      Styles.Selection = cxStyleMalin
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleBorder
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyle17
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        DataBinding.FieldName = 'Name'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'Id'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 97
    Align = alTop
    TabOrder = 1
    object cxTextEditNumber: TcxTextEdit
      Left = 109
      Top = 8
      Width = 75
      Height = 21
      Properties.ReadOnly = True
      Style.Color = 16776176
      TabOrder = 0
    end
    object cxTextEditSumma: TcxTextEdit
      Left = 296
      Top = 8
      Width = 89
      Height = 21
      Properties.ReadOnly = True
      Style.Color = 16776176
      TabOrder = 1
    end
    object cxDateEditdate: TcxDateEdit
      Left = 512
      Top = 8
      Width = 105
      Height = 21
      Properties.ReadOnly = True
      Style.Color = 16776176
      TabOrder = 2
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Width = 97
      Height = 17
      AutoSize = False
      TabOrder = 3
    end
    object cxLabel2: TcxLabel
      Left = 184
      Top = 10
      Width = 97
      Height = 17
      AutoSize = False
      TabOrder = 4
    end
    object cxLabel3: TcxLabel
      Left = 392
      Top = 10
      Width = 117
      Height = 17
      AutoSize = False
      TabOrder = 5
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 56
      Width = 51
      Height = 17
      TabOrder = 6
    end
    object cxMemo1: TcxMemo
      Left = 80
      Top = 56
      Width = 596
      Height = 33
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      Properties.ReadOnly = True
      Style.Color = 16776176
      TabOrder = 7
    end
    object cxTextEditValuta: TcxTextEdit
      Left = 109
      Top = 32
      Width = 75
      Height = 21
      Style.Color = 16776176
      TabOrder = 8
      Text = 'cxTextEditValuta'
    end
    object cxLabel5: TcxLabel
      Left = 8
      Top = 32
      Width = 77
      Height = 17
      TabOrder = 9
      Caption = #1089#1091#1084#1072' '#1091' '#1074#1072#1083#1102#1090#1110
    end
    object cxLabel6: TcxLabel
      Left = 184
      Top = 32
      Width = 51
      Height = 17
      TabOrder = 10
      Caption = #1074#1072#1083#1102#1090#1072' '
    end
    object cxLabelValuta: TcxLabel
      Left = 296
      Top = 32
      Width = 321
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 11
    end
  end
  object Rx: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ShablonObr'
        DataType = ftInteger
      end>
    Left = 48
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = Rx
    Left = 96
    Top = 112
  end
  object StyleRepository: TcxStyleRepository
    Left = 104
    Top = 192
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
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
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 15204351
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object ActionList1: TActionList
    Left = 392
    Top = 88
    object ActionClose: TAction
      Caption = 'ActionClose'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
  end
  object DataSetShablon: TpFIBDataSet
    Left = 144
    Top = 152
    poSQLINT64ToBCD = True
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 16
    Top = 216
  end
  object pFIBDataSet1: TpFIBDataSet
    Left = 327
    Top = 141
    poSQLINT64ToBCD = True
  end
end
