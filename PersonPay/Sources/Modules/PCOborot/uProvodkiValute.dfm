object ProvodkiValuteForm: TProvodkiValuteForm
  Left = 309
  Top = 333
  Width = 870
  Height = 457
  Caption = #1055#1088#1086#1074#1086#1076#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 728
      Top = 7
      Width = 111
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = cxButton1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 427
    Height = 387
    Align = alLeft
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 425
      Height = 287
      Align = alLeft
      TabOrder = 0
      object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = dsForGrid
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            FieldName = 'DB_SUMMA'
            Column = cxGridDB_SUMMA
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            FieldName = 'DB_SUMMA_VAL'
            Column = cxGridDB_SUMMA_VAL
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.Background = cxStyle2
        Styles.Content = cxStyle2
        Styles.Header = cxStyle7
        Styles.BandHeader = cxStyle8
        Bands = <
          item
            Caption = #1044#1077#1073#1077#1090' '#1088#1072#1093#1091#1085#1082#1110#1074
            Width = 371
          end>
        object cxGridDB_COR_SCH_NUMBER: TcxGridDBBandedColumn
          Caption = #1050#1086#1088'. '#1088#1072#1093#1091#1085#1086#1082
          Options.Editing = False
          Options.Filtering = False
          Width = 74
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'DB_COR_SCH_NUMBER'
        end
        object DATE_DOC: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082'.'
          Options.Editing = False
          Options.Filtering = False
          Width = 70
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'DB_DATE_DOC'
        end
        object cxGridDB_NUM_DOC: TcxGridDBBandedColumn
          Caption = #8470' '#1076#1086#1082'.'
          Options.Filtering = False
          Width = 71
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'DB_NUM_DOC'
        end
        object cxGridDB_SUMMA: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1072
          Options.Filtering = False
          Width = 63
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'DB_SUMMA'
        end
        object cxGridDB_SUMMA_VAL: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1072' ('#1074#1072#1083'.)'
          Options.Editing = False
          Options.Filtering = False
          Width = 83
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'DB_SUMMA_VAL'
        end
        object cxGridDB_OSN_SCH_NUMBER: TcxGridDBBandedColumn
          Caption = #1056#1072#1093#1091#1085#1086#1082
          Options.Editing = False
          Options.Filtering = False
          SortOrder = soAscending
          Width = 62
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'DB_OSN_SCH_NUMBER'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBBandedTableView1
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 288
      Width = 425
      Height = 98
      Align = alBottom
      TabOrder = 1
      object lbl1: TLabel
        Left = 5
        Top = 74
        Width = 54
        Height = 13
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 5
        Top = 17
        Width = 125
        Height = 13
        Caption = #1057#1091#1084#1072' '#1079#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 6
        Top = 46
        Width = 162
        Height = 13
        Caption = #1057#1091#1084#1072' '#1079#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084' ('#1074#1072#1083'.)'
      end
      object lbl7: TLabel
        Left = 282
        Top = 48
        Width = 29
        Height = 13
        Caption = #1050#1091#1088#1089
      end
      object lbl8: TLabel
        Left = 283
        Top = 19
        Width = 45
        Height = 13
        Caption = #1042#1072#1083#1102#1090#1072
      end
      object P1: TcxDBTextEdit
        Left = 62
        Top = 70
        Width = 352
        Height = 21
        DataBinding.DataField = 'DB_NOTE'
        DataBinding.DataSource = dsForGrid
        TabOrder = 0
      end
      object db_s: TcxDBCurrencyEdit
        Left = 188
        Top = 13
        Width = 80
        Height = 21
        DataBinding.DataField = 'SUMMA_DB_DOC'
        DataBinding.DataSource = dsForGrid
        Properties.DisplayFormat = ',0.00;-,0.00'
        TabOrder = 1
      end
      object cxDBCurrencyEdit1: TcxDBCurrencyEdit
        Left = 188
        Top = 43
        Width = 80
        Height = 21
        DataBinding.DataField = 'SUMMA_DB_DOC_VAL'
        DataBinding.DataSource = dsForGrid
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.NullString = ' '
        TabOrder = 2
      end
      object cxDBCurrencyEdit3: TcxDBCurrencyEdit
        Left = 319
        Top = 43
        Width = 80
        Height = 21
        DataBinding.DataField = 'KURS'
        DataBinding.DataSource = dsForGrid
        Properties.DecimalPlaces = 8
        Properties.DisplayFormat = ',0.00000000;-,0.00000000'
        Properties.NullString = ' '
        TabOrder = 3
      end
      object cxDBLabel1: TcxDBLabel
        Left = 335
        Top = 16
        Width = 77
        Height = 17
        DataBinding.DataField = 'CODE_VALUTE'
        DataBinding.DataSource = dsForGrid
        TabOrder = 4
      end
    end
  end
  object pnl3: TPanel
    Left = 435
    Top = 41
    Width = 427
    Height = 387
    Align = alClient
    TabOrder = 2
    object cxGrid2: TcxGrid
      Left = 1
      Top = 1
      Width = 425
      Height = 285
      Align = alClient
      TabOrder = 0
      object cxGrid2DBTableView1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsView.GroupByBox = False
      end
      object cxGrid2DBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = dsGrid_2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            FieldName = 'KR_SUMMA'
            Column = cxGridKR_SUMMA
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            FieldName = 'KR_SUMMA_VAL'
            Column = cxGridKR_SUMMA_VAL
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.Background = cxStyle2
        Styles.Content = cxStyle7
        Styles.Header = cxStyle7
        Styles.BandHeader = cxStyle8
        Bands = <
          item
            Caption = #1050#1088#1077#1076#1080#1090' '#1088#1072#1093#1091#1085#1082#1110#1074
          end>
        object cxGridKR_COR_SCH_NUMBER: TcxGridDBBandedColumn
          Caption = #1050#1086#1088'. '#1088#1072#1093#1091#1085#1086#1082
          Options.Filtering = False
          Width = 89
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'KR_COR_SCH_NUMBER'
        end
        object KR_DATE_DOC: TcxGridDBBandedColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082'.'
          Options.Editing = False
          Options.Filtering = False
          Width = 83
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'KR_DATE_DOC'
        end
        object cxGridKR_NUM_DOC: TcxGridDBBandedColumn
          Caption = #8470' '#1076#1086#1082'.'
          Options.Filtering = False
          SortOrder = soAscending
          Width = 85
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'KR_NUM_DOC'
        end
        object cxGridKR_SUMMA: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1072
          Options.Filtering = False
          Width = 103
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'KR_SUMMA'
        end
        object cxGridKR_OSN_SCH_NUMBER: TcxGridDBBandedColumn
          Caption = #1056#1072#1093#1091#1085#1086#1082
          Options.Filtering = False
          Width = 78
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'KR_OSN_SCH_NUMBER'
        end
        object cxGridKR_SUMMA_VAL: TcxGridDBBandedColumn
          Caption = #1057#1091#1084#1072'('#1074#1072#1083'.)'
          Options.Editing = False
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'KR_SUMMA_VAL'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBBandedTableView1
      end
    end
    object pnl5: TPanel
      Left = 1
      Top = 286
      Width = 425
      Height = 100
      Align = alBottom
      TabOrder = 1
      object lbl2: TLabel
        Left = 7
        Top = 77
        Width = 54
        Height = 13
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 8
        Top = 17
        Width = 125
        Height = 13
        Caption = #1057#1091#1084#1072' '#1079#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 9
        Top = 48
        Width = 162
        Height = 13
        Caption = #1057#1091#1084#1072' '#1079#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1084' ('#1074#1072#1083'.)'
      end
      object lbl9: TLabel
        Left = 283
        Top = 19
        Width = 45
        Height = 13
        Caption = #1042#1072#1083#1102#1090#1072
      end
      object lbl10: TLabel
        Left = 282
        Top = 48
        Width = 29
        Height = 13
        Caption = #1050#1091#1088#1089
      end
      object P2: TcxDBTextEdit
        Left = 65
        Top = 73
        Width = 352
        Height = 21
        DataBinding.DataField = 'KR_NOTE'
        DataBinding.DataSource = dsGrid_2
        TabOrder = 0
      end
      object kr_s: TcxDBCurrencyEdit
        Left = 193
        Top = 13
        Width = 80
        Height = 21
        DataBinding.DataField = 'SUMMA_KR_DOC'
        DataBinding.DataSource = dsGrid_2
        Properties.DisplayFormat = ',0.00;-,0.00'
        TabOrder = 1
      end
      object cxDBCurrencyEdit2: TcxDBCurrencyEdit
        Left = 193
        Top = 43
        Width = 80
        Height = 21
        DataBinding.DataField = 'SUMMA_KR_DOC_VAL'
        DataBinding.DataSource = dsGrid_2
        Properties.DisplayFormat = ',0.00;-,0.00'
        TabOrder = 2
      end
      object cxDBCurrencyEdit4: TcxDBCurrencyEdit
        Left = 319
        Top = 43
        Width = 80
        Height = 21
        DataBinding.DataField = 'KURS'
        DataBinding.DataSource = dsGrid_2
        Properties.DecimalPlaces = 8
        Properties.DisplayFormat = ',0.00000000;-,0.00000000'
        TabOrder = 3
      end
      object cxDBLabel2: TcxDBLabel
        Left = 335
        Top = 16
        Width = 77
        Height = 17
        DataBinding.DataField = 'CODE_VALUTE'
        DataBinding.DataSource = dsGrid_2
        TabOrder = 4
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 427
    Top = 41
    Width = 8
    Height = 387
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 100
    ResizeUpdate = True
    Control = pnl2
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 418
    Top = 103
  end
  object DataSetKr: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    SelectSQL.Strings = (
      'Select     '
      '    KR_COR_ID_SCH,'
      '    KR_COR_SCH_NUMBER,'
      '    KR_COR_SCH_TITLE,'
      '    KR_PK_ID,'
      '    KR_NUM_DOC,'
      '    KR_OSN_ID_SCH,'
      '    KR_OSN_SCH_NUMBER,'
      '    KR_OSN_SCH_TITLE,'
      '    KR_SUMMA, '
      '    KR_DATE_DOC,'
      '    KR_NOTE,'
      '    SUMMA_KR_DOC,'
      '    SUMMA_KR_DOC_VAL,'
      '    KR_SUMMA_VAL,'
      '    ID_VALUTE,'
      '    CODE_VALUTE,'
      '    symbol,'
      '    NAME_VAL,'
      '    kurs'
      '  '
      'from PC_TMP_OBOROT_PROV_VAL_SELECT(1, :ID_PC_TMP, :ID_SESSION) ')
    Left = 486
    Top = 95
    poSQLINT64ToBCD = True
    object DataSetKrKR_COR_ID_SCH: TFIBBCDField
      FieldName = 'KR_COR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetKrKR_COR_SCH_NUMBER: TFIBStringField
      FieldName = 'KR_COR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetKrKR_COR_SCH_TITLE: TFIBStringField
      FieldName = 'KR_COR_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetKrKR_PK_ID: TFIBBCDField
      FieldName = 'KR_PK_ID'
      Size = 0
      RoundByScale = True
    end
    object DataSetKrKR_NUM_DOC: TFIBStringField
      FieldName = 'KR_NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetKrKR_OSN_ID_SCH: TFIBBCDField
      FieldName = 'KR_OSN_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetKrKR_OSN_SCH_NUMBER: TFIBStringField
      FieldName = 'KR_OSN_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetKrKR_OSN_SCH_TITLE: TFIBStringField
      FieldName = 'KR_OSN_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetKrKR_SUMMA: TFIBBCDField
      FieldName = 'KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetKrKR_DATE_DOC: TFIBDateField
      FieldName = 'KR_DATE_DOC'
    end
    object DataSetKrKR_NOTE: TFIBStringField
      FieldName = 'KR_NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetKrSUMMA_KR_DOC: TFIBBCDField
      FieldName = 'SUMMA_KR_DOC'
      Size = 2
      RoundByScale = True
    end
    object DataSetKrSUMMA_KR_DOC_VAL: TFIBBCDField
      FieldName = 'SUMMA_KR_DOC_VAL'
      OnGetText = DataSetKrSUMMA_KR_DOC_VALGetText
      Size = 2
      RoundByScale = True
    end
    object DataSetKrKR_SUMMA_VAL: TFIBBCDField
      FieldName = 'KR_SUMMA_VAL'
      OnGetText = DataSetKrKR_SUMMA_VALGetText
      Size = 2
      RoundByScale = True
    end
    object DataSetKrID_VALUTE: TFIBBCDField
      FieldName = 'ID_VALUTE'
      Size = 0
      RoundByScale = True
    end
    object DataSetKrCODE_VALUTE: TFIBStringField
      FieldName = 'CODE_VALUTE'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSetKrSYMBOL: TFIBStringField
      FieldName = 'SYMBOL'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSetKrNAME_VAL: TFIBStringField
      FieldName = 'NAME_VAL'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetKrKURS: TFIBBCDField
      FieldName = 'KURS'
      RoundByScale = True
    end
  end
  object DataSetDeb: TpFIBDataSet
    Database = Database
    Transaction = Transaction
    SelectSQL.Strings = (
      'Select     '
      '    DB_COR_ID_SCH,'
      '    DB_COR_SCH_NUMBER,'
      '    DB_COR_SCH_TITLE,'
      '    DB_PK_ID,'
      '    DB_NUM_DOC,'
      '    DB_OSN_ID_SCH,'
      '    DB_OSN_SCH_NUMBER,'
      '    DB_OSN_SCH_TITLE,'
      '    DB_SUMMA, '
      '    DB_DATE_DOC,  '
      '    DB_NOTE,'
      '    SUMMA_DB_DOC,'
      '    SUMMA_DB_DOC_VAL,'
      '    DB_SUMMA_VAL,'
      '    ID_VALUTE,'
      '    CODE_VALUTE,'
      '    symbol,'
      '    NAME_VAL,'
      '    kurs  '
      'from PC_TMP_OBOROT_PROV_VAL_SELECT(0, :ID_PC_TMP, :ID_SESSION) ')
    Left = 15
    Top = 94
    poSQLINT64ToBCD = True
    object DataSetDebDB_COR_ID_SCH: TFIBBCDField
      FieldName = 'DB_COR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetDebDB_COR_SCH_NUMBER: TFIBStringField
      FieldName = 'DB_COR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetDebDB_COR_SCH_TITLE: TFIBStringField
      FieldName = 'DB_COR_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetDebDB_PK_ID: TFIBBCDField
      FieldName = 'DB_PK_ID'
      Size = 0
      RoundByScale = True
    end
    object DataSetDebDB_NUM_DOC: TFIBStringField
      FieldName = 'DB_NUM_DOC'
      Size = 120
      EmptyStrToNull = True
    end
    object DataSetDebDB_OSN_ID_SCH: TFIBBCDField
      FieldName = 'DB_OSN_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetDebDB_OSN_SCH_NUMBER: TFIBStringField
      FieldName = 'DB_OSN_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetDebDB_OSN_SCH_TITLE: TFIBStringField
      FieldName = 'DB_OSN_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetDebDB_SUMMA: TFIBBCDField
      FieldName = 'DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetDebDB_DATE_DOC: TFIBDateField
      FieldName = 'DB_DATE_DOC'
    end
    object DataSetDebDB_NOTE: TFIBStringField
      FieldName = 'DB_NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetDebSUMMA_DB_DOC: TFIBBCDField
      FieldName = 'SUMMA_DB_DOC'
      Size = 2
      RoundByScale = True
    end
    object DataSetDebSUMMA_DB_DOC_VAL: TFIBBCDField
      FieldName = 'SUMMA_DB_DOC_VAL'
      OnGetText = DataSetDebSUMMA_DB_DOC_VALGetText
      Size = 2
      RoundByScale = True
    end
    object DataSetDebDB_SUMMA_VAL: TFIBBCDField
      FieldName = 'DB_SUMMA_VAL'
      OnGetText = DataSetDebDB_SUMMA_VALGetText
      Size = 2
      RoundByScale = True
    end
    object DataSetDebID_VALUTE: TFIBBCDField
      FieldName = 'ID_VALUTE'
      Size = 0
      RoundByScale = True
    end
    object DataSetDebCODE_VALUTE: TFIBStringField
      FieldName = 'CODE_VALUTE'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSetDebSYMBOL: TFIBStringField
      FieldName = 'SYMBOL'
      Size = 5
      EmptyStrToNull = True
    end
    object DataSetDebNAME_VAL: TFIBStringField
      FieldName = 'NAME_VAL'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetDebKURS: TFIBBCDField
      FieldName = 'KURS'
      RoundByScale = True
    end
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 420
    Top = 156
  end
  object dsForGrid: TDataSource
    DataSet = DataSetDeb
    Left = 21
    Top = 127
  end
  object dsGrid_2: TDataSource
    DataSet = DataSetKr
    Left = 488
    Top = 137
  end
  object StyleRepository: TcxStyleRepository
    Left = 589
    Top = 7
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
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10012056
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
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
      Font.Style = []
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
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
