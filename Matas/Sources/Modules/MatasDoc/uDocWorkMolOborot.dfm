object DocWorkMolOborotForm: TDocWorkMolOborotForm
  Left = 302
  Top = 204
  BorderStyle = bsDialog
  ClientHeight = 323
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OborotGrid: TcxGrid
    Left = 0
    Top = 26
    Width = 592
    Height = 297
    Align = alClient
    PopupMenu = OPopupMenu
    TabOrder = 0
    LookAndFeel.Kind = lfStandard
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = WorkDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.0000'
          Kind = skSum
          FieldName = 'KOL_PRH'
          Column = cxGridDBTableView1KOL_PRH
        end
        item
          Format = '0.0000'
          Kind = skSum
          FieldName = 'KOL_RSH'
          Column = cxGridDBTableView1KOL_RSH
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMM_PRH'
          Column = cxGridDBTableView1SUMM_PRH
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMM_RSH'
          Column = cxGridDBTableView1SUMM_RSH
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle7
      Styles.Content = cxStyle7
      Styles.Inactive = cxStyle10
      Styles.Selection = cxStyle14
      Styles.Footer = cxStyle5
      Styles.Header = cxStyle5
      object cxGridDBTableView1ID_SCH: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_SCH'
      end
      object cxGridDBTableView1SCH_NUMBER: TcxGridDBColumn
        Width = 75
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxGridDBTableView1KOL_PRH: TcxGridDBColumn
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 119
        DataBinding.FieldName = 'KOL_PRH'
      end
      object cxGridDBTableView1SUMM_PRH: TcxGridDBColumn
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 117
        DataBinding.FieldName = 'SUMM_PRH'
      end
      object cxGridDBTableView1KOL_RSH: TcxGridDBColumn
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 120
        DataBinding.FieldName = 'KOL_RSH'
      end
      object cxGridDBTableView1SUMM_RSH: TcxGridDBColumn
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 118
        DataBinding.FieldName = 'SUMM_RSH'
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object PanelWork: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 26
    Align = alTop
    TabOrder = 1
    object RefreshButton: TSpeedButton
      Left = 508
      Top = 0
      Width = 25
      Height = 25
      Action = acRefresh
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA467698E5D598E5D598E5D598E5D598E5D598E
        5D598E5D598E5D598E5D598E5D598E5D5980504BFF00FFFF00FFFF00FFA46769
        FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD7FEFC4
        8180504BFF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6F2DABCF2D5B2C1C18800
        7000007000BDB672E9BD82E9BD7FEFC48180504BFF00FFFF00FFFF00FFA0675B
        FFF4E5F7E5CF007000C4CA97007000C2C187C0BD80007000BDB66FEABF81EFC4
        8080504BFF00FFFF00FFFF00FFA7756BFFFBF0F8EADC007000007000C4C998F2
        D5B1F0D0A9BFBD80007000EBC28AEFC58380504BFF00FFFF00FFFF00FFA7756B
        FFFFFCFAF0E6007000007000007000F2DABAF2D5B1F0D0A7EECB9DEBC793F2C9
        8C80504BFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F8EAD9F7E3CFF6
        E0C5007000007000007000EECC9EF3CE9780504BFF00FFFF00FFFF00FFBC8268
        FFFFFFFFFEFC007000CADABAF7EADAF6E3CFC5CE9F007000007000F0D0A6F6D3
        A080504BFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFCEE7CC007000CADAB8C9
        D7B0007000C6CC9E007000F4D8B1EBCFA480504BFF00FFFF00FFFF00FFD1926D
        FFFFFFFFFFFFFFFFFFCEE7CC007000007000C9D5B0F8E7D1FBEACEDECEB4B6AA
        9380504BFF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFC
        F6EFFCF3E6EDD8C9A0675BA0675BA0675BA0675BFF00FFFF00FFFF00FFDA9D75
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA0675BE19E55E68F
        31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDCC7C5A0675BF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FFE7AB79
        FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A0675BC1836CFF00
        FFFF00FFFF00FFFF00FFFF00FFE7AB79CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68A0675BFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentFont = False
    end
    object PrintButton: TSpeedButton
      Left = 533
      Top = 0
      Width = 25
      Height = 25
      Action = acPrint
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
        8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
        868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
        C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
        5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
        D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
        141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
        E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
        FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
        D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
        A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
        FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
        D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
        C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
        DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
        E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
        9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      ParentFont = False
    end
    object CancelButton: TSpeedButton
      Left = 565
      Top = 0
      Width = 25
      Height = 25
      Action = acExit
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00174AFD00103BF40000009A00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00002CF8000030FC0000009A00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00A8A8A800A0A0A0006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B009A9A9A009C9C9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A001A47F8001A4CFF00123BF10000009A00FF00FF00FF00FF000000
        9A00012DF6000132FF00002AF30000009A00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00A7A7A700AAAAAA009F9F9F006B6B6B00FF00FF00FF00FF006B6B
        6B00999999009E9E9E00979797006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A001C47F6001B4DFF00143EF40000009A0000009A00002D
        F8000134FF00032BF20000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B00A7A7A700ABABAB00A2A2A2006B6B6B006B6B6B009A9A
        9A009E9E9E00989898006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000009A001D48F6001D50FF00103DFB000431FE000132
        FF00002CF60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006B6B6B00A7A7A700ACACAC00A3A3A3009F9F9F009E9E
        9E00999999006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000009A001A48F9001342FF000C3CFF000733
        F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006B6B6B00A7A7A700A7A7A700A3A3A3009C9C
        9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000009A00214EFC001D4BFF001847FF001743
        F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006B6B6B00ACACAC00ACACAC00A9A9A900A4A4
        A4006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000009A002E5BF9002C5FFF00224DF800204BF8002355
        FF001B46F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006B6B6B00B1B1B100B3B3B300ABABAB00AAAAAA00AFAF
        AF00A6A6A6006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A003664FA00386BFF002D59F40000009A0000009A00224C
        F4002558FF001D49F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B00B6B6B600B9B9B900AEAEAE006B6B6B006B6B6B00A9A9
        A900B0B0B000A7A7A7006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A004071FA004274FF00325DF10000009A00FF00FF00FF00FF000000
        9A00224DF100275AFF00204CF80000009A00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00BBBBBB00BEBEBE00AFAFAF006B6B6B00FF00FF00FF00FF006B6B
        6B00A7A7A700B1B1B100AAAAAA006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00497AFC003B66F30000009A00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A002550F4002655FA0000009A00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00C0C0C000B5B5B5006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF006B6B6B00AAAAAA00AEAEAE006B6B6B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 5
      Width = 38
      Height = 16
      Caption = #1052#1042#1054':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxMatOtv: TcxButtonEdit
      Left = 45
      Top = 2
      Width = 456
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxMatOtvPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
  end
  object WorkDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WorkTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_GET_OBOROT_BY_MO(:ID_MO, :DATE_BEG, :DATE_END)')
    Left = 16
    Top = 152
    poSQLINT64ToBCD = True
    object WorkDataSetID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object WorkDataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object WorkDataSetKOL_PRH: TFIBBCDField
      FieldName = 'KOL_PRH'
      Size = 4
      RoundByScale = True
    end
    object WorkDataSetKOL_RSH: TFIBBCDField
      FieldName = 'KOL_RSH'
      Size = 4
      RoundByScale = True
    end
    object WorkDataSetSUMM_PRH: TFIBBCDField
      FieldName = 'SUMM_PRH'
      Size = 2
      RoundByScale = True
    end
    object WorkDataSetSUMM_RSH: TFIBBCDField
      FieldName = 'SUMM_RSH'
      Size = 2
      RoundByScale = True
    end
  end
  object WorkDataSource: TDataSource
    DataSet = WorkDataSet
    Left = 48
    Top = 152
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = WorkTransaction
    DefaultUpdateTransaction = WorkTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 72
  end
  object WorkTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 40
    Top = 72
  end
  object StyleRepository: TcxStyleRepository
    Left = 16
    Top = 104
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWindow
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
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
  object ActionList1: TActionList
    Left = 312
    Top = 120
    object acRefresh: TAction
      Caption = 'acRefresh'
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acPrint: TAction
      Caption = 'acPrint'
      ShortCut = 117
      OnExecute = acPrintExecute
    end
    object acExit: TAction
      Caption = 'acExit'
      ShortCut = 27
      OnExecute = acExitExecute
    end
  end
  object OPopupMenu: TPopupMenu
    Left = 176
    Top = 80
    object acPrint1: TMenuItem
      Action = acPrint
    end
    object acRefresh1: TMenuItem
      Action = acRefresh
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object acExit1: TMenuItem
      Action = acExit
    end
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 104
    Top = 72
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = WorkDataSet
    Left = 104
    Top = 104
  end
end
