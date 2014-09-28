object FEditModel: TFEditModel
  Left = 244
  Top = 681
  Width = 270
  Height = 160
  Caption = 'FEditModel'
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
    Width = 254
    Height = 35
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 168
      Top = 6
      Width = 75
      Height = 25
      Action = Action1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 88
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
    end
  end
  object GroupBoxProp: TcxGroupBox
    Left = 1
    Top = 1
    Width = 250
    Height = 41
    Alignment = alTopLeft
    Caption = #1052#1072#1088#1082#1072
    TabOrder = 1
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
    Top = 41
    Width = 250
    Height = 41
    Alignment = alTopLeft
    Caption = #1052#1086#1076#1077#1083#1100
    TabOrder = 2
    object cxTextEdit1: TcxTextEdit
      Left = 5
      Top = 15
      Width = 241
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
  end
end
