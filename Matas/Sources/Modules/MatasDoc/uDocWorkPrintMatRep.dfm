object DocWorkPrintMatRep: TDocWorkPrintMatRep
  Left = 414
  Top = 336
  BorderStyle = bsDialog
  Caption = 'DocWorkPrintMatRep'
  ClientHeight = 163
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 280
    Top = 72
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
  object Label6: TLabel
    Left = 10
    Top = 41
    Width = 25
    Height = 13
    Caption = #1047#1074#1110#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxCheckEdit: TcxCheckBox
    Left = 2
    Top = 144
    Width = 25
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = ''
    TabOrder = 0
  end
  object cxCheckOnPrinter: TcxCheckBox
    Left = 16
    Top = 69
    Width = 169
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 1
  end
  object cxSelectPrinter: TcxCheckBox
    Left = 16
    Top = 93
    Width = 153
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1073#1088#1072#1090#1080' '#1087#1088#1080#1085#1090#1077#1088
    TabOrder = 2
  end
  object cxCopies: TcxSpinEdit
    Left = 384
    Top = 69
    Width = 49
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.MaxValue = 999.000000000000000000
    Properties.MinValue = 1.000000000000000000
    Properties.ReadOnly = False
    TabOrder = 3
    Value = 1
  end
  object CancelButton: TcxButton
    Left = 223
    Top = 127
    Width = 125
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = CancelButtonClick
    Glyph.Data = {
      36080000424D3608000000000000360000002800000020000000100000000100
      2000000000000008000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00174AFD00103BF40000009A00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00002CF8000030FC0000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00A8A8A800A0A0A0006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B009A9A9A009C9C9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A001A47F8001A4CFF00123BF10000009A00FF00FF00FF00FF000000
      9A00012DF6000132FF00002AF30000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00A7A7A700AAAAAA009F9F9F006B6B6B00FF00FF00FF00FF006B6B
      6B00999999009E9E9E00979797006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A001C47F6001B4DFF00143EF40000009A0000009A00002D
      F8000134FF00032BF20000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B00A7A7A700ABABAB00A2A2A2006B6B6B006B6B6B009A9A
      9A009E9E9E00989898006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000009A001D48F6001D50FF00103DFB000431FE000132
      FF00002CF60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF006B6B6B00A7A7A700ACACAC00A3A3A3009F9F9F009E9E
      9E00999999006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000009A001A48F9001342FF000C3CFF000733
      F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF006B6B6B00A7A7A700A7A7A700A3A3A3009C9C
      9C006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000009A00214EFC001D4BFF001847FF001743
      F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF006B6B6B00ACACAC00ACACAC00A9A9A900A4A4
      A4006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000009A002E5BF9002C5FFF00224DF800204BF8002355
      FF001B46F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF006B6B6B00B1B1B100B3B3B300ABABAB00AAAAAA00AFAF
      AF00A6A6A6006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A003664FA00386BFF002D59F40000009A0000009A00224C
      F4002558FF001D49F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B00B6B6B600B9B9B900AEAEAE006B6B6B006B6B6B00A9A9
      A900B0B0B000A7A7A7006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A004071FA004274FF00325DF10000009A00FF00FF00FF00FF000000
      9A00224DF100275AFF00204CF80000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00BBBBBB00BEBEBE00AFAFAF006B6B6B00FF00FF00FF00FF006B6B
      6B00A7A7A700B1B1B100AAAAAA006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A00497AFC003B66F30000009A00FF00FF00FF00FF00FF00FF00FF00
      FF0000009A002550F4002655FA0000009A00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00C0C0C000B5B5B5006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF006B6B6B00AAAAAA00AEAEAE006B6B6B00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006B6B6B006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    NumGlyphs = 2
    UseSystemPaint = False
  end
  object OkButton: TcxButton
    Left = 87
    Top = 127
    Width = 125
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = OkButtonClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF008684840086848400FF00FF00FF00FF00868484008684
      8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0086848400BCBABA00B5B3B300868484008684840086848400EBEA
      EA00868484008684840086848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0086848400E3E2E200B5B3B300B5B3B300B5B3B300515050004F4F4F008687
      8700CDCDCD00E8E9E900C7C6C600868484008684840086848400FF00FF008684
      8400DEDDDD00D6D6D600A4A3A300A4A3A300A4A3A30056555500161516001212
      1200181818001212120093939300CACACA0086848400FF00FF0086848400D6D6
      D600D6D6D600A4A3A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D
      9D0079767700121212001414140013131300868484008F8C8C0086848400D6D6
      D600A4A3A300F3F2F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9
      D900CCCBCB00BFBDBD00A2A0A00073717100939191008E8C8C0086848400A4A3
      A300FFFFFF00FEFDFD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CE
      CF00E0E0E000E1E1E100D4D3D300C7C6C600A7A5A50086838300FF00FF008684
      840086848400F1F0F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1AC
      AD00AFA9AA00B2ADAE00CAC9C900DCDCDC00D0D0D00086848400FF00FF00FF00
      FF00FF00FF0086848400CAA09700BA9E8700A2897E0095817B00897C7F00928C
      9200A5A2A400BBB6B700D7D6D600CFCFCF0086848400FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A7
      8600CC9A9900989596008684840086848400FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD3
      9F00CC9A9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00CE9D9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A
      9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00CC9A9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A
      9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00CC9A9900FFFFF500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A
      9900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00CC9A9900CC9A9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A9900FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00CC9A9900CC9A9900CC9A9900FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    UseSystemPaint = False
  end
  object cxReport: TcxComboBox
    Left = 48
    Top = 37
    Width = 385
    Height = 21
    BeepOnEnter = False
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090' '#1087#1088#1086' '#1087#1088#1080#1093#1110#1076' '#1058#1052#1062' ('#1056#1072#1093#1091#1085#1086#1082'+'#1043#1088#1091#1087#1080'+'#1042#1110#1076' '#1082#1086#1075#1086')'
      #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090' '#1087#1088#1086' '#1087#1088#1080#1093#1110#1076' '#1058#1052#1062' ('#1042#1110#1076' '#1082#1086#1075#1086'+'#1056#1072#1093#1091#1085#1086#1082'+'#1043#1088#1091#1087#1080')'
      #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090' '#1087#1088#1086' '#1074#1080#1076#1072#1090#1086#1082' '#1058#1052#1062' ('#1056#1072#1093#1091#1085#1086#1082'+'#1043#1088#1091#1087#1080'+'#1050#1086#1084#1091')'
      #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1080#1081' '#1079#1074#1110#1090' '#1087#1088#1086' '#1074#1080#1076#1072#1090#1086#1082' '#1058#1052#1062' ('#1050#1086#1084#1091'+'#1056#1072#1093#1091#1085#1086#1082'+'#1043#1088#1091#1087#1080')')
    TabOrder = 6
  end
  object cxExportExel: TcxCheckBox
    Left = 278
    Top = 100
    Width = 151
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1045#1082#1089#1087#1086#1088#1090#1091#1074#1072#1090#1080' '#1074' Exel'
    TabOrder = 7
  end
  object cxCheckBalSch: TcxCheckBox
    Left = 16
    Top = 8
    Width = 249
    Height = 21
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1043#1088#1091#1087#1091#1074#1072#1090#1080' '#1087#1086' '#1073#1072#1083#1072#1085#1089#1086#1074#1080#1084' '#1088#1072#1093#1091#1085#1082#1072#1084
    State = cbsChecked
    TabOrder = 8
  end
  object cxLabel1: TcxLabel
    Left = 272
    Top = 11
    Width = 109
    Height = 17
    TabOrder = 9
    Caption = #1056#1110#1074#1077#1085#1100' '#1075#1088#1091#1087' '#1058#1052#1062
  end
  object cxSpinEditLevel: TcxSpinEdit
    Left = 384
    Top = 8
    Width = 49
    Height = 21
    Properties.MaxValue = 4.000000000000000000
    TabOrder = 10
    Value = 4
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 16
    Top = 40
  end
  object ReportDataset: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    SelectSQL.Strings = (
      '')
    Left = 40
    Top = 40
    poSQLINT64ToBCD = True
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 16
    Top = 64
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 39483.585242685200000000
    ReportOptions.LastChange = 39485.732707418980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 224
    Top = 64
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'DateB'
        Value = #39'01.12.2007'#39
      end
      item
        Name = 'DateE'
        Value = #39'31.01.2008'#39
      end
      item
        Name = 'ORG_NAME'
        Value = #39#1044#1086#1085#1073#1072#1089#1100#1082#1080#1081' '#1076#1077#1088#1078#1072#1074#1085#1080#1081' '#1090#1077#1093#1085#1110#1095#1085#1080#1081' '#1091#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'ORG_SHORT_NAME'
        Value = #39#1044#1086#1085#1044#1058#1059#39
      end
      item
        Name = 'ORG_KOD_OKPO'
        Value = #39'02070708'#39
      end
      item
        Name = 'TYPE'
        Value = #39#1087#1088#1080#1093#1086#1076#1091#39
      end>
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
        Height = 177.637910000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo14: TfrxMemoView
          Left = 4.881880000000000000
          Top = 122.015770000000000000
          Width = 1040.189860000000000000
          Height = 39.149660000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1110#1076#1086#1084#1110#1089#1090#1100' '#1079' [TYPE] '#1058#1052#1062' '#1087#1086' '#1075#1088#1091#1087#1072#1084
            #1079#1072' '#1087#1077#1088'i'#1086#1076' '#1079' [DateB] '#1087#1086' [DateE]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 4.881880000000000000
          Top = 56.692949999999990000
          Width = 410.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1085#1072#1079#1074#1072' '#1091#1089#1090#1072#1085#1086#1074#1080')')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Top = 70.929190000000000000
          Width = 137.385900000000000000
          Height = 46.236240000000000000
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076
            #1079#1072' '#1028#1044#1056#1055#1054#1059)
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 141.165430000000000000
          Top = 82.929190000000000000
          Width = 130.488250000000000000
          Height = 22.236240000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_KOD_OKPO]')
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 4.881880000000000000
          Top = 34.015770000000010000
          Width = 406.362400000000000000
          Height = 22.677180000000000000
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_NAME]')
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object Memo2: TfrxMemoView
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'DB_SCH_NUMBER'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."DB_SCH_NUMBER"]')
        end
        object Memo3: TfrxMemoView
          Left = 139.842610000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'KR_SCH_NUMBER'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."KR_SCH_NUMBER"]')
        end
        object Memo6: TfrxMemoView
          Left = 952.441560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA"]')
        end
        object Memo7: TfrxMemoView
          Left = 275.905690000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME"]')
        end
        object Memo9: TfrxMemoView
          Left = 668.976810000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NOMN"]')
        end
        object Memo10: TfrxMemoView
          Left = 782.362710000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."SHORT_NAME"]')
        end
        object Memo11: TfrxMemoView
          Left = 854.173780000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."KOL_MAT"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 257.008040000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDataset1."ID_GROUP_1"'
        object Memo12: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP1"]')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDataset1."ID_GROUP_2"'
        object Memo13: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_GROUP2"]')
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 340.157700000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1044#1077#1073#1077#1090#1086#1074#1099#1081' '#1089#1095#1077#1090)
        end
        object Memo4: TfrxMemoView
          Left = 139.842610000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1050#1088#1077#1076#1080#1090#1086#1074#1099#1081' '#1089#1095#1077#1090)
        end
        object Memo5: TfrxMemoView
          Left = 275.905690000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077)
        end
        object Memo8: TfrxMemoView
          Left = 668.976810000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072)
        end
        object Memo19: TfrxMemoView
          Left = 782.362710000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1077#1076'.'#1080#1079#1084'.')
        end
        object Memo20: TfrxMemoView
          Left = 854.173780000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086)
        end
        object Memo21: TfrxMemoView
          Left = 952.441560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #1057#1091#1084#1084#1072)
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ReportDataset
    Left = 128
    Top = 64
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 184
    Top = 64
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 40
    Top = 104
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    Background = True
    Creator = 'FastReport'#174
    Left = 72
    Top = 104
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 104
    Top = 104
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
    Left = 136
    Top = 104
  end
  object KeyActionList: TActionList
    Left = 304
    Top = 48
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
    object ActionOk: TAction
      Caption = 'ActionOk'
      ShortCut = 16419
      OnExecute = ActionOkExecute
    end
  end
end
