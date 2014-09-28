object frmSchAnalizeEdit: TfrmSchAnalizeEdit
  Left = 298
  Top = 179
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1072#1085#1072#1083#1080#1090#1080#1082#1086#1081' '#1089#1095#1077#1090#1072
  ClientHeight = 157
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 21
    Width = 69
    Height = 13
    Caption = #1058#1080#1087' '#1079#1072#1085#1095#1077#1085#1080#1103
  end
  object cxButton1: TcxButton
    Left = 160
    Top = 128
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 240
    Top = 128
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 96
    Top = 16
    Width = 217
    Height = 21
    Color = clInfoBk
    KeyField = 'ID_AN_TYPE_VALUE'
    ListField = 'NAME_TYPE_VALUE;SHORT_NAME'
    ListSource = TypeValueDataSource
    TabOrder = 2
  end
  object ckDefaultValue: TCheckBox
    Left = 16
    Top = 64
    Width = 145
    Height = 17
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 3
    OnClick = ckDefaultValueClick
  end
  object EdDefaultvalue: TcxButtonEdit
    Left = 16
    Top = 88
    Width = 297
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EdDefaultvaluePropertiesButtonClick
    Style.BorderStyle = ebs3D
    Style.Color = clInfoBk
    TabOrder = 4
  end
  object TypeValDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from PUB_SP_ANALITIC_TYPE_VALUE')
    Left = 80
    Top = 128
    poSQLINT64ToBCD = True
  end
  object TypeValueDataSource: TDataSource
    DataSet = TypeValDataSet
    Left = 112
    Top = 128
  end
end
