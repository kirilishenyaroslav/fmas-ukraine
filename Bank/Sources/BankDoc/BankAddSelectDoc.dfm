object fmBankAddSelectDoc: TfmBankAddSelectDoc
  Left = 352
  Top = 228
  Width = 952
  Height = 461
  Caption = 'fmBankAddSelectDoc'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 71
    Width = 936
    Height = 239
    Align = alClient
    TabOrder = 0
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      OnKeyDown = cxGrid1DBBandedTableView1KeyDown
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyleYellow
      Styles.Content = cxStyleYellow
      Styles.ContentEven = cxStyleYellow
      Styles.ContentOdd = cxStyleYellow
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyle17
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyleYellow
      Styles.Footer = cxStyleBorder
      Styles.Group = cxStyleYellow
      Styles.GroupByBox = cxStyleYellow
      Styles.Header = cxStyleBorder
      Styles.Indicator = cxStyleYellow
      Styles.NewItemRowInfoText = cxStyleYellow
      Styles.Preview = cxStyleYellow
      Styles.BandBackground = cxStyleYellow
      Styles.BandHeader = cxStyleBorder
      Bands = <
        item
          Width = 467
        end
        item
          Width = 413
        end
        item
          Width = 54
        end>
      object cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 110
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'NUMBER_DOC'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
        SortOrder = soAscending
        Width = 97
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'DATE_DOC'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
        Width = 260
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'FULL_NAME_CUST'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 106
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'PRIHOD'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 112
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'RASHOD'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'ADD_HAND'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'OBRABOTAN'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxImageProperties'
        Visible = False
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = cxGrid1DBBandedTableView1DBBandedColumn9CustomDrawCell
        Width = 54
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn
        Caption = #1087#1088#1080#1073#1091#1090#1086#1082'('#1074#1072#1083#1102#1090#1072')'
        Width = 103
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'prihod_valuta'
      end
      object cxGrid1DBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn
        Caption = #1074#1080#1076#1072#1090#1086#1082'('#1074#1072#1083#1102#1090#1072')'
        Width = 92
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'rashod_valuta'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 310
    Width = 936
    Height = 113
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      936
      113)
    object cxLabel14: TcxLabel
      Left = 213
      Top = 1
      Width = 297
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxLabel13: TcxLabel
      Left = 5
      Top = 0
      Width = 204
      Height = 17
      AutoSize = False
      TabOrder = 1
    end
    object cxLabel15: TcxLabel
      Left = 5
      Top = 16
      Width = 81
      Height = 17
      AutoSize = False
      TabOrder = 2
    end
    object cxLabel17: TcxLabel
      Left = 5
      Top = 32
      Width = 73
      Height = 17
      AutoSize = False
      TabOrder = 3
    end
    object cxLabel23: TcxLabel
      Left = 5
      Top = 51
      Width = 81
      Height = 17
      AutoSize = False
      TabOrder = 4
    end
    object cxLabel16: TcxLabel
      Left = 85
      Top = 16
      Width = 601
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object cxLabel18: TcxLabel
      Left = 85
      Top = 32
      Width = 129
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object cxLabel19: TcxLabel
      Left = 221
      Top = 31
      Width = 57
      Height = 17
      TabOrder = 7
    end
    object cxLabel20: TcxLabel
      Left = 293
      Top = 31
      Width = 137
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
    end
    object cxLabel21: TcxLabel
      Left = 445
      Top = 32
      Width = 57
      Height = 17
      TabOrder = 9
    end
    object cxLabel22: TcxLabel
      Left = 515
      Top = 32
      Width = 201
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 10
    end
    object cxLabel24: TcxMemo
      Left = 88
      Top = 49
      Width = 850
      Height = 40
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentColor = True
      ParentFont = False
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 11
    end
    object cxTextEdit1: TcxTextEdit
      Left = 194
      Top = 90
      Width = 331
      Height = 21
      ParentColor = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 12
      OnKeyDown = cxTextEdit1KeyDown
    end
    object cxLabel2: TcxLabel
      Left = 0
      Top = 91
      Width = 193
      Height = 17
      AutoSize = False
      TabOrder = 13
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
    end
    object Panel3: TPanel
      Left = 256
      Top = 49
      Width = 417
      Height = 57
      Color = 15716280
      TabOrder = 14
      Visible = False
      object ProgressBar: TGauge
        Left = 9
        Top = 32
        Width = 399
        Height = 18
        BackColor = 15204351
        Color = clMaroon
        ForeColor = clBackground
        ParentColor = False
        Progress = 0
      end
      object cxLabel26: TcxLabel
        Left = 8
        Top = 9
        Width = 129
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        Caption = #1054#1073#1088#1086#1073#1082#1072' '#1087#1083#1072#1090#1077#1078#1091
      end
      object cxLabel28: TcxLabel
        Left = 195
        Top = 9
        Width = 31
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
        Caption = #1110#1079
      end
      object cxLabel27: TcxLabel
        Left = 132
        Top = 9
        Width = 53
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
        Caption = ''
      end
      object cxLabel29: TcxLabel
        Left = 221
        Top = 9
        Width = 121
        Height = 17
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
        Caption = ''
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 42
    Width = 936
    Height = 29
    Align = alTop
    TabOrder = 6
    object cxCheckBox1: TcxCheckBox
      Left = 5
      Top = 5
      Width = 268
      Height = 21
      TabStop = False
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
      OnClick = cxCheckBox1Click
    end
    object cxLabel1: TcxLabel
      Left = 278
      Top = 5
      Width = 139
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxCheckBox2: TcxCheckBox
      Left = 585
      Top = 5
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = ''
      TabOrder = 2
      OnClick = cxCheckBox2Click
    end
  end
  object DataSetSelectDoc: TpFIBDataSet
    Database = fmBankDocMainForm.Database
    Transaction = fmBankDocMainForm.Transaction
    SelectSQL.Strings = (
      
        'SELECT * FROM BANK_SELECT_ALL_DOC_FROM_DAY_NE('#39'01.01.2005'#39',1,1, ' +
        '0)')
    AfterScroll = DataSetSelectDocAfterScroll
    Left = 80
    Top = 160
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = DataSetSelectDoc
    Left = 160
    Top = 160
  end
  object StyleRepository: TcxStyleRepository
    Left = 112
    Top = 280
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 16776176
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object ActionList1: TActionList
    Left = 360
    Top = 168
    object ActionClose: TAction
      Caption = 'ActionClose'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionTake: TAction
      Caption = 'ActionTake'
      OnExecute = ActionTakeExecute
    end
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 45
      OnExecute = ActionAddExecute
    end
    object ActionChange: TAction
      Caption = 'ActionChange'
      ShortCut = 113
      OnExecute = ActionChangeExecute
    end
    object ActionDel: TAction
      Caption = 'ActionDel'
      ShortCut = 46
      OnExecute = ActionDelExecute
    end
    object ActionRefresh: TAction
      Caption = 'ActionRefresh'
      ShortCut = 116
      OnExecute = ActionRefreshExecute
    end
    object ActionView: TAction
      Caption = 'ActionView'
      ShortCut = 114
      OnExecute = ActionViewExecute
    end
    object ActionDelPl: TAction
      Caption = 'ActionDelPl'
      OnExecute = ActionDelPlExecute
    end
    object ActionOtmDel: TAction
      Caption = 'ActionOtmDel'
      OnExecute = ActionOtmDelExecute
    end
    object ActionCtrlF: TAction
      Caption = 'ActionCtrlF'
      ShortCut = 16454
      OnExecute = ActionCtrlFExecute
    end
    object ActionShow_info: TAction
      Caption = 'ActionShow_info'
      ShortCut = 57431
      OnExecute = ActionShow_infoExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 57421
      OnExecute = Action1Execute
    end
    object ActionClon: TAction
      Caption = 'ActionClon'
      ImageIndex = 8
      ShortCut = 8237
      OnExecute = ActionClonExecute
    end
    object ActionAllDel: TAction
      Caption = 'ActionAllDel'
      OnExecute = ActionAllDelExecute
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = dxBarLargeButton3
            Visible = True
          end
          item
            Item = dxBarLargeButton6
            Visible = True
          end
          item
            Item = dxBarLargeButton4
            Visible = True
          end
          item
            Item = dxBarLargeButton9
            Visible = True
          end
          item
            Item = dxBarLargeButton5
            Visible = True
          end
          item
            Item = dxBarLargeButton7
            Visible = True
          end
          item
            Item = dxBarLargeButton8
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        ShowMark = False
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
    HotImages = ImageList1
    Images = ImageList1
    DisabledImages = ImageList1
    DisabledLargeImages = ImageList1
    LargeImages = ImageList1
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    Left = 376
    Top = 56
    DockControlHeights = (
      0
      0
      42
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = ActionAdd
      Category = 0
      AutoGrayScale = False
      HotImageIndex = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = ActionChange
      Category = 0
      AutoGrayScale = False
      HotImageIndex = 1
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = ActionDel
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu2
      AutoGrayScale = False
      HotImageIndex = 2
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = ActionTake
      Category = 0
      AutoGrayScale = False
      HotImageIndex = 4
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = ActionClose
      Category = 0
      AutoGrayScale = False
      HotImageIndex = 5
    end
    object dxBarLargeButton6: TdxBarLargeButton
      Action = ActionRefresh
      Category = 0
      AutoGrayScale = False
      HotImageIndex = 3
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Action = ActionDelPl
      Category = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0286BD30A4D745B0E13AAADA26
        9ED134A6D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        038AC0058FC465C5ED89D5FE7FCFFA7ACEF862BFEA58BBE92FA4D7FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0892C70E9ACC69CCE989DAFA7ACFF768
        C2EE3FA9D776CBF482D1FA5BBCEBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        109ACC1AA4D47BD5EA9DE9F88BE0FC499EC42083AF54B7E57DCFFA82D1FA1F9D
        CFFF00FFFF00FFFF00FFFF00FFFF00FF19A1D328ACDC9DDDEDC1F6FCA3F0FF69
        BAD416658A4EABD77BD0FB7DCFF81E9CCEFF00FFFF00FFFF00FFFF00FFFF00FF
        23A9DA2FB0E1B5E1F0E6F8FCBBF2FA9FE6F24893AD72C1E181D5FE7BCCF81E9C
        CEFF00FFFF00FFFF00FFFF00FFFF00FF1A9FD02CB0D943AFD051B8D747B8D945
        B7D953C1E06CCCE986D9F78BD8FE1F9DCFFF00FFFF00FFFF00FFFF00FFFF00FF
        189DCC3EBFDC28A5CB2DACD02DB1D521A4CE31B1D950C1E382D8F66CC7F01395
        C7FF00FFFF00FFFF00FFFF00FFFF00FF169DCB41BDD50483B425A3C470F2FA3B
        CBE613A3CF0186BB1396C538AFD70F91C5FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF047BB00078AD1B99C16DEBF65FE6F62EB1D1047EAF0786B40D93C2FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0481B60C83B2FF00FF23
        ADD71091BF037DAF057EB1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF35B2DE1786B6FF00FFFF00FFFF00FF037BAD0470A1FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2490B65CD4E92695B8FF
        00FF0970A30486B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF31A1BF60D7E650C4DE31AAD70B80B2FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      AutoGrayScale = False
      HotImageIndex = 7
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Action = ActionOtmDel
      Category = 0
      AutoGrayScale = False
      HotImageIndex = 6
    end
    object dxBarLargeButton9: TdxBarLargeButton
      Action = ActionClon
      Category = 0
      AutoGrayScale = False
    end
    object dxBarLargeButton10: TdxBarLargeButton
      Action = ActionAllDel
      Category = 0
    end
  end
  object ImageList1: TImageList
    Left = 240
    Top = 144
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB30069473100694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FFFFFF00B7A29300B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FBF9F800FBF9F800F8F5
      F300F4F0ED00F2ECE800EEE7E200ECE3DE00E9DFD800E6DBD300E3D6CE00E0D2
      C900DCCDC300DCCDC300B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FEFDFD00D8984000D898
      4000D89840001C1C1C009860600098606000EDE4DF00EAE0DA00E7DBD500E4D7
      D000E0D2CA00E0D2CA00B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FEFEFE00FEFEFE00FEFD
      FD00FBFAF900C89898001C1C1C000098C8001C1C1C00EDE4E000EAE0DA00E7DC
      D600E3D6CF00E3D6CF00B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FFFFFF00D8984000D898
      4000D8984000C89898000098C8004ABEDF000098C8001C1C1C00D8984000D898
      4000D8984000E7DCD500B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FFFFFF00FFFFFF00FFFF
      FF00FEFEFE00FEFEFD000098C80094E4F6004ABEDF000098C8001C1C1C00EDE4
      E000EAE0DA00EAE0DA00B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FFFFFF00D8984000D898
      4000D8984000D8984000D89840000098C80094E4F6004ABEDF000098C8001C1C
      1C00D8984000EEE6E100B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE000098C80094E4F6004ABEDF000098
      C8001C1C1C00F0E9E500B7A29300694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDBEB300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000098C80094E4F6004ABE
      DF008080800000009A00F0E9E500694731000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8800000D8800000D8800000D880
      0000D8800000D8800000D8800000D8800000D8800000D88000000098C800D2BA
      AC00778C980000009A0000009A00D88000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8980000F8C89000F8980000F898
      0000F8980000F8980000F8980000F8980000F8980000F8980000F89800000030
      F8006D8AFD000030F80000009A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8980000F8C89000F8C89000F8C8
      9000F8C89000F8C89000F8980000000000000000000000000000000000000000
      00000030F8000030F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8980000F8980000F898
      0000F8980000F898000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000084
      BD0031A5D60042B5E70039ADDE00219CD60031A5DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000844A4A00844A4A00A54A4A00AD4A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000008CC600008C
      C60063C6EF008CD6FF007BCEFF007BCEFF0063BDEF005ABDEF0029A5D6000000
      0000000000000000000000000000000000000000000000000000000000000084
      BD0031A5D60042B5E70039ADDE00219CD60031A5DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00844A
      4A00B54A5200C64A5200C64A4A00B54A4A004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A000000000000000000000000000894C600089C
      CE006BCEEF008CDEFF007BCEF7006BC6EF0039ADD60073CEF70084D6FF005ABD
      EF00000000000000000000000000000000000000000000000000008CC600008C
      C60063C6EF008CD6FF007BCEFF007BCEFF0063BDEF005ABDEF0029A5D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00D65A
      5A00CE525200CE525200CE525200B54A52004A181800FF8C8C00FF9C9C00FFAD
      AD00F7B5B500F7B5B500844A4A00000000000000000000000000109CCE0018A5
      D6007BD6EF009CEFFF008CE7FF004A9CC6002184AD0052B5E7007BCEFF0084D6
      FF00189CCE0000000000000000000000000000000000000000000894C600089C
      CE006BCEEF008CDEFF007BCEF7006BC6EF0039ADD60073CEF70084D6FF005ABD
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00D65A
      5A00D65A5A00CE5A5A00CE525A00BD5252004A18180021B54A0010C64A0010BD
      4A0008BD4200F7B5B500844A4A0000000000000000000000000018A5D60029AD
      DE009CDEEF00C6F7FF00A5F7FF006BBDD60010638C004AADD6007BD6FF007BCE
      FF00189CCE000000000000000000000000000000000000000000109CCE0018A5
      D6007BD6EF009CEFFF008CE7FF004A9CC6002184AD0052B5E7007BCEFF0084D6
      FF00189CCE000000000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF00008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00DE63
      6300D65A6300D65A5A00D65A5A00C6525A004A18180029B54A0018BD4A0018BD
      4A0010BD4200F7B5B500844A4A0000000000000000000000000021ADDE0029B5
      E700B5E7F700E7FFFF00BDF7FF009CE7F7004A94AD0073C6E70084D6FF007BCE
      FF00189CCE00000000000000000000000000000000000000000018A5D60029AD
      DE009CDEEF00C6F7FF00A5F7FF006BBDD60010638C004AADD6007BD6FF007BCE
      FF00189CCE000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000844A4A00E76B
      6B00DE636300DE636300DE636300C65A5A004A18180021B54A0010BD4A0018BD
      4A0010BD4200F7B5B500844A4A00000000000000000000000000189CD60029B5
      DE0042ADD60052BDD60042BDDE0042B5DE0052C6E7006BCEEF0084DEF7008CDE
      FF00189CCE00000000000000000000000000000000000000000021ADDE0029B5
      E700B5E7F700E7FFFF00BDF7FF009CE7F7004A94AD0073C6E70084D6FF007BCE
      FF00189CCE0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00848484008484840000FFFF0000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000844A4A00EF6B
      6B00E7636B00E77B7B00FFD6D600CE6B73004A181800A5DE940052D66B0042CE
      630029C65A00F7B5B500844A4A00000000000000000000000000109CCE005AD6
      E70018738C0021849C004ADEEF0029BDE70010A5CE000894C600189CCE005AC6
      E700219CCE000000000000000000000000000000000000000000189CD60029B5
      DE0042ADD60052BDD60042BDDE0042B5DE0052C6E7006BCEEF0084DEF7008CDE
      FF00189CCE0000000000000000000000000000000000000000008484840000FF
      FF008484840000000000000000008484840000FFFF0000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000844A4A00F773
      7300EF6B6B00EF848400FFD6D600CE6B73004A181800FFF7CE00FFFFD600FFFF
      D600E7FFC600F7B5B500844A4A0000000000000000000000000000000000189C
      CE0031ADC6005ACEDE0084FFFF0063EFFF0031C6DE00008CBD00007BB500088C
      C600088CC6000000000000000000000000000000000000000000189CCE0039BD
      DE0029A5CE0029ADD60029B5D60021A5CE0031B5DE0052C6E70084DEF7006BC6
      F7001094C6000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000844A4A00FF7B
      7B00F7737300EF737300F7737300D66363004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      0000000000000000000039C6E70031BDDE0029B5D6000084B5000084B500008C
      C600008CC6000000000000000000000000000000000000000000109CCE0042BD
      D6000084B50021A5C60073F7FF0039CEE70010A5CE000084BD001094C60039AD
      D6000894C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000844A4A00FF7B
      8400F77B7B00F77B7B00F7737B00D66B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084B500007BAD000000
      000000000000000000000000000000000000000000000000000000000000007B
      B500007BAD00189CC6006BEFF7005AE7F70029B5D600007BAD000084B5000894
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000000000000844A4A00FF84
      8400FF7B8400FF7B7B00FF7B8400DE6B6B004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      00000073A500006B9C000000000000000000000000000084B500007BAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000084B5000884B5000000000021ADD6001094BD00007BAD00007BB5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF000000000000000000000000000000000000000000844A4A00FF8C
      8C00FF848400FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      D600FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      0000189CCE00088CBD000000000000000000000000000084BD00007BAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000031B5DE001084B500000000000000000000000000007BAD000073A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000844A4A00844A
      4A00E7737300FF848400FF848400E77373004A181800FFEFC600FFFFD600FFFF
      CE00FFFFD600F7B5B500844A4A00000000000000000000000000000000000000
      000031A5CE004AC6E7000000000000000000000000000084B500007BAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002194B5005AD6EF002194BD00000000000873A5000084BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000844A4A009C525200CE6B6B00CE6B6B004A181800844A4A00844A4A00844A
      4A00844A4A00844A4A00844A4A00000000000000000000000000000000000000
      00000000000042B5CE005AD6E70031A5C600219CC6000894C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031A5BD0063D6E70052C6DE0031ADD6000884B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000844A4A00844A4A004A18180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000039ADC60039ADCE0031A5CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A00000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A0000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000094736B00B58C7B00B584
      7B00B5847B00B5847B00B5847B00B5847B00B5847B00B5847B00AD847B00AD84
      7B00B5848400B58C7B00845A5200000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A00000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A0000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A000000000000000000B5948C00F7DECE00FFDE
      C600FFDEC600FFDEC600FFD6BD00FFD6BD00FFD6B500FFD6B500F7CEB500F7CE
      AD00F7CEAD00FFCEAD009C736B00000000000000000000000000000000000000
      0000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A00000000000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A0000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A000000000000000000B5949400EFEFD600FFF7
      D600E7E7BD00E7E7BD00FFEFD600F7E7B500EFE7AD00FFDEB500FFDEAD00FFD6
      A500F7D6A500FFDEB500A573730000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B6300000000000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A0000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A000000000000000000BD9C9400EFEFE700FFFF
      EF00ADD68C00009C0000009C0000009C0000009C000000940000219C2100D6CE
      9C00FFD6AD00FFD6BD009C73730000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B00000000000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A000000000000000000C6A59C00EFF7EF00FFFF
      F700ADDE9C0000940000009C000010A510009CCE9400ADC6940029AD21005AB5
      4A00F7DEB500FFDEC6009C73730000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004A844A004A844A004A84
      4A004A844A00A57B7300000000000000000000000000FFF7E70042424200FFD6
      A50042424200FFD6A50018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      63000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000C6A5A500EFF7EF00FFFF
      F700B5DEA500009C000008A5080018A5180052B54200F7E7C600F7E7C6005AB5
      5A00DED69C00FFDEC600A57B730000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004A844A0052AD520052AD
      52004A844A00A57B7300000000000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001818180018181800F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000CEADA500F7FFF700F7F7
      E700DEEFCE00FFF7E700F7F7DE00FFF7DE00FFE7CE00FFEFDE00FFEFDE00F7E7
      CE00F7DEB500FFDEC600AD7B730000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A004A844A004A844A0052AD520052AD
      52004A844A004A844A004A844A000000000000000000FFF7EF00F7E7CE00F7DE
      C600181818001818180018181800F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000006B6B
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B000000000000000000D6B5A500F7FFFF00E7F7
      E7008CD68C00EFF7DE00FFFFFF00C6DEAD004AB5390052B542004AB53900C6D6
      9C00FFEFD600FFE7CE00AD7B730000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A0052AD520052AD520052AD520052AD
      520052AD520052AD52004A844A000000000000000000FFFFF700FFD6A5001818
      18008484840000FFFF0018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B0000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000D6B5A500F7FFFF00FFFF
      FF008CCE94004ABD5200E7EFDE00FFFFEF0063BD63000094000000940000ADD6
      8C00FFEFDE00FFDECE00AD7B730000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004A844A006BCE84006BCE84006BCE840052AD
      520052AD520052AD52004A844A000000000000000000FFFFF700FFE7D6001818
      1800C6C6C60000FFFF0018181800FFE7D6000000000000000000000000009C6B
      6B0000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B000000000000000000DEBDA500F7FFFF00FFFF
      FF00EFF7E70039AD310018A518005AC65A0031AD3100009C000000940000ADD6
      8C00FFF7E700FFDECE00AD847B0000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004A844A004A844A004A844A006BCE840052AD
      52004A844A004A844A004A844A000000000000000000FFFFFF00181818008484
      840000FFFF0018181800FFFFF700FFFFF70000000000FFFFFF00C68C7B00CED6
      D60000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B000000000000000000E7C6A500F7FFFF00FFFF
      FF00FFFFFF00C6EFCE0021AD2100009400000094000010A51000089C1000A5CE
      8C00FFCEC600FFADA500AD7B730000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004A844A006BCE840052AD
      52004A844A00000000000000000000000000000000004242420084848400C6C6
      C60000FFFF0018181800FFFFFF00FFFFFF0000000000C68C7B00CED6D600CED6
      D60000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B00000000000000000000000000E7CEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      9400D6945200C69C7B00C6ADA50000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004A844A004A844A004A84
      4A004A844A0000000000000000000000000000000000181818001818180000FF
      FF001818180000000000000000000000000000000000CED6D600CED6D600CED6
      D6000000000000000000000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B0000000000000000000000000000000000EFCEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00F7FFFF00F7FFFF00C6AD
      9C00D69C7300DECEB5000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000001818180000008400000084001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D60000000000000000000000000000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C000000000000000000000000000000000000000000E7C69C00E7C6A500E7C6
      A500E7C6A500E7C6A500E7C6A500E7C6A500DEC6A500DEC6A500DEC6A500C69C
      8400DECEBD00000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      000000000000000000000000000000000000CED6D60018181800181818001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000100000000000001F3000000000000
      83FF000000000000FFFF000000000000FFFFFE7FE07FFFFFFFFFF07FC01FE07F
      FFFFC001C00FC01FFDFFC001C007C00FF8FFC001C007C007F07FC001C007C007
      E03FC001C007C007C01FC001C007C007C60FC001E007C007EF07C001FC07C007
      FF83C001FF9FE00FFFC3C001F39FF21FFFE3C001F39FF39FFFF7C001F39FF13F
      FFFFF001F83FF83FFFFFFC7FFC7FFFFFF003800FFFFFFFFFF003800FE0018001
      F003800FE0018001F003800FE00180010003800FE00180010003800FC0018001
      0003800FC00180010003800FE00180010001800FE00180010001800FE0018001
      000180EFE00180010001808FE00180010007808FE00380010007878FC0078003
      007F000F800F800700FF000FFF9FFFFF00000000000000000000000000000000
      000000000000}
  end
  object Class_StoredProc: TpFIBStoredProc
    Database = fmBankDocMainForm.Database
    Transaction = fmBankDocMainForm.Transaction
    Left = 480
    Top = 176
  end
  object TransactionWr: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 576
    Top = 192
  end
  object ImageList2: TImageList
    Left = 304
    Top = 232
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
      000000000000000000000000000000000000000000000000000094635A009C6B
      63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B
      63009C6B63009C6B63009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7C69400F7C69400F7C69400F7C69400F7C69400F7C69400F7C694000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B5A00F7E7
      BD00F7DEBD00F7DEB500F7D6AD00F7D6A500F7D6A500F7D69C00EFCE9C00EFCE
      9400EFCE9400EFC68C009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7C6
      9400FFF7D600FFFFDE00FFF7CE00F7E7C600FFE7C600F7DEB500FFD6AD00F7C6
      9400000000000000000000000000000000000000000000000000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B0000000000000000000000000000000000009C6B6300F7E7
      C600F7E7C600F7DEBD00F7DEB50000840000F7D6AD00F7D6A500F7CE9C00EFCE
      9C00EFCE9400EFCE94009C6B6300000000000000000000000000000000000000
      0000000000000063000000630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7C69400FFFF
      DE00FFFFE700FFFFDE00FFFFDE00B5D6940042AD3100089C080042A52100EFD6
      AD00F7C6940000000000000000000000000000000000CE6B0000FFF7E700FFE7
      CE00FFE7CE00FFE7C600FFE7BD00FFDEB500FFDEB500FFDEAD00FFD6AD00FFD6
      A500FFD6A500FFDEB500CE6B0000000000000000000000000000A56B6300F7E7
      CE00F7E7C600F7E7C600008400000084000000840000F7D6AD00F7D6A500EFD6
      9C00EFCE9C00EFCE94009C6B6300000000000000000000000000000000000000
      00000063000018B5310018B53100006300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7C69400FFFF
      DE00FFFFE700FFFFE700FFFFEF00ADD69400008C000031A5210039A5290073C6
      6300FFE7C60000000000000000000000000000000000CE6B0000FFEFDE00FFE7
      C600FFDEBD00FFDEBD00FFDEB500FFD6AD00FFD6A500FFD6AD00FFD6AD00FFD6
      9C00FFCE9C00FFD6A500CE6B0000000000000000000000000000A5736300FFEF
      D600F7E7CE0000840000317B29005A944A0000840000528C3900F7D6AD00F7D6
      A500F7D6A500EFCE9C009C6B6300000000000000000000000000000000000063
      000031C64A0021B5390018B5290021B531000063000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7B57300FFC6
      8C00FFE7B500FFF7CE00FFFFDE00BDDE9C0031A521006BBD5200FFFFF70084C6
      7300FFE7C600F7C69400000000000000000000000000CE6B0000FFF7E700FFEF
      D600D6947300C66B2900CE6B2100C66B3100BD6B2900C6632100D6844A00F7C6
      9400FFD6A500FFD6A500CE6B0000000000000000000000000000AD736300FFEF
      DE00FFEFD60000840000EFE7C600F7E7C600A5BD84000084000000840000EFD6
      AD00F7D6A500F7D6A5009C6B63000000000000000000000000000063000042D6
      6B0039CE5A0021AD39000063000018AD290018B5310000630000000000000000
      00000000000000000000000000000000000000000000F7BD8400F7B57300FFBD
      7B00FFC68400FFD69C00FFE7C60084C66B00FFF7DE008CC66B004AB5420063BD
      5200FFF7DE00F7C69400000000000000000000000000CE6B0000FFF7EF00FFEF
      DE00F7D6B500D6732100D65A0000D68C5200E7B58C00BD5A1000BD420000CE7B
      3900FFD6A500FFD6AD00CE6B0000000000000000000000000000B57B6300FFF7
      E700FFEFDE00FFEFD600FFEFD600F7E7CE00F7E7C600E7DEB500008400000084
      0000F7D6AD00F7D6A5009C6B63000000000000000000006300004AD67B0052DE
      7B0031B54A00006300000000000000630000109C210018AD3100006300000000
      00000000000000000000000000000000000000000000F7BD8400F7B57300FFBD
      8400FFC68C00FFD69C00FFE7C6005AAD42007BC66B00A5D69400008C000021A5
      2100FFFFEF00F7C69400000000000000000000000000CE6B0000FFFFF700FFF7
      DE00F7DEC600DE843100DE6B0800E7A57300FFEFD600D6844A00C64A0000C65A
      1000FFD6AD00FFDEB500CE6B0000000000000000000000000000B57B6300FFF7
      E700FFF7E700FFEFDE00FFEFDE00F7EFD600FFE7CE00F7E7C600F7E7C600F7DE
      BD00F7DEB500F7D6AD009C6B63000000000000000000000000000063000042C6
      630000630000000000000000000000000000000000000063000018AD29000063
      00000000000000000000000000000000000000000000F7B57B00F7BD7300FFBD
      8400FFCE8C00FFD69C00FFE7C600D6DEAD00009C0000009400000094000021A5
      2100FFFFF700F7C68400000000000000000000000000CE6B0000FFFFFF00FFF7
      E700F7DECE00DE843900E7731000D6945A00E7B58C00CE6B2100C6520000D684
      4200FFDEB500FFDEB500CE6B0000000000000000000000000000BD846300FFF7
      EF00D6842100D6842100D6842100D6842100D6842100D6842100D6842100D684
      2100D6842100F7DEB5009C6B6300000000000000000000000000000000000063
      000000000000000000000000000000000000000000000000000000630000109C
      210000630000000000000000000000000000F7BD8400F7BD7B00F7B57300FFBD
      7B00F7C68C00FFCE9400FFD6A500FFE7BD00CECE940073AD4A00A5CE7B00ADD6
      9400FFFFE700F7C68400F7C68C000000000000000000CE6B0000FFFFFF00FFF7
      EF00F7DECE00E78C4200EF841800C66B3100C66B2900C6520800C6733900F7D6
      AD00FFDEB500FFDEBD00CE6B0000000000000000000000000000C6846300FFFF
      F700FFF7EF00FFF7EF00FFF7E700FFEFDE00FFEFDE00FFEFD600FFE7CE00F7E7
      C600F7E7C600F7DEBD009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000630000006300000000000000000000F7BD8400F7BD7B00F7CE9400F7CE
      9400F7CE9400EFC68400EFC68400EFC68400F7CE9400F7CE9C00FFDEBD00FFDE
      AD00F7D6A500F7DEB500F7C68C000000000000000000CE6B0000FFFFFF00FFFF
      F700F7E7D600E7944200EF8C2100DEA57300E7BD9C00D6732100CE6B1800E7AD
      7B00FFE7BD00FFE7C600CE6B0000000000000000000000000000C6846300FFFF
      FF00FFFFF700FFF7EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFD600F7EF
      CE00F7E7CE00F7E7C6009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006300000063000000000000F7C68C00F7CE9400F7BD7B00EFAD
      6B00EFB57300F7BD8400F7CE9C00F7DEAD00FFEFC600FFFFDE00FFFFDE00FFFF
      DE00FFEFC600F7D69C00F7C68C000000000000000000CE6B0000FFFFFF00FFFF
      F700F7EFE700E79C5200F7942900E7B58C00FFEFDE00DE843900DE6B0800DE94
      5A00FFE7C600FFE7C600CE6B0000000000000000000000000000CE8C6300FFFF
      FF00D6842100D6842100D6842100D6842100D6842100D6842100D6842100D684
      2100D6842100F7E7CE009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7CE9400EFAD6B00EFAD6B00EFAD
      6B00EFB57300F7C68C00F7CE9C00F7DEAD00FFEFC600FFFFDE00FFFFDE00FFFF
      DE00FFFFE700FFFFDE00F7C684000000000000000000CE6B0000FFFFFF00FFFF
      FF00E7C6AD00D6843100EF8C2100CE845200CE845200DE731800D67B2900EFBD
      9C00FFE7CE00FFE7CE00CE6B0000000000000000000000000000CE8C6B00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7E700FFF7E700FFEF
      DE00FFEFD600FFEFD6009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7BD8400EFAD6B00EFAD6B00EFAD
      6B00EFB57B00F7C68C00F7CE9C00FFDEB500FFEFC600FFFFDE00FFFFDE00FFFF
      DE00FFFFDE00FFFFE700F7C684000000000000000000CE6B0000FFFFFF00FFFF
      FF00DEB5A500E7AD8400EFBD8C00E7AD8400E7A57300E7B58400EFCEB500FFEF
      D600FFE7CE00FFEFD600CE6B0000000000000000000000000000CE8C6B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7EF00FFF7
      E700FFEFDE00FFEFDE009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7CE9400EFB57B00EFAD6B00EFAD
      6B00EFB57B00F7C68C00F7D69C00FFDEB500FFEFCE00FFFFDE00FFFFE700FFFF
      E700FFFFDE00FFEFBD00F7C684000000000000000000CE6B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      E700FFF7E700FFF7EF00CE6B0000000000000000000000000000CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7C68400F7C68400EFB5
      7300F7BD7B00F7C68C00F7D6A500FFE7BD00FFF7CE00FFFFD600FFF7CE00FFEF
      C600F7D69C00F7C6840000000000000000000000000000000000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7C6
      8400F7C68400F7C68400F7C68400F7C68400F7C68400F7C68400F7C68400F7C6
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000639400006394000063
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B00000000000000000000006B94008CC6DE00CEFFFF007BDE
      F700086B9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6B0000006B000000000000000000000000000000000000000000000000000000
      6B0000006B0000000000000000000000000000000000CE6B0000FFF7E700FFE7
      CE00FFE7CE00FFE7C600FFE7BD00FFDEB500FFDEB500FFDEAD00FFD6AD00FFD6
      A500FFD6A500FFDEB500CE6B0000000000000063940042ADD6008CC6D6009CFF
      FF0052C6E7000063940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000942900009429000094290000000000000000
      000000000000000000000000000000000000000000000000000000006B000018
      EF000010DE0000006B000000000000000000000000000000000000006B000000
      E7000008E70000006B00000000000000000000000000CE6B0000FFEFDE00FFE7
      C600FFDEBD00FFDEBD00FFDEB500FFD6AD00FFD6AD00FFD6A500FFDE9C00FFD6
      9C00FFCE9C00FFD6A500CE6B000000000000000000000063940031ADD60084BD
      D60084F7FF001894BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000942900009429000094290000000000000000
      000000000000000000000000000000000000000000000000000000006B000018
      E7000018EF000010DE0000006B00000000000000000000006B000000DE000008
      EF000000DE0000006B00000000000000000000000000CE6B0000FFF7E700FFEF
      CE009484AD003139B5002139BD004242A5004A429C003139A5006B63A500E7BD
      9C00FFD69C00FFD6A500CE6B00000000000000000000000000000063940029AD
      D6008CC6DE000063940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6B000018DE000021EF000010DE0000006B0000006B000000E7000008EF000000
      DE0000006B0000000000000000000000000000000000CE6B0000FFF7EF00FFF7
      D600EFD6C6002939C6000010DE006B63AD00C6B5AD002939AD000010B5005252
      A500FFD6A500FFDEAD00CE6B0000000000000000000000000000000000000063
      940018A5D60084BDD600006394000073A5000063940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B18000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000006B000018DE000021EF000010E7000008EF000008EF000000DE000000
      6B000000000000000000000000000000000000000000CE6B0000FFFFF700FFF7
      DE00F7DECE003142CE000010E7008C84B500FFFFBD00736BAD000010BD002131
      AD00FFD6A500FFDEAD00CE6B0000000000000000000000000000000000000000
      00000063940008A5D60084C6DE0031DEFF0008CEFF0000639400006394000063
      9400006394000063940000000000000000000000000000000000000000000000
      00000000000000000000000000007B180000B54200007B180000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006B000018E7000010EF000010EF000008DE0000006B000000
      00000000000000000000000000000000000000000000CE6B0000FFFFFF00FFF7
      E700F7DECE002942D6000010EF006363B500B5A5B5002931B5000018BD00635A
      A500FFDEAD00FFDEB500CE6B0000000000000000000000000000000000000000
      0000000000000063940008A5D60018B5E70008CEFF0010CEFF0018D6FF0021D6
      FF0029DEFF0031E7FF0000639400000000000000000000000000000000000000
      00000000000000000000000000007B180000BD4A0000B54200007B1800000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006B000021E7000018EF000018EF000010DE0000006B000000
      00000000000000000000000000000000000000000000CE6B0000FFFFFF00FFFF
      E700F7E7D6002942D6000010F7002931B5002129B5000010C6004242A500EFCE
      AD00FFDEB500FFDEBD00CE6B0000000000000000000000000000000000000000
      000000000000000000000063940021D6FF0031D6FF0039D6FF0042D6FF004ADE
      FF0052DEFF005AE7FF006BEFFF00006394000000000000000000000000000000
      0000000000000000000000000000000000007B180000C6520000BD4A00007B18
      0000000000000000000000000000000000000000000000000000000000000000
      000000006B000029E7000031EF000021E7000018E7000021EF000018DE000000
      6B000000000000000000000000000000000000000000CE6B0000FFFFFF00FFFF
      EF00F7E7DE002942D6000010F7007B73C600C6B5BD001831C6000818CE00948C
      B500FFE7B500FFE7C600CE6B0000000000000000000000000000000000000000
      000000000000000000000063940052E7FF0052DEFF005ADEFF006BE7FF006BE7
      FF008CEFFF0084DEF7009CF7FF00006394000000000000000000000000000000
      000000000000000000000000000000000000000000007B180000CE520000C64A
      00008C2100000000000000000000000000000000000000000000000000000000
      6B000831E7000839EF000029DE0000006B0000006B000018DE000029EF000018
      DE0000006B0000000000000000000000000000000000CE6B0000FFFFFF00FFFF
      F700FFEFE7003142DE000010F7008C8CD600FFFFCE003942CE000008EF005A5A
      BD00FFE7BD00FFE7C600CE6B0000000000000000000000000000000000000000
      00000000000000000000006394007BEFFF0084E7FF008CEFFF0094EFFF00ADF7
      FF00CEEFF70018739C00C6FFFF00006394000000000000000000000000000000
      0000841800007B1800007B1800000000000000000000000000007B180000D65A
      00007B180000000000000000000000000000000000000000000000006B001042
      E7001042EF000829DE0000006B00000000000000000000006B000021DE000029
      EF000018E70000006B00000000000000000000000000CE6B0000FFFFFF00FFFF
      F700BDB5D6001021CE000008EF00424AC6005A5ABD000018DE001021D600B5A5
      BD00FFEFC600FFE7CE00CE6B0000000000000000000000000000000000000000
      0000000000000000000000639400ADEFFF00ADEFFF00B5EFFF00CEFFFF00D6F7
      F70010739C0000639400D6FFFF00006394000000000000000000000000000000
      000084180000FF840000FF8400007B180000000000007B180000EF730000E76B
      00007B180000000000000000000000000000000000000000000000006B00184A
      E7001031DE0000006B000000000000000000000000000000000000006B000021
      DE000021E70000006B00000000000000000000000000CE6B0000FFFFFF00FFFF
      FF00A5A5D600737BDE007384E7007B7BD6006B73CE007B84D600CEBDCE00FFEF
      CE00FFE7CE00FFEFD600CE6B0000000000000000000000000000000000000000
      0000000000000000000000639400EFFFFF00BDF7FF00C6F7FF009CD6E700106B
      9C000063940000639400CEFFFF00006394000000000000000000000000000000
      0000000000007B180000FF840000FF840000FF840000FF840000F77B00007B18
      0000000000000000000000000000000000000000000000000000000000000000
      6B0000006B000000000000000000000000000000000000000000000000000000
      6B0000006B0000000000000000000000000000000000CE6B0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7
      E700FFF7E700FFF7EF00CE6B0000000000000000000000000000000000000000
      000000000000000000000000000000639400EFFFFF00D6FFFF008CD6EF008CD6
      E700A5E7F700BDEFF700C6FFFF00006394000000000000000000000000000000
      00000000000000000000A53100007B1800007B1800007B1800009C3100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063940000639400006394000063
      9400006394000063940000639400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C001FFFFF01FFFFFC001FFFFE00FC003
      C001F9FFC0078001C001F0FFC0078001C001E07FC0038001C001C03F80038001
      C001821F80038001C001C78F80038001C001EFC700018001C001FFF300018001
      C001FFF900018001C001FFFF00018001C001FFFF00018001C001FFFF00018001
      C001FFFF8003C003FFFFFFFFE00FFFFFFFFFFFFF8FFFFFFFFFFFC00307FFFFFF
      E7E7800103FFFE3FC3C3800183FFFE3FC1838001C3FFFFFFE0078001E07FFF7F
      F00F8001F003FE3FF81F8001F801FE1FF81F8001FC00FF0FF00F8001FC00FF87
      E0078001FC00F1C7C1838001FC00F087C3C38001FC00F80FE7E78001FE00FC1F
      FFFFC003FF01FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'cxGrid1DBBandedTableView1DBBandedColumn1.Width'
      'cxGrid1DBBandedTableView1DBBandedColumn2.Visible'
      'cxGrid1DBBandedTableView1DBBandedColumn3.Visible'
      'cxGrid1DBBandedTableView1DBBandedColumn4.Visible'
      'cxGrid1DBBandedTableView1DBBandedColumn5.Width'
      'cxGrid1DBBandedTableView1DBBandedColumn9.Visible')
    StoredValues = <>
    Left = 104
    Top = 240
  end
  object dxBarPopupMenu2: TdxBarPopupMenu
    BarManager = dxBarManager1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemLinks = <
      item
        Item = dxBarLargeButton9
        Visible = True
      end
      item
        Item = dxBarLargeButton10
        Visible = True
      end
      item
        Visible = True
      end>
    UseOwnFont = True
    UseRecentItems = True
    Left = 296
    Top = 136
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = fmBankDocMainForm.Database
    Transaction = fmBankDocMainForm.Transaction
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields, poKeepSorting]
    AutoCommit = True
    Left = 400
    Top = 232
    poSQLINT64ToBCD = True
  end
end
