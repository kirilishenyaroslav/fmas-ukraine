object SchOborotRepForm: TSchOborotRepForm
  Left = 392
  Top = 247
  BorderStyle = bsDialog
  Caption = #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100
  ClientHeight = 244
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 27
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
    Left = 16
    Top = 89
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
    Left = 252
    Top = 156
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
  object LabelSch: TLabel
    Left = 14
    Top = 60
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
  object Label3: TLabel
    Left = 8
    Top = 121
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
  object Label5: TLabel
    Left = 254
    Top = 27
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
    Left = 80
    Top = 24
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
    Left = 176
    Top = 24
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
    Left = 98
    Top = 210
    Width = 125
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = OkButtonClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF008684840086848400FF00FF00FF00FF00868484008684
      8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0086848400BCBABA00B5B3B300868484008684840086848400EBEA
      EA00868484008684840086848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0086848400E3E2E200B5B3B300B5B3B300B5B3B300515050004F4F4F008687
      8700CDCDCD00E8E9E900C7C6C600868484008684840086848400FF00FF008684
      8400DEDDDD00D6D6D600A4A3A300A4A3A300A4A3A30056555500161516001212
      1200181818001212120093939300CACACA0086848400FF00FF0086848400D6D6
      D600D6D6D600A4A3A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D
      9D0079767700121212001414140013131300868484008F8C8C0086848400D6D6
      D600A4A3A300F3F2F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9
      D900CCCBCB00BFBDBD00A2A0A00073717100939191008E8C8C0086848400A4A3
      A300FFFFFF00FEFDFD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CE
      CF00E0E0E000E1E1E100D4D3D300C7C6C600A7A5A50086838300FF00FF008684
      840086848400F1F0F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1AC
      AD00AFA9AA00B2ADAE00CAC9C900DCDCDC00D0D0D00086848400FF00FF00FF00
      FF00FF00FF0086848400CAA09700BA9E8700A2897E0095817B00897C7F00928C
      9200A5A2A400BBB6B700D7D6D600CFCFCF0086848400FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A7
      8600CC9A9900989596008684840086848400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD3
      9F00CC9A9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00CE9D9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A
      9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00CC9A9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A
      9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00CC9A9900FFFFF500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A
      9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00CC9A9900CC9A9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A9900FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00CC9A9900CC9A9900CC9A9900FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    UseSystemPaint = False
  end
  object CancelButton: TcxButton
    Left = 240
    Top = 210
    Width = 125
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = CancelButtonClick
    Glyph.Data = {
      36080000424D3608000000000000360000002800000020000000100000000100
      2000000000000008000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00174AFD00103BF40000009A00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00002CF8000030FC0000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00A8A8A800A0A0A0006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B009A9A9A009C9C9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A001A47F8001A4CFF00123BF10000009A00FF00FF00FF00FF000000
      9A00012DF6000132FF00002AF30000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00A7A7A700AAAAAA009F9F9F006B6B6B00FF00FF00FF00FF006B6B
      6B00999999009E9E9E00979797006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A001C47F6001B4DFF00143EF40000009A0000009A00002D
      F8000134FF00032BF20000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B00A7A7A700ABABAB00A2A2A2006B6B6B006B6B6B009A9A
      9A009E9E9E00989898006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000009A001D48F6001D50FF00103DFB000431FE000132
      FF00002CF60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF006B6B6B00A7A7A700ACACAC00A3A3A3009F9F9F009E9E
      9E00999999006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000009A001A48F9001342FF000C3CFF000733
      F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF006B6B6B00A7A7A700A7A7A700A3A3A3009C9C
      9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000009A00214EFC001D4BFF001847FF001743
      F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF006B6B6B00ACACAC00ACACAC00A9A9A900A4A4
      A4006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000009A002E5BF9002C5FFF00224DF800204BF8002355
      FF001B46F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF006B6B6B00B1B1B100B3B3B300ABABAB00AAAAAA00AFAF
      AF00A6A6A6006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A003664FA00386BFF002D59F40000009A0000009A00224C
      F4002558FF001D49F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B00B6B6B600B9B9B900AEAEAE006B6B6B006B6B6B00A9A9
      A900B0B0B000A7A7A7006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A004071FA004274FF00325DF10000009A00FF00FF00FF00FF000000
      9A00224DF100275AFF00204CF80000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00BBBBBB00BEBEBE00AFAFAF006B6B6B00FF00FF00FF00FF006B6B
      6B00A7A7A700B1B1B100AAAAAA006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00497AFC003B66F30000009A00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A002550F4002655FA0000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00C0C0C000B5B5B5006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00AAAAAA00AEAEAE006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    NumGlyphs = 2
    UseSystemPaint = False
  end
  object cxCheckBox1: TcxCheckBox
    Left = 0
    Top = 222
    Width = 25
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 13
  end
  object cxReport: TcxComboBox
    Left = 46
    Top = 86
    Width = 395
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1047#1072#1075#1072#1083#1100#1085#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' ('#1078#1091#1088#1085#1072#1083'-'#1086#1088#1076#1077#1088')'
      #1047#1072#1075#1072#1083#1100#1085#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' ('#1078#1091#1088#1085#1072#1083'-'#1086#1088#1076#1077#1088' '#1089#1090#1080#1089#1083#1080#1081')'
      #1047#1072#1075#1072#1083#1100#1085#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' ('#1087#1086' '#1079#1072#1083#1080#1096#1082#1072#1084')'
      #1047#1072#1075#1072#1083#1100#1085#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' ('#1089#1090#1080#1089#1083#1072')'
      #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1072#1084'+'#1052#1042#1054
      #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1086' '#1052#1042#1054'+'#1088#1072#1093#1091#1085#1082#1072#1084
      #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1086' '#1052#1042#1054' ('#1087#1110#1076#1089#1091#1084#1082#1086#1074#1072')'
      #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1072#1084' ('#1087#1110#1076#1089#1091#1084#1082#1086#1074#1072')'
      #1054#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1088#1091#1093#1091' '#1076#1086#1088#1086#1075#1086#1094#1110#1085#1080#1093' '#1084#1077#1090#1072#1083#1110#1074
      #1055#1110#1076#1089#1091#1084#1082#1086#1074#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1088#1091#1093#1091' '#1076#1086#1088#1086#1075#1086#1094#1110#1085#1080#1093' '#1084#1077#1090#1072#1083#1110#1074' '#1087#1086' '#1052#1042#1054
      #1055#1110#1076#1089#1091#1084#1082#1086#1074#1072' '#1086#1073#1086#1088#1086#1090#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1088#1091#1093#1091' '#1076#1086#1088#1086#1075#1086#1094#1110#1085#1080#1093' '#1084#1077#1090#1072#1083#1110#1074)
    Properties.OnChange = cxReportPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object cxCheckOnPrinter: TcxCheckBox
    Left = 24
    Top = 153
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
    TabOrder = 9
  end
  object cxSelectPrinter: TcxCheckBox
    Left = 24
    Top = 177
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
    TabOrder = 7
  end
  object cxCopies: TcxSpinEdit
    Left = 366
    Top = 152
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
    TabOrder = 8
    Value = 1
  end
  object cxLookupSch: TcxButtonEdit
    Left = 72
    Top = 56
    Width = 369
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxLookupSchPropertiesButtonClick
    Style.Color = clWindow
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    OnKeyDown = cxLookupSchKeyDown
  end
  object cxMatOtv: TcxButtonEdit
    Left = 47
    Top = 119
    Width = 394
    Height = 21
    Enabled = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxMatOtvPropertiesButtonClick
    Style.Color = clWindow
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    OnKeyDown = cxMatOtvKeyDown
  end
  object cxGroupOnPage: TcxCheckBox
    Left = 248
    Top = 176
    Width = 169
    Height = 21
    ParentFont = False
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1086#1079#1073#1080#1074#1072#1090#1080' '#1085#1072' '#1089#1090#1086#1088#1110#1085#1082#1080
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
    Visible = False
  end
  object cxMonthEnd: TcxComboBox
    Left = 280
    Top = 24
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
    TabOrder = 2
  end
  object cxYearEnd: TcxSpinEdit
    Left = 376
    Top = 24
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
    TabOrder = 3
  end
  object RepDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = WorkTransaction
    SelectSQL.Strings = (
      '')
    Left = 56
    Top = 120
    poSQLINT64ToBCD = True
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
    Left = 200
    Top = 120
  end
  object WorkTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 232
    Top = 120
  end
  object WorkQuery: TpFIBQuery
    Database = WorkDatabase
    Transaction = WorkTransaction
    Left = 168
    Top = 120
  end
  object KeyActionList: TActionList
    Left = 16
    Top = 120
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object ActionOk: TAction
      Caption = 'ActionOk'
      ShortCut = 16419
      OnExecute = ActionOkExecute
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
    ReportOptions.CreateDate = 40995.444500486110000000
    ReportOptions.LastChange = 40995.444500486110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 86
    Top = 119
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = RepDataSet
    Left = 115
    Top = 119
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 141
    Top = 119
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 267
    Top = 119
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 297
    Top = 119
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 77
    Top = 1
    ReportForm = {19000000}
  end
end
