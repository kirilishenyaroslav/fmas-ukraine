object FPeople_Prop_ByPeriod1: TFPeople_Prop_ByPeriod1
  Left = 387
  Top = 257
  BorderStyle = bsDialog
  Caption = 'FPeople_Prop_ByPeriod1'
  ClientHeight = 149
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
  PixelsPerInch = 96
  TextHeight = 13
  object PeriodBox: TcxGroupBox
    Left = 0
    Top = -1
    Width = 425
    Height = 149
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object Bevel1: TBevel
      Left = 8
      Top = 69
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
      Top = 78
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
      Top = 75
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      TabOrder = 3
      EditValue = 0d
    end
    object DateEndLabel: TcxLabel
      Left = 312
      Top = 76
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
      Top = 75
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.DateOnError = deToday
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 37987.000000000000000000
      TabOrder = 5
      EditValue = 37987d
    end
  end
  object YesBtn: TcxButton
    Left = 240
    Top = 112
    Width = 81
    Height = 25
    Action = ActionYes
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 336
    Top = 112
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object Actions: TActionList
    Left = 160
    Top = 112
    object ActionYes: TAction
      Caption = 'ActionIns'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
  end
end
