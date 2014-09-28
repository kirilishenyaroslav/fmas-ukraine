object FZForm: TFZForm
  Left = 207
  Top = 222
  BorderStyle = bsNone
  Caption = 'FZForm'
  ClientHeight = 287
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 312
    Top = 240
    Width = 75
    Height = 25
    Caption = #1058#1072#1082
    TabOrder = 0
    OnClick = YesBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 392
    Top = 240
    Width = 75
    Height = 25
    Caption = #1042#1080#1081#1090#1080
    TabOrder = 1
    OnClick = CancelBtnClick
    LookAndFeel.Kind = lfFlat
  end
  object GridProc: TcxGrid
    Left = 0
    Top = 0
    Width = 250
    Height = 200
    TabOrder = 2
    object GridProcDBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      object ClNameProc: TcxGridDBColumn
      end
      object ClDescribeProc: TcxGridDBColumn
      end
    end
    object GridProcLevel1: TcxGridLevel
      GridView = GridProcDBTableView1
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 152
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 240
    Top = 152
  end
  object Query: TpFIBQuery
    Database = DB
    Transaction = Transaction
    Left = 208
    Top = 152
  end
  object DSetProcs: TpFIBDataSet
    Database = DB
    Transaction = Transaction
    Left = 72
    Top = 152
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 40
    Top = 152
  end
end
