object fmPereocVed: TfmPereocVed
  Left = 200
  Top = 190
  Width = 659
  Height = 417
  Caption = 'fmPereocVed'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridPokaz: TcxGrid
    Left = 0
    Top = 0
    Width = 651
    Height = 223
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object cxGridPokazDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSourcePromej
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStylemalinYellow
      Styles.Content = cxStylemalinYellow
      Styles.ContentEven = cxStylemalinYellow
      Styles.ContentOdd = cxStylemalinYellow
      Styles.Inactive = AfterSelection
      Styles.Selection = cxStyleMalin
      Styles.FilterBox = cxStylemalinYellow
      Styles.Footer = cxStylemalinYellow
      Styles.Group = cxStylemalinYellow
      Styles.GroupByBox = cxStylemalinYellow
      Styles.Header = ForHaeder
      object cxGridPokazDBTableView1DBColumn1: TcxGridDBColumn
        Options.Filtering = False
        Width = 253
        DataBinding.FieldName = 'DATE_PEREOC'
      end
      object cxGridPokazDBTableView1DBColumn3: TcxGridDBColumn
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 282
        DataBinding.FieldName = 'DT_VED'
        IsCaptionAssigned = True
      end
      object cxGridPokazDBTableView1DBColumn2: TcxGridDBColumn
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 114
        DataBinding.FieldName = 'COEF'
      end
    end
    object cxGridPokazLevel1: TcxGridLevel
      GridView = cxGridPokazDBTableView1
    end
  end
  object PanelBotton: TPanel
    Left = 0
    Top = 358
    Width = 651
    Height = 32
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      651
      32)
    object cxButtonVibor: TcxButton
      Left = 427
      Top = 2
      Width = 100
      Height = 25
      Action = ActionLetsDo
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
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
    object cxButtonGariOno: TcxButton
      Left = 539
      Top = 2
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'cxButtonGariOno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cxButtonGariOnoClick
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
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxCheckBoxDisain: TcxCheckBox
      Left = 8
      Top = 8
      Width = 25
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 2
    end
    object ButtonDesmission: TcxButton
      Left = 304
      Top = 2
      Width = 112
      Height = 25
      Action = StornOperation
      Caption = #1056#1086#1079#1092#1086#1088#1084#1091#1074#1072#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 231
    Width = 651
    Height = 127
    Align = alBottom
    TabOrder = 2
    object GridDatailInfo: TcxGrid
      Left = 1
      Top = 1
      Width = 649
      Height = 125
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object GDBTView: TcxGridDBTableView
        DataController.DataSource = DataSourceDatail
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStylemalinYellow
        Styles.Content = cxStylemalinYellow
        Styles.ContentEven = cxStylemalinYellow
        Styles.ContentOdd = cxStylemalinYellow
        Styles.Inactive = AfterSelection
        Styles.Selection = cxStyleMalin
        Styles.FilterBox = cxStylemalinYellow
        Styles.Footer = cxStylemalinYellow
        Styles.Group = cxStylemalinYellow
        Styles.GroupByBox = cxStylemalinYellow
        Styles.Header = ForHaeder
        object GDBTViewDB_NAME_NOMN: TcxGridDBColumn
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Width = 218
          DataBinding.FieldName = 'NAME_NOMN'
        end
        object GDBTViewDB_FIO_MOL: TcxGridDBColumn
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Width = 137
          DataBinding.FieldName = 'FIO_MOL'
        end
        object GDBTViewDB_NAME_DEPARTMENT: TcxGridDBColumn
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Width = 170
          DataBinding.FieldName = 'NAME_DEPARTMENT'
        end
        object GDBTViewDB_summa_oper: TcxGridDBColumn
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Width = 122
          DataBinding.FieldName = 'SUMMA_OPER'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = GDBTView
      end
    end
  end
  object SplitDatailContr: TcxSplitter
    Left = 0
    Top = 223
    Width = 651
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    Control = Panel1
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 88
    Top = 32
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
      AssignedValues = [svColor, svFont]
      Color = 15204351
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      AssignedValues = [svColor, svFont]
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
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
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object AfterSelection: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
  object DBasePereoc: TpFIBDatabase
    DBName = 'D:\Hunter\DataBase\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = TransRead
    SQLDialect = 3
    Timeout = 0
    SaveDBParams = False
    WaitForRestoreConnect = 0
    Left = 96
    Top = 64
  end
  object DSPereocLook: TpFIBDataSet
    Database = DBasePereoc
    Transaction = TransRead
    SelectSQL.Strings = (
      'select * from MAT_DT_PEREOC_VED')
    Left = 128
    Top = 64
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceOpen = True
    object DSPereocLookID_PEREOC_VED: TFIBBCDField
      FieldName = 'ID_PEREOC_VED'
      Size = 0
      RoundByScale = True
    end
    object DSPereocLookDATE_PEREOC: TFIBDateField
      FieldName = 'DATE_PEREOC'
    end
    object DSPereocLookPUB_ID_DOC: TFIBBCDField
      FieldName = 'PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DSPereocLookSAVED: TFIBBooleanField
      FieldName = 'SAVED'
    end
    object DSPereocLookID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DSPereocLookDT_VED: TFIBDateTimeField
      FieldName = 'DT_VED'
    end
    object DSPereocLookCOEF: TFIBBCDField
      FieldName = 'COEF'
      RoundByScale = True
    end
  end
  object DataSourcePromej: TDataSource
    DataSet = DSPereocLook
    Left = 160
    Top = 64
  end
  object ActionList1: TActionList
    Left = 232
    Top = 72
    object ActionLetsDo: TAction
      Caption = 'ActionLetsDo'
      OnExecute = ActionLetsDoExecute
    end
    object StornOperation: TAction
      Caption = 'StornOperation'
      OnExecute = StornOperationExecute
    end
    object WhatWeHave: TAction
      Caption = 'WhatWeHave'
      ShortCut = 49217
      OnExecute = WhatWeHaveExecute
    end
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DBasePereoc
    TimeoutAction = TARollback
    Left = 96
    Top = 96
  end
  object DataSourceDatail: TDataSource
    DataSet = DSDatail
    Left = 168
    Top = 280
  end
  object DSDatail: TpFIBDataSet
    Database = DBasePereoc
    Transaction = TransRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_DATAIL_PEREOC(-1)')
    DataSource = DataSourcePromej
    Left = 136
    Top = 280
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DSDatailNAME_NOMN: TFIBStringField
      FieldName = 'NAME_NOMN'
      Size = 100
      EmptyStrToNull = True
    end
    object DSDatailID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object DSDatailFIO_MOL: TFIBStringField
      FieldName = 'FIO_MOL'
      Size = 50
      EmptyStrToNull = True
    end
    object DSDatailNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object DSDatailSUMMA_OPER: TFIBBCDField
      FieldName = 'SUMMA_OPER'
      DisplayFormat = '##,#0.00'
      EditFormat = '0.00'
      Size = 4
      RoundByScale = True
    end
    object DSDatailOST_PR_OLD: TFIBBCDField
      FieldName = 'OST_PR_OLD'
      Size = 4
      RoundByScale = True
    end
    object DSDatailOST_IZ_OLD: TFIBBCDField
      FieldName = 'OST_IZ_OLD'
      Size = 4
      RoundByScale = True
    end
    object DSDatailOST_PR_NEW: TFIBBCDField
      FieldName = 'OST_PR_NEW'
      Size = 4
      RoundByScale = True
    end
    object DSDatailOST_IZ_NEW: TFIBBCDField
      FieldName = 'OST_IZ_NEW'
      Size = 4
      RoundByScale = True
    end
    object DSDatailID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DSDatailNUM_SCH: TFIBStringField
      FieldName = 'NUM_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DSDatailINV_NUM_FULL: TFIBStringField
      FieldName = 'INV_NUM_FULL'
      Size = 10
      EmptyStrToNull = True
    end
    object DSDatailID_USER: TFIBBCDField
      FieldName = 'ID_USER'
      Size = 0
      RoundByScale = True
    end
    object DSDatailPUB_ID_DOC: TFIBBCDField
      FieldName = 'PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DSDatailID_KART: TFIBBCDField
      FieldName = 'ID_KART'
      Size = 0
      RoundByScale = True
    end
    object DSDatailID_OPER: TFIBBCDField
      FieldName = 'ID_OPER'
      Size = 0
      RoundByScale = True
    end
    object DSDatailBAL_PRICE_OLD: TFIBBCDField
      FieldName = 'BAL_PRICE_OLD'
      Size = 4
      RoundByScale = True
    end
    object DSDatailBAL_PRICE_NEW: TFIBBCDField
      FieldName = 'BAL_PRICE_NEW'
      Size = 4
      RoundByScale = True
    end
  end
  object frReportGoVedPrint: TfrReport
    Dataset = frDBDataSet_Print_Ved
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 248
    Top = 280
    ReportForm = {19000000}
  end
  object frDBDataSet_Print_Ved: TfrDBDataSet
    DataSet = DSDatail
    Left = 216
    Top = 280
  end
  object frDBDataSet_Zagal: TfrDBDataSet
    DataSet = DSPereocLook
    Left = 192
    Top = 64
  end
  object TransactionGlobal: TpFIBTransaction
    DefaultDatabase = DBasePereoc
    TimeoutAction = TARollback
    Left = 96
    Top = 136
  end
  object frDBDataSet3: TfrDBDataSet
    Left = 240
    Top = 168
  end
end
