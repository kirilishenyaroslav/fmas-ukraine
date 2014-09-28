object SaldoForm: TSaldoForm
  Left = 369
  Top = 238
  Width = 803
  Height = 576
  Caption = #1057#1072#1083#1100#1076#1086' '#1079#1072' '#1087#1077#1088#1110#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 66
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 6
      Top = 12
      Width = 41
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076
    end
    object lbl2: TLabel
      Left = 5
      Top = 43
      Width = 49
      Height = 13
      Caption = #1056#1072#1093#1091#1085#1086#1082
    end
    object lbl3: TLabel
      Left = 142
      Top = 43
      Width = 22
      Height = 13
      Caption = #1055#1030#1041
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 289
      Top = 43
      Width = 59
      Height = 13
      Caption = #1050#1086#1096#1090#1086#1088#1080#1089
    end
    object lbl6: TLabel
      Left = 417
      Top = 43
      Width = 40
      Height = 13
      Caption = #1056#1086#1079#1076#1110#1083
    end
    object lbl7: TLabel
      Left = 526
      Top = 43
      Width = 41
      Height = 13
      Caption = #1057#1090#1072#1090#1090#1103
    end
    object cxMonthBeg: TcxComboBox
      Left = 51
      Top = 9
      Width = 89
      Height = 21
      Hint = '11'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.Items.Strings = (
        #1089#1110#1095#1077#1085#1100
        #1083#1102#1090#1080#1081
        #1073#1077#1088#1077#1079#1077#1085#1100
        #1082#1074#1110#1090#1077#1085#1100
        #1090#1088#1072#1074#1077#1085#1100
        #1095#1077#1088#1074#1077#1085#1100
        #1083#1080#1087#1077#1085#1100
        #1089#1077#1088#1087#1077#1085#1100
        #1074#1077#1088#1077#1089#1077#1085#1100
        #1078#1086#1074#1090#1077#1085#1100
        #1083#1080#1089#1090#1086#1087#1072#1076
        #1075#1088#1091#1076#1077#1085#1100)
      Properties.ReadOnly = False
      Properties.OnChange = cxMonthBegPropertiesChange
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 0
    end
    object cxYearBeg: TcxSpinEdit
      Left = 149
      Top = 9
      Width = 65
      Height = 21
      ParentFont = False
      Properties.CanEdit = False
      Properties.MaxValue = 9999.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      Properties.OnChange = cxYearBegPropertiesChange
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 1
      Value = 2000
    end
    object CxSch: TcxComboBox
      Left = 57
      Top = 39
      Width = 82
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 2
    end
    object TextFIO: TcxTextEdit
      Left = 169
      Top = 39
      Width = 116
      Height = 21
      TabOrder = 3
    end
    object cxTextEditSmeta: TcxTextEdit
      Left = 349
      Top = 39
      Width = 58
      Height = 21
      TabOrder = 4
    end
    object cxRZ: TcxTextEdit
      Left = 463
      Top = 39
      Width = 59
      Height = 21
      TabOrder = 5
    end
    object cxStat: TcxTextEdit
      Left = 571
      Top = 39
      Width = 59
      Height = 21
      TabOrder = 6
    end
    object cxFiltr: TcxComboBox
      Left = 646
      Top = 39
      Width = 121
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        ''
        #1044#1077#1073#1077#1090#1086#1074#1110' '#1079#1072#1083#1080#1096#1082#1080
        #1050#1088#1077#1076#1080#1090#1086#1074#1110' '#1079#1072#1083#1080#1096#1082#1080
        #1044#1077#1073'.-'#1082#1088#1077#1076'. '#1079#1072#1083#1080#1096#1082#1080)
      Properties.ReadOnly = False
      TabOrder = 7
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 101
    Width = 787
    Height = 437
    Align = alClient
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'DB_SUMMA'
          Column = cxGridDBSumma
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'KR_SUMMA'
          Column = cxGridKRSumma
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'DB_SUMMA'
          Column = cxGridDBSumma
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'KR_SUMMA'
          Column = cxGridKRSumma
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cxGridDog
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle2
      object cxGridSCH: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Options.Editing = False
        Options.Filtering = False
        Width = 104
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxGridDog: TcxGridDBColumn
        Caption = #1044#1086#1075#1086#1074#1110#1088
        Options.Editing = False
        Options.Filtering = False
        Width = 249
        DataBinding.FieldName = 'FIO'
      end
      object cxGridSM: TcxGridDBColumn
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
        Options.Filtering = False
        Options.Focusing = False
        Width = 50
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxGridRZ: TcxGridDBColumn
        Caption = #1056#1086#1079#1076#1110#1083
        Options.Editing = False
        Options.Filtering = False
        Width = 51
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxGridST: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1090#1103
        Options.Editing = False
        Options.Filtering = False
        Width = 49
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxGridKEKV: TcxGridDBColumn
        Caption = #1050#1045#1050#1042
        Options.Editing = False
        Options.Filtering = False
        Width = 51
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxGridDBSumma: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090#1086#1074#1072' '#1089#1091#1084#1072
        Options.Editing = False
        Options.Filtering = False
        Width = 113
        DataBinding.FieldName = 'DB_SUMMA'
      end
      object cxGridKRSumma: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1072' '#1089#1091#1084#1072
        Options.Filtering = False
        Options.Focusing = False
        Width = 103
        DataBinding.FieldName = 'KR_SUMMA'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object OkButton: TcxButton
    Left = 237
    Top = 7
    Width = 125
    Height = 25
    Hint = 'F3'
    Action = actShow
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFB78183A47874A47874A47874A47874A47874A4
      7874A47874A47874A47874A47874A47874986B66FF00FFFF00FFFF00FFB78183
      FDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC97F3D1
      99986B66FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3F5E3CBF5DFC3CFCF9F01
      8A02018A02CCC68BEECC9AEECC97F3D199986B66FF00FFFF00FFFF00FFB48176
      FFF7EBF9EBDA018A02D1D6AC018A02D0CF9ECECC98018A02CCC689EFCD99F3D1
      98986B66FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4018A02018A02D1D5ADF5
      DFC2F4DBBBCDCC98018A02F0D0A1F3D29B986B66FF00FFFF00FFFF00FFBA8E85
      FFFFFDFBF4EC018A02018A02018A02F5E3C9F5DFC2F4DBBAF2D7B1F0D4A9F5D5
      A3986B66FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECFAEFE2F9EADAF8
      E7D2018A02018A02018A02F2D8B2F6D9AC986B66FF00FFFF00FFFF00FFCB9A82
      FFFFFFFFFEFD018A02D6E3C9F9EFE3F8EADAD2D9B3018A02018A02F4DBB9F8DD
      B4986B66FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFD9EDD8018A02D6E3C8D5
      E0C1018A02D3D8B2018A02F7E1C2F0DAB7986B66FF00FFFF00FFFF00FFDCA887
      FFFFFFFFFFFFFFFFFFD9EDD8018A02018A02D5DFC1FAEDDCFCEFD9E6D9C4C6BC
      A9986B66FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
      F8F3FDF6ECF1E1D5B48176B48176B48176B48176FF00FFFF00FFFF00FFE3B18E
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9B48176E8B270ECA5
      4AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFE4D4D2B48176FAC577CD9377FF00FFFF00FFFF00FFFF00FFEDBD92
      FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB48176CF9B86FF00
      FFFF00FFFF00FFFF00FFFF00FFEDBD92DAA482DAA482DAA482DAA482DAA482DA
      A482DAA482DAA482B48176FF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    UseSystemPaint = False
  end
  object cxClose: TcxButton
    Left = 641
    Top = 7
    Width = 125
    Height = 25
    Caption = #1042#1080#1093#1110#1076
    TabOrder = 3
    OnClick = cxCloseClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DD99D99DDDDDDDDDD99DD999DDDDDDDD99DDD9999DDDDDD99DDDDD9999DDDD99
      DDDDDDDD999D999DDDDDDDDDD99999DDDDDDDDDDDD999DDDDDDDDDDDD99999DD
      DDDDDDDD999DD99DDDDDDDD999DDDD99DDDDDD999DDDDDD99DDDD999DDDDDDDD
      D9DD999DDDDDDDDDDDDD99DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    UseSystemPaint = False
  end
  object pnl2: TPanel
    Left = 0
    Top = 66
    Width = 787
    Height = 35
    Align = alTop
    TabOrder = 1
    object cxAddDogButton: TcxButton
      Left = 7
      Top = 4
      Width = 137
      Height = 25
      Hint = 'Ins'
      Action = actIns
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF00660021A335006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF656565949494656565FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF00660024A53912A92028B040006600FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659696968F8F8F
        9E9E9E656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660027
        A73E1EB43218AE2913AB2227AF3E006600FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF6565659999999B9B9B9595959191919D9D9D656565FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0066001F99312EC04A26BA3E1FB53419AF2B13AB2325AE
        3C006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565658E8E8EA9A9A9A2A2A29C9C9C
        9696969191919B9B9B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001D952E3FCE6337
        C8572FC14C25A63B00660029B14114AC2524AD3A006600FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565
        658B8B8BB8B8B8B1B1B1AAAAAA9797976565659F9F9F9292929A9A9A656565FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0066001A902A4FDA7948D56F40CF642FB34A006600FF00FF0066001CB2
        2F15AC2622AC38006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF656565878787C6C6C6C0C0C0B9B9B9A3A3A3656565
        FF00FF656565999999929292999999656565FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00660059E28955E08250DB7B36
        BC55006600B73D3DFF00FFFF00FF006600148D2117AE2721AB36006600FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565CFCF
        CFCCCCCCC7C7C7ABABAB6565657A7A7AFF00FFFF00FF65656582828294949498
        9898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00660031B04D5BE48A3ABF5B006600CB6363CF6F6FB73D3DFF00FFFF00
        FFFF00FF00660018AE2920AA34006600FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF656565A2A2A2D1D1D1AEAEAE6565659797979F9F9F
        7A7A7AFF00FFFF00FFFF00FF656565959595979797656565FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3D00660047CF6D006600CF
        6E6ECD6868CB6363CE6C6CB73D3DFF00FFFF00FFFF00FF00660019AF2B14AB23
        006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A6565
        65BDBDBD6565659E9E9E9A9A9A9797979D9D9D7A7A7AFF00FFFF00FFFF00FF65
        6565969696919191656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        B73D3DC95D5DD88989006600D37B7BCD6969B73D3DD07171CB6363CE6C6CB73D
        3DFF00FFFF00FFFF00FF0066000B7E1314AB24006600FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF7A7A7A939393B0B0B0656565A7A7A79B9B9B7A7A7AA0A0A0
        9797979D9D9D7A7A7AFF00FFFF00FFFF00FF656565767676919191656565FF00
        FFFF00FFFF00FFFF00FFFF00FFB73D3DC85959DC9696DA9090D88A8AD17575B7
        3D3DFF00FFB73D3DCE6B6BCB6363CE6B6BB73D3DFF00FFFF00FFFF00FFFF00FF
        006600118D1D006600FF00FFFF00FFFF00FFFF00FF7A7A7A909090B9B9B9B5B5
        B5B1B1B1A3A3A37A7A7AFF00FF7A7A7A9C9C9C9797979C9C9C7A7A7AFF00FFFF
        00FFFF00FFFF00FF656565818181656565FF00FFFF00FFFF00FFFF00FFB73D3D
        DF9F9FDE9C9CDD9898D47D7DB73D3DFF00FFFF00FFFF00FFB73D3DC65454CC66
        66CD6969B73D3DFF00FFFF00FFFF00FFFF00FF00660008790F006600FF00FFFF
        00FFFF00FF7A7A7ABFBFBFBDBDBDBABABAA8A8A87A7A7AFF00FFFF00FFFF00FF
        7A7A7A8D8D8D9999999B9B9B7A7A7AFF00FFFF00FFFF00FFFF00FF6565657272
        72656565FF00FFFF00FFFF00FFB73D3DD17474E0A2A2D58080B73D3DFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFB73D3DCC6666CD6969B73D3DFF00FFFF00FF
        FF00FFFF00FFFF00FF006600006600FF00FFFF00FF7A7A7AA2A2A2C1C1C1AAAA
        AA7A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A9999999B9B9B7A
        7A7AFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
        B73D3DD98D8DB73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFB73D3DCD6868CB6363B73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        6600FF00FFFF00FF7A7A7AB3B3B37A7A7AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF7A7A7A9A9A9A9797977A7A7AFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF656565FF00FFFF00FFFF00FFB73D3DFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3DC24848CB6363B73D3D
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A85
        85859797977A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB73D3DC65353B73D3DFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A8C8C8C7A7A7AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3D
        C14545B73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF7A7A7A8383837A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB73D3DB73D3DFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A7A7A
        7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB73D3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
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
    object cxDelete: TcxButton
      Left = 317
      Top = 4
      Width = 137
      Height = 25
      Hint = 'Del'
      Action = actDel
      TabOrder = 2
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DD99D99DDDDDDDDDD99DD999DDDDDDDD99DDD9999DDDDDD99DDDDD9999DDDD99
        DDDDDDDD999D999DDDDDDDDDD99999DDDDDDDDDDDD999DDDDDDDDDDDD99999DD
        DDDDDDDD999DD99DDDDDDDD999DDDD99DDDDDD999DDDDDD99DDDD999DDDDDDDD
        D9DD999DDDDDDDDDDDDD99DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      UseSystemPaint = False
    end
    object cxUpdSaldo: TcxButton
      Left = 155
      Top = 5
      Width = 137
      Height = 25
      Hint = 'F2'
      Action = actUpd
      TabOrder = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A05710A
        05710A05710AFF00FF00009A00009A00009A00009A00009A00009A00009A0000
        9A00009A00009A00009A05710A45D36C32C35005710AFF00FF00009A0333F60D
        3EFC2551FC496DFD7A95FEB5C4FFF5F8FFFFFFFFFFFFFF00009A05710A59E287
        49D57105710AFF00FF00009A0336FC0D3FFD2652FD4A6FFE7B97FFB8C7FFF8FB
        FFFFFFFFFFFFFF00009A05710A05710A05710A05710AFF00FF00009A00009A00
        009A00009A00009A00009A00009A00009A00009A00009A00009AFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A05710AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        05710A5CE78D40BE6205710A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF08750E05710AFF00FFFF00FFFF00FF05710A45D16B4ED9782BA54405710AFF
        00FFFF00FFFF00FFFF00FFFF00FF0C7A142BA44305710AFF00FFFF00FF05710A
        1DA5302DBD4A38C5580A7911FF00FFFF00FFFF00FFFF00FFFF00FF0E7D1746C7
        6B05710AFF00FFFF00FFFF00FF05710A05710A0A7F1222B63828B7410B7B1206
        730B05720B0B7A131D912D48CB7005710AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF05710A077D0E16AD271EB4341BA02E20A43431B94D42CC6505710AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A05710A0D9C1913
        A4221BAC2E1BAC2E05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF05710A05710A05710A05710AFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxgrup: TcxCheckBox
      Left = 625
      Top = 6
      Width = 145
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxgrupPropertiesChange
      Properties.Caption = #1055#1072#1085#1077#1083#1100' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
      TabOrder = 3
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 736
    Top = 211
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
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 736
    Top = 148
  end
  object DS: TpFIBDataSet
    Database = DB
    Transaction = ReadTr
    SelectSQL.Strings = (
      'Select * from PC_DT_SALDO_SELECT(:date_rec, :id_reg)')
    Left = 704
    Top = 147
    poSQLINT64ToBCD = True
    object DSID_SALDO: TFIBBCDField
      FieldName = 'ID_SALDO'
      Size = 0
      RoundByScale = True
    end
    object DSID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DSKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object DSDB_SUMMA: TFIBBCDField
      FieldName = 'DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DSKR_SUMMA: TFIBBCDField
      FieldName = 'KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DSID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DSID_RZ: TFIBBCDField
      FieldName = 'ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object DSID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DSID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DSSM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DSSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DSRZ_TITLE: TFIBStringField
      FieldName = 'RZ_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DSRZ_KOD: TFIBIntegerField
      FieldName = 'RZ_KOD'
    end
    object DSST_TITLE: TFIBStringField
      FieldName = 'ST_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DSST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DSKEKV_TITLE: TFIBStringField
      FieldName = 'KEKV_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DSKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DSFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 60
      EmptyStrToNull = True
    end
    object DSID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DSSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DSSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object StoredProc: TpFIBStoredProc
    Left = 736
    Top = 174
  end
  object ReadTr: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 703
    Top = 176
  end
  object ds1: TDataSource
    DataSet = DS
    Left = 668
    Top = 150
  end
  object WriteTr: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 668
    Top = 177
  end
  object actlst1: TActionList
    Left = 613
    Top = 138
    object actShow: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1080
      ShortCut = 114
      OnExecute = actShowExecute
    end
    object actIns: TAction
      Caption = #1044#1086#1076#1072#1090#1080' '#1089#1072#1083#1100#1076#1086
      ShortCut = 45
      OnExecute = actInsExecute
    end
    object actUpd: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1089#1072#1083#1100#1076#1086
      ShortCut = 113
      OnExecute = actUpdExecute
    end
    object actDel: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ShortCut = 46
      OnExecute = actDelExecute
    end
    object actFilter: TAction
      Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080
    end
  end
end
