object frmSpravReportSettings: TfrmSpravReportSettings
  Left = 448
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 165
  ClientWidth = 290
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
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 290
    Height = 121
    Align = alTop
    Alignment = alTopLeft
    Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1079#1072' ...'
    TabOrder = 0
    object Payers_RadioButton: TcxRadioButton
      Left = 8
      Top = 24
      Width = 265
      Height = 17
      Caption = #1086#1089#1086#1073#1072#1084#1080', '#1103#1082#1110' '#1087#1083#1072#1090#1080#1083#1080' '#1079#1072' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103' '#1079' '#1087#1077#1088#1110#1086#1076#1091':'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = Payers_RadioButtonClick
    end
    object Livers_RadioButton: TcxRadioButton
      Left = 8
      Top = 80
      Width = 257
      Height = 17
      Caption = #1091#1089#1110#1084#1072' '#1087#1088#1086#1078#1080#1074#1072#1102#1095#1080#1084#1080
      TabOrder = 1
    end
    object cxDateEdit1: TcxDateEdit
      Left = 144
      Top = 48
      Width = 121
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 2
      EditValue = 38596d
    end
  end
  object OkButton: TcxButton
    Left = 36
    Top = 131
    Width = 124
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    Default = True
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 165
    Top = 131
    Width = 124
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
