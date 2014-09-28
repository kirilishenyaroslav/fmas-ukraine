object fltSpecForm: TfltSpecForm
  Left = 435
  Top = 337
  Width = 282
  Height = 211
  Anchors = []
  Caption = #1060#1110#1083#1100#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    266
    173)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 265
    Height = 65
    Alignment = alTopLeft
    Caption = #1054#1087#1083#1072#1090#1072
    TabOrder = 0
    object fltDateEndEdit: TcxDateEdit
      Left = 112
      Top = 40
      Width = 91
      Height = 21
      Enabled = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object fltDateBegEdit: TcxDateEdit
      Left = 14
      Top = 40
      Width = 91
      Height = 21
      Enabled = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object fltDatePeriodCheck: TcxCheckBox
      Left = 8
      Top = 20
      Width = 89
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079
      TabOrder = 2
      OnClick = fltDatePeriodCheckClick
    end
    object cxLabel10: TcxLabel
      Left = 109
      Top = 20
      Width = 92
      Height = 17
      AutoSize = False
      TabOrder = 3
      Caption = ''
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 66
    Width = 265
    Height = 79
    Alignment = alTopLeft
    TabOrder = 1
    object cxCheckBox1: TcxCheckBox
      Left = 8
      Top = 52
      Width = 201
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1053#1080#1078#1085#1080#1081' '#1091#1088#1086#1074#1077#1085#1100
      TabOrder = 0
    end
    object cxClassEdit: TcxButtonEdit
      Left = 12
      Top = 31
      Width = 245
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxClassEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cbClass: TcxCheckBox
      Left = 8
      Top = 10
      Width = 201
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1083#1072#1089#1080#1092#1110#1082#1072#1090#1086#1088
      TabOrder = 2
      OnClick = cbClassClick
    end
  end
  object OKButton: TcxButton
    Left = 1
    Top = 146
    Width = 95
    Height = 25
    Anchors = []
    BiDiMode = bdRightToLeft
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
    ParentBiDiMode = False
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 98
    Top = 146
    Width = 101
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 3
  end
  object cxButton3: TcxButton
    Left = 201
    Top = 146
    Width = 63
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
  end
  object pFIBDatabase1: TpFIBDatabase
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 208
    Top = 24
  end
end
