object FormWorkMode_Filter: TFormWorkMode_Filter
  Left = 557
  Top = 196
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088'['#1056#1077#1078#1080#1084#1080' '#1087#1088#1072#1094#1110']'
  ClientHeight = 262
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 226
    Width = 420
    Height = 36
    Align = alBottom
    TabOrder = 0
    object ButtonYes: TcxButton
      Left = 234
      Top = 5
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
    object ButtonCancel: TcxButton
      Left = 311
      Top = 5
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
  end
  object GroupBox1: TcxGroupBox
    Left = 4
    Top = 54
    Width = 414
    Height = 60
    Alignment = alTopLeft
    TabOrder = 1
    object CheckBoxDog: TcxCheckBox
      Left = 8
      Top = 9
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxPeriodActionPropertiesChange
      Properties.Caption = #1058#1088#1091#1076#1086#1074#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
      TabOrder = 0
    end
    object EditDog: TcxButtonEdit
      Left = 29
      Top = 33
      Width = 375
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditDogPropertiesButtonClick
      TabOrder = 1
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 2
    Top = 113
    Width = 416
    Height = 55
    Alignment = alTopLeft
    TabOrder = 2
    object EditMan: TcxButtonEdit
      Left = 32
      Top = 29
      Width = 374
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditManPropertiesButtonClick
      TabOrder = 0
    end
    object CheckBoxMan: TcxCheckBox
      Left = 7
      Top = 6
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxPeriodActionPropertiesChange
      Properties.Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
      TabOrder = 1
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 2
    Top = 169
    Width = 413
    Height = 54
    Alignment = alTopLeft
    TabOrder = 3
    object Label4: TLabel
      Left = 98
      Top = 14
      Width = 21
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object CheckBoxPeriodAction: TcxCheckBox
      Left = 8
      Top = 7
      Width = 157
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxPeriodActionPropertiesChange
      Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1085#1103
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      Left = 20
      Top = 29
      Width = 53
      Height = 17
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 1
      Caption = #1055#1086#1095#1072#1090#1086#1082':'
    end
    object cxLabel2: TcxLabel
      Left = 218
      Top = 29
      Width = 67
      Height = 17
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 2
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
    end
    object EditDateBegActive: TcxDateEdit
      Left = 83
      Top = 27
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object EditDateEndActive: TcxDateEdit
      Left = 283
      Top = 28
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 4
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 6
    Top = 2
    Width = 413
    Height = 54
    Alignment = alTopLeft
    TabOrder = 4
    object Label1: TLabel
      Left = 98
      Top = 14
      Width = 21
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object CheckBoxPeriod: TcxCheckBox
      Left = 8
      Top = 7
      Width = 157
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = CheckBoxPeriodActionPropertiesChange
      Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1076#1110#1111
      State = cbsChecked
      TabOrder = 0
    end
    object cxLabel3: TcxLabel
      Left = 21
      Top = 27
      Width = 53
      Height = 17
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 1
      Caption = #1055#1086#1095#1072#1090#1086#1082':'
    end
    object cxLabel4: TcxLabel
      Left = 218
      Top = 29
      Width = 67
      Height = 17
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 2
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
    end
    object EditDateBeg: TcxDateEdit
      Left = 72
      Top = 28
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object EditDateEnd: TcxDateEdit
      Left = 284
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 4
    end
  end
  object ActionList: TActionList
    Left = 3
    Top = 33
    object ActionYes: TAction
      Caption = #1054#1073#1088#1072#1090#1080
      ShortCut = 13
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
