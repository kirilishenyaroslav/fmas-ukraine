object frmDischargeOrder: TfrmDischargeOrder
  Left = 179
  Top = 154
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1047#1074#1110#1083#1100#1085#1077#1085#1085#1103
  ClientHeight = 488
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 46
    Width = 807
    Height = 354
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyDown = cxGrid1DBTableView1KeyDown
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object cxGrid1DBTableView1DBNUM_SUB_ITEM: TcxGridDBColumn
        Caption = #1055#1091#1085#1082#1090
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'NUM_SUB_ITEM'
      end
      object cxGrid1DBTableView1IS_SHADOW: TcxGridDBColumn
        PropertiesClassName = 'TcxImageProperties'
        Visible = False
        OnCustomDrawCell = cxGrid1DBTableView1IS_SHADOWCustomDrawCell
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 45
        DataBinding.FieldName = 'IS_SHADOW'
        IsCaptionAssigned = True
      end
      object cxGrid1DBTableView1ID_DISMISSION: TcxGridDBColumn
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_DISMISSION'
        IsCaptionAssigned = True
      end
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1058#1053
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 47
        DataBinding.FieldName = 'TN'
      end
      object cxGrid1DBTableView1FIO: TcxGridDBColumn
        Caption = #1055#1030#1041
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 124
        DataBinding.FieldName = 'FIO'
      end
      object cxGrid1DBTableView1NAME_POST: TcxGridDBColumn
        Caption = #1055#1086#1089#1072#1076#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 83
        DataBinding.FieldName = 'NAME_POST'
      end
      object cxGrid1DBTableView1DBNAME_AWAY: TcxGridDBColumn
        Caption = #1053#1072' '#1095#1072#1089' '#1082#1086#1075#1086' '#1087#1088#1072#1094#1102#1108'?'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 79
        DataBinding.FieldName = 'NAME_AWAY'
      end
      object cxGrid1DBTableView1RATE_COUNT_STR: TcxGridDBColumn
        Caption = #1057#1090#1072#1074#1082#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'RATE_COUNT_STR'
      end
      object cxGrid1DBTableView1WORK_REASON: TcxGridDBColumn
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 66
        DataBinding.FieldName = 'WORK_REASON'
      end
      object cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 125
        DataBinding.FieldName = 'NAME_DEPARTMENT'
      end
      object cxGrid1DBTableView1DATE_DISMISSION: TcxGridDBColumn
        Caption = #1047' '#1076#1072#1090#1080
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 74
        DataBinding.FieldName = 'DATE_DISMISSION'
      end
      object cxGrid1DBTableView1DISMISSION_REASON: TcxGridDBColumn
        Caption = #1055#1088#1080#1095#1080#1085#1072
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 129
        DataBinding.FieldName = 'DISMISSION_REASON'
      end
      object cxGrid1DBTableView1ID_MAN_MOVING: TcxGridDBColumn
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_MAN_MOVING'
      end
      object cxGrid1DBTableView1ID_ORDER_ITEM: TcxGridDBColumn
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_ORDER_ITEM'
      end
      object cxGrid1DBTableView1PROFKOM_NOTE: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1090#1072' '#1076#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080' '#1087#1088#1086#1092#1082#1086#1084#1091
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 181
        DataBinding.FieldName = 'PROFKOM_NOTE'
      end
      object cxGrid1DBTableView1NOT_USED_HOLIDAY_COUNT: TcxGridDBColumn
        Caption = #1050#1086#1084#1087'. '#1079#1072' '#1085#1077#1074#1080#1082'. '#1074#1110#1076#1087'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 46
        DataBinding.FieldName = 'NOT_USED_HOLIDAY_COUNT'
      end
      object cxGrid1DBTableView1NOT_WORKED_HOLIDAY_COUNT: TcxGridDBColumn
        Caption = #1053#1077' '#1074#1110#1076#1087#1088'. '#1076#1085#1110#1074'.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 43
        DataBinding.FieldName = 'NOT_WORKED_HOLIDAY_COUNT'
      end
      object cxGrid1DBTableView1RATE_COUNT: TcxGridDBColumn
        Caption = #1057#1090#1072#1074#1082#1072
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 58
        DataBinding.FieldName = 'RATE_COUNT'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 400
    Width = 807
    Height = 88
    Align = alBottom
    Anchors = [akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      807
      88)
    object Bevel1: TBevel
      Left = 0
      Top = 40
      Width = 805
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Shape = bsTopLine
    end
    object Panel1: TPanel
      Left = 287
      Top = 44
      Width = 209
      Height = 49
      Anchors = [akTop]
      BevelOuter = bvNone
      TabOrder = 0
      object btnOk: TBitBtn
        Left = 0
        Top = 5
        Width = 97
        Height = 28
        Caption = #1043#1072#1088#1072#1079#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
        OnClick = btnOkClick
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
      object btnCancel: TBitBtn
        Left = 112
        Top = 5
        Width = 97
        Height = 28
        Caption = #1042#1110#1076#1084#1110#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ModalResult = 2
        ParentFont = False
        TabOrder = 1
        OnClick = btnCancelClick
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
    object ReasonDismiss: TcxDBTextEdit
      Left = 0
      Top = 16
      Width = 250
      Height = 21
      DataBinding.DataField = 'NAME_DISMISSION'
      DataBinding.DataSource = DataSource1
      Style.Color = clSilver
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 0
      Width = 51
      Height = 17
      TabOrder = 2
      Caption = #1055#1088#1080#1095#1080#1085#1072
    end
    object cxLabel2: TcxLabel
      Left = 251
      Top = 0
      Width = 165
      Height = 17
      TabOrder = 3
      Caption = #1053#1086#1084#1077#1088' '#1090#1072' '#1076#1072#1090#1072' '#1087#1086#1089#1090'. '#1087#1088#1086#1092#1082#1086#1084#1091
    end
    object ProfkomEdit: TcxDBTextEdit
      Left = 251
      Top = 16
      Width = 169
      Height = 21
      DataBinding.DataField = 'PROFKOM_NOTE'
      DataBinding.DataSource = DataSource1
      Style.Color = clSilver
      TabOrder = 4
    end
    object cxLabel3: TcxLabel
      Left = 422
      Top = 0
      Width = 53
      Height = 17
      TabOrder = 5
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
    end
    object ReasonEdit: TcxDBTextEdit
      Left = 422
      Top = 16
      Width = 189
      Height = 21
      DataBinding.DataField = 'DISMISSION_REASON'
      DataBinding.DataSource = DataSource1
      Style.Color = clSilver
      TabOrder = 6
    end
    object NoteEdit: TcxDBTextEdit
      Left = 615
      Top = 15
      Width = 178
      Height = 21
      DataBinding.DataField = 'NOTE'
      DataBinding.DataSource = DataSource1
      Style.Color = clSilver
      TabOrder = 7
    end
    object cxLabel4: TcxLabel
      Left = 615
      Top = -1
      Width = 53
      Height = 17
      TabOrder = 8
      Caption = #1055#1088#1080#1084#1110#1090#1082#1072
    end
  end
  object Database: TpFIBDatabase
    DBName = 'D:\FULL_DB.IB'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=SYSDBA')
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 8
    Top = 112
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 40
    Top = 112
  end
  object WriteDataSet: TpFIBDataSet
    Database = Database
    Transaction = WriteTransaction
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    Left = 40
    Top = 144
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    TRParams.Strings = (
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 72
    Top = 112
  end
  object ReadDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from UP_DT_MAN_DISMISSION_BUFF_S(:ID_SESSION)')
    Left = 72
    Top = 144
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 72
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = ReadDataSet
    Left = 104
    Top = 112
  end
  object Query: TpFIBQuery
    Database = Database
    Transaction = WriteTransaction
    Left = 104
    Top = 144
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 40
    Top = 176
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
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'qizzStyle'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle16
      Styles.ContentEven = cxStyle17
      Styles.ContentOdd = cxStyle18
      Styles.Inactive = cxStyle24
      Styles.IncSearch = cxStyle25
      Styles.Selection = cxStyle28
      Styles.FilterBox = cxStyle19
      Styles.Footer = cxStyle20
      Styles.Group = cxStyle21
      Styles.GroupByBox = cxStyle22
      Styles.Header = cxStyle23
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      BuiltIn = True
    end
  end
  object DataSourceErrors: TDataSource
    Left = 104
    Top = 176
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        BorderStyle = bbsNone
        Caption = 'toolbar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        IsMainMenu = True
        ItemLinks = <
          item
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnEdit
            Visible = True
          end
          item
            Item = btnDelete
            Visible = True
          end
          item
            Item = btnView
            Visible = True
          end
          item
            Item = dxBarLargeButton1
            Visible = True
          end>
        MultiLine = True
        Name = 'toolbar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
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
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 8
    Top = 176
    DockControlHeights = (
      0
      0
      46
      0)
    object btnAdd: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      OnClick = btnAddClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF0094635A00A5636B00A5636B00A5636B00A5636B00A5636B00A563
        6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
        6B00A5636B00A5636B00A5636B00A5636B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE
        9400EFC69400EFC68C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
        8400EFC68400EFC68400EFBD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE
        9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCE
        A500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094635A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6
        AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094636300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6
        B500EFCEA500DEBD9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD
        7B00EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0094636300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DE
        BD00DEC6A500BDA58400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD
        8400EFBD7B00EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009C6B6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DE
        BD00004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC6
        8C00EFBD8400EFBD7B00E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF009C6B6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECE
        B500004A00000894100000940800004A0000A58C6B00C6AD8400D6B58400DEB5
        8400E7BD8400EFBD8400E7BD7B009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A5736300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C
        8C00004A0000089C1800089C1000004A000094846B00A58C6B00A58C6B00BD9C
        7300DEB58400EFC68C00E7BD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A5736B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A
        0000004A000010A5210008A51800004A0000004A0000004A0000004A0000A58C
        6B00D6B58400EFC68C00EFBD84009C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AD7B6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6
        420018BD390018B5310010AD290010A5210008A51800089C1000004A0000AD94
        7300D6B58C00EFCE9400EFC68C00A5736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B57B6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE
        4A0021C6420018BD390018B5310010B5290010AD210010A52100004A0000BDA5
        8400DEBD9400EFCE9C00EFC69400A5736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B5846B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A
        0000004A000021CE4A0021C64200004A0000004A0000004A0000004A0000E7C6
        A500EFCEA500F7CEA500EFCE9C009C736300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD846B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
        F700004A000029D65A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DE
        B500F7D6AD00EFD6A500CEB594008C6B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C68C6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00004A000031DE630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DE
        BD00E7CEAD00C6B59400A5947B0084636300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C68C7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00004A0000004A0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6
        BD00BDAD9C00A59C8C00A5948400846B6300FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C63
        5A0094635A0094635A0094635A009C6B5A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CE947300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA5
        6B00DE9C4A00E7943900EF8C2100A56B6B00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB5
        7300EFAD5200F7A53100A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB5
        7300EFA55200A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D69C7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB5
        7300A56B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D6947300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6
        AD00DEBDAD00DEBDAD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object btnEdit: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      OnClick = btnEditClick
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
    object btnDelete: TdxBarLargeButton
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1083#1091#1095#1080#1090#1080
      Visible = ivAlways
      OnClick = btnDeleteClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFAFAFAF999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E
        999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C
        9E999C9EFF00FFFF00FFFF00FFAFAFAFFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF9
        F9F8F7F7F6F5F5F4F3F3F2F1F1F0EFEFEEEDEDECEBEBEAE9E9E8E6E6E4E1E1E0
        DCDCDBD2D2D1CACACA989B9DFF00FFFF00FFFF00FFAFAFAFFEFEFDF7A95FF2A6
        5BEEA259F5A65AF7A759F7A658F7A557F7A555F7A454F7A353F7A351F7A250F7
        A14FF7A14EF79C45ED9239DB8531BDBDBC939698FF00FFFF00FFFF00FFAFAFAF
        FEFEFDEDA35DDBDBDAD0D0CFE9E9E8F5A75AFEFEFDFEFEFDFEFEFDF7A556FEFE
        FDFEFEFDFEFEFDF7A251F8F8F7EBEBEAADB4D70031DEC2C2C196999BFF00FFFF
        00FFFF00FFAFAFAFFAFAF9D89556002EE4A0A09FC1C1C0E29A55FCFCFBFEFEFD
        FEFEFDF7A657FEFEFDFEFEFDFEFEFDED9C4FD8D8D76974B70031DE0426BAD1D1
        D0989B9DFF00FFFF00FFFF00FFAFAFAFF9F9F81B48FB1B48FB002EE49B9B9ABB
        8048E9E9E8FCFCFBFEFEFDF7A659FEFEFDFEFEFDF4F4F3CF8946002EE40532F5
        1B48FBD38A43DFDFDD999C9EFF00FFFF00FFFF00FFAFAFAFFBFBFA1B48FB3E5E
        FF3E5EFF002EE497683ABB8048E29A55F5A75AF7A75AF7A659ED9F54CF8A4800
        2EE40532F51B48FBCF8844ED9C4CE8E8E7999C9EFF00FFFF00FFFF00FFAFAFAF
        FAFAF9F6AB658C9CF61B48FB3E5EFF002EE49B9B9AC1C1C0E8E8E7EDA158EBEB
        EAAAB1D3002EE40532F51B48FBD5D5D4F4F4F3F6A151EBEBEA999C9EFF00FFFF
        00FFFF00FFAFAFAFF8F8F7F8AE66FEFEFDBAC3FA1B48FB3E5EFF002EE49B9B9A
        BCBCBBC6874B6873B60031DE0532F51B48FBD5D5D4F4F4F3FDFDFCF7A352EEEE
        ED999C9EFF00FFFF00FFFF00FFAFAFAFF6F6F5F8AE66FEFEFDFEFEFDFAFAF91B
        48FB3E5EFF002EE49595940031DE0532F51B48FB1B48FBCF8B4BF4F4F3FDFDFC
        FEFEFDF7A453F0F0EF999C9EFF00FFFF00FFFF00FFAFAFAFF4F4F3F8AE66F8AE
        66F8AE66F8AE66F3A9631B48FB3E5EFF1B48FB1B48FB1B48FB1B48FBC48649EA
        9E57F6A659F7A658F7A557F7A555F2F2F1999C9EFF00FFFF00FFFF00FFAFAFAF
        F2F2F1F8AE66FEFEFDFEFEFDFEFEFDEDA662D2D2D11B48FB1B48FB1B48FB1B48
        FB929291BCBCBBE19954FCFCFBFEFEFDFEFEFDF7A557F4F4F3999C9EFF00FFFF
        00FFFF00FFAFAFAFF0F0EFF8AE66FEFEFDFEFEFDF4F4F3D092561B48FB3E5EFF
        1B48FB1B48FB3E5EFF002EE49B9B9ABB8047E9E9E8FCFCFBFEFEFDF7A658F6F6
        F5999C9EFF00FFFF00FFFF00FFAFAFAFEEEEEDF8AE66FEFEFDF4F4F3D5D5D41B
        48FB3E5EFF1B48FB002EE4002EE41B48FB3E5EFF002EE49F6D3EC4C4C3E9E9E8
        FCFCFBF7A759F8F8F7999C9EFF00FFFF00FFFF00FFAFAFAFEBEBEAF8AE66EEA7
        62D092561B48FB3E5EFF1B48FB002EE4D09256EBA460EEA6611B48FB3E5EFF00
        2EE4A87341BE8248E29A55F5A65AFAFAF9999C9EFF00FFFF00FFFF00FFAFAFAF
        E9E9E8EEA762D5D5D41B48FB3E5EFF1B48FB002EE4D5D5D4F4F4F3F7AD66FEFE
        FDFCFCFB8C9CF61B48FB002EE4ADADACC4C4C3E29A55FBFBFA999C9EFF00FFFF
        00FFFF00FFAFAFAFDEDEDED092561B48FB3E5EFF1B48FB002EE4D5D5D4F4F4F3
        FDFDFCF8AE66FEFEFDFEFEFDFEFEFDBAC3FA1B48FB002EE4B4B4B3C7884BECEC
        EB989B9DFF00FFFF00FFFF00FFADADADCCCCCB1B48FB5B7AFF1B48FB002EE4D0
        9256F4F4F3FDFDFCFEFEFDF8AE66FEFEFDFEFEFDFEFEFDF8AD65FAFAF91B48FB
        002EE4CB8C4EDCDCDB939698FF00FFFF00FFFF00FFAEAEAE1B48FB6482FF1B48
        FB002EE4D09256EEA762F7AD66F8AE66F8AE66F8AE66F8AE66F8AE66F8AE66F8
        AD66F8AD65F5AA62F0A65F002EE4EBEBEA96999BFF00FFFF00FFFF00FFAFAFAF
        D9D9D91B48FB002EE4CACACADFDFDEEAEAE9EDEDECEFEFEEF1F1F0F3F3F2F5F5
        F4F7F7F6F9F9F8FBFBFAFDFDFCFEFEFDFEFEFDFDFDFCFBFBFA989B9DFF00FFFF
        00FFFF00FFAFAFAFD8D8D8DADAD9DADAD9DEDEDEE7E7E6E9E9E8EBEBEAEDEDEC
        EFEFEEF1F1F0F3F3F2F5F5F4F7F7F6F9F9F8FBFBFAFDFDFCFEFEFDFEFEFDFEFE
        FD999C9EFF00FFFF00FFFF00FFAFAFAF999C9E999C9E999C9E999C9E999C9E99
        9C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E
        999C9E999C9E999C9E999C9EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btnView: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1076
      Visible = ivAlways
      OnClick = btnViewClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDBAA9D0B5AACCB0
        A4DCB7A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BDAF
        CCC1BDBCB6B6ADA5A5AF9F9AD5B2A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFE0BDAFDCD1D0D1CFD0C9C6C7BFB8BAADA5A5AD9D99D4B4A4FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFE1BFAFE6DCDAE2E2E3DCDADDD0BCB5C7B2ABBFBABBAFA6A7AC
        9D98D5B4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFE2C1B1EDE5E2EEEFF3E9E9EBD09174C05223C052
        23C28164BFB8BAAFA7A9AD9D99D3B1A3FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFE2C0B0F2EBE9F4F8FBF3F7FBD3906F
        BA400FBA4111BB4112BB4111C17958C0BABAAFA7A9A99A97D3B1A3FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDADF4EDE9FBFEFFF8
        FEFFD99F82C25627D9906DDD9C7BDD9C7BD9906DC45424C17653BFBABBAFA7A9
        A99A97D3B1A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDADF6ED
        E9FEFFFFFEFFFFDEA68BBC4919BC4919DD9D7EFFFFFFFFFFFFDA9776BD4A1ABF
        4918C27B5BBFB8BAB0A9AAAB9C98D3B1A3FF00FFFF00FFFF00FFFF00FFFF00FF
        E1BFAFF8F0EEFFFFFFFFFFFFE0A588BD4A1ABD4B1CBC4716D17F56FFFFFFFFFF
        FFCF784FBC4718BF4E1EBF4A18C17552C0B7B7B0A9AAA99A97CEAFA1FF00FFFF
        00FFFF00FFE1BCACF8EFEBFFFFFFFFFFFFE7B79DC55926C45424C05122BC4716
        D38159FFFFFFFFFFFFD07A52BC4718BF4E1FBF4E1EBF4918C1724EBDB5B5AFA7
        A9A69997CEAFA1FF00FFE0BAA9F4E9E2FFFFFFFFFFFFEECAB0CF703ACB6833C9
        6430C65C2AC04D1CD4825AFFFFFFFFFFFFD07A52BC4718BF4E1FBF4E1FBF4E1E
        BF4717C17857BFB8BAAFA6A5AA9A97D8B5A5E7CABCFFFFFFFFFFFFFEFBF8DC93
        5DD47A41D17740CF703ACC6935C55926D78A63FFFFFFFFFFFFD07A52BC4718BF
        4E1FBF4E1FBF4E1FBF4C1DC05021C6B0A7BFBABBAFA6A5CBAFA4E7C9BCFFFFFF
        FFFFFFFEFBF8E2A069DA894BD8844AD47D44D1763FCB6730DA926AFFFFFFFFFF
        FFD17D54BC4718BF4E1FBF4E1FBF4E1FBD4A1AC05628D1C0BBC9C6C7BDB6B6D3
        B5A9E0BAA9F6E9E3FFFFFFFFFFFFF4DCC2E19A5CDD8F52DA894FD78248D07239
        E1A37BFFFFFFFFFFFFD5875EC04F1DC0501FBF4E1FBD4B1CBD4A1AD4A088DCDD
        E0D1CFD0CFC0BCE0BAA9FF00FFE1BCACF8EFEAFFFFFFFFFFFFF4DCC0E29E5FDE
        9556DA8E51DC8E56EEC6A9F4DECEF4DDCCD78658C75C28C55A28C0501FBD4B1C
        D89F84E9EDF0E2E2E3DCCFCBE0BBABFF00FFFF00FFFF00FFE1BCACF6EBE5FFFF
        FFFFFFFFF7E2CAE6A667E19A5AE0985CDD9055D9884ED58047D0743CCE6E38CA
        6530C65C28E0AF97F2F7FBEDEFF2E5D9D5E0BBABFF00FFFF00FFFF00FFFF00FF
        FF00FFE0BBABF4E9E2FFFFFFFFFFFFF8E5CEE9AC6DE29D5BE3A56DF7E3D3F6DE
        CEDA8C57D1763DCF6F37E7B79DF8FEFFF4F8FBEDE2DEE0BCACFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFE0BBABF4E9E3FFFFFFFFFFFFFAE9D3E9AB67
        EFC99EFFFFFFFFFFFFE7B287D57D3FE9BB9CFEFFFFFBFEFFF0E9E6E1BFAFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BCACF4E7E1FF
        FFFFFFFFFFF8E6CEEFC086F7E0C2F6DABDE3A065EEC7A5FFFFFFFEFFFFF6EDE9
        E2C0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE0BAA9F3E5DEFFFFFFFFFFFFFBEDD7F0C48AEBB77AF4D8B8FFFFFFFF
        FFFFF7EEEAE1BFAFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFE0BAA9F3E5DEFFFFFFFFFFFFFFFEFCFEFB
        F8FFFFFFFFFFFFFAF3F0E2C0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BAA9F4E7E1
        FFFFFFFFFFFFFFFFFFFFFFFFFAF3F0E3C2B4FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFE0BAA9F2E0D7FEFCFCFFFEFEF7EEEAE3C2B2FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BCABE6C5B7E7C9BCE1BCABFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1042#1110#1076#1087#1091#1089#1090#1082#1080'+'#1082#1086#1084#1087#1077#1085#1089#1072#1094#1110#1103
      Category = 0
      Hint = #1042#1110#1076#1087#1091#1089#1090#1082#1080'+'#1082#1086#1084#1087#1077#1085#1089#1072#1094#1110#1103
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFA87D78A47874A47874A47874A47874A47874A47874A47874
        A47874A47874A47874A47874A47874A47874A47874A47874A47874A47874986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFA97F79F3DDC4F8E3C6F6DFBFF5DCB8F4
        D9B2F3D7ACF3D4A7F2D2A0F0CF9AF0CE98F0CE98F0CE98F0CE98F0CE98F0CE98
        F1CF98EFCD97986B66FF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF2DEC8F7E3
        CAF5DFC2F4DCBCF3DAB6F2D7B1F1D4ABF1D2A5F0CF9FEFCD9AEECC97EECC97EE
        CC97EECC97EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        A97F7AF2E0CEF8E7CFF5E2C8F5DEC2F4DCBCF3DAB7F2D7B1F1D4ABF1D2A5F0CF
        A0EFCD9AEECC97EECC97EECC97EECC97EFCD97EDCB96986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFA97F7AF3E3D2F9E9D4F6E4CDF5E1C7F5DEC1F4DCBCF3D9B6
        F2D7B0F1D4AAF1D2A5F0CFA0EECC99EECC97EECC97EECC97EFCD97EDCB96986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFA97F7BF4E6D8FAECDA99330099330099
        3300993300993300993300F2D7B0F1D4ABF1D2A6F0CFA0EECD9AEECC97EECC97
        EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FFAA807BF5E9DDFBEF
        E0993300FEFEFED8DEF53961FD7189E5993300F3D9B6F2D7B1F1D4ACF1D2A6F0
        CFA0EECC99EECC97EFCD97EDCB96986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        AD837DF5ECE3FBF2E6993300C9D3FB2C58FF7691FE204BF78E3004F4DCBBF3D9
        B6F2D7B1F1D4ABF1D2A5F0CFA0EECC99EFCD97EDCB96986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFB2887EF7EFE8FCF5EC993300E1E7FECAD4FEFEFEFE7E98F9
        332B79F5DFC1F4DCBCF3D9B7F1D7B0F1D4ABF0D2A5F0CF9FEFCD9AEDCA96986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFB68B80F8F2EEFDF8F1993300FEFEFEFE
        FEFEFEFEFEF8F8FA1D2EAF7B8CE3F4DFC1F4DCBCF3D9B6F2D6B0F1D4AAF0D1A4
        F0D09FEDCB98986B66FF00FFFF00FFFF00FFFF00FFFF00FFBA8E82FAF6F4FEFC
        F89933009933009933009933009933008D320C4163F24866ECABAAD3F4DCBBF3
        D9B6F1D7B0F1D4AAF1D2A5EECD9E986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        BE9283FBF8F7FFFFFEFEFAF6FCF5EFFAF2EAFAF0E3F9ECDDF9E9D8F3E4D38290
        E36E81E4F5DEC1F4DCBCF3D9B6F2D7B0F2D5ABEFCFA4986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFC29685FBF8F7FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3
        F9EDDDF8E9D7F8E7D2F6E4CDF5E1C6F5DEC1F4DCBBF3D9B5F2D7B0F0D2A8986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFC69986FBF8F7FFFFFF99330099330099
        3300993300993300993300F9ECDDF8EAD8F8E6D2F6E4CCF6E1C6F5DEC0F4DCBB
        F4DAB6F1D5AE986B66FF00FFFF00FFFF00FFFF00FFFF00FFCA9C88FBF8F7FFFF
        FF993300FEFEFED8DEF53961FD7189E5993300FAEFE3F9ECDDF8E9D7F8E6D1F6
        E3CBF5E1C6F4DEC0F3DBBAD9C4A7986B66FF00FFFF00FFFF00FFFF00FFFF00FF
        CEA089FCF9F7FFFFFF993300C9D3FB2C58FF7691FE204BF78E3004FBF2E9FAF0
        E3F9ECDDF8E9D7F8E6D1F6E4CCEBD9C0D1C1ABB5A897986B66FF00FFFF00FFFF
        00FFFF00FFFF00FFD2A38AFCF9F7FFFFFF993300E1E7FECAD4FEFEFEFE7E98F9
        332B79FCF6EFFAF2E9FAEFE2FAEDDEFBEEDBE7DBC9C8BDAFBAB0A2B7AC9D986B
        66FF00FFFF00FFFF00FFFF00FFFF00FFD7A78CFCF9F7FFFFFF993300FEFEFEFE
        FEFEFEFEFEF8F8FA1D2EAF7F98FAFCF5EEFCF5EBEEDDD1B48176B48176B48176
        B48176B48176B48176FF00FFFF00FFFF00FFFF00FFFF00FFDAAB8DFCF9F8FFFF
        FF9933009933009933009933009933008D320C4369FE4B6DF9B2BEF5E3CEC6B4
        8176E3B585E5AD6AE9A654EFA039B88285FF00FFFF00FFFF00FFFF00FFFF00FF
        DEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFF869D
        FC738EFAE5D1CBB48176EFC48DF3BB6DF8B450B88285FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE5D4D0B48176EFC38CF3BA6CB88285FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFDEAD8EFFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DBD9B48176F1C58BB88285
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAA482DAA482DAA4
        82DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482B4
        8176B88285FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object ImageList1: TImageList
    Left = 184
    Top = 104
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003110000042180000522100005221000042180000311000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A18
      00004A18000084310000A5420000AD420000AD420000A5420000843100005218
      0000521800000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A2100006B29
      0000AD420000B5420000AD420000A5420000AD420000AD420000AD420000B542
      0000732900003110000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A2100007B310000C64A
      0000BD4A0000AD420000A5420000A5420000A5420000A5420000A5420000AD42
      0000B54200007329000052180000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A210000D6520000CE52
      0000BD4A0000AD420000B5521000F7E7D600FFEFE700C67B4200A5420000A542
      0000AD420000B542000052180000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A210000A5390000EF5A0000CE52
      0000B5420000AD420000AD420000DEAD7B00FFFFFF00FFFFF700C67B3900A542
      0000A5420000AD42000084310000421800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A210000D6520000EF5A0000D652
      0000B5420000AD420000AD420000AD420000D6A56B00FFFFFF00FFF7F700C673
      3900A5420000AD4200009C390000421800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073290000F7630000FF630000FFD6
      AD00FFD6AD00F7CEAD00FFD6AD00F7CEA500F7CEAD00FFFFF700FFFFFF00FFF7
      EF00CE8C4A00AD420000AD4200004A1800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C310000FF7B1000FF6B0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7C6A500AD420000AD420000522100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C310000FF8C2900FF841800F78C
      3100FF8C3100FF8C3100FF8C3100FF842100EFA56300FFFFFF00FFFFFF00EFBD
      8C00C65A0800BD4A0000A54200004A1800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C310000FF841800FFAD6300FF63
      0000EF5A0000FF630000FF630000FF8C3100FFEFDE00FFFFFF00EFAD7B00CE52
      0000C64A0000BD4A0000943900004A1800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E75A0000FFC69400FF9C
      4200E75A0000EF5A0000FF731000FFFFF700FFFFFF00F7AD7300CE520000CE4A
      0000C64A0000C64A000073290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E75A0000FF8C2900FFDE
      B500FF944200FF630000EF630000FFC69400FFBD7B00E75A0000DE520000D652
      0000D6520000B542000073290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C64A0000FF9C
      4200FFE7C600FFBD7B00FF842900FF730800FF6B0000FF6B0800FF6B0800FF63
      0000CE4A00007329000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF84
      1800FF841800FFBD7B00FFD6AD00FFC69400FFB57300FFA55A00FF842100D652
      0000D65200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E75A0000FF730800FF7B1800FF7B1000FF630000B54200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F81F000000000000E007000000000000
      C003000000000000800100000000000080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080010000000000008001000000000000C003000000000000
      E007000000000000F81F00000000000000000000000000000000000000000000
      000000000000}
  end
  object ReadDataSet2: TpFIBDataSet
    Database = Database
    Transaction = WriteTransaction
    SelectSQL.Strings = (
      'select * from UP_DT_MAN_DISMISSION_BUFF_S(:ID_SESSION)')
    Left = 152
    Top = 144
    poSQLINT64ToBCD = True
  end
end
