object fmSpravkaDoc: TfmSpravkaDoc
  Left = 401
  Top = 306
  Width = 879
  Height = 663
  Caption = 'fmSpravkaDoc'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 846
    Height = 169
    ActivePage = TabSheet2
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1089#1087#1088#1072#1074#1082#1077
      object cxLabel1: TcxLabel
        Left = 8
        Top = 4
        Width = 299
        Height = 20
        AutoSize = False
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 1
        Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1077#1083#1100#1085#1072#1103' '#1089#1087#1088#1072#1074#1082#1072' '#1087#1086' '#1076#1077#1073#1077#1090#1091'  '#8470'  '
      end
      object cxLabel2: TcxLabel
        Left = 440
        Top = 5
        Width = 21
        Height = 21
        TabOrder = 2
        Caption = #1079#1072
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 34
        Width = 100
        Height = 21
        TabOrder = 3
        Caption = #1040#1074#1090#1086#1088' '#1089#1087#1088#1072#1074#1082#1080
      end
      object cxLabel4: TcxLabel
        Left = 0
        Top = 64
        Width = 158
        Height = 21
        TabOrder = 4
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1087#1088#1072#1074#1082#1077
      end
      object cxMemoComent: TcxMemo
        Left = 168
        Top = 64
        Width = 609
        Height = 65
        Properties.MaxLength = 500
        TabOrder = 0
      end
      object cxDateEdit3: TcxDateEdit
        Left = 469
        Top = 3
        Width = 89
        Height = 25
        TabStop = False
        Enabled = False
        TabOrder = 5
        Visible = False
        EditValue = 0d
      end
      object cxLabel16: TcxLabel
        Left = 546
        Top = 35
        Width = 67
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 6
        Caption = #1058#1072#1073'. '#1053#1086#1084#1077#1088
      end
      object cxLabel17: TcxLabel
        Left = 626
        Top = 34
        Width = 151
        Height = 20
        AutoSize = False
        TabOrder = 7
        Caption = ''
      end
      object cxLabelDate: TcxLabel
        Left = 471
        Top = 5
        Width = 306
        Height = 20
        AutoSize = False
        TabOrder = 8
        Caption = ''
      end
      object cxTextEdit1: TcxTextEdit
        Left = 312
        Top = 2
        Width = 121
        Height = 25
        TabStop = False
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 9
      end
      object cxButtonEditAuthor: TcxButtonEdit
        Left = 120
        Top = 32
        Width = 425
        Height = 25
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEditAuthorPropertiesButtonClick
        TabOrder = 10
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
      ImageIndex = 1
      DesignSize = (
        838
        137)
      object cxLabel5: TcxLabel
        Left = 14
        Top = 7
        Width = 339
        Height = 24
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Caption = 'Prihod/Rashod kassa order '#8470
      end
      object cxTextEditNum: TcxTextEdit
        Left = 353
        Top = 8
        Width = 89
        Height = 25
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 10
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 1
      end
      object cxLabel6: TcxLabel
        Left = 448
        Top = 10
        Width = 33
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Caption = 'from'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 483
        Top = 8
        Width = 137
        Height = 25
        CalColors.BackColor = 15204351
        CalColors.TitleTextColor = 15204351
        CalColors.MonthBackColor = 15204351
        Date = 38285.000000000000000000
        Time = 38285.000000000000000000
        Color = 15204351
        DateFormat = dfLong
        Enabled = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        TabStop = False
      end
      object cxLabel13: TcxLabel
        Left = 643
        Top = 6
        Width = 25
        Height = 24
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
        Caption = 'from'
      end
      object cxLabel7: TcxLabel
        Left = 632
        Top = 6
        Width = 15
        Height = 24
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
        Caption = '('
      end
      object cxDateEdit2: TcxDateEdit
        Left = 669
        Top = 8
        Width = 89
        Height = 25
        TabStop = False
        Enabled = False
        TabOrder = 6
        EditValue = 0d
      end
      object cxLabel8: TcxLabel
        Left = 759
        Top = 5
        Width = 15
        Height = 24
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 7
        Caption = ')'
      end
      object cxLabel9: TcxLabel
        Left = 0
        Top = 40
        Width = 89
        Height = 25
        AutoSize = False
        TabOrder = 8
      end
      object cxMRUEditFio: TcxMRUEdit
        Left = 88
        Top = 38
        Width = 337
        Height = 25
        Properties.ReadOnly = True
        Style.Color = 15204351
        TabOrder = 9
      end
      object cxLabel10: TcxLabel
        Left = 0
        Top = 64
        Width = 89
        Height = 25
        AutoSize = False
        TabOrder = 10
        Caption = 'Osnovanie'
      end
      object cxMemo1: TcxMemo
        Left = 88
        Top = 63
        Width = 473
        Height = 36
        ParentFont = False
        Properties.MaxLength = 150
        Properties.ReadOnly = True
        Style.Color = 15204351
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 11
      end
      object cxLabel14: TcxLabel
        Left = 561
        Top = 70
        Width = 96
        Height = 24
        AutoSize = False
        TabOrder = 12
      end
      object cxTextEditSumma: TcxTextEdit
        Left = 661
        Top = 70
        Width = 113
        Height = 25
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        Style.Color = 15204351
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        TabOrder = 13
        Text = '0,00'
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 98
        Width = 858
        Height = 37
        Anchors = [akLeft, akTop, akRight]
        Caption = 'GroupBox2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        object cxLabel11: TcxLabel
          Left = 8
          Top = 9
          Width = 33
          Height = 17
          TabStop = False
          AutoSize = False
          TabOrder = 0
        end
        object cxTextEdit3: TcxTextEdit
          Left = 59
          Top = 11
          Width = 121
          Height = 21
          TabStop = False
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
        end
        object cxLabel12: TcxLabel
          Left = 183
          Top = 12
          Width = 57
          Height = 17
          TabStop = False
          TabOrder = 2
        end
        object cxLabel15: TcxLabel
          Left = 363
          Top = 12
          Width = 57
          Height = 17
          TabStop = False
          TabOrder = 3
        end
        object cxTextEdit4: TcxTextEdit
          Left = 238
          Top = 11
          Width = 121
          Height = 21
          TabStop = False
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
        end
        object cxTextEdit5: TcxTextEdit
          Left = 416
          Top = 11
          Width = 353
          Height = 21
          TabStop = False
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 5
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 211
    Width = 846
    Height = 377
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 81
      Width = 844
      Height = 184
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        OnKeyUp = cxGrid1DBTableView1KeyUp
        DataController.DataSource = DataSourceSaveAll
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'RxMemDat_summa'
            Column = cxGrid1DBTableView1DBColumn5
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGrid1DBTableView1CellClick
        OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = fmMainSpravka.cxStyleYellow
        Styles.Content = fmMainSpravka.cxStyleYellow
        Styles.ContentEven = fmMainSpravka.cxStyleYellow
        Styles.ContentOdd = fmMainSpravka.cxStyleYellow
        Styles.Inactive = fmMainSpravka.cxStyle4
        Styles.IncSearch = fmMainSpravka.cxStyle17
        Styles.Selection = fmMainSpravka.cxStyleMalin
        Styles.FilterBox = fmMainSpravka.cxStyleYellow
        Styles.Footer = fmMainSpravka.cxStyleBorder
        Styles.Group = fmMainSpravka.cxStyleBorder
        Styles.GroupByBox = fmMainSpravka.cxStyleBorder
        Styles.Header = fmMainSpravka.cxStyle11
        Styles.Indicator = fmMainSpravka.cxStyleYellow
        Styles.NewItemRowInfoText = fmMainSpravka.cxStyleYellow
        Styles.Preview = fmMainSpravka.cxStyleYellow
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          Width = 65
          DataBinding.FieldName = 'RxMemDatNameSch'
        end
        object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
          Width = 122
          DataBinding.FieldName = 'RxMemDatname_korespond'
        end
        object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
          Width = 158
          DataBinding.FieldName = 'RxMemoryDataSaveAllSmRazStKekv'
        end
        object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
          SortOrder = soAscending
          Width = 277
          DataBinding.FieldName = 'RxMemDatNameSmeta'
        end
        object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
          Width = 93
          DataBinding.FieldName = 'RxMemDat_summa'
        end
        object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'Storno'
        end
        object cxGrid1DBTableView1DBColumn7: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 74
          DataBinding.FieldName = 'Storno_monitor'
        end
        object cxGrid1DBTableView1DBColumn8: TcxGridDBColumn
          DataBinding.FieldName = 'RxMemoryDataSaveAllFieldNumDog'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxGrid2: TcxGrid
      Left = 1
      Top = 1
      Width = 844
      Height = 72
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      object cxGrid2DBTableView1: TcxGridDBTableView
        OnKeyUp = cxGrid2DBTableView1KeyUp
        DataController.DataSource = DataSourceShow
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'RxMemDat_summa'
            Column = cxGrid2DBTableView1DBColumn5
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGrid2DBTableView1CellClick
        OnCustomDrawCell = cxGrid2DBTableView1CustomDrawCell
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = fmMainSpravka.cxStyleYellow
        Styles.Content = fmMainSpravka.cxStyleYellow
        Styles.ContentEven = fmMainSpravka.cxStyleYellow
        Styles.ContentOdd = fmMainSpravka.cxStyleYellow
        Styles.Inactive = fmMainSpravka.cxStyle4
        Styles.IncSearch = fmMainSpravka.cxStyle17
        Styles.Selection = fmMainSpravka.cxStyleMalin
        Styles.FilterBox = fmMainSpravka.cxStyleYellow
        Styles.Footer = fmMainSpravka.cxStyleBorder
        Styles.Group = fmMainSpravka.cxStyleYellow
        Styles.GroupByBox = fmMainSpravka.cxStyleYellow
        Styles.Header = fmMainSpravka.cxStyle11
        Styles.Indicator = fmMainSpravka.cxStyleYellow
        Styles.NewItemRowInfoText = fmMainSpravka.cxStyleYellow
        Styles.Preview = fmMainSpravka.cxStyleYellow
        object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
          Width = 64
          DataBinding.FieldName = 'RxMemDatNameSch'
        end
        object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
          SortOrder = soAscending
          Width = 123
          DataBinding.FieldName = 'RxMemDatname_korespond'
        end
        object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
          Width = 159
          DataBinding.FieldName = 'RxMemoryDataSaveAllSmRazStKekv'
        end
        object cxGrid2DBTableView1DBColumn4: TcxGridDBColumn
          Width = 276
          DataBinding.FieldName = 'RxMemDatNameSmeta'
        end
        object cxGrid2DBTableView1DBColumn5: TcxGridDBColumn
          Width = 93
          DataBinding.FieldName = 'RxMemDat_summa'
        end
        object cxGrid2DBTableView1DBColumn6: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'Storno'
        end
        object cxGrid2DBTableView1DBColumn7: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 74
          DataBinding.FieldName = 'Storno_monitor'
        end
        object cxGrid2DBTableView1DBColumn8: TcxGridDBColumn
          DataBinding.FieldName = 'RxMemoryDataSaveAllFieldNumDog'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 73
      Width = 844
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      HotZone.SizePercent = 50
      AlignSplitter = salTop
      Control = cxGrid2
    end
    object PageControl2: TPageControl
      Left = 1
      Top = 273
      Width = 844
      Height = 103
      ActivePage = TabSheet5
      Align = alBottom
      TabOrder = 3
      TabStop = False
      object TabSheet3: TTabSheet
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1087#1088#1086#1074#1086#1076#1082#1072#1084
        object cxTextEdit2: TcxTextEdit
          Left = 136
          Top = 2
          Width = 644
          Height = 21
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 0
        end
        object cxLabel18: TcxLabel
          Left = -5
          Top = 3
          Width = 137
          Height = 17
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 1
          Caption = #1048#1085#1092#1086#1088#1084'. '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
        end
        object cxTextEdit6: TcxTextEdit
          Left = 136
          Top = 26
          Width = 644
          Height = 21
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 2
        end
        object cxTextEdit7: TcxTextEdit
          Left = 48
          Top = 50
          Width = 321
          Height = 21
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 3
        end
        object cxTextEdit8: TcxTextEdit
          Left = 436
          Top = 50
          Width = 344
          Height = 21
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 4
        end
        object cxLabel19: TcxLabel
          Left = 75
          Top = 28
          Width = 57
          Height = 17
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 5
          Caption = #1056#1072#1079#1076#1077#1083
        end
        object cxLabel20: TcxLabel
          Left = 0
          Top = 52
          Width = 46
          Height = 17
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 6
          Caption = #1057#1090#1072#1090#1100#1103
        end
        object cxLabel21: TcxLabel
          Left = 376
          Top = 52
          Width = 57
          Height = 17
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 7
          Caption = #1050#1069#1050#1047
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1054#1096#1080#1073#1082#1080' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
        ImageIndex = 1
        object cxMemo2: TcxMemo
          Left = 0
          Top = 0
          Width = 836
          Height = 71
          Align = alClient
          Properties.ReadOnly = True
          Style.Color = 16776176
          TabOrder = 0
        end
      end
      object TabSheet5: TTabSheet
        Caption = #1054#1096#1080#1073#1082#1080' '#1087#1086' '#1087#1088#1086#1074#1086#1076#1082#1072#1084
        ImageIndex = 2
        object cxGrid3: TcxGrid
          Left = 0
          Top = 0
          Width = 836
          Height = 71
          Align = alClient
          TabOrder = 0
          object cxGrid3DBTableView1: TcxGridDBTableView
            OnDblClick = cxGrid3DBTableView1DblClick
            DataController.DataSource = DataSourceError
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.IncSearch = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.Background = fmMainSpravka.cxStyleYellow
            Styles.Content = fmMainSpravka.cxStyleYellow
            Styles.ContentEven = fmMainSpravka.cxStyleYellow
            Styles.ContentOdd = fmMainSpravka.cxStyleYellow
            Styles.Inactive = fmMainSpravka.cxStyle4
            Styles.IncSearch = fmMainSpravka.cxStyle17
            Styles.Selection = fmMainSpravka.cxStyleMalin
            Styles.FilterBox = fmMainSpravka.cxStyleYellow
            Styles.Footer = fmMainSpravka.cxStyleBorder
            Styles.Group = fmMainSpravka.cxStyleBorder
            Styles.GroupByBox = fmMainSpravka.cxStyleBorder
            Styles.Header = fmMainSpravka.cxStyleBorder
            Styles.Indicator = fmMainSpravka.cxStyleYellow
            Styles.NewItemRowInfoText = fmMainSpravka.cxStyleYellow
            Styles.Preview = fmMainSpravka.cxStyleYellow
            object cxGrid3DBTableView1DBColumn1: TcxGridDBColumn
              Width = 180
              DataBinding.FieldName = 'RxKod'
            end
            object cxGrid3DBTableView1DBColumn2: TcxGridDBColumn
              Width = 600
              DataBinding.FieldName = 'RxName'
            end
          end
          object cxGrid3Level1: TcxGridLevel
            GridView = cxGrid3DBTableView1
          end
        end
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 265
      Width = 844
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 100
      AlignSplitter = salBottom
      Control = PageControl2
    end
  end
  object Panel2: TPanel
    Left = 216
    Top = 206
    Width = 449
    Height = 33
    BevelOuter = bvNone
    TabOrder = 2
    object cxButton3: TcxButton
      Left = 8
      Top = 5
      Width = 153
      Height = 25
      Caption = #1044#1086#1075#1086#1074#1086#1088
      TabOrder = 0
      OnClick = cxButton3Click
      Glyph.Data = {
        AE010000424DAE01000000000000AE000000280000000F000000100000000100
        08000000000000010000C30E0000C30E00001E0000001E00000000000000FFFF
        FF008C5A5A009C6B6B00BD848400B58C8C00BDADAD00D6C6C600EFDEDE009C6B
        6300A57B7300C68C7B00F7DECE00FFE7D600F7DEC600EFDECE00FFF7EF00F7E7
        D600FFD6A500EFB56B00F7DEBD00F7E7CE00FFF7E700F7EFDE00FFFFF7004C80
        4C0052AE570069CA8000C8D0D400FFFFFF001C1C1C1C05020202020202020202
        1C001C1C1C1C051617171717171715021C001C1C1C1C05170C0E0E0E0E0F0F02
        1C001C1C1C1C05161212121212120F021C000502020205100E0E0E0E14150F09
        1C00051617170510150E0E0E0E110F031C0005170C0E0518121212191919190A
        1C000516121205180D0D11191A1A190A1C0005100E0E0501011919191A1A1919
        19000510150E050101191A1A1A1A1A1A190005181212050101191B1B1B1A1A1A
        190005180D0D0505051919191B1A19191900050101011818080706191B1A191C
        1C00050101011818050505191919191C1C0005010101010105130B1C1C1C1C1C
        1C0005050505050505041C1C1C1C1C1C1C00}
      UseSystemPaint = False
    end
    object cxCheckBox1: TcxCheckBox
      Left = 168
      Top = 4
      Width = 281
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = []
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 587
    Width = 846
    Height = 41
    Align = alBottom
    TabOrder = 7
    DesignSize = (
      846
      41)
    object cxButton1: TcxButton
      Left = 616
      Top = 8
      Width = 113
      Height = 25
      Action = ActionClose
      Anchors = [akLeft, akBottom]
      TabOrder = 0
      Glyph.Data = {
        32040000424D3204000000000000360000002800000014000000110000000100
        180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
        00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
        4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
        A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
        FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
        DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
        FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
        84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
        FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
        FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
        00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
        9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
        FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
        00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
        5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
        73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
        FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
        DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
        31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
      UseSystemPaint = False
    end
    object cxButton2: TcxButton
      Left = 392
      Top = 8
      Width = 203
      Height = 25
      Action = ActionSaveAll
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00B7A29300694731006947310069473100694731006947
        3100694731006947310069473100694731006947310069473100FF00FF00FF00
        FF00FF00FF00FF00FF00B7A29300EDE4DF00B7A29300B7A29300B7A29300B7A2
        9300B7A29300B7A29300B7A29300B7A29300B7A2930069473100FF00FF00FF00
        FF00FF00FF00FF00FF00B7A29300F2EBE800EEE6E200ECE2DC00E9DED700E5D9
        D100E2D4CC00DFD0C700DCCBC100DBC9BF00B7A2930069473100FF00FF00FF00
        FF00FF00FF00FF00FF00B7A29300F5F0EE00F2EBE800EEE6E200ECE2DC00E9DE
        D700E5D9D100E2D4CC00DFD0C700DCCBC100B7A2930069473100FF00FF00FF00
        FF00FF00FF00FF00FF00B7A29300F9F5F400F5F0EE00F2EBE800EEE6E200ECE2
        DC00E9DED700E5D9D100E2D4CC00DFD0C700B7A2930069473100FF00FF00FF00
        FF00FF00FF00FF00FF00B7A29300FCFAFA00F9F5F400F5F0EE00F2EBE800EEE6
        E200ECE2DC00E9DED700E5D9D100E2D4CC00B7A2930069473100FF00FF00FF00
        FF00FF00FF00FF00FF00B7A29300FFFFFF00FCFAFA00F9F5F400983000009830
        00009830000098300000E9DED700E5D9D100B7A2930069473100FF00FF00FF00
        FF00FF00FF00FF00FF00B7A29300FFFFFF00FFFFFF00FCFAFA00F9F5F4009830
        0000E4A5820098300000ECE2DC00E9DED700B7A293006947310077879100181E
        2300181E2300181E2300181E2300181E2300181E2300181E2300FCFAFA00BE71
        3C009830000098300000EEE6E200ECE2DC00B7A2930069473100778791009CD6
        EB002384BC002384BC002384BC0098300000BE713C00181E2300BE713C009830
        0000FBF8F70098300000F4EEEB00B7A29300B7A293006947310077879100B7E8
        F5009CD6EB0080C3E00065B1D6004B9FCC00983000009830000098300000FFFF
        FF00FEFDFD00FBF8F700B7A2930069473100694731006947310077879100C4F1
        FA00B7E8F5009CD6EB0080C3E00073BADB002384BC00181E2300FFFFFF00FFFF
        FF00FFFFFF00FEFDFD00B7A29300F3EBE600DBC9BF006947310077879100C4F1
        FA00C4F1FA00B7E8F500A9DFF0008ECCE5002384BC00181E2300FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00B7A29300DBC9BF0069473100FF00FF0077879100C4F1
        FA00C4F1FA00C4F1FA00C4F1FA00A9DFF0002384BC00181E2300FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00B7A2930069473100FF00FF00FF00FF0077879100C4F1
        FA00C4F1FA00C4F1FA00C4F1FA00C4F1FA00A9DFF000181E2300B7A29300B7A2
        9300B7A29300B7A29300B7A29300FF00FF00FF00FF00FF00FF00778791007787
        9100778791007787910077879100778791007787910077879100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      UseSystemPaint = False
    end
    object cxLabel22: TcxLabel
      Left = 8
      Top = 10
      Width = 121
      Height = 21
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -15
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1057#1091#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    end
    object cxTextEditSumCom: TcxTextEdit
      Left = 136
      Top = 8
      Width = 121
      Height = 25
      TabStop = False
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -15
      Style.Font.Name = 'Times New Roman'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      OnKeyPress = cxTextEditSumComKeyPress
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
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 324
        FloatTop = 383
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton3
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem1
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
    Images = fmMainSpravka.ImageList
    LargeImages = fmMainSpravka.ImageList
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    Left = 280
    Top = 233
    DockControlHeights = (
      0
      0
      42
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActionAdd
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionChange
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActionDelete
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      AutoGrayScale = False
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = Panel2
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarEdit1: TdxBarEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
    end
    object dxBarButton1: TdxBarButton
      Action = ActionDelete
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
    end
    object dxBarDellAll: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1089#1110
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1089#1110
      Visible = ivAlways
      OnClick = dxBarDellAllClick
    end
  end
  object ActionList1: TActionList
    Images = fmMainSpravka.ImageList
    Left = 32
    Top = 273
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ImageIndex = 1
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActionChange: TAction
      Caption = 'ActionChange'
      ImageIndex = 4
      ShortCut = 113
      OnExecute = ActionChangeExecute
    end
    object ActionDelete: TAction
      Caption = 'ActionDelete'
      ImageIndex = 3
      OnExecute = ActionDeleteExecute
    end
    object ActionClose: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionShowAllInfo: TAction
      Caption = 'ActionShowAllInfo'
      ShortCut = 57431
      OnExecute = ActionShowAllInfoExecute
    end
    object ActionSaveAll: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 121
      OnExecute = ActionSaveAllExecute
    end
    object AShowCountProv: TAction
      Caption = 'AShowCountProv'
      ShortCut = 24651
      OnExecute = AShowCountProvExecute
    end
  end
  object DataSet1: TpFIBDataSet
    Left = 324
    Top = 168
    poSQLINT64ToBCD = True
  end
  object TransactionRead: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 92
    Top = 176
  end
  object Class_Transaction_Wr: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 596
    Top = 128
  end
  object Database: TpFIBDatabase
    DefaultTransaction = TransactionRead
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 52
    Top = 176
  end
  object RxMemoryDataSaveAll: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxMemDatId_doc_prov'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_doc'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDat_summa'
        DataType = ftFloat
      end
      item
        Name = 'RxMemDatid_sm'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_razd'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_st'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_kekv'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_dog'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatkod_dog'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_man'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_sch'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatsumma_value'
        DataType = ftFloat
      end
      item
        Name = 'RxMemDatid_value'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatNameSch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemDatid_all_prov'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatNameStat'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemDatNameRazd'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemDatNameSmeta'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemDatNameKekv'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemDatID_SCH_KORESPOND'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatname_korespond'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemDatFio'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'RxMemoryDataSaveAll_ID_PROV'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataSaveAllSmRazStKekv'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveAllKodSmeta'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllKodRazd'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllKodState'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllKodKekv'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllTitleSch'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveAllTitleKorSch'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveAllFieldNameCust'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'RxMemoryDataSaveAllFieldDateDog'
        DataType = ftDate
      end
      item
        Name = 'RxMemoryDataSaveAllFieldTypeDog'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveAllFieldRegNum'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveAllFieldNumDog'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveAllFieldTin'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RxMemoryDataSaveAllFieldBirthDay'
        DataType = ftDate
      end
      item
        Name = 'fio_stud'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Storno'
        DataType = ftInteger
      end
      item
        Name = 'Change'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllFieldId_Payer'
        DataType = ftVariant
      end
      item
        Name = 'Storno_monitor'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllFieldProvNote'
        DataType = ftString
        Size = 1000
      end>
    Left = 170
    Top = 328
  end
  object RxMemoryDataShow: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxMemDatId_doc_prov'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_doc'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDat_summa'
        DataType = ftFloat
      end
      item
        Name = 'RxMemDatid_sm'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_razd'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_st'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_kekv'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_dog'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatkod_dog'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_man'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatid_sch'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatsumma_value'
        DataType = ftFloat
      end
      item
        Name = 'RxMemDatid_value'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatNameSch'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemDatid_all_prov'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatNameStat'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemDatNameRazd'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemDatNameSmeta'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemDatNameKekv'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemDatID_SCH_KORESPOND'
        DataType = ftVariant
      end
      item
        Name = 'RxMemDatname_korespond'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemDatFio'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'RxMemoryDataSaveAll_ID_PROV'
        DataType = ftVariant
      end
      item
        Name = 'RxMemoryDataSaveAllSmRazStKekv'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveAllKodSmeta'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllKodRazd'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllKodState'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllKodKekv'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllTitleSch'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveAllTitleKorSch'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'RxMemoryDataSaveAllFieldNameCust'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'RxMemoryDataSaveAllFieldDateDog'
        DataType = ftDate
      end
      item
        Name = 'RxMemoryDataSaveAllFieldTypeDog'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveAllFieldRegNum'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveAllFieldNumDog'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RxMemoryDataSaveAllFieldTin'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RxMemoryDataSaveAllFieldBirthDay'
        DataType = ftDate
      end
      item
        Name = 'fio_stud'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Storno'
        DataType = ftInteger
      end
      item
        Name = 'Change'
        DataType = ftInteger
      end
      item
        Name = 'RxMemoryDataSaveAllFieldId_Payer'
        DataType = ftVariant
      end
      item
        Name = 'priznak_niza'
        DataType = ftInteger
      end
      item
        Name = 'Storno_monitor'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxMemoryDataSaveAllFieldProvNote'
        DataType = ftString
        Size = 1000
      end>
    Left = 186
    Top = 232
  end
  object DataSourceShow: TDataSource
    DataSet = RxMemoryDataShow
    Left = 224
    Top = 233
  end
  object DataSourceSaveAll: TDataSource
    DataSet = RxMemoryDataSaveAll
    Left = 288
    Top = 329
  end
  object Class_DataSet: TpFIBDataSet
    Left = 668
    Top = 131
    poSQLINT64ToBCD = True
  end
  object Class_StoredProc: TpFIBStoredProc
    Left = 476
    Top = 131
  end
  object ErrorProvsDataSet: TpFIBDataSet
    Left = 320
    Top = 369
    poSQLINT64ToBCD = True
  end
  object DataSourceError: TDataSource
    DataSet = RxError
    Left = 440
    Top = 369
  end
  object RxError: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RxKod'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RxName'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'id_prov'
        DataType = ftVariant
      end>
    Left = 386
    Top = 367
  end
  object pFibErrorHandler1: TpFibErrorHandler
    Left = 108
    Top = 123
  end
  object DataSet2: TpFIBDataSet
    Left = 396
    Top = 147
    poSQLINT64ToBCD = True
  end
  object DS: TpFIBDataSet
    Left = 696
    Top = 177
    poSQLINT64ToBCD = True
  end
  object DSet: TpFIBDataSet
    Left = 541
    Top = 397
    poSQLINT64ToBCD = True
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 104
    Top = 240
  end
  object DataSetExpertSys: TpFIBDataSet
    Transaction = Class_Transaction_Wr
    Left = 244
    Top = 289
    poSQLINT64ToBCD = True
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = dxBarButton1
        Visible = True
      end
      item
        Item = dxBarDellAll
        Visible = True
      end>
    UseOwnFont = False
    Left = 488
    Top = 214
  end
end
