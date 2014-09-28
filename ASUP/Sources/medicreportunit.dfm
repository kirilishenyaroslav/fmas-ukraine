object MedicReportForm: TMedicReportForm
  Left = 525
  Top = 190
  Width = 398
  Height = 358
  Caption = #1047#1074#1110#1090#1080' '#1087#1086' '#1084#1077#1076#1080#1095#1085#1086#1084#1091' '#1086#1075#1083#1103#1076#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 50
    Width = 68
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1074#1110#1090#1091':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ReportDatePicker: TDateTimePicker
    Left = 96
    Top = 48
    Width = 129
    Height = 21
    Date = 38287.609197453700000000
    Time = 38287.609197453700000000
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 79
    Width = 369
    Height = 185
    Caption = #1042#1080#1073#1077#1088#1080#1090#1100' '#1090#1080#1087' '#1079#1074#1110#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object AllMedicReportBtn: TRadioButton
    Left = 16
    Top = 96
    Width = 281
    Height = 17
    Caption = #1047#1072#1075#1072#1083#1100#1085#1080#1081' '#1089#1087#1080#1089#1086#1082
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    TabStop = True
  end
  object HarmfullRadioButton: TRadioButton
    Left = 16
    Top = 120
    Width = 289
    Height = 17
    Caption = #1064#1082#1110#1076#1083#1080#1074#1110' '#1091#1084#1086#1074#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object PrikazRadioButton: TRadioButton
    Left = 16
    Top = 144
    Width = 353
    Height = 17
    Caption = #1047#1075#1110#1076#1085#1086' '#1085#1072#1082#1072#1079#1091' '#8470'280'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object OkBtn: TBitBtn
    Left = 40
    Top = 280
    Width = 97
    Height = 25
    Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = OkBtnClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777772222277777777722222222277777722222222222777722222222222
      22777222227F22222277222227FFF222222722227F7FF222222722222222FF22
      222722222222FF222227222222222FF22227722222222FF22277722222222222
      2277772222222222277777722222222277777777722222777777}
  end
  object CancelBtn: TBitBtn
    Left = 272
    Top = 280
    Width = 97
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 6
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777770777777777707770907777777779777999077777770777799997777770
      9777779990777709777777799907709977777777999009977777777779999977
      7777777770999077777777770999990777777700999779907777709999777799
      0777799997777779907779997777777779777777777777777777}
  end
  object DriversRadioButton: TRadioButton
    Left = 16
    Top = 168
    Width = 113
    Height = 17
    Caption = #1042#1086#1076#1110#1111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object OrdinaryRadioButton: TRadioButton
    Left = 16
    Top = 192
    Width = 129
    Height = 17
    Caption = #1047#1072#1075#1072#1083#1100#1085#1110' '#1091#1084#1086#1074#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object SexBox: TCheckBox
    Left = 120
    Top = 240
    Width = 137
    Height = 17
    Caption = #1042#1110#1076#1073#1110#1088#1072#1090#1080' '#1078#1110#1085#1086#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object PensionerRadioButton: TRadioButton
    Left = 16
    Top = 216
    Width = 113
    Height = 17
    Caption = #1055#1077#1085#1089#1110#1086#1085#1077#1088#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object ExportButton: TBitBtn
    Left = 152
    Top = 280
    Width = 105
    Height = 25
    Caption = #1045#1082#1089#1087#1086#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = OkBtnClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      33333333330A033333333333330A033333333333330A033333333333330A0333
      33333333330A033333333330000A000033333330AAAAAAA0333333330AAAAA03
      333333330AAAAA033333333330AAA0333333333330AAA03333333333330A0333
      33333333330A0333333333333330333333333333333033333333}
  end
  object Department: TqFSpravControl
    Left = 8
    Top = 8
    Width = 361
    Height = 21
    DisplayName = #1055#1110#1076#1088#1086#1079#1076#1110#1083
    Interval = 120
    Value = Null
    LabelColor = clGreen
    Required = True
    Semicolon = True
    Asterisk = True
    Enabled = True
    Blocked = False
    TabOrder = 12
    AutoSaveToRegistry = False
    OnOpenSprav = DepartmentOpenSprav
    DisplayText = ''
  end
  object DetailsQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM REPORT_MEDIC_2(:Id_Department, :Date_Beg, :Report_Type,'
      ':Id_Property, :Only_Women)')
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Department'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Beg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Report_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Id_Property'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Only_Women'
        ParamType = ptUnknown
      end>
  end
  object MedicReport: TfrReport
    Dataset = MedicReportDataSet
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 248
    Top = 56
    ReportForm = {19000000}
  end
  object MedicReportDataSet: TfrDBDataSet
    DataSet = DetailsQuery
    Left = 280
    Top = 56
  end
  object ChiefQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CHIEF_FIO,CHIEF_POST_NAME FROM GET_DEPARTMENT_HEAD2(3612,' +
        ':REPORT_DATE,1012)')
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'REPORT_DATE'
        ParamType = ptUnknown
      end>
    object ChiefQueryCHIEF_FIO: TIBStringField
      FieldName = 'CHIEF_FIO'
      Origin = 'GET_DEPARTMENT_HEAD2.CHIEF_FIO'
      Size = 63
    end
    object ChiefQueryCHIEF_POST_NAME: TIBStringField
      FieldName = 'CHIEF_POST_NAME'
      Origin = 'GET_DEPARTMENT_HEAD2.CHIEF_POST_NAME'
      Size = 100
    end
  end
end
