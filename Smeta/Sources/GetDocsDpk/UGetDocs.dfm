object frmDocReestrEx: TfrmDocReestrEx
  Left = 406
  Top = 225
  BorderStyle = bsDialog
  Caption = 
    #1050#1088#1080#1090#1077#1088#1110#1111' '#1074#1080#1073#1086#1088#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074', '#1103#1082#1110' '#1074#1087#1083#1080#1074#1072#1102#1090#1100' '#1085#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1092#1072#1082#1090#1080#1095#1085#1080 +
    #1093' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074
  ClientHeight = 354
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 313
    Width = 654
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 568
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton3: TcxButton
      Left = 480
      Top = 8
      Width = 83
      Height = 25
      Caption = #1054#1050
      TabOrder = 1
      OnClick = cxButton3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 313
    Align = alClient
    TabOrder = 1
    object Label4: TLabel
      Left = 68
      Top = 12
      Width = 74
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 81
      Top = 65
      Width = 60
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1056#1086#1079#1076#1110#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 81
      Top = 89
      Width = 60
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1057#1090#1072#1090#1090#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 114
      Width = 318
      Height = 98
      Caption = #1055#1077#1088#1110#1086#1076' '#1076#1083#1103' '#1074#1080#1073#1086#1088#1091
      TabOrder = 0
      object Label1: TLabel
        Left = 21
        Top = 32
        Width = 67
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1086#1095#1072#1090#1086#1082
      end
      object Label2: TLabel
        Left = 8
        Top = 64
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
      end
    end
    object edSm: TcxTextEdit
      Left = 148
      Top = 9
      Width = 500
      Height = 24
      TabStop = False
      Properties.AutoSelect = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clMenu
      TabOrder = 1
    end
    object edRz: TcxTextEdit
      Left = 148
      Top = 62
      Width = 500
      Height = 24
      TabStop = False
      Properties.AutoSelect = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clMenu
      TabOrder = 2
      Text = #1055#1086' '#1074#1089#1110#1084' '#1088#1086#1079#1076#1110#1083#1072#1084
    end
    object edSt: TcxTextEdit
      Left = 148
      Top = 85
      Width = 500
      Height = 24
      TabStop = False
      Properties.AutoSelect = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clMenu
      TabOrder = 3
      Text = #1055#1086' '#1074#1089#1110#1084' '#1089#1090#1072#1090#1090#1103#1084
    end
    object cbMonthBeg: TComboBox
      Left = 99
      Top = 142
      Width = 130
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      OnChange = cbMonthBegChange
    end
    object cbYearBeg: TComboBox
      Left = 229
      Top = 142
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 5
      OnChange = cbYearBegChange
    end
    object cbMonthEnd: TComboBox
      Left = 99
      Top = 174
      Width = 130
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 6
    end
    object cbYearEnd: TComboBox
      Left = 229
      Top = 174
      Width = 88
      Height = 22
      Style = csOwnerDrawFixed
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 7
    end
    object GroupBox3: TGroupBox
      Left = 328
      Top = 174
      Width = 319
      Height = 75
      Caption = #1058#1080#1087' '#1076#1086#1093#1086#1076#1085#1086#1089#1090#1110
      TabOrder = 8
      object RandD: TcxRadioButton
        Left = 16
        Top = 16
        Width = 153
        Height = 17
        Caption = #1044#1086#1093#1086#1076#1080' '#1081' '#1074#1080#1076#1072#1090#1082#1080
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object D: TcxRadioButton
        Left = 16
        Top = 32
        Width = 73
        Height = 17
        Caption = #1044#1086#1093#1086#1076#1080
        TabOrder = 1
      end
      object R: TcxRadioButton
        Left = 16
        Top = 50
        Width = 73
        Height = 17
        Caption = #1042#1080#1076#1072#1090#1082#1080
        TabOrder = 2
      end
    end
    object RunByAllBudget: TcxCheckBox
      Left = 145
      Top = 33
      Width = 164
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox3PropertiesChange
      Properties.Caption = #1055#1086' '#1073#1102#1076#1078#1077#1090#1091' '#1074#1094#1110#1083#1086#1084#1091
      TabOrder = 9
    end
    object cxRadioGroup1: TcxRadioGroup
      Left = 328
      Top = 113
      Width = 320
      Height = 60
      ItemIndex = 0
      Properties.Items = <
        item
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081
        end
        item
          Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081
        end>
      TabOrder = 10
      Caption = #1058#1080#1087' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
    end
    object cxRadioGroup2: TcxRadioGroup
      Left = 8
      Top = 211
      Width = 319
      Height = 98
      ItemIndex = 1
      Properties.Items = <
        item
          Caption = #1055#1086' '#1085#1086#1084#1077#1088#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        item
          Caption = #1055#1086' '#1076#1072#1090#1110' '#1079#1074#1110#1090#1085#1086#1075#1086' '#1087#1077#1088#1110#1086#1076#1091
        end
        item
          Caption = #1055#1086' '#1089#1091#1084#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end>
      TabOrder = 11
      Caption = #1042#1087#1086#1088#1103#1076#1082#1091#1074#1072#1090#1080' '#1088#1077#1079#1091#1083#1100#1090#1091#1102#1095#1080#1081' '#1088#1077#1108#1089#1090#1088
    end
    object CheckTypeBudget: TcxRadioGroup
      Left = 328
      Top = 249
      Width = 320
      Height = 60
      ItemIndex = 0
      Properties.Items = <
        item
          Caption = #1055#1086#1074#1085#1080#1081' ('#1076#1077#1090#1072#1083#1110#1079#1072#1094#1110#1103' '#1076#1086' '#1088#1110#1074#1085#1103' '#1087#1088#1086#1074#1086#1076#1082#1080')'
        end
        item
          Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' ('#1076#1077#1090#1072#1083#1110#1079#1072#1094#1110#1103' '#1076#1086' '#1088#1110#1074#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072')'
        end>
      TabOrder = 12
      Caption = #1058#1080#1087' '#1079#1074#1110#1090#1091
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 8
    Top = 6
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 8
    Top = 38
  end
  object PrintDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 41
    Top = 38
    poSQLINT64ToBCD = True
  end
  object DocReestr: TfrxDBDataset
    UserName = 'DocReestr'
    CloseDataSource = False
    DataSet = PrintDataSet
    Left = 8
    Top = 69
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline]
    PreviewOptions.DoubleBuffered = False
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    ReportOptions.CreateDate = 38316.403727256900000000
    ReportOptions.LastChange = 38803.613838541660000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 41
    Top = 69
    Datasets = <
      item
        DataSet = DocReestr
        DataSetName = 'DocReestr'
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
        Height = 84.252010000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 29.874150000000000000
          Top = 38.661409999999990000
          Width = 404.409710000000000000
          Height = 30.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1056#1077#1108#1089#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1087#1110#1076' '#1073#1102#1076#1078#1077#1090#1086#1084' '#1079#1072)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 30.236240000000000000
          Top = 58.811070000000000000
          Width = 668.976810000000000000
          Height = 20.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090' [SM]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 434.645950000000000000
          Top = 38.795300000000000000
          Width = 109.063080000000000000
          Height = 30.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd mm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_BEG]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 546.016080000000000000
          Top = 38.795300000000000000
          Width = 14.897650000000000000
          Height = 30.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '-')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 563.913730000000000000
          Top = 38.795300000000000000
          Width = 105.063080000000000000
          Height = 30.574830000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd mm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[DATE_END]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          Left = 105.826840000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            '[DATE]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1088#1091#1082#1091)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 28.708720000000000000
        ParentFont = False
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        DataSet = DocReestr
        DataSetName = 'DocReestr'
        RowCount = 0
        Stretched = True
        object Memo19: TfrxMemoView
          Left = 1.015770000000000000
          Top = 0.377952760000027800
          Width = 63.496062990000000000
          Height = 27.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DOCREESTR."DOC_NUM"]'
            '([DOCREESTR."DATE_DOC"])')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 66.897593860000100000
          Top = 0.377952760000027800
          Width = 67.692913390000000000
          Height = 27.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DOCREESTR."DATE_REG"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 135.307042680000000000
          Top = 0.377952760000027800
          Width = 36.661417320000000000
          Height = 27.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DOCREESTR."DB_NUMER_SCH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 176.503888190000000000
          Top = 0.377952760000027800
          Width = 36.661417320000000000
          Height = 27.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DOCREESTR."KR_NUMER_SCH"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 214.850650000000000000
          Top = 0.377952760000027800
          Width = 67.354330710000000000
          Height = 27.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[DOCREESTR."CALC_PROV_SUM"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 283.559370000000000000
          Top = 0.377952760000027800
          Width = 174.750600000000000000
          Height = 27.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haBlock
          Memo.Strings = (
            '[DOCREESTR."CUSTOMER_NAME"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 459.386919360000000000
          Top = 0.377952760000027800
          Width = 257.864020000000000000
          Height = 27.212598430000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Color = clWhite
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haBlock
          Memo.Strings = (
            '[DOCREESTR."DOC_NOTE"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 18.897650000000000000
        Top = 653.858690000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 532.913730000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[PAGE#] '#1079' [TOTALPAGES#]')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        Condition = 'DocReestr."ST_TITLE"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'DocReestr."ST_TITLE"'
        object Memo38: TfrxMemoView
          Left = 257.008040000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsUnderline]
          Memo.Strings = (
            '[DOCREESTR."ST_TITLE"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 143.622140000000000000
          Width = 112.417440000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DOCREESTR."ST_NUM"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        Condition = 'DocReestr."RZ_TITLE"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'DocReestr."RZ_TITLE"'
        object Memo37: TfrxMemoView
          Left = 182.992270000000000000
          Top = 2.000000000000000000
          Width = 385.512060000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DOCREESTR."RZ_TITLE"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 66.826840000000000000
          Top = 2.000000000000000000
          Width = 112.417440000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DOCREESTR."RZ_NUM"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 0.559060000000000000
          Top = 1.000000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
          ParentFont = False
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 30.677180000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        Condition = 'DocReestr."RZ_PROFITABLE_TEXT"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'DocReestr."RZ_PROFITABLE_TEXT"'
        object Memo39: TfrxMemoView
          Left = 157.740260000000000000
          Top = 3.000000000000000000
          Width = 393.071120000000000000
          Height = 22.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[DOCREESTR."RZ_PROFITABLE_TEXT"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 60.472480000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 0.779530000000000000
          Top = -0.000000000000014211
          Width = 65.527830000000000000
          Height = 60.456710000000000000
          AllowHTMLTags = True
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 67.078850000000100000
          Width = 67.527830000000000000
          Height = 60.472440940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090#1085#1110#1081' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 135.464750000000000000
          Width = 78.661720000000000000
          Height = 28.236240000000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 135.464750000000000000
          Top = 28.236240000000010000
          Width = 36.575140000000000000
          Height = 32.236240000000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 172.716760000000000000
          Top = 28.236240000000010000
          Width = 40.818890310000000000
          Height = 32.236240000000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 214.559370000000000000
          Width = 68.527830000000000000
          Height = 60.472440940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 283.724800000000000000
          Width = 176.118430000000000000
          Height = 60.472440940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
            '/'#1087#1083#1072#1090#1085#1080#1082)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 459.480830000000000000
          Width = 259.031850000000000000
          Height = 60.472440940000000000
          AllowHTMLTags = True
          Color = clSilver
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 34.015770000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        object Memo32: TfrxMemoView
          Left = 71.811070000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.Strings = (
            #1057#1091#1084#1072' '#1087#1086' '#1089#1090#1072#1090#1090#1110)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 215.433210000000000000
          Width = 70.842610000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<DocReestr."CALC_PROV_SUM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 75.590600000000000000
          Top = 22.677180000000020000
          Width = 642.520100000000000000
          Frame.Typ = [ftTop]
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 34.015770000000000000
        Top = 498.897960000000000000
        Width = 718.110700000000000000
        object Memo34: TfrxMemoView
          Left = 11.338590000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1091#1084#1072' '#1087#1086' '#1088#1086#1079#1076#1110#1083#1091)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 151.181200000000000000
          Width = 222.023810000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<DocReestr."CALC_PROV_SUM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 7.559060000000000000
          Top = 26.456709999999930000
          Width = 710.551640000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 37.795300000000000000
        Top = 555.590910000000000000
        Width = 718.110700000000000000
        object Memo44: TfrxMemoView
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DOCREESTR."RZ_PROFITABLE_TEXT"] '#1074#1089#1100#1086#1075#1086)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779530000000022000
          Width = 433.677490000000000000
          Height = 18.897650000000000000
          DataSet = DocReestr
          DataSetName = 'DocReestr'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<DocReestr."CALC_PROV_SUM">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 30.236239999999960000
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 3.000000000000000000
        end
      end
    end
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 424
    Top = 6
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 456
    Top = 6
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
    Left = 488
    Top = 6
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 520
    Top = 6
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
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
    ShowProgress = True
    Left = 392
    Top = 6
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 16
    Top = 321
  end
end
