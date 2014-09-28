object FSp_People_Prop_Control: TFSp_People_Prop_Control
  Left = 387
  Top = 257
  BorderStyle = bsDialog
  Caption = 'FSp_People_Prop_Control'
  ClientHeight = 256
  ClientWidth = 428
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
    Height = 69
    Alignment = alTopLeft
    Enabled = False
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
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'PeopleLabel'
    end
    object PeopleEdit: TcxMaskEdit
      Left = 8
      Top = 40
      Width = 409
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      TabOrder = 0
    end
  end
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = 68
    Width = 425
    Height = 149
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = False
    object Bevel1: TBevel
      Left = 8
      Top = 109
      Width = 409
      Height = 3
      Style = bsRaised
    end
    object PropLabel: TcxLabel
      Left = 6
      Top = 15
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = 'PropLabel'
    end
    object PropEdit: TcxLookupComboBox
      Left = 8
      Top = 35
      Width = 409
      Height = 24
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 1
    end
    object DateBegLabel: TcxLabel
      Left = 8
      Top = 118
      Width = 113
      Height = 19
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object DateBeg: TcxDateEdit
      Left = 120
      Top = 116
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      TabOrder = 3
      EditValue = 0d
    end
    object DateEndLabel: TcxLabel
      Left = 312
      Top = 117
      Width = 105
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object DateEnd: TcxDateEdit
      Left = 214
      Top = 116
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 37987.000000000000000000
      TabOrder = 5
      EditValue = 37987d
    end
    object PrikazLabel: TcxLabel
      Left = 6
      Top = 63
      Width = 409
      Height = 20
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1053#1072#1082#1072#1079
    end
    object PrikazEdit: TcxTextEdit
      Left = 8
      Top = 83
      Width = 409
      Height = 24
      TabOrder = 7
    end
  end
  object YesBtn: TcxButton
    Left = 240
    Top = 224
    Width = 81
    Height = 25
    Action = ActionYes
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 336
    Top = 224
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object Actions: TActionList
    Left = 312
    Top = 224
    object ActionYes: TAction
      Caption = 'ActionIns'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
  end
end
