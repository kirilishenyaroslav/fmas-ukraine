object frmPrintSmetPlusPeriods: TfrmPrintSmetPlusPeriods
  Left = 344
  Top = 286
  Width = 686
  Height = 379
  Caption = #1044#1088#1091#1082' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074' '#1079#1072' '#1087#1077#1088#1110#1086#1076
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 300
    Width = 670
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Caption = #1044#1088#1091#1082
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 584
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 670
    Height = 300
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1041#1102#1076#1078#1077#1090#1080' + '#1075#1088#1091#1087#1080' '#1073#1102#1076#1078#1077#1090#1110#1074
      TabVisible = False
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 662
        Height = 269
        Align = alClient
        TabOrder = 0
        Visible = False
        object Label1: TLabel
          Left = 64
          Top = 28
          Width = 121
          Height = 21
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
        end
        object Label2: TLabel
          Left = 24
          Top = 59
          Width = 161
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
        end
        object Label3: TLabel
          Left = 48
          Top = 139
          Width = 289
          Height = 33
          AutoSize = False
          Caption = 
            '    '#1043#1088#1091#1087#1091#1074#1072#1090#1080' '#1079#1072' '#1082#1086#1096#1090#1086#1088#1080#1089#1072#1084#1080'                                    ' +
            '                                              - '#1075#1088#1091#1087#1072#1084#1080' '#1082#1086#1096#1090#1086#1088#1080#1089 +
            #1110#1074
          WordWrap = True
        end
        object Label4: TLabel
          Left = 56
          Top = 187
          Width = 305
          Height = 33
          AutoSize = False
          Caption = 
            '    '#1043#1088#1091#1087#1091#1074#1072#1090#1080' '#1079#1072' '#1075#1088#1091#1087#1072#1084#1080' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074'                             ' +
            '                                                      - '#1082#1086#1096#1090#1086#1088#1080#1089 +
            #1072#1084
          WordWrap = True
        end
        object cxDateEdit1: TcxDateEdit
          Left = 192
          Top = 24
          Width = 161
          Height = 24
          Style.Color = clInfoBk
          TabOrder = 0
        end
        object cxDateEdit2: TcxDateEdit
          Left = 192
          Top = 56
          Width = 161
          Height = 24
          Style.Color = clInfoBk
          TabOrder = 1
        end
        object cxRadioButton1: TcxRadioButton
          Left = 32
          Top = 139
          Width = 25
          Height = 17
          Checked = True
          TabOrder = 2
          TabStop = True
        end
        object cxRadioButton2: TcxRadioButton
          Left = 32
          Top = 187
          Width = 17
          Height = 17
          TabOrder = 3
        end
        object cxCheckBox1: TcxCheckBox
          Left = 280
          Top = 96
          Width = 273
          Height = 24
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = cxCheckBox1PropertiesChange
          Properties.Caption = #1047' '#1091#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084' '
          TabOrder = 4
        end
        object GroupBox1: TGroupBox
          Left = 344
          Top = 120
          Width = 313
          Height = 121
          TabOrder = 5
          object cxCheckBox2: TcxCheckBox
            Left = 16
            Top = 16
            Width = 273
            Height = 24
            Enabled = False
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = cxCheckBox2PropertiesChange
            Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1079#1072' '#1082#1086#1096#1090#1086#1088#1080#1089#1086#1084
            TabOrder = 0
          end
          object cxCheckBox3: TcxCheckBox
            Left = 16
            Top = 64
            Width = 281
            Height = 24
            Enabled = False
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = cxCheckBox3PropertiesChange
            Properties.Caption = #1060#1110#1083#1100#1090#1088' '#1079#1072' '#1075#1088#1091#1087#1086#1102' '#1082#1086#1096#1090#1086#1088#1080#1089#1091
            TabOrder = 1
          end
          object cxLookupComboBox1: TcxLookupComboBox
            Left = 21
            Top = 37
            Width = 280
            Height = 24
            Enabled = False
            Properties.ListColumns = <>
            Style.Color = clInfoBk
            TabOrder = 2
          end
          object cxLookupComboBox2: TcxLookupComboBox
            Left = 21
            Top = 85
            Width = 280
            Height = 24
            Enabled = False
            Properties.ListColumns = <>
            Style.Color = clInfoBk
            TabOrder = 3
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1041#1102#1076#1078#1077#1090#1080' + '#1087#1088#1086#1075#1088#1072#1084#1080' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      object Label5: TLabel
        Left = 8
        Top = 28
        Width = 177
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1074#1110#1090#1091
      end
      object Label6: TLabel
        Left = 8
        Top = 63
        Width = 177
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1050#1088#1080#1090#1077#1088#1110#1111' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1074#1110#1090#1091
      end
      object Label7: TLabel
        Left = 28
        Top = 94
        Width = 177
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1086#1075#1088#1072#1084#1072' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
      end
      object Label8: TLabel
        Left = 28
        Top = 121
        Width = 177
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1058#1080#1087' '#1082#1086#1096#1090#1110#1074
      end
      object Label9: TLabel
        Left = 28
        Top = 174
        Width = 177
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1043#1088#1091#1087#1072' '#1073#1102#1076#1078#1077#1090#1110#1074
        Enabled = False
      end
      object cxDateEdit3: TcxDateEdit
        Left = 200
        Top = 24
        Width = 161
        Height = 24
        Style.Color = clInfoBk
        TabOrder = 0
      end
      object cxButtonEdit1: TcxButtonEdit
        Left = 220
        Top = 93
        Width = 425
        Height = 24
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
      object cxButtonEdit2: TcxButtonEdit
        Left = 220
        Top = 121
        Width = 425
        Height = 24
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 2
      end
      object RadioButton1: TRadioButton
        Left = 24
        Top = 112
        Width = 81
        Height = 17
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 25
        Top = 174
        Width = 74
        Height = 17
        TabOrder = 4
        OnClick = RadioButton2Click
      end
      object cxButtonEdit3: TcxButtonEdit
        Left = 220
        Top = 173
        Width = 425
        Height = 24
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
        Style.Color = clInfoBk
        TabOrder = 5
      end
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 136
    Top = 314
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 104
    Top = 314
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38316.403727256900000000
    ReportOptions.LastChange = 40898.632588055550000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 8
    Top = 314
    Datasets = <
      item
        DataSet = SmPlusPeriodsDataset
        DataSetName = 'SmPlusPeriodsDataset'
      end>
    Variables = <
      item
        Name = ' Budgets'
        Value = Null
      end
      item
        Name = 'SM'
        Value = Null
      end
      item
        Name = 'RZ'
        Value = Null
      end
      item
        Name = 'ST'
        Value = Null
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
      Color = clWhite
      object ReportTitle1: TfrxReportTitle
        Height = 140.944960000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.417440000000000000
          Top = 0.866110000000000000
          Width = 714.331170000000000000
          Height = 25.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1091#1085#1082#1094#1110#1086#1085#1091#1102#1095#1110' '#1073#1102#1076#1078#1077#1090#1080' '#1079#1072' '#1082#1088#1080#1090#1077#1088#1110#1103#1084#1080':')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 30.236240000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.Strings = (
            '[PKV]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 71.811070000000000000
          Width = 718.110700000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.Strings = (
            '[TF]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Top = 113.385900000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[DD]')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 21.299212600000000000
        ParentFont = False
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        DataSet = SmPlusPeriodsDataset
        DataSetName = 'SmPlusPeriodsDataset'
        RowCount = 0
        Stretched = True
        object Memo3: TfrxMemoView
          Left = 614.551181100000000000
          Top = -0.000000000000000222
          Width = 101.669291340000000000
          Height = 21.299212600000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SmPlusPeriodsDataset."DATE_END"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 509.480314960000000000
          Top = -0.000000000000000222
          Width = 104.692913390000000000
          Height = 21.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SmPlusPeriodsDataset."DATE_BEG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Top = -0.000000000000000222
          Width = 123.590563390000000000
          Height = 21.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[SmPlusPeriodsDataset."SMETA_KOD"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 124.724490000000000000
          Top = -0.000000000000000222
          Width = 385.134041340000000000
          Height = 21.299212600000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SmPlusPeriodsDataset."SMETA_TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        Height = 57.897650000000000000
        Top = 219.212740000000000000
        Width = 718.110700000000000000
        RowCount = 1
        object Memo12: TfrxMemoView
          Left = 509.472553230000000000
          Top = 36.338590000000000000
          Width = 108.590910000000000000
          Height = 23.897610940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1095#1072#1090#1086#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 618.165740000000000000
          Top = 36.338590000000000000
          Width = 97.748300000000000000
          Height = 23.897610940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 510.307360000000000000
          Width = 206.638220000000000000
          Height = 36.795260940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1110#1086#1076' '#1092#1091#1085#1082#1094#1110#1086#1085#1091#1074#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 125.637910000000000000
          Width = 383.401980000000000000
          Height = 60.472440940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Width = 125.205010000000000000
          Height = 60.472440940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object Memo36: TfrxMemoView
          Left = 616.063390000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1089#1090#1088'. [Page]')
        end
      end
    end
  end
  object SmPlusPeriodsDataset: TfrxDBDataset
    UserName = 'SmPlusPeriodsDataset'
    CloseDataSource = False
    DataSet = SmetPlusPeriodsDataSet
    Left = 72
    Top = 314
  end
  object SmetPlusPeriodsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 40
    Top = 312
    poSQLINT64ToBCD = True
  end
end
