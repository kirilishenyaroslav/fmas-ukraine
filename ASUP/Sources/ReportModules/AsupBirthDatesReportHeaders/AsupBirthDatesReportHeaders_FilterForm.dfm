object FormOptions: TFormOptions
  Left = 356
  Top = 257
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 142
  ClientWidth = 389
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
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 389
    Height = 105
    Align = alTop
    Shape = bsFrame
  end
  object YesBtn: TcxButton
    Left = 192
    Top = 112
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 288
    Top = 112
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object LabelDateForm: TcxLabel
    Left = 136
    Top = 74
    Width = 121
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103':'
  end
  object DateEdit: TcxDateEdit
    Left = 264
    Top = 72
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object LabelMonth: TcxLabel
    Left = 8
    Top = 10
    Width = 113
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Caption = #1052#1110#1089#1103#1094#1100':'
  end
  object MonthComboBox: TcxComboBox
    Left = 128
    Top = 8
    Width = 257
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1089#1110#1095#1077#1085#1100
      #1083#1102#1090#1080#1081
      #1073#1077#1088#1077#1079#1077#1085#1100
      #1082#1074#1110#1090#1077#1085#1100
      #1090#1088#1072#1074#1077#1085#1100
      #1095#1077#1088#1074#1077#1085#1100
      #1083#1080#1087#1077#1085#1100
      #1089#1077#1088#1087#1077#1085#1100
      #1074#1077#1088#1077#1089#1077#1085#1100
      #1078#1086#1074#1090#1077#1085#1100
      #1083#1080#1089#1090#1086#1087#1072#1076
      #1075#1088#1091#1076#1077#1085#1100)
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 44
    Width = 137
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1083#1103' '#1088#1086#1073#1086#1090#1080':'
  end
  object WorkComboBox: TcxComboBox
    Left = 152
    Top = 40
    Width = 233
    Height = 21
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Text = #1059#1089#1110
  end
  object ActionList: TActionList
    Left = 152
    Top = 104
    object YesAction: TAction
      Caption = 'YesAction'
      ShortCut = 16464
      OnExecute = YesActionExecute
    end
    object CancelAction: TAction
      Caption = 'CancelAction'
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
    object DesRep: TAction
      Caption = 'DesRep'
      OnExecute = DesRepExecute
    end
  end
end
