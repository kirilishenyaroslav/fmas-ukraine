object fmAddAvanceVedomost: TfmAddAvanceVedomost
  Left = 392
  Top = 140
  Width = 756
  Height = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    748
    516)
  PixelsPerInch = 96
  TextHeight = 13
  object cxDateEdit1: TcxDateEdit
    Left = 376
    Top = 6
    Width = 112
    Height = 21
    Style.Color = 15204351
    TabOrder = 0
  end
  object cxTextEdit1: TcxTextEdit
    Left = 192
    Top = 6
    Width = 121
    Height = 21
    Style.Color = 15204351
    TabOrder = 1
  end
  object cxMemo1: TcxMemo
    Left = 88
    Top = 59
    Width = 652
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    Style.Color = 15204351
    TabOrder = 2
  end
  object cxTextEdit2: TcxTextEdit
    Left = 88
    Top = 33
    Width = 652
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Style.Color = 15204351
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 141
    Width = 749
    Height = 336
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 747
      Height = 36
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 33
      Caption = 'ToolBar1'
      DisabledImages = fmMainAvanceVedomost.ImageList
      EdgeBorders = []
      Flat = True
      HotImages = fmMainAvanceVedomost.ImageList
      Images = fmMainAvanceVedomost.ImageList
      ShowCaptions = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = AAdd
      end
      object ToolButton2: TToolButton
        Left = 33
        Top = 0
        Action = AEdit
        Visible = False
      end
      object ToolButton3: TToolButton
        Left = 66
        Top = 0
        Action = ADel
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 37
      Width = 255
      Height = 177
      Align = alClient
      TabOrder = 1
      object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = DataSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxGrid1DBBandedTableView1DBBandedColumn3
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyle14
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
          end>
        object cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
          Width = 108
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'NOMER_VED'
        end
        object cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
          Width = 72
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'DATE_VED'
        end
        object cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00;-0.00'
          FooterAlignmentHorz = taRightJustify
          Width = 105
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBBandedTableView1
      end
    end
    object cxGrid2: TcxGrid
      Left = 264
      Top = 37
      Width = 484
      Height = 177
      Align = alRight
      TabOrder = 2
      object cxGrid2DBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = DataSource2
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00;-0.00'
            Kind = skSum
            FieldName = 'SUMA'
            Column = cxGrid2DBBandedTableView1DBBandedColumn7
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyleYellow
        Styles.Content = cxStyleYellow
        Styles.ContentEven = cxStyleYellow
        Styles.ContentOdd = cxStyleYellow
        Styles.Inactive = cxStyle4
        Styles.IncSearch = cxStyle14
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
          end>
        object cxGrid2DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn
          Width = 85
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'SCH_NUMBER'
        end
        object cxGrid2DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn
          Width = 89
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SCH_NUMBER_KOR'
        end
        object cxGrid2DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn
          Width = 61
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'SMETA_KOD'
        end
        object cxGrid2DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn
          Width = 62
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'RAZD_NUM'
        end
        object cxGrid2DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn
          Width = 54
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'STATE_KOD'
        end
        object cxGrid2DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn
          Width = 60
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'KEKV_KOD'
        end
        object cxGrid2DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00;-0.00'
          Width = 71
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
          DataBinding.FieldName = 'SUMA'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBBandedTableView1
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 256
      Top = 37
      Width = 8
      Height = 177
      HotZoneClassName = 'TcxMediaPlayer8Style'
      HotZone.SizePercent = 60
      AlignSplitter = salRight
      Control = cxGrid2
    end
    object PageControl2: TPageControl
      Left = 1
      Top = 222
      Width = 747
      Height = 113
      ActivePage = TabSheet4
      Align = alBottom
      Style = tsFlatButtons
      TabOrder = 4
      TabStop = False
      object TabSheet5: TTabSheet
        Caption = 'TabSheet5'
        ImageIndex = 2
        object cxLabel15: TcxLabel
          Left = 1
          Top = 1
          Width = 73
          Height = 17
          AutoSize = False
          TabOrder = 0
        end
        object cxTextEdit4: TcxTextEdit
          Left = 75
          Top = 0
          Width = 689
          Height = 21
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 1
        end
        object cxLabel16: TcxLabel
          Left = 1
          Top = 38
          Width = 75
          Height = 17
          AutoSize = False
          TabOrder = 2
        end
        object cxTextEdit5: TcxTextEdit
          Left = 75
          Top = 36
          Width = 286
          Height = 21
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 3
        end
        object cxLabel17: TcxLabel
          Left = 363
          Top = 37
          Width = 77
          Height = 17
          AutoSize = False
          TabOrder = 4
        end
        object cxTextEdit6: TcxTextEdit
          Left = 432
          Top = 35
          Width = 332
          Height = 21
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 5
        end
        object cxLabel18: TcxLabel
          Left = -1
          Top = 60
          Width = 77
          Height = 17
          AutoSize = False
          TabOrder = 6
        end
        object cxTextEdit7: TcxTextEdit
          Left = 75
          Top = 59
          Width = 689
          Height = 21
          ParentColor = True
          ParentFont = False
          Properties.ReadOnly = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 7
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1054#1096#1080#1073#1082#1080' '#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
        object cxMemo2: TcxMemo
          Left = 0
          Top = 0
          Width = 739
          Height = 82
          TabStop = False
          Align = alClient
          Properties.ReadOnly = True
          Style.Color = 15451300
          TabOrder = 0
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1054#1096#1080#1073#1082#1080' '#1086' '#1087#1088#1086#1074#1086#1076#1082#1072#1093
        ImageIndex = 1
        object cxGrid4: TcxGrid
          Left = 0
          Top = 0
          Width = 739
          Height = 82
          Align = alClient
          TabOrder = 0
          TabStop = False
          object cxGridDBTableView2: TcxGridDBTableView
            DataController.DataSource = DataSourceError
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsData.Editing = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.Background = cxStyle13
            Styles.Content = cxStyle13
            object cxGridDBTableView2DBColumn1: TcxGridDBColumn
              Caption = #1050#1086#1076' '#1086#1096#1080#1073#1082#1080
              PropertiesClassName = 'TcxTextEditProperties'
              Width = 113
              DataBinding.FieldName = 'Rxkod'
            end
            object cxGridDBTableView2DBColumn2: TcxGridDBColumn
              Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
              PropertiesClassName = 'TcxTextEditProperties'
              SortOrder = soAscending
              Width = 606
              DataBinding.FieldName = 'RxName'
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = cxGridDBTableView2
          end
        end
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 214
      Width = 747
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer8Style'
      HotZone.SizePercent = 60
      AlignSplitter = salBottom
      Control = PageControl2
    end
  end
  object cxButton1: TcxButton
    Left = 401
    Top = 483
    Width = 170
    Height = 28
    Action = ASave
    Anchors = [akRight, akBottom]
    TabOrder = 5
    Glyph.Data = {
      8E010000424D8E010000000000008E000000280000000F000000100000000100
      08000000000000010000C30E0000C30E0000160000001600000000000000FFFF
      FF008C5A5A009C6B6B00B58C8C009C6B6300C68C7B00F7DECE00FFE7D600F7DE
      C600EFDECE00F7E7D600FFD6A500F7DEBD00F7E7CE00FFF7E700F7EFDE00FFFF
      F70000FFFF00C8D0D40085858500FFFFFF001313130402020202020202020202
      02001313130410070909090909090A1002001313130410070909090909090A10
      0200131313040F0C0C0C0C0C0C0C0C0E0200131313040F0909090909090D0E0E
      02001313130410070909090909090A0A0200131313040F0C0C0C0C0C0C0C0C0A
      050013131304141209090909090D0E0A03001312130414120912120909090B0A
      030013141204141212140C0C0C0C0C0A03001313141214121412121208040404
      0300141414141214141414111104010613001313121412121201010101040613
      1300131214121412141204040404131313001314121314121314121313131313
      130013131313141213131313131313131300}
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 585
    Top = 483
    Width = 152
    Height = 28
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'cxButton2'
    TabOrder = 6
    OnClick = cxButton2Click
    Glyph.Data = {
      32040000424D3204000000000000360000002800000014000000110000000100
      180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
      4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
      A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
      FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
      DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
      FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
      84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
      FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
      FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
      00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
      9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
      FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
      5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
      73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
      FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
      DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
      31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
    UseSystemPaint = False
  end
  object cxLabel1: TcxLabel
    Left = 320
    Top = 8
    Width = 51
    Height = 17
    TabOrder = 7
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 33
    Width = 51
    Height = 17
    TabOrder = 8
  end
  object cxLabel3: TcxLabel
    Left = 24
    Top = 59
    Width = 51
    Height = 17
    TabOrder = 9
  end
  object sch: TcxButtonEdit
    Left = 89
    Top = 113
    Width = 160
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = schPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 10
  end
  object cxTextEdit3: TcxTextEdit
    Left = 264
    Top = 112
    Width = 476
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ParentColor = True
    Properties.ReadOnly = True
    TabOrder = 11
  end
  object StyleRepository: TcxStyleRepository
    Left = 336
    Top = 136
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
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor]
      Color = 15204351
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
    Images = fmMainAvanceVedomost.ImageList
    Left = 393
    Top = 134
    object AAdd: TAction
      Caption = 'AAdd'
      ImageIndex = 1
      ShortCut = 45
      OnExecute = AAddExecute
    end
    object AEdit: TAction
      Caption = 'AEdit'
      ImageIndex = 4
      ShortCut = 113
    end
    object ADel: TAction
      Caption = 'ADel'
      ImageIndex = 3
      OnExecute = ADelExecute
    end
    object ASave: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = ASaveExecute
    end
  end
  object DSMain: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from J4_TEMP_VEDOMOST_LIST_SELECT(1)')
    Left = 16
    Top = 229
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    object DSMainID_SESSION: TFIBBCDField
      FieldName = 'ID_SESSION'
      Size = 0
      RoundByScale = True
    end
    object DSMainID_VEDOMOST: TFIBBCDField
      FieldName = 'ID_VEDOMOST'
      Size = 0
      RoundByScale = True
    end
    object DSMainNOMER_VED: TFIBStringField
      FieldName = 'NOMER_VED'
      Size = 15
      EmptyStrToNull = True
    end
    object DSMainDATE_VED: TFIBDateField
      FieldName = 'DATE_VED'
    end
    object DSMainSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
  end
  object DataSource1: TDataSource
    DataSet = DSMain
    Left = 64
    Top = 229
  end
  object DataSource2: TDataSource
    DataSet = DSRight
    Left = 568
    Top = 261
  end
  object DSRight: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from J4_TEMP_VEDOMOST_LIST_RIGHT(1, 1, '#39'01.01.2000'#39')')
    DataSource = DataSource1
    Left = 632
    Top = 261
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DSRightID_DT_PROV_VEDOMOST: TFIBBCDField
      FieldName = 'ID_DT_PROV_VEDOMOST'
      Size = 0
      RoundByScale = True
    end
    object DSRightID_DT_VEDOMOST: TFIBBCDField
      FieldName = 'ID_DT_VEDOMOST'
      Size = 0
      RoundByScale = True
    end
    object DSRightID_MAN: TFIBBCDField
      FieldName = 'ID_MAN'
      Size = 0
      RoundByScale = True
    end
    object DSRightID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DSRightID_SMETA: TFIBBCDField
      FieldName = 'ID_SMETA'
      Size = 0
      RoundByScale = True
    end
    object DSRightID_RAZD: TFIBBCDField
      FieldName = 'ID_RAZD'
      Size = 0
      RoundByScale = True
    end
    object DSRightID_STATE: TFIBBCDField
      FieldName = 'ID_STATE'
      Size = 0
      RoundByScale = True
    end
    object DSRightID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DSRightID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DSRightKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object DSRightSUMA: TFIBBCDField
      FieldName = 'SUMA'
      Size = 2
      RoundByScale = True
    end
    object DSRightID_SP_BANKCARD: TFIBBCDField
      FieldName = 'ID_SP_BANKCARD'
      Size = 0
      RoundByScale = True
    end
    object DSRightFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 62
      EmptyStrToNull = True
    end
    object DSRightSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DSRightSCH_TYTLE: TFIBStringField
      FieldName = 'SCH_TYTLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DSRightSMETA_KOD: TFIBIntegerField
      FieldName = 'SMETA_KOD'
    end
    object DSRightSMETA_TYTLE: TFIBStringField
      FieldName = 'SMETA_TYTLE'
      Size = 180
      EmptyStrToNull = True
    end
    object DSRightRAZD_NUM: TFIBIntegerField
      FieldName = 'RAZD_NUM'
    end
    object DSRightRAZD_TYTLE: TFIBStringField
      FieldName = 'RAZD_TYTLE'
      Size = 180
      EmptyStrToNull = True
    end
    object DSRightSTATE_KOD: TFIBIntegerField
      FieldName = 'STATE_KOD'
    end
    object DSRightSTATE_TYTLE: TFIBStringField
      FieldName = 'STATE_TYTLE'
      Size = 180
      EmptyStrToNull = True
    end
    object DSRightKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DSRightKEKV_TYTLE: TFIBStringField
      FieldName = 'KEKV_TYTLE'
      Size = 180
      EmptyStrToNull = True
    end
    object DSRightNUM_DOG: TFIBStringField
      FieldName = 'NUM_DOG'
      EmptyStrToNull = True
    end
    object DSRightDATE_DOG: TFIBDateField
      FieldName = 'DATE_DOG'
    end
    object DSRightNAME_CUST: TFIBStringField
      FieldName = 'NAME_CUST'
      Size = 180
      EmptyStrToNull = True
    end
    object DSRightREG_DOG: TFIBStringField
      FieldName = 'REG_DOG'
      Size = 50
      EmptyStrToNull = True
    end
    object DSRightLIC_BANKCARD: TFIBStringField
      FieldName = 'LIC_BANKCARD'
      Size = 16
      EmptyStrToNull = True
    end
    object DSRightCOMENT_NANKCARD: TFIBStringField
      FieldName = 'COMENT_NANKCARD'
      Size = 255
      EmptyStrToNull = True
    end
    object DSRightSCH_NUMBER_KOR: TFIBStringField
      FieldName = 'SCH_NUMBER_KOR'
      Size = 30
      EmptyStrToNull = True
    end
    object DSRightSCH_TITLE_KOR: TFIBStringField
      FieldName = 'SCH_TITLE_KOR'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object DB: TpFIBDatabase
    DBName = 'O:\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = Tr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 88
  end
  object Tr: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
  end
  object TWr: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 120
    Top = 88
  end
  object StoredPr: TpFIBStoredProc
    Database = DB
    Transaction = Tr
    Left = 192
    Top = 104
  end
  object Class_DataSet: TpFIBDataSet
    Left = 328
    Top = 285
    poSQLINT64ToBCD = True
  end
  object DataSetError: TpFIBDataSet
    Left = 432
    Top = 261
    poSQLINT64ToBCD = True
  end
  object DataSourceError: TDataSource
    DataSet = RxError
    Left = 449
    Top = 418
  end
  object RxError: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'Rxkod'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RxName'
        DataType = ftString
        Size = 255
      end>
    Left = 505
    Top = 418
  end
end
