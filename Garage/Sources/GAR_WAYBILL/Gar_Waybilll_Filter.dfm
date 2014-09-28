object FWaybilll_Filter: TFWaybilll_Filter
  Left = 598
  Top = 287
  Width = 384
  Height = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 256
    Width = 368
    Height = 35
    Align = alBottom
    TabOrder = 7
    object cxButton1: TcxButton
      Left = 202
      Top = 6
      Width = 75
      Height = 25
      Action = Action1
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 282
      Top = 6
      Width = 75
      Height = 25
      Action = Action2
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
    end
  end
  object GroupBoxProp: TcxGroupBox
    Left = 0
    Top = 80
    Width = 361
    Height = 41
    Alignment = alTopLeft
    Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    TabOrder = 3
    TabStop = False
    object EditMan: TcxButtonEdit
      Left = 6
      Top = 14
      Width = 99
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = EditManPropertiesButtonClick
      Properties.OnEditValueChanged = EditManPropertiesEditValueChanged
      TabOrder = 1
    end
    object EditManFio: TcxLabel
      Left = 106
      Top = 14
      Width = 251
      Height = 21
      TabStop = False
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 2
      Caption = ''
    end
    object cxCheckBox6: TcxCheckBox
      Left = 258
      Top = -4
      Width = 96
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox6PropertiesChange
      Properties.Caption = #1074#1086#1076#1080#1090#1077#1083#1100
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 122
    Width = 361
    Height = 41
    Alignment = alTopLeft
    Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
    TabOrder = 4
    TabStop = False
    object cxButtonEdit1: TcxButtonEdit
      Left = 6
      Top = 14
      Width = 99
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Properties.OnEditValueChanged = cxButtonEdit1PropertiesEditValueChanged
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 106
      Top = 14
      Width = 251
      Height = 21
      TabStop = False
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 2
      Caption = ''
    end
    object cxCheckBox3: TcxCheckBox
      Left = 258
      Top = -4
      Width = 96
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox3PropertiesChange
      Properties.Caption = #1072#1074#1090#1086#1084#1086#1073#1080#1083#1100
      TabOrder = 0
    end
  end
  object cxGroupBox12: TcxGroupBox
    Left = 0
    Top = 166
    Width = 361
    Height = 41
    Alignment = alTopLeft
    Caption = #1057#1077#1088#1080#1103
    TabOrder = 5
    TabStop = False
    object cxTextEdit11: TcxTextEdit
      Left = 5
      Top = 15
      Width = 352
      Height = 21
      TabOrder = 1
    end
    object cxCheckBox2: TcxCheckBox
      Left = 258
      Top = -4
      Width = 96
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox2PropertiesChange
      Properties.Caption = #1089#1077#1088#1080#1103
      TabOrder = 0
    end
  end
  object cxGroupBox13: TcxGroupBox
    Left = 0
    Top = 208
    Width = 361
    Height = 41
    Alignment = alTopLeft
    Caption = #1053#1086#1084#1077#1088
    TabOrder = 6
    TabStop = False
    object cxCheckBox1: TcxCheckBox
      Left = 258
      Top = -4
      Width = 96
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1085#1086#1084#1077#1088
      TabOrder = 0
    end
    object cxTextEdit12: TcxMaskEdit
      Left = 5
      Top = 14
      Width = 352
      Height = 21
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      TabOrder = 1
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 40
    Width = 361
    Height = 40
    Alignment = alTopLeft
    Caption = #1055#1077#1088#1080#1086#1076
    TabOrder = 2
    TabStop = False
    object cxCheckBox4: TcxCheckBox
      Left = 258
      Top = -4
      Width = 96
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox4PropertiesChange
      Properties.Caption = #1087#1077#1088#1080#1086#1076
      TabOrder = 0
    end
    object LabelVidopl: TcxLabel
      Left = 136
      Top = 14
      Width = 49
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1053#1072#1095#1072#1083#1086
    end
    object cxLabel2: TcxLabel
      Left = 183
      Top = 14
      Width = 51
      Height = 20
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = #1050#1086#1085#1077#1094
    end
    object cxDateEdit1: TcxDateEdit
      Left = 7
      Top = 14
      Width = 129
      Height = 21
      TabOrder = 1
    end
    object cxDateEdit2: TcxDateEdit
      Left = 232
      Top = 14
      Width = 125
      Height = 21
      TabOrder = 4
    end
  end
  object CheckBoxF2: TcxCheckBox
    Left = 8
    Top = 7
    Width = 121
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckBoxF2PropertiesChange
    Properties.Caption = #1060#1086#1088#1084#1072' 2'
    TabOrder = 0
  end
  object CheckBoxF3: TcxCheckBox
    Left = 232
    Top = 7
    Width = 129
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckBoxF3PropertiesChange
    Properties.Caption = #1060#1086#1088#1084#1072' 3'
    TabOrder = 1
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DM.DB
    Transaction = DM.Transaction
    SelectSQL.Strings = (
      'SELECT * FROM ADR_COUNTRY_SELECT')
    AutoCalcFields = False
    Left = 27
    Top = 225
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    Left = 27
    Top = 209
  end
  object ActionList1: TActionList
    Left = 156
    Top = 227
    object Action1: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 13
      OnExecute = Action3Execute
    end
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = DM.DB
    Transaction = DM.Transaction
    Left = 64
    Top = 225
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = DM.DB
    Transaction = DM.Transaction
    SelectSQL.Strings = (
      'SELECT * FROM ADR_COUNTRY_SELECT')
    AutoCalcFields = False
    Left = 96
    Top = 225
    poSQLINT64ToBCD = True
  end
  object DataSource2: TDataSource
    Left = 96
    Top = 209
  end
end
