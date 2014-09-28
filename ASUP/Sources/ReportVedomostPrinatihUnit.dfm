object ReportVedomostPrinatihForm: TReportVedomostPrinatihForm
  Left = 245
  Top = 282
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 220
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 256
      Top = 40
      Width = 21
      Height = 13
      Caption = #1055#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 56
      Top = 40
      Width = 13
      Height = 13
      Caption = #1047':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 62
      Height = 13
      Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateEndPicker: TDateTimePicker
      Left = 296
      Top = 38
      Width = 121
      Height = 21
      Date = 37744.245348842600000000
      Time = 37744.245348842600000000
      TabOrder = 0
    end
    object DateBegPicker: TDateTimePicker
      Left = 112
      Top = 38
      Width = 121
      Height = 21
      Date = 37744.245348842600000000
      Time = 37744.245348842600000000
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 110
      Top = 4
      Width = 379
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
    object SexBox: TCheckBox
      Left = 16
      Top = 69
      Width = 137
      Height = 17
      Caption = #1042#1110#1076#1073#1110#1088#1072#1090#1080' '#1078#1110#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object Button1: TButton
      Left = 496
      Top = 2
      Width = 31
      Height = 25
      Caption = '...'
      TabOrder = 4
      TabStop = False
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 544
    Height = 90
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 544
      Height = 90
      Align = alClient
      Caption = #1060#1110#1083#1100#1090#1088' '#1074#1110#1076#1087#1091#1089#1090#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object ShowDekr: TCheckBox
        Left = 16
        Top = 40
        Width = 305
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1080' '#1076#1086' '#1079#1074#1110#1090#1091' '#1076#1077#1082#1088#1077#1090#1085#1110' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = IsHolidayClick
      end
      object IsHoliday: TCheckBox
        Left = 16
        Top = 16
        Width = 193
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = IsHolidayClick
      end
      object HolidayBox: TSpComboBox
        Left = 208
        Top = 14
        Width = 321
        Height = 21
        Style = csDropDownList
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        ItemCount = 5
        SpOpenItem = '...'#1030#1085#1096#1077
        AutoDrop = True
        SpParams.Table = 'Sp_Holiday'
        SpParams.IdField = 'Id_Holiday'
        SpParams.SpFields = 'Name_Holiday'
        SpParams.Title = #1058#1080#1087#1080' '#1074#1110#1076#1087#1091#1089#1090#1086#1082
        SpParams.ComboField = 'Name_Holiday'
        SpParams.ColumnNames = #1053#1072#1079#1074#1072' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        SpParams.DontHideFirstColumn = False
        SpParams.SpMode = [spfAdd, spfModify, spfDelete, spfFind, spfSelect, spfExt]
        SpParams.AddFormName = 'AddHolidayForm'
        AlternativeForm = 'SpVidoplForm'
      end
      object ShowOnlyDekr: TCheckBox
        Left = 16
        Top = 64
        Width = 241
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1076#1077#1082#1088#1077#1090#1085#1110' '#1074#1110#1076#1087#1091#1089#1090#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = ShowOnlyDekrClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 179
    Width = 544
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object OkButton: TBitBtn
      Left = 88
      Top = 8
      Width = 97
      Height = 27
      Caption = #1043#1072#1088#1072#1079#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = OkButtonClick
      Glyph.Data = {
        8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
        180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0033000099
        33003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
        969696666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00330000
        9933009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
        66969696868686999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300
        009933009933009900009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66
        6666999999999999969696969696999999666666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0033
        0033CC3333CC3333CC33009933003300009933009900009933003300FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        666666C0C0C0B2B2B2B2B2B2969696666666999999969696999999666666FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        330000800033CC6633CC33339933003300FFFFFF003300009933009900009933
        003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF666666868686C0C0C0C0C0C0A4A0A0666666FFFFFF66666699999996969699
        9999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00330033CC6633CC66339933003300993333FFFFFFFFFFFF0033000080
        00009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF666666CCCCCCC0C0C0B2B2B2666666808080FFFFFFFFFFFF666666
        868686969696999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF003300339933339933003300CC3333CC6666993333FFFFFFFF
        FFFFFFFFFF003300009900009933FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2666666969696999999808080FFFF
        FFFFFFFFFFFFFF666666969696969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF993333003300003300CC6666CC3333CC3333CC6666
        993333FFFFFFFFFFFFFFFFFF003300009933003300FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF80808066666666666699999999999996969699
        9999808080FFFFFFFFFFFFFFFFFF666666969696666666FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC6666CC6666CC3333993333CC66
        66CC3333CC6666993333FFFFFFFFFFFFFFFFFF003300009900003300FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080969696B2B2B2A4A0A0999999808080
        A4A0A0969696999999808080FFFFFFFFFFFFFFFFFF666666969696666666FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC6666CC6666CC6666993333FF
        FFFF993333CC6666CC3333CC6666993333FFFFFFFFFFFFFFFFFF003300008000
        003300FFFFFFFFFFFFFFFFFFFFFFFF808080969696C0C0C0B2B2B2A4A0A08080
        80FFFFFF808080999999969696999999808080FFFFFFFFFFFFFFFFFF66666686
        8686666666FFFFFFFFFFFFFFFFFFFFFFFF993333CC9999CC9999CC9999993333
        FFFFFFFFFFFFFFFFFF993333CC3333CC3333CC3333993333FFFFFFFFFFFFFFFF
        FF003300006600003300FFFFFFFFFFFFFFFFFF808080C0C0C0C0C0C0C0C0C080
        8080FFFFFFFFFFFFFFFFFF808080868686999999999999808080FFFFFFFFFFFF
        FFFFFF666666777777666666FFFFFFFFFFFFFFFFFF993333CC6666CC9999CC66
        66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333CC3333993333FF
        FFFFFFFFFFFFFFFFFFFFFF003300003300FFFFFFFFFFFF808080A4A0A0C0C0C0
        B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080809999999999998080
        80FFFFFFFFFFFFFFFFFFFFFFFF666666666666FFFFFFFFFFFFFFFFFF993333CC
        6666993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333CC3333
        CC3333993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300FFFFFFFFFFFF8080
        80B2B2B2808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808099
        9999969696808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFFFFFFFFFF
        FFFFFF993333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF993333CC3333CC3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF808080868686969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFCC3333993333FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686808080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF993333993333FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
        3333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object CancelButton: TBitBtn
      Left = 337
      Top = 8
      Width = 113
      Height = 27
      Caption = #1042#1110#1076#1084#1110#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
        180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000066000066FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000066000066
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
        66666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66
        6666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660033FF0033FF
        0033FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0000
        FF0000FF0000FF000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666B2
        B2B2B2B2B2A4A0A0969696666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
        969696999999999999999999666666FFFFFFFFFFFFFFFFFFFFFFFF0000660000
        CC0033FF0033FF0033FF0000CC000066FFFFFFFFFFFFFFFFFF0000660000CC00
        00FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        666666A4A0A0B2B2B2B2B2B2B2B2B2969696666666FFFFFFFFFFFFFFFFFF6666
        66969696999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000660000CC0033FF0033FF0033FF0000CC000066FFFFFF0000660000CC
        0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2B2B2B2B2999999666666FFFFFF66
        6666999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033FF0000CC0000660000
        CC0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2B2B2B2B2999999
        666666999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033FF00
        00FF0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2
        B2B2B2B2999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0033FF
        0033FF0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4
        A0A0B2B2B2B2B2B2A4A0A0A4A0A0999999969696666666FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        660033CC0033FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF666666A4A0A0B2B2B2A4A0A0A4A0A0999999666666FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00660033CC0033FF0033FF0033FF0033FF0033FF0000CC000066FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF666666B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A0A0666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000660033CC0033FF0033FF0033FF0033CC0033FF0033FF0033FF0000CC0000
        66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF666666B2B2B2B2B2B2B2B2B2B2B2B2A4A0A0B2B2B2B2B2B2B2B2B2
        A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000660033CC0033FF0033FF0033FF0033CC0000660033CC0033FF0033FF00
        33FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF666666B2B2B2C0C0C0B2B2B2B2B2B2B2B2B2666666A4A0A0B2B2
        B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000660033CC0033FF0033FF0033FF0033CC000066FFFFFF0000660000CC
        0033FF0033FF0033FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF666666B2B2B2C0C0C0C0C0C0C0C0C0A4A0A0666666FFFFFF66
        6666A4A0A0B2B2B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000660033CC0033FF0033FF0033FF0033CC000066FFFFFFFFFFFFFFFF
        FF0000660000CC0033FF0033FF0033FF0033CC000066FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF666666C0C0C0C0C0C0C0C0C0C0C0C0A4A0A0666666FFFFFF
        FFFFFFFFFFFF666666999999B2B2B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFF
        FFFFFFFFFFFFFF0000663333FF3333FF3333FF0033CC000066FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033CC000066FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0C0C0C0C0C0C0A4A0A0666666FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF666666999999B2B2B2B2B2B2A4A0A0666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000663333CC0033CC000066FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660033CC0033CC000066FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0B2B2B2666666FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2666666
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object ExportButton: TBitBtn
      Left = 208
      Top = 8
      Width = 105
      Height = 27
      Caption = #1045#1082#1089#1087#1086#1088#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
      OnClick = OkButtonClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
        33333333330A033333333333330A033333333333330A033333333333330A0333
        33333333330A033333333330000A000033333330AAAAAAA0333333330AAAAA03
        333333330AAAAA033333333330AAA0333333333330AAA03333333333330A0333
        33333333330A0333333333333330333333333333333033333333}
    end
  end
  object ResultQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM REPORT_PRINATIH(:ID_DEPARTMENT, :DATE_BEG,  :DATE_' +
        'END,:id_sex);')
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_DEPARTMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_BEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_END'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_sex'
        ParamType = ptUnknown
      end>
    object ResultQueryID_DEPARTMENT: TIntegerField
      FieldName = 'ID_DEPARTMENT'
      Origin = 'REPORT_PRINATIH.ID_DEPARTMENT'
    end
    object ResultQueryFIO_SMALL: TIBStringField
      FieldName = 'FIO_SMALL'
      Origin = 'REPORT_PRINATIH.FIO_SMALL'
      Size = 255
    end
    object ResultQueryDATE_BEGIN: TDateField
      FieldName = 'DATE_BEGIN'
      Origin = 'REPORT_PRINATIH.DATE_BEGIN'
    end
    object ResultQueryNUM_ORDER: TIBStringField
      FieldName = 'NUM_ORDER'
      Origin = 'REPORT_PRINATIH.NUM_ORDER'
      Size = 10
    end
    object ResultQueryNAME_POST: TIBStringField
      FieldName = 'NAME_POST'
      Origin = 'REPORT_PRINATIH.NAME_POST'
      Size = 255
    end
    object ResultQueryDEPARTMENT_NAME: TIBStringField
      FieldName = 'DEPARTMENT_NAME'
      Origin = 'REPORT_PRINATIH.DEPARTMENT_NAME'
      Size = 255
    end
    object ResultQueryPERIOD_BEG: TDateField
      FieldName = 'PERIOD_BEG'
      Origin = 'REPORT_PRINATIH.PERIOD_BEG'
    end
    object ResultQueryPERIOD_END: TDateField
      FieldName = 'PERIOD_END'
      Origin = 'REPORT_PRINATIH.PERIOD_END'
    end
    object ResultQueryTN: TIntegerField
      FieldName = 'TN'
      Origin = 'REPORT_PRINATIH.TN'
    end
    object ResultQueryOKL_STR: TIBStringField
      FieldName = 'OKL_STR'
      Origin = 'REPORT_PRINATIH.OKL_STR'
      Size = 255
    end
    object ResultQueryNOMER: TIntegerField
      FieldName = 'NOMER'
      Origin = 'REPORT_PRINATIH.NOMER'
    end
    object ResultQueryADDR: TIBStringField
      FieldName = 'ADDR'
      Origin = 'REPORT_PRINATIH.ADDR'
      Size = 512
    end
  end
  object ResultReport: TfrReport
    Dataset = ResultDataSet
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    RebuildPrinter = False
    Left = 32
    Top = 48
    ReportForm = {19000000}
  end
  object ResultDataSet: TfrDBDataSet
    CloseDataSource = True
    DataSet = ResultQuery
    Left = 64
    Top = 48
  end
  object ResultQuery2: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM REPORT_DISMISSED(:ID_DEPARTMENT, :DATE_BEG,  :DATE' +
        '_END);')
    Left = 408
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_DEPARTMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_BEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_END'
        ParamType = ptUnknown
      end>
    object ResultQuery2ID_DEPARTMENT: TIntegerField
      FieldName = 'ID_DEPARTMENT'
      Origin = 'REPORT_DISMISSED.ID_DEPARTMENT'
    end
    object ResultQuery2FIO_SMALL: TIBStringField
      FieldName = 'FIO_SMALL'
      Origin = 'REPORT_DISMISSED.FIO_SMALL'
      Size = 255
    end
    object ResultQuery2DATE_DISMISSION: TDateField
      FieldName = 'DATE_DISMISSION'
      Origin = 'REPORT_DISMISSED.DATE_DISMISSION'
    end
    object ResultQuery2NAME_POST: TIBStringField
      FieldName = 'NAME_POST'
      Origin = 'REPORT_DISMISSED.NAME_POST'
      Size = 255
    end
    object ResultQuery2DEPARTMENT_NAME: TIBStringField
      FieldName = 'DEPARTMENT_NAME'
      Origin = 'REPORT_DISMISSED.DEPARTMENT_NAME'
      Size = 255
    end
    object ResultQuery2PERIOD_BEG: TDateField
      FieldName = 'PERIOD_BEG'
      Origin = 'REPORT_DISMISSED.PERIOD_BEG'
    end
    object ResultQuery2PERIOD_END: TDateField
      FieldName = 'PERIOD_END'
      Origin = 'REPORT_DISMISSED.PERIOD_END'
    end
    object ResultQuery2NAME_DISMISSION: TIBStringField
      FieldName = 'NAME_DISMISSION'
      Origin = 'REPORT_DISMISSED.NAME_DISMISSION'
      Size = 255
    end
    object ResultQuery2DISMISSION_REASON: TIBStringField
      FieldName = 'DISMISSION_REASON'
      Origin = 'REPORT_DISMISSED.DISMISSION_REASON'
      Size = 255
    end
    object ResultQuery2TN: TIntegerField
      FieldName = 'TN'
      Origin = 'REPORT_DISMISSED.TN'
    end
    object ResultQuery2COMPENS_STR: TIBStringField
      FieldName = 'COMPENS_STR'
      Origin = 'REPORT_DISMISSED.COMPENS_STR'
      Size = 255
    end
    object ResultQuery2PIDSTAVA: TIBStringField
      FieldName = 'PIDSTAVA'
      Origin = 'REPORT_DISMISSED.PIDSTAVA'
      Size = 255
    end
    object ResultQuery2NOMER: TIntegerField
      FieldName = 'NOMER'
      Origin = 'REPORT_DISMISSED.NOMER'
    end
  end
  object ResultDataSet2: TfrDBDataSet
    CloseDataSource = True
    DataSet = ResultQuery2
    Left = 440
    Top = 32
  end
  object ResultQuery3: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM REPORT_HOLIDAYS(:ID_DEPARTMENT, :DATE_BEG, :DATE_E' +
        'ND, :ID_HOLIDAY, :SHOW_DEKR,  :ID_SEX);')
    Left = 408
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_DEPARTMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_BEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_END'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_HOLIDAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW_DEKR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SEX'
        ParamType = ptUnknown
      end>
    object ResultQuery3ID_DEPARTMENT: TIntegerField
      FieldName = 'ID_DEPARTMENT'
      Origin = 'REPORT_HOLIDAYS.ID_DEPARTMENT'
    end
    object ResultQuery3FIO_SMALL: TIBStringField
      FieldName = 'FIO_SMALL'
      Origin = 'REPORT_HOLIDAYS.FIO_SMALL'
      Size = 255
    end
    object ResultQuery3NAME_POST: TIBStringField
      FieldName = 'NAME_POST'
      Origin = 'REPORT_HOLIDAYS.NAME_POST'
      Size = 100
    end
    object ResultQuery3NAME_DEPARTMENT: TIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Origin = 'REPORT_HOLIDAYS.NAME_DEPARTMENT'
      Size = 255
    end
    object ResultQuery3NAME_HOLIDAY: TIBStringField
      FieldName = 'NAME_HOLIDAY'
      Origin = 'REPORT_HOLIDAYS.NAME_HOLIDAY'
      Size = 255
    end
    object ResultQuery3PERIOD_BEG: TDateField
      FieldName = 'PERIOD_BEG'
      Origin = 'REPORT_HOLIDAYS.PERIOD_BEG'
    end
    object ResultQuery3PERIOD_END: TDateField
      FieldName = 'PERIOD_END'
      Origin = 'REPORT_HOLIDAYS.PERIOD_END'
    end
    object ResultQuery3DATE_BEG: TDateField
      FieldName = 'DATE_BEG'
      Origin = 'REPORT_HOLIDAYS.DATE_BEG'
    end
    object ResultQuery3DATE_END: TDateField
      FieldName = 'DATE_END'
      Origin = 'REPORT_HOLIDAYS.DATE_END'
    end
    object ResultQuery3REPORT_PERIOD_BEG: TDateField
      FieldName = 'REPORT_PERIOD_BEG'
      Origin = 'REPORT_HOLIDAYS.REPORT_PERIOD_BEG'
    end
    object ResultQuery3REPORT_PERIOD_END: TDateField
      FieldName = 'REPORT_PERIOD_END'
      Origin = 'REPORT_HOLIDAYS.REPORT_PERIOD_END'
    end
    object ResultQuery3H_TERM: TIntegerField
      FieldName = 'H_TERM'
      Origin = 'REPORT_HOLIDAYS.H_TERM'
    end
    object ResultQuery3NUM_LINE: TIBStringField
      FieldName = 'NUM_LINE'
      Origin = 'REPORT_HOLIDAYS.NUM_LINE'
      Size = 5
    end
  end
  object ResultDataSet3: TfrDBDataSet
    CloseDataSource = True
    DataSet = ResultQuery3
    Left = 440
    Top = 64
  end
  object Report3: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 37970.797302071800000000
    ReportOptions.LastChange = 39147.637692372680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'uses '#39'Reports\GoodPageBreak.pas'#39';'
      ''
      'procedure OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '       pfBeforePrint(Sender);'
      'end;'
      ''
      ''
      'procedure OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      '       pfCalcHeight(Sender);'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 232
    Top = 64
    Datasets = <
      item
        DataSet = FRDataSet
        DataSetName = 'FRDataSet'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 16.000000000000000000
        Top = 287.244280000000000000
        Width = 1046.929810000000000000
        OnAfterCalcHeight = 'OnAfterCalcHeight'
        OnBeforePrint = 'OnBeforePrint'
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = FRDataSet
        DataSetName = 'FRDataSet'
        RowCount = 0
        Stretched = True
        object Memo4: TfrxMemoView
          Width = 32.000000000000000000
          Height = 16.000000000000000000
          OnBeforePrint = 'Memo6OnBeforePrint'
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ResultQuery3."NUM_LINE"]')
        end
        object Memo5: TfrxMemoView
          Left = 32.000000000000000000
          Width = 124.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultQuery3."FIO_SMALL"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 156.000000000000000000
          Width = 240.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultQuery3."NAME_POST"]')
        end
        object Memo7: TfrxMemoView
          Left = 940.000000000000000000
          Width = 88.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo8: TfrxMemoView
          Left = 396.000000000000000000
          Width = 188.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultQuery3."NAME_HOLIDAY"]')
        end
        object Memo9: TfrxMemoView
          Left = 656.000000000000000000
          Width = 152.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ResultQuery3."PERIOD_BEG"] - [ResultQuery3."PERIOD_END"]')
        end
        object Memo11: TfrxMemoView
          Left = 808.000000000000000000
          Width = 64.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ResultQuery3."H_TERM"]')
        end
        object Memo12: TfrxMemoView
          Left = 584.000000000000000000
          Width = 72.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ResultQuery3."DATE_BEG"]')
        end
        object Memo13: TfrxMemoView
          Left = 872.000000000000000000
          Width = 68.000000000000000000
          Height = 15.874015750000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ResultQuery3."DATE_END"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 92.000000000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'OnBeforePrint'
        object Memo1: TfrxMemoView
          Left = 9.000000000000000000
          Top = 1.102350000000001000
          Width = 1016.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1074#1110#1076#1087#1091#1089#1090#1086#1082' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079' [ResultQuery3."RE' +
              'PORT_PERIOD_BEG"] '#1087#1086' [ResultQuery3."REPORT_PERIOD_END"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 17.000000000000000000
        Top = 245.669450000000000000
        Width = 1046.929810000000000000
        OnAfterCalcHeight = 'OnAfterCalcHeight'
        OnBeforePrint = 'OnBeforePrint'
        Condition = '<ResultQuery3."NAME_DEPARTMENT">'
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 1028.031496062990000000
          Height = 16.000000000000000000
          StretchMode = smActualHeight
          Color = 15790320
          DataSet = FRDataSet
          DataSetName = 'FRDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ResultQuery3."NAME_DEPARTMENT"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 51.598330000000000000
        Top = 132.283550000000000000
        Width = 1046.929810000000000000
        object Memo10: TfrxMemoView
          Left = 940.346456692913000000
          Top = 19.598330000000000000
          Width = 88.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1084#1110#1090#1082#1072' '#1087#1088#1086' '#1074#1080#1082#1086#1088#1080#1089#1090#1072#1085#1085#1103)
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Top = 19.598330000000000000
          Width = 32.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 656.125984251969000000
          Top = 19.598330000000000000
          Width = 152.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1103#1082#1080#1081' '#1087#1077#1088#1110#1086#1076' '#1085#1072#1076#1072#1108#1090#1100#1089#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1072)
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 808.062992125984000000
          Top = 19.598330000000000000
          Width = 64.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1077#1088#1084#1110#1085' '#1074#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 872.314960629921000000
          Top = 19.598330000000000000
          Width = 68.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 396.094488188976000000
          Top = 19.598330000000000000
          Width = 188.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087' '#1074#1110#1076#1087#1091#1089#1090#1082#1080)
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 156.094488188976000000
          Top = 19.598330000000000000
          Width = 240.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 32.125984251968500000
          Top = 19.598330000000000000
          Width = 124.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 584.314960629921000000
          Top = 19.598330000000000000
          Width = 72.000000000000000000
          Height = 32.000000000000000000
          StretchMode = smMaxHeight
          Color = 14671839
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 901.000000000000000000
          Top = 0.598330000000004200
          Width = 128.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Memo.Strings = (
            #1057#1090#1086#1088#1110#1085#1082#1072' [PAGE#] '#1079' [TOTALPAGES]')
        end
      end
    end
  end
  object FRDataSet: TfrxDBDataset
    UserName = 'FRDataSet'
    CloseDataSource = False
    Left = 272
    Top = 64
  end
end
