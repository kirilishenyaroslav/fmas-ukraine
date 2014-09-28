object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 170
  Height = 286
  Width = 428
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
    Left = 112
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 208
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38712.609177326400000000
    ReportOptions.LastChange = 39315.703095520830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."RUS_FAMILIA">='#39#39') and (<CardDS."FAMILIA">='#39#39')'
      '    then MasterData1.Visible:=false'
      '    else MasterData1.Visible:=true;'
      'end;'
      ''
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."RUS_IMYA">='#39#39') and (<CardDS."IMYA">='#39#39')'
      '    then MasterData2.Visible:=false'
      '    else MasterData2.Visible:=true;'
      'end;'
      ''
      'procedure MasterData3OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '    if (<CardDS."RUS_OTCHESTVO">='#39#39') and (<CardDS."OTCHESTVO">='#39 +
        #39')'
      '    then MasterData3.Visible:=false'
      '    else MasterData3.Visible:=true;'
      'end;'
      ''
      'procedure MasterData4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."BIRTH_DATE">=0)'
      '    then MasterData4.Visible:=false'
      '    else MasterData4.Visible:=true;'
      'end;'
      ''
      'procedure MasterData5OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."ADR_BIRTH">='#39#39')'
      '    then MasterData5.Visible:=false'
      '    else MasterData5.Visible:=true;'
      'end;'
      ''
      'procedure MasterData6OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."SEX">='#39#39')'
      '    then MasterData6.Visible:=false'
      '    else MasterData6.Visible:=true;'
      'end;'
      ''
      'procedure MasterData7OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '    if (<CardDS."NAME_NATIONALITY">='#39#39') and (<CardDS."NAME_PENSI' +
        'ON">='#39#39')'
      '    then MasterData7.Visible:=false'
      '    else MasterData7.Visible:=true;'
      'end;'
      ''
      'procedure MasterData8OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."TIN">='#39#39') and (<CardDS."DATE_BEG">=0)'
      '    then MasterData8.Visible:=false'
      '    else MasterData8.Visible:=true;'
      'end;'
      ''
      'procedure MasterData9OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."SOC_CARD_NUMBER">='#39#39') and (<CardDS."NOTE">='#39#39')'
      '    then MasterData9.Visible:=false'
      '    else MasterData9.Visible:=true;'
      'end;'
      ''
      'procedure MasterData10OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."EDUC_TYPE">='#39#39') and (<CardDS."EDUC_VUZ">='#39#39')'
      '    and (<CardDS."DATE_END">=0)'
      '    then MasterData10.Visible:=false'
      '    else MasterData10.Visible:=true;'
      ''
      'end;'
      ''
      'procedure MasterData11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."DIPLOM_NUMBER">='#39#39')'
      '    then MasterData11.Visible:=false'
      '    else MasterData11.Visible:=true;'
      'end;'
      ''
      'procedure MasterData26OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."EDUCATION">='#39#39')'
      '    then MasterData26.Visible:=false'
      '    else'
      '    begin'
      '        if  MasterData10.Visible=true'
      '        then MasterData26.Visible:=false'
      '        else MasterData26.Visible:=true;'
      '    end;'
      'end;'
      ''
      'procedure MasterData12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."DIPLOM_DATE">=0)'
      '    then MasterData12.Visible:=false'
      '    else MasterData12.Visible:=true;'
      'end;'
      ''
      'procedure MasterData13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."EDUC_SPEC">='#39#39')'
      '    then MasterData13.Visible:=false'
      '    else MasterData13.Visible:=true;'
      'end;'
      ''
      'procedure MasterData14OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."EDUC_KVAL">='#39#39')'
      '    then MasterData14.Visible:=false'
      '    else MasterData14.Visible:=true;'
      'end;'
      ''
      'procedure MasterData15OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."NIR">='#39#39')'
      '    then MasterData15.Visible:=false'
      '    else MasterData15.Visible:=true;'
      'end;'
      ''
      'procedure MasterData16OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."DISCIPLINE">='#39#39')'
      '    then MasterData16.Visible:=false'
      '    else MasterData16.Visible:=true;'
      'end;'
      ''
      'procedure MasterData17OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."CAME_FROM">='#39#39')'
      '    then MasterData17.Visible:=false'
      '    else MasterData17.Visible:=true;'
      'end;'
      ''
      'procedure MasterData18OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."DATA_CAME">=0)'
      '    then MasterData18.Visible:=false'
      '    else MasterData18.Visible:=true;'
      'end;'
      ''
      'procedure MasterData19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."NAME_FLANG">='#39#39')'
      '    then MasterData19.Visible:=false'
      '    else MasterData19.Visible:=true;'
      'end;'
      ''
      'procedure MasterData20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '    if (<RegardDS."REG_GROUP">='#39#39') and (<RegardDS."UCH_STEP">='#39#39 +
        ')'
      '    and (<RegardDS."N_DIPL">='#39#39')and (<RegardDS."DATE_BEG_R">=0)'
      '    then MasterData20.Visible:=false'
      '    else MasterData20.Visible:=true;'
      ''
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."NAME_PENSION">='#39#39')'
      '    then Memo18.Visible:=false'
      '    else Memo18.Visible:=true;'
      'end;'
      ''
      'procedure Memo25OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."DATE_BEG">=0)'
      '    then Memo25.Visible:=false'
      '    else Memo25.Visible:=true;'
      'end;'
      ''
      ''
      'procedure Memo96OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."NOTE">='#39#39')'
      '    then Memo96.Visible:=false'
      '    else Memo96.Visible:=true;'
      'end;'
      ''
      'procedure Memo17OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."NAME_NATIONALITY">='#39#39')'
      '    then Memo16.Visible:=false'
      '    else Memo16.Visible:=true;'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."TIN">='#39#39')'
      '    then Memo19.Visible:=false'
      '    else Memo19.Visible:=true;'
      'end;'
      ''
      'procedure Memo93OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."SOC_CARD_NUMBER">='#39#39')'
      '    then Memo87.Visible:=false'
      '    else Memo87.Visible:=true;'
      'end;'
      ''
      'procedure MasterData23OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."STATUS">='#39#39')'
      '    then MasterData23.Visible:=false'
      '    else MasterData23.Visible:=true;'
      'end;'
      ''
      'procedure MasterData28OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."PASS_VIDAN">='#39#39')'
      '    then MasterData28.Visible:=false'
      '    else MasterData28.Visible:=true;'
      'end;'
      ''
      ''
      'procedure MasterData29OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."PASS_DATE">=0)'
      '    then MasterData29.Visible:=false'
      '    else MasterData29.Visible:=true;'
      'end;'
      ''
      'procedure MasterData30OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."ADR">='#39#39')'
      '    then MasterData30.Visible:=false'
      '    else MasterData30.Visible:=true;'
      'end;'
      ''
      'procedure MasterData31OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."TELEPHONE">='#39#39')'
      '    then MasterData31.Visible:=false'
      '    else MasterData31.Visible:=true;'
      'end;'
      ''
      'procedure MasterData27OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if (<CardDS."PASS_SN">='#39#39')'
      '    then MasterData27.Visible:=false'
      '    else MasterData27.Visible:=true;'
      'end;'
      ''
      ''
      'procedure Memo61OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    Memo61.Memo.clear;'
      '    if (<MovingsDS."RATE_COUNT">=1)'
      '    then Memo61.Memo.add(<MovingsDS."POST">)'
      '    else'
      
        '    Memo61.Memo.add(FormatFloat(<MovingsDS."Stavki_Disp_Format">' +
        ',<MovingsDS."RATE_COUNT">) + '#39' '#39' +<MovingsDS."POST">);'
      'end;'
      ''
      ' begin'
      'end.')
    Left = 32
    Top = 64
    Datasets = <
      item
        DataSet = CardDS
        DataSetName = 'CardDS'
      end
      item
        DataSet = HolydaysDS
        DataSetName = 'HolidaysDS'
      end
      item
        DataSet = MovingsDS
        DataSetName = 'MovingsDS'
      end
      item
        DataSet = RegardDS
        DataSetName = 'RegardDS'
      end
      item
        DataSet = StajDS
        DataSetName = 'StajDS'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 87.370130000000000000
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 272.121435587500000000
          Top = 45.354360000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            '[Z_VID]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baCenter
          Left = 204.089895587500000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[OSOB_CARD]   [CardDS."CARD_NUMBER"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1050.709340000000000000
        Width = 718.101251175000100000
        object Memo1: TfrxMemoView
          Left = 638.639782530000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
      end
      object MasterData10: TfrxMasterData
        Height = 50.900000000000000000
        Top = 548.031849999999900000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData10OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo32: TfrxMemoView
          Top = 18.899999999999980000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[CardDS."EDUC_TYPE"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 185.200000000000000000
          Top = 18.899999999999980000
          Width = 332.598583860000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[CardDS."EDUC_VUZ"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 517.800000000000000000
          Top = 18.899999999999980000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[CardDS."DATE_END"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[EDUC_TYPE]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 185.196977320000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[EDUC_VUZ]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 517.795617320000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_END]')
          ParentFont = False
        end
      end
      object MasterData16: TfrxMasterData
        Height = 20.283467000000000000
        Top = 888.189550000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData16OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo41: TfrxMemoView
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DISCIPLINE]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 253.230000000000000000
          Top = 0.000226999999995314
          Width = 466.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."DISCIPLINE"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 20.000000000000000000
        Top = 166.299320000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo91: TfrxMemoView
          Top = 0.000017090000000053
          Width = 86.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[FAMILIA]')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 204.000000000000000000
          Top = 0.000017090000000053
          Width = 250.740260000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."RUS_FAMILIA"]')
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 480.000000000000000000
          Width = 230.740260000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."FAMILIA"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 20.000000000000000000
        Top = 207.874150000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo4: TfrxMemoView
          Width = 104.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[IMYA]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 204.000000000000000000
          Width = 250.740260000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."RUS_IMYA"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 480.000000000000000000
          Width = 230.740260000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."IMYA"]')
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 20.000000000000000000
        ParentFont = False
        Top = 249.448980000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData3OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[OTCHESTVO]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 204.000000000000000000
          Width = 250.740260000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."RUS_OTCHESTVO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 480.000000000000000000
          Width = 230.740260000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."OTCHESTVO"]')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 20.000000000000000000
        Top = 291.023810000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData4OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo10: TfrxMemoView
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[BIRTH_DATE]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 204.000000000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HideZeros = True
          Memo.Strings = (
            '[CardDS."BIRTH_DATE"]')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        Height = 20.000000000000000000
        Top = 332.598640000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData5OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo12: TfrxMemoView
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ADR_BIRTH]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 204.000000000000000000
          Width = 501.008040000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HideZeros = True
          Memo.Strings = (
            '[CardDS."ADR_BIRTH"]')
          ParentFont = False
        end
      end
      object MasterData6: TfrxMasterData
        Height = 20.000000000000000000
        Top = 374.173470000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData6OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo14: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[SEX]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 204.000000000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."SEX"]')
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        Height = 20.000000000000000000
        Top = 415.748300000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData7OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo16: TfrxMemoView
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[NAME_NATIONALITY]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 204.000000000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo17OnBeforePrint'
          AutoWidth = True
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."NAME_NATIONALITY"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 416.220787320000000000
          Width = 295.212486140000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo18OnBeforePrint'
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NAME_PENSION]: [CardDS."NAME_PENSION"]')
          ParentFont = False
        end
      end
      object MasterData8: TfrxMasterData
        Height = 20.000000000000000000
        Top = 457.323130000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData8OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo25: TfrxMemoView
          Left = 416.220787320000000000
          Width = 295.212740000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo25OnBeforePrint'
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HideZeros = True
          Memo.Strings = (
            '[DATE_BEG]: [CardDS."DATE_BEG"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[TIN]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 204.000000000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."TIN"]')
          ParentFont = False
        end
      end
      object MasterData9: TfrxMasterData
        Height = 26.460000000000000000
        Top = 498.897960000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData9OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo96: TfrxMemoView
          Left = 416.220787320000000000
          Width = 295.212642360000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo96OnBeforePrint'
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."NOTE"]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[SOC_CARD_NUMBER]')
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 204.000000000000000000
          Width = 204.094620000000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo93OnBeforePrint'
          AutoWidth = True
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."SOC_CARD_NUMBER"]')
          ParentFont = False
        end
      end
      object MasterData13: TfrxMasterData
        Height = 20.000000000000000000
        Top = 763.465060000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData13OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo24: TfrxMemoView
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[EDUC_SPEC]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 253.230000000000000000
          Width = 463.685163860000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."EDUC_SPEC"]')
          ParentFont = False
        end
      end
      object MasterData11: TfrxMasterData
        Height = 32.000000000000000000
        Top = 665.197280000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData11OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo28: TfrxMemoView
          Top = 12.000000000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DIPLOM_NUMBER]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 253.230000000000000000
          Top = 12.000000000000000000
          Width = 463.685163860000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."DIPLOM_NUMBER"]')
          ParentFont = False
        end
      end
      object MasterData12: TfrxMasterData
        Height = 20.000000000000000000
        Top = 721.890230000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData12OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo30: TfrxMemoView
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DIPLOM_DATE]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 253.230000000000000000
          Width = 463.685163860000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."DIPLOM_DATE"]')
          ParentFont = False
        end
      end
      object MasterData14: TfrxMasterData
        Height = 20.000000000000000000
        Top = 805.039890000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData14OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo37: TfrxMemoView
          Left = 253.230000000000000000
          Width = 463.685039370000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."EDUC_KVAL"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Top = 1.448652909999964000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[EDUC_KVAL]')
          ParentFont = False
        end
      end
      object MasterData15: TfrxMasterData
        Height = 20.000000000000000000
        Top = 846.614720000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData15OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo38: TfrxMemoView
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[NIR]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 253.230000000000000000
          Width = 463.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HideZeros = True
          Memo.Strings = (
            '[CardDS."NIR"]')
          ParentFont = False
        end
      end
      object MasterData17: TfrxMasterData
        Height = 20.000000000000000000
        Top = 929.764380000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData17OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo42: TfrxMemoView
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[CAME_FROM]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 253.230000000000000000
          Width = 466.141832360000000000
          Height = 18.900000000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."CAME_FROM"]')
          ParentFont = False
        end
      end
      object MasterData18: TfrxMasterData
        Height = 20.000000000000000000
        Top = 971.339210000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData18OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo44: TfrxMemoView
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DATA_CAME]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 253.230000000000000000
          Width = 463.905690000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HideZeros = True
          Memo.Strings = (
            '[CardDS."DATA_CAME"]')
          ParentFont = False
        end
      end
      object MasterData26: TfrxMasterData
        Height = 18.900000000000000000
        Top = 623.622450000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData26OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo113: TfrxMemoView
          Width = 718.100000000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[CardDS."EDUCATION"]')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      PrintOnPreviousPage = True
      object PageFooter2: TfrxPageFooter
        Height = 86.677180000000000000
        Top = 986.457330000000000000
        Width = 718.101251175000100000
        object Memo76: TfrxMemoView
          Left = 642.520100000000000000
          Top = 63.999999999999770000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          ParentFont = False
        end
      end
      object MasterData25: TfrxMasterData
        Height = 15.118120000000000000
        Top = 555.590910000000000000
        Width = 718.101251175000100000
        AllowSplit = True
        DataSet = HolydaysDS
        DataSetName = 'HolidaysDS'
        RowCount = 0
        Stretched = True
        object Memo68: TfrxMemoView
          Left = 3.118120000000000000
          Width = 173.858380000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[HolidaysDS."NAME_HOLIDAY"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 176.976500000000000000
          Width = 139.842610000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[HolidaysDS."PERIOD_H"]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 316.819110000000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[HolidaysDS."H_TERM"]')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 354.614410000000000000
          Width = 90.708661420000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[HolidaysDS."DATE_BEG_H"]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 445.323130000000000000
          Width = 90.708661420000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[HolidaysDS."DATE_END_H"]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 536.031850000000000000
          Width = 162.519790000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[HolidaysDS."OSNOV_H"]')
          ParentFont = False
        end
      end
      object MasterData27: TfrxMasterData
        Height = 50.897637800000000000
        Top = 593.386210000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData27OnBeforePrint'
        AllowSplit = True
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo77: TfrxMemoView
          Top = 32.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[PASS_SN]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 94.490000000000000000
          Top = 32.000000000000000000
          Width = 563.149970000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[CardDS."PASS_SN"]')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 18.900000000000000000
          Top = 12.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            '[PASS]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 65.570000000000000000
        Top = 899.528140000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        object Memo74: TfrxMemoView
          Align = baCenter
          Left = 181.412715587500000000
          Top = 40.000000000000000000
          Width = 355.275820000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[PRAZ]')
          ParentFont = False
        end
      end
      object Header3: TfrxHeader
        Height = 63.401670000000000000
        Top = 468.661720000000000000
        Width = 718.101251175000100000
        object Memo101: TfrxMemoView
          Left = 3.118120000000000000
          Top = 33.165430000000010000
          Width = 173.858380000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[NAME_HOLIDAY]')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 176.976509760000000000
          Top = 33.165430000000010000
          Width = 139.842610000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PERIOD_H]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 316.819119760000000000
          Top = 33.165430000000010000
          Width = 37.795300000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[H_TERM]')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 354.614419760000000000
          Top = 33.165430000000010000
          Width = 181.417440000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_HOLIDAY]')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 176.976509760000000000
          Top = 48.283549999999940000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Z]')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 248.787579760000000000
          Top = 48.283549999999940000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PO]')
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 354.614419760000000000
          Top = 48.283549999999940000
          Width = 90.708661420000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_BEG_H]')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 445.323139760000000000
          Top = 48.283549999999940000
          Width = 90.708661420000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_END_H]')
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 536.031859760000000000
          Top = 33.165430000000010000
          Width = 162.519790000000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[OSNOV_H]')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 18.897647560000000000
          Top = 12.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            '[HOLIDAY]')
          ParentFont = False
        end
      end
      object MasterData24: TfrxMasterData
        Height = 20.000000000000000000
        Top = 427.086890000000000000
        Width = 718.101251175000100000
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo89: TfrxMemoView
          Width = 192.756030000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[IGDIV]')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 253.230000000000000000
          Width = 318.582870000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."IGDIV"]')
          ParentFont = False
        end
      end
      object MasterData20: TfrxMasterData
        Height = 49.795300000000000000
        Top = 60.472480000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData20OnBeforePrint'
        DataSet = RegardDS
        DataSetName = 'RegardDS'
        RowCount = 0
        Stretched = True
        object Memo67: TfrxMemoView
          Left = 253.228517320000000000
          Top = 12.000017089999990000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[N_DIPL]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 536.693267320000000000
          Top = 12.000017089999990000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_BEG_R]')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 0.000007320000000000
          Top = 30.897650000000010000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[RegardDS."UCH_STEP"]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 253.228517320000000000
          Top = 30.897650000000010000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[RegardDS."N_DIPL"]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 536.693267320000000000
          Top = 30.897650000000010000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[RegardDS."DATE_BEG_R"]')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Top = 11.999999999999990000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[RegardDS."REG_GROUP"]')
          ParentFont = False
        end
      end
      object MasterData23: TfrxMasterData
        Height = 32.000000000000000000
        Top = 370.393940000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData23OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo26: TfrxMemoView
          Top = 12.000000000000000000
          Width = 188.976500000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[STATUS]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 253.230000000000000000
          Top = 12.000000000000000000
          Width = 318.582870000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HideZeros = True
          Memo.Strings = (
            '[CardDS."STATUS"]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Height = 50.467650000000000000
        Top = 245.669450000000000000
        Width = 718.101251175000100000
        object Memo35: TfrxMemoView
          Left = 18.897637800000000000
          Top = 11.999999999999970000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            '[MOVINGS]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 608.503937007874000000
          Top = 31.570000000000020000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[OSNOV_N]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 31.570000000000020000
          Width = 181.417322834646000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DEPARTMENT_NAME]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 181.417313070000000000
          Top = 31.570000000000020000
          Width = 192.755900630000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[POST]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 374.173223460000000000
          Top = 31.570000000000020000
          Width = 45.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[OSN_R]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 419.530000000000000000
          Top = 31.570000000000020000
          Width = 71.811028500000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[PERIOD]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 491.338577800000000000
          Top = 31.570000000000020000
          Width = 117.165354330709000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ACCEPT_COND]')
          ParentFont = False
        end
      end
      object MasterData28: TfrxMasterData
        Height = 18.900000000000000000
        Top = 668.976810000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData28OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        KeepFooter = True
        RowCount = 0
        Stretched = True
        object Memo80: TfrxMemoView
          Left = 94.490000000000000000
          Width = 563.149913860000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[CardDS."PASS_VIDAN"]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[PASS_VIDAN]')
          ParentFont = False
        end
      end
      object MasterData29: TfrxMasterData
        Height = 18.897637800000000000
        Top = 710.551640000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData29OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo78: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[PASS_DATE]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 94.490000000000000000
          Width = 563.149970000000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HideZeros = True
          Memo.Strings = (
            '[CardDS."PASS_DATE"]')
          ParentFont = False
        end
      end
      object MasterData30: TfrxMasterData
        Height = 32.000000000000000000
        Top = 752.126470000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData30OnBeforePrint'
        AllowSplit = True
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo84: TfrxMemoView
          Left = -0.881887320000000000
          Top = 12.000000000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ADR]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 195.653545750000000000
          Top = 12.000000000000000000
          Width = 514.236493860000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."ADR"]')
          ParentFont = False
        end
      end
      object MasterData31: TfrxMasterData
        Height = 30.897650000000000000
        Top = 808.819420000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData31OnBeforePrint'
        AllowSplit = True
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        Stretched = True
        object Memo86: TfrxMemoView
          Left = -0.881887320000000000
          Top = 12.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[TELEPHONE]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 196.000000000000000000
          Top = 12.000000000000000000
          Width = 248.000000000000000000
          Height = 16.000000000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."TELEPHONE"]')
          ParentFont = False
        end
      end
      object MasterData21: TfrxMasterData
        Height = 18.900000000000000000
        Top = 204.094620000000000000
        Width = 718.101251175000100000
        DataSet = StajDS
        DataSetName = 'StajDS'
        RowCount = 0
        Stretched = True
        object Memo51: TfrxMemoView
          Width = 343.653680000000000000
          Height = 18.897637795275600000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[StajDS."NAME_STAJ"]')
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 343.650000000000000000
          Width = 102.490000000000000000
          Height = 18.897637795275600000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[StajDS."CALC_YEARS"]')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 446.140000000000000000
          Width = 102.490000000000000000
          Height = 18.897637795275600000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[StajDS."CALC_MONTH"]')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 548.630000000000000000
          Width = 102.488250000000000000
          Height = 18.897637795275600000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[StajDS."CALC_DAYS"]')
          ParentFont = False
        end
      end
      object MasterData22: TfrxMasterData
        Height = 30.236220470000000000
        Top = 317.480520000000000000
        Width = 718.101251175000100000
        DataSet = MovingsDS
        DataSetName = 'MovingsDS'
        RowCount = 0
        Stretched = True
        object Memo60: TfrxMemoView
          Width = 181.417313070000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[MovingsDS."DEPARTMENT_NAME"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 181.417313070000000000
          Width = 192.755900630000000000
          Height = 30.236220470000000000
          OnBeforePrint = 'Memo61OnBeforePrint'
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '[FormatFloat(<MovingsDS."Stavki_Disp_Format">,<MovingsDS."RATE_C' +
              'OUNT">)] [MovingsDS."POST"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 374.173223460000000000
          Width = 45.732283460000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[MovingsDS."OSN_R"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 419.526420000000000000
          Width = 71.811021180000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[MovingsDS."DATE_BEG"]-[MovingsDS."DATE_END"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 608.503937010000000000
          Width = 90.708720000000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          HideZeros = True
          Memo.Strings = (
            '[MovingsDS."OSNOV_N"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 491.338577800000000000
          Width = 117.165359210000000000
          Height = 30.236220470000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[MovingsDS."NAME_ACCEPT_COND"]'
            '[MovingsDS."PERIOD"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 49.795300000000000000
        Top = 132.283550000000000000
        Width = 718.101251175000100000
        object Memo50: TfrxMemoView
          Left = 7.557637800000000000
          Top = 12.000000000000000000
          Width = 337.385900000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            '[STAJ] [StajDS."DATE_CALC"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Top = 30.897650000000000000
          Width = 343.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[NAME_STAJ]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 343.650000000000000000
          Top = 30.897650000000000000
          Width = 102.490000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[CALC_YEARS]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 446.140000000000000000
          Top = 30.897650000000000000
          Width = 102.490000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[CALC_MONTH]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 548.630000000000000000
          Top = 30.897650000000000000
          Width = 102.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[CALC_DAYS]')
          ParentFont = False
        end
      end
      object MasterData19: TfrxMasterData
        Height = 20.000000000000000000
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        OnBeforePrint = 'MasterData19OnBeforePrint'
        DataSet = CardDS
        DataSetName = 'CardDS'
        RowCount = 0
        object Memo46: TfrxMemoView
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[NAME_FLANG]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 253.230000000000000000
          Width = 350.141900710000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[CardDS."NAME_FLANG"]')
          ParentFont = False
        end
      end
    end
  end
  object Designer: TfrxDesigner
    Restrictions = []
    Left = 112
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
    Left = 208
    Top = 56
  end
  object CardDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 24
    Top = 120
    poSQLINT64ToBCD = True
  end
  object RegardDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 104
    Top = 120
    poSQLINT64ToBCD = True
  end
  object StajDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 176
    Top = 120
    poSQLINT64ToBCD = True
  end
  object MovingsDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 256
    Top = 120
    poSQLINT64ToBCD = True
  end
  object HolydaysDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    Left = 344
    Top = 120
    poSQLINT64ToBCD = True
  end
  object CardDS: TfrxDBDataset
    UserName = 'CardDS'
    CloseDataSource = False
    DataSet = CardDataSet
    Left = 24
    Top = 176
  end
  object RegardDS: TfrxDBDataset
    UserName = 'RegardDS'
    CloseDataSource = False
    DataSet = RegardDataSet
    Left = 104
    Top = 176
  end
  object StajDS: TfrxDBDataset
    UserName = 'StajDS'
    CloseDataSource = False
    DataSet = StajDataSet
    Left = 176
    Top = 176
  end
  object MovingsDS: TfrxDBDataset
    UserName = 'MovingsDS'
    CloseDataSource = False
    DataSet = MovingsDataSet
    Left = 256
    Top = 176
  end
  object HolydaysDS: TfrxDBDataset
    UserName = 'HolidaysDS'
    CloseDataSource = False
    DataSet = HolydaysDataSet
    Left = 344
    Top = 176
  end
end
