object ImportBankReestrForm: TImportBankReestrForm
  Left = 295
  Top = 179
  BorderStyle = bsDialog
  Caption = #1030#1084#1087#1086#1088#1090' '#1085#1072#1082#1083#1072#1076#1085#1080#1093' '#1079' '#1089#1080#1089#1090#1077#1084#1080' "'#1041#1072#1085#1082'"'
  ClientHeight = 692
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BankSchetGroup: TGroupBox
    Left = 8
    Top = 48
    Width = 641
    Height = 105
    Caption = #1041#1072#1083#1072#1085#1089#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object BankSchetEdit: TcxButtonEdit
      Left = 200
      Top = 32
      Width = 409
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = BankSchetEditPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Text = 'BankSchetEdit'
    end
    object BankSchetCheckBox: TCheckBox
      Left = 8
      Top = 32
      Width = 177
      Height = 17
      Caption = #1041#1072#1083#1072#1085#1089#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BankSchetCheckBoxClick
    end
    object IsVidNaklRadioButton: TcxRadioButton
      Left = 96
      Top = 72
      Width = 169
      Height = 17
      Caption = #1044#1077#1073#1077#1090#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object IsOtrNaklRadioButton: TcxRadioButton
      Left = 320
      Top = 72
      Width = 185
      Height = 17
      Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object ImportPanel: TGroupBox
    Left = 8
    Top = 624
    Width = 641
    Height = 57
    Caption = #1042#1110#1076#1073#1110#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object StartBtn: TcxButton
      Left = 232
      Top = 24
      Width = 185
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080' '#1074#1110#1076#1073#1110#1088
      TabOrder = 0
      OnClick = StartBtnClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 784
    Width = 673
    Height = 49
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object PeriodLabel: TcxLabel
      Left = 8
      Top = 16
      Width = 58
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1087#1077#1088#1110#1086#1076
    end
    object NumReestrLabel: TcxLabel
      Left = 192
      Top = 16
      Width = 89
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #8470' '#1088#1077#1108#1089#1090#1088#1091
    end
    object PeriodValLabel: TcxLabel
      Left = 64
      Top = 16
      Width = 94
      Height = 17
      AutoSize = False
      TabOrder = 2
    end
    object NumReestrValLabel: TcxLabel
      Left = 280
      Top = 16
      Width = 113
      Height = 17
      AutoSize = False
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 0
    Width = 641
    Height = 49
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object NaklLabel: TcxLabel
      Left = 168
      Top = 13
      Width = 321
      Height = 28
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1030#1084#1087#1086#1088#1090' '#1085#1072#1082#1083#1072#1076#1085#1080#1093' '#1079' '#1089#1080#1089#1090#1077#1084#1080' "'#1041#1072#1085#1082'"'
    end
  end
  object CustomerGroupBox: TGroupBox
    Left = 8
    Top = 160
    Width = 641
    Height = 153
    Caption = #1082#1086#1085#1090#1088#1072#1075#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object IPNLabel: TLabel
      Left = 24
      Top = 48
      Width = 125
      Height = 16
      Caption = #1030#1055#1053' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 80
      Width = 109
      Height = 16
      Caption = #1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CustomerButtonEdit: TcxButtonEdit
      Left = 152
      Top = 80
      Width = 465
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = CustomerButtonEditPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Text = 'CustomerButtonEdit'
    end
    object CustomerCheckBox: TcxCheckBox
      Left = 16
      Top = 16
      Width = 113
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      OnClick = CustomerCheckBoxClick
    end
    object DogovorCheckBox: TcxCheckBox
      Left = 16
      Top = 112
      Width = 121
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1086#1075#1086#1074#1110#1088
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      OnClick = DogovorCheckBoxClick
    end
    object DogovorButtonEdit: TcxButtonEdit
      Left = 152
      Top = 112
      Width = 465
      Height = 24
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = DogovorButtonEditPropertiesButtonClick
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Text = 'DogovorButtonEdit'
    end
    object IPNCustomerTextEdit: TEdit
      Left = 155
      Top = 48
      Width = 270
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = 'IPNCustomerTextEdit'
      OnKeyPress = IPNCustomerTextEditKeyPress
    end
  end
  object PeriodGroupBox: TGroupBox
    Left = 8
    Top = 320
    Width = 641
    Height = 57
    Caption = #1055#1077#1088#1110#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object ZLabel: TcxLabel
      Left = 104
      Top = 24
      Width = 18
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1079
    end
    object POLabel: TcxLabel
      Left = 352
      Top = 24
      Width = 27
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1087#1086
    end
    object DateBegDateEdit: TcxDateEdit
      Left = 128
      Top = 24
      Width = 161
      Height = 24
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object DateEndDateEdit: TcxDateEdit
      Left = 376
      Top = 24
      Width = 161
      Height = 24
      ParentFont = False
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object PeriodCheckBox: TcxCheckBox
      Left = 8
      Top = 24
      Width = 89
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1088#1110#1086#1076
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Visible = False
      OnClick = PeriodCheckBoxClick
    end
  end
  object GroupBox7: TGroupBox
    Left = 8
    Top = 376
    Width = 641
    Height = 241
    TabOrder = 6
    object GroupBox5: TGroupBox
      Left = 0
      Top = 40
      Width = 641
      Height = 81
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 24
        Top = 8
        Width = 593
        Height = 57
        TabOrder = 0
        object EducationRadioGroup: TRadioGroup
          Left = 0
          Top = 0
          Width = 593
          Height = 57
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object OnlyEducationRadioButton: TRadioButton
          Left = 32
          Top = 24
          Width = 241
          Height = 17
          Caption = #1090#1110#1083#1100#1082#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1080' '#1085#1072#1074#1095#1072#1085#1085#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object NotEducationRadioButton: TRadioButton
          Left = 312
          Top = 24
          Width = 233
          Height = 17
          Caption = #1073#1077#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1085#1072#1074#1095#1072#1085#1085#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object GroupBox6: TGroupBox
      Left = 0
      Top = 144
      Width = 641
      Height = 81
      TabOrder = 1
      object GroupBox4: TGroupBox
        Left = 16
        Top = 16
        Width = 601
        Height = 49
        TabOrder = 0
        object StudCityRadioGroup: TRadioGroup
          Left = 0
          Top = 0
          Width = 601
          Height = 49
          TabOrder = 0
        end
        object OnlyStudCityRadioButton: TRadioButton
          Left = 24
          Top = 16
          Width = 265
          Height = 17
          Caption = #1090#1110#1083#1100#1082#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1080' '#1089#1090#1091#1076#1084#1110#1089#1090#1077#1095#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object NotStudCityRadioButton: TRadioButton
          Left = 312
          Top = 16
          Width = 265
          Height = 17
          Caption = #1073#1077#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1089#1090#1091#1076#1084#1110#1089#1090#1077#1095#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object EducationCheckBox: TCheckBox
      Left = 32
      Top = 16
      Width = 273
      Height = 17
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1073#1072#1085#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = EducationCheckBoxClick
    end
    object StudCityCheckBox: TCheckBox
      Left = 32
      Top = 128
      Width = 353
      Height = 17
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1073#1072#1085#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = StudCityCheckBoxClick
    end
  end
end
