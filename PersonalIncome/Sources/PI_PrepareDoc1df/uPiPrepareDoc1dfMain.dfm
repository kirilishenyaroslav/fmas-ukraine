object fmPrepareDocMain: TfmPrepareDocMain
  Left = 253
  Top = 243
  Width = 1000
  Height = 640
  Caption = #1055#1110#1076#1075#1086#1090#1086#1074#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxSplitter1: TcxSplitter
    Left = 417
    Top = 48
    Width = 8
    Height = 513
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 100
    Control = PanelPeople
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 561
    Width = 984
    Height = 20
    Panels = <
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
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  object PanelPeople: TPanel
    Left = 0
    Top = 48
    Width = 417
    Height = 513
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object GridView: TcxGrid
      Left = 0
      Top = 0
      Width = 417
      Height = 455
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      object GridDBView: TcxGridDBTableView
        OnDblClick = GridDBViewDblClick
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = Grid1ClYear
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object Grid1ClYear: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Focusing = False
          Width = 46
          DataBinding.FieldName = 'date_doc'
        end
        object grid1ClPachka: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 51
          DataBinding.FieldName = 'num_doc'
        end
        object Grid1ClType: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 56
          DataBinding.FieldName = 'name_type_doc'
        end
        object AddReport: TcxGridDBColumn
          Caption = #1047#1074#1110#1090' 1'#1076#1092
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ReadOnly = False
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'added_in_1df'
        end
      end
      object GridViewLevel1: TcxGridLevel
        GridView = GridDBView
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 455
      Width = 417
      Height = 58
      Align = alBottom
      TabOrder = 1
      object cxLabel1: TcxLabel
        Left = 8
        Top = 8
        Width = 161
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Caption = #1055#1088#1080#1074#39#1103#1079#1082#1072' '#1076#1086' '#1079#1074#1110#1090#1091' 1'#1076#1092
      end
      object DBLabelDoc1df: TcxDBLabel
        Left = 176
        Top = 8
        Width = 233
        Height = 17
        DataBinding.DataField = 'info_1df'
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object cxLabel2: TcxLabel
        Left = 8
        Top = 32
        Width = 161
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1079#1072#1087#1080#1089#1110#1074
      end
      object LabelCount: TcxLabel
        Left = 176
        Top = 29
        Width = 161
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
        Caption = ''
      end
    end
  end
  object dxStatusBar2: TdxStatusBar
    Left = 0
    Top = 581
    Width = 984
    Height = 20
    Panels = <
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
        PanelStyle.Alignment = taCenter
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfStandard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  object dxDockSite1: TdxDockSite
    Left = 425
    Top = 48
    Width = 488
    Height = 513
    Align = alClient
    DockType = 0
    OriginalWidth = 488
    OriginalHeight = 513
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 488
      Height = 513
      DockType = 1
      OriginalWidth = 300
      OriginalHeight = 200
    end
    object DockPanel1: TdxDockPanel
      Left = 0
      Top = 0
      Width = 488
      Height = 513
      AllowFloating = True
      AutoHide = False
      Caption = 'DockPanel1'
      CaptionButtons = []
      Dockable = False
      DockType = 1
      OriginalWidth = 462
      OriginalHeight = 209
      object Grid2: TcxGrid
        Left = 0
        Top = 0
        Width = 484
        Height = 486
        Align = alClient
        BorderStyle = cxcbsNone
        PopupMenu = PopupMenu
        TabOrder = 0
        object Grid2DBBandedTableView1: TcxGridDBBandedTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00;-0.00'
              Kind = skSum
              FieldName = 'SUM_NAR'
              Column = Grid2ClSumNar
            end
            item
              Format = '0.00;-0.00'
              Kind = skSum
              FieldName = 'SUM_Doh'
              Column = Grid2ClSumDoh
            end
            item
              Format = '0.00;-0.00'
              Kind = skSum
              FieldName = 'SUM_TAXN'
              Column = Grid2ClSumTaxN
            end
            item
              Format = '0.00;-0.00'
              Kind = skSum
              FieldName = 'SUM_TaxD'
              Column = Grid2ClSumTaxD
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.IncSearch = True
          OptionsCustomize.BandSizing = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          OptionsView.BandHeaders = False
          Preview.Place = ppTop
          Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
          Bands = <
            item
              Width = 237
            end
            item
              Width = 168
            end
            item
              Width = 148
            end
            item
              Width = 110
            end>
          object Grid2ClTinPasport: TcxGridDBBandedColumn
            Caption = #1030#1076'. '#1085#1086#1084#1077#1088
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle29
            Width = 96
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 1
            DataBinding.FieldName = 'TIN'
          end
          object Grid2ClSumNar: TcxGridDBBandedColumn
            Caption = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUM_NAR'
          end
          object Grid2ClSumDoh: TcxGridDBBandedColumn
            Caption = #1057#1087#1083#1072#1095#1077#1085#1086
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 78
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUM_DOH'
          end
          object Grid2ClSumTaxN: TcxGridDBBandedColumn
            Caption = #1059#1090#1088#1080#1084#1072#1085#1086
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 62
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUM_TAXN'
          end
          object Grid2ClSumTaxD: TcxGridDBBandedColumn
            Caption = #1055#1077#1088#1077#1088#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 68
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUM_TAXD'
          end
          object Grid2ClKod1df: TcxGridDBBandedColumn
            Caption = #1054#1079#1085#1072#1082#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle29
            Width = 53
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 1
            DataBinding.FieldName = 'kod_prop'
          end
          object Grid2ClPSoc: TcxGridDBBandedColumn
            Caption = #1055#1110#1083#1100#1075#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Styles.Content = cxStyle29
            Width = 59
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 1
            DataBinding.FieldName = 'kod_priv'
          end
          object Grid2ClDateCame: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1080#1081#1085#1103#1090#1090#1103
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 36
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATE_ACCEPT'
          end
          object Grid2ClDateLeave: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1079#1074#1110#1083#1100#1085#1077#1085#1085#1103
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 33
            Position.BandIndex = 3
            Position.ColIndex = 1
            Position.LineCount = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATE_DISMISS'
          end
          object Grid2ClFio: TcxGridDBBandedColumn
            Caption = #1055'.'#1030'.'#1041
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 208
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'FIO'
          end
        end
        object Grid2Level1: TcxGridLevel
          GridView = Grid2DBBandedTableView1
        end
      end
      object BarDockLocate: TdxBarDockControl
        Left = 0
        Top = 486
        Width = 484
        Height = 5
        Align = dalBottom
        BarManager = BarManager
      end
    end
  end
  object BarManager: TdxBarManager
    AllowReset = False
    AutoDockColor = False
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
        Caption = 'ButtonsControlBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 287
        FloatTop = 193
        FloatClientWidth = 73
        FloatClientHeight = 176
        ItemLinks = <
          item
            Item = AddPack
            Visible = True
          end
          item
            Item = EditPack
            Visible = True
          end
          item
            Item = DelPack
            Visible = True
          end
          item
            Item = SelPack
            Visible = True
          end
          item
            Item = ClonButton
            Visible = True
          end
          item
            Item = RefreshBtn
            Visible = True
          end
          item
            BeginGroup = True
            Item = ExitBtn
            Visible = True
          end>
        Name = 'ButtonsControlBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        BorderStyle = bbsNone
        Caption = 'rControlBar'
        DockedDockingStyle = dsRight
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsRight
        FloatLeft = 404
        FloatTop = 341
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = InsertBtn
            Visible = True
          end
          item
            Item = UpdateBtn
            Visible = True
          end
          item
            Item = DeleteBtn
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = ClearBtn
            Visible = True
          end>
        Name = 'rControlBar'
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        UseOwnFont = False
        UseRecentItems = False
        Visible = True
        WholeRow = True
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
    Left = 664
    Top = 48
    DockControlHeights = (
      0
      71
      48
      0)
    object RefreshBtn: TdxBarLargeButton
      Caption = #1054#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1054#1085#1086#1074#1080#1090#1080
      Visible = ivAlways
      ShortCut = 116
      OnClick = RefreshBtnClick
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
    object ExitBtn: TdxBarLargeButton
      Align = iaRight
      Caption = #1042#1080#1093#1110#1076
      Category = 0
      Hint = #1042#1080#1093#1110#1076
      Visible = ivAlways
      ShortCut = 27
      OnClick = ExitBtnClick
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
    object AddPack: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      ShortCut = 16429
      OnClick = AddPackClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
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
    object InsertBtn: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      ShortCut = 45
      OnClick = InsertBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
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
    object DeleteBtn: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      ShortCut = 46
      OnClick = DeleteBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
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
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object DetailBtn: TdxBarLargeButton
      Caption = 'DetailBtn'
      Category = 0
      Hint = 'DetailBtn'
      Visible = ivAlways
      ShortCut = 32
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
        5980504BFF00FFFF00FFFF00FFFF00FF646365314B62AC7D7EF6DAB6F3D5ADF2
        D1A5F0CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080
        EBC080EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FF5084B20F6FE1325F
        8CB87E7AF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9
        BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
        32A0FE37A1FF106FE2325F8BB67D79F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC5
        8FEBC189EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79F2D4B0F0D1AA
        EFCEA3EECB9CEDC795EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC
        7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF93656037A4FE359EFF0F6FDE35
        608BA67B7FF2D5B1F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9BF82E9BD7F
        E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2
        D338A5FE329DFF156DCE444F5BDAB8A0925D5A986660935E5B9A6663B88A74D7
        AB82EBC189E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
        FF00FF986963F2E6DAFAEEDE3BABFFA1CAE78F6D6B96665FC2A38CE9DCB7FBF8
        CBE7DCB6BF9A899D6B66CB9E7BEBC189E9BD81EABF7FE7BC7E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCB49291A06D66EDD4A4
        FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAE3D3CC96635FD5AB82EBC188EABF82E7BB
        7E80504BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3A1
        6C67C79F81F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFFFAFFFFFFB79387B88A73
        EBC48EEBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3
        F0FEFBF6FBF3EB9D6A64E7C28EEEB87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFF
        FFE6DCCEAD996560EDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FF
        FF00FFAC7969FAF6F4FFFFFEFEF8F3935F5BF7D495EAA76CF7DAA3FFFFCEFFFF
        D4FFFFE1FFFFE3FFFFD7F6F2C9935E5BEECB9CEEC996EAC18E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFB9E6B65E9C793EAA96A
        EFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1E1D1B0996660EFCEA1EECB9CEBC5
        9280504BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFA4
        706BCBA989F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8C6FFFFCFBB9984BB8F7E
        F0D1A9F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6
        F4FFFFFFFFFFFFE5D5D5A07068EDE3E2FFF4E2EFBD80EBAB6FF0C086FBDEA3EB
        D9A9986760DAB89FF0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FF
        FF00FFC0896FFBF7F4FFFFFFFFFFFFFFFFFFD7C0BF9E6F6BC6A999EAD19EFADA
        9CE9C793C59D829D6A64D0AC9CF3DCBDE5CEAFC4B096A1927F80504BFF00FFFF
        00FFFF00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFE5D5D5
        A4766A9A6862935F5B9E6A64BD988FE0C4B5FAE9D0E0D0BAB8AB9AA79C8BA497
        8680504BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B
        95655B96655B96655B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDA
        C0B69F675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFBFFFEF7DDC4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572
        A5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E689F675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object UpdateBtn: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      ShortCut = 113
      OnClick = UpdateBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
    end
    object DelPack: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      ShortCut = 16430
      OnClick = DelPackClick
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
    object SelPack: TdxBarLargeButton
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Category = 0
      Hint = #1042#1080#1073#1088#1072#1090#1080
      Visible = ivNever
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
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
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000118C1F00004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000138F230007931000169C
        2800004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00004B0000159127000FA01D000B9916000896
        1100159A2700004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B00000F811C001AAF310014A727000FA11F000C9A
        18000896120013992500004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00004B00000E7D1A0028C0480021B83D001BB0330013902400004B
        0000169D29000997130013982300004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00000C77170035CF5E002FC9540028C149001B9F3100004B0000FF00
        FF00004B00000D9E1B000997140011972200004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00003FD96F003BD7680036D0600020AA3B00004B0000FF00FF00FF00
        FF00FF00FF00004B0000097411000A99150011962000004B0000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00001C9C340041DC700023AD4100004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00004B00000B99160010951F00004B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00004B00002EC15200004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B00000C9A180009961200004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000046408000996
        1300004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B
        000007740E00004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B0000035E0600004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B0000004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000FF00FF00FF00FF00FF00
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
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
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
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000118C1F00004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000138F230007931000169C
        2800004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00004B0000159127000FA01D000B9916000896
        1100159A2700004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B00000F811C001AAF310014A727000FA11F000C9A
        18000896120013992500004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00004B00000E7D1A0028C0480021B83D001BB0330013902400004B
        0000169D29000997130013982300004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00000C77170035CF5E002FC9540028C149001B9F3100004B0000FF00
        FF00004B00000D9E1B000997140011972200004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00003FD96F003BD7680036D0600020AA3B00004B0000FF00FF00FF00
        FF00FF00FF00004B0000097411000A99150011962000004B0000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B00001C9C340041DC700023AD4100004B0000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00004B00000B99160010951F00004B0000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00004B00002EC15200004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B00000C9A180009961200004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000046408000996
        1300004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00004B
        000007740E00004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00004B0000035E0600004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00004B0000004B0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00004B0000FF00FF00FF00FF00FF00
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
    end
    object ImportBtn: TdxBarLargeButton
      Align = iaCenter
      Caption = 'ImportBtn'
      Category = 0
      Hint = 'ImportBtn'
      Visible = ivNever
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00F4F2FA00F6F3F800F2EEF400FF00FF008C6F7D00CFBBC500D4BFC900C6B1
        BA00D4A1B40096758100E0C0CC00E2C6CF009D576A00BCA3AA00D4C5C900E9DA
        DE009A747D009A636F0097697300DDCACE00F2EDEE008F636B00916870008263
        6900B28A9000834F5600B29C9F00AF959800DED4D500BD9FA000C5ABAC00653B
        3B00E7E0E000EFEAEA00C1A5A400D1BDBA00E6DCDA00B196900068494100AD8C
        8300BB9F97009E270000D1BDB700A05F48007E4D3C00BFA09500E2D7D300A630
        0000A9745E00C1A49800CAB4AB00A933010096330600872D0700C7AFA400A538
        00008F32020096492200CFBAB000D0C2BB00AB491200D1BBAF00C1480000B141
        0000D3AC9500BB998400C19F8B00DC5B00009F400200A4420300B04A0400A747
        0500A3480B00B4500D00AB7F6000DED0C700D95C0000D4BBA900D35E0100DC67
        0300D96D1300B0896A0064350B00A5764C00B18E7000D4B59800A9682600A774
        4000AB845F00C19A7500C9721200935B1C00B46E2300AB6F2E00C07F3600B787
        5200C5700D00CA7B1B00C2833A00B88F6000D0842000BF7A2300CB862F00C181
        3100CC914100CC995400D3A36400CBA36D00E08C1700E3962500D48B2600D893
        3000D9983B00E19F3A00CF9E5100D9A95D00D5B48100DCBF9100E2A94700EAB1
        5100DAB26F00DDB87A00EFBD5F00E6BA6800E7BD6F00EFDAA100DDD1B200FEE7
        9F00E6D8AD00F7E9AC00F0E6AB0055561A003C432300384923006E8364003F74
        2D00345C280015480D001C4F16003D7239000C4F090000510000004D0000004C
        0000004B0000004A00000044000001500100014C0100025202001F681F000056
        0100004F0100015303000151020002540300024F030003560400578C5800005C
        0400035E06000358060005600900055E080007590A00036A0A00096A0F00056E
        0E00077711000C6F14000D731500107D1B000C841A0011801E00117F1E001282
        1F0016892400187D230034964000118B220016902800168C2700168B26001B97
        2D001FA0350063AC6E0017952F0023AB3E0025AF410018A539001EB4400024B8
        45002ABA4A002BBD4B002DBF4E0031C755002EB64E002EC9540034DE5F004BD1
        6E0039DA64003ADA650041F3750043F4770051C9FF004DC2FF0050C6FF0046B8
        FF0048B8FE0042B4FF003DA5EA002E8BD3003090D8003395DC003595DC003DA7
        F20041B0FF002C8ADA00287FC7002D8BD9002E8CD7002889ED002070BD002F99
        FF001F70C5001C79E9001F83FF001F82FA002086FF002087FF002188FF00258B
        FF000A4391000D4DA1000C489800135FC4001462C6001C7FFF001972E3001F81
        FF00115DC6000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000050505050505
        96969C9B9D979C9A92930505050505050505050505059EA8AFB8B7B2B1ADACA8
        A49F9591050505050505050594ABBDC4C2BEBAB9B6B5AEAAA9A7A29B91920505
        050505A5B0CACBC5C3C1C0BFBCB3988A878CA6A199909205050505A3CACDC8C7
        C6B48985542E1D1A211B28868B979005050505A5CCC9A0885D4836352B2D081F
        2117130E218E8F0505050505A5BB0A0C52454641312D071F2117181321930505
        05050505A58D0D155C504A4B3E32102421181414210505050505050505211511
        574224242009070F21060B122105050505050505052125251C27435B4C61605E
        213B2E1921050505050505050521767B5574787358666E6221403A3721050505
        0505050505218381657E7C795F716F63214E473921050505050505050521827F
        5A7B7D75596A726921514941210505050505050505213D4D343C34382A2F3329
        ECECECECECECECEC0505050505215777536D6C6B5964685EECD7D5D8D4DCDCEC
        0505050505218481617D7C785F706E5CECD6CED0D2E0EA050505050505218082
        56767A75596A7167ECDECFD1DADFEC050505050505211E232226304D2C3F4F44
        ECDDD9D3E1E9F0EC05050505052123231604030203040202ECDBECE2E7EFE8E3
        EC050505052121212121212121212121ECEC21ECF2E6F1E5EBEC050505050505
        050505050505050505050505ECEEE4EDEC050505050505050505050505050505
        0505050505ECEDEC05050505050505050505050505050505050505050505EC05
        0505050505050505050505050505050505050505050505050505}
    end
    object GenerateBtn: TdxBarLargeButton
      Caption = 'GenerateBtn'
      Category = 0
      Hint = 'GenerateBtn'
      Visible = ivNever
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000FF00FF00004B
        0000035E06000464080007740E00097411000C7717000E7D1A00A4262600B02E
        2E00B6393900B83F3F00BA424200BC484800BF4D4D00C0515100C1555500C459
        5900C6616100C9666600CC6F6F00CC707000CE757500D17E7E000F811C00118C
        1F000793100008961200099714000A9915000C9A18000D9E1B0010951F000FA0
        1E00138F23001196210013902400159127001398230013992500159A2700169C
        28001B9F31001C9C340014A727001AAF31001BB0330020AA3B0021B83D0023AD
        410028C048002EC152002FC9540035CF5E0036D060003BD768003FD96F0041DC
        7000D3808000D4848400D6898900000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000001000000000000000000000000
        0000000000000000000001190100000000000000000000000000000000000000
        0001221A29010000000000000000000000000000000000000125211D1B280100
        00000000000000000000000000000001182D2C211E1B28010000000000000000
        000000000000010732302E2501291B2801000000000000000000000000010635
        34322A0100011E1D25010000000000000000000000013837362F010800000104
        1D280100000000000000000000012A3931010D1008000000011D200100000000
        000000000008013301100D0D1008000000011E1B0100000000000000080C1401
        120D08100C100800000001031B010000000000080B17161611080008100C1008
        0000000001040100000000083C3B3B1208000000080A0D0D0800000000010201
        00000008113C1308000000000000080D10080000000000010100000008160800
        00000000000000080D0D08000000000000010000000800000000000000000000
        08090D0800000000000000000000000000000000000000000000080A08000000
        0000000000000000000000000000000000000008090800000000000000000000
        0000000000000000000000000008080000000000000000000000000000000000
        0000000000000008000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object DeleteTempBtn: TdxBarLargeButton
      Caption = 'DeleteTempBtn'
      Category = 0
      Hint = 'DeleteTempBtn'
      Visible = ivNever
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00FEB78100FEC29500F4AD7200FAB57E00FFBF8B00FFC69800FECC
        A400FFCEA600FCD5B400FFDEC200EDA05800EDA66700EEA96900EEAA6B00F4B1
        7500F0B17600F2B27800F4B57D00F3B67D00F2B67E00F3B78000FABC8400F7BB
        8400F8BD8600F8BD8A00F6BD8900F7C08E00F7C19000FCC99A00FAC69900F8C5
        9800FFCC9F00FAC99C00FBC99E00FBCBA100FCD0A900EB9D4E00EDA15400EDA1
        5500EDA35900EBA15900EDA45C00EEA76200EEA96500EEAA6900EEAB6C00F0AD
        6E00EEAC6D00EFAF6F00EEAD6F00F0B07300EFAF7200EFB07300EFB27400F0B4
        7700EFB27600F3B57900F4B67A00F2B57A00F2B57B00F8BC8300FABF8700F7BF
        8600FAC08800FAC08900F4BC8700FBC48C00F6BF8B00F6C08C00F4C08B00F4C0
        8F00FFCB9700FFCE9C00FCD3AB00FCD4AD00FED7AF00FED8B200F7D5B200EDA3
        5500EEA75C00EFB47600F2B77A00F0B77B00F0BA7F00F2BC8200F2BD8300F8C1
        8800FAD1A300FFD7AB00FED9B200FEDAB400E5B17400F0BC8100F3BF8400F2BF
        8400F3C08600F3C18700F4C58B00F3C28A00F4C68F00F8CB9500FFD9AD00FEDC
        B500FEDDB600FEDEB700F8DDBC00F3C07E00F3C99100E3BC8700F4CA9200F4CB
        9500FAD4A000FFE2BC00F4C48100F6CE9700F6D09A00FCD9A700FFDEB000FEE3
        BB00F6D09500F6D39E00F8D7A300F7D7A400F8DAA900FFE2B400FEE5BD00E2C1
        8A00F7D49900F8D9A100E2C69300F7DAA600FEE7BF00FBE9CB00FAE2B100FCE6
        BB00FEE9C000FEEAC200FFEDCA00FBE5B500FBE5B600FAE5B600FAF6ED00FBE6
        B600FEEDC400FFEEC600FEEDC500FFEFC700FCEDC700FBEABD00FFF0C700FFF2
        D000FFF3D400FBEBBB00FFF2C900FFF2CA00FCEFC200FEF2C600EEE2BA00FEF3
        C900FFF8DA00D0C28400FCF2C600FFF6CA00FFF6CC00FFF7CF00E9E1B400FEF7
        CE00FFF8D000FFF8D100CBC48B00D3CC9300FFFBD300FFFCD400FEFBD300FFFE
        D500E9E9C200FFFFD800FFFFD900F0F0CC00FFFFDC00FFFFE000FBFCE000BAC0
        7B00C9CE9100EAEEC600C7D3A300A4BB6F00D3E5B400CADEB100B1CC95007EAD
        550099C17400EEF4E90082B763008BBF7200E7F3E2004A9A2F0058A54100FBFE
        FA007EBF6C00429D30003C9C2D00CAE6C500EBF6E900B1DAAB00379C2C0052AD
        4800A3D59E00C0E2BC002F9927003199280039A031003FA4360062B65B0067B7
        600083C67E00B1DCAD0021921A002697210033A02E0045A7410062B75E007DC5
        79000D890B00138B11001F931B0038A1340045A942004FAF4C0066BA63006DBD
        6A00007B000000790000007800000076000000730000017F0100017E01000481
        03000380030006830500098608000A8709000A8609000D880C001F951E000180
        0200028103000000000000000000000000000000000000000000020202020202
        020202020202020202020202020202020202020202020202103956553A313233
        3202020202020202020202020202027588887C705F3733546264613632020202
        02020202020288AFA98E7C6E4111310722687F8E63320202020202020202A4B3
        A18D7C67A38149C1C8C4A8A7A557320202020202020276B4A98F7D4BBDD5CCEA
        EBECE4BEB77E32020202020202300F709F9E854AB9F9EAEFF1E2EDDEB8723202
        020202020230100E537B8878BAF3EAF6CFCE32FAC20332320202020202343634
        100F331AADFAECEBE9C901E1C706103202020202023D17163E1312056FDFE6E7
        D9C60101C05E10320202020232471E1D461C441984900101C3CDD3DBBC153032
        020202021325252423202108ACD80101D2F7F2EACB04353502020202484F4D4C
        2626260A50DCE80101DAEAEAD0091414020202025A736B6A695D5C4E0CC5EBE5
        E0F8F0EAD40B1B1B3202023886948B8A868080797387D6EEEDEAEAF5DD6C1F1F
        32020260A7A7A69D9C989593928CB2D1E3F4D7BFCAA05B5B32020276B4AEAEAE
        AEABAAAAA7A6ABA2B5BB9A999996898932020288B4AEAEAEAEAEAEAEAEAFB1B4
        B6B4B4AFAAA7A1A154020297B4AEAEAEAEAFAFB1B4B4A48274747A91A6B3B1B1
        62020270B0B4B3B1AFAEA99B836D522727272B3359779C9C6E02020256757166
        6558382E2C0D2928282A2F3B1A1845411A020202020202020202020202020202
        512D353F434240401A02020202020202020202020202020202023C4242424242
        4302020202020202020202020202020202020202424242420202}
    end
    object SettingsBtn: TdxBarLargeButton
      Caption = 'SettingsBtn'
      Category = 0
      Hint = 'SettingsBtn'
      Visible = ivNever
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00908E9100FF00FF00D5A9A900AF959500B2989800A7909000A5929200A390
        9000A08F8F00998A8A009D8F8F0093878700938A8A0089828200908989008C87
        87007D7A7A007D7B7B007B7979009C9A9A0089878700F2F0F000E9E7E700E0DE
        DE00C9C7C700BFBDBD007F7E7E00F3F2F200EAE9E900DEDDDD00B8B7B700A6A5
        A5008C8B8B006DE5FF0079E7FF007FE9FF0080E6FC0083EAFF0043D9FF00369D
        B7004EDCFF0062E1FF0054BFDA005DD1ED006AE1FF004893A6006FDCF70074E3
        FF0075E3FF0075E6FF0077E1FA007BE2FB0083E6FF005B9FAF0093EAFF0095EA
        FF007DBBC900A5EEFF00AFEFFF00B7F2FF00BAF2FF0010BAEB0012C9FE0013C9
        FE0015CAFE0018CAFE001ACCFE001CCCFE001DCCFE001FCEFE0023CEFE0023C2
        F00029D1FE002BD0FE002FD1FE0028A6C90033D4FE0035CEF70037D4FE003BD5
        FE0044D7FE003FBADA0045C6EA004DD9FE0052DAFF0049BCDA005BDDFF005CDD
        FF004DB6D10058CBEA0064D3F3006BD8F6007AE3FF0084E6FF005589970006C4
        FE0006B1E9000BC6FE000BBFF4000CC6FE000FC7FE0016C4F7001ABDF00029B8
        E2003BBBE20041ABCE0054C9EE004EB8D90058CBEF005CCEF0005FD0F2005ECA
        EA0067CCEA0090D5EA0006ABE2000693C700099ACE000BACE2000F9DCE00158E
        BB001693C1001893C1001EA7D500219DC900229CC70027A4CE002DABD5002D9A
        C2002F9CC4002E98BF003FBAE70040BAE7003AA7CF0042BCE90046BFEA0049C1
        EB004DC4ED0051C6EE0051A9C90076C2DC000689BD00078BBF000782B4000D8A
        BB000C7FAD000F7AA7001180AD001681AD001882AD001C8AB5001A7EA7001C7E
        A7001F8BB500208AB50028A9DE002084AD002CA9DC002EADE1002382A60032B0
        E20035B2E30038B5E5003BB7E600459FC1007F8486000777A700076F9F000978
        A7000973A100096D9C000A78A7000A72A1000B78A7000A6D9A000C79AC000C6D
        9A000D74A3000E74A1001496D3001179A900169AD700117AA7001380B0001176
        A100189CD800137AA700137BA7001B9ED9001C9FD9001B90C2001FA1DA0022A4
        DC001A7DA70025A6DD00056695000973A500096D9E000A75A9000A73A5000B78
        AC000D7FB5000B6D9C00118CC600128FCA001699D700888A8E00D3D3D300BDBD
        BD00B2B2B200AFAFAF00A9A9A9009D9D9D009999990096969600939393008E8E
        8E008989890087878700838383007E7E7E007777770000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000030303030303
        03030303C4AE79C403030303030303030303030303030303030303039149697D
        C403030303030303030303030303C47E7AAAC4A778AC7B93ABC4B98386C40303
        030303030303B77F7C68777690404C80975B276D81C40303030303030303C482
        6BBC90A967654852959A98A58DC40303030303C4CB9BB36F3533544F47654350
        59723C3E3E99B5C4030303C23871BB8B30252B284A40664B553238365692859E
        AD0303B1B2B0BF885C26232A4E446342454161616162758FA80303C4B4CEC1A4
        6E34242D372F60293F616161616161618E0303C4C7CEBDA18A5D3ADA21D71009
        CF4D616161616174C40303C49DCCB69C8770A619D1D710060402646146516AC6
        C40303C4CACECEC0A36CD718D1D7100604055A5E3B3E3E8CC40303C4C9CDCEBA
        9F89D718D1D7100604052C2E393D73A5C403030303C4C7CEC384D718D1D71006
        040557585FC2C403030303030303C5CEBEA2D718D1D710060405535531AF0303
        030303030303C4C5C8B8D718D1D710060405A09496C403030303030303030303
        0303D718D1D71006040503030303030303030303030303030303D718D1D71006
        040503030303030303030303030303030303D7D3DCDD13120B07030303030303
        03030303030303030303DE1520D5160C0A140303030303030303030303030303
        0303D91DD0D2D811080D03030303030303030303030303030303DB171E1AD422
        0E0F0303030303030303030303030303030303D91F191BD61C03030303030303
        030303030303030303030303DEDEDEDE03030303030303030303}
    end
    object EditPack: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      OnClick = EditPackClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
        35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
        6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
        7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
        8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
        9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
        360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
        6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
        68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
        FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
        6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
        56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
        E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
        E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
        CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
        7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
        D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
        88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
        4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
        9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
        D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
        7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
        5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
        4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
        4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
        F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
        FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
        4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
        9D0004689A000459830005679800064F7500182A33001B506E00315065003547
        56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
        B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
        BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
        0404040404040404040404040404040404043506060606060606060606060606
        06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
        0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
        5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
        ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
        04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
        CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
        65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
        04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
        61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
        1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
        0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
        01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
        172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
        FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
        0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
        78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
        FA040404040404040404040404040404040404040404F8FC0404}
    end
    object ClonButton: TdxBarLargeButton
      Caption = #1057#1082#1086#1087#1110#1102#1074#1072#1090#1080
      Category = 0
      Hint = #1057#1082#1086#1087#1110#1102#1074#1072#1090#1080
      Visible = ivAlways
      OnClick = ClonButtonClick
      AutoGrayScale = False
      HotGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
        598E5D59734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92625AFEDDBCFF
        D9B4FFD5ACFFD1A5FFCE9DFECA97FFC790FFC48B734241FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF98665DFFE3C7DD903DDD903DDD903DDD903DDD903DDD90
        3DFFC792734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA06C5FFEE9D3FF
        E5CAFFE1C1FFDCBAFED8B1FED3A9FFD0A1FFCC9A734241FF00FF8E5D598E5D59
        8E5D598E5D598E5D59A77463FEEEDDDD903DDD903DDD903DDD903DDD903DDD90
        3DFED1A4734241FF00FF92625AFEDDBCFFD9B4FFD5ACFFD1A5B17D67FEF3E6FE
        EFDEFEEAD8FFE7CFFEE2C7FEDEBDFFD9B6FED5AD734241FF00FF98665DFFE3C7
        DD903DDD903DDD903DBB8369FFF7EFDD903DDD903DDD903DDD903DDD903DDD90
        3DFEDAB8734241FF00FFA06C5FFEE9D3FFE5CAFFE1C1FFDCBAC48B6CFEFAF7FE
        F7F0FEF4EAFEF2E3FEEDDCFEE9D4FEE5CBFEE1C2734241FF00FFA77463FEEEDD
        DD903DDD903DDD903DCC9370FEFEFCFEFBF8FEF8F3FEF6EDFEF2E6E5D5D0C6B1
        AFA79395734241FF00FFB17D67FEF3E6FEEFDEFEEAD8FFE7CFD59C74FEFEFEFE
        FEFEFEFBFAFEFAF4FEF6EEA0675BA0675BA0675B9D6559FF00FFBB8369FFF7EF
        DD903DDD903DDD903DDCA175FEFEFEFEFEFEFEFEFEFEFCFBFEFAF6A0675BE5A1
        54DC832AFF00FFFF00FFC48B6CFEFAF7FEF7F0FEF4EAFEF2E3E1A577D1926DD1
        926DD1926DD1926DD1926DA0675BEB9E43FF00FFFF00FFFF00FFCC9370FEFEFC
        FEFBF8FEF8F3FEF6EDFEF2E6E5D5D0C6B1AFA79395734241FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFD59C74FEFEFEFEFEFEFEFBFAFEFAF4FEF6EEA0675BA0
        675BA0675B9D6559FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA175FEFEFE
        FEFEFEFEFEFEFEFCFBFEFAF6A0675BE5A154DC832AFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFE1A577D1926DD1926DD1926DD1926DD1926DA0675BEB
        9E43FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D
        598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D59734241FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E5D59E6D4C4
        F7EBD7F3E5CFF2E3CEF2E2CAF0E1C7F0E1C6F0E1C6F0E1C7F0E1C7F0E1C7F3E6
        CBE7D5BD734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF8E5D59E3D0C2F4E7D5EFE0CEEEE0CCEEDECAEDDCC7EBDAC4EBDAC4EBD9C2
        EBDAC2EBD9C2EEDEC5E3CFB8734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF8E5D59E5D1C6F4EADAEFE3D4EFE2D1EEE1CFEEDECCED
        DDCAEBDCC6EADAC4EADAC4EBD9C2EEDDC5E3CFB8734241FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0675BE6D4CBF7EEE1F7D4B1FAC7
        98FAC99CF8C79AF8C99AF8C799F7C798F8C695F2CFABEDE0C7E3CFB8734241FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0675BE6D8CF
        F7EFE5F6DCC1F8D1AFF7D3B0F7D1AFF6D1ACF6D1ABF4D0AAF6CFA6F0D4B5EEDE
        C7E3CFB8734241FF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E
        5D59A0675BE9DAD1F8F2E9F3E9D9F3E3D3F3E3D1F2E1CFF2E0CCF2DECAF0DDC7
        EFDCC4EEDCC5F0E1CBE3D0BB80504BFF00FFFF00FF8E5D59E6D4C4F7EBD7F3E5
        CFF2E3CEF2E2CAF0E1C7A7756BEBDED7FBF6EFFAD4ADFCC28BFCC590FCC590FC
        C48FFCC48FFCC48FFCC28BF4D0ACF0E5D3E6D1BF80504BFF00FFFF00FF8E5D59
        E3D0C2F4E7D5EFE0CEEEE0CCEEDECAEDDCC7A7756BEEE1D9FCF7F0F7EADCF8E6
        D4F6E5D3F6E3D0F6E2CEF4E1CBF4DECAF3DEC6F2E0CBF2E5D3E7D5C280504BFF
        00FFFF00FF8E5D59E5D1C6F4EADAEFE3D4EFE2D1EEE1CFEEDECCBC8268EFE5DD
        FCFBF6FAE9D8F8E1C9F8E1C9F6DEC7F6DEC4F6DDC4F6DCC1F6D9BDF3DEC9F3E7
        D8E7D8C78E5D59FF00FFFF00FFA0675BE6D4CBF7EEE1F7D4B1FAC798FAC99CF8
        C79ABC8268F3E9E3FEFFFEFCD7B5FCC28CFCC591FCC592FCC591FCC591FCC590
        FCC28CF7D5B4F7EEE2EBDCCC8E5D59FF00FFFF00FFA0675BE6D8CFF7EFE5F6DC
        C1F8D1AFF7D3B0F7D1AFD1926DF6EDE7FFFFFFFCF7F2FAF3EDFAF2E9F8EFE7F8
        EEE5F7EDE3F6EBE0F6EBDEF7EDE0F3EADED1C5BB8E5D59FF00FFFF00FFA0675B
        E9DAD1F8F2E9F3E9D9F3E3D3F3E3D1F2E1CFD1926DF6EEEAFFFFFFFFFFFFFEFC
        FCFBFAF7FAF7F4FAF6F3F7F4F0F8F4EEFBF7F2E9E5E0C9C7C4ACA7A79F675BFF
        00FFFF00FFA7756BEBDED7FBF6EFFAD4ADFCC28BFCC590FCC590DA9D75F7EFEA
        FFFFFFFFFFFFFFFEFEFFFCFAFCF8F6FBF7F2FBF8F3F2E7E19F675B9F675B9F67
        5B9F675B9F675BFF00FFFF00FFA7756BEEE1D9FCF7F0F7EADCF8E6D4F6E5D3F6
        E3D0DA9D75F8EFEAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEFBF7FFFFFCE9D9D7
        9F675BD9995CE79740DC832AA5686BFF00FFFF00FFBC8268EFE5DDFCFBF6FAE9
        D8F8E1C9F8E1C9F6DEC7E7AB79FAF2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE9DDDD9F675BEEB164EB9E43A5686BFF00FFFF00FFFF00FFBC8268
        F3E9E3FEFFFEFCD7B5FCC28CFCC591FCC592E7AB79FAF3EEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFEBE0E19F675BD99F64A5686BFF00FFFF00FFFF
        00FFFF00FFD1926DF6EDE7FFFFFFFCF7F2FAF3EDFAF2E9F8EFE7E7AB79D1926D
        D1926DD1926DD1926DD1926DD1926DD1926DD1926DD1926D9F675BA5686BFF00
        FFFF00FFFF00FFFF00FFFF00FFD1926DF6EEEAFFFFFFFFFFFFFEFCFCFBFAF7FA
        F7F4FAF6F3F7F4F0F8F4EEFBF7F2E9E5E0C9C7C4ACA7A79F675BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDA9D75F7EFEAFFFFFFFFFF
        FFFFFEFEFFFCFAFCF8F6FBF7F2FBF8F3F2E7E19F675B9F675B9F675B9F675B9F
        675BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDA9D75
        F8EFEAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEFBF7FFFFFCE9D9D79F675BD999
        5CE79740DC832AA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFE7AB79FAF2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E9DDDD9F675BEEB164EB9E43A5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFE7AB79FAF3EEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEBE0E19F675BD99F64A5686BFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD192
        6DD1926DD1926DD1926DD1926DD1926DD1926D9F675BA5686BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1030#1084#1087#1086#1088#1090
      Category = 0
      Hint = #1030#1084#1087#1086#1088#1090
      Visible = ivAlways
      OnClick = dxBarLargeButton2Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF0096351100FEFBFA0098441000FEF8F400BD580C00FEFAF700FEF3
        EA00FEF8F300E97F1E00FEF4EB00FED0A100FED5AB00FEDDBB00FEE6CE00FEEF
        E000FEF0E200FEF6EE00FEF7F000FEFAF600FEFBF800FEFCFA00FECB9600FECC
        9700FECC9800FECE9800FECE9900FECE9A00FECF9D00FED09E00FED0A000FED4
        A500FED4A600FED5A900FED7AC00FED8AD00FED9B100FED9B200FEDDB800FEE1
        C100FEE6CB00FEEBD700FEEEDC00FEF4E900FEF6ED00FEDCB500FEEDD900FEF3
        E600FEF7EF00FEEAD100FEEEDA00FEF2E200FEF2E300FEF4E700FEF8F000FEF6
        EB00FEFAF400FEFEFB00FEFEFC00035A050007870F0009891100098912000B8C
        16000E9E1C000D9019000F921B0010A11F0011A3200010951E0014A7250015A9
        270017AA2A0018AD2D0018AC2C00169A27001AAF2F001CB131001CB133001FB6
        38001FB436001DA5340022B83C0023BA3E0024BB400025BC410027BD430028BF
        450025AD3F0029C249002BC44A002CC54C002DC64E002EC750002FC7520032CC
        560031CA530031CA550034CE590035CF5A0034CC570036D05B0038D15E0038D1
        600039D360003AD462003AD4630000BDFF00FEFEFE00DCDCDC00FFFFFF000000
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
        0202020202020202020202020202020202020202023D3D020202020202020202
        0202020202020202020202023D3F3E3D02020202020202020202020303030303
        0303033D444542403D030303030303030302020339311130332A3D4D4E4A4846
        413D1A1818181818030202030A133712343D535754524F4C49433D1B18181818
        03020203163A142D3D5A625E5B585551504B473D1D191818030202030303033D
        3D3D3D64635F5C59563D3D3D3D030303030202036E6E3B080A2E3D6B68656160
        5D3D260E21201E18030202036E6E6E3C160A3D6C6C6C6967663D282724220D1C
        030202036E6E6E6E6E043D6C6C6C6C6C6A3D290F2F25231F0302020303030303
        03033D6C6C6C6C6C6C3D030303030303030202036D6D6D6D6D6D3D3D3D3D3D3D
        3D3D6D6D6D6D6D6D030202036D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D
        030202036D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D0302020303030303
        03030303030303030303030303030303030202036E6E6E6E6E6E6E6E6E6E6E6E
        3C16063209352C10030202036E6E6E6E6E6E6E6E6E6E6E6E6E6E1715380C362B
        030202036F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F0302020305050505
        05050505050505050505050505050505030202070B0B0B0B0B0B0B0B0B0B0B0B
        0B0B0B0B0B0B0B0B070202020707070707070707070707070707070707070707
        0202020202020202020202020202020202020202020202020202}
    end
    object ClearBtn: TdxBarLargeButton
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      Category = 0
      Hint = #1054#1095#1080#1089#1090#1080#1090#1080
      Visible = ivAlways
      OnClick = ClearBtnClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00FF00FF000082000000810000005F0000005E0000005C0000005500000051
        0000004D0000004B000001820200018101000288030000800100018703000187
        0400017803000289040001550300026B0400038B0500037F060002550300048E
        07000590080006910A00035C060008680D0006640C000D9C1600096C10000FA4
        1A000C72130007951300067611000997150010A61C0011A71E000F8B190013AA
        200015AD230001500A0017B1280019B52B00138420001BB82E00067B15001BB8
        2F001CBA31001EBC33001AA62D00189029001A962D001C9A31000F8B260021AA
        390020A438001F9F35002ACF48002BD14A0023AB3D002DD34D0013AB320032DA
        560021AA410036E15E0035DE5A0035DA5B000C81290018B43F0018AB3E0039E5
        630038E362003AE7650036D45E003CDE67001BB445003ADA650045F6780046F6
        79001889400019836600167D73000F6C6500219599000B647800288BC2004CBD
        FE004DBFFF003EACF20041B0F40045B4F80048B7FE004CBDFF0060A7D300339E
        E70037A3EB003AA6F2003AA6EE003BA6EF003EA9F40041ACF20043B1F800248A
        D9002991DE002E95E5002F96E6002E97E200339EEB0037A3F2003397DE003DAA
        FC003AA4F2003EAAFC0041AFFF0042B0FF0043B1FF0003569800035596000354
        95000354930004589C000559A00005599E00116CB8001F82D3002386D9002990
        E2002C8EDE003096ED003097E90036A0FA0038A3FC0038A1F600379FF2003EAA
        FE00055AA300065CA700065BA500075DAB00075DA900085EAD000960B1000A63
        B6000A62B4000B64B400116EC5001473C7001574C900197ACE002286E1002184
        D9002486DD002483DA002687DD002582D7002F95F4003097F300349AF600349A
        F40037A0FF0037A0FE0038A1FF0039A3FF000A63B7000B64BA000C65BC000D68
        C2000D67C0000E69C6000F6AC1001370CA00176DC4001C77D300267FDA002886
        E3002784DD002C8FEE003092F2002D659D000F6BCB000F6AC900116ED100106C
        CC00116DCF001372DA001370D800136FD5001473DD001978E1001B79E1001C7D
        E2001E7AD9001B6DC4002482E6001160C0001675E3001573DE001776E6001674
        E1001878EB001877EA001877E9001877E300165CAF001C6DC900166AD4000A4B
        AA001357B5000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        02020202020202020202020202020202020202020202020202020202CACCC9BB
        02020202020202020202020202020202020202CDCAC8C7BCB8B6020202020202
        0202020202020202020296C1CBC6BEBDBAB7A9A8910202020202020202020202
        02947F6D646F6F98B9ABAAA7928F8B7C020202020202020202976A625C5D595A
        6399ACA6908D8C7D777A0202020202029569615B6582675F5E667681938E8A7B
        787A0202020202572BAD856C9BC35A686B72748987A59F7E797A020202022B55
        B52BD1BFD071689C9D75738486A2A2A280020202020A20526EB2C42B2BD2C0C5
        88A09A83A4A2A20202020202021D3A4D50425358CFB42B2BCEAEAFA1A3A20202
        020202021E3B4F51493C2F1F305470B09EB12BB30202020202020202374C514B
        3D322119030312465660C20202020202020202023522393F33261A0303112547
        4E380202020202020202020202020B34271B0304102340483802020202020202
        02020202020B3E41210F0607152414020202020202020202020202020B364429
        0D0802020202020202020202020202020202020B2E432A0C0802020202020202
        02020202020202020202021D4A2C0E0802020202020202020202020202020202
        020218452D1305020202020202020202020202020202020202021C3116060202
        0202020202020202020202020202020202022817090202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
    end
  end
  object Styles: TcxStyleRepository
    Left = 744
    Top = 48
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
      Color = 8535838
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15921906
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8535838
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
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle26
      Styles.IncSearch = cxStyle27
      Styles.Selection = cxStyle30
      Styles.FilterBox = cxStyle21
      Styles.Footer = cxStyle22
      Styles.Group = cxStyle23
      Styles.GroupByBox = cxStyle24
      Styles.Header = cxStyle25
      Styles.Indicator = cxStyle28
      Styles.Preview = cxStyle29
      Styles.BandBackground = cxStyle16
      Styles.BandHeader = cxStyle17
      BuiltIn = True
    end
  end
  object ActionList: TActionList
    Left = 705
    Top = 46
    object SystemAction: TAction
      Caption = 'SystemAction'
      ShortCut = 49242
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    PopupMenus = <
      item
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = PopupMenu
      end>
    Left = 617
    Top = 158
  end
  object PopupMenu: TPopupMenu
    MenuAnimation = [maLeftToRight, maRightToLeft, maTopToBottom, maBottomToTop, maNone]
    Left = 785
    Top = 46
    object PopupInsertBtn: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
        93F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7
        E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FA
        EFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCFCF6EFFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      Caption = 'PopupInsertBtn'
    end
    object PopupUpdateBtn: TMenuItem
      Bitmap.Data = {
        6E030000424D6E030000000000006E0200002800000010000000100000000100
        08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
        FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
        5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
        5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
        8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
        2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
        C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
        3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
        EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
        E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
        CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
        8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
        BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
        6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
        F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
        F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
        A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
        DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
        B400010B9900010A95002732D000000081000202020202020202020202020202
        020207070707070707070707070707020202076D594A585662515D5C5B6B0702
        02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
        02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
        020234013E416705261B151130640D02020234016E484142241E1A1310310A02
        02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
        02023C010101016E4F6835181D06787676023C01010101017071322A27797581
        878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
        848B403A3A3A3A3A3A3A3A2C0202028C8902}
      Caption = 'PopupUpdateBtn'
    end
    object PopupDeleteBtn: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0005B70005B7FF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FF0005B7
        0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005
        B70005B7FF00FFFF00FFFF00FF0005B70005B60005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF
        0006D70005BA0005B70005B7FF00FFFF00FFFF00FFFF00FF0005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B6FF
        00FF0005B60005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0005B60006C70006C70006CE0005B4FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006C100
        05C10006DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0005B60006D70006CE0006DA0006E9FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006E50006DA0006D3FF
        00FFFF00FF0006E50006EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F80006DA0006EFFF00FFFF00FFFF00FFFF00FF0006F80006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F8FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F6FF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F6FF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F6
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = 'PopupDeleteBtn'
    end
    object PopupDetailBtn: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FF485360FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FF4380B7
        1F6FC2656B86F3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FF32A3FF1672D76B6A80F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        A0675B34A1FF1572D45E6782F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFA7756BFFFBF033A6FF4078AD8E675EAC
        7F7597645EAC7D6FCAA083EDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        A7756BFFFFFCFAF0E6AD8A88B78F84D8BAA5EED5B6D7B298B58877CBA083EBC7
        93F2C98CA46769FF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2AF847FDAC0B4F7
        E3CFF6E0C5FFFFF4D7B198AC7D6FEECC9EF3CE97A46769FF00FFFF00FFFF00FF
        BC8268FFFFFFFFFEFC976560F6E9E0F7EADAF6E3CFFFFFEBEFD4B797645EF0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFB08884DECAC4FA
        EFE5F8EAD9FFFFD4D9B8A5AC7F74F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D1926DFFFFFFFFFFFFD5BFBCBA9793DECAC4F6E9DEDAC0B4B78F84B28C7BDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFD5BFBCB0
        8884976560AF867FCAA79DA56B5FA56B5FA56B5FA46769FF00FFFF00FFFF00FF
        DA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA56B5FE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5A56B5FF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E7AB79FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DD1
        926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00FFFF00FF}
      Caption = 'PopupDetailBtn'
    end
    object PopupOtherManBtn: TMenuItem
      Caption = 'PopupOtherManBtn'
    end
    object PopupOtherWithReplBtn: TMenuItem
      Caption = 'PopupOtherWithReplBtn'
    end
    object ExportDBFBtn: TMenuItem
      Caption = 'ExportDBFBtn'
    end
    object ExportToXMLBtn: TMenuItem
      Caption = #1045#1082#1089#1087#1086#1088#1090' '#1074' XML'
    end
    object PopupToCorrectBtn: TMenuItem
      Caption = 'PopupToCorrectBtn'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PopupExitBtn: TMenuItem
      Bitmap.Data = {
        B6020000424DB602000000000000B60100002800000010000000100000000100
        08000000000000010000120B0000120B0000600000006000000000000000FFFF
        FF00FF00FF00FCD1D3004E1E1F00C54D4E00C9525300C24F5000D4585900C954
        5500CF575800CB555600D75C5D00D55C5D00D05A5B00CF595A00B74F5200B24D
        4E00B64F5000D55E5F00BD535600D75F6000DD636400C2575A00C6595B00E267
        6800DD656600DA636400E3686900DE666700EB6D6E00E96C6D00F2737400F073
        7400EE727300F7777900D1656600F0757600F6797A00F77A7B00FE7F8000FB7E
        7F00FF818200FC7F8000DA6E6F00FF828300FE818200FF838400E5767700E073
        7400E2757600FF868700FF888900CF6E7000CB6C6D00CC6E7000FE8B8C00EB81
        8200E67E7F009C565700FB9A9C00F8AAAB00F7B5B600FAD3D400A64B4B00A94D
        4D00F8787900D76B6B00CF6E6E00824B4B00FAEBC500FCEFC700FFF2CC00FCFB
        CF00FCFBD100FFFFD300FFFFD400FFFFD500FFFFD700E6FCC700A5D8970050D1
        6F0026B149002AB44D001BBB490023B54A002DC7580042C966000CBC410010BB
        430013C1480013BC450016BD480016BC48001CBF4C001EBC4C00020202020202
        0245040202020202020202020202454540410402020202020202020245451207
        05110445454545454502020245080B09061004383C3D3E3E45020202450C0E0F
        0A1404555A5C583E45020202451615130D1704535E5F5B3E45020202451C1A1B
        1D1804525D54593E45020202451E193A3F3704505157563E4502020245201F39
        033504484E4C4F3E4502020245422522212404474D4B4E3E4502020245282726
        234304474D4B4D3E45020202452F2B29282C04474D4B4D3E4502020245342D2A
        2D3104474D4B4D3E450202024545322E333004464A494A3E450202020202453B
        3644044545454545450202020202020245450402020202020202}
      Caption = 'PopupExitBtn'
    end
  end
  object LargeImages: TImageList
    Height = 24
    Width = 24
    Left = 288
    Top = 256
    Bitmap = {
      494C01010A000E00040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D590080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5E00EFD3B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC5
      8900EBC18200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC1
      8000EABF7F0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6A6A006C6A6A006C6A6A0000000000000000000000
      0000000000006C6A6A006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5F00EED4B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC5
      8F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006C6A6A00B0ADAD00969293008E8A8B006C6A6A006C6A6A00817E
      7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5F00EED7C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC7
      9600EDC58F00EBC1890090605B0090605B0090605B0090605B0090605B009060
      5B00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F9F00838182005C5B
      5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9C9006C6A6A006C6A
      6A006C6A6A000000000000000000000000000000000000000000000000009365
      5F00EFDAC500F7E2C700F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB
      9C00EDC79500EDC58F00EBC18900E9BD8100E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F9F00626060000000
      000000000000161616005D5D5D00A9A9A900CACACA00CACACA00CACACA00CACA
      CA00C1C0C0006C6A6A006C6A6A006C6A6A000000000000000000000000009365
      6000F0DECC00F8E6CF00F6E0C600F3DCBD00F2D8B700F2D5B100F0D1AA00EFCE
      A300EECB9C00EDC7960090605B0090605B0090605B0090605B0090605B009060
      5B00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006C6A6A00D3D3
      D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F7F006C6A6A001414
      140008080800000000000000000000000000161616005D5D5D00A9A9A900CACA
      CA00CACACA00B7B6B600B7B6B6006C6A6A000000000000000000000000009566
      6000F2E2D300FAEAD700F6E3CE00F4DEC500F3DCBF00F2D8B800F0D4B100F0D1
      AA00EFCEA300EECB9D00EDC79700EDC59000EBC18900E9BD8100E9BD7F00EABF
      7F00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A00CACACA00CACA
      CA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F9F009F9D9D009997
      97009390910082808000525050002B2A2A000808080000000000000000001616
      160064646400817E7F006C6A6A00000000000000000000000000000000009869
      6300F2E6DA0090605B0090605B00F6E2CB0090605B0090605B00F2D8B7009060
      5B0090605B00EFCEA30090605B0090605B00EDC58F0090605B0090605B00EABF
      7F00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A00CACACA00C5C5
      C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DEDE00CAC7C700B6B5
      B500A5A3A300A19F9F00A19F9F009E9A9C009390910068656600232223000303
      030019191900999797006C6A6A00000000000000000000000000000000009E6E
      6400F4EAE100FBF2E600F8EADC00F7E6D300F6E2CC00F4E0C600F3DCBF00F2D8
      B700F2D5B000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF
      8200E7BB7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A00C5C5C5008E8C
      8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEEDED00EAEAEA00E7E6
      E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F9F00999797008280
      80006C6A6A009F9D9D006C6A6A0000000000000000000000000000000000A372
      6600F6EEE900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DC
      BD00F2D8B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC2
      8800E7BC800080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A008E8C8C00EFEE
      EE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B7E00958B8E00C1BF
      BF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1C100B2B0B000A19F
      9F009C9999006C6A6A006C6A6A0000000000000000000000000000000000A775
      6800F8F3F00090605B0090605B0090605B0090605B0090605B0090605B00F4E0
      C500F3DCBD00F2D8B700F2D4B100F0D1A900EFCEA300EDCB9C00EDC79500EDC5
      8F00E9BF870080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6A6A00CECBCC00F7F6
      F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADABAB009E9898008379
      7B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1D100CECECE00C9C7
      C700BBBABA00A6A4A4006C6A6A0000000000000000000000000000000000AC79
      6900FAF6F400FFFFFE00FEF8F300FBF2EA00F8EEE300F8EBDA00F7E6D300F7E2
      CC00F6E0C500F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB9C00EEC9
      9600EAC18E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006C6A6A006C6A
      6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C0083787A009C969700ACAA
      AA00B2B0B000ABA7A9009891920081777800847A7D00938C8E00BFBFBF00CBCB
      CB00CACACA00C0C0C0006C6A6A0000000000000000000000000000000000B17E
      6B00FAF6F40090605B0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B0090605B00F2D8B600F2D4B000F0D1A900EFCEA100EECB
      9C00EBC5920080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A00BD828100AF8A73007D5E510066545600655457006D5E
      62006D5E620089808100A09A9C00AFACAD00B2B0B000A49FA000CAC9CA00CBCB
      CB00B7B6B6006C6A6A000000000000000000000000000000000000000000B681
      6C00FAF6F400FFFFFF00FFFFFF00FFFCFB00FEF7F200FBF3EB00F8EEE300F8EB
      DC00F7E6D300F6E3CC00F6DEC500F3DCBD00F3D8B600F2D4AF00F0D1A900F0CF
      A300EDC9990080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD828100FFD4AB00FFD0A100FFCB9800D5A57B00A178
      5C007B665F0060505300665659006F6265008E868700CECCCC00CFCFCF00A5A4
      A4006C6A6A00000000000000000000000000000000000000000000000000BB84
      6E00FAF6F40090605B0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B0090605B00F6DEC400F3DABC00F2D8B600F0D4AF00EFD0
      A700CEB4910080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD828100FFD9B200FFD4A900FFCFA000FFCA9700FFC6
      8E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A6A006C6A6A006C6A
      6A0000000000000000000000000000000000000000000000000000000000C089
      6F00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2
      EA00FAEEE200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B0
      9600A1927F0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD828100FFDDBA00FFD8B100FFD3A700FFCE9E00FFCA
      9600FFC58C00FFC08400FFC08400BD8281000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C58C
      7000FBF7F400FFFFFF0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B00F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C
      8B00A497860080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100FFE5CB00FFE1C200FFDCB800FFD7AF00FFD3A600FFCE
      9D00FFC99500FFC48B00BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CB91
      7300FBF7F40090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      FB00FCF7F000FBF2E90090605B00E9D3C4009E675B0098665B0095655B009665
      5B0096655B009868590000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100FFEAD400FFE5CA00FFE0C000FFDAB700FFD7AD00FFD1
      A500FFCC9C00FFC79200BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF96
      7400FBF7F60090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF7F00090605B00DAC0B6009F675B00DAA16B00DD984F00E290
      3A00EA892300A5686B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100FFEEDC00FFE9D100FFE3C900FFE0BF00FFDAB600FFD5
      AC00FFD0A300F7C29700BD828100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FCF8F60090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFCFB0090605B00DDC4BC009F675B00EAB47400EFA95200F6A0
      3600A5686B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3C700FFDEBD00FFD9
      B400FFD4AB00BD82810000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B00FFFFFF00DDC7C2009F675B00EAB27300EFA75100A568
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD82
      8100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7CF00FFE2C500FFDD
      BC00F2C7A900BD82810000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB57200A5686B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD82
      8100BD828100BD828100BD828100FFF4EB00FFF0E100FFEBD700FFE6CE00FBDC
      C000BD8281000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E68009F675B00A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD828100BD828100BD828100BD828100BD82
      8100000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F1F21001F1F2100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B008C4B4B00914B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000096919000736E
      6E00AF7D7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F1F21001F1F2100182A33000F2C3A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B00894B4B009C4B4C00B64B4C00BD4B4C009F4B
      4C004E1E1F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000979291006C6C7000174B
      820032608900AF7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000113B4E0004689A00064F750007395300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009A4D4E00AF4E4F00C14E4F00C04D4E00BF4C4D00BF4C4D009F4B
      4C004E1E1F00994B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B00000000000000000000000000838686003A79B1001A81
      FF000D62BC003B5F7F00B07D7D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BB4B0000B649000017343C00036A9D00056798001B506E002A3440003F2F
      30005B270300702D00008C380000A7430000B5480000BB4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00C5545500C9545500C7535400C6525300C5515200C4505100C24F5000A04C
      4D004E1E1F00FE8B8C00FC929300FB9A9C00FAA3A400F8AAAB00F7B1B100F7B5
      B600F7B5B600824B4B000000000000000000000000002698FF003DB0FF00349D
      FF001C7EF8000C62BA00395E7F00B07B7D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEF3E700FEF0E200FEEE
      DD00FEEAD700FAE3CE0075868600045983003150650095606000AA6E6E00965D
      5D00643B3B00755E4B00967B5F00BD9A7500E0B58700F3C29000FBC99500FECB
      9600FECB9600FECB9600BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000004B0000118C1F00004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00CE585900CC575800CB565700CA555600C9545500C7535400C6525300A34E
      4F004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B00000000000000000000000000000000002996FF0042AD
      FE00349AFF001C7EF8000C60B800405F7F00B17D7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEF7EE00FEF4EA00FEF2
      E500FEEFDE00FCEBD800F4E0CB000A4059008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965D5D00643B3B00755E4B00967B5F00BD9A7500E0B58700F3C49100FBC9
      9500FECB9600FECB9600BC4B0000000000000000000000000000000000000000
      00000000000000000000004B0000138F230007931000169C2800004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D15B5C00D05A5B00CF595A00CE585900CC575800CB565700CA555600A550
      50004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000002A96
      FE0041AFFE00349AFF001C7EF8000C5FB8003E5F7E00B07B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFAF600FEF8F200FEF6
      ED00FEF3E700FEF0E100FAEAD7004D6C75009C696900DC9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005B353500755E4C00967D6000BD9C7600E0B58900F4C5
      9200FBC99500FECB9600BC4B0000000000000000000000000000000000000000
      000000000000004B0000159127000FA01D000B99160008961100159A2700004B
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D55E5F00D55E5F00D45D5E00D35C5D00D15B5C00D05A5B00CF595A00A651
      52004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      00002A97FE0041AFFE00349AFF001A7BF8000B5FB70044627F00A97A7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFCFB00B85B2D006E2D
      13006E2D13006E2D13006D2D13006B2B1200794D4C00E2A4A400DC9D9D00CB8C
      8C00BA7D7D00A96D6D008C5757005A343200653C16007F4D1700A0621D00BF73
      2300CF7D2600FCCA9600BC4B0000000000000000000000000000000000000000
      0000004B00000F811C001AAF310014A727000FA11F000C9A1800089612001399
      2500004B00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DA636400D9626300D8606200D75F6000D55E5F00D45D5E00D35C5D00A953
      54004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000002C98FE0041ADFE00349CFF00197BF6000C5EB6002B587F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE00AD350900E94B
      2F00F7634400F86B4D00F4685500DE452D00682C16007A4F4F00E2A3A300DC9D
      9D00CA8B8B00B87B7B00A76C6C008B5656005B35350076604F009A816600C2A0
      7B00E5BB8F00F6C79600BB4B000000000000000000000000000000000000004B
      00000E7D1A0028C0480021B83D001BB0330013902400004B0000169D29000997
      130013982300004B000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DE666700DD656600DC646500DA636400D9626300D8606200D75F6000AB55
      55004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000002D99FE0041ADFE00339CFF00287FE7003D607B000000
      0000000000000000000099696400996964009969640099696400996964000000
      000000000000000000000000000000000000BC4B0000FEFEFE00BA390F00F769
      4600F8654500FCD9D400FBC6BC00E5593A006D2D1300DDCBC20073474700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D3836007D6A55009C83
      6800C2A17E00E3BB9000B6490000000000000000000000000000004B00000C77
      170035CF5E002FC9540028C149001B9F3100004B000000000000004B00000D9E
      1B000997140011972200004B0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E2696A00E1686900E0676800DE666700E06D6E00E6909100DC646500AC56
      57004E1E1F0058A55B001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      00000000000000000000000000002D9AFE004BB5FF008CBDED00AC9F96006C56
      550093665F0099696400DDCCAB00FFFFD900FFFFD900FFFFD700E9D5B6009969
      640099696400000000000000000000000000BC4B0000FEFEFE00E1896E00F86C
      4900FBA99800FFFFFF00FBBDB000FA6E4B00C7917600FAF0E70091400C007347
      4700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B5555005C352F00683F
      1300824F1800C1A07F00A7430000000000000000000000000000004B00003FD9
      6F003BD7680036D0600020AA3B00004B0000000000000000000000000000004B
      0000097411000A99150011962000004B00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E76D6E00E66C6D00E56B6C00E36A6B00EEA6A700FFFFFF00EB9C9C00AF58
      59004E1E1F00EECEAF00B7EBAA005ED377005ED3770045CA670045CA670045CA
      6700F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1ADA500B687
      7500CCAB8C00FFFFD300FFFFD300FFFFD000FFFFCF00FFFFD000FFFFD300FFFF
      E200D4BAA400996964000000000000000000BC4B0000FEFEFE00FEFEFE00558A
      D8001B77B0001B7AB4002379AA00B4B5C700F3EBE200FCF7F000BB4B0000B7A0
      9A0073474700E1A1A100D99A9A00C78A8A00B77A7A00A66B6B008B5555005B35
      35007A6A57009982680090390000000000000000000000000000004B00001C9C
      340041DC700023AD4100004B0000000000000000000000000000000000000000
      000000000000004B00000B99160010951F00004B000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EB707200EA6F7000E96E6F00E76D6E00F2A9AA00FFFFFF00EB959600B15A
      5A004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300D9F6BD00D9F6
      BD00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000996B6500D4AF
      8F00FFEFB000FBEDB800FFFFCF00FFFFCE00FFFFCF00FFFFD700FFFFDC00FFFF
      EA00FFFFFF00D3BBB8009969640000000000BC4B0000FEFEFE006EB8FC002890
      FA002890FA002890FA002890FA003296F800E6E7E700FEFBF800BB4B0000FAF3
      EB00B7A19C0091606000EBAAAA00D9999900C7898900B6797900804E4E004148
      5500354756007A6A5700722D000000000000000000000000000000000000004B
      00002EC15200004B000000000000000000000000000000000000000000000000
      00000000000000000000004B00000C9A180009961200004B0000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EF747500EE737400ED727300EB707200EA6F7000EF909100E76D6E00B25B
      5C004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400FFEA
      A600F2C78F00FAEBB600FFFFD000FFFFCF00FFFFD300FFFFE500FFFFF200FFFF
      FA00FFFFFC00FFFFFE009969640000000000BC4B0000FEFEFE00187DB400309C
      FB00309CFB00309CFB00309CFB00157BB600BDDAEE00FEFCFC00BC4B0000FCFA
      F400D17F26009F5E280091606000EBAAAA00D9999900534E5700028AC40000AA
      EA0000A6E6000087C4005A240000000000000000000000000000000000000000
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00000464080009961300004B00000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F3777800F3777800F2767700F0757600EF747500EE737400ED727300B55D
      5D004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400E6C9A000F6CA
      8B00EEBA7F00FBE7B400FFFFD000FFFFCF00FFFFD700FFFFEB00FFFFFE00FFFF
      FC00FFFFF200FFFFE500D8C6A50099696400BC4B0000FEFEFE00055A970033A0
      FB0033A0FB0033A0FB0033A0FB001278B000BAD8E900FEFEFE00BC4B0000FEFC
      FB00FCFAF700FAF6EF00B7A39E0091606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D0000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000007740E00004B
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F87B7D00F77A7B00F6797A00F4787900F3777800F2767700F0757600B75F
      5F004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFEFAD00F0BC
      7D00EBB07500F7DDA700FEFCCB00FFFFD100FFFFD500FFFFE600FFFFF600FFFF
      F600FFFFE600FFFFD700FFFFDA0099696400BC4B0000FEFEFE004588AF00055A
      9700085F9F00085F9F00116EB50013639700FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFCFB00FCFAF700FAF6F000B6A19F0073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A9700000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000035E
      0600004B0000000000000000000000000000000000000000000000000000824B
      4B00FC7F8000FB7E7F00FA7D7E00F87B7D00F77A7B00F6797A00F4787900B860
      62004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFF0AF00EFBA
      7B00E9A56A00F2C98F00FCEFBC00FFFFD100FFFFD300FFFFD900FFFFE100FFFF
      E200FFFFD900FFFFD300FFFFDA0099696400BC4B0000FEFEFE00EAF2F700669F
      BF0006558900004B820028739F00C0D8E300FEFEFE00FEFEFE00BC4B0000FEFE
      FE00D5812700D5812700D5812700D17F260089512B000093D10000B1F200012B
      A7000725DC000420B800021DB100010A97000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B00000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FE808100FC7F8000FC7F8000FB7E7F00FA7D7E00BB63
      63004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFF2B200F3C4
      8400E99E6300EDB57A00F4D79F00FCF4C200FFFFD100FFFFD300FFFFD300FFFF
      D300FFFFD000FFFFCF00FFFFD80099696400BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FCFBFB00FAF7F400F3EFE9000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B000000000000000000000000000000000000824B
      4B00FF818200FF818200FF818200FF818200FF818200FE808100FE808100BD65
      65004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400E6C9A000FCDE
      9E00EFBA7E00EEB77900EFC28400F6DAA100FBF2BF00FFFFCF00FFFFD100FFFF
      D000FFFFD000FFFFD100D9C6A50099696400BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FCFBFB00FBFAF700F4F2EE001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F77E7F00FF818200FF818200FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400FFFE
      C200FBEBCA00F6D7AC00F0C18600EFBF8200F3CC9500FAE3AD00FCF0BC00FBF4
      C100FEF6C400FFFFD4009969640000000000BC4B0000D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D7630100D568
      06001322BD00050DA500A1410000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00AF5E5F00D56F7000FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400D7BB
      9E00FFFFFF00FEF7EE00F6D8AC00EDB47400E9A76B00EDB47800F0C48A00F6D4
      9C00FFF4B600D3B799009969640000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BB4B
      0000B8490000B5480000B5480000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B0091515200B6626300EE7A7B00FF818200BF66
      66004E1E1F00914B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009969
      6400CEB6AF00FFFFFF00FFF4CB00F6CF9000F0BC7D00F2BF8100F7CE9000FFED
      A900D4B1930099696400000000000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BB4B0000BB4B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00985555009F58
      58004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009969640099696400E1C9A000FFF7B500FFF2AF00FFF2B100E9CCA4009969
      6400996964000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099696400996964009969640099696400996964000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009263
      5D00A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A467690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5E00EFD3B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC5
      8900EBC18200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC1
      8000EABF7F009F6F6000000000000000000093655E00A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A46769000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B70000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B000000000000000000000000000000000000000000000000009365
      5F00EED4B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC5
      8F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000093655F00EED4B800F4DABB00F2D5
      B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC8400E7BC8100E7BC
      7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B70000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B000000000000000000000000000000000000000000000000009365
      5F00EED7C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC7
      9600EDC58F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000093655F00EED7C000F4DEC000F0D8
      B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF7F00DAB47F00E1B7
      7D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009365
      5F00EFDAC500F7E2C700F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB
      9C00EDC79500EDC58F00EBC18900E9BD8100E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000093655F00EFDAC500F6E1C600F0D9
      BC00E6CEAF00222123003E3935008C7960009D876700AA8F6B00B89A6F00C7A4
      7400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B700000000000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009365
      6000F0DECC00F8E6CF00F6E0C600F3DCBD00F2D8B700F2D5B100EACCA600DDBF
      9700D7B78D00D6B38700DBB68500E5BC8600E9BF8200E9BD7F00E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000093656000F0DECC00F7E5CE00F4DE
      C500EAD4B6003C3835001F1F2100182A330034434400836F56008E7759009E83
      5F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC7E009F6F60000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000005B7000005
      B70000000000000000000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00F2D8B70000700000F0D1AA00EFCEA300B1B874000070
      00000070000000700000ADAD6000E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009566
      6000F2E2D300FAEAD700F6E3CE00F4DEC500F3DCBF00F2D8B800DEC4A400BAA2
      8400A8917200A78E6E00B89B7500DBB68500EBC18900E9BD8100E9BD7F00EABF
      7F00E7BC7E009F6F6000000000000000000095666000F2E2D300FAEAD700F6E3
      CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C52003A4948007764
      4C0089725300A4865F00BC996900D1AB7300E1B77900E3BA7B009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000000
      000000000000000000000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00F6E0C600F3DCBD000070000004750300B2BD7F0000700000B1B8
      7400EDC79600B0B46B0000700000ADAF6200E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009869
      6300F2E6DA00FAEEDE00F7E7D400F6E2CB00F4E0C500F3DCBF00004B0000004B
      0000004B0000004B0000A78E6E00D6B38700EDC58F00EBC18900E9BD8100EABF
      7F00E7BC7E009F6F6000000000000000000098696300F2E6DA00FAEEDE00F7E7
      D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B506E002A3440004135
      38006A5542007E694C00987D5800B2916300CCA66E00DAB177009D6D5F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000006F6000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      000000000000000000000000000000000000000000000000000095666000F2E2
      D300FAEAD700F6E3CE00F4DEC500007000000070000000700000B2BD7F00EFCE
      A300EECB9D00EDC79700B0B46B0000700000E9BD8100E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000009E6E
      6400F4EAE100FBF2E600F8EADC00F1E1CE00E4D1BD00DCCAB300004B00000895
      110006900E00004B0000A18B6F00C4A88100D6B38700D9B68400E5BC8500EABF
      8200E7BB7E009F6F600000000000000000009E6E6400F4EAE100FBF2E600F8EA
      DC00F7E6D300F3E0CA0074868600045983003150650095606000AA6E6E00965D
      5D00643B3A0065524000766347008E745100A9895D00C09C690096695A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      00000005B7000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00F7E7D400F6E2CB0000700000007000000070000000700000F0D1
      A900EFCEA300EECB9D00EDC7960000700000EBC18900E9BD8100EABF7F00E7BC
      7E0080504B00000000000000000000000000000000000000000000000000A372
      6600F6EEE900FCF6ED00F8EFE300E5D9CA00C0B3A400AD9F8F00004B00000C9D
      19000A981400004B000096826A00A18B6E00A78E6E00B89B7400D9B58300EBC2
      8800E7BC80009F6F60000000000000000000A3726600F6EEE900FCF6ED00F8EF
      E300F7EADA00F7E6D300F0DDC9000B4159008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965C5C00643B3A0064513E006F5D4300826C4B009A7E5500865D51000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600F8EADC00F7E6D300007000000070000000700000007000000070
      0000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF8200E7BB
      7E0080504B00000000000000000000000000000000000000000000000000A775
      6800F8F3F000FEFBF600FBF3EB00004B0000004B0000004B0000004B000011A6
      24000EA11D00004B0000004B0000004B0000004B0000A68E6E00D6B38600EDC5
      8F00E9BF87009F6F62000000000000000000A7756800F8F3F000FEFBF600FBF3
      EB00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DD9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005A35340062503D006A5841007B664800735046000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000006F6000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DCBD00F2D8
      B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC28800E7BC
      800080504B00000000000000000000000000000000000000000000000000AC79
      6900FAF6F400FFFFFE00FEF8F300004B000025C7470020C140001CBA380018B2
      300014AC290011A522000DA01C000A9A1700004B0000A8917200D7B78D00EEC9
      9600EAC18E00A07063000000000000000000AC796900FAF6F400FFFFFE00FEF8
      F300FBF2EA00F8EEE300F8EBDA00F4E3D0007B504F00E2A4A400DC9D9D00CA8C
      8C00BA7D7D00A96D6D008C5757005A353400604F3D006C59410062443C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000006F6000005B70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7756800F8F3
      F000FEFBF600FBF3EB00F8EEE300F8EBDC00F7E7D300F6E2CC00F4E0C5000070
      000000700000007000000070000000700000EDCB9C00EDC79500EDC58F00E9BF
      870080504B00000000000000000000000000000000000000000000000000B17E
      6B00FAF6F400FFFFFF00FFFEFB00004B00002CD3550028CC4D0023C545001FBF
      3E001BB7350017B02E0013AB270010A52000004B0000BAA28300DDBF9500EECB
      9C00EBC59200A07264000000000000000000B17E6B00FAF6F400FFFFFF00FFFE
      FB00FEF7F000FBF3EA00FAEFE300F8EADA00E1CCBB007B504F00E2A3A300DC9C
      9C00CA8B8B00B87B7B00A76C6C008C5656005A35350066523F00583F37000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000005B7000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300FBF2EA0000700000F8EBDA00F7E6D300F7E2CC00F6E0
      C50000700000007000000070000000700000EFCEA300EECB9C00EEC99600EAC1
      8E0080504B00000000000000000000000000000000000000000000000000B681
      6C00FAF6F400FFFFFF00FFFFFF00004B0000004B0000004B0000004B000027CB
      4B0022C44300004B0000004B0000004B0000004B0000E0C4A200EACCA500F0CF
      A300EDC999009D7065000000000000000000B6816C00FAF6F400FFFFFF00FFFF
      FF00FFFCFB00FEF7F200FBF3EB00F8EEE300F8EBDC00E1CCBB0073484700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D383600533C35000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000006F6000005B7000006
      F6000006F6000006F6000005B7000006F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00FEF7F00000700000BAD4AA00F8EADA00F7E7D300F6E2
      CB00B7C79200007000000070000000700000F0D1A900EFCEA100EECB9C00EBC5
      920080504B00000000000000000000000000000000000000000000000000BB84
      6E00FAF6F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200004B00002DD4
      580029CF5200004B0000AD9F8E00DEC8B100F3DABC00F2D8B600F0D4AF00EFD0
      A700CEB49100896A63000000000000000000BB846E00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EADA00BBA196007348
      4700E1A1A100DA9A9A00C98A8A00B77A7A00A66B6B008B5555005A3535000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000006F6000006F6000006F6000005B7000006F6000000
      0000000000000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00FFFFFF00FFFCFB00BCDAB40000700000B8D3AA00F8EBDC00B7CC
      9D0000700000B7C792000475030000700000F2D4AF00F0D1A900F0CFA300EDC9
      990080504B00000000000000000000000000000000000000000000000000C089
      6F00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00004B000034DE
      650030D95E00004B0000C0B3A400E4D1BC00F6DEC400F3DCBD00E5CEAF00C4B0
      9600A1927F00806762000000000000000000C0896F00FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEEE200F8EBDA00BBA1
      960073484700E0A1A100D99A9A00C78A8A00B77A7A00A66B6B008A5555005B35
      3500000000000000000000000000000000000000000000000000000000000000
      0000000000000006F6000006F6000005B7000006F6000006F600000000000000
      000000000000000000000006F6000006F6000006F6000006F600000000000000
      0000000000000000000000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00BCDAB40000700000007000000070
      0000B7CC9D00F6E2CB00F6DEC40000700000F2D8B600F0D4AF00EFD0A700CEB4
      910080504B00000000000000000000000000000000000000000000000000C58C
      7000FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004B0000004B
      0000004B0000004B0000E6D9C900F2E2CF00FAE9D000E0D0BA00B8AB9A00A79C
      8B00A4978600846964000000000000000000C58C7000FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3EA00F8EEE200F8EA
      D900BCA1960091606000EBAAAA00D9999900C7898900B6797900804E4E004148
      5500354756000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000006F6000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B09600A192
      7F0080504B00000000000000000000000000000000000000000000000000CB91
      7300FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      FB00FCF7F000FBF2E900FBF2E500E9D3C4009E675B0098665B0095655B009665
      5B0096655B00986859000000000000000000CB917300FBF7F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2
      E500E9D3C40084544C0091606000EAAAAA00D8999900534E5700028AC40000AA
      EA0000A6E6000087C40000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F6000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C8B00A497
      860080504B00000000000000000000000000000000000000000000000000CF96
      7400FBF7F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF7F000FFFAEF00DAC0B6009F675B00DAA16B00DD984F00E290
      3A00EA892300A5686B000000000000000000CF967400FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFA00FCF7F000FFFA
      EF00DAC0B6009F675B00AA78560090606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D00000082000000000000000000000000000006F6000006
      F6000006F6000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F600000000000000000000000000000000000000000000000000CB917300FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
      F000FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00A0675B00000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFCFB00FFFEF700DDC4BC009F675B00EAB47400EFA95200F6A0
      3600A5686B00000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFE
      F700DDC4BC009F675B00EAB47400B77D460073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A970000008200000000000006F6000006F6000006
      F6000006F6000006F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF967400FBF7
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      FA00FCF7F000FFFAEF00DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B00000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DDC7C2009F675B00EAB27300EFA75100A568
      6B0000000000000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDC7C2009F675B00EAB27300EFA751007A494A000093D10000B1F200012B
      A7000725DC000420B800021DB100010A9700000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFB00FFFEF700DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B0000000000000000000000000000000000000000000000000000000000D498
      7500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB57200A5686B000000
      000000000000000000000000000000000000D4987500FFFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2D0CE009F675B00EDB57200A5686B0000000000000000000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F00000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      000000000000000000000000000000000000000000000000000000000000D395
      7000E6C2AC00E7C6B000E7C6B000E6C4B000E3C2B000E1C0AF00DEBDAD00DCBC
      AC00D8BAAC00D5B7AB00D3B5AB00C09990009F675B00A5686B00000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00A5686B00000000000000000000000000000000001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001322BD00050DA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFE00003000000000000FFFFFFE0
      0003000000000000FC79FFE00003000000000000F8003FE00003000000000000
      F00007E00003000000000000E00000E00003000000000000C00000E000030000
      00000000800001E00003000000000000800001E00003000000000000800001E0
      0003000000000000800001E00003000000000000800001E00003000000000000
      C00001E00003000000000000F00003E00003000000000000FC0007E000030000
      00000000FC000FE00003000000000000FC00FFE00003000000000000F801FFE0
      0003000000000000F801FFE00003000000000000F801FFE00007000000000000
      F003FFE0000F000000000000E003FFE0001F000000000000E007FFE0003F0000
      00000000FE0FFFFFFFFF000000000000FFFFFFFFE7FFFFFFFFF9FFFFFFFFFFFF
      07FFC7FFFFF87FFFFFFFFFF807FF83FFFFFC3FFFFFFFFFE0000381FFFF000001
      FF7FFFE0000380FFFF000001FE3FFFE00003C07FFF000001FC1FFFE00003E03F
      FF000001F80FFFE00003F01FFF000001F007FFE00003F81FFF000001E003FFE0
      0003FC1C1F000001C041FFE00003FE0007000001C0E0FFE00003FFC003000001
      C1F87FE00003FFC001000001E3FC3FE00003FFC001000001F7FE1FE00003FF80
      00000001FFFF8FE00003FF8000000000FFFFC7E00003FF8000000000FFFFF3E0
      0003FF8000000000FFFFFDE00003FF8000000001FFFFFFE00003FFC001000001
      FFFFFFE00003FFC001000001FFFFFFF80003FFE003800003FFFFFFFF07FFFFF0
      07FFFFFFFFFFFFFFE7FFFFFC1FFFFFFFE00003FFFFFFFFFFFFFFFFFFE0000300
      001FFFFFF9C00007E0000300001FFFFFF1C00007E0000300001FC7FFE3C00007
      E0000300001FC3FF87C00007E0000300001FC1FF0FC00007E0000300001FE0FE
      1FC00007E0000300001FF07C3FC00007E0000300001FFC307FC00007E0000300
      001FFE00FFC00007E0000300001FFF01FFC00007E0000300001FFF83FFC00007
      E0000300001FFF01FFC00007E0000300001FFE00FFC00007E0000300001FFC18
      7FC00007E0000300000FF83C3FC00007E00003000007F07F1FC00007E0000300
      0003E0FF8FC00007E00003000001C1FFEFC00007E0000700000083FFFFC00007
      E0000F00000087FFFFC0000FE0001F0000C08FFFFFC0001FE0003F0001E1FFFF
      FFC0003FFFFFFFFFFFF3FFFFFFC0007F00000000000000000000000000000000
      000000000000}
  end
end
