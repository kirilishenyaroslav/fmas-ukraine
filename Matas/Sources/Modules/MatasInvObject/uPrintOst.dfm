object PrintOstForm: TPrintOstForm
  Left = 475
  Top = 338
  Width = 422
  Height = 215
  Caption = #1047#1074#1110#1090' '#1087#1086' '#1110#1085#1074#1077#1085#1090#1072#1088#1085#1080#1084' '#1086#1073#39#1108#1082#1090#1072#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 10
    Top = 38
    Width = 66
    Height = 13
    Caption = #1043#1088#1091#1087#1072' '#1058#1052#1062
  end
  object lbl2: TLabel
    Left = 247
    Top = 119
    Width = 91
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1086#1087#1110#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 11
    Top = 64
    Width = 52
    Height = 13
    Caption = #1055#1077#1088#1110#1086#1076' '#1079
  end
  object lbl4: TLabel
    Left = 225
    Top = 64
    Width = 15
    Height = 13
    Caption = #1087#1086
  end
  object lbl5: TLabel
    Left = 8
    Top = 12
    Width = 80
    Height = 13
    Caption = #1042#1077#1076#1086#1084#1110#1089#1090#1100' '#1086#1089
  end
  object BEGrTMC: TcxButtonEdit
    Left = 93
    Top = 34
    Width = 313
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BEGrTMCPropertiesButtonClick
    TabOrder = 0
  end
  object cxCheckOnPrinter: TcxCheckBox
    Left = 15
    Top = 112
    Width = 169
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 1
  end
  object cxSelectPrinter: TcxCheckBox
    Left = 12
    Top = 88
    Width = 153
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 2
  end
  object cxExportExel: TcxCheckBox
    Left = 244
    Top = 87
    Width = 161
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1045#1082#1089#1087#1086#1088#1090#1091#1074#1072#1090#1080' '#1074' Exel'
    TabOrder = 3
  end
  object cxCopies: TcxSpinEdit
    Left = 351
    Top = 115
    Width = 49
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.MaxValue = 999.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.ReadOnly = False
    TabOrder = 4
    Value = 1
  end
  object cxCheckEditRep: TcxCheckBox
    Left = 2
    Top = 153
    Width = 25
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 5
  end
  object cxButton2: TcxButton
    Left = 60
    Top = 142
    Width = 125
    Height = 25
    Action = actPrint
    TabOrder = 6
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF86848486
      8484868484FF00FFFF00FFFF00FFFF00FF868484868484FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF868484C1BFBFABA8A9A4A1A2868484868484999697868484E5E4E4DBDADA86
      8484868484868484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF868484DFDEDED3D1D1B5B3B3B5B3B3B5B3B39B999A777676CBCB
      CBD9D9D9DADADADCDCDCDDDDDDD6D5D5868484868484868484FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF868484E1E0E0E7E6E6CECDCDB5B3B3B5B3B3B5B3B3
      7C7B7B000000000000282828787878BBBBBBD6D6D6D6D6D6D6D6D6D6D6D6CFCE
      CE868484868484868484FF00FFFF00FF868484DDDDDDDEDDDDDADADAA3A1A199
      9797999797999797868484262626131313000000000000000000282828787878
      BBBBBBD6D6D6D6D6D6C7C6C6C7C6C6868484FF00FF868484D6D6D6D6D6D6D3D3
      D3A4A3A3C8C5C5C6C4C4B5B3B3B5B3B3B3B1B1AEACACA9A6A79A98986D6B6B43
      42421313130000000000002828287E7E7E999697868484FF00FFFF00FF868484
      D6D6D6D2D2D2A4A3A3E0DEDEF9F8F8F8F7F7F5F4F4E7E6E6D6D4D4C6C5C5B8B6
      B6B5B3B3B5B3B3B2AFB0A9A6A7827F803938390A09092D2D2DAEACAC868484FF
      00FFFF00FF868484D2D2D2A4A3A3EDECECF9F8F8F9F8F8F8F7F7F5F4F4F2F1F1
      EFEFEFEDECECEAE9E9DEDDDDD0CFCFC0BFBFB5B3B3B5B3B3AEACAC9A98988684
      84B3B1B1868484FF00FFFF00FF868484A4A3A3F3F2F2F9F8F8F9F8F8F9F8F8F8
      F7F7DFDDDE9D9496AAA2A4CFCDCDE5E4E4E7E7E7E4E4E4E1E1E1DCDCDCD0CFCF
      C3C1C1B5B3B3B0AEAE868484868484FF00FFFF00FF868484D9D7D8F9F8F8F9F8
      F8F9F8F8F9F8F8DAD7D8C0BEBFBFBDBDB2ADAD9B92948E8385A09899BDB8B9D4
      D3D3DFDFDFDCDCDCD9D9D9D5D4D4CAC9C9B9B7B7868484FF00FFFF00FFFF00FF
      868484868484D9D7D8F1F0F0C0B7B885787A8F84869B9193B0ABACBEBCBCC3C1
      C1BDBABBADA7A89990919C9395A9A3A4CDCDCDD7D7D7D6D6D6CECECE868484FF
      00FFFF00FFFF00FFFF00FFFF00FF868484868484CC9A99C0A18C95796C806F71
      7F6F7287797C87797CA09899B4AFB0C0BEBFC3C1C1B7B3B4D6D5D6D7D7D7C7C6
      C6868484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FF
      DEBDFFDBB5FFD7ADDFB894B5917794807A7B6B6E807174897C7FA49D9ED9D8D8
      DADADAB8B7B7868484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFCC9A99FFE2C3FFDEBBFFDAB4FFD6ACFFD3A4FFCF9DFFCD99FFCE9CCC
      9A99868484868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFCC9A99FFE5C9FFE1C2FFDDBAFFD9B2FFD6ABFFD2
      A3FFCE9CFFCE9CCC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEBD7FFE8D0FFE4C8FFE0C0
      FFDDB9FFD9B1FFD5AAFFD1A2CC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEFDEFF
      EBD6FFE7CEFFE3C7FFE0BFFFDCB8FFD8B0FFD4A8CC9A99FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFCC9A99FFF2E4FFEEDCFFEAD5FFE7CDFFE3C6FFDFBEFFDBB6F9D0ACCC9A99FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFCC9A99FFF9F2FFF5EAFFF1E3FFEDDBFFEAD4FFE6CCFFE2C4FFDE
      BDCC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFCC9A99FFFBF6FFFBF6FFF8F1FFF4E9FFF0E2FFEDDA
      FFE9D2FFE5CBF5D4BBCC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC9A99CC9A99FF
      F7F0FFF4E8FFF0E0FFECD9FCE4CECC9A99FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFCC9A99CC9A99CC9A99CC9A99CC9A99FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object cxButton3: TcxButton
    Left = 221
    Top = 142
    Width = 125
    Height = 25
    Action = actCancel
    TabOrder = 7
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FF0732DE0732DE0732
      DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FF
      0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FFFF
      00FFFF00FFFF00FF0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DE07
      32DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
      0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335
      FB0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF0732DE07
      32DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0732DEFF00FFFF00FF0732
      DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE
      0732DE0732DE0732DE0732DE0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF0732DE0732DE0335FB0732DE0335FB0732DE0732DEFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DE0335FB0732DEFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB0732DE0732
      DE0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0335FB
      0732DE0335FB0335FB0335FB0732DE0335FBFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB03
      35FB0335FB0732DE0335FBFF00FFFF00FF0335FB0335FB0335FB0335FBFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF0335FB0335FB0732DE0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB03
      35FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FBFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335FB0335FBFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0335FBFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FB0335
      FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB
      0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object cxFilterDateBeg: TcxDateEdit
    Left = 94
    Top = 60
    Width = 110
    Height = 21
    Properties.ShowTime = False
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 8
    EditValue = 0d
  end
  object cxFilterDateEnd: TcxDateEdit
    Left = 263
    Top = 61
    Width = 110
    Height = 21
    Properties.ShowTime = False
    Style.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 9
    EditValue = 0d
  end
  object CB: TcxComboBox
    Left = 93
    Top = 9
    Width = 313
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1074#1074#1077#1076#1077#1085#1080#1093' '#1074' '#1077#1082#1089#1087#1083#1091#1072#1090#1072#1094#1110#1102
      #1074#1080#1074#1077#1076#1077#1085#1080#1093' '#1079' '#1077#1082#1089#1087#1083#1091#1072#1090#1072#1094#1110#1111
      #1074#1085#1091#1090#1088#1080#1096#1085#1108' '#1087#1077#1088#1077#1084#1110#1097#1077#1085#1085#1103)
    TabOrder = 10
  end
  object DB_Print: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=win1251')
    DefaultTransaction = TR_Print
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 5
    Top = 36
  end
  object DS_Print: TpFIBDataSet
    Database = DB_Print
    Transaction = TR_Print
    Left = 6
    Top = 68
    poSQLINT64ToBCD = True
  end
  object TR_Print: TpFIBTransaction
    DefaultDatabase = DB_Print
    TimeoutAction = TARollback
    Left = 8
    Top = 101
  end
  object ST_Print: TpFIBStoredProc
    Database = DB_Print
    Transaction = TR_Print
    Left = 9
    Top = 135
  end
  object actlst1: TActionList
    Left = 213
    Top = 111
    object actPrint: TAction
      Caption = #1044#1088#1091#1082
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DS_Print
    Left = 376
    Top = 69
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.DoubleBuffered = False
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 39658.587690601890000000
    ReportOptions.LastChange = 39688.577013680600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 376
    Top = 101
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'DateB'
        Value = #39'01.07.2008'#39
      end
      item
        Name = 'DateE'
        Value = #39'31.07.2008'#39
      end
      item
        Name = 'ORG_NAME'
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'ORG_SHORT_NAME'
        Value = #39#1044#1086#1085#1053#1059#39
      end
      item
        Name = 'ORG_KOD_OKPO'
        Value = #39'02070803'#39
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
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 68.031540000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."KR_SM_KOD"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 124.724490000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."KR_RZ_KOD"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 181.417440000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."KR_ST_KOD"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 238.110390000000000000
          Width = 52.913420000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."KR_KEKV_KOD"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 616.063390000000000000
          Width = 98.267780000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            ' [frxDBDataset1."SUMMA"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Width = 68.031540000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."DB_SCH_NUMBER"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 291.023810000000000000
          Width = 211.653680000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME"] [frxDBDataset1."NOMN"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 502.677490000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."SHORT_NAME"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 548.031850000000000000
          Width = 68.031540000000000000
          Height = 30.236240000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          HideZeros = True
          Memo.Strings = (
            '[frxDBDataset1."KOL_MAT"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 684.094930000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Left = 642.419312533333000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_GROUP_4"'
        object Memo11: TfrxMemoView
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP4"]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_GROUP_3"'
        object Memo12: TfrxMemoView
          Left = 41.574830000000000000
          Width = 672.756340000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP3"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object GroupHeader3: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_GROUP_2"'
        object Memo13: TfrxMemoView
          Left = 79.370130000000000000
          Width = 634.961040000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP2"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object GroupHeader4: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ID_GROUP_1"'
        object Memo14: TfrxMemoView
          Left = 109.606370000000000000
          Width = 604.724800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP1"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
      object Header1: TfrxHeader
        Height = 37.795300000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Left = 68.031540000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1041#1102#1076#1078#1077#1090)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 124.724490000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1086#1079#1076#1110#1083)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 181.417440000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1090#1072#1090#1090#1103)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 238.110390000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1045#1050#1042)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 616.063390000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1088'.'#1088#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 291.023810000000000000
          Top = 18.897650000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072', '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1080#1081' '#1085#1086#1084#1077#1088)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 502.677490000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1054#1076'.'#1074#1080#1084'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100)
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        object Memo24: TfrxMemoView
          Left = 616.063390000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 548.031850000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' [frxDBDataset1."NAME_GROUP1"]')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 476.220780000000000000
        Width = 718.110700000000000000
        object Memo27: TfrxMemoView
          Left = 616.063390000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' [frxDBDataset1."NAME_GROUP2"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 548.031850000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
          ParentFont = False
        end
      end
      object GroupFooter3: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 517.795610000000000000
        Width = 718.110700000000000000
        object Memo30: TfrxMemoView
          Left = 616.063390000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 548.031850000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' [frxDBDataset1."NAME_GROUP3"]')
          ParentFont = False
        end
      end
      object GroupFooter4: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 559.370440000000000000
        Width = 718.110700000000000000
        object Memo33: TfrxMemoView
          Left = 616.063390000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 548.031850000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' [frxDBDataset1."NAME_GROUP4"]')
          ParentFont = False
        end
      end
      object GroupHeader5: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."DB_SCH_TITLE"'
        Stretched = True
        object Memo36: TfrxMemoView
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."KR_SCH_NUMBER"]  [frxDBDataset1."KR_SCH_TITLE"]')
          ParentFont = False
        end
      end
      object GroupFooter5: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 600.945270000000000000
        Width = 718.110700000000000000
        object Memo41: TfrxMemoView
          Width = 548.031850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091' [frxDBDataset1."KR_SCH_NUMBER"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 548.031850000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."KOL_MAT">,MasterData1)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 616.063390000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDataset1."SUMMA">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 375
    Top = 134
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 363
    Top = 14
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 348
    Top = 149
  end
  object frxXLSExport2: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 313
    Top = 151
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
    Left = 284
    Top = 152
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 253
    Top = 152
  end
end
