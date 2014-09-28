object fmFilterPrtPlanFact: TfmFilterPrtPlanFact
  Left = 316
  Top = 133
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1076#1088#1091#1082#1091
  ClientHeight = 241
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object gbxPrtParams: TGroupBox
    Left = 0
    Top = 0
    Width = 361
    Height = 200
    Align = alClient
    TabOrder = 0
    object cbxPlanHoliday: TCheckBox
      Left = 13
      Top = 17
      Width = 80
      Height = 17
      Caption = #1055#1083#1072#1085#1086#1074#1110' : '
      Checked = True
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = cbxPlanHolidayClick
    end
    object cbxFactHoliday: TCheckBox
      Left = 13
      Top = 59
      Width = 100
      Height = 17
      Caption = #1060#1072#1082#1090#1080#1095#1085#1110' : '
      Checked = True
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      State = cbChecked
      TabOrder = 3
      OnClick = cbxFactHolidayClick
    end
    object edtPlanBeg: TqFDateControl
      Left = 99
      Top = 13
      Width = 121
      Height = 21
      DisplayName = #1079' '
      Interval = 25
      Value = 0
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Default = 0d
      Blocked = False
      TabOrder = 1
      AutoSaveToRegistry = False
    end
    object edtPlanEnd: TqFDateControl
      Tag = 1
      Left = 230
      Top = 13
      Width = 121
      Height = 21
      DisplayName = #1087#1086' '
      Interval = 25
      Value = 0
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Default = 0d
      Blocked = False
      TabOrder = 2
      AutoSaveToRegistry = False
    end
    object edtDepartment: TqFSpravControl
      Left = 5
      Top = 96
      Width = 348
      Height = 21
      DisplayName = #1055#1110#1076#1088#1086#1079#1076#1110#1083' :'
      Interval = 119
      Value = ''
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 6
      AutoSaveToRegistry = False
      OnOpenSprav = edtDepartmentOpenSprav
      DisplayText = ''
    end
    object edtFio: TqFSpravControl
      Left = 5
      Top = 138
      Width = 348
      Height = 21
      DisplayName = #1055#1030#1041' :'
      Interval = 119
      Value = Null
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Blocked = False
      TabOrder = 7
      AutoSaveToRegistry = False
      OnOpenSprav = edtFioOpenSprav
      DisplayText = ''
    end
    object edtFactEnd: TqFDateControl
      Tag = 3
      Left = 230
      Top = 55
      Width = 121
      Height = 21
      DisplayName = #1087#1086' '
      Interval = 25
      Value = 0
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Default = 0d
      Blocked = False
      TabOrder = 5
      AutoSaveToRegistry = False
    end
    object edtFactBeg: TqFDateControl
      Tag = 2
      Left = 99
      Top = 55
      Width = 121
      Height = 21
      DisplayName = #1079' '
      Interval = 25
      Value = 0
      LabelColor = clGreen
      Required = False
      Semicolon = False
      Asterisk = False
      Enabled = True
      Default = 0d
      Blocked = False
      TabOrder = 4
      AutoSaveToRegistry = False
    end
    object TypePers: TqFSpravControl
      Left = 124
      Top = 168
      Width = 229
      Height = 21
      FieldName = 'IN_TYPE_PERS'
      Interval = 0
      Value = Null
      LabelColor = clGreen
      Required = False
      Semicolon = True
      Asterisk = True
      Enabled = True
      Blocked = True
      TabOrder = 8
      AutoSaveToRegistry = False
      OnOpenSprav = TypePersOpenSprav
      DisplayText = ''
      DisplayTextField = 'NAME_TYPE_PERS'
    end
    object IsType: TCheckBox
      Left = 6
      Top = 171
      Width = 116
      Height = 17
      Caption = #1058#1080#1087' '#1087#1077#1088#1089#1086#1085#1072#1083#1091' :'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 9
      OnClick = IsTypeClick
    end
  end
  object pnlForButtons: TPanel
    Left = 0
    Top = 200
    Width = 361
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOK: TBitBtn
      Left = 153
      Top = 8
      Width = 75
      Height = 25
      Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080' <F10>'
      Caption = #1043#1072#1088#1072#1079#1076
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnOKClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FF00FF000066
        0000B73D3D00C95D5D00CC656500CD696900CE6D6D00D2777700149D2100179D
        270019AA2B001BA92E001AB02D001EAE31001EB1320025A83B0021B4370022B7
        380031B54D0031C24F003BCB5E0041C5630047D36D004FD6790053DE7F00D786
        8600DA909000DC959500DE9B9B00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        010100000000000000000000000000010E0E0100000000000000000000000113
        110C10010000000000000000000116140F010B0E010000000000000001171812
        010001090D010000000000000001150106020000010B01000000000000020106
        060602000001090100000000021A19060204060200000001010000021A1C0702
        0002030602000000010100000219020000000002040200000000000000020000
        0000000002030200000000000000000000000000000002020000000000000000
        0000000000000002020000000000000000000000000000000000}
    end
    object btnCancel: TBitBtn
      Left = 237
      Top = 8
      Width = 75
      Height = 25
      Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080' <Esc>'
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000FF00FF000000
        9A00012AF200002CF600002CF8000733F6000031FE000431FE000134FF000C3C
        FF00123BF100103BF400143EF400103DFB001743F6001B46F6001C47F6001D48
        F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
        FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
        FA002355FF002659FF002E5BF9002C5FFF00325DF1003B66F3003664FA00386B
        FF004071FA004274FF00497AFC00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010100
        00000000000101000000000001150B010000000001040601000000000113180B
        010000010306030100000000000110180B010104060301000000000000000111
        190D060603010000000000000000000118120D05010000000000000000000001
        1D181312010000000000000000000124241D1D19110100000000000000012829
        2401011F191F010000000000012A2A26010000011F231D0100000000012C2701
        00000000011F1901000000000001010000000000000101000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object BtnOk2: TBitBtn
      Left = 64
      Top = 8
      Width = 83
      Height = 25
      Hint = #1047#1072#1083#1080#1096#1082#1080
      Caption = #1047#1072#1083#1080#1096#1082#1080
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnOk2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object dbWork: TpFIBDatabase
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = [ddoStoreConnected, ddoNotSavePassword]
    WaitForRestoreConnect = 0
    Left = 136
    Top = 78
  end
  object dstWork: TpFIBDataSet
    Database = dbWork
    Transaction = trRead
    Options = [poTrimCharFields, poRefreshAfterPost, poAutoFormatFields]
    UpdateTransaction = trWrite
    Left = 179
    Top = 78
    poSQLINT64ToBCD = True
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    UserKindTransaction = 'ktrRead'
    Left = 225
    Top = 78
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbWork
    TimeoutAction = TARollback
    UserKindTransaction = 'ktrWrite'
    Left = 270
    Top = 78
  end
  object spcWork: TpFIBStoredProc
    Database = dbWork
    Transaction = trWrite
    Left = 136
    Top = 125
  end
  object frrWork: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39167.623648113400000000
    ReportOptions.LastChange = 39216.825048460650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var i    : integer;'
      '    s    : string;'
      '    ss   : string;'
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frdsWork."OUT_FIO_UA"> = s then'
      '  begin'
      '      memo20.memo.text := '#39#39';'
      '      memo22.memo.text := '#39#39';'
      '  end else'
      '  begin'
      '      i    := i + 1;'
      '      memo20.memo.text := intToStr(<i>);'
      '      ss := <frdsWork."OUT_POST_NAME">;'
      '      memo22.memo.text :=ss;'
      '  end;'
      '  s := <frdsWork."OUT_FIO_UA">;'
      'end;'
      ''
      'procedure rttTitleOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  s    := '#39#39';'
      '  i    := 0;'
      'end;'
      ''
      ''
      'begin'
      'end.')
    Left = 188
    Top = 125
    Datasets = <
      item
        DataSet = frdsWork
        DataSetName = 'frdsWork'
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
      object rttTitle: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 147.401670000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'rttTitleOnBeforePrint'
        object memTitle: TfrxMemoView
          Align = baCenter
          Left = 0.000000000000044298
          Top = 34.015770000000010000
          Width = 1046.929810000000000000
          Height = 26.456710000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1053' '#1040' '#1050' '#1040' '#1047)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Top = 64.252010000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              '__________________________ [frdsWork."CITY"] '#8470' _________________' +
              '_________')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 98.267780000000000000
          Width = 1046.929810000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1075#1110#1076#1085#1086' '#1075#1088#1072#1092#1110#1082#1091' '#1074#1110#1076#1087#1091#1089#1090#1086#1082' , '#1079#1072#1090#1074#1077#1088#1076#1078#1077#1085#1086#1084#1091' '#1087#1088#1086#1088#1077#1082#1090#1086#1088#1086#1084
            
              #1079' '#1085#1072#1074#1095#1072#1083#1100#1085#1086#1111' '#1088#1086#1073#1086#1090#1080' '#1110' '#1091#1079#1075#1086#1076#1078#1077#1085#1086#1084#1091' '#1079' '#1087#1088#1086#1092#1082#1086#1084#1086#1084', '#1085#1072#1076#1072#1090#1080' '#1097#1086#1088#1110#1095#1085#1091' '#1074#1110 +
              #1076#1087#1091#1089#1090#1082#1091' '#1085#1080#1078#1095#1077#1087#1077#1088#1077#1083#1110#1095#1077#1085#1080#1084' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072#1084' '#1091' '#1085#1072#1089#1090#1091#1087#1085#1080#1081' '#1090#1077#1088#1084#1110#1085':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baCenter
          Width = 1046.929810000000000000
          Height = 37.795300000000000000
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frdsWork."FIRM_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object mdtWork: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 325.039580000000000000
        Width = 1046.929810000000000000
        DataSet = frdsWork
        DataSetName = 'frdsWork'
        RowCount = 0
        Stretched = True
        object Memo20: TfrxMemoView
          Width = 30.135452530000000000
          Height = 18.897637795275590000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 30.236240000000000000
          Width = 294.702552530000000000
          Height = 18.897637795275590000
          OnBeforePrint = 'Memo21OnBeforePrint'
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frdsWork."OUT_FIO_UA"]')
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 325.039580000000000000
          Width = 219.212583780000000000
          Height = 18.897637795275590000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 604.724800000000000000
          Width = 139.842519690000000000
          Height = 18.897637795275590000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[(<frdsWork."OUT_PERIOD_BEG">)] -[(<frdsWork."OUT_PERIOD_END">)]')
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 744.567410000000000000
          Width = 162.519790000000000000
          Height = 18.897637795275590000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[(<frdsWork."OUT_HOLIDAY_PERIOD">)]')
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 18.897637795275590000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frdsWork."OUT_HOLIDAY_NAME"]')
          VAlign = vaCenter
        end
        object SysMemo6: TfrxSysMemoView
          Left = 544.252320000000100000
          Width = 60.472480000000000000
          Height = 18.897637795275590000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[(<frdsWork."OUT_DAYS_COUNT">)]')
          VAlign = vaCenter
        end
      end
      object cmhWork: TfrxColumnHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 34.015748030000000000
        ParentFont = False
        Top = 188.976500000000000000
        Width = 1046.929810000000000000
        object memEnd: TfrxMemoView
          Left = 604.724800000000000000
          Width = 139.842610000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072' '#1103#1082#1080#1081' '#1087#1077#1088#1110#1086#1076' '#1085#1072#1076#1072#1108#1090#1100#1089#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1072)
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 544.252320000000000000
          Width = 60.472480000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100
            #1082#1072#1083'. '#1076#1085#1110#1074)
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Width = 30.135452530000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470
            #1087'/'#1087)
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 30.236240000000000000
          Width = 294.702552530000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110)
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 325.039580000000000000
          Width = 219.212598425197000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1081#1084#1072#1085#1072' '#1087#1086#1089#1072#1076#1072)
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 744.566929133858000000
          Width = 162.519685040000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047' '#1103#1082#1086#1075#1086' '#1110' '#1087#1086' '#1103#1082#1080#1081' '#1095#1072#1089' '#1085#1072#1076#1072#1108#1090#1100#1089#1103' '#1074#1110#1076#1087#1091#1089#1090#1082#1072)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 907.087200000000000000
          Width = 139.842610000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072)
          VAlign = vaCenter
        end
      end
      object pgfPages: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 952.441560000000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
          VAlign = vaCenter
        end
      end
      object grhDepartment: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 283.464750000000000000
        Width = 1046.929810000000000000
        Condition = 'frdsWork."OUT_ID_DEPARTMENT"'
        ReprintOnNewPage = True
        Stretched = True
        object Memo23: TfrxMemoView
          Width = 544.252088110000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.Strings = (
            '[frdsWork."OUT_DEPARTMENT_NAME_UPPER"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 544.252320000000000000
          Width = 502.677258110000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 15790320
          DataSetName = 'ReportDsetData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frdsWork."OUT_DEPARTMENT_NAME"]')
          ParentFont = False
        end
      end
    end
  end
  object frdsWork: TfrxDBDataset
    UserName = 'frdsWork'
    CloseDataSource = False
    DataSet = dstWork
    Left = 241
    Top = 125
  end
  object RTFExport: TfrxRTFExport
    UseFileCache = True
    OpenAfterExport = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 312
    Top = 24
  end
  object HTMLExport: TfrxHTMLExport
    UseFileCache = True
    OpenAfterExport = True
    FixedWidth = True
    Background = False
    Left = 312
    Top = 80
  end
  object XLSExport: TfrxXLSExport
    UseFileCache = True
    OpenExcelAfterExport = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 312
    Top = 128
  end
end
