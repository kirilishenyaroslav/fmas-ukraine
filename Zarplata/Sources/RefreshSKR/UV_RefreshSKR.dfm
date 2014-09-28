object FRefreshSKR: TFRefreshSKR
  Left = 255
  Top = 286
  BorderStyle = bsDialog
  Caption = 'FRefreshSKR'
  ClientHeight = 108
  ClientWidth = 484
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
    Width = 484
    Height = 59
    Align = alTop
    Shape = bsFrame
  end
  object BankBtnEdit: TcxButtonEdit
    Left = 120
    Top = 8
    Width = 361
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BankBtnEditPropertiesButtonClick
    TabOrder = 0
  end
  object FileBtnEdit: TcxButtonEdit
    Left = 120
    Top = 32
    Width = 361
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = FileBtnEditPropertiesButtonClick
    TabOrder = 1
  end
  object YesBtn: TcxButton
    Left = 272
    Top = 82
    Width = 75
    Height = 23
    Caption = 'YesBtn'
    TabOrder = 2
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 368
    Top = 82
    Width = 75
    Height = 23
    Caption = 'CancelBtn'
    ModalResult = 2
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object LabelBank: TcxLabel
    Left = 1
    Top = 10
    Width = 121
    Height = 17
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 4
  end
  object LabelFile: TcxLabel
    Left = 1
    Top = 34
    Width = 121
    Height = 17
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 5
  end
  object CheckBoxNewFieldsDBFtable: TcxCheckBox
    Left = 0
    Top = 60
    Width = 481
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 6
    OnClick = CheckBoxNewFieldsDBFtableClick
  end
  object OpenFile: TOpenDialog
    Filter = 'dbf - Tables|*.dbf|All Files|*.*'
    Left = 24
    Top = 56
  end
  object DB: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 72
    Top = 56
  end
  object Tran: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 112
    Top = 56
  end
  object StProc1: TpFIBStoredProc
    Database = DB
    Transaction = Tran
    Left = 160
    Top = 56
  end
  object StProc2: TpFIBStoredProc
    Database = DB
    Transaction = Tran
    Left = 192
    Top = 56
  end
  object StProc3: TpFIBStoredProc
    Database = DB
    Transaction = Tran
    Left = 224
    Top = 56
  end
end
