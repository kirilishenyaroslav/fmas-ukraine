object FormOptions: TFormOptions
  Left = 186
  Top = 314
  BorderStyle = bsDialog
  Caption = 'FormOptions'
  ClientHeight = 147
  ClientWidth = 478
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
    Top = -8
    Width = 477
    Height = 121
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 8
    Top = 71
    Width = 465
    Height = 2
    Shape = bsTopLine
    Style = bsRaised
  end
  object YesBtn: TcxButton
    Left = 288
    Top = 120
    Width = 91
    Height = 22
    Action = YesAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 384
    Top = 120
    Width = 89
    Height = 22
    Action = CancelAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    LookAndFeel.Kind = lfFlat
  end
  object EditDepartment: TcxButtonEdit
    Left = 8
    Top = 27
    Width = 465
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
    TabOrder = 1
  end
  object LabelDepartment: TcxLabel
    Left = 8
    Top = 7
    Width = 465
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
  object CheckBoxWithChild: TcxCheckBox
    Left = 6
    Top = 48
    Width = 467
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object ActBtn: TcxButton
    Left = 192
    Top = 120
    Width = 91
    Height = 22
    Action = ActAction
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
  end
  object LabelDateForm: TcxLabel
    Left = 8
    Top = 82
    Width = 401
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
    Caption = #1056#1110#1082' '#1084#1077#1076#1080#1095#1085#1086#1075#1086' '#1086#1075#1083#1103#1076#1091':'
  end
  object cxSpinYear: TcxSpinEdit
    Left = 413
    Top = 80
    Width = 57
    Height = 21
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
    Value = 2006
    OnKeyDown = cxSpinYearKeyDown
    OnKeyUp = cxSpinYearKeyUp
  end
  object ActionList: TActionList
    Left = 8
    Top = 112
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
    object ActAction: TAction
      Caption = 'ActAction'
      OnExecute = ActActionExecute
    end
  end
end
