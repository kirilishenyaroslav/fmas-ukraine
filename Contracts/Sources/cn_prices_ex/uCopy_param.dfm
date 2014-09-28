object frmCopy_param: TfrmCopy_param
  Left = 619
  Top = 279
  Width = 256
  Height = 196
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object koeffic: TcxCurrencyEdit
    Left = 176
    Top = 8
    Width = 65
    Height = 24
    EditValue = 1.000000000000000000
    ParentFont = False
    Properties.DisplayFormat = '0.00'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 0
    OnExit = koefficExit
  end
  object Ok_Button: TcxButton
    Left = 24
    Top = 128
    Width = 75
    Height = 25
    Action = Ok_act
    TabOrder = 1
  end
  object Cancel_Button: TcxButton
    Left = 152
    Top = 128
    Width = 75
    Height = 25
    Action = cancel_act
    TabOrder = 2
  end
  object Nac_Text: TcxButtonEdit
    Left = 8
    Top = 96
    Width = 233
    Height = 24
    Enabled = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = NacTextPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 3
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 8
    Width = 154
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 4
    Caption = #1050#1086#1077#1092#1110#1094#1110#1108#1085#1090' '#1079#1084#1110#1085#1080' '#1089#1091#1084#1080
  end
  object nac_Check: TcxCheckBox
    Left = 8
    Top = 72
    Width = 225
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1079#1084#1110#1085#1080#1090#1080' '#1075#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086' '#1085#1072
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 5
    OnClick = nac_CheckClick
  end
  object round_ComboBox: TcxComboBox
    Left = 144
    Top = 40
    Width = 97
    Height = 24
    ParentFont = False
    Properties.Items.Strings = (
      '-'
      '1 '#1075#1088#1085
      '10 '#1075#1088#1085)
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 6
    Text = 'round_ComboBox'
  end
  object round_summa: TcxLabel
    Left = 8
    Top = 40
    Width = 96
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 7
    Caption = #1054#1082#1088#1091#1075#1083#1103#1090#1080' '#1076#1086
  end
  object ActionList1: TActionList
    Left = 112
    Top = 128
    object cancel_act: TAction
      Caption = 'cancel_act'
      OnExecute = cancel_actExecute
    end
    object Ok_act: TAction
      Caption = 'Ok_act'
      OnExecute = Ok_actExecute
    end
  end
end
