object FEditPeople: TFEditPeople
  Left = 618
  Top = 336
  Width = 380
  Height = 160
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
    Top = 87
    Width = 364
    Height = 35
    Align = alBottom
    TabOrder = 2
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
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object GroupBoxProp: TcxGroupBox
    Left = 0
    Top = 1
    Width = 361
    Height = 41
    Alignment = alTopLeft
    Caption = #1063#1077#1083#1086#1074#1077#1082
    TabOrder = 0
    TabStop = False
    object EditMan: TcxButtonEdit
      Left = 6
      Top = 14
      Width = 86
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
      TabOrder = 0
    end
    object EditManFio: TcxLabel
      Left = 93
      Top = 14
      Width = 263
      Height = 21
      TabStop = False
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 41
    Width = 361
    Height = 41
    Alignment = alTopLeft
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    TabOrder = 1
    TabStop = False
    object cxTextEdit1: TcxTextEdit
      Left = 5
      Top = 15
      Width = 352
      Height = 21
      TabOrder = 0
    end
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DM.DB
    Transaction = DM.RTransaction
    SelectSQL.Strings = (
      'SELECT * FROM ADR_COUNTRY_SELECT')
    AutoCalcFields = False
    Top = 73
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    Left = 32
    Top = 73
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
    Left = 65
    Top = 75
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
