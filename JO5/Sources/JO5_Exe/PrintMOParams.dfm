object frmGetMOParams: TfrmGetMOParams
  Left = 684
  Top = 305
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1076#1088#1091#1082#1091' '#1084'.'#1086#1088#1076#1077#1088#1091
  ClientHeight = 158
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TcxButton
    Left = 146
    Top = 110
    Width = 75
    Height = 25
    Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080' - <F10>'
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnOKClick
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object btnCancel: TcxButton
    Left = 225
    Top = 110
    Width = 75
    Height = 25
    Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080' - <Esc>'
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object gbxPeriod: TGroupBox
    Left = 0
    Top = 0
    Width = 319
    Height = 89
    Align = alTop
    Caption = ' '#1055#1077#1088#1110#1086#1076' '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object lblYear: TLabel
      Left = 188
      Top = 24
      Width = 19
      Height = 13
      Caption = #1056#1110#1082
    end
    object lblMonth: TLabel
      Left = 13
      Top = 24
      Width = 42
      Height = 13
      Caption = #1052#1110#1089#1103#1094#1100
    end
    object edtMonth: TcxMRUEdit
      Left = 57
      Top = 20
      Width = 121
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 5
      Properties.ShowEllipsis = False
      Style.Color = 16247513
      TabOrder = 0
    end
    object edtYear: TcxSpinEdit
      Left = 210
      Top = 20
      Width = 70
      Height = 21
      Properties.ValueType = vtInt
      Style.Color = 16247513
      TabOrder = 1
    end
    object cxRadioButton1: TcxRadioButton
      Left = 32
      Top = 56
      Width = 113
      Height = 17
      Caption = #1052'.'#1086#1088#1076#1077#1088
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object cxRadioButton2: TcxRadioButton
      Left = 120
      Top = 56
      Width = 161
      Height = 17
      Caption = #1044#1086#1076#1072#1090#1086#1082' '#1076#1086' '#1084'.'#1086#1088#1076#1077#1088#1072
      TabOrder = 3
    end
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'concurrency')
    TPBMode = tpbDefault
    UserKindTransaction = 'ktrWrite'
    Left = 72
    Top = 164
  end
  object dbWork: TpFIBDatabase
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 164
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    UserKindTransaction = 'ktrRead'
    Left = 36
    Top = 164
  end
  object dstWork: TpFIBDataSet
    Database = dbWork
    Transaction = trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = trWrite
    Left = 111
    Top = 164
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object spcWork: TpFIBStoredProc
    Database = dbWork
    Transaction = trWrite
    Left = 156
    Top = 164
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38652.554073344900000000
    ReportOptions.LastChange = 41233.464613865740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.')
    Left = 16
    Top = 104
    Datasets = <
      item
        DataSet = frxDS
        DataSetName = 'frxDS'
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
      object ReportTitle1: TfrxReportTitle
        Height = 272.126160000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo22: TfrxMemoView
          Width = 328.819110000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[organization]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 332.598640000000000000
          Width = 385.512060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1058#1080#1087#1086#1074#1072'  '#1092#1086#1088#1084#1072' '#8470' 405-'#1072#1074#1090' ('#1073#1102#1076#1078#1077#1090')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 396.850650000000000000
          Top = 11.338590000000000000
          Width = 313.700990000000000000
          Height = 79.370130000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Memo.Strings = (
            #1047#1040#1058#1042#1045#1056#1044#1046#1045#1053#1054
            #1085#1072#1082#1072#1079#1086#1084' '#1044#1077#1088#1078#1072#1074#1085#1086#1075#1086' '
            #1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072' '#1059#1082#1088#1072#1111#1085#1080
            #1074#1110#1076' 27 '#1083#1080#1087#1085#1103' 2000 '#1088'. '#8470' 68')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Top = 102.047310000000000000
          Width = 151.181200000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076' '#1079#1072' '#1028#1044#1056#1055#1054#1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 154.960730000000000000
          Top = 105.826840000000000000
          Width = 143.622140000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[okpo]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 143.622140000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1045#1052#1054#1056#1030#1040#1051#1068#1053#1048#1049' '#1054#1056#1044#1045#1056' '#8470'5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 332.598640000000000000
          Top = 102.047310000000000000
          Width = 238.110390000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            #1050#1086#1076' '#1079#1072' '#1044#1050#1059#1044)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 570.709030000000000000
          Top = 102.047310000000000000
          Width = 147.401670000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 3.000000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Top = 200.315090000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' [period] '#1088'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Top = 234.330860000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1047#1074#1077#1076#1077#1085#1085#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1093' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081' '#1110#1079' '#1079#1072#1088#1086#1073#1110#1090#1085#1086#1111' '#1087#1083#1072#1090#1080' '#1090#1072' '#1089#1090#1080#1087#1077#1085#1076 +
              #1110#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Top = 166.299320000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '([sys_title])')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 786.142240000000000000
        Width = 718.110700000000000000
        object SysMemo3: TfrxSysMemoView
          Left = 483.779840000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[PAGE#] '#1079' [TOTALPAGES#]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            '[DATE][TIME]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 30.236240000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #8470' '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 45.354360000000000000
          Width = 328.819110000000000000
          Height = 30.236240000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1084#1110#1089#1090' '#1086#1087#1077#1088#1072#1094#1110#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 374.173470000000000000
          Width = 124.724490000000000000
          Height = 30.236240000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091', '#1050#1045#1050#1042)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 498.897960000000000000
          Width = 124.724490000000000000
          Height = 30.236240000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 188.976500000000000000
        Top = 574.488560000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1080#1082#1086#1085#1072#1074#1077#1094#1100':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 192.756030000000000000
          Top = 45.354360000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '________________'
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 355.275820000000000000
          Top = 45.354360000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '_________________'
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 517.795610000000000000
          Top = 45.354360000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '__________________'
            '('#1087#1088#1110#1079#1074#1080#1097#1077' '#1110' '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 90.708720000000000000
          Width = 113.385900000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1055#1077#1088#1077#1074#1110#1088#1080#1074':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 192.756030000000000000
          Top = 98.267780000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '________________'
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 355.275820000000000000
          Top = 98.267780000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '_________________'
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 517.795610000000000000
          Top = 98.267780000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '__________________'
            '('#1087#1088#1110#1079#1074#1080#1097#1077' '#1110' '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 139.842610000000000000
          Width = 166.299320000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 192.756030000000000000
          Top = 147.401670000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '________________'
            '('#1087#1086#1089#1072#1076#1072')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 355.275820000000000000
          Top = 147.401670000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '_________________'
            '('#1087#1110#1076#1087#1080#1089')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 517.795610000000000000
          Top = 147.401670000000000000
          Width = 158.740260000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '__________________'
            '('#1087#1088#1110#1079#1074#1080#1097#1077' '#1110' '#1110#1085#1110#1094#1110#1072#1083#1080')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1057#1091#1084#1072' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1079#1072' '#1084#1077#1084#1086#1088#1110#1072#1083#1100#1085#1080#1084' '#1086#1088#1076#1077#1088#1086#1084)
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          Left = 480.000310000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDS."SUMA">,MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 449.764070000000000000
        Width = 718.110700000000000000
        DataSet = frxDS
        DataSetName = 'frxDS'
        RowCount = 0
        Stretched = True
        object Memo31: TfrxMemoView
          Left = 374.173470000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDS."DB_SCH_TEXT"], [frxDS."DB_KEKV_TEXT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 498.897960000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDS."KR_SCH_TEXT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDS."SUMA"]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 22.677180000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        Condition = 'frxDS."OPER_TEXT"'
        OutlineText = 'frxDS."OPER_TEXT"'
        object Memo30: TfrxMemoView
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.Strings = (
            '[frxDS."OPER_TEXT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 491.338900000000000000
        Width = 718.110700000000000000
        object SysMemo5: TfrxSysMemoView
          Left = 449.764070000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDS."SUMA">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDS: TfrxDBDataset
    UserName = 'frxDS'
    CloseDataSource = False
    DataSet = dstWork
    Left = 48
    Top = 104
  end
  object dstWork_DOT: TpFIBDataSet
    Database = dbWork
    Transaction = trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = trWrite
    Left = 111
    Top = 124
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
end
