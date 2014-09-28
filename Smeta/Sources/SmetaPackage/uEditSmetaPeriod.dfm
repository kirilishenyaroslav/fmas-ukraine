object frmSetSmetaPeriod: TfrmSetSmetaPeriod
  Left = 285
  Top = 297
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1110#1086#1076' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1074#1072#1085#1085#1103' '#1082#1086#1096#1090#1086#1088#1080#1089#1091
  ClientHeight = 322
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 281
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 63
      Width = 129
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1072
    end
    object Label2: TLabel
      Left = 16
      Top = 92
      Width = 129
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
    end
    object Label3: TLabel
      Left = 71
      Top = 7
      Width = 73
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1041#1102#1076#1078#1077#1090
    end
    object Label4: TLabel
      Left = 152
      Top = 8
      Width = 417
      Height = 49
      AutoSize = False
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 11
      Top = 141
      Width = 133
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1043#1088#1091#1087#1072' '#1073#1102#1076#1078#1077#1090#1072
    end
    object Label6: TLabel
      Left = 32
      Top = 211
      Width = 161
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1091
    end
    object cbMonthBeg: TComboBox
      Left = 150
      Top = 60
      Width = 224
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object cbMonthEnd: TComboBox
      Left = 150
      Top = 90
      Width = 224
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object cbYearEnd: TComboBox
      Left = 376
      Top = 90
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object cbYearBeg: TComboBox
      Left = 376
      Top = 60
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 150
      Top = 139
      Width = 316
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object IsDraft: TcxCheckBox
      Left = 150
      Top = 174
      Width = 83
      Height = 24
      ParentFont = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1088#1086#1077#1082#1090
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Visible = False
    end
    object Note: TcxTextEdit
      Left = 222
      Top = 210
      Width = 243
      Height = 24
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      TabOrder = 6
    end
    object CloneBeforeStructure: TcxCheckBox
      Left = 221
      Top = 244
      Width = 316
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1050#1083#1086#1085#1091#1074#1072#1090#1080' '#1089#1090#1088#1091#1082#1090#1091#1088#1091' '#1079' '#1084#1080#1085#1091#1083#1086#1075#1086' '#1087#1077#1088#1110#1086#1076#1091
      TabOrder = 7
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 281
    Width = 585
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 424
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1080#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object GroupDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PUB_SMETA_GROUP_SELECT')
    Left = 496
    Top = 64
    poSQLINT64ToBCD = True
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 496
    Top = 96
    object back: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object column_gray: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientInactiveCaption
    end
    object periods: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientInactiveCaption
    end
  end
  object GroupDataSource: TDataSource
    DataSet = GroupDataSet
    Left = 8
    Top = 177
  end
end
