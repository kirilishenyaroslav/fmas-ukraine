object FAddReport: TFAddReport
  Left = 344
  Top = 280
  BorderStyle = bsDialog
  Caption = 'FAddReport'
  ClientHeight = 112
  ClientWidth = 277
  Color = clBtnFace
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
    Width = 277
    Height = 81
    Align = alTop
  end
  object SpinEditKvartal: TcxSpinEdit
    Left = 112
    Top = 8
    Width = 33
    Height = 21
    ParentFont = False
    Properties.CanEdit = False
    Properties.MaxValue = 4.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
    Value = 1
  end
  object SpinEditYear: TcxSpinEdit
    Left = 216
    Top = 8
    Width = 57
    Height = 21
    ParentFont = False
    Properties.CanEdit = False
    Properties.MaxValue = 2100.000000000000000000
    Properties.MinValue = 2000.000000000000000000
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
    Value = 2000
  end
  object LabelYear: TcxLabel
    Left = 152
    Top = 10
    Width = 65
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object LabelKvartal: TcxLabel
    Left = 8
    Top = 10
    Width = 97
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object YesBtn: TcxButton
    Left = 119
    Top = 88
    Width = 75
    Height = 24
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 199
    Top = 88
    Width = 75
    Height = 24
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
  end
  object CheckBoxPTin: TcxCheckBox
    Left = 8
    Top = 55
    Width = 265
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 'F'
    Properties.ValueUnchecked = 'T'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object LookupComboBoxTypes: TcxLookupComboBox
    Left = 112
    Top = 32
    Width = 161
    Height = 21
    ParentFont = False
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_TYPE'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DSourceTypes
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
  end
  object LabelType: TcxLabel
    Left = 8
    Top = 34
    Width = 97
    Height = 17
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
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 184
  end
  object StProcTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 184
    Top = 32
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = StProcTransaction
    Left = 152
    Top = 32
  end
  object ActionList: TActionList
    Left = 8
    Top = 8
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
  object DSetTypes: TpFIBDataSet
    Database = DB
    Transaction = StProcTransaction
    UpdateTransaction = ReadTransaction
    Left = 232
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 232
    Top = 32
  end
  object DSourceTypes: TDataSource
    DataSet = DSetTypes
    Left = 232
    Top = 64
  end
end
