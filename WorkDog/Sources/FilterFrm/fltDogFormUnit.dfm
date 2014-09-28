object fltDogForm: TfltDogForm
  Left = 379
  Top = 215
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088' '#1085#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
  ClientHeight = 226
  ClientWidth = 435
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
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 433
    Height = 185
    Alignment = alTopLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 122
      Top = 97
      Width = 103
      Height = 13
      AutoSize = False
      Caption = #1076#1086
    end
    object ShowClosedCheck: TcxCheckBox
      Left = 5
      Top = 160
      Width = 420
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1079#1072#1082#1088#1080#1090#1110' '#1076#1086#1075#1086#1074#1086#1088#1080
      TabOrder = 11
      OnClick = ShowClosedCheckClick
    end
    object fltDateCheck: TcxCheckBox
      Left = 5
      Top = 136
      Width = 420
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1058#1110#1083#1100#1082#1080' '#1079#1072#1088#1077#1108#1089#1090#1088#1086#1074#1072#1085#1110' '#1079' '
      State = cbsChecked
      TabOrder = 10
      OnClick = fltDateCheckClick
    end
    object fltTipDogCheck: TcxCheckBox
      Left = 4
      Top = 55
      Width = 229
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1091
      TabOrder = 4
      OnClick = fltTipDogCheckClick
    end
    object fltDatePeriodCheck: TcxCheckBox
      Left = 236
      Top = 55
      Width = 89
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079
      TabOrder = 6
      OnClick = fltDatePeriodCheckClick
    end
    object fltCustCheck: TcxCheckBox
      Left = 116
      Top = 16
      Width = 309
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      TabOrder = 2
      OnClick = fltCustCheckClick
    end
    object fltTipDogEdit: TcxButtonEdit
      Left = 8
      Top = 72
      Width = 225
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = fltTipDogEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 5
      OnKeyPress = fltTipDogEditKeyPress
    end
    object fltDateBegEdit: TcxDateEdit
      Left = 240
      Top = 72
      Width = 89
      Height = 21
      Enabled = False
      PopupMenu = PopupMenu1
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 7
      OnKeyPress = fltDateBegEditKeyPress
    end
    object fltDateEndEdit: TcxDateEdit
      Left = 336
      Top = 72
      Width = 89
      Height = 21
      Enabled = False
      PopupMenu = PopupMenu1
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 8
      OnKeyPress = fltDateEndEditKeyPress
    end
    object cxLabel10: TcxLabel
      Left = 333
      Top = 57
      Width = 92
      Height = 17
      AutoSize = False
      TabOrder = 12
      Caption = #1087#1086
    end
    object fltCustEdit: TcxButtonEdit
      Left = 120
      Top = 32
      Width = 305
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = False
      Properties.OnButtonClick = fltCustEditPropertiesButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 3
      OnKeyPress = fltCustEditKeyPress
    end
    object fltRegNumCheck: TcxCheckBox
      Left = 4
      Top = 14
      Width = 117
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#8470
      TabOrder = 0
      OnClick = fltRegNumCheckClick
    end
    object fltRegNumEdit: TcxTextEdit
      Left = 8
      Top = 32
      Width = 105
      Height = 21
      Enabled = False
      Properties.MaxLength = 10
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyDown = fltRegNumEditKeyDown
    end
    object fltSumCheck: TcxCheckBox
      Left = 4
      Top = 94
      Width = 109
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1091#1084#1084#1072' '#1074#1110#1076
      TabOrder = 9
      OnClick = fltSumCheckClick
    end
    object fltSumFromEdit: TcxCurrencyEdit
      Left = 8
      Top = 112
      Width = 105
      Height = 21
      OnFocusChanged = fltSumFromEditFocusChanged
      BeepOnEnter = False
      Enabled = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 13
      OnKeyPress = fltSumFromEditKeyPress
    end
    object fltSumToEdit: TcxCurrencyEdit
      Left = 120
      Top = 112
      Width = 105
      Height = 21
      BeepOnEnter = False
      Enabled = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 14
      OnKeyPress = fltSumToEditKeyPress
    end
  end
  object OKButton: TcxButton
    Left = 128
    Top = 192
    Width = 105
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object cxButton2: TcxButton
    Left = 240
    Top = 192
    Width = 105
    Height = 25
    Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 352
    Top = 192
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 3
    OnClick = cxButton3Click
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 192
    object i1: TMenuItem
      Caption = #1057#1100#1086#1075#1086#1076#1085'i'
      OnClick = i1Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1055#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1088#1110#1082
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
      Visible = False
    end
    object N4: TMenuItem
      Caption = #1055#1077#1088#1096#1080#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N5: TMenuItem
      Caption = #1044#1088#1091#1075#1080#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N6: TMenuItem
      Caption = #1058#1088#1077#1090#1110#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
    object N7: TMenuItem
      Caption = #1063#1077#1090#1074#1077#1088#1090#1099#1081' '#1082#1074#1072#1088#1090#1072#1083' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1088#1086#1082#1091
      Visible = False
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 192
    object Action1: TAction
      Caption = 'actApplyFilter'
      ShortCut = 16419
      SecondaryShortCuts.Strings = (
        'F10')
      OnExecute = Action1Execute
    end
  end
  object pFIBDatabase1: TpFIBDatabase
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 80
    Top = 192
  end
end
