object frtest: Tfrtest
  Left = 262
  Top = 150
  Width = 696
  Height = 480
  Caption = 'frtest'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 32
    Width = 657
    Height = 265
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Visible = False
        GroupIndex = 0
        SortOrder = soDescending
        DataBinding.FieldName = 'NAME_PRICE'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        GroupIndex = 1
        SortOrder = soDescending
        DataBinding.FieldName = 'ID_YEAR'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 336
    Top = 8
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'SELECT * '
      'FROM CN_PRICES_REESTR A '
      'WHERE A.ID_PRICE=:Id_Price')
    Left = 400
    Top = 8
    poSQLINT64ToBCD = True
    object pFIBDataSet1ID_PRICE: TFIBBCDField
      FieldName = 'ID_PRICE'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSet1NAME_PRICE: TFIBStringField
      FieldName = 'NAME_PRICE'
      Size = 60
      EmptyStrToNull = True
    end
    object pFIBDataSet1ID_YEAR: TFIBBCDField
      FieldName = 'ID_YEAR'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSet1BEG_DATE: TFIBDateField
      FieldName = 'BEG_DATE'
    end
    object pFIBDataSet1END_DATE: TFIBDateField
      FieldName = 'END_DATE'
    end
    object pFIBDataSet1USE_BEG: TFIBDateField
      FieldName = 'USE_BEG'
    end
    object pFIBDataSet1USE_END: TFIBDateField
      FieldName = 'USE_END'
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 368
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 440
    Top = 8
  end
end
