object frmGetConfInfo: TfrmGetConfInfo
  Left = 390
  Top = 122
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1086#1073#1086#1088#1086#1090#1072#1084#1080' '#1087#1086' '#1073#1072#1083#1072#1085#1089#1086#1074#1086#1084#1091' '#1088#1072#1093#1091#1085#1082#1091
  ClientHeight = 531
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 485
    Width = 659
    Height = 46
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 459
      Top = 9
      Width = 88
      Height = 25
      Caption = #1060#1086#1088#1084#1091#1074#1072#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 555
      Top = 9
      Width = 88
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 659
    Height = 485
    Align = alClient
    TabOrder = 1
    object Bevel1: TBevel
      Left = 8
      Top = 8
      Width = 642
      Height = 34
    end
    object Bevel2: TBevel
      Left = 8
      Top = 47
      Width = 642
      Height = 51
    end
    object Bevel3: TBevel
      Left = 8
      Top = 103
      Width = 642
      Height = 378
    end
    object Label1: TLabel
      Left = 17
      Top = 15
      Width = 128
      Height = 16
      Alignment = taRightJustify
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1088#1072#1093#1091#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 28
      Top = 71
      Width = 64
      Height = 16
      Alignment = taRightJustify
      Caption = #1055#1086#1095#1072#1090#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 325
      Top = 72
      Width = 85
      Height = 16
      Alignment = taRightJustify
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 17
      Top = 50
      Width = 139
      Height = 16
      Alignment = taRightJustify
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 17
      Top = 106
      Width = 179
      Height = 16
      Alignment = taRightJustify
      Caption = #1053#1072#1076#1072#1090#1080' '#1072#1085#1072#1083#1110#1079' '#1091' '#1088#1086#1079#1088#1110#1079#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 160
      Top = 13
      Width = 482
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 0
    end
    object ShowSmGr: TcxCheckBox
      Left = 13
      Top = 229
      Width = 132
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ShowSmGrPropertiesChange
      Properties.Caption = #1043#1088#1091#1087' '#1073#1102#1076#1078#1077#1090#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object ShowSm: TcxCheckBox
      Left = 13
      Top = 269
      Width = 121
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ShowSmPropertiesChange
      Properties.Caption = #1041#1102#1076#1078#1077#1090#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object ShowRz: TcxCheckBox
      Left = 13
      Top = 309
      Width = 121
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ShowRzPropertiesChange
      Properties.Caption = #1056#1086#1079#1076#1110#1083#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object ShowSt: TcxCheckBox
      Left = 13
      Top = 349
      Width = 112
      Height = 24
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ShowStPropertiesChange
      Properties.Caption = #1057#1090#1072#1090#1090#1077#1081
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object ShowKv: TcxCheckBox
      Left = 13
      Top = 389
      Width = 100
      Height = 24
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ShowKvPropertiesChange
      Properties.Caption = #1050#1045#1050#1042#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object edTypeSchInfo: TcxRadioGroup
      Left = 148
      Top = 126
      Width = 494
      Height = 38
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 9
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1072#1093#1091#1085#1082#1110#1074
    end
    object edTypeSmGrInfo: TcxRadioGroup
      Left = 148
      Top = 231
      Width = 494
      Height = 38
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 11
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeSmInfo: TcxRadioGroup
      Left = 148
      Top = 271
      Width = 494
      Height = 38
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 12
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object edTypeRzInfo: TcxRadioGroup
      Left = 148
      Top = 311
      Width = 494
      Height = 38
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 13
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1086#1079#1076#1110#1083#1110#1074
    end
    object edTypeStInfo: TcxRadioGroup
      Left = 148
      Top = 351
      Width = 494
      Height = 38
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 14
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1089#1090#1072#1090#1077#1081
    end
    object edTypeKvInfo: TcxRadioGroup
      Left = 148
      Top = 391
      Width = 494
      Height = 38
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 15
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1082#1086#1076#1110#1074' '#1074#1080#1076#1072#1090#1082#1110#1074
    end
    object ShowProgram: TcxCheckBox
      Left = 13
      Top = 189
      Width = 92
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ShowProgramPropertiesChange
      Properties.Caption = #1055#1088#1086#1075#1088#1072#1084
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object edProgramInfo: TcxRadioGroup
      Left = 148
      Top = 191
      Width = 494
      Height = 38
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 10
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
    end
    object cbMonthBeg: TcxComboBox
      Left = 96
      Top = 69
      Width = 130
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 16
    end
    object cbYearBeg: TcxComboBox
      Left = 230
      Top = 68
      Width = 88
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 17
    end
    object cbMonthEnd: TcxComboBox
      Left = 413
      Top = 68
      Width = 137
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 18
    end
    object cbYearEnd: TcxComboBox
      Left = 553
      Top = 68
      Width = 89
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 19
    end
    object ShowSch: TcxCheckBox
      Left = 13
      Top = 123
      Width = 92
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ShowSchPropertiesChange
      Properties.Caption = #1056#1072#1093#1091#1085#1082#1110#1074
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object ShowInSaldo: TcxCheckBox
      Left = 153
      Top = 162
      Width = 137
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1093#1110#1076#1085#1077' '#1089#1072#1083#1100#1076#1086
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 8
    end
    object ShowOutSaldo: TcxCheckBox
      Left = 395
      Top = 162
      Width = 140
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1042#1080#1093#1110#1076#1085#1077' '#1089#1072#1083#1100#1076#1086
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 20
    end
    object edTypeAnInfo: TcxRadioGroup
      Left = 148
      Top = 431
      Width = 494
      Height = 38
      ItemIndex = 0
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
        end
        item
          Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        end>
      Style.BorderStyle = ebs3D
      TabOrder = 21
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1072#1085#1072#1083#1110#1090#1080#1082#1080
    end
    object ShowAn: TcxCheckBox
      Left = 13
      Top = 431
      Width = 100
      Height = 24
      AutoSize = False
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = ShowKvPropertiesChange
      Properties.Caption = #1040#1085#1072#1083#1110#1090#1080#1082#1080
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 22
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 24
    Top = 501
  end
  object ActionList1: TActionList
    Left = 64
    Top = 453
    object Esc: TAction
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = EscExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16397
      OnExecute = Action1Execute
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 152
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 152
  end
end
