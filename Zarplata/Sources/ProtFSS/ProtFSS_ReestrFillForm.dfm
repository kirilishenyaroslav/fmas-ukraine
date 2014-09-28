object ReestrFillForm: TReestrFillForm
  Left = 181
  Top = 410
  Width = 1025
  Height = 381
  Caption = #1047#1072#1087#1086#1074#1085#1080#1090#1080' '#1088#1077#1108#1089#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 753
    Top = 0
    Height = 319
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 319
    Align = alLeft
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 751
      Height = 49
      Align = alTop
      TabOrder = 0
      object dxBarDockControl1: TdxBarDockControl
        Left = 1
        Top = 1
        Width = 749
        Height = 46
        Align = dalTop
        BarManager = dxBarManager1
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 50
      Width = 751
      Height = 31
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 277
        Height = 13
        Caption = #1051#1110#1082#1072#1088'. '#1083#1080#1089#1090#1080', '#1103#1082#1110' '#1085#1077' '#1091#1074#1110#1081#1096#1083#1080' '#1074' '#1078#1086#1076#1085#1080#1081' '#1088#1077#1108#1089#1090#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object HospListGrid: TcxGrid
      Left = 1
      Top = 81
      Width = 751
      Height = 237
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      PopupMenu = PopupMenu
      TabOrder = 2
      object HospListGridDBTV: TcxGridDBBandedTableView
        OnDblClick = cxGrid1DBBandedTableView1DblClick
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = HospListGridDBTVDBBanded_FAMILIA
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.BandHeaderHeight = 2
        OptionsView.BandHeaders = False
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
        Bands = <
          item
          end
          item
          end
          item
          end>
        object HospListGridDBTVDBBanded_TN: TcxGridDBBandedColumn
          Caption = #1058'.'#1085'.'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 54
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'TN'
        end
        object HospListGridDBTVDBBanded_FAMILIA: TcxGridDBBandedColumn
          Caption = #1055'.'#1030'.'#1041'.'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 261
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'FAMILIA'
        end
        object HospListGridDBTVDBBanded_DATE_BEG: TcxGridDBBandedColumn
          Caption = #1047
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Filtering = False
          Width = 60
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'DATE_BEG'
        end
        object HospListGridDBTVDBBanded_DATE_END: TcxGridDBBandedColumn
          Caption = #1055#1086
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Filtering = False
          Width = 60
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 1
          DataBinding.FieldName = 'DATE_END'
        end
        object HospListGridDBTVDBBanded_SERIA: TcxGridDBBandedColumn
          Caption = #1057#1077#1088#1110#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 63
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'SERIA'
        end
        object HospListGridDBTVDBBanded_NOMER: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 69
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'NOMER'
        end
        object HospListGridDBTVDBBanded_PERCENT: TcxGridDBBandedColumn
          Caption = #1055#1088#1086#1094#1077#1085#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 71
          Position.BandIndex = 2
          Position.ColIndex = 2
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'PERCENT'
        end
        object HospListGridDBTVDBBanded_TITLE: TcxGridDBBandedColumn
          Caption = #1058#1080#1087' '#1093#1074#1086#1088#1086#1073#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Grouping = False
          Width = 174
          Position.BandIndex = 2
          Position.ColIndex = 3
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'TITLE'
        end
        object HospListGridDBTVDBBanded_ID_HOSP: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'ID_HOSP'
        end
      end
      object HospListGridLevel1: TcxGridLevel
        GridView = HospListGridDBTV
      end
    end
  end
  object Panel3: TPanel
    Left = 756
    Top = 0
    Width = 253
    Height = 319
    Align = alClient
    TabOrder = 0
    object RepHospGrid: TcxGrid
      Left = 1
      Top = 57
      Width = 251
      Height = 261
      Align = alClient
      TabOrder = 0
      object RepHospGridDBTV: TcxGridDBBandedTableView
        OnDblClick = RepHospGridDBTVDblClick
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.BandHeaders = False
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
        Bands = <
          item
          end
          item
          end
          item
          end>
        object RepHospGridDBBandedTableView_TN: TcxGridDBBandedColumn
          Caption = #1058'.'#1085'.'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          SortOrder = soAscending
          Width = 58
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'TN'
        end
        object RepHospGridDBBandedTableView_FAMILIA: TcxGridDBBandedColumn
          Caption = #1055'.'#1030'.'#1041'.'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 277
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'FAMILIA'
        end
        object RepHospGridDBBandedTableView_DATE_BEG: TcxGridDBBandedColumn
          Caption = #1047
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Filtering = False
          Width = 61
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'DATE_BEG'
        end
        object RepHospGridDBBandedTableView_DATE_END: TcxGridDBBandedColumn
          Caption = #1055#1086
          PropertiesClassName = 'TcxTextEditProperties'
          Options.Filtering = False
          Width = 61
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 1
          DataBinding.FieldName = 'DATE_END'
        end
        object RepHospGridDBTV_SERIA: TcxGridDBBandedColumn
          Caption = #1057#1077#1088#1110#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 61
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'SERIA'
        end
        object RepHospGridDBBandedTableView_NOMER: TcxGridDBBandedColumn
          Caption = #1053#1086#1084#1077#1088
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 64
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.LineCount = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'NOMER'
        end
      end
      object RepHospGridLevel1: TcxGridLevel
        GridView = RepHospGridDBTV
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 251
      Height = 56
      Align = alTop
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 96
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1088#1077#1108#1089#1090#1088#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 232
        Top = 8
        Width = 35
        Height = 13
        Caption = #1044#1072#1090#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 32
        Width = 173
        Height = 13
        Caption = #1051#1080#1082#1072#1088'. '#1083#1080#1089#1090#1080' '#1094#1100#1086#1075#1086' '#1088#1077#1108#1089#1090#1088#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLabelNumReestr: TcxDBLabel
        Left = 104
        Top = 8
        Width = 102
        Height = 17
        DataBinding.DataField = 'NUM_REESTR'
        DataBinding.DataSource = DM.DSource1
        TabOrder = 0
      end
      object DBLabelDateReestr: TcxDBLabel
        Left = 272
        Top = 8
        Width = 103
        Height = 17
        DataBinding.DataField = 'DATE_REESTR'
        DataBinding.DataSource = DM.DSource1
        TabOrder = 1
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 319
    Width = 1009
    Height = 24
    Align = alBottom
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 3
      Width = 101
      Height = 13
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1083#1080#1089#1090#1110#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NumHosps: TLabel
      Left = 112
      Top = 3
      Width = 61
      Height = 13
      Caption = 'NumHosps'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
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
        Caption = 'Custom 1'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 1
        DockedTop = 0
        FloatLeft = 577
        FloatTop = 359
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton3
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
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
    Left = 488
    Top = 8
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1044#1086#1082#1083#1072#1076#1085#1086
      Category = 0
      Hint = #1044#1086#1082#1083#1072#1076#1085#1086
      Visible = ivNever
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00D1CFD300FF00FF00ADA7A900C4C1C200ADA5A700BAB6B7009C9395009A91
        93009A909100AFA4A400988F8F00ABA1A100AFA7A700ABA3A300AAA3A300FEFB
        FB00FFFEFE009A908F0090817F0095827F0093827F00D1C4C200DED1CF00F6EB
        E90096848000A7280600A9290700A7290700AD2E0A00AA2E0A00AA2E0B009886
        8100C4AFA900C1AFAA00AD300B00AD310B00AB310C00AA300C00AF340D00AB32
        0D00AF350E00AD330E00AF360F00AD350F00AF361100AF371100AF381200B43A
        1300AF3C1600B79E9600D1C1BC00B53F1400B7411600B6411600B13C1500B540
        1600B6411700C99E8E00BC9A8E00C2A19500C2AAA1009A88820097868000DDCE
        C900E7D9D400EEE5E200BB4A1C00BA491C00C15D3500C25F3800B0573500C667
        3F00B05A3800C7684000B05B3900B05D3D00B05E3E00B1604100B1674900C278
        5900D7A79300D8AA9700D7A99600CCA18F00C69D8C00C9A08F00D7AB9A00C09A
        8A00DAB1A000DEB5A400C6A19300E0BAAA00BDB0AB00F6EAE500F3E7E200E7DD
        D900BC4C1C00BC4D1E00BD4E1F00C1542100C0532200C1552300C4633A00C465
        3C00C96D4300CB704800CE775200C6775400CF7F5B00D3846000D3866400CE88
        6800D78F6E00CC886A00D4907200C7896E00D79A7F00D1A49000D8AA9600D3A7
        9300D7AA9700D8AB9800D8AD9A00C7A08E00D9AF9C00DAB19E00D9B09D00BD9C
        8E00E0BBAA00B69C9100F3E2DA00EBE2DE00F8EFEB00C2572300C2592500C45B
        2600C75F2900C45B2800C45C2800CB6C3E00CF794F00E0A48600EED7CB00EFDD
        D400F0E0D800C9632800C7632C00C9662E00CB682F00D88C6000F3E5DD00F0E2
        DA00F4E9E300F0E7E200CF6F3200CC6A3100CF6F3500CE6E3500D1753C00CF73
        3D00F6EAE300D3763800CF753700D3773B00D17A4200E2A98400E9B69300E9BB
        9C00F3D4C000F0E2D900D47D3C00D8824000D8824100D7804100D9894E00E09E
        6D00F0D3BD00F0D4C000F4DAC600D9864100D9874400DA894A00DA8F5200E9B7
        8F00DE904C00E2975200E2964C00F3CFAB00FEFAF600E5A45F00EABA8700F0CC
        A500F0D1AF00F0D1B100F4D9BB00EAAF6C00EBB47000F6DDC000F4D7B100F6DE
        C000F8E2C600FAE7CB00FFFEFB00FEFFFF00F6FEFF00FAFEFF00F0F6FA00E2E7
        EB00EEF4FA00EFF4FA00E7EAEE00D1D3D700E9EAEF00E2E2E500D9D9DA000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000030303030303
        03030303793D817703030303030303030303030303030303030303585E100C3F
        3B030303030303030303030303030303030358170507060C217D030303030303
        0303030303030303037C18D8023E33040A405703030303030303030303030303
        8061D6D7513030500609215603030303030303030303037E43D0D36D1B1D1C1C
        4E0E0916560303030303030303037B9BCFCE71386C6F6F6C314C040916560303
        03030303037B60CDCD7427277001016E26244F06081A5603030303037C190101
        7226291F69010146202D254A0B081659030303535F01018F35312F1F49010147
        202D2D24480D0914590352AB0101A96763453A284B010147202D2D2D1E4D0613
        1555820101BEA68A8C6764356B010147202D2D2D2B2E8304133C5D0101BEB09C
        9D948B628E010168202D2D2D263222070F5C52840101C3AEA39E96879701016A
        2A2C2D292675D50523520353A20101C2B6ACA4A0A8B3B28D36392C2973D1D834
        5403030353980101C4BAADAFA59F958866443776D2D44154030303030354AB01
        01C7BBB5B8B4AAA189658FCED0427A0303030303030354990101CABCC00101B1
        93A7CDCF857C03030303030303030353920101C9C5C8BDB7B901CD607E030303
        030303030303030352910101CBC6BFC101019A7C030303030303030303030303
        0352910101CCBE0101867E030303030303030303030303030303529201010101
        865A0303030303030303030303030303030303529011129A7F03030303030303
        030303030303030303030303785B5D7803030303030303030303}
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1091#1089#1110' '#1083#1080#1089#1090#1080' '#1074' '#1088#1077#1108#1089#1090#1088
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1091#1089#1110' '#1083#1080#1089#1090#1080' '#1074' '#1088#1077#1108#1089#1090#1088
      Visible = ivAlways
      OnClick = dxBarLargeButton2Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B000000010000000000000A097D007978
        AB006E6CA3009A99B8009998B600B5B0B800FF00FF00B8B5B600C5C1C100DACF
        C000C6BFB100DED7BF00D5D1C000CBC9BB00DDDAC000CFCFC00003580000046F
        0100004E0000004C00000048000001560100047D030000510100005001000158
        03000154020002570400035A0500057B07000881090001570400015505000883
        0D001384190000580600015607000A98150017831F0016801E0018842000004A
        07000F951A001397200013911F0016821F00188422001987230012A724001291
        1F00198926001C8A28001E912B0013A3250014902400188E27001CA12E001F93
        2E0019AF30001EB5370028A63B0028A53D0022B83F0023BB410027C0460027B2
        440000410F000343120029C44B002AC14C002FCA55002EC653002DBA510034CE
        5C000051160035CF5F0035CE5E0037D3630035CC5F0035CB5F0038D4640038D0
        64003BD468003FDE6F003EDA6E003DD76C003CD36A003ED76D003DD56B003FD8
        6E003CD46C003BD16B0042DE750041DA720043E2790048EB800000BFFF0000B0
        FF0000A9FF000098EB000093E2000097F3000091E700048CE300007FE7000088
        FF000086FA000081F8000079FE000074FF00006EFC0000439F000452BD000042
        A900075DE1000056FA000042C500004FF8000041D4000041CF00004AFE000042
        E3000034B8000037B6003660C0000044FF000042EF000041EB000036FF000035
        E9000031FF00002EFF00002FFF000023BD000025FF000020C4000021FF000023
        FF00001BFF00001AF800001AF7000019F600001AF4000018F300001AF0000017
        EA000017E7000016E6000016E3000013B1000013E1000014DD000011D7000012
        D7000013D7000011D4000011D300000FCA005962BF00000BD300000DCC00000D
        CB00000EC900000DC600000CC500000DC400000AC000000AB800000AB7000009
        B600000CB2000009AF000008A7000008C1000007B4000008B0000007AD000005
        A7000006A7000006A6000007A6000006A5000006A4000007A4000005A1000004
        A00000049E000106AD00020795005F63B6000002A00000039C00000399000002
        9800000397000003960000029300000393000001920000009100000291000001
        8C0000008600000186000102870001018600010184000204910002038A000202
        89000203890002038800020286000202840003058C0004058600060688000607
        8800070A8E0007078800070787000A0A8A000B0B8A000D0D8A000F0F8B001B1B
        8E00A5A5B8000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000060606060606
        0606060606D9D7D4060606060606060606060606060606060606D5DBDF0F02AD
        D0060606060606060606060606060606D5DD040C0D01D5A08FD2060606060606
        060606060606D8DEE20E07BDD6BBBEC09D96D2060606060606060606DCE0080B
        059ECFC69FA4A8B8C8A598D306060606060606000A0903DABC888A8C949BA3A9
        B6C4A8A1D106060606060606E17C7275787684888E949CA3A8B8C4AFA6CC0606
        06060670676A696D17176F83888D949BA3A8B5C5B2AECC060606067B6360651C
        322F127183898C9399A3A8B3C5BAB1CC0606060685641C2D5B5A27127784898C
        9399A3A7B2C5C2BFCD060606061C2E565E5E4F26137482898B9299A3A7B2C3C8
        C7CE06061C335D5C5759544E28147F82898C9299A2A7B2C2C9CA061C395D5C57
        5758524D4C34137E82898C929AA3A7B0C1CB153D5F5F595552514B4B53503C17
        7982898C9197A2ACB7061C1C1C3748554C49411C1C1C1C1A187D808690ABB906
        06060606061C224D474636146662696C6E7381AAB40606060606060606061C47
        45442C427A68616B95B4B406060606060606060606062438403F2C4A0687B4B4
        0606060606060606060606060606061C3E3B2B1C060606060606060606060606
        0606060606060619313A351C0606060606060606060606060606060606060606
        1C2A30212006060606060606060606060606060606060606061C1E251D1B0606
        0606060606060606060606060606060606061C1C161110190606060606060606
        0606060606060606060606061C1C1C2329431F06060606060606}
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080' '#1091#1089#1110' '#1083#1080#1089#1090#1080' '#1079' '#1088#1077#1108#1089#1090#1088#1091
      Category = 0
      Hint = #1042#1080#1083#1091#1095#1080#1090#1080' '#1091#1089#1110' '#1083#1080#1089#1090#1080' '#1079' '#1088#1077#1108#1089#1090#1088#1091
      Visible = ivAlways
      OnClick = dxBarLargeButton3Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B000000010000000000000A097D007978
        AB006E6CA3009A99B8009998B600B5B0B800FF00FF00B8B5B600C5C1C100DACF
        C000C6BFB100DED7BF00D5D1C000CBC9BB00DDDAC000CFCFC000036800000362
        000003580000046F0100035D010000480000047D030008730700076907000158
        030002570400035A0500057B070008810900015704000155050008830D001384
        190000580600015607000A9815001C8A24001D8B2500004A0700016009000156
        090002600A000F951A001397200013911F001A8723001B8924001D8B27001E8E
        280012A7240012911F001E902B002398300021912D0013A32500149024001CA1
        2E00249A340019AF30001EB537002DAD41002DAC420022B83F00015D140023BB
        410027C0460027B2440000410F000343120029C44B002AC14C00016E1C002FCA
        55002EC6530034CE5C000051160035CF5F0035CE5E0037D3630035CC5F0035CB
        5F0038D4640038D064003BD468003FDE6F003EDA6E003DD76C003CD36A003ED7
        6D003DD56B003FD86E003CD46C003BD16B0042DE750041DA720043E2790048EB
        8000004E270000492500004E2E0001533000007B4C00017B54000089840000A9
        B50000454A00008AB20000485E000055730000B4FF0000B0FF00004266000041
        65000E569A004A739C000053AC00005BC600004CB4000047A5000048AF00004F
        CB00004DD4000040B500003CA600003EB7000051FF000045F4000037B6000031
        B100003EFF000040FF00002AB8000030FF000035FF00002AFF00002CFF00002E
        FF00002AF4000028F3000023BD000025FF00001BA600001FFF000021FF000023
        FF000021FE00001BFF00001DFF00001CFE00001CFC00001AF7000019F4000018
        F3000019F200001AF0000018EF000018ED000017EA000016E3000016E2000013
        E1000015E1000015E0000014DD000011D7000013D7000011D4000011D1000011
        D000000FCF00000FCA005962BF00000BD300000DCC00000DCB00000EC900000D
        C600000CC500000DC400000DC200000DC100000AC000000CBF00000AB800000A
        B7000009B6000009B5000009B2000009AF000008A7005C5E7D000008C1000007
        B4000007AD000005A7000006A7000007A6000006A4000007A4000005A1000004
        A00000049E0000049D000106AD00020795005F63B6000002A00000039C000003
        9900000298000003970000039600000293000003930000019200000091000002
        910000018C000000860000018600010287000101860001018400020491000203
        8A00020289000203890002038800020286000202840003058C00040586000606
        880006078800070A8E0007078800070787000A0A8A000B0B8A000D0D8A000F0F
        8B00A5A5B8000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000060606060606
        0606060606EAE8E5060606060606060606060606060606060606E6ECF00F02C0
        E1060606060606060606060606060606E6EE040C0D01E6AE99E3060606060606
        060606060606E9EFF20E07CEE7CCCFD1ABA1E3060606060606060606EDF1080B
        05ACE0D7ADB2B9C8D9B3A5E406060606060606000A0903EBCD9093979FA7B1BA
        C6D5B9AFE206060606060606BF7372787A7F868D969DA3AAB7BCCBD4B6DD0606
        0606061E4527222840656C7D87959CA3A9B5BCC8C4C1DD060606068062481912
        13161029718B949CA3A9B5BBD6CAC3DD060606068C7569671A1C241D116A8A8F
        9AA2A8B4C4D6D3D0DE06060606796E6E681F20322B117088929AA0A7B8C4D4D9
        D8DF06060606816E6F6614373B33197B88929AA0B0B8C4D3DADB060606060684
        6B6B2A2C3C3F176482899298A6B1B8C2D2DC0606060606068E6B4C2D41423923
        768289919EA4B0BEC706060606060606068E442D46474A186D7E83859BBDC906
        060606060606060606061538494A4F216374777CC506060606060606061B1B1B
        1B1B1B434B4E57431B1B1B1B1B0606060606060606061B3D52554D4D5354575B
        61613E1B06060606060606060606061B354E4F545A59595E5F3A1B0606060606
        06060606060606061B2650565B595E5F361B0606060606060606060606060606
        061B2551606058301B06060606060606060606060606060606061B2E5C5D2F1B
        060606060606060606060606060606060606061B31341B060606060606060606
        0606060606060606060606061B1B060606060606060606060606}
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivNever
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 537
    Top = 10
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
  object PopupMenu: TPopupMenu
    Alignment = paCenter
    Left = 585
    Top = 9
    object AddAllList: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1091#1089#1110#1093
      OnClick = AddAllListClick
    end
    object RemoveAllList: TMenuItem
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080' '#1091#1089#1110#1093
      OnClick = RemoveAllListClick
    end
  end
end
