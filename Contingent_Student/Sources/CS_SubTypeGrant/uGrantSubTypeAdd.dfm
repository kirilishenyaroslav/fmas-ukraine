object fmGrantSubAdd: TfmGrantSubAdd
  Left = 441
  Top = 328
  Width = 547
  Height = 264
  Caption = #1042#1080#1076#1080' '#1089#1090#1080#1087#1077#1085#1076#1110#1081
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
  object cxLabel4: TcxLabel
    Left = 8
    Top = 12
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1053#1072#1079#1074#1072' '#1087#1086#1076#1090#1080#1087#1091' '#1089#1090#1080#1087#1077#1085#1076#1110#1111
  end
  object MemoName: TcxMemo
    Left = 8
    Top = 35
    Width = 513
    Height = 89
    Lines.Strings = (
      '')
    Style.Color = clWindow
    TabOrder = 1
  end
  object OkButton: TcxButton
    Left = 346
    Top = 189
    Width = 75
    Height = 25
    Caption = 'OkButton'
    TabOrder = 3
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 438
    Top = 189
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 133
    Width = 185
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
    Caption = #1058#1080#1087' '#1089#1090#1080#1087#1077#1085#1076#1110#1111
  end
  object ButtonEditType: TcxButtonEdit
    Left = 8
    Top = 156
    Width = 513
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEditTypePropertiesButtonClick
    Style.Color = clWindow
    TabOrder = 2
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
