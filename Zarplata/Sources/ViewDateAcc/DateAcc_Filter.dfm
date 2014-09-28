object ZDatesAccFilter: TZDatesAccFilter
  Left = 401
  Top = 177
  BorderStyle = bsDialog
  Caption = 'ZDatesAccFilter'
  ClientHeight = 136
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 312
    Top = 112
    Width = 73
    Height = 23
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 392
    Top = 112
    Width = 73
    Height = 23
    Action = ActionCancel
    Cancel = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
  end
  object BoxKodSetup: TcxGroupBox
    Left = 0
    Top = 0
    Width = 481
    Height = 37
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object MonthesList1: TcxComboBox
      Left = 73
      Top = 10
      Width = 120
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 0
    end
    object YearSpinEdit1: TcxSpinEdit
      Left = 188
      Top = 10
      Width = 51
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 1
      Value = 2000
    end
    object MonthesList2: TcxComboBox
      Left = 317
      Top = 10
      Width = 108
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 2
    end
    object YearSpinEdit2: TcxSpinEdit
      Left = 422
      Top = 10
      Width = 51
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 3
      Value = 2000
    end
    object LabelFrom: TcxLabel
      Left = 2
      Top = 12
      Width = 73
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 4
    end
    object LabelTo: TcxLabel
      Left = 245
      Top = 12
      Width = 74
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 5
    end
  end
  object BoxDataFilter: TcxGroupBox
    Left = 0
    Top = 72
    Width = 481
    Height = 36
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object EditDataFilter: TcxButtonEdit
      Left = 80
      Top = 10
      Width = 395
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditDataFilterPropertiesButtonClick
      TabOrder = 0
    end
    object EdCodeDataFilter: TcxTextEdit
      Left = 9
      Top = 10
      Width = 65
      Height = 21
      TabOrder = 1
      OnExit = EdCodeDataFilterExit
    end
  end
  object FilterType: TcxRadioGroup
    Left = 0
    Top = 38
    Width = 481
    Height = 33
    ItemIndex = 3
    ParentFont = False
    Properties.Columns = 4
    Properties.Items = <
      item
      end
      item
      end
      item
      end
      item
      end>
    Properties.OnChange = FilterTypePropertiesChange
    TabOrder = 1
    Caption = ''
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 104
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 48
    Top = 105
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 80
    Top = 105
  end
  object ActionList: TActionList
    Left = 112
    Top = 104
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
end
