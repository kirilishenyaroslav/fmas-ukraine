object dmShtat2Report: TdmShtat2Report
  OldCreateOrder = False
  Left = 471
  Top = 119
  Height = 576
  Width = 467
  object Get_SR_Date: TIBQuery
    Database = Database
    Transaction = ReadTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Date_Beg'
      'FROM Dt_SR'
      'WHERE Id_SR = :Id_SR')
    Left = 312
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_SR'
        ParamType = ptUnknown
      end>
  end
  object ShtatDataset: TfrDBDataSet
    DataSet = ReportQuery
    Left = 208
    Top = 96
  end
  object DeptQuery: TIBQuery
    Database = Database
    Transaction = ReadTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT Name_Short, Name_Full FROM '
      'Get_Departments(:Root, :Cur_Time)'
      'WHERE Id_Department = :Id_Department')
    Left = 384
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Root'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cur_Time'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Id_Department'
        ParamType = ptUnknown
      end>
  end
  object ReportQuery: TIBQuery
    Database = Database
    Transaction = ReadTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM ShtatRas_Report'
      '(:Id_Department,1,:MaxNest,:Cur_Time,:Vacancies, :Id_SR)')
    Left = 272
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Department'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MaxNest'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cur_Time'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vacancies'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Id_SR'
        ParamType = ptUnknown
      end>
  end
  object ShtatReport: TfrReport
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    RebuildPrinter = False
    Left = 200
    Top = 16
    ReportForm = {19000000}
  end
  object Database: TIBDatabase
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 16
  end
  object DefaultTransaction: TIBTransaction
    Active = False
    DefaultDatabase = Database
    AutoStopAction = saNone
    Left = 48
    Top = 104
  end
  object ReadTransaction: TIBTransaction
    Active = False
    DefaultDatabase = Database
    AutoStopAction = saNone
    Left = 48
    Top = 176
  end
  object Consts_Query: TIBQuery
    Database = Database
    Transaction = ReadTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM Ini_Asup_Consts')
    Left = 192
    Top = 192
  end
  object WorkTimeQuery: TIBQuery
    Database = Database
    Transaction = ReadTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT WtMonth, Kol_Hours'
      'FROM Dt_WorkTimeNorm WHERE WtYear = :WtYear')
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WtYear'
        ParamType = ptUnknown
      end>
  end
  object ReportDS: TDataSource
    DataSet = ReportQuery
    Left = 40
    Top = 240
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DataSet = Image.Owner
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39111.494462858800000000
    ReportOptions.LastChange = 39111.494462858800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 144
    Top = 288
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object ConstsDS: TDataSource
    DataSet = Consts_Query
    Left = 248
    Top = 328
  end
  object frxConstsData: TfrxDBDataset
    UserName = 'frxConstsData'
    CloseDataSource = False
    DataSource = ConstsDS
    Left = 160
    Top = 384
  end
  object frxShtatData: TfrxDBDataset
    UserName = 'frxShtatData'
    CloseDataSource = False
    DataSource = ReportDS
    Left = 64
    Top = 376
  end
end
