object FormDayEdit: TFormDayEdit
  Left = 525
  Top = 399
  BorderStyle = bsSingle
  Caption = 'FormDayEdit'
  ClientHeight = 209
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 168
    Align = alClient
    TabOrder = 0
    object Label5: TcxLabel
      Left = 8
      Top = 104
      Width = 105
      Height = 17
      AutoSize = False
      TabOrder = 0
      Caption = #1050#1110#1085#1077#1094#1100' '#1075#1086#1076#1080#1085':'
    end
    object Label4: TcxLabel
      Left = 8
      Top = 80
      Width = 137
      Height = 17
      AutoSize = False
      TabOrder = 1
      Caption = #1055#1086#1095#1072#1090#1086#1082'  '#1075#1086#1076#1080#1085':'
    end
    object Label1: TcxLabel
      Left = 8
      Top = 8
      Width = 121
      Height = 17
      AutoSize = False
      TabOrder = 2
      Caption = 'den:'
    end
    object Label3: TcxLabel
      Left = 8
      Top = 56
      Width = 129
      Height = 17
      AutoSize = False
      TabOrder = 3
      Caption = #1050#1110#1085#1077#1094#1100' '#1075#1086#1076#1080#1085':'
    end
    object EditNumDay: TcxSpinEdit
      Left = 128
      Top = 8
      Width = 121
      Height = 21
      Properties.MaxValue = 7.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.ReadOnly = True
      TabOrder = 4
      Value = 1
    end
    object EditWorkBeg: TcxTimeEdit
      Left = 128
      Top = 32
      Width = 121
      Height = 21
      EditValue = 0.333333333333333d
      Properties.TimeFormat = tfHourMin
      TabOrder = 5
    end
    object EditWorkEnd: TcxTimeEdit
      Left = 128
      Top = 56
      Width = 121
      Height = 21
      EditValue = 0.708333333333333d
      Properties.TimeFormat = tfHourMin
      TabOrder = 6
    end
    object EditBreakBeg: TcxTimeEdit
      Left = 128
      Top = 80
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      TabOrder = 7
    end
    object EditBreakEnd: TcxTimeEdit
      Left = 128
      Top = 104
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      TabOrder = 8
    end
    object CheckBoxHoliday: TcxCheckBox
      Left = 8
      Top = 136
      Width = 105
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxHolidayPropertiesChange
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 168
    Width = 259
    Height = 41
    Align = alBottom
    TabOrder = 1
    object ButtonOK: TcxButton
      Left = 32
      Top = 8
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
    end
    object ButtonCancel: TcxButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
    end
  end
  object Label2: TcxLabel
    Left = 8
    Top = 32
    Width = 113
    Height = 17
    AutoSize = False
    TabOrder = 2
    Caption = #1055#1086#1095#1072#1090#1086#1082'  '#1075#1086#1076#1080#1085':'
  end
  object ActionList: TActionList
    Left = 256
    Top = 120
    object ActionYes: TAction
      Caption = 'ActionYes'
      Checked = True
      ShortCut = 13
      OnExecute = ButtonOKClick
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      Checked = True
      ShortCut = 27
      OnExecute = ButtonCancelClick
    end
  end
end
