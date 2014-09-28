object TMo14MainForm: TTMo14MainForm
  Left = 275
  Top = 169
  Width = 565
  Height = 248
  Caption = 
    #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#8470'14 "'#1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1076#1086#1093#1086#1076#1110#1074' '#1089#1087#1077#1094#1092#1086#1085#1076#1072'" ('#1055#1072#1088#1072#1084#1077#1090#1088 +
    #1080' '#1076#1088#1091#1082#1091')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 180
    Width = 557
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = #1044#1088#1091#1082
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 557
    Height = 139
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 181
      Height = 16
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 75
      Width = 74
      Height = 16
      Caption = #1055#1088#1086#1075#1088#1072#1084#1072
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 120
      Top = 101
      Width = 81
      Height = 16
      Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 212
      Top = 13
      Width = 295
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 212
      Top = 72
      Width = 295
      Height = 24
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxButtonEdit3: TcxButtonEdit
      Left = 212
      Top = 98
      Width = 295
      Height = 24
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxCheckBox1: TcxCheckBox
      Left = 23
      Top = 47
      Width = 250
      Height = 24
      Enabled = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1047' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074
      TabOrder = 3
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 22
      Top = 12
      Width = 149
      Height = 16
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076
    end
    object cbMonthBeg: TcxComboBox
      Left = 212
      Top = 8
      Width = 168
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 0
      Text = 'cbMonthBeg'
    end
    object cbYearBeg: TcxComboBox
      Left = 382
      Top = 8
      Width = 125
      Height = 24
      Style.Color = clInfoBk
      TabOrder = 1
      Text = 'cbYearBeg'
    end
  end
  object WorkDatabase: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 6
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 104
    Top = 6
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 72
    Top = 6
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbSave, pbExport, pbZoom, pbFind, pbNavigator]
    PreviewOptions.OutlineExpand = False
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39009.701654143500000000
    ReportOptions.LastChange = 39014.678487939820000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 296
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
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
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 548.031849999999900000
        Width = 1046.929810000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 857.953310000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[PAGE#] '#1079'  [TOTALPAGES#]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo31: TfrxMemoView
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#8470'14')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 105.826840000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Top = 3.779530000000001000
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#8470'14')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 438.425480000000000000
          Top = 34.015770000000010000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1079#1072' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 525.354670000000100000
          Top = 34.015770000000010000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm, yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DATA]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 56.692949999999990000
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.Strings = (
            
              #1053#1072#1082#1086#1087#1080#1095#1091#1074#1072#1083#1100#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1076#1086#1093#1086#1076#1110#1074' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1086#1075#1086' '#1092#1086#1085#1076#1091' ' +
              #1073#1102#1076#1078#1077#1090#1085#1080#1093' '#1091#1089#1090#1072#1085#1086#1074)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 207.874150000000000000
          Top = 83.149660000000000000
          Width = 835.276130000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm, yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[SCH_DATA]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Top = 83.149660000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm, yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1047#1092#1086#1088#1084#1086#1074#1072#1085#1086':[DATE] [TIME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 245.669450000000000000
        Width = 1046.929810000000000000
        RowCount = 1
        object Memo5: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'/'#1087)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 188.976500000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1084#1110#1089#1090' '#1086#1087#1077#1088#1072#1094#1110#1111)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 532.913730000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 699.213050000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 857.953310000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 287.244280000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo11: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NPP"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 94.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DT_PROV"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 188.976500000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."OPER_COMMENT"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 532.913730000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."KR_NUMBER"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 699.213050000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DB_NUMBER"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 857.953310000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 158.740260000000100000
        Top = 366.614410000000000000
        Width = 1046.929810000000000000
        object SysMemo3: TfrxSysMemoView
          Left = 857.953310000000000000
          Top = 3.779530000000022000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData2,2)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 3.779530000000022000
          Width = 857.953310000000000000
          Height = 22.677180000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1057#1091#1084#1072' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1079#1072' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1084' '#1086#1088#1076#1077#1088#1086#1084)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Top = 30.236239999999960000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100':')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 113.385900000000000000
          Top = 49.133890000000010000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 298.582870000000000000
          Top = 49.133890000000010000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 634.961040000000000000
          Top = 49.133890000000010000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Top = 71.811070000000090000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1055#1077#1088#1077#1074#1110#1088#1080#1074':')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 113.385900000000000000
          Top = 94.488250000000100000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 298.582870000000000000
          Top = 94.488250000000100000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 634.961040000000000000
          Top = 94.488250000000100000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 117.165430000000100000
          Width = 241.889920000000000000
          Height = 37.795300000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088':')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 298.582870000000000000
          Top = 136.063080000000100000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 634.961040000000000000
          Top = 136.063080000000100000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.Strings = (
            '('#1110#1085#1110#1094#1110#1072#1083#1080' '#1110' '#1087#1088#1110#1079#1074#1080#1097#1077')')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 185.196970000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDataset1."PKV_TYPEF_TITLE"'
        KeepTogether = True
        OutlineText = 'frxDBDataset1."PKV_TYPEF_TITLE"'
        object Memo34: TfrxMemoView
          Left = 75.590600000000000000
          Width = 971.339210000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."PKV_KOD"]  "[frxDBDataset1."PKV_TITLE"]"')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1055#1088#1086#1075#1088#1072#1084#1072)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 75.590600000000000000
          Top = 18.897650000000000000
          Width = 971.339210000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            
              '[frxDBDataset1."TYPE_FINANCE_CODE"]  "[frxDBDataset1."TYPE_FINAN' +
              'CE_TITLE"]"')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Top = 18.897650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1058#1080#1087' '#1082#1086#1096#1090#1110#1074)
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ResultsDataSet
    Left = 328
    Top = 16
  end
  object ResultsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from MBOOK_MO_GET_DATA('#39'01.09.2006'#39',0)')
    Left = 8
    Top = 8
    poSQLINT64ToBCD = True
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 376
    Top = 16
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 504
    Top = 14
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 440
    Top = 14
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
    Left = 472
    Top = 14
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 408
    Top = 14
  end
end
