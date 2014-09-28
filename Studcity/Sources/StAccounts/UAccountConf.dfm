object frmAccConf: TfrmAccConf
  Left = 286
  Top = 176
  Width = 557
  Height = 396
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
    Top = 328
    Width = 549
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 376
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
    Width = 549
    Height = 328
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
      Top = 149
      Width = 364
      Height = 16
      Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1074#1072#1085#1085#1103' '#1089#1080#1089#1090#1077#1084#1080' '#1086#1073#1083#1110#1082#1091' '#1088#1072#1093#1091#1085#1082#1110#1074' '
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 174
      Height = 16
      Caption = #1056#1086#1073#1086#1095#1080#1081' '#1088#1072#1093#1091#1085#1086#1082' '#1073#1072#1083#1072#1085#1089#1091' '
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 104
      Top = 40
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
      Left = 104
      Top = 104
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
      Left = 104
      Top = 184
      Width = 249
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object UseRecalcOptimization: TcxCheckBox
      Left = 104
      Top = 240
      Width = 417
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1053#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1086#1087#1090#1080#1084#1110#1079#1072#1094#1110#1102' '#1087#1110#1076#1095#1072#1089' '#1087#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
      TabOrder = 3
    end
  end
  object SysDataSet: TpFIBDataSet
    Left = 8
    Top = 258
    poSQLINT64ToBCD = True
  end
  object SysDataSource: TDataSource
    DataSet = SysDataSet
    Left = 40
    Top = 258
  end
end
