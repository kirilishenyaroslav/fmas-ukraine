object PrK_PROT_ZACH_SelFakDepForm: TPrK_PROT_ZACH_SelFakDepForm
  Left = 213
  Top = 106
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'PrK_PROT_ZACH_SelFakDepForm'
  ClientHeight = 304
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 265
    Align = alTop
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 420
      Height = 263
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        DataController.DataSource = DSource1
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.CellHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cmnNAME_FAK: TcxGridDBColumn
          HeaderAlignmentHorz = taCenter
          DataBinding.FieldName = 'NAME_FAK'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object cxButton1: TcxButton
    Left = 112
    Top = 272
    Width = 97
    Height = 25
    Action = SelectA
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 216
    Top = 272
    Width = 97
    Height = 25
    Action = CancelA
    TabOrder = 2
  end
  object DB: TpFIBDatabase
    DBName = 'D:\Yatsishin\FILES\DB\UO_FULL_DB_POLTAVA.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 64
    Top = 8
  end
  object DSet1: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_SP_DEPARTMENT_FAK,'
      '    NAME_FAK,'
      '    SHORT_NAME_FAK,'
      '    NPP,'
      '    ID_DEPARTMENT'
      'FROM'
      '    PRK_FND_PRIK_ZACH_FAK_SELECT'
      '    ('
      '    ?ID_SP_GOD_NABORA'
      '    ) ')
    Left = 128
    Top = 8
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 96
    Top = 8
  end
  object DSource1: TDataSource
    DataSet = DSet1
    Left = 160
    Top = 8
  end
  object ActionList1: TActionList
    Left = 72
    Top = 248
    object SelectA: TAction
      Caption = 'SelectA'
      ShortCut = 121
      OnExecute = SelectAExecute
    end
    object CancelA: TAction
      Caption = 'CancelA'
      ShortCut = 27
      OnExecute = CancelAExecute
    end
  end
end
