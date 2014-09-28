object frmReportsST_PAY_CALC: TfrmReportsST_PAY_CALC
  Left = 389
  Top = 394
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'frmReportsST_PAY_CALC'
  ClientHeight = 83
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonOK: TcxButton
    Left = 32
    Top = 32
    Width = 88
    Height = 25
    Caption = #1054#1050
    Default = True
    TabOrder = 0
    OnClick = cxButtonOKClick
  end
  object cxButtonExit: TcxButton
    Left = 128
    Top = 32
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButtonExitClick
  end
  object cxDateEdit: TcxDateEdit
    Left = 96
    Top = 8
    Width = 121
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object cxLabelDate: TcxLabel
    Left = 0
    Top = 8
    Width = 80
    Height = 17
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 64
    Width = 225
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object Database: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Top = 32
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TACommit
    Left = 32
    Top = 32
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Top = 64
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 184
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38574.593894120400000000
    ReportOptions.LastChange = 40333.584524733800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo17OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_NAME_FAMILY_TYPE">=1 then'
      '    begin'
      '      Memo17.Text:='#39#1084#1091#1078' - '#39';'
      '    end;'
      '  if <frxDBDataset."OUT_NAME_FAMILY_TYPE">=2 then'
      '    begin'
      '      Memo17.Text:='#39#1078#1077#1085#1072' - '#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if (<frxDBDataset."OUT_CHILD_1_P">='#39#1078#39') or (<frxDBDataset."OUT' +
        '_CHILD_1_P">='#39#1046#39') then'
      '    begin'
      '      Memo19.Text:='#39#1076#1086#1095#1100' - '#39';'
      '    end;'
      
        '  if (<frxDBDataset."OUT_CHILD_1_P">='#39#1084#39') or (<frxDBDataset."OUT' +
        '_CHILD_1_P">='#39#1052#39') then'
      '    begin'
      '      Memo19.Text:='#39#1089#1099#1085' - '#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_NAME_FAMILY">='#39#39' then'
      '    begin'
      '      Memo18.text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_CHILD_1">='#39#39' then'
      '    begin'
      '      Memo20.text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo22OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_CHILD_2">='#39#39' then'
      '    begin'
      '      Memo22.text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBDataset."OUT_CHILD_3">='#39#39' then'
      '    begin'
      '      Memo24.text:='#39#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '    if (<frxDBDataset."OUT_CHILD_2_P">='#39#1078#39') or (<frxDBDataset."O' +
        'UT_CHILD_2_P">='#39#1046#39') then'
      '    begin'
      '      Memo21.Text:='#39#1076#1086#1095#1100' - '#39';'
      '    end;'
      
        '  if (<frxDBDataset."OUT_CHILD_2_P">='#39#1084#39') or (<frxDBDataset."OUT' +
        '_CHILD_2_P">='#39#1052#39') then'
      '    begin'
      '      Memo21.Text:='#39#1089#1099#1085' - '#39';'
      '    end;'
      'end;'
      ''
      'procedure Memo23OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '    if (<frxDBDataset."OUT_CHILD_3_P">='#39#1078#39') or (<frxDBDataset."O' +
        'UT_CHILD_3_P">='#39#1046#39') then'
      '    begin'
      '      Memo23.Text:='#39#1076#1086#1095#1100' - '#39';'
      '    end;'
      
        '  if (<frxDBDataset."OUT_CHILD_3_P">='#39#1084#39') or (<frxDBDataset."OUT' +
        '_CHILD_3_P">='#39#1052#39') then'
      '    begin'
      '      Memo23.Text:='#39#1089#1099#1085' - '#39';'
      '    end;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnPrintReport = frxReportPrintReport
    Left = 160
    Datasets = <
      item
        DataSet = frmMainReportsFamily.frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = 'ST_WHERE'
        Value = #39#39
      end
      item
        Name = 'ST_NOTE'
        Value = #39#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 20.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Height = 551.811380000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 680.315400000000000000
        object Memo1: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[Date]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'OUT_DEP'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset."OUT_DEP"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset."OUT_DEP_CH"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 75.590600000000000000
          Width = 680.315400000000000000
          Height = 49.133890000000000000
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1044#1086#1074#1110#1076#1082#1072' '#1087#1088#1086' '#1084#1110#1089#1094#1077' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103' '#1110
            #1087#1088#1086' '#1089#1082#1083#1072#1076' '#1089#1110#1084#39#1111'  '#8470' [frxDBDataset."OUT_NUMBER"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 136.063080000000000000
          Width = 449.764070000000000000
          Height = 18.897650000000000000
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            ' [frxDBDataset."OUT_FIO"] ( [frxDBDataset."OUT_YEAR_R"]  '#1075'.'#1088'. )')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          ShiftMode = smDontShift
          Left = 449.764070000000000000
          Top = 136.063080000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1090#1080#1084#1095#1072#1089#1086#1074#1086' '#1087#1088#1086#1078#1080#1074#1072#1108' '#1079#1072' '#1072#1076#1088#1077#1089#1086#1102':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Top = 154.960730000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            
              '   [frxDBDataset."OUT_TOWN"], '#1091#1083'.[frxDBDataset."OUT_STREET"], '#1076'.' +
              '[frxDBDataset."OUT_HOUSE"], '#1086#1073#1097'.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Top = 173.858380000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1055#1110#1076#1088#1086#1079#1076#1110#1083' ('#1092#1072#1082#1091#1083#1100#1090#1077#1090')')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 173.858380000000000000
          Top = 173.858380000000000000
          Width = 506.457020000000000000
          Height = 18.897650000000000000
          DataField = 'OUT_NAME_FAK'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset."OUT_NAME_FAK"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Top = 192.756030000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1058#1080#1087' '#1087#1088#1086#1078#1080#1074#1072#1102#1095#1077#1075#1086':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 151.181200000000000000
          Top = 192.756030000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          DataField = 'OUT_NAME_KAT'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frxDBDataset."OUT_NAME_KAT"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 574.488560000000000000
          Top = 192.756030000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1050#1091#1088#1089)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 623.622450000000000000
          Top = 192.756030000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'OUT_KURS'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset."OUT_KURS"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Top = 211.653680000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1045#1075#1086' '#1089#1110#1084#39#1103' '#1089#1082#1083#1072#1076#1072#1108#1090#1100#1089#1103' '#1079)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 188.976500000000000000
          Top = 211.653680000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'OUT_COUNT_FAMILY'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset."OUT_COUNT_FAMILY"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 257.008040000000000000
          Top = 211.653680000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '  '#1095#1086#1083#1086#1074#1110#1082':')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 230.551330000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo17OnBeforePrint'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 56.692950000000000000
          Top = 230.551330000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo18OnBeforePrint'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            
              '[frxDBDataset."OUT_NAME_FAMILY"]  ( [frxDBDataset."OUT_NAME_FAMI' +
              'LY_DATE_R"] '#1075'.'#1088'. )')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Top = 249.448980000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo19OnBeforePrint'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 56.692950000000000000
          Top = 249.448980000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            
              '[frxDBDataset."OUT_CHILD_1"]  ( [frxDBDataset."OUT_CHILD_1_D"] '#1075 +
              '.'#1088'. )')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Top = 268.346630000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 56.692950000000000000
          Top = 268.346630000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo22OnBeforePrint'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            
              '[frxDBDataset."OUT_CHILD_2"]  ( [frxDBDataset."OUT_CHILD_2_D"] '#1075 +
              '.'#1088'. )')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 287.244280000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo23OnBeforePrint'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 56.692950000000000000
          Top = 287.244280000000000000
          Width = 623.622450000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            
              '[frxDBDataset."OUT_CHILD_3"]  ( [frxDBDataset."OUT_CHILD_3_D"] '#1075 +
              '.'#1088'. )')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Top = 325.039580000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1044#1086#1074#1110#1076#1082#1072' '#1076#1072#1085#1072' '#1076#1083#1103' '#1087#1088#1077#1076#39#1103#1074#1083#1077#1085#1085#1103' '#1091)
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 264.567100000000000000
          Top = 325.039580000000000000
          Width = 419.527830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ST_WHERE]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Top = 343.937230000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1055#1088#1080#1084#1110#1090#1082#1072':')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 94.488250000000000000
          Top = 343.937230000000000000
          Width = 585.827150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[ST_NOTE]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Top = 377.953000000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '"[frxDBDataset."OUT_DATE_PASP_V"]"')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 41.574830000000000000
          Top = 377.953000000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'OUT_MONTH_PASP_V'
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset."OUT_MONTH_PASP_V"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 162.519790000000000000
          Top = 377.953000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frmMainReportsFamily.frxDBDataset
          DataSetName = 'frxDBDataset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[frxDBDataset."OUT_YEAR_PASP_V"] '#1075'.')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 415.748300000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1087#1072#1089#1087#1086#1088#1090#1085#1086#1075#1086' '#1074#1110#1076#1076#1110#1083#1091)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 495.118430000000000000
          Top = 415.748300000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[NA4ALNIK]')
          ParentFont = False
        end
      end
    end
  end
  object pFIBDataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from st_tmp_print_st_calc'
      'where st_tmp_print_st_calc.id_transaction=:param_id_transaction')
    Left = 56
    Top = 56
    poSQLINT64ToBCD = True
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 208
  end
  object pFIBStoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 120
    Top = 56
  end
  object pFIBDataSet3: TpFIBDataSet
    Left = 88
    Top = 56
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 184
    Top = 56
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 57412
      OnExecute = Action1Execute
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 56
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 80
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 104
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
    Left = 128
  end
end
