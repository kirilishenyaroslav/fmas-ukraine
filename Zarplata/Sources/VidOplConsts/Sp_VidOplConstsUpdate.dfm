object ZFVidOplUpdate: TZFVidOplUpdate
  Left = 346
  Top = 101
  Width = 510
  Height = 155
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1082#1086#1085#1089#1090#1072#1085#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EditVidOpl: TcxButtonEdit
    Left = 32
    Top = 40
    Width = 65
    Height = 24
    ParentFont = False
    ParentShowHint = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.ReadOnly = True
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    OnClick = EditVidOplClick
  end
  object CancelBtn: TcxButton
    Left = 288
    Top = 78
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object YesBtn: TcxButton
    Left = 152
    Top = 78
    Width = 81
    Height = 25
    Caption = 'Action1'
    TabOrder = 2
    OnClick = Action1Execute
    LookAndFeel.Kind = lfFlat
  end
  object cxLabel1: TcxLabel
    Left = 32
    Top = 8
    Width = 103
    Height = 20
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1042#1080#1076' '#1086#1087#1077#1088#1072#1094#1110#1111
  end
  object LabelVidOplData: TcxLabel
    Left = 112
    Top = 40
    Width = 353
    Height = 24
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.BorderColor = clHotLight
    Style.BorderStyle = ebsSingle
    Style.Color = clBtnHighlight
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 4
    Caption = ''
  end
  object DB: TpFIBDatabase
    DefaultTransaction = RTransaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 80
  end
  object RTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 80
  end
end
