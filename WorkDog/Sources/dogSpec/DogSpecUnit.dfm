object frmDogSpec: TfrmDogSpec
  Left = 517
  Top = 466
  Width = 763
  Height = 530
  Caption = #1057#1087#1077#1094#1080#1092#1110#1082#1072#1094#1110#1111
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    000001000800000000004001000000000000000000000000000000000000D694
    7300CE8C6B009C635A00BD735A00FFFFFF00F7B56B0094635A00FFFFF700FFC6
    6300F7A54200CE947300FFFFEF00CE8C7300FFF7E700FFF7DE00DECEB500B5AD
    940084524A00C68C6B00FFEFD600F7DEB500EFD6A500BD846B00FFEFCE00FFE7
    C600FFE7BD00B57B6B00FFF7EF00FFEFC600FFE7B500FFDEB500AD7B6300FFDE
    AD00FFDEA500A5736300F7D69C00A56B6300FFD69C00F7D694009C6B5A00F7D6
    8C00F7CE8C00F7CE9400F7CE84008C5A5A00945A5A0000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000002E2E
    2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2C2D2D2D2D2D2D2D2D2D2D112E2E2E2E
    061D20212123262A29292B112E2E2E2E06191D2020210606060629112E2E2E2E
    271718191D202125232628112E2E2E2E24130618061D0620062526112E2E2E2E
    220E13171C18191E202123112E2E2E2E1F0D0606060606191D2021112E2E2E2E
    1A0B1B0D0E13171C191D1E112E2E2E2E1607060606060613171819112E2E2E2E
    120404070B0D0D0E131415112E2E2E2E0C0406060606060D0E0F10112E2E2E2E
    0A0406040407060B020202022E2E2E2E0004060606060607020809032E2E2E2E
    00040404040404040205032E2E2E2E2E000101010101010102032E2E2E2EFFFF
    FFFFC003FFFFC003FFFFC003FFFFC003FFFFC003FFFFC003FFFFC003FFFFC003
    FFFFC003FFFFC003FFFFC003FFFFC003FFFFC003FFFFC007FFFFC00FFFFF}
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 48
    Width = 755
    Height = 435
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 0
      Top = 17
      Width = 755
      Height = 377
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'ID_SPEC'
            Column = cxGrid1DBTableView1NAME_MATERIAL
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxGrid1DBTableView1SUMMA
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMMA_NDS'
            Column = cxGrid1DBTableView1SUMMA_NDS
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = cxGrid1DBTableView1NAME_MATERIAL
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGrid1DBTableView1ID_SPEC: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'ID_SPEC'
        end
        object cxGrid1DBTableView1NAME_MATERIAL: TcxGridDBColumn
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 203
          DataBinding.FieldName = 'NAME_MATERIAL'
        end
        object cxGrid1DBTableView1VOLUME: TcxGridDBColumn
          Caption = #1054#1073#39#1101#1084
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.0000'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 50
          DataBinding.FieldName = 'VOLUME'
        end
        object cxGrid1DBTableView1PLAN_PRICE: TcxGridDBColumn
          Caption = #1055#1083#1072#1085#1086#1074#1072' '#1094#1110#1085#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0.0000'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 112
          DataBinding.FieldName = 'PLAN_PRICE'
        end
        object cxGrid1DBTableView1SUMMA: TcxGridDBColumn
          Caption = #1042#1072#1088#1090#1110#1089#1090#1100
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.0000'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 75
          DataBinding.FieldName = 'SUMMA'
        end
        object cxGrid1DBTableView1SUMMA_NDS: TcxGridDBColumn
          Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1079' '#1055#1044#1042
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.0000'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 81
          DataBinding.FieldName = 'SUMMA_NDS'
        end
        object cxGrid1DBTableView1TOP_PRICE: TcxGridDBColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'TOP_PRICE'
        end
        object cxGrid1DBTableView1TOP_PRICE_PERCENT: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'TOP_PRICE_PERCENT'
        end
        object cxGrid1DBTableView1BOTTOM_PRICE: TcxGridDBColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'BOTTOM_PRICE'
        end
        object cxGrid1DBTableView1BOTTOM_PRICE_PERCENT: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'BOTTOM_PRICE_PERCENT'
        end
        object cxGrid1DBTableView1ID_MATERIAL: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'ID_MATERIAL'
        end
        object cxGrid1DBTableView1TP: TcxGridDBColumn
          Caption = #1042#1077#1088#1093#1085#1103' '#1094#1110#1085#1072' (%)'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 71
          DataBinding.FieldName = 'TP'
        end
        object cxGrid1DBTableView1BP: TcxGridDBColumn
          Caption = #1053#1080#1078#1085#1103' '#1094#1110#1085#1072' (%)'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 81
          DataBinding.FieldName = 'BP'
        end
        object cxGrid1DBTableView1LAST_PRICE: TcxGridDBColumn
          Caption = #1054#1089#1090#1072#1085#1085#1103' '#1094#1110#1085#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.0000'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 80
          DataBinding.FieldName = 'LAST_PRICE'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 394
      Width = 755
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 89
        Height = 13
        Caption = #1064#1091#1082#1072#1090#1080' '#1084#1072#1090#1077#1088#1080#1072#1083
      end
      object FilterEdit: TcxTextEdit
        Left = 8
        Top = 16
        Width = 217
        Height = 21
        Properties.OnChange = cxTextEdit1PropertiesChange
        Style.Color = clMoneyGreen
        TabOrder = 0
      end
      object cxDBMemo1: TcxDBMemo
        Left = 296
        Top = 0
        Width = 369
        Height = 41
        DataBinding.DataField = 'COMMENT'
        DataBinding.DataSource = DataSource
        Style.Color = clSilver
        TabOrder = 1
      end
      object cxLabel1: TcxLabel
        Left = 227
        Top = 0
        Width = 70
        Height = 17
        TabOrder = 2
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 755
      Height = 17
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label2: TLabel
        Left = 6
        Top = 2
        Width = 113
        Height = 13
        Caption = #1057#1091#1084#1072' '#1082#1086#1096#1090#1086#1088#1080#1089#1091' = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 118
        Top = 2
        Width = 8
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 483
    Width = 755
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'Ins - '#1044#1086#1076#1072#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F2 - '#1047#1084#1110#1085#1080#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'Del - '#1042#1080#1076#1072#1083#1080#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F3 - '#1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F5 - '#1042#1110#1076#1085#1086#1074#1080#1090#1080
        Width = 100
      end>
    PaintStyle = stpsXP
    LookAndFeel.NativeStyle = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object DataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WriteTransaction
    Options = [poRefreshAfterPost, poStartTransaction]
    SelectSQL.Strings = (
      'select * from DOG_DT_SPEC_SEL(:ID_DOG)'
      '')
    OnCalcFields = DataSetCalcFields
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 16
    Top = 88
    poSQLINT64ToBCD = True
    poAskRecordCount = True
    object DataSetID_SPEC: TFIBBCDField
      FieldName = 'ID_SPEC'
      Size = 0
      RoundByScale = True
    end
    object DataSetPLAN_PRICE: TFIBBCDField
      FieldName = 'PLAN_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DataSetTOP_PRICE: TFIBBCDField
      FieldName = 'TOP_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DataSetTOP_PRICE_PERCENT: TFIBBCDField
      FieldName = 'TOP_PRICE_PERCENT'
      Size = 4
      RoundByScale = True
    end
    object DataSetBOTTOM_PRICE: TFIBBCDField
      FieldName = 'BOTTOM_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DataSetBOTTOM_PRICE_PERCENT: TFIBBCDField
      FieldName = 'BOTTOM_PRICE_PERCENT'
      Size = 4
      RoundByScale = True
    end
    object DataSetID_MATERIAL: TFIBBCDField
      FieldName = 'ID_MATERIAL'
      Size = 0
      RoundByScale = True
    end
    object DataSetNAME_MATERIAL: TFIBStringField
      FieldName = 'NAME_MATERIAL'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetTP: TStringField
      FieldKind = fkCalculated
      FieldName = 'TP'
      Calculated = True
    end
    object DataSetBP: TStringField
      FieldKind = fkCalculated
      FieldName = 'BP'
      Calculated = True
    end
    object DataSetCOMMENT: TFIBStringField
      FieldName = 'COMMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetLAST_PRICE: TFIBBCDField
      FieldName = 'LAST_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DataSetVOLUME: TFIBBCDField
      FieldName = 'VOLUME'
      Size = 4
      RoundByScale = True
    end
    object DataSetPLAN_COST: TFIBBCDField
      FieldName = 'PLAN_COST'
      Size = 4
      RoundByScale = True
    end
    object DataSetPLAN_COST_NDS: TFIBBCDField
      FieldName = 'PLAN_COST_NDS'
      Size = 4
      RoundByScale = True
    end
    object DataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 4
      RoundByScale = True
    end
    object DataSetSUMMA_NDS: TFIBBCDField
      FieldName = 'SUMMA_NDS'
      Size = 4
      RoundByScale = True
    end
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 264
    Top = 152
  end
  object WriteProc: TpFIBStoredProc
    Database = WorkDatabase
    Transaction = WriteTransaction
    Left = 8
    Top = 184
  end
  object ReadDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WriteTransaction
    Options = [poRefreshAfterPost, poStartTransaction]
    SelectSQL.Strings = (
      'select * from DOG_DT_SPEC_SEL(:id_spec)')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 40
    Top = 184
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object dxBarManager1: TdxBarManager
    AlwaysMerge = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        Caption = #1055#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
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
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
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
            Item = RefreshButton
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = ExitButton
            Visible = True
          end>
        MultiLine = True
        Name = #1055#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    ButtonArrowWidth = 13
    CanCustomize = False
    Categories.Strings = (
      #1057#1090#1072#1085#1076#1072#1088#1090#1085#1099#1077' '#1076#1077#1081#1089#1090#1074#1080#1103)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = LargeImages
    DisabledImages = DisabledSmallImages
    DisabledLargeImages = DisabledLargeImages
    LargeImages = LargeImages
    LookAndFeel.Kind = lfUltraFlat
    NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
    PopupMenuLinks = <>
    StretchGlyphs = False
    UseSystemFont = True
    Left = 264
    Top = 280
    DockControlHeights = (
      0
      0
      48
      0)
    object AddButton: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1076#1086#1075#1086#1074#1110#1079' '#1079' '#1074#1080#1073#1086#1088#1086#1084' '#1090#1080#1087#1091
      Visible = ivAlways
      ImageIndex = 0
      ShortCut = 45
      OnClick = AddButtonClick
      AutoGrayScale = False
    end
    object EditButton: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1086#1073#1088#1072#1085#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
      Visible = ivAlways
      ImageIndex = 1
      ShortCut = 113
      OnClick = EditButtonClick
      AutoGrayScale = False
    end
    object DeleteButton: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1086#1073#1088#1072#1085#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
      Visible = ivAlways
      ImageIndex = 2
      OnClick = DeleteButtonClick
      AutoGrayScale = False
    end
    object RefreshButton: TdxBarLargeButton
      Caption = #1042#1110#1076#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1080' '#1076#1072#1085#1110' '#1090#1072#1073#1083#1080#1094#1110' (F5)'
      Visible = ivAlways
      ImageIndex = 3
      OnClick = RefreshButtonClick
      AutoGrayScale = False
    end
    object ExitButton: TdxBarLargeButton
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Category = 0
      Hint = #1047#1072#1082#1088#1080#1090#1080' (ESC)'
      Visible = ivAlways
      ImageIndex = 5
      OnClick = ExitButtonClick
      AutoGrayScale = False
    end
    object ViewButton: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1076' '#1076#1086#1075#1086#1074#1110#1088#1072
      Visible = ivAlways
      ImageIndex = 7
      ShortCut = 114
      AutoGrayScale = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Tag = 1
      Caption = #1044#1086#1076#1072#1090#1080' '#1079' '#1096#1072#1073#1083#1086#1085#1091
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1079' '#1096#1072#1073#1083#1086#1085#1091
      Visible = ivNever
      ImageIndex = 0
      OnClick = AddButtonClick
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Tag = 2
      Caption = #1044#1086#1076#1072#1090#1080' '#1075#1088#1091#1087#1087#1091
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080' '#1075#1088#1091#1087#1087#1091
      Visible = ivNever
      ImageIndex = 0
      OnClick = AddButtonClick
      AutoGrayScale = False
    end
  end
  object WorkDatabase: TpFIBDatabase
    DBName = 'it-server:test_dn'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=tpfibdataset'
      'sql_role_name=')
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 8
    Top = 152
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 280
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
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
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle9
      Styles.IncSearch = cxStyle10
      Styles.Selection = cxStyle13
      Styles.FilterBox = cxStyle4
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle14
      Styles.GroupByBox = cxStyle4
      Styles.Header = cxStyle4
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
  end
  object DisabledLargeImages: TImageList
    Height = 24
    Width = 24
    Left = 184
    Top = 216
    Bitmap = {
      494C01010E001300040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00A5A5A5009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C009C9C9C00A5A5A500ADADAD00ADADAD00ADADAD009C9C9C00B5B5B500A5A5
      A500CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6C600BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00949494000000000000000000000000000000
      000000000000000000008C8C8C008C8C8C008C8C8C0000000000000000000000
      0000000000008C8C8C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C00ADADAD00BDBD
      BD00BDBDBD00BDBDBD00B5B5B500B5B5B500ADADAD009C9C9C00B5B5B500A5A5
      A500D6D6D600CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6C600C6C6
      C600BDBDBD00BDBDBD00BDBDBD00949494000000000000000000000000000000
      0000000000008C8C8C00BDBDBD00ADADAD00A5A5A5008C8C8C008C8C8C009C9C
      9C008C8C8C00DEDEDE00D6D6D6008C8C8C008C8C8C008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00D6D6D600DEDEDE00D6D6
      D600CECECE00BDBDBD00B5B5B500B5B5B500ADADAD009C9C9C00B5B5B500A5A5
      A500D6D6D600ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00BDBDBD00949494000000000000000000000000000000
      00008C8C8C00D6D6D600CECECE00B5B5B500B5B5B500B5B5B5009C9C9C008484
      8400C6C6C600D6D6D600D6D6D600D6D6D600D6D6D600CECECE008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00EFEFEF00E7E7
      E700DEDEDE0084848400ADADAD00C6C6C600B5B5B5009C9C9C0084848400ADAD
      AD00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600CECECE00CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C600949494000000000000000000000000008C8C
      8C00D6D6D600DEDEDE00CECECE00B5B5B500B5B5B500B5B5B500848484002121
      2100212121004242420084848400BDBDBD00CECECE00CECECE00CECECE00CECE
      CE00CECECE008C8C8C008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00F7F7F700EFEF
      EF00E7E7E700848484009C9C9C00CECECE00BDBDBD009C9C9C00848484008484
      8400E7E7E700ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00C6C6C6009494940000000000000000008C8C8C00D6D6
      D600D6D6D600D6D6D6009C9C9C009C9C9C009C9C9C009C9C9C008C8C8C004242
      4200313131002121210021212100212121004242420084848400BDBDBD00CECE
      CE00CECECE00C6C6C600C6C6C6008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00F7F7F700F7F7
      F700EFEFEF008484840084848400D6D6D600C6C6C6009C9C9C00848484009C9C
      9C0084848400E7E7E700DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6
      D600CECECE00CECECE00CECECE0094949400000000008C8C8C00CECECE00CECE
      CE00CECECE009C9C9C00C6C6C600C6C6C600B5B5B500B5B5B500B5B5B500ADAD
      AD00ADADAD009C9C9C007B7B7B005A5A5A003131310021212100212121004242
      42008C8C8C009C9C9C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00F7F7F700F7F7
      F700F7F7F70084848400B5B5B500848484009C9C9C008C8C8C00848484009C9C
      9C009C9C9C0084848400ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00CECECE0094949400000000008C8C8C00CECECE00CECE
      CE009C9C9C00D6D6D600EFEFEF00EFEFEF00E7E7E700DEDEDE00CECECE00C6C6
      C600B5B5B500B5B5B500B5B5B500B5B5B500ADADAD008C8C8C00525252002929
      29004A4A4A00ADADAD008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00F7F7F700E7E7
      E700CECECE00B5B5B50084848400CECECE00B5B5B500ADADAD00A5A5A500A5A5
      A5009C9C9C009C9C9C0084848400E7E7E700E7E7E700E7E7E700DEDEDE00DEDE
      DE00DEDEDE00D6D6D600D6D6D60094949400000000008C8C8C00CECECE009C9C
      9C00E7E7E700EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700E7E7
      E700DEDEDE00D6D6D600CECECE00BDBDBD00B5B5B500B5B5B500ADADAD009C9C
      9C008C8C8C00B5B5B5008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00ADADAD00A5A5A5009C9C
      9C009C9C9C009C9C9C009494940084848400BDBDBD00BDBDBD00B5B5B500ADAD
      AD00A5A5A50084848400ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00D6D6D60094949400000000008C8C8C009C9C9C00E7E7
      E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00D6D6D6009C9C9C00ADADAD00CECE
      CE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600CECECE00BDBDBD00B5B5
      B500B5B5B5008C8C8C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C00ADADAD00B5B5
      B500B5B5B500B5B5B500B5B5B500ADADAD008C8C8C008C8C8C0084848400ADAD
      AD0084848400DEDEDE00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7
      E700E7E7E700D6D6D600CECECE0094949400000000008C8C8C00D6D6D600EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00D6D6D600BDBDBD00BDBDBD00B5B5B5009C9C
      9C0094949400A5A5A500BDBDBD00CECECE00D6D6D600D6D6D600D6D6D600CECE
      CE00C6C6C600B5B5B5008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00CECECE00D6D6D600CECE
      CE00C6C6C600C6C6C600BDBDBD00B5B5B500ADADAD009C9C9C00848484008484
      8400CECECE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7
      E700CECECE00C6C6C600CECECE009494940000000000000000008C8C8C008C8C
      8C00D6D6D600E7E7E700BDBDBD008C8C8C00949494009C9C9C00ADADAD00BDBD
      BD00BDBDBD00BDBDBD00ADADAD009C9C9C009C9C9C00ADADAD00CECECE00D6D6
      D600CECECE00CECECE008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00D6D6D600E7E7E700DEDE
      DE00D6D6D600CECECE00C6C6C600BDBDBD00B5B5B5009C9C9C00848484008C8C
      8C00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      00008C8C8C008C8C8C00B5B5B500ADADAD008C8C8C0084848400848484008C8C
      8C008C8C8C00A5A5A500B5B5B500BDBDBD00BDBDBD00B5B5B500CECECE00D6D6
      D600C6C6C6008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00EFEFEF00EFEF
      EF00DEDEDE00DEDEDE00D6D6D600CECECE00BDBDBD009C9C9C00B5B5B500B5B5
      B500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF009C9C9C00F7F7F700ADADAD00000000000000000000000000000000000000
      00000000000000000000B5B5B500D6D6D600D6D6D600CECECE00BDBDBD009C9C
      9C009494940084848400848484008C8C8C00A5A5A500D6D6D600D6D6D600B5B5
      B5008C8C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00F7F7F700F7F7
      F700EFEFEF00E7E7E700DEDEDE00D6D6D600C6C6C6009C9C9C00B5B5B500B5B5
      B500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF009C9C9C00ADADAD0000000000000000000000000000000000000000000000
      00000000000000000000B5B5B500DEDEDE00D6D6D600D6D6D600CECECE00CECE
      CE00CECECE00C6C6C600CECECE00B5B5B5008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00F7F7F700F7F7
      F700F7F7F700EFEFEF00EFEFEF00E7E7E700CECECE009C9C9C00B5B5B500BDBD
      BD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6009C9C9C000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B500DEDEDE00D6D6D600D6D6D600D6D6D600CECE
      CE00CECECE00CECECE00CECECE00B5B5B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DEDEDE00F7F7F700F7F7
      F700F7F7F700DEDEDE00C6C6C600B5B5B500A5A5A5009C9C9C009C9C9C007B7B
      7B008C8C8C00949494009C9C9C0094949400949494008C8C8C008C8C8C00B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6
      D600CECECE00CECECE00B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00C6C6C600C6C6C600B5B5
      B5009C9C9C009C9C9C00A5A5A500BDBDBD00CECECE00CECECE00BDBDBD00ADAD
      AD009C9C9C009C9C9C009C9C9C00A5A5A500ADADAD00A5A5A5009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500E7E7E700DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600D6D6D600CECECE00B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C00A5A5
      A500C6C6C600E7E7E700F7F7F700F7F7F700EFEFEF00E7E7E700D6D6D600C6C6
      C600B5B5B500ADADAD00A5A5A5009C9C9C009C9C9C009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600CECECE00B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C00ADADAD00B5B5B500C6C6C600C6C6C600B5B5B500A5A5
      A5009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500EFEFEF00E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDE
      DE00D6D6D600B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700DEDEDE00DEDE
      DE00D6D6D600B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500B5B5B500B5B5B500B5B5B500EFEFEF00E7E7E700E7E7E700E7E7E700DEDE
      DE00B5B5B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121003939390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000313131002121210029292900424242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A007B7B7B004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600DEDE
      DE00C6C6C6008C8C8C007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000393939007373730052525200424242004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A008C8C
      8C00848484004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600DEDE
      DE00C6C6C6008C8C8C007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004242420073737300737373005252520031313100313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00A5A5A5009494
      94008C8C8C0084848400848484007B7B7B007B7B7B00737373007B7B7B007B7B
      7B004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600DEDE
      DE00C6C6C6008C8C8C007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840063636300525252006363630073737300636363003939
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A4A4A00B5B5B500ADADAD00A5A5
      A5009C9C9C00949494008C8C8C00848484007B7B7B007B7B7B007B7B7B007B7B
      7B004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600DEDE
      DE00C6C6C6008C8C8C007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000424242005A5A5A009494940084848400737373006363
      6300393939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00B5B5B500ADAD
      AD00A5A5A5009C9C9C00949494008C8C8C00848484007B7B7B007B7B7B007B7B
      7B004A4A4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600DEDE
      DE00C6C6C6008C8C8C007B7B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B006B6B6B006B6B6B00A5A5A50094949400848484007373
      73005A5A5A00313131007B7B7B007B7B7B000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B0052525200000000004A4A4A00B5B5
      B500ADADAD004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400BDBDBD00BDBD
      BD00ADADAD00A5A5A5007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500ADADAD00000000000000000000000000B5B5
      B500B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500ADADAD005A5A5A00A5A5A500A5A5A500949494008484
      8400737373005A5A5A0039393900BDBDBD007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5005252520000000000000000004A4A
      4A00B5B5B5004A4A4A000000000000000000EFEFEF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5007B7B7B000000000000000000000000000000
      00000000000000000000000000000000000084848400ADADAD00BDBDBD00B5B5
      B500ADADAD00A5A5A500949494007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5008484840000000000000000000000
      0000B5B5B5000000000000000000000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500ADADAD005A5A5A00A5A5A500A5A5A5009494
      940084848400737373005A5A5A00393939007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5005252520000000000000000000000
      00004A4A4A004A4A4A000000000000000000EFEFEF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5007B7B7B000000000000000000000000000000
      000000000000000000000000000084848400ADADAD00C6C6C600BDBDBD00B5B5
      B500A5A5A5009C9C9C00949494008C8C8C007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00B5B5B500B5B5B500B5B5B500B5B5B50084848400DEDEDE00000000000000
      0000000000000000000000000000B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00B5B5B500B5B5B500B5B5B500B5B5B5007B7B7B005A5A5A00A5A5A500A5A5
      A5008C8C8C0084848400737373005A5A5A003939390000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00B5B5B500B5B5B500B5B5B500B5B5B5005252520000000000000000000000
      0000000000004A4A4A000000000000000000EFEFEF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5007B7B7B000000000000000000000000000000
      0000000000000000000084848400B5B5B500CECECE00C6C6C600BDBDBD00ADAD
      AD00A5A5A5009C9C9C00949494008C8C8C008C8C8C007B7B7B00000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00B5B5B500B5B5B500B5B5B500B5B5B50084848400DEDEDE00B5B5B5000000
      00000000000000000000B5B5B500B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00B5B5B500B5B5B500B5B5B500B5B5B5007B7B7B00D6D6D6005A5A5A00A5A5
      A5009C9C9C00949494007B7B7B00737373005A5A5A0039393900000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00B5B5B500B5B5B500B5B5B500B5B5B5005252520000000000000000000000
      000000000000000000000000000000000000EFEFEF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5007B7B7B000000000000000000000000000000
      00000000000084848400BDBDBD00D6D6D600CECECE00C6C6C600B5B5B500ADAD
      AD00A5A5A5009C9C9C00949494008C8C8C008C8C8C008C8C8C007B7B7B000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00B5B5B500B5B5B50084848400DEDEDE00000000000000
      0000000000000000000000000000B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00B5B5B500B5B5B5007B7B7B00DEDEDE00BDBDBD005A5A
      5A00A5A5A5009C9C9C008C8C8C007B7B7B00737373005A5A5A00393939000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00B5B5B500B5B5B500B5B5B5005252520000000000000000000000
      0000000000004A4A4A000000000000000000EFEFEF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5007B7B7B000000000000000000000000000000
      000084848400BDBDBD00DEDEDE00D6D6D600CECECE00BDBDBD00B5B5B500ADAD
      AD00A5A5A5009C9C9C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C007B7B
      7B00000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00B5B5B500B5B5B5008484840000000000000000000000
      0000B5B5B5000000000000000000000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00B5B5B500B5B5B5007B7B7B00E7E7E700C6C6C600BDBD
      BD006B6B6B00ADADAD009C9C9C008C8C8C007B7B7B00525252004A4A4A004A4A
      4A00000000000000000000000000000000007B7B7B00DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00B5B5B5005252520000000000000000000000
      00004A4A4A004A4A4A000000000000000000EFEFEF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5007B7B7B000000000000000000000000008484
      8400BDBDBD00DEDEDE00DEDEDE00D6D6D600C6C6C600BDBDBD00B5B5B500ADAD
      AD009C9C9C00949494008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C007B7B7B000000000000000000000000007B7B7B00F7F7F700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00000000000000000000000000DEDE
      DE00DEDEDE00DEDEDE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00F7F7F700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700DEDEDE007B7B7B00F7F7F700E7E7E700E7E7
      E700D6D6D60073737300ADADAD009C9C9C005252520094949400BDBDBD00B5B5
      B500000000000000000000000000000000007B7B7B00DEDEDE00C6C6C600BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD005252520000000000000000004A4A
      4A007B7B7B004A4A4A000000000000000000EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00000000000000000084848400ADAD
      AD00C6C6C600ADADAD00ADADAD009C9C9C008C8C8C008C8C8C00848484008484
      840084848400848484007B7B7B007B7B7B008484840084848400848484008C8C
      8C00848484007B7B7B0000000000000000007B7B7B00949494008C8C8C008484
      8400848484008484840084848400000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00949494008C8C8C008484
      8400848484008484840084848400848484007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B006B6B6B008C8C8C0084848400CECECE00CECECE00B5B5
      B500525252003939390000000000000000007B7B7B00949494008C8C8C008484
      84008484840084848400848484008484840052525200525252004A4A4A008C8C
      8C00848484004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A0000000000000000000000000000000000848484007B7B7B007B7B
      7B007B7B7B0084848400848484008C8C8C00949494009C9C9C00F7F7F700B5B5
      B500A5A5A500A5A5A50084848400BDBDBD00B5B5B500ADADAD009C9C9C009494
      94007B7B7B007B7B7B007B7B7B00000000007B7B7B00DEDEDE00C6C6C600C6C6
      C600BDBDBD00BDBDBD00000000000000000000000000DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500ADADAD000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00DEDEDE00C6C6C600C6C6
      C600BDBDBD00BDBDBD00BDBDBD00BDBDBD0084848400DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500ADADAD0052525200ADADAD00CECECE009C9C9C005252
      52004A4A4A004A4A4A0039393900000000007B7B7B00E7E7E700C6C6C600C6C6
      C600BDBDBD00BDBDBD00BDBDBD00BDBDBD00848484004A4A4A009C9C9C009494
      94008C8C8C008C8C8C00848484007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B004A4A4A00000000000000000000000000848484007B7B7B008C8C8C008C8C
      8C00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500ADADAD00F7F7
      F700ADADAD00ADADAD00ADADAD008C8C8C00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00C6C6C600848484007B7B7B007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600BDBDBD00000000000000000084848400DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600BDBDBD00BDBDBD00BDBDBD0084848400DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500ADADAD009C9C9C00BDBDBD005A5A5A007373
      7300636363005A5A5A004A4A4A00000000007B7B7B00DEDEDE00C6C6C600C6C6
      C600C6C6C600BDBDBD00BDBDBD00BDBDBD004A4A4A00B5B5B500ADADAD00A5A5
      A5009C9C9C00949494008C8C8C00848484007B7B7B007B7B7B007B7B7B007B7B
      7B004A4A4A000000000000000000000000000000000084848400848484006B6B
      6B00B5B5B500ADADAD009C9C9C008C8C8C00A5A5A500A5A5A500ADADAD00B5B5
      B500F7F7F700B5B5B500B5B5B500B5B5B5008C8C8C00C6C6C600ADADAD00A5A5
      A500F7F7F7007B7B7B007B7B7B00000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600BDBDBD00BDBDBD0084848400DEDEDE00BDBDBD00B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600BDBDBD00BDBDBD0084848400E7E7E700BDBDBD00B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5007B7B7B0000000000636363008C8C
      8C006B6B6B005A5A5A0042424200000000007B7B7B00DEDEDE00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600BDBDBD00848484004A4A4A00B5B5B500ADAD
      AD00A5A5A5009C9C9C00949494008C8C8C00848484007B7B7B007B7B7B007B7B
      7B004A4A4A00000000000000000000000000000000000000000000000000BDBD
      BD00D6D6D600CECECE00B5B5B5009C9C9C00A5A5A5007B7B7B007B7B7B007B7B
      7B007B7B7B00F7F7F700B5B5B5008C8C8C007B7B7B007B7B7B007B7B7B00F7F7
      F700F7F7F7008C8C8C0000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600BDBDBD0084848400DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00B5B5B500B5B5B500B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600BDBDBD0084848400E7E7E700BDBDBD00BDBD
      BD00BDBDBD00B5B5B500B5B5B500B5B5B5007B7B7B0000000000636363009C9C
      9C007B7B7B004A4A4A0000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600BDBDBD0084848400BDBDBD004A4A4A00B5B5
      B500ADADAD004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A00000000000000000000000000000000000000000000000000BDBD
      BD00EFEFEF00E7E7E700CECECE00ADADAD00A5A5A50000000000000000000000
      00000000000000000000E7E7E700000000000000000000000000FFFFFF00F7F7
      F700B5B5B5008C8C8C008C8C8C00000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00B5B5B500B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400E7E7E700BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00B5B5B500B5B5B5007B7B7B0000000000000000006363
      6300525252000000000000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400BDBDBD00BDBDBD004A4A
      4A00B5B5B5004A4A4A00B5B5B500B5B5B5007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00FFFFFF00EFEFEF00D6D6D600B5B5B500B5B5B50000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00B5B5
      B500B5B5B500B5B5B5008C8C8C008C8C8C007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400DEDEDE00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00E7E7E700C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400BDBDBD00BDBDBD00BDBD
      BD004A4A4A004A4A4A00BDBDBD00B5B5B5007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00B5B5B5008C8C8C008C8C8C00000000007B7B7B00F7F7F700E7E7E700E7E7
      E700E7E7E700DEDEDE00E7E7E700DEDEDE0094949400F7F7F700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00F7F7F700E7E7E700E7E7
      E700E7E7E700DEDEDE00E7E7E700DEDEDE0094949400F7F7F700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE007B7B7B0000000000000000000000
      0000000000000000000000000000000000007B7B7B00F7F7F700E7E7E700DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE0094949400DEDEDE00DEDEDE00DEDE
      DE00DEDEDE004A4A4A00DEDEDE00DEDEDE007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00F7F7F7008C8C8C000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940094949400848484008484
      8400737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009494940094949400949494008C8C8C00949494009C9C9C008C8C
      8C00737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300848484006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400949494008C8C8C00949494009C9C9C009C9C9C009C9C9C009C9C9C008C8C
      8C00737373009C9C9C0094949400949494009494940094949400949494009494
      9400949494009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363009494
      94008C8C8C006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007373730073737300737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400A5A5A500A5A5A500A5A5A500A5A5A5009C9C9C009C9C9C009C9C9C008C8C
      8C0073737300D6D6D600D6D6D600D6D6D600DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300A5A5A5009C9C
      9C0094949400949494008C8C8C00848484008484840084848400848484008484
      8400636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949494008C8C8C008C8C8C0094949400A5A5
      A500B5B5B500C6C6C600ADADAD008C8C8C007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363009494940063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5008C8C
      8C00737373009C9C9C0094949400949494009494940094949400949494009494
      9400DEDEDE009494940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063636300BDBDBD00B5B5B500ADAD
      AD00A5A5A5009C9C9C00949494008C8C8C008484840084848400848484008484
      8400636363000000000000000000000000000000000000000000000000000000
      000000000000949494009C9C9C00ADADAD00BDBDBD00CECECE00DEDEDE00D6D6
      D600C6C6C600ADADAD00B5B5B500C6C6C600ADADAD007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300949494008C8C8C009C9C9C00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400ADADAD00ADADAD00A5A5A500A5A5A500A5A5A500A5A5A500A5A5A5009494
      9400737373009C9C9C0094949400949494009494940094949400949494009494
      9400DEDEDE009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300BDBDBD00B5B5
      B500ADADAD00A5A5A5009C9C9C00949494008C8C8C0084848400848484008484
      8400636363000000000000000000000000000000000000000000000000000000
      00009C9C9C00B5B5B500DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600A5A5A500ADADAD00C6C6C600DEDEDE00DEDEDE009C9C9C008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000636363009C9C9C009C9C9C0094949400949494009C9C9C006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00A5A5A5009494
      9400737373009C9C9C0094949400949494009494940094949400949494009494
      9400DEDEDE009494940000000000000000000000000084848400848484008484
      840084848400848484008484840084848400636363000000000063636300BDBD
      BD00B5B5B5006363630063636300636363006363630063636300636363006363
      6300636363008484840084848400000000000000000000000000000000009C9C
      9C009C9C9C00D6D6D600E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700D6D6
      D600BDBDBD00A5A5A500B5B5B500D6D6D600E7E7E700EFEFEF00F7F7F700C6C6
      C6008C8C8C000000000000000000000000000000000000000000000000000000
      0000636363008C8C8C00ADADAD00A5A5A5009C9C9C0094949400949494009C9C
      9C00636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400B5B5B500ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD009494
      9400737373009C9C9C0094949400949494009494940094949400949494009494
      9400DEDEDE0094949400000000000000000084848400DEDEDE00B5B5B500ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD006363630000000000000000006363
      6300BDBDBD00636363000000000000000000FFFFFF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500848484000000000000000000000000008C8C
      8C007B7B7B00E7E7E700EFEFEF00EFEFEF00EFEFEF00EFEFEF00DEDEDE00D6D6
      D600B5B5B500BDBDBD00BDBDBD00DEDEDE00EFEFEF00F7F7F700F7F7F700FFFF
      FF00E7E7E7009C9C9C008C8C8C00000000000000000000000000000000006363
      63008C8C8C00BDBDBD00B5B5B500ADADAD0094949400636363009C9C9C009494
      94009C9C9C006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400B5B5B500B5B5B500B5B5B500B5B5B500ADADAD00ADADAD00ADADAD009494
      9400737373009C9C9C0094949400949494009494940094949400949494009494
      9400DEDEDE0094949400000000000000000084848400DEDEDE00B5B5B500B5B5
      B500ADADAD00ADADAD00ADADAD00ADADAD006363630000000000000000000000
      000063636300636363000000000000000000FFFFFF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5008484840000000000000000009C9C9C007B7B
      7B00A5A5A500F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700E7E7E700DEDE
      DE00A5A5A500A5A5A500C6C6C600E7E7E700EFEFEF00F7F7F700FFFFFF00FFFF
      FF00FFFFFF00F7F7F7008C8C8C008C8C8C000000000000000000636363008484
      8400C6C6C600C6C6C600BDBDBD00A5A5A5006363630000000000636363009C9C
      9C00949494009C9C9C0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500CECECE00B5B5B5009494
      940073737300A5A5A50094949400949494009494940094949400949494009494
      9400DEDEDE0094949400000000000000000084848400DEDEDE00B5B5B500B5B5
      B500B5B5B500ADADAD00ADADAD00ADADAD006363630000000000000000000000
      000000000000636363000000000000000000FFFFFF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5008484840000000000000000009C9C9C008484
      8400C6C6C600F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700CECECE00BDBD
      BD00A5A5A500BDBDBD00DEDEDE00DEDEDE00F7F7F700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE008484840094949400000000000000000063636300CECE
      CE00CECECE00C6C6C600ADADAD00636363000000000000000000000000006363
      630084848400949494009C9C9C00636363000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400BDBDBD00BDBDBD00BDBDBD00B5B5B500D6D6D600FFFFFF00D6D6D6009C9C
      9C0073737300DEDEDE00DEDEDE00BDBDBD00BDBDBD00ADADAD00ADADAD00ADAD
      AD00DEDEDE0094949400000000000000000084848400DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500ADADAD00ADADAD006363630000000000000000000000
      000000000000000000000000000000000000FFFFFF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500848484000000000000000000737373007B7B
      7B00E7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700E7E7E700BDBD
      BD00BDBDBD00C6C6C600E7E7E700ADADAD00B5B5B500EFEFEF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6009C9C9C0094949400000000000000000063636300A5A5
      A500D6D6D600ADADAD0063636300000000000000000000000000000000000000
      0000000000006363630094949400949494006363630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400BDBDBD00BDBDBD00BDBDBD00BDBDBD00DEDEDE00FFFFFF00CECECE009C9C
      9C0073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7
      E700DEDEDE0094949400000000000000000084848400DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500ADADAD006363630000000000000000000000
      000000000000000000000000000000000000FFFFFF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A50084848400000000009C9C9C005A5A5A007B7B
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700DEDEDE00A5A5
      A500A5A5A500D6D6D600EFEFEF00F7F7F700DEDEDE00A5A5A500C6C6C600FFFF
      FF00F7F7F700B5B5B5008C8C8C00000000000000000000000000000000006363
      6300BDBDBD006363630000000000000000000000000000000000000000000000
      0000000000000000000063636300949494009494940063636300000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400C6C6C600BDBDBD00BDBDBD00BDBDBD00BDBDBD00CECECE00BDBDBD009C9C
      9C0073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0094949400000000000000000084848400DEDEDE00B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5006363630000000000000000000000
      000000000000000000000000000000000000FFFFFF00A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A5008484840000000000949494005A5A5A00ADAD
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00C6C6C600ADAD
      AD00CECECE00E7E7E700F7F7F700F7F7F700FFFFFF00FFFFFF00C6C6C600D6D6
      D600EFEFEF00A5A5A5009C9C9C00000000000000000000000000000000000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000636363007373730094949400636363000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600BDBDBD00BDBDBD009C9C
      9C0073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0094949400000000000000000084848400E7E7E700B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5006363630000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B007B7B7B00E7E7
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600BDBD
      BD00BDBDBD00DEDEDE00DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BDBDBD009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300848484006363
      6300000000000000000000000000000000000000000000000000000000009494
      9400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600A5A5
      A50073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0094949400000000000000000084848400A5A5A5008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C006363630063636300636363006363
      6300636363006363630063636300636363006363630000000000000000000000
      00000000000000000000000000000000000000000000737373007B7B7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7E7E700CECECE00ADADAD009C9C9C00BDBD
      BD00EFEFEF00E7E7E700B5B5B500B5B5B500F7F7F700FFFFFF00FFFFFF00FFFF
      FF00A5A5A5009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363007373
      7300636363000000000000000000000000000000000000000000000000009494
      9400CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600A5A5
      A50073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0094949400000000000000000084848400E7E7E700BDBDBD00B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5008C8C8C00B5B5B500B5B5B500ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD008484840000000000000000000000
      0000000000000000000000000000000000009C9C9C0094949400CECECE00FFFF
      FF00DEDEDE00C6C6C600A5A5A500A5A5A5000000000000000000000000000000
      0000ADADAD00EFEFEF00FFFFFF00E7E7E700A5A5A500CECECE00FFFFFF00DEDE
      DE009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000636363006363630000000000000000000000000000000000000000009494
      9400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00A5A5
      A50073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0094949400000000000000000084848400E7E7E700BDBDBD00BDBD
      BD00B5B5B500B5B5B500B5B5B500B5B5B5008C8C8C00B5B5B500B5B5B500B5B5
      B500ADADAD00ADADAD00ADADAD00ADADAD008484840000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C000000000000000000000000000000000000000000000000000000
      000000000000A5A5A500D6D6D600FFFFFF00FFFFFF00CECECE00FFFFFF00B5B5
      B5009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300000000000000000000000000000000009494
      9400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00A5A5
      A50073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0094949400000000000000000084848400E7E7E700BDBDBD00BDBD
      BD00B5B5B500B5B5B500B5B5B500B5B5B5008C8C8C00B5B5B500B5B5B500B5B5
      B500B5B5B500ADADAD00ADADAD00ADADAD008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00FFFFFF00FFFFFF00DEDEDE009C9C
      9C009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400C6C6C600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00A5A5
      A50073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0094949400000000000000000084848400E7E7E700BDBDBD00BDBD
      BD00BDBDBD00B5B5B500B5B5B500B5B5B5008C8C8C00B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500ADADAD00ADADAD008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400949494009C9C9C00B5B5B500CECECE00CECECE00CECECE00CECECE00A5A5
      A50073737300DEDEDE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00DEDEDE0094949400000000000000000084848400E7E7E700BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00B5B5B500B5B5B5008C8C8C00B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500ADADAD008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094949400949494009C9C9C00A5A5A500C6C6C600CECECE00A5A5
      A500737373009C9C9C0094949400949494009494940094949400949494009494
      94009494940094949400000000000000000084848400E7E7E700BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00B5B5B5008C8C8C00B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B5008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000094949400949494008C8C8C009494
      9400737373000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700A5A5A500E7E7E700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      9400737373000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      94009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
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
      0000000000000000000000000000000000000000000000000000000000009494
      9400DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECECE00CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600949494000000000000000000949494009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C008C8C8C000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C00949494000000000000000000000000000000000000000000000000009494
      9400DEDEDE00E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6D600CECECE00CECE
      CE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60094949400000000000000000094949400DEDEDE00E7E7E700DEDE
      DE00D6D6D600CECECE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C008C8C8C008C8C8C00000000000000000000000000A5A5A500E7E7
      E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000009494
      9400E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00CECECE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60094949400000000000000000094949400E7E7E700E7E7E700DEDE
      DE00D6D6D600CECECE00C6C6C600C6C6C600B5B5B500BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600949494000000
      00000000000000000000000000000000000000000000000000008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C0000000000000000000000000000000000A5A5A500E7E7
      E700EFEFEF00E7E7E700E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6
      D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000009494
      9400E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600CECECE00CECECE00CECECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60094949400000000000000000094949400E7E7E700E7E7E700DEDE
      DE00D6D6D60063636300848484008C8C8C009C9C9C00A5A5A500ADADAD00B5B5
      B500B5B5B500BDBDBD00C6C6C600C6C6C600C6C6C600C6C6C600949494000000
      00000000000000000000000000000000000000000000000000008C8C8C008C8C
      8C008C8C8C008C8C8C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C008C8C8C008C8C
      8C008C8C8C000000000000000000000000000000000000000000A5A5A500EFEF
      EF00EFEFEF00E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6
      D600D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000009494
      9400E7E7E700EFEFEF00E7E7E700E7E7E700DEDEDE00DEDEDE00D6D6D600C6C6
      C600BDBDBD00BDBDBD00BDBDBD00C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60094949400000000000000000094949400E7E7E700EFEFEF00E7E7
      E700DEDEDE007B7B7B00636363006B6B6B0084848400848484008C8C8C009494
      9400A5A5A500ADADAD00BDBDBD00BDBDBD00C6C6C600C6C6C600949494000000
      00000000000000000000000000000000000000000000000000008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C008C8C8C008C8C8C008C8C
      8C00000000000000000000000000000000000000000000000000A5A5A500EFEF
      EF00EFEFEF00EFEFEF00E7E7E700ADADAD00E7E7E700DEDEDE00B5B5B500ADAD
      AD00ADADAD00ADADAD00ADADAD00CECECE00CECECE00CECECE00CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000009494
      9400EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00CECECE00ADAD
      AD009494940094949400A5A5A500BDBDBD00CECECE00C6C6C600C6C6C600C6C6
      C600C6C6C60094949400000000000000000094949400EFEFEF00EFEFEF00EFEF
      EF00E7E7E700BDBDBD00737373008C8C8C007B7B7B00737373008C8C8C007B7B
      7B00848484009C9C9C00A5A5A500B5B5B500BDBDBD00BDBDBD00949494000000
      0000000000000000000000000000000000000000000000000000000000008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C000000000000000000000000000000
      00000000000000000000000000008C8C8C008C8C8C008C8C8C008C8C8C000000
      0000000000000000000000000000000000000000000000000000A5A5A500EFEF
      EF00F7F7F700EFEFEF00EFEFEF00ADADAD00ADADAD00BDBDBD00ADADAD00B5B5
      B500D6D6D600B5B5B500ADADAD00ADADAD00CECECE00CECECE00CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000009494
      9400EFEFEF00F7F7F700EFEFEF00E7E7E700E7E7E700E7E7E700848484008484
      8400848484008484840094949400BDBDBD00CECECE00CECECE00C6C6C600C6C6
      C600C6C6C60094949400000000000000000094949400EFEFEF00F7F7F700EFEF
      EF00E7E7E700DEDEDE007B7B7B008C8C8C008C8C8C00848484007B7B7B006363
      6300737373007B7B7B0094949400A5A5A500B5B5B500BDBDBD00949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C008C8C8C008C8C8C008C8C8C008C8C8C0000000000000000000000
      000000000000000000008C8C8C008C8C8C008C8C8C008C8C8C00000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7F7
      F700F7F7F700EFEFEF00EFEFEF00ADADAD00ADADAD00ADADAD00BDBDBD00DEDE
      DE00DEDEDE00D6D6D600B5B5B500ADADAD00CECECE00CECECE00CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000009C9C
      9C00EFEFEF00F7F7F700EFEFEF00E7E7E700D6D6D600CECECE0084848400ADAD
      AD00A5A5A5008484840094949400ADADAD00BDBDBD00BDBDBD00C6C6C600C6C6
      C600C6C6C6009494940000000000000000009C9C9C00EFEFEF00F7F7F700EFEF
      EF00EFEFEF00E7E7E700ADADAD00848484006363630094949400A5A5A5009494
      94006B6B6B006B6B6B007B7B7B008C8C8C009C9C9C00ADADAD00949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C008C8C8C008C8C8C008C8C8C00000000000000
      00008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C0000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7F7
      F700F7F7F700F7F7F700EFEFEF00ADADAD00ADADAD00ADADAD00ADADAD00DEDE
      DE00DEDEDE00DEDEDE00D6D6D600ADADAD00D6D6D600CECECE00CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000009C9C
      9C00F7F7F700F7F7F700F7F7F700DEDEDE00B5B5B500A5A5A50084848400B5B5
      B500ADADAD0084848400848484008C8C8C00949494009C9C9C00BDBDBD00C6C6
      C600C6C6C6009494940000000000000000009C9C9C00F7F7F700F7F7F700F7F7
      F700EFEFEF00EFEFEF00E7E7E700525252008C8C8C00BDBDBD00B5B5B500A5A5
      A500949494006B6B6B006B6B6B0073737300848484008C8C8C00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A500F7F7
      F700FFFFFF00F7F7F700F7F7F700ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600CECECE00CECE
      CE00949494000000000000000000000000000000000000000000000000009C9C
      9C00F7F7F700FFFFFF00F7F7F70084848400848484008484840084848400B5B5
      B500B5B5B5008484840084848400848484008484840094949400BDBDBD00CECE
      CE00C6C6C6009494940000000000000000009C9C9C00F7F7F700FFFFFF00F7F7
      F700F7F7F700EFEFEF00EFEFEF008C8C8C009C9C9C00CECECE00BDBDBD00ADAD
      AD00A5A5A5008C8C8C00636363006B6B6B006B6B6B007B7B7B00737373000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C008C8C8C009C9C9C008C8C
      8C009C9C9C008C8C8C008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00E7E7
      E700E7E7E700E7E7E700DEDEDE00DEDEDE00D6D6D600D6D6D600D6D6D600CECE
      CE0094949400000000000000000000000000000000000000000000000000A5A5
      A500FFFFFF00FFFFFF00FFFFFF0084848400CECECE00CECECE00C6C6C600C6C6
      C600BDBDBD00B5B5B500B5B5B500ADADAD008484840094949400BDBDBD00CECE
      CE00CECECE009C9C9C000000000000000000A5A5A500FFFFFF00FFFFFF00FFFF
      FF00F7F7F700F7F7F700EFEFEF00EFEFEF007B7B7B00D6D6D600CECECE00BDBD
      BD00ADADAD00A5A5A5008C8C8C00636363006B6B6B00737373006B6B6B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C8C8C008C8C8C008C8C
      8C009C9C9C008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00EFEFEF00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00DEDEDE00D6D6D600D6D6D600D6D6
      D60094949400000000000000000000000000000000000000000000000000A5A5
      A500FFFFFF00FFFFFF00FFFFFF0084848400D6D6D600D6D6D600CECECE00CECE
      CE00C6C6C600BDBDBD00BDBDBD00B5B5B50084848400A5A5A500C6C6C600D6D6
      D600CECECE009C9C9C000000000000000000A5A5A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7F700EFEFEF00DEDEDE007B7B7B00CECECE00CECE
      CE00BDBDBD00ADADAD00A5A5A5008C8C8C00636363006B6B6B00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C008C8C8C009C9C9C008C8C
      8C008C8C8C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ADADAD00F7F7F700F7F7F700EFEFEF00EFEF
      EF00ADADAD00ADADAD00ADADAD00ADADAD00DEDEDE00DEDEDE00D6D6D600D6D6
      D60094949400000000000000000000000000000000000000000000000000A5A5
      A500FFFFFF00FFFFFF00FFFFFF0084848400848484008484840084848400D6D6
      D600CECECE0084848400848484008484840084848400CECECE00D6D6D600D6D6
      D600CECECE009C9C9C000000000000000000A5A5A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00DEDEDE0073737300CECE
      CE00CECECE00BDBDBD00ADADAD00A5A5A5008C8C8C00636363005A5A5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C8C8C008C8C8C009C9C9C008C8C8C009C9C
      9C009C9C9C009C9C9C008C8C8C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ADADAD00D6D6D600F7F7F700F7F7F700EFEF
      EF00CECECE00ADADAD00ADADAD00ADADAD00DEDEDE00DEDEDE00DEDEDE00D6D6
      D60094949400000000000000000000000000000000000000000000000000ADAD
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400DEDE
      DE00D6D6D60084848400A5A5A500CECECE00E7E7E700DEDEDE00DEDEDE00D6D6
      D600C6C6C6008C8C8C000000000000000000ADADAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00BDBDBD007373
      7300CECECE00CECECE00BDBDBD00ADADAD009C9C9C008C8C8C00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C009C9C9C009C9C9C008C8C8C009C9C9C000000
      0000000000009C9C9C009C9C9C009C9C9C009C9C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000B5B5B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00ADADAD00D6D6D600F7F7F700CECE
      CE00ADADAD00CECECE00ADADAD00ADADAD00E7E7E700DEDEDE00DEDEDE00DEDE
      DE0094949400000000000000000000000000000000000000000000000000ADAD
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400DEDE
      DE00DEDEDE0084848400B5B5B500D6D6D600E7E7E700E7E7E700D6D6D600BDBD
      BD00A5A5A5008C8C8C000000000000000000ADADAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEFEF00BDBD
      BD0073737300CECECE00CECECE00BDBDBD00ADADAD009C9C9C008C8C8C007373
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C008C8C8C009C9C9C009C9C9C00000000000000
      000000000000000000009C9C9C009C9C9C009C9C9C009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000B5B5B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00ADADAD00ADADAD00ADAD
      AD00CECECE00EFEFEF00EFEFEF00ADADAD00E7E7E700E7E7E700DEDEDE00CECE
      CE0094949400000000000000000000000000000000000000000000000000ADAD
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      84008484840084848400DEDEDE00E7E7E700EFEFEF00DEDEDE00BDBDBD00ADAD
      AD00ADADAD008C8C8C000000000000000000ADADAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7F700EFEF
      EF00BDBDBD0094949400D6D6D600CECECE00BDBDBD00ADADAD008C8C8C007373
      73006B6B6B000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C0000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00DEDEDE00CECECE00B5B5
      B50094949400000000000000000000000000000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7F7F700DEDEDE009494940094949400949494009494
      940094949400949494000000000000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700F7F7
      F700DEDEDE008484840094949400D6D6D600C6C6C6007B7B7B007B7B7B008484
      8400848484007373730000000000000000000000000000000000000000009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7F7F700F7F7F700F7F7F700F7F7F700E7E7E700C6C6C600BDBDBD00B5B5
      B50094949400000000000000000000000000000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D6D6D60094949400B5B5B500A5A5A5009C9C
      9C00949494009C9C9C000000000000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600949494009494940094949400BDBDBD007B7B7B008C8C8C008C8C
      8C0084848400636363005A5A5A000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00000000000000000000000000000000000000000000000000BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500000000000000000000000000000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDEDE0094949400BDBDBD00B5B5B500A5A5
      A5009C9C9C00000000000000000000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEDE0094949400BDBDBD009494940084848400848484008C8C8C007B7B
      7B00636363006B6B6B00636363005A5A5A00000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00A5A5A500C6C6C600B5B5B500ADADAD00A5A5
      A500ADADAD00000000000000000000000000000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDEDE0094949400BDBDBD00ADADAD009C9C
      9C0000000000000000000000000000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEDEDE0094949400BDBDBD00ADADAD007B7B7B007B7B7B008C8C8C006B6B
      6B008C8C8C007B7B7B007373730063636300000000009C9C9C009C9C9C009C9C
      9C009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700A5A5A500CECECE00BDBDBD00B5B5B500ADAD
      AD0000000000000000000000000000000000000000000000000000000000B5B5
      B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7E7E70094949400BDBDBD009C9C9C000000
      000000000000000000000000000000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E70094949400BDBDBD009C9C9C000000000000000000737373008484
      8400ADADAD008C8C8C007373730063636300000000009C9C9C009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7E7E700A5A5A500CECECE00BDBDBD00ADADAD000000
      000000000000000000000000000000000000000000000000000000000000ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00949494009C9C9C00000000000000
      000000000000000000000000000000000000ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00949494009C9C9C00000000000000000000000000000000008C8C
      8C00C6C6C6009C9C9C0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00A5A5A500CECECE00ADADAD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484007373730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00A5A5A500ADADAD0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000780000000100010000000000A00500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF1FFFFFFFFF000000000000F80000FF
      FFFF000000000000C00000FC79FF000000000000000000F8003F000000000000
      000000F00007000000000000000000E00000000000000000000000C000000000
      0000000000000080000100000000000000000080000100000000000000000080
      0001000000000000000000800001000000000000000000800001000000000000
      000000C00001000000000000000000F00003000000000000000001FC00070000
      00000000000003FC000F000000000000000007FC00FF00000000000000000FF8
      01FF00000000000000001FF801FF00000000000000001FF801FF000000000000
      80007FF003FF000000000000FC0FFFE003FF000000000000FFFFFFE007FF0000
      00000000FFFFFFFE0FFF000000000000FFFFFFFFFFFFFFFBFFFFFFFFFFFFFFF3
      FFFFFFF3FFFFC3FFFFFFFFF0FFFFFFE3FFFF81FFFFFFFFF83FFFFFC007FF81FF
      FFFFFFF81FFFFF8007FF81FFFCFF9FF80FFFFF0007FF81FFFC7F1FFC07FFFF80
      07FF81FF80003F8000FF804001FF81FF00007F00007F006300FF00FF00007F00
      007F007300FE007F00007F00007F007B00FC003F00007F00003F007F00F8001F
      00007F00001F007B00F0000F00007F00000F007300E0000700007F00000F0063
      00C0000300003F00000300000780000100001F00000100000700000000001F00
      000100000780000100007F000041000007E0000300007F000043000007E07DC1
      00007F00006700007FE07F8000007F00007F00007FF0FFC100007F00007F0000
      7FFFFFE38000FF8000FF8000FFFFFFF7FFFFFFFFE7FFFFFBFFFFFFFFFFFFFFFF
      07FFFFF3FFFFFFFFFFFFFFF807FFFFE3FFFFFFFFFFFFFFE00003FFC007FFC0FF
      FF7FFFE00003FF8007FE007FFE3FFFE00003FF0007F8001FFC1FFFE00003FF80
      07F0000FF80FFFE00003804001E00007F007FFE00003006300E00001E003FFE0
      0003007300C00000C041FFE00003007B00C00000C0E0FFE00003007F00C00000
      C1F87FE00003007F00800001E3FC3FE00003007F00800001F7FE1FE00003007F
      00800003FFFF8FE0000300007F800003FFFFC7E0000300007F00F003FFFFF3E0
      000300007F07F807FFFFFDE0000300007FFFFE07FFFFFFE0000300007FFFFF0F
      FFFFFFE0000300007FFFFFCFFFFFFFF8000300007FFFFFFFFFFFFFFF07FF0000
      7FFFFFFFFFFFFFFFE7FF8000FFFFFFFFE00003FFFFFFFFFFFFFFFFFFE0000300
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
  object DisabledSmallImages: TImageList
    Left = 184
    Top = 152
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949494008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094949400949494008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400949494008C8C8C00949494008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400D6D6D6008C8C8C007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000949494009494
      9400949494009C9C9C00949494008C8C8C00CECECE00CECECE00CECECE00C6C6
      C600C6C6C600C6C6C600BDBDBD007B7B7B000000000000000000000000000000
      0000000000006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009494
      94009C9C9C009C9C9C009C9C9C00949494008484840094949400949494009494
      9400949494009494940094949400000000000000000000000000000000000000
      0000000000000000000084848400D6D6D6008C8C8C007B7B7B00000000000000
      0000000000000000000000000000000000009494940094949400B5B5B500B5B5
      B500ADADAD00A5A5A500949494008C8C8C00C6C6C60094949400949494009494
      94009494940094949400C6C6C6007B7B7B000000000000000000000000000000
      0000636363009C9C9C009C9C9C00636363000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094949400ADAD
      AD00A5A5A500A5A5A500A5A5A5009C9C9C0084848400D6D6D600D6D6D600DEDE
      DE00DEDEDE00DEDEDE0094949400000000000000000000000000000000000000
      0000000000000000000084848400D6D6D6008C8C8C007B7B7B00000000000000
      00000000000000000000000000000000000094949400DEDEDE00DEDEDE007373
      73009C9C9C00B5B5B5009494940073737300DEDEDE00DEDEDE00D6D6D600D6D6
      D600CECECE00CECECE00CECECE007B7B7B000000000000000000000000006363
      6300ADADAD009C9C9C00949494009C9C9C006363630000000000000000000000
      000000000000000000000000000000000000000000000000000094949400ADAD
      AD00ADADAD00A5A5A500A5A5A5009C9C9C00848484008C8C8C008C8C8C008C8C
      8C0084848400DEDEDE0094949400000000000000000000000000000000000000
      0000000000000000000084848400D6D6D6008C8C8C007B7B7B00000000000000
      00000000000000000000000000000000000094949400E7E7E700EFEFEF007373
      730073737300C6C6C60094949400737373007373730094949400949494009494
      94009494940094949400CECECE007B7B7B00000000000000000063636300BDBD
      BD00B5B5B5009C9C9C0063636300949494009C9C9C0063636300000000000000
      000000000000000000000000000000000000000000000000000094949400B5B5
      B500ADADAD00ADADAD00ADADAD00A5A5A5008484840094949400949494009494
      94008C8C8C00DEDEDE0094949400000000000000000000000000000000000000
      0000000000000000000084848400B5B5B500ADADAD007B7B7B00000000000000
      00000000000000000000000000000000000094949400EFEFEF00EFEFEF007373
      7300ADADAD007373730073737300737373008484840073737300E7E7E700DEDE
      DE00DEDEDE00D6D6D600D6D6D6007B7B7B000000000063636300C6C6C600CECE
      CE00A5A5A5006363630000000000636363008C8C8C009C9C9C00636363000000
      000000000000000000000000000000000000000000000000000094949400B5B5
      B500B5B5B500B5B5B500B5B5B500A5A5A500848484008C8C8C008C8C8C009494
      94008C8C8C00DEDEDE0094949400000000000000000000000000000000000000
      00000000000084848400BDBDBD00ADADAD00A5A5A5009C9C9C007B7B7B000000
      00000000000000000000000000000000000094949400CECECE00A5A5A5009C9C
      9C0073737300ADADAD00ADADAD00A5A5A5008484840084848400737373009494
      94009494940094949400DEDEDE007B7B7B00000000000000000063636300B5B5
      B500636363000000000000000000000000000000000063636300949494006363
      630000000000000000000000000000000000000000000000000094949400BDBD
      BD00B5B5B500C6C6C600EFEFEF00B5B5B50084848400DEDEDE00B5B5B500ADAD
      AD00A5A5A500DEDEDE0094949400000000000000000000000000000000000000
      000084848400CECECE00BDBDBD00ADADAD00A5A5A50094949400949494007B7B
      7B00000000000000000000000000000000009494940094949400ADADAD00ADAD
      AD00A5A5A5007373730073737300737373008484840073737300E7E7E700E7E7
      E700DEDEDE00E7E7E700D6D6D6007B7B7B000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000636363008C8C
      8C0063636300000000000000000000000000000000000000000094949400C6C6
      C600BDBDBD00C6C6C600EFEFEF00B5B5B50084848400F7F7F700EFEFEF00EFEF
      EF00EFEFEF00DEDEDE0094949400000000000000000000000000000000008484
      8400D6D6D600CECECE00BDBDBD00ADADAD00A5A5A50094949400949494009494
      94007B7B7B0000000000000000000000000094949400D6D6D600CECECE00C6C6
      C600B5B5B500ADADAD007B7B7B007373730073737300EFEFEF00EFEFEF00EFEF
      EF00EFEFEF008C8C8C008C8C8C008C8C8C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063636300636363000000000000000000000000000000000094949400C6C6
      C600C6C6C600BDBDBD00C6C6C600ADADAD0084848400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DEDEDE009494940000000000000000000000000084848400C6C6
      C600BDBDBD00ADADAD009C9C9C00949494008C8C8C008C8C8C00848484008C8C
      8C008C8C8C007B7B7B00000000000000000094949400E7E7E700E7E7E700D6D6
      D600CECECE00B5B5B5009494940073737300EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF008C8C8C00B5B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636363006363630000000000000000000000000094949400CECE
      CE00C6C6C600C6C6C600C6C6C600B5B5B50084848400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DEDEDE00949494000000000000000000848484008C8C8C008484
      84008C8C8C008C8C8C00ADADAD00C6C6C600A5A5A50094949400ADADAD00ADAD
      AD00A5A5A500949494007B7B7B000000000094949400EFEFEF00EFEFEF00EFEF
      EF00DEDEDE00C6C6C60094949400BDBDBD00B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B5008C8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094949400CECE
      CE00CECECE00CECECE00CECECE00B5B5B50084848400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DEDEDE0094949400000000008484840084848400949494009494
      9400848484009C9C9C00A5A5A500CECECE00CECECE00B5B5B500A5A5A500CECE
      CE00C6C6C600D6D6D6009C9C9C007B7B7B0094949400EFEFEF00D6D6D600BDBD
      BD00ADADAD00A5A5A5009C9C9C009C9C9C00A5A5A500ADADAD00ADADAD00ADAD
      AD00ADADAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094949400CECE
      CE00CECECE00CECECE00CECECE00BDBDBD0084848400EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00DEDEDE0094949400000000000000000084848400ADADAD00D6D6
      D600B5B5B5007B7B7B008484840084848400B5B5B500D6D6D600848484007B7B
      7B00ADADAD00DEDEDE00848484000000000094949400A5A5A5009C9C9C00ADAD
      AD00D6D6D600DEDEDE00D6D6D600B5B5B500A5A5A500A5A5A500949494009494
      9400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494009494
      9400BDBDBD00CECECE00CECECE00BDBDBD0084848400E7E7E700EFEFEF00EFEF
      EF00EFEFEF00DEDEDE0094949400000000000000000000000000C6C6C600FFFF
      FF00CECECE007B7B7B0000000000000000000000000000000000000000000000
      0000EFEFEF00B5B5B5009C9C9C008C8C8C000000000094949400949494009494
      940094949400ADADAD00ADADAD009C9C9C009494940094949400949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400A5A5A500ADADAD00B5B5B5008484840094949400949494009494
      940094949400949494009494940000000000000000000000000000000000ADAD
      AD00949494000000000000000000000000000000000000000000000000000000
      0000EFEFEF00CECECE0094949400000000000000000000000000000000000000
      0000000000009494940094949400949494000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094949400949494008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00EFEF
      EF00DEDEDE00DEDEDE00D6D6D600CECECE00CECECE00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6009C9C9C00000000009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C0094949400000000000000000000000000000000009C9C9C00EFEF
      EF00E7E7E700DEDEDE00D6D6D600D6D6D600CECECE00CECECE00C6C6C600C6C6
      C600C6C6C600C6C6C6009C9C9C00000000009C9C9C00EFEFEF00DEDEDE00CECE
      CE00BDBDBD00B5B5B500BDBDBD00BDBDBD00BDBDBD00C6C6C600C6C6C600C6C6
      C6009C9C9C000000000000000000000000000000000000000000000000006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000006B6B
      6B006B6B6B00000000000000000000000000000000009C9C9C00EFEFEF00E7E7
      E700DEDEDE00D6D6D600D6D6D600CECECE00CECECE00C6C6C600C6C6C600C6C6
      C600C6C6C600949494000000000000000000000000000000000094949400F7F7
      F700E7E7E700E7E7E700D6D6D600C6C6C600BDBDBD00BDBDBD00C6C6C600C6C6
      C600C6C6C600C6C6C6009C9C9C000000000094949400F7F7F700E7E7E7006363
      63005A5A5A00737373009C9C9C00A5A5A500ADADAD00BDBDBD00C6C6C600C6C6
      C6009C9C9C0000000000000000000000000000000000000000006B6B6B00ADAD
      AD00A5A5A5006B6B6B00000000000000000000000000000000006B6B6B009C9C
      9C009C9C9C006B6B6B0000000000000000000000000094949400F7F7F700E7E7
      E700E7E7E700DEDEDE00C6C6C6009494940094949400C6C6C600C6C6C600C6C6
      C600C6C6C600949494000000000000000000000000000000000094949400F7F7
      F700EFEFEF00E7E7E700CECECE00ADADAD0094949400A5A5A500BDBDBD00CECE
      CE00C6C6C600C6C6C6009C9C9C000000000094949400F7F7F700EFEFEF00A5A5
      A5006B6B6B0073737300636363007B7B7B0094949400A5A5A500B5B5B500C6C6
      C6009C9C9C0000000000000000000000000000000000000000006B6B6B00A5A5
      A500ADADAD009C9C9C006B6B6B0000000000000000006B6B6B009C9C9C009C9C
      9C00949494006B6B6B0000000000000000000000000094949400F7F7F700EFEF
      EF0094949400CECECE0094949400C6C6C600C6C6C60094949400C6C6C600C6C6
      C600C6C6C60094949400000000000000000000000000000000009C9C9C00FFFF
      FF00EFEFEF00DEDEDE0084848400848484008484840094949400ADADAD00BDBD
      BD00C6C6C600C6C6C6009C9C9C00000000009C9C9C00FFFFFF00EFEFEF00E7E7
      E7007B7B7B007B7B7B008484840084848400636363008C8C8C009C9C9C00B5B5
      B5009C9C9C000000000000000000000000000000000000000000000000006B6B
      6B00A5A5A500ADADAD00A5A5A5006B6B6B006B6B6B009C9C9C009C9C9C009C9C
      9C006B6B6B00000000000000000000000000000000009C9C9C00FFFFFF00EFEF
      EF009494940094949400CECECE00DEDEDE00D6D6D600C6C6C60094949400CECE
      CE00C6C6C60094949400000000000000000000000000000000009C9C9C00FFFF
      FF00E7E7E700BDBDBD0084848400ADADAD00848484008C8C8C0094949400A5A5
      A500BDBDBD00CECECE009C9C9C00000000009C9C9C00FFFFFF00F7F7F700EFEF
      EF00ADADAD0094949400C6C6C600ADADAD008C8C8C0063636300848484009494
      94008C8C8C000000000000000000000000000000000000000000000000000000
      00006B6B6B00A5A5A500ADADAD00A5A5A5009C9C9C009C9C9C009C9C9C006B6B
      6B0000000000000000000000000000000000000000009C9C9C00FFFFFF00F7F7
      F700949494009494940094949400DEDEDE00DEDEDE00D6D6D600D6D6D600CECE
      CE00CECECE009494940000000000000000000000000000000000A5A5A500FFFF
      FF00848484008484840084848400B5B5B5008484840084848400848484009494
      9400BDBDBD00D6D6D6009C9C9C0000000000A5A5A500FFFFFF00FFFFFF00F7F7
      F700EFEFEF007B7B7B00D6D6D600C6C6C600ADADAD0084848400636363007B7B
      7B00848484000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B00A5A5A500A5A5A500A5A5A5009C9C9C006B6B6B000000
      00000000000000000000000000000000000000000000A5A5A500FFFFFF00FFFF
      FF00F7F7F700EFEFEF00EFEFEF00E7E7E700949494009494940094949400D6D6
      D600D6D6D6009494940000000000000000000000000000000000A5A5A500FFFF
      FF0084848400D6D6D600CECECE00C6C6C600BDBDBD00B5B5B50084848400ADAD
      AD00C6C6C600D6D6D6009C9C9C0000000000A5A5A500FFFFFF00FFFFFF00FFFF
      FF00F7F7F700E7E7E7008C8C8C00CECECE00BDBDBD00ADADAD00848484006363
      63007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B00ADADAD00ADADAD00ADADAD00A5A5A5006B6B6B000000
      00000000000000000000000000000000000000000000A5A5A500FFFFFF00FFFF
      FF0094949400D6D6D600EFEFEF00EFEFEF00CECECE009494940094949400D6D6
      D600D6D6D6009494940000000000000000000000000000000000B5B5B500FFFF
      FF00848484008484840084848400CECECE00848484008484840084848400CECE
      CE00D6D6D600D6D6D6009C9C9C0000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700DEDEDE008C8C8C00CECECE00BDBDBD00A5A5A5008484
      84006B6B6B000000000000000000000000000000000000000000000000000000
      00006B6B6B00B5B5B500B5B5B500ADADAD00ADADAD00ADADAD00A5A5A5006B6B
      6B000000000000000000000000000000000000000000B5B5B500FFFFFF00FFFF
      FF00DEDEDE0094949400D6D6D600CECECE0094949400CECECE0094949400DEDE
      DE00D6D6D6009494940000000000000000000000000000000000B5B5B500FFFF
      FF00FFFFFF00FFFFFF0084848400D6D6D60084848400BDBDBD00DEDEDE00EFEF
      EF00D6D6D600B5B5B5009C9C9C0000000000B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700D6D6D6008C8C8C00D6D6D600BDBDBD00ADAD
      AD007B7B7B005A5A5A0000000000000000000000000000000000000000006B6B
      6B00B5B5B500BDBDBD00ADADAD006B6B6B006B6B6B00ADADAD00B5B5B500A5A5
      A5006B6B6B0000000000000000000000000000000000B5B5B500FFFFFF00FFFF
      FF00FFFFFF00DEDEDE009494940094949400CECECE00EFEFEF00EFEFEF00D6D6
      D600B5B5B5009494940000000000000000000000000000000000BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00848484008484840084848400E7E7E700DEDEDE009C9C
      9C009C9C9C009C9C9C009C9C9C0000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7F7F700CECECE0094949400D6D6D6009494
      94009494940094949400949494000000000000000000000000006B6B6B00BDBD
      BD00BDBDBD00ADADAD006B6B6B0000000000000000006B6B6B00A5A5A500B5B5
      B500ADADAD006B6B6B00000000000000000000000000BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700E7E7E700A5A5A500A5A5
      A500A5A5A500A5A5A50000000000000000000000000000000000BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6009C9C
      9C00ADADAD009C9C9C009494940000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6008C8C8C00949494009C9C
      9C009C9C9C0094949400737373006B6B6B0000000000000000006B6B6B00C6C6
      C600B5B5B5006B6B6B00000000000000000000000000000000006B6B6B00ADAD
      AD00ADADAD006B6B6B00000000000000000000000000BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D600A5A5A500ADAD
      AD00A5A5A500ADADAD0000000000000000000000000000000000BDBDBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE009C9C
      9C00BDBDBD00A5A5A5000000000000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE009C9C9C00A5A5A5008C8C
      8C00948C94008484840084848400737373000000000000000000000000006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000006B6B
      6B006B6B6B0000000000000000000000000000000000BDBDBD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00A5A5A500BDBD
      BD00ADADAD000000000000000000000000000000000000000000BDBDBD00FFFF
      FF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D6D6D6009C9C
      9C00ADADAD00000000000000000000000000BDBDBD00FFFFFF00F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700D6D6D6009C9C9C00ADADAD000000
      00008C8C8C00BDBDBD009C9C9C00737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00FFFFFF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600A5A5A500ADAD
      AD00000000000000000000000000000000000000000000000000BDBDBD00B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B5009C9C
      9C0000000000000000000000000000000000BDBDBD00B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B5009C9C9C00000000000000
      000000000000ADADAD008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00A5A5A5000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFE7FFE7FF800FFFFF07FFC3FC000
      F9FFC001FC3F0000F0FFC001FC3F0000E07FC001FC3F0000C03FC001FC3F0000
      821FC001F81F0000C78FC001F00F0000EFC7C001E0070000FFF3C001C0030001
      FFF9C00180010003FFFFC00100000007FFFFC00180010007FFFFC001C3F0801F
      FFFFF001E7F1F8FFFFFFFC7FFFFBFFFFC001FFFFFFFFFFFFC0010007FFFF8003
      C0010007E7E78003C0010007C3C38003C0010007C1838003C0010007E0078003
      C0010007F00F8003C0010007F81F8003C0010007F81F8003C0010007F00F8003
      C0010003E0078003C0010001C1838003C0010000C3C38003C0030000E7E78007
      C0070010FFFF800FC00F0039FFFF801F00000000000000000000000000000000
      000000000000}
  end
  object SmallImages: TImageList
    Left = 184
    Top = 184
    Bitmap = {
      494C01010F001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000639400006394000063
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094635A00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006B94008CC6DE00CEFFFF007BDE
      F700086B9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094635A00FFF7
      DE00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600F7EFD600A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063940042ADD6008CC6D6009CFF
      FF0052C6E7000063940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000085AE7001852CE003163BD00425A9C001042B5000000
      000000000000000000000000000000000000000000000000000094635A00F7EF
      DE00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400F7E7C600A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000063940031ADD60084BD
      D60084F7FF001894BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000317BEF005A8CD6009CA5B500C6B5AD00DEAD8C00F79C5A00A5948C00215A
      C60000000000000000000000000000000000000000000000000094635A00FFEF
      DE00FFEFD600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7
      D600F7E7CE00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000063940029AD
      D6008CC6DE000063940000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001073FF005A9C
      E700FFD6A500FFD6A500FFDEA500FFD6A500E7A57B00DE844A00FFC68C00EFD6
      C6005A8CD6001863DE000000000000000000000000000000000094635A00EFE7
      D600FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400E7D6BD00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      940018A5D60084BDD600006394000073A5000063940000000000000000000000
      0000000000000000000000000000000000000000000000000000296BBD00CEB5
      9C00FFEFC600FFE7C600FFE7C600EFCEAD00DE946B00E79C6B00FFD6B500FFEF
      D600FFFFEF00A5C6EF002973EF000000000000000000000000009C736B00AD9C
      9400A59C9400A59C9400A59C8C00A5948C00A5948C00A5948400A5948400A594
      8400A59484009C6B630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063940008A5D60084C6DE0031DEFF0008CEFF0000639400006394000063
      940000639400006394000000000000000000000000001873FF00AD733900FFDE
      A500FFF7EF00FFF7E700FFE7D600EFBD9C00D6845200EFAD8400FFE7CE00FFF7
      EF00FFFFF700FFFFFF009CB5E700105AE7008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063940008A5D60018B5E70008CEFF0010CEFF0018D6FF0021D6
      FF0029DEFF0031E7FF00006394000000000000000000186BC6006BB55A00FFF7
      E700FFFFF700FFFFF700F7E7D600E7A58400E7946300F7CEAD00B5B5AD00DED6
      D600FFFFFF00FFFFFF00B5949400296BD6008C39100000000000A5736B00E7EF
      EF00E7734200E7734200E7734200E7734200E7734200E7734200E7734200E773
      4200D6DECE00A5636B00000000008C3110000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063940021D6FF0031D6FF0039D6FF0042D6FF004ADE
      FF0052DEFF005AE7FF006BEFFF000063940000000000186B730063D68C00FFFF
      FF00FFFFFF00FFFFF700EFD6BD00DE946B00E79C7300FFE7D600F7EFE700BDBD
      BD00C6C6C600F7F7EF00847BA500217BFF008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063940052E7FF0052DEFF005ADEFF006BE7FF006BE7
      FF008CEFFF0084DEF7009CF7FF0000639400000000000839C600C6D6EF00FFFF
      FF00FFFFFF00FFFFFF00E7CEBD00DE946B00F7C69C00E7DECE00FFF7F700FFFF
      FF00EFEFE700A5C6F700217BFF00000000000000000000000000B57B6B00D6B5
      9C00D6AD9C00D6AD9C00CEAD9400CEAD9400CEA59400CEA59400CEA59400CEA5
      8C00D6A58C00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000006394007BEFFF0084E7FF008CEFFF0094EFFF00ADF7
      FF00CEEFF70018739C00C6FFFF00006394001863E7001842EF00FFFFFF00DEEF
      FF00A5CEFF0084B5FF00318CFF005A94E700D6D6DE00D6CEC600B5B5B500E7E7
      E700FFFFFF00529CFF001073FF00000000000000000000000000BD846B00FFFF
      FF00FFE7C600FFE7C600FFE7BD00FFE7BD00FFE7BD00FFE7BD00FFE7BD00FFE7
      BD00FFFFEF00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000639400ADEFFF00ADEFFF00B5EFFF00CEFFFF00D6F7
      F70010739C0000639400D6FFFF00006394001873FF00398CFF004A9CFF005A9C
      FF00000000000000000000000000000000001873FF009CCEFF00EFEFEF00D6CE
      C600CEE7FF00297BFF0000000000000000000000000000000000C68C7300FFFF
      FF00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFF7EF00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000639400EFFFFF00BDF7FF00C6F7FF009CD6E700106B
      9C000063940000639400CEFFFF00006394000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001873FF00ADD6
      FF005AA5FF001873FF0000000000000000000000000000000000CE947300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7F700FFF7
      F700FFFFF700A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000639400EFFFFF00D6FFFF008CD6EF008CD6
      E700A5E7F700BDEFF700C6FFFF00006394000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001873FF000000000000000000000000000000000000000000D69C7300FFFF
      FF00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFFFF700A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063940000639400006394000063
      9400006394000063940000639400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C7300CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B006B6B6B0000000000000000006B6B6B006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000084000000840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      6B00ADA5A500A59C9C006B6B6B006B6B6B006B6B6B00E7E7E7006B6B6B006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A8400004A
      8400004A8400004A840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B2910006B2910006B2910006B29
      10006B2910006B29100000000000000000000000000000000000000000000000
      0000000000000000000000008400316BFF000000C60000008400000000000000
      00000000000000000000000000000000000000000000000000006B6B6B00DEDE
      DE00A59C9C00A59C9C00A59C9C0031313100313131006B6B6B00BDBDBD00E7E7
      E700B5B5B5006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      0000004A8400004A8400004A840000000000005A9400004A84000073AD00007B
      B500007BB500006BA50000528C0000528C000000000000000000000000000000
      00000000000000000000000000006B291000CE391800EF423100F7523900F763
      4200F75A4200FF4A31006B2910006B2910000000000000000000000000000000
      0000000000000000000000008400316BFF000000C60000008400000000000000
      000000000000000000000000000000000000000000006B6B6B00D6D6D600CECE
      CE008C8C8C008C8C8C008C8C8C00393939000808080000000000080808000000
      00007B7B7B00BDBDBD006B6B6B0000000000000000000000000000000000004A
      840000BDFF00008CCE0000639C000052940000639C0021ADD60018BDE70008C6
      F70000BDF70000ADE700009CD60008639C000000000000000000000000000000
      00000000000000000000000000006B291000DE421800F75A4200FF734A00BD42
      1000EF9C8C00EF8C7300E74221006B2910000000000000000000000000000000
      0000000000000000000000008400316BFF000000C60000008400000000000000
      0000000000000000000000000000000000006B6B6B00CECECE00CECECE008C8C
      8C00D6D6D600CECECE00BDBDBD00B5ADAD00A5A5A5008C8484005A5A5A000000
      000008080800080808006B6B6B0073737300000000000000000000000000004A
      840000C6FF0000D6FF0000B5EF00006BA500005A940039BDD6004AF7FF0031E7
      FF0018DEFF0000CEFF0000C6FF0008639C00000000000000000000000000005A
      00000000000000000000000000006B291000EF523100FF734A00FF6B4200BD42
      1000FFF7EF00E7B59C00D64218006B2910000000000000000000000000000000
      0000000000000000000000008400316BFF000000C60000008400000000000000
      0000000000000000000000000000000000006B6B6B00CECECE008C8C8C00EFEF
      EF00FFFFFF00FFFFFF00E7E7E700DEDEDE00DEDEDE00CECECE00BDBDBD00ADAD
      AD008C8C8C005A5252007B7B7B00737373000000000000000000004A00000042
      000008639C0018D6FF0018E7FF0010BDEF00006BA500005A940008639C000863
      9C0008639C0008639C0008639C0000000000000000000000000000000000005A
      0000005A0000000000000000000000000000B5311000FF6B4200BD421000EFA5
      8C00FFFFFF00E7A58C00E75229006B2910000000000000000000000000000000
      00000000000000000000000084000029FF000018F70000008400000000000000
      0000000000000000000000000000000000006B6B6B008C8C8C00FFFFFF00FFFF
      FF00FFFFFF00D6D6D6009C949400A59C9C00B5ADAD00C6C6C600D6D6D600DEDE
      DE00C6C6C600B5B5B500948C8C006B6B6B000000000000106B00004A00000052
      00001863180008639C0039DEFF004AFFFF0029BDDE00005A940000639C00006B
      A500004A84000000000000000000000000000000000000000000005A000018BD
      4A00089C1800005A0000000000000000000000000000944A4200847373005A84
      9C0052848C00946B5200B5311000000000000000000000000000000000000000
      00000000000000008400315AFF000831FF000021FF000018EF00000084000000
      000000000000000000000000000000000000000000006B6B6B006B6B6B00EFEF
      EF00B5A5A5007B6B73008C848C0094949400949494009C949C009C9494009C9C
      9C00BDBDBD00D6D6D600C6C6C6006B6B6B00000084000000B500004A0000005A
      08001863180008639C0008639C0029ADCE0039C6DE0000639C0000639C00006B
      A50008639C0000000000000000000000000000000000005A000039D66B0031CE
      630018BD4A00089C1800005A00000000000000000000086BDE000063CE00085A
      C6000052C600086B9C0000000000000000000000000000000000000000000000
      000000008400315AFF00315AFF001039FF000029FF000018F7000018DE000000
      8400000000000000000000000000000000000000000000000000000000006B6B
      6B00BD8C7B00A5846B008C6B63007B6363006B6363007B737B008C8C8C00ADA5
      A500CECECE00C6C6C6006B6B6B0000000000000084000000C600004A0000086B
      10001863180008639C000073AD0008639C0008639C00007BB5000073B500006B
      AD0008639C00000000000000000000000000005A000039D66B00005A000039D6
      6B0031CE6300005A0000000000000000000000315A00187BFF002184FF002184
      FF00187BF700106BEF00086B9C00000000000000000000000000000000000000
      8400315AFF00315AFF00315AFF000829DE000018DE000010DE000010CE000018
      CE00000084000000000000000000000000000000000000000000000000000000
      0000BD848400FFE7B500FFD69C00EFB58400CE9C7300BD946B00BD848400847B
      7B006B6B6B006B6B6B000000000000000000000084000008CE00004A00001084
      18001863180008639C0031BDEF0021C6EF0010C6F70000BDF70000B5EF0000AD
      EF0008639C00000000000000000000000000005A0000005A0000000000000052
      0000005A0000000000000000000000426B00085294002994FF002994FF002994
      FF00218CFF002184FF001873EF00086B9C000000000000000000000084000000
      8C0000008C0000089C0000089C000008AD000008BD000010BD001021BD000808
      9C0008089C000000840000000000000000000000000000000000000000000000
      0000BD848400FFE7BD00FFD6A500FFD69C00FFCE9400FFC68C00BD8484000000
      000000000000000000000000000000000000000084000010E700004A0000189C
      31001863180008639C004AD6E70042EFFF0031E7FF0018D6FF0008C6F70000BD
      FF0008639C00000000000000000000000000005A00000000000000000000005A
      00000000000000000000000000000039630000315A002994EF00298CE700319C
      FF00299CFF002994FF001884F700086B9C0000000000000084000018AD001810
      7300181073000018B5002929B50039C6E70000B5EF0000739C001039FF002952
      FF00315AFF002142E7000000840000000000000000000000000000000000C684
      8400FFE7CE00FFE7C600FFDEB500FFD6A500FFD69C00BD848400000000000000
      000000000000000000000000000000000000000084000018F700004A000029C6
      4A00186318001894290008639C0008639C0008639C0008639C0008639C000863
      9C0000000000000000000000000000000000005A000000000000000000000000
      0000000000000000000000000000004A8400004A840000315A0000315A0031A5
      FF00319CFF002994FF00218CF700086B9C00000084000000940084633100EFAD
      1800E7A50800845A310000008C00525ACE0031F7FF0000E7FF00088CA5000008
      940008089C0031738C000808940000008400000000000000000000000000BD84
      8400FFEFDE00FFE7CE00FFDEBD00FFDEB500FFD6A500BD848400000000000000
      000000000000000000000000000000000000000084000018FF00004A0000299C
      390021B539001863180018631800186318000863080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000106B9C00529CBD0000426B00187BBD0039AD
      FF0031A5FF0031A5FF00086B9C00000000000000000000008C00BD8C5200F7E7
      9C00E7CE6300D68C08000000840000008400424AB50039FFFF00004A84000000
      94000031520000CE000000311800000000000000000000000000BD848400FFFF
      F700FFFFF700FFEFDE00FFE7CE00FFE7BD00F7C6A500BD848400000000000000
      00000000000000000000000000000000000000008400637B94004AA55A001863
      180018631800218C3100189C310021AD39001863180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000106B9C00529CBD00106394000039
      6B0000396B0000396B00086B9C00000000000000000000000000BD8C5200FFFF
      EF00F7DE8C00D694100000000000000000000000000000000000000000000000
      000000CE000000FF000008AD0000107300000000000000000000BD848400BD84
      8400BD848400FFEFE700FFE7CE00FFDEC600BD84840000000000000000000000
      000000000000000000000000000000000000000000000000840000008400639C
      6B00639C6B001863180018631800186318000863100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002173A500106B94000052
      7B0000396B00000000000000000000000000000000000000000000000000BD8C
      5200BD8C52000000000000000000000000000000000000000000000000000000
      000000BD000000E7000008840000000000000000000000000000000000000000
      000000000000BD848400BD848400BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000B5000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000844A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004A0000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084BD000084BD0094524A00A55242009C5A4A009C5A4A009C5A
      4A009C5A4A0094524A0094524A0094524A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000844A4A00844A4A00A54A4A00AD4A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000005A000042F7840000840000004A0000000000000000
      00000000000000000000000000000000000000000000000000000084BD000084
      BD000084BD00009CDE000084BD0094524A00FFD6AD00FFDEB500FFD6A500FFCE
      9C00FFCE9400FFC69400FFC68C0084524A000000000000000000000000000000
      000000000000004A0000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00844A
      4A00B54A5200C64A5200C64A4A00B54A4A004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A00000000000000000000000000000000000000
      00000000000000000000005A000042F7840000840000004A0000000000000000
      0000000000000000000000000000000000000084BD000084BD0018C6F70010CE
      FF0000C6FF0000B5F7000084BD0094524A00F7C6AD009C6B63009C6B63009C6B
      63009C6B63009C6B6300FFCE9C0084524A000000000000000000000000000000
      0000004A0000089C1800089C1800004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00D65A
      5A00CE525200CE525200CE525200B54A52004A181800FF8C8C00FF9C9C00FFAD
      AD00F7B5B500F7B5B500844A4A00000000000000000000000000000000000000
      00000000000000000000005A000042F7840000840000004A0000000000000000
      0000000000000000000000000000000000000084BD006BF7FF0063FFFF00006B
      080018B5AD0010C6FF000084BD00006B0800FFDED600FFE7CE00FFE7C600FFDE
      BD00FFDEB500FFD6AD00FFD6A50084524A00000000000000000000000000004A
      000018B5310010A52100089C180010A52100004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00D65A
      5A00D65A5A00CE5A5A00CE525A00BD5252004A18180021B54A0010C64A0010BD
      4A0008BD4200F7B5B500844A4A00000000000000000000000000000000000000
      00000000000000000000005A000042F7840000840000004A0000000000000000
      0000000000000000000000000000000000000084BD007BFFFF008CFFFF00006B
      0800006B080029D6FF000084BD00006B0800006B08009C6B63009C6B63009C6B
      63009C6B63009C6B6300FFDEB50084524A000000000000000000004A000029C6
      520021BD420010942100004A000008941800089C1800004A0000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00DE63
      6300D65A6300D65A5A00D65A5A00C6525A004A18180029B54A0018BD4A0018BD
      4A0010BD4200F7B5B500844A4A00000000000000000000000000000000000000
      00000000000000000000005A000021BD520010A52900004A0000000000000000
      0000000000000000000000000000000000000084BD0084FFFF008CFFFF00006B
      080029BD4A00006B0800006B0800006B0800008C1000006B0800FFF7E700FFEF
      DE00FFEFD600FFE7CE00FFE7C60084524A0000000000004A000031CE5A0039D6
      630018A53100004A000000000000004A000008841000089C1800004A00000000
      0000000000000000000000000000000000000000000000000000844A4A00E76B
      6B00DE636300DE636300DE636300C65A5A004A18180021B54A0010BD4A0018BD
      4A0010BD4200F7B5B500844A4A00000000000000000000000000000000000000
      000000000000005A000029D65A0018BD420008A5210000940800004A00000000
      0000000000000000000000000000000000000084BD004AD6E700109CCE000094
      D600006B080029BD4A0029BD4A0018B53100008C1000008C1000006B08009C6B
      63009C6B63009C6B6300FFEFD60084524A000000000000000000004A000029B5
      4A00004A000000000000000000000000000000000000004A000008941800004A
      0000000000000000000000000000000000000000000000000000844A4A00EF6B
      6B00E7636B00E77B7B00FFD6D600CE6B73004A181800A5DE940052D66B0042CE
      630029C65A00F7B5B500844A4A00000000000000000000000000000000000000
      0000005A000039E76B0021CE5A0018B53900089C1800008C000000840000004A
      0000000000000000000000000000000000000084BD00008CC60008B5EF0000C6
      FF0000BDFF00006B0800006B0800006B0800008C1000006B0800FFF7F700F7F7
      EF00F7EFEF00E7DED600D6CEBD0084524A00000000000000000000000000004A
      0000000000000000000000000000000000000000000000000000004A00000884
      1000004A00000000000000000000000000000000000000000000844A4A00F773
      7300EF6B6B00EF848400FFD6D600CE6B73004A181800FFF7CE00FFFFD600FFFF
      D600E7FFC600F7B5B500844A4A0000000000000000000000000000000000005A
      00004AFF8C0039EF730021CE5A0010B53900089C1800008C0000008400000084
      0000004A00000000000000000000000000000084BD004AE7FF0039E7FF0021D6
      FF0010CEFF0000BDFF00007B8400006B0800006B0800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094524A0094524A0094524A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004A0000004A000000000000000000000000000000000000844A4A00FF7B
      7B00F7737300EF737300F7737300D66363004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000005A000031DE
      630029C6520018A53900088C2100007B100000730000006B0000006B0000006B
      000000730000004A000000000000000000000084BD0073FFFF006BFFFF0052EF
      FF0031E7FF0018C6EF000084BD00006B0800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0094524A00F7AD5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004A0000004A0000000000000000000000000000844A4A00FF7B
      8400F77B7B00F77B7B00F7737B00D66B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A000000000000000000005A0000006300001063
      0000106B000000730800299C390039CECE0000C6CE0000847B002194310021A5
      310018942900007B0800004A0000000000000084BD0084FFFF008CFFFF0084FF
      FF0063F7FF0031CEEF000084BD00DEA57300D6946B00D6946B00D6946B00D694
      6B00D6946B0094524A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00FF84
      8400FF7B8400FF7B7B00FF7B8400DE6B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A0000000000005A0000005A0000738C0000EF9C
      2100E79410007B8C080008AD210052D6840031EFFF0000DEFF00089CA50042D6
      730029DE52007BC69C0010841800004A00000084BD0084FFFF005ADEEF0031C6
      DE0018A5D600109CCE000894CE00108CBD0031849C003194A500319CB5002994
      B5005A7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00FF8C
      8C00FF848400FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A000000000000000000005A0000D6A56300F7E7
      9C00E7CE6300D68C08000052000000520000428C4A0039EFFF00005A4A000042
      000042734200F75AF70039103900000000000084BD00109CCE000894CE0018A5
      CE0052DEEF006BF7FF004AEFFF0010C6F70000ADEF0000ADEF00008CD600008C
      CE000084B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00844A
      4A00E7737300FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      CE00FFFFD600F7B5B500844A4A00000000000000000000000000D6B58C00FFFF
      EF00F7DE8C00D694100000000000000000000000000000000000000000000000
      0000FF94FF0000000000AD00AD007B007B00000000000084BD000084BD000084
      BD000084BD0018ADD60010ADD6000094CE000084C6000084C6000084BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000844A4A009C525200CE6B6B00CE6B6B004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A0000000000000000000000000000000000C6A5
      7300C69442000000000000000000000000000000000000000000000000000000
      0000FF94FF00FF29FF008C008C00000000000000000000000000000000000000
      0000000000000084BD000084BD000084BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000844A4A00844A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF94FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5948400FFEF
      C600F7DEB500F7D6AD00F7D6A500EFCE9400EFC68C00EFC68400EFC67B00EFC6
      8400EFC68400F7C68400A5636B0000000000A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5636B008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A0084524A0000000000000000000000000000000000B5948400FFEF
      CE00F7DEBD00F7D6B500F7D6A500EFCE9C00EFC69400EFC68C00EFBD8400EFBD
      7B00EFBD7B00EFC68400A5636B0000000000A5636B00FFEFCE00F7DEBD00DEC6
      A500C6AD8C00BDA58400CEAD8400DEB58400E7BD7B00E7BD7B00EFBD7B00EFC6
      8400A5636B000000000000000000000000000000000000000000000000000000
      6B0000006B000000000000000000000000000000000000000000000000000000
      6B0000006B0000000000000000000000000000000000A5636B00FFEFCE00F7DE
      BD00F7D6B500F7D6A500EFCE9C00EFC69400EFC68C00EFBD8400EFBD7B00EFBD
      7B00EFC6840084524A0000000000000000000000000000000000B5948C00FFEF
      DE00F7E7C600F7DEBD00EFD6AD00DEC69C00D6B58C00DEBD8C00E7BD8C00EFBD
      8400EFBD7B00EFC68400A5636B0000000000A5635A00FFEFDE00F7E7C6003129
      290021212100314242009C846B00AD946B00C6A57300DEB57B00E7BD7B00EFC6
      8400A5636B00000000000000000000000000000000000000000000006B000018
      EF000010DE0000006B000000000000000000000000000000000000006B000000
      E7000008E70000006B00000000000000000000000000A5635A00FFEFDE00F7E7
      C600F7DEBD00F7D6B500C6C68C000073000000730000BDB57300EFBD8400EFBD
      7B00EFC6840084524A0000000000000000000000000000000000BD948C00FFF7
      E700F7E7CE00F7E7C600E7CEAD00BDA58C00AD947300BD9C7B00DEBD8C00EFC6
      8C00EFBD8400EFC68400A5636B0000000000A5635A00FFF7E700F7E7CE009C8C
      84000842630000639400083952004A424200947B5A00B5946B00D6AD7300EFBD
      7B00A5636B00000000000000000000000000000000000000000000006B000018
      E7000018EF000010DE0000006B00000000000000000000006B000000DE000008
      EF000000DE0000006B00000000000000000000000000A5635A00FFF7E700F7E7
      CE0000730000C6CE940000730000C6C68400C6BD840000730000BDB56B00EFBD
      8400EFC6840084524A0000000000000000000000000000000000C69C9400FFFF
      F700F7E7D600E7D6C600004A0000004A0000004A0000A58C7300C6AD8400DEB5
      8C00E7BD8400EFC68400A5636B0000000000A5736B00FFFFF700FFEFDE00EFDE
      CE0021526B00105A8400735A63007B5252005A39390084735A00A58C6300CEAD
      7300A56363000000000000000000000000000000000000000000000000000000
      6B000018DE000021EF000010DE0000006B0000006B000000E7000008EF000000
      DE0000006B0000000000000000000000000000000000A5736B00FFFFF700FFEF
      DE000073000000730000C6CE9C00F7D6B500F7D6AD00BDBD840000730000EFC6
      8C00EFC6840084524A0000000000000000000000000000000000C6A59C00FFFF
      FF00E7DED600C6B5AD00004A0000089C1800004A000094846B00A58C7300BD9C
      7B00DEBD8C00F7CE8C00A5636B0000000000A5736B00FFFFFF00FFF7E700FFEF
      DE008C9C9C0063525A00DE948C00BD7B7B008C5252005A3931007B6B52009C84
      5A00945A5A000000000000000000000000000000000000000000000000000000
      000000006B000018DE000021EF000010E7000008EF000008EF000000DE000000
      6B000000000000000000000000000000000000000000A5736B00FFFFFF00FFF7
      E700007300000073000000730000F7DEBD00F7D6B500F7D6A500EFCE9C00EFC6
      9400F7CE8C0084524A0000000000000000000000000000000000CEAD9C00FFFF
      FF00004A0000004A0000004A000010AD2900004A0000004A0000004A0000AD94
      7300D6BD8C00F7CE9400A5636B0000000000BD846B00FFFFFF00FFF7F700FFEF
      E700F7E7D6006B5A6300EFA5A500CE949400B5737300845252005A3931007B6B
      5200845252000000000000000000000000000000000000000000000000000000
      00000000000000006B000018E7000010EF000010EF000008DE0000006B000000
      00000000000000000000000000000000000000000000BD846B00FFFFFF00FFF7
      F700FFEFE700FFEFDE00F7E7CE00F7E7C600007300000073000000730000EFCE
      9C00F7CE940084524A0000000000000000000000000000000000CEAD9C00FFFF
      FF00004A000031DE630029D6520021C6420018B5310010A52100004A0000BDA5
      8C00DEC69C00F7D6A500A5636B0000000000BD846B00FFFFFF00FFFFFF00FFF7
      F700FFEFE700EFDECE008C5A5A00E7A5A500CE8C8C00B5737300845252005A39
      3900734A4A000000000000000000000000000000000000000000000000000000
      00000000000000006B000021E7000018EF000018EF000010DE0000006B000000
      00000000000000000000000000000000000000000000BD846B00FFFFFF00FFFF
      FF0000730000CEDEBD00F7EFDE00F7E7CE00C6CE9C000073000000730000F7D6
      A500F7D6A50084524A0000000000000000000000000000000000D6B5A500FFFF
      FF00004A0000004A0000004A000029D65A00004A0000004A0000004A0000E7CE
      AD00EFD6AD00EFCEA500A5636B0000000000D6946B00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFEFE700E7CEC600845A5A00E7A5A500CE8C8C00B57373008452
      5200633939000000000000000000000000000000000000000000000000000000
      000000006B000029E7000031EF000021E7000018E7000021EF000018DE000000
      6B000000000000000000000000000000000000000000D6946B00FFFFFF00FFFF
      FF00CEE7CE0000730000CEDEBD00CED6B50000730000C6CE9C0000730000F7DE
      B500EFCEA50084524A0000000000000000000000000000000000DEB5A500FFFF
      FF00FFFFFF00FFFFFF00004A000031DE6300004A0000C6B5AD00E7D6C600FFEF
      CE00DECEB500B5AD9400A5636B0000000000D6946B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFEFE700D6C6B5008C5A5A00E7A5A500CE8C8C00B573
      73007B4242003942420000000000000000000000000000000000000000000000
      6B000831E7000839EF000029DE0000006B0000006B000018DE000029EF000018
      DE0000006B0000000000000000000000000000000000D6946B00FFFFFF00FFFF
      FF00FFFFFF00CEE7CE000073000000730000CED6B500FFE7D600FFEFCE00DECE
      B500B5AD940084524A0000000000000000000000000000000000DEB5A500FFFF
      FF00FFFFFF00FFFFFF00004A0000004A0000004A0000EFE7D600E7D6C600B58C
      7B00A57B6B009C736300A5636B0000000000DE9C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFF7E700CEB5AD0094636300EFADAD008C6B
      7300187B9C00089CBD00089CBD0000000000000000000000000000006B001042
      E7001042EF000829DE0000006B00000000000000000000006B000021DE000029
      EF000018E70000006B00000000000000000000000000DE9C7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7E700EFDECE00A5635A00A563
      5A00A5635A00A5635A0000000000000000000000000000000000E7BDA500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD00AD73
      5A00E79C5200E78C3100B56B4A0000000000DE9C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD00945A52009C5A5A002984
      A50000BDF700008CDE000008940000008400000000000000000000006B00184A
      E7001031DE0000006B000000000000000000000000000000000000006B000021
      DE000021E70000006B00000000000000000000000000DE9C7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD00A5635A00E79C
      5200E78C3100B56B4A0000000000000000000000000000000000E7BDA500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600BD84
      6300FFB55A00BD7B5A000000000000000000E7AD7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B5A00D6944A00008C
      C6000094DE000021BD000018B50000089C000000000000000000000000000000
      6B0000006B000000000000000000000000000000000000000000000000000000
      6B0000006B0000000000000000000000000000000000E7AD7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A5635A00FFB5
      5A00BD7B5A000000000000000000000000000000000000000000E7BDA500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00F7F7EF00F7F7EF00DEC6C600B57B
      6300C6846B00000000000000000000000000E7AD7B00FFF7F700FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00F7F7EF00F7F7EF00DEC6C600A56B5A00C6846B000000
      00000063BD002942EF001031D600000894000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AD7B00FFF7F700FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00F7F7EF00F7F7EF00DEC6C600A5635A00C684
      6B00000000000000000000000000000000000000000000000000EFC6AD00EFCE
      B500EFCEB500EFCEB500EFCEB500EFCEB500EFCEB500EFCEB500E7C6B500A56B
      5A0000000000000000000000000000000000E7AD7B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B5A00000000000000
      0000000000002131D6000818B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AD7B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00A5635A000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008FFFFFFFC003000007FFFFFFC0030000
      03FFFC1FC003000083FFF00FC0030000C3FFC003C0030000E07FC001C0030000
      F003800000000000F801800040020000FC00800000000000FC008001C0030000
      FC000001C0030000FC000F03C0030000FC00FFC3C0030000FE00FFF7C0030000
      FF01FFFFC0030000FFFFFFFFC0030000F33FFFFFFFFFFE7FE007FFC3FF03FC3F
      C000F100FE00FC3F8001E000FE00FC3F0000E000EE00FC3F0000C001E700FC3F
      00008007C381F81F800000078183F00FE00100070301E007F00300072600C003
      F01F00076E008001E03F000F7E000000E03F007FFE018001C03F007FFF01C3F0
      C07F807FFF87E7F1F8FFE3FFFFFFFFFBFFFFFE7FFE7FF800FFFFF07FFC3FC000
      F9FFC001FC3F0000F0FFC001FC3F0000E07FC001FC3F0000C03FC001FC3F0000
      821FC001F81F0000C78FC001F00F0000EFC7C001E0070000FFF3C001C0030001
      FFF9C00180010003FFFFC00100000007FFFFC00180010007FFFFC001C3F4801F
      FFFFF001E7F1F8FFFFFFFC7FFFFBFFFFC001FFFFFFFFFFFFC0010007FFFF8003
      C0010007E7E78003C0010007C3C38003C0010007C1838003C0010007E0078003
      C0010007F00F8003C0010007F81F8003C0010007F81F8003C0010007F00F8003
      C0010003E0078003C0010001C1838003C0010000C3C38003C0030000E7E78007
      C0070010FFFF800FC00F0039FFFF801F00000000000000000000000000000000
      000000000000}
  end
  object LargeImages: TImageList
    Height = 24
    Width = 24
    Left = 184
    Top = 248
    Bitmap = {
      494C010114001800040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000090000000010020000000000000D8
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008731000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000005200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7
      CE00EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000873100008731000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000052000000000000000000000000000000000000000000000000
      0000000000000000000000520000006300000052000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7CE00EFDECE00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600EFDEC600EFDE
      C600A5636B0000000000000000000000000094635A00BD8C7B00BD8C7B00BD8C
      7B00BD8C7B00BD8C7300BD8C7300BD8C7300BD8C7300BD8C7300C68C7300BD84
      6B000873100029BD520008731000AD846300C6847B009C636B00000000000000
      000000000000000000000000000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000520000006300000052000000000000000000000000000000639C000063
      9C0000639C0000520000006B000000940800006B0000004A1000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7D600EFE7CE00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400EFDEC600EFDE
      C600A5636B000000000000000000000000009C6B6300F7DEB500FFE7BD00FFDE
      AD00FFD6A500FFD69C00FFD69C00FFD69400FFD68C00FFD68C00EFBD84000873
      100021A539004AE7840008731000087310000873100008731000000000000000
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000031
      FF000031FF000000000000000000000000000000000000000000000000000052
      0000006B000000940800006B0000004A10000063A500088CBD000073AD00006B
      9C000052000000630000088C100000940800008C0800005A0000006339000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00F7E7D600F7E7D600EFE7CE00EFE7CE00EFDECE00EFDECE00EFDEC600EFDE
      C600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600A5636B000000000000000000000000009C6B6300F7DEBD00FFE7BD00FFDE
      B500FFDEAD00FFDEA500F7C69C00B59494008C73A5008C737B000873100029B5
      52004AE77B004ADE730042DE730031C65A0021A54200108C2900006B0800005A
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B730000000000000000000031FF000031
      FF000031FF000000180000000000000000000000000000000000005200000063
      0000088C100000940800008C0800005A000000633900087BB500006B9C000052
      00000063080018A5290010A521000894100000940800008C0800005A0000086B
      5200000000000000000000000000000000000000000000000000000000009463
      5A00F7E7D600EFE7D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600EFDEC600EFDE
      C600A5636B000000000000000000000000009C6B6300FFDEC600FFE7C600FFE7
      BD00FFE7B500947B9C001821A5000018DE000018D6000873100031BD52004AE7
      7B004ADE73004ADE730042D6730039D6630031CE5A0031C6520021B542000884
      1800005A0000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000000
      0000000000000031E700000000000000000000000000005200000063080018A5
      290010A521000894100000940800008C0800005A0000086B5200005200000052
      000018A5310021BD420018A5290010A52100089418000084080000730000005A
      000021B59C000000000000000000000000000000000000000000000000009463
      5A00E7DED600E7DECE00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400E7CEBD00E7CE
      BD00A5636B000000000000000000000000009C6B6300F7E7CE00FFE7C600FFEF
      C6008C73A5000010C6000018F7000018FF00215AA5000873100039D66B004AE7
      7B0042DE730042D6730042D66B0039CE630031C6520029C64A0029BD420018B5
      310008841800005A00000000000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      0000000000000031E7000031FF0000000000005200000052000018A5310021BD
      420018A5290010A52100089418000084080000730000005A000000520000005A
      0000086B08000884180021BD420018B53100088C180000520800005A08000052
      00000052000018A57B0000000000000000000000000000000000000000009C6B
      6300CEC6BD00CEC6BD00CEC6B500CEC6B500CEC6B500CEC6B500CEC6B500CEBD
      AD00CEBDAD00CEBDAD00CEBDAD00CEBDA500CEBDA500C6B5A500C6B5A500C6B5
      A500A5636B000000000000000000000000009C6B6300FFE7D600FFF7D600A59C
      B5000010CE000021FF000021FF005273FF00E7EFFF00B5CEB5000873100039CE
      63004ADE7B0042D66B0031BD4A00189C3100189429001894290018A5290018AD
      290010AD2100087B080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031FF000031FF0000520000005A0000086B08000884
      180021BD420018B53100088C180000520800005A0800005200000052000018A5
      7B00086B5A00005A000029BD4A0029C64A00108C1800004A290000639C000063
      9C00006BA50000528C0000528C00000000000000000000000000000000008C5A
      5200A59C9400A59C9400A59C9400A5949400A5948C009C948C009C948C009C94
      8C009C948C009C9484009C9484009C9484009C9484009C9484009C8C84009C8C
      84008C5A5A000000000000000000000000009C6B6300FFEFDE00FFEFDE003142
      C6000021FF000018FF00395AFF00F7F7FF00D6DEFF00BDC6FF00B5CEB5000873
      100031BD4A0039D66B00087310007B844A009C8C5A0042632900006300000073
      0800089418000894100000630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A84001094CE00086B5A00005A
      000029BD4A0029C64A00108C1800004A290000527300005A730008738C001894
      BD001094C6000052000029B5420039D6630018942100005A31000073B5000063
      9C00006BA5000084C60000A5E700006BA5008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910009C6B6300FFF7E700CEBDCE000821
      CE000029FF000021FF00395AFF006384FF007B94FF00637BFF00C6CEFF00527B
      BD000873100029BD3900087310008C737B00E7AD84009C636300000000000000
      000000630800088C1000006B080000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      000000000000000000000000000000000000004A840000527B0000527B000052
      000029B5420039D6630018942100005A31000063A500004A8C00004A8C000042
      7B0000000000005A18001894290042E77B0021A53900005A210000639C000073
      B50000BDF70000C6FF0000D6FF00006BAD008C3910000000000000000000A573
      6B00E7DED600E7DED600DED6CE00DED6CE00DED6CE00DED6CE00DED6C600DED6
      C600DED6C600DECEC600DECEBD00DECEBD00DECEBD00DECEBD00DECEB500DECE
      B500A5636B0000000000000000008C391000A5736B00FFFFEF006B6BBD000018
      DE000839FF000831FF000029FF000029FF009CB5FF00DEE7FF00F7F7FF003152
      FF000018DE0008731000087310005A5A7B00E7A57B009C636300000000000000
      000000000000007308000073080000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000031
      FF000031FF00000000000000000000000000004A84001094CE001094CE00005A
      18001894290042E77B0021A53900005A21000084CE00007BBD00007BBD000052
      840000000000004A52000063080039D66B0039D66B0000630800004A420000C6
      FF0000C6FF0000C6FF00086B9C00000000008C3910000000000000000000A573
      6B00D6CEC600D6CEC600CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A
      2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CEBDAD00CEBD
      AD00A5636B0000000000000000008C391000A5736B00FFFFF7006B6BBD000021
      DE001042FF000831FF001039FF00BDCEFF00FFFFFF00F7F7FF00527BFF000021
      FF000021FF000021EF00087310005A5A7B00E7A57B0094636300000000000000
      00000000000000630000006B080000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B730000000000000000000031FF000031
      FF000031FF00000018000000000000000000004A84000873B5000873B500004A
      52000063080039D66B0039D66B0000630800004A4200005A9400006BAD000063
      9C000000000000528C00006B29001894290042E77B0029AD4200004A0000006B
      6B0000CEFF0000B5F700086B9C00000000008C39100000000000000000009C6B
      5A00A5A59C00A5A59C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD
      9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C009C948C009C94
      8C008C5A5A0000000000000000008C391000AD7B6B00FFFFFF009494D6000821
      D6001842FF000831FF005273FF00E7EFFF00CEDEFF006384FF000018FF000029
      FF000029FF000021FF000018EF0073639C00E7AD7B0094636300000000000000
      000000000000000000000063000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000000
      0000000000000031E7000000000000000000004A8400006394000063A5000063
      A500006B29001894290042E77B0029AD4200004A0000006B6B00005A9C00004A
      840000528C0000639C00006BA500004A0000189C290042DE730029BD4A00086B
      1000006B2900006B520000000000000000008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C391000B57B6B00FFFFF700FFF7F7002139
      D6001842FF001039FF006384FF00D6DEFF00A5B5FF009CB5FF00A5B5FF00214A
      FF000029FF000029FF000018D600B5949400E7AD7B0094636300000000000000
      00000000000000000000005A000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      0000000000000031E7000031FF0000000000004A84001894BD00006BA500006B
      A500087B9400004A0000189C290042DE730029BD4A00086B1000006B2900006B
      520000525A00087B9400086B940031D6EF00005210000873080018A5310021A5
      390010841000006300000052000000520000000000000000000000000000B57B
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00F7EFE700F7EFE700F7EFE700F7EFE700F7E7DE00F7E7DE00F7E7
      DE00A5636B00000000000000000000000000BD846B00FFF7F700FFFFFF008484
      D6000829E700214AFF00214AFF00BDCEFF00FFFFFF00FFFFFF00A5B5FF001039
      FF000831FF000021EF0031319C00FFD6A500D6A58C0094636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031FF000031FF00004A8400005A9400004A8400005A
      9C00005A9C00005A7300005210000873080018A5310021A53900108410000063
      00000052000000520000004A080052FFFF0052FFFF00005A420000521000005A
      1000005A1000005A18000052210000000000000000000000000000000000BD84
      6B00FFFFFF00FFFFFF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600F7E7DE00F7E7
      DE00A5636B00000000000000000000000000BD847300FFF7F700FFFFFF00F7EF
      F7003142C6001031EF001842FF002952FF0094ADFF007B94FF001842FF001039
      FF000029F7002131B500CEADA500FFE7B500D6A58C0094635A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A84000873A50000639C00088C
      BD00006BB500006BB50000639C00005A420000521000005A1000005A1000005A
      18000052210000526B0052DEEF0063FFFF0052E7F700086B9C00086B9C000000
      000000000000000000000000000000000000000000000000000000000000C68C
      6B00FFFFFF00FFFFFF00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400F7EFDE00F7EF
      DE00A5636B00000000000000000000000000C68C7300FFF7F700FFFFFF00FFFF
      FF00EFE7F7005A63CE002139D6001031EF000831F7000831F7000831F7001029
      CE004A4AB500E7CEBD00FFEFC600FFE7BD00D6AD940094635A00000000000000
      000000000000000000000000000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      000000000000000000000000000000000000004A840000639C0000639C00007B
      B5000073AD00007BB500007BB5000073B500006BA500005A9400006BAD00004A
      84000000000000000000107BA5001073A500086B9C0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EFE700F7EF
      E700A5636B00000000000000000000000000CE947300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEEF009494D6006B73CE006B73CE008C84C600CEC6
      CE00FFF7D600FFF7D600FFE7CE00FFEFC600D6AD940094635A00000000000000
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000031
      FF000031FF00000000000000000000000000005A940029ADCE0029C6EF0018CE
      F70018CEF70008C6FF0000C6FF0000BDFF0000B5F70000ADEF000094D600004A
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7EF00F7EFEF00F7EFE700F7EF
      E700A5636B00000000000000000000000000CE947300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFEF00E7CE
      BD00CE9C8C00C6948C00C69C8C00C69C8C00B584730094635A00000000000000
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B730000000000000000000031FF000031
      FF000031FF0000001800000000000000000008639C0073FFFF0052FFFF0039EF
      FF0031E7FF0018DEFF0010D6FF0008CEFF0000CEFF0000CEFF0000D6FF00004A
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFFFFF00FFFFFF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600F7F7EF00F7EF
      E700A5636B00000000000000000000000000D69C7300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      A500A56B5A00CE946300CE8C5200D6843900D684390000000000000000000000
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000000
      0000000000000031E700000000000000000008639C00299CBD0042CEE7004ADE
      EF0039DEFF0031DEFF0021DEFF0010CEFF0008C6FF0000A5E700008CCE00004A
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFF7EF00FFF7
      EF00A5636B00000000000000000000000000D69C7300FFFFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      A500B57B6300EFB57300EFAD5200EF9C39000000000000000000000000000000
      000000000000000000000000000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      0000000000000031E7000031FF00000000000000000000000000086394000063
      9400086B9C000873A5000873A500006B9C000063940000528C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7F700FFF7
      EF00A5636B00000000000000000000000000D69C7300FFFFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      AD00B5736300EFB57300EFAD5200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031FF000031FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7
      F700A5636B00000000000000000000000000D69C7300FFF7EF00FFFFFF00FFFF
      F700FFFFF700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFFFFF00CEAD
      A500B57B6300DEA56B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B0094636300000000000000000000000000D6946B00D69C7300D69C7300D69C
      7300D69C7300CE947300CE947300C68C7300C68C7300BD847300B5847300AD73
      6300B57B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000528C0000528C0000528C000052
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006B080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B6B6B006B6B6B006B6B6B0000000000000000000000
      0000000000006B6B6B006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000528C0000528C0000528C00004A8400000000000000
      000000000000005A9400005A9400005A9C000063A50000639C0000639C00005A
      9C00005A9400005A940000639C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B29
      10006B2910006B2910006B2910006B2910006B2910006B2910006B2910006B29
      10006B2910000000000000000000000000000000000000000000000000000000
      000000730800007B080000730000000000000000000000000000007BB5000084
      B500007BB500007BB500007BB5000073A500006B9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B00B5ADAD00949494008C8C8C006B6B6B006B6B6B00847B
      7B006B6B6B00DEDEDE00D6CECE006B6B6B006B6B6B006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000639C00006BA500005A9400005A9400005A9400004A84000000
      0000005A9400006BA500005A9C0000639C00006BA500006BA500006BA5000063
      9C00005A940000528C00005A940000528C000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B291000B531
      0800D6422100EF422900F74A3100F74A3900F7523900F7634200F74A3100F742
      3100F74A31006B2910006B29100000000000000000000000000000000000006B
      00000884080008A5180008840800006B21000884B50010A5CE00088CBD000084
      B5000094C600008CBD00008CC600007BB500007BAD00006B9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B00D6D6D600C6C6C600A59C9C00A59C9C00A59C9C00848484005A5A
      5A00BDBDBD00CECECE00CECECE00D6D6D600D6D6D600CECECE006B6B6B006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000000000
      00000000000008639C0000BDFF00009CD600006BA50000528C0000639C00004A
      8400005A94000884B500188CBD00109CC60008A5DE0000B5EF0000B5F70000A5
      E7000094CE00007BBD00006BA50000528C000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B291000BD39
      0800DE422100EF4A3100F75A3900FF6B4200FF734A00FF634200FF846B00F763
      5200EF423100E7422900CE4221006B2910000000000000000000006B0000007B
      080010A5210010AD180008A5180000730000087B52001094C6000084B5000073
      AD000084B5000084B5000084B5000073AD00007BAD00007BB5000073AD000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      6B00DED6D600E7DEDE00C6BDBD00A59C9C00A59C9C00A59C9C00636363000000
      000000000000101010005A5A5A00ADADAD00CECECE00CECECE00CECECE00CECE
      CE00C6C6C6006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      00000000000008639C0000C6FF0000C6FF0000B5F7000084C60000639C000063
      9C0000528C00219CC60031BDDE0029B5DE0021B5DE0018BDEF0008C6FF0000C6
      FF0000CEFF0000CEFF0000BDF70008639C000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B291000C639
      1000E7422900F75A4200FF734A00FF734A00FF6B4200BD421000FFDED600FFBD
      B500BD421000E7422900C63921006B29100000000000006B0000087B100029BD
      420021B5390010AD210010AD180008A518000073000010846B0021C6EF0010C6
      F70008C6F70000BDF70000B5E70000A5D60000B5E700009CCE000073A5000000
      00000000000000000000000000000000000000000000000000006B6B6B00D6D6
      D600D6D6D600CECECE008C8C8C00847B7B00847B7B00847B7B006B6B6B001010
      100008080800000000000000000000000000101010005A5A5A00ADADAD00CECE
      CE00CECECE00B5B5B500B5B5B5006B6B6B000000000000000000000000000000
      0000000000000000000008639C0000CEFF0000C6FF0000C6FF000094D6000063
      A500006BA500005A940031B5D60039C6E70031C6E70029CEEF0018D6FF0010D6
      FF0000C6FF0008639C0008639C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B291000C639
      1000EF523100FF734A00FF6B4A00FF6B4A00BD421000FF8C7B00FFFFFF00FFE7
      DE00BD421000E74A3100BD3918006B291000006B00000073080031B54A0039CE
      5A0029BD420021B5390018AD2900089C1000088C00000873100039C6AD0029DE
      FF0018DEFF0008D6FF0000D6FF0000D6FF0000DEFF0000D6FF00008CC600006B
      9C000073AD00007BB5000000000000000000000000006B6B6B00CECECE00CECE
      CE00C6C6C6008C8C8C00BDB5B500B5B5B500A59C9C00A59C9C009C9C9C009C94
      9400949494008484840052525200292929000808080000000000000000001010
      100063636300847B7B006B6B6B00000000000000000000000000000000000000
      00000042000000420000006B840010CEFF0010D6FF0008D6FF0008D6FF00008C
      C60000639C00006BA50000528C00086B9C00086B9C00086B9C00086B9C000863
      9C0008639C000000000000000000000000000000000000000000000000000000
      000000000000005A00000000000000000000000000000000000000000000CE42
      1800F75A3900FF734A00FF6B4A00FF6B4200BD421000FFD6D600FFFFFF00FFE7
      DE00BD421000F7634200B54218006B291000006B080000730800108C1800189C
      290039CE5A0031C64A0018A52900006B100000731000006B0000006B000031BD
      940039E7FF0021E7FF0010DEFF0000CEFF0000BDF7000094C600007BB500007B
      AD000084BD00006BA500006BA50000000000000000006B6B6B00CECECE00C6C6
      C6008C8C8C00D6D6D600F7F7F700F7F7F700F7F7F700E7DEDE00CEC6C600B5B5
      B500A5A5A500A59C9C00A59C9C009C9C9C00949494006B636300212121000000
      0000181818009C9494006B6B6B0000000000000000000808840000185200004A
      0000004A0000004A0000004200000873730021CEFF0029E7FF0021DEFF0021DE
      FF000894C60000639C0000528C00004A8400005A9400005A94000063A500005A
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000005A0000005A000000000000000000000000000000000000B531
      1000B5311000FF6B4A00FF6B4200BD421000F7AD9C00E7E7E700EFEFEF00F7D6
      CE00BD421000FF6B4A00CE5231006B291000006B9C0021ADD600108473000873
      080042CE6B0042D66B0021A52900006B4200006B8C00087B8C00188CA50029AD
      CE0021A5CE0018A5CE00088CBD00007BAD000073AD00007BAD00008CC600007B
      AD000084BD00009CD60000BDEF000084BD00000000006B6B6B00C6C6C6008C8C
      8C00E7E7E700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700E7E7E700D6D6D600C6C6C600ADADAD00A59C9C00A59C9C009C9494008484
      84006B6B6B009C9C9C006B6B6B0000000000080884000000B50000185200004A
      00000052000000520000004A00000042000008639C0039DEFF0042F7FF0042F7
      FF0031DEF7000873A50000639C00006BA5000073B500007BB500005A94000052
      8C00000000000000000000000000000000000000000000000000000000000000
      0000005A0000005A000008941000005A00000000000000000000000000000000
      000000000000B5311000E76B4A00CE848400949CAD00737B840094949400C684
      7300BD421000B5311000B53110000000000000639C0008739400087394000073
      100042C6630052E77B0029A5390000734A00007BB500006BA500006BA5000063
      94000000000000000000006B9C000084B5000094CE000084B500007BAD000094
      C60000CEF70000D6FF0000DEFF000084BD00000000006B6B6B008C8C8C00EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600847B7B00948C8C00C6BD
      BD00DEDEDE00E7E7E700DEDEDE00DEDEDE00D6D6D600C6C6C600B5B5B500A59C
      9C009C9C9C006B6B6B006B6B6B0000000000080884000000B50000185200004A
      0000005A0000005A000000520000004A000008639C001073AD0029A5C60052E7
      F70063FFFF001894BD00004A8C0000639C000063A5000073AD00006BA5000063
      9C00000000000000000000000000000000000000000000000000005A0000005A
      000018BD4A0010AD390008A5210000940800005A000000000000000000000000
      0000000000004A639400086B940008638C0008638C0008638C0008638C000863
      8C000000000000000000000000000000000000639C0021ADD60021ADD600007B
      310029AD420063EF940039BD5200007B3100009CD6000094CE000094CE00006B
      9C0000000000000000000073A500008CBD000084B5000073AD0008A5D60008D6
      FF0000D6FF0000D6FF001884AD0000000000000000006B6B6B00CECECE00F7F7
      F700F7F7F700F7F7F700F7F7F700CECECE00ADADAD00ADADAD009C9C9C00847B
      7B00736B6B008C848400ADA5A500C6C6C600D6D6D600D6D6D600CECECE00CEC6
      C600BDBDBD00A5A5A5006B6B6B0000000000080884000000BD0000185200004A
      00000063080000630800005200000052080008639C000052940000639C00108C
      BD002194BD00087BB50000639C00006BAD0000639C0000639C00005A94000052
      8C000000000000000000000000000000000000000000005A000031CE630029CE
      5A0021C6520018B5420010AD2900089C1800008C0800005A0000000000000000
      0000086B9C00086BE7000863E7001063E7001063E700105ADE000852D600085A
      DE00086B9C00000000000000000000000000006B9C00188CC600188CC600006B
      6B00107B100052DE840052DE840010841800006B5A000073AD00008CBD00007B
      B500000000000073A500109CCE00007BAD00087BAD0018B5DE0021E7FF0010D6
      FF0008D6FF0000C6F7001884AD000000000000000000000000006B6B6B006B6B
      6B00CECECE00EFEFEF00ADA5A5006B5A5A00736B6B00847B7B009C949400ADAD
      AD00B5B5B500ADA5AD009C94940084737B00847B7B00948C8C00BDBDBD00CECE
      CE00CECECE00C6C6C6006B6B6B0000000000080884000000C60000185A00004A
      0000086B0800086B100000520000005A100008639C000873A5000894C6000073
      AD00006BA5000084C6000073AD000073B5000073AD00006BAD00006BAD00005A
      94000000000000000000000000000000000000000000005A000031D6630029CE
      630021C65A0018BD4A0010B5390008A52100005A000000000000000000000039
      63000863C6001873EF00187BF700187BF700187BF700187BF7001873EF00186B
      E700105ADE00086B9C00000000000000000000639C00087BAD00087BB500087B
      B5000884420029AD420063EF940039BD5A0000630000008484000073B5000063
      9C00006BA5000884B5000884B5001894C60031B5D60039EFFF0029DEFF0029DE
      FF0018D6FF001884AD0000000000000000000000000000000000000000000000
      00006B6B6B006B6B6B00BD848400AD8C73007B5A520063525200635252006B5A
      63006B5A63008C848400A59C9C00ADADAD00B5B5B500A59CA500CECECE00CECE
      CE00B5B5B5006B6B6B000000000000000000080884000008CE0000185A00004A
      000008731000087B1800005A00000063100008639C00108CBD001094C600109C
      CE0008A5DE0000A5DE00009CDE00009CD6000094CE000084C600007BB5000063
      9C0000000000000000000000000000000000005A000039D66B0039D66B00005A
      0000005A0000005A000018BD4200005A00000000000000000000000000000039
      6300187BE7002184FF00218CFF00218CFF00218CFF00218CFF002184FF00187B
      F7001873EF001063DE00086B9C0000000000006B9C0029ADCE000884BD000884
      BD001094A5000063080031AD42005AE78C0042CE6B00108C210008844200008C
      6B00006B73001094A5001084AD004ADEF7005AF7FF004AEFFF0042EFFF0031D6
      F7001884AD000000000000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFD6AD00FFD6A500FFCE9C00D6A57B00A57B
      5A007B635A006352520063525A006B6363008C848400CECECE00CECECE00A5A5
      A5006B6B6B00000000000000000000000000080884000008DE0000215A00004A
      000010841800108C210008630800086B180008639C004ADEFF0042EFFF0029E7
      FF0018DEFF0010D6FF0000CEFF0000C6FF0000C6FF0000C6FF0000ADE700005A
      940000000000000000000000000000000000005A000039D66B00005A00000000
      000000000000005A0000005A0000000000000000000000000000004A7B000031
      5A00085A9C00298CFF002994FF002994FF002994FF002994FF00218CFF00218C
      FF001884F7001873EF00086B9C0000000000006B9C000873A500006B9C000073
      B5000073B500087B8C00006B2100188C180031B54A0039BD5200219C2900107B
      00000073000000730000006B10006BFFFF006BFFFF0063F7FF0042D6EF001884
      AD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFDEB500FFD6AD00FFCEA500FFCE9400FFC6
      8C00FFC68400FFBD8400FFC68400BD8484006B6B6B006B6B6B006B6B6B006B6B
      6B0000000000000000000000000000000000080884000010E70000215A00004A
      000018942900189C3100086B1000087B1800188C7B0008639C0052F7FF0042F7
      FF0039EFFF0021DEFF0018DEFF0008D6FF0000C6FF0008639C0008639C000000
      000000000000000000000000000000000000005A000000520000000000000000
      000000000000005A00000000000000000000000000000000000000427B000031
      5A00217BCE002994FF00319CFF00299CFF00299CFF00299CFF002994FF002994
      FF00218CFF00187BF700086B9C000000000000639C00108CB5000884B50018A5
      CE00088CC600088CC600007BAD00007B6300006B2900007B2100087B2900087B
      310000733100086B84006BE7EF007BFFFF006BEFF7001884AD001084B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFDEBD00FFDEB500FFD6A500FFCE9C00FFCE
      9400FFC68C00FFC68400FFC68400BD8484000000000000000000000000000000
      000000000000000000000000000000000000080884000010EF0000216300004A
      000021AD390029B54200087310001894290010842900107B4A0008639C000863
      9C0008639C0008639C0008639C0008639C0008639C0000000000000000000000
      000000000000000000000000000000000000005A000000520000000000000000
      0000000000000000000000000000000000000000000000000000004A7B000031
      5A002184E7002184D60000315A002994EF00319CFF00319CFF00299CFF002994
      FF00218CFF002184FF00086B9C000000000000639C00087BAD00087BAD000894
      C600088CBD000094C6000094C600008CC6000084BD000073AD000084BD000063
      9C0000000000000000002994BD00218CB5001884AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFE7CE00FFE7C600FFDEBD00FFD6AD00FFD6A500FFCE
      9C00FFCE9400FFC68C00BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000080884000018FF0000216B00004A
      000021B5390031D65A001084210021AD3900189C2900108C2100087B18000873
      1800005A1000004A000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005A000000520000000000000000
      000000000000000000000000000000000000000000000000000000528C000052
      8C000039630000315A0000315A00218CDE0031A5FF00319CFF00319CFF00299C
      FF002994FF00218CF700086B9C0000000000107BA50039BDDE0042D6F70031D6
      F70029DEFF0018D6FF0008CEFF0000CEFF0000C6FF0000BDF70000ADDE000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFEFD600FFE7CE00FFE7C600FFDEB500FFD6AD00FFD6
      A500FFCE9C00FFC69400BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000080884000018FF0000185A00004A
      00001884290018A5310029BD4A0031C6520029BD4A0021AD3900189C29001894
      210008731000004A000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A0000000000000000
      000000000000000000000000000000000000000000000000000010639C00106B
      9C00085A8C00004A840000396300299CF70031A5FF0031A5FF00319CFF00299C
      FF002994FF00086B9C0000000000000000001084AD008CFFFF006BFFFF005AF7
      FF004AEFFF0031E7FF0021DEFF0010DEFF0000D6FF0000D6FF0000DEFF000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFEFDE00FFEFD600FFE7CE00FFE7BD00FFDEB500FFD6
      AD00FFD6A500F7C69400BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000080884000018FF0008425A00004A
      00005AA56B00398C4A00187B21001084180021AD390029C64A0029B5420021AD
      390010842100004A000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A0000000000000000
      0000000000000000000000000000000000000000000000000000000000001873
      A500529CBD00106B9C00084A6B00218CD600299CEF00319CF70031A5FF00319C
      FF00218CEF00086B9C0000000000000000001084AD0042ADCE005AD6E7006BEF
      F70052E7FF004AE7FF0039E7FF0029D6FF0010CEFF0000BDEF0000A5D6000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD848400FFF7EF00FFF7E700FFEFDE00FFE7D600FFE7C600FFDEBD00FFDE
      B500FFD6AD00BD84840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080884000808840094A59C00085A
      0800106B1800298431004A9C5A00398C4A0021843100108421001894290021AD
      390018942900004A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000106B
      9C00529CBD00529CBD00186BA500105A7B00084A6B000039630000396B000039
      6300086B9C000000000000000000000000000000000000000000107BAD00107B
      AD001884B500188CB500108CB5000884B500007BAD00006BA500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      8400FFFFF700FFFFF700FFF7EF00FFF7E700FFEFDE00FFE7CE00FFE7C600FFDE
      BD00F7C6AD00BD84840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080884000808
      7300396B4A0018631800004A0000085A100021732900429C5A00318C42001884
      2900086B10000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000106B9C00186B9C00106B9C00085A9400004A840000427B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      8400BD848400BD848400BD848400FFF7EF00FFF7E700FFEFD600FFE7CE00FFDE
      C600BD8484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000080884000808840008087B005A8452001063100000520000086B1000086B
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD848400BD848400BD848400BD848400BD84
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000080884000808840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006394000063
      9400006394000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000639400ADF7FF00ADEF
      FF00A5F7FF000063940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121003939310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000005200000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A0000004A
      0000004A0000004A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063940000639400FFFFFF0094EF
      FF0094EFFF008CEFFF0000639400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393931001818210018293100314242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      0000089410000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      840029DE520000840000004A0000000000000000000000000000000000000000
      00000000000000000000000000000000000008739C0084E7FF0000639400FFFF
      FF007BE7FF0084EFFF006BD6F700006394000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD9C8C0010394A00006B9C00004A730008395200394A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000052000010A5
      2100089C18000052000000520000005200000052000000520000005200000052
      0000005200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      840029DE520000840000004A0000000000000000000000000000000000000000
      000000000000000000000000000000000000006B94002994BD007BE7FF000063
      9400FFFFFF006BE7FF0073E7FF0031ADCE000063940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000018394A00006B9C0000639C0018526B0029314200423139000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052000021B5390018AD
      310010A52900089C18000894100000941000008C0800008C0800008C0800008C
      0800005200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      840029D6520000840000004A0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A8C002994BD0063E7
      FF0000639400FFFFFF005ADEFF0052DEFF00107BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073848400005A84003152630094636300AD6B6B00945A5A006339
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052000031CE5A0029C64A0021BD
      420018B5310010A52900109C21000894180000941000008C0800008C0800008C
      0800005200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      7B0029D6520000840000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006B9400219C
      C60052E7FF0000639400FFFFFF004ADEFF00188CBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008425A008C5A5A00CE8C8C00BD7B7B00AD6B6B00945A
      5A00633939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052000031CE5A0029C6
      520021BD420018B5390018AD290010A52100089C180008941000008C0800008C
      0800005200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      840029DE520000840000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      940021A5CE0042DEFF0000639400FFFFFF0021B5E70000639400000000000000
      0000006394000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE004A6B73009C6B6B00DE9C9C00CE8C8C00BD7B7B00AD6B
      6B00945A5A005A313100085ACE00085ACE000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE0008397B00000000000052000031CE
      5A0029C652000052000000520000005200000052000000520000005200000052
      000000520000085ACE00085ACE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000031A54A0029BD
      520018AD290010941000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063940018A5D60031D6FF0000639400FFFFFF0018ADDE00006394000063
      940010CEFF000063940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF007B5A5A00DEA5A500DE9C9C00CE8C8C00BD7B
      7B00AD6B6B008C5252005A31310039A5FF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF002994FF0008397B0000000000000000000052
      000031CE6300005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      000000000000000000000000000000000000005A0000189C310021C6520018B5
      420010A52900089C180000840800004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063940010A5D60021D6FF0000639400FFFFFF0018CEFF0010CE
      FF0010CEFF0010CEFF0000639400006394000063940000639400006394000063
      9400006B9400000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF003194F7007B525A00DEA5A500DE9C9C00CE8C
      8C00BD7B7B00A56B6B008C5252005A313100085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994FF0008397B0000000000000000000000
      000000520000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      0000000000000000000000000000005A000018A5390029D65A0021C6520018B5
      390010A52900089C1000008C000000730000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063940010ADDE0010CEFF0000639400FFFFFF0008C6
      FF0008C6FF0008C6FF0008C6FF0008C6FF0008C6FF0010CEFF0010CEFF0018CE
      FF0018CEFF00006394000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00105AC6007B5A5A00DEA5A500DE9C
      9C00CE8C8C00BD7B7B00A56B6B008C5252005A39310000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF0008397B0000000000000000000000
      000000000000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      00000000000000000000005A000021AD420031E76B0029CE5A0018BD4A0010B5
      390008A5210000941000008C00000084000000730000004A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000006B9C0008ADE70008CEFF000063940008C6
      FF0008C6FF0010CEFF0010CEFF0018CEFF0021CEFF0021CEFF0029D6FF0029D6
      FF0031D6FF0039D6FF000063940000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE009CD6F70073525A00DE9C
      9C00DE9C9C00CE8C8C00B57B7B00A56B6B008C5252005A313100000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF0008397B0000000000000000000000
      000000000000000000000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      000000000000005A000029B5420042EF730031DE630029CE5A0018BD4A0010AD
      310008A521000094080000840000008400000084000000730000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006B9C0008ADE70018CEFF0021D6
      FF0021CEFF0029CEFF0029D6FF0031D6FF0039D6FF0039D6FF0042D6FF004ADE
      FF0052DEFF0052E7FF0052DEFF0000639400085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE009CDEFF004AADF7007352
      5A00DE9C9C00DE9C9C00C68C8C00B57B7B00A56B6B008C5252005A3131000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF0008397B0000000000000000000000
      000000000000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      0000005A000029B542004AFF840039EF730031DE630021CE520018BD420010AD
      3100089C1800009408000084000000840000008400000084000000730000004A
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000063940021CEF70031D6
      FF0039D6FF0042D6FF0042DEFF004ADEFF0052DEFF005ADEFF005ADEFF0063E7
      FF006BE7FF0073E7FF0063D6F700006B9400085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE00A5DEFF0042B5FF004AAD
      F700946B6B00E7A5A500DE9C9C00C68C8C00B57B7B00844A4A00424A52003142
      520000000000000000000000000000000000085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF0008397B0000000000000000000000
      000000520000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE00000000000000000000000000005A
      000029B542004AFF840042FF7B0039E76B0029D6630021C6520018B5420010A5
      2900089C1800008C080000840000008400000084000000840000008400000073
      0000004A00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000063940042D6FF004ADE
      FF0052DEFF005ADEFF005ADEFF0063E7FF006BE7FF0073E7FF007BE7FF0084EF
      FF007BDEFF0094EFFF0094EFFF00006B9400085ACE00E7EFFF009CDEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF00085ACE00E7EFFF00A5DEFF009CDE
      FF009CD6F700946B6B00E7A5A500DE9C9C00524A5200008CC60000ADEF0000A5
      E7000084C600000000000000000000000000085ACE009CD6FF0042ADFF0039AD
      FF0039ADFF0039A5FF0039A5FF0031A5FF0008397B0000000000000000000052
      000008941000005200000000000000000000DEEFFF00DEEFFF00DEEFFF00DEEF
      FF00DEEFFF00DEEFFF00DEEFFF00DEEFFF000000000000000000005A0000189C
      310031CE5A00189C3100189C310010841800006B080000630800006308000063
      0000005A0000005A0000005A0000005A0000005A000000630000006300000073
      0000006B0000004A000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006394006BE7FF006BE7
      FF006BE7FF0073E7FF007BE7FF0084E7FF008CE7FF0094EFFF00A5F7FF00FFFF
      FF0000639400B5F7FF00B5F7FF00006B9400085ACE004284C6002173C6002173
      C6002173C6002173C600186BC600186BC600085ACE00085ACE00085ACE00085A
      CE00085ACE00105AC6008C636B00BD848C00087BAD0000BDFF0000BDFF0000A5
      E70000189C00000084000000000000000000085ACE004284C6002173C6002173
      C6002173C6002173C600186BC600186BC60008397B0008397B000052000010A5
      2100089C18000052000000520000005200000052000000520000005200000052
      00000052000000000000000000000000000000000000005A0000004A0000004A
      0000005A000000630000006B00000073080000841000088C180084FFFF0000CE
      EF0000B5CE0000A5BD00084A520021B54A0021A53900189C3100108C21000873
      1000004A0000004A0000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000873A5006BDEF70084E7FF0084E7
      FF008CEFFF0094EFFF009CEFFF00A5EFFF00ADEFFF00BDFFFF00FFFFFF000063
      940000639400CEFFFF00CEFFFF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0039ADFF0039A5FF00186BC6009CDEFF00319CFF00319C
      FF00319CFF00299CFF003194F7006B525A00009CDE0000BDFF00008CD6000018
      9C0000089C00000894000000840000000000085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0039ADFF0039A5FF00186BC6000052000021B5390018AD
      310010A52900089C18000894100000941000008C0800008C0800008C0800008C
      080000520000000000000000000000000000005A0000005A0000007300000084
      0000C67B0000C67B0000C67B0000C67B0000089C180008A5290010AD31007BFF
      FF0000CEE70000C6E70000CEE700085A630042F77B004AFF84004AFF84004AFF
      84004AFF840031CE5A00005A0800004A00000000000000000000000000000000
      000000000000000000000000000000000000006394009CF7FF00A5EFFF00A5EF
      FF00ADEFFF00B5F7FF00B5F7FF00BDF7FF00CEFFFF00FFFFFF00006394000000
      000000639400C6FFFF00C6FFFF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF0039ADFF0039ADFF00186BC6009CDEFF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994F7000094D60000B5F7000029A5000021
      DE000021BD000018B5000008940000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF0039ADFF0039ADFF000052000031CE5A0029C64A0021BD
      420018B5310010A52900109C21000894180000941000008C0800008C0800008C
      08000052000000000000000000000000000000000000005A000000630000C67B
      0000E7C65A00E7C65200E7B53900DEAD1800C67B000008A5290010AD310018BD
      420084FFFF0000D6F70000D6F70000D6F700085A630031CE5A00189C31001894
      2900FF7BFF00004A0000004A0000000000000000000000000000000000000000
      000000000000000000000000000000000000006B940052ADCE00FFFFFF00BDF7
      FF00BDF7FF00BDF7FF00BDF7FF00C6FFFF00FFFFFF0000639400000000000000
      000000639400BDF7FF00BDF7FF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6009CDEFF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00085ACE000084C6000821BD00294A
      F7000829CE000018B50000008C0000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6000052000031CE5A0029C6
      520021BD420018B5390018AD290010A52100089C180008941000008C0800008C
      080000520000000000000000000000000000000000000000000000000000E7AD
      6B00EFDE9C00EFD68C00E7CE6300E7BD3900C67B0000004A0000004A0000004A
      0000004A000084FFFF0000D6F700085A6300004A0000004A0000004A0000FF7B
      FF00FF7BFF007300730000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006394006BBDD600FFFF
      FF00BDF7FF00BDF7FF00C6F7FF007BC6DE000063940000639400006394000063
      940000639400BDF7FF00BDF7FF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6009CDEFF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE00000000001021BD005273
      FF001839E700000894000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C60039ADFF000052000031CE
      5A0029C652000052000000520000005200000052000000520000005200000052
      000000520000000000000000000000000000000000000000000000000000E7AD
      6B00FFF7D600F7EFBD00EFD68C00E7C65200C67B000000000000000000000000
      0000000000000000000052E7F700000000000000000000000000FF94FF00FF7B
      FF00000000007300730073007300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000063940073C6
      DE00FFFFFF00BDF7FF00BDF7FF008CD6EF008CD6EF00A5E7F700ADEFFF00BDF7
      FF00D6FFFF00B5F7FF00B5F7FF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C6009CDEFF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE0000000000000000001021
      BD000008A500000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C60039ADFF0039ADFF000052
      000031CE630000520000319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7AD
      6B00FFFFFF00FFF7D600EFDE9C00E7C65A00FF7B000000000000000000000000
      00000000000000000000000000000000000000000000FF94FF00FF94FF000000
      0000000000000000000073007300730073000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000006B
      940073C6DE00FFFFFF00B5F7FF00B5F7FF00B5F7FF00B5F7FF00B5F7FF00B5F7
      FF00B5F7FF00B5F7FF00006B940000000000085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C6009CDEFF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C60039ADFF0039ADFF0039AD
      FF00005200000052000031A5FF00319CFF00085ACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7AD6B00E7AD6B00E7AD6B00E7AD6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF94FF00FF94
      FF00000000007300730073007300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006B9400006B9400006B9400006B9400006B9400006B9400006B9400006B
      9400006B9400006B94000000000000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C600E7EFFF0094D6FF0094D6
      FF0094D6FF0094D6FF0094D6FF0094CEFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C6009CD6FF0094D6FF0094D6
      FF0094D6FF000052000094D6FF0094CEFF00085ACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF94
      FF00FF7BFF007300730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A004A1818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000073080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000844A4A00844A4A008C4A4A00944A
      4A004A1818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007308000073080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000844A4A00844A4A008C4A4A009C4A4A00B54A4A00BD4A4A009C4A
      4A004A1818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000073
      080010AD21000073080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00844A4A009C4A4A00AD4A4A00C64A4A00C64A4A00BD4A4A00BD4A4A009C4A
      4A004A1818009C4A4A00844A4A00844A4A00844A4A00844A4A00844A4A00844A
      4A00844A4A00844A4A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000073080021B5
      390018AD31000073080000730800007308000073080000730800007308000073
      0800007308000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104AC600104A
      C600104AC6001042BD000842B5000842B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00C6525200CE525200C6525200C6525200C6525200C6525200C64A5200A54A
      4A004A181800FF8C8C00FF949400FF9C9C00FFA5A500FFADAD00F7B5B500F7B5
      B500F7B5B500844A4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000073080039C65A0029BD
      4A0021B5390018B5310018AD290010A5210008A5180008A5180008A5180008A5
      1800007308000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001873FF00186BEF001863E700296BD6005A84
      C6009C9CB500D6AD9400CE8C63004A63A5001042BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004A0000108C1800004A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00CE5A5A00CE525A00CE525200CE525200CE525200C6525200C6525200A54A
      4A004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007308004AD6730042CE6B0039CE
      5A0031C64A0029BD420021B5310018AD290010A5210008A5180008A5180008A5
      1800007308000000000000000000000000000000000000000000000000000000
      0000000000001873FF00297BF700528CDE008CA5C600DEC6AD00FFD69C00F7C6
      9C00E7AD8C00D68C5A00E7945A00EFAD7300848CAD00104AC600104AC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004A0000108C210000941000109C2900004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00D65A5A00D65A5A00CE5A5A00CE5A5A00CE525A00CE525200CE525200A552
      52004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007308004AD6730042D6
      6B0039CE5A0031C6520029BD420021B5390018AD290010AD210008A5180008A5
      1800007308000000000000000000000000000000000000000000000000000000
      00001873FF006394DE00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7C6
      9C00F7CEA500D6845200DE8C5200EFAD7B00F7CEAD00D6CEC6004273D6001052
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000004A00001094210008A51800089C100008941000109C2100004A
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00D65A5A00D65A5A00D65A5A00D65A5A00D65A5A00D65A5A00CE5A5A00A552
      52004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A00000000000000000000000000187BD600187BD600187B
      D600187BD600187BD600187BD600187BD600185A940000000000007308004ADE
      7B004AD66B000073080000730800007308000073080000730800007308000073
      080000730800187BD600187BD60000000000000000000000000000000000187B
      FF00187BFF00DECEBD00FFDEB500FFDEB500FFDEB500FFDEBD00FFDEBD00EFBD
      9C00DE9C7300D67B4A00E7946300F7CE9C00FFDEBD00FFE7D600FFEFE7008CAD
      E7002163DE000000000000000000000000000000000000000000000000000000
      0000004A00000884180018AD310010A5210008A51800089C180008941000109C
      2100004A00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00DE636300DE636300DE636300D65A6300D65A5A00D65A5A00D65A5A00AD52
      52004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A000000000000000000187BD600A5DEFF004AB5FF004AB5
      FF004AADFF004AADFF0042ADFF0042ADFF00185A940000000000000000000073
      080052DE7B00007308000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD600000000000000000000000000296B
      CE0073634A00FFE7BD00FFE7CE00FFE7CE00FFE7CE00FFE7CE00F7CEB500EFC6
      A500DE9C7300EFA56B00EFA57300F7D6B500FFE7CE00FFEFDE00FFF7EF00FFFF
      F700CEDEF700397BE7001863E70000000000000000000000000000000000004A
      0000087B180029C64A0021BD390018B5310010942100004A0000109C29000894
      1000109C2100004A000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00DE636300DE636300DE636300DE636300DE636300DE636300D65A6300AD52
      52004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A000000000000000000187BD600ADDEFF0052B5FF004AB5
      FF004AB5FF004AADFF004AADFF0042ADFF00185A940000000000000000000000
      000000730800007308000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD6000000000000000000187BFF006363
      5A00FFA53100FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00F7DEC600EFCE
      B500D6845200D67B4A00EFB58400FFDEC600FFE7D600FFF7E700FFF7F700FFFF
      FF00FFFFFF00DEEFFF00186BEF001863E7000000000000000000004A00000873
      100031CE5A0029CE520029C64A00189C3100004A000000000000004A0000089C
      18000894100010942100004A0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00E76B6B00E76B6B00E7636B00DE636300E76B6B00E7949400DE636300AD52
      52004A1818005AA55A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A000000000000000000187BD600ADDEFF0052B5FF0052B5
      FF004AB5FF004AB5FF004AADFF004AADFF00185A940000000000000000000000
      000000000000007308000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD6000000000000000000187BFF00AD73
      2900FFC66B00FFF7E700FFF7EF00FFF7EF00FFF7EF00FFEFE700EFB59C00DE9C
      7300D6845200EFA57300F7D6B500EFD6C600FFEFE700FFF7EF00FFFFF700FFFF
      FF00FFFFFF00DEC6C600395A9C00186BF7000000000000000000004A000039DE
      6B0039D66B0031D6630021AD3900004A0000000000000000000000000000004A
      000008731000089C100010942100004A00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00E76B6B00E76B6B00E76B6B00E76B6B00EFA5A500FFFFFF00EF9C9C00AD5A
      5A004A181800EFCEAD00B5EFAD005AD673005AD6730042CE630042CE630042CE
      6300F7B5B500844A4A000000000000000000187BD600ADDEFF0052BDFF0052B5
      FF0052B5FF004AB5FF004AB5FF004AADFF00185A940000000000000000000000
      000000000000000000000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD6000000000000000000185AA50018BD
      4A00CEEFCE00FFFFF700FFFFF700FFFFF700FFFFF700F7DEC600F7D6C600DE9C
      7B00E7A57300EFAD7B00FFE7C6009C9C94009C9C9C00EFE7E700FFFFFF00FFFF
      FF00FFFFFF00CE949400736B94001873F7000000000000000000004A0000189C
      310042DE730021AD4200004A0000000000000000000000000000000000000000
      000000000000004A0000089C100010941800004A000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00EF737300EF6B7300EF6B6B00E76B6B00F7ADAD00FFFFFF00EF949400B55A
      5A004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600DEF7BD00DEF7
      BD00F7B5B500844A4A000000000000000000187BD600ADDEFF0052BDFF0052BD
      FF0052B5FF0052B5FF004AB5FF004AB5FF00185A940000000000000000000000
      000000000000000000000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD60000000000187BFF001863520018BD
      4A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEFE700EFCEB500D67B
      5200D6844A00F7C69C00FFE7D600FFF7E700DED6D6008C948C00B5BDB500FFFF
      FF00F7EFEF00BD8484003163B50000000000000000000000000000000000004A
      000029C65200004A000000000000000000000000000000000000000000000000
      00000000000000000000004A0000089C180008941000004A0000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00EF737300EF737300EF737300EF737300EF6B7300EF949400E76B6B00B55A
      5A004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600ADDEFF005ABDFF0052BD
      FF0052BDFF0052B5FF0052B5FF004AB5FF00185A940000000000000000000000
      000000000000000000000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD600000000001873EF00186B5A006BC6
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00E7AD8C00E7A58400DE8C
      5A00EFBD9400FFDEC600FFEFDE00FFF7EF00FFFFF700FFFFFF00B5BDB500CECE
      CE00CEE7FF005A7BC600187BFF00000000000000000000000000000000000000
      0000004A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004A00000063080008941000004A00000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00F7737B00F7737B00F7737300F7737300EF737300EF737300EF737300B55A
      5A004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600ADE7FF005ABDFF005ABD
      FF0052BDFF0052BDFF0052B5FF0052B5FF00185A940000000000000000000000
      000000000000000000000000000000000000E7F7FF00E7F7FF00E7F7FF00E7F7
      FF00E7F7FF00E7F7FF00E7F7FF00E7F7FF00000000001852B5000018FF00C6CE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7A58400E79C
      7300E7A57B00E7D6C600DED6CE00FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0063A5FF00187BFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A000000730800004A
      000000000000000000000000000000000000000000000000000000000000844A
      4A00FF7B7B00F77B7B00F77B7B00F77B7B00F7737B00F7737300F7737300B55A
      5A004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600639CCE00398CCE00398C
      CE00318CCE00318CCE00318CCE00318CCE00185A9400185A9400185A9400185A
      9400185A9400185A9400185A9400185A9400185A940000000000000000000000
      000000000000000000000000000000000000000000001031B5000018FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDDEFF007BB5FF00398CFF00187BFF007BA5
      DE00FFE7D600EFE7D6009C9C9C009C9C9C00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF002984FF00187BFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A0000005A
      0000004A0000000000000000000000000000000000000000000000000000844A
      4A00FF7B8400FF7B7B00FF7B7B00FF7B7B00F77B7B00F77B7B00F77B7B00BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600ADE7FF005AC6FF005AC6
      FF005ABDFF005ABDFF0052BDFF0052BDFF00318CCE0052B5FF004AB5FF004AB5
      FF004AADFF004AADFF0042ADFF0042ADFF00187BD60000000000000000000000
      000000000000000000000000000000000000187BFF00105AFF0084ADFF00EFF7
      FF00ADD6FF0073ADFF002984FF002984FF000000000000000000000000000000
      00004294FF00DEE7EF00FFFFF700DEDEDE008C948C00B5BDBD00FFFFFF009CCE
      FF00187BFF00187BFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004A0000004A00000000000000000000000000000000000000000000844A
      4A00FF848400FF848400FF848400FF7B8400FF7B8400FF7B7B00FF7B7B00BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600B5E7FF005AC6FF005AC6
      FF005AC6FF005ABDFF005ABDFF0052BDFF00318CCE0052B5FF0052B5FF004AB5
      FF004AB5FF004AADFF004AADFF0042ADFF00187BD60000000000000000000000
      000000000000000000000000000000000000187BFF00187BFF00187BFF00187B
      FF00187BFF000000000000000000000000000000000000000000000000000000
      0000000000002984FF0094C6FF00FFFFFF00FFFFFF00C6C6C600F7F7F7004A9C
      FF00187BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004A000000000000000000000000000000000000844A
      4A00FF848400FF848400FF848400FF848400FF848400FF848400FF848400BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600B5E7FF0063C6FF005AC6
      FF005AC6FF005AC6FF005ABDFF005ABDFF00318CCE0052BDFF0052B5FF0052B5
      FF004AB5FF004AB5FF004AADFF004AADFF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005AA5FF00EFF7FF00FFFFFF00ADD6FF00187B
      FF00187BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00F77B7B00FF848400FF848400FF848400FF848400FF848400FF848400BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600B5E7FF0063C6FF0063C6
      FF005AC6FF005AC6FF005AC6FF005ABDFF00318CCE0052BDFF0052BDFF0052B5
      FF0052B5FF004AB5FF004AB5FF004AADFF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000187BFF00187BFF00187BFF00187B
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00844A4A00AD5A5A00D66B7300FF848400FF848400FF848400FF848400BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600B5E7FF0063C6FF0063C6
      FF0063C6FF005AC6FF005AC6FF005AC6FF00398CCE005ABDFF0052BDFF0052BD
      FF0052B5FF0052B5FF004AB5FF004AB5FF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000187BFF00187B
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000844A4A00844A4A0094525200B5636300EF7B7B00FF848400BD63
      63004A181800944A4A00844A4A00844A4A00844A4A00844A4A00844A4A00844A
      4A00844A4A00844A4A000000000000000000187BD600BDE7FF0063C6FF0063C6
      FF0063C6FF0063C6FF005AC6FF005AC6FF00398CCE005ABDFF005ABDFF0052BD
      FF0052BDFF0052B5FF0052B5FF004AB5FF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000844A4A00844A4A009C5252009C5A
      5A004A1818000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000187BD600E7F7FF00BDE7FF00B5E7
      FF00B5E7FF00B5E7FF00B5E7FF00ADE7FF00639CCE00ADDEFF00ADDEFF00ADDE
      FF00ADDEFF00ADDEFF00ADDEFF00A5DEFF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A004A1818000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000187BD600187BD600187B
      D600187BD600187BD600187BD600187BD600187BD600187BD600187BD600187B
      D600187BD600187BD600187BD600187BD6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC6
      8C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
      8400EFBD7B009C6B6300000000000000000094635A00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000B5000000B50000000000000000000000000094635A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A0084524A000000000000000000000000000000000000000000000000009463
      5A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094635A00EFD6BD00F7DEBD00F7D6
      B500EFCEA500E7C69C00E7C69400DEBD8C00E7BD8C00E7BD8400E7BD8400E7BD
      7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD7B009C6B63000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000B5000000B5000000B50000000000000000000000000094635A00EFD6
      B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC68C00EFC6
      8400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFBD
      7B0084524A000000000000000000000000000000000000000000000000009463
      5A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC6
      9400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094635A00EFD6C600F7DEC600F7DE
      B500EFCEAD00DEBD9C00CEAD8C00C6A57B00C6A57B00D6AD7B00DEB57B00E7B5
      7B00E7BD7B00E7BD7B00EFBD7B00EFBD7B00EFBD7B00E7BD7B009C6B63000000
      00000000000000000000000000000000000000000000000000000000B5000000
      B5000000B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000000000000000000000000000000094635A00EFD6
      BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC6
      8C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009463
      5A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094635A00EFDEC600F7E7C600F7DE
      BD00E7CEAD0021212100393931008C7B63009C846300AD8C6B00BD9C6B00C6A5
      7300D6AD7300DEB57B00E7BD7B00E7BD7B00EFBD7B00E7BD7B009C6B63000000
      00000000000000000000000000000000000000000000000000000000B5000000
      B5000000B5000000B50000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B5000000B5000000
      B5000000B500000000000000000000000000000000000000000094635A00EFD6
      C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009463
      6300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6B500EFCEA500DEBD
      9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094636300F7DECE00F7E7CE00F7DE
      C600EFD6B50039393100181821001829310031424200846B52008C735A009C84
      5A00B5946B00C6A56B00DEB57300E7BD7B00E7BD7B00E7BD7B009C6B63000000
      00000000000000000000000000000000000000000000000000000000B5000000
      B5000000B5000000B5000000B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000B5000000B5000000B5000000
      B50000000000000000000000000000000000000000000000000094635A00EFDE
      C600F7E7C600F7DEBD00F7DEB50000730000F7D6AD00EFCEA500B5BD73000073
      00000073000000730000ADAD6300EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009463
      6300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DEBD00DEC6A500BDA5
      8400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD8400EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094636300F7E7D600FFEFD600F7E7
      CE00F7DEC600AD9C8C0010394A00006B9C00004A730008395200394A4A007363
      4A008C735200A5845A00BD9C6B00D6AD7300E7B57B00E7BD7B009C6B63000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000B5000000B5000000000000000000000000000000
      00000000000000000000000000000000B5000000B5000000B5000000B5000000
      000000000000000000000000000000000000000000000000000094636300F7DE
      CE00FFE7CE00F7E7C600F7DEBD000073000000730000B5BD7B0000730000B5BD
      7300EFC69400B5B56B0000730000ADAD6300EFBD7B00EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009C6B
      6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEBD00004A0000004A
      0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC68C00EFBD8400EFBD
      7B00E7BD7B009C6B630000000000000000009C6B6300F7E7DE00FFEFDE00F7E7
      D600F7E7CE00EFDEBD0018394A00006B9C0000639C0018526B00293142004231
      39006B5242007B6B4A009C7B5A00B5946300CEA56B00DEB573009C6B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000F7000000B5000000B5000000B5000000B50000000000000000000000
      000000000000000000000000B5000000B5000000B5000000B500000000000000
      000000000000000000000000000000000000000000000000000094636300F7E7
      D600FFEFD600F7E7CE00F7DEC600007300000073000000730000B5BD7B00EFCE
      A500EFCE9C00EFC69400B5B56B0000730000EFBD8400EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009C6B
      6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECEB500004A00000894
      100000940800004A0000A58C6B00C6AD8400D6B58400DEB58400E7BD8400EFBD
      8400E7BD7B009C6B630000000000000000009C6B6300F7EFE700FFF7E700FFEF
      DE00F7E7D600F7E7CE0073848400005A84003152630094636300AD6B6B00945A
      5A006339390063524200736342008C735200AD8C5A00C69C6B00946B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000B5000000B5000000B5000000B500000000000000
      00000000B5000000B5000000B5000000B5000000B50000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B6300F7E7
      DE00FFEFDE00F7E7D600F7E7CE0000730000007300000073000000730000F7D6
      AD00EFCEA500EFCE9C00EFC6940000730000EFC68C00EFBD8400EFBD7B00E7BD
      7B0084524A00000000000000000000000000000000000000000000000000A573
      6300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C8C00004A0000089C
      1800089C1000004A000094846B00A58C6B00A58C6B00BD9C7300DEB58400EFC6
      8C00E7BD84009C6B63000000000000000000A5736300F7EFEF00FFF7EF00FFEF
      E700F7EFDE00F7E7D600F7DECE0008425A008C5A5A00CE8C8C00BD7B7B00AD6B
      6B00945A5A0063393900635239006B5A4200846B4A009C7B5200845A52000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000B5000000B5000000B5000000B5000000
      B5000000B5000000B5000000B5000000B5000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B6300F7EF
      E700FFF7E700FFEFDE00F7E7D600007300000073000000730000007300000073
      0000F7D6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400E7BD
      7B0084524A00000000000000000000000000000000000000000000000000A573
      6B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A0000004A000010A5
      210008A51800004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC6
      8C00EFBD84009C6B63000000000000000000A5736B00FFF7F700FFFFF700FFF7
      EF00FFEFE700FFEFDE00F7E7D6004A6B73009C6B6B00DE9C9C00CE8C8C00BD7B
      7B00AD6B6B00945A5A005A313100635239006B5A42007B634A00735242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000B5000000B5000000F7000000
      B5000000F7000000B5000000B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5736300F7EF
      EF00FFF7EF00FFEFE700F7EFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7DE
      B500F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00E7BD
      840084524A00000000000000000000000000000000000000000000000000AD7B
      6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6420018BD390018B5
      310010AD290010A5210008A51800089C1000004A0000AD947300D6B58C00EFCE
      9400EFC68C00A57363000000000000000000AD7B6B00FFF7F700FFFFFF00FFFF
      F700FFF7EF00FFEFE700FFEFDE00F7E7D6007B524A00E7A5A500DE9C9C00CE8C
      8C00BD7B7B00AD6B6B008C5252005A313100634A39006B5A4200634239000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B5000000B5000000
      B5000000F7000000B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5736B00FFF7
      F700FFFFF700FFF7EF00FFEFE700FFEFDE00F7E7D600F7E7CE00F7E7C6000073
      000000730000007300000073000000730000EFCE9C00EFC69400EFC68C00EFBD
      840084524A00000000000000000000000000000000000000000000000000B57B
      6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE4A0021C6420018BD
      390018B5310010B5290010AD210010A52100004A0000BDA58400DEBD9400EFCE
      9C00EFC69400A57363000000000000000000B57B6B00FFF7F700FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFEFE700FFEFDE00E7CEBD007B524A00E7A5A500DE9C
      9C00CE8C8C00BD7B7B00A56B6B008C5252005A313100635239005A3931000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000B5000000B5000000F7000000
      B5000000B5000000F7000000F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B6B00FFF7
      F700FFFFFF00FFFFF700FFF7EF0000730000FFEFDE00F7E7D600F7E7CE00F7E7
      C60000730000007300000073000000730000EFCEA500EFCE9C00EFCE9400EFC6
      8C0084524A00000000000000000000000000000000000000000000000000B584
      6B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A0000004A000021CE
      4A0021C64200004A0000004A0000004A0000004A0000E7C6A500EFCEA500F7CE
      A500EFCE9C009C7363000000000000000000B5846B00FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEFDE00E7CEBD00734A4200E7A5
      A500DE9C9C00CE8C8C00BD7B7B00A56B6B008C5252005A393100523931000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000B5000000B5000000F7000000B5000000
      F7000000F7000000F7000000B5000000F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57B6B00FFF7
      F700FFFFFF00FFFFFF00FFF7F70000730000BDD6AD00FFEFDE00F7E7D600F7E7
      CE00B5C69400007300000073000000730000F7D6AD00EFCEA500EFCE9C00EFC6
      940084524A00000000000000000000000000000000000000000000000000BD84
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700004A000029D6
      5A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DEB500F7D6AD00EFD6
      A500CEB594008C6B63000000000000000000BD846B00FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEFDE00BDA59400734A
      4200E7A5A500DE9C9C00CE8C8C00B57B7B00A56B6B008C5252005A3131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000F7000000F7000000F7000000B5000000F7000000
      0000000000000000F7000000F7000000F7000000F70000000000000000000000
      0000000000000000000000000000000000000000000000000000B5846B00FFF7
      F700FFFFFF00FFFFFF00FFFFFF00BDDEB50000730000BDD6AD00FFEFDE00B5CE
      9C0000730000B5C694000073000000730000F7D6AD00F7D6AD00F7CEA500EFCE
      9C0084524A00000000000000000000000000000000000000000000000000C68C
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A000031DE
      630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DEBD00E7CEAD00C6B5
      9400A5947B00846363000000000000000000C68C6B00FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEFDE00BDA5
      9400734A4200E7A5A500DE9C9C00C68C8C00B57B7B00A56B6B008C5252005A31
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000F7000000F7000000B5000000F7000000F700000000000000
      000000000000000000000000F7000000F7000000F7000000F700000000000000
      0000000000000000000000000000000000000000000000000000BD846B00FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDDEB50000730000007300000073
      0000B5CE9C00F7E7CE00F7DEC60000730000F7DEB500F7D6AD00EFD6A500CEB5
      940084524A00000000000000000000000000000000000000000000000000C68C
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A0000004A
      0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6BD00BDAD9C00A59C
      8C00A5948400846B63000000000000000000C68C7300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEFE700FFEF
      DE00BDA5940094636300EFADAD00DE9C9C00C68C8C00B57B7B00844A4A00424A
      5200314252000000000000000000000000000000000000000000000000000000
      00000000F7000000F7000000F7000000F7000000F70000000000000000000000
      0000000000000000000000000000000000000000F7000000F7000000F7000000
      0000000000000000000000000000000000000000000000000000C68C6B00FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEF
      E700FFEFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00E7CEAD00C6B59400A594
      7B0084524A00000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C635A0094635A009463
      5A0094635A009C6B5A000000000000000000CE947300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFF7
      E700EFD6C60084524A0094636300EFADAD00DE9C9C00524A5200008CC60000AD
      EF0000A5E7000084C60000000000000000000000000000000000000000000000
      F7000000F7000000F7000000F7000000F7000000000000000000000000000000
      000000000000000000000000000000000000000000000000F7000000F7000000
      F700000000000000000000000000000000000000000000000000C68C7300FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFEFE700FFEFDE00FFE7D600FFEFD600E7D6BD00BDAD9C00A59C8C00A594
      840084524A00000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA56B00DE9C4A00E794
      3900EF8C2100A56B6B000000000000000000CE947300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFFF
      EF00DEC6B5009C635A00AD7B520094636300C68C8C00087BAD0000BDFF0000BD
      FF0000A5E70000189C00000084000000000000000000000000000000F7000000
      F7000000F7000000F7000000F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      F700000000000000000000000000000000000000000000000000CE947300FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFF7EF00FFF7E700EFD6C600A5635A00A5635A00A5635A00A5635A00A563
      5A00A5635A00000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB57300EFAD5200F7A5
      3100A56B6B00000000000000000000000000D69C7300FFFFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700DEC6BD009C635A00EFB57300B57B420073424200009CDE0000BDFF00008C
      D60000189C0000089C000008940000008400000000000000F7000000F7000000
      F7000000F7000000F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE947300FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFFFEF00DEC6B500A5635A00DEA56B00DE9C4A00E7943900EF8C
      2100A56B6B00000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB57300EFA55200A56B
      6B0000000000000000000000000000000000D69C7300FFFFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEC6C6009C635A00EFB57300EFA552007B4A4A000094D60000B5F7000029
      A5000021DE000021BD000018B50000089400000000000000F7000000F7000000
      F7000000F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C7300FFFF
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700DEC6BD00A5635A00EFB57300EFAD5200F7A53100A56B
      6B0000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB57300A56B6B000000
      000000000000000000000000000000000000D69C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7D6CE009C635A00EFB57300A56B6B0000000000000000000084C6000821
      BD00294AF7000829CE000018B50000008C00000000000000F7000000F7000000
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C7300FFFF
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEC6C600A5635A00EFB57300EFA55200A56B6B000000
      000000000000000000000000000000000000000000000000000000000000D694
      7300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6AD00DEBDAD00DEBD
      AD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B6B00000000000000
      000000000000000000000000000000000000CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B009C635A00A56B6B00000000000000000000000000000000001021
      BD005273FF001839E70000089400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7D6CE00A5635A00EFB57300A56B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001021BD000008A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00A5635A00A56B6B0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000900000000100010000000000C00600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFE00007FFFDFFFFFFFFFFFEFFE0
      0007FFF9FFFFFFFFFBFC7FE0000700003F000083F1C03FE0000700003F0000A3
      E0001FE0000700000F000083C0000FE000070000070000BB800007E000070000
      03000081000003E00007000003FFFFFC000001E00007000001FFFFFF00000000
      00000000310000830008006000060000390000A3000801600006000039000083
      00080160000600003D0000BB00000300000000003D000081000000E000070000
      3FFFFFFC000001E0000700003FFFFFFF00001FE0000700003F000083000C7FE0
      000700003F0000A3000FFFE0000700003F000083000FFFE0000700007F0000BB
      000FFFE000070000FF000081C03FFFE000070001FFFFFFFCFFFFFFE000070003
      FFFFFFFFFFFFFFE000070007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF0FFFFFFFFBFFFFFC79FFFC3801FFE007F1C07FF8003FF81000FFC001
      E0003FF00007F80000FFC000C0001FE00000F80000FFC00080001FC00000FC00
      01FFC000000003800001F00007FBE00000000180000180000FF9E00000000080
      000100000FF0F801000C0080000100000FC0780F000C0180000100000F803007
      000801C0000100000F806003000003F0000300000F00E001000007FC00070000
      0F19C00100000FFC000F00001F3BC00100001FFC00FF00007F3FC001000C7FF8
      01FF0003FF3FC001000FFFF801FF0003FFBFC003000FFFF801FF0003FFBFE003
      000FFFF003FF0003FFFFE007C03FFFE003FFC007FFFFF81FFFFFFFE007FFF00F
      FFFFFFFFFFFFFFFE0FFFFE7FFFFFFFFFC7FFFFFFFFFFFFFBFFFFFFFF83FFFFF3
      FFFFFFF3FFFFC3FF01FFFFF0FFFFFFE3FFFF81FF00FFFFF03FFFFFC007FF81FF
      007FFFF81FFFFF8007FF81FF807FFFF80FFFFF0007FF81FFC07FFFFC07FFFF80
      07FF81FFE037FF8000FF804001FF81FFF003FF00007F006300FF00FFF8000700
      007F007300FE007FFC000300007F007B00FC003FFE000100003F007F00F8001F
      FF000000001F007B00F0000FFF800000000F007300E00007FF80000000070063
      00C00003FF8000000003000007800001FF0000000001000007000000FF001000
      0001000007800001FF0030000001000007E00003FF8000000043000007E07DC9
      FFC00000006700007FE07F9CFFE00100007F00007FF0FFC9FFF00300007F0000
      7FFFFFE3FFFFFF8000FF8000FFFFFFF7FFFFFFFFE7FFFFFBFFFFFFFFFFFFFFFF
      07FFFFF3FFFFFFFFFFFFFFF807FFFFE3FFFFFFFFFFFFFFE00003FFC007FFC0FF
      FF7FFFE00003FF8007FE007FFE3FFFE00003FF0007F8001FFC1FFFE00003FF80
      07F0000FF80FFFE00003804001E00007F007FFE00003006300E00001E003FFE0
      0003007300C00000C041FFE00003007B00C00000C0E0FFE00003007F00C00000
      C1F87FE00003007F00800001E3FC3FE00003007F00800001F7FE1FE00003007F
      00800003FFFF8FE0000300007F800003FFFFC7E0000300007F00F003FFFFF3E0
      000300007F07F807FFFFFDE0000300007FFFFE07FFFFFFE0000300007FFFFF0F
      FFFFFFE0000300007FFFFFCFFFFFFFF8000300007FFFFFFFFFFFFFFF07FF0000
      7FFFFFFFFFFFFFFFE7FF8000FFFFFFFFE00003FFFFFFFFFFFFFFFFFFE0000300
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
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 40
    Top = 152
  end
  object WriteTransaction2: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'write'
      'nowait'
      'no_rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 72
    Top = 184
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 72
    Top = 152
  end
end
