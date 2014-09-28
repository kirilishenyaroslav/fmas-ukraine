object OborotForm: TOborotForm
  Left = 348
  Top = 250
  BorderStyle = bsDialog
  Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
  ClientHeight = 516
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 73
    Align = alTop
    TabOrder = 0
    object LabelMol: TLabel
      Left = 8
      Top = 11
      Width = 38
      Height = 16
      Caption = #1052#1054#1051':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelBeg: TLabel
      Left = 8
      Top = 46
      Width = 9
      Height = 13
      Caption = 'S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelSch: TLabel
      Left = 517
      Top = 14
      Width = 28
      Height = 13
      Caption = #1057#1095#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelEnd: TLabel
      Left = 184
      Top = 46
      Width = 9
      Height = 13
      Caption = 'S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxMatOtv: TcxButtonEdit
      Left = 56
      Top = 8
      Width = 457
      Height = 21
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
      TabOrder = 0
      OnKeyDown = cxMatOtvKeyDown
    end
    object ApplyButton: TcxButton
      Left = 360
      Top = 40
      Width = 120
      Height = 25
      Action = acShow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
        9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
        9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
        65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
        00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
        00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object PrintButton: TcxButton
      Left = 487
      Top = 40
      Width = 120
      Height = 25
      Action = acPrint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
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
      UseSystemPaint = False
    end
    object ExitButton: TcxButton
      Left = 616
      Top = 40
      Width = 113
      Height = 25
      Action = acExit
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
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
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxMonthBeg: TcxComboBox
      Left = 18
      Top = 42
      Width = 97
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
      Properties.OnChange = cxMonthBegPropertiesChange
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxYearBeg: TcxSpinEdit
      Left = 119
      Top = 42
      Width = 57
      Height = 21
      ParentFont = False
      Properties.OnChange = cxYearBegPropertiesChange
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Value = 2004
    end
    object cxLookupSch: TcxButtonEdit
      Left = 568
      Top = 10
      Width = 161
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxLookupSchPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      OnKeyDown = cxLookupSchKeyDown
    end
    object cxMonthEnd: TcxComboBox
      Left = 200
      Top = 42
      Width = 97
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
      TabOrder = 7
    end
    object cxYearEnd: TcxSpinEdit
      Left = 302
      Top = 42
      Width = 57
      Height = 21
      ParentFont = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
      Value = 2004
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 405
    Width = 742
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    Control = Panel3
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 742
    Height = 332
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object StringGrid1: TStringGrid
      Left = 312
      Top = 80
      Width = 329
      Height = 129
      TabOrder = 1
      Visible = False
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 742
      Height = 332
      Align = alClient
      PopupMenu = pmOborot
      TabOrder = 0
      object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
        DataController.DataSource = WorkDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'SUMM_BEG'
            Column = cxGrid1DBBandedTableView1SUMM_BEG
          end
          item
            Format = '0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'SUMM_OST'
            Column = cxGrid1DBBandedTableView1SUMM_OST
          end
          item
            Format = '0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'SUMM_PRH'
            Column = cxGrid1DBBandedTableView1SUMM_PRH
          end
          item
            Format = '0.00'
            Kind = skSum
            Position = spFooter
            FieldName = 'SUMM_RSH'
            Column = cxGrid1DBBandedTableView1SUMM_RSH
          end
          item
            Format = '0.0000'
            Kind = skSum
            Position = spFooter
            FieldName = 'KOL_BEG'
            Column = cxGrid1DBBandedTableView1KOL_BEG
          end
          item
            Format = '0.0000'
            Kind = skSum
            Position = spFooter
            FieldName = 'KOL_PRH'
            Column = cxGrid1DBBandedTableView1KOL_PRH
          end
          item
            Format = '0.0000'
            Kind = skSum
            Position = spFooter
            FieldName = 'KOL_RSH'
            Column = cxGrid1DBBandedTableView1KOL_RSH
          end
          item
            Format = '0.0000'
            Kind = skSum
            Position = spFooter
            FieldName = 'KOL_OST'
            Column = cxGrid1DBBandedTableView1KOL_OST
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.0000'
            Kind = skSum
            FieldName = 'KOL_BEG'
            Column = cxGrid1DBBandedTableView1KOL_BEG
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMM_BEG'
            Column = cxGrid1DBBandedTableView1SUMM_BEG
          end
          item
            Format = '0.0000'
            Kind = skSum
            FieldName = 'KOL_PRH'
            Column = cxGrid1DBBandedTableView1KOL_PRH
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMM_PRH'
            Column = cxGrid1DBBandedTableView1SUMM_PRH
          end
          item
            Format = '0.0000'
            Kind = skSum
            FieldName = 'KOL_RSH'
            Column = cxGrid1DBBandedTableView1KOL_RSH
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMM_RSH'
            Column = cxGrid1DBBandedTableView1SUMM_RSH
          end
          item
            Format = '0.0000'
            Kind = skSum
            FieldName = 'KOL_OST'
            Column = cxGrid1DBBandedTableView1KOL_OST
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMM_OST'
            Column = cxGrid1DBBandedTableView1SUMM_OST
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = cxGrid1DBBandedTableView1NAME
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.BandHeaders = False
        Styles.Background = cxStyle6
        Styles.ContentEven = cxStyle6
        Styles.ContentOdd = cxStyle7
        Styles.Inactive = cxStyle14
        Styles.Selection = cxStyle14
        Styles.Footer = cxStyle5
        Styles.Header = cxStyle10
        Bands = <
          item
          end>
        object cxGrid1DBBandedTableView1ID_SCH: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
          DataBinding.FieldName = 'ID_SCH'
        end
        object cxGrid1DBBandedTableView1SCH_NUMBER: TcxGridDBBandedColumn
          Caption = #1057#1095#1077#1090
          Options.Editing = False
          Options.Filtering = False
          SortOrder = soAscending
          Width = 93
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 2
          DataBinding.FieldName = 'SCH_NUMBER'
        end
        object cxGrid1DBBandedTableView1SCH_TITLE: TcxGridDBBandedColumn
          Visible = False
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
          DataBinding.FieldName = 'SCH_TITLE'
        end
        object cxGrid1DBBandedTableView1ID_MO: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
          DataBinding.FieldName = 'ID_MO'
        end
        object cxGrid1DBBandedTableView1FIO: TcxGridDBBandedColumn
          Visible = False
          Options.Editing = False
          Width = 293
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
          DataBinding.FieldName = 'FIO'
        end
        object cxGrid1DBBandedTableView1SFIO: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
          DataBinding.FieldName = 'SFIO'
        end
        object cxGrid1DBBandedTableView1NAME_DEPARTMENT: TcxGridDBBandedColumn
          Visible = False
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
          Width = 400
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
          DataBinding.FieldName = 'NAME_DEPARTMENT'
        end
        object cxGrid1DBBandedTableView1ID_NOMN: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
          DataBinding.FieldName = 'ID_NOMN'
        end
        object cxGrid1DBBandedTableView1NOMN: TcxGridDBBandedColumn
          Caption = #1053#1086#1084'. '#1085#1086#1084#1077#1088
          Visible = False
          Options.Filtering = False
          Width = 89
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 2
          DataBinding.FieldName = 'NOMN'
        end
        object cxGrid1DBBandedTableView1NAME: TcxGridDBBandedColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Options.Editing = False
          Options.Filtering = False
          Width = 289
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 1
          DataBinding.FieldName = 'NAME'
        end
        object cxGrid1DBBandedTableView1ID_UNIT: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
          DataBinding.FieldName = 'ID_UNIT'
        end
        object cxGrid1DBBandedTableView1UNIT: TcxGridDBBandedColumn
          Caption = #1045#1076'.'#1080#1079#1084#1077#1088'.'
          Options.Filtering = False
          Options.Sorting = False
          Width = 74
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 2
          DataBinding.FieldName = 'UNIT'
        end
        object cxGrid1DBBandedTableView1UNIT_NAME: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 8
          Position.RowIndex = 0
          DataBinding.FieldName = 'UNIT_NAME'
        end
        object cxGrid1DBBandedTableView1KOL_BEG: TcxGridDBBandedColumn
          Caption = #1054#1089#1090'. '#1085#1072' '#1085#1072#1095#1072#1083#1086
          Options.Editing = False
          Options.Filtering = False
          Width = 112
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 1
          DataBinding.FieldName = 'KOL_BEG'
        end
        object cxGrid1DBBandedTableView1KOL_PRH: TcxGridDBBandedColumn
          Caption = #1055#1088#1080#1093#1086#1076' ('#1082#1086#1083'.)'
          Options.Editing = False
          Options.Filtering = False
          Width = 113
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 1
          DataBinding.FieldName = 'KOL_PRH'
        end
        object cxGrid1DBBandedTableView1KOL_OST: TcxGridDBBandedColumn
          Caption = #1054#1089#1090'. '#1085#1072' '#1082#1086#1085#1077#1094
          Options.Editing = False
          Options.Filtering = False
          Width = 113
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 1
          DataBinding.FieldName = 'KOL_OST'
        end
        object cxGrid1DBBandedTableView1KOL_RSH: TcxGridDBBandedColumn
          Caption = #1056#1072#1089#1093#1086#1076' ('#1082#1086#1083'.)'
          Options.Editing = False
          Options.Filtering = False
          Width = 113
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 1
          DataBinding.FieldName = 'KOL_RSH'
        end
        object cxGrid1DBBandedTableView1SUMM_BEG: TcxGridDBBandedColumn
          Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1085#1072#1095'.'
          Options.Editing = False
          Options.Filtering = False
          Width = 112
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 2
          DataBinding.FieldName = 'SUMM_BEG'
        end
        object cxGrid1DBBandedTableView1SUMM_PRH: TcxGridDBBandedColumn
          Caption = #1055#1088#1080#1093#1086#1076
          Options.Editing = False
          Options.Filtering = False
          Width = 114
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 2
          DataBinding.FieldName = 'SUMM_PRH'
        end
        object cxGrid1DBBandedTableView1SUMM_RSH: TcxGridDBBandedColumn
          Caption = #1056#1072#1089#1093#1086#1076
          Options.Editing = False
          Options.Filtering = False
          Width = 113
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 2
          DataBinding.FieldName = 'SUMM_RSH'
        end
        object cxGrid1DBBandedTableView1SUMM_OST: TcxGridDBBandedColumn
          Caption = #1057#1072#1083#1100#1076#1086' '#1082#1086#1085'.'
          Options.Editing = False
          Options.Filtering = False
          Width = 112
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 2
          DataBinding.FieldName = 'SUMM_OST'
        end
        object cxGrid1DBBandedTableView1MOL: TcxGridDBBandedColumn
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 1
          DataBinding.FieldName = 'MOL'
          IsCaptionAssigned = True
        end
        object cxGrid1DBBandedTableView1PRICE: TcxGridDBBandedColumn
          Caption = #1062#1077#1085#1072
          Options.Filtering = False
          Options.Sorting = False
          Width = 122
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 2
          DataBinding.FieldName = 'PRICE'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBBandedTableView1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 413
    Width = 742
    Height = 103
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object cxGrid3: TcxGrid
      Left = 371
      Top = 0
      Width = 371
      Height = 103
      Align = alClient
      TabOrder = 0
      object cxGrid3DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid3DBTableView1DblClick
        DataController.DataSource = RshDocDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle13
        Styles.Content = cxStyle13
        Styles.Selection = cxStyle14
        Styles.Footer = cxStyle5
        Styles.Header = cxStyle8
        object cxGrid3ID_DOC: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_DOC'
        end
        object cxGrid3ID_TIPD: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_TIPD'
        end
        object cxGrid3TIPD: TcxGridDBColumn
          Caption = #1058#1080#1087
          Options.Filtering = False
          Width = 40
          DataBinding.FieldName = 'TIPD'
        end
        object cxGrid3NAME_TIPD: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_TIPD'
        end
        object cxGrid3NUM_DOC: TcxGridDBColumn
          Caption = #8470' '#1076#1086#1082'.'
          Options.Filtering = False
          Width = 57
          DataBinding.FieldName = 'NUM_DOC'
        end
        object cxGrid3DATE_DOC: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082'.'
          Options.Filtering = False
          Width = 76
          DataBinding.FieldName = 'DATE_DOC'
        end
        object cxGrid3ID_MO_IN: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_MO_IN'
        end
        object cxGrid3ID_CUST: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_CUST'
        end
        object cxGrid3NAME: TcxGridDBColumn
          Caption = #1050#1086#1084#1091
          Options.Filtering = False
          Width = 217
          DataBinding.FieldName = 'NAME_IN'
        end
        object cxGrid3KOL_MAT: TcxGridDBColumn
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          Options.Filtering = False
          Options.Sorting = False
          DataBinding.FieldName = 'KOL_MAT'
        end
        object cxGrid3SUMMA: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          Options.Filtering = False
          Options.Sorting = False
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGrid3Level1: TcxGridLevel
        GridView = cxGrid3DBTableView1
      end
    end
    object cxGrid2: TcxGrid
      Left = 0
      Top = 0
      Width = 371
      Height = 103
      Align = alLeft
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        OnDblClick = cxGridDBTableView1DblClick
        DataController.DataSource = PrhDocDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle13
        Styles.Content = cxStyle13
        Styles.Selection = cxStyle14
        Styles.Footer = cxStyle5
        Styles.Header = cxStyle8
        object cxGrid2ID_DOC: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_DOC'
        end
        object cxGrid2ID_TIPD: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_TIPD'
        end
        object cxGrid2TIPD: TcxGridDBColumn
          Caption = #1058#1080#1087
          Options.Filtering = False
          Width = 46
          DataBinding.FieldName = 'TIPD'
        end
        object cxGrid2NAME_TIPD: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_TIPD'
        end
        object cxGrid2NUM_DOC: TcxGridDBColumn
          Caption = #8470' '#1076#1086#1082'.'
          Options.Filtering = False
          Width = 58
          DataBinding.FieldName = 'NUM_DOC'
        end
        object cxGrid2DATE_DOC: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082'.'
          Options.Filtering = False
          Width = 71
          DataBinding.FieldName = 'DATE_DOC'
        end
        object cxGrid2ID_MO_OUT: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_MO_OUT'
        end
        object cxGrid2NAME: TcxGridDBColumn
          Caption = #1042#1110#1076' '#1082#1086#1075#1086
          Options.Filtering = False
          Width = 237
          DataBinding.FieldName = 'NAME_OUT'
        end
        object cxGrid2ID_CUST: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_CUST'
        end
        object cxGrid2KOL_MAT: TcxGridDBColumn
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          Options.Filtering = False
          Options.Sorting = False
          DataBinding.FieldName = 'KOL_MAT'
        end
        object cxGrid2SUMMA: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072
          Options.Filtering = False
          Options.Sorting = False
          DataBinding.FieldName = 'SUMMA'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 16
    Top = 160
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
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWindow
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Font.Style = [fsBold]
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
  object WorkDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    SelectSQL.Strings = (
      'SELECT *'#9
      'FROM MAT_MAKE_OBOROT_BY_PERIOD(:PID_MO, :DATE_BEG, :DATE_END)')
    Left = 112
    Top = 152
    poSQLINT64ToBCD = True
    object WorkDataSetID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object WorkDataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object WorkDataSetSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object WorkDataSetID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object WorkDataSetFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 65
      EmptyStrToNull = True
    end
    object WorkDataSetSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 30
      EmptyStrToNull = True
    end
    object WorkDataSetNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object WorkDataSetID_NOMN: TFIBIntegerField
      FieldName = 'ID_NOMN'
    end
    object WorkDataSetNOMN: TFIBStringField
      FieldName = 'NOMN'
      EmptyStrToNull = True
    end
    object WorkDataSetNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object WorkDataSetID_UNIT: TFIBIntegerField
      FieldName = 'ID_UNIT'
    end
    object WorkDataSetUNIT: TFIBStringField
      FieldName = 'UNIT'
      EmptyStrToNull = True
    end
    object WorkDataSetUNIT_NAME: TFIBStringField
      FieldName = 'UNIT_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object WorkDataSetKOL_BEG: TFIBBCDField
      FieldName = 'KOL_BEG'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object WorkDataSetKOL_PRH: TFIBBCDField
      FieldName = 'KOL_PRH'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object WorkDataSetKOL_RSH: TFIBBCDField
      FieldName = 'KOL_RSH'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object WorkDataSetKOL_OST: TFIBBCDField
      FieldName = 'KOL_OST'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object WorkDataSetSUMM_BEG: TFIBBCDField
      FieldName = 'SUMM_BEG'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object WorkDataSetSUMM_PRH: TFIBBCDField
      FieldName = 'SUMM_PRH'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object WorkDataSetSUMM_RSH: TFIBBCDField
      FieldName = 'SUMM_RSH'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object WorkDataSetSUMM_OST: TFIBBCDField
      FieldName = 'SUMM_OST'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 2
      RoundByScale = True
    end
    object WorkDataSetID_MARK: TFIBBCDField
      FieldName = 'ID_MARK'
      Size = 0
      RoundByScale = True
    end
    object WorkDataSetMARK: TFIBStringField
      FieldName = 'MARK'
      EmptyStrToNull = True
    end
    object WorkDataSetPRICE: TFIBBCDField
      FieldName = 'PRICE'
      DisplayFormat = '#,##0.0000'
      EditFormat = '0.0000'
      Size = 4
      RoundByScale = True
    end
    object WorkDataSetID_OST: TFIBBCDField
      FieldName = 'ID_OST'
      Size = 0
      RoundByScale = True
    end
    object WorkDataSetBAL_ID_SCH: TFIBIntegerField
      FieldName = 'BAL_ID_SCH'
    end
    object WorkDataSetBAL_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object WorkDataSetBAL_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object WorkDataSetINV_NUM_LIST: TFIBStringField
      FieldName = 'INV_NUM_LIST'
      Size = 10
      EmptyStrToNull = True
    end
    object WorkDataSetMNA_NUM_LIST: TFIBStringField
      FieldName = 'MNA_NUM_LIST'
      Size = 10
      EmptyStrToNull = True
    end
    object WorkDataSetDOC_ID_TIPD: TFIBIntegerField
      FieldName = 'DOC_ID_TIPD'
    end
    object WorkDataSetDOC_TIPD: TFIBStringField
      FieldName = 'DOC_TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetDOC_NAME_TIPD: TFIBStringField
      FieldName = 'DOC_NAME_TIPD'
      Size = 50
      EmptyStrToNull = True
    end
    object WorkDataSetDOC_NUM_DOC: TFIBStringField
      FieldName = 'DOC_NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object WorkDataSetDOC_DATE_DOC: TFIBDateField
      FieldName = 'DOC_DATE_DOC'
    end
    object WorkDataSetDATE_OPR: TFIBDateField
      FieldName = 'DATE_OPR'
    end
  end
  object WorkDataSource: TDataSource
    DataSet = WorkDataSet
    Left = 112
    Top = 184
  end
  object SchDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    SelectSQL.Strings = (
      'SELECT'
      #9'MAT_SP_SCH_SELECT.ID_SCH,'
      #9'MAT_SP_SCH_SELECT.SCH_TITLE,'
      #9'MAT_SP_SCH_SELECT.SCH_NUMBER,'
      #9'MAT_SP_SCH_SELECT.SCH_TYPE,'
      #9'MAT_SP_SCH_SELECT.LINK_TO,'
      #9'MAT_SP_SCH_SELECT.DATE_BEG,'
      #9'MAT_SP_SCH_SELECT.DATE_END,'
      #9'MAT_SP_SCH_SELECT.TYPE_OBJECT,'
      #9'MAT_SP_SCH_SELECT.SCH_OBJ_TYPE_TITLE,'
      #9'MAT_SP_SCH_SELECT.SCH_TYPE_TITLE,'
      #9'MAT_SP_SCH_SELECT.ID_SYSTEM'
      'FROM MAT_SP_SCH_SELECT(:PERIOD)')
    Left = 112
    Top = 232
    poSQLINT64ToBCD = True
    object SchDataSetID_SCH: TFIBIntegerField
      FieldName = 'ID_SCH'
    end
    object SchDataSetSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object SchDataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object SchDataSetSCH_TYPE: TFIBIntegerField
      FieldName = 'SCH_TYPE'
    end
    object SchDataSetLINK_TO: TFIBIntegerField
      FieldName = 'LINK_TO'
    end
    object SchDataSetDATE_BEG: TFIBDateTimeField
      FieldName = 'DATE_BEG'
    end
    object SchDataSetDATE_END: TFIBDateTimeField
      FieldName = 'DATE_END'
    end
    object SchDataSetTYPE_OBJECT: TFIBIntegerField
      FieldName = 'TYPE_OBJECT'
    end
    object SchDataSetSCH_OBJ_TYPE_TITLE: TFIBStringField
      FieldName = 'SCH_OBJ_TYPE_TITLE'
      Size = 30
      EmptyStrToNull = True
    end
    object SchDataSetSCH_TYPE_TITLE: TFIBStringField
      FieldName = 'SCH_TYPE_TITLE'
      Size = 30
      EmptyStrToNull = True
    end
    object SchDataSetID_SYSTEM: TFIBIntegerField
      FieldName = 'ID_SYSTEM'
    end
  end
  object SchDataSource: TDataSource
    DataSet = SchDataSet
    Left = 152
    Top = 232
  end
  object PrhDocDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_MAKE_OBOROT_GET_PRH_DOC(:PDATE_BEG,'
      '  :PDATE_END, ?ID_MO, ?ID_SCH, ?ID_OST)')
    DataSource = WorkDataSource
    Left = 112
    Top = 265
    poSQLINT64ToBCD = True
    object PrhDocDataSetID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object PrhDocDataSetID_TIPD: TFIBBCDField
      FieldName = 'ID_TIPD'
      Size = 0
      RoundByScale = True
    end
    object PrhDocDataSetTIPD: TFIBStringField
      FieldName = 'TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object PrhDocDataSetNAME_TIPD: TFIBStringField
      FieldName = 'NAME_TIPD'
      Size = 50
      EmptyStrToNull = True
    end
    object PrhDocDataSetNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object PrhDocDataSetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object PrhDocDataSetID_MO_OUT: TFIBBCDField
      FieldName = 'ID_MO_OUT'
      Size = 0
      RoundByScale = True
    end
    object PrhDocDataSetID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object PrhDocDataSetKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object PrhDocDataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object PrhDocDataSetNAME_OUT: TFIBStringField
      FieldName = 'NAME_OUT'
      Size = 300
      EmptyStrToNull = True
    end
  end
  object RshDocDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_MAKE_OBOROT_GET_RSH_DOC(:PDATE_BEG,'
      '  :PDATE_END, ?ID_MO, ?ID_SCH, ?ID_OST)')
    DataSource = WorkDataSource
    Left = 152
    Top = 265
    poSQLINT64ToBCD = True
    object RshDocDataSetID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object RshDocDataSetID_TIPD: TFIBBCDField
      FieldName = 'ID_TIPD'
      Size = 0
      RoundByScale = True
    end
    object RshDocDataSetTIPD: TFIBStringField
      FieldName = 'TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object RshDocDataSetNAME_TIPD: TFIBStringField
      FieldName = 'NAME_TIPD'
      Size = 50
      EmptyStrToNull = True
    end
    object RshDocDataSetNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object RshDocDataSetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object RshDocDataSetID_MO_IN: TFIBBCDField
      FieldName = 'ID_MO_IN'
      Size = 0
      RoundByScale = True
    end
    object RshDocDataSetID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object RshDocDataSetKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object RshDocDataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object RshDocDataSetNAME_IN: TFIBStringField
      FieldName = 'NAME_IN'
      Size = 300
      EmptyStrToNull = True
    end
  end
  object PrhDocDataSource: TDataSource
    DataSet = PrhDocDataSet
    Left = 112
    Top = 297
  end
  object RshDocDataSource: TDataSource
    DataSet = RshDocDataSet
    Left = 152
    Top = 297
  end
  object RepPrhDocDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_GET_PRH_DOC_BY_PERIOD(:PDATE_BEG,'
      ' :PDATE_END, :PID_SCH, :PID_MO)')
    Left = 208
    Top = 233
    poSQLINT64ToBCD = True
    object RepPrhDocDataSetID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object RepPrhDocDataSetID_TIPD: TFIBBCDField
      FieldName = 'ID_TIPD'
      Size = 0
      RoundByScale = True
    end
    object RepPrhDocDataSetTIPD: TFIBStringField
      FieldName = 'TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object RepPrhDocDataSetNAME_TIPD: TFIBStringField
      FieldName = 'NAME_TIPD'
      Size = 50
      EmptyStrToNull = True
    end
    object RepPrhDocDataSetNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object RepPrhDocDataSetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object RepPrhDocDataSetID_MO_OUT: TFIBBCDField
      FieldName = 'ID_MO_OUT'
      Size = 0
      RoundByScale = True
    end
    object RepPrhDocDataSetFIO_MO_OUT: TFIBStringField
      FieldName = 'FIO_MO_OUT'
      Size = 100
      EmptyStrToNull = True
    end
    object RepPrhDocDataSetNAME_DEP_OUT: TFIBStringField
      FieldName = 'NAME_DEP_OUT'
      Size = 50
      EmptyStrToNull = True
    end
    object RepPrhDocDataSetID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object RepPrhDocDataSetNAME_CUSTOMER: TFIBStringField
      FieldName = 'NAME_CUSTOMER'
      Size = 150
      EmptyStrToNull = True
    end
  end
  object RepRshDocDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_GET_RSH_DOC_BY_PERIOD(:PDATE_BEG,'
      ' :PDATE_END, :PID_SCH, :PID_MO)')
    Left = 208
    Top = 273
    poSQLINT64ToBCD = True
    object RepRshDocDataSetID_DOC: TFIBBCDField
      FieldName = 'ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object RepRshDocDataSetID_TIPD: TFIBBCDField
      FieldName = 'ID_TIPD'
      Size = 0
      RoundByScale = True
    end
    object RepRshDocDataSetTIPD: TFIBStringField
      FieldName = 'TIPD'
      Size = 15
      EmptyStrToNull = True
    end
    object RepRshDocDataSetNAME_TIPD: TFIBStringField
      FieldName = 'NAME_TIPD'
      Size = 50
      EmptyStrToNull = True
    end
    object RepRshDocDataSetNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object RepRshDocDataSetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object RepRshDocDataSetID_MO_IN: TFIBBCDField
      FieldName = 'ID_MO_IN'
      Size = 0
      RoundByScale = True
    end
    object RepRshDocDataSetFIO_MO_IN: TFIBStringField
      FieldName = 'FIO_MO_IN'
      Size = 100
      EmptyStrToNull = True
    end
    object RepRshDocDataSetNAME_DEP_IN: TFIBStringField
      FieldName = 'NAME_DEP_IN'
      Size = 50
      EmptyStrToNull = True
    end
    object RepRshDocDataSetID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object RepRshDocDataSetNAME_CUSTOMER: TFIBStringField
      FieldName = 'NAME_CUSTOMER'
      Size = 150
      EmptyStrToNull = True
    end
  end
  object OborotDataBase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = OborotTransaction
    DefaultUpdateTransaction = OborotTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 72
    Top = 241
  end
  object OborotTransaction: TpFIBTransaction
    DefaultDatabase = OborotDataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 72
    Top = 209
  end
  object pmOborot: TPopupMenu
    Images = imgOborot
    Left = 392
    Top = 153
    object NRefresh: TMenuItem
      Action = acShow
    end
    object NPrint: TMenuItem
      Action = acPrint
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object NMoveOst: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1086#1089#1090#1072#1090#1082#1080
      ImageIndex = 21
      OnClick = NMoveOstClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object acExport1: TMenuItem
      Action = acExport
    end
  end
  object imgOborot: TImageList
    Left = 16
    Top = 200
    Bitmap = {
      494C01011A001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
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
      00000000000000000000000000000000000000000000A4787400A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A4787400A4787400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400C6978D00EDC3A500FFDB
      AD00FED8AB00FFD8AC00FFD8AC00FFD8AC00FFD8AC00FFD8AC00FFD8AC00FFD8
      AB00FFDDAE00EBBFA300C4948E00A47874000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400DFB49C00C6979100F4D9
      BE00F7DDC000F5DABF00F5DBBF00F5DBBF00F5DBBF00F5DBBF00F5DABF00F7DD
      C000F0D1B900C5959000E1BBA500A47874000000000000000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400F4DDC600D2A49400CFA9
      A400F3E6D500F1E1D100F1E1D100F1E1D100F1E1D100F1E1D100F1E1D100F3E5
      D400CCA39E00D0A79B00F3E1CF00A47874000000000000000000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400EFE4DB00F2DBC300C293
      8A00E0CDC600F3EDE200F2E9E000F2E9E000F2E9E000F2E9E000F5EFE400DBC0
      BA00C4968F00F3E4D300EFE4DB00A47874000000000080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400F3EAE500FAF6ED00EAC8
      B200BF938D00EDDFDA00F5EBE400F3E9E200F3E9E200F4EAE300EAD6D100C393
      8F00E9D2C500F9F7EF00F4EAE400A47874000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400F9F5F200FBFAF600D5AF
      A900C0918D00A4787400A4787400A4787400A4787400A4787400A4787400C08F
      8C00E0C6C100FFFFFE00F8F3F100A47874000000000080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400EDD9D800C79D9B00C9A3
      A200F2EDED00F4F4F400EDE9EA00ECEAEB00EAEAEA00E9EEEF00EEF9F900DFD9
      D800C2989700CCA5A400F1E4E400A47874000000000080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400C0979600DBC2C1000000
      0000FCFFFF00FAFFFF00F7FFFF00F5FFFF00F2FFFF00F0FFFF00EFFFFF00F0FF
      FF00ECF8F800D0B6B500C59A9700A47874000000000080808000808080008080
      8000808080000000000000000000000000000000000000000000000080000000
      8000000080000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4787400B6E3E60000000000FDFF
      FF00FBFFFF00FBFFFF00FBFFFF00F9FFFF00F9FFFF00F4FEFD00F0FAFA00E8F7
      F700DFF1F200D2F1F500BDCACE00A47874000000000080808000808080008080
      8000808080000000000000000000000000000000000000008000000080000000
      8000000080000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4787400000000000000
      000000000000F4F9FA00E8F1F200D5E9EB00B9D8DC00A9CFD6009CC8D30093C2
      D20088C0D7008BB5CD00A4787400000000000000000080808000808080008080
      8000808080000000000000000000000000000000000000000000000080000000
      8000000080000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4787400BAE1
      E600A2FDFF0095E6EF008CDEE80086E1EA0084E3EE0086E1F20087E1F50086E3
      FD009EC9DD00A478740000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A478
      7400A8C7CC008AF4FD0088F9FF008CF5FF008CF6FF0089F9FF008FECFB00B0BC
      C600A47874000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A4787400A47874009AE1E7008CF4FB008DF3FA009BE0E700A4787400A478
      7400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A4787400A4787400A4787400A4787400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500B9838500B983
      8500B9838500B9838500B9838500B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A0310300B7380D00E6462D00F448
      3500F34A35000000000000FF000000FF00000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500F6DDB700F4D7
      AC00F3D3A100F1CF9800F0CA8F00B9838500A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A46769000000000000000000000000000000000000000000000000000000
      0000A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A4787400A478740000000000A3320400BF3A1100EB462F00F654
      3C00F75F4100F7674F0000FF0000ED412D008B4115000000000000FF00000000
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500F8E5C9008A94
      D9001E47F600888ECD00F2D19C00B9838500A4676900FCEACE00F0D8BA00DCC1
      A000C4AA8900BFA48000CFAF8200DCB58100E2B87E00E7BC7E00E9BD7F00EFC4
      8100A46769000000000000000000000000000000000000000000000000000572
      0A0005720A0005720A00FFDDAE00FFDDAE00FFDDAE00FFDDAE00FFDDAE00FFDD
      AE00FFDDAE00FFDDAE00A478740000000000AB330700C73C1800F3593E00FB6E
      4A00FB6D4900FCC6BB0000FF0000E23A2400843F1100007600000999180010AF
      360000FF000040B53E00007B0000006600000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FAEDD9001E49
      F9000033FF001E48F600F4D8AB00B9838500A0675B00FEEFDA00F6E0C600302D
      2D00212527003745460099846800AD926F00C2A07400DCB27A00E7BC7E00EFC4
      8100A4676900000000000000000000000000000000000000000005720A00028D
      0E0005720A00F4E3CE00F4E3CE00DF993E00DF993E00DF993E00DF993E00DF99
      3E00F4E3CE00F4E3CE00A478740000000000B5350C00D5462300FE6F4D00FF6D
      4400FF977B000000000000FF000000FF00007F3C0D0000FF00001DC753001EC2
      430000FF00009EEF9F0008931100006800000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FCF5E9008D9D
      ED001E49FA008B97E000F6E0BD00B9838500A0675B00FFF4E500F7E5CF009C8F
      80000D466300036292000B3B54004B474100917B5E00B5976C00D1AB7400E9BF
      7D00A46769000000000000000000000000000000000005720A000D9C15000572
      0A00A4787400FCFAF600FCFAF600FCFAF600FCFAF600FCFAF600FCFAF600FCFA
      F600FCFAF600FFFEF900A47874000000000000000000D5462300FF724900B655
      4100968B8F00B2BBBF00E68A730000FF000000FF000000FF000000FF00002C8A
      390092B48F0068BA660015AD3000027407000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FEFBF600FCF7
      ED00FBF2E400FAEDDA00F8E8CE00B9838500A7756B00FFFBF000F8EADC00EEDD
      CA0022576C00165E8200745D65007D5254005E3F390086725800A78C6600CEAA
      7300A065670000000000000000000000000005720A0005720A0023B534000572
      0A0005720A00FFFFFD00FFFFFD00DF993E00DF993E00DF993E00DF993E00DF99
      3E00FFFFFD00FFFFFD00A4787400000000000000000000000000414665001E4F
      97001255AB00134E9300734C5200000000000000000000FF0000021C0700091C
      4C000C1E66000A2C3D0012913200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD920000000000FEFC
      FA00FDF9F200B9838400B9838400BE867500A7756B00FFFFFC00FAF0E600F8EA
      DA008F9F9D0062555D00DD908C00B87979008E5757005B3D37007D6B51009A81
      5D00925C5E0000000000000000000000000005720A0016A1220043D2690048CF
      6E0005720A00FFFFFE00FDFFFF00000000000000000000000000000000000000
      0000CE8C4F00CE8C4F00A478740000000000000000001066A4000C69D1001C88
      FF001E86FF00187AF3001A67C2000000000000040A000000000003092F00082A
      9C0006289900061F89000729760000000000B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B781830000000000EDBD9200000000000000
      0000FEFDFC00B9838400D397690000000000BC82680000000000FEF7F200FAEF
      E600F0E5D5006B5D6200E9A4A100CF909000B275750087535300583C35007A69
      5000815354000000000000000000000000000000000005720A0048D569000572
      0A00A47874000000000000000000000000000000000000000000000000000000
      00003098FC003098FC00A4787400000000001D688C002882C6002C97FF002D99
      FF002D99FC002D9AFF002897FE00146DC40000040700000207000B3492000F46
      C4000E41B4000F42B7000C36B00002158A00B7818300EED1B100E1B89400E1B6
      8C00DFB18000DCAB7500EFC68600B781830000000000EDBD9200DCA88700DCA8
      8700DCA88700B98384000000000000740400BC82680000000000FFFEFC00FCF6
      F000FAEFE600EBDCCE008C5E5D00E2A1A100CE8F8F00B4767600865252005C3F
      3800764C4E0000000000000000000000000000000000A478740005720A00FFDD
      AE00A47874000000000000000000000000000000000000000000000000000000
      00000000000005720A00A4787400000000001D688C002D8ED70032A0FF00319D
      FC002E98F6002E98F70033A3FF00237ECF000104050001061000114EBD001357
      D700114BC0001152CB00114EC6000D36A000B7818300CA8F6B00952B00009A34
      01009934010099330000E4B57C00B7818300000000000000000045812C000000
      0000000000000000000000000000057E0E00D1926D000000000000000000FFFE
      FC00FEF7F000FAEFE500E1CEC00087595800E1A1A100CC8E8E00B07474008651
      5100633B3C0000000000000000000000000000000000A4787400F4E3CE00F4E3
      CE00A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      740005720A0048D5690005720A00000000001D688C001D688C002D8BC6002F95
      E100319DFB00319AF80034A3FF001F73C2000104070001020400104FA7001C7F
      FF001B74F2001C78F700165ED40010439A00BA8E8500F8EEE500A1421300972E
      000094290000BD764900FDE5B300B78183000000000001780900109726000000
      0000000000000000000004901200087F1000D1926D0000000000000000000000
      0000FFFEFC00FCF7F000FAEFE500D7C1B5008A5B5B00E6A6A600CA8B8B00B675
      75007E4442003E414500000000000000000000000000A4787400FCFAF600FCFA
      F600FCFAF600FCFAF600FCFAF600FCFAF600FCFAF600FFFEF900FFFEF9000572
      0A0048CF6E0043D2690016A1220005720A001D688C001D688C001D688C002F90
      D30035A3FE0035A4FF00309CF300114F88000205080014100C0013273D000F4E
      9A001564BF00196BC7000C34700010439A00CB9A820000000000D5A992009226
      0000A0411200ECCCAE00FFEFC500B781830003750F0049CC72002EA848000370
      0800097B11000C9116000D9C190005730B00DA9D750000000000000000000000
      000000000000FFFEFC00FCF6EF00FCF3E600CFB5AA0097666600EFAAA9008C6D
      73001E799F000C98BD000C98BD000000000000000000A4787400FFFFFD00FFFF
      FD00DF993E00DF993E00DF993E00DF993E00DF993E00FFFFFD00FFFFFD000572
      0A0005720A0023B5340005720A0005720A00000000001D688C001D688C001D68
      8C001D688C001D688C001D688C000000000000000000171614004F4B46004545
      440010161E000208110001030A0000000000DCA8870000000000FCF7F500AE5B
      3300CD957400FBF1DE00DECBB400428A3E0044D273005CE78E003ECA600027B8
      400014AB25000EA31B0007800F0000000000DA9D750000000000000000000000
      00000000000000000000FFFEFB00FFFEF700DAC1BA00955F56009E5D58002D84
      A70006BBF000008EDE00000F95000000810000000000A4787400FDFFFF000000
      00000000000000000000000000000000000000000000CE8C4F00D4915300A478
      740005720A000D9C150005720A000000000000000000000000001D688C001D68
      8C001D688C001D688C0000000000000000000000000000000000383939004140
      3E00110F0C00000000000000000000000000E3B18E000000000000000000EDDB
      D100F9F2EA00B7818300B7818300B784750030AB4A0038C6580026AF3D000D8A
      180009861100077B0D000000000000000000E7AB790000000000000000000000
      000000000000000000000000000000000000DCC7C500A56B5F00D1914F00068F
      C1000393DE000320BA000318B200010B990000000000A4787400000000000000
      000000000000000000000000000000000000000000003098FC003098FC000572
      0A00028D0E0005720A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDBD920000000000000000000000
      0000FDFFFF00B7818300DC9D64000000000000000000138E2100199F29000000
      000000000000000000000000000000000000E7AB7900FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000A56B5F00C1836C000000
      00000263BF002F45ED001031D300010A950000000000A4787400000000000000
      000000000000000000000000000000000000000000000000000005720A000572
      0A0005720A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDBD9200DCA88700DCA88700DCA8
      8700DCA88700B7818300000000000000000000000000000000000A7D12000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00A56B5F00000000000000
      0000000000002732D0000C19B4000000000000000000A4787400A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF004000FF00400000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000FF000000FF0000000000B7818300A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400986B66000000000000000000B44A0800C7521C00EC614500F763
      4F00F6654F000000000000000000000000000000000000000000000000000000
      0000FF004000FF0040000000000000000000A0310300B7380D00E6462D00F448
      3500F34A35000000000000000000000000000000000000000000FF000000FF00
      000000000000000000000000000000000000A0310300B7380D00E6462D00F448
      3500F34A350000000000000000000000000000000000000000000000FF000000
      FF00000000000000FF000000FF000000000000000000B7818300FDEFD900F6E3
      CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC9700EECC
      9700F3D19900986B66000000000000000000B64B0B00CD542200F0614800F86F
      5600F97A5B00F9816A00F76C5800F15B4600A25C270000FF0000FF004000FF00
      4000FF004000FF004000FF004000FF004000A3320400BF3A1100EB462F00F654
      3C00F75F4100F7674F00F4513E00ED412D008B4115000000000000000000FF00
      0000FF000000000000000000000000000000A3320400BF3A1100EB462F00F654
      3C00F75F4100F7674F00F4513E00ED412D008B41150000000000000000000000
      FF000000FF000000FF00000000000000000000000000B4817600FEF3E3009933
      000099330000993300009933000099330000993300009933000099330000EECC
      9700F3D19900986B66000000000000000000BD4C1100D4562B00F6745800FC88
      6500FC876400FDD3CA00FAA49700E9543B009C59220000FF0000FF004000FF00
      4000FF004000FF004000FF004000FF004000AB330700C73C1800F3593E00FB6E
      4A00FB6D4900FCC6BB00F88E7F00E23A2400843F1100007600000999180010AF
      3600FF000000FF000000007B000000660000AB330700C73C1800F3593E00FB6E
      4A00FB6D4900FCC6BB00F88E7F00E23A2400843F1100007600000000FF000000
      FF000000FF000000FF000000FF000066000000000000B4817600FFF7EB009933
      0000FEFEFE00FEFEFE00FEFEFE008EA4FD00B8C6FD00FEFEFE0099330000EFCD
      9900F3D19800986B66000000000000000000C54F1A00DF613900FE896800FF87
      5F00FFAC940000000000FFC9BC00EE66470097561B0011A4250032D46E0033D0
      5E00FF004000FF00400013A9220000820100B5350C00D5462300FE6F4D00FF6D
      4400FF977B0000000000FFBAAA00E94B2E007F3C0D00078E13001DC753001EC2
      430099F29900FF000000FF000000FF000000B5350C00D5462300FE6F4D00FF6D
      4400FF977B0000000000FFBAAA00E94B2E007F3C0D00078E13000000FF001EC2
      430099F299000000FF000000FF000068000000000000BA8E8500FFFCF4009933
      0000FEFEFE00FAFBFE007E98FC000335FB00597AFC00FEFEFE0099330000F0D0
      A100F3D29B00986B6600000000000000000000000000DF613900FF8B6400C670
      5B00ABA2A500C3CACD00ECA18C00FE785600A76528001AB5370026C1560044A1
      5300FF004000FF00400027BF4900078D120000000000D5462300FF724900B655
      4100968B8F00B2BBBF00E68A7300FE5D3C00914A16000CA1210014B03C002C8A
      390092B48F0068BA6600FF000000FF00000000000000D5462300FF724900B655
      4100968B8F00B2BBBF00E68A7300FE5D3C00914A16000000FF000000FF002C8A
      390092B48F0068BA66000000FF000000FF0000000000BA8E8500FFFFFD009933
      0000D6DEFE004368FC000335FB004066FC000436FB00D9E0FE0099330000F0D4
      A900F5D5A300986B6600000000000000000000000000000000005C617F00336A
      AC002370BD002569A9008C676D00000000000000000006380C00063111001531
      67001A3380001644570023A74B00000000000000000000000000414665001E4F
      97001255AB00134E9300734C5200000000000000000002220400021C0700091C
      4C000C1E66000A2C3D0012913200FF0000000000000000000000414665001E4F
      97001255AB00134E9300734C5200000000000000000002220400021C0700091C
      4C000C1E66000A2C3D00129132000000000000000000CB9A8200000000009933
      00005274FC001442FB00BCC9FD00EFF2FE001A47FB004F72FC0097330400F2D8
      B200F6D9AC00986B66000000000000000000000000002080B7001A83DC00309F
      FF00339DFF002B93F6002E81D00000000000020C160000000000081448001342
      B0000F3FAE000F35A00012418F0000000000000000001066A4000C69D1001C88
      FF001E86FF00187AF3001A67C2000000000000040A000000000003092F00082A
      9C0006289900061F89000729760000000000000000001066A4000C69D1001C88
      FF001E86FF00187AF3001A67C2000000000000040A000000000003092F00082A
      9C0006289900061F8900072976000000000000000000CB9A8200000000009933
      0000E4EAFE00D9E0FE00FEFEFE00FEFEFE0098ACFD000335FB0064345900F4DB
      B900F8DDB400986B660000000000000000003282A3003F9AD30044ACFF0045AE
      FF0045AEFD0046AFFF003FACFE002687D100020C120002061100184DA8001F61
      D1001D5CC4001E5DC7001950C1000727A1001D688C002882C6002C97FF002D99
      FF002D99FC002D9AFF002897FE00146DC40000040700000207000B3492000F46
      C4000E41B4000F42B7000C36B00002158A001D688C002882C6002C97FF002D99
      FF002D99FC002D9AFF002897FE00146DC40000040700000207000B3492000F46
      C4000E41B4000F42B7000C36B00002158A0000000000DCA88700000000009933
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE005677FC000335FB00F7E1
      C200F0DAB700986B660000000000000000003282A30045A4E0004BB4FF004AB1
      FD0047ADF80047ADF9004CB6FF003A96DA00030B0E00030F20002269CC002572
      E0002166CE00226DD7002269D3001C50B4001D688C002D8ED70032A0FF00319D
      FC002E98F6002E98F70033A3FF00237ECF000104050001061000114EBD001357
      D700114BC0001152CB00114EC6000D36A0001D688C002D8ED70032A0FF00319D
      FC002E98F6002E98F70033A3FF00237ECF000104050001061000114EBD001357
      D700114BC0001152CB00114EC6000D36A00000000000DCA88700000000009933
      000099330000993300009933000099330000993300008F3311002235C8000335
      FB00C6BCA900986B660000000000000000003282A3003282A30046A2D30048AA
      E8004AB1FC004AAFFA004DB6FF00358CD000050C120005070B00206ABA003197
      FF002F8DF5003091F9002879DE00205EAF001D688C001D688C002D8BC6002F95
      E100319DFB00319AF80034A3FF001F73C2000104070001020400104FA7001C7F
      FF001B74F2001C78F700165ED40010439A001D688C001D688C002D8BC6002F95
      E100319DFB00319AF80034A3FF001F73C2000104070001020400104FA7001C7F
      FF001B74F2001C78F700165ED40010439A0000000000E3B18E00000000000000
      00000000000000000000FFFEFD00FDF8F300FDF6EC00F1E1D500B48176000335
      FB000335FB000335FB0000000000000000003282A3003282A3003282A30048A6
      DD004EB6FE004EB7FF0049B0F600226A9F00060D130026201A00243E57001E69
      AF00277ECD002D85D4001A4D8A00205EAF001D688C001D688C001D688C002F90
      D30035A3FE0035A4FF00309CF300114F88000205080014100C0013273D000F4E
      9A001564BF00196BC7000C34700010439A001D688C001D688C001D688C002F90
      D30035A3FE0035A4FF00309CF300114F88000205080014100C0013273D000F4E
      9A001564BF00196BC7000C34700010439A0000000000E3B18E00000000000000
      0000000000000000000000000000FFFEFC00FFFEF900E3CFC900B4817600E8B2
      7000ECA54A000335FB000000000000000000000000003282A3003282A3003282
      A3003282A3003282A3003282A30000000000000000002A2826006A6661006060
      5F0020293300071321000308170000000000000000001D688C001D688C001D68
      8C001D688C001D688C001D688C000000000000000000171614004F4B46004545
      440010161E000208110001030A0000000000000000001D688C001D688C001D68
      8C001D688C001D688C001D688C000000000000000000171614004F4B46004545
      440010161E000208110001030A000000000000000000EDBD9200000000000000
      00000000000000000000000000000000000000000000E4D4D200B4817600FAC5
      7700CD93770000000000000000000000000000000000000000003282A3003282
      A3003282A3003282A30000000000000000000000000000000000525353005C5A
      5800221E1A0000000000000000000000000000000000000000001D688C001D68
      8C001D688C001D688C0000000000000000000000000000000000383939004140
      3E00110F0C0000000000000000000000000000000000000000001D688C001D68
      8C001D688C001D688C0000000000000000000000000000000000383939004140
      3E00110F0C0000000000000000000000000000000000EDBD9200FCF7F400FCF7
      F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B4817600CF9B
      8600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200B48176000000
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
      000000000000000000000000000000000000000000000000000096675E009F6F
      60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F
      60009F6F60009F6F60009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000000000000000000000000000000000099695F00F6E0
      BF00F4DDB800F3DAB400F3D7AD00F2D5A700F0D3A300F0D09E00EECC9900EECA
      9300EDC99000EDC68C009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000000000008C5A5A008C5A5A0000000000FFFF0000FFFF0000000000008C5A
      5A008C5A5A008C5A5A008C5A5A0000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB00000000000000000000000000000000009D6C6000F6E3
      C600F6E1C100F4DDBB00F3DCB40000810000F2D5AA00F0D3A400F0CF9F00EFCC
      9900EFCB9500EEC990009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000F7DECE00F7DEC60000000000FFFF0000FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000A16E6000F7E6
      CE00F6E5C700F4E1C100008100000081000000810000F3D5AB00F0D3A500EFD1
      9F00EFCE9A00EFCB96009F6F6000000000000000000000000000000000000000
      0000000000000000000000848300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00000000000000000000000000000000000000000000FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000A6726200F8EA
      D400F7E7CE0000810000307A2A005F924B000081000050883C00F2D5AB00F0D3
      A500F0D0A000EFCF9C009F6F6000000000000000000000000000000000000000
      0000000000000084830000FFFE00008483000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000FFD6A500FFD6A500FFD6A500000000000000000084848400FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000AB766300FAEE
      DA00FAEBD50000810000EFE2C200F6E2C200A7B883000081000000810000EDD4
      A900F0D4A600F0D1A1009F6F6000000000000000000000000000000000000000
      000000FFFE0000FFFE0000FFFE0000FFFE000084830000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      0000F7E7CE00F7E7CE000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000000000000000000000B0786400FAF0
      E200FAEEDC00F8EBD500F8E9D000F7E6CA00F6E3C500E6D8B400008100000081
      0000F2D7AD00F2D4A7009F6F60000000000000000000000000000000000000FF
      FE0000FFFE00848484008484840000FFFE0000FFFE0000848300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7EFDE00F7DECE0000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C60000000000EFDECE000000000000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000000000000000000000B57D6400FCF3
      E700FBF0E300FAEFDD00FAEDD800F7E9D100F8E6CB00F6E3C500F6E1C000F4DE
      BA00F4DAB500F3D7AD009F6F60000000000000000000000000008484840000FF
      FE008484840000000000000000008484840000FFFE0000FFFE00008483000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C0000000000FFD6A50000000000FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500000000000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000BB806500FCF7
      ED00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700F3DAB6009F6F6000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFE0000FFFE000084
      830000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF000000000000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000C0836600FCF8
      F300FCF7EF00FCF4EA00FBF2E500FBEFDE00F8EDD900F8EBD400F8E7CE00F7E3
      C700F6E1C200F4DEBB009F6F6000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFE0000FF
      FE0000848300000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000C4876700FEFB
      F800FEFAF300FEF7EF00FCF4EA00FBF2E600FAEFE000F8EDDA00F8EAD400F7E9
      CF00F7E5C900F6E2C4009F6F6000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FE0000FFFE00000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000000000000000000000C9896700FEFC
      FB00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700F7E5CA009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFE00000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000000000000000000000CC8B68000000
      0000FFFEFC00FEFCFA00FEFBF400FEF8F000FCF6ED00FCF4E700FAF2E200FAEF
      DC00F8EDD700F8EAD1009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000000000000000000000B58C
      8C000000000000000000000000000000000000000000FFFFF700FFFFF700B58C
      8C0000000000C68C7B000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000CF8E68000000
      000000000000FFFFFC00FFFCFA00FEFBF600FEF8F000FCF7EE00FBF4E900FBF2
      E300FBEFDD00F8EDD8009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C0000000000000000000000000000000000000000000000000000000000B58C
      8C00C68C7B00000000000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005346450053464500534645005346450053464500534645000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D40000000000EF42
      0000AD290000AD2900007329000073290000000000000000000000000000B58E
      7B00B5928400F7E3D600EFE3DE00EFE3DE00F7E7DE00F7E3D600BDA69C005346
      4500534645000000000000000000000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000097736B00B3887F00B184
      7C00B1847C00B1847C00B1857D00B1857D00B1857E00B0857D00AE857E00AA83
      7C00B0858000B48A7C00875D560000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000000000000BDA69C00F7E7
      DE00FFF3F700E7DBD600DEB29C00D6A68C00E7C7BD00EFEBEF00F7F3F700F7E3
      D600E7CBBD005346450000000000000000003939390080808000808080008080
      8000808080008080800084848400848484008484840084848400848484003939
      39003939390000000000000000000000000000000000B3938C00F1DCCA00FCDB
      C400FCDAC600FCDBC700FAD5BA00FED6BC00FFD4B600FAD3B600F6CFB000F1CD
      AE00F5CEA800FDCFAD009D706A0000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000BDA69C00F7EBE7000000
      0000C68E7300BD5D2900BD5D2900DEB29C00BD5D2900BD5D2900D69E8400F7F3
      F700F7E7DE00D6C7BD0053464500000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      39003939390039393900000000000000000000000000B3969000ECE8D600FFF2
      D400E4E6BE00E3E1B900FFEAD300F4E1B600E9E3AF00FDDDB700FDD8AD00FAD5
      A700F6D6A200FCD8B600A072720000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000BDA69C0000000000CE6D
      4200BD5D2900BD5D2900C6A2940000000000E7825200BD5D2900BD5D2900D696
      7300FFFBF700F7E3D600534645000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      84003939390039393900000000000000000000000000BB9F9000ECEFE500FFFA
      EC00A9D38F00009A0000029B050000980000009D000000930000269D2300D5CD
      9800FFD7AC00FED7BA009E70700000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD2900007329000073290000BDA69C00FFFBFF00DE9E7B00BD5D
      2900CE653100CE653100CE693900D68A6300CE653100CE653100BD5D2900BD5D
      2900E7CBBD00F7EFEF00DECBC6005346450039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FF000000FF00000000FF000000FF00C5C5C5008484
      84008484840039393900393939000000000000000000C0A49800EFF1EA00FFFB
      F400AAD89900009400000098000010A016009CCE9100AFC791002FA826005FB5
      4F00F6DAB100FFDEC6009E71700000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD2900007329000073290000D6C7BD00FFF7F700C6613100BD5D
      2900CE653100BD5D2900CE866300F7E7DE00D6693900BD5D2900CE653100BD5D
      2900CE71420000000000E7CBBD005346450039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      84008484840084848400393939000000000000000000C4A7A000EFF5E900FFFC
      F700B3DCA300019D01000DA10B001DA41C0051B14300F0E5C400F4E2C3005FB4
      5B00D9D29D00FFDDC600A77A740000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD2900007329000073290000D6C7BD00F7DFD600BD5D2900CE65
      3100CE653100BD5D2900D6825200FFFBFF00E7AE9400BD5D2900BD5D2900CE65
      3100BD5D2900FFEFEF00F7DFD600534645000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C5C5
      C5008484840084848400393939000000000000000000CAACA100F4FAF200F2F7
      E500DCEBCE00FBF4E600F5F3DF00F9F1DA00FEE7CD00FEEBD800FFECDB00F7E6
      CD00F0DEB600FEDAC100AB7D750000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900007329000073290000D6C7BD00F7D7CE00CE653100CE65
      3100CE653100CE653100BD5D2900DEAA9400FFF7F700EF9E7300BD5D2900CE65
      3100BD5D2900F7F3EF00EFE3DE00534645000000000000000000B58C8C000000
      0000F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00000000009C6B
      6B00C5C5C50084848400393939000000000000000000D2B5A000F6FAFA00E6F7
      E1008AD38800EDF3DF00FFFCF900C0DEAA004AB0390053B4430049B13C00C5D5
      9F00FFE8D000FDE1CC00AA7E760000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C392100D6C7BD00FFEFE700D6693900CE65
      3100CE653100BD5D2900BD5D2900BD5D2900E7CFC60000000000D6693900CE65
      3100CE693900FFFBFF00F7DFD600534645000000000000000000B58C8C000000
      0000FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B003939390039393900000000000000000000000000D1B4A100F4FAF800FFFF
      FD008FCF910049B95100E2EFD800FFF9EA0063BB64000093000000910000AAD0
      8D00FFEED900FEDFCA00AC7F770000000000C8D0D400FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100C8D0D400D6C7BD0000000000F79A6B00D669
      3900CE8E6B00F7EBE700D6825200BD5D2900D696730000000000E78E5A00BD5D
      2900EF92630000000000D6C7BD00534645000000000000000000B58C8C000000
      0000FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B000000000000000000000000000000000000000000DBBDA300F6FDFA000000
      0000E9F4E5003AAA350018A519005FC0590036AD33000099000000950000AAD4
      8F00FFF6E200FCDCC800AF847D0000000000C8D0D400C8D0D400FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100C8D0D400C8D0D40000000000D6C7BD00FFEBDE00EF86
      5200E7825200F7F7F70000000000DEBAAD0000000000F7F7F700DE714200D671
      3900FFF3EF00F7E7E7005346450000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A5000000
      00009C6B6B0000000000000000000000000000000000E1C3A300F6FDFB00F8FC
      F80000000000C4EBCC0021AA2500009500000094000012A414000D9F1100A5CC
      8B00FFCAC000F8ADA100AC7E760000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000D6C7BD0000000000FFEF
      D600FFAA7300EFAA8C00EFE3DE00EFEFEF00F7E7E700FFA67B00F78E5A00F7DB
      CE0000000000D6C7BD000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D6000000
      00009C6B6B0000000000000000000000000000000000E6C9A900F9FFFE00F8FC
      F800F8FCF800F8FCF800FBFEFA000000000000000000FEFEF800FFFFFE00C9AA
      9700D4975200C79A7A00C3AEA20000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D4000000000000000000D6C7BD000000
      000000000000FFF3C600FFDFAD00FFD39C00FFC79400FFD7AD00000000000000
      0000D6C7BD000000000000000000000000000000000000000000000000000000
      0000B58C8C000000000000000000000000000000000000000000000000000000
      0000000000009C6B6B00000000000000000000000000E8CBAC00FBFFFF00FAFF
      FF00FAFFFF00FAFFFF00FAFEFD00F9FEFD00F4FBFB00F3FBF800F7FFFC00C6AA
      9800D09E7300DCC9B6000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900FF9C1800EF4200008C392100C8D0D400C8D0D400FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D400000000000000000000000000D6C7
      BD00D6C7BD0000000000000000000000000000000000FFFBFF00DECBC600D6C7
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B00000000000000000000000000E7C29D00E1C6A500E2C6
      A600E2C6A600E2C6A600E2C4A400E1C3A300DDC1A100DCC0A000DEC3A300C29C
      8400DECCB800000000000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900F7FFFF00EF4200008C392100C8D0D400C8D0D400FFA53900F7FFFF000000
      00008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      000000000000DECBC600D6C7BD00D6C7BD00D6C7BD00D6C7BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400FFCE
      6300FFCE6300FFA53900FFA53900C8D0D400C8D0D400FFCE6300FFA53900FFA5
      39008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5636B0084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00CECED60084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000FFF7E70045454500FFD6
      A50045454500FFD6A5001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001F1F1F001F1F1F00F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000006C6C
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B000000000000000000FFF7EF00F7E7CE00F7DE
      C6001F1F1F001F1F1F001F1F1F00F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000FFFFF700FFD6A5001F1F
      1F008484840000FFFF001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF0000000000FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B000000000000000000FFFFF700FFE7D6001F1F
      1F00C6C6C60000FFFF001F1F1F00FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF0000000000FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B0000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B000000000000000000000000001F1F1F008484
      840000FFFF001F1F1F00FFFFF700FFFFF7000000000000000000C68C7B00C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A000000000000FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B00000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF000000840000000000FFFFF700FFFFF700B58C
      8C0000000000C68C7B000000000000000000000000004545450084848400C6C6
      C60000FFFF001F1F1F00000000000000000000000000C68C7B00C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C31000000000000000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B00000000000000000000000000000000000000FF000000
      FF000000840000000000000000000000FF00000084000000000000000000B58C
      8C00C68C7B00000000000000000000000000000000001F1F1F001F1F1F0000FF
      FF001F1F1F0000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C310000000000000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B0000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000001F1F1F0000008400000084001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000C8D0D4001F1F1F001F1F1F001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF63310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A0000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A0000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000FF0000008400000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B630000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004C804C004C804C004C80
      4C004C804C00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF00000084000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008585850000FFFF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004C804C0052AE570052AE
      57004C804C00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF0000848484008484840000FF000000FF000000840000000000000000
      0000000000000000000000000000000000000000000000FFFF0000000000B58C
      8C008585850000FFFF00F7DEC60000FFFF0000FFFF00F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B0000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C0000000000000000004C804C004C804C004C804C0052AE570052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      00008484840000000000000000008484840000FF000000FF0000008400000000
      000000000000000000000000000000000000000000008585850000FFFF00B58C
      8C008585850000FFFF0000FFFF0085858500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C0000000000000000004C804C0052AE570052AE570052AE570052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FF000000FF00000084
      00000000000000000000000000000000000000000000000000008585850000FF
      FF008585850000FFFF008585850000FFFF0000FFFF0000FFFF00FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C0000000000000000004C804C0069CA800069CA800069CA800052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      0000008400000000000000000000000000008585850085858500858585008585
      850000FFFF0085858500858585008585850085858500FFFFF700FFFFF700B58C
      8C0000000000C68C7B000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004C804C004C804C004C804C0069CA800052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF0000000000000000000000000000000000000000000000FFFF008585
      850000FFFF0000FFFF0000FFFF0000000000000000000000000000000000B58C
      8C00C68C7B00000000000000000000000000B58C8C0000000000000000000000
      0000FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004C804C0069CA800052AE
      57004C804C000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FF00000000000000000000000000000000000000FFFF008585850000FF
      FF008585850000FFFF008585850000FFFF00B58C8C00B58C8C00B58C8C00B58C
      8C0000000000000000000000000000000000B58C8C0000000000000000000000
      0000FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004C804C004C804C004C80
      4C004C804C000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000008585850000FFFF000000
      00008585850000FFFF00000000008585850000FFFF0000000000000000000000
      000000000000000000000000000000000000B58C8C0000000000000000000000
      00000000000000000000B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008585850000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF3FF000000008001E3FF00000000
      0000C3FF00000000000083FF0000000000000003000000000000037F00000000
      0000037F00000000000003770000000000000367000000001000034000000000
      2000030000000000B801034000000000C003036700000000E0071F7700000000
      F00F3F7F00000000FC3F007F00000000FFDFFF80FFFFFFFF048FFF800007F001
      0057FF800007E0010000FF800007C0010400FF80000780018000FF8000070001
      C181FFA0000701F1810100B1400787F100000082400787F9000000DE60078001
      0000009C700380000000400078018000818140017C009F81C3C360037F00BF83
      FFFF719F0010BFC7FFFF03DF0039800FFFFFFFF3FF1FFF9C800307F307CF07C9
      8003000000670063800300000000000080030400040004008003800080008000
      8003C181C180C181A003810181018101A003000000000000A003000000000000
      A003000000000000BC03000000000000BE03818181818181BF87C3C3C3C3C3C3
      800FFFFFFFFFFFFF801FFFFFFFFFFFFFFFFFFFFFFFFFC001FFFFCF3F0021C001
      FFFF80010029C001FDFF80010021C001F8FFA0810021C001F07F8001FFFEC001
      E03FC0010021C001C01FE0010029C001C60FE0010021C001EF07E0010021C001
      FF83E001FFFEC001FFC3E0010021C001FFE3E0010029D001FFF7EF8B0021D801
      FFFFEFE70021C001FFFFE00FFFFEFFFFF81FFFFFFFFFE020E007800F80012000
      C0030007800120009001000380012030A1010003800120300000000180016030
      000400018001403000008001800140300000D021800100300040D00380010030
      4044D00F900100308281E01788010030A00BE01781810030D837F7FB80030030
      E78FF80380070010F83FFFFFFFFF0000FFFF800FFCFFFFFFE001800FFC3FFF3F
      E001800FFC1FFE3FE001800FF803FC3FE001800FF003FC3FC001800FF803FC3F
      C001800FD803FC3FE001800FD803FC3FE001800F0003FC3FE001800F8103F81F
      E00180EFD903F00FE001C0CFD103E007E08B838FF803C003C667878FF8038001
      800F000FF8030000FF9F000FF803FFFFE001F003FFFFFFFFE001F003FFFFFFFF
      E001F003FFFFFFFFE001F003C7E7FDFFE0010003C3C7F8FFE0010003E18FF07F
      E0010003F01FE03FE0010003F83FC01FA0010601FC3FC60F80010601F81FEF07
      C0010601F10FFF83000B0001E387FFC3C1E77007C7C7FFE3800F7007CFE7FFF7
      927F7C7FFFFFFFFFF3FF00FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object WorkStoredProc: TpFIBStoredProc
    Database = OborotDataBase
    Transaction = WorkTransaction
    Left = 392
    Top = 193
  end
  object CrossDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_MAKE_OBOROT_BY_PERIOD_CROSS(:PID_MO, '
      ' :PDATE_BEG, :PDATE_END)')
    Left = 296
    Top = 233
    poSQLINT64ToBCD = True
    object CrossDataSetID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object CrossDataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object CrossDataSetSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object CrossDataSetID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object CrossDataSetFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 65
      EmptyStrToNull = True
    end
    object CrossDataSetSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 30
      EmptyStrToNull = True
    end
    object CrossDataSetNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 100
      EmptyStrToNull = True
    end
    object CrossDataSetID_OST: TFIBBCDField
      FieldName = 'ID_OST'
      Size = 0
      RoundByScale = True
    end
    object CrossDataSetID_NOMN: TFIBIntegerField
      FieldName = 'ID_NOMN'
    end
    object CrossDataSetNOMN: TFIBStringField
      FieldName = 'NOMN'
      EmptyStrToNull = True
    end
    object CrossDataSetNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object CrossDataSetID_UNIT: TFIBIntegerField
      FieldName = 'ID_UNIT'
    end
    object CrossDataSetUNIT: TFIBStringField
      FieldName = 'UNIT'
      EmptyStrToNull = True
    end
    object CrossDataSetUNIT_NAME: TFIBStringField
      FieldName = 'UNIT_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object CrossDataSetTIP_COLUMN: TFIBIntegerField
      FieldName = 'TIP_COLUMN'
    end
    object CrossDataSetPRICE: TFIBBCDField
      FieldName = 'PRICE'
      Size = 4
      RoundByScale = True
    end
    object CrossDataSetKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object CrossDataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object CrossDataSetID_MARK: TFIBBCDField
      FieldName = 'ID_MARK'
      Size = 0
      RoundByScale = True
    end
    object CrossDataSetMARK: TFIBStringField
      FieldName = 'MARK'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object WorkTransaction: TpFIBTransaction
    DefaultDatabase = OborotDataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 392
    Top = 233
  end
  object RepRshMOLDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_GET_RSH_MO_BY_PERIOD(:PDATE_BEG,'
      ' :PDATE_END, :PID_SCH, :PID_MO)')
    Left = 296
    Top = 185
    poSQLINT64ToBCD = True
    object RepRshMOLDataSetID_MO_IN: TFIBBCDField
      FieldName = 'ID_MO_IN'
      Size = 0
      RoundByScale = True
    end
    object RepRshMOLDataSetFIO_MO_IN: TFIBStringField
      FieldName = 'FIO_MO_IN'
      Size = 100
      EmptyStrToNull = True
    end
    object RepRshMOLDataSetSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 62
      EmptyStrToNull = True
    end
    object RepRshMOLDataSetNAME_DEP_IN: TFIBStringField
      FieldName = 'NAME_DEP_IN'
      Size = 50
      EmptyStrToNull = True
    end
    object RepRshMOLDataSetID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object RepRshMOLDataSetNAME_CUSTOMER: TFIBStringField
      FieldName = 'NAME_CUSTOMER'
      Size = 150
      EmptyStrToNull = True
    end
  end
  object OborRepDataSet: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    Left = 160
    Top = 153
    poSQLINT64ToBCD = True
  end
  object OborotFormStorage: TFormStorage
    UseRegistry = True
    StoredValues = <
      item
        Name = 'FormWidth'
        Value = 0
      end
      item
        Name = 'FormHeight'
        Value = 0
      end>
    Left = 464
    Top = 169
  end
  object MainActionList: TActionList
    Left = 672
    Top = 168
    object acShow: TAction
      Caption = 'acShow'
      ShortCut = 116
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = acShowExecute
    end
    object acPrint: TAction
      Caption = 'acPrint'
      ShortCut = 16464
      SecondaryShortCuts.Strings = (
        'F6')
      OnExecute = acPrintExecute
    end
    object acExit: TAction
      Caption = 'acExit'
      ShortCut = 16419
      SecondaryShortCuts.Strings = (
        'Esc')
      OnExecute = acExitExecute
    end
    object acFields: TAction
      Caption = 'acFields'
      ShortCut = 16507
      OnExecute = acFieldsExecute
    end
    object acExport: TAction
      Caption = 'acExport'
      ShortCut = 16453
      OnExecute = acExportExecute
    end
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40994.426360416670000000
    ReportOptions.LastChange = 40994.426360416670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 560
    Top = 236
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 593
    Top = 238
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = WorkDataSet
    Left = 626
    Top = 240
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 661
    Top = 244
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 664
    Top = 276
  end
  object frxDS_Docs: TfrxDBDataset
    UserName = 'frxDS_Docs'
    CloseDataSource = False
    DataSet = ds_docs
    Left = 624
    Top = 273
  end
  object ds_docs: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    Left = 592
    Top = 273
    poSQLINT64ToBCD = True
  end
  object ds_invnum: TpFIBDataSet
    Database = OborotDataBase
    Transaction = OborotTransaction
    Left = 552
    Top = 272
    poSQLINT64ToBCD = True
  end
end
