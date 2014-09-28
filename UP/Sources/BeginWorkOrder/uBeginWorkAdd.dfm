object frmAddOtpusk: TfrmAddOtpusk
  Left = 200
  Top = 185
  Width = 609
  Height = 409
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042#1110#1076#1087#1091#1089#1090#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 601
    Height = 334
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyDown = cxGrid1DBTableView1KeyDown
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = qizzStyle
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortOrder = soAscending
        Width = 68
        DataBinding.FieldName = 'NUM_ORDER'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 77
        DataBinding.FieldName = 'DATE_ORDER'
      end
      object cxGrid1DBTableView1NAME_POST: TcxGridDBColumn
        Caption = #1055#1086#1089#1072#1076#1072
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 91
        DataBinding.FieldName = 'NAME_POST'
      end
      object cxGrid1DBTableView1ID_MAN_HOLIDAY_FACT: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        DataBinding.FieldName = 'ID_MAN_HOLIDAY_FACT'
      end
      object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
        Caption = #1043#1086#1083#1086#1074#1085#1072
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 42
        DataBinding.FieldName = 'IS_POST_MAIN'
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1057#1090#1072#1074#1082#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 51
        DataBinding.FieldName = 'RATE_COUNT'
      end
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 110
        DataBinding.FieldName = 'NAME_TYPE_HOLIDAY'
      end
      object cxGrid1DBTableView1HOLIDAY_BEG: TcxGridDBColumn
        Caption = #1055#1086#1095#1072#1090#1086#1082' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 82
        DataBinding.FieldName = 'HOLIDAY_BEG'
      end
      object cxGrid1DBTableView1HOLIDAY_END: TcxGridDBColumn
        Caption = #1050#1110#1085#1077#1094#1100' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 78
        DataBinding.FieldName = 'HOLIDAY_END'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 334
    Width = 601
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 259
      Top = 5
      Width = 97
      Height = 28
      Action = ActOK
      Cancel = True
      Caption = #1043#1072#1088#1072#1079#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        DE060000424DDE060000000000005E0200002800000030000000180000000100
        08000000000080040000C30E0000C30E00008A0000008A00000000000000FFFF
        FF00FF00FF00B73D3D00C1454500C2484800C6535300C6545400C8595900C95D
        5D00CB636300CC666600CD686800CD696900CE6B6B00CE6C6C00CF6E6E00CF6F
        6F00D0717100D1747400D1757500D37B7B00D47D7D00D5808000D8898900D88A
        8A00D98D8D00DA909000DC969600DD989800DE9C9C00DF9F9F00E0A2A2000066
        000008790F000B7E130012A9200013AB220014AB2300118D1D0013AB230014AC
        250014AB240015AC260017AE270018AE290019AF2B00148D21001CB22F001EB4
        32001FB534001A902A0020AA34001D952E001F99310021AB360022AC380021A3
        350026BA3E0024AD3A0025AE3C0024A5390027AF3E0025A63B0028B0400029B1
        410027A73E002EC04A002FC14C002FB34A0037C8570031B04D0036BC55003ABF
        5B003FCE630040CF640048D56F0047CF6D004FDA790050DB7B0055E0820059E2
        89005BE48A00D1D1D100CFCFCF00CCCCCC00C7C7C700C6C6C600C1C1C100C0C0
        C000BFBFBF00BDBDBD00BABABA00B9B9B900B8B8B800B5B5B500B3B3B300B1B1
        B100B0B0B000AEAEAE00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A700A3A3
        A300A2A2A200A0A0A0009F9F9F009E9E9E009D9D9D009C9C9C009B9B9B009A9A
        9A00999999009898980097979700969696009595950094949400939393009292
        920091919100909090008F8F8F008E8E8E008D8D8D008C8C8C008B8B8B008787
        8700858585008383830082828200818181007A7A7A0076767600727272006565
        6500020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202210202020202020202020202020202020202020202
        0202028902020202020202020202020202020202020202020202213921020202
        0202020202020202020202020202020202028977890202020202020202020202
        020202020202020202213D244021020202020202020202020202020202020202
        0289757C6D890202020202020202020202020202020202022142312D253E2102
        02020202020202020202020202020202897270767A6E89020202020202020202
        020202020202022136433A322E283C2102020202020202020202020202020289
        7D666A6F757A7089020202020202020202020202020221354A46443F2141293B
        210202020202020202020202020289805E616574896C79718902020202020202
        020202020221334E4C4B45210221302B38210202020202020202020202898157
        595D698902897279728902020202020202020202022151504F4821030202212F
        2C37210202020202020202020289545556648986020289847773890202020202
        020202020221475249210A1103020202212D3421020202020202020202896A53
        6389746C860202028976748902020202020202020203214D21100C0A0F030202
        02212E2621020202020202020286895B896D71746E8602020289757A89020202
        0202020203091821150D03120A0F0302020221232A2102020202020286786289
        6870866B746E8602020289877A89020202020203081C1B19140302030E0A0E03
        0202020221272102020202867B5D5F61698602866F746F860202020289858902
        020202031F1E1D160302020203070B0D0302020202212221020202865A5B5C67
        86020202867E727086020202028988890202020313201703020202020202030B
        0D03020202020221210202866A58658602020202020286727086020202020289
        89020202031A030202020202020202030C0A0302020202020221020286608602
        0202020202020286717486020202020202890202020302020202020202020202
        03050A0302020202020202020286020202020202020202028682748602020202
        0202020202020202020202020202020202020306030202020202020202020202
        02020202020202020202867F8602020202020202020202020202020202020202
        0202020304030202020202020202020202020202020202020202028683860202
        0202020202020202020202020202020202020202020303020202020202020202
        0202020202020202020202020286860202020202020202020202020202020202
        0202020202020203020202020202020202020202020202020202020202020286
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202}
      NumGlyphs = 2
    end
  end
  object DataSet: TpFIBDataSet
    Database = frmOtpuskOrder.Database
    Transaction = frmOtpuskOrder.ReadTransaction
    SelectSQL.Strings = (
      
        'select * from HL_DT_MAN_HOLIDAY_FACT_SEL(:ID_PCARD, :FILTER_DATE' +
        ', null, null, 1)')
    Left = 376
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = DataSet
    Left = 408
    Top = 16
  end
  object StyleRepository: TcxStyleRepository
    Left = 344
    Top = 14
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
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
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
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
    object stHotTrack: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
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
  object ActionList1: TActionList
    Left = 120
    Top = 336
    object ActOK: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      ShortCut = 121
      OnExecute = ActOKExecute
    end
  end
end
