object frmGetConfInfo: TfrmGetConfInfo
  Left = 428
  Top = 221
  BorderStyle = bsDialog
  Caption = 
    #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1085#1103' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111' '#1087#1086' '#1082#1072#1088#1090#1094#1110' '#1072#1085#1072#1083#1110#1090#1080#1095#1085#1086#1075#1086' '#1086#1073#1083 +
    #1110#1082#1091
  ClientHeight = 229
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
    Top = 183
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
    Height = 183
    Align = alClient
    TabOrder = 1
    object Bevel2: TBevel
      Left = 8
      Top = 8
      Width = 642
      Height = 51
    end
    object Bevel3: TBevel
      Left = 8
      Top = 64
      Width = 642
      Height = 378
    end
    object Label2: TLabel
      Left = 28
      Top = 32
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
      Top = 33
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
      Left = 19
      Top = 11
      Width = 425
      Height = 16
      Alignment = taRightJustify
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1082#1072#1088#1090#1082#1080' '#1072#1085#1072#1083#1110#1090#1080#1095#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 17
      Top = 67
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
    object edTypeRzInfo: TcxRadioGroup
      Left = 148
      Top = 123
      Width = 494
      Height = 38
      Enabled = False
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
      TabOrder = 0
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1088#1086#1079#1076#1110#1083#1110#1074
    end
    object edTypeKvInfo: TcxRadioGroup
      Left = 148
      Top = 80
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
      TabOrder = 1
      Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1082#1086#1076#1110#1074' '#1074#1080#1076#1072#1090#1082#1110#1074
    end
    object cbMonthBeg: TcxComboBox
      Left = 96
      Top = 30
      Width = 130
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cbYearBeg: TcxComboBox
      Left = 230
      Top = 29
      Width = 88
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object cbMonthEnd: TcxComboBox
      Left = 413
      Top = 29
      Width = 137
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object cbYearEnd: TcxComboBox
      Left = 553
      Top = 29
      Width = 89
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 5
    end
    object ShowRz: TcxRadioButton
      Left = 16
      Top = 91
      Width = 113
      Height = 17
      Caption = #1056#1086#1079#1076#1110#1083#1110#1074
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      TabStop = True
    end
    object ShowKv: TcxRadioButton
      Left = 16
      Top = 125
      Width = 113
      Height = 17
      Caption = #1050#1045#1050#1042#1110#1074
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
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
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 192
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 40
    Top = 192
  end
end
