object FZTaxesTerms: TFZTaxesTerms
  Left = 718
  Top = 605
  BorderStyle = bsDialog
  Caption = 'FZTaxesTerms'
  ClientHeight = 101
  ClientWidth = 298
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
    Top = 0
    Width = 297
    Height = 73
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object PeriodBegLabel: TcxLabel
      Left = 6
      Top = 17
      Width = 121
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = 'PeriodBegLabel'
    end
    object MonthesListBeg: TcxComboBox
      Left = 125
      Top = 15
      Width = 105
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      Properties.ReadOnly = False
      TabOrder = 0
    end
    object YearSpinEditBeg: TcxSpinEdit
      Left = 227
      Top = 15
      Width = 60
      Height = 24
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxValue = 2050.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 1
      Value = 1995
      OnKeyDown = YearSpinEditBegKeyDown
      OnKeyPress = YearSpinEditBegKeyPress
    end
    object PeriodEndLabel: TcxLabel
      Left = 7
      Top = 44
      Width = 121
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = 'PeriodEndLabel'
    end
    object MonthesListEnd: TcxComboBox
      Left = 125
      Top = 42
      Width = 105
      Height = 24
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 4
    end
    object YearSpinEditEnd: TcxSpinEdit
      Left = 227
      Top = 42
      Width = 60
      Height = 24
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxValue = 2050.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 5
      Value = 1995
      OnKeyDown = YearSpinEditEndKeyDown
      OnKeyPress = YearSpinEditEndKeyPress
    end
  end
  object YesBtn: TcxButton
    Left = 120
    Top = 76
    Width = 75
    Height = 24
    Caption = 'YesBtn'
    Default = True
    TabOrder = 1
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 208
    Top = 76
    Width = 75
    Height = 24
    Cancel = True
    Caption = 'CancelBtn'
    TabOrder = 2
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 72
  end
  object StoredProc: TpFIBStoredProc
    Left = 64
    Top = 72
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 72
  end
end
