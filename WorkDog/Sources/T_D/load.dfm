object Arnd_Contract_Add_Form: TArnd_Contract_Add_Form
  Left = 470
  Top = 199
  BorderStyle = bsSingle
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1085#1072' '#1086#1088#1077#1085#1076#1091
  ClientHeight = 538
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 601
    Height = 537
    TabOrder = 0
    object Label14: TLabel
      Left = 1
      Top = 438
      Width = 116
      Height = 13
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1086#1075#1086#1074#1086#1088#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 1
      Top = 10
      Width = 65
      Height = 13
      Caption = #1054#1088#1077#1085#1076#1072' '#8470':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 199
      Top = 10
      Width = 23
      Height = 13
      Caption = #1042#1110#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 370
      Top = 10
      Width = 106
      Height = 13
      Caption = #1056#1077#1108#1089#1090#1088#1072#1094'. '#1085#1086#1084#1077#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 152
      Top = 477
      Width = 82
      Height = 13
      Caption = #1054#1088#1075#1089#1090#1088#1091#1082#1090#1091#1088#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 281
      Top = 194
      Width = 134
      Height = 13
      Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1072' '#1072#1088#1077#1085#1076#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 30
      Width = 417
      Height = 83
      Alignment = alTopLeft
      Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 56
        Height = 13
        Caption = #1054#1088#1077#1085#1076#1072#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 44
        Width = 36
        Height = 13
        Caption = #1052#1060#1054':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 88
        Top = 44
        Width = 66
        Height = 13
        Caption = #1056'/'#1088#1072#1093#1091#1085#1086#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 224
        Top = 45
        Width = 106
        Height = 13
        Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1073#1072#1085#1082#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 320
        Top = 14
        Width = 84
        Height = 13
        Caption = #1050#1086#1076' '#1045#1044#1056#1055#1054#1059':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object NameCust: TcxButtonEdit
        Left = 8
        Top = 24
        Width = 305
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = NameCustPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
      object MFO: TcxTextEdit
        Left = 8
        Top = 56
        Width = 73
        Height = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
      end
      object Rate_Acc: TcxTextEdit
        Left = 88
        Top = 56
        Width = 129
        Height = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 2
      end
      object Name_Bank: TcxTextEdit
        Left = 224
        Top = 57
        Width = 185
        Height = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
      end
      object Kod_EDRPOU: TcxTextEdit
        Left = 320
        Top = 26
        Width = 89
        Height = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 4
      end
    end
    object BottomPanel: TPanel
      Left = 0
      Top = 496
      Width = 609
      Height = 41
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object ApplyButton: TcxButton
        Left = 424
        Top = 8
        Width = 83
        Height = 25
        Caption = #1055#1088#1080#1081#1085#1103#1090#1080
        TabOrder = 0
        OnClick = ApplyButtonClick
        Glyph.Data = {
          76030000424D7603000000000000360000002800000011000000100000000100
          18000000000040030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF00FF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF
          00FF004B000F9E1C0F9D1E004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FF004B001CB13511A4220C9C1911
          A021004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
          FFFF00FF004B002EC65224BC43139224004B000D931A0E9D1D004B00FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FF004B0035CA5E39D4651CA1
          34004B00FF00FF004B000A86150F991C004B00FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF00FF00FFFF00FF004B0029B548004B00FF00FFFF00FFFF00FFFF00
          FF004B000C9518004B00FF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FF
          FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00098611004B
          00FF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00
          FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF004B00004B00FF00FFFF00FF00FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00}
        UseSystemPaint = False
      end
      object CancelButton: TcxButton
        Left = 512
        Top = 8
        Width = 83
        Height = 25
        Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
        TabOrder = 1
        OnClick = CancelButtonClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
          6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
          00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
          00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
          DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
          006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
          16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
          20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
          6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
          00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
          00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
          E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        UseSystemPaint = False
      end
      object InflationButton: TcxButton
        Left = 8
        Top = 8
        Width = 113
        Height = 25
        Caption = #1030#1085#1076#1077#1082#1089' '#1110#1085#1092#1083#1103#1094#1110#1111
        TabOrder = 2
        TabStop = False
        OnClick = InflationButtonClick
        OnGetDrawParams = InflationButtonGetDrawParams
      end
      object cxButton1: TcxButton
        Left = 128
        Top = 8
        Width = 153
        Height = 25
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1089#1083#1091#1075' ('#1090#1077#1089#1090')'
        TabOrder = 3
        TabStop = False
        OnClick = cxButton1Click
        OnGetDrawParams = InflationButtonGetDrawParams
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 424
      Top = 98
      Width = 177
      Height = 90
      Alignment = alTopLeft
      Caption = #1044#1086#1075#1086#1074#1110#1088' '#1091#1082#1083#1072#1083#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label9: TLabel
        Left = 9
        Top = 18
        Width = 104
        Height = 13
        Caption = #1042#1110#1076' '#1072#1076#1084#1110#1085#1110#1089#1090#1088#1072#1094#1110#1111':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 10
        Top = 50
        Width = 83
        Height = 13
        Caption = #1042#1110#1076' '#1086#1088#1077#1085#1076#1072#1088#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FIO_DonGU: TcxTextEdit
        Left = 9
        Top = 30
        Width = 160
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
      object FIO_Postav: TcxTextEdit
        Left = 9
        Top = 62
        Width = 160
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
      end
    end
    object Dog_Note_Memo: TcxMemo
      Left = 120
      Top = 435
      Width = 481
      Height = 27
      Properties.MaxLength = 160
      Properties.ScrollBars = ssVertical
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object Panel2: TPanel
      Left = 268
      Top = 368
      Width = 332
      Height = 57
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object Label18: TLabel
        Left = 9
        Top = 2
        Width = 53
        Height = 13
        Caption = #1050#1086#1096#1090#1086#1088#1080#1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 26
        Top = 14
        Width = 36
        Height = 13
        Caption = #1056#1086#1079#1076#1110#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 25
        Top = 26
        Width = 37
        Height = 13
        Caption = #1057#1090#1072#1090#1090#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object St_Label: TLabel
        Left = 64
        Top = 26
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'St_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object R_Label: TLabel
        Left = 64
        Top = 14
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'R_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object S_Label: TLabel
        Left = 64
        Top = 2
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'S_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label15: TLabel
        Left = 31
        Top = 39
        Width = 31
        Height = 13
        Caption = #1050#1045#1050#1042':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object KEKV_Label: TLabel
        Left = 64
        Top = 39
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'KEKV_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 368
      Width = 267
      Height = 57
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 5
      object Label3: TLabel
        Left = 9
        Top = 4
        Width = 84
        Height = 13
        Cursor = crHandPoint
        Caption = #1042#1078#1077' '#1089#1087#1083#1072#1095#1077#1085#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Label3Click
        OnMouseMove = Label3MouseMove
        OnMouseLeave = Label3MouseLeave
      end
      object Label16: TLabel
        Left = 9
        Top = 28
        Width = 85
        Height = 13
        Cursor = crHandPoint
        Caption = #1042#1078#1077' '#1074#1080#1082#1086#1085#1072#1085#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = Label16Click
        OnMouseMove = Label16MouseMove
        OnMouseLeave = Label16MouseLeave
      end
      object CurrencyEdit_summa_pay: TCurrencyEdit
        Left = 142
        Top = 4
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Color = 14281696
        DisplayFormat = ',0.00 ;-,0.00 '
        Enabled = False
        TabOrder = 0
      end
      object CurrencyEdit_sum_fulfil: TCurrencyEdit
        Left = 142
        Top = 28
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        Color = 14281696
        DisplayFormat = ',0.00 ;-,0.00 '
        Enabled = False
        TabOrder = 1
      end
    end
    object LeftPanel: TPanel
      Left = 0
      Top = 208
      Width = 266
      Height = 161
      BevelOuter = bvNone
      TabOrder = 6
      object PeriodGrid: TcxGrid
        Left = 0
        Top = 26
        Width = 266
        Height = 135
        Align = alClient
        TabOrder = 0
        object PeriodTableView: TcxGridTableView
          OnKeyDown = PeriodTableViewKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Date_Beg_Column
            end
            item
              Format = ',0.00 ;-,0.00 '
              Kind = skSum
              Column = Summa_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = PeriodTableViewFocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = cxGridTableViewStyleSheet1
          object State_Period_Column: TcxGridColumn
            Visible = False
            Options.Sorting = False
            Width = 34
          end
          object id_Per_Column: TcxGridColumn
            Visible = False
            Options.Sorting = False
          end
          object Date_Beg_Column: TcxGridColumn
            Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            SortOrder = soAscending
            Width = 74
          end
          object Date_End_Column: TcxGridColumn
            Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            Options.Sorting = False
            Width = 74
          end
          object Summa_Column: TcxGridColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.NullString = '0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.UseThousandSeparator = True
            Properties.OnEditValueChanged = Summa_ColumnPropertiesEditValueChanged
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Sorting = False
            Width = 116
          end
        end
        object PeriodGridLevel: TcxGridLevel
          GridView = PeriodTableView
        end
      end
      object PeriodDockControl: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 266
        Height = 26
        Align = dalTop
        BarManager = BarManager
        Color = 15451300
        ParentColor = False
        UseOwnColor = True
      end
    end
    object RightPanel: TPanel
      Left = 268
      Top = 208
      Width = 332
      Height = 161
      BevelOuter = bvNone
      TabOrder = 7
      object SmetaGrid: TcxGrid
        Left = 0
        Top = 26
        Width = 332
        Height = 135
        Align = alClient
        TabOrder = 0
        object SmetaTableView: TcxGridTableView
          OnKeyDown = SmetaTableViewKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = S_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = SSumma_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnEditValueChanged = SmetaTableViewEditValueChanged
          OnFocusedRecordChanged = SmetaTableViewFocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderHeight = 32
          Styles.StyleSheet = cxGridTableViewStyleSheet1
          object State_Smeta_Column: TcxGridColumn
            Visible = False
            Options.Editing = False
          end
          object S_Column: TcxGridColumn
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = S_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            SortOrder = soAscending
            Width = 70
          end
          object R_Column: TcxGridColumn
            Caption = #1056#1086#1079#1076#1110#1083
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            SortOrder = soAscending
            Width = 61
          end
          object St_Column: TcxGridColumn
            Caption = #1057#1090#1072#1090#1090#1103
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            SortOrder = soAscending
            Width = 66
          end
          object Kekv_Column: TcxGridColumn
            Caption = #1050#1045#1050#1042
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = Kekv_ColumnPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            SortOrder = soAscending
            Width = 60
          end
          object SSumma_Column: TcxGridColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Width = 73
          end
          object S_Name_Column: TcxGridColumn
            Visible = False
            Options.Editing = False
          end
          object R_Name_Column: TcxGridColumn
            Visible = False
            Options.Editing = False
          end
          object St_Name_Column: TcxGridColumn
            PropertiesClassName = 'TcxTextEditProperties'
            Visible = False
            Options.Editing = False
          end
          object id_S_Column: TcxGridColumn
            Visible = False
            Options.Editing = False
          end
          object id_R_Column: TcxGridColumn
            Visible = False
            Options.Editing = False
          end
          object id_St_Column: TcxGridColumn
            Visible = False
            Options.Editing = False
          end
          object id_Kekv_Column: TcxGridColumn
            Visible = False
            Options.Editing = False
          end
          object Name_Kekv_Column: TcxGridColumn
            Visible = False
            Options.Editing = False
          end
        end
        object SmetaGridLevel: TcxGridLevel
          GridView = SmetaTableView
        end
      end
      object SmetDockControl: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 332
        Height = 26
        Align = dalTop
        BarManager = BarManager
        Color = 15451300
        ParentColor = False
        UseOwnColor = True
      end
    end
    object ArndNumEdit: TcxTextEdit
      Left = 64
      Top = 6
      Width = 121
      Height = 21
      Style.Color = clMoneyGreen
      TabOrder = 8
    end
    object ArndDateEdit: TcxDateEdit
      Left = 232
      Top = 6
      Width = 97
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clMoneyGreen
      TabOrder = 9
    end
    object cxTextEdit_reg_number: TcxTextEdit
      Left = 480
      Top = 6
      Width = 122
      Height = 21
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.Color = 14281696
      TabOrder = 10
    end
    object cxGroupBox2: TcxGroupBox
      Left = 424
      Top = 32
      Width = 177
      Height = 65
      Alignment = alTopLeft
      Caption = #1058#1077#1088#1084#1110#1085' '#1076#1110#1111' '#1076#1086#1075#1086#1074#1086#1088#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      object Label4: TLabel
        Left = 24
        Top = 19
        Width = 8
        Height = 13
        Caption = #1079
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 24
        Top = 45
        Width = 15
        Height = 13
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DogDateBeg: TcxDateEdit
        Left = 48
        Top = 16
        Width = 121
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
      object DogDateEnd: TcxDateEdit
        Left = 48
        Top = 40
        Width = 121
        Height = 21
        ParentFont = False
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
      end
    end
    object GroupBox8: TGroupBox
      Left = 0
      Top = 112
      Width = 417
      Height = 75
      Caption = #1047#1074#1110#1076#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      object Label36: TLabel
        Left = 321
        Top = 7
        Width = 36
        Height = 13
        Caption = #1052#1060#1054':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label37: TLabel
        Left = 7
        Top = 38
        Width = 66
        Height = 13
        Caption = #1056'/'#1088#1072#1093#1091#1085#1086#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 153
        Top = 37
        Width = 106
        Height = 13
        Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1073#1072#1085#1082#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxButtonEdit_name_un: TcxButtonEdit
        Left = 8
        Top = 18
        Width = 305
        Height = 21
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEdit_name_unPropertiesButtonClick
        Style.Color = clMoneyGreen
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
      object cxTextEdit_mfo_un: TcxTextEdit
        Left = 320
        Top = 18
        Width = 89
        Height = 21
        TabStop = False
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 1
      end
      object cxTextEdit_rsch_un: TcxTextEdit
        Left = 8
        Top = 50
        Width = 129
        Height = 21
        TabStop = False
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 2
      end
      object cxTextEdit_bank_un: TcxTextEdit
        Left = 152
        Top = 49
        Width = 257
        Height = 21
        TabStop = False
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 3
      end
    end
    object cxButtonEdit_otd: TcxButtonEdit
      Left = 240
      Top = 474
      Width = 361
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit_otdPropertiesButtonClick
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 13
    end
    object HistoryButton: TcxButton
      Left = 8
      Top = 469
      Width = 113
      Height = 25
      Caption = #1030#1089#1090#1086#1088#1110#1103' '#1079#1084#1110#1085#1080
      TabOrder = 14
      OnClick = HistoryButtonClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF837F7A837E778F8479B2A1908F
        7A668F7A66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF015202436B39EFD7BAB7ADA3FFF2
        E3C5B6A6FFE6CCFEE2C4FEDEBCD1B799B19A819F8A738F7A668F7A66FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF087314459359
        FFE6CBC5BBB0D3CBC2E2D3C2FFEAD3FFE6CBFEE2C4FEDEBCFEDAB5FED7ABFED3
        A4FECF9D8F7A668F7A668F7A668F7A66FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF035C071F8B3DFFE9D0C5BCB4C5C0BAFFF0E1FFEDD9FFE9D0FFE5C9FEE1C1
        FEDDBAFED9B1FED5AAFED1A1FECE9AFECB96FECB968F7A66FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF004B001C8135FFEDD9C5BFB7B7B4B0FFF3E7FFEFE088
        7E73554D44655A4EAD9882C0A68AFED8B0FED5A9FED1A1FECE9AFECB968F7A66
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B000E7D21C5BAADC5C0BBC5C2
        C1FFF7EEFFF3E7FFEFDDFFEBD5EAD4BDAD9C8788786665574954483A655442C0
        9E78FECC988F7A66FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00076E12
        C5BCB2C5C1BDC5C4C4FFFAF4FFF6ED665F5AADA196ADA79065935088A568C0C0
        8EFEDAB5FED7ACFED3A5EFC4978F7A66FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF004B00046009A5A99CC5C2BFB7B7B7FFFEFBFFFAF4EAE1D8ADA59A36652F
        006200006900005E00005500286B1C5483388F7A66FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF004B000152037E9D7DC5C2C1C5C5C5FFFFFFADACAAAD
        A9A49AA38C075B06008200008100008100008100008100007300006900005E00
        005500004B00004B00FF00FFFF00FFFF00FFFF00FF004E017D9A7DC5C4C4B7B7
        B7FFFFFFEAEAEAADACA928642602770602890501840100810000810000810000
        8100008100008100008100008100007300006C00005500004B00FF00FF004B00
        3E6C3FC5C5C5C5C5C5FFFFFFC1C1C1ADCCAC015D0407951205900D038B080187
        03008201008100008100008100008100008100008100008100007300004B0000
        4B00FF00FF004B00396C39C5C5C5C5C5C5FFFFFFADADAD0641060A901A0B9D1C
        09971506920F048E0A0289050184010081000081000081000081000081000076
        00004E00004B00FF00FFFF00FF004B002156219C9C9CE2E2E2FFFFFF88B68805
        6D0D11A92D0FA4260C9F1F0A9A1907951205900D038B08018703008201008100
        008100007E00004E00004B00FF00FFFF00FFFF00FF004B000844088F8F8FFFFF
        FFEAF2EA085B0A17AD3B16B03913AB3110A6290DA1230B9D1C09981606931004
        8E0A038906018402007E00005500004B00FF00FFFF00FFFF00FFFF00FF004B00
        084408828282FFFFFF669F660C811F1DBB4A1BB74418B23D15AD3512A92E0FA4
        260C9F1F0A9A1907961305910D038C09005901004B00FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF0249025D5D5DD5E6D50258051EBC4C1EBC4C1EBC4C1CBA48
        19B54116B03913AB3111A62A0EA1230C9D1C099816026504004B00FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF004B005D5D5D367E36149E341EBC4C1E
        BC4C1EBC4C1EBC4C1DBB4B1BB84518B23D15AF3512A92E0FA42705740D004B00
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B002844280552
        092651351EBC4C217E3E1EB1491EB1491EA5461EBC4C1CBA491AB64116B13A0A
        861B004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF01490110842626422C239645263F2F277A41226A392D3E331EA546282F
        2B1FB249139A2F004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF203920263626143F14173D17184A1D0D5F16
        2B392E0C811F21422718792D015202FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF323232FF00FF32
        3232FF00FF3232323232322D342D2D342D0C420CFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 433
      Top = 192
      Width = 160
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 15
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 136
    Top = 438
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheet: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 224
    Top = 574
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 256
    Top = 574
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 288
    Top = 574
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 224
    Top = 566
    qoStartTransaction = True
  end
  object Query: TpFIBQuery
    Database = Database
    Transaction = ReadTransaction
    Left = 352
    Top = 574
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 320
    Top = 574
    poSQLINT64ToBCD = True
  end
  object BarManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'PeriodBar'
        DockControl = PeriodDockControl
        DockedDockControl = PeriodDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddPeriodButton
            Visible = True
          end
          item
            Item = CloneButton
            Visible = True
          end
          item
            Item = EditPeriodButton
            Visible = True
          end
          item
            Item = DelPeriodButton
            Visible = True
          end>
        Name = 'PeriodBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'SmetBar'
        DockControl = SmetDockControl
        DockedDockControl = SmetDockControl
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = AddSmetButton
            Visible = True
          end
          item
            Item = DelSmetButton
            Visible = True
          end>
        Name = 'SmetBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsStandard
    UseF10ForMenu = False
    UseSystemFont = True
    Left = 344
    Top = 272
    DockControlHeights = (
      0
      0
      0
      0)
    object AddPeriodButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1087#1077#1088#1110#1086#1076
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076' (Ins)'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCECD0AEDD
        C19CD7B78FDBB88BE5BD89E9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F2E4D7E4D2C0004B0000
        4B00004B00A28C72C4A883DBB78AE5BD87EFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
        88F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFF004B00004B00004B0016
        AC2D004B00004B00004B00A89275D7B88FF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
        9AF6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFF004B00004B00004B002E
        D55A004B00004B00004B00E1C9AAEED3ADEBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFF004B0000
        4B00004B00E9E1D5E7D3C4B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      OnClick = AddPeriodButtonClick
    end
    object CloneButton: TdxBarButton
      Caption = #1050#1083#1086#1085#1091#1074#1072#1090#1080' '#1087#1077#1088#1110#1086#1076
      Category = 0
      Hint = #1050#1083#1086#1085#1091#1074#1072#1090#1080' '#1087#1077#1088#1110#1086#1076
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FF200377
        171368B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183FF00FF20037F2115C41C29A3202072F7E3C5F6DFBCF5DBB4F3
        D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FF200381A43EFB
        0220D52336B01F1F71F5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
        97F3D199B78183FF00FFFF00FF2003778A8CD0021FD32334AF1F1F71F5DFC3F3
        DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
        19186CA4B0F2021FD12334AF1F1F71F5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
        99F3D198B78183FF00FFFF00FFFF00FFCEB2AA202276A2ACEF021FD12334AC1F
        1F71F5DFC2F4DBBBF1D7B2F1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
        D3B7AFFFFFFD1F2175A2ACEE021FD02333AC1F1F71F5DFC2F4DBBAF2D7B1F0D4
        A9F5D5A3B78183FF00FFFF00FFFF00FFD7BBB2FFFFFFFEF9F51F2175A2ACEE02
        1FD02332AD1F1F71F5DEC2F4DBBAF2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
        DABEB3FFFFFFFFFEFDFDF8F41F2175A1ACEE0111A01F479F1F6FB9F6DEC1F4DB
        B9F8DDB4B78183FF00FFFF00FFFF00FFDEC1B5FFFFFFFFFFFFFFFEFDFEF9F41F
        21751F5EB000C5FE1F9BCE1F8DBEF7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
        E2C5B52091C5FFFFFF2091C5FFFEFDFDF9F41F94D81F9CD11FCAFA208FC1E6D9
        C4C6BCA9B78183FF00FFFF00FFFF00FFE5C7B72091C52091C52091C5FFFFFFFF
        FEFDFDF8F32090C31E8DC0C6A194B59489B08F81B78183FF00FFFF00FFFF00FF
        1D8ABC20C3FC00BDFF20BBF42091C5FFFFFFFFFEFCFFFEF9E3CFC9BF8C76E8B2
        70ECA54AC58768FF00FFFF00FF2071C51E8BBD2091C500ADEE2096CB2091C520
        91C5FFFFFFFFFFFFE4D4D2C89A7FFAC577CD9377FF00FFFF00FFFF00FFFF00FF
        EACAB62090C420B6EF1F90C4FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEC7977CCF9B
        86FF00FFFF00FFFF00FFFF00FFFF00FFE9C6B1EBCCB81D8ABCEBCCB8EBCBB8EA
        CBB8EACBB8EACCB9DABBB0B8857AFF00FFFF00FFFF00FFFF00FF}
      OnClick = CloneButtonClick
    end
    object DelPeriodButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1077#1088#1110#1086#1076
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1077#1088#1080#1086#1076' (Del)'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelPeriodButtonClick
    end
    object EditPeriodButton: TdxBarButton
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1087#1077#1088#1110#1086#1076
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080' '#1087#1077#1088#1110#1086#1076
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
      OnClick = EditPeriodButtonClick
    end
    object AddSmetButton: TdxBarButton
      Caption = #1044#1086#1076#1072#1090#1080' '#1082#1086#1096#1090#1086#1088#1080#1089
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1084#1077#1090#1091' (Ctrl+Ins)'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCECD0AEDD
        C19CD7B78FDBB88BE5BD89E9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F2E4D7E4D2C0004B0000
        4B00004B00A28C72C4A883DBB78AE5BD87EFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
        88F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFF004B00004B00004B0016
        AC2D004B00004B00004B00A89275D7B88FF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
        9AF6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFF004B00004B00004B002E
        D55A004B00004B00004B00E1C9AAEED3ADEBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFF004B0000
        4B00004B00E9E1D5E7D3C4B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      OnClick = AddSmetButtonClick
    end
    object DelSmetButton: TdxBarButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1082#1086#1096#1090#1086#1088#1080#1089
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1084#1077#1090#1091' (Del)'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001DE80010DC00006EFF00FFFF
        00FFFF00FFFF00FF00006E0004E20008E700006EFF00FFFF00FFFF00FFFF00FF
        00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
        DB00006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E001ADF0020EB0013DC00
        006E00006E0005E2000BEB0004DA00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E001BE300
        16EB0011EB000ADF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E062DE30430EB00
        20E2001EE20027EB0019DF00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
        6EFF00FFFF00FFFF00FFFF00FFFF00FF00006E1442E41645EB092ED900006EFF
        00FFFF00FF00006E0020D9012CEB001FE200006EFF00FFFF00FFFF00FFFF00FF
        00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
        E400006EFF00FFFF00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = DelSmetButtonClick
    end
    object EditSmetButton: TdxBarButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1084#1077#1090#1091
      Category = 0
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1084#1077#1090#1091
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFA46769A46769A46769A46769A46769A46769A46769A4
        6769A46769A46769A46769A46769A46769FF00FFFF00FFFF00FFA46769FCEACE
        F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
        69FF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6302D2D212527374546998468AD
        926FC2A074DCB27AE7BC7EEFC481A46769FF00FFFF00FFFF00FFA0675BFFF4E5
        F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
        69FF00FFFF00FFFF00FFA7756BFFFBF0F8EADCEEDDCA22576C165E82745D657D
        52545E3F39867258A78C66CEAA73A06567FF00FFFF00FFFF00FFA7756BFFFFFC
        FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
        5EFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F0E5D56B5D62E9A4A1CF
        9090B27575875353583C357A6950815354FF00FFFF00FFFF00FFBC8268FFFFFF
        FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
        4EFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFFFFEFCFEF7F0FAEFE5E1CEC087
        5958E1A1A1CC8E8EB07474865151633B3CFF00FFFF00FFFF00FFD1926DFFFFFF
        FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
        423E4145FF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFC
        F3E6CFB5AA976666EFAAA98C6D731E799F0C98BD0C98BDFF00FFDA9D75FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
        F0008EDE000F95000081E7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFDCC7C5A56B5FD1914F068FC10393DE0320BA0318B2010B99E7AB79FBF4F0
        FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
        BF2F45ED1031D3010A95E7AB79D1926DD1926DD1926DD1926DD1926DD1926DD1
        926DD1926DA56B5FFF00FFFF00FFFF00FF2732D00C19B4FF00FF}
    end
  end
  object ActionList: TActionList
    Left = 384
    Top = 576
    object Action1: TAction
      Caption = 'AddPeriod'
      ShortCut = 45
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'AddSmet'
      ShortCut = 16429
      OnExecute = Action2Execute
    end
    object Action3: TAction
      Caption = 'Exit'
      ShortCut = 27
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Caption = 'Del'
      ShortCut = 46
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 312
    Top = 272
    object cxStyle27: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle27
      Styles.Content = cxStyle31
      Styles.Inactive = cxStyle35
      Styles.Selection = cxStyle39
      Styles.BandBackground = cxStyle28
      Styles.BandHeader = cxStyle29
      Styles.ColumnHeader = cxStyle30
      Styles.ContentEven = cxStyle32
      Styles.ContentOdd = cxStyle33
      Styles.Footer = cxStyle34
      Styles.IncSearch = cxStyle36
      Styles.Indicator = cxStyle37
      Styles.Preview = cxStyle38
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle27
      Styles.Content = cxStyle31
      Styles.ContentEven = cxStyle32
      Styles.ContentOdd = cxStyle33
      Styles.Inactive = cxStyle35
      Styles.IncSearch = cxStyle36
      Styles.Selection = cxStyle39
      Styles.FilterBox = cxStyle30
      Styles.Footer = cxStyle34
      Styles.Group = cxStyle40
      Styles.GroupByBox = cxStyle30
      Styles.Header = cxStyle30
      Styles.Indicator = cxStyle37
      Styles.Preview = cxStyle38
      BuiltIn = True
    end
  end
  object pFIBStoredProc1: TpFIBStoredProc
    Database = Database
    SQL.Strings = (
      'INSERT INTO AKT_CREATE_TABLE (:ID_DOG,:NAME)')
    Transaction = WriteTransaction
    Left = 264
    Top = 440
  end
  object pFIBQuery1: TpFIBQuery
    Database = Database
    Transaction = ReadTransaction
    Left = 304
    Top = 440
  end
  object pFIBQuery2: TpFIBQuery
    Database = Database
    Transaction = ReadTransaction
    Left = 352
    Top = 16
  end
  object pFIBStoredProc2: TpFIBStoredProc
    Database = Database
    SQL.Strings = (
      'ARND_AKT_PRIZN_INS(:id_dog,:dog_type)')
    Transaction = pFIBTransaction1
    Left = 264
    Top = 408
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 304
    Top = 408
  end
  object ActionList1: TActionList
    Left = 560
    Top = 397
    object save: TAction
      Caption = 'save'
      ShortCut = 121
      OnExecute = saveExecute
    end
    object Cancel: TAction
      Caption = 'Cancel'
      ShortCut = 27
    end
  end
end
