object FormSp_PrivilegesControl: TFormSp_PrivilegesControl
  Left = 390
  Top = 243
  BorderStyle = bsDialog
  Caption = 'FormSp_PrivilegesControl'
  ClientHeight = 339
  ClientWidth = 425
  Color = clActiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IdentificationBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 425
    Height = 105
    Alignment = alTopLeft
    Caption = 'IdentificationBox'
    CaptionBkColor = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LookAndFeel.NativeStyle = False
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object Bevel1: TBevel
      Left = 8
      Top = 46
      Width = 409
      Height = 3
      Style = bsRaised
    end
    object KodLabel: TcxLabel
      Left = 8
      Top = 18
      Width = 73
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object NameLabel: TcxLabel
      Left = 8
      Top = 51
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object KodEdit: TcxMaskEdit
      Left = 80
      Top = 16
      Width = 65
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      TabOrder = 0
      OnKeyPress = KodEditKeyPress
    end
    object NameEdit: TcxMaskEdit
      Left = 8
      Top = 72
      Width = 409
      Height = 24
      TabOrder = 1
      OnKeyPress = NameEditKeyPress
    end
  end
  object YesBtn: TcxButton
    Left = 224
    Top = 312
    Width = 81
    Height = 25
    Action = Action1
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 320
    Top = 312
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = 224
    Width = 425
    Height = 81
    Alignment = alTopLeft
    Caption = 'PeriodBox'
    CaptionBkColor = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object DateEnd: TcxDateEdit
      Left = 256
      Top = 48
      Width = 97
      Height = 24
      Properties.DateOnError = deToday
      TabOrder = 1
      EditValue = 0d
    end
    object DateBeg: TcxDateEdit
      Left = 319
      Top = 15
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      TabOrder = 0
      EditValue = 0d
    end
    object DateBegLabel: TcxLabel
      Left = 8
      Top = 19
      Width = 305
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object DateEndLabel: TcxLabel
      Left = 8
      Top = 52
      Width = 241
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
  end
  object OptionsBox: TcxGroupBox
    Left = 0
    Top = 104
    Width = 425
    Height = 121
    Alignment = alTopLeft
    Caption = 'OptionsBox'
    CaptionBkColor = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object Bevel2: TBevel
      Left = 8
      Top = 78
      Width = 409
      Height = 3
      Style = bsRaised
    end
    object MinSpinEdit: TcxSpinEdit
      Left = 376
      Top = 16
      Width = 41
      Height = 24
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 10.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 0
      Value = 1
      OnExit = MinSpinEditExit
    end
    object MaxSpinEdit: TcxSpinEdit
      Left = 376
      Top = 48
      Width = 41
      Height = 24
      Properties.CanEdit = False
      Properties.MaxValue = 10.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.ReadOnly = False
      TabOrder = 1
      Value = 1
      OnEnter = MaxSpinEditEnter
    end
    object MinLabel: TcxLabel
      Left = 8
      Top = 19
      Width = 361
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = 'MinLabel'
    end
    object MaxLabel: TcxLabel
      Left = 9
      Top = 50
      Width = 360
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = 'MaxLabel'
    end
    object KoefficientLabel: TcxLabel
      Left = 8
      Top = 90
      Width = 233
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object KoefficientEdit: TcxMaskEdit
      Left = 240
      Top = 88
      Width = 65
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 2
    end
  end
  object LabelKodPriv1DF: TcxLabel
    Left = 208
    Top = 18
    Width = 137
    Height = 20
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object MaskEditKodPriv1DF: TcxMaskEdit
    Left = 344
    Top = 17
    Width = 65
    Height = 21
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d+'
    Properties.MaxLength = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
    OnKeyPress = KodEditKeyPress
  end
  object ActionList1: TActionList
    Left = 352
    Top = 304
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
