object FRecountCtrl: TFRecountCtrl
  Left = 288
  Top = 192
  BorderStyle = bsDialog
  Caption = 'FRecountCtrl'
  ClientHeight = 106
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clGreen
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 72
    Width = 423
    Height = 2
    Shape = bsBottomLine
  end
  object BoxKodSetup: TcxGroupBox
    Left = 0
    Top = 32
    Width = 423
    Height = 37
    Alignment = alTopLeft
    TabOrder = 1
    TabStop = False
    object MonthesList1: TcxComboBox
      Left = 5
      Top = 10
      Width = 148
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 0
    end
    object YearSpinEdit1: TcxSpinEdit
      Left = 150
      Top = 10
      Width = 49
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 1
      Value = 2000
    end
    object MonthesList2: TcxComboBox
      Left = 223
      Top = 10
      Width = 148
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 2
    end
    object YearSpinEdit2: TcxSpinEdit
      Left = 368
      Top = 10
      Width = 49
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.CanEdit = False
      Properties.MaxValue = 2100.000000000000000000
      Properties.MinValue = 1995.000000000000000000
      TabOrder = 3
      Value = 2000
    end
    object cxLabel1: TcxLabel
      Left = 196
      Top = 12
      Width = 29
      Height = 17
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = '-'
    end
  end
  object BoxIdMan: TcxGroupBox
    Left = 0
    Top = -2
    Width = 423
    Height = 36
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object EditMan: TcxButtonEdit
      Left = 5
      Top = 10
      Width = 63
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = EditManPropertiesButtonClick
      TabOrder = 0
    end
    object LabelManData: TcxLabel
      Left = 65
      Top = 10
      Width = 352
      Height = 21
      AutoSize = False
      ParentColor = False
      Style.BorderColor = clHotLight
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      TabOrder = 1
      Caption = ''
    end
  end
  object YesBtn: TcxButton
    Left = 248
    Top = 80
    Width = 75
    Height = 25
    Action = ActionYes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 328
    Top = 80
    Width = 75
    Height = 25
    Action = ActionCancel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    DefaultUpdateTransaction = UpdateTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 78
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 78
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = UpdateTransaction
    Left = 72
    Top = 78
  end
  object ActionList: TActionList
    Left = 104
    Top = 80
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    UpdateTransaction = UpdateTransaction
    Left = 168
    Top = 80
    poSQLINT64ToBCD = True
  end
  object UpdateTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 80
  end
end
