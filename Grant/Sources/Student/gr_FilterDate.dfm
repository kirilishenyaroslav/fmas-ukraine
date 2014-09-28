object FFilterDate: TFFilterDate
  Left = 746
  Top = 682
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 76
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object EditDateBeg: TcxDateEdit
    Left = 24
    Top = 7
    Width = 116
    Height = 21
    ImeMode = imHanguel
    Properties.DateButtons = [btnToday]
    Properties.InputKind = ikMask
    Properties.MaxDate = 55153.000000000000000000
    Properties.MinDate = 36526.000000000000000000
    TabOrder = 0
    EditValue = 38353d
  end
  object EditDateEnd: TcxDateEdit
    Left = 168
    Top = 7
    Width = 113
    Height = 21
    Properties.DateButtons = [btnToday]
    Properties.InputKind = ikMask
    Properties.MaxDate = 55153.000000000000000000
    Properties.MinDate = 36526.000000000000000000
    TabOrder = 1
    EditValue = 38353d
  end
  object Panel1: TPanel
    Left = 0
    Top = 35
    Width = 289
    Height = 41
    Align = alBottom
    TabOrder = 2
    object ButtonYes: TcxButton
      Left = 112
      Top = 8
      Width = 81
      Height = 25
      Action = ActionYes
      Caption = #1055#1080#1088#1081#1085#1103#1090#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
    end
    object ButtonCancel: TcxButton
      Left = 200
      Top = 8
      Width = 81
      Height = 25
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ActionCancelExecute
      LookAndFeel.Kind = lfFlat
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 9
    Width = 15
    Height = 17
    TabOrder = 3
    Caption = #1047
  end
  object cxLabel2: TcxLabel
    Left = 144
    Top = 9
    Width = 20
    Height = 17
    TabOrder = 4
    Caption = #1087#1086
  end
  object Actions: TActionList
    Left = 50
    Top = 30
    object ActionYes: TAction
      Caption = 'ActionYes'
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object ActionEnter: TAction
      Caption = 'ActionEnter'
      ShortCut = 13
      OnExecute = ActionEnterExecute
    end
  end
end
