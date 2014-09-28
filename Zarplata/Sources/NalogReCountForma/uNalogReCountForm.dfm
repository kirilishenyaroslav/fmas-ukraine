object NalogReCountForm: TNalogReCountForm
  Left = 931
  Top = 265
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1076#1086#1074#1110#1076#1086#1082
  ClientHeight = 385
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PeriodBox: TGroupBox
    Left = 8
    Top = 16
    Width = 321
    Height = 105
    Caption = #1055#1077#1088#1110#1086#1076
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 23
      Height = 13
      Caption = #1056#1110#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 50
      Height = 13
      Caption = #1052#1110#1089#1103#1094' '#1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 120
      Top = 56
      Width = 19
      Height = 13
      Caption = #1087#1086':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 56
      Top = 22
      Width = 73
      Height = 21
      TabOrder = 0
      Value = 2005
    end
    object MonthBegEdit: TcxSpinEdit
      Left = 56
      Top = 53
      Width = 49
      Height = 21
      Properties.MaxValue = 12.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 1
      Value = 1
    end
    object MonthEndEdit: TcxSpinEdit
      Left = 136
      Top = 53
      Width = 49
      Height = 21
      Properties.MaxValue = 12.000000000000000000
      Properties.MinValue = 1.000000000000000000
      TabOrder = 2
      Value = 12
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 136
    Width = 321
    Height = 89
    Caption = #1057#1087#1080#1089#1086#1082
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 141
      Height = 13
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1092#1110#1079#1080#1095#1085#1091' '#1086#1089#1086#1073#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GetManRadioBtn: TRadioButton
      Left = 8
      Top = 32
      Width = 17
      Height = 17
      Caption = 'GetManRadioBtn'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = GetManRadioBtnClick
    end
    object AllPeopleRadioBtn: TRadioButton
      Left = 8
      Top = 64
      Width = 225
      Height = 17
      Caption = #1044#1083#1103' '#1074#1089#1110#1093' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = AllPeopleRadioBtnClick
    end
    object ManEdit: TcxButtonEdit
      Left = 24
      Top = 31
      Width = 289
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = ManEditPropertiesButtonClick
      TabOrder = 2
    end
  end
  object OkBtn: TcxButton
    Left = 112
    Top = 352
    Width = 105
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080
    ModalResult = 1
    TabOrder = 2
    OnClick = OkBtnClick
  end
  object CancelBtn: TcxButton
    Left = 224
    Top = 352
    Width = 105
    Height = 25
    Caption = #1047#1072#1082#1088#1080#1090#1080
    ModalResult = 2
    TabOrder = 3
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 232
    Width = 321
    Height = 89
    Caption = #1055#1088#1086#1094#1077#1089#1089' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object FIOText: TDBText
      Left = 8
      Top = 24
      Width = 305
      Height = 17
    end
    object ProgressBar: TcxProgressBar
      Left = 8
      Top = 56
      Width = 305
      Height = 21
      TabOrder = 0
    end
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38772.576075648150000000
    ReportOptions.LastChange = 38774.581699560190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'VAR'
      '       TOTAL_MONTH:Integer;'
      '       TOTAL_NACH:Real;'
      '       TOTAL_UDER:Real;'
      '       TOTAL_PODOHOD:Real;'
      '       TOTAL_PODOHOD_NEW:Real;'
      '       TOTAL_SOC_PRIV:Real;'
      '       TOTAL_DIFF:Real;'
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '       TOTAL_MONTH:=0;'
      '       TOTAL_NACH:=0;'
      '       TOTAL_UDER:=0;'
      '       TOTAL_PODOHOD:=0;'
      '       TOTAL_PODOHOD_NEW:=0;'
      '       TOTAL_SOC_PRIV:=0;'
      '       TOTAL_DIFF:=0;'
      ''
      'end;'
      ''
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '    TOTAL_MONTH:=TOTAL_MONTH+1;'
      'end;'
      ''
      'procedure Memo14OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  TOTAL_NACH:=TOTAL_NACH+<ReportDataSet."SUMMA_NACH">;'
      'end;'
      ''
      'procedure Memo15OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  TOTAL_UDER:=TOTAL_UDER+<ReportDataSet."SUMMA_UDER">;'
      'end;'
      ''
      'procedure Memo16OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      
        '  TOTAL_PODOHOD:=TOTAL_PODOHOD+<ReportDataSet."SUMMA_NALOG_FACT"' +
        '>;'
      'end;'
      ''
      'procedure Memo17OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      
        '  TOTAL_PODOHOD_NEW:=TOTAL_PODOHOD_NEW+<ReportDataSet."SUMMA_NAL' +
        'OG_NEW">;'
      'end;'
      ''
      'procedure Memo19OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  TOTAL_DIFF:=TOTAL_DIFF+<ReportDataSet."SUMMA_DIFF">;'
      'end;'
      ''
      'procedure Memo18OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      
        '  TOTAL_SOC_PRIV:=TOTAL_SOC_PRIV+<ReportDataSet."SUMMA_SOC_PRIV"' +
        '>;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = ReportGetValue
    OnAfterPrintReport = ReportAfterPrintReport
    Left = 8
    Top = 352
    Datasets = <
      item
        DataSet = ReportDataSet
        DataSetName = 'ReportDataSet'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          Left = 517.795610000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1055#1077#1088#1077#1088#1072#1093#1091#1085#1086#1082' '#1087#1086#1076#1072#1090#1082#1091' '#1079' '#1060#1054)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 207.874150000000000000
        Width = 740.409927000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        DataSet = ReportDataSet
        DataSetName = 'ReportDataSet'
        RowCount = 0
        object Memo13: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[ReportDataSet."OUT_PERIOD"]')
        end
        object Memo14: TfrxMemoView
          Left = 94.488250000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo14OnAfterPrint'
          Memo.Strings = (
            '[ReportDataSet."SUMMA_NACH"]')
        end
        object Memo15: TfrxMemoView
          Left = 249.448980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo15OnAfterPrint'
          Memo.Strings = (
            '[ReportDataSet."SUMMA_UDER"]')
        end
        object Memo16: TfrxMemoView
          Left = 340.157700000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo16OnAfterPrint'
          Memo.Strings = (
            '[ReportDataSet."SUMMA_NALOG_FACT"]')
        end
        object Memo17: TfrxMemoView
          Left = 453.543600000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo17OnAfterPrint'
          Memo.Strings = (
            '[ReportDataSet."SUMMA_NALOG_NEW"]')
        end
        object Memo18: TfrxMemoView
          Left = 548.031850000000000000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo18OnAfterPrint'
          Memo.Strings = (
            '[ReportDataSet."SUMMA_SOC_PRIV"]')
        end
        object Memo19: TfrxMemoView
          Left = 642.520100000000000000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          OnAfterPrint = 'Memo19OnAfterPrint'
          Memo.Strings = (
            '[ReportDataSet."SUMMA_DIFF"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Left = 664.819327000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 45.354360000000000000
        Top = 139.842610000000000000
        Width = 740.409927000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Condition = 'ReportDataSet."ID_MAN"'
        object Memo3: TfrxMemoView
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1042#1080#1076#1072#1085#1072': ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 60.472480000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[ReportDataSet."FIO"]')
        end
        object Memo5: TfrxMemoView
          Left = 574.488560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #1058#1072#1073'. '#8470' : [ReportDataSet."TN"]')
        end
        object Memo6: TfrxMemoView
          Top = 26.456709999999990000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1110#1086#1076)
        end
        object Memo7: TfrxMemoView
          Left = 94.488249999999990000
          Top = 26.456710000000020000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086)
        end
        object Memo8: TfrxMemoView
          Left = 249.448980000000000000
          Top = 26.456710000000020000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1084#1077#1085#1100#1096#1077#1085#1085#1103)
        end
        object Memo9: TfrxMemoView
          Left = 340.157700000000000000
          Top = 26.456710000000020000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1086#1076#1072#1090#1086#1082)
        end
        object Memo10: TfrxMemoView
          Left = 453.543600000000000000
          Top = 26.456710000000020000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1077#1088#1077#1088#1072#1093'.')
        end
        object Memo11: TfrxMemoView
          Left = 548.031850000000000000
          Top = 26.456710000000020000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1083#1100#1075#1080)
        end
        object Memo12: TfrxMemoView
          Left = 642.520100000000000000
          Top = 26.456709999999990000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1091#1090#1088#1080#1084#1072#1085#1085#1103)
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 740.409927000000000000
        object Memo20: TfrxMemoView
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[TOTAL_MONTH]')
        end
        object Memo21: TfrxMemoView
          Left = 94.488249999999990000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[TOTAL_NACH]')
        end
        object Memo22: TfrxMemoView
          Left = 249.448980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[TOTAL_UDER]')
        end
        object Memo23: TfrxMemoView
          Left = 340.157700000000000000
          Top = -0.000000000000028422
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[TOTAL_PODOHOD]')
        end
        object Memo24: TfrxMemoView
          Left = 453.543600000000000000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[TOTAL_PODOHOD_NEW]')
        end
        object Memo25: TfrxMemoView
          Left = 548.031850000000000000
          Top = -0.000000000000028422
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[TOTAL_SOC_PRIV]')
        end
        object Memo26: TfrxMemoView
          Left = 642.520100000000000000
          Width = 94.488249999999990000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[TOTAL_DIFF]')
        end
      end
    end
  end
  object ReportDataSet: TfrxDBDataset
    UserName = 'ReportDataSet'
    CloseDataSource = False
    Left = 40
    Top = 352
  end
  object frxDesigner: TfrxDesigner
    Restrictions = []
    Left = 72
    Top = 352
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 16
    Top = 320
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 56
    Top = 320
  end
end
