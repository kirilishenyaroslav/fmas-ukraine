object LgotaAddPersent_Form: TLgotaAddPersent_Form
  Left = 478
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
  ClientHeight = 145
  ClientWidth = 215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TcxButton
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
    LookAndFeel.Kind = lfUltraFlat
  end
  object CancelButton: TcxButton
    Left = 136
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
    LookAndFeel.Kind = lfUltraFlat
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 0
    Width = 201
    Height = 105
    Alignment = alTopLeft
    LookAndFeel.Kind = lfUltraFlat
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 3
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    end
    object cxLabel3: TcxLabel
      Left = 104
      Top = 48
      Width = 51
      Height = 17
      TabOrder = 4
      Caption = #1055#1088#1086#1094#1077#1085#1090
    end
    object cxLabel2: TcxLabel
      Left = 104
      Top = 8
      Width = 97
      Height = 17
      AutoSize = False
      TabOrder = 5
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    end
    object DateBegEdit: TcxDateEdit
      Left = 8
      Top = 28
      Width = 89
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = DateBegEditKeyPress
    end
    object PercentEdit: TcxCurrencyEdit
      Left = 104
      Top = 68
      Width = 89
      Height = 21
      BeepOnEnter = False
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.0000;'
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = PercentEditKeyPress
    end
    object DateEndEdit: TcxDateEdit
      Left = 104
      Top = 28
      Width = 89
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = DateEndEditKeyPress
    end
  end
end
