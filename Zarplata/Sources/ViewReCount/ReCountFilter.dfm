object FRecountFilter: TFRecountFilter
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'FRecountFilter'
  ClientHeight = 148
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ItemsFilter: TcxRadioGroup
    Left = 0
    Top = 0
    Width = 326
    Height = 121
    Align = alTop
    Properties.Items = <
      item
        Caption = 'Not Filter'
      end
      item
        Caption = 'Summa > 0'
      end
      item
        Caption = 'Summa < 0'
      end
      item
        Caption = 'Summa = 0'
      end
      item
        Caption = 'Summa is NULL'
      end>
    TabOrder = 0
    Caption = ''
  end
  object CancelBtn: TcxButton
    Left = 248
    Top = 126
    Width = 75
    Height = 21
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object YesBtn: TcxButton
    Left = 160
    Top = 126
    Width = 75
    Height = 21
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object ActionList: TActionList
    Left = 48
    Top = 112
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
