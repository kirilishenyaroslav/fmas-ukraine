object fmSmetaGroup: TfmSmetaGroup
  Left = 264
  Top = 110
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1043#1088#1091#1087#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
  ClientHeight = 446
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupGrid: TcxGrid
    Left = 0
    Top = 33
    Width = 688
    Height = 200
    Align = alTop
    TabOrder = 0
    object GroupView: TcxGridDBTableView
      OnDblClick = GroupViewDblClick
      OnKeyUp = GroupViewKeyUp
      DataController.DataSource = GroupSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = qizzStyle
      Styles.ContentEven = stContent
      Styles.ContentOdd = stContent
      object GroupViewGROUP_KOD: TcxGridDBColumn
        Width = 141
        DataBinding.FieldName = 'GROUP_KOD'
      end
      object GroupViewGROUP_TITLE: TcxGridDBColumn
        Width = 545
        DataBinding.FieldName = 'GROUP_TITLE'
      end
      object GroupViewID_GROUP: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_GROUP'
      end
    end
    object GroupGridLevel1: TcxGridLevel
      GridView = GroupView
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 233
    Width = 688
    Height = 24
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 686
      Height = 16
      Align = alTop
      Caption = #1041#1102#1076#1078#1077#1090#1080', '#1097#1086' '#1074#1093#1086#1076#1103#1090#1100' '#1076#1086' '#1089#1082#1083#1072#1076#1091' '#1086#1073#1088#1072#1085#1086#1111' '#1075#1088#1091#1087#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 257
    Width = 688
    Height = 189
    Align = alClient
    TabOrder = 2
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = SmetaSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = qizzStyle
      Styles.ContentEven = stContent
      Styles.ContentOdd = stContent
      object cxGridDBTableView1ID_SMETA: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_SMETA'
      end
      object cxGridDBTableView1SMETA_TITLE: TcxGridDBColumn
        Caption = #1041#1102#1076#1078#1077#1090
        DataBinding.FieldName = 'SMETA_TITLE'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 33
    Align = alTop
    TabOrder = 3
    object OkButton: TBitBtn
      Left = 3
      Top = 2
      Width = 542
      Height = 28
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1075#1088#1091#1087#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = OkButtonClick
      Glyph.Data = {
        DE060000424DDE060000000000005E0200002800000030000000180000000100
        08000000000080040000C30E0000C30E00008A0000008A00000000000000FFFF
        FF00FF00FF00B73D3D00C1454500C2484800C6535300C6545400C8595900C95D
        5D00CB636300CC666600CD686800CD696900CE6B6B00CE6C6C00CF6E6E00CF6F
        6F00D0717100D1747400D1757500D37B7B00D47D7D00D5808000D8898900D88A
        8A00D98D8D00DA909000DC969600DD989800DE9C9C00DF9F9F00E0A2A2000066
        000008790F000B7E130012A9200013AB220014AB2300118D1D0013AB230014AC
        250014AB240015AC260017AE270018AE290019AF2B00148D21001CB22F001EB4
        32001FB534001A902A0020AA34001D952E001F99310021AB360022AC380021A3
        350026BA3E0024AD3A0025AE3C0024A5390027AF3E0025A63B0028B0400029B1
        410027A73E002EC04A002FC14C002FB34A0037C8570031B04D0036BC55003ABF
        5B003FCE630040CF640048D56F0047CF6D004FDA790050DB7B0055E0820059E2
        89005BE48A00D1D1D100CFCFCF00CCCCCC00C7C7C700C6C6C600C1C1C100C0C0
        C000BFBFBF00BDBDBD00BABABA00B9B9B900B8B8B800B5B5B500B3B3B300B1B1
        B100B0B0B000AEAEAE00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A700A3A3
        A300A2A2A200A0A0A0009F9F9F009E9E9E009D9D9D009C9C9C009B9B9B009A9A
        9A00999999009898980097979700969696009595950094949400939393009292
        920091919100909090008F8F8F008E8E8E008D8D8D008C8C8C008B8B8B008787
        8700858585008383830082828200818181007A7A7A0076767600727272006565
        6500020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202210202020202020202020202020202020202020202
        0202028902020202020202020202020202020202020202020202213921020202
        0202020202020202020202020202020202028977890202020202020202020202
        020202020202020202213D244021020202020202020202020202020202020202
        0289757C6D890202020202020202020202020202020202022142312D253E2102
        02020202020202020202020202020202897270767A6E89020202020202020202
        020202020202022136433A322E283C2102020202020202020202020202020289
        7D666A6F757A7089020202020202020202020202020221354A46443F2141293B
        210202020202020202020202020289805E616574896C79718902020202020202
        020202020221334E4C4B45210221302B38210202020202020202020202898157
        595D698902897279728902020202020202020202022151504F4821030202212F
        2C37210202020202020202020289545556648986020289847773890202020202
        020202020221475249210A1103020202212D3421020202020202020202896A53
        6389746C860202028976748902020202020202020203214D21100C0A0F030202
        02212E2621020202020202020286895B896D71746E8602020289757A89020202
        0202020203091821150D03120A0F0302020221232A2102020202020286786289
        6870866B746E8602020289877A89020202020203081C1B19140302030E0A0E03
        0202020221272102020202867B5D5F61698602866F746F860202020289858902
        020202031F1E1D160302020203070B0D0302020202212221020202865A5B5C67
        86020202867E727086020202028988890202020313201703020202020202030B
        0D03020202020221210202866A58658602020202020286727086020202020289
        89020202031A030202020202020202030C0A0302020202020221020286608602
        0202020202020286717486020202020202890202020302020202020202020202
        03050A0302020202020202020286020202020202020202028682748602020202
        0202020202020202020202020202020202020306030202020202020202020202
        02020202020202020202867F8602020202020202020202020202020202020202
        0202020304030202020202020202020202020202020202020202028683860202
        0202020202020202020202020202020202020202020303020202020202020202
        0202020202020202020202020286860202020202020202020202020202020202
        0202020202020203020202020202020202020202020202020202020202020286
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202}
      NumGlyphs = 2
    end
    object CancelButton: TBitBtn
      Left = 589
      Top = 2
      Width = 97
      Height = 27
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        3A070000424D3A07000000000000BA0200002800000030000000180000000100
        08000000000080040000C30E0000C30E0000A1000000A100000000000000FFFF
        FF00FF00FF004172FF004475FF004576FF004676FD003365FF003666FF003867
        FF003869FF003865F7003C6DFF003E6DFF003E6FFF00406EFB004471F8001244
        FF001A4BFF001C4CFF001D4DFF001E4EFF001F4FFF002151FF002251FF002252
        FF002352FF002353FF002454FF002656FF002756FF002757FF002758FF002859
        FF00295AFF002A58FC002B5AFF003160FF003361FF00325EF7000030FF000131
        FF000232FF000333FF000939FF000C3CFF000E3DFF000F3EFF001342FF001443
        FF001444FF001544FF001645FF001646FF001745FF001746FF001747FF001847
        FF001848FF001740F1001948FF001949FF001A48FF001B4AFF001B45F5001D4C
        FF001C45F3001F4DFC001E48F300204FFF002047EF002452FF00244DF100274F
        F000284DE7002C56F4002E51E5003356E500002EFF00002FFF00002EFD00002C
        F900002BF800002BF7000028F2000129EF000331FF000431FD000634FF000830
        F0000C30E6000E38F6001238EF00143CF000173EEF00183FF0001840EF001940
        F0001A42F0001A40EF001B42F0001B42EF001F46F1001D40E4002047F1001E41
        E7001E41E5002144E8002A4CE4000027F1000027F0000023E7000023E4000128
        F0000324E5000D2FE5000E30E4000F32E70000009A00C0C0C000BFBFBF00BEBE
        BE00BCBCBC00BBBBBB00B9B9B900B8B8B800B7B7B700B6B6B600B5B5B500B3B3
        B300B2B2B200B1B1B100B0B0B000AFAFAF00AEAEAE00ADADAD00ACACAC00ABAB
        AB00AAAAAA00A9A9A900A8A8A800A7A7A700A6A6A600A5A5A500A4A4A400A3A3
        A300A2A2A200A1A1A100A0A0A0009F9F9F009E9E9E009D9D9D009C9C9C009A9A
        9A009999990097979700969696009292920091919100909090006B6B6B000202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020276760202020202020202020276
        7602020202020202020202A0A002020202020202020202A0A002020202020202
        020276115A760202020202020202765451760202020202020202A08E9BA00202
        020202020202A09B99A002020202020202761234327376020202020202766E28
        285076020202020202A08A8C8D9BA0020202020202A09C979798A00202020202
        02763B1237357476020202027655284E286F76020202020202A0928A8B8C9BA0
        02020202A09C9797979EA00202020202020276611339357576020276532A5629
        70760202020202020202A092898B8C9AA00202A09A9695969FA0020202020202
        0202027663143C3A5C7676524F4E2A727602020202020202020202A092888A8B
        96A0A0999797969DA002020202020202020202027664153F3D5B57294E286D76
        020202020202020202020202A09188898A94969697979CA00202020202020202
        0202020202766516362E2C582B71760202020202020202020202020202A09187
        8B909294959CA0020202020202020202020202020202764038302F2D59760202
        0202020202020202020202020202A08E8B8D8F9199A002020202020202020202
        0202020202027643413E33315D7602020202020202020202020202020202A089
        888A8C8D94A002020202020202020202020202020276231E18451441155E7602
        02020202020202020202020202A08383868788888893A0020202020202020202
        02020202764B25242268661C45165F76020202020202020202020202A0867F81
        828E8E85878792A002020202020202020202027627082607497676461D181760
        7602020202020202020202A0827D7E7E8BA0A08F84868693A002020202020202
        0202760B0C090A4A76020276691F1A1962760202020202020202A0807B7C7C8F
        A00202A09483858691A002020202020202760F030D0E6C760202020276672147
        1B4276020202020202A07B797A7A8FA002020202A0968385858FA00202020202
        02760605044C76020202020202766A22204476020202020202A07877788DA002
        0202020202A09582838EA00202020202020276104D760202020202020202766B
        48760202020202020202A07A8AA00202020202020202A0928CA0020202020202
        020202767602020202020202020202767602020202020202020202A0A0020202
        02020202020202A0A00202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        020202020202020202020202020202020202020202020202020202020202}
      NumGlyphs = 2
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 488
    Top = 120
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stHotTrack: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
    end
    object qizzStyle: TcxGridTableViewStyleSheet
      Styles.Background = stBackground
      Styles.Content = stContent
      Styles.ContentEven = stContentEven
      Styles.ContentOdd = stContentOdd
      Styles.Inactive = stInactive
      Styles.IncSearch = stIncSearch
      Styles.Selection = stSelection
      Styles.FilterBox = stFilterBox
      Styles.Footer = stFooter
      Styles.Group = stGroup
      Styles.GroupByBox = stGroupByBox
      Styles.Header = stHeader
      Styles.Indicator = stIndicator
      Styles.Preview = stPreview
      BuiltIn = True
    end
  end
  object DB: TpFIBDatabase
    DBName = 'd:\Work\Database\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 72
    Top = 96
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 144
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
    Top = 144
  end
  object SmetaGroupSelect: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT Id_Group, Group_Kod, Group_Title FROM PUB_SMETA_GROUP'
      'ORDER BY Group_Kod')
    AfterScroll = SmetaGroupSelectAfterScroll
    Left = 184
    Top = 88
    poSQLINT64ToBCD = True
    object SmetaGroupSelectGROUP_KOD: TFIBIntegerField
      DisplayLabel = #1050#1086#1076' '#1075#1088#1091#1087#1080
      FieldName = 'GROUP_KOD'
    end
    object SmetaGroupSelectGROUP_TITLE: TFIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1075#1088#1091#1087#1080
      FieldName = 'GROUP_TITLE'
      Size = 100
      EmptyStrToNull = True
    end
    object SmetaGroupSelectID_GROUP: TFIBBCDField
      FieldName = 'ID_GROUP'
      Size = 0
      RoundByScale = True
    end
  end
  object GroupSource: TDataSource
    DataSet = SmetaGroupSelect
    Left = 120
    Top = 96
  end
  object SmetDS: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM UP_SELECT_SMETS_BY_GROUP(:Id_Group, :Period_Beg, :' +
        'Period_End)')
    Left = 184
    Top = 176
    poSQLINT64ToBCD = True
    object SmetDSID_SMETA: TFIBBCDField
      FieldName = 'ID_SMETA'
      Size = 0
      RoundByScale = True
    end
    object SmetDSSMETA_TITLE: TFIBStringField
      FieldName = 'SMETA_TITLE'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object SmetaSource: TDataSource
    DataSet = SmetDS
    Left = 272
    Top = 176
  end
end
