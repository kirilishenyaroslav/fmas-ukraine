object OborotForm: TOborotForm
  Left = 169
  Top = 415
  Width = 1111
  Height = 484
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1095
    Height = 69
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 6
      Top = 12
      Width = 52
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076' '#1079
    end
    object lbl2: TLabel
      Left = 8
      Top = 42
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
    object lbl3: TLabel
      Left = 159
      Top = 42
      Width = 59
      Height = 13
      Caption = #1050#1086#1096#1090#1086#1088#1080#1089
    end
    object lbl4: TLabel
      Left = 616
      Top = 46
      Width = 26
      Height = 13
      Caption = #1056#1072#1093'.'
    end
    object lbl5: TLabel
      Left = 234
      Top = 14
      Width = 15
      Height = 13
      Caption = #1087#1086
    end
    object lbl6: TLabel
      Left = 322
      Top = 43
      Width = 40
      Height = 13
      Caption = #1056#1086#1079#1076#1110#1083
    end
    object lbl7: TLabel
      Left = 467
      Top = 45
      Width = 41
      Height = 13
      Caption = #1057#1090#1072#1090#1090#1103
    end
    object cxMonthBeg: TcxComboBox
      Left = 64
      Top = 8
      Width = 89
      Height = 21
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
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 0
    end
    object cxYearBeg: TcxSpinEdit
      Left = 160
      Top = 9
      Width = 65
      Height = 21
      ParentFont = False
      Properties.CanEdit = False
      Properties.MaxValue = 9999.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 1
      Value = 2000
    end
    object cxButton1: TcxButton
      Left = 566
      Top = 6
      Width = 125
      Height = 25
      Action = actPrint
      TabOrder = 5
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
        8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
        868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
        C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
        5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
        D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
        141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
        E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
        FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
        D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
        A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
        FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
        D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
        C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
        DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
        E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
        9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object OkButton: TcxButton
      Left = 424
      Top = 6
      Width = 125
      Height = 25
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
    object CancelBut: TcxButton
      Left = 967
      Top = 6
      Width = 125
      Height = 25
      Action = actClose
      TabOrder = 6
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object TextFIO: TcxTextEdit
      Left = 32
      Top = 39
      Width = 125
      Height = 21
      TabOrder = 7
    end
    object cxButton2: TcxButton
      Left = 968
      Top = 35
      Width = 125
      Height = 25
      Action = actFiltr
      TabOrder = 13
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00CECED60084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A5636B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00A5736B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00BD846B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00D6946B00EFEFEF0084848400A563
        6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BD7B5A00EFEFEF00CECED600848484004242
        4200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A
        5A0042424200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00BD7B5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C007373
        73005A5A5A0042424200A5636B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00BD7B5A00EFEFEF00EFEFEF00CECED600BDBDBD009C9C9C00848484008484
        8400737373005A5A5A0042424200A5636B00FF00FF00FF00FF00FF00FF00BD7B
        5A00EFEFEF00EFEFEF00CECED600C6C6C600C6C6C60084848400848484008484
        840084848400737373005A5A5A0042424200A5636B00FF00FF00D6946B00D694
        6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
        6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      UseSystemPaint = False
    end
    object cxTextEditSmeta: TcxTextEdit
      Left = 225
      Top = 39
      Width = 73
      Height = 21
      TabOrder = 8
    end
    object cxTextEditSch: TcxTextEdit
      Left = 643
      Top = 39
      Width = 121
      Height = 21
      TabOrder = 11
    end
    object cxRZ: TcxTextEdit
      Left = 373
      Top = 39
      Width = 73
      Height = 21
      TabOrder = 9
    end
    object cxStat: TcxTextEdit
      Left = 513
      Top = 39
      Width = 73
      Height = 21
      TabOrder = 10
    end
    object cxFiltr: TcxComboBox
      Left = 836
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
      TabOrder = 12
    end
    object cxMonthEnd: TcxComboBox
      Left = 252
      Top = 9
      Width = 89
      Height = 21
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
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 2
    end
    object cxYearEnd: TcxSpinEdit
      Left = 349
      Top = 9
      Width = 65
      Height = 21
      ParentFont = False
      Properties.CanEdit = False
      Properties.MaxValue = 9999.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 3
      Value = 2000
    end
    object cxCheckBoxDate: TcxCheckBox
      Left = 698
      Top = 3
      Width = 135
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBoxDatePropertiesChange
      Properties.Caption = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080' '#1076#1072#1090#1080
      TabOrder = 14
    end
    object cxNumDog: TcxCheckBox
      Left = 699
      Top = 19
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxNumDogPropertiesChange
      Properties.Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1091
      State = cbsChecked
      TabOrder = 15
    end
    object cxNull: TcxCheckBox
      Left = 827
      Top = 5
      Width = 138
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1088#1080#1073#1088#1072#1090#1080' '#1085#1091#1083#1100#1086#1074#1110
      TabOrder = 16
    end
    object cxAutoFiltr: TcxCheckBox
      Left = 828
      Top = 20
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxAutoFiltrPropertiesChange
      Properties.Caption = #1040#1074#1090#1086#1092#1110#1083#1100#1090#1088
      TabOrder = 17
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 69
    Width = 1095
    Height = 377
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      OnDblClick = cxGrid1DBBandedTableView1DblClick
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dsForGrid
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skMax
          FieldName = 'ALL_SUMMA_IN_DB'
          Column = cxGridIN_DB_SUMMA
        end
        item
        end
        item
        end
        item
        end
        item
        end
        item
        end>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBBandedTableView1CustomDrawCell
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cxGridFIO
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle2
      Styles.BandHeader = cxStyle1
      Bands = <
        item
          Caption = #1055#1030#1041
          Options.Moving = False
          Width = 200
        end
        item
          Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1091
          Width = 148
        end
        item
          Visible = False
          Width = 267
        end
        item
          Caption = #1056#1072#1093#1091#1085#1086#1082
          Width = 81
        end
        item
          Caption = #1044#1078#1077#1088#1077#1083#1072' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
          Width = 225
        end
        item
          Caption = #1057#1072#1083#1100#1076#1086' '#1074#1093#1110#1076#1085#1077
          Width = 306
        end
        item
          Caption = #1056#1091#1093' '#1082#1086#1096#1090#1110#1074
          Width = 261
        end
        item
          Caption = #1057#1072#1083#1100#1076#1086' '#1074#1080#1093#1110#1076#1085#1077
          Width = 307
        end>
      object cxGridFIO: TcxGridDBBandedColumn
        Caption = #1055#1030#1041
        MinWidth = 250
        Options.Editing = False
        Options.Filtering = False
        Width = 300
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'FIO_1'
      end
      object cxGridIN_DB_SUMMA: TcxGridDBBandedColumn
        Caption = #1044#1077#1073#1077#1090
        Options.Editing = False
        Options.Filtering = False
        Width = 57
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'IN_DB_SUMMA'
      end
      object cxGridIN_KR_SUMMA: TcxGridDBBandedColumn
        Caption = #1050#1088#1077#1076#1080#1090
        Options.Editing = False
        Options.Filtering = False
        Width = 78
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'IN_KR_SUMMA'
      end
      object cxGridDB_SUMMA: TcxGridDBBandedColumn
        Caption = #1044#1077#1073#1077#1090
        Options.Editing = False
        Options.Filtering = False
        SortOrder = soAscending
        Width = 52
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'DB_SUMMA'
      end
      object cxGridSM_KOD: TcxGridDBBandedColumn
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089
        Options.Editing = False
        Options.Filtering = False
        Width = 55
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxGridRZ_KOD: TcxGridDBBandedColumn
        Caption = #1056#1086#1079#1076#1110#1083
        Options.Editing = False
        Options.Filtering = False
        Width = 55
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxGridST_KOD: TcxGridDBBandedColumn
        Caption = #1057#1090#1072#1090#1090#1103
        Options.Editing = False
        Options.Filtering = False
        Width = 55
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxGridKEKV_KOD: TcxGridDBBandedColumn
        Caption = #1050#1045#1050#1042
        Options.Editing = False
        Options.Filtering = False
        Width = 55
        Position.BandIndex = 4
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxGridKR_SUMMA: TcxGridDBBandedColumn
        Caption = #1050#1088#1077#1076#1080#1090
        Options.Editing = False
        Options.Filtering = False
        Width = 49
        Position.BandIndex = 6
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'KR_SUMMA'
      end
      object cxGridOUT_DB_SUMMA: TcxGridDBBandedColumn
        Caption = #1044#1077#1073#1077#1090
        Options.Editing = False
        Options.Filtering = False
        Width = 100
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_DB_SUMMA'
      end
      object cxGridOUT_KR_SUMMA: TcxGridDBBandedColumn
        Caption = #1050#1088#1077#1076#1080#1090
        Options.Editing = False
        Options.Filtering = False
        Width = 100
        Position.BandIndex = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'OUT_KR_SUMMA'
      end
      object cxGridSch: TcxGridDBBandedColumn
        Options.Editing = False
        Options.Filtering = False
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SCH_NUMBER'
        IsCaptionAssigned = True
      end
      object cxGridIS_Summa: TcxGridDBBandedColumn
        Visible = False
        Options.Filtering = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'IS_SUMMA'
      end
      object cxGrid1DATE_EXEC_DOLG: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1074#1080#1085#1080#1082#1085'. '#1079#1072#1073#1086#1088#1075'.'
        Options.Editing = False
        Options.Filtering = False
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'DATE_EXEC'
      end
      object cxGrid1DATE_OST_MOOVE: TcxGridDBBandedColumn
        Caption = #1044#1072#1090#1072' '#1086#1089#1090'.'#1088#1091#1093#1091' '#1082#1086#1096#1090#1110#1074
        Options.Editing = False
        Options.Filtering = False
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'DATE_OST'
      end
      object cxGrid1NUM_DOG: TcxGridDBBandedColumn
        Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1091
        Options.Editing = False
        Options.Filtering = False
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'N_DOG'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 69
    Width = 1095
    Height = 377
    Align = alClient
    TabOrder = 2
    Visible = False
    object cxGrid2DBTableView1: TcxGridDBTableView
      DataController.DataSource = ds2
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'IN_DB_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn8
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'IN_KR_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn9
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'DB_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn10
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'KR_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn11
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'OUT_DB_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn12
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'OUT_KR_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn13
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'IN_DB_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn8
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'IN_KR_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn9
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'DB_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn10
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'KR_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn11
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'OUT_DB_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn12
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          FieldName = 'OUT_KR_SUMMA'
          Column = cxgrdbclmnGrid2DBTableView1DBColumn13
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Header = cxStyle2
      object cxgrdbclmnGrid2DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #1055#1030#1041
        Visible = False
        GroupIndex = 0
        Options.Editing = False
        SortOrder = soAscending
        Width = 218
        DataBinding.FieldName = 'FIO'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1091
        Visible = False
        Options.Editing = False
        Width = 113
        DataBinding.FieldName = 'NUM_DOG'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn14: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1080#1085#1080#1082#1085'. '#1079#1072#1073#1086#1088#1075'.'
        Visible = False
        Options.Editing = False
        DataBinding.FieldName = 'DATE_EXEC_DOLG'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn15: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1089#1090'.'#1088#1091#1093#1091' '#1082#1086#1096#1090#1110#1074
        Visible = False
        Options.Editing = False
        DataBinding.FieldName = 'DATE_OST_MOOVE'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Options.Editing = False
        Width = 90
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #1050#1086#1096#1090'.'
        Options.Editing = False
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn5: TcxGridDBColumn
        Caption = #1056#1079'.'
        Options.Editing = False
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn6: TcxGridDBColumn
        Caption = #1057#1090'.'
        Options.Editing = False
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn7: TcxGridDBColumn
        Caption = #1050#1045#1050#1042
        Options.Editing = False
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn8: TcxGridDBColumn
        Caption = #1044#1073'. ('#1074#1093'.)'
        Options.Editing = False
        Width = 90
        DataBinding.FieldName = 'IN_DB_SUMMA'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn9: TcxGridDBColumn
        Caption = #1050#1088'. ('#1074#1093'.)'
        Options.Editing = False
        Width = 82
        DataBinding.FieldName = 'IN_KR_SUMMA'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn10: TcxGridDBColumn
        Caption = #1044#1073'.'
        Options.Editing = False
        Width = 86
        DataBinding.FieldName = 'DB_SUMMA'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn11: TcxGridDBColumn
        Caption = #1050#1088'.'
        Options.Editing = False
        Width = 79
        DataBinding.FieldName = 'KR_SUMMA'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn12: TcxGridDBColumn
        Caption = #1044#1073'. ('#1074#1080#1093'.)'
        Options.Editing = False
        Width = 89
        DataBinding.FieldName = 'OUT_DB_SUMMA'
      end
      object cxgrdbclmnGrid2DBTableView1DBColumn13: TcxGridDBColumn
        Caption = #1050#1088'. ('#1074#1080#1093'.)'
        Options.Editing = False
        Width = 91
        DataBinding.FieldName = 'OUT_KR_SUMMA'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object DatabaseWork: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTr
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 502
    Top = 158
  end
  object DataSetWork: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    Left = 539
    Top = 157
    poSQLINT64ToBCD = True
  end
  object dsSourseWork: TDataSource
    DataSet = DataSetWork
    Left = 571
    Top = 157
  end
  object ReadTr: TpFIBTransaction
    DefaultDatabase = DatabaseWork
    TimeoutAction = TARollback
    Left = 601
    Top = 158
  end
  object StorProc: TpFIBStoredProc
    Database = DatabaseWork
    Transaction = ReadTr
    Left = 635
    Top = 158
  end
  object DataSetForGrid: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    SelectSQL.Strings = (
      
        'SELECT * FROM PC_TMP_OBOROT_SELECT_2(:ID_SESSION, :DATE_REG, :ID' +
        '_REG)')
    OnCalcFields = DataSetForGridCalcFields
    Left = 567
    Top = 125
    poSQLINT64ToBCD = True
    object DataSetForGridID_PC_TMP: TFIBBCDField
      FieldName = 'ID_PC_TMP'
      Size = 0
      RoundByScale = True
    end
    object DataSetForGridID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetForGridKOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetForGridIN_DB_SUMMA: TFIBBCDField
      FieldName = 'IN_DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetForGridIN_KR_SUMMA: TFIBBCDField
      FieldName = 'IN_KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetForGridOUT_DB_SUMMA: TFIBBCDField
      FieldName = 'OUT_DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetForGridOUT_KR_SUMMA: TFIBBCDField
      FieldName = 'OUT_KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetForGridDB_SUMMA: TFIBBCDField
      FieldName = 'DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetForGridKR_SUMMA: TFIBBCDField
      FieldName = 'KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetForGridID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DataSetForGridID_RZ: TFIBBCDField
      FieldName = 'ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object DataSetForGridID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DataSetForGridID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DataSetForGridSM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForGridSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object DataSetForGridRZ_TITLE: TFIBStringField
      FieldName = 'RZ_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForGridRZ_KOD: TFIBIntegerField
      FieldName = 'RZ_KOD'
    end
    object DataSetForGridST_TITLE: TFIBStringField
      FieldName = 'ST_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForGridST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object DataSetForGridKEKV_TITLE: TFIBStringField
      FieldName = 'KEKV_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForGridKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object DataSetForGridFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForGridID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetForGridSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetForGridSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetForGridIS_SUMMA: TFIBIntegerField
      FieldName = 'IS_SUMMA'
    end
    object DataSetForGridFIO_1: TFIBStringField
      DisplayWidth = 500
      FieldKind = fkCalculated
      FieldName = 'FIO_1'
      Size = 500
      EmptyStrToNull = True
      Calculated = True
    end
    object DataSetForGridFIO_VIVOD: TFIBStringField
      FieldName = 'FIO_VIVOD'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForGridDATE_OST_MOOVEE: TFIBDateField
      FieldName = 'DATE_OST_MOOVEE'
    end
    object DataSetForGridDATE_EXEC_DOLGG: TFIBDateField
      FieldName = 'DATE_EXEC_DOLGG'
    end
    object DataSetForGridNUM_DOG: TFIBStringField
      FieldName = 'NUM_DOG'
      Size = 75
      EmptyStrToNull = True
    end
    object DataSetForGridN_DOG: TStringField
      FieldKind = fkCalculated
      FieldName = 'N_DOG'
      Size = 75
      Calculated = True
    end
    object DataSetForGridDATE_EXEC: TDateField
      FieldKind = fkCalculated
      FieldName = 'DATE_EXEC'
      Calculated = True
    end
    object DataSetForGridDATE_OST: TDateField
      FieldKind = fkCalculated
      FieldName = 'DATE_OST'
      Calculated = True
    end
    object DataSetForGridDATE_OST_MOOVE: TFIBDateField
      FieldName = 'DATE_OST_MOOVE'
    end
    object DataSetForGridDATE_EXEC_DOLG: TFIBDateField
      FieldName = 'DATE_EXEC_DOLG'
    end
  end
  object dsForGrid: TDataSource
    DataSet = DataSetForGrid
    Left = 600
    Top = 124
  end
  object StyleRepository: TcxStyleRepository
    Left = 633
    Top = 123
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
      Font.Style = []
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
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    OpenDataSource = False
    DataSet = DataSetReport
    Left = 634
    Top = 239
  end
  object frReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40023.426448206000000000
    ReportOptions.LastChange = 40646.559362152800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 601
    Top = 238
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'ORG_NAME'
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'ORG_SHORT_NAME'
        Value = #39#1044#1086#1085#1053#1059#39
      end
      item
        Name = 'ORG_KOD_OKPO'
        Value = #39'02070803'#39
      end
      item
        Name = 'PERIOD'
        Value = #39#1042#1045#1056#1045#1057#1045#1053#1068'  2010'#39
      end
      item
        Name = 'FIO'
        Value = #39#39
      end
      item
        Name = 'SM'
        Value = #39#39
      end
      item
        Name = 'RZ'
        Value = #39#39
      end
      item
        Name = 'ST'
        Value = #39#39
      end
      item
        Name = 'OST'
        Value = #39#39
      end
      item
        Name = 'YEAR_B'
        Value = #39'2011'#39
      end
      item
        Name = 'YEAR_E'
        Value = #39'2011'#39
      end
      item
        Name = 'DATE_BEG'
        Value = #39'01.01.2011'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'31.01.2011'#39
      end
      item
        Name = 'SYSTEM_SCH'
        Value = #39' 364/02'#39
      end
      item
        Name = 'USER'
        Value = #39#1052#1040#1056#1044#1040#1056' '#1054#1051#1068#1043#1040' '#1042#1054#1051#1054#1044#1048#1052#1048#1056#1030#1042#1053#1040#39
      end
      item
        Name = 'FIO_FILTR'
        Value = #39#39
      end
      item
        Name = 'SM_FILTR'
        Value = #39#39
      end
      item
        Name = 'RZ_FILTR'
        Value = #39#39
      end
      item
        Name = 'ST_FILTR'
        Value = #39#39
      end
      item
        Name = 'SCH_FILTR'
        Value = #39#39
      end
      item
        Name = 'OST_FILTR'
        Value = #39#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 249.448980000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo35: TfrxMemoView
          Top = 7.559059999999999000
          Width = 306.141930000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_NAME]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1110#1082#1072#1094#1110#1081#1085#1080#1081
            #1082#1086#1076' '#1028#1044#1056#1055#1054#1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 98.267780000000000000
          Top = 30.236240000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_KOD_OKPO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Top = 68.031540000000010000
          Width = 721.890230000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1080' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1072#1084' [SYSTEM_SCH] '
            #1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [DATE_BEG] '#1087#1086' [DATE_END]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 3.779530000000000000
          Top = 136.063080000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1030#1041': [FIO_FILTR]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 3.779530000000000000
          Top = 154.960730000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1050#1086#1096#1090#1086#1088#1080#1089': [SM_FILTR]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 3.779530000000000000
          Top = 173.858380000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083': [RZ_FILTR]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 3.779530000000000000
          Top = 192.756030000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103': [ST_FILTR]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 3.779530000000000000
          Top = 211.653680000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082': [SCH_FILTR]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 3.779530000000000000
          Top = 230.551330000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1082#1080': [OST_FILTR]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 3.779530000000000000
          Top = 117.165430000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1060#1110#1083#1100#1090#1088#1072#1094#1110#1103':')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 200.315090000000000000
          Top = 181.417440000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            '[FIO_FILTR]')
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo3: TfrxMemoView
          Left = 204.094620000000000000
          Width = 105.826771653543000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[frxDBDataset1."SM_KOD"] / [frxDBDataset1."RZ_KOD"] / [frxDBData' +
              'set1."ST_KOD"] / [frxDBDataset1."KEKV_KOD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 309.921460000000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'IN_DB_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."IN_DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 376.062992125984000000
          Width = 66.141732283464600000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'IN_KR_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."IN_KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 442.205010000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'DB_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 514.016080000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'KR_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 585.827150000000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'OUT_DB_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."OUT_DB_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 651.968503937008000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'OUT_KR_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."OUT_KR_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 37.795300000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FIO"] ([frxDBDataset1."NUM_DOG"])')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line]')
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 37.795300000000000000
        ParentFont = False
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 204.094620000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1078'. '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 309.921460000000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1093#1110#1076#1085#1077)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 585.827150000000000000
          Width = 132.283464570000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1074#1080#1093#1110#1076#1085#1077)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 442.205010000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 514.016080000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 204.094620000000000000
          Top = 18.897650000000000000
          Width = 105.826771653543000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1096#1090'./'#1056#1079'./'#1057#1090'/'#1050#1045#1050#1042)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 309.921460000000000000
          Top = 18.897650000000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 585.827150000000000000
          Top = 18.897650000000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 651.968503937008000000
          Top = 18.897650000000000000
          Width = 66.141732283464600000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 376.062992125984000000
          Top = 18.897650000000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 442.205010000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 514.016080000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 37.795300000000000000
          Width = 166.299320000000000000
          Height = 37.795300000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Width = 37.795300000000000000
          Height = 37.795300000000000000
          Color = 13421772
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 102.047310000000000000
        ParentFont = False
        Top = 548.031850000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086'         ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 309.921460000000000000
          Width = 66.141732283464600000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 376.062992125984000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 442.205010000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 514.016080000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 585.827150000000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 651.968503937008000000
          Width = 66.141732283464600000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 15.118120000000000000
          Top = 75.590599999999990000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 86.929190000000000000
          Top = 75.590599999999990000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo6: TfrxMemoView
          Left = 351.496290000000000000
          Top = 75.590599999999990000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '/[USER]/')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 15.118120000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_SCH"'
        object Memo39: TfrxMemoView
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."SCH_NUMBER"] : [frxDBDataset1."SCH_TITLE"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 468.661720000000000000
        Width = 718.110700000000000000
        object Memo40: TfrxMemoView
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091' [frxDBDataset1."SCH_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 309.921460000000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 376.062992125984000000
          Width = 66.141732283464600000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."IN_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 442.205010000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 514.016080000000000000
          Width = 71.811023620000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 585.827150000000000000
          Width = 66.141732280000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_DB_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 651.968503937008000000
          Width = 66.141732283464600000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."OUT_KR_SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 15.118120000000000000
        Top = 672.756340000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Width = 336.378170000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': [Now]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1057#1090#1086#1088'. [Page#] '#1110#1079' [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object DataSetReport: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    SelectSQL.Strings = (
      
        'SELECT * FROM PC_TMP_OBOROT_SELECT(:ID_SESSION, :DATE_REG, :ID_R' +
        'EG)')
    Left = 537
    Top = 239
    poSQLINT64ToBCD = True
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 569
    Top = 239
  end
  object actlst1: TActionList
    Left = 636
    Top = 207
    object actShow: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1080
      ShortCut = 115
      OnExecute = actShowExecute
    end
    object actPrint: TAction
      Caption = #1044#1088#1091#1082
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 27
      OnExecute = actCloseExecute
    end
    object actFiltr: TAction
      Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080
      OnExecute = actFiltrExecute
    end
  end
  object FormStorage1: TFormStorage
    Active = False
    Options = [fpState, fpPosition, fpActiveControl]
    UseRegistry = True
    StoredProps.Strings = (
      'cxGridDB_SUMMA.Width'
      'cxGridIN_DB_SUMMA.Width'
      'cxGridIN_KR_SUMMA.Width'
      'cxGridOUT_DB_SUMMA.Width'
      'cxGridOUT_KR_SUMMA.Width'
      'cxGridKR_SUMMA.Width'
      'cxGridSch.Width')
    StoredValues = <
      item
        Name = 'Band1'
        Value = 0
      end
      item
        Name = 'Band2'
        Value = 0
      end
      item
        Name = 'Band3'
        Value = 0
      end
      item
        Name = 'Band4'
        Value = 0
      end
      item
        Name = 'Band5'
        Value = 0
      end
      item
        Name = 'Band6'
        Value = 0
      end>
    Left = 18
    Top = 151
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 438
    Top = 208
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    ShowProgress = True
    Left = 522
    Top = 273
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 553
    Top = 273
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 583
    Top = 273
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    Left = 644
    Top = 276
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 615
    Top = 275
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 672
    Top = 273
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 554
    Top = 305
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 520
    Top = 307
  end
  object ds_for_grid_2: TpFIBDataSet
    Database = DatabaseWork
    Transaction = ReadTr
    SelectSQL.Strings = (
      
        'select * from PC_TMP_OBOROT_SELECT(:id_session, :date_reg, :id_r' +
        'eg)')
    Left = 209
    Top = 240
    poSQLINT64ToBCD = True
    object ds_for_grid_2ID_PC_TMP: TFIBBCDField
      FieldName = 'ID_PC_TMP'
      Size = 0
      RoundByScale = True
    end
    object ds_for_grid_2ID_DOG: TFIBBCDField
      FieldName = 'ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object ds_for_grid_2KOD_DOG: TFIBBCDField
      FieldName = 'KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object ds_for_grid_2IN_DB_SUMMA: TFIBBCDField
      FieldName = 'IN_DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2IN_KR_SUMMA: TFIBBCDField
      FieldName = 'IN_KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2OUT_DB_SUMMA: TFIBBCDField
      FieldName = 'OUT_DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2OUT_KR_SUMMA: TFIBBCDField
      FieldName = 'OUT_KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2DB_SUMMA: TFIBBCDField
      FieldName = 'DB_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2KR_SUMMA: TFIBBCDField
      FieldName = 'KR_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2ID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object ds_for_grid_2ID_RZ: TFIBBCDField
      FieldName = 'ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object ds_for_grid_2ID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object ds_for_grid_2ID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object ds_for_grid_2SM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object ds_for_grid_2SM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object ds_for_grid_2RZ_TITLE: TFIBStringField
      FieldName = 'RZ_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object ds_for_grid_2RZ_KOD: TFIBIntegerField
      FieldName = 'RZ_KOD'
    end
    object ds_for_grid_2ST_TITLE: TFIBStringField
      FieldName = 'ST_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object ds_for_grid_2ST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object ds_for_grid_2KEKV_TITLE: TFIBStringField
      FieldName = 'KEKV_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object ds_for_grid_2KEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object ds_for_grid_2FIO: TFIBStringField
      FieldName = 'FIO'
      Size = 500
      EmptyStrToNull = True
    end
    object ds_for_grid_2ID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object ds_for_grid_2SCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object ds_for_grid_2SCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object ds_for_grid_2DATE_OST_MOOVE: TFIBDateField
      FieldName = 'DATE_OST_MOOVE'
    end
    object ds_for_grid_2DATE_EXEC_DOLG: TFIBDateField
      FieldName = 'DATE_EXEC_DOLG'
    end
    object ds_for_grid_2NUM_DOG: TFIBStringField
      FieldName = 'NUM_DOG'
      Size = 75
      EmptyStrToNull = True
    end
    object ds_for_grid_2IN_DB_SUMMA_VAL: TFIBBCDField
      FieldName = 'IN_DB_SUMMA_VAL'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2IN_KR_SUMMA_VAL: TFIBBCDField
      FieldName = 'IN_KR_SUMMA_VAL'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2OUT_DB_SUMMA_VAL: TFIBBCDField
      FieldName = 'OUT_DB_SUMMA_VAL'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2OUT_KR_SUMMA_VAL: TFIBBCDField
      FieldName = 'OUT_KR_SUMMA_VAL'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2DB_SUMMA_VAL: TFIBBCDField
      FieldName = 'DB_SUMMA_VAL'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2KR_SUMMA_VAL: TFIBBCDField
      FieldName = 'KR_SUMMA_VAL'
      Size = 2
      RoundByScale = True
    end
    object ds_for_grid_2ID_VALUTE: TFIBBCDField
      FieldName = 'ID_VALUTE'
      Size = 0
      RoundByScale = True
    end
  end
  object ds2: TDataSource
    DataSet = ds_for_grid_2
    Left = 173
    Top = 240
  end
end
