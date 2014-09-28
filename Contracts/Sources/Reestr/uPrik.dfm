object frmPrik: TfrmPrik
  Left = 498
  Top = 248
  Width = 329
  Height = 282
  Caption = #1044#1086#1076#1072#1090#1080' '#1085#1072' '#1087#1110#1076#1089#1090#1072#1074#1110' '#1085#1072#1082#1072#1079#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cancel_button: TcxButton
    Left = 167
    Top = 214
    Width = 100
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 1
    OnClick = cancel_buttonClick
  end
  object ok_button: TcxButton
    Left = 55
    Top = 214
    Width = 100
    Height = 25
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080
    Default = True
    TabOrder = 0
    OnClick = ok_buttonClick
  end
  object type_prik_commbobox: TcxComboBox
    Left = 8
    Top = 24
    Width = 297
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.OnChange = type_prik_commboboxPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 17
    TabOrder = 3
    Caption = #1053#1072#1082#1072#1079
  end
  object spec_combobox: TcxComboBox
    Left = 8
    Top = 104
    Width = 297
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 4
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 88
    Width = 78
    Height = 17
    TabOrder = 5
    Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
  end
  object form_stud_combobox: TcxComboBox
    Left = 8
    Top = 144
    Width = 297
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 6
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 128
    Width = 95
    Height = 17
    TabOrder = 7
    Caption = #1060#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object Kat_stud_combobox: TcxComboBox
    Left = 8
    Top = 184
    Width = 297
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 8
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 168
    Width = 107
    Height = 17
    TabOrder = 9
    Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1085#1072#1074#1095#1072#1085#1085#1103
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 48
    Width = 78
    Height = 17
    TabOrder = 10
    Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
  end
  object Facul_ComboBox: TcxComboBox
    Left = 8
    Top = 64
    Width = 297
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.OnChange = Facul_ComboBoxPropertiesChange
    TabOrder = 11
  end
  object Read_DataSet: TpFIBDataSet
    Database = frmReestr_DM.DB
    Transaction = frmReestr_DM.Tran_Read
    UpdateTransaction = frmReestr_DM.Tran_write
    Left = 272
    Top = 208
    poSQLINT64ToBCD = True
  end
end
