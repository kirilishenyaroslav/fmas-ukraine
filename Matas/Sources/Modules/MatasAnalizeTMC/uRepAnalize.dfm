object RepAnalizeForm: TRepAnalizeForm
  Left = 303
  Top = 250
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1087#1077#1088#1072#1094#1080#1103#1084
  ClientHeight = 391
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
    Top = 299
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
    Left = 128
    Top = 357
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
      760A0000424D760E000000000000360800002800000014000000140000000100
      2000000000004006000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600D4F0FF00B1E2F8008ED4DF006BC9D10048B8C30025AABD0000AAC5000092
      AF00007A930000626200004A4A0000323200D4E3FF00B1C7FF008EABFF006B8F
      FF004873FF002557FF000055FF000049DC00003DB90000319600002573000019
      5000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000FE000000
      DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8EFF008F6B
      FF007348FF005725FF005500FF004900DC003D00B90031009600250073001900
      5000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF009200
      DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00FF6B
      FF00FF48FF00FF25FF00FE00FE00DC00DC00B900B90096009600730073005000
      5000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00DC00
      9200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8EAB00FF6B
      8F00FF487300FF255700FF005500DC004900B9003D0096003100730025005000
      1900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FE000000DC00
      0000B9000000960000007300000050000000FFE3D400FFC7B100FFAB8E00FF8F
      6B00FF734800FF572500FF550000DC490000B93D000096310000732500005019
      0000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000DC92
      0000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF8E00FFFF
      6B00FFFF4800FFFF2500FEFE0000DCDC0000B9B9000096960000737300005050
      0000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC
      00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF8E008FFF
      6B0073FF480057FF250055FF000049DC00003DB9000031960000257300001950
      0000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FE000000DC
      000000B90000009600000073000000500000D4FFE300B1FFC7008EFFAB006BFF
      8F0048FF730025FF570000FF550000DC490000B93D0000963100007325000050
      1900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA0000DC
      920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFFFF006BFF
      FF0048FFFF0025FFFF0000FEFE0000DCDC0000B9B90000969600007373000050
      5000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA009E9E
      9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A4A003E3E
      3E0032323200262626001A1A1A000E0E0E00F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6
      B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6B60062626200626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B600626262000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000032323200B6B6
      B600FFFFFF00FFFFFF00B6B6B60062626200000000006262620000AAC50000AA
      C50000AAC50000AAC50000AAC50000AAC50000AAC50000AAC50000AAC50000AA
      C500007A930048B8C3000000000032323200B6B6B600FFFFFF00626262000000
      00006262620048B8C30048B8C30048B8C30048B8C30048B8C30048B8C30048B8
      C30048B8C30048B8C30048B8C30048B8C30000AAC500007A930048B8C3000000
      000032323200B6B6B6006262620000000000007A9300007A9300007A9300007A
      9300007A9300007A9300007A9300007A9300007A9300007A9300007A9300007A
      9300007A9300007A930048B8C30048B8C3000000000032323200626262000000
      00006BC9D1006BC9D1006BC9D1006BC9D1006BC9D1006BC9D1006BC9D1006BC9
      D1008ED4DF008ED4DF008ED4DF008ED4DF008ED4DF0000AAC5000092AF0048B8
      C300007A9300000000006262620000000000B1E2F8006BC9D1006BC9D1006BC9
      D1006BC9D1006BC9D1008ED4DF008ED4DF008ED4DF008ED4DF008ED4DF00007A
      93008ED4DF0000AAC5008ED4DF000092AF000092AF0000000000626262000000
      0000B1E2F800B1E2F8006BC9D1006BC9D1006BC9D1006BC9D1006BC9D1008ED4
      DF008ED4DF008ED4DF0000626200006262008ED4DF0000AAC5008ED4DF008ED4
      DF000092AF00000000006262620000000000B1E2F800B1E2F800B1E2F800B1E2
      F800B1E2F800B1E2F800B1E2F800B1E2F800B1E2F800B1E2F800B1E2F8008ED4
      DF008ED4DF0000AAC500B1E2F8008ED4DF000092AF0000000000626262000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000AAC500B1E2
      F8000092AF0000000000626262000000000062626200B1E2F80048B8C30048B8
      C30048B8C30048B8C30048B8C30048B8C30048B8C30048B8C30048B8C30048B8
      C30048B8C30048B8C300FFFFFF0000AAC5000092AF0000000000B6B6B6006262
      62000000000062626200B1E2F800004A4A00004A4A00004A4A00004A4A00004A
      4A00004A4A00004A4A00004A4A00004A4A00004A4A00004A4A0048B8C300FFFF
      FF0000AAC50000000000FFFFFF00B6B6B6006262620000000000626262000000
      0000B9B900008EABFF00B9B90000B9B90000B9B90000DCDC0000DCDC0000DCDC
      0000DCDC000000000000004A4A00007A9300007A930000000000FFFFFF00FFFF
      FF00B6B6B600626262000000000000000000AAAAAA00B1C7FF00C2C2C200C2C2
      C200C2C2C200CECECE00E6E6E600E6E6E600E6E6E60000000000004A4A000000
      0000000000006E6E6E00FFFFFF00FFFFFF00FFFFFF00B6B6B600626262006262
      620000000000DCDC0000B1C7FF00DCDC0000DCDC0000DCDC0000DCDC0000DCDC
      0000FFFF8E00FFFF8E000000000032323200B6B6B600B6B6B600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B6B6B600B6B6B60000000000AAAAAA00B1C7FF00CECE
      CE00E6E6E600E6E6E600E6E6E600FFFFFF00FFFFFF00FFFFFF00000000003232
      3200B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B6006262620000000000FFFF8E00B1C7FF00FFFF8E00FFFF8E00FFFF8E00FFFF
      8E00FFFF8E00FFFF8E00FFFF8E00000000006E6E6E00B6B6B600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6B60000000000AAAAAA00B1C7
      FF00CECECE00E6E6E600E6E6E600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000062626200B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B6B6B6006262620000000000000000000000000000000000000000000000
      000000000000000000000000000032323200B6B6B600FFFFFF00}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    UseSystemPaint = False
  end
  object CancelButton: TcxButton
    Left = 304
    Top = 357
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
      760A0000424D760E000000000000360800002800000014000000140000000100
      2000000000004006000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600D4F0FF00B1E2FF008ED4FF006BC6FF0048B8FF0025AAFF0000AAFF000092
      DC00007AB90000629600004A730000325000D4E3FF00B1C7FF008EABFF006B8F
      FF004873FF002557FF000055FF000049DC00003DB90000319600002573000019
      5000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000FE000000
      DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8EFF008F6B
      FF007348FF005725FF005500FF004900DC003D00B90031009600250073001900
      5000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF009200
      DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00FF6B
      FF00FF48FF00FF25FF00FE00FE00DC00DC00B900B90096009600730073005000
      5000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00DC00
      9200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8EAB00FF6B
      8F00FF487300FF255700FF005500DC004900B9003D0096003100730025005000
      1900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FE000000DC00
      0000B9000000960000007300000050000000FFE3D400FFC7B100FFAB8E00FF8F
      6B00FF734800FF572500FF550000DC490000B93D000096310000732500005019
      0000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000DC92
      0000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF8E00FFFF
      6B00FFFF4800FFFF2500FEFE0000DCDC0000B9B9000096960000737300005050
      0000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC
      00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF8E008FFF
      6B0073FF480057FF250055FF000049DC00003DB9000031960000257300001950
      0000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FE000000DC
      000000B90000009600000073000000500000D4FFE300B1FFC7008EFFAB006BFF
      8F0048FF730025FF570000FF550000DC490000B93D0000963100007325000050
      1900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA0000DC
      920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFFFF006BFF
      FF0048FFFF0025FFFF0000FEFE0000DCDC0000B9B90000969600007373000050
      5000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA009E9E
      9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A4A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF004A4A4A000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000310096000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF004A4A4A000000000031009600000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000310096004900DC003100
      96000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4A4A000000
      0000310096004900DC00310096000000000000000000FFFFFF00FFFFFF000000
      00004900DC004900DC004900DC004900DC00310096000000000000000000FFFF
      FF00FFFFFF004A4A4A0000000000310096004900DC004900DC004900DC004900
      DC0000000000FFFFFF00FFFFFF0000000000000000008F6BFF004900DC004900
      DC004900DC003100960000000000626262006262620000000000310096004900
      DC004900DC004900DC008F6BFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000008F6BFF004900DC004900DC004900DC00310096000000
      000000000000310096004900DC004900DC004900DC008F6BFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008F6B
      FF004900DC004900DC004900DC0031009600310096004900DC004900DC004900
      DC008F6BFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000008F6BFF004900DC004900DC004900
      DC004900DC004900DC004900DC008F6BFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006262
      6200000000008F6BFF004900DC004900DC004900DC004900DC008F6BFF000000
      000062626200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006262620000000000310096004900DC004900
      DC004900DC004900DC00310096000000000062626200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000310096004900DC004900DC004900DC004900DC004900DC004900DC003100
      96000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000310096004900DC004900DC004900DC008F6B
      FF008F6BFF004900DC004900DC004900DC00310096000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000310096004900
      DC004900DC004900DC008F6BFF0000000000000000008F6BFF004900DC004900
      DC004900DC00310096000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000310096004900DC004900DC004900DC008F6BFF00000000006262
      620062626200000000008F6BFF004900DC004900DC004900DC00310096000000
      000000000000FFFFFF00FFFFFF00000000008F6BFF004900DC004900DC004900
      DC008F6BFF000000000000000000FFFFFF00FFFFFF004A4A4A00000000008F6B
      FF004900DC004900DC004900DC003100960000000000FFFFFF00FFFFFF000000
      0000000000008F6BFF004900DC008F6BFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF004A4A4A00000000008F6BFF004900DC008F6BFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000008F6BFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4A
      4A00000000008F6BFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A4A4A000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    UseSystemPaint = False
  end
  object cxCheckEditRep: TcxCheckBox
    Left = 8
    Top = 364
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
      #1047#1074#1110#1090' '#1087#1086' '#1082#1088#1077#1076#1110#1090#1091)
    TabOrder = 12
  end
  object cxCheckOnPrinter: TcxCheckBox
    Left = 48
    Top = 296
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
    Top = 328
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
    Top = 296
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
    Width = 121
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
    Left = 208
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
    Left = 368
    Top = 320
  end
  object WorkTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 336
    Top = 320
  end
  object KeyActionList: TActionList
    Left = 464
    Top = 352
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
    Left = 304
    Top = 320
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
    Left = 400
    Top = 320
    poSQLINT64ToBCD = True
    object DataSetForTMCID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCCR_BY_DT: TFIBIntegerField
      FieldName = 'CR_BY_DT'
    end
    object DataSetForTMCPUB_ID_DOC: TFIBBCDField
      FieldName = 'PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCID_OPER: TFIBBCDField
      FieldName = 'ID_OPER'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCID_TIPD: TFIBBCDField
      FieldName = 'ID_TIPD'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCTIPD: TFIBStringField
      FieldName = 'TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object DataSetForTMCNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object DataSetForTMCDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object DataSetForTMCID_MO_IN: TFIBBCDField
      FieldName = 'ID_MO_IN'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCFIO_MO_IN: TFIBStringField
      FieldName = 'FIO_MO_IN'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetForTMCSFIO_MO_IN: TFIBStringField
      FieldName = 'SFIO_MO_IN'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCDEP_MO_IN: TFIBStringField
      FieldName = 'DEP_MO_IN'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetForTMCID_MO_OUT: TFIBBCDField
      FieldName = 'ID_MO_OUT'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCFIO_MO_OUT: TFIBStringField
      FieldName = 'FIO_MO_OUT'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetForTMCSFIO_MO_OUT: TFIBStringField
      FieldName = 'SFIO_MO_OUT'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCDEP_MO_OUT: TFIBStringField
      FieldName = 'DEP_MO_OUT'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_ID_SCH: TFIBBCDField
      FieldName = 'DB_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_ID_SCH: TFIBBCDField
      FieldName = 'KR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_SCH_NUMBER: TFIBStringField
      FieldName = 'DB_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_SCH_NUMBER: TFIBStringField
      FieldName = 'KR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_SCH_TITLE: TFIBStringField
      FieldName = 'DB_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_SCH_TITLE: TFIBStringField
      FieldName = 'KR_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetForTMCBAL_DB_ID_SCH: TFIBBCDField
      FieldName = 'BAL_DB_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCBAL_DB_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_DB_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetForTMCBAL_DB_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_DB_SCH_TITLE'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetForTMCBAL_KR_ID_SCH: TFIBBCDField
      FieldName = 'BAL_KR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCBAL_KR_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_KR_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetForTMCBAL_KR_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_KR_SCH_TITLE'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_ID_FOND: TFIBBCDField
      FieldName = 'DB_ID_FOND'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_ID_FOND: TFIBBCDField
      FieldName = 'KR_ID_FOND'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_FOND_NUMBER: TFIBStringField
      FieldName = 'DB_FOND_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_FOND_NUMBER: TFIBStringField
      FieldName = 'KR_FOND_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_FOND_TITLE: TFIBStringField
      FieldName = 'DB_FOND_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_FOND_TITLE: TFIBStringField
      FieldName = 'KR_FOND_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_ID_SM: TFIBBCDField
      FieldName = 'DB_ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_SM_TITLE: TFIBStringField
      FieldName = 'DB_SM_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_SM_KOD: TFIBIntegerField
      FieldName = 'DB_SM_KOD'
    end
    object DataSetForTMCDB_ID_RZ: TFIBBCDField
      FieldName = 'DB_ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_RZ_TITLE: TFIBStringField
      FieldName = 'DB_RZ_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_RZ_KOD: TFIBIntegerField
      FieldName = 'DB_RZ_KOD'
    end
    object DataSetForTMCDB_ID_ST: TFIBBCDField
      FieldName = 'DB_ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_ST_TITLE: TFIBStringField
      FieldName = 'DB_ST_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_ST_KOD: TFIBIntegerField
      FieldName = 'DB_ST_KOD'
    end
    object DataSetForTMCDB_ID_KEKV: TFIBBCDField
      FieldName = 'DB_ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_KEKV_TITLE: TFIBStringField
      FieldName = 'DB_KEKV_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_KEKV_KOD: TFIBIntegerField
      FieldName = 'DB_KEKV_KOD'
    end
    object DataSetForTMCDB_ID_DOG: TFIBBCDField
      FieldName = 'DB_ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_KOD_DOG: TFIBBCDField
      FieldName = 'DB_KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_REG_NUM: TFIBStringField
      FieldName = 'DB_REG_NUM'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_ID_TIP_DOG: TFIBBCDField
      FieldName = 'DB_ID_TIP_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCDB_TIP_DOG: TFIBStringField
      FieldName = 'DB_TIP_DOG'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_TIP_DOG_SHORT_NAME: TFIBStringField
      FieldName = 'DB_TIP_DOG_SHORT_NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_TIP_DOG_NAME: TFIBStringField
      FieldName = 'DB_TIP_DOG_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_N_DOG: TFIBStringField
      FieldName = 'DB_N_DOG'
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_DATE_DOG: TFIBDateField
      FieldName = 'DB_DATE_DOG'
    end
    object DataSetForTMCKR_ID_SM: TFIBBCDField
      FieldName = 'KR_ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_SM_TITLE: TFIBStringField
      FieldName = 'KR_SM_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_SM_KOD: TFIBIntegerField
      FieldName = 'KR_SM_KOD'
    end
    object DataSetForTMCKR_ID_RZ: TFIBBCDField
      FieldName = 'KR_ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_RZ_TITLE: TFIBStringField
      FieldName = 'KR_RZ_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_RZ_KOD: TFIBIntegerField
      FieldName = 'KR_RZ_KOD'
    end
    object DataSetForTMCKR_ID_ST: TFIBBCDField
      FieldName = 'KR_ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_ST_TITLE: TFIBStringField
      FieldName = 'KR_ST_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_ST_KOD: TFIBIntegerField
      FieldName = 'KR_ST_KOD'
    end
    object DataSetForTMCKR_ID_KEKV: TFIBBCDField
      FieldName = 'KR_ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_KEKV_TITLE: TFIBStringField
      FieldName = 'KR_KEKV_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_KEKV_KOD: TFIBIntegerField
      FieldName = 'KR_KEKV_KOD'
    end
    object DataSetForTMCKR_ID_DOG: TFIBBCDField
      FieldName = 'KR_ID_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_KOD_DOG: TFIBBCDField
      FieldName = 'KR_KOD_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_REG_NUM: TFIBStringField
      FieldName = 'KR_REG_NUM'
      Size = 50
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_ID_TIP_DOG: TFIBBCDField
      FieldName = 'KR_ID_TIP_DOG'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCKR_TIP_DOG: TFIBStringField
      FieldName = 'KR_TIP_DOG'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_TIP_DOG_SHORT_NAME: TFIBStringField
      FieldName = 'KR_TIP_DOG_SHORT_NAME'
      Size = 25
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_TIP_DOG_NAME: TFIBStringField
      FieldName = 'KR_TIP_DOG_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_N_DOG: TFIBStringField
      FieldName = 'KR_N_DOG'
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_DATE_DOG: TFIBDateField
      FieldName = 'KR_DATE_DOG'
    end
    object DataSetForTMCDB_ISTFIN: TFIBStringField
      FieldName = 'DB_ISTFIN'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCKR_ISTFIN: TFIBStringField
      FieldName = 'KR_ISTFIN'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCDB_KOD_SYSTEM: TFIBIntegerField
      FieldName = 'DB_KOD_SYSTEM'
    end
    object DataSetForTMCKR_KOD_SYSTEM: TFIBIntegerField
      FieldName = 'KR_KOD_SYSTEM'
    end
    object DataSetForTMCNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object DataSetForTMCID_NOMN: TFIBBCDField
      FieldName = 'ID_NOMN'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCNOMN: TFIBStringField
      FieldName = 'NOMN'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetForTMCID_UNIT: TFIBBCDField
      FieldName = 'ID_UNIT'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCSHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetForTMCKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object DataSetForTMCPRICE: TFIBBCDField
      FieldName = 'PRICE'
      Size = 4
      RoundByScale = True
    end
    object DataSetForTMCID_GROUP_1: TFIBBCDField
      FieldName = 'ID_GROUP_1'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCID_GROUP_2: TFIBBCDField
      FieldName = 'ID_GROUP_2'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCID_GROUP_3: TFIBBCDField
      FieldName = 'ID_GROUP_3'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCID_GROUP_4: TFIBBCDField
      FieldName = 'ID_GROUP_4'
      Size = 0
      RoundByScale = True
    end
    object DataSetForTMCNAME_GROUP1: TFIBStringField
      FieldName = 'NAME_GROUP1'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCNAME_GROUP2: TFIBStringField
      FieldName = 'NAME_GROUP2'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCNAME_GROUP3: TFIBStringField
      FieldName = 'NAME_GROUP3'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCNAME_GROUP4: TFIBStringField
      FieldName = 'NAME_GROUP4'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetForTMCSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetForTMCPROV_DATE_REG: TFIBDateField
      FieldName = 'PROV_DATE_REG'
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39658.419706307900000000
    ReportOptions.LastChange = 39686.647219722230000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 432
    Top = 320
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 411.968770000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo15: TfrxMemoView
          Left = 75.590600000000000000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DB_SM_KOD"]')
        end
        object Memo16: TfrxMemoView
          Left = 128.504020000000000000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DB_RZ_KOD"]')
        end
        object Memo17: TfrxMemoView
          Left = 181.417440000000000000
          Width = 52.913420000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DB_ST_KOD"]')
        end
        object Memo18: TfrxMemoView
          Left = 234.330860000000000000
          Width = 60.472480000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DB_KEKV_KOD"]')
        end
        object Memo23: TfrxMemoView
          Left = 612.283860000000000000
          Width = 102.047310000000000000
          Height = 26.456710000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            ' [frxDBDataset1."SUMMA"]')
        end
        object Memo27: TfrxMemoView
          Width = 75.590600000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."KR_SCH_NUMBER"]')
        end
        object Memo20: TfrxMemoView
          Left = 294.803340000000000000
          Width = 317.480520000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 733.228820000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.419312533333000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_GROUP_4"'
        object Memo2: TfrxMemoView
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP4"]')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_GROUP_3"'
        object Memo3: TfrxMemoView
          Left = 37.795300000000000000
          Width = 676.535870000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP3"]')
        end
        object Memo38: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_GROUP_2"'
        object Memo4: TfrxMemoView
          Left = 79.370130000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP2"]')
        end
        object Memo39: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_GROUP_1"'
        object Memo5: TfrxMemoView
          Left = 117.165430000000000000
          Width = 597.165740000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP1"]')
        end
        object Memo40: TfrxMemoView
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object Header2: TfrxHeader
        Height = 18.897650000000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 75.590600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090)
        end
        object Memo7: TfrxMemoView
          Left = 128.504020000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
        end
        object Memo8: TfrxMemoView
          Left = 181.417440000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103)
        end
        object Memo9: TfrxMemoView
          Left = 234.330860000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1045#1050#1042)
        end
        object Memo11: TfrxMemoView
          Left = 294.803340000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072', '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1080#1081' '#1085#1086#1084#1077#1088)
        end
        object Memo12: TfrxMemoView
          Left = 491.338900000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1076'.'#1074#1080#1084'.')
        end
        object Memo13: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100)
        end
        object Memo14: TfrxMemoView
          Left = 612.283860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
        end
        object Memo26: TfrxMemoView
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1088'.'#1088#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 483.779840000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Left = 612.283860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
        end
        object Memo19: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
        end
        object Memo28: TfrxMemoView
          Width = 532.913730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' [frxDBDataset1."NAME_GROUP1"]')
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 525.354670000000100000
        Width = 718.110700000000000000
        object Memo29: TfrxMemoView
          Left = 612.283860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
        end
        object Memo31: TfrxMemoView
          Width = 532.913730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' [frxDBDataset1."NAME_GROUP2"]')
        end
        object Memo30: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 566.929499999999900000
        Width = 718.110700000000000000
        object Memo32: TfrxMemoView
          Left = 612.283860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
        end
        object Memo33: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
        end
        object Memo34: TfrxMemoView
          Width = 532.913730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' [frxDBDataset1."NAME_GROUP3"]')
        end
      end
      object GroupFooter4: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 608.504330000000000000
        Width = 718.110700000000000000
        object Memo35: TfrxMemoView
          Left = 612.283860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
        end
        object Memo36: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
        end
        object Memo37: TfrxMemoView
          Width = 532.913730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' [frxDBDataset1."NAME_GROUP4"]')
        end
      end
      object GroupHeader5: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."DB_SCH_TITLE"'
        Stretched = True
        object Memo25: TfrxMemoView
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."DB_SCH_NUMBER"]')
        end
        object Memo24: TfrxMemoView
          Left = 98.267780000000000000
          Width = 616.063390000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."DB_SCH_TITLE"]')
        end
      end
      object GroupFooter5: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 650.079160000000000000
        Width = 718.110700000000000000
        object Memo41: TfrxMemoView
          Width = 532.913730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091' [frxDBDataset1."DB_SCH_NUMBER"]')
        end
        object Memo42: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
        end
        object Memo43: TfrxMemoView
          Left = 612.283860000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
        end
      end
      object GroupHeader6: TfrxGroupHeader
        Height = 26.456710000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."NAME"'
        object Memo21: TfrxMemoView
          Left = 612.283860000000000000
          Width = 41.574830000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."SHORT_NAME"]')
        end
        object Memo22: TfrxMemoView
          Left = 532.913730000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."KOL_MAT"]')
        end
        object Memo44: TfrxMemoView
          Left = 117.165430000000000000
          Width = 415.748300000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME"]'
            '[frxDBDataset1."NOMN" #dhh:mm:ss]')
        end
      end
      object GroupFooter6: TfrxGroupFooter
        Top = 461.102660000000000000
        Width = 718.110700000000000000
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSetForTMC
    Left = 464
    Top = 320
  end
end
