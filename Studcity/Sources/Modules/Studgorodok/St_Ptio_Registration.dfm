object Registration_Form: TRegistration_Form
  Left = 347
  Top = 216
  Width = 932
  Height = 491
  Cursor = crHandPoint
  Caption = 's'
  Color = clBtnFace
  Constraints.MinWidth = 160
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    916
    453)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 359
    Width = 916
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      916
      46)
    object Bevel4: TBevel
      Left = 0
      Top = 0
      Width = 916
      Height = 2
      Align = alTop
      Style = bsRaised
    end
    object cxLabel1: TcxLabel
      Left = 544
      Top = 23
      Width = 63
      Height = 17
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1055#1088#1086#1087#1091#1089#1082':'
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 6
      Width = 46
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1055'.I.'#1041'.:'
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 22
      Width = 75
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
    end
    object cxLabel4: TcxLabel
      Left = 544
      Top = 6
      Width = 64
      Height = 17
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = #1044#1086#1075#1086#1074#1086#1088':'
    end
    object Category_Label: TEdit
      Left = 80
      Top = 24
      Width = 281
      Height = 17
      TabStop = False
      AutoSize = False
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object cxLabel5: TcxLabel
      Left = 352
      Top = 22
      Width = 53
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = #1057#1090#1072#1090#1091#1089':'
    end
    object Status_Edit: TEdit
      Left = 400
      Top = 24
      Width = 137
      Height = 17
      TabStop = False
      AutoSize = False
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object Dogovor_Label: TEdit
      Left = 604
      Top = 8
      Width = 507
      Height = 15
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object Propusk_Label: TEdit
      Left = 624
      Top = 25
      Width = 389
      Height = 15
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object PIB_Label: TEdit
      Left = 48
      Top = 8
      Width = 465
      Height = 17
      TabStop = False
      AutoSize = False
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 96
    Width = 916
    Height = 263
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object cxGridDBTableView1: TcxGridDBTableView
      OnDblClick = cxGridDBTableView1DblClick
      OnMouseDown = cxGridDBTableView1MouseDown
      DataController.DataModeController.GridMode = True
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGridDBTableView1CustomDrawCell
      Filtering.Visible = fvNever
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cxGridDBColumn1
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.Inactive = cxStyle4
      Styles.Selection = cxStyle2
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = #1060'.'#1048'.'#1054'.'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle3
        Width = 297
        DataBinding.FieldName = 'FIO_COMBO'
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Styles.Header = cxStyle3
        Width = 199
        DataBinding.FieldName = 'NAME_FAC'
      end
      object cxGridDBColumn3: TcxGridDBColumn
        Caption = #1050#1091#1088#1089
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle3
        Width = 41
        DataBinding.FieldName = 'KURS'
      end
      object cxGridDBColumn4: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072
        Visible = False
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle3
        Width = 109
      end
      object cxGridDBColumn5: TcxGridDBColumn
        Caption = #1054#1073#1097'.'
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle3
        Width = 34
        DataBinding.FieldName = 'NUM_BUILD'
      end
      object cxGridDBColumn6: TcxGridDBColumn
        Caption = #1050#1086#1084#1085#1072#1090#1072
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle3
        Width = 81
        DataBinding.FieldName = 'COMBO_ROOM_NAME'
      end
      object cxGridDBColumn7: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        Visible = False
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle3
        Width = 67
      end
      object cxGridDBTableColumn8: TcxGridDBColumn
        Caption = #1053#1072#1083#1086#1075'.'#1085#1086#1084#1077#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Header = cxStyle3
        Width = 95
        DataBinding.FieldName = 'ID_N_NALOG'
      end
      object END_REGISTRATION_FLAG: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'END_REGISTRATION_FLAG'
      end
      object ISSENDINGDOWN: TcxGridDBColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0'
        Visible = False
        DataBinding.FieldName = 'ISSENDINGDOWN'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object CancelFiltr_Button: TcxButton
    Left = 482
    Top = 49
    Width = 41
    Height = 19
    Cursor = crHandPoint
    Hint = 
      #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088'  | '#1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1080' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1080#1076' '#1073#1077#1079' '#1091#1089#1083#1086#1074#1080 +
      #1081' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = CancelFiltr_ButtonClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF652814672913672913672913672913672913FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF682913672913BC4B00BC4B00BC
      4B00BC4B00BC4B00BC4B00672913672913FF00FFFF00FFFF00FFFF00FFFF00FF
      83350BB54701BB4A00BB4A00BB4A00BB4A00BB4A00BC4B00BC4B00BC4B00B548
      01672913FF00FFFF00FFFF00FF81340CB44700B84800B64600B64600B64600B6
      4600B84800BA4900BC4B00BC4B00BC4B00B54801672913FF00FFFF00FFA94202
      B64700B44500B14300AD4100C06928CA7D40CC7F41CA7632C25C10BC4B00BC4B
      00BC4B00682913FF00FF923A07BA4C02B74D03B54D03B14B03B04901E0B289FE
      FEFEFEFEFEFEFEFEFEFEFED0813DBC4B00BC4B00BC4B00652814973D06BF5609
      BB570BB8570CB7560CB5540AB5540BB6560DB4530CB5520FDCA474FEFEFEBB4A
      00BC4B00BC4B00682913963E07C76A1FC1651ABF6419BF651BBD6318E3BD97B6
      550CB14D04AD4501B64E09FEFEFEBB4A00BC4B00BC4B00682913973F09D48B49
      CB7A34C67229C7742CE6C19DFEFEFEBC6017B6550CB24C04CB8042FEFEFEBB4A
      00BC4B00BC4B00682913953D07DEA068DA9D62CF803AF0D7BDFEFEFEFEFEFEF6
      E9DAEFD8C1EED5BDFEFEFEDDA574BB4A00BC4B00BC4B00682913953B05E09E63
      EBC6A1DD9C5EF2D8BDFEFEFEFEFEFEF0D9C2E5BC96E2B78ED08745B74801BB4A
      00BC4B00BC4B00652814FF00FF9A4711EFCEADF0CEACE3A972EECCABFEFEFEC9
      752DC2681DBF5C10BC5407BB4B01BB4A00BC4B00682913FF00FFFF00FF953B05
      E2A468F6E0C9F3D5B8E2A972EAC199CB762DC66A1EC25F11C1590ABC4D03BC4B
      00B54801632815FF00FFFF00FFFF00FF963C06E5A66CF3D7BBF4DEC7EBC49DE1
      A670DA9556D58945CE762CC05607B54801762F0FFF00FFFF00FFFF00FFFF00FF
      FF00FF973D069F4C16E6AA72EBBC90E9BB8EE3AA75D88B48C764169C41096F2D
      11FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993F079C420A9E
      460E9D450C9C410984360CFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfUltraFlat
    Spacing = 2
  end
  object FIO_CheckBox: TcxRadioButton
    Left = 176
    Top = 49
    Width = 65
    Height = 17
    Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080' | '#1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080
    Caption = #1087#1086' '#1060#1048#1054
    Checked = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = True
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
  end
  object Nomer_CheckBox: TcxRadioButton
    Left = 240
    Top = 49
    Width = 81
    Height = 17
    Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1080#1076'.'#1082#1086#1076#1091' | '#1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1080#1076'.'#1082#1086#1076#1091
    Caption = #1087#1086' '#1048#1076'.'#1082#1086#1076#1091
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.NativeStyle = False
  end
  object Filter_Button: TcxButton
    Left = 434
    Top = 49
    Width = 41
    Height = 19
    Cursor = crHandPoint
    Hint = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' | '#1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1099#1084' '#1091#1089#1083#1086#1074#1080#1103#1084
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Filter_ButtonClick
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000010000FF00FF003C13
      390000440000004B0000004C000000520200005E0000025E0500046606000069
      0000006E00001566000014680100007400000473040001760800067A0E00077F
      120079017900005F4F00437044000081000000870000018A0300038A06000491
      0B0012811E000A9E1A000C9E1D000F8E270019962D00209635002A9A3A000DA1
      23000AAA270014A628001BA1380016B53A0018B23C0021A73700748904007D8F
      0A0019B8420025BD500005817F00468C4D002CC6550026CB58002CD851002BD1
      5E0036DA67003AE76F0039E9720040D77600D08A0A00D1921200E7961100EB9F
      2200C4954100D7A56000C2A07200E7CC62008B008B00AB00AB00FF03FF00FA2F
      FA00F75FF4000D9AA40055D4810078C79E0045F680004DFF880000C4CE003ACC
      CB0000D8FF0036EBFF0038EDFF00D7B48C00F0DD8F00F3E39E00FA95FA00FFFF
      EE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0003030000000000000000000000000007461503000000000000000000000000
      0746150300000000000000000000000007461503000000000000000000000000
      07461503000000000000000000000000072B2303000000000000000000000007
      312A21190300000000000000000007332F261C18150300000000000000074734
      2F251C18151803000000000007322E241D110E0909090E0300000007080B0C0F
      2049482C1F271E10030007072839382922444B4A433530451A0300073B4F3D36
      05052D4C13021442010000004D514E3700000000000050403F120000003C3A00
      00000000000050413E0000000000000000000000000000500000}
    LookAndFeel.Kind = lfUltraFlat
    Spacing = 2
  end
  object Filter_BarEdit: TcxTextEdit
    Left = 69
    Top = 49
    Width = 100
    Height = 19
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1080#1083#1080' '#1095#1072#1089#1090#1100' '#1092#1072#1084#1080#1083#1080#1080' '#1083#1080#1073#1086' '#1080#1076'.'#1082#1086#1076#1072
    AutoSize = False
    BeepOnEnter = False
    ParentShowHint = False
    Properties.CharCase = ecUpperCase
    Properties.MaxLength = 35
    ShowHint = True
    Style.Color = clInfoBk
    TabOrder = 1
    OnKeyDown = Filter_BarEditKeyDown
  end
  object DateBegEdit: TcxDateEdit
    Left = 71
    Top = 71
    Width = 97
    Height = 21
    BeepOnEnter = False
    Style.Color = clInfoBk
    TabOrder = 7
  end
  object DateEndEdit: TcxDateEdit
    Left = 200
    Top = 72
    Width = 97
    Height = 21
    BeepOnEnter = False
    Style.Color = clInfoBk
    TabOrder = 8
  end
  object Filter_Kat_Button: TcxButton
    Left = 434
    Top = 72
    Width = 41
    Height = 19
    Cursor = crHandPoint
    Hint = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' | '#1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1079#1072#1076#1072#1085#1085#1099#1084' '#1091#1089#1083#1086#1074#1080#1103#1084
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = Filter_Kat_ButtonClick
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000010000FF00FF000635
      1F0011700000033053001D1670001D167500865E3000876236000C86000008A9
      000006B6060005BC050003CA000004C9020002E3010000F80000D08F0900D193
      1000E5A40D00E9AC1C00B88F5500E7CB6200000081000000870006078A000005
      8E00010095000405960006089200080A9300010C9900010C9D000B099900080F
      9F00000CAD000218AB00010DBC00021DB1000717BF001122BF002F2FB5000148
      81000572980033708C00464CB1000303C4000014CC00011DCF000116DC00011E
      DC00061FDE000F2CDE00001EE900001EF6000121FE000528FF000A30FF001138
      FF00163EFF002547E6002B57FF00315EFF003568FF00545DCF000D8CA50000B5
      E90039C4E70000E0F80035F6FE0038F8FB00F0DD8F00F3E59E00FFFFEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00161600000000000000000000000000163E2D16000000000000000000000000
      163E2D16000000000000000000000000163E2D16000000000000000000000000
      163E2D1600000000000000000000000016373516000000000000000000000016
      3D38363416000000000000000000163D3D393735311600000000000000163D3D
      3D3331302E2F1600000000001619191E1E222426272121160000001623040425
      2842412A393C3D3B1600161B071312061B3F4443401D212B1D16001914471510
      16162C45291B030C01000000144846110000000000000C0F0902000000141400
      0000000000000B0E0800000000000000000000000000000A0000}
    LookAndFeel.Kind = lfUltraFlat
    Spacing = 2
  end
  object Cancel_Filter_Kat_Button: TcxButton
    Left = 482
    Top = 72
    Width = 41
    Height = 19
    Cursor = crHandPoint
    Hint = 
      #1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088'  | '#1054#1090#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1080' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1080#1076' '#1073#1077#1079' '#1091#1089#1083#1086#1074#1080 +
      #1081' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = Cancel_Filter_Kat_ButtonClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF652814672913672913672913672913672913FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF682913672913BC4B00BC4B00BC
      4B00BC4B00BC4B00BC4B00672913672913FF00FFFF00FFFF00FFFF00FFFF00FF
      83350BB54701BB4A00BB4A00BB4A00BB4A00BB4A00BC4B00BC4B00BC4B00B548
      01672913FF00FFFF00FFFF00FF81340CB44700B84800B64600B64600B64600B6
      4600B84800BA4900BC4B00BC4B00BC4B00B54801672913FF00FFFF00FFA94202
      B64700B44500B14300AD4100C06928CA7D40CC7F41CA7632C25C10BC4B00BC4B
      00BC4B00682913FF00FF923A07BA4C02B74D03B54D03B14B03B04901E0B289FE
      FEFEFEFEFEFEFEFEFEFEFED0813DBC4B00BC4B00BC4B00652814973D06BF5609
      BB570BB8570CB7560CB5540AB5540BB6560DB4530CB5520FDCA474FEFEFEBB4A
      00BC4B00BC4B00682913963E07C76A1FC1651ABF6419BF651BBD6318E3BD97B6
      550CB14D04AD4501B64E09FEFEFEBB4A00BC4B00BC4B00682913973F09D48B49
      CB7A34C67229C7742CE6C19DFEFEFEBC6017B6550CB24C04CB8042FEFEFEBB4A
      00BC4B00BC4B00682913953D07DEA068DA9D62CF803AF0D7BDFEFEFEFEFEFEF6
      E9DAEFD8C1EED5BDFEFEFEDDA574BB4A00BC4B00BC4B00682913953B05E09E63
      EBC6A1DD9C5EF2D8BDFEFEFEFEFEFEF0D9C2E5BC96E2B78ED08745B74801BB4A
      00BC4B00BC4B00652814FF00FF9A4711EFCEADF0CEACE3A972EECCABFEFEFEC9
      752DC2681DBF5C10BC5407BB4B01BB4A00BC4B00682913FF00FFFF00FF953B05
      E2A468F6E0C9F3D5B8E2A972EAC199CB762DC66A1EC25F11C1590ABC4D03BC4B
      00B54801632815FF00FFFF00FFFF00FF963C06E5A66CF3D7BBF4DEC7EBC49DE1
      A670DA9556D58945CE762CC05607B54801762F0FFF00FFFF00FFFF00FFFF00FF
      FF00FF973D069F4C16E6AA72EBBC90E9BB8EE3AA75D88B48C764169C41096F2D
      11FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993F079C420A9E
      460E9D450C9C410984360CFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfUltraFlat
    Spacing = 2
  end
  object Po_Label: TcxLabel
    Left = 176
    Top = 72
    Width = 22
    Height = 17
    ParentFont = False
    Properties.Transparent = True
    Style.TransparentBorder = True
    TabOrder = 10
    Caption = #1055#1086
  end
  object Calc_Button: TButton
    Left = 693
    Top = 10
    Width = 129
    Height = 27
    Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100' '#1086#1087#1083#1072#1090#1091' !'
    TabOrder = 14
    Visible = False
    OnClick = Calc_ButtonClick
  end
  object HotKey_StatusBar: TdxStatusBar
    Left = 0
    Top = 429
    Width = 916
    Height = 24
    Hint = #1043#1086#1088#1103#1095#1080#1077' '#1082#1083#1072#1074#1080#1096#1080
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'F6 '#1054#1087#1083#1072#1090#1072
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'Ctrl+F8 '#1053#1072#1088#1091#1096#1077#1085#1080#1103
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'F9 '#1055#1088#1086#1087#1080#1089#1082#1072
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'Ctrl+P '#1055#1077#1095#1072#1090#1100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'F8 '#1055#1088#1080#1082#1072#1079#1099
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = HotKey_StatusBarContainer5
        Bevel = dxpbRaised
        Fixed = False
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ShowHint = True
    ParentShowHint = False
    object HotKey_StatusBarContainer5: TdxStatusBarContainerControl
      Left = 765
      Top = 2
      Width = 133
      Height = 20
      DesignSize = (
        133
        20)
      object Progress: TcxProgressBar
        Left = 0
        Top = 0
        Width = 131
        Height = 21
        Hint = #1055#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103'  '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1076#1072#1095#1080
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentColor = False
        Properties.PeakValue = 50
        Style.Color = clBtnFace
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.TransparentBorder = True
        TabOrder = 0
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 405
    Width = 916
    Height = 24
    Hint = #1043#1086#1088#1103#1095#1080#1077' '#1082#1083#1072#1074#1080#1096#1080
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'F1 Help'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'Ins '#1044#1086#1073#1072#1074#1080#1090#1100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'F2 '#1048#1079#1084#1077#1085#1080#1090#1100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'Del '#1059#1076#1072#1083#1080#1090#1100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'F5 '#1054#1073#1085#1086#1074#1080#1090#1100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        Bevel = dxpbRaised
        Fixed = False
        Text = 'Ctrl+F '#1060#1080#1083#1100#1090#1088
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.EllipsisType = dxetSmartPath
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = 33023
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = []
        PanelStyle.ParentFont = False
        Bevel = dxpbRaised
        Fixed = False
      end>
    PaintStyle = stpsOffice11
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ShowHint = True
    ParentShowHint = False
  end
  object Status_ComboBox: TcxComboBox
    Left = 791
    Top = 69
    Width = 127
    Height = 21
    Anchors = [akTop, akRight]
    BeepOnEnter = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 6
    Properties.Items.Strings = (
      #1053#1077' '#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100)
    Properties.OnCloseUp = Status_ComboBoxPropertiesCloseUp
    Style.Color = clInfoBk
    TabOrder = 15
  end
  object Status_Label: TcxLabel
    Left = 746
    Top = 70
    Width = 42
    Height = 17
    Anchors = [akTop, akRight]
    Properties.Transparent = True
    TabOrder = 16
    Caption = #1057#1090#1072#1090#1091#1089
  end
  object Barcode_CheckBox: TcxRadioButton
    Left = 322
    Top = 49
    Width = 100
    Height = 17
    Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1080#1076'.'#1082#1086#1076#1091' | '#1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1080#1076'.'#1082#1086#1076#1091
    Caption = #1055#1086' '#1096#1090#1088#1080#1093' '#1082#1086#1076#1091
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    LookAndFeel.NativeStyle = False
  end
  object DataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    SQLScreenCursor = crSQLWait
    AutoCalcFields = False
    AfterOpen = DataSetAfterOpen
    AfterScroll = DataSetAfterScroll
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 64
    Top = 144
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 40
    Top = 264
  end
  object ActionList1: TActionList
    Left = 144
    Top = 120
    object AddAction: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = AddButton1Click
    end
    object EditAction: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 113
      OnExecute = EditButtonClick
    end
    object DeleteAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = DeleteButtonClick
    end
    object RefreshAction: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ShortCut = 116
      OnExecute = RefreshButtonClick
    end
    object ExitAction: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076
      ShortCut = 27
      OnExecute = ExitButtonClick
    end
    object Filtration: TAction
      Caption = 'Filtration'
      ShortCut = 16497
      OnExecute = Filter_ButtonClick
    end
    object SearchAction: TAction
      Caption = 'SearchAction'
      ShortCut = 16454
      OnExecute = SearchActionExecute
    end
    object Spy_Action: TAction
      Caption = 'Action'
      ShortCut = 16461
      OnExecute = Spy_ActionExecute
    end
    object Subcidy_EditAction: TAction
      Caption = 'Subcidy_EditAction'
      ShortCut = 16467
      OnExecute = Subcidy_EditActionExecute
    end
    object Lgots_EditAction: TAction
      Caption = 'Lgots_EditAction'
      ShortCut = 16460
      OnExecute = Lgots_EditActionExecute
    end
    object ApostrofAdd: TAction
      Caption = 'ApostrofAdd'
      ShortCut = 16606
      OnExecute = ApostrofAddExecute
    end
    object Act_help: TAction
      Caption = 'Act_help'
      ShortCut = 112
      OnExecute = Act_helpExecute
    end
  end
  object WriteProc: TpFIBStoredProc
    Database = DataModule1.DB
    Transaction = DataModule1.WriteTransaction
    Left = 40
    Top = 192
  end
  object dxBarManager1: TdxBarManager
    AllowReset = False
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
        Caption = #1055#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074' ('#1043#1083#1072#1074#1085#1072#1103' '#1087#1072#1085#1077#1083#1100')'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 278
        FloatTop = 286
        FloatClientWidth = 66
        FloatClientHeight = 220
        ItemLinks = <
          item
            Item = AddButton
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = EditButton
            Visible = True
          end
          item
            Item = DeleteButton
            Visible = True
          end
          item
            Item = ViewButton
            Visible = True
          end
          item
            Item = RefreshButton
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = PrintButton
            Visible = True
          end
          item
            Item = PayButton
            Visible = True
          end
          item
            Item = Propiska_LargeButton
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end
          item
            Item = Prikaz_BarLargeButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = Filter_Btn
            Visible = True
          end
          item
            Item = Inc_Button
            Visible = True
          end
          item
            BeginGroup = True
            Item = Electorat_Button
            Visible = True
          end
          item
            Item = ExitButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButton5
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = False
          end>
        Name = #1055#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = #1055#1072#1085#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 46
        DockingStyle = dsTop
        FloatLeft = 292
        FloatTop = 262
        FloatClientWidth = 39
        FloatClientHeight = 38
        ItemLinks = <
          item
            Item = dxBarStatic4
            Visible = True
          end>
        Name = #1055#1072#1085#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 1
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        BorderStyle = bbsNone
        Caption = #1055#1072#1085#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 71
        DockingStyle = dsTop
        FloatLeft = 268
        FloatTop = 262
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarStatic3
            Visible = True
          end>
        Name = #1055#1072#1085#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 2
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    ButtonArrowWidth = 13
    CanCustomize = False
    Categories.Strings = (
      #1057#1090#1072#1085#1076#1072#1088#1090#1085#1099#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
      'PopupMenu1'
      'Edit_PopupMenu'
      'Electorat')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    Images = PopupImageList
    DisabledLargeImages = DisabledLargeImages
    LargeImages = LargeImages
    LookAndFeel.Kind = lfUltraFlat
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    StretchGlyphs = False
    Style = bmsFlat
    UseSystemFont = True
    Left = 256
    Top = 192
    DockControlHeights = (
      0
      0
      96
      0)
    object AddButton: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      ImageIndex = 0
      ShortCut = 45
      OnClick = AddButton1Click
      AutoGrayScale = False
    end
    object EditButton: TdxBarLargeButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = Edit_PopupMenu
      ImageIndex = 1
      ShortCut = 113
      OnClick = EditButtonClick
      AutoGrayScale = False
    end
    object DeleteButton: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      ImageIndex = 2
      ShortCut = 46
      OnClick = DeleteButtonClick
      AutoGrayScale = False
    end
    object RefreshButton: TdxBarLargeButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      Visible = ivAlways
      ImageIndex = 3
      ShortCut = 116
      OnClick = RefreshButtonClick
      AutoGrayScale = False
    end
    object ExitButton: TdxBarLargeButton
      Caption = '  '#1042#1099#1093#1086#1076'  '
      Category = 0
      Hint = '  '#1042#1099#1093#1086#1076'  '
      Visible = ivAlways
      ImageIndex = 5
      ShortCut = 27
      OnClick = ExitButtonClick
      AutoGrayScale = False
    end
    object dxBarButton1: TdxBarButton
      Caption = #1055#1086' '#1085#1072#1080#1084'.'
      Category = 0
      Hint = #1055#1086' '#1085#1072#1080#1084'.'
      Visible = ivAlways
      ImageIndex = 7
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton2: TdxBarButton
      Caption = #1055#1086' '#1085#1086#1084#1077#1088#1091
      Category = 0
      Hint = #1055#1086' '#1085#1086#1084#1077#1088#1091
      Visible = ivAlways
      ImageIndex = 8
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1055#1086' '#1080#1076'.'#1082#1086#1076#1091
      Category = 0
      Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1080#1076'.'#1082#1086#1076#1091
      Visible = ivAlways
      ImageIndex = 8
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1055#1086' '#1060'.'#1048'.'#1054'.'
      Category = 0
      Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1060'.'#1048'.'#1054'.'
      Visible = ivAlways
      ImageIndex = 7
      OnClick = dxBarLargeButton2Click
      AutoGrayScale = False
    end
    object Filter_BarEdit1: TdxBarEdit
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      Category = 0
      Hint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1080#1083#1080' '#1095#1072#1089#1090#1100' '#1092#1072#1084#1080#1083#1080#1080' '#1083#1080#1073#1086' '#1080#1076'.'#1082#1086#1076#1072
      Visible = ivNever
      OnEnter = Filter_BarEdit1Enter
      OnExit = Filter_BarEdit1Exit
      OnKeyDown = Filter_BarEdit1KeyDown
      ReadOnly = True
      ShowCaption = True
      Width = 100
    end
    object dxBarButton5: TdxBarButton
      Align = iaRight
      Caption = #1060
      Category = 0
      Hint = #1053#1072#1078#1084#1080#1090#1077' '#1076#1083#1103' '#1074#1099#1074#1086#1076#1072' '#1087#1072#1085#1077#1083#1080' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080
      Visible = ivAlways
      ButtonStyle = bsChecked
      Glyph.Data = {
        AA030000424DAA03000000000000360000002800000011000000110000000100
        1800000000007403000000000000000000000000000000000000C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C4C4C4D7D5D3E8E7E1E8E6E3C9C8C9D1CFCDDAD8
        D6C1C1C2C5C4C4C6C6C6C6C6C600C6C6C6C6C6C6C6C6C6C6C6C6C4C4C4C2C2C2
        CAC9C99DA2A6616371575A60C0BFBEADB2B4969C9DD3D2D1C7C7C7C5C5C5C6C6
        C600C6C6C6C6C6C6C6C6C6C4C4C4CECECCD8D6D4C7CACD6444298B55004E2400
        29333A593A2C27060141464CC8C8C7C7C7C7C5C5C500C6C6C6C6C6C6C4C4C4D4
        D3D295989D6A6C71959DA9A36922FFF503F9B50B421003C18402F4C006361100
        454A4ED6D4D3C3C3C300C6C6C6C4C4C4CFCECC949AA35D3C19522F04281212C1
        8E12FAB300FB8D00FEBD08FDE502FFC400E97A060A0001999E9ED2D1D100C6C6
        C6C5C4C4C7CBCE796150EBAC04FFC70EEAA80EFFD701FA9F00FA8C00FDA500FA
        A600FB8E00F892078443040F1115B8B8B700C6C6C6C5C4C3D1D5DBBF9F7BFBA9
        00FC9C00FFAD00FA9E00FF9E01FF9D04FC9505FF9600FD9100FAAD00FFB6054D
        190070777D00C3C3C3CCCBCA7B7F83404145DA8617FDA100FB9B00FFA50EB779
        1D93774AA39273C5A45FFAAB1EF99A00FFA9057130016B737C00CDCBC9B8BBBF
        7E562AB86410F5860CFCA800F7A70E6F4B20747981B8BDC3CACEDB8D8E73F5D2
        4FFEB30FA45304282225C1C2C100D2CFCCABB3BAC47A31FF8900F99500FFBD06
        7C4B126E7581DFDEDAE0DDD88D8F9B8D8030FFEB60F9B714DD7D04261611AFB2
        B300D0CECAAFB5BEC28432FEC100FDC700EBA1091D1416AAAFB2BCBDBF737983
        524623EAC446F3C64EFFC60CC87600473A39C8CBCB00C7C6C4C3C6CAA99168E4
        9B2DFCBB04EFAC0F613D1C2C26153E331E6E4D16DC9F39E4A54AF5B7298B550E
        655758B0B3B3CCCBCB00C3C3C2CDCCCCA3AAAADB7121FDA900FBD300E68B2CC7
        7231CC7730E2883BDD8C38FEC31FFFC10C230C07A5AEB2D5D3D2C2C3C300C5C5
        C4CACAC9B2B3B9CE9A34FFD306F5CB12F3C403ECA615EA9F1DE7AC18ECB41AB3
        811B9163196C6663C7C7C7C4C4C4C6C6C600C6C6C6C5C5C4C6C8CCB7AE9A8B79
        54B27538FFE000E4C30FCEA217FFE00967430D696D81B1B3BAC8CACBC8C8C8C5
        C5C6C6C6C600C6C6C6C6C6C6C6C6C5C7C8CABDC3CFB6A68AB6994768574A9081
        7F927558858487CECECCCECDCBC5C4C4C5C5C5C6C6C6C6C6C600C6C6C6C6C6C6
        C6C6C6C6C5C5C8C7C5C5C7CBB7B9C6C2C5C7CDCFCFC3C7CDD1D1D1C5C5C5C5C5
        C5C6C6C6C6C6C6C6C6C6C6C6C600}
      OnClick = dxBarButton5Click
    end
    object dxBarDateCombo1: TdxBarDateCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Text = #1042#1090' 08.03.2005'
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
      DateOnStart = bdsCustom
    end
    object dxBarDateCombo2: TdxBarDateCombo
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
      DateOnStart = bdsNullDate
    end
    object dxBarStatic1: TdxBarStatic
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      Category = 0
      Hint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      Visible = ivAlways
      Height = 19
    end
    object dxBarStatic2: TdxBarStatic
      Caption = 'C'
      Category = 0
      Hint = 'C'
      Visible = ivAlways
    end
    object dxBarStatic3: TdxBarStatic
      Caption = #1060#1080#1083#1100#1090#1088'   '#1057
      Category = 0
      Hint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1091' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      Visible = ivAlways
      Height = 25
    end
    object dxBarButton3: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarStatic4: TdxBarStatic
      Caption = #1060#1080#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1092#1072#1084#1080#1083#1080#1080'\'#1085#1072#1083#1086#1075#1086#1074#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
      Visible = ivAlways
      Height = 25
    end
    object dxBarButton4: TdxBarButton
      Action = AddAction
      Category = 1
      ImageIndex = 0
      ShortCut = 45
    end
    object PayButton: TdxBarLargeButton
      Caption = ' '#1054#1087#1083#1072#1090#1072' '
      Category = 0
      Hint = ' '#1054#1087#1083#1072#1090#1072' | '#1056#1072#1089#1089#1095#1077#1090' '#1082#1072#1083#1100#1082#1091#1083#1103#1094#1080#1080' '#1082' '#1086#1087#1083#1072#1090#1077
      Visible = ivAlways
      ImageIndex = 10
      ShortCut = 117
      OnClick = PayButtonClick
      AutoGrayScale = False
    end
    object dxBarButton6: TdxBarButton
      Action = EditAction
      Category = 1
      ImageIndex = 1
    end
    object dxBarButton7: TdxBarButton
      Action = DeleteAction
      Category = 1
      ImageIndex = 2
    end
    object dxBarButton8: TdxBarButton
      Action = RefreshAction
      Category = 1
      ImageIndex = 3
    end
    object N3: TdxBarButton
      Caption = #1050#1086#1085#1090#1077#1082#1089#1090#1085#1099#1081' '#1087#1086#1080#1089#1082
      Category = 1
      Hint = #1042#1082#1083'/'#1074#1099#1082#1083' '#1082#1086#1085#1090#1077#1082#1089#1090#1085#1099#1081' '#1087#1086#1080#1089#1082' '#1087#1086' '#1060#1048#1054
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object dxBarStatic5: TdxBarStatic
      Caption = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      Category = 0
      Hint = #1060#1080#1083#1100#1090#1088#1072#1094#1080#1103
      Visible = ivAlways
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = #1053#1072#1088#1091#1096#1077#1085#1080#1103
      Category = 0
      Hint = #1053#1072#1088#1091#1096#1077#1085#1080#1103
      Visible = ivAlways
      ImageIndex = 11
      ShortCut = 16503
      OnClick = dxBarLargeButton4Click
      AutoGrayScale = False
    end
    object PrintButton: TdxBarLargeButton
      Caption = '  '#1055#1077#1095#1072#1090#1100'  '
      Category = 0
      Hint = '  '#1055#1077#1095#1072#1090#1100'  '
      Visible = ivAlways
      ImageIndex = 12
      ShortCut = 16464
      OnClick = PrintButtonClick
      AutoGrayScale = False
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object Propiska_LargeButton: TdxBarLargeButton
      Caption = #1055#1088#1086#1087#1080#1089#1082#1072
      Category = 0
      Hint = #1055#1088#1086#1087#1080#1089#1082#1072
      Visible = ivAlways
      ImageIndex = 13
      ShortCut = 120
      OnClick = Propiska_LargeButtonClick
      AutoGrayScale = False
    end
    object dxBarButton9: TdxBarButton
      Action = ExitAction
      Category = 1
      ImageIndex = 4
    end
    object calc: TdxBarButton
      Caption = #1054#1087#1083#1072#1090#1072
      Category = 1
      Hint = #1054#1087#1083#1072#1090#1072
      Visible = ivAlways
      ImageIndex = 9
      ShortCut = 117
      OnClick = calcClick
    end
    object Propi: TdxBarButton
      Caption = #1055#1088#1086#1087#1080#1089#1082#1072
      Category = 1
      Hint = #1055#1088#1086#1087#1080#1089#1082#1072
      Visible = ivAlways
      ImageIndex = 10
      ShortCut = 120
      OnClick = PropiClick
    end
    object Narush: TdxBarButton
      Caption = #1053#1072#1088#1091#1096#1077#1085#1080#1103
      Category = 1
      Hint = #1053#1072#1088#1091#1096#1077#1085#1080#1103
      Visible = ivAlways
      ImageIndex = 11
      ShortCut = 16503
      OnClick = NarushClick
    end
    object print: TdxBarButton
      Caption = #1055#1077#1095#1072#1090#1100
      Category = 1
      Hint = #1055#1077#1095#1072#1090#1100
      Visible = ivAlways
      ImageIndex = 12
      ShortCut = 16464
      OnClick = printClick
    end
    object Prikaz_BarLargeButton: TdxBarLargeButton
      Caption = #1055#1088#1080#1082#1072#1079#1099
      Category = 0
      Hint = #1055#1088#1080#1082#1072#1079#1099
      Visible = ivAlways
      ImageIndex = 14
      ShortCut = 119
      OnClick = Prikaz_BarLargeButtonClick
      AutoGrayScale = False
    end
    object Subsidy_Modify: TdxBarButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1091#1073#1089#1080#1076#1080#1080
      Category = 2
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1091#1073#1089#1080#1076#1080#1080
      Visible = ivAlways
      ImageIndex = 13
      ShortCut = 16467
      OnClick = Subsidy_ModifyClick
    end
    object Lgots_Modify: TdxBarButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1083#1100#1075#1086#1090#1099
      Category = 2
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1083#1100#1075#1086#1090#1099
      Visible = ivAlways
      ImageIndex = 13
      ShortCut = 16460
      OnClick = Lgots_ModifyClick
    end
    object SpyMonitor: TdxBarButton
      Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1079#1072#1087#1080#1089#1080
      Category = 1
      Hint = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1079#1072#1087#1080#1089#1080
      Visible = ivAlways
      ImageIndex = 15
      ShortCut = 16461
      OnClick = SpyMonitorClick
    end
    object ViewButton: TdxBarLargeButton
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Category = 0
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088
      Visible = ivAlways
      ImageIndex = 15
      ShortCut = 114
      OnClick = ViewButtonClick
      AutoGrayScale = False
    end
    object Electorat_Button: TdxBarLargeButton
      Caption = 'Electorat'
      Category = 0
      Hint = 'Electorat'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = Electorat_Menu
      ImageIndex = 16
      OnClick = Electorat_ButtonClick
      AutoGrayScale = False
    end
    object AddToElectorat: TdxBarButton
      Caption = 'AddToElectorat'
      Category = 3
      Hint = 'AddToElectorat'
      Visible = ivAlways
      ImageIndex = 17
      OnClick = AddToElectoratClick
    end
    object DelFromElectorat: TdxBarButton
      Caption = 'DelFromElectorat'
      Category = 3
      Hint = 'DelFromElectorat'
      Visible = ivAlways
      ImageIndex = 16
      OnClick = DelFromElectoratClick
    end
    object Filter_Btn: TdxBarLargeButton
      Caption = 'Filter'
      Category = 0
      Hint = 'Filter'
      Visible = ivAlways
      ImageIndex = 17
      OnClick = Filter_BtnClick
      AutoGrayScale = False
    end
    object Inc_Button: TdxBarLargeButton
      Caption = 'Inc'
      Category = 0
      Hint = 'Inc'
      Visible = ivAlways
      ButtonStyle = bsChecked
      ImageIndex = 7
      OnClick = Inc_ButtonClick
      AutoGrayScale = False
    end
  end
  object DisabledLargeImages: TImageList
    Height = 24
    Width = 24
    Left = 535
    Top = 144
    Bitmap = {
      494C010109000E00040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000000000000000A5A5A500A4A4A400A2A2A2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A7A7A700ACACAC00CDCDCD00AEAEAE00ABAB
      AB009F9F9F009D9D9D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A8A8A800BBBBBB00F1F1F100F5F5F500E7E7E700E3E3
      E300CFCFCF00ADADAD00A5A5A5009A9A9A009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AAAAAA00BCBCBC00F8F8F800FFFFFF00F7F7F700EBEBEB00E7E7
      E700E2E2E200DEDEDE00C0C0C000A7A7A700BCBCBC008D8D8D00959595009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ABABAB00D1D1D100F8F8F800FFFFFF00FFFFFF00F9F9F900EFEFEF00EBEB
      EB00E7E7E700E2E2E200C1C1C1009D9D9D009D9D9D009D9D9D00A3A3A300ABAB
      AB00A1A1A100919191008F8F8F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD00D2D2D200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00F3F3F300EFEF
      EF00EBEBEB00E6E6E600C2C2C2009D9D9D009D9D9D009D9D9D00AFAFAF00CDCD
      CD00CCCCCC00C2C2C2008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE00EDED
      ED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00F7F7F700F3F3
      F300EFEFEF00EBEBEB00C3C3C3009D9D9D009D9D9D009D9D9D00B2B2B200D1D1
      D100CDCDCD00CCCCCC008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0B0B000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFBFB00F7F7
      F700F3F3F300EFEFEF00C5C5C5009D9D9D009D9D9D009D9D9D00B6B6B600D5D5
      D500D1D1D100CDCDCD008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0B0B000CDCDCD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FBFB
      FB00F7F7F700F3F3F300C6C6C6009D9D9D009D9D9D009D9D9D00B9B9B900D9D9
      D900D5D5D500D1D1D1008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0B0B000CDCDCD00FFFF
      FF00FFFFFF00FFFFFF00F2F2F200FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFE
      FE00FBFBFB00F7F7F700C7C7C7009D9D9D009D9D9D009D9D9D00BCBCBC00DEDE
      DE00D9D9D900D5D5D5008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0B0B000CDCDCD00FFFF
      FF00FFFFFF00FFFFFF009A9A9A008989890089898900CCCCCC00FEFEFE00FEFE
      FE00FEFEFE00FBFBFB00C8C8C8009D9D9D009D9D9D009D9D9D00BFBFBF00E2E2
      E200DDDDDD00D9D9D9008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0B0B000CDCDCD00F2F2
      F200D9D9D900858585009F9F9F00AAAAAA009D9D9D0091919100CCCCCC00FEFE
      FE00FEFEFE00FEFEFE00FBFBFB00E2E2E200FFFFFF00E4E4E400CCCCCC00E6E6
      E600E1E1E100DDDDDD008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0B0B000CDCDCD009A9A
      9A008F8F8F00A9A9A900B5B5B500B4B4B400AAAAAA009D9D9D008F8F8F00CCCC
      CC00FEFEFE00FEFEFE00FEFEFE00FBFBFB00F7F7F700F2F2F200EEEEEE00EAEA
      EA00E6E6E600E1E1E1008E8E8E008B8B8B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0B0B000838383009B9B
      9B00B1B1B100B6B6B600B5B5B500B4B4B400B2B2B200AAAAAA009D9D9D008989
      8900CCCCCC00FEFEFE00FEFEFE00FEFEFE00FBFBFB00F6F6F600F2F2F200EEEE
      EE00EAEAEA00FCFCFC008B8B8B00919191000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000089898900A9A9A900B6B6
      B600B6B6B600B6B6B600B5B5B500B4B4B400B3B3B300B1B1B100A9A9A9009D9D
      9D0089898900CCCCCC00FEFEFE00FEFEFE00FEFEFE00FBFBFB00F6F6F600F2F2
      F200D1D1D1008383830097979700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F9F9F00B6B6B600B6B6
      B600B6B6B600B6B6B600B5B5B500B4B4B400B3B3B300B1B1B100B0B0B000A8A8
      A8009D9D9D0089898900CCCCCC00FEFEFE00FEFEFE00FEFEFE00E0E0E000A3A3
      A300858585009B9B9B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F9F9F00B1B1B100B6B6
      B600B6B6B600B6B6B600B5B5B500B4B4B400B3B3B300B1B1B100B0B0B000AFAF
      AF00A8A8A8009D9D9D0089898900CCCCCC00FEFEFE00BCBCBC008A8A8A008989
      89009D9D9D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009F9F9F00B1B1
      B100B6B6B600B6B6B600B5B5B500B4B4B400B3B3B300B1B1B100B0B0B000AFAF
      AF00AEAEAE00A7A7A7009D9D9D0089898900A4A4A4007D7D7D00919191009D9D
      9D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009F9F
      9F00B4B4B400B6B6B600B5B5B500B4B4B400B3B3B300B1B1B100B0B0B000B7B7
      B700AEAEAE00ADADAD00A6A6A6009D9D9D008B8B8B00939393009D9D9D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A3A3A300B4B4B400B5B5B500B4B4B400B3B3B300B1B1B100C1C1C100CECE
      CE00B0B0B000ADADAD00ACACAC00A6A6A6009D9D9D009D9D9D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A300B3B3B300B4B4B400B3B3B300B1B1B100C3C3C300CFCF
      CF00B4B4B400B0B0B000A8A8A8009F9F9F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A1A1A100B2B2B200B3B3B300B2B2B200C3C3C300CFCF
      CF00B6B6B600B3B3B300A6A6A600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A1A1A100B1B1B100B0B0B000B6B6B6009A9A
      9A00919191009F9F9F00A1A1A100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A3A3A300A3A3A300000000009A9A
      9A00939393009797970000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000767676000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940094949400848484008686
      8600767676000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BCBCBC009E9E
      9E00BEBEBE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009494940094949400949494009A9A9A009B9B
      9B009A9A9A009A9A9A0094949400949494009494940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009494940094949400979797008B8B8B0096969600999999008C8C
      8C00767676000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD009C9C9C007676
      760089898900BEBEBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094949400AEAEAE00BABABA00BCBCBC00BABABA00B7B7
      B700B2B2B200AFAFAF00AEAEAE00ABABAB00A5A5A50094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400949494008B8B8B00949494009C9C9C009B9B9B009A9A9A009A9A9A008C8C
      8C00767676009D9D9D0094949400949494009494940094949400949494009494
      94009494940094949400000000000000000000000000B0B0B0009F9F9F00AAAA
      AA00878787008A8A8A00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094949400CBCBCB00D4D4D400CECECE00C9C9C900C4C4C400BFBF
      BF00BABABA00B5B5B500B2B2B200B2B2B200B2B2B200AFAFAF00949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006565650000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400A0A0A000A2A2A200A1A1A100A0A0A0009F9F9F009E9E9E009D9D9D008D8D
      8D0076767600D0D0D000D2D2D200D5D5D500D8D8D800DBDBDB00DDDDDD00DFDF
      DF00DFDFDF0094949400000000000000000000000000B2B2B200BFBFBF00BABA
      BA00A9A9A9008585850089898900BEBEBE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097979700BBBBBB00D5D5D500D6D6D600D0D0D000CACACA00C6C6
      C600C1C1C100BEBEBE00B8B8B800B4B4B400B1B1B100A8A8A800949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000656565009494940065656500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400A6A6A600A5A5A500A4A4A400A3A3A300A2A2A200A1A1A100A0A0A0008F8F
      8F00767676009999990093939300939393009393930093939300939393009393
      9300DFDFDF009494940000000000000000000000000000000000B4B4B400C1C1
      C100BABABA00A9A9A900848484008C8C8C00BFBFBF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009494940094949400BEBEBE00C6C6C600C6C6C600B3B3
      B300AEAEAE00B8B8B800B4B4B400A9A9A9009494940094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000065656500969696008F8F8F009E9E9E00656565000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400A9A9A900A8A8A800A7A7A700A6A6A600A5A5A500A4A4A400A3A3A3009191
      9100767676009999990093939300939393009393930093939300939393009393
      9300DFDFDF00949494000000000000000000000000000000000000000000B4B4
      B400C1C1C100BABABA00A9A9A900848484008B8B8B00BEBEBE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940094949400ACACAC00A3A3
      A300A6A6A600A4A4A40094949400949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000065656500999999009B9B9B0095959500919191009D9D9D006565
      6500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400ACACAC00ACACAC00ABABAB00AAAAAA00A9A9A900A8A8A800A7A7A7009292
      9200767676009898980093939300939393009393930093939300939393009393
      9300DFDFDF009494940000000000000000000000000000000000000000000000
      0000B4B4B400C1C1C100BABABA00A8A8A800838383008F8F8F00BBBBBB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A9A9A00A8A8
      A800ABABAB009A9A9A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000656565008E8E8E00A9A9A900A2A2A2009C9C9C0096969600919191009B9B
      9B00656565000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400B0B0B000AFAFAF00AEAEAE00ADADAD00ACACAC00ABABAB00AAAAAA009494
      9400767676009898980093939300939393009393930093939300939393009393
      9300DFDFDF009494940000000000000000000000000000000000000000000000
      000000000000B5B5B500C1C1C100BABABA00A6A6A60083838300818181000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      94009494940094949400949494000000000000000000000000009A9A9A00A8A8
      A800AAAAAA009A9A9A0000000000000000000000000094949400949494009494
      9400949494000000000000000000000000000000000000000000000000006565
      65008B8B8B00B8B8B800B1B1B100AAAAAA0097979700656565009F9F9F009292
      92009A9A9A006565650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400B3B3B300B2B2B200B1B1B100B0B0B000AFAFAF00AEAEAE00ADADAD009696
      9600767676009898980093939300939393009393930093939300939393009393
      9300DFDFDF009494940000000000000000000000000000000000000000000000
      00000000000000000000B6B6B600C1C1C100B9B9B900AAAAAA00898989000000
      00000000000000000000A1A1A100A1A1A100A1A1A100A1A1A100A1A1A1000000
      000000000000000000000000000000000000000000009494940094949400B1B1
      B100ACACAC00A8A8A800A8A8A8009494940094949400000000009A9A9A00A8A8
      A800AAAAAA009A9A9A00000000009494940094949400B7B7B700B0B0B0009191
      91008A8A8A009494940094949400000000000000000000000000656565008787
      8700C6C6C600C0C0C000B9B9B900A3A3A3006565650000000000656565009999
      9900929292009999990065656500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400B6B6B600B5B5B500B4B4B400B3B3B300B7B7B700C9C9C900B1B1B1009797
      970076767600A6A6A60093939300939393009393930093939300939393009393
      9300DFDFDF009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000B6B6B600C6C6C600CACACA00B4B4B4007B7B
      7B0097979700A1A1A100D1D1D100F0F0F000F0F0F000EFEFEF00DADADA00A1A1
      A100A1A1A10000000000000000000000000094949400B1B1B100BABABA00B4B4
      B400AFAFAF00ABABAB00A8A8A800A9A9A900A9A9A900949494009A9A9A00ABAB
      AB00ABABAB009A9A9A0094949400BABABA00BABABA0094949400858585008787
      8700888888008A8A8A008E8E8E0094949400000000000000000065656500CFCF
      CF00CCCCCC00C7C7C700ABABAB00656565000000000000000000000000006565
      6500828282009494940098989800656565000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400BABABA00B9B9B900B8B8B800B7B7B700D5D5D500FFFFFF00D0D0D0009999
      990076767600DFDFDF00DDDDDD00B8B8B800B8B8B800ABABAB00ABABAB00ABAB
      AB00DFDFDF009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00AAAA
      AA00BDBDBD00EEEEEE00EEEEEE00EDEDED00ECECEC00EDEDED00EEEEEE00F4F4
      F400CACACA00A1A1A100000000000000000094949400CCCCCC00CECECE00C8C8
      C800C2C2C200BCBCBC00B5B5B500B1B1B100AFAFAF00949494009A9A9A00AEAE
      AE00ADADAD009A9A9A00BFBFBF00C6C6C6009C9C9C008181810088888800AAAA
      AA00A6A6A600888888008F8F8F0094949400000000000000000065656500A2A2
      A200D1D1D100AEAEAE0065656500000000000000000000000000000000000000
      0000000000006565650095959500979797006565650000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400BDBDBD00BCBCBC00BBBBBB00BABABA00D8D8D800FFFFFF00CDCDCD009B9B
      9B0076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00E2E2E200E2E2
      E200DFDFDF009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A2A2A200C1C1
      C100E0E0E000E2E2E200ECECEC00ECECEC00ECECEC00EFEFEF00F1F1F100F7F7
      F700FFFFFF00D2D2D200A1A1A100000000000000000094949400ABABAB00ACAC
      AC00A8A8A800A6A6A600A2A2A200A1A1A100A2A2A200000000009A9A9A00B0B0
      B000B2B2B2009A9A9A000000000087878700888888008E8E8E00909090009E9E
      9E00A8A8A8009494940086868600969696000000000000000000000000006565
      6500BDBDBD006565650000000000000000000000000000000000000000000000
      0000000000000000000065656500969696009191910065656500000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400C0C0C000BFBFBF00BEBEBE00BDBDBD00BCBCBC00CCCCCC00BABABA009C9C
      9C0076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00DFDFDF009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1A1A100DCDC
      DC00CDCDCD00E0E0E000EDEDED00ECECEC00EEEEEE00F5F5F500FAFAFA00FDFD
      FD00FEFEFE00FEFEFE00A1A1A100000000000000000000000000949494000000
      0000000000000000000000000000000000009A9A9A00000000009A9A9A00B4B4
      B400B6B6B6009A9A9A00000000008282820096969600AEAEAE009F9F9F008B8B
      8B00969696008787870000000000000000000000000000000000000000000000
      0000656565000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000656565007676760091919100656565000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400C3C3C300C3C3C300C2C2C200C1C1C100C0C0C000BFBFBF00BEBEBE009E9E
      9E0076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00DFDFDF009494940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A100D0D0D000CDCD
      CD00C4C4C400E0E0E000EDEDED00ECECEC00EFEFEF00F7F7F700FEFEFE00FEFE
      FE00FAFAFA00F5F5F500CCCCCC00A1A1A1000000000000000000000000009797
      97000000000000000000000000009A9A9A0000000000000000009A9A9A00B7B7
      B700B9B9B9009A9A9A000000000000000000858585009B9B9B009C9C9C000000
      0000878787000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000065656500818181006565
      6500000000000000000000000000000000000000000000000000000000009494
      9400C7C7C700C6C6C600C5C5C500C4C4C400C3C3C300C2C2C200C1C1C100A0A0
      A00076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00DFDFDF009494940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A100DFDFDF00C4C4
      C400BFBFBF00D9D9D900EAEAEA00EDEDED00EFEFEF00F5F5F500FBFBFB00FBFB
      FB00F5F5F500EFEFEF00F1F1F100A1A1A1000000000000000000000000000000
      000092929200000000009494940000000000000000000000000093939300B8B8
      B800BCBCBC0093939300000000000000000000000000000000008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000656565007272
      7200656565000000000000000000000000000000000000000000000000009494
      9400CACACA00C9C9C900C8C8C800C7C7C700C6C6C600C5C5C500C4C4C400A1A1
      A10076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00DFDFDF009494940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A100DFDFDF00C3C3
      C300B9B9B900CDCDCD00E4E4E400EDEDED00EEEEEE00F0F0F000F3F3F300F4F4
      F400F0F0F000EEEEEE00F1F1F100A1A1A100000000000000000000000000A6A6
      A600ABABAB00A7A7A700A8A8A800A7A7A700A6A6A600A6A6A6009E9E9E00BEBE
      BE00C0C0C0009B9B9B009F9F9F00A0A0A000A0A0A0009F9F9F00A0A0A0009F9F
      9F009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000656565006565650000000000000000000000000000000000000000009494
      9400CCCCCC00CCCCCC00CBCBCB00CACACA00CACACA00C9C9C900C8C8C800A3A3
      A30076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00DFDFDF009494940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A100E1E1E100C9C9
      C900B5B5B500C2C2C200D5D5D500E6E6E600EDEDED00EEEEEE00EEEEEE00EEEE
      EE00EDEDED00ECECEC00F0F0F000A1A1A100000000000000000000000000A6A6
      A600B1B1B100ADADAD00ADADAD00ACACAC00AAAAAA00A9A9A900A0A0A000BFBF
      BF00C3C3C3009C9C9C00A2A2A200A0A0A000A0A0A000A0A0A000A0A0A000A0A0
      A0009D9D9D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000065656500000000000000000000000000000000009494
      9400CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CBCBCB00CBCBCB00A5A5
      A50076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00DFDFDF009494940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1A1A100D0D0D000D7D7
      D700C4C4C400C2C2C200C7C7C700D6D6D600E4E4E400ECECEC00EDEDED00EDED
      ED00EDEDED00EDEDED00CDCDCD00A1A1A1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093939300A3A3
      A300A5A5A5009393930000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400C7C7C700CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00A6A6
      A60076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00DFDFDF009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1A1A100E7E7
      E700E9E9E900DBDBDB00C8C8C800C6C6C600D0D0D000DDDDDD00E4E4E400E5E5
      E500E7E7E700EEEEEE00A1A1A100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094949400B5B5
      B500B1B1B1009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400949494009C9C9C00B4B4B400CCCCCC00CCCCCC00CCCCCC00CCCCCC00A6A6
      A60076767600D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEEEE00EEEE
      EE00DFDFDF009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1A1A100C9C9
      C900FFFFFF00F8F8F800DBDBDB00BFBFBF00B9B9B900C1C1C100CACACA00D4D4
      D400E2E2E200C5C5C500A1A1A100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400C3C3C300C4C4
      C400B8B8B800B2B2B20094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094949400949494009D9D9D00A1A1A100C2C2C200CCCCCC00A6A6
      A600767676009A9A9A0094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A1A1
      A100CCCCCC00FFFFFF00EBEBEB00CFCFCF00C4C4C400C7C7C700CFCFCF00DDDD
      DD00C3C3C300A1A1A10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094949400B7B7B700D3D3
      D300C8C8C800B0B0B00094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400949494008E8E8E009393
      9300767676000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A1A1A100A1A1A100CECECE00E2E2E200DFDFDF00E0E0E000D2D2D200A1A1
      A100A1A1A1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400767676000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A1A1A100A1A1A100A1A1A100A1A1A100A1A1A1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009090
      90009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009191
      9100DBDBDB00DFDFDF00DADADA00D6D6D600D3D3D300CFCFCF00CDCDCD00C9C9
      C900C5C5C500C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4
      C400C3C3C300979797000000000000000000919191009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E8E8E008E8E8E000000000000000000000000009F9F9F009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C00909090000000000000000000000000000000000000000000000000009191
      9100DDDDDD00E0E0E000DBDBDB00D8D8D800D4D4D400D1D1D100CECECE00CBCB
      CB00C7C7C700C4C4C400C2C2C200C2C2C200C2C2C200C2C2C200C2C2C200C3C3
      C300C1C1C10097979700000000000000000091919100DDDDDD00E0E0E000DBDB
      DB00D5D5D500CECECE00C8C8C800C4C4C400C3C3C300C3C3C300C3C3C300C1C1
      C100C2C2C200C2C2C200C2C2C200C2C2C200C3C3C300C1C1C100979797000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008E8E8E008E8E8E008E8E8E00000000000000000000000000A0A0A000E3E3
      E300E7E7E700E2E2E200DFDFDF00DCDCDC00D8D8D800D6D6D600D3D3D300CFCF
      CF00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CDCD
      CD00909090000000000000000000000000000000000000000000000000009191
      9100E0E0E000E3E3E300DEDEDE00DBDBDB00D8D8D800D5D5D500D1D1D100CECE
      CE00CBCBCB00C8C8C800C4C4C400C2C2C200C2C2C200C2C2C200C2C2C200C3C3
      C300C1C1C10097979700000000000000000091919100E0E0E000E2E2E200DDDD
      DD00D6D6D600CECECE00C5C5C500C0C0C000B4B4B400B9B9B900BDBDBD00BEBE
      BE00BFBFBF00C1C1C100C2C2C200C2C2C200C3C3C300C1C1C100979797000000
      00000000000000000000000000000000000000000000000000008E8E8E008E8E
      8E008E8E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008E8E
      8E008E8E8E008E8E8E0000000000000000000000000000000000A0A0A000E5E5
      E500E8E8E800E3E3E300E0E0E000DDDDDD00DADADA00D7D7D700D5D5D500D1D1
      D100CECECE00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CDCDCD00CCCC
      CC00909090000000000000000000000000000000000000000000000000009191
      9100E2E2E200E6E6E600E1E1E100DEDEDE00DBDBDB00D8D8D800D4D4D400D1D1
      D100CDCDCD00CBCBCB00C8C8C800C3C3C300C2C2C200C2C2C200C2C2C200C3C3
      C300C1C1C10097979700000000000000000091919100E2E2E200E5E5E500DFDF
      DF00D7D7D70065656500808080008F8F8F0099999900A0A0A000A8A8A800B0B0
      B000B5B5B500BCBCBC00C0C0C000C1C1C100C3C3C300C1C1C100979797000000
      00000000000000000000000000000000000000000000000000008E8E8E008E8E
      8E008E8E8E008E8E8E0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E8E8E008E8E8E008E8E
      8E008E8E8E000000000000000000000000000000000000000000A0A0A000E8E8
      E800EAEAEA00E6E6E600E3E3E300E0E0E000DEDEDE00DADADA00D7D7D700D5D5
      D500D2D2D200CECECE00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CDCDCD00CCCC
      CC00909090000000000000000000000000000000000000000000000000009292
      9200E6E6E600EAEAEA00E5E5E500E1E1E100DEDEDE00DBDBDB00D3D3D300C4C4
      C400BDBDBD00BABABA00BCBCBC00C3C3C300C4C4C400C2C2C200C2C2C200C3C3
      C300C1C1C10097979700000000000000000092929200E6E6E600E9E9E900E4E4
      E400DADADA007F7F7F00636363006969690083838300868686008C8C8C009696
      9600A2A2A200AEAEAE00B8B8B800BFBFBF00C1C1C100C1C1C100979797000000
      00000000000000000000000000000000000000000000000000008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8E008E8E8E008E8E8E008E8E
      8E00000000000000000000000000000000000000000000000000A0A0A000E9E9
      E900EDEDED00E8E8E800E6E6E600A9A9A900E0E0E000DDDDDD00B7B7B700A9A9
      A900A9A9A900A9A9A900ABABAB00CCCCCC00CCCCCC00CCCCCC00CDCDCD00CCCC
      CC00909090000000000000000000000000000000000000000000000000009292
      9200E9E9E900EDEDED00E8E8E800E4E4E400E1E1E100DEDEDE00CBCBCB00A8A8
      A8009595950093939300A0A0A000BCBCBC00C8C8C800C3C3C300C2C2C200C3C3
      C300C1C1C10097979700000000000000000092929200E9E9E900EDEDED00E8E8
      E800E2E2E200BEBEBE0072727200888888007C7C7C0070707000888888007B7B
      7B008787870098989800A7A7A700B4B4B400BDBDBD00BFBFBF00979797000000
      0000000000000000000000000000000000000000000000000000000000008E8E
      8E008E8E8E008E8E8E008E8E8E008E8E8E000000000000000000000000000000
      00000000000000000000000000008E8E8E008E8E8E008E8E8E008E8E8E000000
      0000000000000000000000000000000000000000000000000000A1A1A100EDED
      ED00F1F1F100ECECEC00E8E8E800A9A9A900A9A9A900BDBDBD00A9A9A900B7B7
      B700D7D7D700B1B1B100A9A9A900ACACAC00CCCCCC00CCCCCC00CDCDCD00CCCC
      CC00909090000000000000000000000000000000000000000000000000009595
      9500ECECEC00F0F0F000EBEBEB00E7E7E700E4E4E400E1E1E100838383008383
      8300838383008383830093939300BABABA00CBCBCB00C8C8C800C3C3C300C3C3
      C300C1C1C10097979700000000000000000095959500ECECEC00F0F0F000EBEB
      EB00E6E6E600DEDEDE00787878008888880088888800878787007B7B7B006363
      6300707070007E7E7E0090909000A0A0A000B0B0B000B9B9B900959595000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009B9B9B008E8E8E008E8E8E008E8E8E008E8E8E0000000000000000000000
      000000000000000000008E8E8E008E8E8E008E8E8E008E8E8E00000000000000
      0000000000000000000000000000000000000000000000000000A1A1A100F0F0
      F000F3F3F300EFEFEF00EBEBEB00A9A9A900A9A9A900A9A9A900BDBDBD00DDDD
      DD00DADADA00D7D7D700B1B1B100A9A9A900CDCDCD00CCCCCC00CDCDCD00CCCC
      CC00909090000000000000000000000000000000000000000000000000009898
      9800EFEFEF00F4F4F400EFEFEF00E5E5E500D7D7D700CFCFCF0083838300A9A9
      A900A7A7A7008383830090909000ACACAC00BABABA00BBBBBB00C2C2C200C4C4
      C400C1C1C10097979700000000000000000098989800EFEFEF00F4F4F400EFEF
      EF00EBEBEB00E6E6E600ADADAD00808080006464640092929200A2A2A2009191
      9100696969006C6C6C00787878008888880099999900A8A8A800909090000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E8E8E008E8E8E008E8E8E008E8E8E00000000000000
      00008E8E8E008E8E8E008E8E8E008E8E8E008E8E8E0000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A4A400F2F2
      F200F6F6F600F1F1F100EEEEEE00A9A9A900A9A9A900A9A9A900A9A9A900DFDF
      DF00DDDDDD00DADADA00D7D7D700A9A9A900D2D2D200CDCDCD00CDCDCD00CCCC
      CC00909090000000000000000000000000000000000000000000000000009B9B
      9B00F3F3F300F7F7F700F2F2F200DCDCDC00B6B6B600A3A3A30083838300B0B0
      B000ACACAC0083838300878787008F8F8F00939393009F9F9F00BBBBBB00C7C7
      C700C2C2C2009797970000000000000000009B9B9B00F3F3F300F7F7F700F2F2
      F200EEEEEE00EBEBEB00E4E4E400555555008C8C8C00BEBEBE00B0B0B000A2A2
      A20091919100696969006B6B6B0073737300808080008F8F8F00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E8E8E008E8E8E008E8E8E008E8E8E008E8E
      8E008E8E8E008E8E8E008E8E8E008E8E8E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7A7A700F5F5
      F500FAFAFA00F5F5F500F1F1F100A9A9A900A9A9A900A9A9A900A9A9A900A9A9
      A900E0E0E000DEDEDE00D9D9D900D7D7D700D4D4D400D1D1D100CECECE00CCCC
      CC00909090000000000000000000000000000000000000000000000000009E9E
      9E00F7F7F700FBFBFB00F6F6F60083838300838383008383830083838300B7B7
      B700B3B3B3008383830083838300838383008383830092929200B9B9B900CBCB
      CB00C6C6C6009797970000000000000000009E9E9E00F7F7F700FBFBFB00F6F6
      F600F2F2F200EFEFEF00EAEAEA008B8B8B0099999900CBCBCB00BDBDBD00AFAF
      AF00A1A1A1008D8D8D0061616100696969006F6F6F007B7B7B00767676000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8E008E8E8E009B9B9B008E8E
      8E009B9B9B008E8E8E008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A9A9A900F9F9
      F900FAFAFA00F8F8F800F4F4F400F1F1F100EFEFEF00EBEBEB00E8E8E800E5E5
      E500E2E2E200E0E0E000DDDDDD00DADADA00D6D6D600D4D4D400D1D1D100CCCC
      CC0090909000000000000000000000000000000000000000000000000000A0A0
      A000F9F9F900FEFEFE00FAFAFA0083838300CFCFCF00CACACA00C4C4C400C0C0
      C000BBBBBB00B6B6B600B2B2B200AEAEAE008383830095959500BDBDBD00CECE
      CE00C9C9C900989898000000000000000000A0A0A000F9F9F900FEFEFE00FAFA
      FA00F5F5F500F2F2F200EEEEEE00E9E9E9007F7F7F00D0D0D000CACACA00BCBC
      BC00AFAFAF00A1A1A1008A8A8A00616161006969690071717100696969000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E8E8E008E8E8E008E8E
      8E009B9B9B008E8E8E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ACACAC00FAFA
      FA00FAFAFA00FAFAFA00F8F8F800F5F5F500F1F1F100EFEFEF00EBEBEB00A9A9
      A900A9A9A900A9A9A900A9A9A900A9A9A900D9D9D900D6D6D600D5D5D500D0D0
      D00090909000000000000000000000000000000000000000000000000000A3A3
      A300F9F9F900FFFFFF00FDFDFD0083838300D6D6D600D2D2D200CDCDCD00C9C9
      C900C3C3C300BEBEBE00BABABA00B6B6B60083838300A7A7A700C4C4C400D1D1
      D100CCCCCC00999999000000000000000000A3A3A300F9F9F900FFFFFF00FDFD
      FD00F9F9F900F5F5F500F2F2F200EEEEEE00D9D9D9007F7F7F00CFCFCF00CACA
      CA00BCBCBC00AEAEAE00A0A0A0008A8A8A00616161006C6C6C00626262000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8E008E8E8E009B9B9B008E8E
      8E008E8E8E009B9B9B009B9B9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00A9A9A900F4F4F400F1F1F100EFEFEF00ECEC
      EC00A9A9A900A9A9A900A9A9A900A9A9A900DDDDDD00DADADA00D7D7D700D3D3
      D30090909000000000000000000000000000000000000000000000000000A6A6
      A600F9F9F900FFFFFF00FFFFFF0083838300838383008383830083838300D1D1
      D100CCCCCC0083838300838383008383830083838300CACACA00D2D2D200D5D5
      D500CFCFCF00989898000000000000000000A6A6A600F9F9F900FFFFFF00FFFF
      FF00FDFDFD00F9F9F900F6F6F600F2F2F200EFEFEF00D9D9D90077777700CFCF
      CF00C9C9C900BBBBBB00AEAEAE00A0A0A00089898900646464005E5E5E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E8E8E008E8E8E009B9B9B008E8E8E009B9B
      9B009B9B9B009B9B9B008E8E8E009B9B9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B1B1B100FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00A9A9A900D6D6D600F4F4F400F1F1F100EEEE
      EE00C9C9C900A9A9A900A9A9A900A9A9A900DFDFDF00DDDDDD00DADADA00D6D6
      D60090909000000000000000000000000000000000000000000000000000A9A9
      A900F9F9F900FFFFFF00FFFFFF00FFFFFF00FDFDFD00F9F9F90083838300D8D8
      D800D4D4D40083838300A2A2A200CECECE00E0E0E000DDDDDD00DADADA00D6D6
      D600C0C0C0008E8E8E000000000000000000A9A9A900F9F9F900FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00F9F9F900F5F5F500F2F2F200EEEEEE00BABABA007777
      7700CECECE00C9C9C900BBBBBB00ADADAD009F9F9F0089898900616161000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009B9B9B009B9B9B009B9B9B008E8E8E009B9B9B000000
      0000000000009B9B9B009B9B9B009B9B9B009B9B9B0000000000000000000000
      0000000000000000000000000000000000000000000000000000B3B3B300FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00DCDCDC00A9A9A900D6D6D600F5F5F500CECE
      CE00A9A9A900C9C9C900A9A9A900A9A9A900E2E2E200DFDFDF00DEDEDE00D8D8
      D80090909000000000000000000000000000000000000000000000000000ABAB
      AB00F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD0083838300DFDF
      DF00DBDBDB0083838300B6B6B600D6D6D600E4E4E400E1E1E100D5D5D500BEBE
      BE00A6A6A6008A8A8A000000000000000000ABABAB00F9F9F900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00F9F9F900F5F5F500F2F2F200EEEEEE00BABA
      BA0077777700CECECE00C8C8C800BABABA00ADADAD009F9F9F00888888007171
      7100000000000000000000000000000000000000000000000000000000000000
      0000000000009B9B9B009B9B9B008E8E8E009B9B9B009B9B9B00000000000000
      000000000000000000009B9B9B009B9B9B009B9B9B009B9B9B00000000000000
      0000000000000000000000000000000000000000000000000000B6B6B600FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00DCDCDC00A9A9A900A9A9A900A9A9
      A900CECECE00EEEEEE00EBEBEB00A9A9A900E5E5E500E2E2E200DFDFDF00CBCB
      CB0090909000000000000000000000000000000000000000000000000000AEAE
      AE00F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00838383008383
      83008383830083838300DCDCDC00E6E6E600EBEBEB00D8D8D800BBBBBB00AEAE
      AE00AAAAAA008D8D8D000000000000000000AEAEAE00F9F9F900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00F9F9F900F5F5F500F1F1F100EEEE
      EE00BBBBBB0091919100D6D6D600C8C8C800BABABA00ACACAC008F8F8F007575
      75006F6F6F000000000000000000000000000000000000000000000000000000
      00009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B0000000000000000000000
      0000000000000000000000000000000000009B9B9B009B9B9B009B9B9B000000
      0000000000000000000000000000000000000000000000000000B8B8B800FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00F8F8
      F800F4F4F400F1F1F100EEEEEE00EBEBEB00E8E8E800DEDEDE00C9C9C900B3B3
      B30090909000000000000000000000000000000000000000000000000000B1B1
      B100F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00F8F8F800F5F5F500F3F3F300DFDFDF009494940091919100909090009090
      900090909000909090000000000000000000B1B1B100F9F9F900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00F8F8F800F5F5F500F3F3
      F300DFDFDF008181810091919100D5D5D500C7C7C7007C7C7C007B7B7B008686
      8600858585007777770000000000000000000000000000000000000000009B9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B000000000000000000000000000000
      000000000000000000000000000000000000000000009B9B9B009B9B9B009B9B
      9B00000000000000000000000000000000000000000000000000BABABA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00F7F7F700F4F4F400F2F2F200F1F1F100E0E0E000C6C6C600BABABA00B7B7
      B70090909000000000000000000000000000000000000000000000000000B3B3
      B300FAFAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00F8F8F800F9F9F900D4D4D40094949400B4B4B400A7A7A7009E9E
      9E00949494009D9D9D000000000000000000B3B3B300FAFAFA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00F8F8F800F9F9
      F900D4D4D400949494009696960090909000B8B8B800787878008E8E8E008E8E
      8E0085858500676767005A5A5A000000000000000000000000009B9B9B009B9B
      9B009B9B9B009B9B9B009B9B9B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009B9B
      9B00000000000000000000000000000000000000000000000000BDBDBD00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00F9F9F900E7E7E700A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400000000000000000000000000000000000000000000000000B6B6
      B600FAFAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00FCFCFC00D8D8D80094949400BEBEBE00B0B0B000A4A4
      A4009D9D9D00000000000000000000000000B6B6B600FAFAFA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FCFC
      FC00D8D8D80094949400BEBEBE009494940086868600828282008E8E8E007D7D
      7D006767670068686800656565005A5A5A00000000009B9B9B009B9B9B009B9B
      9B009B9B9B009B9B9B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00DDDDDD00A4A4A400C0C0C000B4B4B400ACACAC00A3A3
      A300ABABAB00000000000000000000000000000000000000000000000000B6B6
      B600FAFAFA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DADADA0094949400BDBDBD00AFAFAF009D9D
      9D0000000000000000000000000000000000B6B6B600FAFAFA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DADADA0094949400BDBDBD00AFAFAF007B7B7B007D7D7D00898989006E6E
      6E0089898900797979007373730065656500000000009B9B9B009B9B9B009B9B
      9B009B9B9B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2C2C200FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00E0E0E000A4A4A400C9C9C900BCBCBC00B1B1B100ABAB
      AB0000000000000000000000000000000000000000000000000000000000B6B6
      B600FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E1E1E10094949400BEBEBE009D9D9D000000
      000000000000000000000000000000000000B6B6B600FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E1E1E10094949400BEBEBE009D9D9D000000000000000000777777008282
      8200ADADAD008A8A8A007474740061616100000000009B9B9B009B9B9B009B9B
      9B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2C2C200FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00E2E2E200A4A4A400C8C8C800BBBBBB00ABABAB000000
      000000000000000000000000000000000000000000000000000000000000AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00949494009D9D9D00000000000000
      000000000000000000000000000000000000AEAEAE00AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAEAE00AEAE
      AE00AEAEAE00949494009D9D9D00000000000000000000000000000000008A8A
      8A00C2C2C2009999990066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2C2C200FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00E8E8E800A4A4A400C9C9C900ABABAB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000878787007272720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BABABA00BABA
      BA00BABABA00BABABA00BABABA00BABABA00BABABA00BABABA00BABABA00BABA
      BA00BABABA00BABABA00BABABA00A4A4A400ABABAB0000000000000000000000
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
      00000000000000000000000000000000FF1FFF000000000000000000FE03FF00
      0000000000000000FC007F000000000000000000F8000F000000000000000000
      F00001000000000000000000E00001000000000000000000C000010000000000
      0000000080000100000000000000000080000100000000000000000080000100
      0000000000000000800001000000000000000000800001000000000000000000
      8000000000000000000000008000000000000000000000008000010000000000
      00000000800003000000000000000000800007000000000000000000C0000F00
      0000000000000000E0001F000000000000000000F0003F000000000000000000
      F800FF000000000000000000FC01FF000000000000000000FE01FF0000000000
      00000000FF23FF000000000000000000FFFFFFFFE7FFFFFFFFFFC3FFFFFFFFFF
      07FFC7FFFFFE007FFFFFFFF807FF83FFFFFC003FFFFFFFE0000381FFFFF8001F
      FF7FFFE0000380FFFFF8001FFE3FFFE00003C07FFFFC003FFC1FFFE00003E03F
      FFFF00FFF80FFFE00003F01FFFFFC3FFF007FFE00003F81FFFE1C387E003FFE0
      0003FC1C1F804201C041FFE00003FE0007000000C0E0FFE00003FFC003000000
      C1F87FE00003FFC001804200E3FC3FE00003FFC001DF4203F7FE1FE00003FF80
      00EEC317FFFF8FE00003FF8000F5C3DFFFFFC7E00003FF8000E00007FFFFF3E0
      0003FF8000E00007FFFFFDE00003FF8000FFC3FFFFFFFFE00003FFC001FFC3FF
      FFFFFFE00003FFC001FF81FFFFFFFFF80003FFE003FF81FFFFFFFFFF07FFFFF0
      07FFC3FFFFFFFFFFE7FFFFFC1FFFFFFFE00003FFFFFFFFFFFFFFFFFFE0000300
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
  object LargeImages: TImageList
    Height = 24
    Width = 24
    Left = 536
    Top = 192
    Bitmap = {
      494C010112001300040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000078000000010020000000000000B4
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000004B
      0000004B0000004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015D040028CC4F0045F6
      80002FD7510000810000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015D040028CC4F0045F6
      80002FD7510000810000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015D040028CC4F0045F6
      80002FD7510000810000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E0000811E0000E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015D040028CC4F0045F6
      7F002FD7510000810000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00F6E0C600811E0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00D5DD
      FE001D41FB00E9EDFE00FEFEFE00FEFEFE00811E0000E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015D040028CC4F0045F6
      80002FD7510000810000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000095666000F2E2
      D300FAEAD700F6E3CE00811E0000FEFEFE00FEFEFE00FEFEFE009AADFC00082A
      FA00011FFA00899EFC00FEFEFE00FEFEFE00811E0000E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015D040032A54B002EBB
      55001CA92F0014911000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00F7E7D400811E0000FEFEFE00FEFEFE005674FB00011FFA00011F
      FA00011FFA001135FA00FEFEFE00FEFEFE00811E0000E9BD8100EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000015D0400189D330023C5530019B6
      410011A72C000A9A190003810800004B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600F8EADC00811E0000E9EDFE001D41FB00011FFA00011FFA005674
      FB00082AFA00011FFA009AADFC00FEFEFE00811E0000EBC18800EABF8200E7BB
      7E0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000015D04001DA539002DD35E0023C5530018B2
      3D0011A72C00099816000289060000760000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00F8EFE300811E00001135FA00011FFA00082AFA009AADFC00FEFE
      FE006681FB00011FFA001135FA00FEFEFE00811E0000EBC48E00EBC28800E7BC
      800080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000015D040023AC400036E16A0029CD5A001FBF4D0018B2
      3D000DA0210007961300028906000081000000760000004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7756800F8F3
      F000FEFBF600FBF3EB00811E0000899EFC001D41FB00C1CCFC00FEFEFE00FEFE
      FE00E9EDFE00082AFA00011FFA006681FB00811E0000EDC79500EDC58F00E9BF
      870080504B000000000000000000000000000000000000000000000000000000
      000000000000015D040028B4450041EF760034DD670029CD5A001FBF4D0013AB
      30000DA0210005910E0000810000008100000081000000760000004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300811E0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00899EFC00011FFA00011FFA00631E1B00EECB9C00EEC99600EAC1
      8E0080504B000000000000000000000000000000000000000000000000000000
      0000015D040028B4450049FB80003EEB730034DD670023C5530019B6410013AB
      30000A9A1900079613000081000000810000008100000081000000760000004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00811E0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE003859FB00011FFA00041FE500DCC1A600EECB9C00EBC5
      920080504B00000000000000000000000000000000000000000000000000015D
      040028B4450049FB800047F87E003BE76F002FD7620023C5530019B6410011A7
      2C000A9A1900048E0A0000810000008100000081000000810000008100000076
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00FFFFFF00811E0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00E9EDFE001D41FB00011FFA001C3AEA00F0CFA300EDC9
      990080504B000000000000000000000000000000000000000000015D0400189D
      330034CC5900189D3300189D330010801E00076A0F0005670D0005670D00015D
      0400015D0400015D0400015D0400015D0400015D040000660000006600000076
      000000760000004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00FFFFFF00811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000631E1B00041FE500011FFA00011FFA00CEB4
      910080504B0000000000000000000000000000000000015D0400004B0000004B
      0000015D0400015D04000169020000760000078612000A8C1B0081FFFE0000CC
      E90000B1CA0000A6BD000A4A520028B4450020A53900189D3300148823000C73
      1500004B0000004B0000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00011FFA00011FFA00011F
      FA00011FFA00000000000000000000000000015D0400015D0400007600000076
      0000C47B0000C47B0000C47B0000C47B00000A9A190011A72C0013AB300081FF
      FE0000C9E30000C4E00000C9E3000D58620045F67F0049FB800049FB800049FB
      800049FB800034CC5900055E0800004B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00011FFA00011F
      FA00011FFA00011FFA00011FFA000000000000000000015D040000660000C47B
      0000E5C65B00E3C15200E0B83B00DAAB1F00C47B000011A72C0013AB300019B6
      410081FFFE0000D7F40000D7F40000D7F4000D58620034CC590020A539001993
      2B00FF78FF00004B0000004B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CB917300FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
      F000FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00011FFA00011FFA00011FFA0000000000000000000000000000000000E2AB
      6F00EFDC9800EDD78A00E7C96600E0B83B00C47B0000004B0000004B0000004B
      0000004B000081FFFE0000D7F4000D586200004B0000004B0000004B0000FF78
      FF00FF78FF007603760000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF967400FBF7
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      FA00FCF7F000FFFAEF00DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B00000000000000000000000000000000000000000000000000E2AB
      6F00F8F2D400F6E9BD00EDD78A00E3C15200C47B000000000000000000000000
      0000000000000000000054E6F700000000000000000000000000FA95FA00FF78
      FF00FC00FC007603760076037600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFB00FFFEF700DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B0000000000000000000000000000000000000000000000000000000000E2AB
      6F00FFFFFF00F8F2D400EFDC9800E5C65B00FF7E000000000000000000000000
      00000000000000000000000000000000000000000000FA95FA00FA95FA00FC00
      FC00FC00FC00FC00FC0076037600760376000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E2AB6F00E2AB6F00E2AB6F00E2AB6F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FA95FA00FA95
      FA00FC00FC007603760076037600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FA95
      FA00FF78FF007603760000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF78FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007978770078777600767675000000
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
      00000000000000000000000000007B7A790081807F00C0C0BF009A9A9900807F
      7E007373720070706F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5E00EFD3B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC5
      8900EBC18200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC1
      8000EABF7F0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6A6A006C6A6A006C6A6A0000000000000000000000
      0000000000006C6A6A006C6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007D7B7A0092919100EDEDED00F2F2F200E0E0E000DADA
      DA00C1C1C10099989800797978006D6D6C006C6B6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009365
      5F00EED4B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC5
      8F00EBC18800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006C6A6A00B0ADAD00969293008E8A8B006C6A6A006C6A6A00817E
      7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7E7D0093939200F6F6F600FFFFFF00F4F4F400E5E5E500E0E0
      E000D9D9D900D4D4D400238023000E690D00346A330051695000686867006767
      6600000000000000000000000000000000000000000000000000000000009365
      5F00EED7C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC7
      9600EDC58F00EBC1890090605B0090605B0090605B0090605B0090605B009060
      5B00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000134EC600134E
      C600134EC6001147BC000F41B4000F40B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F9F00838182005C5B
      5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9C9006C6A6A006C6A
      6A006C6A6A000000000000000000000000000000000000000000000000000000
      0000807F7E00ACACAB00F6F6F600FFFFFF00FFFFFF00F7F7F700EAEAEA00E5E5
      E500E0E0E000D9D9D90024812400016801000168010001680100789D78009696
      9600757474006464630062626000000000000000000000000000000000009365
      5F00EFDAC500F7E2C700F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB
      9C00EDC79500EDC58F00EBC18900E9BD8100E9BD7F00E9BD7F00E9BD7F00EABF
      7F00E7BC7E0080504B0000000000000000000000000000000000000000000000
      00000000000000000000000000001D73FC001B69EB001965E5002D6DD7005E84
      C200989FB100D0AC9100CE8B62004967A6001147BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F9F00626060000000
      000000000000161616005D5D5D00A9A9A900CACACA00CACACA00CACACA00CACA
      CA00C1C0C0006C6A6A006C6A6A006C6A6A000000000000000000000000008281
      8000ADACAC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00EFEFEF00EAEA
      EA00E5E5E500DEDEDE002582250001680100016801000168010086AB8600BFBF
      BF00BDBDBD00B1B1B10060605F00000000000000000000000000000000009365
      6000F0DECC00F8E6CF00F6E0C600F3DCBD00F2D8B700F2D5B100F0D1AA00EFCE
      A300EECB9C00EDC7960090605B0090605B0090605B0090605B0090605B009060
      5B00E7BC7E0080504B0000000000000000000000000000000000000000000000
      0000000000001E74FA002878F000568CD8008CA3C100DAC2A900FCD09F00F2C0
      9800E5AC8B00D7895E00E2955F00EEAC7500838EAC00134EC600134EC6000000
      00000000000000000000000000000000000000000000000000006C6A6A00D3D3
      D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F7F006C6A6A001414
      140008080800000000000000000000000000161616005D5D5D00A9A9A900CACA
      CA00CACACA00B7B6B600B7B6B6006C6A6A00000000000000000083838200CECE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00F4F4F400EFEF
      EF00EAEAEA00E5E5E5002683260001680100016801000168010089AF8900C4C4
      C400BFBFBF00BDBDBD0060605F00000000000000000000000000000000009566
      6000F2E2D300FAEAD700F6E3CE00F4DEC500F3DCBF00F2D8B800F0D4B100F0D1
      AA00EFCEA300EECB9D00EDC79700EDC59000EBC18900E9BD8100E9BD7F00EABF
      7F00E7BC7E0080504B0000000000000000000000000000000000000000000000
      00001F77FE006597D900FCD1A000FCD1A000FCD1A100FCD3A300FCD3A400F4C5
      9C00F7CBA000D5845500DC8A5700EAA97800F7CEA900D7CAC5004277D3001555
      D00000000000000000000000000000000000000000006C6A6A00CACACA00CACA
      CA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F9F009F9D9D009997
      97009390910082808000525050002B2A2A000808080000000000000000001616
      160064646400817E7F006C6A6A00000000000000000086848300B7B7B600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FAFAFA00F4F4
      F400EFEFEF00EAEAEA00278627000168010001680100016801008EB28E00C9C9
      C900C4C4C400BFBFBF0060605F00000000000000000000000000000000009869
      6300F2E6DA0090605B0090605B00F6E2CB0090605B0090605B00F2D8B7009060
      5B0090605B00EFCEA30090605B0090605B00EDC58F0090605B0090605B00EABF
      7F00E7BC7E0080504B0000000000000000000000000000000000000000001F78
      FF001F78FF00DCCEBB00FEDAB200FEDCB500FEDDB700FEDDB800FEDEBB00EDBF
      9F00DC997400D17A4B00E3976200F6C99F00F8D8BA00FBE5D000FCEEE1008AAF
      E5002366DA00000000000000000000000000000000006C6A6A00CACACA00C5C5
      C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DEDE00CAC7C700B6B5
      B500A5A3A300A19F9F00A19F9F009E9A9C009390910068656600232223000303
      030019191900999797006C6A6A00000000000000000086848300C0BFBF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FAFA
      FA00F4F4F400EFEFEF002887280001680100016801000168010091B79100CECE
      CE00C9C9C900C4C4C40060605F00000000000000000000000000000000009E6E
      6400F4EAE100FBF2E600F8EADC00F7E6D300F6E2CC00F4E0C600F3DCBF00F2D8
      B700F2D5B000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF
      8200E7BB7E0080504B000000000000000000000000000000000000000000296D
      CF0074674E00FEE0BB00FEE6C900FEE6CA00FEE7CC00FEE7CE00F3CFB200EFC4
      A500DC997200E9A36C00E9A77700F7D3B100FAE1C900FBEBDC00FEF3EA00FEFA
      F400CBDDF600397BE6001862E10000000000000000006C6A6A00C5C5C5008E8C
      8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEEDED00EAEAEA00E7E6
      E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F9F00999797008280
      80006C6A6A009F9D9D006C6A6A00000000000000000086848300C0BFBF00FFFF
      FF00FFFFFF00FFFFFF00EAF0EA00AFC5AF00AFC5AF00FFFFFF00FEFEFE00FEFE
      FE00FAFAFA00F4F4F4002888280001680100016801000168010095BB9500D4D4
      D400CECECE00C9C9C90060605F0000000000000000000000000000000000A372
      6600F6EEE900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DC
      BD00F2D8B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC2
      8800E7BC800080504B00000000000000000000000000000000001F78FF006665
      5B00FFA43500FEEED900FEEEDA00FEEFDC00FEEFDD00FEEFDE00F4D8C100EFCB
      B200D3805300D47B4A00EDB28700F8DCC100FBE7D500FCF0E600FEF7F200FFFB
      F800FFFEFE00DDEAFC001A68EA001A66E700000000006C6A6A008E8C8C00EFEE
      EE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B7E00958B8E00C1BF
      BF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1C100B2B0B000A19F
      9F009C9999006C6A6A006C6A6A00000000000000000086848300C0BFBF00FFFF
      FF00FFFFFF00AFC5AF0011471100003A0000003A000046744600FEFEFE00FEFE
      FE00FEFEFE00FAFAFA002989290001680100016801000168010098BF9800D9D9
      D900D3D3D300CECECE0060605F0000000000000000000000000000000000A775
      6800F8F3F00090605B0090605B0090605B0090605B0090605B0090605B00F4E0
      C500F3DCBD00F2D8B700F2D4B100F0D1A900EFCEA300EDCB9C00EDC79500EDC5
      8F00E9BF870080504B00000000000000000000000000000000001F78FF00AF75
      2C00FFC06D00FFF4E700FFF4E900FFF6EA00FFF6EA00FCEDE000E9B79900DD9C
      7700D5825300E9A67700F7D1B200E9D5C200FCEEE100FEF6EE00FEFAF600FFFE
      FC00FFFFFF00DAC6C6003F5C99001C6DF000000000006C6A6A00CECBCC00F7F6
      F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADABAB009E9898008379
      7B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1D100CECECE00C9C7
      C700BBBABA00A6A4A4006C6A6A00000000000000000086848300C0BFBF00EAF0
      EA00568156000036000007660C0013902000004B00000041000046744600FEFE
      FE00FEFEFE00FEFEFE00FAFAFA00CEE2CE0081BA8100509E5000ADCAAD00DEDE
      DE00D8D8D800D3D3D30060605F0000000000000000000000000000000000AC79
      6900FAF6F400FFFFFE00FEF8F300FBF2EA00F8EEE300F8EBDA00F7E6D300F7E2
      CC00F6E0C500F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB9C00EEC9
      9600EAC18E0080504B00000000000000000000000000000000001F5DA4001EBC
      4C00CEEECF00FFF8F200FFFAF300FFFAF300FFFAF400F4D9C700F3D5C200DC9E
      7B00E6A47500E9AA7F00FAE0C7009D9A95009E9D9900EBE7E300FFFCFA00FFFF
      FE00FFFFFF00CA979700706F96001D73F70000000000000000006C6A6A006C6A
      6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C0083787A009C969700ACAA
      AA00B2B0B000ABA7A9009891920081777800847A7D00938C8E00BFBFBF00CBCB
      CB00CACACA00C0C0C0006C6A6A00000000000000000086848300C0BFBF001147
      1100003F0000148F23002DD44E0028CB440013932000004B0000003F00004674
      4600FEFEFE00FEFEFE00FEFEFE00FAFAFA00F4F4F400EEEEEE00E9E9E900E3E3
      E300DEDEDE00D8D8D80060605F0000350000000000000000000000000000B17E
      6B00FAF6F40090605B0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B0090605B00F2D8B600F2D4B000F0D1A900EFCEA100EECB
      9C00EBC5920080504B000000000000000000000000001F78FF001F6553001EBC
      4C00FFFCF800FFFCFA00FFFCFA00FFFCFA00FFFCFA00F8E9E000EECAB400D07D
      5000D5804F00F0C09C00FBE7D400FCF0E500D9D5D0008E908E00B7B8B700FFFF
      FF00F7EEEE00BF8181003766B500000000000000000000000000000000000000
      00006C6A6A006C6A6A00BD828100AF8A73007D5E510066545600655457006D5E
      62006D5E620089808100A09A9C00AFACAD00B2B0B000A49FA000CAC9CA00CBCB
      CB00B7B6B6006C6A6A000000000000000000000000008684830000350000075F
      0C002BC44A0033DC58002DD44E0028CB440023C43B00108F1C00004B0000003A
      000046744600FEFEFE00FEFEFE00FEFEFE00FAFAFA00F3F3F300EEEEEE00E9E9
      E900E3E3E30087A18700063A060000410000000000000000000000000000B681
      6C00FAF6F400FFFFFF00FFFFFF00FFFCFB00FEF7F200FBF3EB00F8EEE300F8EB
      DC00F7E6D300F6E3CC00F6DEC500F3DCBD00F3D8B600F2D4AF00F0D1A900F0CF
      A300EDC9990080504B000000000000000000000000001F70ED00196C59006CC1
      A900FFFEFC00FFFEFC00FFFEFE00FFFFFE00FCF4EF00E5AD8F00E0A48200D98B
      5D00EEBA9200F8DDC500FCEDDE00FEF4ED00FEFAF600FFFEFB00B7B8B700C9CA
      C900CEE3FF005C7DC5001F78FF00000000000000000000000000000000000000
      00000000000000000000BD828100FFD4AB00FFD0A100FFCB9800D5A57B00A178
      5C007B665F0060505300665659006F6265008E868700CECCCC00CFCFCF00A5A4
      A4006C6A6A0000000000000000000000000000000000003A00001B992F003FED
      6C0039E5630033DC58002DD44E0028CB440023C43B001DBC33000D8A1700004B
      0000003A000046744600FEFEFE00FEFEFE00FEFEFE00FAFAFA00F3F3F300EEEE
      EE004E784E00003500000046000000000000000000000000000000000000BB84
      6E00FAF6F40090605B0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B0090605B00F6DEC400F3DABC00F2D8B600F0D4AF00EFD0
      A700CEB4910080504B000000000000000000000000001C53B000001EFF00C1CE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0A68700E19D
      7200E6A57A00E1D3C400D9D3CA00FEF8F300FFFCFA00FFFEFE00FFFFFF00FFFF
      FF0066A7FF001F78FF0000000000000000000000000000000000000000000000
      00000000000000000000BD828100FFD9B200FFD4A900FFCFA000FFCA9700FFC6
      8E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A6A006C6A6A006C6A
      6A0000000000000000000000000000000000000000000564090045F677003FED
      6C0039E5630033DC58002DD44E0028CB440023C43B001DBC330018B42A000B86
      1200004B0000003A000046744600FEFEFE00FEFEFE00FEFEFE00D0DCD0001C4E
      1C0000360000004900000000000000000000000000000000000000000000C089
      6F00FBF7F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2
      EA00FAEEE200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B0
      9600A1927F0080504B000000000000000000000000001137B000001EFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDDCFF007AB4FF003F8FFF001F78FF007FA7
      DD00FBE6D300EAE0D5009E9E9A009E9F9D00EDEBEA00FFFFFF00FFFFFF00FFFF
      FF002980FF001F78FF0000000000000000000000000000000000000000000000
      00000000000000000000BD828100FFDDBA00FFD8B100FFD3A700FFCE9E00FFCA
      9600FFC58C00FFC08400FFC08400BD8281000000000000000000000000000000
      000000000000000000000000000000000000000000000564090034D159003FED
      6C0039E5630033DC58002DD44E0028CB440023C43B001DBC330018B42A0013AC
      220009810F00004B0000003A000046744600FEFEFE009AB59A00073A0700003A
      0000004B0000000000000000000000000000000000000000000000000000C58C
      7000FBF7F400FFFFFF0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B00F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C
      8B00A497860080504B0000000000000000001F78FF00155FFF0084ABFF00EEF6
      FF00AFD3FF0072AFFF002F84FF002F84FF000000000000000000000000000000
      00004490F800DCE3EE00FEFAF600DADAD8008E908F00B7BAB800FFFFFF009FCA
      FF001F78FF001F78FF0000000000000000000000000000000000000000000000
      000000000000BD828100FFE5CB00FFE1C200FFDCB800FFD7AF00FFD3A600FFCE
      9D00FFC99500FFC48B00BD828100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000056409002FCB
      510039E5630033DC58002DD44E0028CB440023C43B001DBC330018B42A0013AC
      22000FA41A00067D0A00004B0000003A00001C501C000030000000410000004B
      000000000000000000000000000000000000000000000000000000000000CB91
      7300FBF7F40090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFE
      FB00FCF7F000FBF2E90090605B00E9D3C4009E675B0098665B0095655B009665
      5B0096655B009868590000000000000000001F78FF001F78FF001F78FF001F78
      FF001F78FF000000000000000000000000000000000000000000000000000000
      0000000000002D83FE0090C0FC00FFFEFE00FFFFFF00C0C1C000F6F6F6004C98
      FF001F78FF000000000000000000000000000000000000000000000000000000
      000000000000BD828100FFEAD400FFE5CA00FFE0C000FFDAB700FFD7AD00FFD1
      A500FFCC9C00FFC79200BD828100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000564
      090034D95A0033DC58002DD44E0028CB440023C43B001DBC330018B42A0019B5
      2C000DA118000B9D130004780700004B0000003C000000420000004B00000000
      000000000000000000000000000000000000000000000000000000000000CF96
      7400FBF7F60090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF7F00090605B00DAC0B6009F675B00DAA16B00DD984F00E290
      3A00EA892300A5686B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005DA3FF00EEF6FF00FFFFFF00AFD3FF001F78
      FF001F78FF000000000000000000000000000000000000000000000000000000
      000000000000BD828100FFEEDC00FFE9D100FFE3C900FFE0BF00FFDAB600FFD5
      AC00FFD0A300F7C29700BD828100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000086A0D002ED150002DD44E0028CB440023C43B001DBC33002CD14B0034DD
      5900018703000999100007960D0002740400004B0000004B0000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FCF8F60090605B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFCFB0090605B00DDC4BC009F675B00EAB47400EFA95200F6A0
      3600A5686B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F78FF001F78FF001F78FF001F78
      FF00000000000000000000000000000000000000000000000000000000000000
      0000BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3C700FFDEBD00FFD9
      B400FFD4AB00BD82810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000007690C0029CA470028CB440023C43B001DBC33002DD34D0034DD
      5900008100000083000005820900005601000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FCF8F600FFFFFF0090605B0090605B0090605B0090605B0090605B009060
      5B0090605B0090605B00FFFFFF00DDC7C2009F675B00EAB27300EFA75100A568
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F78FF001F78
      FF0000000000000000000000000000000000000000000000000000000000BD82
      8100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7CF00FFE2C500FFDD
      BC00F2C7A900BD82810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000564090024C23F0023C43B001DBC33002DD34D0034DD
      5900008100000081000005640900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D498
      7500FFFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E2D0CE009F675B00EDB57200A5686B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD82
      8100BD828100BD828100BD828100FFF4EB00FFF0E100FFEBD700FFE6CE00FBDC
      C000BD8281000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000046207001FBB35001BB42E00056409000F69
      1900014F02000164020005640900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E68009F675B00A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD828100BD828100BD828100BD828100BD82
      8100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000564090005640900000000000048
      000000420000004A010000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B0000004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B8200004B
      8200004B8200004B820000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F1F21001F1F2100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000003780800004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B8200004B8200004B8200015D97000164
      9C0000639D00005E9900004B8200004B8200004B820000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F1F21001F1F2100182A33000F2C3A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B0000004B0000004B0000004B00000A9616000378
      0800004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B8200168BBA001EB4DD001CC2EB0013C9F4000AC5
      F60003BFF70000B8F40000B2EE0000A5E1000089C900004B8200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000113B4E0004689A00064F750007395300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B000035CC5F002AC04C001EB0370013A124000A95
      160003780800004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004B82004BD3E60056FAFF0043EEFF0032E3FF0026DEFF0018D5
      FF000CCEFF0004C7FF0000C5FF0000C4FF0000C7FF0000BCF400004B82000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BB4B0000B649000017343C00036A9D00056798001B506E002A3440003F2F
      30005B270300702D00008C380000A7430000B5480000BB4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B00003ED76D0035CE5F002AC04C001EB0370013A3
      24000A95160003780800004B0000000000000000000000000000000000000000
      000000000000314B6200AC7D7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000253890032A5C50062F0F6005CFBFF004AEFFF0038E7FF002BDC
      FE001ED4FC0015D5FF0009CEFF0002CAFF0000BFFA000098D500004B82000000
      000000000000000000000000000000000000BC4B0000FEF3E700FEF0E200FEEE
      DD00FEEAD700FAE3CE0075868600045983003150650095606000AA6E6E00965D
      5D00643B3B00755E4B00967B5F00BD9A7500E0B58700F3C29000FBC99500FECB
      9600FECB9600FECB9600BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B00003ED76D003ED76D0036CC5F002AC04C001EB0
      37000C861600004B000000000000000000000000000000000000000000000000
      00005084B2000F6FE100325F8C00B87E7A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B8200004B820035B2CF0040C9E00039CEE700169F
      CF000D98CC0016BAE5000EB2E1000393CC00004B8200004B8200000000000000
      000000000000000000000000000000000000BC4B0000FEF7EE00FEF4EA00FEF2
      E500FEEFDE00FCEBD800F4E0CB000A4059008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965D5D00643B3B00755E4B00967B5F00BD9A7500E0B58700F3C49100FBC9
      9500FECB9600FECB9600BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B0000004B0000004B0000004B000036CE5F001A9A
      2F00004B00000000000000000000000000000000000000000000000000000000
      000032A0FE0037A1FF00106FE200325F8B00B67D790000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B8200004B82001880AC000083
      C000008CCA000877AC00004B8200004B82000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFAF600FEF8F200FEF6
      ED00FEF3E700FEF0E100FAEAD7004D6C75009C696900DC9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005B353500755E4C00967D6000BD9C7600E0B58900F4C5
      9200FBC99500FECB9600BC4B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000026A94300004B
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000037A4FE00379FFF000E6DDE00355F8900BB7F7900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000094F82000095
      D300009FDE00094F820000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFCFB00B85B2D006E2D
      13006E2D13006E2D13006D2D13006B2B1200794D4C00E2A4A400DC9D9D00CB8C
      8C00BA7D7D00A96D6D008C5757005A343200653C16007F4D1700A0621D00BF73
      2300CF7D2600FCCA9600BC4B0000000000000000000000000000000000000000
      000064636500314B6200AC7D7E00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B0000004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000037A4FE00359EFF000F6FDE0035608B00A67B7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      8200004B8200004B8200004B8200000000000000000000000000094F82000095
      D300009EDD00094F8200000000000000000000000000004B8200004B8200004B
      8200004B8200000000000000000000000000BC4B0000FEFEFE00AD350900E94B
      2F00F7634400F86B4D00F4685500DE452D00682C16007A4F4F00E2A3A300DC9D
      9D00CA8B8B00B87B7B00A76C6C008B5656005B35350076604F009A816600C2A0
      7B00E5BB8F00F6C79600BB4B0000000000000000000000000000000000000000
      00005084B2000F6FE100325F8C00B87E7A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000038A5FE00329DFF00156DCE00444F5B000000
      00009C6B6500AF887B00AF887E00AA8075000000000000000000000000000000
      00000000000000000000000000000000000000000000004B8200004B82000DA0
      D500049CD5000097D5000097D500004B8200004B820000000000094F82000095
      D300009EDD00094F820000000000004B8200004B82000CAAF20003A9E900007A
      6300005F3000004B8200004B820000000000BC4B0000FEFEFE00BA390F00F769
      4600F8654500FCD9D400FBC6BC00E5593A006D2D1300DDCBC20073474700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D3836007D6A55009C83
      6800C2A17E00E3BB9000B6490000000000000000000000000000000000000000
      000032A0FE0037A1FF00106FE200325F8B00B67D790000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003BABFF00A1CAE700AD867900A983
      7300E0CFB100FFFFDA00FFFFDD00FCF8CF00CCB29F00A1746B00000000000000
      000000000000000000000000000000000000004B82001D92BC0021B0D80014A4
      D4000B9DD3000399D4000093D3000097D7000097D700004B8200094F82000398
      D400019EDC00094F8200004B820024A9D7001FAFDE0006736C00004E18000151
      020003570000005E1000006E6400004B8200BC4B0000FEFEFE00E1896E00F86C
      4900FBA99800FFFFFF00FBBDB000FA6E4B00C7917600FAF0E70091400C007347
      4700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B5555005C352F00683F
      1300824F1800C1A07F00A7430000000000000000000000000000000000000000
      00000000000037A4FE00379FFF000E6DDE00355F8900BB7F7900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0917D00FCE9
      AC00FFFFCC00FFFFCF00FFFFD000FFFFDE00FFFFFA00E3D3D100996965000000
      000000000000000000000000000000000000004B82004CD7EA0049E7F60035E1
      F70023D8FA0013D0FA0006C7F80000C1F70000BFF400004B8200094F8200099C
      D300059FD800094F820035AFD30047D7D700117D4000004100000255010018A5
      3900159A32000359000003682900004B8200BC4B0000FEFEFE00FEFEFE00558A
      D8001B77B0001B7AB4002379AA00B4B5C700F3EBE200FCF7F000BB4B0000B7A0
      9A0073474700E1A1A100D99A9A00C78A8A00B77A7A00A66B6B008B5555005B35
      35007A6A57009982680090390000000000000000000000000000000000000000
      0000000000000000000037A4FE00359EFF000F6FDE0035608B00A67B7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0897800FAD1
      9200FEF4C200FFFFD000FFFFDA00FFFFF600FFFFFC00FFFFFC00B69384000000
      00000000000000000000000000000000000000000000004B8200177DAA00138A
      B7000C84B6000682B700017DB7000177B200066EA50000000000094F82000D9F
      D3000CA7DD00094F820000000000025031000352040002660200007600000992
      160015A13000076E130000504E00004B8900BC4B0000FEFEFE006EB8FC002890
      FA002890FA002890FA002890FA003296F800E6E7E700FEFBF800BB4B0000FAF3
      EB00B7A19C0091606000EBAAAA00D9999900C7898900B6797900804E4E004148
      5500354756007A6A5700722D0000000000000000000000000000000000000000
      000000000000000000000000000038A5FE00329DFF00156DCE00444F5B000000
      0000925D5A00B48C8000C9A39100C28F88000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0897800FEDA9700EDB4
      7800FBEEBB00FFFFD300FFFFDC00FFFFF400FFFFF400FFFFE200E9DDBC00A67B
      7300000000000000000000000000000000000000000000000000004B82000000
      000000000000000000000000000000000000094F820000000000094F820015A4
      D30015ADDE00094F820000000000004244000778500018B84300099613000064
      000008760C0001514E000000000000000000BC4B0000FEFEFE00187DB400309C
      FB00309CFB00309CFB00309CFB00157BB600BDDAEE00FEFCFC00BC4B0000FCFA
      F400D17F26009F5E280091606000EBAAAA00D9999900534E5700028AC40000AA
      EA0000A6E6000087C4005A240000000000000000000000000000000000000000
      0000000000000000000000000000000000003BABFF00A1CAE7008C777500A383
      7200EBE0B800FEFCCF00FEFCCE00FCFBCC00E3CFB100C0998C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B18A7800FFDE9900E9A1
      6700F4D19900FEFCCC00FFFFD500FFFFDA00FFFFDC00FFFFD700EFE6C500A97E
      750000000000000000000000000000000000000000000000000000000000034D
      8300000000000000000000000000094F82000000000000000000094F82001CA7
      D3001CB4DD00094F82000000000000000000004F45000C815D000D821F000000
      000001504A00000000000000000000000000BC4B0000FEFEFE00055A970033A0
      FB0033A0FB0033A0FB0033A0FB001278B000BAD8E900FEFEFE00BC4B0000FEFC
      FB00FCFAF700FAF6EF00B7A39E0091606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D0000008200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA4A400CEA58F00FFED
      B200FFFCCA00FFFFCF00FFFFCF00FFFFD500FFFFEA00F3EBE500A0746F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AA7F7300FAE0A400F0B7
      7800EEBA7B00F6DDA600FEFBCC00FFFFD300FFFFD100FFFFD700D9C5A700A375
      6C00000000000000000000000000000000000000000000000000000000000000
      000000437B000000000001457D0000000000000000000000000000477F0023A9
      CE0026B6DC00004A810000000000000000000000000000000000014E69000000
      000000000000000000000000000000000000BC4B0000FEFEFE004588AF00055A
      9700085F9F00085F9F00116EB50013639700FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFCFB00FCFAF700FAF6F000B6A19F0073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A9700000082000000000000000000000000000000
      00000000000000000000000000000000000000000000B67F7600F4D9A100F6D0
      9500FCF4C200FFFFCF00FFFFD800FFFFEE00FFFFFA00FFFFFF00D5C2AC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB29300FFFE
      DD00F4D1A500EEBA7B00F2C78F00F8E1AB00FCF0BA00FCFACA00A3776F000000
      0000000000000000000000000000000000000000000000000000000000001172
      A000167EAB001179A700117BAA000F7BAA000D79AB000C7AAD0004679D002FB2
      D40031BDDD0001629A000173AC00006FB000006FB200006EAF00006FB1000070
      AF000069A400000000000000000000000000BC4B0000FEFEFE00EAF2F700669F
      BF0006558900004B820028739F00C0D8E300FEFEFE00FEFEFE00BC4B0000FEFE
      FE00D5812700D5812700D5812700D17F260089512B000093D10000B1F200012B
      A7000725DC000420B800021DB100010A97000000000000000000000000000000
      00000000000000000000000000000000000000000000D0A79200FBDC9A00EEB8
      7F00FBF0BD00FFFFD000FFFFDC00FFFFF700FFFFFA00FFFFE600EEEAC200B784
      7E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1746B00E1D4
      D300FFFEEE00F7CC8C00F0B47300F7C78800FCE3A500C2A08800A5776C000000
      0000000000000000000000000000000000000000000000000000000000001374
      A100208EB6001887B1001888B2001486B4001182B1000E84B600066CA30036B2
      D0003DBBD70001669F00017AB5000076B1000076B2000076B4000076B2000078
      B400006AA500000000000000000000000000BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FCFBFB00FAF7F400F3EFE9000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F000000000000000000000000000000
      00000000000000000000000000000000000000000000DCB79A00FAD79600EAA7
      6C00F7DAA300FFFFCE00FFFFD400FFFFE100FFFFE300FFFFD700F8F6CB00B697
      8200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009868
      6500BA958700EAD7A400EAD59E00E0C09700A5776C00A5776C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000457E000973
      A6000979AD000049810000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00BC4B0000FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FCFBFB00FBFAF700F4F2EE001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5AF9600FEE2A100EAA9
      6A00EFBD8000FAE9B400FFFFD000FFFFD300FFFFD100FFFFD100F3EEC500B88B
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A77E7000A9807300A4786E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B820005C1
      FB0000BDFB00004B820000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D9640100D964
      0100D9640100D9640100D9640100D9640100D9640100D9640100D7630100D568
      06001322BD00050DA500A1410000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BB898000FCEBB100F8E2
      B500F0C69000F0C28600F7DCA500FEF3C100FEF8C600FFFFCF00DDCEA9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B820033D0E70027E2
      FF0009CBFF0001C1FA00004B8200000000000000000000000000000000000000
      000000000000000000000000000000000000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BB4B
      0000B8490000B5480000B5480000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3B49900FFFF
      FF00FFF4E200EFBD8000EBAB6F00F0C08600FBDEA300FCF3B800AC8676000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B82002BA0C00053F7
      FF0031EAFF000BA3D800004B8200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BB4B0000BB4B000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6AD
      A700F3EBD100FFEEAF00FCDE9D00FEE2A100F0D4A400C2988600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B8200004B
      8200004B8200004B820000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BB987E00C1998300D3AD9300D1A592000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000004B
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B008C4B4B00914B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000096919000736E
      6E00AF7D7E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000811E0000000000000000
      000000000000811E00000000000000000000000000000000000000000000004B
      000003780800004B000000000000000000000000000000000000811E0000811E
      0000811E0000811E000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B00894B4B009C4B4C00B64B4C00BD4B4C009F4B
      4C004E1E1F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000979291006C6C7000174B
      820032608900AF7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000811E0000000000000000
      000000000000811E00000000000000000000004B0000004B0000004B0000004B
      00000A96160003780800004B0000000000000000000000000000811E00000000
      00000000000000000000811E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009A4D4E00AF4E4F00C14E4F00C04D4E00BF4C4D00BF4C4D009F4B
      4C004E1E1F00994B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B00000000000000000000000000838686003A79B1001A81
      FF000D62BC003B5F7F00B07D7D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000811E0000811E0000811E
      0000811E0000811E00000000000000000000004B000035CC5F002AC04C001EB0
      370013A124000A95160003780800004B00000000000000000000811E00000000
      00000000000000000000811E0000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00C5545500C9545500C7535400C6525300C5515200C4505100C24F5000A04C
      4D004E1E1F00FE8B8C00FC929300FB9A9C00FAA3A400F8AAAB00F7B1B100F7B5
      B600F7B5B600824B4B000000000000000000000000002698FF003DB0FF00349D
      FF001C7EF8000C62BA00395E7F00B07B7D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000811E0000000000000000
      000000000000811E00000000000000000000004B00003ED76D0035CE5F002AC0
      4C001EB0370013A324000A95160003780800004B000000000000811E0000811E
      0000811E0000811E0000811E0000000000000000000000000000000000000000
      0000000000000000000000000000004B0000118C1F00004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00CE585900CC575800CB565700CA555600C9545500C7535400C6525300A34E
      4F004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B00000000000000000000000000000000002996FF0042AD
      FE00349AFF001C7EF8000C60B800405F7F00B17D7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000811E0000000000000000
      000000000000811E00000000000000000000004B00003ED76D003ED76D0036CC
      5F002AC04C001EB037000C861600004B00000000000000000000811E00000000
      00000000000000000000811E0000000000000000000000000000000000000000
      00000000000000000000004B0000138F230007931000169C2800004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D15B5C00D05A5B00CF595A00CE585900CC575800CB565700CA555600A550
      50004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000002A96
      FE0041AFFE00349AFF001C7EF8000C5FB8003E5F7E00B07B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000811E0000811E
      0000811E0000000000000000000000000000004B0000004B0000004B0000004B
      000036CE5F001A9A2F00004B0000000000000000000000000000811E0000811E
      0000811E0000811E000000000000000000000000000000000000000000000000
      000000000000004B0000159127000FA01D000B99160008961100159A2700004B
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D55E5F00D55E5F00D45D5E00D35C5D00D15B5C00D05A5B00CF595A00A651
      52004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      00002A97FE0041AFFE00349AFF001A7BF8000B5FB70044627F00A97A7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      000026A94300004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B00000F811C001AAF310014A727000FA11F000C9A1800089612001399
      2500004B00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DA636400D9626300D8606200D75F6000D55E5F00D45D5E00D35C5D00A953
      54004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000002C98FE0041ADFE00349CFF00197BF6000C5EB6002B587F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000064636500314B6200AC7D7E0000000000000000000000000000000000004B
      0000004B00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      00000E7D1A0028C0480021B83D001BB0330013902400004B0000169D29000997
      130013982300004B000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DE666700DD656600DC646500DA636400D9626300D8606200D75F6000AB55
      55004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000002D99FE0041ADFE00339CFF00287FE7003D607B000000
      0000000000000000000099696400996964009969640099696400996964000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005084B2000F6FE100325F8C00B87E7A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B00000C77
      170035CF5E002FC9540028C149001B9F3100004B000000000000004B00000D9E
      1B000997140011972200004B0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E2696A00E1686900E0676800DE666700E06D6E00E6909100DC646500AC56
      57004E1E1F0058A55B001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      00000000000000000000000000002D9AFE004BB5FF008CBDED00AC9F96006C56
      550093665F0099696400DDCCAB00FFFFD900FFFFD900FFFFD700E9D5B6009969
      6400996964000000000000000000000000000000000000000000000000000000
      000032A0FE0037A1FF00106FE200325F8B00B67D790000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B00003FD9
      6F003BD7680036D0600020AA3B00004B0000000000000000000000000000004B
      0000097411000A99150011962000004B00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E76D6E00E66C6D00E56B6C00E36A6B00EEA6A700FFFFFF00EB9C9C00AF58
      59004E1E1F00EECEAF00B7EBAA005ED377005ED3770045CA670045CA670045CA
      6700F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D1ADA500B687
      7500CCAB8C00FFFFD300FFFFD300FFFFD000FFFFCF00FFFFD000FFFFD300FFFF
      E200D4BAA4009969640000000000000000000000000000000000000000000000
      00000000000037A4FE00379FFF000E6DDE00355F8900BB7F7900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B00001C9C
      340041DC700023AD4100004B0000000000000000000000000000000000000000
      000000000000004B00000B99160010951F00004B000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EB707200EA6F7000E96E6F00E76D6E00F2A9AA00FFFFFF00EB959600B15A
      5A004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300D9F6BD00D9F6
      BD00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000996B6500D4AF
      8F00FFEFB000FBEDB800FFFFCF00FFFFCE00FFFFCF00FFFFD700FFFFDC00FFFF
      EA00FFFFFF00D3BBB80099696400000000000000000000000000000000000000
      0000000000000000000037A4FE00359EFF000F6FDE0035608B00A67B7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      00002EC15200004B000000000000000000000000000000000000000000000000
      00000000000000000000004B00000C9A180009961200004B0000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EF747500EE737400ED727300EB707200EA6F7000EF909100E76D6E00B25B
      5C004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400FFEA
      A600F2C78F00FAEBB600FFFFD000FFFFCF00FFFFD300FFFFE500FFFFF200FFFF
      FA00FFFFFC00FFFFFE0099696400000000000000000000000000000000000000
      000000000000000000000000000038A5FE00329DFF00156DCE00444F5B000000
      0000925D5A00B48C8000C9A39100C28F88000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00000464080009961300004B00000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F3777800F3777800F2767700F0757600EF747500EE737400ED727300B55D
      5D004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400E6C9A000F6CA
      8B00EEBA7F00FBE7B400FFFFD000FFFFCF00FFFFD700FFFFEB00FFFFFE00FFFF
      FC00FFFFF200FFFFE500D8C6A500996964000000000000000000000000000000
      0000000000000000000000000000000000003BABFF00A1CAE7008C777500A383
      7200EBE0B800FEFCCF00FEFCCE00FCFBCC00E3CFB100C0998C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000007740E00004B
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F87B7D00F77A7B00F6797A00F4787900F3777800F2767700F0757600B75F
      5F004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFEFAD00F0BC
      7D00EBB07500F7DDA700FEFCCB00FFFFD100FFFFD500FFFFE600FFFFF600FFFF
      F600FFFFE600FFFFD700FFFFDA00996964000000000000000000000000000000
      00000000000000000000000000000000000000000000BDA4A400CEA58F00FFED
      B200FFFCCA00FFFFCF00FFFFCF00FFFFD500FFFFEA00F3EBE500A0746F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000035E
      0600004B0000000000000000000000000000000000000000000000000000824B
      4B00FC7F8000FB7E7F00FA7D7E00F87B7D00F77A7B00F6797A00F4787900B860
      62004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFF0AF00EFBA
      7B00E9A56A00F2C98F00FCEFBC00FFFFD100FFFFD300FFFFD900FFFFE100FFFF
      E200FFFFD900FFFFD300FFFFDA00996964000000000000000000000000000000
      00000000000000000000000000000000000000000000B67F7600F4D9A100F6D0
      9500FCF4C200FFFFCF00FFFFD800FFFFEE00FFFFFA00FFFFFF00D5C2AC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B00000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FE808100FC7F8000FC7F8000FB7E7F00FA7D7E00BB63
      63004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400FFF2B200F3C4
      8400E99E6300EDB57A00F4D79F00FCF4C200FFFFD100FFFFD300FFFFD300FFFF
      D300FFFFD000FFFFCF00FFFFD800996964000000000000000000000000000000
      00000000000000000000000000000000000000000000D0A79200FBDC9A00EEB8
      7F00FBF0BD00FFFFD000FFFFDC00FFFFF700FFFFFA00FFFFE600EEEAC200B784
      7E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B000000000000000000000000000000000000824B
      4B00FF818200FF818200FF818200FF818200FF818200FE808100FE808100BD65
      65004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099696400E6C9A000FCDE
      9E00EFBA7E00EEB77900EFC28400F6DAA100FBF2BF00FFFFCF00FFFFD100FFFF
      D000FFFFD000FFFFD100D9C6A500996964000000000000000000000000000000
      00000000000000000000000000000000000000000000DCB79A00FAD79600EAA7
      6C00F7DAA300FFFFCE00FFFFD400FFFFE100FFFFE300FFFFD700F8F6CB00B697
      8200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F77E7F00FF818200FF818200FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400FFFE
      C200FBEBCA00F6D7AC00F0C18600EFBF8200F3CC9500FAE3AD00FCF0BC00FBF4
      C100FEF6C400FFFFD40099696400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5AF9600FEE2A100EAA9
      6A00EFBD8000FAE9B400FFFFD000FFFFD300FFFFD100FFFFD100F3EEC500B88B
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00AF5E5F00D56F7000FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099696400D7BB
      9E00FFFFFF00FEF7EE00F6D8AC00EDB47400E9A76B00EDB47800F0C48A00F6D4
      9C00FFF4B600D3B7990099696400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BB898000FCEBB100F8E2
      B500F0C69000F0C28600F7DCA500FEF3C100FEF8C600FFFFCF00DDCEA9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B0091515200B6626300EE7A7B00FF818200BF66
      66004E1E1F00914B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009969
      6400CEB6AF00FFFFFF00FFF4CB00F6CF9000F0BC7D00F2BF8100F7CE9000FFED
      A900D4B193009969640000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3B49900FFFF
      FF00FFF4E200EFBD8000EBAB6F00F0C08600FBDEA300FCF3B800AC8676000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00985555009F58
      58004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009969640099696400E1C9A000FFF7B500FFF2AF00FFF2B100E9CCA4009969
      6400996964000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6AD
      A700F3EBD100FFEEAF00FCDE9D00FEE2A100F0D4A400C2988600000000000000
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
      0000BB987E00C1998300D3AD9300D1A592000000000000000000000000000000
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
      2800000060000000780000000100010000000000A00500000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF000000000000C00007FF
      C3FF000000000000C00007FF81FF000000000000C00007FF81FF000000000000
      C00007FF81FF000000000000C00007FF81FF000000000000C00007FF81FF0000
      00000000C00007FF81FF000000000000C00007FF00FF000000000000C00007FE
      007F000000000000C00007FC003F000000000000C00007F8001F000000000000
      C00007F0000F000000000000C00007E00007000000000000C00007C000030000
      00000000C00007800001000000000000C00007000000000000000000C0000180
      0001000000000000C00001E00003000000000000C00007E07DC1000000000000
      C0000FE07F80000000000000C0001FF0FFC1000000000000C0003FFFFFE30000
      00000000C0007FFFFFF7000000000000FFFFFFFF1FFFE00003FFFFFFFFFFFFFE
      03FFE00003FFFFFFFC79FFFC007FE00003FFFFFFF8003FF8000FE00003FFC0FF
      F00007F00001E00003FE007FE00000E00001E00003F8001FC00000C00001E000
      03F0000F800001800001E00003E00007800001800001E00003E0000180000180
      0001E00003C00000800001800001E00003C00000800001800001E00003C00000
      C00001800000E00003800001F00003800000E00003800001FC0007800001E000
      03800003FC000F800003E00003800003FC00FF800007E0000300F003F801FFC0
      000FE0000307F807F801FFE0001FE00003FFFE07F801FFF0003FE00007FFFF0F
      F003FFF800FFE0000FFFFFCFE003FFFC01FFE0001FFFFFFFE007FFFE01FFE000
      3FFFFFFFFE0FFFFF23FFFFFFFFFFFFFFFFFF9FFFFFFFFFC3FFF9FFFFFFFF8FFF
      FFFFFE007FF87FFFFFFC07FFFFFFFC003FFC3FFFFFFC03FFFFFFF8001F000001
      FFFC01F9FFFFF8001F000001FFFC03F0FFFFFC003F000001FFFC07F07FFFFF00
      FF000001FFFF8FF83FFFFFC3FF000001F1FF9FFC1FFFE1C387000001F0FFFFFE
      10FF804201000001F07FFFFF003F000000000001F83FFFFFC01F000000000001
      FC1FFFFFC01F804200000001FE10FFFF800FDF4203000001FF003FFF800FEEC3
      17000001FF801FFF800FF5C3DF000000FF801FFFC01FE00007000000FF800FFF
      C01FE00007000000FF800FFFE03FFFC3FF000001FF800FFFF8FFFFC3FF000001
      FF801FFFFFFFFF81FF000001FFC01FFFFFFFFF81FF800003FFE03FFFFFFFFFC3
      FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFFFFFFFFFE7FFFFFFFFFF
      07FFC7FFFFBBE3C3FFFFFFF807FF83FFFFBB01DDFFFFFFE0000381FFFF8300DD
      FF7FFFE0000380FFFFBB0041FE3FFFE00003C07FFFBB00DDFC1FFFE00003E03F
      FFC701C3F80FFFE00003F01FFFFFE3FFF007FFE00003F81FFFF1E7FFE003FFE0
      0003FC1C1FF0FFFFC041FFE00003FE0007F07FFFC0E0FFE00003FFC003F83FFF
      C1F87FE00003FFC001FC1FFFE3FC3FE00003FFC001FE10FFF7FE1FE00003FF80
      00FF003FFFFF8FE00003FF8000FF801FFFFFC7E00003FF8000FF801FFFFFF3E0
      0003FF8000FF800FFFFFFDE00003FF8000FF800FFFFFFFE00003FFC001FF800F
      FFFFFFE00003FFC001FF801FFFFFFFF80003FFE003FFC01FFFFFFFFF07FFFFF0
      07FFE03FFFFFFFFFE7FFFFFC1FFFF0FFE00003FFFFFFFFFFFFFFFFFFE0000300
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
  object cxStyleRepository1: TcxStyleRepository
    Left = 400
    Top = 128
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 12685879
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyletoone: TcxStyle
      AssignedValues = [svColor]
      Color = 7956682
    end
  end
  object ReadDataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    SQLScreenCursor = crSQLWait
    BufferChunks = 500
    Left = 144
    Top = 176
    poSQLINT64ToBCD = True
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = dxBarButton4
        Visible = True
      end
      item
        Item = dxBarButton6
        Visible = True
      end
      item
        Item = dxBarButton7
        Visible = True
      end
      item
        Item = dxBarButton8
        Visible = True
      end
      item
        BeginGroup = True
        Item = print
        Visible = True
      end
      item
        Item = calc
        Visible = True
      end
      item
        Item = Propi
        Visible = True
      end
      item
        Item = Narush
        Visible = True
      end
      item
        BeginGroup = True
        Item = SpyMonitor
        Visible = True
      end
      item
        BeginGroup = True
        Item = dxBarButton9
        Visible = True
      end>
    UseOwnFont = False
    Left = 144
    Top = 264
  end
  object PopupMenu1: TPopupMenu
    Left = 378
    Top = 224
    object MenuItem1: TMenuItem
      Action = AddAction
      ImageIndex = 0
    end
    object MenuItem2: TMenuItem
      Action = EditAction
      ImageIndex = 1
    end
    object MenuItem3: TMenuItem
      Action = DeleteAction
      ImageIndex = 2
    end
    object MenuItem4: TMenuItem
      Action = RefreshAction
      ImageIndex = 3
    end
  end
  object PopupImageList: TImageList
    Left = 334
    Top = 306
    Bitmap = {
      494C010112001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000035D0500035D050000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035D05005BF79100058C0D00035D0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035D05005BF7910005950E00035D0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035D05005BF7910005920D00035D0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035D05005BF7910006950F00035D0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      8B0000018B0000018B0000018B0000018B0000018B0000018B0000018B000001
      8B0000018B000000000000000000000000000000000000000000035D0500035D
      0500035D0500035D0500035D05005BF791000C9C1800035D0500035D0500035D
      0500035D0500035D050000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000018B003F69
      FF000014FF00001CFF00001CFA00001BEE00001BE200001AD800001CCC00001C
      C200001FBC0000018B00000000000000000000000000035D05005BF791003BDA
      690030CF57002AC64D0021B83C0017A62B00119F21000D9E1C000A9A15000692
      0E0005930D00058B0D00035D0500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000018B0096B1
      FF004966FF004B6EFF004B6EFF004B6DF8004C6DF2004C6DEB003D5EE2003455
      DC003459D90000018B00000000000000000000000000035D05005BF791005BF7
      91005BF791005BF791005BF791005BF7910018A92F005BF791005BF791005BF7
      91005BF791005BF79100035D0500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      8B0000018B0000018B0000018B0000018B0000018B0000018B0000018B000001
      8B0000018B000000000000000000000000000000000000000000035D0500035D
      0500035D0500035D0500035D05005BF7910025BC4200035D0500035D0500035D
      0500035D0500035D050000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035D05005BF7910030CE5700035D0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035D05005BF791003BD96800035D0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035D05005BF7910048EB7F00035D0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035D05005BF791005BF79100035D0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000035D0500035D050000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006C6A6A006C6A6A0000000000000000006C6A6A006C6A6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006C6A
      6A00AAA7A700A19F9F006C6A6A006C6A6A006C6A6A00E5E3E3006C6A6A006C6A
      6A006C6A6A0000000000000000000000000000000000000000009B7C6B009D7E
      6D009C7E6D009C7E6D009C7E6D009C7D6D009C7D6C009B7C6B009B7C6B009A7C
      6A00997B68009B7C6B0000000000000000000000000098656500AA787800B385
      8400A16965009E6A680099696900B65555000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D69FF00908A820077736C000000000000000000000000006C6A6A00DAD9
      D900A19F9F00A19F9F00A19F9F0037363600353535006C6D6D00BFBFBF00E1E2
      E200B7B6B6006C6A6A006C6A6A006C6A6A0000000000000000009B776600FFFF
      FF00FAF4E900FAF4E900EEE9DE00E8E2D800F7F0E400FAF2E600FAF1E400F9EF
      E000F8EDDA00977967000000000000000000000000009B666600D2ABA900FFFF
      FF0098A9FF00F0D8D400D3B1B300BC969700B07B7B00A46B6B00B67878000000
      000000000000000000000000000000000000000000000000000000000000AA71
      7100A4717100AB7A7A00AB787800A5727200936060006F3A3A006B3333003277
      FF002A7BFF007FDEFF009890850000000000000000006C6A6A00D4D3D300CACA
      CA008E8C8C008E8C8C008E8C8C003C3B3B000A090A00070707000B0B0B000707
      07007A7A7A00BBBBBB006C6A6A00000000000000000000000000A27F6F00FFFF
      FF00DDC2B500DDC2B500B5A9A400B1A19A00DBC2B400DCBBA900DCBAA500DCBA
      A300FAF1E2009879680000000000000000000000000098666600D9B3AF00FFF7
      E00099A3E800FFF1D800F9E1CE00FFECDD00FFF5F100FAE6E700A56C6C000000
      0000000000000000000000000000000000000000000000000000BA838300ECC1
      C100F6CFCF00E3B5B500E1B3B300D3A4A400C4959500AD7A7A0060649A002A77
      F80071E1FF003188FF00216AFC00000000006C6A6A00CACACA00CACACA008E8C
      8C00D7D4D400CECBCB00BFBCBC00B1AFAF00A3A0A000888686005E5B5C000707
      070009090900080808006C6A6A00767373000000000000000000A3807000FFFF
      FF00DBC3BB00EADDD7006F6D7100928B9600C3CDB900E8D6CC00DAB8A500DCB9
      A500FAF3E600997A6A000000000000000000000000009B686800E0BCB400FFF6
      DD009DA5E800F8E3D000D6C9C600FFF7F300FFEBDD00FFE0CD00A86F70000000
      0000000000000000000000000000000000000000000000000000C99B9B00FFEF
      EF00E9CDCD00DBB5B5009B8D8D007874750073706F00756E6E008D8986008CC5
      D6002D83FF00347AFF0000000000000000006C6A6A00CACACA008E8C8C00EFEE
      EE00FFFEFE00FBFAFA00E3E0E100DEDEDE00DEDDDD00CFCECE00BDBCBC00ADAB
      AB008B898900585656007A787800757373000000000000000000A9877800FFFF
      FF00DBC7C200E9DDDA00A8BBCE0034B356002CB4440071B46F00ECDBD200DCBB
      A700FBF4E800997B6B000000000000000000000000009F696900E8C8C600FFFE
      F400A0B1FD00F0E7E200424B530078716A00B6B28D00FED9CA00AF7275000000
      0000000000000000000000000000000000000000000000000000C8A0A000F7DA
      DA00EBBEBE009E8F9000BDAA9000FFD18400FED08500FED698009A948B008C8A
      87003D7BED000000000000000000000000006C6A6A008E8C8C00FFFFFF00FEFC
      FC00FAFAFA00D5D4D50098919300A0989900B2ABAC00C4C0C100D7D7D700D8D8
      D800C7C6C600B7B6B600918F8F006C6969000000000000000000AB897A00FFFF
      FF00DBC7C300E6D7D40099D0A70066FF98005AEC86002EAD460087BE8100EAD8
      CC00FBF5EA009A7C6B00000000000000000000000000A06B6B00F1D4D200FFFA
      E900A3ACEB00FFF4DD00669EA80024A94200139A2B00367D3200BB7A7E000000
      0000000000000000000000000000000000000000000000000000CB9B9B00FFE3
      E300F7E3E300807C7A00FFDD9700F2D59800EFCD9000F1C88200FED99D006A62
      630000000000000000000000000000000000000000006C6A6A006C6A6A00EDEB
      EB00B1A6A7007A6F72008A83880096929500969091009D9798009A9395009E98
      9900BBBABA00D1D1D100C2C2C2006C6A6A000000000000000000AF8E7F00FFFF
      FF00DCC5C000DEC9C300DBE4D60057E27F006AFF9D0055E17C002AA43C009CC4
      9400FCF8F2009B7C6B00000000000000000000000000A36E6E00F7DAD100FFF6
      E000A4AEEA00FFF4E0004EBB720062FF960052E17B001E9C3300007705000000
      0000000000000000000000000000000000000000000000000000CCA4A400F9E1
      E100E7C6C6007B777200FFEEBD00F8E8BB00F4DDA900F0D09400FFD59000716D
      6C00000000000000000000000000000000000000000000000000000000006C6A
      6A00BB897F00A7876D008B6F64007D6760006F626500797379008F8B8E00A9A3
      A400CBCACA00C1C1C1006C6A6A00000000000000000000000000AF8F8000FFFF
      FF00FEFEFE00FEFEFE00FEFDFD00D1F8DC0054EE830068FF9B0050DC7700249E
      3800B7DCB600B69F9400000000000000000000000000AA747400FBE5DF00FFFD
      EF00A8B7F500FFFBF50099D9A4003BDC6C0064FE96004DDA74001E962F00037E
      0900000000000000000000000000000000000000000000000000CD9D9D00FFDE
      DE00F2D0D000827D7900FFFFEA00FFFEEF00F9EDC200F6DAA000FFDA96006D65
      6600000000000000000000000000000000000000000000000000000000000000
      0000BD828100FFE3B400FFD39F00E9B28100C9997300BA916C00BD828100807D
      7E006C6A6A006C6A6A0000000000000000000000000000000000AF8F8000FFFF
      FF00DFCECC00DFCDCB00DECAC600E9D9D500ADEAB9005AF6880064FF970042DA
      690034873E00C6BDB600000000000000000000000000B07B7B00FDECE900FFFF
      F400AABAF500FFF8E900FFF4EE0064CF86004AE7790063FB950049D36C001690
      2500007F05000000000000000000000000000000000000000000D0A7A700F9E8
      E800F3E3E300A5A0A000DEDAC400FFFFF200FFF7CB00FFE7A600B1A290007967
      6700000000000000000000000000000000000000000000000000000000000000
      0000BD828100FFE0B800FFD3A700FFD09D00FFCE9000FFC68800BD8281000000
      0000000000000000000000000000000000000000000000000000B1908000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFD0091EFAC0055FC88009AC1
      A400CDBBB6006E6D8C00030FB4000000000000000000B8838400FFECDF00FFFA
      E200B0BBEE00FFF8DF00FFF2E000FFEFDF004BCD710055F386005DFE90005BA1
      69006E6E670079776E0000000000000000000000000000000000CCA0A000FFDE
      DE00F0CBCB00E4BCBC00A29696007F7B79007A77730079747300867777006C3A
      3A0000000000000000000000000000000000000000000000000000000000C086
      8300FFE7CF00FFE0C000FFD9B200FFD3A500FFD09900BD828100000000000000
      0000000000000000000000000000000000000000000000000000B7978700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFDFB00FBFCFA00A5C5A600FFFF
      FF007892F500203DDC0000029F000000000000000000C28B8B00E4DDDF00E2E4
      E300A8B3D600B3B4B300A1A2A300A6A2A400ACAEAD0025C056008ABF9900DFD4
      D2006A77C1001624B5000206A900000000000000000000000000D3A6A600FFDB
      DB00F0CACA00E8C3C300E8C5C500DDB9B900CCA7A700BA929200834F4F006A37
      370000000000000000000000000000000000000000000000000000000000BD82
      8100FEEBD800FFE6CC00FFDEBD00FFD8B100FED3A400BD828100000000000000
      0000000000000000000000000000000000000000000000000000B8988800FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFD00FEFCFA00FDFBF900DED0C9008C99
      DE004277FF002D4AD80001029E000000000000000000C8919100C4B9B800817E
      810069656C006D626100908080008A78780088707100455F4B00D5CCC7007992
      F3003862F2001F36C70000009900000000000000000000000000CEA5A500FFFD
      FD00FFF1F100FFE8E800FBE0E000F9DADA00F7D5D500E9C4C400D7ACAC007C48
      4800000000000000000000000000000000000000000000000000BD828100FFFF
      F200FFFFF200FFEBD800FFE5CA00FFE1BD00F3C7A700BD828100000000000000
      0000000000000000000000000000000000000000000000000000B8988800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3938400C1B9
      D0003243C700090FA60000009400000000000000000093717100967575005A53
      530052505000565454005653530054555500595A5A005554520094A0DE002B50
      E600436CF4001625B80000009800000000000000000000000000C38C8C00B37F
      7F00BF909000C1949400BE919100BA8B8B00B1838300A879790094606000824F
      4F00000000000000000000000000000000000000000000000000BD828100BD82
      8100BD828100FBEFE200FBE3CF00FBDDC200BD82810000000000000000000000
      0000000000000000000000000000000000000000000000000000B8988800B898
      8800B4938300B4938300B08E7D00B08E7D00AC887700AC887700A7827000BCA0
      92000000000000000000000000000000000000000000808282005C5F5F005E5E
      5E006262620062626200606060005C5C5C006B6B6B0000000000000000001522
      C1000D15AA000000980000009900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD828100BD828100BD8281000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B8200004B8200004B8200004B8200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007675740086848300868483000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F1E
      1F001F2325000D222B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B8200004B82000E99CA0007A0D400009AD7000090CC00004B8200004B
      8200000000000000000000000000000000000000000000000000000000000000
      000086848300ABAAAA00E5E5E500C5C5C4008684830086848300868483000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000D4663000362920006365100161A1F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F59E1001A57CA003767BF00415B9F001344B4000000
      000000000000000000000000000000000000000000000000000000000000004B
      820049D3E50052FEFF0034EDFF0020E3FF000DD7FF0003CFFF0000CEFF0000B6
      F200004B82000000000000000000000000000000000000000000000000008684
      8300B4B4B400FFFFFF00F8F8F800E7E7E700EEE7E300579D5700096909001F69
      1F0066776500868483000000000000000000BD4C0000BC4B0000BC4B0000B64A
      00001C414500165E8200745D65007D525400572D1F006C300400883A0300A342
      0100B84A0000BC4B0000BC4B0000000000000000000000000000000000000000
      0000317BEB005D8CD1009EA7B700C5B4AA00DEAB8B00F0995B00A4908C002358
      C200000000000000000000000000000000000000000000000000000000000000
      0000004B8200004B820047E3F40029C6EA0017BBE7000FC7F400004B8200004B
      820000000000000000000000000000000000000000000000000086848300C4C2
      C200FFFFFF00FFFFFF00FAFAFA00EBEBEB00F4EDE9005AA05A00016801000168
      010086AA8600B7B2B000868483005E5E5D00BD4C0000FFFFFF00FFFFFF00FFF8
      F20093A5A50062555D00DD908C00B87979008E5757005D3D3600846C5300A183
      6300E1B58600FECB9600BC4B00000000000000000000000000001676FF005F98
      E300FAD3A300FFD7A500FFDDA700FFD1A300E6A47800D9834F00FCC08B00E9D4
      C2005F8BD7001E60D80000000000000000000000000000000000000000000000
      00000000000000000000004B8200006DA100005C9000004B8200000000000000
      0000000000000000000000000000000000000000000086848300D7D7D700FFFF
      FF00FFFFFF00FFFFFF00FCFCFC00F3F3F300FCF4F0005DA45D00016801000168
      01008AB08A00D0CCCA00B2B2B2005C5C5B00BD4C0000FFFFFF00C0582D008936
      1C0086391F005D484A00E9A4A100CF909000B2757500875353005A3C35007F68
      4F00C59F7600FECB9600BC4B00000000000000000000000000002A68B800CAB7
      9E00FFEAC600FEE6C700FCE2C500EFC9AB00DA926800E69D6900F8D5B400FFEA
      D400FFFAEB00A6C5EF002D75E900000000000000000000000000000000000000
      0000000000000000000000000000006BA400005C900000000000000000000000
      0000000000000000000000000000000000000000000086848300FCFCFC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FBFBFB00FFFEFA0060A76000016801000168
      010090B59000D4D0CF00B4B4B2005C5C5B00BD4C0000FFFFFF00CB532A00FF5D
      3500FFFFFF00F396810084525000E2A1A100CE8F8F00B4767600865252005D3E
      3600B4916D00FECB9600BC4B000000000000000000001C76FF00AB753D00FFDD
      A100FEF4EA00FEF3E300FAE5D300E9BC9F00D4805100EAAC8100FCE6CF00FFF3
      E900FFFAF600FFFFFF0099B6E300135DE0000000000000000000004B8200004B
      8200004B82000000000000000000006CA500005C9000000000000A6096000B98
      DE000186AB00005D430002668900000000000000000086848300FFFEFF00FFFF
      FF009EB69D00658A6500C5D3C500FFFFFF00FFFFFF0064AB6400016801000168
      010096BB9600DDD9D800B8BAB800605D5F00BD4C0000FFFFFF00F0C5B8008981
      9900157BB6007E91A700D0A0900087595900E1A1A100CC8E8E00B07474008651
      510072422700FECB9600BC4B000000000000000000001A6AC7006EB45900FFF6
      E600FFFAF400FFFAF300F7E0D000E0A58400E1966600F3CCAD00B5B0A900DAD5
      D000FEFEFC00FFFFFE00B69193002A69D100004B8200004B82001EC0E7000BB2
      E60001ACE700004B8200094B7E00006FA500005C9000166F9F002FBFDD000972
      5D0003581100096F0C0001641600006A8B000000000086848300E5E9E3004C77
      4A0004560700005001000A450900BCCEBC00FFFFFF00D3E7D30064AB6400358F
      3500ACC9AC00E2E0DE00CCC5CC00354C3500BD4C0000FFFFFF0084BCEA00157B
      B6001F87E900157BB600B0D7F600DCCFC70089575300E6A6A600CA8B8B00B675
      7500814844003E414500BC4B00000000000000000000186F750062D18800FFFF
      FF00FFFEFB00FEFBF700EFD0BC00D9916800E39F7300FEE5D000F3EDE500BABB
      B800C2C4C100F4F0EF00807AA1002378FA00004B82001881AB001490BC000987
      BA000183BC000173AB00094A7D000172A500005C9000278AB500137A4C000156
      0000037A050016A62D000564140000577E000000000086848300134F13000A79
      16002BD44B0021BF3900015802000C440C00BDCEBF00FFFFFF00FFFFFF00F7F6
      F400E9EAE900EEEBEE00C2C2C200133E1300BD4C0000FFFFFF00145C8C00319F
      FC0035A3FF00157BB60084C1ED00FFFFFF00A74605009A6B6A00EFAAA9008C6D
      73002180A3000C98BD000C98BD000000000000000000093BC200C0D5EE00FFFF
      FF00FFFFFF00FEFCFA00E7CABC00DA976D00F2C09800E1D8CF00FBF6F200FFFF
      FF00EAE9E700A1C7F7002378FA000000000000000000004B8200000000000000
      000000000000004B8200000000000677A600005C900000000000004337000F99
      46000688050003680C0002544B000000000000000000115C160024BB42003AE9
      64002ED54F0026CB410019B12D00015603000A430A00BCCCBC00FFFFFF00FCFC
      FC00FFFFFF00B5C2B5001B521B00003E0000BD4C0000FFFFFF00004B8200319F
      FC00319FFC00004B8200C9E0EB00FFFFFF00BC4B0000DDCFC9009E5C56002D84
      A70007BCED00008EDE00000F9500000081001864E3001F42EF00FFFFFF00D8EA
      FF00A7CFFF0080B7FF003289FF005C96E500D5D7DC00D3CBC000B4B4B100E0E0
      E000FFFFFF00569EFF001673FF00000000000000000000000000014078000000
      000004457B0000000000000000000976A000005C900000000000000000000000
      0000046A4C0000000000000000000000000000000000056409004AFF7F0036E1
      5E002DD44E0025C740001FC0350013A72100005300000D440C00C0D0C000FFFF
      FF0081A08100043C04000041000000000000BD4C0000FFFFFF00D8E6EF00004B
      8200004B82005896B800F0F6F800FFFFFF00BC4B0000FFFFFF00D7C2BC00068F
      C1000196DE000320BA000318B200010B99001B75FF00398AFF004D99FF00589F
      FF00000000000000000000000000000000001974FF009DCAFF00EDEDEB00D5CE
      C000CEE2F800287FFF00000000000000000000000000000000001170A0001379
      A7000F76A5000F7EAD000672A700249FC50024A4CA000069A6000073B200006E
      A100006DB700006AA6000000000000000000000000000564090031CE530039E7
      64002DD44E0025C740001DBC330016B125000E9D180000530100104A1000416D
      410000370000004800000000000000000000BD4C0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC4B0000FFFFFF00FFFFFF00FFF8
      F2000263BF002F45ED001031D300010A95000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001974FF00ADD3
      FF005BA0FE001873FF0000000000000000000000000000000000187EAA001D8C
      B6001789B4001387B6000872A600157BAA001780AC00006AA5000079B5000076
      B7000079B500006EAB0000000000000000000000000000000000056409002ED0
      51002FD9520025C740001EBC330021C0390039E7620008930D00005500000039
      0000004A0000000000000000000000000000BD4C0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC4B0000FFFFFF00FFFFFF00FFFF
      FF00EEEFEF002732D0000C19B400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001974FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B8200004B820000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000564
      090028C5430027CC410020C1370039E7620039E76200048B0600016403000000
      000000000000000000000000000000000000BC4B0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B82003FF2FF0013E1FF00004B8200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000056409001FB836001FC0350005640900047F0600026D0300056409000000
      00000000000000000000000000000000000000000000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B0000BC4B
      0000BC4B0000BC4B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B8200004B8200004B8200004B8200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000564090005640900000000000143010005640900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000314B6200AC7D7E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000824B4B00824B4B00A64B4B00A94D4D004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005084B2000F6FE100325F8C00B87E
      7A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00824B
      4B00B64F5000C24F5000C54D4E00B24D4E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      000000000000004B0000004B0000000000000000000000000000000000000000
      00000000000000000000000000000000000032A0FE0037A1FF00106FE200325F
      8B00B67D79000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000F59E1001A57CA003767BF00415B9F001344B4000000
      0000000000000000000000000000000000000000000000000000824B4B00D458
      5900CB555600C9545500C9525300B74F52004E1E1F00FE8B8C00FB9A9C00F8AA
      AB00F7B5B600F7B5B600824B4B00000000000000000000000000000000000000
      0000004B00000E9D1D000E9D1D00004B00000000000000000000000000000000
      0000000000000000000000000000000000000000000037A4FE00379FFF000E6D
      DE00355F8900BB7F790000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000317BEB005D8CD1009EA7B700C5B4AA00DEAB8B00F0995B00A4908C002358
      C200000000000000000000000000000000000000000000000000824B4B00D75C
      5D00D05A5B00CF595A00CF575800BD5356004E1E1F0023B54A0013C1480016BD
      48000CBC4100F7B5B600824B4B0000000000000000000000000000000000004B
      00001CB1350011A422000E9D1D0011A42200004B000000000000000000000000
      000000000000000000000000000000000000000000000000000037A4FE00359E
      FF000F6FDE0035608B00A67B7F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001676FF005F98
      E300FAD3A300FFD7A500FFDDA700FFD1A300E6A47800D9834F00FCC08B00E9D4
      C2005F8BD7001E60D80000000000000000000000000000000000824B4B00DD63
      6400D75F6000D55E5F00D55C5D00C2575A004E1E1F002AB44D001CBF4C001EBC
      4C0013BC4500F7B5B600824B4B00000000000000000000000000004B00002EC6
      520024BC430013922400004B00000D931A000E9D1D00004B0000000000000000
      00000000000000000000000000000000000000000000000000000000000038A5
      FE00329DFF00156DCE00444F5B00000000009C6B6500AF887B00AF887E00AA80
      75000000000000000000000000000000000000000000000000002A68B800CAB7
      9E00FFEAC600FEE6C700FCE2C500EFC9AB00DA926800E69D6900F8D5B400FFEA
      D400FFFAEB00A6C5EF002D75E900000000000000000000000000824B4B00E368
      6900DD656600DA636400DE666700C6595B004E1E1F0026B1490016BC48001BBB
      490010BB4300F7B5B600824B4B000000000000000000004B000035CA5E0039D4
      65001CA13400004B000000000000004B00000A8615000E9D1D00004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003BABFF00A1CAE700AD867900A9837300E0CFB100FFFFDA00FFFFDD00FCF8
      CF00CCB29F00A1746B000000000000000000000000001C76FF00AB753D00FFDD
      A100FEF4EA00FEF3E300FAE5D300E9BC9F00D4805100EAAC8100FCE6CF00FFF3
      E900FFFAF600FFFFFF0099B6E300135DE0000000000000000000824B4B00EB6D
      6E00E2676800E67E7F00FAD3D400CC6E70004E1E1F00A5D8970050D16F0042C9
      66002DC75800F7B5B600824B4B00000000000000000000000000004B000029B5
      4800004B000000000000000000000000000000000000004B00000D931A00004B
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0917D00FCE9AC00FFFFCC00FFFFCF00FFFFD000FFFF
      DE00FFFFFA00E3D3D1009969650000000000000000001A6AC7006EB45900FFF6
      E600FFFAF400FFFAF300F7E0D000E0A58400E1966600F3CCAD00B5B0A900DAD5
      D000FEFEFC00FFFFFE00B69193002A69D1000000000000000000824B4B00F273
      7400E96C6D00EB818200FCD1D300CF6E70004E1E1F00FFF2CC00FFFFD700FFFF
      D400E6FCC700F7B5B600824B4B0000000000000000000000000000000000004B
      0000000000000000000000000000000000000000000000000000004B00000A86
      1500004B00000000000000000000000000000000000000000000000000000000
      00000000000000000000B0897800FAD19200FEF4C200FFFFD000FFFFDA00FFFF
      F600FFFFFC00FFFFFC00B69384000000000000000000186F750062D18800FFFF
      FF00FFFEFB00FEFBF700EFD0BC00D9916800E39F7300FEE5D000F3EDE500BABB
      B800C2C4C100F4F0EF00807AA1002378FA000000000000000000824B4B00F878
      7900F0757600EE727300F0737400D16566004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD700F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B000000000000000000000000000000000000000000000000
      000000000000B0897800FEDA9700EDB47800FBEEBB00FFFFD300FFFFDC00FFFF
      F400FFFFF400FFFFE200E9DDBC00A67B730000000000093BC200C0D5EE00FFFF
      FF00FFFFFF00FEFCFA00E7CABC00DA976D00F2C09800E1D8CF00FBF6F200FFFF
      FF00EAE9E700A1C7F7002378FA00000000000000000000000000824B4B00FE7F
      8000F77A7B00F6797A00F7777900D76B6B004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004B0000004B0000000000000000000000000000000000000000
      000000000000B18A7800FFDE9900E9A16700F4D19900FEFCCC00FFFFD500FFFF
      DA00FFFFDC00FFFFD700EFE6C500A97E75001864E3001F42EF00FFFFFF00D8EA
      FF00A7CFFF0080B7FF003289FF005C96E500D5D7DC00D3CBC000B4B4B100E0E0
      E000FFFFFF00569EFF001673FF00000000000000000000000000824B4B00FF83
      8400FC7F8000FB7E7F00FE7F8000DA6E6F004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA7F7300FAE0A400F0B77800EEBA7B00F6DDA600FEFBCC00FFFF
      D300FFFFD100FFFFD700D9C5A700A3756C001B75FF00398AFF004D99FF00589F
      FF00000000000000000000000000000000001974FF009DCAFF00EDEDEB00D5CE
      C000CEE2F800287FFF0000000000000000000000000000000000824B4B00FF88
      8900FF828300FF818200FF828300E07374004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEB29300FFFEDD00F4D1A500EEBA7B00F2C78F00F8E1
      AB00FCF0BA00FCFACA00A3776F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001974FF00ADD3
      FF005BA0FE001873FF0000000000000000000000000000000000824B4B00824B
      4B00E2757600FE818200FF868700E57677004E1E1F00FAEBC500FCFBD100FCFB
      CF00FCFBD100F7B5B600824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A1746B00E1D4D300FFFEEE00F7CC8C00F0B47300F7C7
      8800FCE3A500C2A08800A5776C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001974FF000000000000000000000000000000000000000000000000000000
      0000824B4B009C565700CB6C6D00CF6E6E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000098686500BA958700EAD7A400EAD59E00E0C0
      9700A5776C00A5776C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000824B4B00824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A77E7000A9807300A478
      6E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008F785100BB86
      7F00B7827800B7807600B67F7300B67E7100B57D6E00B57D6E00B57D6E00B57D
      6E00B67D6E00B5856900BA479100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1946600FFEA
      C600F8DCB100F5D8A700F4D19B00F3CD9100F0C68400EFC58000EFC58100EFC5
      8100F0C68100F3D37D00B1458A0000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A46769000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000000000000000000A46769008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D590080504B00000000000000000000000000000000009F926700FBE8
      CC00F2D8B800F1D2AE00EFCFA400EECA9B00EEC69000ECC18600E8BC7D00E8BC
      7E00E8BE7F00ECCB7A00B1448A0000000000A4676900FCEACE00F0D8BA00DCC1
      A000C4AA8900BFA48000CFAF8200DCB58100E2B87E00E7BC7E00E9BD7F00EFC4
      8100A4676900000000000000000000000000000000000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000000000000000000A4676900FCEACE00F3DA
      BC00F2D5B100F0D0A700EECB9E00EDC79300EDC28B00E9BD8100E9BD7F00E9BD
      7F00EFC4810080504B00000000000000000000000000000000009F936A00FCEC
      D500F4DDC000F1D7B600F3D3AE00F0CCA400E9C19400E5BD8B00E8BD8300E9BD
      7E00E9BE7F00EDCB7B00B1448A0000000000A0675B00FEEFDA00F6E0C600302D
      2D00212527003745460099846800AD926F00C2A07400DCB27A00E7BC7E00EFC4
      8100A4676900000000000000000000000000000000000005B7000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000005
      B7000005B70000000000000000000000000000000000A0675B00FEEFDA00F6E0
      C600F2DABC00F2D5B200C1C188000070000000700000BDB67200E9BD8200E9BD
      7F00EFC4810080504B0000000000000000000000000000000000A2976E00FFF4
      E400F5E2CD00F8E2C700DCCBA70080845D00676D460096866300E7BF8C00EDC1
      8700E9BE7E00EDCB7A00B1448A0000000000A0675B00FFF4E500F7E5CF009C8F
      80000D466300036292000B3B54004B474100917B5E00B5976C00D1AB7400E9BF
      7D00A467690000000000000000000000000000000000000000000005B7000005
      B7000005B70000000000000000000000000000000000000000000005B7000005
      B7000005B70000000000000000000000000000000000A0675B00FFF4E500F7E5
      CF0000700000C4CA970000700000C2C18700C0BD800000700000BDB66F00EABF
      8100EFC4800080504B0000000000000000000000000000000000A89D7400FFF9
      ED00FBE9D800FFE6D500A2A68100005D0000006300006C704A00E6BC9300E6BE
      8C00E9BE8200EDCA7A00B1448A0000000000A7756B00FFFBF000F8EADC00EEDD
      CA0022576C00165E8200745D65007D5254005E3F390086725800A78C6600CEAA
      7300A06567000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000005B7000005B7000005B7000000
      00000000000000000000000000000000000000000000A7756B00FFFBF000F8EA
      DC000070000000700000C4C99800F2D5B100F0D0A900BFBD800000700000EBC2
      8A00EFC5830080504B0000000000000000000000000000000000B1A47A00FFFF
      FF00E1DFCE00879073004B5D390000850D0000820900465730006C6F49009686
      6200E4BC8A00EECE8200B144890000000000A7756B00FFFFFC00FAF0E600F8EA
      DA008F9F9D0062555D00DD908C00B87979008E5757005B3D37007D6B51009A81
      5D00925C5E000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000005B7000005B7000000
      00000000000000000000000000000000000000000000A7756B00FFFFFC00FAF0
      E600007000000070000000700000F2DABA00F2D5B100F0D0A700EECB9D00EBC7
      9300F2C98C0080504B0000000000000000000000000000000000B6AA7D00FFFF
      FF00AAB89F00007402000D9D250015AB2C000FA1200001880F0000680000676D
      4500EAC29500F1D28D00B2448A0000000000BC826800FFFFFF00FEF7F200FAEF
      E600F0E5D5006B5D6200E9A4A100CF909000B275750087535300583C35007A69
      5000815354000000000000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000006F60000000000000000000000
      00000000000000000000000000000000000000000000BC826800FFFFFF00FEF7
      F200FAEFE600F8EAD900F7E3CF00F6E0C500007000000070000000700000EECC
      9E00F3CE970080504B0000000000000000000000000000000000BDB18000FFFF
      FF00ABBEA700007604000FA12B0020BE40001AB23400058F1600006700008084
      5A00F1CDA300F4D99700B3468B0000000000BC826800FFFFFF00FFFEFC00FCF6
      F000FAEFE600EBDCCE008C5E5D00E2A1A100CE8F8F00B4767600865252005C3F
      3800764C4E000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B7000005B7000005B7000006F600000000000000
      00000000000000000000000000000000000000000000BC826800FFFFFF00FFFE
      FC0000700000CADABA00F7EADA00F6E3CF00C5CE9F000070000000700000F0D0
      A600F6D3A00080504B0000000000000000000000000000000000C3B38100FFFF
      FF00E9F0EA00B2C2AD00778A690013A6330013A73300495B3700A2A37E00DCCB
      A600F9D8AF00E8D29A00A5428A0000000000D1926D00FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500E1CEC00087595800E1A1A100CC8E8E00B07474008651
      5100633B3C000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000005B70000000000000000000006F6000006F6000000
      00000000000000000000000000000000000000000000D1926D00FFFFFF00FFFF
      FF00CEE7CC0000700000CADAB800C9D7B00000700000C6CC9E0000700000F4D8
      B100EBCFA40080504B0000000000000000000000000000000000CABB8200FFFF
      FF00FFFFFF00FFFFFF00B1C1AC00007C0C00007F1000878F7100FFECDA00FFEC
      CF00CEBEA500A1A183009E428B0000000000D1926D00FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500D7C1B5008A5B5B00E6A6A600CA8B8B00B675
      75007E4442003E41450000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F60000000000000000000006F6000006F6000006
      F6000000000000000000000000000000000000000000D1926D00FFFFFF00FFFF
      FF00FFFFFF00CEE7CC000070000000700000C9D5B000F8E7D100FBEACE00DECE
      B400B6AA930080504B0000000000000000000000000000000000D0BE8500FFFF
      FF00FFFFFF00FFFFFF00E9F0EA00AABDA600A8B69B00E6E4D200E2C4B400A77C
      72008D6D6B008D756600AC4A840000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600CFB5AA0097666600EFAAA9008C6D
      73001E799F000C98BD000C98BD000000000000000000000000000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000006
      F6000006F60000000000000000000000000000000000DA9D7500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900A0675B00A067
      5B00A0675B00A0675B0000000000000000000000000000000000D7C58700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC969000C88E
      6200F3A23F00E1981400D02BC20000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00955F56009E5D58002D84
      A70006BBF000008EDE00000F950000008100000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DA9D7500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00A0675B00E19E
      5500E68F3100B56D4D0000000000000000000000000000000000DAC78900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C09E9A00D39A
      6800E2B03B00CA3CA8000000000000000000E7AB7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A56B5F00D1914F00068F
      C1000393DE000320BA000318B200010B9900000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500A0675B00F8B5
      5C00BF7A5C000000000000000000000000000000000000000000D5D07900F9FF
      EA00F6FEE100F4FDE100F3FCE000F2FBDF00EFFADF00F4FFE800BAA88F00BA9D
      4B00CE20C400000000000000000000000000E7AB7900FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B5F00C1836C000000
      00000263BF002F45ED001031D300010A9500000000000006F6000006F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900FBF4F000FBF4
      EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A0675B00C183
      6C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B5F00000000000000
      0000000000002732D0000C19B400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800A0675B000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFE7F00000000
      FFFFFC3F00000000FFFFFC3F00000000FFFFFC3F00000000FFFFFC3F00000000
      E007C00300000000C003800100000000C003800100000000E007C00300000000
      FFFFFC3F00000000FFFFFC3F00000000FFFFFC3F00000000FFFFFC3F00000000
      FFFFFE7F00000000FFFFFFFF00000000F33FFFFFFFFFFFFFE007C00380FFFFF1
      C000C003801FE0018001C003801FC0010000C003801FC0030000C003801FC007
      0000C003801FC00F8000C003800FC00FE001C003800FC00FF003C0038007C00F
      F01FC0018003C00FE03FC0018001C00FE03FC0018001C00FC03FC0018001C00F
      C07FC00F8061FFFFF8FFFFFFFFFFFFFFFFFFFC3FF8FFE3FFFFFFF00FF01FF0FF
      FC1FE007E0030001F00FF00FC0000001C003FC3F80000001C001FE7F80000001
      8000C64180000001800000008000000180000000800000018001BA4180000000
      0001D677800100000F03C00380030000FFC3C003C0070001FFF7FE7FE01F0001
      FFFFFC3FF01F8003FFFFFC3FF93FFFFFFE7FFFFF9FFFFFFFF07FFFFF0FFFFFFF
      C001F9FF07FFFC1FC001F0FF83FFF00FC001E07FC1FFC003C001C03FE10FC001
      C001821FF0038000C001C78FFC018000C001EFC7FC018000C001FFF3F8008001
      C001FFF9F8000001C001FFFFF8000F03C001FFFFFC01FFC3C001FFFFFC01FFF7
      F001FFFFFE03FFFFFC7FFFFFFF8FFFFFC001FFFFFFFFFFFFC0010007FFF98003
      C00100079FF98003C001000787E78003C0010007C7C78003C0010007F11F8003
      C0010007F81F8003C0010007FC7F8003C0010007F83F8003C0010007F19F8003
      C0010003E18F8003C0010001C7E78003C001000087FF8003C00300009FFF8007
      C00700109FFF800FFFFF0039FFFF801F00000000000000000000000000000000
      000000000000}
  end
  object Edit_PopupMenu: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = Subsidy_Modify
        Visible = True
      end
      item
        Item = Lgots_Modify
        Visible = True
      end>
    UseOwnFont = False
    Left = 80
    Top = 48
  end
  object Electorat_Menu: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = AddToElectorat
        Visible = True
      end
      item
        Item = DelFromElectorat
        Visible = True
      end>
    UseOwnFont = False
    Left = 440
    Top = 280
  end
end
