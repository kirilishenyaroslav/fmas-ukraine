object frmDocumentType_AE: TfrmDocumentType_AE
  Left = 481
  Top = 310
  Width = 328
  Height = 251
  Caption = 'frmDocumentType_AE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 297
    Height = 65
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object NameLabel: TLabel
      Left = 8
      Top = 8
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object NameEdit: TcxTextEdit
      Left = 8
      Top = 22
      Width = 281
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clWindow
      TabOrder = 0
    end
  end
  object OkButton: TcxButton
    Left = 118
    Top = 180
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 219
    Top = 180
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object DocPropsList: TcxCheckListBox
    Left = 9
    Top = 74
    Width = 296
    Height = 97
    EditValue = 0
    Columns = 0
    Items = <>
    ScrollWidth = 0
    TabOrder = 3
    TabWidth = 0
  end
end
