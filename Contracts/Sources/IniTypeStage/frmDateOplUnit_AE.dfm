object frmDateOplAE: TfrmDateOplAE
  Left = 540
  Top = 387
  Width = 212
  Height = 146
  Caption = 'frmDateOplAE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 11
    Top = 86
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 104
    Top = 86
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
    Width = 204
    Height = 78
    Align = alTop
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object Label1: TLabel
      Left = 12
      Top = 14
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 116
      Top = 13
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object Day_Edit: TcxTextEdit
      Left = 11
      Top = 28
      Width = 81
      Height = 21
      Properties.MaxLength = 4
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Day_EditKeyPress
    end
    object Month_Edit: TcxTextEdit
      Left = 107
      Top = 28
      Width = 78
      Height = 21
      Properties.MaxLength = 4
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Month_EditKeyPress
    end
  end
end
