object frmSchToPay: TfrmSchToPay
  Left = 390
  Top = 244
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmSchToPay'
  ClientHeight = 306
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Osnovanie_Label: TLabel
    Left = 4
    Top = 161
    Width = 51
    Height = 13
    Caption = 'Osnovanie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Memo: TcxMemo
    Left = 3
    Top = 176
    Width = 190
    Height = 89
    Properties.ReadOnly = False
    Style.Color = 16311512
    TabOrder = 0
    OnKeyPress = MemoKeyPress
  end
  object cxGroupBox1: TcxGroupBox
    Left = 200
    Top = 170
    Width = 217
    Height = 95
    Alignment = alTopLeft
    TabOrder = 1
    TabStop = False
    object Summa_Sch_Label: TLabel
      Left = 44
      Top = 14
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Summa_Sch'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NDS_Label: TLabel
      Left = 49
      Top = 38
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'NDS_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Itogo_Label: TLabel
      Left = 48
      Top = 72
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Itogo_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 195
      Top = 14
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = #1075#1088#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 195
      Top = 38
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = #1075#1088#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 195
      Top = 72
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = #1075#1088#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SummaSch_Edit: TcxCurrencyEdit
      Left = 106
      Top = 10
      Width = 89
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Style.Color = 16311512
      TabOrder = 0
      OnKeyPress = SummaSch_EditKeyPress
    end
    object NDS_Edit: TcxCurrencyEdit
      Left = 106
      Top = 34
      Width = 89
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Style.Color = 16311512
      TabOrder = 1
      OnKeyPress = NDS_EditKeyPress
    end
    object Itogo_Edit: TcxCurrencyEdit
      Left = 106
      Top = 68
      Width = 89
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.00;'
      Properties.OnEditValueChanged = Itogo_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = Itogo_EditKeyPress
    end
  end
  object OkButton: TcxButton
    Left = 236
    Top = 274
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 2
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 330
    Top = 274
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object cxGroupBox2: TcxGroupBox
    Left = 2
    Top = 32
    Width = 416
    Height = 129
    Alignment = alTopLeft
    TabOrder = 4
    TabStop = False
    object Payre_Label: TLabel
      Left = 101
      Top = 98
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Payre_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object RasShet_Label: TLabel
      Left = 87
      Top = 60
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'RasShet_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SchToPay_Label: TLabel
      Left = 78
      Top = 12
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'SchToPay_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Num_Dog_Label: TLabel
      Left = 80
      Top = 36
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Num_Dog_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Vid_Label: TLabel
      Left = 295
      Top = 12
      Width = 15
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vid'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Account_Label: TLabel
      Left = 164
      Top = 78
      Width = 245
      Height = 16
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5527339
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object id_payer_ComboBox: TcxComboBox
      Left = 162
      Top = 94
      Width = 249
      Height = 21
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 6
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Properties.OnChange = id_payer_ComboBoxPropertiesChange
      Properties.OnCloseUp = id_payer_ComboBoxPropertiesCloseUp
      Style.Color = 16311512
      TabOrder = 0
      OnKeyPress = id_payer_ComboBoxKeyPress
    end
    object SchNumberSprav_Edit: TcxTextEdit
      Left = 162
      Top = 8
      Width = 121
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = False
      Style.Color = 16311512
      TabOrder = 1
      OnKeyPress = SchNumberSprav_EditKeyPress
    end
    object Num_Dog_Edit: TcxTextEdit
      Left = 162
      Top = 32
      Width = 121
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16311512
      TabOrder = 2
      OnKeyPress = Num_Dog_EditKeyPress
    end
    object DateEdit: TcxDateEdit
      Left = 314
      Top = 8
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = 16311512
      TabOrder = 3
      OnKeyPress = DateEditKeyPress
    end
    object RS_Edit: TcxTextEdit
      Left = 2
      Top = 56
      Width = 121
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16311512
      TabOrder = 4
      Visible = False
      OnKeyPress = RS_EditKeyPress
    end
    object Accounts: TcxButtonEdit
      Left = 162
      Top = 56
      Width = 120
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = AccountsPropertiesButtonClick
      Style.Color = 16311512
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 5
    end
  end
  object Grid_payers: TcxGrid
    Left = 64
    Top = 312
    Width = 161
    Height = 131
    TabOrder = 5
    Visible = False
    LookAndFeel.Kind = lfUltraFlat
    object Grid_payersTableView: TcxGridTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '= 0.0000 %'
          Kind = skSum
          Column = persent
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object payer: TcxGridColumn
        Caption = 'payer'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object period: TcxGridColumn
        Caption = 'period'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 29
      end
      object persent: TcxGridColumn
        Caption = 'persent'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.0000 %'
        HeaderAlignmentHorz = taCenter
        Width = 20
      end
      object type_payer: TcxGridColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
      end
      object id_type_stage: TcxGridColumn
        Caption = 'id_type_stage.'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
      end
      object isPercent: TcxGridColumn
        Visible = False
      end
      object id_payer: TcxGridColumn
        Caption = 'id_payer'
        Visible = False
      end
      object id_rate_account: TcxGridColumn
        Caption = 'id_rate_account'
        Visible = False
      end
      object mfo: TcxGridColumn
        Caption = 'mfo'
        Visible = False
      end
      object rate: TcxGridColumn
        Caption = 'rate'
        Visible = False
      end
    end
    object Grid_payersLevel: TcxGridLevel
      GridView = Grid_payersTableView
    end
  end
  object cxCurrencyEdit1: TcxCurrencyEdit
    Left = 194
    Top = 178
    Width = 89
    Height = 21
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = '0.00;'
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 6
    Visible = False
    OnKeyPress = SummaSch_EditKeyPress
  end
  object cxCurrencyEdit2: TcxCurrencyEdit
    Left = 194
    Top = 202
    Width = 89
    Height = 21
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = '0.00;'
    Properties.ReadOnly = True
    Style.Color = 16311512
    TabOrder = 7
    Visible = False
    OnKeyPress = NDS_EditKeyPress
  end
  object cxCurrencyEdit3: TcxCurrencyEdit
    Left = 194
    Top = 236
    Width = 89
    Height = 21
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = '0.00;'
    Properties.OnEditValueChanged = Itogo_EditPropertiesEditValueChanged
    Style.Color = clInfoBk
    TabOrder = 8
    Visible = False
    OnKeyPress = Itogo_EditKeyPress
  end
  object ProgressBar: TcxProgressBar
    Left = 44
    Top = 276
    Width = 109
    Height = 21
    TabOrder = 9
  end
  object ComboBox_Shablon: TcxComboBox
    Left = 184
    Top = 8
    Width = 233
    Height = 21
    Properties.ReadOnly = False
    Style.Color = 16311512
    TabOrder = 10
    Text = 'ComboBox_Shablon'
    OnKeyPress = ComboBox_ShablonKeyPress
  end
  object cxLabel1: TcxLabel
    Left = 120
    Top = 8
    Width = 50
    Height = 17
    TabOrder = 11
    Caption = #1064#1072#1073#1083#1086#1085':'
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 24
    Top = 152
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38532.975292777800000000
    ReportOptions.LastChange = 38855.916175833300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '    if <DOLG_FINAL>=0.00 then'
      '    begin'
      '       Memo39.Text:=<PAYCONF1>+'#39' '#39'+<PAYCONF2>+'#39'.'#39';'
      '       Memo35.visible := false;'
      '       Memo36.visible := false'
      '    end;'
      ''
      'end;'
      ''
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <REC>>=25 then'
      '    begin'
      '      Page1.BottomMargin:=55;'
      '    end;'
      'end;'
      ''
      'procedure Memo11OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnPrintReport = frxReportPrintReport
    Left = 72
    Top = 104
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = 'PLATIL_FINAL'
        Value = #39'7746'#39
      end
      item
        Name = 'NADO_FINAL'
        Value = #39'7746'#39
      end
      item
        Name = 'DOLG_FINAL'
        Value = #39'0'#39
      end
      item
        Name = 'NAMEREP0'
        Value = #39#1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1085#1072#39
      end
      item
        Name = 'NAMEREP'
        Value = #39#1044#1086#1074#1110#1076#1082#1072' '#8470#39
      end
      item
        Name = 'NAMEREP1'
        Value = #39#1087#1088#1086' '#1089#1090#1072#1085' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1079#1072' '#1085#1072#1074#1095#1072#1085#1085#1103#39
      end
      item
        Name = 'NAMEREP2'
        Value = #39#1044#1086#1075#1086#1074#1110#1088' '#8470#39
      end
      item
        Name = 'OBUCHAEMIY'
        Value = #39#1054#1089#1086#1073#1072', '#1097#1086' '#1085#1072#1074#1095#1072#1108#1090#1100#1089#1103#39
      end
      item
        Name = 'BEGDATE'
        Value = #39#1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091#39
      end
      item
        Name = 'ENDDATE'
        Value = #39#1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1110#1086#1076#1091#39
      end
      item
        Name = 'STOIMOTS'
        Value = #39#1042#1072#1088#1090#1110#1089#1090#1100' '#1085#1072#1074#1095'., '#1075#1088#1085#39
      end
      item
        Name = 'SUMMA_LG'
        Value = #39#1057#1091#1084#1086#1074#1072' '#1087#1110#1083#1100#1075#1072', '#1075#1088#1085#39
      end
      item
        Name = 'PERCENT_LG'
        Value = #39#1042#1110#1076#1089#1086#1090#1086#1082' '#1087#1110#1083#1100#1075#1080', %'#39
      end
      item
        Name = 'BEG_DOLG'
        Value = #39#1041#1086#1088#1075' '#1085#1072' '#1087#1086#1095#1072#1090#1086#1082', '#1075#1088#1085#39
      end
      item
        Name = 'ALLPERIOD'
        Value = #39#1057#1091#1084#1072' '#1079#1072' '#1087#1077#1088#1110#1086#1076', '#1075#1088#1085#39
      end
      item
        Name = 'SUMPAY'
        Value = #39#1057#1091#1084#1072', '#1097#1086' '#1085#1072#1076#1110#1081#1096#1083#1072', '#1075#1088#1085#39
      end
      item
        Name = 'SUMDOLG'
        Value = #39#1041#1086#1088#1075' '#1085#1072' '#1082#1110#1085#1077#1094#1100', '#1075#1088#1085#39
      end
      item
        Name = 'PAYCONF1'
        Value = #39#1054#1087#1083#1072#1095#1077#1085#1086#39
      end
      item
        Name = 'PAYCONF2'
        Value = #39#1087#1086#1074#1085#1110#1089#1090#1102#39
      end
      item
        Name = 'BUHG'
        Value = #39#1041#1091#1093#1075#1072#1083#1090#1077#1088#39
      end
      item
        Name = 'ORG'
        Value = #39#1044#1086#1085#1077#1094#1100#1082#1080#1081' '#1053#1072#1094#1110#1086#1085#1072#1083#1100#1085#1080#1081' '#1059#1085#1110#1074#1077#1088#1089#1080#1090#1077#1090#39
      end
      item
        Name = 'FIO'
        Value = #39#1030#1047#1054#1058#1054#1042#1040' '#1054#1051#1045#1053#1040' '#1042#1030#1050#1058#1054#1056#1030#1042#1053#1040#39
      end
      item
        Name = 'NUMBER'
        Value = #39'100002'#39
      end
      item
        Name = 'SUMOPL'
        Value = #39'0'#39
      end
      item
        Name = 'REC'
        Value = #39'3'#39
      end
      item
        Name = 'SP_VIDANA'
        Value = #39#1044#1086#1074#1110#1076#1082#1072' '#1074#1080#1076#1072#1085#1072' '#1076#1083#1103' '#1087#1088#1077#1076#1103#39#39#1074#1083#1077#1085#1085#1103' '#1079#1072' '#1084#1110#1089#1094#1077#1084' '#1074#1080#1084#1086#1075#1080#39
      end
      item
        Name = 'VSEGO'
        Value = #39#1056#1072#1079#1086#1084':'#39
      end
      item
        Name = 'SUMMA_K_OPLATE'
        Value = #39#1057#1091#1084#1072' '#1086#1087#1083#1072#1090#1080#39
      end
      item
        Name = 'UGE_OPLACHENO'
        Value = #39#1042#1078#1077' '#1089#1087#1083#1072#1095#1077#1085#1086#39
      end
      item
        Name = 'SUMMA_DOLGA'
        Value = #39#1057#1091#1084#1072' '#1073#1086#1088#1075#1091#39
      end
      item
        Name = 'NUM_DOG'
        Value = #39'446/01-59/98'#39
      end
      item
        Name = 'SUM_DOLG_FINAL'
        Value = #39'249'#39
      end>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 27.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      OnBeforePrint = 'Page1OnBeforePrint'
      object ReportTitle1: TfrxReportTitle
        Height = 132.283550000000000000
        Top = 18.897650000000000000
        Width = 653.858690000000000000
        object Memo16: TfrxMemoView
          Align = baCenter
          Left = 177.637910000000000000
          Top = 15.118120000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          CharSpacing = 2.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '[ORG]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Top = 49.133889999999990000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NAMEREP] [NUMBER]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            '[NAMEREP1]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          Top = 98.267780000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[NAMEREP2]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 170.078850000000000000
          Top = 113.385900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold, fsItalic, fsUnderline]
          Memo.Strings = (
            '[FIO]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Top = 113.385900000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[OBUCHAEMIY]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 75.590600000000000000
          Top = 98.267780000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NUM_DOG]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 15.118120000000000000
        Top = 253.228510000000000000
        Width = 653.858690000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 71.811016300000000000
          Height = 15.118120000000000000
          DataField = 'BEG_DATE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."BEG_DATE"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 71.811016300000000000
          Width = 71.811016300000000000
          Height = 15.118120000000000000
          DataField = 'END_DATE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."END_DATE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 143.622032600000000000
          Width = 68.031491180000000000
          Height = 15.118120000000000000
          DataField = 'STOIMOST'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."STOIMOST"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 211.653523780000000000
          Width = 71.811035830000000000
          Height = 15.118120000000000000
          DataField = 'SUMMA_LG'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA_LG"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 283.464559610000000000
          Width = 71.811021180000000000
          Height = 15.118120000000000000
          DataField = 'PERCENT_LG'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."PERCENT_LG"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 355.275580790000000000
          Width = 71.811038270000000000
          Height = 15.118120000000000000
          DataField = 'DOLG_NACHALO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DOLG_NACHALO"]')
          ParentFont = False
        end
        object MemoKatPay: TfrxMemoView
          Align = baLeft
          Left = 427.086619060000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataField = 'SUMMA_ZA_PERIOD'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."SUMMA_ZA_PERIOD"]')
          ParentFont = False
        end
        object MemoPayPeriod: TfrxMemoView
          Align = baLeft
          Left = 502.677170239999900000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DataField = 'POSTUPIV_SUMMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."POSTUPIV_SUMMA"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 578.267721419999900000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo7OnBeforePrint'
          DataField = 'DOLG_KONEZ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDataset1."DOLG_KONEZ"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 653.858690000000000000
        Stretched = True
        object Memo20: TfrxMemoView
          Align = baLeft
          Width = 71.811016300000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[BEGDATE]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 71.811016300000000000
          Width = 71.811016300000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ENDDATE]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 143.622032600000000000
          Width = 68.031491180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[STOIMOTS]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          Left = 211.653523780000000000
          Width = 71.811035830000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMMA_LG]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 283.464559610000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[PERCENT_LG]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 355.275580790000000000
          Width = 71.811038270000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[BEG_DOLG]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 427.086619060000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[ALLPERIOD]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 502.677170239999900000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMPAY]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          Left = 578.267721419999900000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.Strings = (
            '[SUMDOLG]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 173.858380000000000000
        Top = 328.819110000000000000
        Width = 653.858690000000000000
        object Memo8: TfrxMemoView
          Width = 427.086890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[VSEGO]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 427.086890000000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[NADO_FINAL]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 502.677441179999900000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[PLATIL_FINAL]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Left = 578.267992360000000000
          Width = 75.590551180000000000
          Height = 15.118120000000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.Strings = (
            '[DOLG_FINAL]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 166.299320000000000000
          Top = 52.913419999999970000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[NADO_FINAL]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          Top = 151.181200000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[BUHG]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          Top = 124.724490000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.Strings = (
            '[SP_VIDANA]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          Top = 37.795300000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[VSEGO]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 166.299320000000000000
          Top = 68.031540000000010000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[PLATIL_FINAL]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 90.708720000000030000
          Width = 264.567100000000000000
          Frame.Typ = [ftTop]
        end
        object Memo33: TfrxMemoView
          Left = 238.110390000000000000
          Top = 52.913419999999970000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1075#1088#1085'.')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 238.110390000000000000
          Top = 68.031540000000010000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1075#1088#1085'.')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 166.299320000000000000
          Top = 90.708720000000030000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[DOLG_FINAL]')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 238.110390000000000000
          Top = 90.708720000000030000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #1075#1088#1085'.')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 12.451453330000000000
          Top = 54.026283330000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[SUMMA_K_OPLATE]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 12.671923330000000000
          Top = 69.144403340000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[UGE_OPLACHENO]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 11.338590000000000000
          Top = 90.708720000000030000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            '[SUMMA_DOLGA]')
          ParentFont = False
        end
      end
      object Memo29: TfrxMemoView
        Align = baLeft
        Top = 15.118120000000000000
        Width = 113.385900000000000000
        Height = 45.354360000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Memo.Strings = (
          '[Date]')
        ParentFont = False
      end
    end
  end
  object ActionList1: TActionList
    Left = 128
    Top = 64
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 57412
      OnExecute = Action1Execute
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    Left = 120
    Top = 144
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    Left = 56
    Top = 64
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    Left = 24
    Top = 208
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 98
    Top = 200
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 138
    Top = 216
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 178
    Top = 192
  end
end
