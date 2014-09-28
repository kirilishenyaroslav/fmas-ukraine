object NotesAddForm: TNotesAddForm
  Left = 473
  Top = 213
  BorderStyle = bsDialog
  Caption = 'NotesAddForm'
  ClientHeight = 157
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object InsertPanel: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 157
    Align = alClient
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 472
      Top = 120
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 552
      Top = 120
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object ArticleTextEdit: TcxTextEdit
      Left = 200
      Top = 16
      Width = 273
      Height = 24
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Text = 'ArticleTextEdit'
    end
    object ShortNameTextEdit: TcxTextEdit
      Left = 200
      Top = 48
      Width = 273
      Height = 24
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Text = 'ShortNameTextEdit'
    end
    object ArticleLabel: TcxLabel
      Left = 24
      Top = 16
      Width = 128
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = #1057#1090#1072#1090#1090#1103' '#1082#1086#1076#1077#1082#1089#1091' '
    end
    object ShortNameLabel: TcxLabel
      Left = 24
      Top = 48
      Width = 181
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = #1082#1086#1088#1086#1090#1082#1077' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
    object FullNameLabel: TcxLabel
      Left = 24
      Top = 80
      Width = 166
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1087#1086#1074#1085#1077' '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
    end
    object FullNameTextEdit: TcxTextEdit
      Left = 200
      Top = 80
      Width = 409
      Height = 24
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Text = 'FullNameTextEdit'
    end
  end
end
