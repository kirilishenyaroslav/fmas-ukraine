object fEditCard: TfEditCard
  Left = 285
  Top = 177
  BorderStyle = bsDialog
  Caption = 'fEditCard'
  ClientHeight = 198
  ClientWidth = 392
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
  object TypeBankCardBE: TcxButtonEdit
    Left = 8
    Top = 16
    Width = 377
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BankBEPropertiesButtonClick
    TabOrder = 0
  end
  object NumCardME: TcxMaskEdit
    Left = 8
    Top = 56
    Width = 377
    Height = 21
    Properties.MaxLength = 25
    TabOrder = 1
  end
  object BegDE: TcxDateEdit
    Left = 24
    Top = 96
    Width = 81
    Height = 21
    TabOrder = 2
  end
  object EndDE: TcxDateEdit
    Left = 24
    Top = 136
    Width = 81
    Height = 21
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 160
    Top = 80
    Width = 58
    Height = 17
    TabOrder = 6
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 80
    Width = 128
    Height = 17
    TabOrder = 7
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1076#1111#1110' '#1082#1072#1088#1090#1082#1080
  end
  object LabelBank: TcxLabel
    Left = 8
    Top = 0
    Width = 65
    Height = 17
    TabOrder = 8
    Caption = #1058#1080#1087' '#1082#1072#1088#1090#1082#1080
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 40
    Width = 80
    Height = 17
    TabOrder = 9
    Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1082#1080
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 120
    Width = 144
    Height = 17
    TabOrder = 10
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1076#1111#1110' '#1082#1072#1088#1090#1082#1080
  end
  object OkButton: TcxButton
    Left = 184
    Top = 167
    Width = 97
    Height = 25
    Action = OkAction
    TabOrder = 4
  end
  object CancelButton: TcxButton
    Left = 289
    Top = 167
    Width = 97
    Height = 25
    Action = CancelAction
    TabOrder = 5
  end
  object ComentM: TcxMemo
    Left = 160
    Top = 96
    Width = 225
    Height = 65
    Properties.MaxLength = 255
    Properties.ScrollBars = ssVertical
    TabOrder = 11
  end
  object CardCloseCB: TcxCheckBox
    Left = 8
    Top = 160
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1082#1088#1080#1090#1072' '#1082#1072#1088#1090#1082#1072
    TabOrder = 12
  end
  object ActionList1: TActionList
    Left = 120
    Top = 160
    object OkAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
