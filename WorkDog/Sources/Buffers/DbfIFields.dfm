object frmDbfFields: TfrmDbfFields
  Left = 475
  Top = 182
  Width = 253
  Height = 283
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 90
    Height = 13
    Caption = #1055#1086#1083#1103' dbf-'#1090#1072#1073#1083#1080#1094#1099
  end
  object cxButton1: TcxButton
    Left = 64
    Top = 216
    Width = 89
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Default = True
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxCheckListBox1: TcxCheckListBox
    Left = 8
    Top = 24
    Width = 225
    Height = 185
    EditValue = 0
    Columns = 0
    Items = <>
    ScrollWidth = 0
    Style.BorderStyle = cbsFlat
    Style.Color = 14281696
    Style.LookAndFeel.Kind = lfFlat
    TabOrder = 1
    TabWidth = 0
  end
  object cxButton2: TcxButton
    Left = 160
    Top = 216
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object HalcyonDataSet: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 48
    Top = 40
  end
end
