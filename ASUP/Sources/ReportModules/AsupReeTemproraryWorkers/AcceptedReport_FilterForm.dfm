object FormOptions: TFormOptions
  Left = 174
  Top = 119
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 179
  ClientWidth = 435
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
    Width = 435
    Height = 145
    Align = alTop
    Shape = bsFrame
  end
  object LabelDateEnd: TcxLabel
    Left = 248
    Top = 116
    Width = 48
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object DateEditEnd: TcxDateEdit
    Left = 304
    Top = 116
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    EditValue = 2d
  end
  object DateEditBeg: TcxDateEdit
    Left = 115
    Top = 116
    Width = 122
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DateButtons = [btnToday]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    EditValue = 2d
  end
  object LabelDateBeg: TcxLabel
    Left = 0
    Top = 116
    Width = 105
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object YesBtn: TcxButton
    Left = 240
    Top = 152
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 336
    Top = 152
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
  end
  object CatComboBox: TcxComboBox
    Left = 128
    Top = 8
    Width = 297
    Height = 21
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    Text = #1059#1089#1110
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 12
    Width = 105
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
    Caption = #1042#1080#1076' '#1087#1077#1088#1089#1086#1085#1072#1083#1091':'
  end
  object LabelDepartment: TcxLabel
    Left = 8
    Top = 39
    Width = 417
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object EditDepartment: TcxButtonEdit
    Left = 6
    Top = 59
    Width = 419
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditDepartmentPropertiesButtonClick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 9
    Text = #1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1053#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1059#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090
  end
  object CheckBoxWithChild: TcxCheckBox
    Left = 6
    Top = 80
    Width = 375
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 10
  end
  object ActionList: TActionList
    Left = 112
    Top = 152
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
  end
end
