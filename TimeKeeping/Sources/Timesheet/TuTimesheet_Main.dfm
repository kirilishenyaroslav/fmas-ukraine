object FormTimesheet_Main: TFormTimesheet_Main
  Left = 281
  Top = 69
  Width = 979
  Height = 784
  Caption = #1058#1072#1073#1077#1083#1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 237
    Top = 46
    Width = 0
    Height = 547
  end
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 229
    Height = 547
    Cursor = crHandPoint
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvNone
    Color = 16776176
    Ctl3D = True
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object BarDockLocate: TdxBarDockControl
      Left = 1
      Top = 541
      Width = 227
      Height = 5
      Align = dalBottom
      BarManager = BarManager
    end
    object dxBarDockControl2: TdxBarDockControl
      Left = 1
      Top = 1
      Width = 227
      Height = 22
      Align = dalTop
      AllowDocking = False
      BarManager = BarManager
    end
    object cxGroupBox2: TcxGroupBox
      Left = 1
      Top = 342
      Width = 227
      Height = 199
      Align = alBottom
      Alignment = alTopLeft
      Caption = #1058#1072#1073#1077#1083#1103
      CaptionBkColor = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object cxGrid2: TcxGrid
        Left = 2
        Top = 15
        Width = 223
        Height = 182
        Align = alBottom
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedItemChanged = GridPeriodTypeDBTableView1FocusedItemChanged
          OnFocusedRecordChanged = GridPeriodTypeDBTableView1FocusedRecordChanged
          OptionsSelection.HideFocusRect = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLineColor = clBlack
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.HeaderAutoHeight = True
          Styles.Background = StyleBackGround
          Styles.Content = StyleBackGround
          Styles.ContentEven = StyleBackGround
          Styles.ContentOdd = StyleBackGround
          Styles.FilterBox = StyleBackGround
          Styles.Footer = StyleBackGround
          Styles.Group = StyleBackGround
          Styles.GroupByBox = StyleBackGround
          Styles.Header = StyleBackGround
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1053#1072#1079#1074#1072' '#1096#1072#1073#1083#1086#1085#1091
            PropertiesClassName = 'TcxMemoProperties'
            Options.Editing = False
            Options.Filtering = False
            Options.Grouping = False
            Options.Moving = False
            Options.Sorting = False
            Styles.Content = StyleTypeTshCon
            Width = 206
            DataBinding.FieldName = 'NAME_TIMESHEET_TYPE'
          end
          object cxGridDBTableView1DBColumn1: TcxGridDBColumn
            Caption = #1055#1086' '
            Visible = False
            GroupIndex = 0
            Options.Sorting = False
            SortOrder = soAscending
            Styles.Content = StyleTypeTshCon
            DataBinding.FieldName = 'DAY_END_P'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object GridTempletOrPeriod: TcxGrid
      Left = 1
      Top = 23
      Width = 227
      Height = 319
      Align = alClient
      TabOrder = 3
      object GridTempletOrPeriodDBTableView1: TcxGridDBBandedTableView
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
        Styles.Background = StyleBackGround
        Styles.ContentEven = StyleDM.cxStyle5
        Styles.ContentOdd = StyleDM.cxStyle7
        Styles.Header = StyleDM.cxStyle18
        Bands = <
          item
          end>
        object GridTempletOrPeriodDBTableView1DBBandedColumn1: TcxGridDBBandedColumn
          Caption = #1053#1072#1079#1074#1072' '
          PropertiesClassName = 'TcxMemoProperties'
          Options.Editing = False
          SortOrder = soAscending
          Width = 214
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'NAME'
        end
        object GridTempletOrPeriodDBTableView1DBBandedColumn2: TcxGridDBBandedColumn
          Caption = '!'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.AllowGrayed = True
          Properties.DisplayChecked = 'T'
          Properties.DisplayUnchecked = 'F'
          Properties.Glyph.Data = {
            B60D0000424DB60D000000000000360000002800000030000000180000000100
            180000000000800D0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF001B80001B800019
            7A00187400176E00166800146200146000146000146000146000146000146000
            146000146000146000146000145E001256001256FF00FFFF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF00209C001E920021A000209C001F96001E90001D8A001B84001B82
            001B82001B82001B82001B82001B82001B82001B82001B82001B84001B840017
            6E001150001256FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00209C002BD0002DDA002C
            D4002BCE002ACA0029C60028C20027BE0027BC0027BC0027BC0027BC0027BC00
            27BC0027BC0027BC0027BC0028C00025B400176E001256FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF0025B2002FE2002FE2002DDA002CD6002CD2002BCE002AC80029C4
            0028C00027BC0027BC0027BC0027BC0027BC0027BC0027BC0027BC0028C00028
            C0001B8400145EFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0027BA0030E6002FE4002E
            DE002DDA002CD4002CD2002ACC002AC80029C40027BE0027BC0027BA0027BA00
            27BA0027BA0027BA0027BA0027BC0027BC001B84001460FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF0028C20233EC0233EA0231E40231E00230DC002DD8002CD2002BCE
            748BE2FFFFFFFFFFFFBEC8EE0027BA0027BA0027BA0027BA0027BA0027BC0027
            BC001B82001460FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0029C60A3AF00A3AF00837
            EA0434E60231E20230DC002DD8002CD4748BE5FFFFFFFFFFFFBEC9F00028C000
            27BA0027BA0027BA0027BA0027BC0027BC001B82001460FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF0029C61543F31544F4103EF00A39EC0634E80231E40230DE002DDA
            002CD6002CD2002BCE002AC80029C40028C00027BC0027BA0027BA0027BC0027
            BC001B82001460FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0029C62651F42652F61B48
            F40E3DF20A39EE0434E80231E4002FE04869E6FFFFFFFFFFFF748BE4002ACA00
            2AC80028C20027BC0027BA0027BC0027BC001B82001460FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF0029C63E63F53E64F62651F4103EF2103EF20838F00233EC0030E6
            486AEAFFFFFFFFFFFF9BADEF002CD2002ACC002AC80029C40028C00027BE0027
            BC001B82001460FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0029C65475F65476F7355C
            F41543F31543F30A3AF20234F00031EE486AEEFFFFFFFFFFFF9BADF1002DD800
            2CD2002BCE002ACA0029C60029C40028C0001B84001460FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF0029C6607FF76281F83E63F51B48F41946F40E3DF20436F20032F2
            486CF4FFFFFFFFFFFF9BAEF4002EDC002DD8002CD4002BD0002ACC002ACA0029
            C4001D8C001668FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0029C66885F76B89F84469
            F51F4BF41D49F4103EF20436F20234F2486CF6FFFFFFFFFFFF9BAEF5002FE200
            2EDE002DDA002CD6002BD0002BD0002ACA001E92001872FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF0029C66E8AF7718DF94B6EF6234DF4254FF41543F30838F20436F2
            7590F8FFFFFFFFFFFF9BAFF80031EA002FE4002FE0002EDC002DD8002CD6002B
            D000209A001A7CFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0029C6718DF77792F95475
            F62A54F42F58F4214DF41442F20C3CF27892F8FFFFFFFFFFFFBFCBFC0234F000
            31EA0030E6002FE2002EDE002EDC002CD60022A2001B84FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF0029C67690F78099F95F7EF6315AF43F65F5355CF42651F41B48F4
            7F98F8FFFFFFFFFFFFC0CCFC0436F20234F00233EC0030E8002FE4002FE2002E
            DC0023AA001E8EFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0029C67993F7889FF9708B
            F7355CF43F65F5385FF42E56F42651F4859DF9FFFFFFFFFFFFC2CEFC0A3AF204
            36F20234F20031EE0031EA0030E6002FE20025B4001F96FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF0029C67791F78DA4F9889FF95475F64B6EF64368F5385FF4315AF4
            2852F4214DF42852F41B48F4103EF20838F20436F20234F20032F00031EE0030
            E80026B800219EFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF0029C66E8AF789A0F995AA
            F98FA5F9879EF98098F8748FF76885F75A7AF64B6EF63C62F52852F41745F40C
            3CF20436F20234F20032F20033F40031EE0028C20023A8FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FF002AC85D7DF87993FA89A0F991A7F991A7F98DA4F9859DF97A95F9
            6D89F85C7CF8466BF6315BF61D4AF60E3EF40637F40235F40033F40033F60033
            F6002ACA0025B0FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF002AC80030E65C7CF86D89
            F77791F77A94F87993F7738EF76B88F75F7EF65072F63F65F52C55F41946F40E
            3DF20636F20234F20032F20033F40031EA0027BE0025B0FF00FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00FFFF00FF0029C60029C60029C60029C60029C60029C60029C60029C6
            0029C60029C60029C60029C60029C60029C60029C6022BC60029C60029C60027
            BA0027BAFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Properties.GlyphCount = 2
          Properties.ValueChecked = 'F'
          Properties.ValueGrayed = ''
          Properties.ValueUnchecked = 'T'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 30
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'IS_ACT_TSH'
        end
      end
      object GridTempletOrPeriodLevel1: TcxGridLevel
        GridView = GridTempletOrPeriodDBTableView1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 593
    Width = 971
    Height = 144
    Align = alBottom
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    object StatusBar2: TdxStatusBar
      Left = 1
      Top = 19
      Width = 965
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 30
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = 15660535
          Width = 450
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 70
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clInactiveBorder
          Text = #1047#1072' '#1088#1077#1078#1080#1084#1086#1084
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clInactiveBorder
          Text = #1047#1072' '#1083#1102#1076#1080#1085#1086#1102
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clInactiveBorder
          Text = #1047#1072' '#1088#1077#1078#1080#1084#1086#1084
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clInactiveBorder
          PanelStyle.EllipsisType = dxetSmartPath
          Text = #1047#1072' '#1083#1102#1076#1080#1085#1086#1102
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = 14609886
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clInactiveBorder
          Text = #1047#1072' '#1088#1077#1078#1080#1084#1086#1084
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clInactiveBorder
          Text = #1047#1072' '#1083#1102#1076#1080#1085#1086#1102
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 112
        end>
      PaintStyle = stpsUseLookAndFeel
      LookAndFeel.NativeStyle = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Color = 15532031
    end
    object StatusBar3: TdxStatusBar
      Left = 1
      Top = 39
      Width = 965
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 30
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clMenuBar
          Width = 450
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clMoneyGreen
          Visible = False
          Width = 70
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          PanelStyle.Color = clInactiveBorder
          Text = #1059#1089#1100#1086#1075#1086':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = []
          PanelStyle.ParentFont = False
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = []
          PanelStyle.ParentFont = False
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = []
          PanelStyle.ParentFont = False
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          PanelStyle.EllipsisType = dxetSmartPath
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = []
          PanelStyle.ParentFont = False
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Bevel = dxpbRaised
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = []
          PanelStyle.ParentFont = False
          Bevel = dxpbRaised
          BiDiMode = bdRightToLeftNoAlign
          ParentBiDiMode = False
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = []
          PanelStyle.ParentFont = False
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clInactiveBorder
          Text = #1055#1086#1095#1072#1090#1086#1082' '#1088#1086#1073#1086#1090#1080
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end>
      PaintStyle = stpsUseLookAndFeel
      LookAndFeel.NativeStyle = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Color = 15532031
    end
    object StatusBar5: TdxStatusBar
      Left = 1
      Top = 79
      Width = 965
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 30
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clMenuBar
          Width = 450
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clMoneyGreen
          Visible = False
          Width = 70
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          PanelStyle.Color = clInactiveBorder
          Text = #1053#1110#1095#1085#1110':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clInactiveBorder
          Text = #1059#1089#1100#1086#1075#1086' '#1075#1086#1076#1080#1085
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end>
      PaintStyle = stpsUseLookAndFeel
      LookAndFeel.NativeStyle = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Color = 15532031
    end
    object StatusBar4: TdxStatusBar
      Left = 1
      Top = 59
      Width = 965
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 30
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = 15660535
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 450
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clMoneyGreen
          Visible = False
          Width = 70
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          PanelStyle.Color = clInactiveBorder
          Text = #1057#1074#1103#1090#1082#1086#1074#1110':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clInactiveBorder
          PanelStyle.EllipsisType = dxetSmartPath
          Text = #1050#1110#1085#1077#1094#1100' '#1088#1086#1073#1086#1090#1080
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end>
      PaintStyle = stpsUseLookAndFeel
      LookAndFeel.NativeStyle = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Color = 15532031
    end
    object StatusBar1: TdxStatusBar
      Left = 1
      Top = -1
      Width = 965
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 30
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clMenuBar
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 450
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 152
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clMoneyGreen
          Text = #1059' '#1076#1085#1103#1093
          Width = 150
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clMoneyGreen
          Text = #1059' '#1075#1086#1076#1080#1085#1072#1093
          Width = 150
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clMoneyGreen
          PanelStyle.Font.Charset = DEFAULT_CHARSET
          PanelStyle.Font.Color = clWindowText
          PanelStyle.Font.Height = -11
          PanelStyle.Font.Name = 'MS Sans Serif'
          PanelStyle.Font.Style = []
          PanelStyle.ParentFont = False
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 150
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clBtnFace
          PanelStyle.EllipsisType = dxetSmartPath
          Visible = False
          Width = 112
        end>
      PaintStyle = stpsUseLookAndFeel
      LookAndFeel.NativeStyle = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Color = 15532031
    end
    object StatusBar6: TdxStatusBar
      Left = 1
      Top = 99
      Width = 965
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 30
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = 15660535
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 450
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clMoneyGreen
          Visible = False
          Width = 70
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          PanelStyle.Color = clInactiveBorder
          Text = #1053#1110#1095#1085#1110' '#1091' '#1089#1074#1103#1090#1072':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clInactiveBorder
          Text = #1053#1110#1095#1085#1080#1093' '#1075#1086#1076#1080#1085
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end>
      PaintStyle = stpsUseLookAndFeel
      LookAndFeel.NativeStyle = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Color = 15532031
    end
    object StatusBar7: TdxStatusBar
      Left = 1
      Top = 119
      Width = 965
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 30
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clMenuBar
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          Width = 450
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          Visible = False
          Width = 70
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taRightJustify
          PanelStyle.Color = clInactiveBorder
          Text = #1059' '#1074#1080#1093#1110#1076#1085#1110':'
          Width = 80
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Alignment = taCenter
          PanelStyle.Color = clWhite
          PanelStyle.EllipsisType = dxetSmartPath
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clMenuBar
          Visible = False
          Width = 20
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clWhite
          Width = 74
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          PanelStyle.Color = clMenuBar
          Text = #1053#1072#1076#1091#1088#1086#1095#1085#1110
          Width = 90
        end
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
          Visible = False
          Width = 20
        end>
      PaintStyle = stpsUseLookAndFeel
      LookAndFeel.NativeStyle = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Color = 15532031
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 737
    Width = 971
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Width = 450
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Panel4: TPanel
    Left = 237
    Top = 46
    Width = 734
    Height = 547
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 7
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 732
      Height = 545
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TabPosition = tpBottom
      OnExit = PageControl1Exit
      object TabSheet1: TTabSheet
        Caption = #1055#1077#1088#1096#1072' '#1089#1090#1086#1088#1110#1085#1082#1072
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 724
          Height = 519
          Align = alClient
          Caption = 'Panel3'
          TabOrder = 0
          object GridHeader: TcxGrid
            Left = 1
            Top = 25
            Width = 722
            Height = 96
            Align = alTop
            Enabled = False
            TabOrder = 0
            object GridHeaderBandedTableView1: TcxGridBandedTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsBehavior.FocusCellOnCycle = True
              OptionsSelection.InvertSelect = False
              OptionsSelection.UnselectFocusedRecordOnExit = False
              OptionsView.GroupByBox = False
              OptionsView.BandHeaders = False
              Styles.Header = StyleDM.cxStyle25
              Styles.OnGetHeaderStyle = GridHeaderBandedTableView1StylesGetHeaderStyle
              Styles.BandHeader = StyleDM.cxStyle15
              Bands = <
                item
                  Width = 300
                end
                item
                  Width = 450
                end
                item
                  Width = 250
                end>
              object GridColTN: TcxGridBandedColumn
                Caption = #1058#1072#1073#1077#1083#1100#1085#1080#1081' '#1085#1086#1084#1077#1088
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 56
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.LineCount = 4
                Position.RowIndex = 1
              end
              object GridColFio: TcxGridBandedColumn
                Caption = #1055'. '#1030'. '#1041'.'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                SortOrder = soDescending
                Styles.Header = StyleDM.cxStyle18
                Width = 206
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.LineCount = 4
                Position.RowIndex = 1
              end
              object GridHeaderBandedTableView1BandedColumn3: TcxGridBandedColumn
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 31
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
                IsCaptionAssigned = True
              end
              object GridHeaderBandedTableView1BandedColumn5: TcxGridBandedColumn
                Caption = #1042#1110#1076#1084#1110#1090#1082#1080' '#1087#1088#1086' '#1103#1074#1082#1080' '#1090#1072' '#1085#1077#1103#1074#1082#1080' '#1079#1072' '#1095#1080#1089#1083#1072#1084#1080' '#1084#1110#1089#1103#1094#1103' ('#1075#1086#1076#1080#1085')'
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle11
                Width = 67
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object Col1: TcxGridBandedColumn
                Caption = '1'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col2: TcxGridBandedColumn
                Caption = '2'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col30: TcxGridBandedColumn
                Caption = '30'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 14
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col3: TcxGridBandedColumn
                Caption = '3'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col4: TcxGridBandedColumn
                Caption = '4'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col5: TcxGridBandedColumn
                Caption = '5'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 25
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col6: TcxGridBandedColumn
                Caption = '6'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col7: TcxGridBandedColumn
                Caption = '7'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col8: TcxGridBandedColumn
                Caption = '8'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col9: TcxGridBandedColumn
                Caption = '9'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 25
                Position.BandIndex = 1
                Position.ColIndex = 8
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col10: TcxGridBandedColumn
                Caption = '10'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 9
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col11: TcxGridBandedColumn
                Caption = '11'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 27
                Position.BandIndex = 1
                Position.ColIndex = 10
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col12: TcxGridBandedColumn
                Caption = '12'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 11
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col15: TcxGridBandedColumn
                Caption = '15'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 14
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object ColX: TcxGridBandedColumn
                Caption = 'X'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 15
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col17: TcxGridBandedColumn
                Caption = '17'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col20: TcxGridBandedColumn
                Caption = '20'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 25
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col21: TcxGridBandedColumn
                Caption = '21'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col19: TcxGridBandedColumn
                Caption = '19'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col18: TcxGridBandedColumn
                Caption = '18'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col31: TcxGridBandedColumn
                Caption = '31'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 15
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col29: TcxGridBandedColumn
                Caption = '29'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 13
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col16: TcxGridBandedColumn
                Caption = '16'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col14: TcxGridBandedColumn
                Caption = '14'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 13
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col13: TcxGridBandedColumn
                Caption = '13'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 12
                Position.LineCount = 2
                Position.RowIndex = 1
              end
              object Col23: TcxGridBandedColumn
                Caption = '23'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col24: TcxGridBandedColumn
                Caption = '24'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 25
                Position.BandIndex = 1
                Position.ColIndex = 8
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col26: TcxGridBandedColumn
                Caption = '26'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 27
                Position.BandIndex = 1
                Position.ColIndex = 10
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col27: TcxGridBandedColumn
                Caption = '27'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 11
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col25: TcxGridBandedColumn
                Caption = '25'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 9
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col22: TcxGridBandedColumn
                Caption = '22'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object Col28: TcxGridBandedColumn
                Caption = '28'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 26
                Position.BandIndex = 1
                Position.ColIndex = 12
                Position.LineCount = 2
                Position.RowIndex = 2
              end
              object GridHeaderBandedTableView1BandedColumn38: TcxGridBandedColumn
                Caption = #1042#1110#1076#1087#1088#1072#1094#1100#1086#1074#1072#1085#1086' '#1079#1072' '#1084#1110#1089#1103#1094#1100
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object GridHeaderBandedTableView1BandedColumn39: TcxGridBandedColumn
                Caption = #1057#1074#1103#1090#1082#1086#1074#1080#1093
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 38
                Position.BandIndex = 2
                Position.ColIndex = 5
                Position.LineCount = 4
                Position.RowIndex = 1
              end
              object GridHeaderBandedTableView1BandedColumn40: TcxGridBandedColumn
                Caption = #1059' '#1074#1080#1093#1110#1076#1085#1110
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 39
                Position.BandIndex = 2
                Position.ColIndex = 4
                Position.LineCount = 4
                Position.RowIndex = 1
              end
              object GridHeaderBandedTableView1BandedColumn41: TcxGridBandedColumn
                Caption = #1053#1110#1095#1085#1080#1093
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 38
                Position.BandIndex = 2
                Position.ColIndex = 3
                Position.LineCount = 4
                Position.RowIndex = 1
              end
              object GridHeaderBandedTableView1BandedColumn42: TcxGridBandedColumn
                Caption = #1042#1089#1100#1086#1075#1086' '#1075#1086#1076#1080#1085
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 38
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.LineCount = 4
                Position.RowIndex = 1
              end
              object GridHeaderBandedTableView1BandedColumn43: TcxGridBandedColumn
                Caption = #1044#1085#1110#1074
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 39
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.LineCount = 4
                Position.RowIndex = 1
              end
              object GridHeaderBandedTableView1BandedColumn44: TcxGridBandedColumn
                Caption = #1053#1072#1076#1091#1088#1086#1095#1085#1080#1093
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 39
                Position.BandIndex = 2
                Position.ColIndex = 2
                Position.LineCount = 4
                Position.RowIndex = 1
              end
              object GridHeaderBandedTableView1BandedColumn45: TcxGridBandedColumn
                Caption = 'N '#1087'/'#1087
                Options.Filtering = False
                Styles.Header = StyleDM.cxStyle18
                Width = 38
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.LineCount = 4
                Position.RowIndex = 1
              end
            end
            object GridThDBBandedTableView1: TcxGridDBBandedTableView
              OnDblClick = GridThDBBandedTableView1DblClick
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OnFocusedItemChanged = GridThDBBandedTableView1FocusedItemChanged
              OnFocusedRecordChanged = GridThDBBandedTableView1FocusedRecordChanged
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.HideFocusRect = False
              OptionsSelection.HideSelection = True
              OptionsSelection.InvertSelect = False
              OptionsSelection.UnselectFocusedRecordOnExit = False
              OptionsView.GroupByBox = False
              OptionsView.Header = False
              OptionsView.BandHeaders = False
              Styles.Background = StyleBackGround
              Styles.ContentEven = StyleDM.cxStyle5
              Styles.ContentOdd = StyleDM.cxStyle7
              Styles.Selection = StyleDM.cxStyle24
              Styles.OnGetContentStyle = GridThDBBandedTableView1StylesGetContentStyle
              Bands = <
                item
                  Width = 300
                end
                item
                  Width = 450
                end
                item
                  Width = 250
                end>
              object ColNum: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                SortOrder = soAscending
                Width = 38
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'INDEXNUM'
              end
              object ColTN: TcxGridDBBandedColumn
                Caption = '0'
                Options.Filtering = False
                SortOrder = soDescending
                Width = 57
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'TN'
              end
              object ColName: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxMemoProperties'
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleFio
                Width = 205
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'CAPTION'
              end
              object ColD1: TcxGridDBBandedColumn
                Caption = '1'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
                DataBinding.FieldName = 'D1'
              end
              object ColD2: TcxGridDBBandedColumn
                Caption = '2'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
                DataBinding.FieldName = 'D2'
              end
              object ColD3: TcxGridDBBandedColumn
                Caption = '3'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
                DataBinding.FieldName = 'D3'
              end
              object ColD4: TcxGridDBBandedColumn
                Caption = '4'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
                DataBinding.FieldName = 'D4'
              end
              object ColD6: TcxGridDBBandedColumn
                Caption = '6'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 0
                DataBinding.FieldName = 'D6'
              end
              object ColD7: TcxGridDBBandedColumn
                Caption = '7'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.RowIndex = 0
                DataBinding.FieldName = 'D7'
              end
              object ColD8: TcxGridDBBandedColumn
                Caption = '8'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.RowIndex = 0
                DataBinding.FieldName = 'D8'
              end
              object ColD9: TcxGridDBBandedColumn
                Caption = '9'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 8
                Position.RowIndex = 0
                DataBinding.FieldName = 'D9'
              end
              object ColD10: TcxGridDBBandedColumn
                Caption = '10'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 9
                Position.RowIndex = 0
                DataBinding.FieldName = 'D10'
              end
              object ColD11: TcxGridDBBandedColumn
                Caption = '11'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 10
                Position.RowIndex = 0
                DataBinding.FieldName = 'D11'
              end
              object ColD12: TcxGridDBBandedColumn
                Caption = '12'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 11
                Position.RowIndex = 0
                DataBinding.FieldName = 'D12'
              end
              object ColD13: TcxGridDBBandedColumn
                Caption = '13'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 12
                Position.RowIndex = 0
                DataBinding.FieldName = 'D13'
              end
              object ColD14: TcxGridDBBandedColumn
                Caption = '14'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 13
                Position.RowIndex = 0
                DataBinding.FieldName = 'D14'
              end
              object ColD15: TcxGridDBBandedColumn
                Caption = '15'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 14
                Position.RowIndex = 0
                DataBinding.FieldName = 'D15'
              end
              object ColDX: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                OnGetDisplayText = ColDXGetDisplayText
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 15
                Position.RowIndex = 0
                DataBinding.FieldName = 'DX'
              end
              object ColD16: TcxGridDBBandedColumn
                Caption = '16'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 2
                DataBinding.FieldName = 'D16'
              end
              object ColD17: TcxGridDBBandedColumn
                Caption = '17'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 2
                DataBinding.FieldName = 'D17'
              end
              object ColD18: TcxGridDBBandedColumn
                Caption = '18'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 2
                DataBinding.FieldName = 'D18'
              end
              object ColD19: TcxGridDBBandedColumn
                Caption = '19'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 2
                DataBinding.FieldName = 'D19'
              end
              object ColD20: TcxGridDBBandedColumn
                Caption = '20'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 2
                DataBinding.FieldName = 'D20'
              end
              object ColD21: TcxGridDBBandedColumn
                Caption = '21'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 2
                DataBinding.FieldName = 'D21'
              end
              object ColD22: TcxGridDBBandedColumn
                Caption = '22'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.RowIndex = 2
                DataBinding.FieldName = 'D22'
              end
              object ColD23: TcxGridDBBandedColumn
                Caption = '23'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.RowIndex = 2
                DataBinding.FieldName = 'D23'
              end
              object ColD24: TcxGridDBBandedColumn
                Caption = '24'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 8
                Position.RowIndex = 2
                DataBinding.FieldName = 'D24'
              end
              object ColD25: TcxGridDBBandedColumn
                Caption = '25'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 9
                Position.RowIndex = 2
                DataBinding.FieldName = 'D25'
              end
              object ColD26: TcxGridDBBandedColumn
                Caption = '26'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 10
                Position.RowIndex = 2
                DataBinding.FieldName = 'D26'
              end
              object ColD27: TcxGridDBBandedColumn
                Caption = '27'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 11
                Position.RowIndex = 2
                DataBinding.FieldName = 'D27'
              end
              object ColD28: TcxGridDBBandedColumn
                Caption = '28'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 12
                Position.RowIndex = 2
                DataBinding.FieldName = 'D28'
              end
              object ColD29: TcxGridDBBandedColumn
                Caption = '29'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 13
                Position.RowIndex = 2
                DataBinding.FieldName = 'D29'
              end
              object ColD30: TcxGridDBBandedColumn
                Caption = '30'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 14
                Position.RowIndex = 2
                DataBinding.FieldName = 'D30'
              end
              object ColD5: TcxGridDBBandedColumn
                Caption = '5'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'D5'
              end
              object ColD31: TcxGridDBBandedColumn
                Caption = '31'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 15
                Position.RowIndex = 2
                DataBinding.FieldName = 'D31'
              end
              object ColT1: TcxGridDBBandedColumn
                Caption = '1'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 1
                DataBinding.FieldName = 'T1'
              end
              object ColT5: TcxGridDBBandedColumn
                Caption = '5'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 1
                DataBinding.FieldName = 'T5'
              end
              object ColT2: TcxGridDBBandedColumn
                Caption = '2'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 1
                DataBinding.FieldName = 'T2'
              end
              object ColT3: TcxGridDBBandedColumn
                Caption = '3'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 1
                DataBinding.FieldName = 'T3'
              end
              object ColT4: TcxGridDBBandedColumn
                Caption = '4'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 1
                DataBinding.FieldName = 'T4'
              end
              object ColT6: TcxGridDBBandedColumn
                Caption = '6'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 1
                DataBinding.FieldName = 'T6'
              end
              object ColT7: TcxGridDBBandedColumn
                Caption = '7'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.RowIndex = 1
                DataBinding.FieldName = 'T7'
              end
              object ColT8: TcxGridDBBandedColumn
                Caption = '8'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.RowIndex = 1
                DataBinding.FieldName = 'T8'
              end
              object ColT9: TcxGridDBBandedColumn
                Caption = '9'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 8
                Position.RowIndex = 1
                DataBinding.FieldName = 'T9'
              end
              object ColT10: TcxGridDBBandedColumn
                Caption = '10'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 9
                Position.RowIndex = 1
                DataBinding.FieldName = 'T10'
              end
              object ColT11: TcxGridDBBandedColumn
                Caption = '11'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 10
                Position.RowIndex = 1
                DataBinding.FieldName = 'T11'
              end
              object ColT12: TcxGridDBBandedColumn
                Caption = '12'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 11
                Position.RowIndex = 1
                DataBinding.FieldName = 'T12'
              end
              object ColT13: TcxGridDBBandedColumn
                Caption = '13'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 12
                Position.RowIndex = 1
                DataBinding.FieldName = 'T13'
              end
              object ColT14: TcxGridDBBandedColumn
                Caption = '14'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 13
                Position.RowIndex = 1
                DataBinding.FieldName = 'T14'
              end
              object ColT15: TcxGridDBBandedColumn
                Caption = '15'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 14
                Position.RowIndex = 1
                DataBinding.FieldName = 'T15'
              end
              object ColTX: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                OnGetDisplayText = ColDXGetDisplayText
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 15
                Position.RowIndex = 1
                DataBinding.FieldName = 'DX'
              end
              object ColT16: TcxGridDBBandedColumn
                Caption = '16'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 3
                DataBinding.FieldName = 'T16'
              end
              object ColT17: TcxGridDBBandedColumn
                Caption = '17'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 3
                DataBinding.FieldName = 'T17'
              end
              object ColT18: TcxGridDBBandedColumn
                Caption = '18'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 3
                DataBinding.FieldName = 'T18'
              end
              object ColT19: TcxGridDBBandedColumn
                Caption = '19'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 3
                DataBinding.FieldName = 'T19'
              end
              object ColT20: TcxGridDBBandedColumn
                Caption = '20'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 3
                DataBinding.FieldName = 'T20'
              end
              object ColT21: TcxGridDBBandedColumn
                Caption = '21'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 3
                DataBinding.FieldName = 'T21'
              end
              object ColT22: TcxGridDBBandedColumn
                Caption = '22'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.RowIndex = 3
                DataBinding.FieldName = 'T22'
              end
              object ColT23: TcxGridDBBandedColumn
                Caption = '23'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.RowIndex = 3
                DataBinding.FieldName = 'T23'
              end
              object ColT24: TcxGridDBBandedColumn
                Caption = '24'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 8
                Position.RowIndex = 3
                DataBinding.FieldName = 'T24'
              end
              object ColT25: TcxGridDBBandedColumn
                Caption = '25'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 9
                Position.RowIndex = 3
                DataBinding.FieldName = 'T25'
              end
              object ColT26: TcxGridDBBandedColumn
                Caption = '26'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 10
                Position.RowIndex = 3
                DataBinding.FieldName = 'T26'
              end
              object ColT27: TcxGridDBBandedColumn
                Caption = '27'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 11
                Position.RowIndex = 3
                DataBinding.FieldName = 'T27'
              end
              object ColT28: TcxGridDBBandedColumn
                Caption = '28'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 12
                Position.RowIndex = 3
                DataBinding.FieldName = 'T28'
              end
              object ColT29: TcxGridDBBandedColumn
                Caption = '29'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 13
                Position.RowIndex = 3
                DataBinding.FieldName = 'T29'
              end
              object ColT30: TcxGridDBBandedColumn
                Caption = '30'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 14
                Position.RowIndex = 3
                DataBinding.FieldName = 'T30'
              end
              object ColT31: TcxGridDBBandedColumn
                Caption = '31'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Styles.Content = StyleBold
                Width = 30
                Position.BandIndex = 1
                Position.ColIndex = 15
                Position.RowIndex = 3
                DataBinding.FieldName = 'T31'
              end
              object ColDays: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderGlyphAlignmentHorz = taCenter
                Options.Filtering = False
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'WORK_DAY'
              end
              object ColAll: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Filtering = False
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'WORK_HOURS'
              end
              object ColOvertime: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Filtering = False
                Position.BandIndex = 2
                Position.ColIndex = 2
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'work_hours_overtime'
              end
              object ColNight: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Filtering = False
                Position.BandIndex = 2
                Position.ColIndex = 3
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'work_hours_night'
              end
              object ColHoliday: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Filtering = False
                Position.BandIndex = 2
                Position.ColIndex = 5
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'work_hours_hol'
              end
              object ColOutput: TcxGridDBBandedColumn
                Caption = '0'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Options.Filtering = False
                Position.BandIndex = 2
                Position.ColIndex = 4
                Position.LineCount = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'work_hours_output'
              end
              object ColRmoving: TcxGridDBBandedColumn
                Caption = '0'
                Visible = False
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
                DataBinding.FieldName = 'RMoving'
              end
              object ColIdPostMoving: TcxGridDBBandedColumn
                Caption = '0'
                Visible = False
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'Id_Post_Moving'
              end
            end
            object GridHeaderLevel1: TcxGridLevel
              GridView = GridHeaderBandedTableView1
            end
          end
          object GridTh: TcxGrid
            Left = 1
            Top = 121
            Width = 722
            Height = 397
            Align = alClient
            TabOrder = 1
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
            object GridThLevel1: TcxGridLevel
              GridView = GridThDBBandedTableView1
            end
          end
          object dxBarDockControl1: TdxBarDockControl
            Left = 1
            Top = 1
            Width = 722
            Height = 24
            Align = dalTop
            AllowDocking = False
            BarManager = BarManager
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1044#1088#1091#1075#1072' '#1089#1090#1086#1088#1110#1085#1082#1072
        ImageIndex = 1
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 716
          Height = 506
          Align = alClient
          TabOrder = 0
          object GridThAbsDBBandedTableView1: TcxGridDBBandedTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            OptionsView.FixedBandSeparatorColor = clBlack
            Styles.Background = StyleBackGround
            Styles.ContentEven = StyleDM.cxStyle6
            Styles.ContentOdd = StyleDM.cxStyle7
            Bands = <
              item
                Width = 319
              end
              item
                Caption = #1079' '#1087#1088#1080#1095#1080#1085' '#1079#1072' '#1084#1110#1089#1103#1094#1100' ('#1082#1086#1076#1080', '#1076#1085#1110'/'#1075#1086#1076'.)'
                Width = 583
              end
              item
                Width = 104
              end>
            object GridThAbsColNum: TcxGridDBBandedColumn
              Caption = 'N '#1087'/'#1087
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 26
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'INDEXNUM'
            end
            object GridThAbsCol1: TcxGridDBBandedColumn
              Caption = #1086#1089#1085#1086#1074#1085#1072' '#1090#1072' '#1076#1086#1076#1072#1090#1082#1086#1074#1072' '#1074#1110#1076#1087#1091#1089#1090#1082#1080' \n <p> xdfgr <p>'
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 48
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_8'
            end
            object GridThAbsCol2: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 50
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_11'
            end
            object GridThAbsCol3: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 48
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_18'
            end
            object GridThAbsCol4: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 48
              Position.BandIndex = 1
              Position.ColIndex = 4
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_19'
            end
            object GridThAbsCol5: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 50
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_20'
            end
            object GridThAbsCol6: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 48
              Position.BandIndex = 1
              Position.ColIndex = 5
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_21'
            end
            object GridThAbsCol7: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 49
              Position.BandIndex = 1
              Position.ColIndex = 6
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_23'
            end
            object GridThAbsCol8: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 46
              Position.BandIndex = 1
              Position.ColIndex = 7
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_24'
            end
            object GridThAbsCol9: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 49
              Position.BandIndex = 1
              Position.ColIndex = 8
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_25'
            end
            object GridThAbsCol10: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 47
              Position.BandIndex = 1
              Position.ColIndex = 9
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_26'
            end
            object GridThAbsCol11: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 50
              Position.BandIndex = 1
              Position.ColIndex = 10
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_28'
            end
            object GridThAbsCol12: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 64
              Position.BandIndex = 2
              Position.ColIndex = 0
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'ABSENCE_HOUR_AND_DAY'
            end
            object GridThAbsCol13: TcxGridDBBandedColumn
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              FooterAlignmentHorz = taCenter
              HeaderAlignmentHorz = taCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 53
              Position.BandIndex = 2
              Position.ColIndex = 1
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'OKLAD_BASE'
            end
            object GridThAbsColFio: TcxGridDBBandedColumn
              Caption = 'ghjgh'
              Options.Filtering = False
              SortOrder = soAscending
              Styles.Header = StyleDM.cxStyle3
              Width = 240
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'FIO'
            end
            object GridThAbsColTN: TcxGridDBBandedColumn
              Caption = 'v nvbn'
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 56
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'TN'
            end
            object GridThAbsCol31: TcxGridDBBandedColumn
              Caption = '31'
              PropertiesClassName = 'TcxMemoProperties'
              Properties.Alignment = taCenter
              Options.Filtering = False
              Styles.Header = StyleDM.cxStyle3
              Width = 57
              Position.BandIndex = 1
              Position.ColIndex = 11
              Position.LineCount = 2
              Position.RowIndex = 0
              DataBinding.FieldName = 'KOD_31'
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = GridThAbsDBBandedTableView1
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1079#1072' '#1090#1072#1073#1077#1083#1103#1084#1080' '#1086#1073#1088#1072#1085#1086#1075#1086' '#1096#1072#1073#1083#1086#1085#1091
        ImageIndex = 2
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 716
          Height = 506
          Align = alClient
          Caption = 'Panel6'
          TabOrder = 0
          object cxGrid4: TcxGrid
            Left = 1
            Top = 1
            Width = 714
            Height = 454
            Align = alClient
            TabOrder = 0
            object cxGrid4DBBandedTableView1: TcxGridDBBandedTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsData.Editing = False
              OptionsSelection.HideFocusRect = False
              OptionsSelection.HideSelection = True
              OptionsSelection.InvertSelect = False
              OptionsSelection.MultiSelect = True
              OptionsView.CellAutoHeight = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.BandHeaders = False
              Styles.Background = StyleBackGround
              Styles.Content = StyleBackGround
              Styles.ContentEven = StyleHistory1
              Styles.ContentOdd = StyleHistory1
              Bands = <
                item
                  Width = 150
                end
                item
                  Width = 731
                end>
              object cxGrid4DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
                Visible = False
                GroupIndex = 0
                Options.Filtering = False
                SortOrder = soAscending
                Width = 92
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
                DataBinding.FieldName = 'DATE_EVENT'
                IsCaptionAssigned = True
              end
              object cxGrid4DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
                Caption = #1053#1072#1079#1074#1072' '#1090#1072#1073#1077#1083#1102
                Options.Filtering = False
                Width = 115
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
                DataBinding.FieldName = 'TSH_CAPTION'
              end
              object cxGrid4DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
                Caption = #1055#1086#1076#1110#1103
                Options.Filtering = False
                Width = 93
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
                DataBinding.FieldName = 'EVENT_NAME'
              end
              object cxGrid4DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
                Caption = #1057#1090#1072#1085' '#1087#1110#1076#1087#1080#1089#1091' '#1076#1086
                Options.Filtering = False
                Width = 136
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'SIGN_NAME_BEFORE'
              end
              object cxGrid4DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
                Caption = #1057#1090#1072#1085' '#1087#1110#1076#1087#1080#1089#1091' '#1087#1110#1089#1083#1103
                Options.Filtering = False
                Width = 141
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 0
                DataBinding.FieldName = 'SIGN_NAME_AFTER'
              end
              object cxGrid4DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
                Caption = #1050#1080#1084' '#1110#1085#1110#1094#1110#1081#1086#1074#1072#1085#1080#1081
                Options.Filtering = False
                Width = 171
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
                DataBinding.FieldName = 'FIO'
              end
              object cxGrid4DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn
                Caption = #1053#1072#1079#1074#1072' '#1082#1086#1084#1087#39#1102#1090#1077#1088#1072
                Options.Filtering = False
                Width = 85
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
                DataBinding.FieldName = 'COMP_NAME'
              end
              object cxGrid4DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
                Caption = 'IP '#1072#1076#1088#1077#1089' '#1082#1086#1084#1087#39#1102#1090#1077#1088#1072
                Options.Filtering = False
                Width = 83
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
                DataBinding.FieldName = 'COMP_IP'
              end
              object cxGrid4DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn
                Caption = #1063#1072#1089
                Options.Filtering = False
                SortOrder = soAscending
                Width = 40
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
                DataBinding.FieldName = 'TIME_EVENT'
              end
            end
            object cxGrid4Level1: TcxGridLevel
              GridView = cxGrid4DBBandedTableView1
            end
          end
          object cxSplitter1: TcxSplitter
            Left = 1
            Top = 455
            Width = 714
            Height = 8
            AlignSplitter = salBottom
            Control = Panel5
          end
          object Panel5: TPanel
            Left = 1
            Top = 463
            Width = 714
            Height = 42
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 2
          end
        end
      end
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 229
    Top = 46
    Width = 8
    Height = 547
    Control = Panel1
  end
  object BarManager: TdxBarManager
    AllowReset = False
    AutoDockColor = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'ButtonsControlBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 894
        FloatTop = 108
        FloatClientWidth = 71
        FloatClientHeight = 318
        ItemLinks = <
          item
            Item = ButtonInsert
            Visible = True
          end
          item
            Item = ButtonDelete
            Visible = True
          end
          item
            Item = ButtonRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = ButtonRedeFined
            Visible = True
          end
          item
            Item = ButtonTestData
            Visible = True
          end
          item
            BeginGroup = True
            Item = ButtonSigned
            Visible = True
          end
          item
            Item = ButtonUnSigned
            Visible = True
          end
          item
            BeginGroup = True
            Item = ButtonFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = ButtonPrint
            Visible = True
          end>
        Name = 'ButtonsControlBar'
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'ToolbarTsh'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 649
        FloatTop = 303
        FloatClientWidth = 127
        FloatClientHeight = 44
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4227327
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemLinks = <
          item
            Item = dxBarStatic1
            Visible = True
          end
          item
            Item = ButtonNoteInsert
            Visible = True
          end
          item
            Item = dxBarStatic3
            Visible = True
          end
          item
            Item = ButtonNoteUpdate
            Visible = True
          end
          item
            Item = dxBarStatic2
            Visible = True
          end
          item
            BeginGroup = True
            Item = CaptionIsAct
            Visible = True
          end>
        Name = 'ToolbarTsh'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        UseOwnFont = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'ToolbarDate'
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 312
        FloatTop = 160
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarStatic4
            Visible = True
          end
          item
            Item = EditYear
            UserDefine = [udWidth]
            UserWidth = 59
            Visible = True
          end
          item
            BeginGroup = True
            Item = EditMonth
            UserDefine = [udWidth]
            UserWidth = 109
            Visible = True
          end>
        Name = 'ToolbarDate'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
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
    DockColor = clActiveBorder
    LookAndFeel.Kind = lfUltraFlat
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 687
    Top = 2
    DockControlHeights = (
      0
      0
      46
      0)
    object ButtonRefresh: TdxBarLargeButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1054#1085#1086#1074#1080#1090#1080
      Visible = ivAlways
      ShortCut = 116
      OnClick = ButtonRefreshClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
        00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0CE9EEFCB97
        EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF
        7F9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1F0
        D1AAA5BB70E0C793DEC48CEDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7F
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7
        C0F6E0C1F2D9B8F2D4B1C0C588008201E0C79352A035259217259116519D2EB2
        B262DABB77E9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7E3D0A50082010686050082010082
        010082010082010082017AA643DABB77E9BD7FEABF7FE7BC7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBDE3D4AC008201
        008201008201008201008201008201008201008201AFB15FE9BD7FEABF7FE7BC
        7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
        DEC5E5D8B200820100820100820126931BB2BC76B1BA72529F33008201249015
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
        DAFAEEDEF7E7D4F6E2CBE5DAB80082010082010082011C9014E1CA99E0C793DE
        C48C90AF57068604E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3E6DDC00082010082010082010082
        01008201E1CA9AEDCB9CEDC796EBC58F5FC065EABF82E7BB7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAE7E1C6E6DDC0
        E5D9B8E5D8B2E3D4ABE2D1A5E2CE9FEFCEA3EECA9CEDC7955FC065EBC288E7BC
        809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EB5F
        C065F8EBDCF7E7D3F6E2CCE5DAB8E5D8B2E3D4ACE3D0A6E2CE9EE1CA99DEC792
        EDC795EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
        F4FFFFFEFEF8F35FC065F8EEE3F8EBDAF7E6D3E7DDC000820100820100820100
        8201008201E1CA99EECB9CEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F006880698CB8BE9E5CCE7E2C6E6DD
        BF1C9217008201008201008201E2CE9EEFCEA1EECB9CEBC592A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFB289D27008201
        56B04FBAD5A5BAD19E279821008201008201008201E3D0A4F0D1A9F0CFA3EDC9
        999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
        FFFFBFE3BC008201008201008201008201008201008201008201008201E3D4AB
        F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
        F4FFFFFFFFFFFFFFFFFFEFF8EF87CC8400820100820100820100820100820106
        8706008201E5D8B2E5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFEFF8EFC4E5C157B554289C
        25279A2456AF4CE9E2C7008201B2C495B8AB9AA79C8BA49786846964FF00FFFF
        00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFBFCF7F0FBF2E9FBF2E5DACFB7956856696C4095655B96655B9665
        5B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16B
        DD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FCF8
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DD
        C4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E689F675BA5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ButtonExit: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1099#1093#1086#1076
      Category = 0
      Hint = #1042#1080#1093#1110#1076
      Visible = ivAlways
      ShortCut = 27
      OnClick = ButtonExitClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66666933
        34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666
        A36666A76666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A0
        6666B06667C66667CC6667B36667693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A66
        66AF6869C0696ACF696ACE6869CD6768CD6768B36667693334AE66669A66669A
        66669A66669A66669A66669A66669A66669A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666D26F70D56F70D46E6FD36D6ED26C6DD16B6CD06A6BB467686933
        34FEA2A3FDA8A9FCAFB0FBB6B7FABCBDF9C2C2F9C5C6F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666D97374D87273D77172D67071D56F70D46E6F
        D36D6EB6696A69333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DC7677DB7576DA7475D9
        7374D87273D77172D67071B86B6B69333459B26733CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666DF79
        7ADF797ADE7879DD7778DC7677DB7576DA7475B96C6D69333459B26733CB6733
        CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666E37D7EE27C7DE17B7CE07A7BDF797ADE7879DD7778BB6E6F6933
        3459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666E68081E57F80E47E7FE37D7EE27C7DE17B7C
        E07A7BBD707069333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666E98384E88283E78182E6
        8081E78788ECA6A7E47E7FBE717269333473B87633CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666ED87
        88EC8687EB8586EA8485F2B9BAFFFFFFF0B0B0C07374693334F2D9C0C7F0BC79
        DD9079DD9060D68160D68160D681F9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666F08A8BEF898AEE8889ED8788F5BBBCFFFFFFF0AAABC275756933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDE2F8CCE2F8CCF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666F38D8EF28C8DF18B8CF08A8BEF898AF3A6A7
        ED8788C37677693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F69091F69091F58F90F4
        8E8FF38D8EF28C8DF18B8CC57878693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FA94
        95F99394F89293F79192F69091F58F90F48E8FC77A7A693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A6666FD9798FC9697FB9596FA9495F99394F89293F79192C87B7C6933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFE9899FD9798FD9798FC9697
        FB9596CA7D7D693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666FF999AFF999AFF999AFF
        999AFF999AFE9899FE9899CC7F7F693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FFFF00FF9A6666F996
        97FF999AFF999AFF999AFF999AFF999AFF999ACD8080693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FFFF00FF
        FF00FF9A66669A6666C0797ADF898AFF999AFF999AFF999AFF999ACD80806933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666A76C6DC67C7DF29394
        FF999ACD8080693334A766669A66669A66669A66669A66669A66669A66669A66
        669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF9A66669A6666AD7070B37373693334FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ButtonInsert: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      ShortCut = 45
      OnClick = ButtonInsertClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFA97C79B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF
        00FFFF00FFFF00FFFF00FFAE7781F3DDC4F8E3C6F6DFBFF5DCB8F4D9B2F3D7AC
        F3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98F1CF98EFCD
        97B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2DEC8F7E3CAF5DFC2F4
        DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EECC97EECC97
        EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAE7782F2E0
        CEF8E7CFF5E2C8F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CFA0EFCD9AEE
        CC97EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
        FF00FFAE7782F3E3D2F9E9D4F6E4CDF5E1C7F5DEC1F4DCBCF3D9B6F2D7B0F1D4
        AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB96B88183FF00FFFF
        00FFFF00FFFF00FFFF00FFAE7783F4E6D8FAECDAF8E7D3F6E4CCF5E1C7F5DFC2
        F4DCBCF3D9B6F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97EECC97EFCD97EDCB
        96B88183FF00FFFF00FFFF00FFFF00FFFF00FFAF7883F5E9DDFBEFE0F8EAD9F7
        E6D2F6E4CDF5E1C8F4DEC2F4DCBCF3D9B6F2D7B1F1D4ACF1D2A6F0CFA0EECC99
        EECC97EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FFFF00FFB27B85F5EC
        E3FBF2E6F9EDDEF8E9D7F7E7D2F6E4CDF5E1C7F5DFC1F4DCBBF3D9B6F2D7B1F1
        D4ABF1D2A5F0CFA0EECC99EFCD97EDCB96B88183FF00FFFF00FFFF00FFFF00FF
        FF00FFB78086F7EFE8FCF5ECFAEFE4F9ECDDF8E9D8F7E7D3F6E4CDF5E1C7F5DF
        C1F4DCBCF3D9B7F1D7B0F1D4ABF0D2A5F0CF9FEFCD9AEDCA96B88183FF00FFFF
        00FFFF00FFFF00FFFF00FFBB8388F8F2EEFDF8F1FAF3EAF9EFE3F9ECDDF8E9D8
        F7E6D2F6E4CCF5E1C6F4DFC1F4DCBCF3D9B6F2D6B0F1D4AAF0D1A4F0D09FEDCB
        98B88183FF00FFFF00FFFF00FFFF00FFFF00FFBE8689FAF6F4FEFCF8FCF6F0FA
        F2EAFAF0E4F9EDDDF8E9D8F7E7D2F6E4CCF5E1C7F5DEC2F4DCBBF3D9B6F1D7B0
        F1D4AAF1D2A5EECD9EB88184FF00FFFF00FFFF00FFFF00FFFF00FFC2898AFBF8
        F7FFFFFEFEFAF6FCF5EFFAF2EAFAF0E3F9ECDDF9E9D8F8E7D2F6E4CDF5E1C7F5
        DEC1F4DCBCF3D9B6F2D7B0F2D5ABEFCFA4B98285FF00FFFF00FFFF00FFFF00FF
        FF00FFC68D8CFBF8F7FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3F9EDDDF8E9
        D7F8E7D2F6E4CDF5E1C6F5DEC1F4DCBBF3D9B5F2D7B0F0D2A8B98386FF00FFFF
        00FFFF00FFFF00FFFF00FFCA908DFBF8F7FFFFFFFFFFFFFFFDFCFEF9F5FCF6F0
        FAF2EAFAF0E4F9ECDDF8EAD8F8E6D2F6E4CCF6E1C6F5DEC0F4DCBBF4DAB6F1D5
        AEB58286FF00FFFF00FFFF00FFFF00FFFF00FFCD938FFBF8F7FFFFFFFFFFFFFF
        FFFFFFFEFCFEF9F5FCF6EFFBF2EAFAEFE3F9ECDDF8E9D7F8E6D1F6E3CBF5E1C6
        F4DEC0F3DBBAD9C4A7A47E83FF00FFFF00FFFF00FFFF00FFFF00FFD19790FCF9
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0E3F9ECDDF8
        E9D7F8E6D1F6E4CCEBD9C0D1C1ABB5A8979C7C81FF00FFFF00FFFF00FFFF00FF
        FF00FFD59A91FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFAF5FCF6
        EFFAF2E9FAEFE2FAEDDEFBEEDBE7DBC9C8BDAFBAB0A2B7AC9DA07E83FF00FFFF
        00FFFF00FFFF00FFFF00FFDA9D93FCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFCFDF9F4FCF5EEFCF5EBEEDDD1B28176AD8076AA7F76AB7F76AB7F
        76AF7F77FF00FFFF00FFFF00FFFF00FFFF00FFDDA194FCF9F8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176E3B585
        E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FFE0A395FDFA
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5
        D1CBB38176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE0A395FDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE5D4D0B38176EFC38CF3BA6CB88285FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFE0A395FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEA78CECD0BEEDD3C1EDD3C1EC
        D1C1EAD0C1E8CEC0E6CCBFE4CBBEE1C9BEDFC7BDDDC5BDCEAEA6B38176B88285
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ButtonDelete: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      ShortCut = 46
      OnClick = ButtonDeleteClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FF0732DE0732DE0732
        DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FF
        0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FF0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DE07
        32DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335
        FB0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF0732DE07
        32DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FF0732
        DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
        0732DE0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0732DE0732DE0335FB0732DE0335FB0732DE0732DEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0335FB0732DEFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB0732DE0732
        DE0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB
        0732DE0335FB0335FB0335FB0732DE0335FBFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0732DE0335FBFF00FFFF00FF0335FB0335FB0335FB0335FBFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FB0335FB0732DE0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB03
        35FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FBFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335
        FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ButtonSigned: TdxBarLargeButton
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      Category = 0
      Hint = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      Visible = ivAlways
      ShortCut = 120
      OnClick = ButtonSignedClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0009721300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000972130009721300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0093655E00BA8E
        7E00BA8E7E00BB8B7900BB8C7900BB8A7500BB8A7500BB887000BC887000BC89
        7200C48C7700B9846F00097213002EBC550009721300AF816500C28278009E67
        6900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0098696500F7D9
        B700FFE1B900FFD9AF00FFD5A700FFD19E00FFD19E00FFD39100FFD48B00FFD4
        8B00EDBF82000972130021A53F004DE581000973140009741400097414000974
        1400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0098696500F7D9
        BC00FFE0BE00FEDAB500FFD9AF00FFDDA700F4C79C00B79497008974A1008B76
        7E000972130029B750004BE07D0048DC770046D8740031C25B0023A640001789
        2800036C0A00015D0400FF00FF00FF00FF00FF00FF00FF00FF0098696500F8DC
        C400FFE5C700FFE0BE00FFE4B400977E99001F27A700001BDD000019D3000972
        130030BF50004DE27F0048DC770048D9760045D770003FD1660037CC5D0032C6
        550027B541000F801A00015D0400FF00FF00FF00FF00FF00FF0098696500F7E0
        CA00FFE5C700FFEAC1008974A1000111C700001CF700001AFF002659A4000972
        13003FD46C004BE07D0047DA770045D7700041D36A003BCE630032C655002DC0
        4A0028BB42001FB035000D841800015D0400FF00FF00FF00FF0098696500F8E3
        D100FFF7D700A698B6000115CE000021FF000024FF005372FF00E6EBFF00B3CF
        B6000972130039CC620049DD790041D36A0030BB4D001F9D34001B962D001897
        29001AA02D001AAA2D0015A9270008790F00FF00FF00FF00FF0098696500FBEA
        D800FBEAD8003642C0000020FB00001FFF003C5EFF00F6F7FF00D4DEFF00BDC6
        FF00B3CFB6000972130030BB4D003FD76900097213007A864B009E8E5A004360
        2F000162040006740E000D971A000A93140003630600FF00FF009D6E6700FFF3
        E200CFBFCC000A20CA00062FFF000023FF003C5EFF006781FF007D96FF00667B
        FF00C2CBFF00527BB800097213002EBD3D00097213008C777F00E7AC85009966
        6600FF00FF00FF00FF0004670800088E1100046E0900FF00FF00A5756B00FFFF
        EE006F6DBC00011CDC000F39FF000C34FF00032BFF00042AFF009EB2FF00D9E1
        FF00F3F6FF003656FF00011FDD0009721300097213005C5B7F00E0A47F009966
        6600FF00FF00FF00FF00FF00FF0004700A0005750B00FF00FF00A5756B00FFFF
        F3006F6DBC000320DD001640FF000E37FF00133CFF00BDCBFF00FFFFFF00F6F7
        FF005778FF000023FF000023FF000026EE00097213005C5B7F00E0A47F009365
        6300FF00FF00FF00FF00FF00FF0003640600036A0900FF00FF00AB7A6C00FFFE
        F8009796D5000B25D4001A47FF000E37FF005576FF00E6EBFF00CCD8FF006382
        FF00001FFF00032BFF000128FF000026FF000019EB0070639800E6AC7F009163
        6000FF00FF00FF00FF00FF00FF00FF00FF0002600500FF00FF00B17E6B00FEFA
        F600FBF7F6002338D0001843FF00133FFF006382FF00D4DEFF00A1B5FF009EB2
        FF00A3B7FF002348FF00032BFF00032BFF00001AD400B7949700E6AC7F009263
        6000FF00FF00FF00FF00FF00FF00FF00FF00025F0500FF00FF00B9846F00FAF6
        F400FFFFFF008487D1000C2DE300234FFF00234FFF00BDCBFF00FFFFFF00FFFF
        FF00A3B7FF001139FF000C37FF000020E90035359D00FFD5A700D5A68A009163
        6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC877000FAF6
        F400FFFFFF00F0EEF4003541C0001035EE001A47FF002854FF0091AAFF007B96
        FF001843FF00113EFF00042BF6002430B100CEACA600FFE4B400D5A68A009162
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C28C7400FAF6
        F400FFFFFF00FFFFFF00EAE7F3005F67CC002439D0001035EE000E35F3000C31
        F0000C31F0001028CF00494DB500E5CEBC00FFEAC200FFE1B900D0AA96009162
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C9907500FAF6
        F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCD9EE009796D5006C70CB006C70
        CB008883C200CFC0CC00FFF2D400FFF2D400FFE5C900FFEAC200D0AA96009160
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C9907500FBF7
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00FFFF
        F300FFFFEE00E5CEBC00CB9F8F00C6978800C6988800C6988800B68373009365
        5E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D3997700FBF7
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
        F800FFFFFB00CCABA400A4695800CA906600CB8A5400D0823900D0823900FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D59A7700FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CCABA400B2796300EEB67000EFA95300EF9C3900FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D59A7700FCF8
        F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00CEAFA900B0766200EEB67000EFA95300FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D5997700FAF2
        ED00FEFAF800FCF8F600FCF8F600FBF7F600FBF7F600FAF6F400FAF6F400FAF6
        F400FFFFFF00CCABA400B2796300DAA56E00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D3936F00D599
        7700D59A7700D59A7700D3997700CE957600C9907500C28C7400C1887200BC87
        7000B6837300A9746700B17E6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object ButtonRedeFined: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1092#1086#1088#1084#1091#1074#1072#1090#1080
      Category = 0
      Hint = #1055#1077#1088#1077#1092#1086#1088#1084#1091#1074#1072#1090#1080
      Visible = ivAlways
      ShortCut = 117
      OnClick = ButtonRedeFinedClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF0001560300047E0A00058A0C0005810C0007910F00079110000786
        0F0009951300087E1100196E1E000A951500098413000B9817000D9C1B000F9C
        1D000E9E1D0011A3210011A0210010911F0013A4240013A1230015AA280014A4
        270015A728001290220016AA290016A62A0015A1280024712F0017A12C00169A
        2A0019AB2F001CB235001BAC32001BAC3300199D2E001CAD34001FB538001DA1
        340022B73E0022B63E0023BB410023B7410025BA430026BB440026BB450029C4
        4A0025AC420024A442002CC54E002ABC4C002DC652002DC4510028AC46002EC5
        530030C9560031C9580030C655002EBD520033CA5A0030BB540038D0630035C3
        5B0038D0640036CA620039D1660038CC64003BD368003ACE670036BF5E003FDC
        6E003ED96E003ED76D0040DA70003FD76E0043E2770042E0760041DC7300FCFE
        FF00ABBBFE00E6EBFF003658FB005473FC007B93FC001033FA002042FB00011F
        FA000222FA000728FA0000008200000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        020203030303030302025C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C03372D241703
        02025C595A5B57585455565253515151515C0342392E270302025C595A5B5758
        5455565253515151515C034B443C300302025C595A5B57585455565253515151
        515C034B4B463B0302025C595A5B57585455565253515151515C030303030303
        02025C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C0202020202020202020202020202
        0202020202020202020202020202030302020202020202020202020202020202
        020202020203454703030202020202020202020202020202020202020203494C
        4D3F03030202020202020202020203030202020203293A3E404A4F0303020202
        02020202020333030202020203282B2F36320303020202020202020203481F03
        020202030B161D252A2603020202020202020203453803020202020303030314
        19231B0302020202020303504103020202020202020203030F111C1503030303
        033D4E4303020202020202020202020303080D12181E202C3134350302020202
        0202020202020202030305070A10131A22210302020202020202020202020202
        0203030C0406090E030302020202020202020202020202020202020303030303
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
    end
    object dxBarColorCombo1: TdxBarColorCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF000101A6
        000202B4000404E4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000101A6
        000202B4000404E4FFFFFFFF5201F9075202FA075204FC07FFFFFFFF070056FF
        070072FF0700D2FFFFFFFFFFFF5207FFFF5207FFFF5207FFFFFF}
      Width = 100
      Color = clBlack
    end
    object ButtonNoteDelete: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1089#1083#1091#1078#1077#1073#1082#1091
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1089#1083#1091#1078#1077#1073#1082#1091
      Visible = ivAlways
      OnClick = ButtonNoteDeleteClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B74D06F6E8A252E8A200F48700F41BD4E8A22B74880000
        06CDC154CD4D6E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F6E86EA4FF3655FF00FFE86CAAF76C
        00F700FFECA255FF1B80C154CD2754290006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6E88780FF3655
        FF00FFFF00FFFF00FFF700FFECA255FF1B80EC51D42754290006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFEC51D4F76C00FF00FFFF00FFFF00FFF700FFE8A255E8A200E8A200FB512B
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFF700FFE8A255FB512BF41BFFF4872BFF00D4FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFF700FFE8A255E8A200F76C
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ButtonPrint: TdxBarLargeButton
      Caption = #1044#1088#1091#1082
      Category = 0
      Hint = #1044#1088#1091#1082
      Visible = ivAlways
      OnClick = ButtonPrintClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
        6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
        6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
        BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
        6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
        C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
        7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
        A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
        C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
        2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
        CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
        A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
        00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
        EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
        6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
        F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
        B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
        F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
        C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
        6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
        B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
        00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
        6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
        B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
        D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
        CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
        82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
        8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
        FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
        E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
        ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
        FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
        F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ButtonFilter: TdxBarLargeButton
      Caption = #1060#1110#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1110#1083#1100#1090#1088
      Visible = ivAlways
      ShortCut = 119
      OnClick = ButtonFilterClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF00004B
        0000004E000000580000005E0000015D0400055E080000620000006600000260
        050001690200006F000004640A0005670D00076A0F0000730000007600000376
        08000C731500760376000A4A52000D5862000D5A6400C47B0000FF7E00000081
        0000018603000289060003810800048E0A0005910E00078612000A8C1B001080
        1E0007961300099816000A9A19000C9D1D00149110001488230019932B001C9A
        3100189D33001E9E34000DA021000EA324000FA4280010A5280011A72C001CA9
        2F0013AB300015AD35001DA5390016B0390018B23D0020A5390019B641001BB8
        45001CB845001DBB49001FBF4D0023AC400032A54B0028B4450027B548002EBB
        550028CC4F0021C2500023C5530026C9560029CD5A0033CC580034CC59002FD7
        51002FD850002DD35E002FD7620031D9640034DD670036E16A003BE76F003EEB
        730041EF760045F67B0045F67F0047F87E00DAAB1F00E0B73B00E0B83B00E2AB
        6F00E3C15200E5C65B00E7C96600FC00FC00FF78FF0000A6BD0045F6800049FB
        80004BFE820000B1CA0000C4E00000C9E30000CCE90000D7F40054E6F7007FFA
        F800EDD78A00EFDC9800F6E9BD00FA95FA0081FFFE00F8F2D400FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000001010101
        0000000000000000000000000000000000000005426049190100000000000000
        0000000000000000000000054260491901000000000000000000000000000000
        0000000542604919010000000000000000000000000000000000000542544919
        0100000000000000000000000000000000000005426049190100000000000000
        0000000000000000000000053E41312601000000000000000000000000000000
        0000052A443830241C0100000000000000000000000000000005344B44363023
        1B100100000000000000000000000000053D4F463C362C221B19100100000000
        00000000000000053F524E463C322C1E1919191001000000000000000000053F
        61514E443832242219191919100100000000000000053F6155504C443830241D
        191919191910010000000000052A482A2A210E0D0D0505050505050808101001
        00000005010105050A101F206E66635F143F372A271201010100050510101717
        17172430326E656465155461616161480601000508175B5A5856173032386E67
        6767154837285E010100000000596B6A5C5817010101016E67150101015E5E13
        0000000000596F6C6A5A170000000000680000006D5E5D13130000000059706F
        6B5B1800000000000000006D6D5D5D5D13130000000059595959000000000000
        000000006D6D5D131300000000000000000000000000000000000000006D5E13
        000000000000000000000000000000000000000000005E000000}
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object ButtonNoteInsert: TdxBarButton
      Caption = '  '#1044#1086#1076#1072#1090#1080' '#1089#1083#1091#1078#1073#1086#1074#1080#1081' '#1079#1072#1087#1080#1089
      Category = 0
      Hint = '  '#1044#1086#1076#1072#1090#1080' '#1089#1083#1091#1078#1073#1086#1074#1080#1081' '#1079#1072#1087#1080#1089
      Visible = ivAlways
      ButtonStyle = bsChecked
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDE4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4FFFFFFFFFF
        F6F6F6F6F6F6F6F6090909090909090909E4E4FFFFFFFFFFF6F6F6F6F6F6F6F6
        090909090909090909E4E4FFFFFFFFFFF6F6F6F6F6F6F6F60909090909090909
        09E4E4FFFFFFFFFFFFFFFFF6F6F6F609090909090909090909E4E4FFFFFFFFEA
        EAEAEAEAEAEAEAEAEAEAEAEA0909090909E4E4FFFFFFFFFFFFFFF6F6F6F6F609
        090909090909090909E4E4FFFFFFFFEAEAEAEAEAEAEAEAEAEAEAEAEA09090909
        09E4E4FFFFFFFFFFFFFFFFF6F6F6F6F6090909090909090909E4E4FFFFFFFFEA
        EAEAEAEAEAEAEAEAEAEAEAEA0909090909E4E4FFFFFFFFFFFFFFFFF6F6F6F609
        090909090909090909E4E4FFFFFFFFFFF6F6F6F6F6F6F6F6090909EC09090909
        09E4E4FFFFFFFFFFF6F6F6F6F6F6F6F6090909E40909090909E4E4FFFFFFFFFF
        F6F6F6F6F6F6F6F6ECE4E4E4E4E4EC0909E4E4FFFFFFFFFFF6F6F6F6F6F6F6F6
        090909E40909090909E4E4FFFFFFFFFFF6F6F6F6F6F6F6F6090909EC09090909
        09E4E4FFFFFFFFFFF6F6F6F6F6F6F6F6090909090909090909E4E4E4E4E4E4E4
        E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4FDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      PaintStyle = psCaptionGlyph
      OnClick = ButtonNoteInsertClick
    end
    object ButtonNoteUpdate: TdxBarButton
      Caption = '  '#1044#1110#1108' '#1089#1083#1091#1078#1073#1086#1074#1080#1081' '#1079#1072#1087#1080#1089
      Category = 0
      Hint = '  '#1044#1110#1108' '#1089#1083#1091#1078#1073#1086#1074#1080#1081' '#1079#1072#1087#1080#1089
      Visible = ivAlways
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF006D697F00766F7F00F1F0F200FF00FF00C7C2C700776976007D6F7C008C7C
        7F00A478740085645F00986756009E664E00B06A4200A3613E00B8622B00B863
        2E00B8653100B9673500AD704C00AC714E009E694700FAF4F000B7571000F9F2
        ED00FAF6F300F9E5D400FAF0E800FAF4EF00F9F4F000CB9D7300F8DBC000F8DD
        C400F8E2CE00F9EADC00F9EBDE00F9EBDF00F9ECE000FAEFE500F9EEE400F6EF
        E900DB862F00E0903E00E6B27D00FCCFA200FBD2A800F9D4AE00F8D6B300F7D8
        B900F7D9BC00F7DABE00F8DCC000F7DCC100F7DEC500F4DCC400F8E0C800F8E0
        C900F8E2CD00F3DEC900F8E3CE00F9E6D300F8E5D200F8E5D300F2E0CE00F8E7
        D600F8E8D800F9E9D900F9EADB00F9EDE100F9EEE300F2E8DE00FAF1E800F9F1
        E900FAF3EC00F9F3ED00F9F4EF00FAF6F200FDFBF900FEFDFC00DE9C5500E6B7
        8200F7DABC00F7DCC000F5DABE00F7DEC400F8E1C900F8E3CD00F8E9D900F0E2
        D300EFE4D800F0E6DB00F3EBE200F4EDE500F7F2EC00DF993E00FBF9F60081CE
        E600BAE4F20099CDFE0099B0C700000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000050505050505
        0505050505050505050505050505050505050505050505050505050505050505
        0505050505050505050505050505050505050505050505050505050505050505
        05050A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A4F4E601A4C
        5E295D5C475B5A59403B375431302F2E2D0A0A4F4E601A4C5E295D5C475B5A59
        403B375431302F2E2D0A0A4F4E601A4C5E295D5C475B5A59403B375431302F2E
        2D0A0A4F4E601A1A1E19482824583D3C3955535231302F2E2D0A0A4F4E601A5F
        5F5F5F5F5F5F5F5F5F5F5F5F31302F2E2D0A0A4F4E601A174B49274523423F57
        5636353331302F2E2D0A0A4F4E601A5F5F5F5F5F5F5F5F5F5F5F5F5F31302F2E
        2D0A0A4F4E601A4D1D4B48282644413E3A38212031302F2E2D0A0A4F4E601A5F
        5F5F5F5F5F5F5F5F5F5F5F5F31302F2E2D0A0A4F4E601A1A174A1C4625431B22
        3855343231302F2E2D0A0A4F4E601A4C5E295D5C475B5A59403B0E1413121110
        2D0A0A4F4E601A4C5E295D5C475B5A59403B1661502B2A182D0A0A4F4E601A4C
        5E295D5C475B5A59403B1562512C1F0F2D0A0A4F4E601A4C5E295D5C475B5A59
        403B0C636404060D2F0A0A4F4E601A4C5E295D5C475B5A59403B0B0903020807
        310A0A4F4E601A4C5E295D5C475B5A59403B3B3B3B3B3B3B3B0A0A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0505050505050505050505050505
        0505050505050505050505050505050505050505050505050505050505050505
        0505050505050505050505050505050505050505050505050505}
      PaintStyle = psCaptionGlyph
      OnClick = ButtonNoteUpdateClick
    end
    object dxBarStatic1: TdxBarStatic
      Caption = '   '
      Category = 0
      Hint = '   '
      Visible = ivAlways
    end
    object CaptionTsh: TdxBarStatic
      Category = 0
      Visible = ivAlways
      AllowClick = True
    end
    object dxBarContainerItem1: TdxBarContainerItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarStatic2: TdxBarStatic
      Caption = '   '
      Category = 0
      Hint = '   '
      Visible = ivAlways
    end
    object dxBarStatic3: TdxBarStatic
      Caption = '  '
      Category = 0
      Hint = '  '
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarDateCombo1: TdxBarDateCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      Width = 100
    end
    object dxBarStatic4: TdxBarStatic
      Caption = #1055#1077#1088#1110#1086#1076':'
      Category = 0
      Hint = #1055#1077#1088#1110#1086#1076':'
      Visible = ivAlways
    end
    object EditMonth: TdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      OnChange = EditYearChange
      Width = 100
      ItemIndex = -1
    end
    object EditYear: TdxBarSpinEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      OnChange = EditYearChange
      Width = 100
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object ButtonUnSigned: TdxBarLargeButton
      Caption = #1047#1085#1103#1090#1080' '#1087#1110#1076#1087#1080#1089
      Category = 0
      Hint = #1047#1085#1103#1090#1080' '#1087#1110#1076#1087#1080#1089
      Visible = ivAlways
      ShortCut = 121
      OnClick = ButtonUnSignedClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F752800047D
        1100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A87C7800A87C
        7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C
        7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C780005710A0019AC
        390005710A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AA7F7A00FAE2
        C900FFEACA00FFE3C300FFE0BA00FFDDB400FFE0AB00FFE0AB00FFDB9C00FFD5
        9D00FFDB9C00FFD8A200FFD59D00E6C28700ADAE68007EA2510005710A002BBC
        4E0035C2530005710A00FF00FF00FF00FF00FF00FF00FF00FF00AA7F7A00FAE2
        C900FEE7CD00FFE3C300FFE0BE00FFE5B900DEBBA9009A83A4006B63AC00605B
        AF007967AD00A49879006B9A43002C9A350026AA42002BBC4E0036C45B003CC9
        5D003AC95B0035C2530005710A00FF00FF00FF00FF00FF00FF00AA7F7A00F9E6
        D300FFE9D200FFEACA00FFE9C200AC97B2000A2CB100001DDF000026FC00002D
        FF000A2CB1000C7B22002DBB510049D876004AD7730046D36C0041CE66003ECA
        61003BC85C003AC95B0035C35400158D2300FF00FF00FF00FF00AA7F7A00F9E6
        D300FDECDA00FEE7CD00716BB4000221D800002FFF000028FF004F6FFF007CA5
        AC001D943D0050DB770055E0840050DA7B004ED978004AD7730046D36C0041CE
        66003ECA61003CC95D003CCC5E002AAC420005710A00FF00FF00AA807B00FDEC
        DA00FFFBE400A298C100001DDF000032FF00002AFF006583FC00D0D5D8002B93
        290052DD7C005CE88E0053DE780046CF5D0039BD45002DB6460033BE580045CF
        690041CE660041CF650026A63E0008750E00FF00FF00FF00FF00AA817C00FCEF
        E100FFF1E000434FC6000031FC000032FF001E4BFF00EAEAFB007EB47E002EB2
        4D0055E084002FAE460018814C00065C7500004A81003F685C004592330036C4
        5B004AD872002AAC420005710A00FF00FF00FF00FF00FF00FF00AF857E00FDF4
        E900D0D5D8001234DC001246FF00093DFF002752FF006583FC00238E56004DDA
        750039A543007CA5AC000938F300002DFF000028FF005549CD0085A155002DBB
        510026A63E0003700800FF00FF00FF00FF00FF00FF00FF00FF00B4898000FFFD
        EF00B9B6DB00133BE700194CFF001549FE000C3FFF00002FEC00238E56002FAE
        4600B9D8A10095A6FF00002AFF000032FF000032FF00303AD20075954E00047D
        110005710A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BA8C8100FFFE
        F600B9B6DB00183FE8002153FF001C4EFF001848FF00839EEF002C9A35002587
        3C00839EEF00133FFF00002FFF000032FF000031FF00303AD200829955000571
        0A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BC918300FFFE
        F600D5D9F7002744DB00285CFF002153FF00416BFF00EBF1F800248719001D6C
        6D001246FF001041FF000639FF000236FF00002DFF00434ABD00F4CC9B00C293
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C2938400FEFB
        F800FCFAFB004354D5002659FF00285AFF00416BFF00EBF1F800459233005792
        9600EAEAFB007E9BFF000236FF00093DFF000026F2007D70AC00FFE0AB00BE92
        8300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C5988600FBF8
        F700FFFFFF00A5A7E000163BE3003064FF002B5CFF0088A3FF008EBE9700CDE5
        C700D5D9F7003460FF001246FF000C3FFF001C33C900DEBFB000FFDDB400BD92
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CB9D8900FBF8
        F700FFFFFF00FFFFFE00777ACF001234DC003064FF002A5FFF005C82FF007E9B
        FF002659FF001E53FF001549FE00051EC400AC97B200FFEBBF00FFDDB400BD93
        8600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CDA08900FCF9
        F700FFFFFF00FFFFFF00FFFEFC009397DB002744DB002048EB001646F5000E41
        F6001646F500173CE3003B4AC800BBA9BF00FFEACA00FFE3C300FFE0BE00BE95
        8900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2A38B00FCF9
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFE00EAEAFB00B7B6E2008488D7008488
        D7008E8ECF00C1B6D000F6E5D600FFF2D500FEE7CD00FDE3C800FCDFC200BE95
        8900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D7A78C00FCF9
        F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFF
        F900FFFFF300FFFBE400BE908500BE908500BF918600BE908500BE908500AF81
        7500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DCAC8E00FCF9
        F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
        FC00FFFEF600FDF4E900BA8C8100CE9F7E00D7A27400D99C5F00DD984C00C186
        5800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DEAD8E00FDFA
        F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFE00FBF5F000BF928700E6BB8B00F6C07600F8B35200C1865800FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DEAD8E00FDFA
        F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FBF8F700BF938800E5B98900F2BE7500C1865800FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DEAD8E00FBF5
        F000FEFBFA00FDFAF800FDFAF800FCF9F800FCF9F800FCF9F700FCF9F700FBF8
        F700FCF9F800F7F1F000BF928700E5B98900C1865800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DCA88700DEAD
        8E00DEAD8E00DEAD8E00DCAC8E00D9A98C00D4A58B00D2A38B00CB9D8900C89B
        8700C4978600BE918300BA897C00C1865800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object ButtonTestData: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1074#1110#1088#1080#1090#1080' '#1072#1082#1090#1091#1072#1083#1100#1085#1110#1089#1090#1100' '#1076#1072#1085#1085#1080#1093
      Category = 0
      Hint = #1055#1077#1088#1077#1074#1110#1088#1080#1090#1080' '#1072#1082#1090#1091#1072#1083#1100#1085#1110#1089#1090#1100' '#1076#1072#1085#1085#1080#1093
      Visible = ivAlways
      OnClick = ButtonTestDataClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF035C08035C08035807025206024D05024804014303014103
        0141030141030141030141030141030141030141030141030141030141030138
        02013802FF00FFFF00FFFF00FF05750F056B0C06781205750F04700D036C0B03
        6909026406026306026306026306026306026306026306026306026306026306
        026406026406014E04013402013802FF00FFFF00FF05750F0DA0280EAC2B0CA9
        230AA71F08A51A07A31505A11103A00D03A00C03A00C03A00C03A00C03A00C03
        A00C03A00C03A00C03A00C03A40C03970B024E04013802FF00FFFF00FF098817
        12AD3611AF330EAB2B0CAA260AA92009A71C07A51705A41304A10F03A00C03A0
        0C03A00C03A00C03A00C03A00C03A00C03A00C03A40C03A40C026406014103FF
        00FFFF00FF0A8F1A16AD3D13AF3911AA320FAA2C0DA7270CA62309A41D07A318
        06A113049F0F039E0C039E0C039E0C039E0C039E0C039E0C039E0C03A00C03A0
        0C026406014103FF00FFFF00FF0B961E1AB04717B04316AC3B13AB3510AA300E
        A9290CA6230AA51F78CD82FFFFFFFFFFFFBFE7C2039E0C039E0C039E0C039E0C
        039E0C03A00C03A00C026306014103FF00FFFF00FF0C981F21B45220B4511CB1
        4618AD3E14AC3712AA330EA92B0DA7277ACF86FFFFFFFFFFFFC0E7C304A10F03
        9E0C039E0B039E0C039E0C03A00C03A00C026306014103FF00FFFF00FF0C981F
        29B85A2BBA5D24B7551EB24A19B14314AD3B13AB350FA92D0DA7280CA6230AA5
        1F08A31907A116059F11039E0D039E0C039E0C03A00C03A00C026306014103FF
        00FFFF00FF0C981F35BD6636BF682DBA5E24B7551FB44D19AF4216AD3D13AB35
        53C26AFFFFFFFFFFFF79CE8609A41D07A31705A013039E0F039E0C03A00C03A0
        0C026306014103FF00FFFF00FF0C981F47C57448C57635BD6625B75825B7581E
        B54E19B04516AD3E55C36FFFFFFFFFFFFFA0DDAB0CA62309A41E08A31906A015
        059F1103A10D03A00C026306014103FF00FFFF00FF0C981F58CB8259CB8441C1
        6E29B85A29B85A23B5551CB14E19B04558C676FFFFFFFFFFFFA2DEAE0EA9290C
        A6230AA52109A31B07A31505A31304A10D026406014103FF00FFFF00FF0C981F
        64CE8B66D08E47C5742DBA5E2DBA5D24B7561FB2501CB24D5AC77CFFFFFFFFFF
        FFA3DFB111AA320FAA2C0DA7270BA62309A41D07A51806A313036909024804FF
        00FFFF00FF0C981F6BD0906DD3954DC67830BB602EBA5F25B7581FB2501DB250
        5CC87FFFFFFFFFFFFFA4DFB413AC3911AA320FA92E0DA7280BA6230AA71F08A5
        1A056F0C025005FF00FFFF00FF0C981F6FD39573D49852C77D33BC6434BC6429
        B85A20B5521FB25083D59FFFFFFFFFFFFFA5E1B716B04114AD3B12AD3510AA30
        0EA9290CAA260BA72105750F035807FF00FFFF00FF0C981F73D39679D59C58CB
        8238BF683CC06B32BC6228B75A23B55585D7A0FFFFFFFFFFFFC6EBD31BB24B17
        B04316AD3E13AC3711AA320FAC2D0DA928067A11035F09FF00FFFF00FF0C981F
        76D49980D8A163CE8A3EC06C48C57541C16E35BD662DBA5E8AD8A5FFFFFFFFFF
        FFC6ECD31FB2501CB14D1AB04716AF4014AD3B12AD3510AA3008801604680AFF
        00FFFF00FF0C981F79D59C87DAA772D39541C16E48C57542C2703BC06A35BD66
        8EDAA8FFFFFFFFFFFFC8EDD523B5551FB2501DB2501AB14917AF4215AF3E13AC
        370A871A056F0CFF00FFFF00FF0C981F78D5998CDCAB87DAA558CB8252C77D4B
        C57742C2703EC06C37BD6632BC6237BD662DBA5E25B75820B5521FB2501DB250
        1AB14B18B14616AF400A8B1D05780DFF00FFFF00FF0C981F6FD39589DCA993DE
        AF8CDCAB87DAA580D7A075D4986BD0905ECC8752C77D46C47337BD662BBA5D23
        B5551FB2501DB2501CB24E1CB44E19B1490C932206810FFF00FFFF00FF0C991F
        63CE8A7AD79F89DCA990DDAD90DDAD8CDCAB86D9A57AD79F6FD39560CE894FC7
        7B3FC16E2FBB6325B8591FB6551DB5531CB4511DB5531CB4510E9826078911FF
        00FFFF00FF0C991F17AB4060CE896ED19278D59979D59C79D59C74D3976DD192
        63CE8A56C98048C5753ABF682DBA5D24B7561FB5521DB2501CB24E1CB45118AD
        44099518078911FF00FFFF00FFFF00FF0C981F0C981F0C981F0C981F0C981F0C
        981F0C981F0C981F0C981F0C981F0C981F0C981F0C981F0C981F0C981F0D9820
        0C981F0C981F089215089215FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object dxBarStatic5: TdxBarStatic
      Category = 0
      Visible = ivAlways
    end
    object CaptionIsAct: TdxBarStatic
      Caption = #1052#1086#1078#1083#1080#1074#1086', '#1090#1072#1073#1077#1083#1100' '#1084#1072#1108' '#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1110' '#1076#1072#1085#1110
      Category = 0
      Hint = #1052#1086#1078#1083#1080#1074#1086', '#1090#1072#1073#1077#1083#1100' '#1084#1072#1108' '#1085#1077#1072#1082#1090#1091#1072#1083#1100#1085#1110' '#1076#1072#1085#1110
      Visible = ivAlways
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF000D66000D66000C5F000B59000A53000A4D000947000945
        0009450009450009450009450009450009450009450009450009450009430007
        3C00073CFF00FFFF00FFFF00FF001084000F79001189001084000F7E000F7700
        0E70000D6A000D68000D68000D68000D68000D68000D68000D68000D68000D68
        000D6A000D6A000A5300073600073CFF00FFFF00FF0010840018C20019CF0018
        C70018C00017BB0016B60016B10015AC0015AA0015AA0015AA0015AA0015AA00
        15AA0015AA0015AA0015AA0016AF0013A0000A5300073CFF00FFFF00FF00139E
        001BD9001BD90019CF0018CA0018C50018C00017B80016B40016AF0015AA0015
        AA0015AA0015AA0015AA0015AA0015AA0015AA0016AF0016AF000D6A000943FF
        00FFFF00FF0015A7001CDE001BDC001AD40019CF0018C70018C50017BD0017B8
        0016B40015AC0015AA0015A70015A70015A70015A70015A70015A70015AA0015
        AA000D6A000945FF00FFFF00FF0016B1001EE6001EE3001CDC001CD7001CD100
        19CC0018C50018C07480DAFFFFFFFFFFFFBEC4EA0015A70015A70015A70015A7
        0015A70015AA0015AA000D68000945FF00FFFF00FF0016B60323EB0323EB0321
        E3011FDE001CD9001CD10019CC0018C77481DEFFFFFFFFFFFFBEC4EC0016AF00
        15A70015A70015A70015A70015AA0015AA000D68000945FF00FFFF00FF0016B6
        092BEF092CF00627EB0323E6021FE1001CDC001CD40019CF0018CA0018C50018
        C00017B80016B40016AF0015AA0015A70015A70015AA0015AA000D68000945FF
        00FFFF00FF0016B61437F01438F30D2FF00526EE0323E9011FE1001CDC001BD7
        485ADEFFFFFFFFFFFF7481DD0017BB0017B80016B10015AA0015A70015AA0015
        AA000D68000945FF00FFFF00FF0016B62748F22749F31437F00627EE0627EE03
        22EB001EE6001CDE485BE4FFFFFFFFFFFF9BA5EA0018C50017BD0017B80016B4
        0016AF0015AC0015AA000D68000945FF00FFFF00FF0016B63A5AF33A5BF41F41
        F0092BEF092BEF0323EE001FEB001CE9485CE9FFFFFFFFFFFF9BA6ED0019CC00
        18C50018C00017BB0016B60016B40016AF000D6A000945FF00FFFF00FF0016B6
        4565F44767F62748F20D2FF00C2DF00526EE0120EE001DEE485DF1FFFFFFFFFF
        FF9BA6F0001AD10019CC0018C70018C20017BD0017BB0016B4000E73000A4DFF
        00FFFF00FF0016B64D6BF4506FF62C4EF20F32F00E30F00627EE0120EE001FEE
        485DF3FFFFFFFFFFFF9BA6F2001BD9001AD40019CF0018CA0018C20018C20017
        BB000F79000B57FF00FFFF00FF0016B65370F45674F73253F31234F01335F009
        2BEF0322EE0120EE7485F6FFFFFFFFFFFF9BA6F6001CE3001BDC001BD7001AD1
        0019CC0018CA0018C2001082000C62FF00FFFF00FF0016B65674F45C79F73A5A
        F3173AF01B3EF01134F0092AEE0425EE7586F6FFFFFFFFFFFFBEC6FB001FEB00
        1CE3001CDE001BD9001AD4001AD10018CA00118B000D6AFF00FFFF00FF0016B6
        5B77F46681F74464F31C40F0284AF21F41F01437F00D2FF0788BF6FFFFFFFFFF
        FFBFC7FB0120EE001FEB001EE6001CE1001BDC001BD9001AD1001295000F75FF
        00FFFF00FF0016B65E7AF46E88F75572F41F41F0284AF22244F01A3CF01437F0
        7C8FF7FFFFFFFFFFFFC0C8FB0323EE0120EE001FEE001CE9001CE3001CDE001B
        D90013A0000F7EFF00FFFF00FF0016B65C78F4748EF76E88F73A5AF33253F32B
        4DF22244F01C40F01638F01134F01638F00D2FF00627EE0322EE0120EE001FEE
        001DEB001CE9001CE10014A5001187FF00FFFF00FF0016B65370F46F89F77D95
        F7768FF76D87F76680F65976F44D6BF4405FF33253F32547F21638F00A2DF004
        25EE0120EE001FEE001DEE001EF0001CE90016B1001292FF00FFFF00FF0017B8
        4263F65E7AF86F89F77891F77891F7748EF76B86F75F7DF7526FF64162F62D50
        F31C41F30E31F30527F00221F0001FF0001EF0001EF3001EF30017BB00139CFF
        00FFFF00FF0017B8001CDE4162F6526FF45C78F45F7BF65E7AF45875F4506EF4
        4464F33657F3284AF2183BF00C2DF00526EE0220EE001FEE001DEE001EF0001C
        E30015AC00139CFF00FFFF00FFFF00FF0016B60016B60016B60016B60016B600
        16B60016B60016B60016B60016B60016B60016B60016B60016B60016B60018B6
        0016B60016B60015A70015A7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object Styles: TcxStyleRepository
    Left = 744
    Top = 12
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14740222
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object StyleOutPut: TcxStyle
      AssignedValues = [svBitmap, svColor, svFont, svTextColor]
      Color = 13827759
      Bitmap.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF0045434600FF00FF002322230022212200201F20004F4D4F00CAC6CA004746
        4700756F7400696367004C494B00B29DA90089838600575355002D2B2C009892
        9500413F4000F6F0F300C1A7B2005F525700E3DEE000B7939F00322F30003A37
        38003F3C3D00403D3E0066636400C3C0C100A1838B009C828900746D6F003531
        32007E7A7B00BDB9BA009E898E00A78B91008A737800C3B0B400443F40005D58
        5900D9D4D500816B6F00BFAFB200BDB2B4007B757600B7B1B200BCB5B600B68F
        9300584F500062595A0069616200978F9000A0989900CBBFC000897777009481
        81004C454500867A7A0049434300645C5C003F3A3A008076760035313100A59A
        9A004F4A4A00312E2E00DACECE00353232003B38380027252500252323008B84
        84002C2A2A00D4CBCB00A49D9D008C868600625E5E005F5B5B002F2D2D00E3DB
        DB005552520038363600363434001D1C1C00ABA6A600A4A0A0009E9A9A005351
        510028272700F3EEEE00DCD7D700B1ADAD00AEAAAA0058565600A09D9D003938
        3800FFFCFC00FAF7F7009290900083818100424141005756560079676600BFAD
        AC00A5979600C5B8B700CABDBC007B6A68008B7A78007A706F0081787700C0B7
        B600DDD4D300504847005A535200928A89008F888700C3BCBB00EDE5E4006256
        5400A4939000AB9A9700413B3A004E484700ACA09E00817B7A009E989700BDB7
        B600BCB6B500BBB5B4008F807D0062585600B5A7A40046414000AF9E9A00A696
        92005D5553002F2B2A00766D6B003C383700413D3C00716D6C0073686500766B
        68005D5654007A73710076625C003F3C3B004A47460068656400F1EBE9009174
        6800998F8B00CFC5C100A2817200B58C78006B65620036343300403E3D008B86
        83009E8C7E00837E7A00181716002726250025242300333231002F2E2D003D3C
        3B003C3B3A004B4A49007A644D00786E6300FFC989008A745B00D2B68E006A62
        540046454300FFE6AA00FFF7E300FFFFD7002F2F2E003E3E3D003D3D3C004343
        420040403F005E604E00585B4D006C6F62003334320089B26A004D58470077BB
        5A003C683A00494A4900007801000EAF1A00094D0D0051A4560005A013001195
        1E00037D1200057E13002D57320027AD390007A52100079D1F0015BF310009B6
        2B0013C03600107A26000D932D000EAC350011AF390019C0490025C551000059
        22000EA8500028D57200019F520024AA6C0032845E0073BBA30046977E004DCE
        C20032353500151616001B1C1C001E1F1F000087AC00006884000F5A6E001315
        1600161819006C7980000084D800181A1C0011121300292B2D001F2021001516
        180017181A00333539005252560019191A0058585B001D1D1E00232324007070
        7200414141002D2D2D00252525001B1B1B001313130010101000030303030303
        030303030303030303030303F1F7F806EA0303030303E3281A55A4EEE9ED4A28
        543E3C79686EA285EA030303E38D7C8A3B96193C343B1F2517319D9C6D333991
        F50303F7337A8A527E6F34B92724A3BDC0C2E8E8E7D9B12B550303FF6A7B8A59
        868C0C661FC6CAD4C8DCECECDCC4BB26E50303FF6A883D5FA159FA6625C4C8D8
        D8E6ECDAC5CBBC39050303FF7E869E4F22BA35120DCAC8C9DDE6DAD0D2CEBC1F
        470303FF86698F4F7FA0411B14D3D2CFD4E0CDD5D6D1C21E4A0303FF2D6B7029
        65B7801A27DEDBD7C1B3B0BFC7D4CC25540303FF6C9BA3595E97B8952CE0E1DF
        B09D9C9994C0C089460303FF37447FAB773064AA5BEBEBEB2E0A0A200B15327D
        400303FF4B78490981815DA9562E74421A53454318214A03030303FF71084E96
        822F23A5051019521C8CFC5A75B60303030303FF22AD8BC35E83641267BE6709
        293CA7619AB603030303EFF3A2AEAC020E714E57015C589307A7A5059AA80303
        0303E20FB0B5AF59F92F4208019878165C777E7676A803030303A03313B5AFF4
        2275590163512A4B9B376C7241E503030303537398B4B1F6368A600101625B78
        514B774C42030303030303433F913A93883E651D1D2356114D8FAB283A030303
        0303030387E5E5408E9F1048A4049287FE9538888950F2030303030303030303
        030303030303FD39393242843855F1F0030303030303030303030303030303F7
        E484907CA604FB550303030303030303030303030303030303E5558EB276A355
        0303030303030303030303030303030303030304555555030303}
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object StyleHoliday: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14870782
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBtnText
    end
    object StyleSimple: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15912375
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object StyleSimple1: TcxStyle
    end
    object cxStyleTshAbsHeader: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInactiveCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StyleBold: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clHighlight
    end
    object StyleFio: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object StyleNotDay: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12763326
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object StyleSelect: TcxStyle
      AssignedValues = [svColor]
      Color = 16777088
    end
    object StyleSelect1: TcxStyle
      AssignedValues = [svColor]
      Color = 4707838
    end
    object StyleTypeTshCon: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -7
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StyleBackGround: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16056319
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StyleHistory1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      BuiltIn = True
    end
  end
end
