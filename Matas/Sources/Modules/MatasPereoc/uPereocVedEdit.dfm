object VedPereocPosForm: TVedPereocPosForm
  Left = 284
  Top = 92
  Width = 882
  Height = 642
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 866
    Height = 417
    Align = alTop
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = dsSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMMA'
          Column = cxGrid1DBTableView1SUMMA
        end
        item
          Kind = skCount
          FieldName = 'ID_RECOST_PREP'
          Column = cxGrid1DBTableView1NAME
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.Background = cxStyle2
      Styles.Content = cxStyle2
      Styles.Footer = cxStyle1
      Styles.Header = cxStyle11
      object cxGrid1DBTableView1DB_SCH_NUMBER: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090
        Width = 77
        DataBinding.FieldName = 'DB_SCH_NUMBER'
      end
      object cxGrid1DBTableView1KR_SCH_NUMBER: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090
        Width = 76
        DataBinding.FieldName = 'KR_SCH_NUMBER'
      end
      object cxGrid1DBTableView1ID_RECOST_PREP: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_RECOST_PREP'
      end
      object cxGrid1DBTableView1ID_MO: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_MO'
      end
      object cxGrid1DBTableView1FIO: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'FIO'
      end
      object cxGrid1DBTableView1SFIO: TcxGridDBColumn
        Caption = #1052#1042#1054
        Width = 174
        DataBinding.FieldName = 'SFIO'
      end
      object cxGrid1DBTableView1NAME_DEPARTMENT: TcxGridDBColumn
        Visible = False
        Width = 215
        DataBinding.FieldName = 'NAME_DEPARTMENT'
      end
      object cxGrid1DBTableView1ID_NOMN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_NOMN'
      end
      object cxGrid1DBTableView1NOMN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NOMN'
      end
      object cxGrid1DBTableView1NAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        Width = 389
        DataBinding.FieldName = 'NAME'
      end
      object cxGrid1DBTableView1UNIT: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'UNIT'
      end
      object cxGrid1DBTableView1ID_SCH: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_SCH'
      end
      object cxGrid1DBTableView1SCH_NUMBER: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SCH_NUMBER'
      end
      object cxGrid1DBTableView1ID_OST: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_OST'
      end
      object cxGrid1DBTableView1ID_PROV: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_PROV'
      end
      object cxGrid1DBTableView1SUMMA_OLD: TcxGridDBColumn
        Visible = False
        Width = 32
        DataBinding.FieldName = 'SUMMA_OLD'
      end
      object cxGrid1DBTableView1SUMMA_NEW: TcxGridDBColumn
        Visible = False
        Width = 33
        DataBinding.FieldName = 'SUMMA_NEW'
      end
      object cxGrid1DBTableView1SUMMA: TcxGridDBColumn
        Caption = #1057#1091#1084#1072
        Width = 147
        DataBinding.FieldName = 'SUMMA'
      end
      object cxGrid1DBTableView1DB_ID_SCH: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DB_ID_SCH'
      end
      object cxGrid1DBTableView1KR_ID_SCH: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'KR_ID_SCH'
      end
      object cxGrid1DBTableView1ID_SM: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_SM'
      end
      object cxGrid1DBTableView1ID_RZ: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_RZ'
      end
      object cxGrid1DBTableView1ID_ST: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_ST'
      end
      object cxGrid1DBTableView1ID_KEKV: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_KEKV'
      end
      object cxGrid1DBTableView1SM_KOD: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SM_KOD'
      end
      object cxGrid1DBTableView1RZ_KOD: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'RZ_KOD'
      end
      object cxGrid1DBTableView1ST_KOD: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ST_KOD'
      end
      object cxGrid1DBTableView1KEKV_KOD: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'KEKV_KOD'
      end
      object cxGrid1DBTableView1ISTFIN_STR: TcxGridDBColumn
        Visible = False
        Width = 93
        DataBinding.FieldName = 'ISTFIN_STR'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 417
    Width = 866
    Height = 144
    Align = alTop
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lbl1: TLabel
      Left = 8
      Top = 21
      Width = 28
      Height = 13
      Caption = #1052#1042#1054
    end
    object lbl2: TLabel
      Left = 288
      Top = 21
      Width = 51
      Height = 13
      Caption = #1055#1110#1076#1086#1079#1076#1110#1083
    end
    object lbl3: TLabel
      Left = 8
      Top = 53
      Width = 38
      Height = 13
      Caption = #1053#1072#1079#1074#1072
    end
    object lbl4: TLabel
      Left = 672
      Top = 53
      Width = 60
      Height = 13
      Caption = #1054#1076'.'#1074#1080#1084#1110#1088#1091
    end
    object lbl5: TLabel
      Left = 8
      Top = 85
      Width = 49
      Height = 13
      Caption = #1057#1091#1084#1072' '#1076#1086
    end
    object lbl6: TLabel
      Left = 232
      Top = 85
      Width = 66
      Height = 13
      Caption = #1057#1091#1084#1072' '#1087#1110#1089#1083#1103
    end
    object lbl7: TLabel
      Left = 472
      Top = 85
      Width = 31
      Height = 13
      Caption = #1057#1091#1084#1072
    end
    object lbl8: TLabel
      Left = 8
      Top = 117
      Width = 85
      Height = 13
      Caption = #1060#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 40
      Top = 16
      Width = 233
      Height = 21
      DataBinding.DataField = 'FIO'
      DataBinding.DataSource = dsSource
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 344
      Top = 16
      Width = 505
      Height = 21
      DataBinding.DataField = 'NAME_DEPARTMENT'
      DataBinding.DataSource = dsSource
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object cxDBCurrencyEdit1: TcxDBCurrencyEdit
      Left = 64
      Top = 80
      Width = 150
      Height = 21
      DataBinding.DataField = 'SUMMA_OLD'
      DataBinding.DataSource = dsSource
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 2
    end
    object cxDBCurrencyEdit2: TcxDBCurrencyEdit
      Left = 304
      Top = 80
      Width = 150
      Height = 21
      DataBinding.DataField = 'SUMMA_NEW'
      DataBinding.DataSource = dsSource
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object cxDBCurrencyEdit3: TcxDBCurrencyEdit
      Left = 512
      Top = 80
      Width = 150
      Height = 21
      DataBinding.DataField = 'SUMMA'
      DataBinding.DataSource = dsSource
      Properties.DisplayFormat = ',0.00;-,0.00'
      Style.Color = clMoneyGreen
      TabOrder = 4
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 96
      Top = 112
      Width = 225
      Height = 21
      DataBinding.DataField = 'ISTFIN_STR'
      DataBinding.DataSource = dsSource
      Style.Color = clMoneyGreen
      TabOrder = 5
    end
    object cxDBTextEdit4: TcxDBTextEdit
      Left = 48
      Top = 48
      Width = 617
      Height = 21
      DataBinding.DataField = 'NAME'
      DataBinding.DataSource = dsSource
      Style.Color = clMoneyGreen
      TabOrder = 6
    end
    object cxDBTextEdit5: TcxDBTextEdit
      Left = 736
      Top = 48
      Width = 113
      Height = 21
      DataBinding.DataField = 'UNIT'
      DataBinding.DataSource = dsSource
      Style.Color = clMoneyGreen
      TabOrder = 7
    end
  end
  object OkButton: TcxButton
    Left = 600
    Top = 569
    Width = 120
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
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
  object CancelButton: TcxButton
    Left = 728
    Top = 569
    Width = 120
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
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
  object cxButtonAddProv: TcxButton
    Left = 8
    Top = 569
    Width = 193
    Height = 25
    Hint = 'Ins'
    Caption = #1047#1084#1110#1085#1080#1090#1080' '#1073#1102#1076#1078#1077#1090' '#1074#1089#1110#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = cxButtonAddProvClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
      8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
      F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
      83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
      A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
      F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
      83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
      6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
      FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
      79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
      A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
      FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
      69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
      7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
      FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
      5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
      F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
      F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
      FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
      CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
      A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
    UseSystemPaint = False
  end
  object dbRecost: TpFIBDatabase
    DBName = 'localhost:C:\FMAS-WIN\Database\FULL_DB.IB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    DefaultTransaction = trRead
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dbRecost
    TimeoutAction = TARollback
    Left = 8
    Top = 40
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbRecost
    TimeoutAction = TARollback
    Left = 8
    Top = 72
  end
  object dsPereocPos: TpFIBDataSet
    Database = dbRecost
    Transaction = trRead
    SelectSQL.Strings = (
      'SELECT * FROM MAT_TMP_RECOST_PREP_S(:ID_SESSION)'
      'ORDER BY SCH_NUMBER, SFIO, NAME_DEPARTMENT, NAME')
    Left = 8
    Top = 112
    poSQLINT64ToBCD = True
    object dsPereocPosID_RECOST_PREP: TFIBBCDField
      FieldName = 'ID_RECOST_PREP'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 62
      EmptyStrToNull = True
    end
    object dsPereocPosSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 50
      EmptyStrToNull = True
    end
    object dsPereocPosNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object dsPereocPosID_NOMN: TFIBBCDField
      FieldName = 'ID_NOMN'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosNOMN: TFIBStringField
      FieldName = 'NOMN'
      Size = 30
      EmptyStrToNull = True
    end
    object dsPereocPosNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object dsPereocPosUNIT: TFIBStringField
      FieldName = 'UNIT'
      Size = 10
      EmptyStrToNull = True
    end
    object dsPereocPosID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      EmptyStrToNull = True
    end
    object dsPereocPosID_OST: TFIBBCDField
      FieldName = 'ID_OST'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosID_PROV: TFIBBCDField
      FieldName = 'ID_PROV'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosSUMMA_OLD: TFIBBCDField
      FieldName = 'SUMMA_OLD'
      Size = 2
      RoundByScale = True
    end
    object dsPereocPosSUMMA_NEW: TFIBBCDField
      FieldName = 'SUMMA_NEW'
      Size = 2
      RoundByScale = True
    end
    object dsPereocPosSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object dsPereocPosDB_ID_SCH: TFIBBCDField
      FieldName = 'DB_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosDB_SCH_NUMBER: TFIBStringField
      FieldName = 'DB_SCH_NUMBER'
      EmptyStrToNull = True
    end
    object dsPereocPosKR_ID_SCH: TFIBBCDField
      FieldName = 'KR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosKR_SCH_NUMBER: TFIBStringField
      FieldName = 'KR_SCH_NUMBER'
      EmptyStrToNull = True
    end
    object dsPereocPosID_SM: TFIBBCDField
      FieldName = 'ID_SM'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosID_RZ: TFIBBCDField
      FieldName = 'ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosID_ST: TFIBBCDField
      FieldName = 'ID_ST'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosID_KEKV: TFIBBCDField
      FieldName = 'ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object dsPereocPosSM_KOD: TFIBIntegerField
      FieldName = 'SM_KOD'
    end
    object dsPereocPosRZ_KOD: TFIBIntegerField
      FieldName = 'RZ_KOD'
    end
    object dsPereocPosST_KOD: TFIBIntegerField
      FieldName = 'ST_KOD'
    end
    object dsPereocPosKEKV_KOD: TFIBIntegerField
      FieldName = 'KEKV_KOD'
    end
    object dsPereocPosISTFIN_STR: TFIBStringField
      FieldName = 'ISTFIN_STR'
      Size = 40
      EmptyStrToNull = True
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 144
    Top = 144
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Font.Color = clNavy
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
  object dsSource: TDataSource
    DataSet = dsPereocPos
    Left = 144
    Top = 40
  end
  object StoredProc: TpFIBStoredProc
    Database = dbRecost
    Transaction = trWrite
    Left = 96
    Top = 40
  end
  object dsPereocMO: TpFIBDataSet
    Database = dbRecost
    Transaction = trRead
    SelectSQL.Strings = (
      'SELECT DISTINCT ID_MO '
      'FROM MAT_TMP_RECOST_PREP_S(:ID_SESSION)')
    Left = 8
    Top = 152
    poSQLINT64ToBCD = True
  end
end
