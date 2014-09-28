object FormOfficialNote_Filtr: TFormOfficialNote_Filtr
  Left = 483
  Top = 160
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088'['#1057#1083#1091#1078#1073#1086#1074#1110' '#1079#1072#1087#1080#1089#1082#1080']'
  ClientHeight = 382
  ClientWidth = 482
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 346
    Align = alClient
    TabOrder = 0
    object cxGroupBox1: TcxGroupBox
      Left = 3
      Top = 54
      Width = 464
      Height = 55
      Alignment = alTopLeft
      TabOrder = 0
      object CheckBoxDateCreate: TcxCheckBox
        Left = 8
        Top = 8
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = CheckBoxPeriodActionPropertiesChange
        Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '
        TabOrder = 0
      end
      object cxLabel3: TcxLabel
        Left = 15
        Top = 29
        Width = 53
        Height = 17
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 1
        Caption = #1055#1086#1095#1072#1090#1086#1082':'
      end
      object cxLabel4: TcxLabel
        Left = 227
        Top = 30
        Width = 67
        Height = 17
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 2
        Caption = #1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
      end
      object EditDateBegCreate: TcxDateEdit
        Left = 83
        Top = 27
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object EditDateEndCreate: TcxDateEdit
        Left = 300
        Top = 27
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 4
      end
    end
    object GroupBox1: TcxGroupBox
      Left = 4
      Top = 108
      Width = 462
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
        Left = 37
        Top = 33
        Width = 419
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
      Left = 4
      Top = 168
      Width = 463
      Height = 55
      Alignment = alTopLeft
      TabOrder = 2
      object EditMan: TcxButtonEdit
        Left = 37
        Top = 27
        Width = 420
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
      Left = -3
      Top = 0
      Width = 470
      Height = 55
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
        Left = 13
        Top = 7
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = CheckBoxPeriodActionPropertiesChange
        Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1076#1110#1111
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
        Left = 232
        Top = 29
        Width = 67
        Height = 17
        Properties.Alignment.Horz = taRightJustify
        TabOrder = 2
        Caption = #1079#1072#1082#1110#1085#1095#1077#1085#1085#1103':'
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
        Left = 310
        Top = 26
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 4
      end
    end
    object cxGroupBox4: TcxGroupBox
      Left = 5
      Top = 222
      Width = 461
      Height = 55
      Alignment = alTopLeft
      TabOrder = 4
      object EditTypeWork: TcxButtonEdit
        Left = 36
        Top = 26
        Width = 417
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = EditTypeWorkPropertiesButtonClick
        TabOrder = 0
      end
      object CheckBoxTypeWork: TcxCheckBox
        Left = 7
        Top = 5
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = CheckBoxPeriodActionPropertiesChange
        Properties.Caption = #1058#1080#1087' '#1074#1080#1093#1086#1076#1091
        TabOrder = 1
      end
    end
    object cxGroupBox5: TcxGroupBox
      Left = 6
      Top = 276
      Width = 461
      Height = 55
      Alignment = alTopLeft
      TabOrder = 5
      object CheckBoxWorkMode: TcxCheckBox
        Left = 6
        Top = 6
        Width = 248
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Properties.OnChange = CheckBoxPeriodActionPropertiesChange
        Properties.Caption = #1047#1084#1110#1085#1072' '#1088#1077#1078#1080#1084#1091' ('#1091#1090#1086#1095#1085#1102#1074#1072#1090#1080' '#1085#1077' '#1086#1073#1086#1074'`'#1103#1079#1082#1086#1074#1086')'
        TabOrder = 0
      end
      object EditWorkMode: TcxButtonEdit
        Left = 36
        Top = 27
        Width = 414
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = EditWorkModePropertiesButtonClick
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 346
    Width = 482
    Height = 36
    Align = alBottom
    TabOrder = 1
    object ButtonYes: TcxButton
      Left = 250
      Top = 5
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
    object ButtonCancel: TcxButton
      Left = 329
      Top = 5
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
  end
  object ActionList: TActionList
    Left = 433
    Top = 65535
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
