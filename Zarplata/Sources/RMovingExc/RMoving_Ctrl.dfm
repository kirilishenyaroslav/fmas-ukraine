object FRmovingCtrl: TFRmovingCtrl
  Left = 314
  Top = 302
  BorderStyle = bsDialog
  Caption = 'FRmovingCtrl'
  ClientHeight = 140
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 59
    Width = 467
    Height = 1
    Style = bsRaised
  end
  object YesBtn: TcxButton
    Left = 256
    Top = 112
    Width = 75
    Height = 25
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 344
    Top = 112
    Width = 75
    Height = 25
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 2
    object LabelMan: TcxLabel
      Left = 0
      Top = 5
      Width = 113
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object MaskEditMan: TcxMaskEdit
      Left = 112
      Top = 3
      Width = 353
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 467
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Bevel2: TBevel
      Left = -1
      Top = 1
      Width = 468
      Height = 1
      Style = bsRaised
    end
    object LabelBeg: TcxLabel
      Left = 0
      Top = 11
      Width = 97
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object DateEditBeg: TcxDateEdit
      Left = 97
      Top = 7
      Width = 121
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object DateEditEnd: TcxDateEdit
      Left = 249
      Top = 7
      Width = 121
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object LabelEnd: TcxLabel
      Left = 368
      Top = 11
      Width = 94
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxLabel1: TcxLabel
      Left = 224
      Top = 11
      Width = 21
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = '---'
    end
    object NoteText: TcxTextEdit
      Left = 98
      Top = 40
      Width = 365
      Height = 21
      ParentFont = False
      TabOrder = 5
    end
    object cxLabel2: TcxLabel
      Left = 0
      Top = 43
      Width = 97
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088
    end
  end
  object ActionList: TActionList
    Left = 104
    Top = 128
    object ActionYes: TAction
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 128
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 72
    Top = 128
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 40
    Top = 128
  end
end
