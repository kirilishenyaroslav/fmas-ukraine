object fmAvgPayment: TfmAvgPayment
  Left = 303
  Top = 249
  BorderStyle = bsDialog
  Caption = #1051#1110#1082#1072#1088#1085#1103#1085#1110
  ClientHeight = 451
  ClientWidth = 763
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
    Width = 318
    Height = 451
    Align = alClient
    TabOrder = 0
    object Grid1: TcxGrid
      Left = 1
      Top = 137
      Width = 316
      Height = 263
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 0
      object Grid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = #1057#1077#1088#1077#1076#1085#1108' - ######.##'
            Column = cmnKOD_SETUP
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'DAYS'
            Column = cmnDAYS
          end
          item
            Format = '0.000;-0.000'
            Kind = skSum
            FieldName = 'HOURS'
            Column = cmnHOURS
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cmnSUMMA
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
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
          Width = 97
          DataBinding.FieldName = 'KOD_SETUP'
        end
        object cmnDAYS: TcxGridDBColumn
          Caption = #1044#1085#1110#1074
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 57
          DataBinding.FieldName = 'DAYS'
        end
        object cmnHOURS: TcxGridDBColumn
          Caption = #1043#1086#1076#1080#1085
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 63
          DataBinding.FieldName = 'HOURS'
        end
        object cmnSUMMA: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Width = 85
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
      Top = 400
      Width = 316
      Height = 50
      Align = alBottom
      TabOrder = 1
      object IsHandsCB: TcxCheckBox
        Left = 8
        Top = 8
        Width = 185
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1057#1077#1088#1077#1076#1085#1108' '#1088#1077#1076#1072#1075#1086#1074#1072#1085#1086
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object IsSmenaCB: TcxCheckBox
        Left = 8
        Top = 24
        Width = 185
        Height = 21
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.ReadOnly = True
        Properties.Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1087#1086' '#1075#1086#1076#1080#1085#1072#1093
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object ButtonAvg: TcxButton
        Left = 168
        Top = 8
        Width = 145
        Height = 33
        Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1089#1077#1088#1077#1076#1085#1108
        TabOrder = 2
        OnClick = ButtonAvgClick
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000FFFF
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
        UseSystemPaint = False
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 316
      Height = 136
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 2
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourcedetail
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'RMOVING'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        object Grid2ClRMoving: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1090#1088'.'#1091#1075#1086#1076#1080
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 62
          DataBinding.FieldName = 'NAME_SOVMEST'
        end
        object Grid2ClPeriodBeg: TcxGridDBColumn
          Caption = #1047
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 71
          DataBinding.FieldName = 'DATE_BEG'
        end
        object Grid2ClPeriodEnd: TcxGridDBColumn
          Caption = #1055#1086
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 68
          DataBinding.FieldName = 'DATE_END'
        end
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Width = 62
          DataBinding.FieldName = 'VPOST'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object DetailPanel: TPanel
    Left = 326
    Top = 0
    Width = 437
    Height = 451
    Align = alRight
    Caption = 'DetailPanel'
    TabOrder = 1
    object DetailGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 435
      Height = 449
      Align = alClient
      TabOrder = 0
      object DetailGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DSource3
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'SUMMA_HOSP'
            Column = cmnSUMMA_HOSP
          end
          item
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cmnSUMMAdetail
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
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
          Width = 216
          DataBinding.FieldName = 'NAME_VIDOPL'
        end
        object cmnSUMMAdetail: TcxGridDBColumn
          Caption = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 95
          DataBinding.FieldName = 'SUMMA'
        end
        object cmnSUMMA_HOSP: TcxGridDBColumn
          Caption = #1044#1083#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 93
          DataBinding.FieldName = 'SUMMA_HOSP'
        end
      end
      object DetailGridLevel1: TcxGridLevel
        GridView = DetailGridDBTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 318
    Top = 0
    Width = 8
    Height = 451
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 54
    AlignSplitter = salRight
    Control = DetailPanel
  end
  object DB: TpFIBDatabase
    DBName = 'F:\DB\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'user_name=SYSDBA'
      'password='
      'sql_role_name=')
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
    DataSource = DataSourcedetail
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
  object PopupMenu1: TPopupMenu
    Left = 32
    Top = 208
    object N1: TMenuItem
      Caption = #1042#1074#1077#1089#1090#1080' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1076#1083#1103' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1084#1110#1089#1103#1094#1103
      OnClick = N1Click
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 48
  end
  object DataSetAlg: TpFIBDataSet
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
    Left = 112
    Top = 96
    poSQLINT64ToBCD = True
  end
  object DSetDetail: TpFIBDataSet
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
    AfterScroll = DSetDetailAfterScroll
    Left = 248
    Top = 32
    poSQLINT64ToBCD = True
  end
  object DataSourcedetail: TDataSource
    DataSet = DSetDetail
    Left = 280
    Top = 32
  end
  object DataSetMan: TpFIBDataSet
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
    Left = 232
    Top = 80
    poSQLINT64ToBCD = True
  end
end
