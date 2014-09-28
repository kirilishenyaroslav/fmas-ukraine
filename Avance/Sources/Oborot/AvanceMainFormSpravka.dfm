object fmAvanceMainFormSpravka: TfmAvanceMainFormSpravka
  Left = 319
  Top = 147
  Width = 815
  Height = 590
  Action = ActionClose
  Caption = 'ActionClose'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = ActionCloseExecute
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 799
    Height = 208
    Align = alBottom
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 389
      Height = 206
      Align = alLeft
      Color = clMoneyGreen
      TabOrder = 0
      object cxLabel1: TcxLabel
        Left = 1
        Top = 1
        Width = 389
        Height = 19
        Align = alTop
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.Color = clMoneyGreen
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Times New Roman'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Caption = #1044#1077#1073#1077#1090
      end
      object cxGrid3: TcxGrid
        Left = 1
        Top = 20
        Width = 387
        Height = 185
        Align = alClient
        TabOrder = 1
        object cxGrid3DBBandedTableView1: TcxGridDBBandedTableView
          DataController.DataSource = DataSourceDebet
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'SUMMA'
              Column = cxGrid3DBBandedTableView1DBBandedColumn4
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Background = cxStyleYellow
          Styles.Content = cxStyleYellow
          Styles.ContentEven = cxStyleYellow
          Styles.ContentOdd = cxStyleYellow
          Styles.Inactive = cxStyle4
          Styles.IncSearch = cxStyleYellow
          Styles.Selection = cxStyleMalin
          Styles.FilterBox = cxStyleYellow
          Styles.Footer = cxStyleBorder
          Styles.Group = cxStyleYellow
          Styles.GroupByBox = cxStyleYellow
          Styles.Header = cxStyleBorder
          Styles.Indicator = cxStyleYellow
          Styles.NewItemRowInfoText = cxStyleYellow
          Styles.Preview = cxStyleYellow
          Styles.BandBackground = cxStyleYellow
          Styles.BandHeader = cxStyle11
          Bands = <
            item
              Caption = #1056#1077#1082#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Width = 189
            end
            item
              Caption = #1056#1077#1082#1074' '#1087#1088#1086#1074#1086#1076#1082#1080
              Width = 196
            end>
          object cxGrid3DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 64
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
            DataBinding.FieldName = 'NUM_DOC'
          end
          object cxGrid3DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
            Width = 58
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATE_DOC'
          end
          object cxGrid3DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
            Width = 44
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'KOD_SCH'
          end
          object cxGrid3DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
            Width = 41
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUMMA'
          end
          object cxGrid3DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
            Width = 65
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'S_R_S_K'
          end
          object cxGrid3DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
            Width = 46
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
            DataBinding.FieldName = 'NUM_SCH_KOR'
          end
          object cxGrid3DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
            Width = 67
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'NAME'
          end
        end
        object cxGrid3BandedTableView1: TcxGridBandedTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Bands = <
            item
              Caption = #1044#1077#1073#1077#1090
            end>
        end
        object cxGrid3Level2: TcxGridLevel
          Caption = #1088#1088#1088
          GridView = cxGrid3DBBandedTableView1
        end
      end
    end
    object Panel3: TPanel
      Left = 398
      Top = 1
      Width = 400
      Height = 206
      Align = alClient
      Color = clMoneyGreen
      TabOrder = 1
      object cxGrid4: TcxGrid
        Left = 1
        Top = 20
        Width = 398
        Height = 185
        Align = alClient
        TabOrder = 0
        object cxGrid4DBBandedTableView1: TcxGridDBBandedTableView
          DataController.DataSource = DataSourceKredit
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'SUMMA'
              Column = cxGrid4DBBandedTableView1DBBandedColumn4
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Background = cxStyleYellow
          Styles.Content = cxStyleYellow
          Styles.ContentEven = cxStyleYellow
          Styles.ContentOdd = cxStyleYellow
          Styles.Inactive = cxStyle4
          Styles.IncSearch = cxStyleYellow
          Styles.Selection = cxStyleMalin
          Styles.FilterBox = cxStyleYellow
          Styles.Footer = cxStyleBorder
          Styles.Group = cxStyleYellow
          Styles.GroupByBox = cxStyleYellow
          Styles.Header = cxStyleBorder
          Styles.Indicator = cxStyleYellow
          Styles.NewItemRowInfoText = cxStyleYellow
          Styles.Preview = cxStyleYellow
          Styles.BandBackground = cxStyleYellow
          Styles.BandHeader = cxStyle11
          Bands = <
            item
              Caption = #1056#1077#1082#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              Width = 184
            end
            item
              Caption = #1056#1077#1082#1074' '#1087#1088#1086#1074#1086#1076#1082#1080
              Width = 181
            end>
          object cxGrid4DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 77
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
            DataBinding.FieldName = 'NUM_DOC'
          end
          object cxGrid4DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
            Width = 55
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'DATE_DOC'
          end
          object cxGrid4DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
            Width = 36
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'KOD_SCH'
          end
          object cxGrid4DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
            Width = 34
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
            DataBinding.FieldName = 'SUMMA'
          end
          object cxGrid4DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
            Width = 59
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            DataBinding.FieldName = 'NAME'
          end
          object cxGrid4DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
            Width = 51
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
            DataBinding.FieldName = 'NUM_SCH_KOR'
          end
          object cxGrid4DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
            SortOrder = soAscending
            Width = 67
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
            DataBinding.FieldName = 'S_R_S_K'
          end
        end
        object cxGrid4Level1: TcxGridLevel
          GridView = cxGrid4DBBandedTableView1
        end
      end
      object cxLabel2: TcxLabel
        Left = 1
        Top = 1
        Width = 400
        Height = 19
        Align = alTop
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Style.Font.Charset = RUSSIAN_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Times New Roman'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        Caption = #1050#1088#1077#1076#1080#1090
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 390
      Top = 1
      Width = 8
      Height = 206
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 100
      Control = Panel2
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 42
    Width = 799
    Height = 57
    Align = alTop
    Color = clGradientInactiveCaption
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 2
      Top = 2
      Width = 18
      Height = 15
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000230B0000230B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5280F
        A5280FA5280FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0FA5287EE09E51CD830FA528FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
        E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
        E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA528
        0FA5280FA5280FA5280FA5280FA5287EE09E38C2730FA5280FA5280FA5280FA5
        280FA5280FA528FF00FFFF00FF0FA5287EE09E38C27338C27338C27338C27338
        C27338C27338C27338C27338C27338C27351CD830FA528FF00FFFF00FF0FA528
        5FD38B5FD38B5FD38B5FD38B5FD38B51CD8338C2735FD38B5FD38B5FD38B5FD3
        8B5FD38B0FA528FF00FFFF00FF0FA5280FA5280FA5280FA5280FA5280FA5287E
        E09E38C2730FA5280FA5280FA5280FA5280FA5280FA528FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
        E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA52851
        CD835FD38B0FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0FA5280FA5280FA5280FA528FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 2
      Top = 17
      Width = 18
      Height = 16
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000230B0000230B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF001890
        0018900018900018900018900018900018900018900018900018900018900018
        90001890001890FF00FFFF00FF0018908B9EF12952E72952E72952E72952E729
        52E72952E72952E72952E72952E72952E73D59DB001890FF00FFFF00FF001890
        8B9EF1718BED718BED718BED718BED718BED718BED718BED718BED718BED718B
        ED3D59DB001890FF00FFFF00FF00189000189000189000189000189000189000
        1890001890001890001890001890001890001890001890FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = SpeedButton2Click
    end
    object cxComboBoxSystem: TcxComboBox
      Left = 100
      Top = 7
      Width = 221
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Style.Color = 16776176
      TabOrder = 0
      OnClick = cxComboBoxSystemClick
    end
    object cxLabel3: TcxLabel
      Left = 24
      Top = 8
      Width = 68
      Height = 17
      AutoSize = False
      TabOrder = 1
    end
    object cxComboBoxMonth: TcxComboBox
      Left = 464
      Top = 7
      Width = 129
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1089#1110#1095#1077#1085#1100' '
        #1083#1102#1090#1080#1081
        #1073#1077#1088#1077#1079#1077#1085#1100
        #1082#1074#1110#1090#1077#1085#1100
        #1090#1088#1072#1074#1077#1085#1100
        #1095#1077#1088#1074#1077#1085#1100
        #1083#1080#1087#1077#1085#1100
        #1089#1077#1088#1087#1077#1085#1100
        #1074#1077#1088#1077#1089#1077#1085#1100
        #1078#1086#1074#1090#1077#1085#1100
        #1083#1080#1089#1090#1086#1087#1072#1076
        #1075#1088#1091#1076#1077#1085#1100)
      Style.Color = 16776176
      TabOrder = 2
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 640
      Top = 8
      Width = 57
      Height = 21
      Properties.MaxValue = 2025.000000000000000000
      Properties.MinValue = 2004.000000000000000000
      Style.Color = 16776176
      TabOrder = 3
      Value = 2004
      OnClick = cxSpinEdit1Click
    end
    object cxLabel4: TcxLabel
      Left = 333
      Top = 8
      Width = 116
      Height = 17
      AutoSize = False
      TabOrder = 4
      Caption = #1055#1086#1082#1072#1079#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076
    end
    object cxLabel5: TcxLabel
      Left = 602
      Top = 10
      Width = 33
      Height = 17
      AutoSize = False
      TabOrder = 5
    end
    object cxLabel9: TcxLabel
      Left = 442
      Top = 9
      Width = 23
      Height = 17
      AutoSize = False
      TabOrder = 6
      Caption = #1047
    end
    object cxLabel10: TcxLabel
      Left = 442
      Top = 33
      Width = 33
      Height = 17
      AutoSize = False
      TabOrder = 7
      Caption = #1044#1086
    end
    object cxButton1: TcxButton
      Left = 704
      Top = 16
      Width = 89
      Height = 25
      Action = ActionRefresh
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 8
      Colors.Default = clGradientInactiveCaption
      Colors.Normal = clGradientInactiveCaption
      Colors.Hot = clGradientInactiveCaption
      Colors.Pressed = clGradientInactiveCaption
      Colors.Disabled = clGradientInactiveCaption
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001EB2311FB13300
        6600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047D36D3BCB5E25A83B0066001B
        A92E1DB132006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00660041C563006600FF00FFFF00FFFF
        00FFFF00FF00660019AA2B006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 99
    Width = 799
    Height = 237
    Align = alClient
    TabOrder = 3
    object cxDBTreeList2: TcxDBTreeList
      Left = 1
      Top = 1
      Width = 797
      Height = 181
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.Selection = cxStyleMalin
      Styles.BandBackground = cxStyleYellow
      Styles.BandContent = cxStyleYellow
      Styles.BandHeader = cxStyle11
      Styles.ColumnFooter = cxStyleBorder
      Styles.ColumnHeader = cxStyleBorder
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Footer = cxStyleBorder
      Styles.HotTrack = cxStyleYellow
      Styles.IncSearch = cxStyleYellow
      Styles.Indicator = cxStyleYellow
      Styles.Preview = cxStyleYellow
      Align = alClient
      Bands = <
        item
          Caption.Text = 'Band1'
          Width = 350
        end
        item
          Caption.AlignHorz = taCenter
          Caption.Text = 'Band2'
          Width = 142
        end
        item
          Caption.AlignHorz = taCenter
          Caption.Text = 'Band3'
          Width = 144
        end
        item
          Caption.AlignHorz = taCenter
          Caption.Text = 'Band4'
          Width = 142
        end>
      BufferedPaint = False
      DataController.DataSource = DataSourceFIO
      DataController.ParentField = 'LINKTO_LEVE'
      DataController.KeyField = 'ID_LEVE'
      OptionsBehavior.IncSearchItem = cxDBTreeList2cxDBTreeListColumn1
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsData.CheckHasChildren = False
      OptionsSelection.CellSelect = False
      OptionsView.Bands = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = tlglBoth
      RootValue = -1
      TabOrder = 0
      OnCustomDrawCell = cxDBTreeList2CustomDrawCell
      OnKeyDown = cxDBTreeList2KeyDown
      object cxDBTreeList2cxDBTreeListColumn1: TcxDBTreeListColumn
        DataBinding.FieldName = 'FIO'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
        Width = 279
      end
      object cxDBTreeList2cxDBTreeListColumn2: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
        DataBinding.FieldName = 'OST_DEBET'
        Options.Footer = True
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 1
        Width = 74
      end
      object cxDBTreeList2cxDBTreeListColumn3: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
        Styles.Footer = cxStyleBorder
        DataBinding.FieldName = 'OST_KREDIT'
        Options.Footer = True
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 1
        Width = 71
      end
      object cxDBTreeList2cxDBTreeListColumn4: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
        DataBinding.FieldName = 'S_DEBET'
        Options.Footer = True
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 2
        Width = 74
      end
      object cxDBTreeList2cxDBTreeListColumn5: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
        DataBinding.FieldName = 'S_KREDIT'
        Options.Footer = True
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 2
        Width = 73
      end
      object cxDBTreeList2cxDBTreeListColumn6: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
        DataBinding.FieldName = 'OST_ALL_DEBET'
        Options.Footer = True
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 3
        Width = 73
      end
      object cxDBTreeList2cxDBTreeListColumn7: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0,00'#39'.'#39';-,0,00'#39'.'#39
        Styles.Footer = cxStyleBorder
        DataBinding.FieldName = 'OST_ALL_KREDIT'
        Options.Footer = True
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 3
        SummaryFooter.AlignHorz = taRightJustify
        SummaryFooter.AlignVert = vaCenter
        Width = 72
      end
      object cxDBTreeList2cxDBTreeListColumn8: TcxDBTreeListColumn
        DataBinding.FieldName = 'TAB_NUM'
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 79
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 182
      Width = 797
      Height = 54
      Align = alBottom
      Color = clGradientInactiveCaption
      TabOrder = 1
      DesignSize = (
        797
        54)
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 32
        Height = 13
        Caption = 'Label1'
      end
      object Label3: TLabel
        Left = 8
        Top = 32
        Width = 32
        Height = 13
        Caption = 'Label3'
      end
      object Label4: TLabel
        Left = 92
        Top = 31
        Width = 108
        Height = 13
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 208
        Top = 32
        Width = 32
        Height = 13
        Caption = 'Label5'
      end
      object Label6: TLabel
        Left = 299
        Top = 30
        Width = 64
        Height = 13
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxCheckBox1: TcxCheckBox
        Left = 467
        Top = 32
        Width = 321
        Height = 21
        AutoSize = False
        Properties.DisplayUnchecked = 'False'
        TabOrder = 0
        OnClick = cxCheckBox1Click
      end
      object cxLabel6: TcxLabel
        Left = 258
        Top = 5
        Width = 41
        Height = 17
        AutoSize = False
        TabOrder = 1
        Caption = #1058#1072#1073'.'#8470
      end
      object Label2: TcxTextEdit
        Left = 38
        Top = 4
        Width = 217
        Height = 21
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 2
      end
      object cxLabel7: TcxTextEdit
        Left = 296
        Top = 3
        Width = 54
        Height = 21
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 3
      end
      object cxTextEdit1: TcxTextEdit
        Left = 722
        Top = 3
        Width = 67
        Height = 21
        Anchors = [akTop, akRight]
        ParentColor = True
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 4
      end
      object cxTextEdit2: TcxTextEdit
        Left = 652
        Top = 3
        Width = 67
        Height = 21
        Anchors = [akTop, akRight]
        ParentColor = True
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 5
      end
      object cxTextEdit3: TcxTextEdit
        Left = 576
        Top = 3
        Width = 69
        Height = 21
        Anchors = [akTop, akRight]
        ParentColor = True
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 6
      end
      object cxTextEdit4: TcxTextEdit
        Left = 506
        Top = 3
        Width = 68
        Height = 21
        Anchors = [akTop, akRight]
        ParentColor = True
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 7
      end
      object cxTextEdit5: TcxTextEdit
        Left = 431
        Top = 3
        Width = 68
        Height = 21
        Anchors = [akTop, akRight]
        ParentColor = True
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 8
      end
      object cxTextEdit6: TcxTextEdit
        Left = 361
        Top = 3
        Width = 66
        Height = 21
        Anchors = [akTop, akRight]
        ParentColor = True
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        TabOrder = 9
      end
    end
  end
  object cxSplitter2: TcxSplitter
    Left = 0
    Top = 336
    Width = 799
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    Control = Panel1
    Visible = False
  end
  object cxComboBox1: TcxComboBox
    Left = 464
    Top = 71
    Width = 129
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1089#1110#1095#1077#1085#1100' '
      #1083#1102#1090#1080#1081
      #1073#1077#1088#1077#1079#1077#1085#1100
      #1082#1074#1110#1090#1077#1085#1100
      #1090#1088#1072#1074#1077#1085#1100
      #1095#1077#1088#1074#1077#1085#1100
      #1083#1080#1087#1077#1085#1100
      #1089#1077#1088#1087#1077#1085#1100
      #1074#1077#1088#1077#1089#1077#1085#1100
      #1078#1086#1074#1090#1077#1085#1100
      #1083#1080#1089#1090#1086#1087#1072#1076
      #1075#1088#1091#1076#1077#1085#1100)
    Style.Color = 16776176
    TabOrder = 4
  end
  object cxLabel8: TcxLabel
    Left = 602
    Top = 74
    Width = 33
    Height = 17
    AutoSize = False
    ParentColor = False
    Style.Color = clGradientInactiveCaption
    TabOrder = 5
  end
  object cxSpinEdit2: TcxSpinEdit
    Left = 640
    Top = 72
    Width = 57
    Height = 21
    Properties.MaxValue = 2025.000000000000000000
    Properties.MinValue = 2004.000000000000000000
    Style.Color = 16776176
    TabOrder = 10
    Value = 2004
    OnClick = cxSpinEdit1Click
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end
          item
            Item = dxBarLargeButton3
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        ShowMark = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageList
    Images = ImageList
    DisabledImages = ImageList
    DisabledLargeImages = ImageList
    LargeImages = ImageList
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsOffice11
    UseSystemFont = True
    Left = 320
    DockControlHeights = (
      0
      0
      42
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionRefresh
      Category = 0
      AutoGrayScale = False
      HotImageIndex = 7
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActionClose
      Category = 0
      AutoGrayScale = False
      HotImageIndex = 11
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = ActionPrint
      Category = 0
    end
  end
  object ActionList1: TActionList
    Left = 168
    Top = 120
    object ActionRefresh: TAction
      Caption = 'ActionRefresh'
      ShortCut = 116
      OnExecute = ActionRefreshExecute
    end
    object ActionClose: TAction
      Caption = 'ActionClose'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionPrint: TAction
      Caption = 'ActionPrint'
      ImageIndex = 8
      OnExecute = ActionPrintExecute
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 112
    Top = 256
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
  object ImageList: TImageList
    Left = 40
    Top = 257
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000844A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000844A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000000000000000000000000
      0000844A4A00844A4A00A54A4A00AD4A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00D6D6D600E7E7E700EFEFEF00EFEFEF00E7EFE700DEDEDE00B5AD
      AD00A59C9C000000000000000000000000000000000000000000000000000000
      0000844A4A00844A4A00A54A4A00AD4A4A004A18180000000000000000000000
      0000000000000000000000000000000000003939390084848400848484008484
      8400848484008484840084848400848484008484840084848400848484003939
      3900393939000000000000000000000000000000000000000000844A4A00844A
      4A00B54A5200C64A5200C64A4A00B54A4A004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A00000000000000000000000000000000000000
      00004A4A4A00EFEFEF00F7F7F700B5BDBD00C6C6C600CED6CE00FFFFFF007B73
      73004A4A4A000000000000000000000000000000000000000000844A4A00844A
      4A00B54A5200C64A5200C64A4A00B54A4A004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A00000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900393939003939390000000000000000000000000000000000844A4A00D65A
      5A00CE525200CE525200CE525200B54A52004A181800FF8C8C00FF9C9C00FFAD
      AD00F7B5B500F7B5B500844A4A000000000000000000000000006B6B6B004A4A
      4A004A4A4A00F7F7F700EFF7F700D6CED600DED6D600DEDEDE00FFFFFF007B84
      7B004A4A4A004A4A4A006B6B6B00000000000000000000000000844A4A00D65A
      5A00CE525200CE525200CE525200B54A52004A181800FF8C8C00FF9C9C00FFAD
      AD00F7B5B500F7B5B500844A4A000000000039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400393939003939390000000000000000000000000000000000844A4A00D65A
      5A00D65A5A00CE5A5A00CE525A00BD5252004A18180021B54A0010C64A0010BD
      4A0008BD4200F7B5B500844A4A0000000000000000006B6B6B004A4A4A004A4A
      4A004A4A4A00DEE7E700CED6D600848C8C008C8C8C009CA5AD00EFEFEF008484
      84004A4A4A004A4A4A004A4A4A00000000000000000000000000844A4A00D65A
      5A00D65A5A00CE5A5A00CE525A00BD5252004A18180021B54A0010C64A0010BD
      4A0008BD4200F7B5B500844A4A000000000039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000FF000000FF00000000FF000000FF00C6C6C6008484
      8400848484003939390039393900000000000000000000000000844A4A00DE63
      6300D65A6300D65A5A00D65A5A00C6525A004A18180029B54A0018BD4A0018BD
      4A0010BD4200F7B5B500844A4A00000000000000000063636300847B7B006363
      6300636363004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A0063636300B5B5B500524A5A004A4A4A000000000000000000844A4A00DE63
      6300D65A6300D65A5A00D65A5A00C6525A004A18180029B54A0018BD4A0018BD
      4A0010BD4200F7B5B500844A4A000000000039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484008484840039393900000000000000000000000000844A4A00E76B
      6B00DE636300DE636300DE636300C65A5A004A18180021B54A0010BD4A0018BD
      4A0010BD4200F7B5B500844A4A000000000000000000847B8400949C9C008C9C
      9C008C9C9400949C9C00949494008C8C8C007B847B008C9C94008C9494008C94
      9C008C849C008CFF7B008C9C9C00393939000000000000000000844A4A00E76B
      6B00DE636300DE636300DE636300C65A5A004A18180021B54A0010BD4A0018BD
      4A0010BD4200F7B5B500844A4A00000000000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C6C6
      C600848484008484840039393900000000000000000000000000844A4A00EF6B
      6B00E7636B00E77B7B00FFD6D600CE6B73004A181800A5DE940052D66B0042CE
      630029C65A00F7B5B500844A4A000000000000000000ADADAD00D6DEDE008C6B
      73009C6B7300A57B7B00BD8C8C00C68C9400BD8C9400BD8C8C00C68C8C00AD84
      8400A56B7B007B947300BDD6BD004A4A4A000000000000000000844A4A00EF6B
      6B00E7636B00E77B7B00FFD6D600CE6B73004A181800A5DE940052D66B0042CE
      630029C65A00F7B5B500844A4A00000000000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C6C6C6008484840039393900000000000000000000000000844A4A00F773
      7300EF6B6B00EF848400FFD6D600CE6B73004A181800FFF7CE00FFFFD600FFFF
      D600E7FFC600F7B5B500844A4A000000000000000000B5B5B500CED6D600844A
      5200BD7B8400A57B7B00A57B7B00AD7B7B009C7B7B00AD7B7B00A57B7B00AD84
      8400B5848400AD7B9C00E7D6E700636363000000000000000000844A4A00F773
      7300EF6B6B00EF848400FFD6D600CE6B73004A181800FFF7CE00FFFFD600FFFF
      D600E7FFC600F7B5B500844A4A00000000000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B00393939003939390000000000000000000000000000000000844A4A00FF7B
      7B00F7737300EF737300F7737300D66363004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A000000000000000000B5B5B500CECECE004218
      21004A4A4A00736363007B63630073636300736363007B6363007B6363005231
      310039393900A59C9C00CECECE00ADADAD000000000000000000844A4A00FF7B
      7B00F7737300EF737300F7737300D66363004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B00000000000000000000000000000000000000000000000000844A4A00FF7B
      8400F77B7B00F77B7B00F7737B00D66B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A000000000000000000B5B5B500D6CECE004221
      21004A4A4A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5A5
      A5004A4A4A00B5A5A500CECECE00000000000000000000000000844A4A00FF7B
      8400F77B7B00F77B7B00F7737B00D66B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A0000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B000000000000000000000000000000000000000000844A4A00FF84
      8400FF7B8400FF7B7B00FF7B8400DE6B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000E7EFEF00EFEF
      EF00EFE7E700E7E7E700F7FFFF00F7FFFF00FFFFFF00FFFFFF00EFF7F700D6D6
      D600E7E7E700EFE7E700E7EFE700000000000000000000000000844A4A00FF84
      8400FF7B8400FF7B7B00FF7B8400DE6B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A0000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B000000000000000000000000000000000000000000844A4A00FF8C
      8C00FF848400FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      000000000000DEDEDE00F7F7F700FFFFFF00CECECE00B5B5B500B5B5B500CED6
      D600000000000000000000000000000000000000000000000000844A4A00FF8C
      8C00FF848400FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B0000000000000000000000000000000000844A4A00844A
      4A00E7737300FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      CE00FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      000000000000CECECE00F7F7F700DEDEDE00B5B5B500FFFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000844A4A00844A
      4A00E7737300FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      CE00FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B0000000000000000000000000000000000000000000000
      0000844A4A009C525200CE6B6B00CE6B6B004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A00000000000000000000000000000000000000
      000000000000CECECE00F7F7F700CECECE00B5B5B500FFFFFF00E7E7E7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000844A4A009C525200CE6B6B00CE6B6B004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000844A4A00844A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00B5B5B500B5B5B500BDBDBD00CECECE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000844A4A00844A4A004A18180000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D60000000000EF42
      0000AD290000AD29000073290000732900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000094736B00B58C7B00B584
      7B00B5847B00B5847B00B5847B00B5847B00B5847B00B5847B00AD847B00AD84
      7B00B5848400B58C7B00845A52000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      000000000000000000000000000000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000B5948C00F7DECE00FFDE
      C600FFDEC600FFDEC600FFD6BD00FFD6BD00FFD6B500FFD6B500F7CEB500F7CE
      AD00F7CEAD00FFCEAD009C736B000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600000000000000
      0000AD290000AD290000732900007329000000000000B5949400EFEFD600FFF7
      D600E7E7BD00E7E7BD00FFEFD600F7E7B500EFE7AD00FFDEB500FFDEAD00FFD6
      A500F7D6A500FFDEB500A57373000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600000000000000
      0000AD290000AD290000732900007329000000000000BD9C9400EFEFE700FFFF
      EF00ADD68C00009C0000009C0000009C0000009C000000940000219C2100D6CE
      9C00FFD6AD00FFD6BD009C7373000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD290000732900007329000000000000C6A59C00EFF7EF00FFFF
      F700ADDE9C0000940000009C000010A510009CCE9400ADC6940029AD21005AB5
      4A00F7DEB500FFDEC6009C7373000000000000000000FFF7E70042424200FFD6
      A50042424200FFD6A50018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000C6A5A500EFF7EF00FFFF
      F700B5DEA500009C000008A5080018A5180052B54200F7E7C600F7E7C6005AB5
      5A00DED69C00FFDEC600A57B73000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001818180018181800F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD290000732900007329000000000000CEADA500F7FFF700F7F7
      E700DEEFCE00FFF7E700F7F7DE00FFF7DE00FFE7CE00FFEFDE00FFEFDE00F7E7
      CE00F7DEB500FFDEC600AD7B73000000000000000000FFF7EF00F7E7CE00F7DE
      C600181818001818180018181800F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C39210000000000D6B5A500F7FFFF00E7F7
      E7008CD68C00EFF7DE00FFFFFF00C6DEAD004AB5390052B542004AB53900C6D6
      9C00FFEFD600FFE7CE00AD7B73000000000000000000FFFFF700FFD6A5001818
      18008484840000FFFF0018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000CED6D600FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100CED6D60000000000D6B5A500F7FFFF00FFFF
      FF008CCE94004ABD5200E7EFDE00FFFFEF0063BD63000094000000940000ADD6
      8C00FFEFDE00FFDECE00AD7B73000000000000000000FFFFF700FFE7D6001818
      1800C6C6C60000FFFF0018181800FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C3100000000000000000000CED6D600CED6D600FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100CED6D600CED6D60000000000DEBDA500F7FFFF00FFFF
      FF00EFF7E70039AD310018A518005AC65A0031AD3100009C000000940000ADD6
      8C00FFF7E700FFDECE00AD847B000000000000000000FFFFFF00181818008484
      840000FFFF0018181800FFFFF700FFFFF70000000000FFFFFF00C68C7B00CED6
      D600000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000E7C6A500F7FFFF00FFFF
      FF00FFFFFF00C6EFCE0021AD2100009400000094000010A51000089C1000A5CE
      8C00FFCEC600FFADA500AD7B730000000000000000004242420084848400C6C6
      C60000FFFF0018181800FFFFFF00FFFFFF0000000000C68C7B00CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000E7CEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      9400D6945200C69C7B00C6ADA5000000000000000000181818001818180000FF
      FF001818180000000000000000000000000000000000CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C3100000000000000000000CED6D600CED6D600CED6D600FFA5
      3900FF9C1800EF4200008C392100CED6D600CED6D600FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000EFCEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00F7FFFF00F7FFFF00C6AD
      9C00D69C7300DECEB50000000000000000001818180000008400000084001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000CED6D600CED6D600CED6D600FFA5
      3900F7FFFF00EF4200008C392100CED6D600CED6D600FFA53900F7FFFF000000
      00008C392100CED6D600CED6D600CED6D60000000000E7C69C00E7C6A500E7C6
      A500E7C6A500E7C6A500E7C6A500E7C6A500DEC6A500DEC6A500DEC6A500C69C
      8400DECEBD00000000000000000000000000CED6D60018181800181818001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF6331000000000000000000CED6D600CED6D600CED6D600FFCE
      6300FFCE6300FFA53900FFA53900CED6D600CED6D600FFCE6300FFA53900FFA5
      39008C392100CED6D600CED6D600CED6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000084840000FFFF00008484000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      84000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000084840000000000000000000000
      000000000000000000000000000000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004A844A004A844A004A84
      4A004A844A00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000000000000000000000FF
      FF0000FFFF00848484008484840000FFFF0000FFFF0000848400000000000000
      000000000000000000000000000000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004A844A0052AD520052AD
      52004A844A00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000000000008484840000FF
      FF008484840000000000000000008484840000FFFF0000FFFF00008484000000
      000000000000000000000000000000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A004A844A004A844A0052AD520052AD
      52004A844A004A844A004A844A00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B00000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFF0000FFFF000084
      840000000000000000000000000000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A0052AD520052AD520052AD520052AD
      520052AD520052AD52004A844A00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000848400000000000000000000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004A844A006BCE84006BCE84006BCE840052AD
      520052AD520052AD52004A844A00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      840000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF00000000000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004A844A004A844A004A844A006BCE840052AD
      52004A844A004A844A004A844A00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      840084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004A844A006BCE840052AD
      52004A844A000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      840000008400000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004A844A004A844A004A84
      4A004A844A000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      84000000840000000000000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFE7FFFFFFE7F800FF07FF007F07F
      0007C001F007C0010003C001C001C0010003C0018001C0010001C0018000C001
      0001C0018000C0018001C0018000C001C001C0018000C001C003C0018000C001
      C00FC0018001C001E007C001C001C001E007C001F80FC001F003C001F80FC001
      F803F001F81FF001FFFFFC7FF83FFC7F800FFCFFE020FFFF800FFC3F20008001
      800FFC1F20008001800FF80320308001800FF00320308001800FF80360308001
      800FD80340308001800FD80340308001800F000300308001800F800300308001
      80EFD80300308001808FD00300308001808FF80300308001878FF80300308003
      000FF80300108007000FF8030000FFFFFFFFF003FFFFFFFFFFFFF003FFFFE001
      FFFFF003FFFFE001FDFFF003C7E7E001F8FF0003C3C7E001F07F0003E18FC001
      E03F0003F01FC001C01F0003F83FE001C60F0001FC3FE001EF070001F81FE001
      FF830001F10FE001FFC30001E387E001FFE30007C7C7E003FFF70007CFE7C007
      FFFF007FFFFF800FFFFF00FFFFFFFF9F00000000000000000000000000000000
      000000000000}
  end
  object DataSetFIO: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'SELECT * FROM J4_OTCHET_MONTH('#39'01.01.2005'#39',1, 0,0)')
    AfterScroll = DataSetFIOAfterScroll
    Left = 200
    Top = 160
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    object DataSetFIOSUMMA_DEBET: TFIBBCDField
      FieldName = 'SUMMA_DEBET'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetFIODATE_PROV_DEBET: TFIBDateField
      FieldName = 'DATE_PROV_DEBET'
    end
    object DataSetFIONAME_RECVIZITI_DEBET: TFIBStringField
      FieldName = 'NAME_RECVIZITI_DEBET'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetFIONAME_RECVIZITI_KREDIT: TFIBStringField
      FieldName = 'NAME_RECVIZITI_KREDIT'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetFIODATE_PROV_KREDIT: TFIBDateField
      FieldName = 'DATE_PROV_KREDIT'
    end
    object DataSetFIOFAMILIA: TFIBStringField
      DisplayWidth = 40
      FieldName = 'FAMILIA'
      EmptyStrToNull = True
    end
    object DataSetFIOIMYA: TFIBStringField
      DisplayWidth = 40
      FieldName = 'IMYA'
      EmptyStrToNull = True
    end
    object DataSetFIOOTCHESTVO: TFIBStringField
      DisplayWidth = 40
      FieldName = 'OTCHESTVO'
      EmptyStrToNull = True
    end
    object DataSetFIOBIRTHDAY: TFIBDateField
      FieldName = 'BIRTHDAY'
    end
    object DataSetFIOTIN: TFIBStringField
      FieldName = 'TIN'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetFIONUM_DOC_DEBET: TFIBStringField
      FieldName = 'NUM_DOC_DEBET'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetFIONUM_DOC_KREDIT: TFIBStringField
      FieldName = 'NUM_DOC_KREDIT'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetFIODEBET_SCH: TFIBStringField
      FieldName = 'DEBET_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetFIOKREDIT_SCH: TFIBStringField
      FieldName = 'KREDIT_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetFIOOST_ALL_DEBET: TFIBBCDField
      FieldName = 'OST_ALL_DEBET'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOOST_ALL_KREDIT: TFIBBCDField
      FieldName = 'OST_ALL_KREDIT'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOOST_DEBET: TFIBBCDField
      FieldName = 'OST_DEBET'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOOST_KREDIT: TFIBBCDField
      FieldName = 'OST_KREDIT'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOFLAG_FIO: TFIBIntegerField
      FieldName = 'FLAG_FIO'
    end
    object DataSetFIOFIO: TFIBStringField
      DisplayWidth = 150
      FieldName = 'FIO'
      Size = 62
      EmptyStrToNull = True
    end
    object DataSetFIOOSN_SCH: TFIBStringField
      FieldName = 'OSN_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetFIOSUMMA_KREDIT: TFIBBCDField
      FieldName = 'SUMMA_KREDIT'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIODATE_OST: TFIBDateField
      FieldName = 'DATE_OST'
    end
    object DataSetFIOCOUNT_DOC: TFIBIntegerField
      FieldName = 'COUNT_DOC'
    end
    object DataSetFIONAME_PREDPR: TFIBStringField
      FieldName = 'NAME_PREDPR'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetFIOR_J4: TFIBBCDField
      FieldName = 'R_J4'
      Size = 0
      RoundByScale = True
    end
    object DataSetFIOLEVEL_: TFIBIntegerField
      FieldName = 'LEVEL_'
    end
    object DataSetFIOR_ID_MAN: TFIBBCDField
      FieldName = 'R_ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object DataSetFIOR_ID_SCH: TFIBBCDField
      FieldName = 'R_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetFIOR_ID_SM: TFIBBCDField
      FieldName = 'R_ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DataSetFIOR_ID_ST: TFIBBCDField
      FieldName = 'R_ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DataSetFIOR_ID_RAZ: TFIBBCDField
      FieldName = 'R_ID_RAZ'
      Size = 0
      RoundByScale = True
    end
    object DataSetFIOR_ID_KEKV: TFIBBCDField
      FieldName = 'R_ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DataSetFIOID_LEVE: TFIBIntegerField
      FieldName = 'ID_LEVE'
    end
    object DataSetFIOLINKTO_LEVE: TFIBIntegerField
      FieldName = 'LINKTO_LEVE'
    end
    object DataSetFIOTAB_NUM: TFIBIntegerField
      FieldName = 'TAB_NUM'
    end
    object DataSetFIOALL_SUM_VH_OST_D: TFIBBCDField
      FieldName = 'ALL_SUM_VH_OST_D'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOALL_SUM_VH_OST_K: TFIBBCDField
      FieldName = 'ALL_SUM_VH_OST_K'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOALL_SUM_VIH_OST_K: TFIBBCDField
      FieldName = 'ALL_SUM_VIH_OST_K'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOALL_SUM_VIH_OST_D: TFIBBCDField
      FieldName = 'ALL_SUM_VIH_OST_D'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOALL_SUMM_OB_DEB: TFIBBCDField
      FieldName = 'ALL_SUMM_OB_DEB'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOALL_SUMM_OB_KRED: TFIBBCDField
      FieldName = 'ALL_SUMM_OB_KRED'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOS_DEBET: TFIBBCDField
      FieldName = 'S_DEBET'
      Size = 2
      RoundByScale = True
    end
    object DataSetFIOS_KREDIT: TFIBBCDField
      FieldName = 'S_KREDIT'
      Size = 2
      RoundByScale = True
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 128
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 96
    Top = 128
  end
  object DataSourceFIO: TDataSource
    DataSet = DataSetFIO
    Left = 168
    Top = 160
  end
  object DataSourceDebet: TDataSource
    DataSet = DataSetDebet
    Left = 162
    Top = 353
  end
  object DataSourceKredit: TDataSource
    DataSet = DataSetKredit
    Left = 411
    Top = 412
  end
  object DataSetDebet: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'SELECT * FROM J4_SELECT_OBOROT_BUH(0, 0, 0, 0, 0, 0, 0, 0, 1, '#39'0' +
        '1.01.2000'#39')')
    Left = 210
    Top = 361
    poSQLINT64ToBCD = True
    object DataSetDebetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetDebetKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetDebetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetDebetNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetDebetNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetDebetNUM_SCH_KOR: TFIBStringField
      FieldName = 'NUM_SCH_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetDebetSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetDebetRAZ_KOD: TFIBIntegerField
      FieldName = 'RAZ_KOD'
    end
    object DataSetDebetST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetDebetKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetDebetS_R_S_K: TFIBStringField
      FieldName = 'S_R_S_K'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object DataSetKredit: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'SELECT * FROM J4_SELECT_OBOROT_BUH(0, 0, 0, 0, 0, 0, 0, 0, 1, '#39'0' +
        '1.01.2000'#39')')
    Left = 451
    Top = 420
    poSQLINT64ToBCD = True
    object DataSetKreditSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetKreditKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetKreditDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetKreditNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetKreditNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetKreditNUM_SCH_KOR: TFIBStringField
      FieldName = 'NUM_SCH_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetKreditSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetKreditRAZ_KOD: TFIBIntegerField
      FieldName = 'RAZ_KOD'
    end
    object DataSetKreditST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetKreditKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetKreditS_R_S_K: TFIBStringField
      FieldName = 'S_R_S_K'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object DataSetSelectSystem: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    Left = 304
    Top = 40
    poSQLINT64ToBCD = True
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'cxComboBoxSystem.Text')
    StoredValues = <>
    Left = 328
    Top = 193
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40710.576530844900000000
    ReportOptions.LastChange = 41043.601461875000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      
        '  if (<mon_beg>=<mon_end>) and  (inttostr(<year_beg>)=inttostr(<' +
        'year_end>))'
      '  then'
      
        '  memo2.text := '#39#1079#1072' '#39'+ <mon_beg> + '#39' '#39' +inttostr(<year_beg>) +'#39' ' +
        #1088#1086#1082#1091#39
      
        '  else memo2.text := '#39#1079#1072' '#39'+ <mon_beg>+ '#39' '#39' +inttostr(<year_beg>)' +
        ' +'#39' '#1088#1086#1082#1091' - '#39'+'#39' '#39'+<mon_end>+ '#39' '#39' +inttostr(<year_end>) +'#39' '#1088#1086#1082#1091#39';'
      ''
      'end;'
      ''
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 304
    Top = 145
    Datasets = <
      item
        DataSet = frxDBDatasetDoc
        DataSetName = 'frxDBDatasetDoc'
      end
      item
        DataSet = frxDBDatasetOstVh
        DataSetName = 'frxDBDatasetOstVh'
      end
      item
        DataSet = frxDBDatasetOstVih
        DataSetName = 'frxDBDatasetOstVih'
      end
      item
        DataSet = frxDBDatasetProv
        DataSetName = 'frxDBDatasetProv'
      end>
    Variables = <
      item
        Name = 'date_beg'
        Value = #39'01.06.2011'#39
      end
      item
        Name = 'date_end'
        Value = #39'01.07.2011'#39
      end
      item
        Name = 'tn'
        Value = #39#39
      end
      item
        Name = 'fio'
        Value = #39#1047#1040#1042#1048#1044#1054#1042#1057#1068#1050#1048#1049' '#1041#1054#1043#1044#1040#1053' '#1030#1042#1040#1053#1054#1042#1048#1063#39
      end
      item
        Name = 'inn'
        Value = #39'3336605212'#39
      end
      item
        Name = 'mon_beg'
        Value = #39#1095#1077#1088#1074#1077#1085#1100#39
      end
      item
        Name = 'mon_end'
        Value = #39#1095#1077#1088#1074#1077#1085#1100#39
      end
      item
        Name = 'year_beg'
        Value = '2011'
      end
      item
        Name = 'year_end'
        Value = '2011'
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 15.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 136.063080000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 7.559060000000000000
          Width = 483.779840000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1055#1077#1088#1089#1086#1085#1110#1092#1110#1082#1086#1074#1072#1085#1110' '#1076#1072#1085#1110' '#1087#1088#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1080' '#1090#1072' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1102' '#1087#1110#1076#1079#1074#1110#1090#1085#1086#1111' ' +
              #1086#1089#1086#1073#1080)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 49.133890000000000000
          Width = 483.779840000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo2OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 71.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1110#1076#1079#1074#1110#1090#1085#1072' '#1086#1089#1086#1073#1072)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 113.385900000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 132.283550000000000000
          Top = 75.590600000000000000
          Width = 347.716760000000000000
          Height = 37.795300000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '<i><u>[fio]</u></i> ')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 132.283550000000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic, fsUnderline]
          Memo.Strings = (
            '[inn]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 226.771800000000000000
          Top = 113.385900000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            ' ('#1058#1053'  <i><u>[tn]</u></i> )')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetDoc
        DataSetName = 'frxDBDatasetDoc'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetDoc."SUM_DOC_KR"]')
        end
        object Memo9: TfrxMemoView
          Left = 226.771800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetDoc."DATE_DOC"]')
        end
        object Memo10: TfrxMemoView
          Left = 83.149660000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetDoc."NUM_DOC"]')
        end
        object Memo11: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetDoc."NAME"]')
        end
        object Memo12: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetDoc."SUM_DOC_DB"]')
        end
      end
      object Header1: TfrxHeader
        Height = 83.149660000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Width = 483.779840000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1082#1091#1084#1077#1085#1090#1080)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 22.677180000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo15: TfrxMemoView
          Left = 306.141930000000000000
          Top = 22.677180000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo16: TfrxMemoView
          Left = 393.071120000000000000
          Top = 22.677180000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
        object Memo17: TfrxMemoView
          Top = 41.574830000000100000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' [date_beg]:')
        end
        object Memo18: TfrxMemoView
          Left = 306.141930000000000000
          Top = 41.574830000000100000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."VH_DEB"]')
        end
        object Memo19: TfrxMemoView
          Left = 393.071120000000000000
          Top = 41.574830000000100000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."VH_KR"]')
        end
        object Memo35: TfrxMemoView
          Left = 393.071120000000000000
          Top = 64.252010000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
        object Memo36: TfrxMemoView
          Left = 226.771800000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
        end
        object Memo37: TfrxMemoView
          Left = 83.149660000000000000
          Top = 64.252010000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088)
        end
        object Memo38: TfrxMemoView
          Top = 64.252010000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087)
        end
        object Memo39: TfrxMemoView
          Left = 306.141930000000000000
          Top = 64.252010000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Line3: TfrxLineView
          Top = 64.252010000000000000
          Width = 480.000310000000000000
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object Footer1: TfrxFooter
        Height = 60.472480000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        object Memo20: TfrxMemoView
          Top = 22.677180000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' [date_end]:')
        end
        object Memo21: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetDoc."SUM_DOC_DB">,MasterData1)]')
        end
        object Memo22: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SUM(<frxDBDatasetDoc."SUM_DOC_KR">,MasterData1)]')
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 476.220780000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
        object Memo60: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1079#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084#1080':')
        end
        object Memo61: TfrxMemoView
          Left = 306.141930000000000000
          Top = 22.677180000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."VIH_DEB"]')
        end
        object Memo62: TfrxMemoView
          Left = 393.071120000000000000
          Top = 22.677180000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."VIH_KR"]')
        end
        object Line2: TfrxLineView
          Top = 22.677180000000000000
          Width = 480.000310000000000000
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object Header2: TfrxHeader
        Height = 60.472480000000000000
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          Width = 483.779840000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1103)
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 22.677180000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082' '#1085#1072' [date_beg]:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 143.622140000000000000
          Top = 41.574830000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1073'/'#1088'/'#1089#1090'/'#1050#1045#1050#1042)
        end
        object Memo26: TfrxMemoView
          Left = 306.141930000000000000
          Top = 41.574830000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo27: TfrxMemoView
          Top = 41.574830000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
        end
        object Memo28: TfrxMemoView
          Left = 393.071120000000000000
          Top = 41.574830000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 529.134200000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = frxDBDatasetOstVh
        DataSetName = 'frxDBDatasetOstVh'
        RowCount = 0
        Stretched = True
        object Memo29: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo29OnBeforePrint'
          StretchMode = smMaxHeight
          DataField = 'VH_SUM_DB'
          DataSet = frxDBDatasetOstVh
          DataSetName = 'frxDBDatasetOstVh'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetOstVh."VH_SUM_DB"]')
        end
        object Memo30: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'VH_SUM_KR'
          DataSet = frxDBDatasetOstVh
          DataSetName = 'frxDBDatasetOstVh'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetOstVh."VH_SUM_KR"]')
        end
        object Memo31: TfrxMemoView
          Left = 143.622140000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'S_R_S_K'
          DataSet = frxDBDatasetOstVh
          DataSetName = 'frxDBDatasetOstVh'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetOstVh."S_R_S_K"]')
        end
        object Memo32: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KOD_SCH'
          DataSet = frxDBDatasetOstVh
          DataSetName = 'frxDBDatasetOstVh'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetOstVh."KOD_SCH"]')
        end
      end
      object Footer2: TfrxFooter
        Height = 18.897650000000000000
        Top = 570.709030000000000000
        Width = 718.110700000000000000
        object Memo63: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetOstVh."VH_SUM_DB">,MasterData2)]')
        end
        object Memo64: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetOstVh."VH_SUM_KR">,MasterData2)]')
        end
        object Memo65: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1074#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082':')
        end
      end
      object Header3: TfrxHeader
        Height = 56.692950000000000000
        Top = 612.283860000000000000
        Width = 718.110700000000000000
        object Memo33: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 162.519790000000000000
          Height = 37.795300000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1073'/'#1088'/'#1089#1090'/'#1050#1045#1050#1042)
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 306.141930000000000000
          Top = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo40: TfrxMemoView
          Left = 393.071120000000000000
          Top = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
        object Memo41: TfrxMemoView
          Left = 306.141930000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
        object Memo42: TfrxMemoView
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1082#1080)
        end
        object Memo44: TfrxMemoView
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo45: TfrxMemoView
          Left = 71.811070000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1103)
          ParentFont = False
        end
      end
      object Footer3: TfrxFooter
        Height = 18.897650000000000000
        Top = 733.228820000000000000
        Width = 718.110700000000000000
        object Memo66: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetProv."SUMMA_DB">,MasterData3)]')
        end
        object Memo67: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetProv."SUMMA_KR">,MasterData3)]')
        end
        object Memo68: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1080':')
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 691.653990000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetProv
        DataSetName = 'frxDBDatasetProv'
        RowCount = 0
        Stretched = True
        object Memo46: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."SUMMA_DB"]')
        end
        object Memo47: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetProv."SUMMA_KR"]')
        end
        object Memo48: TfrxMemoView
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'NUM_SCH_KOR'
          DataSet = frxDBDatasetProv
          DataSetName = 'frxDBDatasetProv'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetProv."NUM_SCH_KOR"]')
        end
        object Memo49: TfrxMemoView
          Left = 71.811070000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KOD_SCH'
          DataSet = frxDBDatasetProv
          DataSetName = 'frxDBDatasetProv'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetProv."KOD_SCH"]')
        end
        object Memo50: TfrxMemoView
          Left = 143.622140000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetProv."S_R_S_K"]')
        end
      end
      object Header4: TfrxHeader
        Height = 37.795300000000000000
        Top = 774.803650000000000000
        Width = 718.110700000000000000
        object Memo51: TfrxMemoView
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1080#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082' '#1085#1072' [date_end]:')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 143.622140000000000000
          Top = 18.897650000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1073'/'#1088'/'#1089#1090'/'#1050#1045#1050#1042)
        end
        object Memo53: TfrxMemoView
          Left = 306.141930000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
        end
        object Memo54: TfrxMemoView
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
        end
        object Memo55: TfrxMemoView
          Left = 393.071120000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
        end
      end
      object MasterData4: TfrxMasterData
        Height = 18.897650000000000000
        Top = 835.276130000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetOstVih
        DataSetName = 'frxDBDatasetOstVih'
        RowCount = 0
        Stretched = True
        object Memo56: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'VIH_SUM_DB'
          DataSet = frxDBDatasetOstVih
          DataSetName = 'frxDBDatasetOstVih'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetOstVih."VIH_SUM_DB"]')
        end
        object Memo57: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetOstVih
          DataSetName = 'frxDBDatasetOstVih'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDatasetOstVih."VIH_SUM_KR"]')
        end
        object Memo58: TfrxMemoView
          Left = 143.622140000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'S_R_S_K'
          DataSet = frxDBDatasetOstVih
          DataSetName = 'frxDBDatasetOstVih'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetOstVih."S_R_S_K"]')
        end
        object Memo59: TfrxMemoView
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KOD_SCH'
          DataSet = frxDBDatasetOstVih
          DataSetName = 'frxDBDatasetOstVih'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDatasetOstVih."KOD_SCH"]')
        end
      end
      object Footer4: TfrxFooter
        Height = 64.252010000000000000
        Top = 876.850960000000000000
        Width = 718.110700000000000000
        object Memo69: TfrxMemoView
          Left = 306.141930000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetOstVih."VIH_SUM_DB">,MasterData4)]')
        end
        object Memo70: TfrxMemoView
          Left = 393.071120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetOstVih."VIH_SUM_KR">,MasterData4)]')
        end
        object Memo71: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Color = 14211288
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1074#1080#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082':')
        end
        object Memo73: TfrxMemoView
          Top = 30.236240000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1088#1086#1074#1110#1076#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088)
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 151.181200000000000000
          Top = 30.236240000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 238.110390000000000000
          Top = 30.236240000000000000
          Width = 230.551330000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[fio_b]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 1001.575450000000000000
        Width = 718.110700000000000000
        object Memo72: TfrxMemoView
          Left = 404.409710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#]')
        end
      end
    end
  end
  object frxDBDatasetDoc: TfrxDBDataset
    UserName = 'frxDBDatasetDoc'
    CloseDataSource = False
    DataSet = DataSetOborotMenDoc
    Left = 344
    Top = 145
  end
  object DataSetOborotMen: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'select *from J4_SELECT_OBOROT_BUH_MEN(1,1,'#39'01.06.2011'#39','#39'01.06.20' +
        '11'#39')'
      'order by date_doc')
    Left = 120
    Top = 41
    poSQLINT64ToBCD = True
    object DataSetOborotMenSUMMA_DB: TFIBBCDField
      FieldName = 'SUMMA_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenSUMMA_KR: TFIBBCDField
      FieldName = 'SUMMA_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOborotMenDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetOborotMenNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetOborotMenNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetOborotMenNUM_SCH_KOR: TFIBStringField
      FieldName = 'NUM_SCH_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOborotMenSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetOborotMenRAZ_KOD: TFIBIntegerField
      FieldName = 'RAZ_KOD'
    end
    object DataSetOborotMenST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetOborotMenKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetOborotMenVH_DEB: TFIBBCDField
      FieldName = 'VH_DEB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenVH_KR: TFIBBCDField
      FieldName = 'VH_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenVIH_DEB: TFIBBCDField
      FieldName = 'VIH_DEB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenVIH_KR: TFIBBCDField
      FieldName = 'VIH_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenS_R_S_K: TFIBStringField
      FieldName = 'S_R_S_K'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOborotMenSUM_DOC_DB: TFIBBCDField
      FieldName = 'SUM_DOC_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenSUM_DOC_KR: TFIBBCDField
      FieldName = 'SUM_DOC_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenPK_ID: TFIBBCDField
      FieldName = 'PK_ID'
      Size = 0
      RoundByScale = True
    end
  end
  object frxDBDatasetProv: TfrxDBDataset
    UserName = 'frxDBDatasetProv'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SUMMA_DB=SUMMA_DB'
      'SUMMA_KR=SUMMA_KR'
      'KOD_SCH=KOD_SCH'
      'DATE_DOC=DATE_DOC'
      'NUM_DOC=NUM_DOC'
      'NAME=NAME'
      'NUM_SCH_KOR=NUM_SCH_KOR'
      'SM_KOD=SM_KOD'
      'RAZ_KOD=RAZ_KOD'
      'ST_KOD=ST_KOD'
      'KEKV_KOD=KEKV_KOD'
      'VH_DEB=VH_DEB'
      'VH_KR=VH_KR'
      'VIH_DEB=VIH_DEB'
      'VIH_KR=VIH_KR'
      'S_R_S_K=S_R_S_K'
      'SUM_DOC_DB=SUM_DOC_DB'
      'SUM_DOC_KR=SUM_DOC_KR')
    DataSet = DataSetOborotMen
    Left = 376
    Top = 145
  end
  object DataSetOborotMenDoc: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'select distinct pk_id,date_doc, num_doc, sum_doc_db,sum_doc_kr,n' +
        'ame from J4_SELECT_OBOROT_BUH_MEN(1,1,'#39'01.06.2011'#39','#39'01.06.2011'#39')'
      'order by date_doc')
    Left = 88
    Top = 41
    poSQLINT64ToBCD = True
    object FIBDateField1: TFIBDateField
      FieldName = 'DATE_DOC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object FIBStringField2: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object FIBStringField3: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object FIBBCDField7: TFIBBCDField
      FieldName = 'SUM_DOC_DB'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object FIBBCDField8: TFIBBCDField
      FieldName = 'SUM_DOC_KR'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object DataSetOborotMenDocPK_ID: TFIBBCDField
      FieldName = 'PK_ID'
      Size = 0
      RoundByScale = True
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 248
    Top = 217
  end
  object DataSetOstatkiMenVh: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'select* from J4_SELECT_OSTATKI_BUH_MEN(1,1,'#39'01.06.2011'#39','#39'01.06.2' +
        '011'#39')'
      'where vh=1')
    Left = 160
    Top = 41
    poSQLINT64ToBCD = True
    object DataSetOstatkiMenVhKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVhDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetOstatkiMenVhNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVhNUM_SCH_KOR: TFIBStringField
      FieldName = 'NUM_SCH_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVhSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetOstatkiMenVhRAZ_KOD: TFIBIntegerField
      FieldName = 'RAZ_KOD'
    end
    object DataSetOstatkiMenVhST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetOstatkiMenVhKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetOstatkiMenVhVH_SUM_DB: TFIBBCDField
      FieldName = 'VH_SUM_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVhVH_SUM_KR: TFIBBCDField
      FieldName = 'VH_SUM_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVhVIH_SUM_DB: TFIBBCDField
      FieldName = 'VIH_SUM_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVhVIH_SUM_KR: TFIBBCDField
      FieldName = 'VIH_SUM_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVhS_R_S_K: TFIBStringField
      FieldName = 'S_R_S_K'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVhVH: TFIBIntegerField
      FieldName = 'VH'
    end
  end
  object DataSetOstatkiMenVih: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'select *from J4_SELECT_OSTATKI_BUH_MEN(1,1,'#39'01.06.2011'#39','#39'01.06.2' +
        '011'#39')'
      'where vh=0')
    Left = 192
    Top = 41
    poSQLINT64ToBCD = True
    object DataSetOstatkiMenVihKOD_SCH: TFIBStringField
      FieldName = 'KOD_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVihDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetOstatkiMenVihNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVihNUM_SCH_KOR: TFIBStringField
      FieldName = 'NUM_SCH_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVihSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetOstatkiMenVihRAZ_KOD: TFIBIntegerField
      FieldName = 'RAZ_KOD'
    end
    object DataSetOstatkiMenVihST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetOstatkiMenVihKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetOstatkiMenVihVH_SUM_DB: TFIBBCDField
      FieldName = 'VH_SUM_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVihVH_SUM_KR: TFIBBCDField
      FieldName = 'VH_SUM_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVihVIH_SUM_DB: TFIBBCDField
      FieldName = 'VIH_SUM_DB'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVihVIH_SUM_KR: TFIBBCDField
      FieldName = 'VIH_SUM_KR'
      Size = 2
      RoundByScale = True
    end
    object DataSetOstatkiMenVihS_R_S_K: TFIBStringField
      FieldName = 'S_R_S_K'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetOstatkiMenVihVH: TFIBIntegerField
      FieldName = 'VH'
    end
  end
  object frxDBDatasetOstVh: TfrxDBDataset
    UserName = 'frxDBDatasetOstVh'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KOD_SCH=KOD_SCH'
      'DATE_DOC=DATE_DOC'
      'NAME=NAME'
      'NUM_SCH_KOR=NUM_SCH_KOR'
      'SM_KOD=SM_KOD'
      'RAZ_KOD=RAZ_KOD'
      'ST_KOD=ST_KOD'
      'KEKV_KOD=KEKV_KOD'
      'VH_SUM_DB=VH_SUM_DB'
      'VH_SUM_KR=VH_SUM_KR'
      'VIH_SUM_DB=VIH_SUM_DB'
      'VIH_SUM_KR=VIH_SUM_KR'
      'S_R_S_K=S_R_S_K'
      'VH=VH')
    DataSet = DataSetOstatkiMenVh
    Left = 408
    Top = 145
  end
  object frxDBDatasetOstVih: TfrxDBDataset
    UserName = 'frxDBDatasetOstVih'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KOD_SCH=KOD_SCH'
      'DATE_DOC=DATE_DOC'
      'NAME=NAME'
      'NUM_SCH_KOR=NUM_SCH_KOR'
      'SM_KOD=SM_KOD'
      'RAZ_KOD=RAZ_KOD'
      'ST_KOD=ST_KOD'
      'KEKV_KOD=KEKV_KOD'
      'VH_SUM_DB=VH_SUM_DB'
      'VH_SUM_KR=VH_SUM_KR'
      'VIH_SUM_DB=VIH_SUM_DB'
      'VIH_SUM_KR=VIH_SUM_KR'
      'S_R_S_K=S_R_S_K'
      'VH=VH')
    DataSet = DataSetOstatkiMenVih
    Left = 448
    Top = 145
  end
  object TransactionWr: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 112
    Top = 169
  end
end
