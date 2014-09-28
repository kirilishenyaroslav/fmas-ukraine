object frmMarried_DM: TfrmMarried_DM
  OldCreateOrder = False
  Left = 300
  Top = 167
  Height = 261
  Width = 379
  object DB: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey')
    DefaultTransaction = Transaction_Read
    DefaultUpdateTransaction = Transaction_Read
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 24
    Top = 40
  end
  object Transaction_Read: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 88
    Top = 8
  end
  object dstSelAll: TpFIBDataSet
    Database = DB
    Transaction = Transaction_Read
    SelectSQL.Strings = (
      
        'select distinct (F.FAM_UK), F.IMYA_UK, F.OT_UK, P.BEFO_VMESTE, D' +
        '.name_full,'
      '    hr.N_ROOM, hr.BEG_DATE, hr.END_DATE,'
      '    tr.name_type_room,'
      '    B.short_name'
      ''
      'from ST_DT_PFIO F'
      ''
      'left join st_dt_propi P on P.ID_KOD = F.ID_KOD'
      'left join sp_department D on F.n_fak = D.id_department'
      'left join st_dt_hroom hr on hr.id_kod = F.id_kod'
      'left join st_ini_type_room tr on hr.type_room = tr.id_type_room'
      'left join st_sp_builds B on B.id_build = hr.kod_build'
      ''
      'where (P.BEFO_VMESTE = 1)'
      '    and (D.use_end between current_timestamp and '#39'01.01.3333'#39')'
      '    and (hr.beg_date < current_date)'
      '    and (hr.end_date > current_date)'
      ''
      'order by D.name_full, F.fam_uk')
    Left = 160
    Top = 8
    poSQLINT64ToBCD = True
  end
  object frxSelAll: TfrxDBDataset
    UserName = 'frxSelAll'
    CloseDataSource = False
    DataSet = dstSelAll
    Left = 256
    Top = 8
  end
  object Report_main: TfrxReport
    Version = '3.15'
    DataSet = frxSelAll
    DataSetName = 'frxSelAll'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40953.475798622700000000
    ReportOptions.LastChange = 40953.475798622700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 304
    Top = 8
    Datasets = <
      item
        DataSet = frxSelAll
        DataSetName = 'frxSelAll'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.579312636667000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 304
    Top = 56
  end
end
