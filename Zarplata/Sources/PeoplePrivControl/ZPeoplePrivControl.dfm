object FZPeoplePrivControl: TFZPeoplePrivControl
  Left = 383
  Top = 429
  BorderStyle = bsDialog
  Caption = 'ZPeoplePrivControl'
  ClientHeight = 157
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 336
    Top = 128
    Width = 81
    Height = 25
    Action = Action1
    Default = True
    TabOrder = 3
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 424
    Top = 128
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object BoxOptions: TcxGroupBox
    Left = 0
    Top = 77
    Width = 553
    Height = 44
    Alignment = alTopLeft
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object EditDateEnd: TcxDateEdit
      Left = 359
      Top = 13
      Width = 97
      Height = 24
      Properties.DateOnError = deToday
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 2
      EditValue = 38353d
    end
    object EditDateBeg: TcxDateEdit
      Left = 265
      Top = 13
      Width = 97
      Height = 24
      Properties.DateButtons = [btnToday]
      Properties.MaxDate = 55153.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 1
      EditValue = 38353d
    end
    object DateBegLabel: TcxLabel
      Left = 162
      Top = 14
      Width = 105
      Height = 20
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
    object DateEndLabel: TcxLabel
      Left = 456
      Top = 15
      Width = 91
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object LabelAmountPriv: TcxLabel
      Left = 8
      Top = 15
      Width = 114
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = 'LabelAmountPriv'
    end
    object SpinEditPrivAmount: TcxSpinEdit
      Left = 121
      Top = 13
      Width = 57
      Height = 24
      Properties.MaxValue = 1000.000000000000000000
      TabOrder = 0
    end
  end
  object BoxMan: TcxGroupBox
    Left = 0
    Top = -3
    Width = 553
    Height = 41
    Alignment = alTopLeft
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object EditMan: TcxButtonEdit
      Left = 136
      Top = 13
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
          Visible = False
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditManPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 0
    end
    object LabelMan: TcxLabel
      Left = 0
      Top = 15
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = 'LabelMan'
    end
  end
  object BoxPriv: TcxGroupBox
    Left = 0
    Top = 37
    Width = 553
    Height = 41
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object LabelPrivilege: TcxLabel
      Left = 0
      Top = 15
      Width = 137
      Height = 20
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = 'LabelPrivilege'
    end
    object EditPrivilege: TcxButtonEdit
      Left = 136
      Top = 13
      Width = 409
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.MaskKind = emkRegExpr
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditPrivilegePropertiesButtonClick
      TabOrder = 1
    end
  end
  object DataBase: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 128
  end
  object DSet: TpFIBDataSet
    Database = DataBase
    Transaction = DefaultTransaction
    Left = 64
    Top = 128
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 32
    Top = 128
  end
  object DSource: TDataSource
    DataSet = DSet
    Left = 96
    Top = 128
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    Left = 128
    Top = 128
  end
  object StoredProc: TpFIBStoredProc
    Database = DataBase
    Transaction = WriteTransaction
    Left = 160
    Top = 128
  end
  object Actions: TActionList
    Left = 192
    Top = 128
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
  end
end
