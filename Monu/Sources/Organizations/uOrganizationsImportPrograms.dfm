object frmImportPrg: TfrmImportPrg
  Left = 208
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1030#1084#1087#1086#1088#1090' '#1087#1088#1086#1075#1088#1072#1084
  ClientHeight = 543
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 496
    Width = 481
    Height = 9
    Shape = bsBottomLine
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 8
    Width = 123
    Height = 17
    TabOrder = 0
    Caption = #1055#1088#1086#1075#1088#1072#1084#1080' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1110#1081
  end
  object cxButtonEdit6: TcxButtonEdit
    Left = 8
    Top = 24
    Width = 401
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit6PropertiesButtonClick
    Style.Color = clSkyBlue
    TabOrder = 1
  end
  object cxButton6: TcxButton
    Left = 416
    Top = 24
    Width = 75
    Height = 25
    Caption = #1055#1086#1095#1072#1090#1080
    TabOrder = 2
    OnClick = cxButton6Click
    Glyph.Data = {
      5E020000424D5E020000000000005E0100002800000010000000100000000100
      08000000000000010000120B0000120B00004A0000004A00000000000000FFFF
      FF00FF00FF00A46769008E5D590080504B00A0675B00A7756B00811E0000BC82
      6800D1926D00FAEFE500F8EADC00FCF6F000F8E9D900F3D4B000F2D5B100F2D5
      B200F3DABC00F6E0C600F7E5CF00E9BD8100E9BD8200EDC28B00EBC28A00EBC2
      8C00EDC79300EECB9E00F0D0A600F0D0A700F3D9B800F2DABC00F4E0C500F8E7
      D100FFF4E500E9BD7F00EABF8100F2C98C00F3CE9700F6D3A000F4D8B100FEEF
      DA00FCF7F000EFC48000EFC48100EFC58300EBCFA400B4A68F00FCEACE00FBEA
      CE00B4A79000B4A78F00FFFEFC00B2A78F00B6AF9F00FFFBF000B8B6AD00FFFF
      FC00BBBDBD0000BDFF000562A000004B8200BDC7CF003596EF003696F000409D
      F2001978D800288AEE001B7FEB000962D0000C65D1001174EA000F6AD3000739
      7A00020202020202020202020202020202020203040404040404040404040405
      020202033012101D1B1A171523232C050202020629131F113649321916232C05
      02020206221420384945493318242B0502020207370C3A49484745492F182D05
      02020207393E49424043444649352505020202090149494941413F4949492605
      0202020901340D49414141490F1C27050202020A01013449494949491E282E05
      0202020A010101342A0B0E21311E28050202023C3D3D3D3D3D3D3D3D3D3D3D3D
      0202023C3B3B3B3B3B3B3B3B3B3B3B3D0202023C3B3B080808080808083B3B3D
      0202023C3B3B3B3B3B3B3B3B3B3B3B3D0202023C3D3D3D3D3D3D3D3D3D3D3D3D
      0202}
    UseSystemPaint = False
  end
  object ProgressBar: TcxProgressBar
    Left = 8
    Top = 472
    Width = 481
    Height = 21
    TabOrder = 3
  end
  object cxButton2: TcxButton
    Left = 184
    Top = 512
    Width = 121
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    Default = True
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 56
    Width = 481
    Height = 409
    ActivePage = TabSheet1
    TabOrder = 5
    object TabSheet1: TTabSheet
      Caption = #1061#1086#1076' '#1088#1086#1073#1086#1090#1080
      object cxMemo1: TcxMemo
        Left = 0
        Top = 24
        Width = 473
        Height = 357
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Style.Color = clSkyBlue
        TabOrder = 0
      end
      object cxCheckBox1: TcxCheckBox
        Left = 0
        Top = 0
        Width = 249
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1093#1086#1076' '#1088#1086#1073#1086#1090#1080
        State = cbsChecked
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111' '#1097#1086' '#1076#1091#1073#1083#1102#1102#1090#1100#1089#1103
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 41
        Width = 473
        Height = 340
        Align = alClient
        TabOrder = 0
        object cxGrid1TableView1: TcxGridTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = cxGrid1TableView1Column1
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGrid1TableView1Column1: TcxGridColumn
            Caption = #1050#1086#1076
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Styles.Content = cxStyle7
            Width = 43
          end
          object cxGrid1TableView1Column2: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Styles.Content = cxStyle7
            Width = 213
          end
          object cxGrid1TableView1Column3: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072' '#1086#1073#1088#1072#1085#1086#1075#1086
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.HideCursor = True
            Properties.OnButtonClick = cxGrid1TableView1Column3PropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            Options.ShowEditButtons = isebAlways
            Width = 223
          end
          object cxGrid1TableView1Column4: TcxGridColumn
            Visible = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1TableView1
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 473
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object cxButton3: TcxButton
          Left = 0
          Top = 8
          Width = 177
          Height = 25
          Caption = #1042#1110#1076#1085#1086#1074#1080#1090#1080' '#1085#1072#1079#1074#1080
          TabOrder = 0
          OnClick = cxButton3Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1053#1077' '#1079#1085#1072#1081#1076#1077#1085#1110' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
      ImageIndex = 2
      object cxGrid2: TcxGrid
        Left = 0
        Top = 41
        Width = 473
        Height = 340
        Align = alClient
        TabOrder = 0
        object cxGrid2TableView1: TcxGridTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = cxGridColumn1
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsSelection.CellSelect = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGridColumn1: TcxGridColumn
            Caption = #1050#1086#1076
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 43
          end
          object cxGridColumn2: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Width = 213
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2TableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 473
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object cxButton1: TcxButton
          Left = 0
          Top = 8
          Width = 177
          Height = 25
          Caption = #1044#1086#1076#1072#1090#1080' '#1091#1089#1110' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
          TabOrder = 0
          OnClick = cxButton1Click
        end
      end
    end
  end
  object HalcyonDataSet: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 24
    Top = 144
  end
  object Database: TpFIBDatabase
    DefaultTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 176
  end
  object Query: TpFIBQuery
    Database = Database
    Transaction = WriteTransaction
    Left = 56
    Top = 176
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 56
    Top = 208
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 24
    Top = 208
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.dbf'
    Filter = #1060#1072#1081#1083#1080' dbf (*.dbf)|*.dbf|'#1059#1089#1110' '#1092#1072#1081#1083#1080' (*.*)|*.*'
    Left = 56
    Top = 144
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 240
    Top = 312
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
end
