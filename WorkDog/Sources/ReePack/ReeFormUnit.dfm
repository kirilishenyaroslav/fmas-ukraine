object reeForm: TreeForm
  Left = 213
  Top = 136
  Width = 1067
  Height = 591
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1088#1077#1108#1089#1090#1088#1110#1074
  Color = clBtnFace
  Constraints.MinHeight = 251
  Constraints.MinWidth = 389
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000040010000000000000000000000000000000000000000
    0000FFFFFF0078728F00FF00FF00907887007F626E008A6D7700936F7700926A
    6E00966D6E00AA828200B4909000BD9E9E00C2A4A400D9C4C400F3EEEE00986A
    6900A98180009D6E6B009E7270009E7572009A6D6800DABAB100FCF0EA00D489
    4A00B5A99F00FFF7F000F7CBA100D8A56E00F2DEC900E5B27600FFF6EB00F0E0
    C900C2C0BD00FCFAF700FFFBF200E6E0D100AAA17F00FFFFFE00B1B7A4004C75
    6C0082FFFF0098FFFF0001EDFE0016B0C1007FF4FF0001C5E10065E6FA000F6C
    81005AE0FE0063E1FF0008B7EA00125467004BCFFA0000B8FC0000BBFC0000BA
    FB0000ABED0000A7E70000A6E600009FE0000098D7000084BA0003A0DD0040C6
    FA0048C7FB000081BB000286BF001186BC0034BAF80036BBF70037BCF80036B7
    F30035B6F2003DBAF4000074B0000275B0000273AD00047BB5000475AF000976
    AD000070AC0000669F00026FAA00005F9800005D9700005B9500005C95000058
    900000538B0000518900005088002482FA002881F4005472A900FEFEFE000303
    030303034C03030303030303030303030303034C4C4C4C4C0303030303030303
    03034C494C383A3D4C4C515403030303034C47484C373B3C3E434B52575B0303
    4C46454A4C36394234302E4E565A034C3540415F4D4D4D4F1C282B3F55594C2F
    31325F4D192427251E1B2C3353584C292D5F4D10171A231F1D20221044504C2A
    5F4D21100F2601010118181003034C5F4D10011013110B0D0E5D5C1003034C4D
    21100A0101010114151008100303031001010110101210095E05030303030310
    1010100C165C5C06030303030303030303030310100402070303030303030303
    0303030303030303030303030303030303030303030303030303030303030000
    00000000000030F7120014000000C8F9120076C0D67720B7D477FFFFFFFF423B
    D3771D5ED37700000000B0054100420614002B000000DE44D377BB82D377CA00
    01009B050000000000000000000000000000B002000001000000B00541009B05
    000001010000CA00010078094900ECF712007670D37770A069009B0500005F3A
    D3774206140084000000000000005100D000B0054100CDABBADC000000004CF8
    1200B00541003EC4D4774045680000000000F0F81200F0F8120000000000471B
    E600CD0002000000000002000000F0F81200000000000000030070F81200F0F8
    12000CC5D4770000000002000000F0F8120012010000400E6C000700000000E0
    FD7F0000000020B7D47700000000423BD377ACF81200BF45D377000003000200
    000000000000CE45D37712010000400E6C000700000088F81200400E6C00B0F9
    120076C0D677D8B7D477FFFFFFFFCE45D377F445D377E0F81200F0F812000446
    D377000000000000000020000000F0F8120060F912008F10F577E0F812000000
    000000004C00000000000000000000000000004C4C4C4C4C0000000000000000
    00004C494C383A3D4C4C515400000000004C47484C373B3C3E434B52575B0000
    4C46454A4C36394234302E4E565A004C3540415F4D4D4D4F1C282B3F55594C2F
    31325F4D192427251E1B2C3353584C292D5F4D10171A231F1D20221044504C2A
    5F4D21100F2601010118181000004C5F4D10011013110B0D0E5D5C1000004C4D
    21100A0101010114151008100000001001010110101210095E05000000000010
    1010100C165C5C06000000000000000000000010100402070000000000000000
    000000000000000000000000000000000000000000000000000000000000FDFF
    FFFFF83FFFFFF003FFFFE000FFFFC000FFFF8000FFFF0000FFFF0000FFFF0003
    FFFF0003FFFF0003FFFF800FFFFF803FFFFFF83FFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poDefaultPosOnly
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 50
    Width = 1051
    Height = 483
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 1051
      Height = 433
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        OnKeyDown = cxGrid1DBTableView1KeyDown
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = #1057#1091#1084#1084#1072' = ,0.00 '#1075#1088#1085#39'.'#39';'#1057#1091#1084#1084#1072' = -,0.00 '#1075#1088#1085#39'.'#39
            Kind = skSum
            FieldName = 'SUMMA'
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00 '#1075#1088#1085#39'.'#39';-,0.00 '#1075#1088#1085#39'.'#39
            Kind = skSum
            FieldName = 'SUMMA'
          end
          item
            Format = ',0.00 '#1075#1088#1085#39'.'#39';-,0.00 '#1075#1088#1085#39'.'#39
            Kind = skSum
            FieldName = 'SUM_PAY'
          end
          item
            Format = ',0.00 '#1075#1088#1085#39'.'#39';-,0.00 '#1075#1088#1085#39'.'#39
            Kind = skSum
            FieldName = 'SUM_FULFIL'
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <>
            SummaryItems = <>
          end>
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGrid1DBTableView1CellClick
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayChecked = '1'
          Properties.DisplayUnchecked = '0'
          Properties.DisplayGrayed = '0'
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = False
          Properties.ValueChecked = 1
          Properties.ValueGrayed = 'null'
          Properties.ValueUnchecked = 0
          Options.Filtering = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 20
          IsCaptionAssigned = True
        end
        object cxGrid1DBTableView1ID_REESTR: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          SortOrder = soDescending
          DataBinding.FieldName = 'ID_REESTR'
        end
        object cxGrid1DBTableView1NUM_REESTR: TcxGridDBColumn
          Caption = #1056#1077#1108#1089#1090#1088' '#8470
          HeaderAlignmentHorz = taCenter
          Width = 98
          DataBinding.FieldName = 'NUM_REESTR'
        end
        object cxGrid1DBTableView1DATE_REESTR: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          HeaderAlignmentHorz = taCenter
          SortOrder = soDescending
          Width = 93
          DataBinding.FieldName = 'DATE_REESTR'
        end
        object cxGrid1DBTableView1MFO_DONNU: TcxGridDBColumn
          Caption = #1052#1060#1054
          HeaderAlignmentHorz = taCenter
          Width = 73
          DataBinding.FieldName = 'MFO_DONNU'
        end
        object cxGrid1DBTableView1RATE_ACC_DONNU: TcxGridDBColumn
          Caption = #1056#1072#1093#1091#1085#1086#1082
          HeaderAlignmentHorz = taCenter
          Width = 182
          DataBinding.FieldName = 'RATE_ACC_DONNU'
        end
        object cxGrid1DBTableView1SUMMA: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 83
          DataBinding.FieldName = 'SUMMA'
        end
        object cxGrid1DBTableView1SUM_ZAYAVKA: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          DataBinding.FieldName = 'SUM_ZAYAVKA'
        end
        object cxGrid1DBTableView1CREATION_TIME: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          DataBinding.FieldName = 'CREATION_TIME'
        end
        object cxGrid1DBTableView1PRINT_TIME: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          DataBinding.FieldName = 'PRINT_TIME'
        end
        object cxGrid1DBTableView1OUT_TIME: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          DataBinding.FieldName = 'OUT_TIME'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 433
      Width = 1051
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object cxLabel4: TcxLabel
        Left = 8
        Top = 8
        Width = 86
        Height = 17
        TabOrder = 0
        Caption = #1056#1086#1079#1076#1088#1091#1082#1086#1074#1072#1085#1080#1081
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 8
        Top = 24
        Width = 105
        Height = 21
        DataBinding.DataField = 'PRINT_TIME'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = False
        Style.Color = clSilver
        TabOrder = 1
      end
      object cxLabel1: TcxLabel
        Left = 120
        Top = 8
        Width = 100
        Height = 17
        TabOrder = 2
        Caption = #1045#1082#1089#1087#1086#1088#1090#1086#1074#1072#1085#1080#1081
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 120
        Top = 24
        Width = 105
        Height = 21
        DataBinding.DataField = 'OUT_TIME'
        DataBinding.DataSource = DataSource
        Properties.ReadOnly = False
        Style.Color = clSilver
        TabOrder = 3
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 533
    Width = 1051
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'Del - '#1042#1080#1076#1072#1083#1080#1090#1080
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F3 - '#1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F5 - '#1054#1073#1085#1086#1074#1080#1090#1080
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F9 - '#1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1088#1077#1108#1089#1090#1088
        Width = 130
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F11 - '#1045#1082#1089#1087#1086#1088#1090
        Width = 76
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'Ctrl+P - '#1044#1088#1091#1082#1091#1074#1072#1090#1080
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
    Transaction = ReadTransaction
    SQLScreenCursor = crDrag
    SelectSQL.Strings = (
      
        'select * from PROC_DOG_DT_PL_REE_SEL(:NUM_REE, :DATE_REE, :SUM_R' +
        'EE, :NUM_DOC)')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 8
    Top = 120
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 40
    Top = 121
  end
  object WriteProc: TpFIBStoredProc
    Database = WorkDatabase
    Transaction = WriteTransaction
    Left = 8
    Top = 152
  end
  object ReadDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'select p.id_reestr, p.num_doc, p.export_day, c.name_customer, b.' +
        'mfo, a.rate_account, p.summa, k.kekv_kode_print,'
      ''
      
        'sum((select sum(summa) from dog_dt_pl_smet where id_dog_dt_pl_sm' +
        'et = s.id_dog_dt_pl_smet'
      ' and id_kekv = 112099)) as sum1,'
      ''
      
        'sum((select sum(summa) from dog_dt_pl_smet where id_dog_dt_pl_sm' +
        'et = s.id_dog_dt_pl_smet'
      ' and id_kekv = 114199)) as sum2'
      ''
      ''
      'from dog_dt_pl_ree r'
      'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr)'
      'left join dog_dt_pl_smet s on (p.id_key = s.id_key)'
      
        'left join pub_sp_cust_rate_acc a on (p.id_rate_account = a.id_ra' +
        'te_account)'
      'left join pub_sp_customer c on (a.id_customer = c.id_customer)'
      'left join pub_sp_bank b on (a.id_bank = b.id_bank)'
      
        'left join pub_spr_kekv k on (s.id_kekv = k.id_kekv and (p.export' +
        '_day between k.date_beg and k.date_end))'
      'where r.id_reestr = 142212'
      
        'group by p.id_reestr, p.num_doc, p.export_day, c.name_customer, ' +
        'b.mfo, a.rate_account, p.summa, k.kekv_kode_print'
      '')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 42
    Top = 152
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object dxBarManager1: TdxBarManager
    AlwaysMerge = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
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
            Item = DeleteButton
            Visible = True
          end
          item
            Item = ViewButton
            Visible = True
          end
          item
            Item = dxBarLargeButtonEdit
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = RefreshButton
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton5
            Visible = True
          end
          item
            Item = ExportButton
            Visible = True
          end
          item
            Item = TxtExportButton
            Visible = True
          end
          item
            Item = PrintButton
            Visible = True
          end
          item
            Item = PrintReport
            Visible = True
          end
          item
            Item = SelectButton
            Visible = True
          end
          item
            BeginGroup = True
            Item = ExitButton
            Visible = True
          end>
        MultiLine = True
        Name = #1055#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
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
    LargeIcons = True
    LookAndFeel.Kind = lfUltraFlat
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    StretchGlyphs = False
    UseSystemFont = True
    Left = 72
    Top = 120
    DockControlHeights = (
      0
      0
      50
      0)
    object AddButton: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      ImageIndex = 0
      ShortCut = 45
      OnClick = AddButtonClick
      AutoGrayScale = False
    end
    object EditButton: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 1
      ShortCut = 113
      OnClick = EditButtonClick
      AutoGrayScale = False
    end
    object DeleteButton: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 2
      ShortCut = 46
      OnClick = DeleteButtonClick
      AutoGrayScale = False
    end
    object RefreshButton: TdxBarLargeButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 3
      ShortCut = 116
      OnClick = RefreshButtonClick
      AutoGrayScale = False
    end
    object ExitButton: TdxBarLargeButton
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Category = 0
      Hint = #1047#1072#1082#1088#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 5
      ShortCut = 123
      OnClick = ExitButtonClick
      AutoGrayScale = False
    end
    object ViewButton: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
      Visible = ivAlways
      ImageIndex = 7
      OnClick = ViewButtonClick
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1060#1110#1083#1100#1090#1088
      Category = 0
      Hint = #1060#1110#1083#1100#1090#1088
      Visible = ivAlways
      ImageIndex = 11
      OnClick = dxBarLargeButton2Click
      AutoGrayScale = False
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = #1047#1074#1110#1090' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
      Category = 0
      Hint = #1047#1074#1110#1090' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
      Visible = ivAlways
      ImageIndex = 13
      AutoGrayScale = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1047#1072#1082#1088#1080#1090#1080'/'#1042#1110#1076#1082#1088#1080#1090#1080
      Category = 0
      Hint = #1047#1072#1082#1088#1080#1090#1080'/'#1042#1110#1076#1082#1088#1080#1090#1080
      Visible = ivAlways
      ImageIndex = 8
      AutoGrayScale = False
    end
    object ExportButton: TdxBarLargeButton
      Caption = #1045#1082#1089#1087#1086#1088#1090
      Category = 0
      Hint = #1045#1082#1089#1087#1086#1088#1090
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      ImageIndex = 12
      OnClick = ExportButtonClick
      AutoGrayScale = False
    end
    object PrintButton: TdxBarLargeButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080
      Visible = ivAlways
      DropDownMenu = dxBarPopupMenu2
      ImageIndex = 13
      OnClick = PrintButtonClick
      AutoGrayScale = False
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1088#1077#1108#1089#1090#1088
      Category = 0
      Hint = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1088#1077#1108#1089#1090#1088
      Visible = ivAlways
      ImageIndex = 10
      OnClick = dxBarLargeButton5Click
      AutoGrayScale = False
    end
    object cbDBFPath: TdxBarCombo
      Caption = #1055#1091#1090#1100' '#1082' DBF'
      Category = 0
      Hint = #1055#1091#1090#1100' '#1082' DBF'
      Visible = ivAlways
      Text = 'A:\'
      Width = 100
      ShowEditor = False
      Items.Strings = (
        'A:\'
        'C:\')
      ItemIndex = 0
    end
    object SelectButton: TdxBarLargeButton
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Category = 0
      Hint = #1042#1080#1073#1088#1072#1090#1080
      Visible = ivAlways
      ImageIndex = 4
      OnClick = SelectButtonClick
      AutoGrayScale = False
    end
    object TxtExportButton: TdxBarLargeButton
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' txt'
      Category = 0
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' txt'
      Visible = ivNever
      ImageIndex = 12
      OnClick = TxtExportButtonClick
      AutoGrayScale = False
    end
    object dxBarButton1: TdxBarButton
      Caption = #1055#1077#1095#1072#1090#1100' '#1050#1080#1077#1074
      Category = 0
      Hint = #1055#1077#1095#1072#1090#1100' '#1050#1080#1077#1074
      Visible = ivNever
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = #1055#1077#1095#1072#1090#1100' '#1076#1085#1077#1087#1088
      Category = 0
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1085#1077#1087#1088
      Visible = ivNever
      OnClick = dxBarButton2Click
    end
    object dxBarButton3: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object PrintReport: TdxBarLargeButton
      Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1079#1074#1110#1090
      Category = 0
      Hint = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1079#1074#1110#1090
      Visible = ivAlways
      ImageIndex = 13
      OnClick = PrintReportClick
      AutoGrayScale = False
    end
    object cbKod: TdxBarCombo
      Caption = #1050#1086#1076#1091#1074#1072#1085#1085#1103
      Category = 0
      Hint = #1050#1086#1076#1091#1074#1072#1085#1085#1103
      Visible = ivAlways
      Width = 100
      ItemIndex = -1
    end
    object dxBarLargeButtonEdit: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      OnClick = dxBarLargeButtonEditClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        080000000000400200000000000000000000000100000000000000000000FFFF
        FF00383739006E697200FF00FF005B4E5200B8828500B781830093646500764E
        4E0098696900A7747400AB777700A2717100A1707000AB787800A3727200BB87
        8700B9858500BC888800AA7B7B00A3767600A77B7B00C9959500C7939300CA96
        9600B0838300D6A2A200D8A4A400D7A3A300D4A1A100D0A0A000E5B1B100E4B0
        B000E3AFAF00E2AEAE00E9B6B600E8B5B500F0BCBC00E7B5B500EFBCBC00754E
        4D007E555400754F4E008C636200946B6A0078525000A97F7A00AA807B00A97F
        7900AD837D00E9DBD9009C6F6700B3817600B2887E00E5D4D000BA8E8200B68B
        80006E564F00B1877A009D786C008C6B61007C5F560073595100E5D1CB00B389
        7B00AB837500BE928300FCF9F800FBF8F700C2968500E3CEC600CA9C8800C699
        8600CEA08900CAB5AB00FAF6F400FFFDFC00D7A78C00D2A38A00DAA48200DEAD
        8E00DAAB8D00EEDDD100F8F2EE00FDFAF800FCF9F700BC91710056524F00FEF9
        F500E8D8CA00F7EFE800FCF5EF0084705D00F2E0CE00F4E6D80058534E00F5E9
        DD00FAEFE400FBF2E900F5ECE300FAF2EA00FCF6F000FEFAF600FFFDFB00C795
        6100806D59007E6C58007F6D5A007B6A5700F2DEC800F4E3D000F3E3D200F4E5
        D500FAEFE3007C6B5700EED8BD00BEB1A100F7E6D200F7E8D600F6E7D600F7EA
        DB00F9ECDD00FAF0E400F9EFE300FCF6EF00F3BA6C00F1C58B00EFC38C00EFC4
        8D00B79D7A0086745C00D3B99600907E67009B897100A3927B00F1D9BA00E2CC
        AE00F5DFC200F4E1C700ECD9C000F7E3CA00F4E2CB00F8E8D300F9EBD900FBEF
        E000F9EDDE00FAF0E300FBF2E600FCF5EC00FDF9F400CEB08300C3A77D00BBA0
        7800EDCB9900D4B68900CBAE8300A48D6C00EBCB9C00E3C49700D4B78D00C3A8
        8200AD95730094806300E8CA9F00DCC09700B29B7A00968367008F7D6200A08B
        6E0084735B00E6CAA300BCA58500A4907400E8CEA900CFB89700ECD4B100D5BF
        A000EFDEC600F7E6CE00F0E1CC00FCF5EB00FDF8F100E8C79200E2C28F00D8B9
        8800EECC9700EDCB9600EBCA9500E6C59200E3C29000DCBD8C00EAC99500AF96
        7000E8C79500DCBD8E009A866600C8AF890089785E00B19E8100FDFAF500FFFB
        F300FEFCF800FFFEFC00FFFEF900FFFFFE00546463008D9D9D004D5E5F0000CC
        FF0000C2F50000BCEF0000B9EC0000B3E60000A9DC00009ED100019CCF0007A1
        D1001594BD0069868F0000A3DC000A84B1000B749B00185B74000C82AF000D81
        AD00106A8E001A566D00225569002E5868002C424C002F6B88004A6B7F004F62
        7100424D5A000443BA005C6370000130B1000732C2000833C2000C36C8001E47
        D800113CE4002B53EA00456AF8006D8AFD001A37CD00041CB1000316AC000515
        AC002538CC00293BCD00020EA5000E1BB80000009A0035353700040404040404
        0404040404040404040404040404040404043107070707070707070707070707
        070707070704040404042F6E8D8A88B0AEABA49E9ABBBABABABABABB41040404
        04042F5EB38B7489B1AF84A59FC2C0BBBABABABB4104040404042F708F8E8C02
        6087C7ACC5A0C3BDBCBBBABB4104040404042F5F9076B258FFE6D086ADA6A19B
        B8C0BBBB410404040404306191906F75E4E0E2E3CE85A9829CBFB7C041040404
        04043264949277B4E5DDE1E7EA055DA7A298B9BE3B0404040404365B95627A78
        CFDEE814130F2A6CA89D99974204040404043954B6657C7A71DF151C19130C2A
        6BC6C4C13C0404040404384CCA66657B7ADB1A201D17110B2973AAA33D040404
        04044345CD675C6593792D24201D171110296D833E0404040404464501CB597D
        63725A2D24211B17110D096A3F0404040404494501014D5966657B5A2C24211B
        17110D2E3A04040404044845010101CB597D63724B2C25221E18120E2B040404
        04044A5601010101CB595C63934B2C27221E18120E09040404044F5601010101
        014DC87D63724B1626231E180AECE90404044E56010101010101CB965CB55334
        16282303D9D3D4D704045244010101010101016896C9473557161FDAD1D1D4ED
        FE04515501010101010101014DCC403581692CD5D1DCEDF7F8FE515501010101
        0101010101013735807E08D6D2EBF2F0EEF851CD010101010101010101013335
        7F060404D8F6F4F1EFFC50505050505050505050505050350604040404FBF5F3
        F9040404040404040404040404040404040404040404FAFD0404}
    end
  end
  object ActionList1: TActionList
    Left = 104
    Top = 120
    object AddAction: TAction
      Caption = 'AddAction'
      ShortCut = 45
    end
    object EditAction: TAction
      Caption = 'EditAction'
      ShortCut = 113
    end
    object DeleteAction: TAction
      Caption = 'DeleteAction'
      ShortCut = 46
    end
    object RefreshAction: TAction
      Caption = 'RefreshAction'
      ShortCut = 116
      OnExecute = RefreshButtonClick
    end
    object ExitAction: TAction
      Caption = 'ExitAction'
      ShortCut = 123
      OnExecute = ExitButtonClick
    end
    object FinObAction: TAction
      Caption = 'FinObAction'
    end
  end
  object WorkDatabase: TpFIBDatabase
    DBName = 'localhost:D:\DB\DONNU\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 24
    Top = 72
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 72
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 80
    Top = 72
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 72
    Top = 152
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 56
    Top = 248
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
    Left = 120
    Top = 248
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
    Left = 120
    Top = 280
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
    Left = 88
    Top = 280
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFE7FFE7FF800FFFFF07FFC3FC000
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
    Left = 88
    Top = 248
    Bitmap = {
      494C01010F001300040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B2929007B29
      29007B2929007B292900A5848400A5848400A5848400A5848400A5848400A584
      8400A5848400A5848400A5848400A5848400A58484007B2929007B2929007B29
      29007B2929000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7
      CE00EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900B54A4A00C64A
      4A00BD4A4A00B54242008C5A5A00E7DEDE00CEBDBD00C6ADAD00E7CECE00F7EF
      E700F7EFEF00E7DEDE00DEE7DE00DEE7DE00B56363007B18100084212100A539
      3900AD4242007B29290000000000000000000000000000000000000000000000
      000000000000000000006B6B6B006B6B6B006B6B6B0000000000000000000000
      0000000000006B6B6B006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7CE00EFDECE00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600EFDEC600EFDE
      C600A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900B5524A00C64A
      4A00C64A4A00BD4242008C393900E7DEDE007B1010007B101000AD4A4A00F7E7
      E700FFFFFF00FFF7F700EFF7F700EFF7F700B56363007B10100084212100AD39
      3900B54A4A007B29290000000000000000000000000000000000000000000000
      0000000000006B6B6B00B5ADAD00949494008C8C8C006B6B6B006B6B6B00847B
      7B006B6B6B00DEDEDE00D6CECE006B6B6B006B6B6B006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7D600EFE7CE00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400EFDEC600EFDE
      C600A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900B5524A00C64A
      4A00C64A4A00BD4242008C424200E7DEDE007B1010007B101000B5525200E7D6
      D600FFFFF700FFFFF700FFFFFF00FFFFFF00B56363007B10100084212100A539
      3900B54242007B29290000000000000000000000000000000000000000000000
      00006B6B6B00D6D6D600C6C6C600A59C9C00A59C9C00A59C9C00848484005A5A
      5A00BDBDBD00CECECE00CECECE00D6D6D600D6D6D600CECECE006B6B6B006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000009463
      5A00F7E7D600F7E7D600EFE7CE00EFE7CE00EFDECE00EFDECE00EFDEC600EFDE
      C600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900B5524A00C64A
      4A00C64A4A00B54242008C424200E7DEDE007B1010007B101000B5525200CEC6
      BD00EFEFE700FFF7F700FFFFFF00FFFFFF00B56363007B10100084212100A539
      3900B54242007B29290000000000000000000000000000000000000000006B6B
      6B00DED6D600E7DEDE00C6BDBD00A59C9C00A59C9C00A59C9C00636363000000
      000000000000101010005A5A5A00ADADAD00CECECE00CECECE00CECECE00CECE
      CE00C6C6C6006B6B6B006B6B6B006B6B6B000000000000000000000000009463
      5A00F7E7D600EFE7D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600EFDEC600EFDE
      C600A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900B5524A00C64A
      4A00C64A4A00B542420094424200E7DEDE007B1010007B101000B5525200B5A5
      9C00D6D6D600EFE7E700FFFFFF00FFFFFF00B56363007B10100084212100A539
      3900B54242007B292900000000000000000000000000000000006B6B6B00D6D6
      D600D6D6D600CECECE008C8C8C00847B7B00847B7B00847B7B006B6B6B001010
      100008080800000000000000000000000000101010005A5A5A00ADADAD00CECE
      CE00CECECE00B5B5B500B5B5B5006B6B6B000000000000000000000000009463
      5A00E7DED600E7DECE00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400E7CEBD00E7CE
      BD00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900B5524A00C64A
      4A00C64A4A00B542420094424200E7DEDE007B1010007B101000B55252008C84
      8400A5ADAD00D6D6D600FFFFFF00FFFFFF00B56363007310100084181800A539
      3900B54242007B2929000000000000000000000000006B6B6B00CECECE00CECE
      CE00C6C6C6008C8C8C00BDB5B500B5B5B500A59C9C00A59C9C009C9C9C009C94
      9400949494008484840052525200292929000808080000000000000000001010
      100063636300847B7B006B6B6B00000000000000000000000000000000009C6B
      6300CEC6BD00CEC6BD00CEC6B500CEC6B500CEC6B500CEC6B500CEC6B500CEBD
      AD00CEBDAD00CEBDAD00CEBDAD00CEBDA500CEBDA500C6B5A500C6B5A500C6B5
      A500A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900B5524A00C64A
      4A00BD4A4A00B54242009C424200E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00B5636300841818008C212100AD39
      3900B54242007B2929000000000000000000000000006B6B6B00CECECE00C6C6
      C6008C8C8C00D6D6D600F7F7F700F7F7F700F7F7F700E7DEDE00CEC6C600B5B5
      B500A5A5A500A59C9C00A59C9C009C9C9C00949494006B636300212121000000
      0000181818009C9494006B6B6B00000000000000000000000000000000008C5A
      5200A59C9400A59C9400A59C9400A5949400A5948C009C948C009C948C009C94
      8C009C948C009C9484009C9484009C9484009C9484009C9484009C8C84009C8C
      84008C5A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900B5524A00C64A
      4A00BD4A4A00BD4A4A00B5424200BD5A5A00CE737300D67B7B00CE737300CE6B
      6B00CE6B6B00C66B6B00C66B6B00C65A5A00B5424200B5424200B5424200BD4A
      4A00B54242007B2929000000000000000000000000006B6B6B00C6C6C6008C8C
      8C00E7E7E700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700E7E7E700D6D6D600C6C6C600ADADAD00A59C9C00A59C9C009C9494008484
      84006B6B6B009C9C9C006B6B6B00000000008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00B5424200B54A4A00BD525200BD524A00BD4A4A00BD4A4A00BD4A4A00BD4A
      4A00BD4A4A00BD4A4A00BD4A4A00BD524A00C65A5200C65A5A00C6525200C64A
      4A00B54242007B2929000000000000000000000000006B6B6B008C8C8C00EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600847B7B00948C8C00C6BD
      BD00DEDEDE00E7E7E700DEDEDE00DEDEDE00D6D6D600C6C6C600B5B5B500A59C
      9C009C9C9C006B6B6B006B6B6B00000000008C3910000000000000000000A573
      6B00E7DED600E7DED600DED6CE00DED6CE00DED6CE00DED6CE00DED6C600DED6
      C600DED6C600DECEC600DECEBD00DECEBD00DECEBD00DECEBD00DECEB500DECE
      B500A5636B0000000000000000008C3910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00CE8C8C00CE8C8C00CE8C8C00CE948C00CE948C00CE948C00CE948C00CE94
      8C00CE948C00CE948C00CE948C00CE948C00CE948C00CE948C00CE948C00C652
      5200C64A4A007B2929000000000000000000000000006B6B6B00CECECE00F7F7
      F700F7F7F700F7F7F700F7F7F700CECECE00ADADAD00ADADAD009C9C9C00847B
      7B00736B6B008C848400ADA5A500C6C6C600D6D6D600D6D6D600CECECE00CEC6
      C600BDBDBD00A5A5A5006B6B6B00000000008C3910000000000000000000A573
      6B00D6CEC600D6CEC600CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A
      2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CEBDAD00CEBD
      AD00A5636B0000000000000000008C3910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00D6B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B292900000000000000000000000000000000006B6B6B006B6B
      6B00CECECE00EFEFEF00ADA5A5006B5A5A00736B6B00847B7B009C949400ADAD
      AD00B5B5B500ADA5AD009C94940084737B00847B7B00948C8C00BDBDBD00CECE
      CE00CECECE00C6C6C6006B6B6B00000000008C39100000000000000000009C6B
      5A00A5A59C00A5A59C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD
      9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C009C948C009C94
      8C008C5A5A0000000000000000008C3910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00DEBDB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B29290000000000000000000000000000000000000000000000
      00006B6B6B006B6B6B00BD848400AD8C73007B5A520063525200635252006B5A
      63006B5A63008C848400A59C9C00ADADAD00B5B5B500A59CA500CECECE00CECE
      CE00B5B5B5006B6B6B0000000000000000008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00DEB5B500FFFFFF00FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B29290000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFD6AD00FFD6A500FFCE9C00D6A57B00A57B
      5A007B635A006352520063525A006B6363008C848400CECECE00CECECE00A5A5
      A5006B6B6B00000000000000000000000000000000000000000000000000B57B
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00F7EFE700F7EFE700F7EFE700F7EFE700F7E7DE00F7E7DE00F7E7
      DE00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00DEB5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B29290000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFDEB500FFD6AD00FFCEA500FFCE9400FFC6
      8C00FFC68400FFBD8400FFC68400BD8484006B6B6B006B6B6B006B6B6B006B6B
      6B0000000000000000000000000000000000000000000000000000000000BD84
      6B00FFFFFF00FFFFFF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600F7E7DE00F7E7
      DE00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00DEB5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B29290000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFDEBD00FFDEB500FFD6A500FFCE9C00FFCE
      9400FFC68C00FFC68400FFC68400BD8484000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      6B00FFFFFF00FFFFFF00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400F7EFDE00F7EF
      DE00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00DEB5B500FFFFFF00FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B29290000000000000000000000000000000000000000000000
      000000000000BD848400FFE7CE00FFE7C600FFDEBD00FFD6AD00FFD6A500FFCE
      9C00FFCE9400FFC68C00BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EFE700F7EF
      E700A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00DEB5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B29290000000000000000000000000000000000000000000000
      000000000000BD848400FFEFD600FFE7CE00FFE7C600FFDEB500FFD6AD00FFD6
      A500FFCE9C00FFC69400BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7EF00F7EFEF00F7EFE700F7EF
      E700A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00DEB5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B29290000000000000000000000000000000000000000000000
      000000000000BD848400FFEFDE00FFEFD600FFE7CE00FFE7BD00FFDEB500FFD6
      AD00FFD6A500F7C69400BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFFFFF00FFFFFF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600F7F7EF00F7EF
      E700A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00DEB5B500FFFFFF00FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF00FFFFFF00DEB5B500B54A
      4A00C64A4A007B29290000000000000000000000000000000000000000000000
      0000BD848400FFF7EF00FFF7E700FFEFDE00FFE7D600FFE7C600FFDEBD00FFDE
      B500FFD6AD00BD84840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFF7EF00FFF7
      EF00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B292900C64A4A00C64A
      4A00D6B5AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEBDB500C64A
      4A00C64A4A007B2929000000000000000000000000000000000000000000BD84
      8400FFFFF700FFFFF700FFF7EF00FFF7E700FFEFDE00FFE7CE00FFE7C600FFDE
      BD00F7C6AD00BD84840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7F700FFF7
      EF00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B2929007B29
      2900C6A59C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7BDB5007B29
      29007B292900000000000000000000000000000000000000000000000000BD84
      8400BD848400BD848400BD848400FFF7EF00FFF7E700FFEFD600FFE7CE00FFDE
      C600BD8484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7
      F700A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD848400BD848400BD848400BD848400BD84
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00946363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00000000000000000000000000085ACE00085A
      CE00085ACE00085ACE00085ACE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE004A6B73009C6B6B00DE9C9C00CE8C8C00BD7B7B00AD6B
      6B00945A5A005A313100085ACE00085ACE000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE0008397B00000000000052000031CE
      5A0029C652000052000000520000005200000052000000520000005200000052
      000000520000085ACE00085ACE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000031A54A0029BD
      520018AD290010941000004A0000000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF002994FF00000000000000000000000000319C
      FF00319CFF00319CFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF007B5A5A00DEA5A500DE9C9C00CE8C8C00BD7B
      7B00AD6B6B008C5252005A31310039A5FF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF002994FF0008397B0000000000000000000052
      000031CE6300005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      000000000000000000000000000000000000005A0000189C310021C6520018B5
      420010A52900089C180000840800004A00000000000000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994FF002173C60000000000000000000000
      0000319CFF00000000000000000000000000085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF003194F7007B525A00DEA5A500DE9C9C00CE8C
      8C00BD7B7B00A56B6B008C5252005A313100085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994FF0008397B0000000000000000000000
      000000520000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      0000000000000000000000000000005A000018A5390029D65A0021C6520018B5
      390010A52900089C1000008C000000730000004A000000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF002173C60094D6FF00000000000000
      0000000000000000000000000000319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00105AC6007B5A5A00DEA5A500DE9C
      9C00CE8C8C00BD7B7B00A56B6B008C5252005A39310000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF0008397B0000000000000000000000
      000000000000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      00000000000000000000005A000021AD420031E76B0029CE5A0018BD4A0010B5
      390008A5210000941000008C00000084000000730000004A0000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF002173C60094D6FF00319CFF000000
      00000000000000000000319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE009CD6F70073525A00DE9C
      9C00DE9C9C00CE8C8C00B57B7B00A56B6B008C5252005A313100000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF0008397B0000000000000000000000
      000000000000000000000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      000000000000005A000029B5420042EF730031DE630029CE5A0018BD4A0010AD
      310008A521000094080000840000008400000084000000730000004A00000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF002173C60094D6FF00000000000000
      0000000000000000000000000000319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE009CDEFF004AADF7007352
      5A00DE9C9C00DE9C9C00C68C8C00B57B7B00A56B6B008C5252005A3131000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF0008397B0000000000000000000000
      000000000000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      0000005A000029B542004AFF840039EF730031DE630021CE520018BD420010AD
      3100089C1800009408000084000000840000008400000084000000730000004A
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF002173C60000000000000000000000
      0000319CFF00000000000000000000000000085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE00A5DEFF0042B5FF004AAD
      F700946B6B00E7A5A500DE9C9C00C68C8C00B57B7B00844A4A00424A52003142
      520000000000000000000000000000000000085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF0008397B0000000000000000000000
      000000520000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE00000000000000000000000000005A
      000029B542004AFF840042FF7B0039E76B0029D6630021C6520018B5420010A5
      2900089C1800008C080000840000008400000084000000840000008400000073
      0000004A0000000000000000000000000000085ACE00E7EFFF0094D6FF0094D6
      FF0094D6FF0094D6FF0094D6FF0094D6FF0000000000000000000000000094D6
      FF0094D6FF0094D6FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE00E7EFFF009CDEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF00085ACE00E7EFFF00A5DEFF009CDE
      FF009CD6F700946B6B00E7A5A500DE9C9C00524A5200008CC60000ADEF0000A5
      E7000084C600000000000000000000000000085ACE009CD6FF0042ADFF0039AD
      FF0039ADFF0039A5FF0039A5FF0031A5FF0008397B0000000000000000000052
      000008941000005200000000000000000000DEEFFF00DEEFFF00DEEFFF00DEEF
      FF00DEEFFF00DEEFFF00DEEFFF00DEEFFF000000000000000000005A0000189C
      310031CE5A00189C3100189C310010841800006B080000630800006308000063
      0000005A0000005A0000005A0000005A0000005A000000630000006300000073
      0000006B0000004A00000000000000000000085ACE004284C6002173C6002173
      C6002173C6002173C600186BC6000000000000000000000000002173C6002173
      C6002173C6002173C6002173C600000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE004284C6002173C6002173
      C6002173C6002173C600186BC600186BC600085ACE00085ACE00085ACE00085A
      CE00085ACE00105AC6008C636B00BD848C00087BAD0000BDFF0000BDFF0000A5
      E70000189C00000084000000000000000000085ACE004284C6002173C6002173
      C6002173C6002173C600186BC600186BC60008397B0008397B000052000010A5
      2100089C18000052000000520000005200000052000000520000005200000052
      00000052000000000000000000000000000000000000005A0000004A0000004A
      0000005A000000630000006B00000073080000841000088C180084FFFF0000CE
      EF0000B5CE0000A5BD00084A520021B54A0021A53900189C3100108C21000873
      1000004A0000004A0000004A000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0000000000000000000000000094D6FF00319CFF00319C
      FF00319CFF00299CFF002994FF002994FF000000000000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0039ADFF0039A5FF00186BC6009CDEFF00319CFF00319C
      FF00319CFF00299CFF003194F7006B525A00009CDE0000BDFF00008CD6000018
      9C0000089C00000894000000840000000000085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0039ADFF0039A5FF00186BC6000052000021B5390018AD
      310010A52900089C18000894100000941000008C0800008C0800008C0800008C
      080000520000000000000000000000000000005A0000005A0000007300000084
      0000C67B0000C67B0000C67B0000C67B0000089C180008A5290010AD31007BFF
      FF0000CEE70000C6E70000CEE700085A630042F77B004AFF84004AFF84004AFF
      84004AFF840031CE5A00005A0800004A0000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF000000000000000000186BC60094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994FF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF0039ADFF0039ADFF00186BC6009CDEFF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994F7000094D60000B5F7000029A5000021
      DE000021BD000018B5000008940000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF0039ADFF0039ADFF000052000031CE5A0029C64A0021BD
      420018B5310010A52900109C21000894180000941000008C0800008C0800008C
      08000052000000000000000000000000000000000000005A000000630000C67B
      0000E7C65A00E7C65200E7B53900DEAD1800C67B000008A5290010AD310018BD
      420084FFFF0000D6F70000D6F70000D6F700085A630031CE5A00189C31001894
      2900FF7BFF00004A0000004A000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C60094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6009CDEFF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00085ACE000084C6000821BD00294A
      F7000829CE000018B50000008C0000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6000052000031CE5A0029C6
      520021BD420018B5390018AD290010A52100089C180008941000008C0800008C
      080000520000000000000000000000000000000000000000000000000000E7AD
      6B00EFDE9C00EFD68C00E7CE6300E7BD3900C67B0000004A0000004A0000004A
      0000004A000084FFFF0000D6F700085A6300004A0000004A0000004A0000FF7B
      FF00FF7BFF00730073000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C60094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6009CDEFF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE00000000001021BD005273
      FF001839E700000894000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C60039ADFF000052000031CE
      5A0029C652000052000000520000005200000052000000520000005200000052
      000000520000000000000000000000000000000000000000000000000000E7AD
      6B00FFF7D600F7EFBD00EFD68C00E7C65200C67B000000000000000000000000
      0000000000000000000052E7F700000000000000000000000000FF94FF00FF7B
      FF0000000000730073007300730000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C60094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C6009CDEFF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE0000000000000000001021
      BD000008A500000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C60039ADFF0039ADFF000052
      000031CE630000520000319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7AD
      6B00FFFFFF00FFF7D600EFDE9C00E7C65A00FF7B000000000000000000000000
      00000000000000000000000000000000000000000000FF94FF00FF94FF000000
      000000000000000000007300730073007300085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C60094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C6009CDEFF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C60039ADFF0039ADFF0039AD
      FF00005200000052000031A5FF00319CFF00085ACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7AD6B00E7AD6B00E7AD6B00E7AD6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF94FF00FF94
      FF0000000000730073007300730000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C600E7EFFF0094D6FF0094D6
      FF0094D6FF0094D6FF0094D6FF0094CEFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C600E7EFFF0094D6FF0094D6
      FF0094D6FF0094D6FF0094D6FF0094CEFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C6009CD6FF0094D6FF0094D6
      FF0094D6FF000052000094D6FF0094CEFF00085ACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF94
      FF00FF7BFF0073007300000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFFFFFFE00007000000C00007FF
      FFFFE00007000000800003FC79FFE00007000000800003F8003FE00007000000
      800003F00007E00007000000800003E00000E00007000000800003C00000E000
      07000000800003800001E00007000000800003800001E0000700000080000380
      0001000000000000800003800001600006000000800003800001600006000000
      800003C00001600006000000800003F00003000000000000800003FC0007E000
      07000000800003FC000FE00007000000800003FC00FFE00007000000800003F8
      01FFE00007000000800003F801FFE00007000000800003F801FFE00007000000
      800003F003FFE00007000000800003E003FFE00007000000C00007E007FFE000
      07000000FFFFFFFE0FFFE00007000000FFFFFFFFFFFFFFFBFFFFFFFFFFFFFFF3
      FFFFFFF3FFFFC3FFFFFFFFF0FFFFFFE3FFFF81FFFFFFFFF03FFFFFC007FF81FF
      FFFFFFF81FFFFF8007FF81FFFCFF9FF80FFFFF0007FF81FFFC7F1FFC07FFFF80
      07FF81FF80003F8000FF804001FF81FF00007F00007F006300FF00FF00007F00
      007F007300FE007F00007F00007F007B00FC003F00007F00003F007F00F8001F
      00007F00001F007B00F0000F00007F00000F007300E0000700007F0000070063
      00C0000300003F00000300000780000100001F00000100000700000000001F00
      000100000780000100007F000001000007E0000300007F000043000007E07DC9
      00007F00006700007FE07F9C00007F00007F00007FF0FFC900007F00007F0000
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
  object pFIBQuery1: TpFIBQuery
    Database = WorkDatabase
    Transaction = pFIBTransaction1
    Left = 104
    Top = 152
    qoStartTransaction = True
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 112
    Top = 72
  end
  object HalcyonDataSet2: THalcyonDataSet
    AutoFlush = False
    Exclusive = True
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'C:\FPLAT-19881-31257273211000\Fp0006525122013.DBF'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 56
    Top = 280
    object HalcyonDataSet2OP: TSmallintField
      FieldName = 'OP'
    end
    object HalcyonDataSet2ND: TStringField
      FieldName = 'ND'
      Size = 10
    end
    object HalcyonDataSet2NPD: TStringField
      FieldName = 'NPD'
      Size = 10
    end
    object HalcyonDataSet2DA: TDateField
      FieldName = 'DA'
    end
    object HalcyonDataSet2NREE: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NREE'
      Calculated = True
    end
    object HalcyonDataSet2MFOP: TIntegerField
      FieldName = 'MFOP'
    end
    object HalcyonDataSet2NLSA: TStringField
      FieldName = 'NLSA'
      Size = 14
    end
    object HalcyonDataSet2KOKPOR: TStringField
      FieldName = 'KOKPOR'
      Size = 14
    end
    object HalcyonDataSet2RRAX: TStringField
      FieldName = 'RRAX'
      Size = 12
    end
    object HalcyonDataSet2KPK: TIntegerField
      FieldName = 'KPK'
    end
    object HalcyonDataSet2KPOL: TIntegerField
      FieldName = 'KPOL'
    end
    object HalcyonDataSet2KVK: TSmallintField
      FieldName = 'KVK'
    end
    object HalcyonDataSet2KFK: TIntegerField
      FieldName = 'KFK'
    end
    object HalcyonDataSet2S: TFloatField
      FieldName = 'S'
    end
    object HalcyonDataSet2KV: TSmallintField
      FieldName = 'KV'
    end
    object HalcyonDataSet2KOBL: TSmallintField
      FieldName = 'KOBL'
    end
    object HalcyonDataSet2KRAJ: TSmallintField
      FieldName = 'KRAJ'
    end
    object HalcyonDataSet2KSEL: TSmallintField
      FieldName = 'KSEL'
    end
    object HalcyonDataSet2DATERZ: TDateField
      FieldName = 'DATERZ'
    end
    object HalcyonDataSet2NPRZ: TIntegerField
      FieldName = 'NPRZ'
    end
    object HalcyonDataSet2KEKV: TSmallintField
      FieldName = 'KEKV'
    end
    object HalcyonDataSet2S1: TFloatField
      FieldName = 'S1'
    end
    object HalcyonDataSet2NPRZ1: TIntegerField
      FieldName = 'NPRZ1'
    end
    object HalcyonDataSet2KEKV1: TSmallintField
      FieldName = 'KEKV1'
    end
    object HalcyonDataSet2S2: TFloatField
      FieldName = 'S2'
    end
    object HalcyonDataSet2NPRZ2: TIntegerField
      FieldName = 'NPRZ2'
    end
    object HalcyonDataSet2KEKV2: TSmallintField
      FieldName = 'KEKV2'
    end
    object HalcyonDataSet2S3: TFloatField
      FieldName = 'S3'
    end
    object HalcyonDataSet2NPRZ3: TIntegerField
      FieldName = 'NPRZ3'
    end
    object HalcyonDataSet2KEKV3: TSmallintField
      FieldName = 'KEKV3'
    end
    object HalcyonDataSet2S4: TFloatField
      FieldName = 'S4'
    end
    object HalcyonDataSet2PRM: TStringField
      FieldName = 'PRM'
      Size = 1
    end
    object HalcyonDataSet2NAZB: TStringField
      FieldName = 'NAZB'
      Size = 38
    end
    object HalcyonDataSet2MFO: TIntegerField
      FieldName = 'MFO'
    end
    object HalcyonDataSet2NLSK: TStringField
      FieldName = 'NLSK'
      Size = 14
    end
    object HalcyonDataSet2KOKPO: TStringField
      FieldName = 'KOKPO'
      Size = 14
    end
    object HalcyonDataSet2POLUT: TStringField
      FieldName = 'POLUT'
      Size = 38
    end
    object HalcyonDataSet2NAZ: TStringField
      FieldName = 'NAZ'
      Size = 160
    end
    object HalcyonDataSet2VZK: TSmallintField
      FieldName = 'VZK'
    end
    object HalcyonDataSet2SK: TSmallintField
      FieldName = 'SK'
    end
    object HalcyonDataSet2SKD: TSmallintField
      FieldName = 'SKD'
    end
    object HalcyonDataSet2PRM1: TStringField
      FieldName = 'PRM1'
      Size = 15
    end
    object HalcyonDataSet2PRM2: TStringField
      FieldName = 'PRM2'
      Size = 1
    end
    object HalcyonDataSet2KEKD: TIntegerField
      FieldName = 'KEKD'
    end
    object HalcyonDataSet2NAMER: TStringField
      FieldName = 'NAMER'
      Size = 38
    end
    object HalcyonDataSet2ndoc: TStringField
      FieldName = 'ndoc'
      Size = 16
    end
    object HalcyonDataSet2datedoc: TDateField
      FieldName = 'datedoc'
    end
    object HalcyonDataSet2NDOCU: TStringField
      FieldName = 'NDOCU'
      Size = 16
    end
    object HalcyonDataSet2DATEDOCU: TDateField
      FieldName = 'DATEDOCU'
    end
  end
  object pFIBQuery2: TpFIBQuery
    Database = WorkDatabase
    Transaction = WriteTransaction
    Left = 136
    Top = 152
    qoStartTransaction = True
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from PROC_DOG_DT_PL_REE_REPORT(?MAS_ID_REESTR)')
    DataSource = DataSource
    Left = 224
    Top = 250
    poSQLINT64ToBCD = True
  end
  object frxDBDataset1ree: TfrxDBDataset
    UserName = 'frxDBDataset1ree'
    CloseDataSource = False
    DataSet = pFIBDataSet1
    Left = 256
    Top = 250
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 192
    Top = 282
  end
  object frxDBDataset2ree: TfrxDBDataset
    UserName = 'frxDBDataset2ree'
    CloseDataSource = False
    DataSet = DataSet
    Left = 256
    Top = 283
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select A.RATE_ACCOUNT, B.MFO, B.NAME_MFO'
      'from PUB_SP_CUST_RATE_ACC A,'
      '     PUB_SP_BANK B'
      'where '
      
        '  A.ID_RATE_ACCOUNT = (SELECT ID_RATE_ACC_OUT FROM pub_sp_rate_a' +
        'cc_get_out(?MAS_ID_RATE_ACCOUNT))'
      ' and'
      '  A.ID_BANK = B.ID_BANK'
      ''
      '')
    DataSource = DataSource
    Left = 224
    Top = 282
    poSQLINT64ToBCD = True
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = cbDBFPath
        UserDefine = [udWidth]
        UserWidth = 179
        Visible = True
      end
      item
        Item = cbKod
        Visible = True
      end>
    UseOwnFont = False
    OnPopup = dxBarPopupMenu1Popup
    Left = 136
    Top = 120
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 288
    Top = 248
  end
  object frxDBDataset3ree: TfrxDBDataset
    UserName = 'frxDBDataset3ree'
    CloseDataSource = False
    DataSet = pFIBDataSet2
    Left = 288
    Top = 283
  end
  object pFIBDataSet3: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select c.name_customer, c.short_name '
      'from pub_sp_customer c, pub_sys_data d '
      'where d.organization = c.id_customer')
    DataSource = DataSource
    Left = 296
    Top = 186
    poSQLINT64ToBCD = True
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset4reeCust'
    CloseDataSource = False
    DataSet = pFIBDataSet3
    Left = 328
    Top = 186
  end
  object frxReport2: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38589.653470219900000000
    ReportOptions.LastChange = 39406.504840983800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'procedure Memo10OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if (dKekv1.visible) then Memo10.Width := dKekv1.Left - Memo10.' +
        'Left + dKekv1.Width;'
      
        '  if (dKekv2.visible) then Memo10.Width := dKekv2.Left - Memo10.' +
        'Left + dKekv2.Width;'
      
        '  if (dKekv3.visible) then Memo10.Width := dKekv3.Left - Memo10.' +
        'Left + dKekv3.Width;'
      
        '  if (dKekv4.visible) then Memo10.Width := dKekv4.Left - Memo10.' +
        'Left + dKekv4.Width;'
      
        '  if (dKekv5.visible) then Memo10.Width := dKekv5.Left - Memo10.' +
        'Left + dKekv5.Width;'
      'end;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 264
    Top = 186
    Datasets = <
      item
        DataSet = frxDBDataset2ree
        DataSetName = 'frxDBDataset2ree'
      end
      item
        DataSet = frxDBDataset3ree
        DataSetName = 'frxDBDataset3ree'
      end
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset4reeCust'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDatasetMainData'
      end>
    Variables = <>
    Style = <>
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDatasetMainData'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_REESTR=ID_REESTR'
      'NUM_DOC=NUM_DOC'
      'EXPORT_DAY=EXPORT_DAY'
      'NAME_CUSTOMER=NAME_CUSTOMER'
      'MFO=MFO'
      'RATE_ACCOUNT=RATE_ACCOUNT'
      'SUMMA=SUMMA'
      'KEKV_KODE_PRINT=KEKV_KODE_PRINT'
      'SUM1=SUM1'
      'SUM2=SUM2')
    DataSet = ReadDataSet
    Left = 360
    Top = 187
  end
  object Timer1: TTimer
    Interval = 1200
    OnTimer = Timer1Timer
    Left = 320
    Top = 248
  end
  object dxBarPopupMenu2: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = dxBarButton1
        Visible = True
      end
      item
        Item = dxBarButton2
        Visible = True
      end>
    UseOwnFont = False
    Left = 400
    Top = 150
  end
  object pFIBDataSet4: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from PROC_DOG_DT_PL_REE_REPORT(?MAS_ID_REESTR)')
    DataSource = DataSource
    Left = 224
    Top = 218
    poSQLINT64ToBCD = True
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset1ree'
    CloseDataSource = False
    DataSet = pFIBDataSet4
    Left = 256
    Top = 218
  end
  object ReadDataSetGroupSum: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'select p.num_doc, p.export_day, c.name_customer, b.mfo, a.rate_a' +
        'ccount, p.summa,'
      ''
      
        'sum((select sum(summa) from dog_dt_pl_smet where id_dog_dt_pl_sm' +
        'et = s.id_dog_dt_pl_smet'
      ' and id_kekv = 112099)) as sum1,'
      ''
      
        'sum((select sum(summa) from dog_dt_pl_smet where id_dog_dt_pl_sm' +
        'et = s.id_dog_dt_pl_smet'
      ' and id_kekv = 114199)) as sum2'
      ''
      ''
      'from dog_dt_pl_ree r'
      'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr)'
      'left join dog_dt_pl_smet s on (p.id_key = s.id_key)'
      
        'left join pub_sp_cust_rate_acc a on (p.id_rate_account = a.id_ra' +
        'te_account)'
      'left join pub_sp_customer c on (a.id_customer = c.id_customer)'
      'left join pub_sp_bank b on (a.id_bank = b.id_bank)'
      'where r.id_reestr = 142212'
      
        'group by p.num_doc, p.export_day, c.name_customer, b.mfo, a.rate' +
        '_account, p.summa')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 530
    Top = 196
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'frxDBDatasetGroupSum'
    CloseDataSource = False
    DataSet = ReadDataSetGroupSum
    Left = 496
    Top = 194
  end
  object PopupMenu1: TPopupMenu
    Left = 122
    Top = 203
  end
  object pFIBDataSet5: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'Select * from DOG_SYS_OPTIONS')
    Left = 528
    Top = 150
    poSQLINT64ToBCD = True
  end
  object frxDBDataset5: TfrxDBDataset
    UserName = 'frxDBDataset5'
    CloseDataSource = False
    DataSet = pFIBDataSet5
    Left = 560
    Top = 150
  end
  object pFIBDataSetHeader: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select r.id_reestr, r.num_reestr, r.date_reestr'
      'from dog_dt_pl_ree r  '
      'where r.id_reestr = 142212')
    Left = 479
    Top = 322
    poSQLINT64ToBCD = True
  end
  object frxDBDatasetHeader: TfrxDBDataset
    UserName = 'frxDBDatasetHeader'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_REESTR=ID_REESTR'
      'NUM_REESTR=NUM_REESTR'
      'DATE_REESTR=DATE_REESTR')
    DataSet = pFIBDataSetHeader
    Left = 524
    Top = 313
  end
  object HeaderDataSource: TDataSource
    DataSet = pFIBDataSetHeader
    Left = 480
    Top = 356
  end
  object pFIBDataSetDet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'select p.id_reestr, p.num_doc, p.export_day, p.summa, c.name_cus' +
        'tomer, b.mfo, a.rate_account, s.id_kekv, k.kekv_kode_print, p.no' +
        'te '
      'from dog_dt_pl_ree r'
      'left join dog_dt_pl_doc p on (r.id_reestr = p.id_reestr)'
      'left join dog_dt_pl_smet s on (p.id_key = s.id_key)'
      
        'left join pub_sp_cust_rate_acc a on (p.id_rate_account = a.id_ra' +
        'te_account)'
      'left join pub_sp_customer c on (a.id_customer = c.id_customer)'
      'left join pub_sp_bank b on (a.id_bank = b.id_bank)'
      
        'left join pub_spr_kekv k on (s.id_kekv = k.id_kekv and (p.export' +
        '_day between k.date_beg and k.date_end))'
      'where r.id_reestr = ?MAS_ID_REESTR and (p.DELETED_SYSTEM <> 3)'
      
        'group by p.id_reestr, p.num_doc, p.export_day, c.name_customer, ' +
        'b.mfo, a.rate_account, p.summa, s.id_kekv, k.kekv_kode_print, p.' +
        'note'
      'order by k.kekv_kode_print')
    DataSource = HeaderDataSource
    Left = 525
    Top = 389
    poSQLINT64ToBCD = True
  end
  object frxDBDataset6: TfrxDBDataset
    UserName = 'frxDBDatasetDet'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_REESTR=ID_REESTR'
      'NUM_DOC=NUM_DOC'
      'EXPORT_DAY=EXPORT_DAY'
      'SUMMA=SUMMA'
      'NAME_CUSTOMER=NAME_CUSTOMER'
      'MFO=MFO'
      'RATE_ACCOUNT=RATE_ACCOUNT'
      'ID_KEKV=ID_KEKV'
      'KEKV_KODE_PRINT=KEKV_KODE_PRINT'
      'NOTE=NOTE')
    DataSet = pFIBDataSetDet
    Left = 566
    Top = 387
  end
  object pFIBDataSetSign: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select *'
      'from DOG_REE_PACK_SEL')
    Left = 605
    Top = 287
    poSQLINT64ToBCD = True
  end
  object frxDBDataset7: TfrxDBDataset
    UserName = 'frxDBDatasetSign'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KER_US=KER_US'
      'GL_BX=GL_BX'
      'CLIENT_NAME=CLIENT_NAME'
      'NAME_UDK=NAME_UDK'
      'NAME_CLIENT_LOW=NAME_CLIENT_LOW'
      'NAME_CLIENT_RUS=NAME_CLIENT_RUS'
      'NOTE_UKR_REPORT=NOTE_UKR_REPORT'
      'NOTE_RUS_REPORT=NOTE_RUS_REPORT'
      'COMMENT_REPORT=COMMENT_REPORT')
    DataSet = pFIBDataSetSign
    Left = 642
    Top = 287
  end
  object NewDbfTableCreate: TCreateHalcyonDataSet
    AutoOverwrite = False
    CreateFields.Strings = (
      'OP;N;1;0'
      'ND;C;10;0'
      'NPD;C;10;0'
      'DA;D;8;0'
      'NREE;N;5;0'
      'NLSA;C;14;0'
      'RRAX;C;12;0'
      'S;N;17;2'
      'KV;N;1;0'
      'KOBL;N;2;0'
      'KRAJ;N;2;0'
      'KSEL;N;2;0'
      'KPK;N;7;0'
      'KFK;N;6;0'
      'KVK;N;3;0'
      'KEKV;N;4;0'
      'DATERZ;D;8;0'
      'NPRZ;N;9;0'
      'S1;N;17;2'
      'KEKV1;N;4;0'
      'NPRZ1;N;9;0'
      'S2;N;17;2'
      'KEKV2;N;4;0'
      'NPRZ2;N;9;0'
      'S3;N;17;2'
      'KEKV3;N;4;0'
      'NPRZ3;N;9;0'
      'S4;N;17;2'
      'PRM;C;1;0'
      'PRM1;C;15;0'
      'PRM2;C;1;0'
      'NAZB;C;38;0'
      'MFO;N;9;0'
      'NLSK;C;14;0'
      'KOKPO;C;14;0'
      'POLUT;C;38;0'
      'SK;N;1;0'
      'SKD;N;2;0'
      'VZK;N;2;0'
      'KPOL;N;5;0'
      'NAZ;C;160;0'
      'NDOC;C;16;0'
      'DATEDOC;D;8;0'
      'KEKD;N;8;0'
      'MFOP;N;9;0'
      'KOKPOR;C;14;0'
      'NAMER;C;38;0'
      'NDOCU;C;16;0'
      'DATEDOCU;D;8;0')
    DBFTable = HalcyonDataSet1
    DBFType = DBaseIV
    Left = 61
    Top = 320
  end
  object DataSetExport: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SQLScreenCursor = crDrag
    SelectSQL.Strings = (
      'select * '
      'from PROC_DOG_DT_PL_REE_GET_EXP_DATA(:ID_REESTR, :KOD_TYPE)')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 56
    Top = 360
    poSQLINT64ToBCD = True
  end
  object HalcyonDataSet1: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TableName = 'NewDbfTableCreate'
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 24
    Top = 322
  end
end
