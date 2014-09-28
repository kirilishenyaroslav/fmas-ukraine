object frm_EntryRestIstochniki_AE: Tfrm_EntryRestIstochniki_AE
  Left = 812
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frm_EntryRestIstochniki_AE'
  ClientHeight = 286
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox: TcxGroupBox
    Left = 1
    Top = 0
    Width = 323
    Height = 249
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Persent_Edit: TcxCurrencyEdit
      Left = 9
      Top = 26
      Width = 69
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Persent_EditKeyPress
    end
    object Persent_Label: TcxLabel
      Left = 10
      Top = 8
      Width = 42
      Height = 17
      TabStop = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
      Caption = #1057#1091#1084#1084#1072
    end
    object Smeta_Edit: TcxButtonEdit
      Left = 8
      Top = 72
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = Smeta_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Smeta_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 1
      OnKeyPress = Smeta_EditKeyPress
    end
    object Razdel_Edit: TcxButtonEdit
      Left = 8
      Top = 112
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = Razdel_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Razdel_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 2
      OnKeyPress = Razdel_EditKeyPress
    end
    object Stat_Edit: TcxButtonEdit
      Left = 8
      Top = 158
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = Stat_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Stat_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 3
      OnKeyPress = Stat_EditKeyPress
    end
    object Smeta_Label: TcxLabel
      Left = 8
      Top = 56
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
      Caption = #1057#1084#1077#1090#1072
    end
    object Razdel_Label: TcxLabel
      Left = 8
      Top = 96
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
      Caption = #1056#1072#1079#1076#1077#1083
    end
    object Stat_Label: TcxLabel
      Left = 8
      Top = 142
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 8
      Caption = #1057#1090#1072#1090#1100#1103
    end
    object Smeta_description_Label: TcxLabel
      Left = 104
      Top = 72
      Width = 209
      Height = 35
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Razdel_description_Label: TcxLabel
      Left = 104
      Top = 112
      Width = 209
      Height = 37
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 10
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Stat_description_Label: TcxLabel
      Left = 104
      Top = 158
      Width = 209
      Height = 33
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 11
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object P_Label: TcxLabel
      Left = 84
      Top = 27
      Width = 33
      Height = 17
      TabStop = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 12
      Caption = #1075#1088#1085'.'
    end
    object Kekv_Edit: TcxButtonEdit
      Left = 8
      Top = 204
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = Kekv_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Kekv_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 4
      OnKeyPress = Kekv_EditKeyPress
    end
    object Kekv_description_Label: TcxLabel
      Left = 104
      Top = 206
      Width = 209
      Height = 33
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Kekv_Label: TcxLabel
      Left = 8
      Top = 188
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 14
      Caption = #1050#1045#1050#1042
    end
  end
  object OKButton: TcxButton
    Left = 154
    Top = 255
    Width = 83
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 241
    Top = 255
    Width = 83
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
