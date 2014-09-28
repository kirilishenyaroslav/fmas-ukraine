object fmPrepareDocAdd: TfmPrepareDocAdd
  Left = 401
  Top = 225
  Width = 563
  Height = 305
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
  object OkButton: TcxButton
    Left = 346
    Top = 220
    Width = 75
    Height = 25
    Caption = 'OkButton'
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 442
    Top = 220
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object LabelDate: TcxLabel
    Left = 8
    Top = 67
    Width = 121
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 94
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1055#1110#1076#1089#1090#1072#1074#1072
  end
  object DateEdit: TcxDateEdit
    Left = 136
    Top = 65
    Width = 125
    Height = 21
    TabOrder = 4
  end
  object MemoNote: TcxMemo
    Left = 8
    Top = 117
    Width = 513
    Height = 89
    Lines.Strings = (
      '')
    TabOrder = 5
  end
  object LabelNum: TcxLabel
    Left = 8
    Top = 39
    Width = 129
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object LabelTypeDoc: TcxLabel
    Left = 8
    Top = 11
    Width = 121
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object ButtonEditTypeDoc: TcxButtonEdit
    Left = 136
    Top = 10
    Width = 385
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditTypeDocPropertiesButtonClick
    Style.Color = clWindow
    TabOrder = 8
    OnKeyPress = ButtonEditTypeDocKeyPress
  end
  object TextEditNum: TcxTextEdit
    Left = 136
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 9
    OnKeyPress = TextEditNumKeyPress
  end
  object ActionList1: TActionList
    Left = 408
    Top = 88
    object ActionSave: TAction
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      ShortCut = 121
      OnExecute = OkButtonClick
    end
    object ActionExit: TAction
      Caption = #1042#1080#1081#1090#1080
      ShortCut = 27
      OnExecute = CancelButtonClick
    end
  end
end
