object fmKassaFiltrReport: TfmKassaFiltrReport
  Left = 473
  Top = 278
  Width = 579
  Height = 315
  Caption = 'fmKassaFiltrReport'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox5: TcxGroupBox
    Left = 8
    Top = 8
    Width = 553
    Height = 73
    Alignment = alTopLeft
    TabOrder = 0
    object cxRadioButton1: TcxRadioButton
      Left = 11
      Top = 42
      Width = 241
      Height = 19
      Caption = #1055#1077#1095#1072#1090#1100' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cxRadioButton2: TcxRadioButton
      Left = 273
      Top = 42
      Width = 243
      Height = 19
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093'  '#1074#1074#1077#1076#1077#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 15
      Top = 15
      Width = 106
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 2
      Caption = #1050#1085#1080#1075#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111' '#1079
    end
    object cxDateEdit1: TcxDateEdit
      Left = 128
      Top = 12
      Width = 89
      Height = 21
      TabOrder = 3
    end
    object cxDateEdit2: TcxDateEdit
      Left = 247
      Top = 12
      Width = 89
      Height = 21
      TabOrder = 4
    end
    object cxLabel22: TcxLabel
      Left = 223
      Top = 15
      Width = 20
      Height = 17
      TabStop = False
      TabOrder = 5
      Caption = #1087#1086
    end
    object cxLabel27: TcxLabel
      Left = 342
      Top = 15
      Width = 62
      Height = 17
      TabStop = False
      TabOrder = 6
      Caption = #1087#1077#1095#1072#1090#1072#1090#1100' '#1089
    end
    object cxSpinEdit11: TcxSpinEdit
      Left = 407
      Top = 12
      Width = 65
      Height = 21
      Properties.MaxValue = 1000.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 7
      Value = 1
    end
    object cxLabel28: TcxLabel
      Left = 479
      Top = 15
      Width = 42
      Height = 17
      TabStop = False
      AutoSize = False
      TabOrder = 8
      Caption = #1089#1090#1088'.'
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 83
    Width = 553
    Height = 109
    Alignment = alTopLeft
    TabOrder = 1
    object cxCheckBox1: TcxCheckBox
      Left = 5
      Top = 13
      Width = 395
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 
        #1044#1088#1091#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1080#1093' '#1079#1072' '#1073#1091#1093'. '#1086#1073#1083#1110#1082#1086#1084' '#1087#1086#1090#1086#1095#1085#1080#1084' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1077 +
        #1084
      TabOrder = 0
    end
    object cxCheckBox2: TcxCheckBox
      Left = 5
      Top = 36
      Width = 395
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1088#1091#1082' '#1079' '#1087#1110#1076#1089#1091#1084#1082#1086#1074#1086#1102' '#1089#1091#1084#1086#1102
      TabOrder = 1
    end
    object cxRadioButton3: TcxRadioButton
      Left = 9
      Top = 82
      Width = 242
      Height = 19
      Caption = #1058#1086#1083#1100#1082#1086' '#1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      TabOrder = 2
    end
    object cxRadioButtonPrihod: TcxRadioButton
      Left = 9
      Top = 61
      Width = 242
      Height = 19
      Caption = #1058#1086#1083#1100#1082#1086' '#1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      TabOrder = 3
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 196
    Width = 553
    Height = 73
    Alignment = alTopLeft
    TabOrder = 2
    object cxButtonPrint: TcxButton
      Left = 288
      Top = 32
      Width = 105
      Height = 25
      Caption = 'cxButtonPrint'
      Default = True
      TabOrder = 0
      OnClick = cxButtonPrintClick
      Glyph.Data = {
        62010000424D620100000000000082000000280000000F0000000E0000000100
        080000000000E0000000C20E0000C20E0000130000001300000000000000FFFF
        FF009C6B6B00B58C8C00FFE7D600F7DEC600FFF7EF00FFD6A500F7E7CE00FFFF
        F70000FF0000C8D0D4000000FF00C5C5C500C0C0C00084848400808080003939
        3900FFFFFF000B11111111111111111111110B0B0B001110101010100F0F0F0F
        0F11110B0B0011111111111111111111111111110B00110E0E0E0E0E0D0D0D0D
        0D0F11110B00110E0E0E0E0E0A0A0C0C0D0F0F111100110E0E0E0E0E0D0D0D0D
        0D0F0F0F11000B111111111111111111110D0F0F11000B0B0301080808080808
        01020D0F11000B0B0301070707070707090211110B000B0B0301060805080508
        09020B0B0B000B0B0B030907070707070701020B0B000B0B0B03090904040404
        0401020B0B000B0B0B0B030101010101010101020B000B0B0B0B0B0303030303
        030303020B00}
      UseSystemPaint = False
    end
    object cxButtonClose: TcxButton
      Left = 424
      Top = 32
      Width = 105
      Height = 25
      Cancel = True
      Caption = 'cxButtonClose'
      TabOrder = 1
      OnClick = cxButtonCloseClick
      Glyph.Data = {
        32040000424D3204000000000000360000002800000014000000110000000100
        180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
        00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
        4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
        A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
        FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
        DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
        FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
        84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
        FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
        FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
        00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
        9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
        FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
        00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
        5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
        73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
        FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
        DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
        31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
      UseSystemPaint = False
    end
    object cxCheckBoxEdit: TcxCheckBox
      Left = 427
      Top = 12
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 2
      Visible = False
    end
    object cxCheckBoxShow: TcxCheckBox
      Left = 11
      Top = 11
      Width = 284
      Height = 22
      AutoSize = False
      Properties.DisplayUnchecked = 'False'
      TabOrder = 3
    end
  end
  object ReportBookRash: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38621.945163888900000000
    ReportOptions.LastChange = 40345.416133715280000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 392
    Top = 80
    Datasets = <
      item
        DataSet = DBDatasetBookPrih
        DataSetName = 'DBDatasetBookPrih'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 166.299320000000000000
        Width = 680.315400000000000000
        DataSet = DBDatasetBookPrih
        DataSetName = 'DBDatasetBookPrih'
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDatasetBookPrih."DATE_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDatasetBookPrih."NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 128.504020000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDatasetBookPrih."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 313.700990000000000000
          Width = 287.244280000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDatasetBookPrih."OSNOVANIE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 600.945270000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
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
            '[DBDatasetBookPrih."SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 680.315400000000000000
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 510.236550000000000000
          Height = 7.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1051#1072#1073'."'#1052#1086#1076#1077#1083'.'#1087#1088#1086#1094'.'#1092#1080#1085'.'#1084#1101#1085#1077#1076#1078'."'#1044#1086#1085#1053#1059'. '#1047#1072#1082#1072#1079' '#8470' 10009 '#1086#1090' 26.09.2005 (' +
              'U[id_user][comp]DT [DATE][TIME])')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 582.047620000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1088'. [<Page#>+<count_page>-1] ')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Width = 672.756340000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DBDatasetBookPrih."R_NAME_PREDPR"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 26.456710000000000000
          Width = 680.315400000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1045#1043#1048#1057#1058#1056#1040#1062#1048#1054#1053#1053#1067#1049' '#1051#1048#1057#1058
            #1089' [date_beg]  '#1087#1086'  [date_end]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 521.575140000000000000
          Top = 18.897650000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[DBDatasetBookPrih."PRIHOD"]')
        end
        object Memo5: TfrxMemoView
          Top = 68.031540000000010000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1086#1082'-'#1090#1072)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 64.252010000000000000
          Top = 68.031540000000010000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1076#1086#1082'-'#1090#1072)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 128.504020000000000000
          Top = 68.031540000000010000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1084#1080#1083#1080#1103)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 313.700990000000000000
          Top = 68.031540000000010000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1085#1086#1074#1072#1085#1080#1077)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 600.945270000000000000
          Top = 68.031540000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1084#1072)
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 204.094620000000000000
        Width = 680.315400000000000000
        object Memo18: TfrxMemoView
          Left = 600.945270000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
            '[SUM(<DBDatasetBookPrih."SUMMA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Width = 600.945270000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object DBDatasetBookRash: TfrxDBDataset
    UserName = 'DBDatasetBookRash'
    CloseDataSource = False
    DataSet = DataSetBookPrih
    Left = 352
    Top = 80
  end
  object DataSetBookPrih: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'select * from KASSA_GET_BOOK_LIST('#39'01.01.2000'#39', '#39'01.01.2005'#39', 0,' +
        ' 0,0)')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 216
    Top = 72
    poSQLINT64ToBCD = True
    object DataSetBookPrihPRIHOD: TFIBStringField
      FieldName = 'PRIHOD'
      Size = 8
      EmptyStrToNull = True
    end
    object DataSetBookPrihR_NAME_PREDPR: TFIBStringField
      FieldName = 'R_NAME_PREDPR'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetBookPrihNUMBER: TFIBStringField
      FieldName = 'NUMBER'
      Size = 12
      EmptyStrToNull = True
    end
    object DataSetBookPrihFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 150
      EmptyStrToNull = True
    end
    object DataSetBookPrihOSNOVANIE: TFIBStringField
      FieldName = 'OSNOVANIE'
      Size = 200
      EmptyStrToNull = True
    end
    object DataSetBookPrihSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetBookPrihDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
  end
  object DBDatasetBookPrih: TfrxDBDataset
    UserName = 'DBDatasetBookPrih'
    CloseDataSource = False
    DataSet = DataSetBookPrih
    Left = 256
    Top = 72
  end
  object ReportBookPrih: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38621.945163888900000000
    ReportOptions.LastChange = 40371.642619895830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 288
    Top = 72
    Datasets = <
      item
        DataSet = DBDatasetBookRash
        DataSetName = 'DBDatasetBookRash'
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
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 170.078850000000000000
        Width = 680.315400000000000000
        DataSet = DBDatasetBookRash
        DataSetName = 'DBDatasetBookRash'
        RowCount = 0
        Stretched = True
        object Memo10: TfrxMemoView
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDatasetBookRash."DATE_DOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[DBDatasetBookRash."NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 128.504020000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDatasetBookRash."FIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 340.157700000000000000
          Width = 260.787570000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[DBDatasetBookRash."OSNOVANIE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 600.945270000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          StretchMode = smMaxHeight
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
            '[DBDatasetBookRash."SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 287.244280000000000000
        Width = 680.315400000000000000
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 510.236550000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            
              #1051#1072#1073'."'#1052#1086#1076#1077#1083'.'#1087#1088#1086#1094'.'#1092#1080#1085'.'#1084#1101#1085#1077#1076#1078'."'#1044#1086#1085#1053#1059'. '#1047#1072#1082#1072#1079' '#8470' 10010 '#1086#1090' 26.09.2005 (' +
              'U[id_user][comp]DT [DATE][TIME])')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 578.268090000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1088'. [<Page#>+<count_page>-1] ')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Width = 672.756340000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DBDatasetBookRash."R_NAME_PREDPR"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 34.015770000000010000
          Width = 680.315400000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1045#1043#1048#1057#1058#1056#1040#1062#1048#1054#1053#1053#1067#1049' '#1051#1048#1057#1058
            #1089' [date_beg]  '#1087#1086'  [date_end]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 521.575140000000000000
          Top = 18.897650000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[DBDatasetBookRash."PRIHOD"]')
        end
        object Memo5: TfrxMemoView
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1076#1086#1082'-'#1090#1072)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 64.252010000000000000
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1076#1086#1082'-'#1090#1072)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 128.504020000000000000
          Top = 71.811070000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1072#1084#1080#1083#1080#1103)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 340.157700000000000000
          Top = 71.811070000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1089#1085#1086#1074#1072#1085#1080#1077)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 600.945270000000000000
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1084#1072)
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 18.897650000000000000
        Top = 207.874150000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Left = 600.945270000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
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
            '[SUM(<DBDatasetBookRash."SUMMA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Width = 600.945270000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 128
    Top = 216
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 104
    Top = 216
  end
end
