object InvRepForm: TInvRepForm
  Left = 452
  Top = 294
  BorderStyle = bsDialog
  ClientHeight = 216
  ClientWidth = 489
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
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 52
    Height = 13
    Caption = #1055#1077#1088#1110#1086#1076' '#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 63
    Width = 34
    Height = 16
    Caption = #1052#1042#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 91
    Width = 25
    Height = 13
    Caption = #1047#1074#1110#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelSch: TLabel
    Left = 352
    Top = 11
    Width = 49
    Height = 13
    Caption = #1056#1072#1093#1091#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 248
    Top = 117
    Width = 91
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1086#1087#1110#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 46
    Top = 36
    Width = 15
    Height = 13
    Caption = #1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxMonth: TcxComboBox
    Left = 64
    Top = 8
    Width = 89
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    Properties.Items.Strings = (
      #1103#1085#1074#1072#1088#1100
      #1092#1077#1074#1088#1072#1083#1100
      #1084#1072#1088#1090
      #1072#1087#1088#1077#1083#1100
      #1084#1072#1081
      #1080#1102#1085#1100
      #1080#1102#1083#1100
      #1072#1074#1075#1091#1089#1090
      #1089#1077#1085#1090#1103#1073#1088#1100
      #1086#1082#1090#1103#1073#1088#1100
      #1085#1086#1103#1073#1088#1100
      #1076#1077#1082#1072#1073#1088#1100)
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 0
  end
  object cxYear: TcxSpinEdit
    Left = 155
    Top = 8
    Width = 63
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 1
  end
  object OkButton: TcxButton
    Left = 275
    Top = 180
    Width = 101
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = OkButtonClick
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
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    UseSystemPaint = False
  end
  object CancelButton: TcxButton
    Left = 380
    Top = 180
    Width = 101
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = CancelButtonClick
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
  object cxCheckBox1: TcxCheckBox
    Left = -4
    Top = 196
    Width = 25
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 11
  end
  object cxMatOtv: TcxButtonEdit
    Left = 64
    Top = 60
    Width = 417
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxMatOtvPropertiesButtonClick
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object cxReport: TcxComboBox
    Left = 64
    Top = 87
    Width = 417
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '')
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object cxSchEdit: TcxButtonEdit
    Left = 408
    Top = 8
    Width = 73
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxSchEditPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    OnKeyDown = cxSchEditKeyDown
  end
  object cxCheckOnPrinter: TcxCheckBox
    Left = 64
    Top = 114
    Width = 169
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object cxSelectPrinter: TcxCheckBox
    Left = 64
    Top = 138
    Width = 153
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1088#1080#1085#1090#1077#1088
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object cxCopies: TcxSpinEdit
    Left = 344
    Top = 114
    Width = 49
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.MaxValue = 999.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.ReadOnly = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Value = 1
  end
  object cxPrintKol: TcxCheckBox
    Left = 243
    Top = 130
    Width = 222
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1087#1086#1074#1085#1102#1074#1072#1090#1080' '#1082#1110#1083#1100#1082#1110#1089#1090#1100' '#1110' '#1089#1091#1084#1084#1091
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object cxButton1: TcxButton
    Left = 6
    Top = 180
    Width = 125
    Height = 25
    Action = actShablon
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF004B0011A423004B00FF00FFFF00FFFF
      00FFFF00FFFF00FF004B0011A423004B00FF00FFFF00FFFF00FFFF00FF004B00
      27BF461AAD3111A321004B00FF00FFFF00FFFF00FF004B0027BF461AAD3111A3
      21004B00FF00FFFF00FF004B0040DE702DC55323B64018AB2E11A121004B00FF
      00FF004B0040DE702DC55323B64018AB2E11A121004B00FF00FFFF00FF004B00
      3EDC6F2DC25024BC42004B00FF00FFFF00FFFF00FF004B003EDC6F2DC25024BC
      42004B00FF00FFFF00FFFF00FFFF00FF004B003FDE70004B00FF00FFFF00FFFF
      00FFFF00FFFF00FF004B003FDE70004B00FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004600FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF004600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF004B00004F00005300005300004D00005300005300004F00004B00FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
      350FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF000082000082000082000082000082000082000082FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000820629F40125FF00
      18F80011D80108AF000082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0000821639EB0C36FF0224FF0019F8000ED0000082FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000822449EB204EFF0E
      38FF0328FF0016E7000082FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0000822D55F3366AFF2758FF1546FF0528F4000082FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008200008200008200
      0082000082000082000082FF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 135
    Top = 180
    Width = 136
    Height = 25
    Action = actShPrint
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
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
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    UseSystemPaint = False
  end
  object cxMonthEnd: TcxComboBox
    Left = 64
    Top = 32
    Width = 89
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 12
    Properties.Items.Strings = (
      #1103#1085#1074#1072#1088#1100
      #1092#1077#1074#1088#1072#1083#1100
      #1084#1072#1088#1090
      #1072#1087#1088#1077#1083#1100
      #1084#1072#1081
      #1080#1102#1085#1100
      #1080#1102#1083#1100
      #1072#1074#1075#1091#1089#1090
      #1089#1077#1085#1090#1103#1073#1088#1100
      #1086#1082#1090#1103#1073#1088#1100
      #1085#1086#1103#1073#1088#1100
      #1076#1077#1082#1072#1073#1088#1100)
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 14
  end
  object cxYearEnd: TcxSpinEdit
    Left = 155
    Top = 32
    Width = 63
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 15
  end
  object cxDates: TcxCheckBox
    Left = 242
    Top = 150
    Width = 222
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1087#1086#1074#1085#1102#1074#1072#1090#1080' '#1076#1072#1090#1080' '#1110#1085#1074#1077#1085#1090#1072#1088#1080#1079#1094#1110#1111
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 16
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = WorkTransaction
    DefaultUpdateTransaction = WorkTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 224
    Top = 32
  end
  object WorkTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 256
    Top = 32
  end
  object ReportDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WorkTransaction
    Left = 296
    Top = 32
    poSQLINT64ToBCD = True
  end
  object KeyActionList: TActionList
    Left = 448
    Top = 82
    object ActionCancel: TAction
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object ActionOk: TAction
      Caption = 'ActionOk'
      ShortCut = 16419
      OnExecute = ActionOkExecute
    end
    object actShablon: TAction
      Caption = #1047#1072#1076#1072#1090#1080' '#1096#1072#1073#1083#1086#1085
      OnExecute = actShablonExecute
    end
    object actShPrint: TAction
      Caption = #1044#1088#1091#1082' '#1079#1072' '#1096#1072#1073#1083#1086#1085#1086#1084
      OnExecute = actShPrintExecute
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.DoubleBuffered = False
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 41079.482124745400000000
    ReportOptions.LastChange = 41107.550983784700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 2
    Top = 136
    Datasets = <
      item
        DataSetName = 'frxDBDataset_mna_kart'
      end
      item
        DataSetName = 'frxDBDataset_oper'
      end>
    Variables = <
      item
        Name = 'ORG_NAME'
        Value = #39#1044#1086#1085#1053#1059#1045#1058' '#39
      end
      item
        Name = 'ORG_SHORT_NAME'
        Value = #39#1044#1086#1085#1053#1059#1045#1058#39
      end
      item
        Name = 'ORG_KOD_OKPO'
        Value = #39'01566057'#39
      end
      item
        Name = 'PERIOD'
        Value = #39'01.03.2012'#39
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
        Height = 411.968770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 442.205010000000000000
          Width = 264.567100000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' '#1054#1047'-9 ('#1073#1102#1076#1078#1077#1090')')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 445.984540000000000000
          Top = 34.015770000000000000
          Width = 264.567100000000000000
          Height = 79.370130000000000000
          Memo.Strings = (
            #1047#1040#1058#1042#1045#1056#1044#1046#1045#1053#1054
            #1085#1072#1082#1072#1079#1086#1084' '#1043#1086#1083#1086#1074#1085#1086#1075#1086' '#1091#1087#1088#1072#1074#1083#1110#1085#1085#1103
            #1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080','
            #1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1086#1084#1110#1090#1077#1090#1091' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080' '#1059#1082#1088#1072#1111#1085#1080
            #1074#1110#1076' 2 '#1075#1088#1091#1076#1085#1103' 1997'#1088'. '#8470'125/70')
        end
        object Memo3: TfrxMemoView
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_NAME]')
        end
        object Memo4: TfrxMemoView
          Top = 22.677180000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1079#1074#1072' '#1091#1089#1090#1072#1085#1086#1074#1080')')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 132.283550000000000000
          Width = 120.944960000000000000
          Height = 30.236240000000000000
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081
            #1082#1086#1076' '#1028#1044#1056#1055#1054#1059)
        end
        object Memo6: TfrxMemoView
          Left = 442.205010000000000000
          Top = 132.283550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044)
        end
        object Memo7: TfrxMemoView
          Left = 132.283550000000000000
          Top = 136.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_KOD_OKPO]')
        end
        object Memo8: TfrxMemoView
          Left = 544.252320000000000000
          Top = 132.283550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo9: TfrxMemoView
          Left = -3.779530000000000000
          Top = 204.094620000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1053#1042#1045#1053#1058#1040#1056#1053#1040' '#1050#1040#1056#1058#1050#1040' '#8470
            #1075#1088#1091#1087#1086#1074#1086#1075#1086' '#1086#1073#1083#1110#1082#1091' '#1086#1089#1085#1086#1074#1085#1080#1093' '#1079#1072#1089#1086#1073#1110#1074' '#1074' '#1073#1102#1076#1078#1077#1090#1085#1080#1093' '#1091#1089#1090#1072#1085#1086#1074#1072#1093)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 257.008040000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset_mna_kart."NAME"]')
        end
        object Memo11: TfrxMemoView
          Top = 275.905690000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1086#1074#1085#1077' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1110' '#1087#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103')')
        end
        object Memo12: TfrxMemoView
          Top = 309.921460000000000000
          Width = 211.653680000000000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1090#1072#1085#1086#1074#1072' ('#1074#1110#1076#1076#1110#1083')'
            '[frxDBDataset_mna_kart."NAME_DEPARTMENT"]')
        end
        object Memo13: TfrxMemoView
          Left = 211.653680000000000000
          Top = 309.921460000000000000
          Width = 139.842610000000000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086' '#1074#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1072' '#1086#1089#1086#1073#1072
            '[frxDBDataset_mna_kart."SFIO"]')
        end
        object Memo14: TfrxMemoView
          Left = 351.496290000000000000
          Top = 309.921460000000000000
          Width = 79.370130000000000000
          Height = 52.913420000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1074#1077#1085#1090#1072#1088#1085#1080#1081' '#1085#1086#1084#1077#1088
            '[frxDBDataset_mna_kart."NNUM"]')
        end
        object Memo15: TfrxMemoView
          Left = 430.866420000000000000
          Top = 309.921460000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1085#1086#1089', '#1075#1088#1085'.')
        end
        object Memo16: TfrxMemoView
          Left = 430.866420000000000000
          Top = 328.819110000000000000
          Width = 230.551330000000000000
          Height = 34.015770000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset_mna_kart."SUMMA_AMORT"]')
        end
        object Memo17: TfrxMemoView
          Left = 661.417750000000000000
          Top = 328.819110000000000000
          Width = 56.692950000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo18: TfrxMemoView
          Top = 362.834880000000000000
          Width = 79.370130000000000000
          Height = 49.133890000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1074'. '#8470
            #1053#1086#1084#1077#1085#1082#1083'. '#8470)
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 79.370130000000000000
          Top = 362.834880000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1040#1044#1030#1049#1064#1051#1054)
        end
        object Memo20: TfrxMemoView
          Left = 79.370130000000000000
          Top = 381.732530000000000000
          Width = 71.811070000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1072#1090#1072)
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 151.181200000000000000
          Top = 381.732530000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1084'/'#1086)
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 196.535560000000000000
          Top = 381.732530000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111)
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 253.228510000000000000
          Top = 381.732530000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1110#1083#1100'-'
            #1082#1110#1089#1090#1100)
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 298.582870000000000000
          Top = 381.732530000000000000
          Width = 52.913420000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1091#1084#1072)
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 351.496290000000000000
          Top = 362.834880000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1048#1041#1059#1051#1054)
        end
        object Memo26: TfrxMemoView
          Left = 351.496290000000000000
          Top = 381.732530000000000000
          Width = 71.811070000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1076#1072#1090#1072)
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 423.307360000000000000
          Top = 381.732530000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1084'/'#1086)
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 468.661720000000000000
          Top = 381.732530000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1074#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111)
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 525.354670000000000000
          Top = 381.732530000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1110#1083#1100'-'
            #1082#1110#1089#1090#1100)
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 570.709030000000000000
          Top = 381.732530000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1091#1084#1072)
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 627.401980000000000000
          Top = 362.834880000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1040#1051#1048#1064#1054#1050)
        end
        object Memo32: TfrxMemoView
          Left = 627.401980000000000000
          Top = 381.732530000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1082#1110#1083#1100'-'
            #1082#1110#1089#1090#1100)
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 672.756340000000000000
          Top = 381.732530000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1089#1091#1084#1072)
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 491.338900000000000000
        Width = 718.110700000000000000
        DataSetName = 'frxDBDataset_oper'
        RowCount = 0
        Stretched = True
        object Memo34: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset_mna_kart."NNUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 79.370130000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset_oper."DATE_DOC_PRH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 151.181200000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 196.535560000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset_oper."NAME_OPER_PRH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 253.228510000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset_oper."KOL_MAT_PRH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 298.582870000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset_oper."SUMMA_PRH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 351.496290000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset_oper."DATE_DOC_RSH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 423.307360000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 468.661720000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset_oper."NAME_OPER_RSH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 525.354670000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset_oper."KOL_MAT_RSH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 570.709030000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset_oper."SUMMA_RSH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 627.401980000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 672.756340000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 18.897650000000000000
        Top = 570.709030000000000000
        Width = 718.110700000000000000
        object Memo35: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 79.370130000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 151.181200000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 196.535560000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 253.228510000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 298.582870000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 351.496290000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 423.307360000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 468.661720000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 525.354670000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 570.709030000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 627.401980000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset_mna_kart."KOL_MAT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 672.756340000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset_mna_kart."SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 3
    Top = 107
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 34
    Top = 107
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 70
    Top = 136
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ReportDataSet
    Left = 33
    Top = 138
  end
  object ds_vibor: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WorkTransaction
    Left = 328
    Top = 32
    poSQLINT64ToBCD = True
  end
  object ds_sch: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WorkTransaction
    Left = 360
    Top = 32
    poSQLINT64ToBCD = True
  end
end
