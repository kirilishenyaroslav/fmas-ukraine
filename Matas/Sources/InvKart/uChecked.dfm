object fmChacked: TfmChacked
  Left = 310
  Top = 307
  Width = 335
  Height = 395
  BorderIcons = [biSystemMenu]
  Caption = 'fmChacked'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridNorma: TcxGrid
    Left = 184
    Top = -8
    Width = 49
    Height = 57
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    object cxGridNormaDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourceCheck
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_INV_GRP'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Edit.Enabled = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = AfterSelection
      Styles.Selection = cxStyleMalin
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleYellow
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = ForHaeder
      object cxGridNormaDBTableView1DBColumn1: TcxGridDBColumn
        HeaderAlignmentHorz = taRightJustify
        Width = 138
        DataBinding.FieldName = 'ID_INV_GRP'
      end
      object cxGridNormaDBTableView1DBColumn2: TcxGridDBColumn
        Width = 371
        DataBinding.FieldName = 'NAME_GRP'
      end
    end
    object cxGridNormaLevel1: TcxGridLevel
      GridView = cxGridNormaDBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 333
    Width = 327
    Height = 35
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      327
      35)
    object cxButtonCheck: TcxButton
      Left = 104
      Top = 5
      Width = 120
      Height = 25
      Hint = 'F10'
      Action = Action1
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
        FF00FF00FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00006600001EB231001FB1330000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00656565009A9A9A009A9A9A0065656500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000066000031C24F0022B738001AB02D0021B4370000660000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500ABABAB009E9E9E00979797009C9C9C0065656500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000047D36D003BCB5E0025A83B00006600001BA92E001DB132000066
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500BFBFBF00B5B5B500989898006565650094949400999999006565
        6500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000066
        00004FD6790053DE7F0031B54D0000660000FF00FF0000660000179D27001EAE
        310000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006565
        6500C4C4C400CACACA00A5A5A50065656500FF00FF00656565008C8C8C009898
        980065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000041C5630000660000FF00FF00FF00FF00FF00FF00FF00FF000066
        000019AA2B0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500B5B5B50065656500FF00FF00FF00FF00FF00FF00FF00FF006565
        65009393930065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000660000149D210000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00656565008A8A8A0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      UseSystemPaint = False
    end
  end
  object cxDBTreeListPapka: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 327
    Height = 333
    Styles.Background = cxStyleYellow
    Styles.Content = cxStyleYellow
    Styles.Inactive = AfterSelection
    Styles.Selection = cxStyleMalin
    Styles.BandBackground = cxStyleYellow
    Styles.BandContent = cxStyleYellow
    Styles.BandHeader = cxStyleYellow
    Styles.ColumnFooter = cxStyleYellow
    Styles.ColumnHeader = ForHaeder
    Styles.ContentEven = cxStyleYellow
    Styles.ContentOdd = cxStyleYellow
    Styles.Footer = cxStyleYellow
    Styles.HotTrack = cxStyleYellow
    Styles.IncSearch = cxStyleYellow
    Styles.Indicator = cxStyleYellow
    Styles.Preview = cxStyleYellow
    Align = alClient
    Bands = <
      item
        Caption.Text = 'Band1'
      end>
    BufferedPaint = False
    DataController.DataSource = DataSourceCheck
    DataController.ParentField = 'LINK_TO'
    DataController.KeyField = 'ID_INV_GRP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    OptionsBehavior.FocusCellOnCycle = True
    OptionsBehavior.IncSearch = True
    OptionsSelection.CellSelect = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.GridLineColor = clNone
    OptionsView.GridLines = tlglBoth
    ParentFont = False
    RootValue = -1
    TabOrder = 2
    object cxDBTreeListPapkacxDBTreeListColumn1: TcxDBTreeListColumn
      DataBinding.FieldName = 'NAME_GRP'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 325
    end
  end
  object DataSetCheck: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_DT_INV_GROUPS')
    Left = 9
    Top = 56
    poSQLINT64ToBCD = True
    object DataSetCheckID_INV_GRP: TFIBBCDField
      FieldName = 'ID_INV_GRP'
      DisplayFormat = '#,##0'
      EditFormat = '0'
      Size = 0
      RoundByScale = True
    end
    object DataSetCheckLINK_TO: TFIBBCDField
      FieldName = 'LINK_TO'
      Size = 0
      RoundByScale = True
    end
    object DataSetCheckNAME_GRP: TFIBStringField
      FieldName = 'NAME_GRP'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetCheckHAS_CHILD: TFIBSmallIntField
      FieldName = 'HAS_CHILD'
    end
    object DataSetCheckKOD_GRP: TFIBBCDField
      FieldName = 'KOD_GRP'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSourceCheck: TDataSource
    DataSet = DataSetCheck
    Left = 41
    Top = 56
  end
  object cxStyleRepositoryNorm: TcxStyleRepository
    Left = 8
    Top = 88
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
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
      Color = clOlive
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
    object ForHaeder: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object AfterSelection: TcxStyle
      AssignedValues = [svColor]
      Color = 16776176
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle16
      Styles.ContentEven = cxStyle17
      Styles.ContentOdd = cxStyle18
      Styles.Inactive = cxStyle24
      Styles.IncSearch = cxStyle25
      Styles.Selection = cxStyle28
      Styles.FilterBox = cxStyle19
      Styles.Footer = cxStyle20
      Styles.Group = cxStyle21
      Styles.GroupByBox = cxStyle22
      Styles.Header = cxStyle23
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      BuiltIn = True
    end
  end
  object ActionList1: TActionList
    Left = 40
    Top = 90
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
  object pFIBDataSetSelectErrors: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_CHACKED_LINKTO(-1)')
    Left = 8
    Top = 120
    poSQLINT64ToBCD = True
  end
end
