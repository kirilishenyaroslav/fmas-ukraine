object frmDesignClon: TfrmDesignClon
  Left = 445
  Top = 333
  Width = 311
  Height = 123
  Caption = #1050#1083#1086#1085#1091#1074#1072#1085#1085#1103' '#1096#1072#1087#1082#1080' '#1079#1074#1110#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonOk: TcxButton
    Left = 128
    Top = 56
    Width = 75
    Height = 25
    Caption = #1050#1083#1086#1085#1091#1074#1072#1090#1080
    Default = True
    TabOrder = 0
    OnClick = cxButtonOkClick
  end
  object cxButtonCancel: TcxButton
    Left = 208
    Top = 56
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 1
    OnClick = cxButtonCancelClick
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 0
    Width = 113
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
    Caption = #1053#1086#1074#1080#1081' '#1090#1080#1087' '#1092#1086#1088#1084#1080
  end
  object DBLookupComboBoxNew: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 281
    Height = 21
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    KeyField = 'ID_FORM_CODE'
    ListField = 'NAME_FORM_CODE'
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 3
  end
  object pFIBDataSetTypeForm: TpFIBDataSet
    Left = 184
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSetTypeForm
    Left = 224
    Top = 8
  end
end
