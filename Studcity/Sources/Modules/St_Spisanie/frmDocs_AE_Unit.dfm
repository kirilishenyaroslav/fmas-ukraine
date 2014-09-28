object frmDocs_AE: TfrmDocs_AE
  Left = 508
  Top = 151
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmDocs_AE'
  ClientHeight = 116
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 310
    Height = 73
    Align = alTop
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Num_Doc_Label: TLabel
      Left = 8
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Num_Doc_Label'
    end
    object Date_Doc_Label: TLabel
      Left = 192
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Date_Doc'
    end
    object Num_Doc_Edit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 153
      Height = 21
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Num_Doc_EditKeyPress
    end
    object Date_Doc_Edit: TcxDateEdit
      Left = 192
      Top = 24
      Width = 105
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Date_Doc_EditKeyPress
    end
  end
  object OKButton: TcxButton
    Left = 119
    Top = 81
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 215
    Top = 81
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
