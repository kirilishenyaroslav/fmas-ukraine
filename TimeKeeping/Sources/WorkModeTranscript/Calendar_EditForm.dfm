object FormEditCalendar: TFormEditCalendar
  Left = 516
  Top = 261
  BorderStyle = bsSingle
  Caption = 'FormEditCalendar'
  ClientHeight = 232
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 191
    Width = 257
    Height = 41
    Align = alBottom
    TabOrder = 0
    object ButtonOK: TcxButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ButtonOK'
      TabOrder = 0
      OnClick = ButtonOKClick
    end
    object ButtonCancel: TcxButton
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ButtonCancel'
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 257
    Height = 191
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 132
      Width = 3
      Height = 13
    end
    object EditWorkBeg: TcxTimeEdit
      Left = 133
      Top = 7
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      TabOrder = 0
    end
    object EditWorkEnd: TcxTimeEdit
      Left = 133
      Top = 32
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      TabOrder = 1
    end
    object EditBreakBeg: TcxTimeEdit
      Left = 133
      Top = 57
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      TabOrder = 2
    end
    object EditBreakEnd: TcxTimeEdit
      Left = 133
      Top = 82
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      Properties.TimeFormat = tfHourMin
      TabOrder = 3
    end
    object CheckBoxHoliday: TcxCheckBox
      Left = 143
      Top = 114
      Width = 105
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxHolidayPropertiesChange
      TabOrder = 4
    end
    object Label5: TcxLabel
      Left = 8
      Top = 80
      Width = 105
      Height = 23
      AutoSize = False
      TabOrder = 5
      Caption = #1050#1110#1085#1077#1094#1100' '#1075#1086#1076#1080#1085':'
    end
    object Label4: TcxLabel
      Left = 8
      Top = 56
      Width = 121
      Height = 20
      AutoSize = False
      TabOrder = 6
      Caption = #1055#1086#1095#1072#1090#1086#1082'  '#1075#1086#1076#1080#1085':'
    end
    object Label3: TcxLabel
      Left = 8
      Top = 32
      Width = 121
      Height = 17
      AutoSize = False
      TabOrder = 7
      Caption = #1050#1110#1085#1077#1094#1100' '#1075#1086#1076#1080#1085':'
    end
    object Label2: TcxLabel
      Left = 8
      Top = 8
      Width = 113
      Height = 17
      AutoSize = False
      TabOrder = 8
      Caption = #1055#1086#1095#1072#1090#1086#1082'  '#1075#1086#1076#1080#1085':'
    end
    object StatusBar2: TdxStatusBar
      Left = 1
      Top = 170
      Width = 255
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object StatusBar1: TdxStatusBar
      Left = 1
      Top = 150
      Width = 255
      Height = 20
      Panels = <
        item
          PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object CheckBoxNotSt1: TcxCheckBox
      Left = 7
      Top = 132
      Width = 241
      Height = 21
      Properties.Alignment = taRightJustify
      Properties.DisplayUnchecked = 'False'
      Properties.ValueChecked = 'T'
      Properties.ValueUnchecked = 'F'
      Properties.OnChange = CheckBoxHolidayPropertiesChange
      Properties.Caption = #1058#1110#1083#1100#1082#1080' '#1076#1083#1103' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' '#1085#1072' '#1087#1086#1074#1085#1110#1081' '#1089#1090#1072#1074#1094#1110
      TabOrder = 11
    end
  end
end
