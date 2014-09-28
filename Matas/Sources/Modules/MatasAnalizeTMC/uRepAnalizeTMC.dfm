object RepAnalizeTMCForm: TRepAnalizeTMCForm
  Left = 391
  Top = 233
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1087#1077#1088#1072#1094#1080#1103#1084
  ClientHeight = 378
  ClientWidth = 494
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
    Left = 18
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
    Left = 24
    Top = 268
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
  object Label4: TLabel
    Left = 288
    Top = 294
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
  object Label3: TLabel
    Left = 288
    Top = 12
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
  object cxMonthBeg: TcxComboBox
    Left = 104
    Top = 8
    Width = 89
    Height = 21
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
  object cxYearBeg: TcxSpinEdit
    Left = 208
    Top = 8
    Width = 65
    Height = 21
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
    Left = 119
    Top = 344
    Width = 125
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
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
    Left = 253
    Top = 344
    Width = 125
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
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
  object cxCheckEditRep: TcxCheckBox
    Left = 3
    Top = 357
    Width = 25
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 18
  end
  object cxReport: TcxComboBox
    Left = 64
    Top = 264
    Width = 425
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 10
    Properties.Items.Strings = (
      #1047#1074#1110#1090' '#1087#1086' '#1076#1077#1073#1077#1090#1091
      #1047#1074#1110#1090' '#1087#1086' '#1082#1088#1077#1076#1110#1090#1091
      #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100)
    TabOrder = 12
  end
  object cxCheckOnPrinter: TcxCheckBox
    Left = 48
    Top = 291
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
    TabOrder = 13
  end
  object cxSelectPrinter: TcxCheckBox
    Left = 48
    Top = 315
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
    TabOrder = 15
  end
  object cxCopies: TcxSpinEdit
    Left = 398
    Top = 291
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
    TabOrder = 14
    Value = 1
  end
  object CBDeb: TcxCheckBox
    Left = 8
    Top = 104
    Width = 185
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CBDebPropertiesChange
    Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1076#1077#1073#1077#1090#1091' '#1088#1072#1093#1091#1085#1082#1110#1074
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object CBKred: TcxCheckBox
    Left = 8
    Top = 136
    Width = 193
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CBKredPropertiesChange
    Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091' '#1088#1072#1093#1091#1085#1082#1110#1074
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object CBBut: TcxCheckBox
    Left = 8
    Top = 168
    Width = 169
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CBButPropertiesChange
    Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1072#1084
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object CBStatRoz: TcxCheckBox
    Left = 8
    Top = 200
    Width = 209
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CBStatRozPropertiesChange
    Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1088#1086#1079#1076#1110#1083#1072#1084'/'#1089#1090#1072#1090#1090#1103#1084
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object CBKek: TcxCheckBox
    Left = 8
    Top = 232
    Width = 137
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CBKekPropertiesChange
    Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1050#1045#1050#1042#1072#1084
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object BEDeb: TcxButtonEdit
    Left = 208
    Top = 104
    Width = 281
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BEDebPropertiesButtonClick
    Properties.OnChange = BEDebPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Text = 'BEDeb'
  end
  object BEKred: TcxButtonEdit
    Left = 208
    Top = 136
    Width = 282
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BEKredPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Text = 'cxButtonEdit1'
  end
  object BEBut: TcxButtonEdit
    Left = 208
    Top = 168
    Width = 282
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BEButPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Text = 'cxButtonEdit1'
  end
  object BEStatRoz: TcxButtonEdit
    Left = 209
    Top = 200
    Width = 282
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BEStatRozPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
    Text = 'cxButtonEdit1'
  end
  object BEKek: TcxButtonEdit
    Left = 208
    Top = 232
    Width = 283
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BEKekPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
    Text = 'cxButtonEdit1'
  end
  object cxMonthEnd: TcxComboBox
    Left = 320
    Top = 8
    Width = 89
    Height = 21
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
    TabOrder = 19
  end
  object cxYearEnd: TcxSpinEdit
    Left = 424
    Top = 8
    Width = 65
    Height = 21
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 20
  end
  object CBGrTMC: TcxCheckBox
    Left = 8
    Top = 40
    Width = 185
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CBGrTMCPropertiesChange
    Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1075#1088#1091#1087#1072#1084' '#1058#1052#1062
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 21
  end
  object CBTMC: TcxCheckBox
    Left = 8
    Top = 72
    Width = 185
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CBTMCPropertiesChange
    Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1058#1052#1062
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 22
  end
  object BEGrTMC: TcxButtonEdit
    Left = 208
    Top = 40
    Width = 281
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BEGrTMCPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 23
    Text = 'gruppa TMC'
  end
  object BETMC: TcxButtonEdit
    Left = 208
    Top = 72
    Width = 281
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BETMCPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 24
    Text = 'TMC'
  end
  object cxExportExel: TcxCheckBox
    Left = 280
    Top = 315
    Width = 161
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1045#1082#1089#1087#1086#1088#1090#1091#1074#1072#1090#1080' '#1074' Exel'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 25
  end
  object WorkDatabase: TpFIBDatabase
    DBName = 'D:\Project\DonNU\DataBase\FULL_DB_COPY.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = WorkTransaction
    DefaultUpdateTransaction = WorkTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 184
    Top = 192
  end
  object WorkTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 152
    Top = 192
  end
  object KeyActionList: TActionList
    Left = 280
    Top = 224
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object ActionOk: TAction
      Caption = 'ActionOk'
      ShortCut = 13
    end
  end
  object OperStProc: TpFIBStoredProc
    Database = WorkDatabase
    SQL.Strings = (
      'EXECUTE PROCEDURE "StPr" ')
    Transaction = WorkTransaction
    StoredProcName = 'StPr'
    Left = 120
    Top = 192
  end
  object DataSetForTMC: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WorkTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_SEL_NOMN_OPER_FULL ('
      '    :date_beg,'
      '    :date_end,'
      '    :session,'
      '    :grtmc,'
      '    :tmc,'
      '    :debet,'
      '    :kredit,'
      '    :rozd_stat,'
      '    :kekv,'
      '    :byutj,'
      '    :tip)')
    Left = 216
    Top = 192
    poSQLINT64ToBCD = True
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
    ReportOptions.CreateDate = 40283.527584629600000000
    ReportOptions.LastChange = 40284.444784965300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 249
    Top = 192
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
        Name = 'ORG_KOD_OKPO '
        Value = Null
      end
      item
        Name = 'PERIOD'
        Value = Null
      end
      item
        Name = 'TIP'
        Value = #39#1074#1080#1074#1077#1076#1077#1085#1080#1093' '#1079#39
      end
      item
        Name = 'DATE_BEG'
        Value = #39'01.03.2010'#39
      end
      item
        Name = 'DATE_END'
        Value = #39'31.03.2010'#39
      end
      item
        Name = 'ORG_KOD_OKPO'
        Value = #39'02070803'#39
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
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."NAME_SCH"'
        object Memo1: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082' [frxDBDataset1."NUM_SCH"] / [frxDBDataset1."NAME_SCH"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."FIO_MOL"'
        object Memo3: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."FIO_MOL"] : [frxDBDataset1."NAME_DEPARTMENT"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 442.205010000000000000
        Visible = False
        Width = 718.110700000000000000
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 487.559370000000000000
        Visible = False
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 400.630180000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."FULL_INV"]')
        end
        object Memo4: TfrxMemoView
          Left = 68.031540000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_KART"]')
        end
        object Memo5: TfrxMemoView
          Left = 313.700990000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."BAL_PRICE"]')
        end
        object Memo8: TfrxMemoView
          Left = 396.850650000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DATE_OPR"]')
        end
        object Memo9: TfrxMemoView
          Left = 506.457020000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DATE_EXPL"]')
        end
        object Memo16: TfrxMemoView
          Left = 612.283860000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset1."DATE_OUT"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1074'.'#1085#1086#1084#1077#1088)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 68.031540000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 313.700990000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1072#1083'.'#1074#1072#1088#1090#1110#1089#1090#1100)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 396.850650000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1086#1087#1088#1080#1073#1091#1090#1082#1091#1074'.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 506.457020000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1086#1095'.'#1077#1082#1089#1087#1083'.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 612.283860000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1089#1087#1080#1089#1072#1085#1085#1103)
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 196.535560000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 0.220470000000000000
          Width = 380.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_NAME]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 107.118120000000000000
          Top = 16.000000000000000000
          Width = 156.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1086', '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103')')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 47.559060000000000000
          Width = 96.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            #1050#1086#1076' '#1028#1044#1056#1055#1054#1059)
        end
        object Memo18: TfrxMemoView
          Left = 99.779530000000000000
          Top = 45.559060000000000000
          Width = 132.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_KOD_OKPO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1054#1057' [TIP] '#1077#1082#1089#1087#1083#1091#1072#1090#1072#1094#1110#1111)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 128.504020000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079' [DATE_BEG] '#1087#1086' [DATE_END]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSetForTMC
    Left = 284
    Top = 192
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 424
    Top = 152
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 424
    Top = 184
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 424
    Top = 216
  end
end
