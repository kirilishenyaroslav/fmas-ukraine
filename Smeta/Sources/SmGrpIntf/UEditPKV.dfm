object frmEditPKV: TfrmEditPKV
  Left = 439
  Top = 258
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1075#1088#1091#1087#1110' '#1073#1102#1076#1078#1077#1090#1072
  ClientHeight = 294
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 253
    Width = 497
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 326
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 406
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1080#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 253
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 68
      Width = 129
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1072
    end
    object Label2: TLabel
      Left = 16
      Top = 97
      Width = 129
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
    end
    object Label5: TLabel
      Left = 11
      Top = 146
      Width = 133
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1088#1086#1075#1088#1072#1084#1072
    end
    object Label3: TLabel
      Left = 11
      Top = 178
      Width = 133
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
    end
    object Label4: TLabel
      Left = 56
      Top = 213
      Width = 88
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1079#1074#1072' '#1052#1054
    end
    object Label6: TLabel
      Left = 48
      Top = 24
      Width = 48
      Height = 16
      Caption = 'Label6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 149
      Top = 142
      Width = 316
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
      TabOrder = 0
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 149
      Top = 174
      Width = 316
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cbMonthBeg: TcxComboBox
      Left = 152
      Top = 65
      Width = 221
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cbMonthEnd: TcxComboBox
      Left = 152
      Top = 94
      Width = 221
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object cbYearBeg: TcxComboBox
      Left = 376
      Top = 65
      Width = 92
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object cbYearEnd: TcxComboBox
      Left = 376
      Top = 93
      Width = 92
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clInfoBk
      TabOrder = 5
    end
    object cxTextEdit1: TcxTextEdit
      Left = 149
      Top = 207
      Width = 316
      Height = 24
      Properties.MaxLength = 30
      TabOrder = 6
    end
  end
  object MOCharDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from BU_SM_GR_GET_MO_CHAR')
    Left = 401
    Top = 8
    poSQLINT64ToBCD = True
  end
  object MOCharDataSource: TDataSource
    DataSet = MOCharDataSet
    Left = 433
    Top = 8
  end
end
