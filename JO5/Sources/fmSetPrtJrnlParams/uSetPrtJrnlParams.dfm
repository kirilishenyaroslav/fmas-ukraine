object fmSetPrtJrnlParams: TfmSetPrtJrnlParams
  Left = 462
  Top = 235
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1076#1088#1091#1082#1091' '#1078#1091#1088#1085#1072#1083#1091
  ClientHeight = 196
  ClientWidth = 295
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
    Left = 138
    Top = 166
    Width = 75
    Height = 25
    Hint = #1055#1088#1080#1081#1085#1103#1090#1080' '#1079#1084#1110#1085#1080' - <F10>'
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object btnCancel: TcxButton
    Left = 217
    Top = 166
    Width = 75
    Height = 25
    Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1079#1084#1110#1085#1080' - <Esc>'
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object gbxParamsPrtJrnl: TGroupBox
    Left = 0
    Top = 55
    Width = 295
    Height = 104
    Align = alTop
    Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1079#1074#1110#1090#1085#1086#1111' '#1092#1086#1088#1084#1080' '#1078#1091#1088#1085#1072#1083#1091'  '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object cbxSCH: TcxCheckBox
      Left = 12
      Top = 20
      Width = 102
      Height = 21
      ParentColor = False
      Properties.DisplayUnchecked = 'False'
      Properties.NullStyle = nssUnchecked
      Properties.Caption = #1056#1072#1093#1091#1085#1086#1082
      Style.Color = clBtnFace
      TabOrder = 0
      OnClick = cbxSCHClick
    end
    object cbxGrSmet: TcxCheckBox
      Tag = 2
      Left = 12
      Top = 71
      Width = 100
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.NullStyle = nssUnchecked
      Properties.Caption = #1043#1088'.'#1073#1102#1076#1078#1077#1090#1110#1074
      TabOrder = 1
      OnClick = cbxSCHClick
    end
    object cbxSmet: TcxCheckBox
      Tag = 3
      Left = 128
      Top = 20
      Width = 100
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.NullStyle = nssUnchecked
      Properties.Caption = #1041#1102#1076#1078#1077#1090
      TabOrder = 2
      OnClick = cbxSCHClick
    end
    object cbxRazd: TcxCheckBox
      Tag = 4
      Left = 128
      Top = 45
      Width = 100
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.NullStyle = nssUnchecked
      Properties.Caption = #1056#1086#1079#1076#1110#1083
      TabOrder = 3
      OnClick = cbxSCHClick
    end
    object cbxStat: TcxCheckBox
      Tag = 5
      Left = 215
      Top = 20
      Width = 70
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.NullStyle = nssUnchecked
      Properties.Caption = #1057#1090#1072#1090#1090#1103
      TabOrder = 4
      OnClick = cbxSCHClick
    end
    object cbxKekv: TcxCheckBox
      Tag = 6
      Left = 215
      Top = 45
      Width = 70
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.NullStyle = nssUnchecked
      Properties.Caption = #1050#1045#1050#1042
      TabOrder = 5
      OnClick = cbxSCHClick
    end
    object cbxSubSCH: TcxCheckBox
      Tag = 1
      Left = 12
      Top = 45
      Width = 100
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.NullStyle = nssUnchecked
      Properties.Caption = #1057#1091#1073'.'#1088#1072#1093#1091#1085#1086#1082
      TabOrder = 6
      OnClick = cbxSCHClick
    end
  end
  object gbxPeriod: TGroupBox
    Left = 0
    Top = 0
    Width = 295
    Height = 55
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
      Properties.OnChange = edtYearPropertiesChange
      Properties.OnValidate = edtYearPropertiesValidate
      Style.Color = 16247513
      TabOrder = 1
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
  object frrWork: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    EngineOptions.PrintIfEmpty = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.DoubleBuffered = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38652.554073344900000000
    ReportOptions.LastChange = 38971.548181099540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if    ( <frdsWork."OUT_DB_KOR_SCH_OBOROT"> <> 0 )'
      '       OR ( <frdsWork."OUT_KR_KOR_SCH_OBOROT"> <> 0 )'
      '    then begin'
      '        MasterData1.Visible := True;'
      '    end'
      '    else begin'
      '        MasterData1.Visible := False;'
      '    end'
      'end;'
      ''
      'begin'
      'end.')
    OnGetValue = frrWorkGetValue
    Left = 208
    Top = 120
    Datasets = <
      item
        DataSet = frdsWork
        DataSetName = 'frdsWork'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 25.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ColumnHeader1: TfrxColumnHeader
        Height = 45.354360000000000000
        Top = 245.669450000000000000
        Width = 661.417750000000000000
        object memLVL_0_NUMBER: TfrxMemoView
          Width = 117.165430000000000000
          Height = 45.354335590000000000
          Color = 12369084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1088)
          ParentFont = False
          VAlign = vaCenter
        end
        object memLVL_0_TITLE: TfrxMemoView
          Left = 117.165430000000000000
          Width = 279.685220000000000000
          Height = 45.354335590000000000
          Color = 12369084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 529.134200000000000000
          Top = 26.456710000000020000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 14540253
          DataSetName = 'frdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 396.850650000000000000
          Top = 26.456710000000020000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 14540253
          DataSetName = 'frdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'times new roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1077#1090)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 396.850650000000000000
          Width = 264.567100000000000000
          Height = 26.456710000000000000
          Color = 12369084
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 151.181200000000000000
        Top = 18.897650000000000000
        Width = 661.417750000000000000
        object Memo21: TfrxMemoView
          Left = 68.031540000000000000
          Top = 26.456710000000000000
          Width = 566.929500000000000000
          Height = 75.590600000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'times new roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1056#1086#1079#1096#1080#1092#1088#1086#1074#1082#1072' '#1082#1086#1088#1077#1089#1087#1086#1085#1076#1077#1085#1094#1110#1111' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1072#1084' '#1079#1072#1088#1086#1073#1110#1090#1085#1100#1086#1111' '#1087#1083#1072#1090#1080' '#1090#1072' '#1089#1090#1080#1087 +
              #1077#1085#1076#1110#1111)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 68.031540000000000000
          Top = 109.606370000000000000
          Width = 529.134200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'times new roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1079#1072' [Period]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 744.567410000000000000
        Width = 661.417750000000000000
        object Memo20: TfrxMemoView
          Left = 563.149970000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1088'. [<Page#>] '#1080#1079' [<TotalPages#>]')
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 37.795300000000000000
        Top = 555.590910000000000000
        Width = 661.417750000000000000
        Condition = 'frdsWork."OUT_LVL_1_ID"'
        KeepChild = True
        KeepTogether = True
        OutlineText = 'frdsWork."OUT_LVL_1_ID"'
        Stretched = True
        object Memo6: TfrxMemoView
          Top = 18.897650000000000000
          Width = 117.165344570000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14540253
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_1_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 117.165430000000000000
          Top = 18.897650000000000000
          Width = 279.685039370000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14540253
          DataSetName = 'frdsMain'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frdsWork."OUT_LVL_1_TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 396.850650000000000000
          Top = 18.897650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14540253
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_1_DB_OBOROT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 529.134200000000000000
          Top = 18.897650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14540253
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_1_KR_OBOROT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          ShiftMode = smDontShift
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          DataSetName = 'frdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1084#1110#1089#1103#1094#1103)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 396.850650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 15724527
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_1_DB_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 529.134200000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 15724527
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_1_KR_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 657.638220000000000000
        Width = 661.417750000000000000
        object Memo17: TfrxMemoView
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          DataSetName = 'frdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1084#1110#1089#1103#1094#1103)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 396.850650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 15724527
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_1_DB_SALDO_OUTPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 529.134200000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 15724527
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_1_KR_SALDO_OUTPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 616.063390000000000000
        Width = 661.417750000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frdsWork
        DataSetName = 'frdsWork'
        RowCount = 0
        Stretched = True
        object Memo5: TfrxMemoView
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSetName = 'frdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_KOR_SCH_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 117.165430000000000000
          Width = 279.685039370000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DataSetName = 'frdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frdsWork."OUT_KOR_SCH_TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 529.134200000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          StretchMode = smMaxHeight
          Color = clWhite
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'times new roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_KR_KOR_SCH_OBOROT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 396.850650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_DB_KOR_SCH_OBOROT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 90.708720000000000000
        Top = 351.496290000000000000
        Width = 661.417750000000000000
        Child = frrWork.Child1
        Condition = 'frdsWork."OUT_LVL_0_ID"'
        KeepChild = True
        KeepTogether = True
        StartNewPage = True
        Stretched = True
        object Memo16: TfrxMemoView
          Top = 71.811069999999970000
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14540253
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_0_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 117.165430000000000000
          Top = 71.811069999999970000
          Width = 279.685039370000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14540253
          DataSetName = 'frdsMain'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frdsWork."OUT_LVL_0_TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object memLVL_0_TOTAL_SUM_DESC: TfrxMemoView
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086':')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo31: TfrxMemoView
          Top = 52.913420000000030000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082' '#1084#1110#1089#1103#1094#1103)
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 396.850650000000000000
          Top = 52.913419999999970000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 15790320
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_0_DB_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 529.134200000000000000
          Top = 52.913419999999970000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 15790320
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_0_KR_SALDO_INPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 396.850650000000000000
          Top = 71.811069999999970000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14540253
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_0_DB_OBOROT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 529.134200000000000000
          Top = 71.811069999999970000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Color = 14540253
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_0_KR_OBOROT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Child1: TfrxChild
        Height = 68.031540000000010000
        Top = 464.882190000000000000
        Width = 661.417750000000000000
        object Memo28: TfrxMemoView
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo1OnBeforePrint'
          Color = 15790320
          DataSetName = 'frdsMain'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1110#1085#1077#1094#1100' '#1084#1110#1089#1103#1094#1103)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 396.850650000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 15790320
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_0_DB_SALDO_OUTPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 529.134200000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Color = 15790320
          DataSetName = 'frdsMain'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frdsWork."OUT_LVL_0_KR_SALDO_OUTPUT"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 30.236240000000000000
        Top = 192.756030000000000000
        Width = 661.417750000000000000
        PrintOnFirstPage = False
        object txtPageCaption: TfrxMemoView
          Align = baRight
          Left = 328.819109999999900000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsItalic]
          Memo.Strings = (
            #1046#1091#1088#1085#1072#1083'-'#1054#1088#1076#1077#1088' '#8470'5 '#1079#1072' [Month] '#1084#1110#1089#1103#1094#1100' [Year] '#1088#1110#1082)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frdsWork: TfrxDBDataset
    UserName = 'frdsWork'
    CloseDataSource = False
    DataSet = dstWork
    Left = 262
    Top = 120
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
    Left = 40
    Top = 71
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 72
    Top = 71
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 104
    Top = 71
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 144
    Top = 71
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 176
    Top = 71
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    Left = 208
    Top = 71
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 240
    Top = 71
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    Left = 40
    Top = 103
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
    Left = 72
    Top = 103
  end
end
