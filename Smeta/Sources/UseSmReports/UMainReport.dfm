object frmSmMainReport: TfrmSmMainReport
  Left = 451
  Top = 183
  Width = 373
  Height = 329
  Caption = #1047#1074#1077#1076#1077#1085#1072' '#1092#1086#1088#1084#1072' '#1087#1088#1086' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1110#1074' '#1085#1072' '#1076#1072#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 8
    Top = 28
    Width = 177
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1079#1074#1110#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 116
    Width = 177
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1050#1086#1076' '#1073#1102#1076#1078#1077#1090#1072
  end
  object cxDateEdit3: TcxDateEdit
    Left = 192
    Top = 24
    Width = 161
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 0
  end
  object cxButton1: TcxButton
    Left = 195
    Top = 264
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 275
    Top = 264
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object cxCheckBox1: TcxCheckBox
    Left = 64
    Top = 184
    Width = 257
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1086#1073#1086#1088#1086#1090#1110#1074' '#1088#1086#1073#1080#1090#1080' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1088#1086#1082#1091
    TabOrder = 3
  end
  object cxTextEdit1: TcxTextEdit
    Left = 192
    Top = 112
    Width = 161
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 4
    Text = '0'
  end
  object cxCheckBox2: TcxCheckBox
    Left = 8
    Top = 80
    Width = 313
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1060#1086#1088#1084#1091#1074#1072#1090#1080' '#1087#1086' '#1074#1080#1073#1088#1072#1085#1086#1084#1091' '#1073#1102#1076#1078#1077#1090#1091
    State = cbsChecked
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 136
    Top = 226
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 104
    Top = 234
  end
  object SmetPlusPeriodsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 32
    Top = 216
    poSQLINT64ToBCD = True
  end
  object SmPlusPeriodsDataset: TfrxDBDataset
    UserName = 'SmPlusPeriodsDataset'
    CloseDataSource = False
    DataSet = SmetPlusPeriodsDataSet
    Left = 72
    Top = 226
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39486.482938506910000000
    ReportOptions.LastChange = 39491.526758472220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 8
    Top = 210
    Datasets = <
      item
        DataSet = SmPlusPeriodsDataset
        DataSetName = 'SmPlusPeriodsDataset'
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
      object ReportTitle1: TfrxReportTitle
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Left = 128.504020000000000000
          Top = 7.559059999999999000
          Width = 408.189240000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1047#1074#1077#1076#1077#1085#1072' '#1092#1086#1088#1084#1072' '#1087#1088#1086' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1073#1102#1076#1078#1077#1090#1072' '#1085#1072' ')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 536.693260000000000000
          Top = 11.338590000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DATE_BEG]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 192.756030000000000000
        Top = 117.165430000000000000
        Width = 1046.929810000000000000
        RowCount = 1
        object Memo3: TfrxMemoView
          Width = 56.692950000000010000
          Height = 34.015770000000010000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1076' '#1075#1088#1091#1087#1080'/'#1073#1102#1076#1078#1077#1090#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 56.692950000000010000
          Width = 619.842920000000000000
          Height = 34.015770000000010000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 676.535870000000000000
          Width = 185.196970000000000000
          Height = 34.015770000000010000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 445.984540000000000000
          Top = 34.015769999999990000
          Width = 132.283550000000000000
          Height = 52.913420000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1073#1086#1088#1086#1090#1080' '#1079' '#1087#1086#1095#1072#1090#1082#1091' '#1087#1077#1088#1110#1086#1076#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 445.984540000000000000
          Top = 86.929190000000030000
          Width = 64.252010000000000000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7'#1093#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 510.236550000000000000
          Top = 86.929190000000030000
          Width = 68.031540000000010000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '8'#1093#1093)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 578.268090000000000000
          Top = 34.015769999999990000
          Width = 200.315090000000000000
          Height = 52.913420000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1082#1080' '#1090#1072' '#1079#1072#1073#1086#1088#1075#1086#1074#1072#1085#1085#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 578.268090000000000000
          Top = 86.929189999999960000
          Width = 64.252010000000000000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1110' '#1079#1072#1083#1080#1096#1082#1080)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 642.520100000000000000
          Top = 86.929189999999960000
          Width = 68.031540000000010000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1077#1073#1110#1090#1086#1088#1089#1100#1082#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 710.551640000000000000
          Top = 86.929189999999960000
          Width = 68.031540000000010000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090#1086#1088#1089#1100#1082#1072)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 778.583180000000000000
          Top = 34.015769999999990000
          Width = 132.283550000000000000
          Height = 52.913420000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1082#1080' '#1085#1072' '#1076#1072#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 778.583180000000000000
          Top = 86.929189999999960000
          Width = 64.252010000000000000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1089#1086#1074#1080#1081)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 842.835190000000000000
          Top = 86.929189999999960000
          Width = 68.031540000000010000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081)
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 910.866730000000000000
          Top = 34.015769999999990000
          Width = 68.031540000000010000
          Height = 158.740260000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1085#1088#1086#1083#1100#1085#1080#1081' '#1087#1086#1082#1072#1079#1085#1080#1082' 1 (12+9+10-11-13)')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 978.898270000000000000
          Top = 34.015769999999990000
          Width = 68.031540000000010000
          Height = 158.740260000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1085#1088#1086#1083#1100#1085#1080#1081' '#1087#1086#1082#1072#1079#1085#1080#1082' 2 (6 +7 -8 -13)')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 313.700990000000000000
          Top = 34.015769999999990000
          Width = 132.283550000000000000
          Height = 52.913420000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1085#1072#1085#1089#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 313.700990000000000000
          Top = 86.929190000000030000
          Width = 64.252010000000000000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1093#1086#1076#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 377.953000000000000000
          Top = 86.929190000000030000
          Width = 68.031540000000010000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076#1072#1090#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 181.417440000000000000
          Top = 34.015769999999990000
          Width = 132.283550000000000000
          Height = 52.913420000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1089#1086#1074#1110' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 181.417440000000000000
          Top = 86.929190000000030000
          Width = 64.252010000000000000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1093#1086#1076#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 245.669450000000000000
          Top = 86.929190000000030000
          Width = 68.031540000000010000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1076#1072#1090#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 861.732840000000000000
          Width = 185.196970000000000000
          Height = 34.015770000000010000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Top = 34.015769999999990000
          Width = 181.417440000000000000
          Height = 52.913420000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1093#1110#1076#1085#1110' '#1079#1072#1083#1080#1096#1082#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Top = 86.929190000000030000
          Width = 90.708720000000000000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1072#1089#1086#1074#1110)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 90.708720000000000000
          Top = 86.929190000000030000
          Width = 90.708720000000000000
          Height = 105.826840000000000000
          Color = 15790320
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1060#1110#1085#1072#1085#1089#1086#1074#1110)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 442.205010000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 971.238422530000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object MasterData2: TfrxMasterData
        Height = 49.133890000000000000
        Top = 332.598640000000000000
        Width = 1046.929810000000000000
        DataSet = SmPlusPeriodsDataset
        DataSetName = 'SmPlusPeriodsDataset'
        RowCount = 0
        Stretched = True
        object Memo56: TfrxMemoView
          Width = 56.692950000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."SM_CODE"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 56.692950000000010000
          Width = 612.283860000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."SM_TITLE"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 668.976810000000000000
          Width = 196.535503860000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."DATE_BEG"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 865.512370000000000000
          Width = 181.417378980000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."DATE_END"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Top = 26.456709999999990000
          Width = 90.708661420000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."IN_SALDO_K"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 90.708720000000000000
          Top = 26.456709999999990000
          Width = 90.708661420000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."IN_SALDO_F"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 445.984540000000000000
          Top = 26.456709999999990000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."O_7_VALUE"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 510.236550000000000000
          Top = 26.456709999999990000
          Width = 68.031540000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."O_8_VALUE"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 578.268090000000000000
          Top = 26.456709999999990000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."MAT_OST_VALUE"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 642.520100000000000000
          Top = 26.456709999999990000
          Width = 68.031540000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."DB_Z_VALUE"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 710.551640000000000000
          Top = 26.456709999999990000
          Width = 68.031540000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."KR_Z_VALUE"]')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 778.583180000000000000
          Top = 26.456709999999990000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."K_REST"]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 842.835190000000000000
          Top = 26.456709999999990000
          Width = 68.031540000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."F_REST"]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 910.866730000000000000
          Top = 26.456709999999990000
          Width = 68.031540000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."O_14_VALUE"]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 978.898270000000000000
          Top = 26.456709999999990000
          Width = 68.031540000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."O_15_VALUE"]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 313.700990000000000000
          Top = 26.456709999999990000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."TMP_FINANCE_SALDO_DOX"]')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 377.953000000000000000
          Top = 26.456709999999990000
          Width = 68.031540000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."TMP_FINANCE_SALDO_RASX"]')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 181.417440000000000000
          Top = 26.456709999999990000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."TMP_MONEY_SALDO_DOX"]')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 245.669450000000000000
          Top = 26.456709999999990000
          Width = 68.031540000000010000
          Height = 22.677180000000000000
          StretchMode = smMaxHeight
          Color = clWhite
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[SmPlusPeriodsDataSet."TMP_MONEY_SALDO_RASX"]')
          ParentFont = False
        end
      end
    end
  end
end
