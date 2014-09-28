object Fdt_contract_ADD: TFdt_contract_ADD
  Left = 445
  Top = 73
  Width = 793
  Height = 534
  Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1103' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1047#1062#1042
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 777
    Height = 429
    ActivePage = TabSheet4
    Align = alClient
    MultiLine = True
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1110' '#1076#1072#1085#1110
      object RSumLabel: TLabel
        Left = 144
        Top = 404
        Width = 85
        Height = 13
        Caption = #1042#1093#1110#1076#1085#1080#1081' '#1079#1072#1083#1080#1096#1086#1082
        Visible = False
      end
      object GroupBox1: TGroupBox
        Left = 464
        Top = 424
        Width = 241
        Height = 129
        Caption = #1057#1091#1084#1080
        TabOrder = 0
        Visible = False
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 29
          Height = 13
          Caption = #1057#1091#1084#1072':'
        end
        object Label3: TLabel
          Left = 16
          Top = 72
          Width = 56
          Height = 13
          Caption = #1057#1091#1084#1072' '#1055#1044#1042':'
        end
        object Label2: TLabel
          Left = 128
          Top = 24
          Width = 39
          Height = 13
          Caption = #1057#1087#1083#1072#1090#1072':'
        end
        object Label18: TLabel
          Left = 128
          Top = 72
          Width = 66
          Height = 13
          Caption = #1057#1087#1083#1072#1090#1072' '#1055#1044#1042':'
        end
        object SummaEdit: TcxTextEdit
          Left = 16
          Top = 40
          Width = 97
          Height = 21
          TabOrder = 0
          Text = '0'
        end
        object SummaPayEdit: TcxTextEdit
          Left = 128
          Top = 40
          Width = 97
          Height = 21
          TabOrder = 1
          Text = '0'
        end
        object SummaNdsEdit: TcxTextEdit
          Left = 16
          Top = 88
          Width = 97
          Height = 21
          TabOrder = 2
          Text = '0'
        end
        object SummaPayNdsEdit: TcxTextEdit
          Left = 128
          Top = 88
          Width = 97
          Height = 21
          TabOrder = 3
          Text = '0'
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 241
        Height = 265
        Caption = #1044#1086#1075#1086#1074#1110#1088
        TabOrder = 1
        object Label10: TLabel
          Left = 16
          Top = 136
          Width = 109
          Height = 13
          Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088
          Visible = False
        end
        object Label9: TLabel
          Left = 16
          Top = 88
          Width = 106
          Height = 13
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095#1077#1085#1085#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 15
          Top = 180
          Width = 36
          Height = 13
          Caption = #1042#1110#1076#1076#1110#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox2: TGroupBox
          Left = 16
          Top = 16
          Width = 209
          Height = 65
          Caption = #1058#1077#1088#1084#1110#1085' '#1076#1110#1111
          TabOrder = 0
          object Label7: TLabel
            Left = 8
            Top = 16
            Width = 9
            Height = 13
            Caption = #1047
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 104
            Top = 16
            Width = 17
            Height = 13
            Caption = #1055#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DateBegEdit: TcxDateEdit
            Left = 8
            Top = 32
            Width = 89
            Height = 21
            Style.Color = clMoneyGreen
            TabOrder = 0
          end
          object DateEndEdit: TcxDateEdit
            Left = 104
            Top = 32
            Width = 89
            Height = 21
            Style.Color = clMoneyGreen
            TabOrder = 1
          end
        end
        object RegNumberEdit: TcxTextEdit
          Left = 16
          Top = 152
          Width = 209
          Height = 21
          Style.Color = clMoneyGreen
          TabOrder = 1
          Visible = False
        end
        object DateConclusionEdit: TcxDateEdit
          Left = 16
          Top = 104
          Width = 113
          Height = 21
          Style.Color = clMoneyGreen
          TabOrder = 2
        end
        object cxButtonEdit_otd: TcxButtonEdit
          Left = 16
          Top = 196
          Width = 209
          Height = 21
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxButtonEdit_depPropertiesButtonClick
          Style.Color = clMoneyGreen
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          TabOrder = 3
        end
      end
      object SupplGroupBox: TGroupBox
        Left = 256
        Top = 144
        Width = 457
        Height = 129
        Caption = #1044#1072#1085#1110' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072
        TabOrder = 2
        object Label11: TLabel
          Left = 272
          Top = 24
          Width = 109
          Height = 13
          Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088
        end
        object Label21: TLabel
          Left = 200
          Top = 72
          Width = 104
          Height = 13
          Caption = #1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1072' '#1086#1089#1086#1073#1072
        end
        object Label14: TLabel
          Left = 16
          Top = 24
          Width = 58
          Height = 13
          Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 72
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
        object DepartmentEdit: TcxButtonEdit
          Left = 16
          Top = 40
          Width = 241
          Height = 21
          Enabled = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.HideCursor = True
          Properties.ReadOnly = True
          Properties.OnButtonClick = DepartmentEditButtonClick
          Style.Color = clMoneyGreen
          TabOrder = 0
        end
        object AccSupplEdit: TcxPopupEdit
          Left = 16
          Top = 88
          Width = 169
          Height = 21
          Properties.PopupControl = DBGrid1
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          TabOrder = 1
        end
        object MenSupplEdit: TcxButtonEdit
          Left = 200
          Top = 88
          Width = 241
          Height = 21
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.HideCursor = True
          Properties.ReadOnly = True
          Properties.OnButtonClick = MenSupplEditButtonClick
          Style.Color = clMoneyGreen
          TabOrder = 2
        end
        object RegNumberSupplEdit: TcxTextEdit
          Left = 272
          Top = 40
          Width = 169
          Height = 21
          Style.Color = clMoneyGreen
          TabOrder = 3
        end
        object DBGrid1: TcxGrid
          Left = 16
          Top = 112
          Width = 250
          Height = 200
          TabOrder = 4
          Visible = False
          LookAndFeel.Kind = lfFlat
          object cxGridDBTableView1: TcxGridDBTableView
            DataController.DataSource = SupplDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnCellClick = cxGridDBTableView1CellClick
            Filtering.CustomizeDialog = False
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            object cxGridDBColumn1: TcxGridDBColumn
              Visible = False
              HeaderAlignmentHorz = taCenter
              DataBinding.FieldName = 'ID_RATE_ACCOUNT'
            end
            object cxGridDBColumn2: TcxGridDBColumn
              Caption = #1052#1060#1054
              HeaderAlignmentHorz = taCenter
              Width = 94
              DataBinding.FieldName = 'MFO'
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = #1056#1072#1093#1091#1085#1086#1082
              HeaderAlignmentHorz = taCenter
              Width = 154
              DataBinding.FieldName = 'RATE_ACCOUNT'
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
      object CustGroupBox: TGroupBox
        Left = 256
        Top = 8
        Width = 457
        Height = 129
        Caption = #1044#1072#1085#1110' '#1089#1087#1086#1078#1080#1074#1072#1095#1072
        TabOrder = 3
        object Label12: TLabel
          Left = 272
          Top = 24
          Width = 109
          Height = 13
          Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1081#1085#1080#1081' '#1085#1086#1084#1077#1088
        end
        object Label6: TLabel
          Left = 16
          Top = 24
          Width = 59
          Height = 13
          Caption = #1057#1087#1086#1078#1080#1074#1072#1095
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 200
          Top = 72
          Width = 104
          Height = 13
          Caption = #1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1072' '#1086#1089#1086#1073#1072
        end
        object Label5: TLabel
          Left = 16
          Top = 72
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
        object CustomerEdit: TcxButtonEdit
          Left = 16
          Top = 40
          Width = 241
          Height = 21
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.HideCursor = True
          Properties.ReadOnly = True
          Properties.OnButtonClick = CustomerEditButtonClick
          Style.Color = clMoneyGreen
          TabOrder = 0
        end
        object AccCustEdit: TcxPopupEdit
          Left = 16
          Top = 88
          Width = 169
          Height = 21
          Properties.PopupControl = DBGrid2
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          TabOrder = 1
        end
        object MenCustEdit: TcxPopupEdit
          Left = 200
          Top = 88
          Width = 241
          Height = 21
          Properties.PopupControl = DBGrid3
          Properties.ReadOnly = True
          Style.Color = clMoneyGreen
          TabOrder = 2
        end
        object RegNumberCustEdit: TcxTextEdit
          Left = 272
          Top = 40
          Width = 169
          Height = 21
          Style.Color = clMoneyGreen
          TabOrder = 3
        end
        object DBGrid2: TcxGrid
          Left = 16
          Top = 112
          Width = 250
          Height = 200
          TabOrder = 4
          Visible = False
          LookAndFeel.Kind = lfFlat
          object DBGrid2DBTableView1: TcxGridDBTableView
            DataController.DataSource = CustDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnCellClick = DBGrid2DBTableView1CellClick
            Filtering.CustomizeDialog = False
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            Styles.StyleSheet = GridTableViewStyleSheetDevExpress
            object DBGrid2DBTableView1DBColumn1: TcxGridDBColumn
              Visible = False
              HeaderAlignmentHorz = taCenter
              DataBinding.FieldName = 'ID_RATE_ACCOUNT'
            end
            object DBGrid2DBTableView1DBColumn2: TcxGridDBColumn
              Caption = #1052#1060#1054
              HeaderAlignmentHorz = taCenter
              Width = 101
              DataBinding.FieldName = 'MFO'
            end
            object DBGrid2DBTableView1DBColumn3: TcxGridDBColumn
              Caption = #1056#1072#1093#1091#1085#1086#1082
              HeaderAlignmentHorz = taCenter
              Width = 147
              DataBinding.FieldName = 'RATE_ACCOUNT'
            end
          end
          object DBGrid2Level1: TcxGridLevel
            GridView = DBGrid2DBTableView1
          end
        end
      end
      object RSumEdit: TcxTextEdit
        Left = 144
        Top = 424
        Width = 169
        Height = 21
        Properties.ReadOnly = True
        TabOrder = 4
        Visible = False
      end
      object DBGrid3: TcxGrid
        Left = 320
        Top = 336
        Width = 385
        Height = 113
        TabOrder = 5
        Visible = False
        LookAndFeel.Kind = lfFlat
        object DBGrid3DBTableView1: TcxGridDBTableView
          DataController.DataSource = CustMenDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCellClick = DBGrid3DBTableView1CellClick
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object DBGrid3DBTableView1DBColumn1: TcxGridDBColumn
            Visible = False
            DataBinding.FieldName = 'ID_CUST_MEN'
          end
          object DBGrid3DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #1055#1086#1089#1072#1076#1072
            HeaderAlignmentHorz = taCenter
            Width = 124
            DataBinding.FieldName = 'NAME_TYPE_MEN'
          end
          object DBGrid3DBTableView1DBColumn3: TcxGridDBColumn
            Caption = #1055#1030#1041
            HeaderAlignmentHorz = taCenter
            Width = 259
            DataBinding.FieldName = 'FIO'
          end
        end
        object DBGrid3Level1: TcxGridLevel
          GridView = DBGrid3DBTableView1
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1055#1077#1088#1110#1086#1076#1080' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103' '#1110' '#1074#1080#1082#1086#1085#1072#1085#1085#1103
      ImageIndex = 3
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 177
        Height = 401
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 177
          Height = 401
          Align = alClient
          Caption = #1055#1077#1088#1110#1086#1076#1080' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
          TabOrder = 0
          object cxGrid2: TcxGrid
            Left = 2
            Top = 41
            Width = 173
            Height = 358
            Align = alClient
            DragOpeningWaitTime = 0
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGridTableView1: TcxGridTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OnFocusedRecordChanged = cxGridTableView1FocusedRecordChanged
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsSelection.HideFocusRect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.HeaderAutoHeight = True
              Styles.StyleSheet = GridTableViewStyleSheetDevExpress
              object cxGridColumn1: TcxGridColumn
                Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.SaveTime = False
                Properties.ShowTime = False
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                SortOrder = soAscending
                Width = 80
              end
              object cxGridColumn2: TcxGridColumn
                Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.SaveTime = False
                Properties.ShowTime = False
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                SortOrder = soAscending
                Width = 91
              end
              object cxGridColumn4: TcxGridColumn
                Caption = 'ID_STAGE'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Visible = False
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 43
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGridTableView1
            end
          end
          object Panel2: TPanel
            Left = 2
            Top = 15
            Width = 173
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object AddButtonPeriods: TSpeedButton
              Left = 98
              Top = 2
              Width = 23
              Height = 22
              Hint = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102' '#1076#1083#1103' '#1074#1089#1110#1093' '#1087#1077#1088#1110#1086#1076#1110#1074
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
                69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
                B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
                80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
                7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
                D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                B7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7B78FDBB88BE5BD89E9BD82E9BD
                7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0D7D7D7C7
                C7C7BDBDBDBFBFBFC4C4C4C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
                81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4CFCFCFAA
                AAAA969696A3A3A3BEBEBEC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
                C09E95FFFBF0F2E4D7E4D2C0004B00004B00004B00A28C72C4A883DBB78AE5BD
                87EFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9E9E9E9D8D8D881818181
                8181818181919191ADADADBEBEBEC3C3C3C7C7C79C9C9CFF00FFFF00FFFF00FF
                C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
                88F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEE1E1E1B9B9B9818181A9
                A9A9818181898989919191A2A2A2BDBDBDCCCCCC9C9C9CFF00FFFF00FFFF00FF
                CBA99EFFFFFF004B00004B00004B0016AC2D004B00004B00004B00A89275D7B8
                8FF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181818181818181B4
                B4B4818181818181818181979797BDBDBDD1D1D19C9C9CFF00FFFF00FFFF00FF
                CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
                9AF6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181D0D0D0CBCBCBC2
                C2C2B9B9B9B0B0B0818181AAAAAAC6C6C6D6D6D69C9C9CFF00FFFF00FFFF00FF
                D4B0A1FFFFFF004B00004B00004B002ED55A004B00004B00004B00E1C9AAEED3
                ADEBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFF818181818181818181CE
                CECE818181818181818181CECECED7D7D7D3D3D39C9C9CFF00FFFF00FFFF00FF
                D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
                B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFF818181D3
                D3D3818181B9B9B9D9D9D9EAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
                DDB7A4FFFFFFFFFFFFFFFFFF004B00004B00004B00E9E1D5E7D3C4B68A7BA17B
                6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFF81818181
                8181818181E2E2E2DEDEDE9999999999999999999C9C9CFF00FFFF00FFFF00FF
                E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
                55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
                E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
                5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
                6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
                F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
                E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = AddButtonPeriodsClick
            end
            object MakeStagesButton: TSpeedButton
              Left = 74
              Top = 2
              Width = 23
              Height = 22
              Hint = #1057#1090#1074#1086#1088#1080#1090#1080' '#1087#1077#1088#1110#1086#1076#1080
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                92635DA46769A46769A46769A46769A46769A46769A46769A46769A46769A467
                69A46769FF00FFFF00FFFF00FFFF00FF7C7C7C88888888888888888888888888
                8888888888888888888888888888888888888888FF00FFFF00FFFF00FFFF00FF
                92635DFCF3DEFFEED5FFEED5FFEED5FFEED5FEEBD1FEEBD1FEEBD1FEEBD1F7ED
                D0A46769FF00FFFF00FFFF00FFFF00FF7C7C7CDDDDDDDBDBDBDBDBDBDBDBDBDB
                DBDBD9D9D9D9D9D9D9D9D9D9D9D9D6D6D6888888FF00FFFF00FFFF00FFFF00FF
                92635DF7EAD8FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82F2E2
                C7A46769FF00FFFF00FFFF00FFFF00FF7C7C7CD9D9D9B8B8B8B8B8B8B8B8B8B8
                B8B8B8B8B8B8B8B8B8B8B8B8B8B8D0D0D0888888FF00FFFF00FFFF00FFFF00FF
                92635DF8EFDEFAE9D5FAE7D4FAE7D3F8E6D1F8E6D0F8E6D0F8E6D0F8E6D0F0E2
                C9A46769FF00FFFF00FFFF00FFFF00FF7C7C7CDCDCDCD9D9D9D8D8D8D8D8D8D7
                D7D7D6D6D6D6D6D6D6D6D6D6D6D6D0D0D0888888FF00FFFF00FFFF00FFFF00FF
                92635DEAE2D4FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82E1D3
                BAA46769FF00FFFF00FFFF00FFFF00FF7C7C7CD2D2D2B8B8B8B8B8B8B8B8B8B8
                B8B8B8B8B8B8B8B8B8B8B8B8B8B8C4C4C4888888FF00FFFF00FFFF00FFFF00FF
                987468AA9F95A69A92A59991A5998EA4978BA39689A19587A19384A19183A493
                81986B65FF00FFFF00FFFF00FFFF00FF8383839F9F9F9C9C9C9B9B9B9A9A9A98
                9898979797959595949494949494949494828282FF00FFFF00FF8C38168C3816
                8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
                168C38168C38168C381683838383838383838383838383838383838383838383
                83838383838383838383838383838383838383838383838383838C3816FF00FF
                A77568E0E9EAE17545E17545E17545E17545E17545E17545E17545E17545D7D8
                CAA46769FF00FF8B3512838383FF00FF8A8A8AD7D7D790909090909090909090
                9090909090909090909090909090C7C7C7888888FF00FF8080808C38158C3816
                8C38168C38168C38168C38168C38168C38168C38168C38168C38168C38168C38
                168C38168C38168C381683838383838383838383838383838383838383838383
                8383838383838383838383838383838383838383838383838383FF00FFFF00FF
                B17E6BD7B09CD1AF9ED1AF9ECEAA97CCA995CCA793CBA591CAA590CAA38BD4A7
                8CA46769FF00FFFF00FFFF00FFFF00FF8F8F8FB4B4B4B3B3B3B3B3B3AEAEAEAD
                ADADACACACABABABAAAAAAA8A8A8ACACAC888888FF00FFFF00FFFF00FFFF00FF
                BB846EFFFFFFFFE3C1FFE2C0FFE2BFFFE2BFFFE2BFFFE2BFFFE2BFFFE2BFFFFC
                EFA46769FF00FFFF00FFFF00FFFF00FF959595EBEBEBD3D3D3D2D2D2D2D2D2D2
                D2D2D2D2D2D2D2D2D2D2D2D2D2D2E5E5E5888888FF00FFFF00FFFF00FFFF00FF
                C58C70FFFFFFFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FBF6
                E9A46769FF00FFFF00FFFF00FFFF00FF9A9A9AEBEBEBB8B8B8B8B8B8B8B8B8B8
                B8B8B8B8B8B8B8B8B8B8B8B8B8B8E1E1E1888888FF00FFFF00FFFF00FFFF00FF
                CB9173FFFFFFFEFFFFFEFFFFFEFEFEFEFBFAFBFAF7FBF8F6FAF7F3F8F4F0FCFA
                F0A46769FF00FFFF00FFFF00FFFF00FF9D9D9DEBEBEBEAEAEAEAEAEAEAEAEAE8
                E8E8E6E6E6E6E6E6E4E4E4E3E3E3E4E4E4888888FF00FFFF00FFFF00FFFF00FF
                D49876FFFFFFFEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FEBD82FFFC
                F4A46769FF00FFFF00FFFF00FFFF00FFA2A2A2EBEBEBB8B8B8B8B8B8B8B8B8B8
                B8B8B8B8B8B8B8B8B8B8B8B8B8B8E7E7E7888888FF00FFFF00FFFF00FFFF00FF
                D49876FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFAFFFF
                FFA46769FF00FFFF00FFFF00FFFF00FFA2A2A2EBEBEBEBEBEBEBEBEBEBEBEBEB
                EBEBEBEBEBEBEBEBEAEAEAE9E9E9EBEBEB888888FF00FFFF00FFFF00FFFF00FF
                D49876CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E
                68A46769FF00FFFF00FFFF00FFFF00FFA2A2A29A9A9A9A9A9A9A9A9A9A9A9A9A
                9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A888888FF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = MakeStagesButtonClick
            end
            object DelButton1: TSpeedButton
              Left = 50
              Top = 2
              Width = 23
              Height = 22
              Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                00006E001DE80010DC00006EFF00FFFF00FFFF00FFFF00FF00006E0004E20008
                E700006EFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
                00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
                00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
                DB00006EFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
                00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E001ADF0020EB0013DC00006E00006E0005E2000BEB0004DA0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
                6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
                A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00006E001BE30016EB0011EB000ADF00006EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
                A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
                ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF00006E062DE30430EB0020E2001EE20027EB0019DF00006EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
                ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
                6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                00006E1442E41645EB092ED900006EFF00FFFF00FF00006E0020D9012CEB001F
                E200006EFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
                00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
                00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
                E400006EFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
                00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = DelButton1Click
            end
            object EditButton1: TSpeedButton
              Left = 26
              Top = 2
              Width = 23
              Height = 22
              Hint = #1047#1084#1110#1085#1080#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA46769A46769
                A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
                69FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FFA46769FCEACE
                F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
                69FF00FFFF00FFFF00FF9C9C9CEBEBEBDEDEDECCCCCCB8B8B8B2B2B2BABABABE
                BEBEBFBFBFC1C1C1C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFEEFDA
                F6E0C6302D2D212527374546998468AD926FC2A074DCB27AE7BC7EEFC481A467
                69FF00FFFF00FFFF00FF959595F0F0F0E5E5E5656565585858777777989898A4
                A4A4AEAEAEBBBBBBC1C1C1C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFFF4E5
                F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
                69FF00FFFF00FFFF00FF959595F5F5F5E9E9E9A4A4A46A6A6A7676766161617E
                7E7E909090A5A5A5B4B4B4C1C1C19C9C9CFF00FFFF00FFFF00FFA7756BFFFBF0
                F8EADCEEDDCA22576C165E82745D657D52545E3F39867258A78C66CEAA73A065
                67FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE4E4E47D7D7D7F7F7F82828281
                81816666668888889D9D9DB2B2B2999999FF00FFFF00FFFF00FFA7756BFFFFFC
                FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
                5EFF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEACACAC949494C4C4C4AD
                ADAD8B8B8B6363638080809393938F8F8FFF00FFFF00FFFF00FFBC8268FFFFFF
                FEF7F2FAEFE6F0E5D56B5D62E9A4A1CF9090B27575875353583C357A69508153
                54FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3E9E9E97E7E7ED1D1D1C0
                C0C0A8A8A88686866161617F7F7F838383FF00FFFF00FFFF00FFBC8268FFFFFF
                FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
                4EFF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3E4E4E48D8D8DCF
                CFCFBFBFBFA9A9A98585856464647B7B7BFF00FFFF00FFFF00FFD1926DFFFFFF
                FFFFFFFFFEFCFEF7F0FAEFE5E1CEC0875958E1A1A1CC8E8EB07474865151633B
                3CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3F3F3DBDBDB88
                8888CECECEBEBEBEA7A7A7848484696969FF00FFFF00FFFF00FFD1926DFFFFFF
                FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
                423E4145FF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3D2
                D2D28B8B8BD2D2D2BCBCBCAAAAAA7979795C5C5CFF00FFFF00FFDA9D75FFFFFF
                FFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6CFB5AA976666EFAAA98C6D731E79
                9F0C98BD0C98BDFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F4
                F4F4CBCBCB969696D7D7D7959595919191909090909090FF00FFDA9D75FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
                F0008EDE000F95000081B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFC
                FCFCD6D6D68D8D8D9292929E9E9E9F9F9F9191917474746A6A6AE7AB79FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FD1914F068FC10393
                DE0320BA0318B2010B99BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFDBDBDB999999A3A3A38D8D8D928F92878787848484767676E7AB79FBF4F0
                FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
                BF2F45ED1031D3010A95BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6
                F6F6D7D7D7999999AAAAAAFF00FF888888BABABA9C9C9C757575E7AB79D1926D
                D1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00
                FF2732D00C19B4FF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1
                B1B1B1B1B1999999FF00FFFF00FFFF00FFAAAAAA8C8C8CFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = EditButton1Click
            end
            object AddButton1: TSpeedButton
              Left = 2
              Top = 2
              Width = 23
              Height = 22
              Hint = #1044#1086#1076#1072#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
                69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
                B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
                80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
                7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
                D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                B7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7B78FDBB88BE5BD89E9BD82E9BD
                7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0D7D7D7C7
                C7C7BDBDBDBFBFBFC4C4C4C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
                81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4CFCFCFAA
                AAAA969696A3A3A3BEBEBEC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
                C09E95FFFBF0F2E4D7E4D2C0004B00004B00004B00A28C72C4A883DBB78AE5BD
                87EFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9E9E9E9D8D8D881818181
                8181818181919191ADADADBEBEBEC3C3C3C7C7C79C9C9CFF00FFFF00FFFF00FF
                C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
                88F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEE1E1E1B9B9B9818181A9
                A9A9818181898989919191A2A2A2BDBDBDCCCCCC9C9C9CFF00FFFF00FFFF00FF
                CBA99EFFFFFF004B00004B00004B0016AC2D004B00004B00004B00A89275D7B8
                8FF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181818181818181B4
                B4B4818181818181818181979797BDBDBDD1D1D19C9C9CFF00FFFF00FFFF00FF
                CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
                9AF6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181D0D0D0CBCBCBC2
                C2C2B9B9B9B0B0B0818181AAAAAAC6C6C6D6D6D69C9C9CFF00FFFF00FFFF00FF
                D4B0A1FFFFFF004B00004B00004B002ED55A004B00004B00004B00E1C9AAEED3
                ADEBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFF818181818181818181CE
                CECE818181818181818181CECECED7D7D7D3D3D39C9C9CFF00FFFF00FFFF00FF
                D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
                B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFF818181D3
                D3D3818181B9B9B9D9D9D9EAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
                DDB7A4FFFFFFFFFFFFFFFFFF004B00004B00004B00E9E1D5E7D3C4B68A7BA17B
                6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFF81818181
                8181818181E2E2E2DEDEDE9999999999999999999C9C9CFF00FFFF00FFFF00FF
                E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
                55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
                E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
                5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
                6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
                F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
                E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = AddButton1Click
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 177
        Top = 0
        Width = 592
        Height = 401
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox6: TGroupBox
          Left = 0
          Top = 0
          Width = 592
          Height = 197
          Align = alClient
          Caption = #1055#1088#1086#1076#1091#1082#1094#1110#1103
          TabOrder = 0
          object cxGrid3: TcxGrid
            Left = 2
            Top = 41
            Width = 588
            Height = 154
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGridTableView3: TcxGridTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OnCellClick = cxGridTableView3CellClick
              OnCustomDrawCell = cxGridTableView3CustomDrawCell
              OptionsCustomize.ColumnFiltering = False
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnSorting = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsSelection.HideFocusRect = False
              OptionsView.GroupByBox = False
              OptionsView.HeaderAutoHeight = True
              Styles.StyleSheet = GridTableViewStyleSheetDevExpress
              object cxGridTableView3Column14: TcxGridColumn
                Caption = 'id_object'
                Visible = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                HeaderGlyphAlignmentHorz = taCenter
              end
              object cxGridTableView3Column15: TcxGridColumn
                Caption = #1054#1073#39#1108#1082#1090
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 143
              end
              object cxGridTableView3Column5: TcxGridColumn
                Caption = #1055#1088#1086#1076#1091#1082#1094#1110#1103
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 135
              end
              object cxGridTableView3Column9: TcxGridColumn
                Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 125
              end
              object cxGridTableView3Column1: TcxGridColumn
                Caption = #1058#1072#1088#1080#1092
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 60
              end
              object cxGridTableView3Column4: TcxGridColumn
                Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 80
              end
              object cxGridTableView3Column16: TcxGridColumn
                Caption = 'id_unit_meas'
                Visible = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
              end
              object cxGridTableView3Column17: TcxGridColumn
                Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 46
              end
              object cxGridTableView3Column2: TcxGridColumn
                Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1073#1077#1079' '#1055#1044#1042
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 86
              end
              object cxGridTableView3Column3: TcxGridColumn
                Caption = #1055#1044#1042
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 77
              end
              object cxGridTableView3Column18: TcxGridColumn
                Caption = 'id_unit_meas_sum'
                Visible = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
              end
              object cxGridTableView3Column19: TcxGridColumn
                Caption = #1054#1076'. '#1074#1080#1084#1110#1088#1091
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 48
              end
              object cxGridTableView3Column6: TcxGridColumn
                Caption = #1055#1083#1072#1085#1086#1074#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 65
              end
              object cxGridTableView3Column7: TcxGridColumn
                Caption = #1057#1087#1083#1072#1095#1077#1085#1080#1081' '#1086#1073'.'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                Visible = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
              end
              object cxGridTableView3Column8: TcxGridColumn
                Caption = #1055#1086#1089#1090#1072#1074#1083#1077#1085#1080#1081' '#1086#1073'.'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                Visible = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
              end
              object cxGridTableView3Column11: TcxGridColumn
                Caption = 'ID_PRODUCT'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                Visible = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
              end
              object cxGridTableView3Column12: TcxGridColumn
                Caption = 'ID_CAT_CUST'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                Visible = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
              end
              object cxGridTableView3Column10: TcxGridColumn
                Caption = #1055#1083#1072#1085#1086#1074#1072' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1073#1077#1079' '#1055#1044#1042
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 94
              end
              object cxGridTableView3Column13: TcxGridColumn
                Caption = #1055#1044#1042
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                Properties.MaxLength = 0
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 89
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = cxGridTableView3
            end
          end
          object Panel5: TPanel
            Left = 2
            Top = 15
            Width = 588
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object DelButton2: TSpeedButton
              Left = 50
              Top = 2
              Width = 23
              Height = 22
              Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                00006E001DE80010DC00006EFF00FFFF00FFFF00FFFF00FF00006E0004E20008
                E700006EFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
                00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
                00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
                DB00006EFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
                00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E001ADF0020EB0013DC00006E00006E0005E2000BEB0004DA0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
                6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
                A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00006E001BE30016EB0011EB000ADF00006EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
                A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
                ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF00006E062DE30430EB0020E2001EE20027EB0019DF00006EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
                ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
                6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                00006E1442E41645EB092ED900006EFF00FFFF00FF00006E0020D9012CEB001F
                E200006EFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
                00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
                00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
                E400006EFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
                00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = DelButton2Click
            end
            object EditButton2: TSpeedButton
              Left = 26
              Top = 2
              Width = 23
              Height = 22
              Hint = #1047#1084#1110#1085#1080#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102
              Enabled = False
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA46769A46769
                A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
                69FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FFA46769FCEACE
                F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
                69FF00FFFF00FFFF00FF9C9C9CEBEBEBDEDEDECCCCCCB8B8B8B2B2B2BABABABE
                BEBEBFBFBFC1C1C1C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFEEFDA
                F6E0C6302D2D212527374546998468AD926FC2A074DCB27AE7BC7EEFC481A467
                69FF00FFFF00FFFF00FF959595F0F0F0E5E5E5656565585858777777989898A4
                A4A4AEAEAEBBBBBBC1C1C1C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFFF4E5
                F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
                69FF00FFFF00FFFF00FF959595F5F5F5E9E9E9A4A4A46A6A6A7676766161617E
                7E7E909090A5A5A5B4B4B4C1C1C19C9C9CFF00FFFF00FFFF00FFA7756BFFFBF0
                F8EADCEEDDCA22576C165E82745D657D52545E3F39867258A78C66CEAA73A065
                67FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE4E4E47D7D7D7F7F7F82828281
                81816666668888889D9D9DB2B2B2999999FF00FFFF00FFFF00FFA7756BFFFFFC
                FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
                5EFF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEACACAC949494C4C4C4AD
                ADAD8B8B8B6363638080809393938F8F8FFF00FFFF00FFFF00FFBC8268FFFFFF
                FEF7F2FAEFE6F0E5D56B5D62E9A4A1CF9090B27575875353583C357A69508153
                54FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3E9E9E97E7E7ED1D1D1C0
                C0C0A8A8A88686866161617F7F7F838383FF00FFFF00FFFF00FFBC8268FFFFFF
                FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
                4EFF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3E4E4E48D8D8DCF
                CFCFBFBFBFA9A9A98585856464647B7B7BFF00FFFF00FFFF00FFD1926DFFFFFF
                FFFFFFFFFEFCFEF7F0FAEFE5E1CEC0875958E1A1A1CC8E8EB07474865151633B
                3CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3F3F3DBDBDB88
                8888CECECEBEBEBEA7A7A7848484696969FF00FFFF00FFFF00FFD1926DFFFFFF
                FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
                423E4145FF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3D2
                D2D28B8B8BD2D2D2BCBCBCAAAAAA7979795C5C5CFF00FFFF00FFDA9D75FFFFFF
                FFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6CFB5AA976666EFAAA98C6D731E79
                9F0C98BD0C98BDFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F4
                F4F4CBCBCB969696D7D7D7959595919191909090909090FF00FFDA9D75FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
                F0008EDE000F95000081B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFC
                FCFCD6D6D68D8D8D9292929E9E9E9F9F9F9191917474746A6A6AE7AB79FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FD1914F068FC10393
                DE0320BA0318B2010B99BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFDBDBDB999999A3A3A38D8D8D928F92878787848484767676E7AB79FBF4F0
                FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
                BF2F45ED1031D3010A95BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6
                F6F6D7D7D7999999AAAAAAFF00FF888888BABABA9C9C9C757575E7AB79D1926D
                D1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00
                FF2732D00C19B4FF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1
                B1B1B1B1B1999999FF00FFFF00FFFF00FFAAAAAA8C8C8CFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = EditButton2Click
            end
            object AddButton2: TSpeedButton
              Left = 2
              Top = 2
              Width = 23
              Height = 22
              Hint = #1044#1086#1076#1072#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1110#1102
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
                69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
                B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
                80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
                7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
                D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                B7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7B78FDBB88BE5BD89E9BD82E9BD
                7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0D7D7D7C7
                C7C7BDBDBDBFBFBFC4C4C4C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
                81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4CFCFCFAA
                AAAA969696A3A3A3BEBEBEC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
                C09E95FFFBF0F2E4D7E4D2C0004B00004B00004B00A28C72C4A883DBB78AE5BD
                87EFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9E9E9E9D8D8D881818181
                8181818181919191ADADADBEBEBEC3C3C3C7C7C79C9C9CFF00FFFF00FFFF00FF
                C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
                88F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEE1E1E1B9B9B9818181A9
                A9A9818181898989919191A2A2A2BDBDBDCCCCCC9C9C9CFF00FFFF00FFFF00FF
                CBA99EFFFFFF004B00004B00004B0016AC2D004B00004B00004B00A89275D7B8
                8FF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181818181818181B4
                B4B4818181818181818181979797BDBDBDD1D1D19C9C9CFF00FFFF00FFFF00FF
                CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
                9AF6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181D0D0D0CBCBCBC2
                C2C2B9B9B9B0B0B0818181AAAAAAC6C6C6D6D6D69C9C9CFF00FFFF00FFFF00FF
                D4B0A1FFFFFF004B00004B00004B002ED55A004B00004B00004B00E1C9AAEED3
                ADEBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFF818181818181818181CE
                CECE818181818181818181CECECED7D7D7D3D3D39C9C9CFF00FFFF00FFFF00FF
                D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
                B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFF818181D3
                D3D3818181B9B9B9D9D9D9EAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
                DDB7A4FFFFFFFFFFFFFFFFFF004B00004B00004B00E9E1D5E7D3C4B68A7BA17B
                6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFF81818181
                8181818181E2E2E2DEDEDE9999999999999999999C9C9CFF00FFFF00FFFF00FF
                E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
                55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
                E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
                5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
                6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
                F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
                E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = AddButton2Click
            end
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 197
          Width = 592
          Height = 204
          Align = alBottom
          Caption = #1055#1077#1088#1110#1086#1076#1080' '#1086#1087#1083#1072#1090#1080
          TabOrder = 1
          object cxGrid4: TcxGrid
            Left = 2
            Top = 41
            Width = 588
            Height = 161
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGridTableView2: TcxGridTableView
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
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
              OptionsSelection.HideFocusRect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.HeaderAutoHeight = True
              Styles.StyleSheet = GridTableViewStyleSheetDevExpress
              object cxGridTableView2Column1: TcxGridColumn
                Caption = #1055#1086#1095#1072#1090#1086#1082
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 72
              end
              object cxGridTableView2Column2: TcxGridColumn
                Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 73
              end
              object cxGridTableView2Column3: TcxGridColumn
                Caption = #1055#1086#1095#1072#1090#1086#1082' '#1086#1087#1083'.'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 85
              end
              object cxGridTableView2Column4: TcxGridColumn
                Caption = #1050#1110#1085#1077#1094#1100' '#1086#1087#1083'.'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 83
              end
              object cxGridTableView2Column5: TcxGridColumn
                Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1073#1077#1079' '#1055#1044#1042
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 128
              end
              object cxGridTableView2Column6: TcxGridColumn
                Caption = #1055#1044#1042
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Width = 126
              end
              object cxGridTableView2Column7: TcxGridColumn
                Caption = 'Count2'
                Visible = False
                HeaderAlignmentHorz = taCenter
              end
            end
            object cxGridLevel4: TcxGridLevel
              GridView = cxGridTableView2
            end
          end
          object Panel4: TPanel
            Left = 2
            Top = 15
            Width = 588
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object SplitButton: TSpeedButton
              Left = 74
              Top = 2
              Width = 23
              Height = 22
              Hint = #1056#1086#1079#1073#1080#1090#1080' '#1085#1072' '#1087#1077#1088#1110#1086#1076#1080
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                141B8C0E10A1FF00FF3232324141416D67606D6760FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF6E6E6E737373FF00FF5555556565658B
                8B8B8B8B8BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF685C54
                4446AA11149E4B453F8C8C8EF8F8F8DAD7D1C4C0BA827F7D6866645D59564240
                3EFF00FFFF00FFFF00FFFF00FF828282979797737373696969ADADADFFFFFFE9
                E9E9D7D7D7A1A1A18A8A8A7E7E7E646464FF00FFFF00FFFF00FFFF00FF927A67
                605AB410139EA77F5A8C8C8EFFFFFFFFFFFFFFFFFCCAC2BBB8AFA5F3E5D3E7D7
                C48F8378504D49FF00FFFF00FF9E9E9EA6A6A6737373A1A1A1ADADADFFFFFFFF
                FFFFFFFFFFDADADACACACAF3F3F3E9E9E9A5A5A5717171FF00FFFF00FF927A67
                5D58B210139EA683648C8C8EFEFFFFFFFFFF8888895856561F1F2164605BFFF2
                E0FFEED86D6C6BFF00FFFF00FF9E9E9EA5A5A5737373A5A5A5ADADADFFFFFFFF
                FFFFA9A9A97C7C7C404040848484FDFDFDFAFAFA909090FF00FFFF00FF927B69
                5D58B510139FA78A708C8C8EFEFFFFFFFFFFBBBBBDF2EFEEFFFCF71F1F21EFE3
                D7FCEBD96D6C6BFF00FFFF00FF9F9F9FA6A6A6737373ACACACADADADFFFFFFFF
                FFFFD5D5D5FDFDFDFFFFFF404040F3F3F3F9F9F9909090FF00FFFF00FF927F72
                5D5BBB10139EA9927E8C8C8EFEFFFFFFFFFF9F9FA06868698B8A8B1F1F21F6EE
                E5FCEEE26D6C6BFF00FFFF00FFA3A3A3AAAAAA737373B2B2B2ADADADFFFFFFFF
                FFFFBDBDBD8C8C8CABABAB404040FBFBFBFDFDFD909090FF00FFFF00FF786F6A
                5C5EC110139EAA98898C8C8EFEFFFFFFFFFF8282831F1F21626264BDBDBCFFFE
                FAFBF3EA6D6C6BFF00FFFF00FF949494ADADAD737373B8B8B8ADADADFFFFFFFF
                FFFFA4A4A4404040878787D5D5D5FFFFFFFFFFFF909090FF00FFFF00FF756E6E
                5D60C710139DAB9E938C8C8EFEFEFFFFFFFFAAAAAB1F1F211F1F211F1F21FFFE
                FCFBF7F26D6C6BFF00FFFF00FF959595B0B0B0727272BDBDBDADADADFFFFFFFF
                FFFFC6C6C6404040404040404040FFFFFFFFFFFF909090FF00FFFF00FF757375
                5D64CF10139DA09FA68C8C8EFEFEFEE2E2E2D9D9D9AAAAAA8B8B8CD5D5D7FFFF
                FFFBFAFA6D6C6BFF00FFFF00FF979797B3B3B3727272C0C0C0ADADADFFFFFFF3
                F3F3ECECECC6C6C6ACACACE9E9E9FFFFFFFFFFFF909090FF00FFFF00FF75767B
                5D66D410129DA09FA68C8C8EFFFFFF8F8F8FA9A9A9888889B6B6B7B5B5B6D9D9
                DAFEFEFE6D6C6BFF00FFFF00FF9B9B9BB5B5B5727272C0C0C0ADADADFFFFFFAF
                AFAFC5C5C5A9A9A9D0D0D0CFCFCFECECECFFFFFF909090FF00FFFF00FF75767D
                5D66D510129DA09FA68C8C8EFFFFFFA6A6A69F9FA0979798929293A6A6A7D7D7
                D8FFFFFF6D6C6BFF00FFFF00FF9B9B9BB5B5B5727272C0C0C0ADADADFFFFFFC3
                C3C3BDBDBDB6B6B6B2B2B2C3C3C3EAEAEAFFFFFF909090FF00FFFF00FF77787F
                6069D910129CA3A1A38C8C8EFFFFFF5E5E5ED8D9D9FAFAFBE7E7E7A6A6A6D0D0
                D1FFFFFF6D6C6BFF00FFFF00FF9D9D9DB8B8B8727272BFBFBFADADADFFFFFF83
                8383EBEBEBFFFFFFF7F7F7C3C3C3E5E5E5FFFFFF909090FF00FFFF00FF696A70
                494FC50E12A754567887869AA9A6AA65635874736EE7E3D7E0E0DA494A477777
                77FFFFFF6D6C6BFF00FFFF00FF909090A5A5A57575758A8A8AB0B0B0C4C4C483
                8383949494F0F0F0EFEFEF6D6D6D9A9A9AFFFFFF909090FF00FFFF00FFFF00FF
                2929481A1C631C1F69282B7A23267B282A7E2C2C453C3B81524D7A58536E4341
                46787470464646FF00FFFF00FFFF00FF5C5C5C5F5F5F63636373737371717175
                75755C5C5C8181818787878585856868689797976B6B6BFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF323232FF00FF24264732323221214AFF00FF1E1E692222
                4A09095CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555FF00FF58
                5858555555585858FF00FF6565655858584F4F4FFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF323232323232FF00FFFF00FF323235333333FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF55555555
                5555FF00FFFF00FF565656565656FF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SplitButtonClick
            end
            object DelButton3: TSpeedButton
              Left = 50
              Top = 2
              Width = 23
              Height = 22
              Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1086#1087#1083#1072#1090#1080
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                00006E001DE80010DC00006EFF00FFFF00FFFF00FFFF00FF00006E0004E20008
                E700006EFF00FFFF00FFFF00FFFF00FF6B6B6BA8A8A8A0A0A06B6B6BFF00FFFF
                00FFFF00FFFF00FF6B6B6B9A9A9A9C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FF
                00006E001AE2001FEB0010D900006EFF00FFFF00FF00006E0005DF0009EB0003
                DB00006EFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7AAAAAA9F9F9F6B6B6BFF
                00FFFF00FF6B6B6B9999999E9E9E9797976B6B6BFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E001ADF0020EB0013DC00006E00006E0005E2000BEB0004DA0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ABABABA2A2A26B
                6B6B6B6B6B9A9A9A9E9E9E9898986B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF00006E001BDF0022EB0012E60008EA0009EB0004DF00006EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7ACACACA3
                A3A39F9F9F9E9E9E9999996B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00006E001BE30016EB0011EB000ADF00006EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BA7A7A7A7
                A7A7A3A3A39C9C9C6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00006E0021E7001EEB001AEB0017DF00006EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BACACACAC
                ACACA9A9A9A4A4A46B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF00006E062DE30430EB0020E2001EE20027EB0019DF00006EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB1B1B1B3B3B3AB
                ABABAAAAAAAFAFAFA6A6A66B6B6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E0C35E40E3CEB052BDC00006E00006E001FDC002AEB001CDF0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6BB6B6B6B9B9B9AEAEAE6B
                6B6B6B6B6BA9A9A9B0B0B0A7A7A76B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                00006E1442E41645EB092ED900006EFF00FFFF00FF00006E0020D9012CEB001F
                E200006EFF00FFFF00FFFF00FFFF00FF6B6B6BBBBBBBBEBEBEAFAFAF6B6B6BFF
                00FFFF00FF6B6B6BA7A7A7B1B1B1AAAAAA6B6B6BFF00FFFF00FFFF00FFFF00FF
                00006E1C4BE71037DB00006EFF00FFFF00FFFF00FFFF00FF00006E0022DC0027
                E400006EFF00FFFF00FFFF00FFFF00FF6B6B6BC0C0C0B5B5B56B6B6BFF00FFFF
                00FFFF00FFFF00FF6B6B6BAAAAAAAEAEAE6B6B6BFF00FFFF00FFFF00FFFF00FF
                FF00FF00006E00006EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00006E0000
                6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF6B6B6B6B6B6BFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = DelButton3Click
            end
            object EditButton3: TSpeedButton
              Left = 26
              Top = 2
              Width = 23
              Height = 22
              Hint = #1047#1084#1110#1085#1080#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1086#1087#1083#1072#1090#1080
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA46769A46769
                A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
                69FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FFA46769FCEACE
                F0D8BADCC1A0C4AA89BFA480CFAF82DCB581E2B87EE7BC7EE9BD7FEFC481A467
                69FF00FFFF00FFFF00FF9C9C9CEBEBEBDEDEDECCCCCCB8B8B8B2B2B2BABABABE
                BEBEBFBFBFC1C1C1C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFEEFDA
                F6E0C6302D2D212527374546998468AD926FC2A074DCB27AE7BC7EEFC481A467
                69FF00FFFF00FFFF00FF959595F0F0F0E5E5E5656565585858777777989898A4
                A4A4AEAEAEBBBBBBC1C1C1C6C6C69C9C9CFF00FFFF00FFFF00FFA0675BFFF4E5
                F7E5CF9C8F800D46630362920B3B544B4741917B5EB5976CD1AB74E9BF7DA467
                69FF00FFFF00FFFF00FF959595F5F5F5E9E9E9A4A4A46A6A6A7676766161617E
                7E7E909090A5A5A5B4B4B4C1C1C19C9C9CFF00FFFF00FFFF00FFA7756BFFFBF0
                F8EADCEEDDCA22576C165E82745D657D52545E3F39867258A78C66CEAA73A065
                67FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE4E4E47D7D7D7F7F7F82828281
                81816666668888889D9D9DB2B2B2999999FF00FFFF00FFFF00FFA7756BFFFFFC
                FAF0E6F8EADA8F9F9D62555DDD908CB879798E57575B3D377D6B519A815D925C
                5EFF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEACACAC949494C4C4C4AD
                ADAD8B8B8B6363638080809393938F8F8FFF00FFFF00FFFF00FFBC8268FFFFFF
                FEF7F2FAEFE6F0E5D56B5D62E9A4A1CF9090B27575875353583C357A69508153
                54FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3E9E9E97E7E7ED1D1D1C0
                C0C0A8A8A88686866161617F7F7F838383FF00FFFF00FFFF00FFBC8268FFFFFF
                FFFEFCFCF6F0FAEFE6EBDCCE8C5E5DE2A1A1CE8F8FB476768652525C3F38764C
                4EFF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3E4E4E48D8D8DCF
                CFCFBFBFBFA9A9A98585856464647B7B7BFF00FFFF00FFFF00FFD1926DFFFFFF
                FFFFFFFFFEFCFEF7F0FAEFE5E1CEC0875958E1A1A1CC8E8EB07474865151633B
                3CFF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3F3F3DBDBDB88
                8888CECECEBEBEBEA7A7A7848484696969FF00FFFF00FFFF00FFD1926DFFFFFF
                FFFFFFFFFFFFFFFEFCFCF7F0FAEFE5D7C1B58A5B5BE6A6A6CA8B8BB675757E44
                423E4145FF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F3F3F3D2
                D2D28B8B8BD2D2D2BCBCBCAAAAAA7979795C5C5CFF00FFFF00FFDA9D75FFFFFF
                FFFFFFFFFFFFFFFFFFFFFEFCFCF6EFFCF3E6CFB5AA976666EFAAA98C6D731E79
                9F0C98BD0C98BDFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F4
                F4F4CBCBCB969696D7D7D7959595919191909090909090FF00FFDA9D75FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BA955F569E5D582D84A706BB
                F0008EDE000F95000081B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFC
                FCFCD6D6D68D8D8D9292929E9E9E9F9F9F9191917474746A6A6AE7AB79FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5A56B5FD1914F068FC10393
                DE0320BA0318B2010B99BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFDBDBDB999999A3A3A38D8D8D928F92878787848484767676E7AB79FBF4F0
                FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A56B5FC1836CFF00FF0263
                BF2F45ED1031D3010A95BFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6F6F6F6F6F6F6
                F6F6D7D7D7999999AAAAAAFF00FF888888BABABA9C9C9C757575E7AB79D1926D
                D1926DD1926DD1926DD1926DD1926DD1926DD1926DA56B5FFF00FFFF00FFFF00
                FF2732D00C19B4FF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1
                B1B1B1B1B1999999FF00FFFF00FFFF00FFAAAAAA8C8C8CFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = EditButton3Click
            end
            object AddButton3: TSpeedButton
              Left = 2
              Top = 2
              Width = 23
              Height = 22
              Hint = #1044#1086#1076#1072#1090#1080' '#1087#1077#1088#1110#1086#1076' '#1086#1087#1083#1072#1090#1080
              Flat = True
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
                69A46769A46769FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
                B79184FEE9C7F4DAB5F3D5AAF2D0A0EFCB96EFC68BEDC182EBC17FEBC180EBC1
                80F2C782A46769FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
                7FEFC481A46769FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
                D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                B7938AFEEFDAF6E0C6F2DABCECD0AEDDC19CD7B78FDBB88BE5BD89E9BD82E9BD
                7FEFC481A46769FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0D7D7D7C7
                C7C7BDBDBDBFBFBFC4C4C4C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                BA978FFFF4E5F7E5CFF4E0C5E1CAADBCA589A89275B99E7BDBB88AEBC28AEABF
                81EFC480A46769FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4CFCFCFAA
                AAAA969696A3A3A3BEBEBEC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
                C09E95FFFBF0F2E4D7E4D2C0004B00004B00004B00A28C72C4A883DBB78AE5BD
                87EFC583A46769FF00FFFF00FFFF00FF9F9F9FF9F9F9E9E9E9D8D8D881818181
                8181818181919191ADADADBEBEBEC3C3C3C7C7C79C9C9CFF00FFFF00FFFF00FF
                C6A49AFFFFFCE7DED5C1B6A9004B000D9A1A004B0097856EA28C71B99E7AD9B8
                88F2C98CA46769FF00FFFF00FFFF00FF9F9F9FFEFEFEE1E1E1B9B9B9818181A9
                A9A9818181898989919191A2A2A2BDBDBDCCCCCC9C9C9CFF00FFFF00FFFF00FF
                CBA99EFFFFFF004B00004B00004B0016AC2D004B00004B00004B00A89275D7B8
                8FF3CE97A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181818181818181B4
                B4B4818181818181818181979797BDBDBDD1D1D19C9C9CFF00FFFF00FFFF00FF
                CFAC9FFFFFFF004B0031DA602BD05423C2441AB43413A525004B00BDA589DEC1
                9AF6D3A0A46769FF00FFFF00FFFF00FFA6A6A6FFFFFF818181D0D0D0CBCBCBC2
                C2C2B9B9B9B0B0B0818181AAAAAAC6C6C6D6D6D69C9C9CFF00FFFF00FFFF00FF
                D4B0A1FFFFFF004B00004B00004B002ED55A004B00004B00004B00E1C9AAEED3
                ADEBCFA4A46769FF00FFFF00FFFF00FFB1B1B1FFFFFF818181818181818181CE
                CECE818181818181818181CECECED7D7D7D3D3D39C9C9CFF00FFFF00FFFF00FF
                D9B5A1FFFFFFFFFFFFFFFFFF004B0034DE65004B00C1B5A8E6D6C1FBEACEDECE
                B4B6AA93A46769FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFF818181D3
                D3D3818181B9B9B9D9D9D9EAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
                DDB7A4FFFFFFFFFFFFFFFFFF004B00004B00004B00E9E1D5E7D3C4B68A7BA17B
                6F9C7667A46769FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFF81818181
                8181818181E2E2E2DEDEDE9999999999999999999C9C9CFF00FFFF00FFFF00FF
                E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
                55E68F31B56D4DFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
                E6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC7C5B88265F8B5
                5CBF7A5CFF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
                6CFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
                F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
                E8C4ADEBCBB7EBCBB7EACBB7EACAB6EACAB6EACAB6EACAB6E3C2B1A56B5FFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = AddButton3Click
            end
            object RefreshCheck: TcxCheckBox
              Left = 104
              Top = 2
              Width = 153
              Height = 21
              Properties.DisplayUnchecked = 'False'
              Properties.Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1080' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086
              State = cbsChecked
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object Button1: TButton
    Left = 528
    Top = 576
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object Panel6: TPanel
    Left = 0
    Top = 429
    Width = 777
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      777
      67)
    object OkButton2: TcxButton
      Left = 592
      Top = 18
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 0
      OnClick = OkButton2Click
    end
    object CancelButton: TcxButton
      Left = 688
      Top = 18
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = CancelButtonClick
    end
    object PSumEdit: TcxTextEdit
      Left = 360
      Top = 38
      Width = 113
      Height = 21
      Anchors = [akLeft, akBottom]
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clSilver
      TabOrder = 2
      Text = '0'
    end
    object StaticText4: TStaticText
      Left = 360
      Top = 7
      Width = 113
      Height = 28
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1055#1083#1072#1085#1086#1074#1072' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1073#1077#1079' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object PCountEdit: TcxTextEdit
      Left = 248
      Top = 38
      Width = 97
      Height = 21
      Anchors = [akLeft, akBottom]
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clSilver
      TabOrder = 4
      Text = '0'
    end
    object StaticText3: TStaticText
      Left = 248
      Top = 7
      Width = 97
      Height = 28
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1055#1083#1072#1085#1086#1074#1072' '#1082#1110#1083#1100#1082#1110#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object SumEdit: TcxTextEdit
      Left = 120
      Top = 38
      Width = 113
      Height = 21
      Anchors = [akLeft, akBottom]
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clSilver
      TabOrder = 6
      Text = '0'
    end
    object StaticText2: TStaticText
      Left = 120
      Top = 7
      Width = 113
      Height = 28
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1073#1077#1079' '#1055#1044#1042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object CountEdit: TcxTextEdit
      Left = 8
      Top = 38
      Width = 97
      Height = 21
      Anchors = [akLeft, akBottom]
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clSilver
      TabOrder = 8
      Text = '0'
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 7
      Width = 97
      Height = 28
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object StaticText5: TStaticText
      Left = 480
      Top = 24
      Width = 49
      Height = 19
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = 'NDS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Visible = False
    end
    object NDSEdit: TcxTextEdit
      Left = 480
      Top = 46
      Width = 49
      Height = 21
      Anchors = [akLeft, akBottom]
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = clSilver
      TabOrder = 11
      Text = '0'
      Visible = False
    end
  end
  object SupplDS: TpFIBDataSet
    Database = WorkDatabase
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 404
    Top = 184
    poSQLINT64ToBCD = True
  end
  object SupplDataSource: TDataSource
    DataSet = SupplDS
    Left = 436
    Top = 184
  end
  object CustDS: TpFIBDataSet
    Database = WorkDatabase
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 468
    Top = 88
    poSQLINT64ToBCD = True
  end
  object CustDataSource: TDataSource
    DataSet = CustDS
    Left = 500
    Top = 72
  end
  object CustMenDataSource: TDataSource
    DataSet = CustMenDS
    Left = 588
    Top = 208
  end
  object CustMenDS: TpFIBDataSet
    Database = WorkDatabase
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 556
    Top = 208
    poSQLINT64ToBCD = True
  end
  object pFIBQuery1: TpFIBQuery
    Left = 132
    Top = 144
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 276
    Top = 8
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 308
    Top = 8
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 340
    Top = 8
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 80
    Top = 144
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle9
      Styles.IncSearch = cxStyle10
      Styles.Selection = cxStyle13
      Styles.FilterBox = cxStyle4
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle14
      Styles.GroupByBox = cxStyle4
      Styles.Header = cxStyle4
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
  end
  object StoredProc: TpFIBStoredProc
    Database = WorkDatabase
    Transaction = WriteTransaction
    Left = 496
    Top = 312
  end
  object HalcyonDataSet2: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 536
    Top = 312
  end
  object HalcyonDataSet1: THalcyonDataSet
    AutoFlush = False
    Exclusive = False
    LargeIntegerAs = asInteger
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 576
    Top = 312
  end
  object DogInfoDS: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 612
    Top = 304
    poSQLINT64ToBCD = True
  end
  object Query: TpFIBQuery
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 648
    Top = 304
    qoStartTransaction = True
  end
end
