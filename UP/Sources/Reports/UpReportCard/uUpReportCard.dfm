object fmMain: TfmMain
  Left = 188
  Top = 271
  Width = 485
  Height = 134
  BorderIcons = [biSystemMenu]
  Caption = 'fmMain'
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 81
    Width = 477
    Height = 19
    Panels = <>
  end
  object cxButtonPrint: TcxButton
    Left = 240
    Top = 48
    Width = 110
    Height = 25
    Action = PrintAction
    Caption = #1043#1072#1088#1072#1079#1076
    TabOrder = 2
  end
  object cxButtonClose: TcxButton
    Left = 360
    Top = 48
    Width = 110
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButtonCloseClick
  end
  object LevelEdit: TcxButtonEdit
    Left = 152
    Top = 19
    Width = 320
    Height = 21
    Enabled = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = LevelPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object cxLevel: TcxCheckBox
    Left = 0
    Top = 20
    Width = 147
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1110#1074#1077#1085#1100' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1110':'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    OnClick = cxLevelClick
  end
  object ActionList1: TActionList
    Left = 80
    Top = 48
    object PrintAction: TAction
      Caption = 'PrintAction'
      ShortCut = 121
      OnExecute = PrintActionExecute
    end
    object DesAction: TAction
      Caption = 'DesRep'
      ShortCut = 8315
    end
  end
end
