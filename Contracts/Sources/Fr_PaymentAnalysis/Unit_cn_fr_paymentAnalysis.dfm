object form_cn_fr_paymentAnalysis: Tform_cn_fr_paymentAnalysis
  Left = 563
  Top = 319
  Width = 300
  Height = 125
  Caption = 'form_cn_fr_paymentAnalysis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonOk: TcxButton
    Left = 32
    Top = 59
    Width = 100
    Height = 25
    Caption = 'cxButtonOk'
    TabOrder = 0
    OnClick = cxButtonOkClick
  end
  object cxButtonCancel: TcxButton
    Left = 152
    Top = 59
    Width = 100
    Height = 25
    Caption = 'cxButtonCancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = cxButtonCancelClick
  end
  object Print_dogs_list: TcxComboBox
    Left = 8
    Top = 24
    Width = 273
    Height = 24
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 2
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 185
    Height = 17
    AutoSize = False
    TabOrder = 3
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 152
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TACommit
    Left = 184
  end
  object DataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 216
    poSQLINT64ToBCD = True
  end
end
