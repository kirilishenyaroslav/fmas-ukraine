object FUV_RefreshSkr_FieldNames: TFUV_RefreshSkr_FieldNames
  Left = 369
  Top = 248
  BorderStyle = bsDialog
  Caption = 'FUV_RefreshSkr_FieldNames'
  ClientHeight = 115
  ClientWidth = 361
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
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 361
    Height = 89
    Shape = bsFrame
  end
  object LabelNameFieldTin: TcxLabel
    Left = 4
    Top = 7
    Width = 352
    Height = 17
    AutoSize = False
    TabOrder = 0
  end
  object LabelNameFieldAcctCard: TcxLabel
    Left = 3
    Top = 48
    Width = 353
    Height = 15
    AutoSize = False
    TabOrder = 1
  end
  object MaskEditNameFieldTin: TcxMaskEdit
    Left = 2
    Top = 24
    Width = 356
    Height = 21
    TabOrder = 2
  end
  object MaskEditNameFieldCard: TcxMaskEdit
    Left = 2
    Top = 64
    Width = 356
    Height = 21
    TabOrder = 3
  end
  object YesBtn: TcxButton
    Left = 184
    Top = 92
    Width = 75
    Height = 21
    Action = ActionYes
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 264
    Top = 92
    Width = 75
    Height = 21
    Action = ActionCancel
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
  end
  object ActionList: TActionList
    Left = 40
    Top = 88
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
