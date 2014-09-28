object DM: TDM
  OldCreateOrder = False
  Left = 311
  Top = 284
  Height = 298
  Width = 395
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 128
  end
  object ReportDsetData: TfrxDBDataset
    UserName = 'ReportDsetData'
    CloseDataSource = False
    DataSet = DSet
    Left = 200
    Top = 116
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 32
    Top = 56
  end
  object StoredProc: TpFIBStoredProc
    Database = DB
    Transaction = WriteTransaction
    Left = 128
    Top = 56
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41471.677117534700000000
    ReportOptions.LastChange = 41487.470840474540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo16OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      '         if <ReportDsetData."KAT_KURS"> = '#39#39' then'
      '         begin'
      '             TfrxMemoView(Sender).Frame.Typ := ftLeft + ftRight;'
      '             TfrxMemoView(Sender).Text := '#39#39';'
      '         end'
      '         else TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRight;'
      '          //    end'
      '          //    else'
      '          //    begin'
      '          //     Memo16.Frame.Typ :=ftLeft + ftRight;'
      '          //    end;'
      '       //  end'
      '       //  else'
      '       //  begin'
      '           // if <frxDBDatasetMasterRX."NAME_FACULTTB">=1 then'
      '          //    begin'
      '         //       Memo16.Frame.Typ :=ftLeft + ftRight+ftBottom;'
      '          //    end'
      '           //   else'
      '           //   begin'
      
        '            //   TfrxMemoView(Sender).Frame.Typ :=ftLeft + ftRig' +
        'ht+ftTop;'
      '            //  end;'
      '      //   end;'
      '  // end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 200
    Datasets = <
      item
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
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
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        DataSet = ReportDsetData
        DataSetName = 'ReportDsetData'
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_BDG"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 457.323130000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[<ReportDsetData."CNT_DOG">+<ReportDsetData."CNT_BDG">]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 362.834880000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CLASIFIERCODE_EDBO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 56.692950000000000000
          Width = 211.653680000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[ReportDsetData."NAME_SPEC"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."CNT_DOG"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 268.346630000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."FUNIVERSITYGROUPFULLNAME"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'Memo16OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[ReportDsetData."NAME_KAT_STUD"] '
            ' [ReportDsetData."NAME_KURS_EDBO"]')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        PrintOnFirstPage = False
        object Memo2: TfrxMemoView
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1091#1088#1089)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 457.323130000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 362.834880000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1080#1092#1088)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 56.692950000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1072)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1085#1090#1072#1088#1082#1090)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 268.346630000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1072)
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 68.031540000000000000
        Top = 98.267780000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."ID_FORM_STUD"'
        Stretched = True
        object Memo21: TfrxMemoView
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            
              #1050#1086#1085#1090#1080#1085#1075#1077#1085#1090' '#1089#1090#1091#1076#1077#1085#1090#1110#1074' [ReportDsetData."NAME_FACUL_EDBO"]  ([Repor' +
              'tDsetData."NAME_FORM_STUD"]) '#1089#1090#1072#1085#1086#1084' '#1085#1072' [ReportDsetData."OUT_DATE' +
              '_BEG"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Top = 49.133890000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1091#1088#1089)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 544.252320000000000000
          Top = 49.133890000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 457.323130000000000000
          Top = 49.133890000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 362.834880000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1064#1080#1092#1088)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 56.692950000000000000
          Top = 49.133890000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1072)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 631.181510000000000000
          Top = 49.133890000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1085#1090#1072#1088#1082#1090)
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 268.346630000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1072)
          ParentFont = False
        end
      end
      object GroupFooter4: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 56.692950000000000000
          Width = 400.630180000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_BDG">,MasterData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 457.323130000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[SUM(<ReportDsetData."CNT_BDG">,MasterData1)+SUM(<ReportDsetData' +
              '."CNT_DOG">,MasterData1)]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_DOG">,MasterData1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          ParentFont = False
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        Condition = 'ReportDsetData."KAT_KURS_TMP"'
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          Width = 457.323130000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_BDG">,MasterData1)]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 457.323130000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[SUM(<ReportDsetData."CNT_BDG">,MasterData1)+SUM(<ReportDsetData' +
              '."CNT_DOG">,MasterData1)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SUM(<ReportDsetData."CNT_DOG">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 200
    Top = 59
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 272
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 272
    Top = 56
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 272
    Top = 112
  end
  object DSetDataReport: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 32
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 128
    Top = 117
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object XMLExp: TfrxXMLExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 200
    Top = 168
  end
  object PDFExp: TfrxPDFExport
    UseFileCache = True
    OpenAfterExport = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 264
    Top = 168
  end
end
