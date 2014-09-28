object FEditAvto: TFEditAvto
  Left = 690
  Top = 210
  Width = 270
  Height = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 254
    Height = 35
    Align = alBottom
    TabOrder = 6
    object cxButton1: TcxButton
      Left = 96
      Top = 6
      Width = 75
      Height = 25
      Action = Action1
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 176
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object GroupBoxProp: TcxGroupBox
    Left = 0
    Top = 56
    Width = 250
    Height = 41
    Alignment = alTopLeft
    Caption = #1052#1086#1076#1077#1083#1100
    TabOrder = 1
    TabStop = False
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 5
      Top = 14
      Width = 240
      Height = 21
      Properties.ListColumns = <
        item
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 0
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 8
    Width = 250
    Height = 46
    Alignment = alTopLeft
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 0
    TabStop = False
    object cxTextEdit1: TcxTextEdit
      Left = 5
      Top = 18
      Width = 241
      Height = 21
      TabOrder = 1
    end
    object cxCheckBox1: TcxCheckBox
      Left = 146
      Top = -4
      Width = 96
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 229
    Width = 250
    Height = 41
    Alignment = alTopLeft
    Caption = #1052#1072#1088#1082#1072' '#1090#1086#1087#1083#1080#1074#1072
    TabOrder = 5
    TabStop = False
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 5
      Top = 14
      Width = 240
      Height = 21
      Properties.ListColumns = <
        item
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 1
    end
    object cxCheckBox2: TcxCheckBox
      Left = 99
      Top = -4
      Width = 142
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1057#1095#1080#1090#1072#1090#1100' '#1088#1072#1089#1093'. '#1087#1086' '#1095#1072#1089#1072#1084
      TabOrder = 0
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 102
    Width = 250
    Height = 41
    Alignment = alTopLeft
    Caption = #1043#1086#1089' '#1085#1086#1084#1077#1088
    TabOrder = 2
    TabStop = False
    object cxTextEdit2: TcxTextEdit
      Left = 5
      Top = 15
      Width = 241
      Height = 21
      TabOrder = 0
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 144
    Width = 250
    Height = 41
    Alignment = alTopLeft
    Caption = #1053#1086#1084#1077#1088' '#1084#1086#1090#1086#1088#1072
    TabOrder = 3
    TabStop = False
    object cxTextEdit3: TcxTextEdit
      Left = 5
      Top = 15
      Width = 241
      Height = 21
      TabOrder = 0
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 0
    Top = 189
    Width = 250
    Height = 41
    Alignment = alTopLeft
    Caption = #1053#1086#1084#1077#1088' '#1082#1091#1079#1086#1074#1072
    TabOrder = 4
    TabStop = False
    object cxTextEdit4: TcxTextEdit
      Left = 5
      Top = 15
      Width = 241
      Height = 21
      TabOrder = 0
    end
  end
  object Actions: TActionList
    Left = 264
    Top = 373
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
    end
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 45
    end
    object ActionDel: TAction
      Caption = 'ActionDel'
      ShortCut = 46
    end
    object ActionClean: TAction
      Caption = 'ActionClean'
      ShortCut = 117
    end
  end
  object ActionList1: TActionList
    Left = 9
    Top = 272
    object Action1: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 13
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DM.DB
    SelectSQL.Strings = (
      'SELECT * FROM ADR_COUNTRY_SELECT')
    AutoCalcFields = False
    Left = 56
    Top = 70
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    Left = 88
    Top = 70
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = DM.DB
    SelectSQL.Strings = (
      'SELECT * FROM ADR_COUNTRY_SELECT')
    AutoCalcFields = False
    Left = 8
    Top = 245
    poSQLINT64ToBCD = True
  end
  object DataSource2: TDataSource
    Left = 40
    Top = 245
  end
end
