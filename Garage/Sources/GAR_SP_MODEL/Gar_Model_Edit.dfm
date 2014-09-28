object FEditModel: TFEditModel
  Left = 510
  Top = 380
  Width = 271
  Height = 238
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
    Top = 164
    Width = 255
    Height = 36
    Align = alBottom
    TabOrder = 4
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
    Left = -1
    Top = 1
    Width = 252
    Height = 41
    Alignment = alTopLeft
    Caption = #1052#1072#1088#1082#1072
    TabOrder = 0
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
    Left = -1
    Top = 41
    Width = 252
    Height = 41
    Alignment = alTopLeft
    Caption = #1052#1086#1076#1077#1083#1100
    TabOrder = 1
    TabStop = False
    object cxMaskEdit1: TcxMaskEdit
      Left = 5
      Top = 15
      Width = 240
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = -1
    Top = 81
    Width = 252
    Height = 40
    Alignment = alTopLeft
    Caption = #1056#1072#1089#1093#1086#1076' '#1085#1072' 100 '#1082#1084
    TabOrder = 2
    TabStop = False
    object cxMaskEdit2: TcxMaskEdit
      Left = 5
      Top = 15
      Width = 240
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 121
    Width = 252
    Height = 40
    Alignment = alTopLeft
    Caption = #1056#1072#1089#1093#1086#1076' '#1074' 1 '#1095#1072#1089
    TabOrder = 3
    TabStop = False
    object cxMaskEdit3: TcxMaskEdit
      Left = 5
      Top = 15
      Width = 240
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DM.DB
    Transaction = DM.RTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ADR_COUNTRY_SELECT')
    AutoCalcFields = False
    Top = 121
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    Left = 16
    Top = 121
  end
  object ActionList1: TActionList
    Left = 33
    Top = 123
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
end
