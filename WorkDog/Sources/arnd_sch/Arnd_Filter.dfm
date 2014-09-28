object frmFilterArnd: TfrmFilterArnd
  Left = 826
  Top = 685
  Width = 454
  Height = 226
  Caption = #1060#1080#1083#1100#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 3
    Top = 0
    Width = 433
    Height = 145
    Alignment = alTopLeft
    TabOrder = 0
    object Label1: TLabel
      Left = 120
      Top = 97
      Width = 97
      Height = 13
      AutoSize = False
      Caption = #1076#1086
    end
    object fltTipDogCheck: TcxCheckBox
      Left = 4
      Top = 55
      Width = 221
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
      Width = 209
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
    end
    object fltDateBegEdit: TcxDateEdit
      Left = 240
      Top = 72
      Width = 89
      Height = 21
      Enabled = False
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
      TabOrder = 10
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
      Properties.OnEditValueChanged = fltCustEditPropertiesEditValueChanged
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
      Properties.Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1091
      TabOrder = 0
      OnClick = fltRegNumCheckClick
    end
    object fltRegNumEdit: TcxTextEdit
      Left = 8
      Top = 32
      Width = 105
      Height = 21
      Enabled = False
      Style.Color = clMoneyGreen
      TabOrder = 1
      OnKeyDown = fltRegNumEditKeyDown
    end
    object fltSumCheck: TcxCheckBox
      Left = 4
      Top = 94
      Width = 93
      Height = 21
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1091#1084#1072' '#1074#1110#1076
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
      TabOrder = 11
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
      TabOrder = 12
      OnKeyPress = fltSumToEditKeyPress
    end
  end
  object OKButton: TcxButton
    Left = 128
    Top = 152
    Width = 105
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object cxButton3: TcxButton
    Left = 361
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = cxButton3Click
  end
  object cxButton2: TcxButton
    Left = 244
    Top = 153
    Width = 105
    Height = 25
    Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080' '#1092#1110#1083#1100#1090#1088
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object fltrRegNumDogCheck: TcxCheckBox
    Left = 240
    Top = 96
    Width = 153
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1077#1108#1089#1090#1088'. '#1085#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1091
    TabOrder = 4
    OnClick = fltrRegNumDogCheckClick
  end
  object fltrRegNumDogEdit: TcxTextEdit
    Left = 245
    Top = 112
    Width = 140
    Height = 21
    Enabled = False
    Style.Color = clMoneyGreen
    TabOrder = 5
    OnKeyDown = fltrRegNumDogEditKeyDown
  end
  object ActionList1: TActionList
    Left = 203
    Top = 64
    object fltr: TAction
      Caption = 'fltr'
      ShortCut = 121
      OnExecute = fltrExecute
    end
  end
end
