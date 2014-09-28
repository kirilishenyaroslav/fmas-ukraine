object St_InsOst_Form: TSt_InsOst_Form
  Left = 634
  Top = 348
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1080#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 301
  ClientWidth = 333
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
  object cxGroupBox1: TcxGroupBox
    Left = 2
    Top = 0
    Width = 323
    Height = 259
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object SummaLabel: TcxLabel
      Left = 8
      Top = 8
      Width = 103
      Height = 17
      TabOrder = 5
      Caption = #1057#1091#1084#1084#1072
    end
    object SummaEdit: TcxCurrencyEdit
      Left = 8
      Top = 24
      Width = 113
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = SummaEditKeyPress
    end
    object Smeta_Edit: TcxButtonEdit
      Left = 8
      Top = 68
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
      Top = 114
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
      Top = 160
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
    object cxLabel3: TcxLabel
      Left = 8
      Top = 52
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
      Caption = #1057#1084#1077#1090#1072
    end
    object cxLabel4: TcxLabel
      Left = 8
      Top = 98
      Width = 45
      Height = 17
      TabStop = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
      Caption = #1056#1072#1079#1076#1077#1083
    end
    object cxLabel5: TcxLabel
      Left = 8
      Top = 144
      Width = 43
      Height = 17
      TabStop = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 8
      Caption = #1057#1090#1072#1090#1100#1103
    end
    object Smeta_Label: TcxLabel
      Left = 104
      Top = 68
      Width = 209
      Height = 41
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Razdel_Label: TcxLabel
      Left = 104
      Top = 114
      Width = 209
      Height = 41
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 10
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Stat_Label: TcxLabel
      Left = 104
      Top = 160
      Width = 209
      Height = 41
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 11
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Kekv_Edit: TcxButtonEdit
      Left = 8
      Top = 206
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
    object Kekv_Label: TcxLabel
      Left = 104
      Top = 208
      Width = 209
      Height = 41
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 12
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object cxLabel6: TcxLabel
      Left = 8
      Top = 190
      Width = 36
      Height = 17
      TabStop = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 13
      Caption = #1050#1045#1050#1042
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 44
      Width = 313
      Height = 7
      TabOrder = 14
    end
  end
  object OKButton: TcxButton
    Left = 154
    Top = 268
    Width = 83
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 242
    Top = 268
    Width = 83
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object ReadDataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    Left = 266
    Top = 12
    poSQLINT64ToBCD = True
  end
end
