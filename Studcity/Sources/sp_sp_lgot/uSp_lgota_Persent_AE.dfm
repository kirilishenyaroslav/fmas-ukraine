object frmLgota_Procent_AE: TfrmLgota_Procent_AE
  Left = 679
  Top = 358
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
  ClientHeight = 145
  ClientWidth = 232
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
    Left = 64
    Top = 112
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
    LookAndFeel.Kind = lfUltraFlat
  end
  object CancelButton: TcxButton
    Left = 144
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
    Width = 217
    Height = 105
    Alignment = alTopLeft
    LookAndFeel.Kind = lfUltraFlat
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 8
      Top = 13
      Width = 257
      Height = 17
      AutoSize = False
      TabOrder = 1
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
    end
    object PercentEdit: TcxCurrencyEdit
      Left = 112
      Top = 68
      Width = 89
      Height = 21
      BeepOnEnter = False
      EditValue = 0
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.0000;'
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = PercentEditKeyPress
    end
    object Button_name: TcxButtonEdit
      Left = 8
      Top = 32
      Width = 201
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = Button_namePropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object RadioButton_procent: TcxRadioButton
      Left = 8
      Top = 56
      Width = 81
      Height = 17
      Caption = #1042#1110#1076#1089#1086#1090#1086#1082
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object RadioButton_sum: TcxRadioButton
      Left = 8
      Top = 80
      Width = 89
      Height = 17
      Caption = #1057#1091#1084#1072
      TabOrder = 4
    end
  end
end
