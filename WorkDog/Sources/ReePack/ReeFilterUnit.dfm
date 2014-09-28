object frmReeFilter: TfrmReeFilter
  Left = 577
  Top = 617
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088
  ClientHeight = 129
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    327
    129)
  PixelsPerInch = 96
  TextHeight = 13
  object cbNumRee: TcxCheckBox
    Left = 12
    Top = 6
    Width = 141
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #8470' '#1088#1077#1101#1089#1090#1088#1091
    TabOrder = 0
    OnClick = cbNumReeClick
  end
  object NumReeEdit: TcxTextEdit
    Left = 16
    Top = 24
    Width = 137
    Height = 21
    Enabled = False
    Properties.MaxLength = 20
    Style.Color = clMoneyGreen
    TabOrder = 1
    OnKeyDown = NumReeEditKeyDown
  end
  object cbSumRee: TcxCheckBox
    Left = 12
    Top = 46
    Width = 141
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1091#1084#1072' '#1088#1077#1108#1089#1090#1088#1091
    TabOrder = 2
    OnClick = cbSumReeClick
  end
  object SumReeEdit: TcxTextEdit
    Left = 16
    Top = 64
    Width = 137
    Height = 21
    Enabled = False
    Properties.MaxLength = 20
    Style.Color = clMoneyGreen
    TabOrder = 3
    OnKeyDown = SumReeEditKeyDown
  end
  object OKButton: TcxButton
    Left = 8
    Top = 99
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object cxButton2: TcxButton
    Left = 128
    Top = 99
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 248
    Top = 99
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 6
    OnClick = cxButton3Click
  end
  object cbDate: TcxCheckBox
    Left = 164
    Top = 6
    Width = 157
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1091
    TabOrder = 7
    OnClick = cbDateClick
  end
  object DateEdit: TcxDateEdit
    Left = 168
    Top = 24
    Width = 153
    Height = 21
    Enabled = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = clMoneyGreen
    TabOrder = 8
    OnKeyDown = DateEditKeyDown
  end
  object cbNumDoc: TcxCheckBox
    Left = 168
    Top = 46
    Width = 153
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #8470' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1076#1086#1088#1091#1095#1077#1085#1085#1103
    TabOrder = 9
    OnClick = cbNumDocClick
  end
  object NumDocEdit: TcxTextEdit
    Left = 168
    Top = 64
    Width = 153
    Height = 21
    Enabled = False
    Style.Color = clMoneyGreen
    TabOrder = 10
    OnKeyDown = NumDocEditKeyDown
  end
end
