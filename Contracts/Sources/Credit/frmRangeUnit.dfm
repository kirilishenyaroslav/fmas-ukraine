object frmRange: TfrmRange
  Left = 443
  Top = 237
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 212
  ClientWidth = 215
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
  object lbl1: TLabel
    Left = 8
    Top = 9
    Width = 7
    Height = 13
    Caption = #1047
  end
  object Label1: TLabel
    Left = 96
    Top = 9
    Width = 14
    Height = 13
    Caption = #1055#1086
  end
  object OKButton: TcxButton
    Left = 15
    Top = 177
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 111
    Top = 177
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object RBegEdit: TcxCurrencyEdit
    Left = 7
    Top = 27
    Width = 70
    Height = 21
    BeepOnEnter = False
    EditValue = 1.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '0'
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clDefault
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 0
    OnKeyPress = RBegEditKeyPress
  end
  object REndEdit: TcxCurrencyEdit
    Left = 95
    Top = 27
    Width = 70
    Height = 21
    BeepOnEnter = False
    EditValue = 100.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '0'
    Properties.ReadOnly = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clDefault
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 1
    OnKeyPress = REndEditKeyPress
  end
  object radAll: TcxRadioButton
    Left = 8
    Top = 72
    Width = 153
    Height = 17
    Caption = #1059#1089#1110' '#1089#1090#1086#1088#1110#1085#1082#1080
    Checked = True
    TabOrder = 4
    TabStop = True
  end
  object radChet: TcxRadioButton
    Left = 8
    Top = 104
    Width = 161
    Height = 17
    Caption = #1055#1072#1088#1085#1110' '#1089#1090#1086#1088#1110#1085#1082#1080
    TabOrder = 5
  end
  object radNechet: TcxRadioButton
    Left = 8
    Top = 136
    Width = 161
    Height = 17
    Caption = #1053#1077#1087#1072#1088#1085#1110' '#1089#1090#1086#1088#1110#1085#1082#1080
    TabOrder = 6
  end
end
