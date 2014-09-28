object FSp_People_WorkMode_Control: TFSp_People_WorkMode_Control
  Left = 320
  Top = 223
  BorderStyle = bsDialog
  Caption = 'FSp_People_WorkMode_Control'
  ClientHeight = 410
  ClientWidth = 437
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
    Height = 161
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
    object WorkDogLabel: TcxLabel
      Left = 8
      Top = 66
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
      TabOrder = 2
      Caption = 'WorkDogLabel'
    end
    object cxMaskEdit1: TcxMaskEdit
      Left = 8
      Top = 88
      Width = 409
      Height = 24
      Properties.Alignment.Horz = taRightJustify
      Properties.MaskKind = emkRegExpr
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      TabOrder = 3
    end
  end
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = 112
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
    object WorkModeLabel: TcxLabel
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
    object PropEdit: TcxLookupComboBox
      Left = 8
      Top = 35
      Width = 409
      Height = 24
      Properties.ListColumns = <>
      Properties.ListOptions.ShowHeader = False
      Properties.ReadOnly = False
      Properties.OnChange = PropEditPropertiesChange
      Properties.OnCloseUp = PropEditPropertiesCloseUp
      Properties.OnEditValueChanged = PropEditPropertiesEditValueChanged
      EditValue = 0
      TabOrder = 1
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
      TabOrder = 2
    end
    object DateBeg: TcxDateEdit
      Left = 120
      Top = 68
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.OnChange = DateBegPropertiesChange
      Properties.OnEditValueChanged = DateBegPropertiesEditValueChanged
      TabOrder = 3
      EditValue = 0d
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
      TabOrder = 4
    end
    object DateEnd: TcxDateEdit
      Left = 214
      Top = 68
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 37987.000000000000000000
      Properties.OnChange = DateEndPropertiesChange
      Properties.OnEditValueChanged = DateEndPropertiesEditValueChanged
      TabOrder = 5
      EditValue = 37987d
    end
  end
  object YesBtn: TcxButton
    Left = 240
    Top = 376
    Width = 81
    Height = 25
    Action = ActionYes
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 328
    Top = 376
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object Panel1: TPanel
    Left = 0
    Top = 208
    Width = 425
    Height = 65
    BevelOuter = bvNone
    TabOrder = 4
    object cxLabel1: TcxLabel
      Left = 8
      Top = 2
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
      TabOrder = 0
      Caption = #1047#1089#1091#1074
    end
    object cxTextEdit1: TcxTextEdit
      Left = 296
      Top = 26
      Width = 89
      Height = 21
      Properties.OnEditValueChanged = cxTextEdit1PropertiesEditValueChanged
      TabOrder = 1
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 385
      Top = 26
      Width = 16
      Height = 21
      Associate = cxTextEdit1
      TabOrder = 2
    end
  end
  object WorkModeGrid: TStringGrid
    Left = 16
    Top = 272
    Width = 401
    Height = 90
    ColCount = 2
    DefaultColWidth = 40
    DefaultRowHeight = 20
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssHorizontal
    TabOrder = 5
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
