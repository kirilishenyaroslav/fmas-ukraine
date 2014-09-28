object FAlimonyControl: TFAlimonyControl
  Left = 456
  Top = 260
  BorderStyle = bsDialog
  Caption = 'FAlimonyControl'
  ClientHeight = 487
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object IdentificationBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 425
    Height = 73
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LookAndFeel.NativeStyle = False
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object PeopleLabel: TcxLabel
      Left = 8
      Top = 18
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'PeopleLabel'
    end
    object PeopleEdit: TcxButtonEdit
      Left = 8
      Top = 40
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      TabOrder = 0
    end
  end
  object OptionsBox: TcxGroupBox
    Left = 0
    Top = 72
    Width = 425
    Height = 177
    Alignment = alTopLeft
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
      Top = 138
      Width = 409
      Height = 3
      Style = bsRaised
    end
    object Bevel4: TBevel
      Left = 8
      Top = 78
      Width = 409
      Height = 3
      Style = bsRaised
    end
    object Bevel1: TBevel
      Left = 8
      Top = 43
      Width = 409
      Height = 3
      Style = bsRaised
    end
    object MaxPercentLabel: TcxLabel
      Left = 0
      Top = 87
      Width = 345
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
      Caption = 'MaxPercentLabel'
    end
    object PercentLabel: TcxLabel
      Left = 1
      Top = 113
      Width = 344
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = 'PercentLabel'
    end
    object PochtaPercentLabel: TcxLabel
      Left = 8
      Top = 150
      Width = 281
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Caption = 'PochtaPercentLabel'
    end
    object PochtaPercentEdit: TcxMaskEdit
      Left = 288
      Top = 148
      Width = 65
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '100,00 | \d\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 4
    end
    object maxPercentEdit: TcxMaskEdit
      Left = 344
      Top = 84
      Width = 65
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '100,00 | \d\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 2
    end
    object PercentEdit: TcxMaskEdit
      Left = 344
      Top = 111
      Width = 65
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '100,00 | \d\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 3
    end
    object DolgEdit: TcxMaskEdit
      Left = 288
      Top = 52
      Width = 129
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
      Properties.MaxLength = 0
      TabOrder = 1
    end
    object DolgLabel: TcxLabel
      Left = 8
      Top = 54
      Width = 281
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
      Caption = 'DolgLabel'
    end
    object DocumentEdit: TcxMaskEdit
      Left = 288
      Top = 14
      Width = 129
      Height = 24
      TabOrder = 0
    end
    object DocumentLabel: TcxLabel
      Left = 16
      Top = 16
      Width = 271
      Height = 19
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
    end
  end
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = 248
    Width = 425
    Height = 81
    Alignment = alTopLeft
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
      Properties.DateButtons = [btnToday]
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
  object YesBtn: TcxButton
    Left = 248
    Top = 459
    Width = 81
    Height = 25
    Action = Action1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 336
    Top = 459
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object SendBox: TcxGroupBox
    Left = 0
    Top = 328
    Width = 425
    Height = 129
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    LookAndFeel.NativeStyle = False
    ParentFont = False
    TabOrder = 3
    TabStop = False
    object Bevel3: TBevel
      Left = 8
      Top = 70
      Width = 409
      Height = 3
      Style = bsRaised
    end
    object SendPeopleLabel: TcxLabel
      Left = 8
      Top = 18
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = 'SendPeopleLabel'
    end
    object SendAdressLabel: TcxLabel
      Left = 8
      Top = 75
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
      Caption = 'SendAdressLabel'
    end
    object SendPeopleEdit: TcxMaskEdit
      Left = 8
      Top = 40
      Width = 409
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      TabOrder = 0
    end
    object SendAdressEdit: TcxMaskEdit
      Left = 8
      Top = 96
      Width = 409
      Height = 24
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 184
    Top = 456
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 13
      OnExecute = Action2Execute
    end
  end
end
