object frmAccount_Conf: TfrmAccount_Conf
  Left = 664
  Top = 291
  Width = 449
  Height = 333
  Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1088#1086#1073#1086#1090#1080' '#1079' '#1088#1072#1093#1091#1085#1082#1072#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 258
    Width = 441
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 258
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 225
      Height = 16
      Caption = #1044#1086#1075#1086#1074#1110#1088', '#1079#1072' '#1103#1082#1080#1084' '#1074#1077#1076#1077#1090#1100#1089#1103' '#1088#1086#1073#1086#1090#1072'  '
    end
    object Label2: TLabel
      Left = 16
      Top = 117
      Width = 364
      Height = 16
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1074#1072#1085#1085#1103' '#1089#1080#1089#1090#1077#1084#1080' '#1086#1073#1083#1110#1082#1091' '#1088#1072#1093#1091#1085#1082#1110#1074' '
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 174
      Height = 16
      Caption = #1056#1086#1073#1086#1095#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1073#1072#1083#1072#1085#1089#1091' '
    end
    object Label4: TLabel
      Left = 16
      Top = 205
      Width = 157
      Height = 16
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 16
      Top = 32
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 16
      Top = 80
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxDateEdit1: TcxDateEdit
      Left = 16
      Top = 136
      Width = 249
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxCheckBox1: TcxCheckBox
      Left = 16
      Top = 168
      Width = 401
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1086#1073#1080#1090#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1090#1110#1083#1100#1082#1080' '#1087#1086' "'#1086#1089#1085#1086#1074#1085#1080#1084' '#1076#1086#1088#1086#1074#1086#1088#1072#1084'"'
      TabOrder = 3
    end
    object cxComboBox1: TcxComboBox
      Left = 16
      Top = 224
      Width = 393
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #1074#1077#1076#1077#1085#1085#1103' '#1079#1072#1083#1080#1096#1082#1110#1074', '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1110' '#1089#1087#1083#1072#1090
        #1090#1110#1083#1100#1082#1080' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103)
      Style.Color = clInfoBk
      TabOrder = 4
    end
  end
  object SysDataSet: TpFIBDataSet
    Left = 312
    Top = 154
    poSQLINT64ToBCD = True
  end
  object SysDataSource: TDataSource
    DataSet = SysDataSet
    Left = 352
    Top = 154
  end
end
