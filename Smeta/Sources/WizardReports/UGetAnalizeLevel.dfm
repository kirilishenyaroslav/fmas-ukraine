object frmGetAnalizelevel: TfrmGetAnalizelevel
  Left = 358
  Top = 276
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1077#1088#1110#1090#1100' '#1088#1110#1074#1077#1085#1100' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1085#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1091
  ClientHeight = 290
  ClientWidth = 463
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
    Top = 249
    Width = 463
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 249
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 461
      Height = 128
      Align = alTop
      Caption = #1054#1073#1077#1088#1110#1090#1100' '#1082#1088#1080#1090#1077#1088#1110#1111' '#1076#1083#1103' '#1087#1086#1088#1110#1074#1085#1103#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1110#1074
      TabOrder = 0
      object Criteria1: TcxCheckBox
        Left = 48
        Top = 21
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1044#1077#1092#1110#1094#1080#1090
        TabOrder = 0
      end
      object Criteria2: TcxCheckBox
        Left = 48
        Top = 45
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1088#1086#1092#1110#1094#1080#1090
        TabOrder = 1
      end
      object Criteria3: TcxCheckBox
        Left = 48
        Top = 69
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1044#1086#1083#1103' '#1076#1077#1092#1110#1094#1080#1090#1091
        TabOrder = 2
      end
      object Criteria4: TcxCheckBox
        Left = 48
        Top = 93
        Width = 137
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = RazdStValueChange
        Properties.Caption = #1044#1086#1083#1103' '#1087#1086' '#1088#1086#1079#1076#1110#1083#1091'/'#1089#1090#1072#1090#1090#1110
        TabOrder = 3
      end
      object RazdStValue: TcxButtonEdit
        Left = 192
        Top = 93
        Width = 257
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 4
      end
    end
    object cxRadioGroup1: TcxRadioGroup
      Left = 1
      Top = 129
      Width = 461
      Height = 119
      Align = alClient
      ItemIndex = 0
      Properties.Items = <
        item
          Caption = #1047#1072#1075#1072#1083#1100#1085#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080
        end
        item
          Caption = #1056#1086#1079#1076#1110#1083#1080
        end
        item
          Caption = #1057#1090#1072#1090#1090#1110
        end>
      TabOrder = 1
      Caption = #1054#1073#1077#1088#1110#1090#1100' '#1088#1110#1074#1077#1085#1100' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1080#1093' '#1076#1083#1103' '#1072#1085#1072#1083#1110#1079#1091
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 96
    Top = 176
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 128
    Top = 176
  end
  object GetInfoDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 160
    Top = 176
    poSQLINT64ToBCD = True
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    StorageType = stRegistry
    Left = 201
    Top = 33
  end
end
