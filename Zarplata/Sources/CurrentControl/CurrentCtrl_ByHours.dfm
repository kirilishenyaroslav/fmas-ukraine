object FCurrCtrl_ByHours: TFCurrCtrl_ByHours
  Left = 539
  Top = 272
  BorderStyle = bsNone
  Caption = 'FCurrCtrl_ByHours'
  ClientHeight = 92
  ClientWidth = 205
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
    Width = 205
    Height = 65
    Align = alTop
    Shape = bsFrame
  end
  object LabelHours: TcxLabel
    Left = 8
    Top = 6
    Width = 73
    Height = 17
    AutoSize = False
    TabOrder = 0
  end
  object LabelSumma: TcxLabel
    Left = 8
    Top = 24
    Width = 73
    Height = 17
    AutoSize = False
    TabOrder = 1
  end
  object LabelPercent: TcxLabel
    Left = 8
    Top = 42
    Width = 73
    Height = 17
    AutoSize = False
    TabOrder = 2
  end
  object EditHours: TcxMaskEdit
    Left = 80
    Top = 4
    Width = 121
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d\d?\d? ([,]\d\d?\d?)?'
    Properties.MaxLength = 0
    TabOrder = 3
    OnKeyPress = EditHoursKeyPress
  end
  object EditSumma: TcxMaskEdit
    Left = 80
    Top = 22
    Width = 121
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
    Properties.MaxLength = 0
    TabOrder = 4
    OnKeyPress = EditHoursKeyPress
  end
  object EditPercent: TcxMaskEdit
    Left = 80
    Top = 40
    Width = 121
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '100,00 | \d\d? ([,]\d\d?)?'
    Properties.MaxLength = 0
    TabOrder = 5
    Text = '100'
    OnKeyPress = EditHoursKeyPress
  end
  object YesBtn: TcxButton
    Left = 48
    Top = 69
    Width = 75
    Height = 21
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 128
    Top = 69
    Width = 75
    Height = 21
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    LookAndFeel.Kind = lfFlat
  end
  object ActionList: TActionList
    Left = 8
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
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 40
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 8
    Top = 56
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 8
    Top = 64
  end
  object DefaultsDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 8
    Top = 56
    poSQLINT64ToBCD = True
  end
end
