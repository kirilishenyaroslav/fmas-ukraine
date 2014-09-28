object form_cn_fr_paymentAnalysis: Tform_cn_fr_paymentAnalysis
  Left = 609
  Top = 264
  Width = 324
  Height = 247
  Caption = 'form_cn_fr_paymentAnalysis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxRadioButton1: TcxRadioButton
    Left = 32
    Top = 40
    Width = 113
    Height = 17
    Caption = 'cxRadioButton1'
    TabOrder = 0
  end
  object cxRadioButton2: TcxRadioButton
    Left = 32
    Top = 64
    Width = 113
    Height = 17
    Caption = 'cxRadioButton1'
    TabOrder = 1
  end
  object cxRadioButton3: TcxRadioButton
    Left = 32
    Top = 88
    Width = 113
    Height = 17
    Caption = 'cxRadioButton1'
    TabOrder = 2
  end
  object cxRadioButton4: TcxRadioButton
    Left = 32
    Top = 112
    Width = 113
    Height = 17
    Caption = 'cxRadioButton1'
    TabOrder = 3
  end
  object cxButton1: TcxButton
    Left = 104
    Top = 160
    Width = 75
    Height = 25
    Caption = 'cxButton1'
    TabOrder = 4
  end
  object cxButton2: TcxButton
    Left = 192
    Top = 160
    Width = 75
    Height = 25
    Caption = 'cxButton2'
    ModalResult = 2
    TabOrder = 5
    OnClick = cxButton2Click
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
end
