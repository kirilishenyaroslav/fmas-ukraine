object FSort: TFSort
  Left = 779
  Top = 320
  BorderStyle = bsDialog
  Caption = 'FSort'
  ClientHeight = 136
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 216
    Top = 114
    Width = 73
    Height = 21
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 296
    Top = 114
    Width = 73
    Height = 21
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object RadioGroupOrder: TcxRadioGroup
    Left = 0
    Top = 80
    Width = 385
    Height = 33
    ItemIndex = 1
    Properties.Columns = 2
    Properties.Items = <
      item
      end
      item
      end>
    TabOrder = 2
  end
  object GroupBank: TcxGroupBox
    Left = 0
    Top = 0
    Width = 385
    Height = 41
    Alignment = alTopLeft
    Caption = 'GroupBank'
    TabOrder = 3
    object BankEdit: TcxButtonEdit
      Left = 8
      Top = 16
      Width = 369
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = BankEditPropertiesButtonClick
      TabOrder = 0
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 40
    Width = 385
    Height = 41
    Alignment = alTopLeft
    TabOrder = 4
    object EditDate: TcxDateEdit
      Left = 144
      Top = 16
      Width = 233
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object CheckBoxDate: TcxCheckBox
      Left = 5
      Top = 16
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Left = 24
    Top = 112
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
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    DefaultUpdateTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 104
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 104
  end
  object StProc: TpFIBStoredProc
    Database = DB
    Transaction = Transaction
    Left = 136
    Top = 104
  end
end
