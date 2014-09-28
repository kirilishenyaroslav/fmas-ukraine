object TMo14MainForm: TTMo14MainForm
  Left = 295
  Top = 167
  Width = 591
  Height = 490
  Caption = #1047#1074#1110#1090#1080
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
    Top = 411
    Width = 575
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Caption = #1044#1088#1091#1082
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 575
    Height = 411
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1044#1088#1091#1082' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1093' '#1086#1088#1076#1077#1088#1110#1074
      Highlighted = True
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 567
        Height = 89
        Align = alTop
        TabOrder = 0
        object Label3: TLabel
          Left = 10
          Top = 9
          Width = 170
          Height = 16
          Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbMonthBeg: TcxComboBox
          Left = 190
          Top = 5
          Width = 220
          Height = 24
          Style.Color = clInfoBk
          TabOrder = 0
          Text = 'cbMonthBeg'
        end
        object cbYearBeg: TcxComboBox
          Left = 410
          Top = 5
          Width = 141
          Height = 24
          Style.Color = clInfoBk
          TabOrder = 1
          Text = 'cbYearBeg'
        end
        object cxCheckBox1: TcxCheckBox
          Left = 190
          Top = 32
          Width = 203
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cxCheckBox1PropertiesChange
          Properties.Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1086' '#1074#1080#1082#1086#1085#1072#1074#1094#1103#1084
          TabOrder = 2
        end
        object cxCheckBox2: TcxCheckBox
          Left = 190
          Top = 56
          Width = 339
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1044#1077#1090#1072#1083#1110#1079#1091#1074#1072#1090#1080' '#1076#1086' '#1088#1110#1074#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' + '#1087#1088#1086#1074#1086#1076#1082#1080
          State = cbsChecked
          TabOrder = 3
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 89
        Width = 567
        Height = 188
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LookAndFeel.Kind = lfStandard
        RootLevelOptions.DetailTabsPosition = dtpTop
        RootLevelStyles.Tab = column_gray
        RootLevelStyles.TabsBackground = column_gray
        object RegsView: TcxGridDBTableView
          DataController.DataSource = RegsDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.CellHints = True
          OptionsCustomize.GroupRowSizing = True
          OptionsData.Editing = False
          OptionsSelection.CellSelect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.Background = back
          Styles.Content = back
          Styles.Header = cxStyle1
          object RegsViewDBColumn5: TcxGridDBColumn
            Caption = #1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 207
            DataBinding.FieldName = 'REG_TITLE'
          end
          object RegsViewDBColumn1: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'id_reg'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          Caption = #1056#1077#1108#1089#1090#1088' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1093' '#1086#1088#1076#1077#1088#1110#1074
          GridView = RegsView
          Options.DetailTabsPosition = dtpTop
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 285
        Width = 567
        Height = 95
        Align = alBottom
        TabOrder = 2
        Visible = False
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 277
        Width = 567
        Height = 8
        HotZoneClassName = 'TcxMediaPlayer8Style'
        AlignSplitter = salBottom
        Control = Panel2
      end
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
    Left = 264
    Top = 262
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 328
    Top = 262
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 296
    Top = 262
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
    ReportOptions.LastChange = 41249.691992048610000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure GroupFooter1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 8
    Top = 264
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDS_DB
        DataSetName = 'frxDS_DB'
      end
      item
        DataSet = frxDS_KR
        DataSetName = 'frxDS_KR'
      end>
    Variables = <
      item
        Name = 'NUM'
        Value = 
          #39#1052#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1081' '#1086#1088#1076#1077#1088' '#8470'14-4 ('#1055#1088#1080#1082#1083#1072#1076#1085#1110' '#1088#1086#1079#1088#1086#1073#1082#1080' '#1079#1072' '#1085#1072#1087#1088#1103#1084#1072#1084#1080' '#1053#1058#1044' '#1042 +
          #1053#1047')'#39
      end
      item
        Name = 'DATA'
        Value = #39#1083#1080#1089#1090#1086#1087#1072#1076' 2012'#39
      end
      item
        Name = 'ORG_NAME_FULL'
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'OKPO'
        Value = #39'02070803'#39
      end
      item
        Name = 'num_form'
        Value = #39'274'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 1065.827460000000000000
        Width = 718.110700000000000000
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
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[NUM]')
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
        Height = 192.756030000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 139.842610000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[NUM]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 170.078850000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1053#1072#1082#1086#1087#1080#1095#1091#1074#1072#1083#1100#1085#1072' '#1074#1110#1076#1086#1084#1110#1089#1090#1100' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1076#1086#1093#1086#1076#1110#1074' '#1089#1087#1077#1094#1110#1072#1083#1100#1085#1086#1075#1086' '#1092#1086#1085#1076#1091' ' +
              #1073#1102#1076#1078#1077#1090#1085#1080#1093' '#1091#1089#1090#1072#1085#1086#1074)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 26.456710000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1079#1074#1072' '#1091#1089#1090#1072#1085#1086#1074#1080')')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 7.559060000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_NAME_FULL]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 453.543600000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' [num_form]-'#1072#1074#1090' ('#1073#1102#1076#1078#1077#1090')')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 453.543600000000000000
          Top = 18.897650000000000000
          Width = 192.756030000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1047#1040#1058#1042#1045#1056#1044#1046#1045#1053#1054
            #1085#1072#1082#1072#1079#1086#1084' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072
            #1059#1082#1088#1072#1111#1085#1080
            #1074#1110#1076' 27 '#1083#1080#1087#1085#1103' 2000 '#1088'. '#8470'68')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Top = 79.370130000000000000
          Width = 128.504020000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1030#1085#1076#1077#1085#1090#1092#1080#1082#1072#1094#1110#1081#1085#1080#1081' '
            #1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059)
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 132.283550000000000000
          Top = 90.708720000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[OKPO]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 461.102660000000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 559.370440000000000000
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object MasterData1: TfrxMasterData
        Height = 56.692950000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo5: TfrxMemoView
          Width = 34.015770000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 102.047310000000000000
          Width = 226.771800000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1110' '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072', '#1079#1084#1110#1089#1090' '#1086#1087#1077#1088#1072#1094#1110#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 445.984540000000000000
          Width = 117.165430000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090
            #1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 328.819110000000000000
          Width = 117.165430000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090' '
            '71_')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 563.149970000000000000
          Width = 151.181200000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 41.574830000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 102.047310000000000000
          Top = 41.574830000000000000
          Width = 226.771800000000000000
          Height = 15.118120000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 328.819110000000000000
          Top = 41.574830000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 445.984540000000000000
          Top = 41.574830000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 563.149970000000000000
          Top = 41.574830000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 34.015770000000000000
          Width = 68.031540000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 34.015770000000000000
          Top = 41.574830000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo11: TfrxMemoView
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
        object Memo13: TfrxMemoView
          Left = 102.047310000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Left = 328.819110000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Left = 445.984540000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
          Left = 563.149970000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
        object Memo60: TfrxMemoView
          Left = 34.015770000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_OPER"'
        OutlineText = 'frxDBDataset1."ID_OPER"'
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 438.425480000000000000
        Width = 718.110700000000000000
        object SysMemo4: TfrxSysMemoView
          Left = 563.149970000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData2)]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 468.661720000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086':')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 30.236240000000000000
        Top = 525.354670000000000000
        Width = 718.110700000000000000
        object Memo40: TfrxMemoView
          Top = 11.338590000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1076#1086' '#1076#1077#1073#1077#1090#1091' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 404.409710000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 566.929500000000000000
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        Height = 18.897650000000000000
        Top = 578.268090000000000000
        Width = 718.110700000000000000
        DataSet = frxDS_DB
        DataSetName = 'frxDS_DB'
        RowCount = 0
        object Memo44: TfrxMemoView
          Left = 404.409710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[frxDS_DB."DB_NUMBER"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 566.929500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[frxDS_DB."SUM"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 404.409710000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 619.842920000000000000
        Width = 718.110700000000000000
        object Memo47: TfrxMemoView
          Left = 404.409710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 566.929500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[SUM(<frxDS_DB."SUM">)]')
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        Height = 37.795300000000000000
        Top = 661.417750000000000000
        Width = 718.110700000000000000
        object Memo49: TfrxMemoView
          Top = 18.897650000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086' '#1076#1086' '#1082#1088#1077#1076#1080#1090#1091' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1110#1074':')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 404.409710000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1073#1088#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 566.929500000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 22.677180000000000000
        Top = 721.890230000000000000
        Width = 718.110700000000000000
        DataSet = frxDS_KR
        DataSetName = 'frxDS_KR'
        RowCount = 0
        object Memo52: TfrxMemoView
          Left = 404.409710000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftBottom]
        end
        object Memo53: TfrxMemoView
          Left = 404.409710000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[frxDS_KR."KR_NUMBER"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 566.929500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[frxDS_KR."SUM"]')
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        Height = 22.677180000000000000
        Top = 767.244590000000000000
        Width = 718.110700000000000000
        object Memo55: TfrxMemoView
          Left = 408.189240000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1072#1079#1086#1084':')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 570.709030000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[SUM(<frxDS_KR."SUM">)]')
          ParentFont = False
        end
      end
      object Header3: TfrxHeader
        Top = 351.496290000000000000
        Width = 718.110700000000000000
      end
      object Footer3: TfrxFooter
        Height = 22.677180000000000000
        Top = 480.000310000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          Top = -0.000000000000000028
          Width = 476.220780000000000000
          Height = 22.677180000000000000
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1091#1084#1072' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1079#1072' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1084' '#1086#1088#1076#1077#1088#1086#1084)
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 563.149970000000000000
          Top = -0.000000000000000028
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">)]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 192.756030000000000000
        Top = 850.394250000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Top = 30.236240000000000000
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
          Top = 49.133890000000000000
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
          Top = 49.133890000000000000
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
          Left = 483.779840000000000000
          Top = 49.133890000000000000
          Width = 230.551330000000000000
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
          Top = 71.811070000000100000
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
          Left = 480.000310000000000000
          Top = 94.488250000000000000
          Width = 234.330860000000000000
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
          Top = 117.165430000000000000
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
          Top = 136.063080000000000000
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
          Left = 480.000310000000000000
          Top = 136.063080000000000000
          Width = 234.330860000000000000
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
        object Memo39: TfrxMemoView
          Left = 3.779530000000000000
          Top = 170.078850000000000000
          Width = 1039.370750000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              '"__" ________________20__'#1088'.                                     ' +
              '                                                          '#1044#1086#1076#1072#1090#1086 +
              #1082' '#1085#1072' ____ '#1072#1088#1082#1091#1096#1072#1093)
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ResultsDataSet
    Left = 40
    Top = 264
  end
  object ResultsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from MBOOK_MO_GET_DATA('#39'01.09.2006'#39',0)')
    Left = 232
    Top = 263
    poSQLINT64ToBCD = True
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 72
    Top = 264
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 200
    Top = 262
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 136
    Top = 262
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
    Left = 168
    Top = 262
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 104
    Top = 263
  end
  object RegsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 8
    Top = 233
    poSQLINT64ToBCD = True
  end
  object RegsDataSource: TDataSource
    DataSet = RegsDataSet
    Left = 40
    Top = 233
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 73
    Top = 233
    object back: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object column_gray: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object periods: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object Ds_for_DB: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 108
    Top = 235
    poSQLINT64ToBCD = True
  end
  object DS_for_Kr: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 140
    Top = 235
    poSQLINT64ToBCD = True
  end
  object ds_vibor: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 172
    Top = 235
    poSQLINT64ToBCD = True
  end
  object frxDS_DB: TfrxDBDataset
    UserName = 'frxDS_DB'
    CloseDataSource = False
    DataSet = Ds_for_DB
    Left = 140
    Top = 203
  end
  object frxDS_KR: TfrxDBDataset
    UserName = 'frxDS_KR'
    CloseDataSource = False
    DataSet = DS_for_Kr
    Left = 172
    Top = 203
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 228
    Top = 219
  end
end
