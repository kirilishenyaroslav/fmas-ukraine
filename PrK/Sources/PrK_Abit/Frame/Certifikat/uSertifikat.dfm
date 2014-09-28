object FrameSertifikat: TFrameSertifikat
  Left = 0
  Top = 0
  Width = 589
  Height = 294
  TabOrder = 0
  object cxGridSertifikat: TcxGrid
    Left = 0
    Top = 0
    Width = 360
    Height = 294
    Align = alClient
    TabOrder = 0
    object cxGridSertifikatDBVCertifikat: TcxGridDBTableView
      DataController.DataSource = DSourceSertifikat
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGridSertifikatDBVSertifikat_NOMER: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 190
        DataBinding.FieldName = 'NOMER'
      end
      object cxGridSertifikatDBVSertifikat_PIN: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 187
        DataBinding.FieldName = 'PIN'
      end
      object cxGridSertifikatDBVSertifikat_YEAR: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        DataBinding.FieldName = 'SYEAR'
      end
    end
    object cxGridSertifikatLevel1: TcxGridLevel
      GridView = cxGridSertifikatDBVCertifikat
    end
  end
  object cxGridMarks: TcxGrid
    Left = 360
    Top = 0
    Width = 229
    Height = 294
    Align = alRight
    TabOrder = 1
    object cxGridViewMarks: TcxGridDBTableView
      DataController.DataSource = DSourcePredmetOcenka
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGridViewMarks_PREDMET: TcxGridDBColumn
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 190
        DataBinding.FieldName = 'NAME_PREDM'
      end
      object cxGridViewMarks_OCENKA: TcxGridDBColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '1[0-9][0-9](,[0-9])?|(200|0)(,0)?'
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'OCENKA'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGridViewMarks
    end
  end
  object DSetSertifikat: TpFIBDataSet
    AfterOpen = DSetSertifikatAfterOpen
    Left = 8
    Top = 24
    poSQLINT64ToBCD = True
  end
  object DSetMarks: TpFIBDataSet
    DataSource = DSourceSertifikat
    AfterOpen = DSetMarksAfterOpen
    Left = 384
    Top = 24
    poSQLINT64ToBCD = True
  end
  object DSourceSertifikat: TDataSource
    DataSet = DSetSertifikat
    Left = 40
    Top = 24
  end
  object DSourceMarks: TDataSource
    DataSet = DSetMarks
    Left = 416
    Top = 24
  end
  object pFIBQuery: TpFIBQuery
    Left = 160
    Top = 24
  end
  object RxMemoryDataOcenka: TRxMemoryData
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID_SP_PREDM_SERT'
        DataType = ftInteger
      end
      item
        Name = 'NAME_PREDM'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'OCENKA'
        DataType = ftCurrency
      end>
    Left = 520
    Top = 24
    object RxMemoryDataOcenkaID_SP_PREDM_SERT: TIntegerField
      FieldName = 'ID_SP_PREDM_SERT'
    end
    object RxMemoryDataOcenkaNAME_PREDM: TStringField
      FieldName = 'NAME_PREDM'
      Size = 100
    end
    object RxMemoryDataOcenkaOCENKA: TCurrencyField
      FieldName = 'OCENKA'
    end
  end
  object DSourcePredmetOcenka: TDataSource
    DataSet = RxMemoryDataOcenka
    Left = 552
    Top = 24
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = False
    ProxyParams.BasicAuthentication = True
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 296
    Top = 24
  end
end
