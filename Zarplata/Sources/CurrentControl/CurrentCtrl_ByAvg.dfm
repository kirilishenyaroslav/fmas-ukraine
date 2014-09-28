object FAvgDays: TFAvgDays
  Left = 414
  Top = 317
  BorderStyle = bsNone
  Caption = 'FAvgDays'
  ClientHeight = 83
  ClientWidth = 206
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 206
    Height = 55
    Align = alTop
    Shape = bsFrame
  end
  object LabelData: TcxLabel
    Left = 8
    Top = 8
    Width = 73
    Height = 17
    AutoSize = False
    TabOrder = 0
  end
  object EditData: TcxMaskEdit
    Left = 80
    Top = 6
    Width = 121
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[-]?\d\d\d'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object YesBtn: TcxButton
    Left = 48
    Top = 60
    Width = 75
    Height = 21
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 128
    Top = 60
    Width = 75
    Height = 21
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object AvgSumEdit: TcxMaskEdit
    Left = 81
    Top = 30
    Width = 121
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object LabelAvg: TcxLabel
    Left = 8
    Top = 31
    Width = 73
    Height = 17
    AutoSize = False
    TabOrder = 5
    OnClick = LabelAvgClick
  end
  object ActionList: TActionList
    Top = 56
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object ActionAvg: TAction
      Caption = 'ActionAvg'
      ShortCut = 32
    end
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 112
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 176
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = ReadTransaction
    Left = 144
  end
end
