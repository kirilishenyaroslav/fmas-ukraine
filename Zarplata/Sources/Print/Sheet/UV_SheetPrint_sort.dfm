object FSort: TFSort
  Left = 443
  Top = 242
  BorderStyle = bsDialog
  Caption = 'FSort'
  ClientHeight = 88
  ClientWidth = 193
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
  object YesBtn: TcxButton
    Left = 72
    Top = 66
    Width = 49
    Height = 21
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 128
    Top = 66
    Width = 49
    Height = 21
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object CheckBoxPrintDate: TcxCheckBox
    Left = 0
    Top = 45
    Width = 193
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 2
  end
  object RadioGroupOrder: TcxRadioGroup
    Left = 0
    Top = 0
    Width = 193
    Height = 41
    ItemIndex = 1
    Properties.Columns = 2
    Properties.Items = <
      item
      end
      item
      end>
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 32
    Top = 56
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
