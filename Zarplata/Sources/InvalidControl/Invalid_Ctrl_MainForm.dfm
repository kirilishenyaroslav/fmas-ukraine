object FSp_Invalid_Control: TFSp_Invalid_Control
  Left = 206
  Top = 141
  BorderStyle = bsDialog
  Caption = 'FSp_Invalid_Control'
  ClientHeight = 195
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
    Height = 98
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
      Top = 61
      Width = 409
      Height = 3
      Style = bsRaised
    end
    object NoteLabel: TcxLabel
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
    end
    object DateBegLabel: TcxLabel
      Left = 8
      Top = 70
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
      TabOrder = 1
    end
    object DateBeg: TcxDateEdit
      Left = 120
      Top = 68
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.MaxDate = 73415.000000000000000000
      Properties.MinDate = 2.000000000000000000
      TabOrder = 2
      EditValue = 36526d
    end
    object DateEndLabel: TcxLabel
      Left = 312
      Top = 69
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
      TabOrder = 3
    end
    object DateEnd: TcxDateEdit
      Left = 214
      Top = 68
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.MaxDate = 73415.000000000000000000
      Properties.MinDate = 2.000000000000000000
      TabOrder = 4
      EditValue = 37987d
    end
    object NoteEdit: TcxMaskEdit
      Left = 8
      Top = 34
      Width = 409
      Height = 24
      TabOrder = 5
      OnKeyPress = NoteEditKeyPress
    end
  end
  object YesBtn: TcxButton
    Left = 240
    Top = 168
    Width = 81
    Height = 25
    Action = ActionYes
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 336
    Top = 168
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
    Top = 168
    object ActionYes: TAction
      Caption = 'ActionIns'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
  end
end
