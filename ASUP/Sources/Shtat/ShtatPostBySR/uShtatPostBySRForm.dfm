object FormShtatPostBySR: TFormShtatPostBySR
  Left = 904
  Top = 164
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FormShtatPostBySR'
  ClientHeight = 107
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelDate: TLabel
    Left = 8
    Top = 36
    Width = 42
    Height = 13
    Caption = #1053#1072' '#1076#1072#1090#1091':'
  end
  object LabelDocument: TLabel
    Left = 8
    Top = 8
    Width = 73
    Height = 13
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1064#1056':'
  end
  object BevelBottom: TBevel
    Left = 0
    Top = 65
    Width = 442
    Height = 3
    Align = alBottom
    Shape = bsBottomLine
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 68
    Width = 442
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object cxButtonApply: TcxButton
      Left = 120
      Top = 8
      Width = 97
      Height = 25
      Caption = #1043#1072#1088#1072#1079#1076
      Enabled = False
      TabOrder = 0
      OnClick = cxButtonApplyClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FF00FF000066
        0000149D2100179D270019AA2B001BA92E001AB02D001EAE31001EB1320025A8
        3B0021B4370022B7380031B54D0031C24F003BCB5E0041C5630047D36D004FD6
        790053DE7F000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000001
        0100000000000000000000000000010808010000000000000000000000010D0B
        060A0100000000000000000001100E0901050801000000000000000111120C01
        000103070100000000000000010F010000000001050100000000000000010000
        0000000001030100000000000000000000000000000001010000000000000000
        0000000000000001010000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      UseSystemPaint = False
    end
    object cxButtonCancel: TcxButton
      Left = 224
      Top = 8
      Width = 97
      Height = 25
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButtonCancelClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FF00FF000000
        9A00012AF200002CF600002CF8000733F6000031FE000431FE000134FF000C3C
        FF00123BF100103BF400143EF400103DFB001743F6001B46F6001C47F6001D48
        F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
        FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
        FA002355FF002659FF002E5BF9002C5FFF00325DF1003B66F3003664FA00386B
        FF004071FA004274FF00497AFC00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010100
        00000000000101000000000001150B010000000001040601000000000113180B
        010000010306030100000000000110180B010104060301000000000000000111
        190D060603010000000000000000000118120D05010000000000000000000001
        1D181312010000000000000000000124241D1D19110100000000000000012829
        2401011F191F010000000000012A2A26010000011F231D0100000000012C2701
        00000000011F1901000000000001010000000000000101000000000000000000
        0000000000000000000000000000000000000000000000000000}
      UseSystemPaint = False
    end
  end
  object cxButtonEdit: TcxButtonEdit
    Left = 88
    Top = 6
    Width = 345
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditPropertiesButtonClick
    Properties.OnChange = cxButtonEditPropertiesChange
    TabOrder = 0
    OnKeyDown = cxButtonEditKeyDown
  end
  object cxDateEdit: TcxDateEdit
    Left = 88
    Top = 34
    Width = 137
    Height = 21
    Properties.DateButtons = [btnToday]
    TabOrder = 1
  end
  object pFIBDatabase: TpFIBDatabase
    DBName = 'localhost:D:\Development\Firebird\DonNU\FULL_DB_RESTORE.IB'
    DBParams.Strings = (
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = pFIBTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 200
    Top = 24
  end
  object pFIBDataSet: TpFIBDataSet
    Database = pFIBDatabase
    Transaction = pFIBTransaction
    SelectSQL.Strings = (
      'select * from UP_SHTAT_REPORT_POST_BY_SR(22099,'#39'11.06.2014'#39')')
    Left = 232
    Top = 24
    poSQLINT64ToBCD = True
    object pFIBDataSetNAME_POST: TFIBStringField
      FieldName = 'NAME_POST'
      Size = 256
      EmptyStrToNull = True
    end
    object pFIBDataSetNAME_POST_BASE_SALARY: TFIBStringField
      FieldName = 'NAME_POST_BASE_SALARY'
      Size = 64
      EmptyStrToNull = True
    end
    object pFIBDataSetRAZRYAD: TFIBStringField
      FieldName = 'RAZRYAD'
      Size = 32
      EmptyStrToNull = True
    end
    object pFIBDataSetNAME_TYPE_POST: TFIBStringField
      FieldName = 'NAME_TYPE_POST'
      Size = 64
      EmptyStrToNull = True
    end
  end
  object pFIBTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase
    TimeoutAction = TARollback
    Left = 264
    Top = 24
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41801.435702326400000000
    ReportOptions.Name = 'asdasdasd'
    ReportOptions.LastChange = 41802.521819444450000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 328
    Top = 24
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = ' MyCategory'
        Value = Null
      end
      item
        Name = 'FIRM_NAME'
        Value = Null
      end
      item
        Name = 'DOC_NAME'
        Value = Null
      end
      item
        Name = 'CHS_DATE'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 47.370130000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object Memo6: TfrxMemoView
          Align = baClient
          ShiftMode = smDontShift
          Width = 1046.929810000000000000
          Height = 47.370130000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[FIRM_NAME]'
            ''
            
              #1055#1077#1088#1077#1083#1110#1082' '#1087#1086#1089#1072#1076', '#1097#1086' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1102#1090#1100#1089#1103' '#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1110' '#1096#1090#1072#1090#1085#1086#1075#1086' '#1088#1086#1079#1082#1083#1072#1076#1091 +
              ' [DOC_NAME] '#1085#1072' '#1076#1072#1090#1091' [CUR_DATE]'
            '')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 10.582677170000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        RowCount = 0
        Stretched = True
        object Memo7: TfrxMemoView
          Left = 37.800000000000000000
          Width = 495.118110240000000000
          Height = 10.582677170000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_POST'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset."NAME_POST"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Width = 37.795300000000000000
          Height = 10.582677170000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 532.913730000000000000
          Width = 245.669291340000000000
          Height = 10.582677170000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_POST_BASE_SALARY'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset."NAME_POST_BASE_SALARY"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 778.582677170000000000
          Width = 71.811023620000000000
          Height = 10.582677170000000000
          StretchMode = smMaxHeight
          DataField = 'RAZRYAD'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset."RAZRYAD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 850.394250000000000000
          Width = 196.535433070000000000
          Height = 10.582677170000000000
          StretchMode = smMaxHeight
          DataField = 'NAME_TYPE_POST'
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset."NAME_TYPE_POST"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        object Memo12: TfrxMemoView
          Left = 721.890230000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [Page#] '#1110#1079' [TotalPages#]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Width = 370.393940000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091': [DATE] [TIME]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 20.031496060000000000
        Top = 128.504020000000000000
        Width = 1046.929810000000000000
        object Memo14: TfrxMemoView
          Width = 37.795300000000000000
          Height = 20.031496060000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 37.795300000000000000
          Width = 495.118110240000000000
          Height = 20.031496060000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1087#1086#1089#1072#1076#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 532.913385830000000000
          Width = 245.669291340000000000
          Height = 20.031496060000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1076#1072#1090#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 778.582677170000000000
          Width = 71.811070000000000000
          Height = 20.031496060000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1088#1103#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 850.394250000000000000
          Width = 196.535560000000000000
          Height = 20.031496060000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 360
    Top = 24
  end
  object pFIBQuery: TpFIBQuery
    Database = pFIBDatabase
    Transaction = pFIBTransaction
    Left = 296
    Top = 24
  end
end
