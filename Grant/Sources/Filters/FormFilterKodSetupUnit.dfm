object FormFilterKodSetup: TFormFilterKodSetup
  Left = 571
  Top = 145
  BorderStyle = bsDialog
  Caption = 'FormFilterKodSetup'
  ClientHeight = 91
  ClientWidth = 208
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object YesBtn: TcxButton
    Left = 64
    Top = 64
    Width = 67
    Height = 25
    Action = ActionYesF10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 6
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 136
    Top = 64
    Width = 67
    Height = 25
    Caption = 'CancelBtn'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object PeriodLabel: TcxLabel
    Left = 4
    Top = 12
    Width = 197
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
    Caption = 'PeriodLabel'
  end
  object MonthesList: TcxComboBox
    Left = 3
    Top = 34
    Width = 145
    Height = 24
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'January'
      'February')
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 3
  end
  object YearSpinEdit: TcxSpinEdit
    Left = 145
    Top = 34
    Width = 60
    Height = 24
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.MaxValue = 2100.000000000000000000
    Properties.MinValue = 1995.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 4
    Value = 2000
  end
  object Actions: TActionList
    Left = 8
    Top = 56
    object ActionYesF10: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesF10Execute
    end
    object ActionYesCtrlEnd: TAction
      Caption = 'ActionYesCtrlEnd'
      ShortCut = 16419
      OnExecute = ActionYesF10Execute
    end
  end
end
