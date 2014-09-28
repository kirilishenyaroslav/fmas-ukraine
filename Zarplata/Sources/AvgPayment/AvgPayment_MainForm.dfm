object fmAvgPayment: TfmAvgPayment
  Left = 170
  Top = 112
  BorderStyle = bsDialog
  Caption = #1051#1110#1082#1072#1088#1085#1103#1085#1110
  ClientHeight = 453
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 453
    Align = alClient
    TabOrder = 0
    object Grid1: TcxGrid
      Left = 1
      Top = 1
      Width = 318
      Height = 353
      Align = alClient
      TabOrder = 0
      object Grid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'KOD_SETUP'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.Indicator = True
        object cmnKOD_SETUP: TcxGridDBColumn
          Caption = #1055#1077#1088#1110#1086#1076
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = cmnKOD_SETUPGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          DataBinding.FieldName = 'KOD_SETUP'
        end
        object cmnDAYS: TcxGridDBColumn
          Caption = #1044#1085#1110#1074
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          DataBinding.FieldName = 'DAYS'
        end
        object cmnHOURS: TcxGridDBColumn
          Caption = #1043#1086#1076#1080#1085
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          DataBinding.FieldName = 'HOURS'
        end
        object cmnSUMMA: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          DataBinding.FieldName = 'SUMMA'
        end
        object cmnID_MAN: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          DataBinding.FieldName = 'ID_MAN'
        end
      end
      object Grid1Level1: TcxGridLevel
        GridView = Grid1DBTableView1
      end
    end
    object ResultPanel: TPanel
      Left = 1
      Top = 354
      Width = 318
      Height = 98
      Align = alBottom
      TabOrder = 1
      object HospDataGroupBox: TGroupBox
        Left = 8
        Top = 8
        Width = 300
        Height = 73
        TabOrder = 0
        object DaysLabel: TLabel
          Left = 96
          Top = 16
          Width = 60
          Height = 13
          Caption = 'DaysLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object HoursLabel: TLabel
          Left = 96
          Top = 35
          Width = 65
          Height = 13
          Caption = 'HoursLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object AvgPaymentLabel: TLabel
          Left = 96
          Top = 52
          Width = 102
          Height = 13
          Caption = 'AvgPaymentLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DaysCaption: TLabel
          Left = 8
          Top = 16
          Width = 28
          Height = 13
          Caption = #1044#1085#1110#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object HoursCaption: TLabel
          Left = 8
          Top = 35
          Width = 36
          Height = 13
          Caption = #1043#1086#1076#1080#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object AvgPaymentCaption: TLabel
          Left = 8
          Top = 52
          Width = 63
          Height = 13
          Caption = #1044#1086' '#1089#1087#1083#1072#1090#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object IsSmenaLabel: TLabel
          Left = 208
          Top = 52
          Width = 67
          Height = 13
          Caption = 'IsSmenaLabel'
          Visible = False
        end
      end
    end
  end
  object DetailPanel: TPanel
    Left = 328
    Top = 0
    Width = 437
    Height = 453
    Align = alRight
    Caption = 'DetailPanel'
    TabOrder = 1
    object DetailGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 435
      Height = 451
      Align = alClient
      TabOrder = 0
      object DetailGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DSource3
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_VIDOPL;SUMMA'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cmnID_VIDOPL: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 35
          DataBinding.FieldName = 'ID_VIDOPL'
        end
        object cmnKOD_VIDOPL: TcxGridDBColumn
          Caption = #1050#1086#1076
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 29
          DataBinding.FieldName = 'KOD_VIDOPL'
        end
        object cmnNAME_VIDOPL: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072' '#1074#1080#1076#1072' '#1086#1087#1083#1072#1090#1080
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 228
          DataBinding.FieldName = 'NAME_VIDOPL'
        end
        object cmnSUMMAdetail: TcxGridDBColumn
          Caption = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 89
          DataBinding.FieldName = 'SUMMA'
        end
        object cmnSUMMA_HOSP: TcxGridDBColumn
          Caption = #1044#1083#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 87
          DataBinding.FieldName = 'SUMMA_HOSP'
        end
      end
      object DetailGridLevel1: TcxGridLevel
        GridView = DetailGridDBTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 320
    Top = 0
    Width = 8
    Height = 453
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 54
    AlignSplitter = salRight
    InvertDirection = True
    Control = DetailPanel
    OnBeforeOpen = cxSplitter1BeforeOpen
    OnAfterClose = cxSplitter1AfterClose
  end
  object DB: TpFIBDatabase
    DBName = 'F:\DB\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 48
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 64
    Top = 48
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    IS_SMENA,'
      '    AVG_SUM,'
      '    IS_HANDS,'
      '    HOSP_DATE'
      'FROM'
      '    Z_PAYMENT_COUNT_AVG_HOSP'
      '    ('
      '    146112'
      '    ) ')
    Left = 32
    Top = 96
    poSQLINT64ToBCD = True
  end
  object DSet2: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    KOD_SETUP,'
      '    SUMMA,'
      '    DAYS,'
      '    HOURS,'
      '    ID_MAN'
      'FROM'
      '    Z_GET_HOSP_AVG_DATA'
      '    ('
      '    ?ID_HOSP,'
      '    ?HOSP_DATE,'
      '    ?IS_SMENA,'
      '    ?WORK_DATE_BEG'
      '    ) ')
    DataSource = DSource1
    Left = 32
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DSet3: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_VIDOPL,'
      '    KOD_VIDOPL,'
      '    NAME_VIDOPL,'
      '    SUMMA,'
      '    SUMMA_HOSP'
      'FROM'
      '    Z_GET_HOSP_DATA_COUNT'
      '    ('
      '    ?ID_MAN,'
      '    ?KOD_SETUP,'
      '    ?WORK_DATE_BEG,'
      '    ?IS_SMENA,'
      '    ?HOSP_DATE'
      '    ) ')
    DataSource = DSource2
    Left = 32
    Top = 160
    poSQLINT64ToBCD = True
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 64
    Top = 96
  end
  object DSource2: TDataSource
    DataSet = DSet2
    Left = 64
    Top = 128
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 64
    Top = 160
  end
  object DSet4: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_VIDOPL,'
      '    DATE_BEG,'
      '    DATE_END,'
      '    KOD_SETUP,'
      '    DAYS,'
      '    HOURS,'
      '    SUMMA,'
      '    AVG_SUM,'
      '    AVG_SUM_REAL,'
      '    "PERCENT",'
      '    IS_SMENA,'
      '    RMOVING,'
      '    IS_FIVE_DAYS,'
      '    DAYS_FOR_AVG,'
      '    HOURS_FOR_AVG,'
      '    SUMMA_FOR_AVG'
      'FROM'
      '    Z_PAYMENT_COUNT_HOSP'
      '    ('
      '    ?ID_HOSP'
      '    ) ')
    Left = 32
    Top = 192
    poSQLINT64ToBCD = True
  end
  object DSource4: TDataSource
    DataSet = DSet4
    Left = 64
    Top = 192
  end
end
