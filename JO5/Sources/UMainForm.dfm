object frmGetSaldo: TfrmGetSaldo
  Left = 311
  Top = 162
  Width = 710
  Height = 491
  Caption = #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1089#1072#1083#1100#1076#1086' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1072#1084'/'#1088#1086#1079#1076#1110#1083#1072#1084'/'#1089#1090#1072#1090#1090#1103#1084'/'#1082#1086#1076#1072#1084' '#1074#1080#1090#1088#1072#1090
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
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 702
    Height = 423
    Align = alClient
    TabOrder = 0
    object SmGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 700
      Height = 421
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object SmView: TcxGridDBBandedTableView
        DataController.DataSource = SmDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'IN_DB_SALDO'
            Column = IN_DB_SALDO
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'IN_KR_SALDO'
            Column = IN_KR_SALDO
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'DB_OBOR'
            Column = DB_OBOR
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'KR_OBOR'
            Column = KR_OBOR
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'OUT_DB_SALDO'
            Column = OUT_DB_SALDO
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'OUT_KR_SALDO'
            Column = OUT_KR_SALDO
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'IN_DB_SALDO'
            Column = IN_DB_SALDO
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'IN_KR_SALDO'
            Column = IN_KR_SALDO
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'DB_OBOR'
            Column = DB_OBOR
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'KR_OBOR'
            Column = KR_OBOR
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'OUT_DB_SALDO'
            Column = OUT_DB_SALDO
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'OUT_KR_SALDO'
            Column = OUT_KR_SALDO
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridBandedTableViewStyleSheetDevExpress
        Bands = <
          item
            Caption = #1040#1085#1072#1083#1110#1079
            Width = 337
          end
          item
            Caption = #1042#1093'.'#1089#1072#1083#1100#1076#1086
            Width = 120
          end
          item
            Caption = #1054#1073#1086#1088#1086#1090#1080
            Width = 123
          end
          item
            Caption = #1042#1080#1093'.'#1089#1072#1083#1100#1076#1086
            Width = 118
          end>
        object SmGrColumn: TcxGridDBBandedColumn
          Caption = #1043#1088'.'#1073#1102#1076#1078#1077#1090#1110#1074
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 90
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'GROUP_KOD'
        end
        object SmColumn: TcxGridDBBandedColumn
          Caption = #1041#1102#1076#1078#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 71
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SMETA_KOD'
        end
        object RzColumn: TcxGridDBBandedColumn
          Caption = #1056#1086#1079#1076#1110#1083
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 59
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'RAZD_KOD'
        end
        object StColumn: TcxGridDBBandedColumn
          Caption = #1057#1090#1072#1090#1090#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 60
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'ST_KOD'
        end
        object KvColumn: TcxGridDBBandedColumn
          Caption = #1050#1045#1050#1042
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 57
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'KEKV_KOD'
        end
        object IN_DB_SALDO: TcxGridDBBandedColumn
          Caption = #1044#1077#1073#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 60
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'IN_DB_SALDO'
        end
        object IN_KR_SALDO: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076#1080#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 60
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'IN_KR_SALDO'
        end
        object DB_OBOR: TcxGridDBBandedColumn
          Caption = #1044#1077#1073#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 62
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'DB_OBOR'
        end
        object KR_OBOR: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076#1080#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 61
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'KR_OBOR'
        end
        object OUT_DB_SALDO: TcxGridDBBandedColumn
          Caption = #1044#1077#1073#1077#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 59
          Position.BandIndex = 3
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'OUT_DB_SALDO'
        end
        object OUT_KR_SALDO: TcxGridDBBandedColumn
          Caption = #1050#1088#1077#1076#1080#1090
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 59
          Position.BandIndex = 3
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'OUT_KR_SALDO'
        end
      end
      object SmLevel: TcxGridLevel
        GridView = SmView
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 702
    Height = 41
    AutoSize = True
    ButtonHeight = 39
    ButtonWidth = 64
    Caption = 'ToolBar1'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = SmallImages
    ParentFont = False
    ShowCaptions = True
    TabOrder = 1
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Caption = #1054#1085#1086#1074#1080#1090#1080
      ImageIndex = 10
      OnClick = ToolButton3Click
    end
    object ToolButton2: TToolButton
      Left = 64
      Top = 0
      Caption = #1060#1110#1083#1100#1090#1088
      ImageIndex = 7
      Style = tbsCheck
      OnClick = ToolButton2Click
    end
    object ToolButton1: TToolButton
      Left = 128
      Top = 0
      Width = 73
      Caption = 'ToolButton1'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object cxCheckBox1: TcxCheckBox
      Left = 201
      Top = 7
      Width = 176
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1055#1072#1085#1077#1083#1100' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
      TabOrder = 0
    end
    object ToolButton5: TToolButton
      Left = 377
      Top = 0
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ImageIndex = 6
      OnClick = ToolButton5Click
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 17
    Top = 147
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 49
    Top = 144
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 16
    Top = 180
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 48
    Top = 180
    object back: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object column_gray: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object periods: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle2
      Styles.Content = cxStyle3
      Styles.ContentEven = cxStyle4
      Styles.ContentOdd = cxStyle5
      Styles.Inactive = cxStyle11
      Styles.IncSearch = cxStyle12
      Styles.Selection = cxStyle15
      Styles.FilterBox = cxStyle6
      Styles.Footer = cxStyle7
      Styles.Group = cxStyle8
      Styles.GroupByBox = cxStyle9
      Styles.Header = cxStyle10
      Styles.Indicator = cxStyle13
      Styles.Preview = cxStyle14
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle16
      Styles.Content = cxStyle19
      Styles.ContentEven = cxStyle20
      Styles.ContentOdd = cxStyle21
      Styles.Inactive = cxStyle27
      Styles.IncSearch = cxStyle28
      Styles.Selection = cxStyle31
      Styles.FilterBox = cxStyle22
      Styles.Footer = cxStyle23
      Styles.Group = cxStyle24
      Styles.GroupByBox = cxStyle25
      Styles.Header = cxStyle26
      Styles.Indicator = cxStyle29
      Styles.Preview = cxStyle30
      Styles.BandBackground = cxStyle17
      Styles.BandHeader = cxStyle18
      BuiltIn = True
    end
  end
  object ResultsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 16
    Top = 112
    poSQLINT64ToBCD = True
  end
  object SmDataSource: TDataSource
    DataSet = ResultsDataSet
    Left = 48
    Top = 112
  end
  object SmallImages: TImageList
    Left = 80
    Top = 112
    Bitmap = {
      494C010112001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000500000000100180000000000003C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000318431318431318431
      3184313184313184313184313184313184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000B78183A47874A47874A478
      74A47874A47874A47874A47874A47874A47874A47874A47874986B6600000000
      0000000000000000000000000000000000000000000000318431FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000B78183FDEFD9F6E3CBF5DF
      C2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D199986B6600000000
      0000000000000000000000000000000000000000000000318431FFFFFF318431
      318431FFFFFF429C523184313184313184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000B48176FEF3E39933009933
      00993300993300993300993300993300993300EECC97F3D199986B6600000000
      0000000000000000000000000000000000000000000000318431FFFFFF429C52
      318431318431318431318431FFFFFF3184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000B48176FFF7EB993300FEFE
      FEFEFEFEFEFEFE8EA4FDB8C6FDFEFEFE993300EFCD99F3D198986B6600000000
      0000000000000000000000000000000000000000000000318431FFFFFFFFFFFF
      429C52318431318431FFFFFFFFFFFF3184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000BA8E85FFFCF4993300FEFE
      FEFAFBFE7E98FC0335FB597AFCFEFEFE993300F0D0A1F3D29B986B6600000000
      0000000000000000000000000000000000000000000000318431FFFFFF429C52
      318431318431318431318431FFFFFF3184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000BA8E85FFFFFD993300D6DE
      FE4368FC0335FB4066FC0436FBD9E0FE993300F0D4A9F5D5A3986B6600000000
      000044B1E4107FAD107FAD107FAD107FAD107FAD107FAD318431FFFFFF318431
      318431FFFFFF429C523184313184313184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000CB9A82FFFFFF9933005274
      FC1442FBBCC9FDEFF2FE1A47FB4F72FC973304F2D8B2F6D9AC986B6600000000
      000044B1E4FEFEFDFBFBFAF5F5F4EEEEEDE8E8E7D2D2D2318431FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000CB9A82FFFFFF993300E4EA
      FED9E0FEFEFEFEFEFEFE98ACFD0335FB643459F4DBB9F8DDB4986B6600000000
      000044B1E4FEFEFDFEFEFD0021ADF5F5F4EEEEEDEBEBEA318431318431318431
      318431318431318431318431075D0F3184310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000DCA887FFFFFF993300FEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFE5677FC0335FBF7E1C2F0DAB7986B6600000000
      000044B1E4FEFEFD0021AD2152E70021ADF8F8F7F1F1F0107FAD000000098311
      0000000000000000000983110F951C0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000DCA887FFFFFF9933009933
      009933009933009933009933008F33112235C80335FBC6BCA9986B6600000000
      000044B1E41839DE6373E72152E72152E70021ADF8F8F7107FAD0983110F951C
      00000000000009831110A51B0F951C0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000E3B18EFFFFFFFFFFFFFFFF
      FFFFFFFFFFFEFDFDF8F3FDF6ECF1E1D5B481760335FB0335FB0335FB00000000
      000044B1E4FEFEFD1839DE6373E70021ADFEFEFDFEFEFD0983110983110F951C
      09831109831110A51B0F951C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000E3B18EFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA54A0335FB00000000
      000044B1E4FEFEFDFEFEFD1839DEFEFEFDFEFEFD09831117C76210A51B10A51B
      10A51B0F951C0F951C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000EDBD92FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFE4D4D2B48176FAC577CD937700000000000000
      000044B1E4FEFEFDFEFEFDFEFEFDFEFEFD107FAD107FAD09831117C76210A51B
      0F951C0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000EDBD92FCF7F4FCF7F3FBF6
      F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B8600000000000000000000
      000044B1E4FEFEFDFEFEFDFEFEFDFEFEFD107FAD209FDA000000098311098311
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000EDBD92DAA482DAA482DAA4
      82DAA482DAA482DAA482DAA482DAA482B4817600000000000000000000000000
      000044B1E444B1E444B1E444B1E444B1E4107FAD000000000000000000098311
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000096675E9F6F609F6F609F6F609F6F609F6F609F6F609F6F60
      9F6F609F6F609F6F609F6F609F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A7500000000000000000000000000000000
      000000000000000099695FF6E0BFF4DDB8F3DAB4F3D7ADF2D5A7F0D3A3F0D09E
      EECC99EECA93EDC990EDC68C9F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF00FFFF000000008C5A5A8C5A5A000000FFFF00FFFF00
      0000008C5A5A8C5A5A8C5A5A8C5A5A000000A67A75F1E1D6EEDBCDECD6C5EAD1
      BDE7CCB5E5C8ADE3C3A5E0BF9DA67A750000000000000000000335FB00000000
      00000000000000009D6C60F6E3C6F6E1C1F4DDBBF3DCB4008100F2D5AAF0D3A4
      F0CF9FEFCC99EFCB95EEC9909F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF00FFFF00000000F7DECEF7DEC6000000FFFF00FFFF00
      000000F7DEC6EFDECEF7EFDE8C5A5A000000A67A75FCF7F2FAF1E7F9ECDCF7E7
      D2F5E2C8F4DDBEF3D8B4F1D4A9A67A750000000000000335FB0335FB00000000
      0000000000000000A16E60F7E6CEF6E5C7F4E1C1008100008100008100F3D5AB
      F0D3A5EFD19FEFCE9AEFCB969F6F600000000000000000000000000000000000
      0000000000848300000000000000000000000000000000000000000000000000
      0000000000000000FFFFFFFFFF00000000000000000000000000FFFFFFFFFF00
      000000F7DEC6EFDECEF7EFDE8C5A5A000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A750000000000000000000000000330E200
      0000000000000000A67262F8EAD4F7E7CE008100307A2A5F924B00810050883C
      F2D5ABF0D3A5F0D0A0EFCF9C9F6F600000000000000000000000000000000000
      0000848300FFFE00848300000000000000000000000000000000000000000000
      0000000000848484000000000000000000FFD6A5FFD6A5FFD6A5000000000000
      848484FFD6A5FFD6A5F7E7CE8C5A5A0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      35FB000000000000AB7663FAEEDAFAEBD5008100EFE2C2F6E2C2A7B883008100
      008100EDD4A9F0D4A6F0D1A19F6F6000000000000000000000000000000000FF
      FE00FFFE00FFFE00FFFE00848300000000000000000000000000000000000000
      0000000000000000000000B58C8CFFF7E7F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6
      F7DEC6000000F7E7CEF7E7CE000000000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A7500000000000000000000000000000000
      0000000000000000B07864FAF0E2FAEEDCF8EBD5F8E9D0F7E6CAF6E3C5E6D8B4
      008100008100F2D7ADF2D4A79F6F6000000000000000000000000000FFFE00FF
      FE84848484848400FFFE00FFFE00848300000000000000000000000000000000
      0000000000000000000000000000F7EFDEF7DECE000000F7DEC6F7DEC6F7DEC6
      F7DEC6F7DEC6000000EFDECE000000000000A67A75F1E1D6EEDBCDECD6C5EAD1
      BDE7CCB5E5C8ADE3C3A5E0BF9DA67A750000000000000000000335FB00000000
      0000000000000000B57D64FCF3E7FBF0E3FAEFDDFAEDD8F7E9D1F8E6CBF6E3C5
      F6E1C0F4DEBAF4DAB5F3D7AD9F6F6000000000000000000084848400FFFE8484
      8400000000000084848400FFFE00FFFE00848300000000000000000000000000
      0000000000000000000000B58C8C000000FFD6A5000000FFD6A5FFD6A5FFD6A5
      FFD6A5FFD6A5FFD6A5000000000000000000A67A75FCF7F2FAF1E7F9ECDCF7E7
      D2F5E2C8F4DDBEF3D8B4F1D4A9A67A750000000000000335FB0335FB00000000
      0000000000000000BB8065FCF7EDD58127D58127D58127D58127D58127D58127
      D58127D58127D58127F3DAB69F6F600000000000000000000000008484840000
      0000000000000000000084848400FFFE00FFFE00848300000000000000000000
      0000000000000000000000B58C8CFFF7EF000000000000F7DEC6F7DEC6F7DEC6
      F7DEC6F7DEBDF7E7CEEFDECE9C6B6B000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A750000000000000000000000000330E200
      0000000000000000C08366FCF8F3FCF7EFFCF4EAFBF2E5FBEFDEF8EDD9F8EBD4
      F8E7CEF7E3C7F6E1C2F4DEBB9F6F600000000000000000000000000000000000
      0000000000000000000000000084848400FFFE00FFFE00848300000000000000
      0000000000000000000000B58C8CFFF7EFF7E7CEF7DEC6F7DEC6F7DEC6F7DEC6
      F7DEC6F7DEC6F7E7D6EFDECE9C6B6B0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      35FB000000000000C48767FEFBF8FEFAF3FEF7EFFCF4EAFBF2E6FAEFE0F8EDDA
      F8EAD4F7E9CFF7E5C9F6E2C49F6F600000000000000000000000000000000000
      0000000000000000000000000000000084848400FFFE00FFFE00000000000000
      0000000000000000000000B58C8CFFFFF7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5
      FFD6A5FFD6A5FFD6A5EFDECE9C6B6B000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A7500000000000000000000000000000000
      0000000000000000C98967FEFCFBD58127D58127D58127D58127D58127D58127
      D58127D58127D58127F7E5CA9F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000084848400FFFE00000000000000
      0000000000000000000000B58C8CFFFFF7FFE7D6FFE7D6FFE7D6FFE7D6FFE7D6
      FFE7D6B58C8CB58C8CB58C8C9C6B6B000000A67A75F1E1D6EEDBCDECD6C5EAD1
      BDE7CCB5E5C8ADE3C3A5E0BF9DA67A750000000000000000000335FB00000000
      0000000000000000CC8B68FFFFFFFFFEFCFEFCFAFEFBF4FEF8F0FCF6EDFCF4E7
      FAF2E2FAEFDCF8EDD7F8EAD19F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
      FFFFF7B58C8CFFFFFFC68C7B000000000000A67A75FCF7F2FAF1E7F9ECDCF7E7
      D2F5E2C8F4DDBEF3D8B4F1D4A9A67A750000000000000335FB0335FB00000000
      0000000000000000CF8E68FFFFFFFFFFFFFFFFFCFFFCFAFEFBF6FEF8F0FCF7EE
      FBF4E9FBF2E3FBEFDDF8EDD89F6F600000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFB58C8CC68C7B000000000000000000A67A75A67A75A67A75A67A75A67A
      75A67A75A67A75A67A75A67A75A67A750000000000000000000000000330E200
      0000000000000000CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68
      CF8E68CF8E68CF8E68CF8E68CF8E680000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000B58C8CB58C8CB58C8CB58C8CB58C8CB58C8CB58C8C
      B58C8CB58C8C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      35FB000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0053464553464553464553464553464553464500000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      000000EF4200AD2900AD2900732900732900000000000000000000B58E7BB592
      84F7E3D6EFE3DEEFE3DEF7E7DEF7E3D6BDA69C53464553464500000000000000
      0000000000393939393939393939393939393939393939393939393939393939
      39393939393900000000000000000000000000000097736BB3887FB1847CB184
      7CB1847CB1857DB1857DB1857EB0857DAE857EAA837CB08580B48A7C875D5600
      0000FF9C18FFF7E7000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      FF9C18FFF7E7AD2900AD2900732900732900000000000000BDA69CF7E7DEFFF3
      F7E7DBD6DEB29CD6A68CE7C7BDEFEBEFF7F3F7F7E3D6E7CBBD53464500000000
      0000393939808080808080808080808080808080848484848484848484848484
      848484393939393939000000000000000000000000B3938CF1DCCAFCDBC4FCDA
      C6FCDBC7FAD5BAFED6BCFFD4B6FAD3B6F6CFB0F1CDAEF5CEA8FDCFAD9D706A00
      0000FF9C18FFF7E7000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      FF9C18FFF7E7AD2900AD2900732900732900000000BDA69CF7EBE7FFFFFFC68E
      73BD5D29BD5D29DEB29CBD5D29BD5D29D69E84F7F3F7F7E7DED6C7BD53464500
      0000393939393939393939393939393939393939393939393939393939393939
      393939393939393939393939000000000000000000B39690ECE8D6FFF2D4E4E6
      BEE3E1B9FFEAD3F4E1B6E9E3AFFDDDB7FDD8ADFAD5A7F6D6A2FCD8B6A0727200
      0000FF9C18FF9C18000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      000000000000AD2900AD2900732900732900000000BDA69CFFFFFFCE6D42BD5D
      29BD5D29C6A294FFFFFFE78252BD5D29BD5D29D69673FFFBF7F7E3D653464500
      0000393939C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C5C5C5C5C5C5C5C5C5C5C5C5
      C5C5C5848484393939393939000000000000000000BB9F90ECEFE5FFFAECA9D3
      8F009A00029B05009800009D00009300269D23D5CD98FFD7ACFED7BA9E707000
      0000FF9C18FF9C18000000EF4200AD29009C3100C8D0D4C8D0D4C8D0D4C8D0D4
      000000000000AD2900AD2900732900732900BDA69CFFFBFFDE9E7BBD5D29CE65
      31CE6531CE6939D68A63CE6531CE6531BD5D29BD5D29E7CBBDF7EFEFDECBC653
      4645393939C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000FF0000FF000000FF0000FF
      C5C5C5848484848484393939393939000000000000C0A498EFF1EAFFFBF4AAD8
      9900940000980010A0169CCE91AFC7912FA8265FB54FF6DAB1FFDEC69E717000
      0000FF9C18000000000000EF4200AD2900AD2900732900732900FF9C18FF9C18
      000000000000AD2900AD2900732900732900D6C7BDFFF7F7C66131BD5D29CE65
      31BD5D29CE8663F7E7DED66939BD5D29CE6531BD5D29CE7142FFFFFFE7CBBD53
      4645393939C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C5C5C5C5C5C5C5C5C5C5C5C5
      C5C5C5848484848484848484393939000000000000C4A7A0EFF5E9FFFCF7B3DC
      A3019D010DA10B1DA41C51B143F0E5C4F4E2C35FB45BD9D29DFFDDC6A77A7400
      0000FF9C18000000F7FFFFEF4200AD29009C3100732900732900FF9C18F7FFFF
      000000000000AD2900AD2900732900732900D6C7BDF7DFD6BD5D29CE6531CE65
      31BD5D29D68252FFFBFFE7AE94BD5D29BD5D29CE6531BD5D29FFEFEFF7DFD653
      4645000000393939393939393939393939393939393939393939393939393939
      393939C5C5C5848484848484393939000000000000CAACA1F4FAF2F2F7E5DCEB
      CEFBF4E6F5F3DFF9F1DAFEE7CDFEEBD8FFECDBF7E6CDF0DEB6FEDAC1AB7D7500
      0000FF9C18000000F7FFFFEF4200AD29009C3100732900FFC65AFF9C18F7FFFF
      000000000000AD2900AD2900732900732900D6C7BDF7D7CECE6531CE6531CE65
      31CE6531BD5D29DEAA94FFF7F7EF9E73BD5D29CE6531BD5D29F7F3EFEFE3DE53
      4645000000000000B58C8CFFFFFFF7E7CEF7E7CEF7E7CEF7E7CEF7E7CEF7E7CE
      FFFFFF9C6B6BC5C5C5848484393939000000000000D2B5A0F6FAFAE6F7E18AD3
      88EDF3DFFFFCF9C0DEAA4AB03953B44349B13CC5D59FFFE8D0FDE1CCAA7E7600
      0000FFA539FFA539F7FFFFEF4200AD29009C3100732900FFC65AFF9C18F7FFFF
      000000000000AD2900AD29008C39218C3921D6C7BDFFEFE7D66939CE6531CE65
      31BD5D29BD5D29BD5D29E7CFC6FFFFFFD66939CE6531CE6939FFFBFFF7DFD653
      4645000000000000B58C8CFFFFFFFFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5
      FFFFF79C6B6B393939393939000000000000000000D1B4A1F4FAF8FFFFFD8FCF
      9149B951E2EFD8FFF9EA63BB64009300009100AAD08DFFEED9FEDFCAAC7F7700
      0000C8D0D4FFA539FFA539EF4200EF4200AD29007329008C3921FFA539FF9C18
      000000000000AD29008C39218C3921C8D0D4D6C7BDFFFFFFF79A6BD66939CE8E
      6BF7EBE7D68252BD5D29D69673FFFFFFE78E5ABD5D29EF9263FFFFFFD6C7BD53
      4645000000000000B58C8CFFFFFFFFF7EFF7E7CEF7DEC6F7E7CEF7DEC6F7E7CE
      FFFFF79C6B6B000000000000000000000000000000DBBDA3F6FDFAFFFFFFE9F4
      E53AAA3518A5195FC05936AD33009900009500AAD48FFFF6E2FCDCC8AF847D00
      0000C8D0D4C8D0D4FFA539FFF7E7EF4200AD29007329008C3921FFA539FFF7E7
      0000000000008C39218C3921C8D0D4C8D0D4000000D6C7BDFFEBDEEF8652E782
      52F7F7F7FFFFFFDEBAADFFFFFFF7F7F7DE7142D67139FFF3EFF7E7E753464500
      0000000000000000000000B58C8CFFFFF7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5
      FFD6A5FFFFFF9C6B6B000000000000000000000000E1C3A3F6FDFBF8FCF8FFFF
      FFC4EBCC21AA2500950000940012A4140D9F11A5CC8BFFCAC0F8ADA1AC7E7600
      0000C8D0D4C8D0D4FFA539FFA539EF4200EF42008C39218C3921FFA539FFA539
      0000000000008C3921C8D0D4C8D0D4C8D0D4000000D6C7BDFFFFFFFFEFD6FFAA
      73EFAA8CEFE3DEEFEFEFF7E7E7FFA67BF78E5AF7DBCEFFFFFFD6C7BD00000000
      0000000000000000000000B58C8CFFFFF7FFFFF7FFE7D6FFE7D6FFE7D6FFE7D6
      FFE7D6FFFFFF9C6B6B000000000000000000000000E6C9A9F9FFFEF8FCF8F8FC
      F8F8FCF8FBFEFAFFFFFFFFFFFFFEFEF8FFFFFEC9AA97D49752C79A7AC3AEA200
      0000C8D0D4C8D0D4FFA539FFA539EF4200EF42008C39218C3921FFA539FFA539
      0000000000008C3921C8D0D4C8D0D4C8D0D4000000000000D6C7BDFFFFFFFFFF
      FFFFF3C6FFDFADFFD39CFFC794FFD7ADFFFFFFFFFFFFD6C7BD00000000000000
      0000000000000000000000000000B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF9C6B6B000000000000000000E8CBACFBFFFFFAFFFFFAFF
      FFFAFFFFFAFEFDF9FEFDF4FBFBF3FBF8F7FFFCC6AA98D09E73DCC9B600000000
      0000C8D0D4C8D0D4C8D0D4FFA539FF9C18EF42008C3921C8D0D4C8D0D4FFA539
      0000000000008C3921C8D0D4C8D0D4C8D0D4000000000000000000D6C7BDD6C7
      BDFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFDECBC6D6C7BD00000000000000000000
      0000000000000000000000000000000000B58C8CB58C8CB58C8CB58C8CB58C8C
      B58C8CB58C8CB58C8C9C6B6B000000000000000000E7C29DE1C6A5E2C6A6E2C6
      A6E2C6A6E2C4A4E1C3A3DDC1A1DCC0A0DEC3A3C29C84DECCB800000000000000
      0000C8D0D4C8D0D4C8D0D4FFA539F7FFFFEF42008C3921C8D0D4C8D0D4FFA539
      F7FFFF0000008C3921C8D0D4C8D0D4C8D0D40000000000000000000000000000
      00DECBC6D6C7BDD6C7BDD6C7BDD6C7BD00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8D0D4C8D0D4C8D0D4FFCE63FFCE63FFA539FFA539C8D0D4C8D0D4FFCE63
      FFA539FFA5398C3921C8D0D4C8D0D4C8D0D40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000008C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A
      8C5A5A8C5A5A0000000000000000000000000000000000000000000000000000
      000000009C31009C310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8C8C5A
      5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A00
      0000000000F7EFDEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECE
      F7EFDE8C5A5A0000000000000000000000000000000000000000000000000000
      00000000FFEFA5FFEFA55A31185A311800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636BA5636B
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEF7EFDE8C5A5A00
      0000000000F7EFDEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECE
      F7EFDE8C5A5A0000000000000000000000000000000000000000000000000000
      00000000FFEFA5FFEFA5FFE78CFFE78C31313100000000000000000000000000
      0000000000000000000000000000000000000000000000A5636B848484A5636B
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEF7EFDE8C5A5A00
      0000000000FFF7E7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5
      F7E7CE8C5A5A0000000000000000000000000000000000000000000000000000
      00FF6331FFEFA5FFEFA5FFE78CFFE78CFFC65A3131319C31009C310000000000
      0000000000000000000000000000000000000000A5636BCECED6848484A5636B
      000000000000000000000000000000000000000000000000000000B58C8CFFF7
      E7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5F7E7CE8C5A5A00
      0000000000FFF7E7F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7CE
      F7E7CE8C5A5A000000000000000000000000000000000000000000000000FF31
      FFFF6331FFEFA5FFEFA5FFE78CFFE78CFFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000A5636BEFEFEF848484A5636B
      0000000000000000000000000000000000000000000000000000FFB58C8CFFF7
      E7F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7CEF7E7CE8C5A5A00
      0000000000F7EFDEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECE
      EFDECE8C5A5A0000000000000000000000000000000000000000000000000000
      00FF6331FFEFA5FFEFA5000000080808FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000A5636BEFEFEF848484A5636B
      0000000000000000000000000000000000000000000000000000FF000084F7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC60000FFEFDECEEFDECE8C5A5A00
      0000000000FFF7E7454545FFD6A5454545FFD6A51F1F1FFFD6A5FFD6A5FFD6A5
      EFDECE9C6B630000000000000000000000000000000000000808080000000000
      00FF6331FFEFA5FFEFA5FFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000A5736BEFEFEF848484A5636B
      0000000000000000000000000000000000000000000000000000000000FF0000
      84FFD6A5FFD6A5FFD6A5FFD6A5FFD6A50000840000FFFFD6A5EFDECE9C6B6300
      0000000000FFF7EFF7DEC6F7DEC6F7DEC61F1F1F1F1F1FF7DEC6F7DEBDF7E7CE
      EFDECE9C6B6B0000000000000000000000000000000000000000000000000000
      00FF6331F7FFFFFFDE84FFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000BD846BEFEFEF848484A5636B
      0000000000000000000000000000000000000000000000000000006C6CFF0000
      84F7DEC6F7DEC6F7DEC6F7DEC60000840000FFF7DEBDF7E7CEEFDECE9C6B6B00
      0000000000FFF7EFF7E7CEF7DEC61F1F1F1F1F1F1F1F1FF7DEC6F7DEC6F7E7D6
      EFDECE9C6B6B000000000000000000000000000000FFFFCEFFFFBDFFC65AFFA5
      10FF9C00F7FFFFFFEFA5FFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000000000D6946BEFEFEF848484A5636B
      000000000000000000000000000000000000000000000000000000B58C8C0000
      FF000084F7DEC6F7DEC60000840000FFF7DEC6F7DEC6F7E7D6EFDECE9C6B6B00
      0000000000FFFFF7FFD6A51F1F1F84848400FFFF1F1F1FFFD6A5FFD6A5FFD6A5
      EFDECE9C6B6B0000000000000000000000000000000000000000000000000000
      00080808F7FFFFFFFFFFFFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000000000BD7B5AEFEFEFCECED6848484424242
      A5636B000000000000000000000000000000000000000000000000B58C8CFFFF
      F70000FF0000840000840000FFFFD6A5FFD6A5FFD6A5FFD6A5EFDECE9C6B6B00
      0000000000FFFFF7FFE7D61F1F1FC6C6C600FFFF1F1F1FFFE7D6000000000000
      0000009C6B6B0000000000000000000000000000000000000000000000000000
      00FF6331F7FFFFFFFFFFFFDE84FFDE84FFC65AFF9C00FF9C639C310000000000
      0000000000000000000000000000BD7B5AEFEFEFCECED6BDBDBD8C8C8C5A5A5A
      424242A5636B000000000000000000000000000000000000000000B58C8CFFFF
      F70000FF0000FF0000FFFFE7D6FFE7D6FFE7D6B58C8CB58C8CB58C8C9C6B6B00
      0000000000FFFFFF1F1F1F84848400FFFF1F1F1FFFFFF7FFFFF7000000FFFFFF
      C68C7BC8D0D4000000000000000000000000000000000000000000000000FF31
      FFFF6331C65A00FFFFFFFFDE84FFDE84FFC65AFF9C00FF9C009C310000000000
      0000000000000000000000BD7B5AEFEFEFEFEFEFC6C6C6ADADAD8C8C8C737373
      5A5A5A424242A5636B000000000000000000000000000000000000B58C8C0000
      FF0000840000FF000084FFFFFFFFFFF7FFFFF7B58C8CFFFFFFC68C7B00000000
      0000000000454545848484C6C6C600FFFF1F1F1FFFFFFFFFFFFF000000C68C7B
      C8D0D4C8D0D40000000000000000000000000000000000000000000000000000
      00FF6331FFD673C65A00C65A00CE6363FFC65AFF9C00FF9C009C310000000000
      0000000000000000BD7B5AEFEFEFEFEFEFCECED6BDBDBD9C9C9C848484848484
      7373735A5A5A424242A5636B0000000000000000000000000000FF0000FF0000
      84FFFFFFFFFFFF0000FF000084FFFFFFFFFFFFB58C8CC68C7B00000000000000
      00000000001F1F1F1F1F1F00FFFF1F1F1F000000000000000000000000C8D0D4
      C8D0D4C8D0D40000000000000000000000000000000000000000000000000000
      00FF6331FFD673FFD673FFD673C65A00CE6363FF9C00FF9C009C310000000000
      0000000000BD7B5AEFEFEFEFEFEFCECED6C6C6C6C6C6C6848484848484848484
      8484847373735A5A5A424242A5636B0000000000000000FF0000FFB58C8CB58C
      8CB58C8CB58C8CB58C8C0000FF000084B58C8CB58C8C00000000000000000000
      00001F1F1F0000840000841F1F1FC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D40000000000000000000000000000000000000000000000000000
      00FF6331FFDE84FFDE84FFDE84FFDE84C65A00C65A00C65A009C310000000000
      0000D6946BD6946BD6946BD6946BD6946BD6946BD6946BD6946BD6946BD6946B
      D6946BD6946BD6946BD6946BD6946BD6946B0000000000000000000000000000
      000000000000000000000000000000FF0000FF00000000000000000000000000
      0000C8D0D41F1F1F1F1F1F1F1F1FC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D40000000000000000000000000000000000000000000000000000
      00FF6331FF6331FF6331FF6331FF6331FF6331FF6331FF6331FF633100000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8C8C5A
      5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A00
      0000000000000000000000000000B58C8C8C5A5A8C5A5A8C5A5A8C5A5A8C5A5A
      8C5A5A8C5A5A8C5A5A8C5A5A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEF7EFDE8C5A5A00
      0000000000000000000000000000B58C8CFFF7E7F7EFDEF7EFDEF7EFDEF7EFDE
      F7EFDEF7EFDEF7E7CE8C5A5A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEF7EFDE8C5A5A00
      0000000000000000000000000000B58C8CF7EFDEF7DECEF7DEC6F7DEC6F7DEC6
      F7DEC6EFDECEEFDECE8C5A5A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CFFF7
      E7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5F7E7CE8C5A5A00
      0000000000000000000000000000B58C8CFFF7E7FFD6A5FFD6A5FFD6A5FFD6A5
      FFD6A5FFD6A5EFDECE8C5A5A0000000000000000000000000000840000848484
      8400000000000000000000000000000000000000008400008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CFFF7
      E7F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7CEF7E7CE8C5A5A00
      0000B58C8C8C5A5A8C5A5A8C5A5AB58C8CFFF7EFF7DEC6F7DEC6F7DEC6F7DEC6
      F7DEBDF7E7CEEFDECE9C6B630000000000000000000000000000840000840000
      8484848400000000000000000000000000008400008484848400000000000000
      0000000000000000000000000000000000000000008400000000000000000000
      000000000000000000000000000000000000000000000000000000B58C8CF7EF
      DEF7DECEF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEC6EFDECEEFDECE8C5A5A00
      0000B58C8CFFF7E7F7EFDEF7EFDEB58C8CFFF7EFF7E7CEF7DEC6F7DEC6F7DEC6
      F7DEC6F7E7D6EFDECE9C6B6B0000000000000000000000000000000000840000
      8400008484848400000000000000008400008400008400000000000000000000
      000000000000000000000000000000000000840000FF00008400000000000000
      000000000000000000000000000000000000000000000000000000B58C8CFFF7
      E7FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5EFDECE9C6B6300
      0000B58C8CF7EFDEF7DECEF7DEC6B58C8CFFFFF7FFD6A5FFD6A5FFD6A54C804C
      4C804C4C804C4C804CA57B730000000000000000000000000000000000000000
      8400008400008484848400008400008400008400000000000000000000000000
      000000000000000000000000000000FF0000FF0000FF0000FF00008400000000
      000000000000000000000000000000000000000000000000000000B58C8C8585
      8500FFFFF7DEC6F7DEC6F7DEC6F7DEC6F7DEC6F7DEBDF7E7CEEFDECE9C6B6B00
      0000B58C8CFFF7E7FFD6A5FFD6A5B58C8CFFFFF7FFE7D6FFE7D6F7E7D64C804C
      52AE5752AE574C804CA57B730000000000000000000000000000000000000000
      0000008400008400008400008400008400000000000000000000000000000000
      000000000000000000000000FF0000FF0084848484848400FF0000FF00008400
      00000000000000000000000000000000000000000000FFFF000000B58C8C8585
      8500FFFFF7DEC600FFFF00FFFFF7DEC6F7DEC6F7DEC6F7E7D6EFDECE9C6B6B00
      0000B58C8CFFF7EFF7DEC6F7DEC6B58C8CFFFFFFFFFFFF4C804C4C804C4C804C
      52AE5752AE574C804C4C804C4C804C0000000000000000000000000000000000
      000000000000840000FF00008484848400000000000000000000000000000000
      000000000000000084848400FF0084848400000000000084848400FF0000FF00
      00840000000000000000000000000000000000000085858500FFFFB58C8C8585
      8500FFFF00FFFF858585FFD6A5FFD6A5FFD6A5FFD6A5FFD6A5EFDECE9C6B6B00
      0000B58C8CFFF7EFF7E7CEF7DEC6B58C8CFFFFFFFFFFFF4C804C52AE5752AE57
      52AE5752AE5752AE5752AE574C804C0000000000000000000000000000000000
      0000008400008400008400008400008484848400000000000000000000000000
      000000000000000000000084848400000000000000000000000084848400FF00
      00FF0000840000000000000000000000000000000000000085858500FFFF8585
      8500FFFF85858500FFFF00FFFF00FFFFFFE7D6B58C8CB58C8CB58C8C9C6B6B00
      0000B58C8CFFFFF7FFD6A5FFD6A5B58C8CFFFFFFFFFFFF4C804C69CA8069CA80
      69CA8052AE5752AE5752AE574C804C0000000000000000000000000000000000
      8400008400008400000000008400008400008484848400000000000000000000
      0000000000000000000000000000000000000000000000000000000000848484
      00FF0000FF0000840000000000000000000085858585858585858585858500FF
      FF858585858585858585858585FFFFF7FFFFF7B58C8CFFFFFFC68C7B00000000
      0000B58C8CFFFFF7FFE7D6FFE7D6B58C8CB58C8CB58C8C4C804C4C804C4C804C
      69CA8052AE574C804C4C804C4C804C0000000000000000000000000000840000
      8400008400000000000000000000008400008400008484848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      84848400FF0000FF0000000000000000000000000000000000FFFF85858500FF
      FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFB58C8CC68C7B00000000000000
      0000B58C8CFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7EFDEDED6C6C6BDADAD4C804C
      69CA8052AE574C804C0000000000000000000000000000000000840000840000
      8400000000000000000000000000000000008400008400008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084848400FF0000000000000000000000000000FFFF85858500FFFF8585
      8500FFFF85858500FFFFB58C8CB58C8CB58C8CB58C8C00000000000000000000
      0000B58C8CFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7B58C8CB58C8CB58C8C4C804C
      4C804C4C804C4C804C0000000000000000000000000000000000840000840000
      0000000000000000000000000000000000000000008400008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400000000000000000000000085858500FFFF0000008585
      8500FFFF00000085858500FFFF00000000000000000000000000000000000000
      0000B58C8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58C8CEFB56BC68C7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008585
      8500FFFF00000000000000000000000000000000000000000000000000000000
      0000B58C8CB58C8CB58C8CB58C8CB58C8CB58C8CB58C8CBD8484000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFFFE00000000008003FE0000000000
      8003FE00000000008003FE00000000008003FE00000000008003FE0000000000
      800300000000000080030000000000008003000000000000800300B900000000
      8003003100000000800300030000000080030007000000008007001F00000000
      800F013F00000000801F03BF00000000FFFFFFFFFFFFC001FFFFCF3F0021C001
      FFFF80010029C001FDFF80010021C001F8FF80010021C001F07F8001FFFEC001
      E03FC0010021C001C01FE0010029C001C60FE0010021C001EF07E0010021C001
      FF83E001FFFEC001FFC3E0010021C001FFE3E0010029C001FFF7E0030021C001
      FFFFE0070021C001FFFFE00FFFFEFFFFF81FFFFFFFFFE020E007800F80012000
      C003000780012000800100038001203080010003800120300000000180016030
      000000018001403000008001800140300000C001800100300000C00380010030
      0000C00F800100308001E007800100308003E00780010030C007F00380030030
      E00FF80380070010F83FFFFFFFFF0000FFFF800FFCFFFFFFE001800FFC3FFF3F
      E001800FFC1FFE3FE001800FF803FC3FE001800FF003FC3FC001800FF803FC3F
      C001800FD803FC3FE001800FD803FC3FE001800F0003FC3FE001800F8003F81F
      E00180EFD803F00FE001808FD003E007E003808FF803C003C007878FF8038001
      800F000FF8030000FF9F000FF803FFFFE001F003FFFFFFFFE001F003FFFFFFFF
      E001F003FFFFFFFFE001F003C7E7FDFFE0010003C3C7F8FFE0010003E18FF07F
      E0010003F01FE03FE0010003F83FC01FA0010001FC3FC60F80010001F81FEF07
      C0010001F10FFF8300030001E387FFC3C0070007C7C7FFE3800F0007CFE7FFF7
      927F007FFFFFFFFFF3FF00FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
