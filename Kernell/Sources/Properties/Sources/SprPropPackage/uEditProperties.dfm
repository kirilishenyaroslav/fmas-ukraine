object frmEditProp: TfrmEditProp
  Left = 286
  Top = 262
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1090#1072' '#1110#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1074#1083#1072#1089#1090#1080#1074#1086#1089#1090#1103#1084
  ClientHeight = 209
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 169
    Align = alTop
    TabOrder = 0
    object Bevel1: TBevel
      Left = 8
      Top = 8
      Width = 569
      Height = 153
    end
    object Label1: TLabel
      Left = 16
      Top = 49
      Width = 220
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1074#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110
    end
    object Label2: TLabel
      Left = 67
      Top = 89
      Width = 169
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1058#1080#1087' '#1074#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110
    end
    object Label3: TLabel
      Left = 67
      Top = 17
      Width = 169
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1053#1086#1084#1077#1088' '#1074#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110
    end
    object Label4: TLabel
      Left = 155
      Top = 128
      Width = 81
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1043#1088#1091#1087#1072' '
    end
    object EdPropTitle: TEdit
      Left = 243
      Top = 49
      Width = 327
      Height = 24
      Color = clInfoBk
      MaxLength = 60
      TabOrder = 0
    end
    object cbPropType: TComboBox
      Left = 243
      Top = 89
      Width = 327
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      ItemHeight = 16
      TabOrder = 1
      Items.Strings = (
        #1052#1110#1078#1089#1080#1089#1090#1077#1084#1072' '#1074#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100
        #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1088#1072#1093#1091#1085#1082#1072
        #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1086#1087#1077#1088#1072#1094#1110#1111
        #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1088#1086#1079#1076#1110#1083#1072'/'#1089#1090#1072#1090#1090#1110
        #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1082#1086#1076#1072' '#1074#1080#1090#1088#1072#1090
        #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1073#1102#1076#1078#1077#1090#1072
        #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1090#1080#1087#1110#1074' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
        #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1074#1080#1076#1110#1074' '#1086#1087#1083#1072#1090'('#1079#1072#1088#1087#1083#1072#1090#1072')'
        #1042#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100' '#1074#1080#1076#1110#1074' '#1086#1087#1083#1072#1090'('#1089#1090#1080#1087#1077#1085#1076#1110#1103')')
    end
    object EdPropNum: TEdit
      Left = 243
      Top = 16
      Width = 111
      Height = 24
      Color = clInfoBk
      MaxLength = 60
      TabOrder = 2
      OnKeyPress = EdPropNumKeyPress
    end
    object GroupValue: TDBLookupComboBox
      Left = 243
      Top = 128
      Width = 327
      Height = 24
      Color = clInfoBk
      KeyField = 'ID_SP_PROP_GROUP'
      ListField = 'SP_PROP_GROUP_TEXT'
      ListSource = PropGroupFIBDataSource
      TabOrder = 3
    end
  end
  object ConfirmButton: TButton
    Left = 387
    Top = 176
    Width = 90
    Height = 25
    Caption = #1054#1050
    TabOrder = 1
    OnClick = ConfirmButtonClick
  end
  object CanselButton: TButton
    Left = 483
    Top = 176
    Width = 86
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = CanselButtonClick
  end
  object PropGroupFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PUB_SP_PROP_GROUP')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 536
    Top = 128
    poSQLINT64ToBCD = True
  end
  object PropGroupFIBDataSource: TDataSource
    DataSet = PropGroupFIBDataSet
    Left = 536
    Top = 96
  end
end
