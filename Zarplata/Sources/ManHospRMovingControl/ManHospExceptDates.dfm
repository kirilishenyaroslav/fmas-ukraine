object fmManHospExceptDates: TfmManHospExceptDates
  Left = 413
  Top = 310
  Width = 525
  Height = 123
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1087#1086#1088#1091#1096#1077#1085#1100
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
  object DateBegLabel: TcxLabel
    Left = 4
    Top = 22
    Width = 93
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -12
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
  end
  object DateBegEdit: TcxDateEdit
    Left = 102
    Top = 18
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object DateendLabel: TcxLabel
    Left = 248
    Top = 22
    Width = 113
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -12
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
  end
  object DateEndEdit: TcxDateEdit
    Left = 370
    Top = 18
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object YesBtn: TcxButton
    Left = 312
    Top = 52
    Width = 81
    Height = 25
    Caption = #1044#1086#1076#1072#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 404
    Top = 52
    Width = 81
    Height = 25
    Cancel = True
    Caption = #1042#1080#1081#1090#1080
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
  end
end
