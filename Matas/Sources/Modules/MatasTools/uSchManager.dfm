object SchManagerForm: TSchManagerForm
  Left = 338
  Top = 161
  BorderStyle = bsDialog
  ClientHeight = 362
  ClientWidth = 592
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 45
    Width = 592
    Height = 317
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = MatSchDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle2
      Styles.Content = cxStyle2
      Styles.Header = cxStyle11
      object cxGrid1DBTableView1ID_SCH: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_SCH'
      end
      object cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn
        Width = 69
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxGrid1DBTableView1SCH_TITLE: TcxGridDBColumn
        Width = 309
        DataBinding.FieldName = 'SCH_TITLE'
      end
      object cxGrid1DBTableView1SCH_TYPE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SCH_TYPE'
      end
      object cxGrid1DBTableView1LINK_TO: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'LINK_TO'
      end
      object cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DATE_BEG'
      end
      object cxGrid1DBTableView1DATE_END: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DATE_END'
      end
      object cxGrid1DBTableView1TYPE_OBJECT: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'TYPE_OBJECT'
      end
      object cxGrid1DBTableView1SCH_OBJ_TYPE_TITLE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SCH_OBJ_TYPE_TITLE'
      end
      object cxGrid1DBTableView1SCH_TYPE_TITLE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SCH_TYPE_TITLE'
      end
      object cxGrid1DBTableView1ID_SYSTEM: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_SYSTEM'
      end
      object cxGrid1DBTableView1BAL_ID_SCH: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'BAL_ID_SCH'
      end
      object cxGrid1DBTableView1BAL_SCH_NUMBER: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'BAL_SCH_NUMBER'
      end
      object cxGrid1DBTableView1BAL_SCH_TITLE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'BAL_SCH_TITLE'
      end
      object cxGrid1DBTableView1SYSTEM_TEXT: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SYSTEM_TEXT'
      end
      object cxGrid1DBTableView1KOD_SYSTEM: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'KOD_SYSTEM'
      end
      object cxGrid1DBTableView1IS_BLOCKED: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'IS_BLOCKED'
      end
      object cxGrid1DBTableView1OPEN_SCH: TcxGridDBColumn
        Width = 76
        DataBinding.FieldName = 'OPEN_SCH'
      end
      object cxGrid1DBTableView1ID_REG_UCH: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_REG_UCH'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 45
    Align = alTop
    TabOrder = 1
    object cxBlockSch: TcxButton
      Left = 296
      Top = 9
      Width = 140
      Height = 26
      Caption = #1041#1083#1086#1082#1091#1074#1072#1090#1080' '#1088#1072#1093#1091#1085#1082#1080
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF01079F0313A90418AE0419AE0313A90108A0FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01049D041CB10730C00734C407
        35C50735C50734C30731C1041FB301069EFF00FFFF00FFFF00FFFF00FFFF00FF
        0109A1052BC30735C70733C20732C20732C20732C20732C20733C30735C4062D
        BE020CA4FF00FFFF00FFFF00FF01049B052BCA0636D80431CD0027C4032EC107
        32C20732C20430C10027BF042FC10735C4072EBE01069EFF00FFFF00FF031ABA
        0537E70331DD123DD86480E01840CB002CC1022DC00F38C46580D91B43C7052F
        C10735C5051FB3FF00FF01049E0430E40436F1002AE45070E9FFFFFFB7C4F10D
        36CA042DC3A2B2E8FFFFFF6984DA0026BE0733C30731C10108A0020FAF0336FA
        0335F80232EE0A35E88CA2F2FFFFFFB4C2F1A9B8EDFFFFFFA7B7E9133AC4052F
        C10732C20734C40313AA0619BC1747FE093AFC0435F80131F0002BE891A5F4FF
        FFFFFFFFFFABBAEF062FC5022DC00732C20732C20736C50419AE0B1DBE4168FE
        1C49FC0335FB0031F90531F2A4B5F7FFFFFFFFFFFFB9C6F20D36D0002CC60732
        C20732C20736C50418AD0613B45B7CFC486CFD0133FB113CFBA1B4FEFFFFFFA4
        B6F892A7F5FFFFFFB6C4F21A41D3042FC80732C40734C30212A90003A04A6AF3
        8FA6FF1F46FB4C6FFCFFFFFFA7B8FE0733F6002AED8CA2F6FFFFFF627FE70028
        D00734CC0730C300069FFF00FF1A2FCB99AFFF8BA2FE214DFB4D71FC0E3DFB00
        30FB0031F70636F14C6EF1103CE30432DB0636D7041CB5FF00FFFF00FF0004A0
        415EECB8C7FF9CAFFD3A5CFC0A3AFB0335FB0335FB0133F9052FF20635EB0537
        E9052CCD00049CFF00FFFF00FFFF00FF0309A54260ECA9BBFFBDCAFF8EA5FE64
        83FD5073FC4A6EFD3961FD1444F9042CD70109A2FF00FFFF00FFFF00FFFF00FF
        FF00FF0004A01E32CD5876F6859EFE8BA3FF7994FE5376FC234AF0051EC50104
        9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0004A00917B610
        22C30D1FC20311B401059FFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxOpenSch: TcxButton
      Left = 8
      Top = 9
      Width = 140
      Height = 26
      Caption = #1042#1110#1076#1082#1088#1080#1090#1080' '#1088#1072#1093#1091#1085#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cxOpenSchClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710AFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF05710A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF05710A05710A05710A05710A05710A05710A20B33505710AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A76F9A776F9A776
        F9A76BF09751DA7533C24D19AC2A05710AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF05710A05710A05710A05710A05710A05710A47D36805710AFF00
        FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78D51C5996FF00FFFF
        00FFFF00FF05710A05710AE4F0FC1C78D51C78D51C78D51C78D51C78D582C6F9
        57BCFF4EB5FF4DB4FF1C5996FF00FFFF00FFFF00FF05710AFF00FFE4F0FC2A95
        FF369BFF379CFF1C78D51C78D57DC3F756BCFF4EB4FE4DB3FF1C5996FF00FFFF
        00FFFF00FFFF00FFFF00FFE4F0FC2893FF3499FF359AFF1C78D51C78D580C6F9
        5BC1FF53BAFF52B8FF1C5996FF00FFFF00FFFF00FFFF00FFFF00FFE4F0FC1F8E
        FF2B95FF2C96FF1C78D51C78D580C6F95BC1FF53BAFF52B8FF1C5996FF00FFFF
        00FFFF00FFFF00FFFF00FFE4F0FCE4F0FCE4F0FCE4F0FCE4F0FC1C78D5629DCF
        3589CF3589CF3589CF1C59961C59961C59961C59961C59961C5996FF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D586CCF965CBFF5DC3FF5CC4FF3589CF53BAFF53
        BAFF4EB4FF4DB4FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FF1C78D584C9F7
        65CAFF5EC3FE5EC4FF3589CF53BAFF54BAFF4FB4FE4FB4FF1C78D5FF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D585CBF864CBFF5EC6FF5EC7FF3589CF53BAFF55
        BDFF50B7FF50B7FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FF1C78D59ECFF5
        92D7FD88D2FC8CD5FD629DCF85CEFD85CEFD80C9FC84CBFD1C78D5FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78D51C78D51C78D51C
        78D51C78D51C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxCloseSch: TcxButton
      Left = 152
      Top = 9
      Width = 140
      Height = 26
      Caption = #1047#1072#1082#1088#1080#1090#1080' '#1088#1072#1093#1091#1085#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = cxCloseSchClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710AFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05
        710A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF05710A76F9A705710A05710A05710A05710A0571
        0A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A76F9A776
        F9A76FF39E5BE38342CE6128B93F14A82405710AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF05710A76F9A705710A05710A05710A05710A0571
        0A05710AFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78D51C5996FF00FF05
        710A05710AFF00FFFF00FFE4F0FC1C78D51C78D51C78D51C78D51C78D582C6F9
        57BCFF4EB5FF4DB4FF1C5996FF00FFFF00FF05710AFF00FFFF00FFE4F0FC2A95
        FF369BFF379CFF1C78D51C78D57DC3F756BCFF4EB4FE4DB3FF1C5996FF00FFFF
        00FFFF00FFFF00FFFF00FFE4F0FC2893FF3499FF359AFF1C78D51C78D580C6F9
        5BC1FF53BAFF52B8FF1C5996FF00FFFF00FFFF00FFFF00FFFF00FFE4F0FC1F8E
        FF2B95FF2C96FF1C78D51C78D580C6F95BC1FF53BAFF52B8FF1C5996FF00FFFF
        00FFFF00FFFF00FFFF00FFE4F0FCE4F0FCE4F0FCE4F0FCE4F0FC1C78D5629DCF
        3589CF3589CF3589CF1C59961C59961C59961C59961C59961C5996FF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D586CCF965CBFF5DC3FF5CC4FF3589CF53BAFF53
        BAFF4EB4FF4DB4FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FF1C78D584C9F7
        65CAFF5EC3FE5EC4FF3589CF53BAFF54BAFF4FB4FE4FB4FF1C78D5FF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D585CBF864CBFF5EC6FF5EC7FF3589CF53BAFF55
        BDFF50B7FF50B7FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FF1C78D59ECFF5
        92D7FD88D2FC8CD5FD629DCF85CEFD85CEFD80C9FC84CBFD1C78D5FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78D51C78D51C78D51C
        78D51C78D51C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object ExitButton: TcxButton
      Left = 460
      Top = 9
      Width = 125
      Height = 26
      Caption = 'Exit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 3
      OnClick = ExitButtonClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
        FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
        00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
        F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
        00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
        6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
        A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
        A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
        ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
        ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
        6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
        F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
        00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
        00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
        FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      NumGlyphs = 2
      UseSystemPaint = False
    end
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WorkTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 56
    Top = 176
  end
  object StyleRepository: TcxStyleRepository
    Left = 32
    Top = 24
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
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
  object MatSchDataSet: TpFIBDataSet
    Database = dmMatas.fdbMatas
    Transaction = dmMatas.ftrReadTransaction
    UpdateTransaction = dmMatas.ftrWriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_SP_SCH_SELECT(:DATE)'
      ' ORDER BY SCH_NUMBER'
      '')
    Left = 96
    Top = 160
    poSQLINT64ToBCD = True
    object MatSchDataSetID_SCH: TFIBIntegerField
      FieldName = 'ID_SCH'
    end
    object MatSchDataSetSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object MatSchDataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object MatSchDataSetSCH_TYPE: TFIBIntegerField
      FieldName = 'SCH_TYPE'
    end
    object MatSchDataSetLINK_TO: TFIBIntegerField
      FieldName = 'LINK_TO'
    end
    object MatSchDataSetDATE_BEG: TFIBDateTimeField
      FieldName = 'DATE_BEG'
    end
    object MatSchDataSetDATE_END: TFIBDateTimeField
      FieldName = 'DATE_END'
    end
    object MatSchDataSetTYPE_OBJECT: TFIBIntegerField
      FieldName = 'TYPE_OBJECT'
    end
    object MatSchDataSetSCH_OBJ_TYPE_TITLE: TFIBStringField
      FieldName = 'SCH_OBJ_TYPE_TITLE'
      Size = 30
      EmptyStrToNull = True
    end
    object MatSchDataSetSCH_TYPE_TITLE: TFIBStringField
      FieldName = 'SCH_TYPE_TITLE'
      Size = 30
      EmptyStrToNull = True
    end
    object MatSchDataSetID_SYSTEM: TFIBIntegerField
      FieldName = 'ID_SYSTEM'
    end
    object MatSchDataSetBAL_ID_SCH: TFIBIntegerField
      FieldName = 'BAL_ID_SCH'
    end
    object MatSchDataSetBAL_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object MatSchDataSetBAL_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object MatSchDataSetSYSTEM_TEXT: TFIBStringField
      FieldName = 'SYSTEM_TEXT'
      Size = 100
      EmptyStrToNull = True
    end
    object MatSchDataSetKOD_SYSTEM: TFIBIntegerField
      FieldName = 'KOD_SYSTEM'
    end
    object MatSchDataSetIS_BLOCKED: TFIBIntegerField
      FieldName = 'IS_BLOCKED'
    end
    object MatSchDataSetOPEN_SCH: TFIBDateField
      FieldName = 'OPEN_SCH'
    end
    object MatSchDataSetID_REG_UCH: TFIBIntegerField
      FieldName = 'ID_REG_UCH'
    end
  end
  object MatSchDataSource: TDataSource
    DataSet = MatSchDataSet
    Left = 128
    Top = 160
  end
  object SaldoDataSet: TpFIBDataSet
    Database = dmMatas.fdbMatas
    Transaction = dmMatas.ftrReadTransaction
    UpdateTransaction = dmMatas.ftrWriteTransaction
    Left = 96
    Top = 208
    poSQLINT64ToBCD = True
  end
  object WorkTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 136
    Top = 208
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 56
    Top = 232
  end
  object WorkStoredProc: TpFIBStoredProc
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 200
    Top = 208
  end
end
