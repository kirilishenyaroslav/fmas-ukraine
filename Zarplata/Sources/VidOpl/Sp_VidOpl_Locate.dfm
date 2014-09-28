object FVOLocate: TFVOLocate
  Left = 586
  Top = 269
  BorderStyle = bsDialog
  Caption = 'FVOLocate'
  ClientHeight = 99
  ClientWidth = 257
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
  object RadioGroupTypeLocate: TcxRadioGroup
    Left = 0
    Top = 0
    Width = 257
    Height = 33
    Properties.Items = <>
    TabOrder = 0
  end
  object GroupBoxLocate: TcxGroupBox
    Left = 0
    Top = 32
    Width = 257
    Height = 41
    Alignment = alTopLeft
    Caption = 'GroupBoxLocate'
    TabOrder = 1
    TabStop = False
    object TextEditLocate: TcxTextEdit
      Left = 8
      Top = 16
      Width = 241
      Height = 21
      TabOrder = 0
    end
  end
  object LocateBtn: TcxButton
    Left = 96
    Top = 77
    Width = 75
    Height = 21
    Action = ActionLocateBtnClick
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 176
    Top = 77
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'CancelBtn'
    ModalResult = 2
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object ActionList1: TActionList
    Left = 8
    Top = 72
    object ActionLocateBtnClick: TAction
      Caption = 'ActionLocateBtnClick'
      ShortCut = 121
      OnExecute = ActionLocateBtnClickExecute
    end
  end
end
