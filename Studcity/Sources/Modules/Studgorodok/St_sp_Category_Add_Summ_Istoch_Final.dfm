object CategoryFormAddFin: TCategoryFormAddFin
  Left = 433
  Top = 191
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1080#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 324
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 2
    Top = 0
    Width = 323
    Height = 283
    Alignment = alTopLeft
    TabOrder = 0
    object SummaLabel: TcxLabel
      Left = 8
      Top = 8
      Width = 121
      Height = 17
      AutoSize = False
      TabOrder = 6
      Caption = #1057#1091#1084#1084#1072' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1081
    end
    object PercentLabel: TcxLabel
      Left = 139
      Top = 8
      Width = 134
      Height = 17
      AutoSize = False
      TabOrder = 8
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1081
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
      Properties.OnEditValueChanged = SummaEditPropertiesEditValueChanged
      Style.Color = clInfoBk
      TabOrder = 0
      OnEnter = SummaEditEnter
      OnExit = SummaEditExit
      OnKeyPress = SummaEditKeyPress
    end
    object PercentEdit: TcxCurrencyEdit
      Left = 140
      Top = 24
      Width = 105
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.0000;'
      Properties.OnEditValueChanged = PercentEditPropertiesEditValueChanged
      Style.Color = clInfoBk
      TabOrder = 1
      OnEnter = PercentEditEnter
      OnExit = PercentEditExit
      OnKeyPress = PercentEditKeyPress
    end
    object S_SummaEdit: TcxCurrencyEdit
      Left = 8
      Top = 64
      Width = 113
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.OnEditValueChanged = S_SummaEditPropertiesEditValueChanged
      Style.Color = clInfoBk
      TabOrder = 2
      OnEnter = S_SummaEditEnter
      OnExit = S_SummaEditExit
      OnKeyPress = S_SummaEditKeyPress
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      AutoSize = False
      TabOrder = 9
      Caption = #1057#1091#1084#1084#1072' '#1089#1091#1073#1089#1080#1076#1080#1080
    end
    object Persent_Subs_Edit: TcxCurrencyEdit
      Left = 140
      Top = 64
      Width = 105
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.0000;'
      Properties.OnEditValueChanged = Persent_Subs_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      TabOrder = 3
      OnEnter = Persent_Subs_EditEnter
      OnExit = Persent_Subs_EditExit
      OnKeyPress = Persent_Subs_EditKeyPress
    end
    object cxLabel2: TcxLabel
      Left = 140
      Top = 48
      Width = 117
      Height = 17
      AutoSize = False
      TabOrder = 10
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1089#1091#1073#1089#1080#1076#1080#1080
    end
    object Smeta_Edit: TcxButtonEdit
      Left = 8
      Top = 104
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
      TabOrder = 4
      OnKeyPress = Smeta_EditKeyPress
    end
    object Razdel_Edit: TcxButtonEdit
      Left = 8
      Top = 144
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
      TabOrder = 5
      OnKeyPress = Razdel_EditKeyPress
    end
    object Stat_Edit: TcxButtonEdit
      Left = 8
      Top = 190
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
      TabOrder = 7
      OnKeyPress = Stat_EditKeyPress
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 88
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 11
      Caption = #1057#1084#1077#1090#1072
    end
    object cxLabel4: TcxLabel
      Left = 8
      Top = 128
      Width = 81
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 12
      Caption = #1056#1072#1079#1076#1077#1083
    end
    object cxLabel5: TcxLabel
      Left = 8
      Top = 174
      Width = 81
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 13
      Caption = #1057#1090#1072#1090#1100#1103
    end
    object Smeta_Label: TcxLabel
      Left = 104
      Top = 104
      Width = 209
      Height = 35
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 14
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Razdel_Label: TcxLabel
      Left = 104
      Top = 144
      Width = 209
      Height = 37
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 15
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Stat_Label: TcxLabel
      Left = 104
      Top = 190
      Width = 209
      Height = 33
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 16
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object cxLabel9: TcxLabel
      Left = 244
      Top = 24
      Width = 18
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 17
      Caption = '%'
    end
    object cxLabel10: TcxLabel
      Left = 244
      Top = 64
      Width = 18
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 18
      Caption = '%'
    end
    object Kekv_Edit: TcxButtonEdit
      Left = 8
      Top = 236
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
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Properties.OnEditValueChanged = Kekv_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 19
      OnKeyPress = Kekv_EditKeyPress
    end
    object Kekv_Label: TcxLabel
      Left = 104
      Top = 238
      Width = 209
      Height = 33
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 20
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object cxLabel6: TcxLabel
      Left = 8
      Top = 220
      Width = 81
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 21
      Caption = #1050#1045#1050#1042
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 84
      Width = 313
      Height = 7
      TabOrder = 22
    end
  end
  object OKButton: TcxButton
    Left = 154
    Top = 292
    Width = 83
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 242
    Top = 292
    Width = 83
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object ReadDataSet: TpFIBDataSet
    Database = DataModule1.pFIBDatabase1
    Transaction = DataModule1.ReadTransaction2
    Left = 266
    Top = 12
    poSQLINT64ToBCD = True
  end
  object Category_ActionList: TActionList
    Left = 264
    Top = 48
    object Add_Action: TAction
      Category = 'Work'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 45
    end
    object Edit_Action: TAction
      Category = 'Work'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 113
    end
    object Delete_Action: TAction
      Category = 'Work'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
    end
    object Ok_Action: TAction
      Category = 'Accept'
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Hint = #1055#1088#1080#1085#1103#1090#1100
      ShortCut = 121
      OnExecute = Ok_ActionExecute
    end
  end
end
