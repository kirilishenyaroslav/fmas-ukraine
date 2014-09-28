object FZTaxNets: TFZTaxNets
  Left = 411
  Top = 259
  BorderStyle = bsDialog
  Caption = 'FZTaxNets'
  ClientHeight = 183
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Box: TcxGroupBox
    Left = 0
    Top = -5
    Width = 265
    Height = 161
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 2
      Top = 112
      Width = 261
      Height = 47
      Align = alBottom
      Shape = bsTopLine
    end
    object EditMinSumma: TcxMaskEdit
      Left = 138
      Top = 12
      Width = 121
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 0
    end
    object EditMaxSumma: TcxMaskEdit
      Left = 138
      Top = 36
      Width = 121
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 1
    end
    object EditPercent: TcxMaskEdit
      Left = 138
      Top = 60
      Width = 121
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '(100) | (\d\d? ([,]\d\d?)?)'
      Properties.MaxLength = 0
      TabOrder = 2
    end
    object EditAddSumma: TcxMaskEdit
      Left = 138
      Top = 84
      Width = 121
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 3
    end
    object LabelMinSumma: TcxLabel
      Left = 0
      Top = 11
      Width = 138
      Height = 26
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object LabelMaxSumma: TcxLabel
      Left = 0
      Top = 35
      Width = 138
      Height = 26
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object LabelPercent: TcxLabel
      Left = 0
      Top = 59
      Width = 138
      Height = 26
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object LabelAddSumma: TcxLabel
      Left = 0
      Top = 83
      Width = 138
      Height = 26
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object LabelAddText: TcxLabel
      Left = 2
      Top = 114
      Width = 261
      Height = 19
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
    end
    object EditAddText: TcxMaskEdit
      Left = 5
      Top = 132
      Width = 256
      Height = 24
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 9
      OnKeyPress = EditAddTextKeyPress
    end
  end
  object YesBtn: TcxButton
    Left = 104
    Top = 159
    Width = 75
    Height = 22
    Caption = 'YesBtn'
    Default = True
    TabOrder = 1
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 184
    Top = 159
    Width = 75
    Height = 22
    Cancel = True
    Caption = 'CancelBtn'
    TabOrder = 2
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 151
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 151
  end
  object StoredProc: TpFIBStoredProc
    Left = 64
    Top = 151
  end
end
