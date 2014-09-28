object fmPrintOrder: TfmPrintOrder
  Left = 317
  Top = 285
  Width = 465
  Height = 281
  Caption = 'fmPrintOrder'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DSBottom: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from UP_DT_ORDERS_PRINT_ORDER_BOTTOM(1)')
    Left = 48
    Top = 80
    poSQLINT64ToBCD = True
    object DSBottomL_SIGNER_FIO: TFIBStringField
      FieldName = 'L_SIGNER_FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomL_SIGNER_POST: TFIBStringField
      FieldName = 'L_SIGNER_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomL_TYPE_PRINT_NAME: TFIBStringField
      FieldName = 'L_TYPE_PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomR_SIGNER_FIO: TFIBStringField
      FieldName = 'R_SIGNER_FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomR_SIGNER_POST: TFIBStringField
      FieldName = 'R_SIGNER_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomR_TYPE_PRINT_NAME: TFIBStringField
      FieldName = 'R_TYPE_PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomC_SIGNER_FIO: TFIBStringField
      FieldName = 'C_SIGNER_FIO'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomC_SIGNER_POST: TFIBStringField
      FieldName = 'C_SIGNER_POST'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomC_TYPE_PRINT_NAME: TFIBStringField
      FieldName = 'C_TYPE_PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSBottomPRINT_NUM: TFIBIntegerField
      FieldName = 'PRINT_NUM'
    end
  end
  object frxDBDBottom: TfrxDBDataset
    UserName = 'frxDBDBottom'
    CloseDataSource = False
    DataSet = DSBottom
    Left = 104
    Top = 80
  end
  object DSOrder: TpFIBDataSet
    Database = DB
    Transaction = Tr
    SelectSQL.Strings = (
      'select * from UP_DT_ORDERS_PRINT_ORDER(1)')
    Left = 48
    Top = 16
    poSQLINT64ToBCD = True
    object DSOrderNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object DSOrderDATE_PROJECT: TFIBDateField
      FieldName = 'DATE_PROJECT'
    end
    object DSOrderHASH_CODE: TFIBStringField
      FieldName = 'HASH_CODE'
      Size = 10
      EmptyStrToNull = True
    end
    object DSOrderHEADER_TEXT: TMemoField
      FieldName = 'HEADER_TEXT'
      BlobType = ftMemo
      Size = 8
    end
    object DSOrderSIGNATURE_TEXT: TMemoField
      FieldName = 'SIGNATURE_TEXT'
      BlobType = ftMemo
      Size = 8
    end
    object DSOrderHEADER_FIO: TFIBStringField
      FieldName = 'HEADER_FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object DSOrderHEADER_POST: TFIBStringField
      FieldName = 'HEADER_POST'
      Size = 50
      EmptyStrToNull = True
    end
    object DSOrderBODY: TMemoField
      FieldName = 'BODY'
      BlobType = ftMemo
      Size = 8
    end
    object DSOrderDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object DSOrderPRINT_NAME: TFIBStringField
      FieldName = 'PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSOrderNAME_PRED: TFIBStringField
      FieldName = 'NAME_PRED'
      Size = 255
      EmptyStrToNull = True
    end
    object DSOrderCITY: TFIBStringField
      FieldName = 'CITY'
      Size = 50
      EmptyStrToNull = True
    end
    object DSOrderNUM_PROJECT: TFIBStringField
      FieldName = 'NUM_PROJECT'
      Size = 10
      EmptyStrToNull = True
    end
    object DSOrderID_LEVEL: TFIBBCDField
      FieldName = 'ID_LEVEL'
      Size = 0
      RoundByScale = True
    end
    object DSOrderDAY_O: TFIBStringField
      FieldName = 'DAY_O'
      Size = 2
      EmptyStrToNull = True
    end
    object DSOrderMONTH_O: TFIBStringField
      FieldName = 'MONTH_O'
      Size = 2
      EmptyStrToNull = True
    end
    object DSOrderYEAR_O: TFIBStringField
      FieldName = 'YEAR_O'
      Size = 4
      EmptyStrToNull = True
    end
    object DSOrderORDER_PRINT_REPORT: TFIBStringField
      FieldName = 'ORDER_PRINT_REPORT'
      Size = 150
      EmptyStrToNull = True
    end
  end
  object frxDBOrder: TfrxDBDataset
    UserName = 'frxDBOrder'
    CloseDataSource = False
    DataSet = DSOrder
    Left = 96
    Top = 16
  end
  object frxR_Order: TfrxReport
    Version = '3.20'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39043.682647013900000000
    ReportOptions.LastChange = 39171.594759652800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  memo2.font.size := <font_doc>;'
      '  memo5.font.size := <font_doc>;'
      '  memo11.font.size := <font_doc>;'
      '  memo12.font.size := <font_doc>;'
      '  memo13.font.size := <font_doc>;'
      '  memo14.font.size := <font_doc>;'
      '  memo10.font.size := <font_doc>;'
      '  memo3.font.size := <font_doc>;'
      '  memo4.font.size := <font_doc>;'
      '  memo6.font.size := <font_doc>;'
      '  memo7.font.size := <font_doc>;'
      '  memo8.font.size := <font_doc>;'
      '  memo9.font.size := <font_doc>;'
      '  memo1.font.size := <font_doc>;'
      ''
      'end;'
      ''
      'procedure Overlay2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <chernetka> = 1'
      '       then memo15.visible := true'
      '       else memo15.visible := false;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 152
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDBottom
        DataSetName = 'frxDBDBottom'
      end
      item
        DataSet = frxDBOrder
        DataSetName = 'frxDBOrder'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 30.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 623.622450000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        object Memo3: TfrxMemoView
          Top = 26.456710000000000000
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 94.488250000000000000
          Width = 374.173470000000000000
          Height = 34.015770000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 423.307360000000000000
          Top = 64.252010000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 268.346630000000000000
          Top = 64.252010000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 445.984540000000000000
          Top = 64.252010000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 49.133890000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 86.929190000000000000
          Top = 64.252010000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 188.976500000000000000
          Top = 64.252010000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 37.795300000000000000
          Top = 64.252010000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 75.590600000000000000
          Top = 64.252010000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795300000000000000
        Top = 211.653680000000000000
        Width = 623.622450000000000000
        DataSet = frxDBOrder
        DataSetName = 'frxDBOrder'
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Align = baWidth
          ShiftMode = smDontShift
          Top = 12.094493070000000000
          Width = 623.622450000000000000
          Height = 25.700789840000000000
          StretchMode = smActualHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          GapY = -4.000000000000000000
          HAlign = haBlock
          LineSpacing = 6.000000000000000000
          ParagraphGap = 30.000000000000000000
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1039.370750000000000000
        Width = 623.622450000000000000
        object Memo1: TfrxMemoView
          Width = 676.535870000000000000
          Height = 18.897650000000000000
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 30.236240000000000000
        Top = 272.126160000000000000
        Width = 623.622450000000000000
        Condition = 'frxDBDBottom."PRINT_NUM"'
        KeepChild = True
        KeepTogether = True
        Stretched = True
        object Memo5: TfrxMemoView
          Top = 11.338590000000010000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
        end
        object Memo10: TfrxMemoView
          Left = 207.874150000000000000
          Top = 11.338590000000010000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
        end
        object Memo11: TfrxMemoView
          Left = 351.496290000000000000
          Top = 11.338590000000010000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 325.039580000000000000
        Width = 623.622450000000000000
        DataSet = frxDBDBottom
        DataSetName = 'frxDBDBottom'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
        end
        object Memo13: TfrxMemoView
          Left = 207.874150000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
        end
        object Memo14: TfrxMemoView
          Left = 351.496290000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
        end
      end
      object Overlay2: TfrxOverlay
        Height = 612.283860000000000000
        Top = 366.614410000000000000
        Width = 623.622450000000000000
        OnBeforePrint = 'Overlay2OnBeforePrint'
        object Memo15: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 143.622139999999000000
          Width = 563.149970000000000000
          Height = 468.661720000000000000
          Visible = False
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnFace
          Font.Height = -96
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
          Rotation = 45
          VAlign = vaCenter
        end
      end
    end
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 248
    Top = 64
  end
  object DSVn: TpFIBDataSet
    Left = 232
    Top = 24
    poSQLINT64ToBCD = True
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 248
    Top = 120
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 208
    Top = 152
  end
  object frxReport_V: TfrxReport
    Version = '3.20'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39048.422127268510000000
    ReportOptions.LastChange = 39176.562150405090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '{    memo1.font.size := <font_doc>;'
      '    memo2.font.size := <font_doc>;'
      '    memo3.font.size := <font_doc>;'
      '    memo4.font.size := <font_doc>;'
      '    memo5.font.size := <font_doc>;'
      '    memo6.font.size := <font_doc>;'
      '    memo7.font.size := <font_doc>;'
      '    memo8.font.size := <font_doc>;'
      '    memo9.font.size := <font_doc>;'
      '    memo10.font.size := <font_doc>;'
      '    memo11.font.size := <font_doc>;'
      '    memo12.font.size := <font_doc>;'
      '    memo13.font.size := <font_doc>;'
      '    memo14.font.size := <font_doc>;'
      '    memo15.font.size := <font_doc>;'
      '    memo16.font.size := <font_doc>;}'
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    memo1.font.size := <font_doc>;'
      '    memo2.font.size := <font_doc>;'
      '    memo3.font.size := <font_doc>;'
      '    memo4.font.size := <font_doc>;'
      '    memo5.font.size := <font_doc>;'
      '    memo6.font.size := <font_doc>;'
      '    memo7.font.size := <font_doc>;'
      '    memo8.font.size := <font_doc>;'
      '    memo9.font.size := <font_doc>;'
      '    memo10.font.size := <font_doc>;'
      '    memo11.font.size := <font_doc>;'
      '    memo12.font.size := <font_doc>;'
      '    memo13.font.size := <font_doc>;'
      '    memo14.font.size := <font_doc>;'
      '    memo15.font.size := <font_doc>;'
      '    memo16.font.size := <font_doc>;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 168
    Top = 152
    Datasets = <
      item
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 30.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 41.574830000000000000
        Top = 226.771800000000000000
        Width = 623.622450000000000000
        RowCount = 0
        StartNewPage = True
        Stretched = True
        object Memo13: TfrxMemoView
          Top = 11.338590000000010000
          Width = 623.622450000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          GapX = 1.000000000000000000
          HAlign = haBlock
          LineSpacing = 6.000000000000000000
          ParagraphGap = 30.000000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 147.401670000000000000
        Top = 18.897650000000000000
        Width = 623.622450000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
        object Memo7: TfrxMemoView
          Top = 30.236240000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Width = 680.315400000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 427.086890000000000000
          Top = 60.472480000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 253.228510000000000000
          Top = 60.472480000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 105.826840000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 34.015770000000000000
          Top = 60.472480000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 68.031540000000000000
          Top = 60.472480000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 173.858380000000000000
          Top = 60.472480000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 26.456710000000000000
          Top = 60.472480000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 60.472480000000000000
          Top = 60.472480000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 445.984540000000000000
          Top = 60.472480000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        Height = 132.283550000000000000
        Top = 328.819110000000000000
        Width = 623.622450000000000000
        object Memo1: TfrxMemoView
          Left = 34.015770000000000000
          Top = 22.677180000000020000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 377.953000000000000000
          Top = 22.677180000000020000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Left = 34.015770000000010000
          Top = 71.811069999999970000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 377.953000000000000000
          Top = 71.811069999999970000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 34.015770000000010000
          Top = 52.913419999999970000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          ParentFont = False
        end
      end
    end
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 288
    Top = 160
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    Left = 248
    Top = 176
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    EmptyLines = True
    Left = 216
    Top = 184
  end
  object DSV: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from UP_DT_ORDERS_PRINT_ORDER_V(1, 1)')
    Left = 48
    Top = 152
    poSQLINT64ToBCD = True
    object DSVBODY: TMemoField
      FieldName = 'BODY'
      BlobType = ftMemo
      Size = 8
    end
    object DSVNUM_PUNKT: TFIBIntegerField
      FieldName = 'NUM_PUNKT'
    end
    object DSVNAME_PUNKT: TMemoField
      FieldName = 'NAME_PUNKT'
      BlobType = ftMemo
      Size = 8
    end
    object DSVNAME_POST: TFIBStringField
      FieldName = 'NAME_POST'
      Size = 100
      EmptyStrToNull = True
    end
    object DSVNUM_ORDER: TFIBStringField
      FieldName = 'NUM_ORDER'
      Size = 10
      EmptyStrToNull = True
    end
    object DSVPRINT_NAME: TFIBStringField
      FieldName = 'PRINT_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSVDATE_ORDER: TFIBDateField
      FieldName = 'DATE_ORDER'
    end
    object DSVHEADER_POST: TFIBStringField
      FieldName = 'HEADER_POST'
      Size = 50
      EmptyStrToNull = True
    end
    object DSVHEADER_FIO: TFIBStringField
      FieldName = 'HEADER_FIO'
      Size = 50
      EmptyStrToNull = True
    end
    object DSVFIRM_NAME: TFIBStringField
      FieldName = 'FIRM_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object DSVCITY: TFIBStringField
      FieldName = 'CITY'
      Size = 50
      EmptyStrToNull = True
    end
    object DSVFIO_INS: TFIBStringField
      FieldName = 'FIO_INS'
      Size = 25
      EmptyStrToNull = True
    end
    object DSVDAY_O: TFIBStringField
      FieldName = 'DAY_O'
      Size = 2
      EmptyStrToNull = True
    end
    object DSVMONTH_O: TFIBStringField
      FieldName = 'MONTH_O'
      Size = 2
      EmptyStrToNull = True
    end
    object DSVYEAR_O: TFIBStringField
      FieldName = 'YEAR_O'
      Size = 4
      EmptyStrToNull = True
    end
    object DSVNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object DB: TpFIBDatabase
    DBName = ':'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'sql_role_name=')
    DefaultTransaction = Tr
    DefaultUpdateTransaction = Tr
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 320
    Top = 16
  end
  object Tr: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 360
    Top = 16
  end
end
