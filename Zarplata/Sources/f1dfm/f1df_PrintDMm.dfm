object PrintDM: TPrintDM
  OldCreateOrder = False
  Left = 375
  Top = 295
  Height = 224
  Width = 571
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38751.358712557900000000
    ReportOptions.LastChange = 41747.593667881940000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if(<frxDSetGlobal."ID_TYPE">=1)then'
      '  begin'
      '    line15.Visible:=true;'
      '    line16.Visible:=true;'
      '  end;'
      '  if(<frxDSetGlobal."ID_TYPE">=3)then'
      '  begin'
      '    line17.Visible:=true;'
      '    line18.Visible:=true;'
      '  end;'
      '  if(<frxDSetGlobal."ID_TYPE">=2)then'
      '  begin'
      '    line19.Visible:=true;'
      '    line20.Visible:=true;'
      '  end;'
      'end;'
      ''
      'procedure Memo9OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if (<frxDSet."KOD_PRIV">=0) then'
      '  memo9.text:='#39'-'#39';'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReportGetValue
    Left = 32
    Top = 8
    Datasets = <
      item
        DataSet = frxDSet
        DataSetName = 'frxDSet'
      end
      item
        DataSet = frxDSetGlobal
        DataSetName = 'frxDSetGlobal'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 30.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Height = 11.338590000000000000
        ParentFont = False
        Top = 604.724800000000000000
        Width = 642.520100000000000000
        DataSet = frxDSet
        DataSetName = 'frxDSet'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 34.015770000000000000
          Width = 75.590600000000000000
          Height = 11.338590000000000000
          DataField = 'TIN_PASPORT'
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSet."TIN_PASPORT"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 109.606370000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DataField = 'SUM_NAR'
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[frxDSet."SUM_NAR"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 177.637910000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DataField = 'SUM_VIPL'
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[frxDSet."SUM_VIPL"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 245.669450000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DataField = 'SUM_UD'
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[frxDSet."SUM_UD"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 313.700990000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DataField = 'SUM_PERER'
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[frxDSet."SUM_PERER"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 381.732530000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          DataField = 'KOD_1DF'
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSet."KOD_1DF"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 415.748300000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DataField = 'DATE_CAME'
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSet."DATE_CAME"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 483.779840000000000000
          Width = 68.031540000000000000
          Height = 11.338590000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSet."DATE_LEAVE"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 551.811380000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          OnBeforePrint = 'Memo9OnBeforePrint'
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSet."KOD_PRIV"]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Width = 34.015748030000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haRight
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 600.945270000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          Frame.Typ = [ftRight]
          HAlign = haCenter
          Memo.Strings = (
            '[P_IS_ADD]')
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 83.149660000000000000
        ParentFont = False
        Top = 498.897960000000000000
        Width = 642.520100000000000000
        ReprintOnNewPage = True
        object Memo12: TfrxMemoView
          Left = 177.637910000000000000
          Top = 3.779530000000020000
          Width = 68.031540000000000000
          Height = 64.252010000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072
            #1074#1080#1087#1083#1072#1095#1077#1085'.'
            #1076#1086#1093#1086#1076#1091' ('#1075#1088#1085'.'#1082#1086#1087'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 245.669450000000000000
          Top = 52.913420000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1085#1072#1088#1072#1093#1086#1074#1072#1085'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 313.700990000000000000
          Top = 52.913420000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1077#1088#1077#1088#1072#1093#1086#1074'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 381.732530000000000000
          Top = 3.779530000000020000
          Width = 34.015770000000000000
          Height = 64.252010000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1079#1085'.'
            #1076#1086#1093'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 415.748300000000000000
          Top = 34.015770000000000000
          Width = 68.031540000000000000
          Height = 34.015770000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1087#1088#1080#1081#1085#1103#1090#1090#1103' '
            #1085#1072' '#1088#1086#1073#1086#1090#1091
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 483.779840000000000000
          Top = 34.015770000000000000
          Width = 68.031540000000000000
          Height = 34.015770000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1074#1110#1083#1100#1085#1077#1085#1085#1103' '
            #1079' '#1088#1086#1073#1086#1090#1080
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 551.811380000000000000
          Top = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 64.252010000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1079#1085#1072#1082#1072
            #1087#1086#1076#1072#1090'.'
            #1089#1086#1094'.'
            #1087#1110#1083#1100#1075#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 415.748300000000000000
          Top = 3.779530000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 245.669450000000000000
          Top = 3.779530000000020000
          Width = 136.063080000000000000
          Height = 49.133890000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072' '#1091#1090#1088#1080#1084#1072#1085#1086#1075#1086
            #1087#1086#1076#1072#1090#1082#1091' ('#1075#1088#1085'.,'#1082#1086#1087'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Top = 68.031539999999900000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 34.015770000000000000
          Top = 68.031539999999900000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 109.606370000000000000
          Top = 68.031539999999900000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3a')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 177.637910000000000000
          Top = 68.031539999999900000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 245.669450000000000000
          Top = 68.031539999999900000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4a')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 313.700990000000000000
          Top = 68.031539999999900000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 381.732530000000000000
          Top = 68.031539999999900000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 415.748300000000000000
          Top = 68.031539999999900000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 483.779840000000000000
          Top = 68.031539999999900000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 551.811380000000000000
          Top = 68.031539999999900000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 34.015770000000000000
          Top = 3.779530000000020000
          Width = 75.590600000000000000
          Height = 64.252010000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1076#1072#1090'. '#1085#1086#1084#1077#1088' '#1072#1073#1086' '#1089#1077#1088#1110#1103
            #1090#1072' '#1085#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072'*')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Top = 3.779530000000020000
          Width = 34.015770000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470
            #1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 109.606370000000000000
          Top = 3.779530000000020000
          Width = 68.031540000000000000
          Height = 64.252010000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072
            #1085#1072#1088#1072#1093#1086#1074#1072#1085'.'
            #1076#1086#1093#1086#1076#1091' ('#1075#1088#1085'.'#1082#1086#1087'.)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 600.945270000000000000
          Top = 3.779530000000020000
          Width = 41.574830000000000000
          Height = 64.252010000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1079#1085#1072#1082#1072
            '(0,1)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 600.945270000000000000
          Top = 68.031539999999900000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '9')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 374.173470000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Stretched = True
        object Memo22: TfrxMemoView
          Left = 453.543600000000000000
          Width = 188.976500000000000000
          Height = 56.692950000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1047#1040#1058#1042#1045#1056#1044#1046#1045#1053#1054
            #1053#1072#1082#1072#1079' '#1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1072' '#1076#1086#1093#1086#1076#1110#1074' '#1110' '#1079#1073#1086#1088#1110#1074' '#1059#1082#1088#1072#1111#1085#1080
            '21.01.2014  '#8470' 49')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Width = 291.023810000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1084#1110#1090#1082#1072' '#1087#1088#1086' '#1086#1076#1077#1088#1078#1072#1085#1085#1103'('#1096#1090#1072#1084#1087' '#1082#1086#1085#1090#1088#1086#1083#1102#1102#1095#1086#1075#1086' '#1086#1088#1075#1072#1085#1091')')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 41.574830000000000000
          Width = 449.764070000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1087#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088' '#1102#1088#1080#1076#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' ('#1087#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088' '#1072#1073#1086' '#1089#1077#1088#1110#1103' '
            #1090#1072' '#1085#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072'* '#1089#1072#1084#1086#1079#1072#1081#1085#1103#1090#1086#1111' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080')')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 381.732530000000000000
          Top = 98.267780000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1060#1086#1088#1084#1072' '#8470' 1'#1044#1060' ')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Top = 162.519790000000000000
          Width = 642.520100000000000000
          Height = 34.015770000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '
            
              #1089#1091#1084' '#1076#1086#1093#1086#1076#1091', '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1086#1075#1086' ('#1089#1087#1083#1072#1095#1077#1085#1086#1075#1086') '#1085#1072' '#1082#1086#1088#1080#1089#1090#1100' '#1087#1083#1072#1090#1085#1080#1082#1110#1074' '#1087#1086#1076#1072#1090 +
              #1082#1091', '#1110' '#1089#1091#1084' '#1091#1090#1088#1080#1084#1072#1085#1086#1075#1086' '#1079' '#1085#1080#1093' '#1087#1086#1076#1072#1090#1082#1091' ')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 11.338590000000000000
          Top = 204.094620000000000000
          Width = 619.842920000000000000
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          Top = 204.094620000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              '('#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1102#1088#1080#1076#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' '#1095#1080' '#1087#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103' '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110' '#1089#1072#1084#1086 +
              #1079#1072#1081#1085#1103#1090#1086#1111' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080')')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Top = 264.566929130000000000
          Width = 162.519790000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '('#1087#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088' '#1082#1086#1085#1090#1088#1086#1083#1102#1102#1095#1086#1075#1086' '#1086#1088#1075#1072#1085#1091')')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 162.519790000000000000
          Top = 264.567100000000000000
          Width = 468.661720000000000000
          Frame.Typ = [ftTop]
        end
        object Memo31: TfrxMemoView
          Left = 147.401670000000000000
          Top = 264.566929130000000000
          Width = 495.118430000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1082#1086#1085#1090#1088#1086#1083#1102#1102#1095#1086#1075#1086' '#1086#1088#1075#1072#1085#1091')')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 234.330860000000000000
          Top = 283.464750000000000000
          Width = 291.023810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1079#1072' [frxDSetGlobal."KVARTAL_1DF"] '#1082#1074#1072#1088#1090#1072#1083' [frxDSetGlobal."PERIOD_' +
              'YEAR"] '#1088'.')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Top = 321.260050000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1055#1088#1072#1094#1102#1074#1072#1083#1086' '#1091' '#1096#1090#1072#1090#1110':')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Top = 336.378170000000000000
          Width = 196.535560000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1055#1088#1072#1094#1102#1074#1072#1083#1086' '#1079#1072' '
            #1094#1080#1074#1110#1083#1100#1085#1086'-'#1087#1088#1072#1074#1086#1074#1080#1084#1080' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080':')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 245.669450000000000000
          Top = 347.716760000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1055#1054#1056#1062#1030#1071' '#8470)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 192.756030000000000000
          Top = 321.260050000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[CNT_SHTAT]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 192.756030000000000000
          Top = 347.716760000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[CNT_SOVMEST]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Top = 188.976500000000000000
          Width = 642.520100000000000000
          Height = 15.118120000000000000
          DataField = 'FIRM_NAME'
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSetGlobal."FIRM_NAME"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 3.779530000000000000
          Top = 249.448818897638000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'KOD_DPI'
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDSetGlobal."KOD_DPI"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 162.519790000000000000
          Top = 249.448980000000000000
          Width = 468.661720000000000000
          Height = 15.118120000000000000
          DataField = 'DPI'
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSetGlobal."DPI"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Top = 30.236240000000000000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          DataField = 'OKPO'
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDSetGlobal."OKPO"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 22.677180000000000000
          Top = 86.929190000000000000
          Width = 328.819110000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1102#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Top = 86.929190000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -51
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          GapX = 1.000000000000000000
          GapY = -10.000000000000000000
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 22.677180000000000000
          Top = 109.606370000000000000
          Width = 328.819110000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1089#1072#1084#1086#1079#1072#1081#1085#1103#1090#1072' '#1092#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Top = 109.606370000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 517.795610000000000000
          Top = 86.929190000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 517.795610000000000000
          Top = 109.606370000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 517.795610000000000000
          Top = 132.283550000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 540.472790000000000000
          Top = 86.929190000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1047#1074#1110#1090#1085#1080#1081)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 540.472790000000000000
          Top = 109.606370000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1053#1086#1074#1080#1081' '#1079#1074#1110#1090#1085#1080#1081)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 540.472790000000000000
          Top = 132.283550000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1059#1090#1086#1095#1085#1102#1102#1095#1080#1081)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 302.362400000000000000
          Top = 343.937230000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 317.480520000000000000
          Top = 343.937230000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 332.598640000000000000
          Top = 343.937230000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 347.716760000000000000
          Top = 343.937230000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 362.834880000000000000
          Top = 343.937230000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSetGlobal."NUM_PACHKA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Left = 234.330860000000000000
          Top = 298.582870000000000000
          Width = 291.023810000000000000
          Frame.Typ = [ftTop]
        end
        object Memo89: TfrxMemoView
          Left = 211.653680000000000000
          Top = 298.582870000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1079#1074#1110#1090#1085#1080#1081' '#1087#1077#1088#1110#1086#1076')')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 544.252320000000000000
          Top = 56.692950000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1057#1090#1086#1088'.     1')
          ParentFont = False
        end
        object Line14: TfrxLineView
          Top = 109.606370000000000000
          Width = 22.677180000000000000
          Height = -22.677180000000000000
          Diagonal = True
        end
        object Line15: TfrxLineView
          Left = 517.795610000000000000
          Top = 86.929190000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Visible = False
          Diagonal = True
        end
        object Line16: TfrxLineView
          Left = 517.795610000000000000
          Top = 109.606370000000000000
          Width = 22.677180000000000000
          Height = -22.677180000000000000
          Visible = False
          Diagonal = True
        end
        object Line17: TfrxLineView
          Left = 517.795610000000000000
          Top = 109.606370000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Visible = False
          Diagonal = True
        end
        object Line18: TfrxLineView
          Left = 517.795610000000000000
          Top = 132.283550000000000000
          Width = 22.677180000000000000
          Height = -22.677180000000000000
          Visible = False
          Diagonal = True
        end
        object Line19: TfrxLineView
          Left = 517.795610000000000000
          Top = 132.283550000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Visible = False
          Diagonal = True
        end
        object Line20: TfrxLineView
          Left = 517.795610000000000000
          Top = 154.960730000000000000
          Width = 22.677180000000000000
          Height = -22.677180000000000000
          Visible = False
          Diagonal = True
        end
        object Line13: TfrxLineView
          Top = 86.929190000000000000
          Width = 22.677180000000000000
          Height = 22.677180000000000000
          Diagonal = True
        end
        object Memo75: TfrxMemoView
          Left = 3.779530000000000000
          Top = 234.330860000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              '('#1087#1086#1076#1072#1090#1082#1086#1074#1072' '#1072#1076#1088#1077#1089#1072' '#1102#1088#1080#1076#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080' '#1095#1080' '#1089#1072#1084#1086#1079#1072#1081#1085#1103#1090#1086#1111' '#1092#1110#1079#1080#1095#1085#1086#1111' '#1086#1089#1086#1073#1080 +
              ')')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Top = 219.212740000000000000
          Width = 638.740570000000000000
          Height = 15.118120000000000000
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSetGlobal."ADDRESS_UR_OSOBA"]')
          ParentFont = False
        end
        object Line21: TfrxLineView
          Left = 11.338590000000000000
          Top = 234.330860000000000000
          Width = 619.842920000000000000
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 325.039580000000000000
        ParentFont = False
        Top = 638.740570000000000000
        Width = 642.520100000000000000
        object Memo43: TfrxMemoView
          Left = 34.015770000000000000
          Width = 75.590548740000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            'x')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 109.606370000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDSet."SUM_NAR">,MasterData1)]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 177.637910000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDSet."SUM_VIPL">,MasterData1)]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 245.669450000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDSet."SUM_UD">,MasterData1)]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 313.700990000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDSet."SUM_PERER">,MasterData1)]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 381.732530000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            'x')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 415.748300000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            'x')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 483.779840000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            'x')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 551.811380000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            'x')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Width = 34.015748030000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            'x')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Top = 26.456710000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1088#1103#1076#1082#1110#1074)
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 109.606370000000000000
          Top = 26.456710000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 173.858380000000000000
          Top = 26.456710000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073)
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 328.819110000000000000
          Top = 26.456710000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataField = 'CNT_ALL'
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[frxDSetGlobal."CNT_ALL"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 404.409710000000000000
          Top = 26.456710000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1072#1088#1082#1091#1096#1110#1074)
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 525.354670000000000000
          Top = 26.456710000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[TOTALPAGES#]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Top = 64.252010000000000000
          Width = 120.944960000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1050#1077#1088#1110#1074#1085#1080#1082' '#1102#1088#1080#1076#1080#1095#1085#1086#1111
            #1086#1089#1086#1073#1080)
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 120.944960000000000000
          Top = 75.590600000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1082'. '#8470)
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 120.944960000000000000
          Top = 64.252010000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataField = 'TIN_DIRECTOR'
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[frxDSetGlobal."TIN_DIRECTOR"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 207.874150000000000000
          Top = 75.590600000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 264.567100000000000000
          Top = 75.590600000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080','#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 445.984540000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1090#1077#1083'.)')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 524.688003330000000000
          Top = 52.913420000000000000
          Width = 50.246753320000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1044#1072#1090#1072' '#1087#1086#1076#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 264.567100000000000000
          Top = 60.472480000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          DataField = 'DIRECTOR'
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSetGlobal."DIRECTOR"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 445.984540000000000000
          Top = 60.472480000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'TEL_DIRECTOR'
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSetGlobal."TEL_DIRECTOR"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Top = 113.385900000000000000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088)
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 120.944960000000000000
          Top = 124.724490000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1082'. '#8470)
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 120.944960000000000000
          Top = 109.606370000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[frxDSetGlobal."TIN_GLAVBUHG"]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 207.874150000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          Left = 264.567100000000000000
          Top = 124.724490000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080','#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 445.984540000000000000
          Top = 124.724490000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1090#1077#1083'.)')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 521.575140000000000000
          Top = 117.165430000000000000
          Width = 151.181200000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1053#1072#1074#1077#1076#1077#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103' '
            #1108' '#1087#1088#1072#1074#1080#1083#1100#1085#1086#1102)
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 264.567100000000000000
          Top = 109.606370000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSetGlobal."GLAVBUHG"]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 445.984540000000000000
          Top = 109.606370000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataSet = frxDSetGlobal
          DataSetName = 'frxDSetGlobal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDSetGlobal."TEL_GLAVBUHG"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 207.874150000000000000
          Top = 75.590600000000000000
          Width = 52.913420000000000000
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 264.567100000000000000
          Top = 75.590600000000000000
          Width = 177.637910000000000000
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 445.984540000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 207.874150000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000000000
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 268.346630000000000000
          Top = 124.724490000000000000
          Width = 173.858380000000000000
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          Left = 445.984540000000000000
          Top = 124.724490000000000000
          Width = 68.031540000000000000
          Frame.Typ = [ftTop]
        end
        object Memo90: TfrxMemoView
          Top = 147.401670000000000000
          Width = 109.606370000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1057#1072#1084#1086#1079#1072#1081#1085#1103#1090#1072' '
            #1092#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072' ')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 207.874150000000000000
          Top = 162.519790000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Line10: TfrxLineView
          Left = 207.874150000000000000
          Top = 162.519790000000000000
          Width = 56.692950000000000000
          Frame.Typ = [ftTop]
        end
        object Memo92: TfrxMemoView
          Left = 445.984540000000000000
          Top = 162.519790000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1090#1077#1083'.)')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 445.984540000000000000
          Top = 162.519790000000000000
          Width = 68.031540000000000000
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 3.779530000000000000
          Top = 196.535560000000000000
          Width = 634.961040000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo93: TfrxMemoView
          Top = 196.535560000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1087#1086#1074#1085#1102#1108#1090#1100#1089#1103' '#1089#1083#1091#1078#1073#1086#1074#1080#1084#1080' '#1086#1089#1086#1073#1072#1084#1080' '#1082#1086#1085#1090#1088#1086#1083#1102#1102#1095#1086#1075#1086' '#1086#1088#1075#1072#1085#1091)
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 64.252010000000000000
          Top = 230.551330000000000000
          Width = 540.472790000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 574.934756660000000000
          Top = 52.913420000000000000
          Width = 17.118120000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FDAY]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 608.504330000000000000
          Top = 52.913420000000000000
          Width = 41.574830000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FYEAR]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line22: TfrxLineView
          Left = 268.346630000000000000
          Top = 162.519790000000000000
          Width = 173.858380000000000000
          Frame.Typ = [ftTop]
        end
        object Memo103: TfrxMemoView
          Left = 268.346630000000000000
          Top = 162.519790000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080','#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 120.944960000000000000
          Top = 162.519790000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1082'. '#8470)
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 64.252010000000000000
          Top = 257.008040000000000000
          Width = 540.472790000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '  '#1057#1083#1091#1078#1073#1086#1074#1072' '#1086#1089#1086#1073#1072' '#1082#1086#1085#1090#1088#1086#1083#1102#1102#1095#1086#1075#1086' '#1086#1088#1075#1072#1085#1091'('#1087#1110#1076#1087#1080#1089','#1110#1085#1110#1094#1110#1072#1083#1080','#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Line23: TfrxLineView
          Left = 75.590600000000000000
          Top = 257.008040000000000000
          Width = 517.795610000000000000
          Frame.Typ = [ftTop]
        end
        object Memo94: TfrxMemoView
          Left = 64.252010000000000000
          Top = 230.551330000000000000
          Width = 540.472790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1042#1110#1076#1084#1110#1090#1082#1072' '#1087#1088#1086' '#1074#1085#1077#1089#1077#1085#1085#1103' '#1076#1072#1085#1080#1093' '#1076#1086' '#1077#1083#1077#1082#1090#1088#1086#1085#1085#1086#1111' '#1073#1072#1079#1080' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1111' '#1079#1074#1110#1090#1085 +
              #1086#1089#1090#1110' "__" ____________ 20__  '#1088'.')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Top = 226.771800000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1052'.'#1055'.')
          ParentFont = False
        end
        object Line24: TfrxLineView
          Left = 3.779530000000000000
          Top = 291.023810000000000000
          Width = 75.590600000000000000
          Frame.Typ = [ftTop]
        end
        object Memo107: TfrxMemoView
          Left = 3.779530000000000000
          Top = 294.803340000000000000
          Width = 631.181510000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            
              '* '#1044#1083#1103' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073', '#1103#1082#1110' '#1095#1077#1088#1077#1079' '#1089#1074#1086#1111' '#1088#1077#1083#1110#1075#1110#1111#1085#1110' '#1087#1077#1088#1077#1082#1086#1085#1072#1085#1085#1103' '#1074#1110#1076#1084#1086#1074 +
              #1083#1103#1102#1090#1100#1089#1103' '#1074#1110#1076' '#1087#1088#1080#1081#1085#1103#1090#1090#1103' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072' '#1086#1073#1083#1110#1082#1086#1074#1086#1111' '#1082#1072#1088#1090#1082#1080' '
            
              '  '#1087#1083#1072#1090#1085#1080#1082#1072' '#1087#1086#1076#1072#1090#1082#1110#1074' '#1090#1072' '#1087#1086#1074#1110#1076#1086#1084#1080#1083#1080' '#1087#1088#1086' '#1094#1077' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1080#1081' '#1086#1088#1075#1072#1085' '#1076#1077#1088#1078#1072 +
              #1074#1085#1086#1111' '#1087#1086#1076#1072#1090#1082#1086#1074#1086#1111' '#1089#1083#1091#1078#1073#1080' '#1110' '#1084#1072#1102#1090#1100' '#1074#1110#1076#1084#1110#1090#1082#1091' '#1091' '#1087#1072#1089#1087#1086#1088#1090#1110
            '       ')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 600.945270000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          DataSet = frxDSet
          DataSetName = 'frxDSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            'x')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 592.000000000000000000
          Top = 52.592763330000000000
          Width = 16.451453340000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FMON]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Width = 642.520100000000000000
        PrintOnFirstPage = False
        object Memo74: TfrxMemoView
          Left = 340.157700000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1055#1088#1086#1076#1086#1074#1078#1077#1085#1085#1103' '#1060#1086#1088#1084#1072' '#8470'1'#1044#1060'   '#1057#1090#1086#1088'. [PAGE#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDesigner: TfrxDesigner
    Restrictions = []
    Left = 32
    Top = 56
  end
  object DB: TpFIBDatabase
    DefaultTransaction = DefaultTransaction
    DefaultUpdateTransaction = DefaultTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 184
    Top = 8
  end
  object DSet: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 144
    Top = 56
    poSQLINT64ToBCD = True
  end
  object DefaultTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 224
    Top = 56
  end
  object frxDSet: TfrxDBDataset
    UserName = 'frxDSet'
    CloseDataSource = False
    DataSet = DSet
    Left = 144
    Top = 104
  end
  object DSetGlobal: TpFIBDataSet
    Database = DB
    Transaction = DefaultTransaction
    Left = 320
    Top = 56
    poSQLINT64ToBCD = True
  end
  object frxDSetGlobal: TfrxDBDataset
    UserName = 'frxDSetGlobal'
    CloseDataSource = False
    DataSet = DSetGlobal
    Left = 320
    Top = 104
  end
  object frxXLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 448
    Top = 24
  end
  object frxRTFExport: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 456
    Top = 80
  end
  object frxHTMLExport: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 448
    Top = 136
  end
end
