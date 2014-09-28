object frmPrint: TfrmPrint
  Left = 775
  Top = 359
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 108
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BarStatic: TLabel
    Left = 16
    Top = 8
    Width = 193
    Height = 13
    AutoSize = False
  end
  object OkButton: TcxButton
    Left = 16
    Top = 75
    Width = 89
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    ModalResult = 1
    TabOrder = 2
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 118
    Top = 75
    Width = 90
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object dtBegCheck: TcxDateEdit
    Left = 13
    Top = 32
    Width = 92
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.DateButtons = []
    Properties.ReadOnly = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16311512
    Style.ButtonTransparency = ebtInactive
    TabOrder = 0
    OnKeyPress = dtBegCheckKeyPress
  end
  object dtEndCheck: TcxDateEdit
    Left = 117
    Top = 32
    Width = 92
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.DateButtons = []
    Properties.ReadOnly = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Color = 16311512
    Style.ButtonTransparency = ebtInactive
    TabOrder = 1
    OnKeyPress = dtEndCheckKeyPress
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39167.623648113400000000
    ReportOptions.LastChange = 39276.474078044000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var i    : integer;'
      '    s    : string;'
      '    ss   : string;'
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <ReportDsetData."OUT_FIO_UA"> = s then'
      '  begin'
      '      memo20.memo.text := '#39#39';'
      '    //  memo22.memo.text := '#39#39';'
      '  end else'
      '  begin'
      '      i    := i + 1;'
      '      memo20.memo.text := intToStr(<i>);'
      '  //    ss := <ReportDsetData."OUT_POST_NAME">;'
      '  //    memo22.memo.text :=ss;'
      '  end;'
      '  s := <ReportDsetData."OUT_FIO_UA">;'
      'end;'
      ''
      'procedure rttTitleOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  s    := '#39#39';'
      '  i    := 0;'
      'end;'
      ''
      'begin'
      'end.')
    Left = 8
    Datasets = <
      item
        DataSetName = 'ReportDsetData'
      end>
    Variables = <>
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
      object rttTitle: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 128.504020000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'rttTitleOnBeforePrint'
        object memTitle: TfrxMemoView
          Align = baCenter
          Left = 0.000000000000044298
          Top = 34.015770000000010000
          Width = 1046.929810000000000000
          Height = 26.456710000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1053' '#1040' '#1050' '#1040' '#1047)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Top = 64.252010000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              '__________________________ [ReportDsetData."CITY"] '#8470' ___________' +
              '_______________')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 98.267780000000000000
          Width = 1046.929810000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1082#1080' '#1087#1086' '#1074#1110#1076#1087#1091#1089#1090#1082#1072#1084)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baCenter
          Left = 0.000000000000044298
          Width = 1046.929810000000000000
          Height = 37.795300000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FIRM_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 347.716760000000000000
        Width = 1046.929810000000000000
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo20: TfrxMemoView
          Width = 30.135452530000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 30.236240000000000000
          Width = 294.702552530000000000
          Height = 18.897637800000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_FIO_UA"]')
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 325.039580000000000000
          Width = 219.212583780000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_POST_NAME"]')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 604.724800000000000000
          Width = 139.842519690000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[(<ReportDsetData."Period_Str">)]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 744.567410000000000000
          Width = 162.519790000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[(<ReportDsetData."OUT_HOLIDAY_PERIOD">)]')
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_HOLIDAY_NAME"]')
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 544.252320000000000000
          Width = 60.472323780000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."OUT_DAYS_COUNT_TEXT"]')
          VAlign = vaCenter
        end
      end
      object cmhWork: TfrxColumnHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 34.015748030000000000
        ParentFont = False
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        object memEnd: TfrxMemoView
          Left = 604.724800000000000000
          Width = 139.842610000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1103#1082#1080#1081' '#1087#1077#1088#1110#1086#1076' '#1085#1072#1076#1072#1108#1090#1100#1089#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1072)
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 544.252320000000000000
          Width = 60.472480000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100
            #1082#1072#1083'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Width = 30.135452530000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470
            #1087'/'#1087)
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 30.236240000000000000
          Width = 294.702552530000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 325.039580000000000000
          Width = 219.212598425197000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1081#1084#1072#1085#1072' '#1087#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 744.566929133858000000
          Width = 162.519685040000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1103#1082#1086#1075#1086' '#1110' '#1087#1086' '#1103#1082#1080#1081' '#1095#1072#1089' '#1085#1072#1076#1072#1108#1090#1100#1089#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1072)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          VAlign = vaCenter
        end
      end
      object pgfPages: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 427.086890000000000000
        Width = 1046.929810000000000000
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 952.441560000000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          VAlign = vaCenter
        end
      end
      object grhDepartment: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 306.141930000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."OUT_ID_DEPARTMENT"'
        Stretched = True
        object Memo23: TfrxMemoView
          Width = 544.252088110000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_DEPARTMENT_NAME_UPPER"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 544.252320000000000000
          Width = 502.677258110000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."OUT_DEPARTMENT_NAME"]')
          ParentFont = False
        end
      end
      object grhTypePers: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 264.567100000000000000
        Width = 1046.929810000000000000
        Condition = 'ReportDsetData."OUT_NAME_TYPE_PERS"'
        StartNewPage = True
        object Memo4: TfrxMemoView
          Width = 1046.929133860000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."OUT_NAME_TYPE_PERS"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'DBDataset'
    CloseDataSource = False
    DataSet = ReadDataSet
    Left = 40
    Top = 176
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 96
    Top = 120
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 248
    Top = 24
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 248
    Top = 80
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 248
    Top = 136
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 240
    Top = 192
  end
  object ReadDataSet: TpFIBDataSet
    Database = frmDM.DB
    Transaction = frmDM.Transaction_Read
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 32
    Top = 232
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object ActionList1: TActionList
    Left = 164
    Top = 116
    object DebugPrintAction: TAction
      Caption = 'DebugPrintAction'
      ShortCut = 57412
      OnExecute = DebugPrintActionExecute
    end
  end
end
