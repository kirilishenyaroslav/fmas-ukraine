object fmHolAvg: TfmHolAvg
  Left = 238
  Top = 251
  BorderStyle = bsDialog
  Caption = #1057#1077#1088#1077#1076#1085#1108
  ClientHeight = 381
  ClientWidth = 779
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
  object Panel1: TPanel
    Left = 0
    Top = 46
    Width = 465
    Height = 335
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Grid1: TcxGrid
      Left = 0
      Top = 0
      Width = 465
      Height = 153
      Align = alTop
      TabOrder = 0
      object Grid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'KOD_SETUP'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skSum
            FieldName = 'DAYS'
            Column = cmnGrid1Days
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
        object cmnGrid1DateBeg: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'DATE_BEG'
        end
        object cmnGrid1DateEnd: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'DATE_END'
        end
        object cmnGrid1Days: TcxGridDBColumn
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'DAYS'
        end
      end
      object Grid1Level1: TcxGridLevel
        GridView = Grid1DBTableView1
      end
    end
    object Grid2: TcxGrid
      Left = 0
      Top = 153
      Width = 465
      Height = 182
      Align = alClient
      PopupMenu = pmGetAvgPopupMenu
      TabOrder = 1
      object Grid2DBTableView: TcxGridDBTableView
        DataController.DataSource = DSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'AVG_SUMMA'
            Column = cmnGrid2AvgSum
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'NUM_DAYS'
            Column = cmnGrid2Days
          end
          item
            Format = #1057#1077#1088#1077#1076#1085#1110#1081'=0.00'
            Column = cmnGrid2DateBeg
          end
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'SUMMA_N_KOEFF'
            Column = cmnGrid2Summa
          end
          item
            Format = '====='
            Kind = skAverage
            FieldName = 'AVG_SUMMA'
            Column = cmnGrid2Koeff
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.Summary.OnAfterSummary = Grid2DBTableViewDataControllerSummaryAfterSummary
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cmnGrid2DateBeg: TcxGridDBColumn
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 139
          DataBinding.FieldName = 'DATE_BEG'
        end
        object cmnGrid2Days: TcxGridDBColumn
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 94
          DataBinding.FieldName = 'NUM_DAYS'
        end
        object cmnGrid2Summa: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 93
          DataBinding.FieldName = 'SUMMA_N_KOEFF'
        end
        object cmnGrid2Koeff: TcxGridDBColumn
          Caption = #1050#1086#1077#1092#1110#1094#1110#1077#1085#1090
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 70
          DataBinding.FieldName = 'KOEFF'
        end
        object cmnGrid2AvgSum: TcxGridDBColumn
          Caption = #1057#1091#1084#1072' '#1076#1083#1103' '#1089#1077#1088#1077#1076#1085#1100#1086#1075#1086
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 116
          DataBinding.FieldName = 'AVG_SUMMA'
        end
      end
      object HospitalTableView: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'TOTAL_SUM'
            Column = HospitalDateBegColumn
          end
          item
            Kind = skSum
            FieldName = 'TOTAL_DAYS'
          end
          item
            Kind = skSum
            FieldName = 'TOTAL_HOURS'
          end
          item
            Column = HospitalTotalDaysColumn
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.Editing = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object HospitalDateBegColumn: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_BEG'
        end
        object HospitalTotalDaysColumn: TcxGridDBColumn
          Width = 100
          DataBinding.FieldName = 'TOTAL_DAYS'
        end
        object HospitalTotalSumColumn: TcxGridDBColumn
          DataBinding.FieldName = 'TOTAL_SUM'
        end
        object HospitalTotalHoursColumn: TcxGridDBColumn
          DataBinding.FieldName = 'TOTAL_HOURS'
        end
      end
      object Grid2Level: TcxGridLevel
        GridView = Grid2DBTableView
      end
    end
  end
  object Grid3: TcxGrid
    Left = 465
    Top = 46
    Width = 314
    Height = 335
    Align = alClient
    TabOrder = 1
    object Grid3DBTableView: TcxGridDBTableView
      DataController.DataSource = DSource3
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00;-0.00'
          Kind = skSum
          FieldName = 'SUMMA_FOR_COUNT'
          Column = cmnGrid3SummaForCount
        end
        item
          Format = '0.00;-0.00'
          Kind = skSum
          FieldName = 'SUMMA'
          Column = cmnGrid3Summa
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.OnAfterSummary = Grid2DBTableViewDataControllerSummaryAfterSummary
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cmnGrid3VO: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 54
        DataBinding.FieldName = 'KOD_VIDOPL'
      end
      object cmnGrid3VoName: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 208
        DataBinding.FieldName = 'NAME_VIDOPL'
      end
      object cmnGrid3KodSmeta: TcxGridDBColumn
        Caption = #1057#1084#1077#1090#1072
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 56
        DataBinding.FieldName = 'KOD_SMETA'
      end
      object cmnGrid3Summa: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 92
        DataBinding.FieldName = 'SUMMA'
      end
      object cmnGrid3SummaForCount: TcxGridDBColumn
        Caption = #1057#1091#1084#1072' '#1076#1083#1103' '#1089#1077#1088#1077#1076#1085#1100#1086#1075#1086
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 97
        DataBinding.FieldName = 'SUMMA_FOR_COUNT'
      end
    end
    object cxGridDBTableView2: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'TOTAL_SUM'
          Column = cxGridDBColumn6
        end
        item
          Kind = skSum
          FieldName = 'TOTAL_DAYS'
        end
        item
          Kind = skSum
          FieldName = 'TOTAL_HOURS'
        end
        item
          Column = cxGridDBColumn7
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGridDBColumn6: TcxGridDBColumn
        DataBinding.FieldName = 'DATE_BEG'
      end
      object cxGridDBColumn7: TcxGridDBColumn
        Width = 100
        DataBinding.FieldName = 'TOTAL_DAYS'
      end
      object cxGridDBColumn8: TcxGridDBColumn
        DataBinding.FieldName = 'TOTAL_SUM'
      end
      object cxGridDBColumn9: TcxGridDBColumn
        DataBinding.FieldName = 'TOTAL_HOURS'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = Grid3DBTableView
    end
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
  object DSet3: TpFIBDataSet
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
    DataSource = DSource2
    Left = 32
    Top = 161
    poSQLINT64ToBCD = True
  end
  object DSource3: TDataSource
    DataSet = DSet3
    Left = 64
    Top = 161
  end
  object pmGetAvgPopupMenu: TPopupMenu
    Left = 240
    Top = 72
    object N1: TMenuItem
      Caption = #1042#1074#1077#1089#1090#1080' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1084#1110#1089#1103#1094#1103
      OnClick = N1Click
    end
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 48
  end
  object dxBarManager1: TdxBarManager
    Scaled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        BorderStyle = bbsNone
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 404
        FloatTop = 343
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnPrint
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    ShowFullMenusAfterDelay = False
    ShowHint = False
    ShowHintForDisabledItems = False
    Style = bmsStandard
    UseSystemFont = True
    Left = 176
    Top = 72
    DockControlHeights = (
      0
      0
      46
      0)
    object btnPrint: TdxBarLargeButton
      Caption = #1044#1088#1091#1082
      Category = 0
      Hint = #1044#1088#1091#1082
      Visible = ivAlways
      OnClick = btnPrintClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A006C6A6A00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006C6A6A00B0ADAD00969293008E8A8B006C6A
        6A006C6A6A00817E7F006C6A6A00DDDCDC00D0CFCF006C6A6A006C6A6A006C6A
        6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A00D5D4D400C6C4C400A19F9F00A19F9F00A19F
        9F00838182005C5B5B00BCBCBC00CECECE00CFCFCF00D1D1D100D3D3D300CAC9
        C9006C6A6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006C6A6A00D8D7D700E0DEDE00C0BFBF00A19F9F00A19F9F00A19F
        9F00626060000000000000000000161616005D5D5D00A9A9A900CACACA00CACA
        CA00CACACA00CACACA00C1C0C0006C6A6A006C6A6A006C6A6A00FF00FF00FF00
        FF006C6A6A00D3D3D300D4D3D300CFCFCF008C8A8A00817F7F00817F7F00817F
        7F006C6A6A001414140008080800000000000000000000000000161616005D5D
        5D00A9A9A900CACACA00CACACA00B7B6B600B7B6B6006C6A6A00FF00FF006C6A
        6A00CACACA00CACACA00C6C6C6008E8C8C00B8B5B500B6B4B400A19F9F00A19F
        9F009F9D9D00999797009390910082808000525050002B2A2A00080808000000
        0000000000001616160064646400817E7F006C6A6A00FF00FF00FF00FF006C6A
        6A00CACACA00C5C5C5008E8C8C00D7D4D400F7F6F600F6F4F400F2F0F000E0DE
        DE00CAC7C700B6B5B500A5A3A300A19F9F00A19F9F009E9A9C00939091006865
        6600232223000303030019191900999797006C6A6A00FF00FF00FF00FF006C6A
        6A00C5C5C5008E8C8C00E7E6E600F7F6F600F7F6F600F6F4F400F2F0F000EEED
        ED00EAEAEA00E7E6E600E3E2E200D4D3D300C2C1C100AFADAD00A19F9F00A19F
        9F0099979700828080006C6A6A009F9D9D006C6A6A00FF00FF00FF00FF006C6A
        6A008E8C8C00EFEEEE00F7F6F600F7F6F600F7F6F600F6F4F400D5D3D400867B
        7E00958B8E00C1BFBF00DDDCDC00E0E0E000DCDCDC00D8D8D800D1D1D100C2C1
        C100B2B0B000A19F9F009C9999006C6A6A006C6A6A00FF00FF00FF00FF006C6A
        6A00CECBCC00F7F6F600F7F6F600F7F6F600F7F6F600CFCBCC00AFACAD00ADAB
        AB009E98980083797B0075696B0089808100ABA5A600C7C6C600D5D5D500D1D1
        D100CECECE00C9C7C700BBBABA00A6A4A4006C6A6A00FF00FF00FF00FF00FF00
        FF006C6A6A006C6A6A00CECBCC00EDEBEB00AFA4A5006B5D5F00766A6C008378
        7A009C969700ACAAAA00B2B0B000ABA7A9009891920081777800847A7D00938C
        8E00BFBFBF00CBCBCB00CACACA00C0C0C0006C6A6A00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006C6A6A006C6A6A00BD828100AF8A73007D5E51006654
        5600655457006D5E62006D5E620089808100A09A9C00AFACAD00B2B0B000A49F
        A000CAC9CA00CBCBCB00B7B6B6006C6A6A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD4AB00FFD0A100FFCB
        9800D5A57B00A1785C007B665F0060505300665659006F6265008E868700CECC
        CC00CFCFCF00A5A4A4006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFD9B200FFD4A900FFCF
        A000FFCA9700FFC68E00FFC18600FFBF8100FFC08400BD8281006C6A6A006C6A
        6A006C6A6A006C6A6A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100FFDDBA00FFD8B100FFD3
        A700FFCE9E00FFCA9600FFC58C00FFC08400FFC08400BD828100FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFE5CB00FFE1C200FFDCB800FFD7
        AF00FFD3A600FFCE9D00FFC99500FFC48B00BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEAD400FFE5CA00FFE0C000FFDA
        B700FFD7AD00FFD1A500FFCC9C00FFC79200BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD828100FFEEDC00FFE9D100FFE3C900FFE0
        BF00FFDAB600FFD5AC00FFD0A300F7C29700BD828100FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD828100FFF7EE00FFF2E300FFEDDA00FFE7D000FFE3
        C700FFDEBD00FFD9B400FFD4AB00BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100FFFAF300FFFAF300FFF6ED00FFF0E200FFEBD900FFE7
        CF00FFE2C500FFDDBC00F2C7A900BD828100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD828100BD828100BD828100BD828100FFF4EB00FFF0E100FFEB
        D700FFE6CE00FBDCC000BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD828100BD828100BD82
        8100BD828100BD828100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41372.461589571760000000
    ReportOptions.LastChange = 41372.466905254630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 72
    Top = 282
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 209.973333333333300000
      PaperHeight = 296.968333333333300000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxDSetGlobalData: TfrxDBDataset
    UserName = 'frxDSetGlobalData'
    CloseDataSource = False
    DataSet = DSetGlobalData
    Left = 106
    Top = 248
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDSet1'
    CloseDataSource = False
    DataSet = DSet1
    Left = 98
    Top = 98
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDSet2'
    CloseDataSource = False
    DataSet = DSet2
    Left = 98
    Top = 131
  end
  object DSetGlobalData: TpFIBDataSet
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
    Left = 32
    Top = 249
    poSQLINT64ToBCD = True
  end
  object frxUserDataSet: TfrxUserDataSet
    UserName = 'frxUserDataSet'
    Left = 106
    Top = 328
  end
end
