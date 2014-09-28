object FEdit: TFEdit
  Left = 597
  Top = 317
  Width = 326
  Height = 151
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TextEditValue: TcxMaskEdit
    Left = 8
    Top = 8
    Width = 297
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 99
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 72
    Width = 310
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOk: TcxButton
      Left = 146
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TcxButton
      Left = 226
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object MENameDolgnost: TcxMaskEdit
    Left = 8
    Top = 35
    Width = 297
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 99
    TabOrder = 1
  end
  object ActionList: TActionList
    Left = 61
    Top = 24
    object ActionEnter: TAction
      Caption = 'ActionEnter'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object ActionEsc: TAction
      Caption = 'ActionEsc'
      ShortCut = 27
      OnExecute = ActionEscExecute
    end
  end
end
