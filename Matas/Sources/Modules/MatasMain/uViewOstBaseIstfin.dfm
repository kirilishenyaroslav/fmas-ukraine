object OstBaseIstfinForm: TOstBaseIstfinForm
  Left = 334
  Top = 237
  Width = 756
  Height = 470
  Caption = #1047#1072#1083#1080#1096#1082#1080' '#1079#1072' '#1076#1078#1077#1088#1077#1083#1072#1084#1080' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103' '#1087#1086' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1110#1111
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 70
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object LabelPeriod: TLabel
      Left = 8
      Top = 14
      Width = 45
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelSch: TLabel
      Left = 5
      Top = 46
      Width = 49
      Height = 13
      Caption = #1056#1072#1093#1091#1085#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 227
      Top = 14
      Width = 28
      Height = 13
      Caption = #1052#1042#1054
    end
    object lbl2: TLabel
      Left = 161
      Top = 46
      Width = 47
      Height = 13
      Caption = #1041#1102#1076#1078#1077#1090
    end
    object lbl3: TLabel
      Left = 288
      Top = 46
      Width = 85
      Height = 13
      Caption = #1056#1086#1079#1076#1110#1083'/'#1089#1090#1072#1090#1090#1103
    end
    object lbl4: TLabel
      Left = 455
      Top = 46
      Width = 33
      Height = 13
      Caption = #1050#1045#1050#1042
    end
    object cxMonth: TcxComboBox
      Left = 56
      Top = 11
      Width = 97
      Height = 21
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      Properties.Items.Strings = (
        #1103#1085#1074#1072#1088#1100
        #1092#1077#1074#1088#1072#1083#1100
        #1084#1072#1088#1090
        #1072#1087#1088#1077#1083#1100
        #1084#1072#1081
        #1080#1102#1085#1100
        #1080#1102#1083#1100
        #1072#1074#1075#1091#1089#1090
        #1089#1077#1085#1090#1103#1073#1088#1100
        #1086#1082#1090#1103#1073#1088#1100
        #1085#1086#1103#1073#1088#1100
        #1076#1077#1082#1072#1073#1088#1100)
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxYear: TcxSpinEdit
      Left = 160
      Top = 11
      Width = 57
      Height = 21
      ParentFont = False
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxLookupSch: TcxButtonEdit
      Left = 57
      Top = 42
      Width = 95
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxLookupSchPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyDown = cxLookupSchKeyDown
    end
    object cxMatOtv: TcxButtonEdit
      Left = 257
      Top = 10
      Width = 478
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyDown = cxMatOtvKeyDown
    end
    object cxSmeta: TcxButtonEdit
      Left = 211
      Top = 42
      Width = 72
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxSmetaPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 4
      OnKeyDown = cxSmetaKeyDown
    end
    object cxRz: TcxButtonEdit
      Left = 377
      Top = 42
      Width = 71
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxRzPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 5
      OnKeyDown = cxRzKeyDown
    end
    object cxKekv: TcxButtonEdit
      Left = 490
      Top = 41
      Width = 70
      Height = 21
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxKekvPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 6
      OnKeyDown = cxKekvKeyDown
    end
    object cxGroup: TcxCheckBox
      Left = 572
      Top = 42
      Width = 163
      Height = 21
      Properties.DisplayChecked = 'False'
      Properties.OnChange = cxGroupPropertiesChange
      Properties.Caption = #1055#1088#1080#1073#1088#1072#1090#1080' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103
      TabOrder = 7
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 111
    Width = 740
    Height = 321
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0.0000;-0.0000'
          Kind = skSum
          Position = spFooter
          FieldName = 'KOL_MAT'
          Column = cxGrid1DBTableView1KOL_MAT
        end
        item
          Format = '0.00;-0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'SUMMA'
          Column = cxGrid1DBTableView1SUMMA
        end
        item
          Position = spFooter
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00;-0.00'
          Kind = skSum
          FieldName = 'SUMMA'
          Column = cxGrid1DBTableView1SUMMA
        end
        item
          Format = '0.0000;-0.0000'
          Kind = skSum
          FieldName = 'KOL_MAT'
          Column = cxGrid1DBTableView1KOL_MAT
        end
        item
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Footer = cxStyle5
      Styles.Header = cxStyle5
      object cxGrid1DBTableView1BAL_SCH_NUMBER: TcxGridDBColumn
        Caption = #1041#1072#1083'. '#1088#1072#1093#1091#1085#1086#1082
        Visible = False
        DataBinding.FieldName = 'BAL_SCH_NUMBER'
      end
      object cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1085#1086#1082
        Visible = False
        GroupIndex = 0
        SortOrder = soAscending
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxGrid1DBTableView1NOMN: TcxGridDBColumn
        Caption = #1053#1086#1084'. '#8470
        Visible = False
        DataBinding.FieldName = 'NOMN'
      end
      object cxGrid1DBTableView1NAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        Width = 322
        DataBinding.FieldName = 'NAME'
      end
      object cxGrid1DBTableView1UNIT: TcxGridDBColumn
        Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091
        Width = 53
        DataBinding.FieldName = 'UNIT'
      end
      object cxGrid1DBTableView1FIO: TcxGridDBColumn
        Caption = #1055#1030#1041
        Visible = False
        DataBinding.FieldName = 'FIO'
      end
      object cxGrid1DBTableView1SFIO: TcxGridDBColumn
        Caption = #1052#1042#1054
        Visible = False
        GroupIndex = 1
        SortOrder = soAscending
        DataBinding.FieldName = 'SFIO'
      end
      object cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn
        Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Visible = False
        GroupIndex = 2
        SortOrder = soAscending
        DataBinding.FieldName = 'NAME_DEPARTMENT'
      end
      object cxGrid1DBTableView1SM_KOD: TcxGridDBColumn
        Caption = #1041#1102#1076#1078#1077#1090
        Width = 53
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxGrid1DBTableView1RZ_KOD: TcxGridDBColumn
        Caption = #1056#1086#1079#1076#1110#1083
        Width = 52
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxGrid1DBTableView1ST_KOD: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1090#1103
        Width = 52
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxGrid1DBTableView1KEKV_KOD: TcxGridDBColumn
        Caption = #1050#1045#1050#1042
        SortOrder = soAscending
        Width = 52
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxGrid1DBTableView1KOL_MAT: TcxGridDBColumn
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
        Width = 53
        DataBinding.FieldName = 'KOL_MAT'
      end
      object cxGrid1DBTableView1SUMMA: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Width = 52
        DataBinding.FieldName = 'SUMMA'
      end
      object cxgrdbclmnRASHOD_POS: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'RASHOD_POS'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 70
    Width = 740
    Height = 41
    Align = alTop
    TabOrder = 2
    object ApplyButton: TcxButton
      Left = 7
      Top = 7
      Width = 129
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = ApplyButtonClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0066001EB2311FB133006600FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6565659A9A9A9A9A9A65
        6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565ABABAB9E9E9E9797979C
        9C9C656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660047D36D3BCB5E25A83B0066001BA92E1DB132006600FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565BFBFBFB5B5B598989865656594
        9494999999656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
        4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF656565C4C4C4CACACAA5A5A5656565FF00FF65
        65658C8C8C989898656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        00660041C563006600FF00FFFF00FFFF00FFFF00FF00660019AA2B006600FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF656565B5B5B5656565FF00FFFF00FFFF
        00FFFF00FF656565939393656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF6565658A8A8A656565FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
        00006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF656565656565FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object PrintButton: TcxButton
      Left = 286
      Top = 7
      Width = 120
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = PrintButtonClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FF868484868484FF00FFFF00FF868484868484FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF868484BCBABAB5B3B386848486
        8484868484EBEAEA868484868484868484FF00FFFF00FFFF00FFFF00FFFF00FF
        868484E3E2E2B5B3B3B5B3B3B5B3B35150504F4F4F868787CDCDCDE8E9E9C7C6
        C6868484868484868484FF00FF868484DEDDDDD6D6D6A4A3A3A4A3A3A4A3A356
        5555161516121212181818121212939393CACACA868484FF00FF868484D6D6D6
        D6D6D6A4A3A3E0DEDED9D7D7CDCBCBC2C0C0B6B4B49F9D9D7976771212121414
        141313138684848F8C8C868484D6D6D6A4A3A3F3F2F2FFFEFEFCFBFBEAE7E8E6
        E6E6E6E5E5DAD9D9CCCBCBBFBDBDA2A0A07371719391918E8C8C868484A4A3A3
        FFFFFFFEFDFDFBFBFBDFDEDFADA7A9B4ADAEC3BDBED1CECFE0E0E0E1E1E1D4D3
        D3C7C6C6A7A5A5868383FF00FF868484868484F1F0F0C2B9BA93898BA19B9FAB
        A8AAABA6A7B1ACADAFA9AAB2ADAECAC9C9DCDCDCD0D0D0868484FF00FFFF00FF
        FF00FF868484CAA097BA9E87A2897E95817B897C7F928C92A5A2A4BBB6B7D7D6
        D6CFCFCF868484FF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFEAC4FFDDB3EE
        C399D5AE8CC9A786CC9A99989596868484868484FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFCC9A99FFE7C8FFDDBAFFDBB1FFD9A6FFD39FCC9A99FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9D9BFFEDDAFFE7CEFFE2C3FF
        DDB8FFDBAECC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFCC9A99FEF0E1FFECD8FFE6CCFFE1C2FEDDB7CC9A99FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99FFFFF5FFFFF5FFF0E1FFEBD6FF
        E8CCF6D4BACC9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        CC9A99CC9A99CC9A99FCF3E9FCEADAFCE5D0CC9A99FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCC9A99CC9A99CC
        9A99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
    object ExitButton: TcxButton
      Left = 605
      Top = 7
      Width = 128
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ExitButtonClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00009A174AFD103BF400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030
        FC00009AFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
        00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
        F300009AFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
        00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A1C47F61B4DFF143EF400009A00009A002DF80134FF032BF20000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
        6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
        A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
        A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
        ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
        ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
        6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        00009A4071FA4274FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204C
        F800009AFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
        00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
        00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
        FA00009AFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
        00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxButton1: TcxButton
      Left = 146
      Top = 7
      Width = 129
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1092#1110#1083#1100#1090#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = cxButton1Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002B90EF00278DE700FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF002A8FEC00278CED002489E4002388
        DD001E84D500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00298FD6003DA2EB003EA3F000379CEA002186
        DA001A81D100187ECA00157CC4001177BB00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF003CA2E10058BDF20060C4F9003D9EE50057BC
        F7003398DF001E83CD001076BC000B73B4000B72AF00086FAA00FF00FF00FF00
        FF00FF00FF00FF00FF00046B16004AB0F90053B7F7002F87D10063C7FB003D9E
        E5005BBFFB0055BAFA003499DE002D93D8000F76B300066DA700FF00FF00FF00
        FF00FF00FF00187D5F002B7A8300046B16002884DE003C99D900227BCE0040A0
        EA005ABEFE004FB2F50056B9FF0056B9FF0046AAF300FF00FF00FF00FF00FF00
        FF000F7D15003CBE610031C6480031C6480031C64800046B1600046B16002D87
        B6003998E80044A5F00052B6FF0052B5FF00FF00FF00FF00FF00FF00FF001587
        220031AF4A0062F9920050EB6F0031C648001DA746002398760031C6480031C6
        4800046B1600046B1600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0030AD
        48002BA641004FE7780037D053001AB42700029D0100009B000010A41E0032B9
        720046A7AC00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000A7510002AAE3F0022BC3200049A0600009400000CA11800027804000278
        0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00259E390042DC64000B9F110000770000027804000B871700FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001D91
        2C0044DE68000FA31500006F0000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0013831D0043D9
        640012AB1C0000730000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001C9A2A001AB1
        270000790000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0018A02400027F
        0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      UseSystemPaint = False
    end
  end
  object OstDatabase: TpFIBDatabase
    DBName = 'localhost:'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 30
    Top = 310
  end
  object DocOstDataSet: TpFIBDataSet
    Database = OstDatabase
    Transaction = ReadTransaction
    RefreshSQL.Strings = (
      'SELECT * '
      'FROM MAT_SEL_MO_OST_BASE(:ID_MO, :PERIOD, :PID_SESSION, :FLAG)'
      'WHERE ID_OST=:ID_OST')
    SelectSQL.Strings = (
      'SELECT * '
      'FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION, :ID_MO)'
      ''
      '')
    Left = 35
    Top = 270
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DocOstDataSetID_OST: TFIBBCDField
      FieldName = 'ID_OST'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetBAL_ID_SCH: TFIBIntegerField
      FieldName = 'BAL_ID_SCH'
    end
    object DocOstDataSetBAL_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DocOstDataSetBAL_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DocOstDataSetID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DocOstDataSetSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DocOstDataSetID_NOMN: TFIBBCDField
      FieldName = 'ID_NOMN'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetNOMN: TFIBStringField
      FieldName = 'NOMN'
      Size = 30
      EmptyStrToNull = True
    end
    object DocOstDataSetLINKTO: TFIBBCDField
      FieldName = 'LINKTO'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object DocOstDataSetID_UNIT: TFIBBCDField
      FieldName = 'ID_UNIT'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetUNIT: TFIBStringField
      FieldName = 'UNIT'
      OnGetText = DocOstDataSetUNITGetText
      Size = 10
      EmptyStrToNull = True
    end
    object DocOstDataSetID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 62
      EmptyStrToNull = True
    end
    object DocOstDataSetSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 50
      EmptyStrToNull = True
    end
    object DocOstDataSetNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object DocOstDataSetID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetSM_TITLE: TFIBStringField
      FieldName = 'SM_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DocOstDataSetSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
      OnGetText = DocOstDataSetSM_KODGetText
    end
    object DocOstDataSetID_RZ: TFIBBCDField
      FieldName = 'ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetRZ_TITLE: TFIBStringField
      FieldName = 'RZ_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DocOstDataSetRZ_KOD: TFIBIntegerField
      FieldName = 'RZ_KOD'
      OnGetText = DocOstDataSetRZ_KODGetText
    end
    object DocOstDataSetID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetST_TITLE: TFIBStringField
      FieldName = 'ST_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DocOstDataSetST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
      OnGetText = DocOstDataSetST_KODGetText
    end
    object DocOstDataSetID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetKEKV_TITLE: TFIBStringField
      FieldName = 'KEKV_TITLE'
      Size = 200
      EmptyStrToNull = True
    end
    object DocOstDataSetKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
      OnGetText = DocOstDataSetKEKV_KODGetText
    end
    object DocOstDataSetKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      OnGetText = DocOstDataSetKOL_MATGetText
      Size = 4
      RoundByScale = True
    end
    object DocOstDataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object DocOstDataSetID_FOND: TFIBBCDField
      FieldName = 'ID_FOND'
      Size = 0
      RoundByScale = True
    end
    object DocOstDataSetFOND_NUMBER: TFIBStringField
      FieldName = 'FOND_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object DocOstDataSetFOND_TITLE: TFIBStringField
      FieldName = 'FOND_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object DocOstDataSetRASHOD_POS: TFIBIntegerField
      FieldName = 'RASHOD_POS'
    end
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = OstDatabase
    TimeoutAction = TARollback
    Left = 75
    Top = 262
  end
  object StyleRepository: TcxStyleRepository
    Left = 158
    Top = 263
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
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
  object DataSource1: TDataSource
    DataSet = DocOstDataSet
    Left = 123
    Top = 262
  end
  object OstFormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'cxGrid1DBTableView1NAME.Width'
      'cxGrid1DBTableView1UNIT.Width'
      'cxGrid1DBTableView1KOL_MAT.Width'
      'cxGrid1DBTableView1SUMMA.Width')
    StoredValues = <
      item
        Name = 'FormWidth'
        Value = 0
      end
      item
        Name = 'FormHeight'
        Value = 0
      end>
    Left = 496
    Top = 208
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = OstDatabase
    TimeoutAction = TARollback
    Left = 75
    Top = 303
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.Reverse = True
    ReportOptions.CreateDate = 40224.567437060200000000
    ReportOptions.LastChange = 40241.638350509260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 246
    Top = 303
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
      end>
    Variables = <
      item
        Name = 'ORG_NAME'
        Value = #39#1044#1086#1085#1053#1059#1045#1058' '#39
      end
      item
        Name = 'ORG_SHORT_NAME'
        Value = Null
      end
      item
        Name = 'ORG_KOD_OKPO'
        Value = '01566057'
      end
      item
        Name = 'PERIOD'
        Value = #39#1083#1102#1090#1080#1081' 2010'#39
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
        Height = 166.299320000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 604.724800000000000000
          Top = 147.401670000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset
          DataSetName = 'frxDBDataset'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 94.488249999999990000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1082#1080' '#1058#1052#1062' '#1087#1086' '#1076#1078#1077#1088#1077#1083#1072#1084' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103' '#1085#1072' [PERIOD]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 4.000000000000000000
          Top = 3.779530000000001000
          Width = 380.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_NAME]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 92.000000000000000000
          Top = 19.779530000000000000
          Width = 156.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            '('#1087#1110#1076#1087#1088#1080#1108#1084#1089#1090#1074#1086', '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103')')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 47.559060000000000000
          Width = 96.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            #1050#1086#1076' '#1028#1044#1056#1055#1054#1059)
        end
        object Memo6: TfrxMemoView
          Left = 96.000000000000000000
          Top = 45.559060000000000000
          Width = 132.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[ORG_KOD_OKPO]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Top = 147.401670000000000000
          Width = 604.724702360000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1056#1072#1093#1091#1085#1086#1082)
          ParentFont = False
        end
      end
      object DBCross1: TfrxDBCrossView
        Left = 7.559060000000000000
        Top = 207.874150000000000000
        Width = 94.488249999999990000
        Height = 18.897650000000000000
        DownThenAcross = False
        CellFields.Strings = (
          'SUMMA')
        ColumnFields.Strings = (
          'SM_KOD')
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset'
        RowFields.Strings = (
          'RZ_KOD')
        Memos = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
          662D38223F3E3C63726F73733E3C63656C6C6D656D6F733E3C546672784D656D
          6F56696577204E616D653D2222204C6566743D2239312220546F703D22333222
          2057696474683D22363222204865696768743D2232322220416C6C6F77457870
          72657373696F6E733D2246616C73652220436F6C6F723D222D31363737373230
          3122204672616D652E5479703D2231352220476170583D22332220476170593D
          2233222048416C69676E3D226861526967687422204D656D6F2E546578743D22
          3022205374796C653D2263656C6C222056416C69676E3D22766143656E746572
          222F3E3C2F63656C6C6D656D6F733E3C636F6C756D6E6D656D6F733E3C546672
          784D656D6F56696577204E616D653D2222205461673D2231303022204C656674
          3D2239312220546F703D223130222057696474683D2236322220486569676874
          3D2232322220416C6C6F7745787072657373696F6E733D2246616C7365222043
          6F6C6F723D222D313637373732303122204672616D652E5479703D2231352220
          476170583D22332220476170593D2233222048416C69676E3D22686143656E74
          657222204D656D6F2E546578743D2222205374796C653D22636F6C756D6E2220
          56416C69676E3D22766143656E746572222F3E3C2F636F6C756D6E6D656D6F73
          3E3C636F6C756D6E746F74616C6D656D6F733E3C546672784D656D6F56696577
          204E616D653D2222205461673D2233303022204C6566743D223135332220546F
          703D223130222057696474683D22383122204865696768743D2232322220416C
          6C6F7745787072657373696F6E733D2246616C73652220436F6C6F723D222D31
          363737373230312220466F6E742E436861727365743D22312220466F6E742E43
          6F6C6F723D22302220466F6E742E4865696768743D222D31332220466F6E742E
          4E616D653D22417269616C2220466F6E742E5374796C653D223122204672616D
          652E5479703D2231352220476170583D22332220476170593D2233222048416C
          69676E3D22686143656E74657222204D656D6F2E546578743D224772616E6420
          546F74616C2220506172656E74466F6E743D2246616C736522205374796C653D
          22636F6C6772616E64222056416C69676E3D22766143656E746572222F3E3C2F
          636F6C756D6E746F74616C6D656D6F733E3C726F776D656D6F733E3C54667278
          4D656D6F56696577204E616D653D2222205461673D2232303022204C6566743D
          2231302220546F703D223332222057696474683D22383122204865696768743D
          2232322220416C6C6F7745787072657373696F6E733D2246616C73652220436F
          6C6F723D222D313637373732303122204672616D652E5479703D223135222047
          6170583D22332220476170593D2233222048416C69676E3D22686143656E7465
          7222204D656D6F2E546578743D2222205374796C653D22726F77222056416C69
          676E3D22766143656E746572222F3E3C2F726F776D656D6F733E3C726F77746F
          74616C6D656D6F733E3C546672784D656D6F56696577204E616D653D22222054
          61673D2234303022204C6566743D2231302220546F703D223534222057696474
          683D22383122204865696768743D2232322220416C6C6F774578707265737369
          6F6E733D2246616C73652220436F6C6F723D222D31363737373230312220466F
          6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F
          6E742E4865696768743D222D31332220466F6E742E4E616D653D22417269616C
          2220466F6E742E5374796C653D223122204672616D652E5479703D2231352220
          476170583D22332220476170593D2233222048416C69676E3D22686143656E74
          657222204D656D6F2E546578743D224772616E6420546F74616C222050617265
          6E74466F6E743D2246616C736522205374796C653D22726F776772616E642220
          56416C69676E3D22766143656E746572222F3E3C2F726F77746F74616C6D656D
          6F733E3C63656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C
          6C66756E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E
          3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974656D20302F3E3C
          2F726F77736F72743E3C2F63726F73733E}
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    DataSet = pFIBDataSetForReport
    Left = 287
    Top = 303
  end
  object pFIBDataSetForReport: TpFIBDataSet
    Database = OstDatabase
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT * '
      'FROM MAT_GET_OST_MAT_BY_ISTFIN(:PERIOD, :PID_SESSION)'
      'Order by SCH_NUMBER,FIO ')
    Left = 246
    Top = 340
    poSQLINT64ToBCD = True
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 328
    Top = 308
  end
  object TR: TpFIBTransaction
    DefaultDatabase = OstDatabase
    TimeoutAction = TARollback
    Left = 361
    Top = 221
  end
  object StPr: TpFIBStoredProc
    Database = OstDatabase
    Transaction = TR
    Left = 394
    Top = 224
  end
end
