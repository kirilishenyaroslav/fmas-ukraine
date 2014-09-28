object Fini_cat_customer_ADD: TFini_cat_customer_ADD
  Left = 350
  Top = 288
  BorderStyle = bsDialog
  ClientHeight = 104
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 57
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 143
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1089#1087#1086#1078#1080#1074#1072#1095#1110#1074':'
  end
  object NameEdit: TcxTextEdit
    Left = 16
    Top = 32
    Width = 265
    Height = 21
    Style.StyleController = dm.EditStyleController1
    TabOrder = 0
    OnKeyPress = NameEditKeyPress
  end
  object OKButton: TcxButton
    Left = 134
    Top = 72
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 214
    Top = 72
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object ActionList: TActionList
    Left = 96
    Top = 64
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
end
