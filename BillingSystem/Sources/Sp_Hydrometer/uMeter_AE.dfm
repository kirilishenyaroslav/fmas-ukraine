object frmMeter_AE: TfrmMeter_AE
  Left = 579
  Top = 365
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1082#1072#1079#1072#1085#1080#1103
  ClientHeight = 96
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 440
    Height = 57
    Align = alTop
    Alignment = alCenterCenter
    TabOrder = 0
    object DateSet: TcxDateEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      Properties.ShowTime = False
      TabOrder = 0
    end
    object Label_meter_date: TcxLabel
      Left = 16
      Top = 8
      Width = 129
      Height = 17
      TabOrder = 1
      Caption = #1044#1072#1090#1072' '#1079#1085#1103#1090#1090#1103' '#1087#1086#1082#1072#1079#1072#1085#1100
    end
    object Label_meter: TcxLabel
      Left = 196
      Top = 8
      Width = 64
      Height = 17
      TabOrder = 2
      Caption = #1055#1086#1082#1072#1079#1072#1085#1085#1103
    end
    object Label_ADJUSTMENT_VOLUME: TcxLabel
      Left = 315
      Top = 8
      Width = 99
      Height = 17
      TabOrder = 3
      Caption = #1050#1086#1088#1077#1075#1091#1102#1095#1080#1081' '#1086#1073#39#1108#1084
    end
    object MeterBeg: TcxCurrencyEdit
      Left = 166
      Top = 23
      Width = 121
      Height = 21
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      TabOrder = 4
      OnKeyPress = MeterBegKeyPress
    end
    object AdjustVolume: TcxCurrencyEdit
      Left = 304
      Top = 24
      Width = 121
      Height = 21
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      TabOrder = 5
      OnKeyPress = AdjustVolumeKeyPress
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 57
    Width = 440
    Height = 39
    Align = alTop
    Alignment = alCenterCenter
    TabOrder = 1
    object Button_ok: TcxButton
      Left = 272
      Top = 7
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
      OnClick = Button_okClick
    end
    object Button_Cancel: TcxButton
      Left = 352
      Top = 7
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = Button_CancelClick
    end
  end
end
