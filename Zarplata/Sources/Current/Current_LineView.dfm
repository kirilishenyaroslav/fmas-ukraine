object FZLineCurrent: TFZLineCurrent
  Left = 178
  Top = 168
  Width = 601
  Height = 375
  Caption = 'FZLineCurrent'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PanelGroup: TPanel
    Left = 0
    Top = 24
    Width = 593
    Height = 324
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Grid1: TcxGrid
      Left = 0
      Top = 0
      Width = 593
      Height = 237
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      object Grid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = Grid1ClSumma
          end>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = Grid1DBTableView1FocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object Grid1ClMan: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          Visible = False
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          DataBinding.FieldName = 'FIO_TN'
        end
        object Grid1ClKodSetup: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = Grid1ClKodSetupGetDisplayText
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 30
          DataBinding.FieldName = 'KOD_SETUP'
        end
        object Grid1ClSmeta: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 26
          DataBinding.FieldName = 'KOD_SMETA'
        end
        object Grid1ClDepartment: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 47
          DataBinding.FieldName = 'KOD_DEPARTMENT'
        end
        object Grid1ClVo: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 54
          DataBinding.FieldName = 'KOD_VIDOPL'
        end
        object Grid1ClVidOpl: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 337
          DataBinding.FieldName = 'NAME_VIDOPL'
        end
        object Grid1ClSumma: TcxGridDBColumn
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 64
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object Grid1Level1: TcxGridLevel
        GridView = Grid1DBTableView1
      end
    end
    object cxSplitter3: TcxSplitter
      Left = 0
      Top = 259
      Width = 593
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      AlignSplitter = salBottom
      Control = PanelDopData
    end
    object PanelDopData: TPanel
      Left = 0
      Top = 267
      Width = 593
      Height = 57
      Align = alBottom
      BevelOuter = bvNone
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object EditDepartment: TcxDBMaskEdit
        Left = 96
        Top = 19
        Width = 498
        Height = 21
        DataBinding.DataField = 'NAME_DEPARTMENT'
        DataBinding.DataSource = DSource
        TabOrder = 0
      end
      object EditCategory: TcxDBMaskEdit
        Left = 96
        Top = 1
        Width = 498
        Height = 21
        DataBinding.DataField = 'NAME_Category'
        DataBinding.DataSource = DSource
        TabOrder = 1
      end
      object EditSmeta: TcxDBMaskEdit
        Left = 96
        Top = 37
        Width = 498
        Height = 21
        DataBinding.DataField = 'NAME_SMETA'
        DataBinding.DataSource = DSource
        TabOrder = 2
      end
      object LabelSmeta: TcxLabel
        Left = 0
        Top = 39
        Width = 97
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
        Caption = 'LabelSmeta'
      end
      object LabelDepartment: TcxLabel
        Left = -1
        Top = 21
        Width = 98
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 4
        Caption = 'LabelDepartment'
      end
      object LabelCategory: TcxLabel
        Left = 0
        Top = 3
        Width = 97
        Height = 17
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 5
        Caption = 'LabelCategory'
      end
    end
    object PanelGridFooter: TPanel
      Left = 0
      Top = 237
      Width = 593
      Height = 22
      Align = alBottom
      BevelOuter = bvNone
      Color = 14811135
      TabOrder = 3
      OnResize = PanelGridFooterResize
      object LabelPeopleCount: TcxLabel
        Left = 0
        Top = 0
        Width = 79
        Height = 22
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.Shadow = False
        TabOrder = 0
      end
      object LabelRecordCount: TcxLabel
        Left = 79
        Top = 0
        Width = 101
        Height = 22
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.Shadow = False
        TabOrder = 1
      end
      object LabelCommonSumma: TcxLabel
        Left = 180
        Top = 0
        Width = 65
        Height = 22
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.Shadow = False
        TabOrder = 2
      end
    end
  end
  object Styles: TcxStyleRepository
    Left = 640
    Top = 8
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
      Color = 8535838
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
  object DSource: TDataSource
    DataSet = DSet
    Left = 64
    Top = 64
  end
  object DBase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
    Top = 32
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DBase
    TimeoutAction = TARollback
    Left = 32
    Top = 96
  end
  object DSet: TpFIBDataSet
    Database = DBase
    Transaction = DefaultTransaction
    Left = 32
    Top = 64
    poSQLINT64ToBCD = True
  end
  object BarManager: TdxBarManager
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
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'FilterBtn'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = FilterBtn
            Visible = True
          end
          item
            Item = ExitBtn
            Visible = True
          end>
        Name = 'FilterBtn'
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
    ShowShortCutInHint = True
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 144
    Top = 72
    DockControlHeights = (
      0
      0
      24
      0)
    object FilterBtn: TdxBarButton
      Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080' '#1087#1086' '#1082#1110#1083#1100#1082#1086#1089#1090#1110' '#1086#1087#1077#1088#1072#1094#1110#1081' '#1091' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080
      Category = 0
      Hint = 
        #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080'/'#1074#1110#1076#1084#1110#1085#1080#1090#1080' '#1092#1110#1083#1100#1090#1088' '#1087#1086' '#1082#1110#1083#1100#1082#1086#1089#1090#1110' '#1086#1087#1077#1088#1072#1094#1110#1081' '#1091' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086 +
        #1073#1080
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00015D040045F680002FD75100004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00015D040045F680002FD75100004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00015D040045F67F002FD75100004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00015D040045F680002FD75100004B
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00015D0400189D330019B6410011A72C000381
        0800004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001DA539002DD35E0018B23D0011A72C000289
        060000760000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00015D040028B4450034DD670029CD5A0013AB30000DA021000081
        00000081000000760000004B0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0028B4450049FB800034DD670023C5530013AB30000A9A19000081
        0000008100000081000000760000FF00FF00FF00FF00FF00FF00FF00FF00015D
        0400189D3300189D3300189D3300076A0F0005670D00015D0400015D0400015D
        0400015D0400006600000066000000760000004B0000FF00FF00FF00FF00004B
        0000004B0000015D040001690200078612000A8C1B0000CCE90000B1CA000A4A
        520028B44500189D330014882300004B0000004B0000FF00FF00FF00FF000066
        0000C47B0000E3C15200E0B83B00C47B000011A72C0019B6410081FFFE0000D7
        F40000D7F40034CC590020A53900FF78FF00004B0000FF00FF00FF00FF00FF00
        FF00E2AB6F00EDD78A00E7C96600C47B0000004B0000004B0000004B000000D7
        F4000D586200004B0000004B0000FF78FF0076037600FF00FF00FF00FF00FF00
        FF00E2AB6F00F8F2D400EFDC9800FF7E0000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FA95FA00FA95FA00FC00FC00FC00FC0076037600FF00FF00FF00
        FF00FF00FF00E2AB6F00E2AB6F00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FA95FA00FC00FC0076037600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF78FF00FF00FF00FF00FF00}
      PaintStyle = psCaptionGlyph
      ShortCut = 119
      OnClick = FilterBtnClick
    end
    object ExitBtn: TdxBarButton
      Align = iaRight
      Caption = 'ExitBtn'
      Category = 0
      Hint = 'ExitBtn'
      Visible = ivAlways
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00824B4B004E1E1F00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00824B4B00824B4B009C4B4C00B64B4C009F4B4C004E1E1F00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00824B4B009A4D4E00AF4E4F00C04D4E00BF4C4D009F4B4C004E1E1F00824B
        4B00824B4B00824B4B00824B4B00824B4B00824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00CC575800CB565700C9545500C7535400A34E4F004E1E1F001EBC
        4C001EBC4C001EBC4C001EBC4C00F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00D05A5B00CF595A00CC575800CB565700A55050004E1E1F001EBC
        4C001EBC4C001EBC4C001EBC4C00F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00D9626300D8606200D55E5F00D45D5E00A95354004E1E1F001EBC
        4C001EBC4C001EBC4C001EBC4C00F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00DD656600DC646500D9626300D8606200AB5555004E1E1F001EBC
        4C001EBC4C001EBC4C001EBC4C00F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00E66C6D00E56B6C00EEA6A700FFFFFF00AF5859004E1E1F00B7EB
        AA005ED3770045CA670045CA6700F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00EA6F7000E96E6F00F2A9AA00FFFFFF00B15A5A004E1E1F00FFFF
        D300FFFFD300FFFFD300D9F6BD00F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00F3777800F2767700EF747500EE737400B55D5D004E1E1F00FFFF
        D300FFFFD300FFFFD300FFFFD300F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00F77A7B00F6797A00F3777800F2767700B75F5F004E1E1F00FFFF
        D300FFFFD300FFFFD300FFFFD300F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00FF818200FE808100FC7F8000FB7E7F00BB6363004E1E1F00FFFF
        D300FFFFD300FFFFD300FFFFD300F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00FF818200FF818200FF818200FE808100BD6565004E1E1F00FFFF
        D300FFFFD300FFFFD300FFFFD300F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00824B4B00AF5E5F00D56F7000FF818200FF818200BF6666004E1E1F00FFFF
        D300FFFFD300FFFFD300FFFFD300F7B5B600824B4B00FF00FF00FF00FF00FF00
        FF00FF00FF00824B4B00824B4B00B6626300EE7A7B00BF6666004E1E1F00824B
        4B00824B4B00824B4B00824B4B00824B4B00824B4B00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00824B4B004E1E1F00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      PaintStyle = psCaptionGlyph
      ShortCut = 27
      OnClick = ExitBtnClick
    end
  end
end
