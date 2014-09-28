object fmAccountReload: TfmAccountReload
  Left = 357
  Top = 240
  BorderStyle = bsSingle
  Caption = #1042#1080#1076#1072#1083#1077#1085#1085#1103' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1110#1074
  ClientHeight = 602
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 582
    Width = 709
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 709
    Height = 536
    Align = alClient
    TabOrder = 5
    object AccountReloadGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 707
      Height = 503
      Align = alClient
      TabOrder = 1
      object AccountReloadGridDBTableView1: TcxGridDBTableView
        OnDblClick = AccountReloadGridDBTableView1DblClick
        DataController.DataSource = DM.DSourceMain
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        Filtering.CustomizeDialog = False
        Filtering.Visible = fvNever
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
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
        object AccountReloadGridDBTableView_TN: TcxGridDBColumn
          Caption = #1058#1072#1073'. '#1085#1086#1084#1077#1088
          Options.Filtering = False
          SortOrder = soAscending
          Width = 106
          DataBinding.FieldName = 'TN'
        end
        object AccountReloadGridDBTableView_FIO_UPPER: TcxGridDBColumn
          Caption = #1055'.'#1030'.'#1041'.'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 506
          DataBinding.FieldName = 'FIO_UPPER'
        end
        object AccountReloadGridDBTableView_CHECK: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 93
          DataBinding.FieldName = 'CHECK'
          IsCaptionAssigned = True
        end
      end
      object AccountReloadGridLevel1: TcxGridLevel
        GridView = AccountReloadGridDBTableView1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 504
      Width = 707
      Height = 31
      Align = alBottom
      TabOrder = 0
      object LabelSearch: TLabel
        Left = 24
        Top = 5
        Width = 24
        Height = 13
        Caption = #1055'.'#1030'.'#1041
      end
      object SearchEdit: TcxTextEdit
        Left = 79
        Top = 3
        Width = 601
        Height = 21
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.OnChange = SearchEditPropertiesChange
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Pitch = fpFixed
        Style.Font.Style = []
        TabOrder = 0
        OnKeyPress = SearchEditKeyPress
      end
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = #1087#1072#1085#1077#1083#1100' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 270
        FloatTop = 271
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = dxBut_Select
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 736
    Top = 16
    DockControlHeights = (
      0
      0
      46
      0)
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBut_Select: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1080
      Visible = ivAlways
      OnClick = dxBut_SelectClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00FEFCFC00F4685500FCD9D400E94B2F00E1462D00F7634400F865
        4500F86B4D00FBA99800FBBDB000FBC6BC00E5593A00F7694600F86C4900FA6E
        4B00BA390F00E1896E00AD3509006E2D1300D49C8200B85B2D00C9927700FEFC
        FB00BC4B0000D9640100FEEFE100FEF0E300FEF3E900FEF4EB00FED1A400FED5
        AB00FEDAB500FEDEBD00FEE7D100FEE9D400FEEAD700FEEBD800FEEFE000FEF0
        E200FEF2E600FEF4EA00FEF7F000FEF8F200FEFAF600FEFBF800FEFCFA00D581
        2700FECB9600FED3A500FED5A900FED7AC00FED7AD00FED8AD00FED8B000FED9
        B200FEDAB200FEDCB700FEDCB800FEDEBB00FEE1C100FEE2C400FEE3C600FEE3
        C700FEE5C900FEE5CA00FEE6CC00FEE7CF00FEE9D300FEEAD400FEEDDA00FEEE
        DD00FEF0E100FEF2E500FEF3E700FEF6ED00F3EBE200FEDCB500FEE0BD00FEE1
        C000FEE7CC00FEE9CF00FEE9D000FEE9D100FEEBD500FEEDD900FEEFDE00FEF7
        EF00FEEEDA00FEF2E300FEF3E500FEF7EE00FEFBF700FEFAF400FEFAF300FEFB
        F600E6E7E700C0D8E3001278B000157BB600187DB4002379AA00669FBF00BAD8
        E9001B7AB4001B77B00028739F004588AF00EAF2F7000655890013639700BDDA
        EE00004B8200055A9700085F9F00116EB50033A0FB00309CFB006EB8FC002890
        FA003296F800558AD8002856F8002A59FF00305FFB001844FF002049F8002250
        FF00244BEF000E36FF00123BFF00133EFF00143BF8001540FF001A41F700193F
        F0001D42ED000A31FC000A2BF3000B2EFF000C33FF000C2FF7000C2EF6000D34
        FF000D2EF3000E32FF000E2FF3000E30F3001032F6001033F6001135FB001134
        F6001133F0001134ED001336F000001FFF000425FF000626FA000624F0000724
        ED00082AFF000927F0000D2DF300001DFF00001CFB000018F6000019F6000018
        F3000019F3000017EF00011CFE000118EE00021EF300B4B5C70000008200FEFE
        FE00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        02020202020202B0B0020202020202B0B002020202020202020202020202B08B
        A0B002020202B0A7A6B0020202020202020202020202B0908EA1B00202B0AAA5
        ABB01A1A1A1A1A1A1A1A1A1A1A1A1AB09291A3B0B0A89DADB0021A4C29492624
        433F503B1A373420B094839FACA5A9B01A021A5D2B4B5857465240511A4F3821
        33B08FA29EAEB0321A021A2E2D4D4C4A5A5653421A503B3935B098938D8CB032
        1A021A1917151515151516551A403131B0887F999684A4B01A021AB11406080A
        040715481A4542B0808189B0B09A8595B0021AB1120F09050D0E151D1A27B07C
        7D8AB03936B09B8797B01AB113100B010C11181F1A28B07E82B031313131B09C
        86B01AB1B17B6B6A67AF4E2D1A4C29B0B054433F503C3AB0B0021AB178797979
        797A622F1A592B4B58572552413E3D221A021AB166777777776571031A613131
        31313131313131231A021AB173767676766469B11A195E605D1E5B5827464440
        1A021AB16D7374747570B1B11AB1192F5F2C1F2A1C5A47451A021AB16E686F72
        6C63B1B11AB1313131313131313131271A021AB1B1B1B1B1B1B1B1B11AB1B1B1
        B1032F60591F5C281A021AB1B1B1B1B1B1B1B1B11AB1B1B1B1B103305E2D4D4C
        1A021A1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1A021A1A1A1A1A1A
        1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A02021A1A1A1A1A1A1A1A1A1A1A1A1A
        1A1A1A1A1A1A1A1A020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1030#1085#1074#1077#1088#1090#1091#1074#1072#1090#1080
      Category = 0
      Hint = #1030#1085#1074#1077#1088#1090#1091#1074#1072#1090#1080
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00FEFCFC00885D4F0096351100FEFBFA00A54E2B00AC5B3900B469
        4900FEFCFB0098441000FEF8F400BD580C00FEF7F200FEF8F300E97F1E00FEF4
        EB00FEDDBB00FEE6CE00FEF6EE00FEF7F000FEF8F200FEFAF600FEFBF800FEFC
        FA00CA680000FED3A500FED7AB00FED9B000FED9B100FED9B200FEDAB400FEDC
        B800FEDDB800FEDEBC00FEE0BF00FEE0C000FEE0C100FEE1C100FEE2C400FEE3
        C500FEE3C600FEE5CA00FEEAD500FEEBD700FEEEDC00FEF4E900CE720800CF75
        0B00D07A1100D17D1500D37F1800D4821C00FEE2C200FEE5C700FEE9D000FEEF
        DE00FEF3E600FEF7EF00D78A2800D88C2B00D9923400FEF2E200FEF2E300FEF7
        EE00FEFBF700FEF6EB00FEFAF400C0B6A5009378400080704300FEFEFB00FEFE
        FC00C0C1BB00A4A69F003D54530067FFFC0064FEFE0065FEFE0066FFFE0067FF
        FE006AFFFE00ACB6B6005CFAFE005BEEF30060FBFE0062FBFE0054F6FE0054DD
        E3004BF0FE0050F3FE00879596003FEAFE0047EEFE0036E5FE003BE7FE002CDE
        FE002FE0FE0025D9FE0029DAFE0028CFF3002FB6D3002DADC9001FD4FE0014CB
        FF0015CCFF0019CFFF002595B5002E4D560087969A0005BBFF000AC0FF000CC2
        FF000CBAF400198EB5001F88AB0003B7FF0009ABE9000B9CD400187AA300758A
        920000AFFF0000B0FF0001B0FF0001B1FF0001A7F40002B1FF0000ABFF0000AD
        FF0000A4F400009CE90001A5F400019DE900018CD4000390D4000675AD000C63
        90000088D4000089D400008AD4000276B6000370AD0006649A000A4F7700367A
        A000879EAB000070B60003568A0004578A000A5C8F00125C890029729D000068
        AD0001538A00015189000152890002548A0003497A0004508400085184000953
        86000A588A000C5688000E598B00105A8A00135E8F002E6D960055778F007592
        A50000599A0000529100004E8600004A8200004B8200004C820000467B00014C
        8100024E8400024A7D000852870080A1BA000844770006417500003268003747
        5B00474C5800FEFEFE00DCDCDC00FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        02AEAEAEAEAEAEAEAEAEAEAEAEAEAE020202020202020202AE7770757C808181
        7A7A7C7C7D7D86AE02020202020202AE65686976878C8A8A8A8B8B8B857C7D7E
        AE0202020202AE665D628FB8B8B8B8B8B8B8A1B8B8AA7C7D86AE05050509AE4E
        5873BA090807070904B0A10809BA937C7DAE05433A2FAF5150894A261D34246E
        AD72A1331B45AB7B7CAE050F1441A24D517892382A3EA8AC7272A1351F5C997A
        7AAE0518444498595155B6A9536D9C636B6BA14679B7828183AE051A1A3C47B1
        5151556C74675E5F6464888E8D848081AE0205BBBB48064CB25251515150545A
        6061686A716F7F9FB90205BBBBBB493EB5A79695945651565B569D9A9A9B974B
        090205BBBBBBBB330A42441543B356514F56A03E293624220702051A1A1A1A1A
        1A3030313D3E9E56515690353030301A050205BBBBBBBB1ABBBB03420F3C3BB4
        5656A33325211E1C050205BBBBBBBB1ABBBBBBBB191A1615A457A53337271220
        050205BBBBBBBB1ABBBBBBBBBB1A170F0EA69133382B28230502051A1A1A1A1A
        1A1A1A1A1A1A1A1A313232321A1A1A1A050205BBBBBBBB1ABBBBBBBBBB1ABB49
        180C3B1A3F2E2C13050205BBBBBBBB1ABBBBBBBBBB1ABBBBBB19171A1140392D
        050205BCBCBCBC1ABCBCBCBCBC1ABCBCBCBCBC1ABCBCBCBC0502050B0B0B0B0B
        0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B05020D10101010101010101010101010
        10101010101010100D02020D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
        0202020202020202020202020202020202020202020202020202}
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 688
    Top = 14
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Color = 4707838
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
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
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
end
