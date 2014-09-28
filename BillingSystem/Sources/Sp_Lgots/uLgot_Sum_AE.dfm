object frmLgot_Sum_AE: TfrmLgot_Sum_AE
  Left = 422
  Top = 309
  Width = 298
  Height = 140
  Caption = 'frmLgot_Sum_AE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 86
    Top = 73
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 187
    Top = 73
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 281
    Height = 65
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameLabel: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object Label2: TLabel
      Left = 144
      Top = 8
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object DateEdit_Date_beg: TcxDateEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      EditValue = 0d
    end
    object CurrencyEdit_Procent: TcxCurrencyEdit
      Left = 144
      Top = 24
      Width = 121
      Height = 21
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = '0.00'
      TabOrder = 1
    end
  end
end
