object frmDisReport: TfrmDisReport
  Left = 276
  Top = 228
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1047#1074#1110#1090' '#1087#1086' '#1079#1074#1110#1083#1100#1085#1077#1085#1085#1103#1084
  ClientHeight = 83
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 48
    Width = 113
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 48
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 216
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 2
    OnClick = Button3Click
  end
  object cxLabel1: TcxLabel
    Left = 6
    Top = 9
    Width = 187
    Height = 25
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -16
    Style.Font.Name = 'Times New Roman'
    Style.Font.Style = [fsBold]
    TabOrder = 3
    Caption = #1056#1086#1079#1084#1110#1088' '#1096#1088#1080#1092#1090#1091' '#1085#1072' '#1076#1088#1091#1082#1091':'
  end
  object SizeFont: TcxTextEdit
    Left = 190
    Top = 11
    Width = 121
    Height = 24
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 4
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251'
      'sql_role_name=')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 8
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 40
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      
        'select i.id_item, pc.tn, p.Familia||'#39' '#39'||p.Imya||'#39' '#39'||p.Otchestv' +
        'o as RUS_FIO_UPPER,'
      '       d.not_used_holiday_count, m.is_post_main, sp.name_post,'
      
        '       (select sum(ms.rate_count) from  UP_DT_MAN_SMET MS where ' +
        'ms.id_man_moving = m.id_man_moving) as rate_count,'
      
        '       dep.name_full as name_kaf, dep2.name_full as name_fak, wr' +
        '.name_short'
      'from up_dt_man_dismission_inst d'
      
        '        left join up_dt_order_items_inst i on (d.id_order_item =' +
        ' i.id_item)'
      
        '        left join up_dt_man_moving m on (d.id_man_moving = m.id_' +
        'man_moving)'
      
        '        left join asup_ini_work_reason wr on (wr.id_work_reason ' +
        '= m.id_work_reason)'
      '        left join private_cards pc on (m.id_pcard = pc.id_pcard)'
      '        left join people p on (p.id_man = pc.id_man)'
      
        '        left join SP_POST_SALARY SPS on (m.id_post_salary_real =' +
        ' SPS.ID_POST_SALARY)'
      
        '        left join SP_POST_BASE_SALARY SPBS on (SPS.ID_POST_BASE_' +
        'SALARY = SPBS.ID_POST_BASE_SALARY)'
      '        left join SP_POST SP on (SPBS.ID_POST=SP.ID_POST)'
      
        '        left join sp_department dep on (dep.id_department = m.id' +
        '_department and dep.use_end = '#39'01.01.3333'#39')'
      
        '        left join sp_department dep2 on (dep.id_parent = dep2.id' +
        '_department and dep2.use_end = '#39'01.01.3333'#39')'
      'where i.linkto is null and'
      '      i.id_order = :ID_ORDER and'
      '      d.date_dismission BETWEEN SPBS.DATE_BEG AND SPBS.DATE_END'
      
        'order by dep2.name_full, dep.name_full, p.Familia||p.Imya||p.Otc' +
        'hestvo')
    Left = 72
    poSQLINT64ToBCD = True
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39256.448972256900000000
    ReportOptions.LastChange = 39973.610455902780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportTitle1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    MasterData1.font.size := <font_doc>;'
      'end;'
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 136
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDBottom'
      end
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxDSInfo'
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
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsUnderline]
        Height = 26.456710000000000000
        ParentFont = False
        Top = 325.039580000000000000
        Width = 642.520100000000000000
        Condition = 'frxDBDataset1."NAME_FAK"'
        Stretched = True
        object Memo1: TfrxMemoView
          Align = baClient
          Width = 642.520100000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_FAK"]')
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 22.677180000000000000
        ParentFont = False
        Top = 374.173470000000000000
        Width = 642.520100000000000000
        Condition = 'frxDBDataset1."NAME_KAF"'
        object Memo2: TfrxMemoView
          Align = baClient
          Width = 642.520100000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          AutoWidth = True
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_KAF"]')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 419.527830000000000000
        Width = 642.520100000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        KeepChild = True
        KeepFooter = True
        KeepTogether = True
        RowCount = 0
        Stretched = True
        object Memo3: TfrxMemoView
          Left = 98.267780000000000000
          Width = 279.685220000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."RUS_FIO_UPPER"]')
        end
        object Memo4: TfrxMemoView
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[Line#]')
        end
        object Memo5: TfrxMemoView
          Left = 49.133890000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."TN"]')
        end
        object Memo9: TfrxMemoView
          Left = 377.953000000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_POST"]')
        end
        object Memo11: TfrxMemoView
          Left = 540.472790000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."RATE_COUNT"]')
        end
        object Memo13: TfrxMemoView
          Left = 589.606680000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."NOT_USED_HOLIDAY_COUNT"]')
        end
        object Memo41: TfrxMemoView
          Left = 495.118430000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."NAME_SHORT"]')
        end
      end
      object Header1: TfrxHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Height = 22.677180000000000000
        ParentFont = False
        Top = 279.685220000000000000
        Width = 642.520100000000000000
        ReprintOnNewPage = True
        Stretched = True
        object Memo6: TfrxMemoView
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'.'#1087'.')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 49.133890000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1090'.'#1085'.')
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 98.267780000000000000
          Width = 279.685220000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1030#1041)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 377.953000000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 540.472790000000000000
          Width = 49.133890000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1074#1082#1072)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 589.606680000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1077' '#1074#1080#1082'. '#1076#1085#1110' '#1074#1110#1076#1087'.')
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 495.118430000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1089#1090'. '#1076#1083#1103' '#1088#1086#1073'.')
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 200.315090000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 642.520100000000000000
        OnBeforePrint = 'ReportTitle1OnBeforePrint'
        Stretched = True
        object Memo15: TfrxMemoView
          Top = 26.456710000000000000
          Width = 680.315400000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1053' '#1040' '#1050' '#1040' '#1047)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
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
          Memo.Strings = (
            '[ORGANIZATION]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 423.307360000000000000
          Top = 64.252010000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #8470)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 268.346630000000000000
          Top = 64.252010000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[city]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
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
        object Memo21: TfrxMemoView
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
        object Memo22: TfrxMemoView
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
        object Memo23: TfrxMemoView
          Left = 188.976500000000000000
          Top = 64.252010000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '200__'#1088'.')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 37.795300000000000000
          Top = 64.252010000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '"')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 75.590600000000000000
          Top = 64.252010000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '"')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 3.779530000000000000
          Top = 132.283550000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AllowHTMLTags = True
          HAlign = haBlock
          Memo.Strings = (
            '[frxDSInfo."BODY"]')
        end
        object Memo29: TfrxMemoView
          Left = 3.779530000000000000
          Top = 166.299320000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 597.165740000000000000
        Width = 642.520100000000000000
        object Memo31: TfrxMemoView
          Left = 438.425480000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page] '#1079' [TotalPages]')
        end
        object Memo38: TfrxMemoView
          Width = 676.535870000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            
              #1087#1088#1086#1077#1082#1090' '#8470' [frxDSInfo."NUM_PROJECT"] ([frxDSInfo."HASH_CODE"]) '#1074#1110#1076 +
              ' [frxDSInfo."DATE_PROJECT"]')
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 30.236240000000000000
        Top = 464.882190000000000000
        Width = 642.520100000000000000
        Condition = 'frxDBDBottom."PRINT_NUM"'
        KeepChild = True
        KeepTogether = True
        Stretched = True
        object Memo32: TfrxMemoView
          Top = 11.338590000000010000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            '[frxDBDBottom."L_TYPE_PRINT_NAME"]')
        end
        object Memo33: TfrxMemoView
          Left = 207.874150000000000000
          Top = 11.338590000000010000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            '[frxDBDBottom."C_TYPE_PRINT_NAME"]')
        end
        object Memo34: TfrxMemoView
          Left = 351.496290000000000000
          Top = 11.338590000000010000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            '[frxDBDBottom."R_TYPE_PRINT_NAME"]')
        end
      end
      object MasterData2: TfrxMasterData
        Height = 18.897650000000000000
        Top = 517.795610000000000000
        Width = 642.520100000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDBottom'
        KeepFooter = True
        KeepHeader = True
        RowCount = 0
        Stretched = True
        object Memo35: TfrxMemoView
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            '[frxDBDBottom."L_SIGNER_POST"]'
            '[frxDBDBottom."L_SIGNER_FIO"]')
        end
        object Memo36: TfrxMemoView
          Left = 207.874150000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            '[frxDBDBottom."C_SIGNER_POST"]'
            '[frxDBDBottom."C_SIGNER_FIO"]')
        end
        object Memo37: TfrxMemoView
          Left = 351.496290000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          AllowHTMLTags = True
          Memo.Strings = (
            '[frxDBDBottom."R_SIGNER_POST"]'
            '[frxDBDBottom."R_SIGNER_FIO"]')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSet1
    Left = 104
  end
  object DataSetFooter: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'select * from UP_DT_ORDERS_PRINT_ORDER_BOTTOM(:ID_ORDER)')
    Left = 168
    poSQLINT64ToBCD = True
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDBottom'
    CloseDataSource = False
    DataSet = DataSetFooter
    Left = 200
  end
  object DataSetInfo: TpFIBDataSet
    Database = Database
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      'select * from UP_DT_MAN_DISMISSION_GET_INFO(:ID_ORDER)')
    Left = 232
    poSQLINT64ToBCD = True
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDSInfo'
    CloseDataSource = False
    DataSet = DataSetInfo
    Left = 264
  end
end
