object ValyutaForm: TValyutaForm
  Left = 399
  Top = 316
  Width = 409
  Height = 409
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1074#1072#1083#1102#1090#1080
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 401
    Height = 336
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ds1: TDataSource
    DataSet = DS
    Left = 14
    Top = 104
  end
  object StPr: TpFIBStoredProc
    Database = DB
    Transaction = TR
    Left = 16
    Top = 133
  end
  object TR: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 46
    Top = 133
  end
  object DS: TpFIBDataSet
    Database = DB
    Transaction = TR
    SelectSQL.Strings = (
      'SELECT * FROM PC_SP_SCH_FOR_SYSTEM')
    Left = 78
    Top = 136
    poSQLINT64ToBCD = True
  end
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = TR
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 81
    Top = 168
  end
end
