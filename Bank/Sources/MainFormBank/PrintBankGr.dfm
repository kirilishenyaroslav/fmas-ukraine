object fmPrintBankGr: TfmPrintBankGr
  Left = 452
  Top = 466
  Width = 644
  Height = 262
  Caption = 'fmPrintBankGr'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    628
    224)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = -1
    Top = 171
    Width = 628
    Height = 9
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsBottomLine
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 616
    Height = 41
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Bevel3: TBevel
    Left = 8
    Top = 64
    Width = 616
    Height = 105
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object cxDateEditBegin: TcxDateEdit
    Left = 105
    Top = 15
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 0
  end
  object cxDateEditEnd: TcxDateEdit
    Left = 268
    Top = 15
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 1
  end
  object cxButtonPrint: TcxButton
    Left = 345
    Top = 187
    Width = 115
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'cxButtonPrint'
    Default = True
    TabOrder = 2
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
    Left = 474
    Top = 187
    Width = 122
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'cxButtonClose'
    TabOrder = 3
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
  object cxLabel1: TcxLabel
    Left = 24
    Top = 16
    Width = 65
    Height = 17
    AutoSize = False
    TabOrder = 4
    Caption = #1055#1077#1088#1110#1086#1076' '#1079
  end
  object cxLabel2: TcxLabel
    Left = 240
    Top = 14
    Width = 25
    Height = 25
    AutoSize = False
    TabOrder = 5
    Caption = #1076#1086
  end
  object cxCheckBox1: TcxCheckBox
    Left = 19
    Top = 108
    Width = 433
    Height = 22
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082' '#1079#1072' '#1075#1088#1091#1087#1087#1072#1084#1080' '#1085#1072#1093#1086#1076#1078#1077#1085#1100
    TabOrder = 6
  end
  object cxCheckBox2: TcxCheckBox
    Left = 19
    Top = 140
    Width = 433
    Height = 22
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082' '#1079#1072' '#1075#1088#1091#1087#1072#1084#1080' '#1085#1072#1076#1093#1086#1076#1078#1077#1085#1100' '#1091' '#1088#1086#1079#1088#1099#1079#1099' '#1073#1102#1076#1078#1077#1090#1099#1074
    TabOrder = 7
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 74
    Width = 199
    Height = 18
    AutoSize = False
    TabOrder = 8
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1073#1072#1083#1072#1085#1089#1086#1074#1099#1081' '#1089#1095#1105#1090' '#1082#1072#1089#1089#1099
  end
  object cxComboBoxSch: TcxComboBox
    Left = 201
    Top = 73
    Width = 297
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.ReadOnly = False
    TabOrder = 9
  end
  object cxButton1: TcxButton
    Left = 497
    Top = 14
    Width = 113
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080' '#1087#1077#1088#1110#1086#1076
    TabOrder = 10
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 454
    Top = 131
    Width = 161
    Height = 25
    Caption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1077#1088#1110#1086#1076' ('#1084#1110#1089#1103#1094#1100', '#1088#1110#1082')'
    TabOrder = 11
    OnClick = cxButton2Click
  end
  object DataSetSch: TpFIBDataSet
    Database = fmBankMainForm.Database
    Transaction = fmBankMainForm.pFIBTransaction1
    Left = 400
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSetPrint: TpFIBDataSet
    Database = fmBankMainForm.Database
    Transaction = fmBankMainForm.pFIBTransaction1
    SelectSQL.Strings = (
      
        'select * from BANK_SELECT_SUMS_ONDATE_BY_GR('#39'01.01.2010'#39','#39'01.01.' +
        '2010'#39',1)')
    Left = 40
    Top = 182
    poSQLINT64ToBCD = True
    object DataSetPrintS_ID_SMETA: TFIBBCDField
      FieldName = 'S_ID_SMETA'
      Size = 0
      RoundByScale = True
    end
    object DataSetPrintALL_P_SUMMA: TFIBBCDField
      FieldName = 'ALL_P_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetPrintALL_R_SUMMA: TFIBBCDField
      FieldName = 'ALL_R_SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DataSetPrintS_ID_KEKV: TFIBBCDField
      FieldName = 'S_ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DataSetPrintR_KEKV_KOD: TFIBIntegerField
      FieldName = 'R_KEKV_KOD'
    end
    object DataSetPrintR_KEKV_TYTLE: TFIBStringField
      FieldName = 'R_KEKV_TYTLE'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetPrintR_ID_SM_GR: TFIBBCDField
      FieldName = 'R_ID_SM_GR'
      Size = 0
      RoundByScale = True
    end
    object DataSetPrintR_GROUP_KOD: TFIBIntegerField
      FieldName = 'R_GROUP_KOD'
    end
    object DataSetPrintR_GROUP_TITLE: TFIBStringField
      FieldName = 'R_GROUP_TITLE'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetPrintR_SMETA_TYTLE: TFIBStringField
      FieldName = 'R_SMETA_TYTLE'
      Size = 180
      EmptyStrToNull = True
    end
    object DataSetPrintR_SMETA_KOD: TFIBIntegerField
      FieldName = 'R_SMETA_KOD'
    end
    object DataSetPrintR_NAME_PRED: TFIBStringField
      FieldName = 'R_NAME_PRED'
      Size = 180
      EmptyStrToNull = True
    end
  end
  object ReportGrSm: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40254.522762395800000000
    ReportOptions.LastChange = 40263.754264502310000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 80
    Top = 182
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'day'
        Value = #39'11.02.2010'#39
      end
      item
        Name = 'korresp_sch'
        Value = #39'323/1160.1 ('#1055#1110#1076#1075#1086#1090#1086#1074#1082#1072' '#1082#1072#1076#1088#1110#1074' '#1042#1053#1047' III '#1110' IV '#1088#1110#1074#1085#1110#1074' '#1072#1082#1088#1077#1076#1080#1090#1072#1094#1110#1111')'#39
      end
      item
        Name = 'ras_sch'
        Value = #39'35229009000044'#39
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
      object ReportTitle1: TfrxReportTitle
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[frxDBDataset1."R_NAME_PRED"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 18.897650000000000000
          Top = 11.338590000000000000
          Width = 676.535870000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1074#1110#1090' '#1079#1072' '#1075#1088#1091#1087#1072#1084#1080' '#1085#1072#1076#1093#1086#1076#1078#1077#1085#1085#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 49.133890000000000000
          Width = 181.417440000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 75.590600000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1041#1072#1083#1072#1085#1089#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 98.267780000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1047#1072' '#1087#1077#1088#1110#1086#1076)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 181.417440000000000000
          Top = 49.133890000000000000
          Width = 514.016080000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[ras_sch]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 181.417440000000000000
          Top = 71.811070000000000000
          Width = 514.016080000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[korresp_sch]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 181.417440000000000000
          Top = 98.267780000000000000
          Width = 514.016080000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[date_beg]-[date_end]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 37.795300000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Width = 83.149660000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 544.252320000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 631.181510000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 83.149660000000000000
          Width = 461.102660000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1043#1088#1091#1087#1072' '#1082#1086#1096#1090#1086#1088#1080#1089#1110#1074)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 544.252320000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo14: TfrxMemoView
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataField = 'ALL_P_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."ALL_P_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          DataField = 'ALL_R_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."ALL_R_SUMMA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Top = 0.000000000000000028
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."R_KEKV_KOD"]')
        end
        object Memo9: TfrxMemoView
          Left = 83.149660000000000000
          Width = 461.102660000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."R_GROUP_KOD"] [<frxDBDataset1."R_GROUP_TITLE">]')
        end
      end
      object Footer1: TfrxFooter
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Width = 544.252320000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086':')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."ALL_P_SUMMA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 631.181510000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."ALL_R_SUMMA">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataSetPrint
    Left = 120
    Top = 182
  end
end
