object frmServiceDetail: TfrmServiceDetail
  Left = 482
  Top = 256
  BorderStyle = bsDialog
  Caption = #1044#1077#1090#1072#1083#1100#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
  ClientHeight = 216
  ClientWidth = 424
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
  object Label3: TLabel
    Left = 7
    Top = 35
    Width = 127
    Height = 13
    Caption = #1055#1086#1095#1072#1090#1086#1082' '#1079#1074#1110#1090#1085#1086#1075#1086' '#1087#1077#1088#1110#1086#1076#1091
  end
  object Label4: TLabel
    Left = 10
    Top = 60
    Width = 141
    Height = 13
    Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1079#1074#1110#1090#1085#1086#1075#1086' '#1087#1077#1088#1110#1086#1076#1091
  end
  object Label1: TLabel
    Left = 5
    Top = 11
    Width = 98
    Height = 13
    Caption = #1057#1090#1072#1090#1090#1103' '#1076#1083#1103' '#1087#1086#1089#1083#1091#1075#1080
  end
  object cbYearBeg: TcxComboBox
    Left = 343
    Top = 32
    Width = 73
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 0
  end
  object cbMonthBeg: TcxComboBox
    Left = 184
    Top = 32
    Width = 153
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 1
  end
  object cbMonthEnd: TcxComboBox
    Left = 184
    Top = 57
    Width = 153
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 2
  end
  object cbYearEnd: TcxComboBox
    Left = 343
    Top = 57
    Width = 73
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 3
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 184
    Top = 8
    Width = 232
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 4
  end
  object cxButton1: TcxButton
    Left = 256
    Top = 184
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 5
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 336
    Top = 184
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 6
    OnClick = cxButton2Click
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 88
    Width = 409
    Height = 89
    Alignment = alTopLeft
    Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1089#1090#1072#1090#1090#1110
    TabOrder = 7
    object without_pdv: TcxRadioButton
      Left = 16
      Top = 16
      Width = 113
      Height = 17
      Caption = #1087#1086#1089#1083#1091#1075#1072' '#1073#1077#1079' '#1055#1044#1042
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object with_pdv: TcxRadioButton
      Left = 16
      Top = 40
      Width = 113
      Height = 17
      Caption = #1087#1086#1089#1083#1091#1075#1072' '#1079' '#1055#1044#1042
      TabOrder = 1
    end
    object pdv: TcxRadioButton
      Left = 16
      Top = 64
      Width = 113
      Height = 17
      Caption = #1055#1044#1042
      Enabled = False
      TabOrder = 2
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 184
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 184
  end
  object GetInfoDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 40
    Top = 184
    poSQLINT64ToBCD = True
  end
end
