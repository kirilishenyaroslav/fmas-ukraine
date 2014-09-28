object AcExPrintReport: TAcExPrintReport
  Left = 452
  Top = 241
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080
  ClientHeight = 282
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 26
    Width = 35
    Height = 13
    Caption = #1053#1072#1079#1074#1072':'
  end
  object Label2: TLabel
    Left = 221
    Top = 24
    Width = 38
    Height = 13
    Caption = #1056#1086#1079#1084#1110#1088':'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 13
    Caption = #1064#1088#1080#1092#1090
  end
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 26
    Height = 13
    Caption = #1055#1086#1083#1077
  end
  object Label5: TLabel
    Left = 8
    Top = 152
    Width = 53
    Height = 13
    Caption = #1054#1088#1110#1108#1085#1090#1072#1094#1110#1103
  end
  object Label6: TLabel
    Left = 24
    Top = 96
    Width = 39
    Height = 13
    Caption = #1042#1077#1088#1093#1085#1077':'
  end
  object Label7: TLabel
    Left = 24
    Top = 120
    Width = 25
    Height = 13
    Caption = #1051#1110#1074#1077':'
  end
  object Label8: TLabel
    Left = 164
    Top = 96
    Width = 37
    Height = 13
    Caption = #1053#1080#1078#1085#1077':'
  end
  object Label9: TLabel
    Left = 164
    Top = 120
    Width = 35
    Height = 13
    Caption = #1055#1088#1072#1074#1077':'
  end
  object GroupBox1: TGroupBox
    Left = 50
    Top = 9
    Width = 231
    Height = 7
    TabOrder = 7
  end
  object GroupBox2: TGroupBox
    Left = 43
    Top = 73
    Width = 238
    Height = 7
    TabOrder = 8
  end
  object GroupBox4: TGroupBox
    Left = 80
    Top = 153
    Width = 201
    Height = 7
    TabOrder = 9
  end
  object cxSpinEdit1: TcxSpinEdit
    Left = 67
    Top = 93
    Width = 50
    Height = 21
    Style.BorderStyle = ebs3D
    Style.ButtonStyle = bts3D
    TabOrder = 2
    Value = 1
    OnKeyPress = OnKeyPress
  end
  object cxFontNameComboBox1: TcxFontNameComboBox
    Left = 16
    Top = 40
    Width = 185
    Height = 21
    ParentFont = False
    Style.BorderStyle = ebs3D
    Style.HotTrack = True
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.ButtonStyle = bts3D
    TabOrder = 0
  end
  object cxComboBox1: TcxComboBox
    Left = 220
    Top = 40
    Width = 57
    Height = 21
    Properties.Items.Strings = (
      '8'
      '9'
      '10'
      '12'
      '14'
      '16'
      '18'
      '20'
      '22'
      '24'
      '26'
      '28'
      '36'
      '48'
      '72')
    Style.BorderStyle = ebs3D
    Style.ButtonStyle = bts3D
    TabOrder = 1
    Text = '12'
    OnKeyPress = OnKeyPress
  end
  object cxSpinEdit2: TcxSpinEdit
    Left = 67
    Top = 117
    Width = 50
    Height = 21
    Style.BorderStyle = ebs3D
    Style.ButtonStyle = bts3D
    TabOrder = 4
    Value = 1
    OnKeyPress = OnKeyPress
  end
  object cxSpinEdit3: TcxSpinEdit
    Left = 204
    Top = 93
    Width = 50
    Height = 21
    Properties.ValueType = vtInt
    Style.BorderStyle = ebs3D
    Style.ButtonStyle = bts3D
    TabOrder = 3
    Value = 15
    OnKeyPress = OnKeyPress
  end
  object cxSpinEdit4: TcxSpinEdit
    Left = 204
    Top = 117
    Width = 50
    Height = 21
    Style.BorderStyle = ebs3D
    Style.ButtonStyle = bts3D
    TabOrder = 5
    Value = 15
    OnKeyPress = OnKeyPress
  end
  object cxButton1: TcxButton
    Left = 208
    Top = 208
    Width = 75
    Height = 25
    Caption = #1044#1088#1091#1082
    Default = True
    TabOrder = 6
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
  end
  object Panel1: TPanel
    Left = 64
    Top = 168
    Width = 70
    Height = 96
    BorderStyle = bsSingle
    Caption = #1055#1086#1088#1090#1088#1077#1090#1085#1072
    Color = clWhite
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 10
    OnClick = Panel1Click
  end
  object cxLabel1: TcxLabel
    Left = 116
    Top = 94
    Width = 24
    Height = 17
    TabOrder = 11
    Caption = #1084#1084
  end
  object cxLabel2: TcxLabel
    Left = 116
    Top = 118
    Width = 24
    Height = 17
    TabOrder = 12
    Caption = #1084#1084
  end
  object cxLabel3: TcxLabel
    Left = 253
    Top = 94
    Width = 24
    Height = 17
    TabOrder = 13
    Caption = #1084#1084
  end
  object cxLabel4: TcxLabel
    Left = 253
    Top = 118
    Width = 24
    Height = 17
    TabOrder = 14
    Caption = #1084#1084
  end
  object cxButton2: TcxButton
    Left = 208
    Top = 240
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 15
    OnClick = cxButton2Click
    LookAndFeel.Kind = lfFlat
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = cxComboBox1
        Properties.Strings = (
          'Text')
      end
      item
        Component = cxSpinEdit1
        Properties.Strings = (
          'Value')
      end
      item
        Component = cxSpinEdit2
        Properties.Strings = (
          'Value')
      end
      item
        Component = cxSpinEdit3
        Properties.Strings = (
          'Value')
      end
      item
        Component = cxSpinEdit4
        Properties.Strings = (
          'Value')
      end>
    StorageName = 'cxPropertiesStore1'
    StorageType = stRegistry
    Left = 256
    Top = 168
  end
  object ActionList1: TActionList
    Left = 224
    Top = 168
    object Enter: TAction
      Caption = 'Enter'
      ShortCut = 13
      OnExecute = EnterExecute
    end
    object Esc: TAction
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = EscExecute
    end
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 40743.589046574070000000
    ReportOptions.LastChange = 40743.589046574070000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 8
    Top = 192
    Datasets = <>
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
      object SysMemo1: TfrxSysMemoView
        Left = 196.535560000000000000
        Top = 207.874150000000000000
        Width = 238.110390000000000000
        Height = 18.897650000000000000
        DisplayFormat.DecimalSeparator = ','
        DisplayFormat.FormatStr = '%2.2n'
        DisplayFormat.Kind = fkNumeric
        Memo.Strings = (
          '[SUM(<ds1."df1">,db1)]')
      end
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 98.267780000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    OpenDataSource = False
    Left = 8
    Top = 224
  end
  object frxDBDatasetV: TfrxDBDataset
    UserName = 'frxDBDatasetV'
    CloseDataSource = False
    OpenDataSource = False
    Left = 40
    Top = 224
  end
end
