object MnaKartMainForm: TMnaKartMainForm
  Left = 295
  Top = 282
  Width = 779
  Height = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 43
    Width = 771
    Height = 484
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label8: TLabel
      Left = 288
      Top = 176
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object PanelData: TPanel
      Left = 0
      Top = 290
      Width = 771
      Height = 194
      Align = alBottom
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 769
        Height = 192
        ActivePage = TabSheet3
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #1054#1087#1077#1088#1072#1094#1110#1111
          object cxGridOper: TcxGrid
            Left = 0
            Top = 0
            Width = 761
            Height = 164
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object cxGridDBBandedTableView1: TcxGridDBBandedTableView
              DataController.DataSource = OperDataSource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.BandHeaders = False
              Styles.Background = cxStyle13
              Styles.Content = cxStyle13
              Styles.Inactive = cxStyle10
              Styles.Selection = cxStyle14
              Styles.Header = cxStyle7
              Styles.BandBackground = cxStyle13
              Styles.BandHeader = cxStyle7
              Bands = <
                item
                end>
              object cxGridOperDBBandedTableView1ID_MNA_OPER: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
                DataBinding.FieldName = 'ID_MNA_OPER'
              end
              object cxGridOperDBBandedTableView1TIP_OPER: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
                DataBinding.FieldName = 'TIP_OPER'
              end
              object cxGridOperDBBandedTableView1NUM_DOC: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 93
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 1
                DataBinding.FieldName = 'NUM_DOC'
              end
              object cxGridOperDBBandedTableView1NAME_OPER: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 177
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
                DataBinding.FieldName = 'NAME_OPER'
              end
              object cxGridOperDBBandedTableView1DATE_DOC: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 84
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 1
                DataBinding.FieldName = 'DATE_DOC'
              end
              object cxGridOperDBBandedTableView1DATE_REC: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
                DataBinding.FieldName = 'DATE_REC'
              end
              object cxGridOperDBBandedTableView1ID_MO_OLD: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
                DataBinding.FieldName = 'ID_MO_OLD'
              end
              object cxGridOperDBBandedTableView1FIO_OLD: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Width = 357
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
                DataBinding.FieldName = 'FIO_OLD'
              end
              object cxGridOperDBBandedTableView1SFIO_OLD: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 355
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 1
                DataBinding.FieldName = 'SFIO_OLD'
              end
              object cxGridOperDBBandedTableView1NAME_DEPARTMENT_OLD: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 7
                Position.RowIndex = 0
                DataBinding.FieldName = 'NAME_DEPARTMENT_OLD'
              end
              object cxGridOperDBBandedTableView1ID_MO_NEW: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 8
                Position.RowIndex = 0
                DataBinding.FieldName = 'ID_MO_NEW'
              end
              object cxGridOperDBBandedTableView1FIO_NEW: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 9
                Position.RowIndex = 0
                DataBinding.FieldName = 'FIO_NEW'
              end
              object cxGridOperDBBandedTableView1SFIO_NEW: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 355
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.RowIndex = 0
                DataBinding.FieldName = 'SFIO_NEW'
              end
              object cxGridOperDBBandedTableView1NAME_DEPARTMENT_NEW: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 10
                Position.RowIndex = 0
                DataBinding.FieldName = 'NAME_DEPARTMENT_NEW'
              end
              object cxGridOperDBBandedTableView1ID_SCH_OLD: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 11
                Position.RowIndex = 0
                DataBinding.FieldName = 'ID_SCH_OLD'
              end
              object cxGridOperDBBandedTableView1SCH_NUMBER_OLD: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 72
                Position.BandIndex = 0
                Position.ColIndex = 12
                Position.RowIndex = 0
                DataBinding.FieldName = 'SCH_NUMBER_OLD'
              end
              object cxGridOperDBBandedTableView1ID_SCH_NEW: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 13
                Position.RowIndex = 0
                DataBinding.FieldName = 'ID_SCH_NEW'
              end
              object cxGridOperDBBandedTableView1SCH_NUMBER_NEW: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 72
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 1
                DataBinding.FieldName = 'SCH_NUMBER_NEW'
              end
              object cxGridOperDBBandedTableView1SUMMA_OLD: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 14
                Position.RowIndex = 0
                DataBinding.FieldName = 'SUMMA_OLD'
              end
              object cxGridOperDBBandedTableView1SUMMA_NEW: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 15
                Position.RowIndex = 0
                DataBinding.FieldName = 'SUMMA_NEW'
              end
              object cxGridOperDBBandedTableView1SUMMA: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 129
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 1
                DataBinding.FieldName = 'SUMMA'
              end
              object cxGridOperDBBandedTableView1SUMMA_AMORT_OLD: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 16
                Position.RowIndex = 0
                DataBinding.FieldName = 'SUMMA_AMORT_OLD'
              end
              object cxGridOperDBBandedTableView1SUMMA_AMORT_NEW: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 17
                Position.RowIndex = 0
                DataBinding.FieldName = 'SUMMA_AMORT_NEW'
              end
              object cxGridOperDBBandedTableView1SUMMA_AMORT: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Width = 44
                Position.BandIndex = 0
                Position.ColIndex = 18
                Position.RowIndex = 0
                DataBinding.FieldName = 'SUMMA_AMORT'
              end
              object cxGridOperDBBandedTableView1ID_USER: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 19
                Position.RowIndex = 0
                DataBinding.FieldName = 'ID_USER'
              end
              object cxGridOperDBBandedTableView1COMPUTER_NAME: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 20
                Position.RowIndex = 0
                DataBinding.FieldName = 'COMPUTER_NAME'
              end
              object cxGridOperDBBandedTableView1ID_MNA_KART: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 21
                Position.RowIndex = 0
                DataBinding.FieldName = 'ID_MNA_KART'
              end
              object cxGridOperDBBandedTableView1KOL_MAT_OLD: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 22
                Position.RowIndex = 0
                DataBinding.FieldName = 'KOL_MAT_OLD'
              end
              object cxGridOperDBBandedTableView1KOL_MAT_NEW: TcxGridDBBandedColumn
                Visible = False
                Options.Filtering = False
                Position.BandIndex = 0
                Position.ColIndex = 23
                Position.RowIndex = 0
                DataBinding.FieldName = 'KOL_MAT_NEW'
              end
              object cxGridOperDBBandedTableView1KOL_MAT: TcxGridDBBandedColumn
                Options.Filtering = False
                Width = 129
                Position.BandIndex = 0
                Position.ColIndex = 24
                Position.RowIndex = 0
                DataBinding.FieldName = 'KOL_MAT'
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = cxGridDBBandedTableView1
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1044#1086#1088#1086#1075'.'#1084#1077#1090#1072#1083#1080
          ImageIndex = 1
          object cxGrid1: TcxGrid
            Left = 137
            Top = 0
            Width = 624
            Height = 164
            Align = alClient
            PopupMenu = PopupMenuDragMetOper
            TabOrder = 0
            object cxGridDBTableView1: TcxGridDBTableView
              DataController.DataSource = DragMetDataSource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = cxStyle13
              Styles.Content = cxStyle13
              Styles.Inactive = cxStyle10
              Styles.Selection = cxStyle14
              Styles.Header = cxStyle7
              object cxGrid1DBTableView1ID_MNA_DRAGMET: TcxGridDBColumn
                Visible = False
                Options.Filtering = False
                DataBinding.FieldName = 'ID_MNA_DRAGMET'
              end
              object cxGrid1DBTableView1ID_DRAG_MET: TcxGridDBColumn
                Visible = False
                Options.Filtering = False
                DataBinding.FieldName = 'ID_DRAG_MET'
              end
              object cxGrid1DBTableView1NAME_DRAG_MET: TcxGridDBColumn
                Options.Filtering = False
                SortOrder = soAscending
                DataBinding.FieldName = 'NAME_DRAG_MET'
              end
              object cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn
                Visible = False
                Options.Filtering = False
                DataBinding.FieldName = 'SHORT_NAME'
              end
              object cxGrid1DBTableView1KOL_DRAG_MET: TcxGridDBColumn
                Options.Filtering = False
                DataBinding.FieldName = 'KOL_DRAG_MET'
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 137
            Height = 164
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object cxAddButton: TcxButton
              Left = 7
              Top = 6
              Width = 120
              Height = 25
              Caption = #1044#1086#1076#1072#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = cxAddButtonClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
                83B78183B78183FF00FFFF00FFFF00FFC7A79CFEEED4F7E3C5F6DFBCF5DBB4F3
                D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FFFF00FF
                C7A79EFDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
                97F3D199B78183FF00FFFF00FFFF00FFC7A9A1FEF3E3F8E7D3F5E3CBF5DFC3F3
                DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC97F3D199B78183FF00FFFF00FFFF00FF
                C9ACA5FFF7EBF9EBDAF7E7D2F6E3CAF5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
                99F3D198B78183FF00FFFF00FFFF00FFCEB2AAFFFCF4FAEFE4F8EADAF7E7D3F5
                E2CBF5DFC2F4DBBBF1D7B2F1D3AAF0D0A1F3D29BB78183FF00FFFF00FFFF00FF
                D3B7AFFFFFFDFBF4ECFAEFE3F9EBDAF7E7D2F5E3C9F5DFC2F4DBBAF2D7B1F0D4
                A9F5D5A3B78183FF00FFFF00FFFF00FFD7BBB2FFFFFFFEF9F5FBF3ECFAEFE2F9
                EADAF8E7D2F5E3CAF5DEC2F4DBBAF2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
                DABEB3FFFFFFFFFEFDFDF8F4FBF3ECF9EFE3F8EADAF7E7D2F6E2CAF6DEC1F4DB
                B9F8DDB4B78183FF00FFFF00FFFF00FFDEC1B5FFFFFFFFFFFFFFFEFDFEF9F4FB
                F3EBFAEFE2F9EBD9F8E6D1F6E2C8F7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
                E2C5B5FFFFFFFFFFFFFFFFFFFFFEFDFDF9F4FBF3EBFAEEE2FAEDDCFCEFD9E6D9
                C4C6BCA9B78183FF00FFFF00FFFF00FFE5C7B7FFFFFFFFFFFFFFFFFFFFFFFFFF
                FEFDFDF8F3FDF6ECF1E1D5C6A194B59489B08F81B78183FF00FFFF00FFFF00FF
                E9CBB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9BF8C76E8B2
                70ECA54AC58768FF00FFFF00FFFF00FFECCDBAFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFE4D4D2C89A7FFAC577CD9377FF00FFFF00FFFF00FFFF00FF
                EACAB6FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEC7977CCF9B
                86FF00FFFF00FFFF00FFFF00FFFF00FFE9C6B1EBCCB8EBCCB8EBCCB8EBCBB8EA
                CBB8EACBB8EACCB9DABBB0B8857AFF00FFFF00FFFF00FFFF00FF}
              UseSystemPaint = False
            end
            object cxEditButton: TcxButton
              Left = 7
              Top = 38
              Width = 120
              Height = 25
              Caption = #1047#1084#1110#1085#1080#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = cxEditButtonClick
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
            object cxDelButton: TcxButton
              Left = 7
              Top = 70
              Width = 120
              Height = 25
              Caption = #1042#1080#1076#1072#1083#1080#1090#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = cxDelButtonClick
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
                0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
                DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
                0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
                00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
                32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
                00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
                0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              UseSystemPaint = False
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = #1054#1089#1085#1086#1074#1085#1110
          ImageIndex = 2
          object Label4: TLabel
            Left = 3
            Top = 16
            Width = 38
            Height = 13
            Caption = #1053#1072#1079#1074#1072
          end
          object Label7: TLabel
            Left = 0
            Top = 79
            Width = 123
            Height = 13
            Caption = #1044#1072#1090#1072' '#1086#1087#1088#1080#1073#1091#1090#1091#1074#1072#1085#1085#1103
          end
          object Label9: TLabel
            Left = 2
            Top = 110
            Width = 124
            Height = 13
            Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1077#1082#1089#1087#1083'.'
          end
          object Label11: TLabel
            Left = 1
            Top = 143
            Width = 96
            Height = 13
            Caption = #1044#1072#1090#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
          end
          object Label5: TLabel
            Left = 0
            Top = 48
            Width = 142
            Height = 13
            Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1080#1081' '#1085#1086#1084#1077#1088
          end
          object Label1: TLabel
            Left = 280
            Top = 48
            Width = 203
            Height = 13
            Caption = #1057#1091#1084#1072' '#1072#1084#1086#1088#1090#1080#1079#1072#1094#1110#1111' ('#1079#1085#1086#1089#1091') '#1085#1072' 1 '#1086#1076'.'
          end
          object lbl1: TLabel
            Left = 280
            Top = 76
            Width = 197
            Height = 13
            Caption = #1057#1091#1084#1072' '#1072#1084#1086#1088#1090#1080#1079#1072#1094#1110#1111' ('#1079#1085#1086#1089#1091') '#1074#1089#1100#1086#1075#1086
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 152
            Top = 78
            Width = 121
            Height = 21
            DataBinding.DataField = 'DATE_OPR'
            DataBinding.DataSource = KartDataSource
            TabOrder = 0
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 152
            Top = 109
            Width = 121
            Height = 21
            DataBinding.DataField = 'DATE_EXPL'
            DataBinding.DataSource = KartDataSource
            TabOrder = 1
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 152
            Top = 140
            Width = 121
            Height = 21
            DataBinding.DataField = 'DATE_OUT'
            DataBinding.DataSource = KartDataSource
            TabOrder = 2
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 152
            Top = 43
            Width = 121
            Height = 21
            DataBinding.DataField = 'NNUM_FULL'
            DataBinding.DataSource = KartDataSource
            TabOrder = 3
          end
          object cxDBTextEdit9: TcxDBTextEdit
            Left = 48
            Top = 13
            Width = 705
            Height = 21
            DataBinding.DataField = 'NAME'
            DataBinding.DataSource = KartDataSource
            TabOrder = 4
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 488
            Top = 45
            Width = 121
            Height = 21
            DataBinding.DataField = 'SUMMA_AMORT'
            DataBinding.DataSource = KartDataSource
            TabOrder = 5
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 488
            Top = 72
            Width = 121
            Height = 21
            DataBinding.DataField = 'AMORT_ALL'
            DataBinding.DataSource = KartDataSource
            TabOrder = 6
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1030#1085#1074'. '#1090#1072' '#1079#1072#1074'. '#1085#1086#1084#1077#1088#1080
          ImageIndex = 3
          object cxGrid2: TcxGrid
            Left = 0
            Top = 0
            Width = 761
            Height = 164
            Align = alClient
            TabOrder = 0
            object cxGridDBTableView2: TcxGridDBTableView
              DataController.DataSource = InvNumDataSource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              Styles.Background = cxStyle13
              Styles.Content = cxStyle13
              Styles.Inactive = cxStyle10
              Styles.Selection = cxStyle14
              Styles.Header = cxStyle7
              object cxGridDBColumn2: TcxGridDBColumn
                Caption = #1030#1085#1074#1077#1085#1090#1072#1088#1085#1080#1081' '#1085#1086#1084#1077#1088
                Options.Filtering = False
                Width = 251
                DataBinding.FieldName = 'INV_NUM'
              end
              object cxGridDBColumn3: TcxGridDBColumn
                Caption = #1055#1072#1089#1087#1086#1088#1090#1085#1080#1081' '#1085#1086#1084#1077#1088
                Options.Filtering = False
                Width = 254
                DataBinding.FieldName = 'PASSNUM'
              end
              object cxGridDBColumn4: TcxGridDBColumn
                Caption = #1047#1072#1074#1086#1076#1089#1100#1082#1080#1081' '#1085#1086#1084#1077#1088
                Options.Filtering = False
                Width = 254
                DataBinding.FieldName = 'ZAVNUM'
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGridDBTableView2
            end
          end
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 0
      Top = 282
      Width = 771
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      HotZone.SizePercent = 100
      AlignSplitter = salBottom
      Control = PanelData
    end
    object z: TcxGrid
      Left = 0
      Top = 0
      Width = 771
      Height = 282
      Align = alClient
      PopupMenu = PopupMenuOper
      TabOrder = 2
      object zDBTableView1: TcxGridDBTableView
        DataController.DataSource = KartDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_MNA_KART'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.0000'
            Kind = skSum
            FieldName = 'KOL_MAT'
            Column = zDBTableView1KOL_MAT
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'SUMMA'
            Column = zDBTableView1SUMMA
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = zDBTableView1CustomDrawCell
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStyle13
        Styles.Content = cxStyle13
        Styles.Inactive = cxStyle10
        Styles.Selection = cxStyle14
        Styles.Footer = cxStyle7
        Styles.Header = cxStyle7
        object zDBTableView1ID_MNA_KART: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_MNA_KART'
        end
        object zDBTableView1TIP_MNA_KART: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'TIP_MNA_KART'
        end
        object zDBTableView1ID_MO: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_MO'
        end
        object zDBTableView1FIO: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'FIO'
        end
        object zDBTableView1SCH_NUMBER: TcxGridDBColumn
          Caption = #1056#1072#1093#1091#1085#1086#1082
          Options.Filtering = False
          Width = 97
          DataBinding.FieldName = 'SCH_NUMBER'
        end
        object zDBTableView1DATE_OPR: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1087#1088'.'
          Visible = False
          Options.Filtering = False
          Width = 49
          DataBinding.FieldName = 'DATE_OPR'
        end
        object zDBTableView1DATE_EXPL: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1077#1082#1089#1087#1083'.'
          Visible = False
          Options.Filtering = False
          Width = 52
          DataBinding.FieldName = 'DATE_EXPL'
        end
        object zDBTableView1SFIO: TcxGridDBColumn
          Caption = #1052#1042#1054
          Options.Filtering = False
          Width = 168
          DataBinding.FieldName = 'SFIO'
        end
        object zDBTableView1ID_SPODR: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_SPODR'
        end
        object zDBTableView1NAME_DEPARTMENT: TcxGridDBColumn
          Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
          Options.Filtering = False
          Width = 317
          DataBinding.FieldName = 'NAME_DEPARTMENT'
        end
        object zDBTableView1IS_SKLAD: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'IS_SKLAD'
        end
        object zDBTableView1ID_SCH: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_SCH'
        end
        object zDBTableView1SCH_TITLE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SCH_TITLE'
        end
        object zDBTableView1NNUM: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1085#1082#1083'.'#1085#1086#1084#1077#1088
          Visible = False
          Options.Filtering = False
          Width = 126
          DataBinding.FieldName = 'NNUM'
        end
        object zDBTableView1NNUM_FULL: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1085#1082#1083'.'#8470
          Options.Filtering = False
          Width = 111
          DataBinding.FieldName = 'NNUM_FULL'
        end
        object zDBTableView1INV_NUM_FULL: TcxGridDBColumn
          Caption = #1030#1085#1074#1077#1085#1090#1072#1088#1085#1080#1081' '#8470
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          DataBinding.FieldName = 'INV_NUM_FULL'
        end
        object zDBTableView1GNUM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'GNUM'
        end
        object zDBTableView1INUM: TcxGridDBColumn
          Caption = #1030#1085#1074'.'#1085#1086#1084#1077#1088
          Visible = False
          Options.Filtering = False
          Width = 83
          DataBinding.FieldName = 'INV_NUM_FULL'
        end
        object zDBTableView1ID_NOMN: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_NOMN'
        end
        object zDBTableView1NOMN: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'NOMN'
        end
        object zDBTableView1NAME: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072
          Options.Filtering = False
          Width = 131
          DataBinding.FieldName = 'NAME'
        end
        object zDBTableView1ID_OST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_OST'
        end
        object zDBTableView1ID_UNIT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_UNIT'
        end
        object zDBTableView1UNIT: TcxGridDBColumn
          Caption = #1054#1076'.'#1074#1080#1084'.'
          Visible = False
          Options.Filtering = False
          Width = 47
          DataBinding.FieldName = 'UNIT'
        end
        object zDBTableView1PRICE: TcxGridDBColumn
          Caption = #1062#1110#1085#1072
          Visible = False
          Options.Filtering = False
          Width = 72
          DataBinding.FieldName = 'PRICE'
        end
        object zDBTableView1KOL_MAT: TcxGridDBColumn
          Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
          Options.Filtering = False
          Width = 43
          DataBinding.FieldName = 'KOL_MAT'
        end
        object zDBTableView1SUMMA: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          Options.Filtering = False
          Width = 70
          DataBinding.FieldName = 'SUMMA'
        end
        object zDBTableView1SUMMA_OST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUMMA_OST'
        end
        object zDBTableView1DATE_OST: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DATE_OST'
        end
        object zDBTableView1SUMMA_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'SUMMA_AMORT'
        end
        object zDBTableView1ID_OPER_OPR: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_OPER_OPR'
        end
        object zDBTableView1ID_OPER_EXPL: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_OPER_EXPL'
        end
        object zDBTableView1DATE_OUT: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1074#1080#1073'.'
          Visible = False
          Options.Filtering = False
          Width = 20
          DataBinding.FieldName = 'DATE_OUT'
        end
        object zDBTableView1ID_OPER_OUT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ID_OPER_OUT'
        end
        object zDBTableView1YEAR_EXPL: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'YEAR_EXPL'
        end
        object zDBTableView1MONTH_EXPL: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'MONTH_EXPL'
        end
        object zDBTableView1DATE_CREATE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DATE_CREATE'
        end
        object zDBTableView1MODEL: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'MODEL'
        end
        object zDBTableView1MARKA: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'MARKA'
        end
        object zDBTableView1ZAVNUM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'ZAVNUM'
        end
        object zDBTableView1PASSNUM: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'PASSNUM'
        end
        object zDBTableView1NOTE: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'NOTE'
        end
        object zDBTableView1IS_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'IS_AMORT'
        end
        object zDBTableView1AMOR_METHOD: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'AMOR_METHOD'
        end
        object zDBTableView1AMORT_PERCENT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'AMORT_PERCENT'
        end
        object zDBTableView1DB_ID_SCH_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_SCH_AMORT'
        end
        object zDBTableView1DB_ID_SM_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_SM_AMORT'
        end
        object zDBTableView1DB_ID_RZ_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_RZ_AMORT'
        end
        object zDBTableView1DB_ID_ST_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_ST_AMORT'
        end
        object zDBTableView1DB_ID_KEKV_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'DB_ID_KEKV_AMORT'
        end
        object zDBTableView1KR_ID_SCH_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_SCH_AMORT'
        end
        object zDBTableView1KR_ID_SM_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_SM_AMORT'
        end
        object zDBTableView1KR_ID_RZ_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_RZ_AMORT'
        end
        object zDBTableView1KR_ID_ST_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_ST_AMORT'
        end
        object zDBTableView1KR_ID_KEKV_AMORT: TcxGridDBColumn
          Visible = False
          Options.Filtering = False
          DataBinding.FieldName = 'KR_ID_KEKV_AMORT'
        end
        object cxgrdbclmnDate_out: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'DATE_OUT'
        end
      end
      object zLevel1: TcxGridLevel
        GridView = zDBTableView1
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 771
    Height = 43
    ButtonHeight = 36
    ButtonWidth = 66
    Caption = 'ToolBar1'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Images = ImageList1
    ParentFont = False
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = acFiltr
    end
    object ToolButton2: TToolButton
      Left = 66
      Top = 0
      Action = acAdd
      DropdownMenu = PopupMenuAdd
      Style = tbsDropDown
    end
    object ToolButton3: TToolButton
      Left = 145
      Top = 0
      Action = acEdit
    end
    object ToolButton4: TToolButton
      Left = 211
      Top = 0
      Action = acDel
    end
    object ToolButton5: TToolButton
      Left = 277
      Top = 0
      Action = acRefresh
    end
    object ToolButton6: TToolButton
      Left = 343
      Top = 0
      Action = acPrint
    end
    object ToolButton9: TToolButton
      Left = 409
      Top = 0
      Action = acNum
      Caption = #1053#1086#1084#1077#1088#1080
    end
    object ToolButton8: TToolButton
      Left = 475
      Top = 0
      Width = 38
      Caption = 'ToolButton8'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 513
      Top = 0
      Action = acExit
    end
  end
  object MnaKartDatabase: TpFIBDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 48
    Top = 108
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = MnaKartDatabase
    TimeoutAction = TARollback
    Left = 8
    Top = 108
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = MnaKartDatabase
    TimeoutAction = TARollback
    Left = 8
    Top = 140
  end
  object StyleRepository: TcxStyleRepository
    Left = 196
    Top = 129
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
      Font.Style = []
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
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
  object SpFormStorage: TFormStorage
    UseRegistry = True
    StoredProps.Strings = (
      'zDBTableView1SCH_NUMBER.Width'
      'zDBTableView1SFIO.Width'
      'zDBTableView1NNUM_FULL.Width'
      'zDBTableView1NAME_DEPARTMENT.Width'
      'zDBTableView1NAME.Width'
      'zDBTableView1INUM.Width'
      'zDBTableView1KOL_MAT.Width'
      'zDBTableView1SUMMA.Width')
    StoredValues = <
      item
        Name = 'FormWidth'
        Value = 0
      end
      item
        Name = 'FormHeight'
        Value = 0
      end>
    Left = 112
    Top = 124
  end
  object StoredProc: TpFIBStoredProc
    Database = MnaKartDatabase
    Transaction = ReadTransaction
    Left = 112
    Top = 188
  end
  object KartDataSet: TpFIBDataSet
    Database = MnaKartDatabase
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      
        'SELECT * FROM MAT_DT_MNA_KART_SEL_EX(:Id_Session,:Tip_Kart,:Pid_' +
        'mo,:pid_nomn,:Name_Str,:Date_Opr_Beg,:Date_Opr_End,:Date_Expl_Be' +
        'g,:Date_Expl_End,:Date_Out_Beg,:Date_Out_end,:Vib_K,:Filter_Opr,' +
        ':Filter_Expl,:Filter_Out)'
      'ORDER BY FIO, SCH_NUMBER, NAME')
    OnCalcFields = KartDataSetCalcFields
    Left = 8
    Top = 181
    object KartDataSetID_MNA_KART: TFIBBCDField
      FieldName = 'ID_MNA_KART'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetTIP_MNA_KART: TFIBIntegerField
      FieldName = 'TIP_MNA_KART'
    end
    object KartDataSetID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 62
      EmptyStrToNull = True
    end
    object KartDataSetSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 50
      EmptyStrToNull = True
    end
    object KartDataSetID_SPODR: TFIBIntegerField
      FieldName = 'ID_SPODR'
    end
    object KartDataSetNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object KartDataSetIS_SKLAD: TFIBSmallIntField
      FieldName = 'IS_SKLAD'
    end
    object KartDataSetBAL_ID_SCH: TFIBBCDField
      FieldName = 'BAL_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetBAL_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object KartDataSetBAL_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object KartDataSetID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object KartDataSetSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object KartDataSetNNUM: TFIBIntegerField
      FieldName = 'NNUM'
    end
    object KartDataSetGNUM: TFIBSmallIntField
      FieldName = 'GNUM'
    end
    object KartDataSetINUM: TFIBIntegerField
      FieldName = 'INUM'
    end
    object KartDataSetID_NOMN: TFIBBCDField
      FieldName = 'ID_NOMN'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetNOMN: TFIBStringField
      FieldName = 'NOMN'
      Size = 30
      EmptyStrToNull = True
    end
    object KartDataSetNAME: TFIBStringField
      FieldName = 'NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object KartDataSetID_OST: TFIBBCDField
      FieldName = 'ID_OST'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetID_UNIT: TFIBBCDField
      FieldName = 'ID_UNIT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetUNIT: TFIBStringField
      FieldName = 'UNIT'
      Size = 10
      EmptyStrToNull = True
    end
    object KartDataSetPRICE: TFIBBCDField
      FieldName = 'PRICE'
      Size = 4
      RoundByScale = True
    end
    object KartDataSetKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object KartDataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object KartDataSetSUMMA_OST: TFIBBCDField
      FieldName = 'SUMMA_OST'
      Size = 2
      RoundByScale = True
    end
    object KartDataSetDATE_OST: TFIBDateField
      FieldName = 'DATE_OST'
    end
    object KartDataSetSUMMA_AMORT: TFIBBCDField
      FieldName = 'SUMMA_AMORT'
      Size = 2
      RoundByScale = True
    end
    object KartDataSetDATE_OPR: TFIBDateField
      FieldName = 'DATE_OPR'
    end
    object KartDataSetID_OPER_OPR: TFIBBCDField
      FieldName = 'ID_OPER_OPR'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
    end
    object KartDataSetID_OPER_EXPL: TFIBBCDField
      FieldName = 'ID_OPER_EXPL'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetDATE_OUT: TFIBDateField
      FieldName = 'DATE_OUT'
    end
    object KartDataSetID_OPER_OUT: TFIBBCDField
      FieldName = 'ID_OPER_OUT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetYEAR_EXPL: TFIBIntegerField
      FieldName = 'YEAR_EXPL'
    end
    object KartDataSetMONTH_EXPL: TFIBIntegerField
      FieldName = 'MONTH_EXPL'
    end
    object KartDataSetDATE_CREATE: TFIBDateField
      FieldName = 'DATE_CREATE'
    end
    object KartDataSetMODEL: TFIBStringField
      FieldName = 'MODEL'
      Size = 50
      EmptyStrToNull = True
    end
    object KartDataSetMARKA: TFIBStringField
      FieldName = 'MARKA'
      Size = 50
      EmptyStrToNull = True
    end
    object KartDataSetZAVNUM: TFIBStringField
      FieldName = 'ZAVNUM'
      Size = 30
      EmptyStrToNull = True
    end
    object KartDataSetPASSNUM: TFIBStringField
      FieldName = 'PASSNUM'
      Size = 30
      EmptyStrToNull = True
    end
    object KartDataSetNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object KartDataSetIS_AMORT: TFIBIntegerField
      FieldName = 'IS_AMORT'
    end
    object KartDataSetAMOR_METHOD: TFIBIntegerField
      FieldName = 'AMOR_METHOD'
    end
    object KartDataSetAMORT_PERCENT: TFIBFloatField
      FieldName = 'AMORT_PERCENT'
    end
    object KartDataSetDB_ID_SCH_AMORT: TFIBBCDField
      FieldName = 'DB_ID_SCH_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetDB_ID_SM_AMORT: TFIBBCDField
      FieldName = 'DB_ID_SM_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetDB_ID_RZ_AMORT: TFIBBCDField
      FieldName = 'DB_ID_RZ_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetDB_ID_ST_AMORT: TFIBBCDField
      FieldName = 'DB_ID_ST_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetDB_ID_KEKV_AMORT: TFIBBCDField
      FieldName = 'DB_ID_KEKV_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetKR_ID_SCH_AMORT: TFIBBCDField
      FieldName = 'KR_ID_SCH_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetKR_ID_SM_AMORT: TFIBBCDField
      FieldName = 'KR_ID_SM_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetKR_ID_RZ_AMORT: TFIBBCDField
      FieldName = 'KR_ID_RZ_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetKR_ID_ST_AMORT: TFIBBCDField
      FieldName = 'KR_ID_ST_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetKR_ID_KEKV_AMORT: TFIBBCDField
      FieldName = 'KR_ID_KEKV_AMORT'
      Size = 0
      RoundByScale = True
    end
    object KartDataSetINV_NUM_FULL: TFIBStringField
      FieldName = 'INV_NUM_FULL'
      Size = 10
      EmptyStrToNull = True
    end
    object KartDataSetNNUM_EXT: TFIBStringField
      FieldName = 'NNUM_EXT'
      Size = 10
      EmptyStrToNull = True
    end
    object KartDataSetNNUM_FULL: TFIBStringField
      FieldName = 'NNUM_FULL'
      Size = 25
      EmptyStrToNull = True
    end
    object KartDataSetOST_INFO: TFIBStringField
      FieldName = 'OST_INFO'
      Size = 255
      EmptyStrToNull = True
    end
    object KartDataSetAMORT_ALL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'AMORT_ALL'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Calculated = True
    end
  end
  object KartDataSource: TDataSource
    DataSet = KartDataSet
    Left = 40
    Top = 180
  end
  object OperDataSet: TpFIBDataSet
    Database = MnaKartDatabase
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_DT_MNA_OPER_SEL(:ID_MNA_KART)')
    DataSource = KartDataSource
    Left = 8
    Top = 217
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object OperDataSetID_MNA_OPER: TFIBBCDField
      FieldName = 'ID_MNA_OPER'
      Size = 0
      RoundByScale = True
    end
    object OperDataSetTIP_OPER: TFIBIntegerField
      FieldName = 'TIP_OPER'
    end
    object OperDataSetNUM_DOC: TFIBStringField
      FieldName = 'NUM_DOC'
      Size = 15
      EmptyStrToNull = True
    end
    object OperDataSetDATE_DOC: TFIBDateField
      FieldName = 'DATE_DOC'
    end
    object OperDataSetDATE_REC: TFIBDateField
      FieldName = 'DATE_REC'
    end
    object OperDataSetPUB_ID_DOC: TFIBBCDField
      FieldName = 'PUB_ID_DOC'
      Size = 0
      RoundByScale = True
    end
    object OperDataSetID_MO_OLD: TFIBBCDField
      FieldName = 'ID_MO_OLD'
      Size = 0
      RoundByScale = True
    end
    object OperDataSetFIO_OLD: TFIBStringField
      FieldName = 'FIO_OLD'
      Size = 62
      EmptyStrToNull = True
    end
    object OperDataSetSFIO_OLD: TFIBStringField
      FieldName = 'SFIO_OLD'
      Size = 50
      EmptyStrToNull = True
    end
    object OperDataSetNAME_DEPARTMENT_OLD: TFIBStringField
      FieldName = 'NAME_DEPARTMENT_OLD'
      Size = 255
      EmptyStrToNull = True
    end
    object OperDataSetID_MO_NEW: TFIBBCDField
      FieldName = 'ID_MO_NEW'
      Size = 0
      RoundByScale = True
    end
    object OperDataSetFIO_NEW: TFIBStringField
      FieldName = 'FIO_NEW'
      Size = 62
      EmptyStrToNull = True
    end
    object OperDataSetSFIO_NEW: TFIBStringField
      FieldName = 'SFIO_NEW'
      Size = 50
      EmptyStrToNull = True
    end
    object OperDataSetNAME_DEPARTMENT_NEW: TFIBStringField
      FieldName = 'NAME_DEPARTMENT_NEW'
      Size = 255
      EmptyStrToNull = True
    end
    object OperDataSetID_SCH_OLD: TFIBBCDField
      FieldName = 'ID_SCH_OLD'
      Size = 0
      RoundByScale = True
    end
    object OperDataSetSCH_NUMBER_OLD: TFIBStringField
      FieldName = 'SCH_NUMBER_OLD'
      Size = 30
      EmptyStrToNull = True
    end
    object OperDataSetID_SCH_NEW: TFIBBCDField
      FieldName = 'ID_SCH_NEW'
      Size = 0
      RoundByScale = True
    end
    object OperDataSetSCH_NUMBER_NEW: TFIBStringField
      FieldName = 'SCH_NUMBER_NEW'
      Size = 30
      EmptyStrToNull = True
    end
    object OperDataSetSUMMA_OLD: TFIBBCDField
      FieldName = 'SUMMA_OLD'
      Size = 2
      RoundByScale = True
    end
    object OperDataSetSUMMA_NEW: TFIBBCDField
      FieldName = 'SUMMA_NEW'
      Size = 2
      RoundByScale = True
    end
    object OperDataSetSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      Size = 2
      RoundByScale = True
    end
    object OperDataSetSUMMA_AMORT_OLD: TFIBBCDField
      FieldName = 'SUMMA_AMORT_OLD'
      Size = 2
      RoundByScale = True
    end
    object OperDataSetSUMMA_AMORT_NEW: TFIBBCDField
      FieldName = 'SUMMA_AMORT_NEW'
      Size = 2
      RoundByScale = True
    end
    object OperDataSetSUMMA_AMORT: TFIBBCDField
      FieldName = 'SUMMA_AMORT'
      Size = 2
      RoundByScale = True
    end
    object OperDataSetID_USER: TFIBBCDField
      FieldName = 'ID_USER'
      Size = 0
      RoundByScale = True
    end
    object OperDataSetCOMPUTER_NAME: TFIBStringField
      FieldName = 'COMPUTER_NAME'
      Size = 255
      EmptyStrToNull = True
    end
    object OperDataSetID_MNA_KART: TFIBBCDField
      FieldName = 'ID_MNA_KART'
      Size = 0
      RoundByScale = True
    end
    object OperDataSetKOL_MAT_OLD: TFIBBCDField
      FieldName = 'KOL_MAT_OLD'
      Size = 4
      RoundByScale = True
    end
    object OperDataSetKOL_MAT_NEW: TFIBBCDField
      FieldName = 'KOL_MAT_NEW'
      Size = 4
      RoundByScale = True
    end
    object OperDataSetKOL_MAT: TFIBBCDField
      FieldName = 'KOL_MAT'
      Size = 4
      RoundByScale = True
    end
    object OperDataSetNAME_OPER: TFIBStringField
      FieldName = 'NAME_OPER'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object OperDataSource: TDataSource
    DataSet = OperDataSet
    Left = 41
    Top = 217
  end
  object DragMetDataSet: TpFIBDataSet
    Database = MnaKartDatabase
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_DT_MNA_DRAGMET_SELECT(:ID_MNA_KART)')
    DataSource = KartDataSource
    Left = 8
    Top = 257
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object DragMetDataSetID_MNA_DRAGMET: TFIBBCDField
      FieldName = 'ID_MNA_DRAGMET'
      Size = 0
      RoundByScale = True
    end
    object DragMetDataSetID_DRAG_MET: TFIBBCDField
      FieldName = 'ID_DRAG_MET'
      Size = 0
      RoundByScale = True
    end
    object DragMetDataSetNAME_DRAG_MET: TFIBStringField
      FieldName = 'NAME_DRAG_MET'
      Size = 30
      EmptyStrToNull = True
    end
    object DragMetDataSetSHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Size = 10
      EmptyStrToNull = True
    end
    object DragMetDataSetKOL_DRAG_MET: TFIBFloatField
      FieldName = 'KOL_DRAG_MET'
    end
  end
  object DragMetDataSource: TDataSource
    DataSet = DragMetDataSet
    Left = 40
    Top = 257
  end
  object PopupMenuDragMetOper: TPopupMenu
    Images = ImageList1
    Left = 573
    Top = 178
    object N1: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 0
      ShortCut = 45
      OnClick = cxAddButtonClick
    end
    object N2: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 1
      ShortCut = 113
      OnClick = cxEditButtonClick
    end
    object N3: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 2
      ShortCut = 46
      OnClick = cxDelButtonClick
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 496
    Top = 161
    object acAdd: TAction
      Caption = 'acAdd'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = acAddExecute
    end
    object acEdit: TAction
      Caption = 'acEdit'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = acEditExecute
    end
    object acDel: TAction
      Caption = 'acDel'
      ImageIndex = 2
      ShortCut = 46
      OnExecute = acDelExecute
    end
    object acPrint: TAction
      Caption = 'acPrint'
      ImageIndex = 7
      ShortCut = 117
      OnExecute = acPrintExecute
    end
    object acRefresh: TAction
      Caption = 'acRefresh'
      ImageIndex = 3
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acPereoc: TAction
      Caption = #1055#1077#1088#1077#1086#1094#1110#1085#1082#1072
      OnExecute = acPereocExecute
    end
    object acExit: TAction
      Caption = #1042#1080#1093#1110#1076
      ImageIndex = 8
      ShortCut = 27
      OnExecute = acExitExecute
    end
    object acFiltr: TAction
      Caption = 'acFiltr'
      ImageIndex = 9
      OnExecute = acFilterExecute
    end
    object acNum: TAction
      Caption = 'acNum'
      ImageIndex = 5
      ShortCut = 120
      OnExecute = acNumExecute
    end
    object acAddSameKart: TAction
      Caption = 'acAddSameKart'
      ShortCut = 16429
      OnExecute = acAddSameKartExecute
    end
    object actShowHistory: TAction
      Caption = 'actShowHistory'
      ShortCut = 123
      OnExecute = actShowHistoryExecute
    end
  end
  object PopupMenuOper: TPopupMenu
    Images = ImageList1
    Left = 288
    Top = 169
    object acAdd1: TMenuItem
      Action = acAdd
    end
    object acAddSameKart1: TMenuItem
      Action = acAddSameKart
    end
    object acEdit1: TMenuItem
      Action = acEdit
    end
    object acDel1: TMenuItem
      Action = acDel
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object acPrint1: TMenuItem
      Action = acPrint
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object acRefresh1: TMenuItem
      Action = acRefresh
    end
  end
  object frReport: TfrxReport
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
    ReportOptions.CreateDate = 39749.479257986100000000
    ReportOptions.LastChange = 39750.491522893500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'var summ:integer;'
      'begin'
      'summ:=0;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 408
    Top = 241
    Datasets = <
      item
        DataSet = frDataSet
        DataSetName = 'frDataSet'
      end>
    Variables = <
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
      end
      item
        Name = 'PERIOD'
        Value = #39'01.08.2008'#39
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
      object MasterData1: TfrxMasterData
        Height = 18.000000000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frDataSet
        DataSetName = 'frDataSet'
        RowCount = 0
        Stretched = True
        object Memo1: TfrxMemoView
          Left = 45.000000000000000000
          Width = 175.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frDataSet."NAME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 526.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frDataSet."KOL_MAT"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 446.000000000000000000
          Width = 80.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frDataSet."PRICE"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 606.000000000000000000
          Width = 100.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frDataSet."SUMMA"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Width = 45.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[LINE#]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 220.000000000000000000
          Width = 75.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frDataSet."INV_NUM_FULL"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 295.000000000000000000
          Width = 75.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frDataSet."NNUM"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 370.000000000000000000
          Width = 76.000000000000000000
          Height = 18.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frDataSet."DATE_EXPL"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 19.000000000000000000
        Top = 393.071120000000000000
        Width = 718.110700000000000000
        Condition = '<frDataSet."ID_SCH">'
        object Memo24: TfrxMemoView
          Width = 706.015748031496100000
          Height = 19.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frDataSet."SCH_NUMBER"] [frDataSet."SCH_TITLE"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 476.220780000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupFooter1OnBeforePrint'
        object Memo25: TfrxMemoView
          Width = 526.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1072#1079#1086#1084' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091' [frDataSet."SCH_NUMBER"]:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 606.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frDataSet."SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 526.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frDataSet."KOL_MAT">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader2: TfrxGroupHeader
        Height = 103.023500000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        Condition = '<frDataSet."ID_MO">'
        object Memo9: TfrxMemoView
          Left = 45.000000000000000000
          Top = 79.023500000000010000
          Width = 175.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072' '#1058#1052#1062)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 526.000000000000000000
          Top = 79.023500000000010000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 446.000000000000000000
          Top = 79.023500000000010000
          Width = 80.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1062#1110#1085#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 606.000000000000000000
          Top = 79.023500000000010000
          Width = 100.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Top = 79.023500000000010000
          Width = 45.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            #8470' '#1079'/'#1087)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 220.000000000000000000
          Top = 79.023500000000010000
          Width = 75.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1030#1085#1074#1077#1085#1090'. '#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 295.000000000000000000
          Top = 79.023500000000010000
          Width = 75.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1086#1084#1077#1085#1082#1083'. '#8470)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 370.000000000000000000
          Top = 79.023500000000010000
          Width = 76.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1044#1072#1090#1072' '#1077#1082#1089#1087#1083'.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 131.338590000000000000
          Top = 48.243969999999990000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1055#1110#1076#1088#1086#1079#1076#1110#1083)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 227.338590000000000000
          Top = 48.243969999999990000
          Width = 468.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frDataSet."NAME_DEPARTMENT"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 227.338590000000000000
          Top = 19.684910000000000000
          Width = 468.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.Strings = (
            '[frDataSet."SFIO"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 11.338590000000000000
          Top = 19.684910000000000000
          Width = 216.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086'-'#1074#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1072' '#1086#1089#1086#1073#1072)
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        Height = 143.338590000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          Left = 4.000000000000000000
          Top = 17.102350000000000000
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
        object Memo18: TfrxMemoView
          Left = 92.000000000000000000
          Top = 33.102350000000000000
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
        object Memo19: TfrxMemoView
          Top = 61.102350000000000000
          Width = 96.000000000000000000
          Height = 16.000000000000000000
          Memo.Strings = (
            #1050#1086#1076' '#1028#1044#1056#1055#1054#1059)
        end
        object Memo20: TfrxMemoView
          Left = 96.000000000000000000
          Top = 59.102350000000000000
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
        object Memo21: TfrxMemoView
          Left = 4.000000000000000000
          Top = 85.102350000000000000
          Width = 700.000000000000000000
          Height = 56.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1030#1044#1054#1052#1030#1057#1058#1068
            #1086#1073#1083#1110#1082#1091' '#1079#1072#1083#1080#1096#1082#1110#1074' '#1086#1073#39#1108#1082#1090#1110#1074' '#1052#1053#1040' '#1090#1072' '#1052#1064#1055
            #1085#1072' [PERIOD]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 512.000000000000000000
          Top = 17.102350000000000000
          Width = 172.000000000000000000
          Height = 44.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            #1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' '#1052'-14'
            #1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1086' '#1085#1072#1082#1072#1079#1086#1084' '#1052#1110#1085#1089#1090#1072#1090#1091
            #1059#1082#1088#1072#1111#1085#1080' '#1074#1110#1076' 21.06.96 '#1088'. '#8470'193')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        Height = 20.000000000000000000
        Top = 517.795610000000000000
        Width = 718.110700000000000000
        object Memo32: TfrxMemoView
          Width = 526.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            #1056#1072#1079#1086#1084' '#1087#1086' [frDataSet."SFIO"] / [frDataSet."NAME_DEPARTMENT"]:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 606.000000000000000000
          Width = 100.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frDataSet."SUMMA">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 526.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frDataSet."KOL_MAT">)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 76.598020000000000000
        Top = 597.165740000000000000
        Width = 718.110700000000000000
        object Memo35: TfrxMemoView
          Left = 7.559060000000000000
          Top = 22.361779999999950000
          Width = 704.000000000000000000
          Height = 24.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.Strings = (
            
              #1055#1110#1076#1087#1080#1089' '#1084#1072#1090#1077#1088#1110#1072#1083#1100#1085#1086'-'#1074#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1086#1111' '#1086#1089#1086#1073#1080' ________________________' +
              '                           '#1055#1077#1088#1077#1074#1110#1088#1080#1074' '#1073#1091#1093#1075#1072#1083#1090#1077#1088'__________________' +
              '___')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          Left = 606.897650000000000000
          Top = 3.275200000000012000
          Width = 96.000000000000000000
          Height = 20.000000000000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            #1089#1090#1086#1088'. [PAGE#]')
          ParentFont = False
        end
      end
    end
  end
  object frDataSet: TfrxDBDataset
    UserName = 'frDataSet'
    CloseDataSource = False
    DataSet = KartDataSet
    Left = 352
    Top = 241
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 408
    Top = 209
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 352
    Top = 209
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 312
    Top = 209
  end
  object ImageList1: TImageList
    ShareImages = True
    Left = 192
    Top = 200
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500B9838500B983
      8500B9838500B9838500B9838500B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500F6DDB700F4D7
      AC00F3D3A100F1CF9800F0CA8F00B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5636B0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500F8E5C9008A94
      D9001E47F600888ECD00F2D19C00B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009A00174A
      FD00103BF40000009A000000000000000000000000000000000000009A00002C
      F8000030FC0000009A0000000000000000000000000000000000000000000000
      00000000000000000000A5636B00CECED60084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FAEDD9001E49
      F9000033FF001E48F600F4D8AB00B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009A001A47
      F8001A4CFF00123BF10000009A00000000000000000000009A00012DF6000132
      FF00002AF30000009A0000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FCF5E9008D9D
      ED001E49FA008B97E000F6E0BD00B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9A001C47F6001B4DFF00143EF40000009A0000009A00002DF8000134FF00032B
      F20000009A000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FEFBF600FCF7
      ED00FBF2E400FAEDDA00F8E8CE00B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000009A001D48F6001D50FF00103DFB000431FE000132FF00002CF6000000
      9A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FFFFFF00FEFC
      FA00FDF9F200B9838400B9838400BE8675000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000009A001A48F9001342FF000C3CFF000733F60000009A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      000000000000000000000000000000000000B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B781830000000000EDBD9200FFFFFF00FFFF
      FF00FEFDFC00B9838400D3976900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000009A00214EFC001D4BFF001847FF001743F60000009A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      000000000000000000000000000000000000B7818300EED1B100E1B89400E1B6
      8C00DFB18000DCAB7500EFC68600B781830000000000EDBD9200DCA88700DCA8
      8700428A3E00B983840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000009A002E5BF9002C5FFF00224DF800204BF8002355FF001B46F6000000
      9A00000000000000000000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      000000000000000000000000000000000000B7818300CA8F6B00952B00009A34
      01009934010099330000E4B57C00B78183000000000000000000000000000375
      0F0044D2730030AB4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9A003664FA00386BFF002D59F40000009A0000009A00224CF4002558FF001D49
      F60000009A000000000000000000000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B0000000000000000000000000000000000BA8E8500F8EEE500A1421300972E
      000094290000BD764900FDE5B300B781830000000000000000000178090049CC
      72005CE78E0038C65800138E2100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009A004071
      FA004274FF00325DF10000009A00000000000000000000009A00224DF100275A
      FF00204CF80000009A000000000000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B00000000000000000000000000CB9A8200FFFFFF00D5A992009226
      0000A0411200ECCCAE00FFEFC500B78183000000000045812C00109726002EA8
      48003ECA600026AF3D00199F29000A7D12000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009A00497A
      FC003B66F30000009A000000000000000000000000000000000000009A002550
      F4002655FA0000009A0000000000000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B000000000000000000DCA88700FFFFFF00FCF7F500AE5B
      3300CD957400FBF1DE00DECBB400B78183000000000000000000000000000370
      080027B840000D8A180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9A0000009A000000000000000000000000000000000000000000000000000000
      9A0000009A0000000000000000000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B0000000000E3B18E00FFFFFF00FFFFFF00EDDB
      D100F9F2EA00B7818300B7818300B7847500000000000000000000000000097B
      110014AB25000986110000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00EDBD9200FFFFFF00FFFFFF00FFFF
      FF00FDFFFF00B7818300DC9D64000000000000000000000000000A8812000C91
      16000EA31B00077B0D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDBD9200DCA88700DCA88700DCA8
      8700DCA88700B7818300000000000000000007800F0007800F00049012000D9C
      190007800F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500B9838500B983
      8500B9838500B9838500B9838500B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000005710A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000868484008684840000000000000000008684840086848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9838500F6DDB700F4D7
      AC00F3D3A100F1CF9800F0CA8F00B9838500A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000005710A0005710A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008684
      8400BCBABA00B5B3B300868484008684840086848400EBEAEA00868484008684
      8400868484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500F8E5C9008A94
      D9001E47F600888ECD00F2D19C00B9838500A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000000000000000000000000000000000
      0000000000000000000005710A0076F9A70005710A0005710A0005710A000571
      0A0005710A0005710A000000000000000000000000000000000086848400E3E2
      E200B5B3B300B5B3B300B5B3B300515050004F4F4F0086878700CDCDCD00E8E9
      E900C7C6C6008684840086848400868484000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FAEDD9001E49
      F9000033FF001E48F600F4D8AB00B9838500A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000000000000000
      00000000000005710A0076F9A70076F9A7006FF39E005BE3830042CE610028B9
      3F0014A8240005710A0000000000000000000000000086848400DEDDDD00D6D6
      D600A4A3A300A4A3A300A4A3A300565555001615160012121200181818001212
      120093939300CACACA0086848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FCF5E9008D9D
      ED001E49FA008B97E000F6E0BD00B9838500A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000000000000000
      0000000000000000000005710A0076F9A70005710A0005710A0005710A000571
      0A0005710A0005710A00000000000000000086848400D6D6D600D6D6D600A4A3
      A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D9D00797677001212
      12001414140013131300868484008F8C8C000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FEFBF600FCF7
      ED00FBF2E400FAEDDA00F8E8CE00B98385000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB00000000001C78D5001C78D5001C78
      D5001C78D5001C5996000000000005710A0005710A000000000000000000E4F0
      FC001C78D5001C78D5001C78D5001C78D50086848400D6D6D600A4A3A300F3F2
      F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9D900CCCBCB00BFBD
      BD00A2A0A00073717100939191008E8C8C000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FFFFFF00FEFC
      FA00FDF9F200B9838400B9838400BE867500A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000001C78D50082C6F90057BCFF004EB5
      FF004DB4FF001C599600000000000000000005710A000000000000000000E4F0
      FC002A95FF00369BFF00379CFF001C78D50086848400A4A3A300FFFFFF00FEFD
      FD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CECF00E0E0E000E1E1
      E100D4D3D300C7C6C600A7A5A50086838300B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B781830000000000EDBD9200FFFFFF00FFFF
      FF00FEFDFC00B9838400D397690000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000001C78D5007DC3F70056BCFF004EB4
      FE004DB3FF001C5996000000000000000000000000000000000000000000E4F0
      FC002893FF003499FF00359AFF001C78D500000000008684840086848400F1F0
      F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1ACAD00AFA9AA00B2AD
      AE00CAC9C900DCDCDC00D0D0D00086848400B7818300EED1B100E1B89400E1B6
      8C00DFB18000DCAB7500EFC68600B781830000000000EDBD9200DCA88700DCA8
      8700428A3E00B98384000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C5996000000000000000000000000000000000000000000E4F0
      FC001F8EFF002B95FF002C96FF001C78D5000000000000000000000000008684
      8400CAA09700BA9E8700A2897E0095817B00897C7F00928C9200A5A2A400BBB6
      B700D7D6D600CFCFCF008684840000000000B7818300CA8F6B00952B00009A34
      01009934010099330000E4B57C00B78183000000000000000000000000000375
      0F0044D2730030AB4A000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000001C78D50080C6F9005BC1FF0053BA
      FF0052B8FF001C5996000000000000000000000000000000000000000000E4F0
      FC00E4F0FC00E4F0FC00E4F0FC00E4F0FC000000000000000000000000000000
      0000CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A78600CC9A99009895
      960086848400868484000000000000000000BA8E8500F8EEE500A1421300972E
      000094290000BD764900FDE5B300B781830000000000000000000178090049CC
      72005CE78E0038C65800138E2100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB001C78D500629DCF003589CF003589
      CF003589CF001C5996001C5996001C5996001C5996001C5996001C5996000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD39F00CC9A99000000
      000000000000000000000000000000000000CB9A8200FFFFFF00D5A992009226
      0000A0411200ECCCAE00FFEFC500B78183000000000045812C00109726002EA8
      48003ECA600026AF3D00199F29000A7D1200A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000001C78D50086CCF90065CBFF005DC3
      FF005CC4FF003589CF0053BAFF0053BAFF004EB4FF004DB4FF001C78D5000000
      000000000000000000000000000000000000000000000000000000000000CE9D
      9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A9900000000000000
      000000000000000000000000000000000000DCA88700FFFFFF00FCF7F500AE5B
      3300CD957400FBF1DE00DECBB400B78183000000000000000000000000000370
      080027B840000D8A18000000000000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000001C78D50084C9F70065CAFF005EC3
      FE005EC4FF003589CF0053BAFF0054BAFF004FB4FE004FB4FF001C78D5000000
      000000000000000000000000000000000000000000000000000000000000CC9A
      9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A9900000000000000
      000000000000000000000000000000000000E3B18E00FFFFFF00FFFFFF00EDDB
      D100F9F2EA00B7818300B7818300B7847500000000000000000000000000097B
      110014AB2500098611000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000001C78D50085CBF80064CBFF005EC6
      FF005EC7FF003589CF0053BAFF0055BDFF0050B7FF0050B7FF001C78D5000000
      0000000000000000000000000000000000000000000000000000CC9A9900FFFF
      F500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A9900000000000000
      000000000000000000000000000000000000EDBD9200FFFFFF00FFFFFF00FFFF
      FF00FDFFFF00B7818300DC9D64000000000000000000000000000A8812000C91
      16000EA31B00077B0D000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000001C78D5009ECFF50092D7FD0088D2
      FC008CD5FD00629DCF0085CEFD0085CEFD0080C9FC0084CBFD001C78D5000000
      0000000000000000000000000000000000000000000000000000CC9A9900CC9A
      9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A990000000000000000000000
      000000000000000000000000000000000000EDBD9200DCA88700DCA88700DCA8
      8700DCA88700B7818300000000000000000007800F0007800F00049012000D9C
      190007800F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB00000000001C78D5001C78D5001C78
      D5001C78D5001C78D5001C78D5001C78D5001C78D5001C78D500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900CC9A9900CC9A99000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000732DE000732DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7A79C00FEEE
      D400F7E3C500F6DFBC00F5DBB400F3D7AB00F3D3A200F1CF9A00F0CF9700F0CF
      9800F0CF9800F5D49A00B781830000000000B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300000000000000000000000000000000000732DE000732DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000732DE000732DE000000000000000000B7818300A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400986B660000000000000000000000000000000000C7A79E00FDEF
      D900F6E3CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC
      9700EECC9700F3D19900B781830000000000B7818300FDEFD900F4E1C900E4CF
      B400D1BCA000CDB79800DAC09A00E4C59900E9C89600EDCB9600EECC9700F3D1
      9900B7818300000000000000000000000000000000000732DE000732DE000732
      DE00000000000000000000000000000000000000000000000000000000000000
      00000732DE000732DE00000000000000000000000000B7818300FDEFD900F6E3
      CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC9700EECC
      9700F3D19900986B660000000000000000000000000000000000C7A9A100FEF3
      E300F8E7D300F5E3CB00F5DFC300F3DBBB00F2D7B200F1D4AB00F0D0A300EECC
      9A00EECC9700F3D19900B781830000000000B4817600FEF3E300F8E7D3004946
      4500373C3E0051606100AE9C8200BFA88900D0B48D00E4C39300EDCB9600F3D1
      9900B7818300000000000000000000000000000000000732DE000732DD000732
      DE000732DE000000000000000000000000000000000000000000000000000732
      DE000732DE0000000000000000000000000000000000B4817600FEF3E300F8E7
      D300F5E3CB00F5DFC300CFCF9F00018A0200018A0200CCC68B00EECC9A00EECC
      9700F3D19900986B660000000000000000000000000000000000C9ACA500FFF7
      EB00F9EBDA00F7E7D200F6E3CA00F5DFC200F4DBB900F2D7B200F1D4AA00F0D0
      A100EFCD9900F3D19800B781830000000000B4817600FFF7EB00F9EBDA00B0A5
      98001B617D00097CA80018556F0066625B00A7947900C5AC8600DCBD8D00EECD
      9500B781830000000000000000000000000000000000000000000534ED000732
      DF000732DE000732DE00000000000000000000000000000000000732DE000732
      DE000000000000000000000000000000000000000000B4817600FFF7EB00F9EB
      DA00018A0200D1D6AC00018A0200D0CF9E00CECC9800018A0200CCC68900EFCD
      9900F3D19800986B660000000000000000000000000000000000CEB2AA00FFFC
      F400FAEFE400F8EADA00F7E7D300F5E2CB00F5DFC200F4DBBB00F1D7B200F1D3
      AA00F0D0A100F3D29B00B781830000000000BA8E8500FFFCF400FAEFE400F2E5
      D6003872860029799A008D787F00956D6F00795953009D8B7300BAA38000D9BC
      8C00B47F81000000000000000000000000000000000000000000000000000000
      00000732DE000732DE000732DD00000000000732DD000732DE000732DE000000
      00000000000000000000000000000000000000000000BA8E8500FFFCF400FAEF
      E400018A0200018A0200D1D5AD00F5DFC200F4DBBB00CDCC9800018A0200F0D0
      A100F3D29B00986B660000000000000000000000000000000000D3B7AF00FFFF
      FD00FBF4EC00FAEFE300F9EBDA00F7E7D200F5E3C900F5DFC200F4DBBA00F2D7
      B100F0D4A900F5D5A300B781830000000000BA8E8500FFFFFD00FBF4EC00FAEF
      E300A5B3B1007C707800E5A6A300C8929200A47272007657510095856C00AF99
      7800A87779000000000000000000000000000000000000000000000000000000
      0000000000000732DD000633E6000633E6000633E9000732DC00000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFFFD00FBF4
      EC00018A0200018A0200018A0200F5E3C900F5DFC200F4DBBA00F2D7B100F0D4
      A900F5D5A300986B660000000000000000000000000000000000D7BBB200FFFF
      FF00FEF9F500FBF3EC00FAEFE200F9EADA00F8E7D200F5E3CA00F5DEC200F4DB
      BA00F2D8B200F6D9AC00B781830000000000CB9A8200FFFFFF00FEF9F500FBF3
      EC00F4EBDF0085787C00EEB7B500DAA6A600C38E8E009E6E6E0073564F009383
      6B00996E6F000000000000000000000000000000000000000000000000000000
      000000000000000000000633E3000732E3000534EF0000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF00FEF9
      F500FBF3EC00FAEFE200F9EADA00F8E7D200018A0200018A0200018A0200F2D8
      B200F6D9AC00986B660000000000000000000000000000000000DABEB300FFFF
      FF00FFFEFD00FDF8F400FBF3EC00F9EFE300F8EADA00F7E7D200F6E2CA00F6DE
      C100F4DBB900F8DDB400B781830000000000CB9A8200FFFFFF00FFFEFD00FDF8
      F400FBF3EC00F0E4D900A3797800E9B5B500D9A5A500C48F8F009D6D6D007759
      52008F6769000000000000000000000000000000000000000000000000000000
      0000000000000732DD000534ED000533E9000434EF000434F500000000000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF00FFFE
      FD00018A0200D6E3C900F9EFE300F8EADA00D2D9B300018A0200018A0200F4DB
      B900F8DDB400986B660000000000000000000000000000000000DEC1B500FFFF
      FF00FFFFFF00FFFEFD00FEF9F400FBF3EB00FAEFE200F9EBD900F8E6D100F6E2
      C800F7E1C200F0DAB700B781830000000000DCA88700FFFFFF00FFFFFF00FFFE
      FD00FEF9F400FBF3EB00E8D9CE009E747300E8B5B500D8A4A400C18D8D009D6C
      6C007D5556000000000000000000000000000000000000000000000000000000
      00000434F4000534EF000533EB0000000000000000000434F4000335F8000000
      00000000000000000000000000000000000000000000DCA88700FFFFFF00FFFF
      FF00D9EDD800018A0200D6E3C800D5E0C100018A0200D3D8B200018A0200F7E1
      C200F0DAB700986B660000000000000000000000000000000000E2C5B500FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF9F400FBF3EB00FAEEE200FAEDDC00FCEF
      D900E6D9C400C6BCA900B781830000000000DCA88700FFFFFF00FFFFFF00FFFF
      FF00FFFEFD00FDF9F400FBF3EB00E0CFC500A1767600ECB9B900D6A2A200C68E
      8E00965F5D00585C600000000000000000000000000000000000000000000335
      FC000534EF000434F800000000000000000000000000000000000335FC000335
      FB000000000000000000000000000000000000000000DCA88700FFFFFF00FFFF
      FF00FFFFFF00D9EDD800018A0200018A0200D5DFC100FAEDDC00FCEFD900E6D9
      C400C6BCA900986B660000000000000000000000000000000000E5C7B700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500C6A1
      9400B5948900B08F8100B781830000000000E3B18E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFD00FDF8F300FDF6EC00DAC5BC00AC808000F3BCBB00A387
      8C003392B30019ADCC0019ADCC000000000000000000000000000335FB000335
      FB000335FC000000000000000000000000000000000000000000000000000335
      FB000335FB0000000000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500B4817600B481
      7600B4817600B481760000000000000000000000000000000000E9CBB800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900BF8C
      7600E8B27000ECA54A00C587680000000000E3B18E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900AA7A7100B2787300469C
      BA000FCAF40000A4E600021EAA0000009900000000000335FB000335FB000335
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000335FB00000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B4817600E8B2
      7000ECA54A00C587680000000000000000000000000000000000ECCDBA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200C89A
      7F00FAC57700CD9377000000000000000000EDBD9200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B8857A00DCA76A0010A5
      CF0004A8E6000936C900092CC3000318AE000335FB000335FB000335FB000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B4817600FAC5
      7700CD9377000000000000000000000000000000000000000000EACAB600FCF7
      F400FCF7F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00C797
      7C00CF9B8600000000000000000000000000EDBD9200FCF7F400FCF7F300FBF6
      F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B8857A00CF9B86000000
      0000077DCD004860F100204ADD000416AA000335FB000335FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FCF7F400FCF7
      F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B4817600CF9B
      8600000000000000000000000000000000000000000000000000E9C6B100EBCC
      B800EBCCB800EBCCB800EBCBB800EACBB800EACBB800EACCB900DABBB000B885
      7A0000000000000000000000000000000000EDBD9200DCA88700DCA88700DCA8
      8700DCA88700DCA88700DCA88700DCA88700DCA88700B8857A00000000000000
      0000000000003E4BDB00192DC400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200B48176000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFF800000FFFFFF3FFF800000
      E7E7FE3FFF800000C3C3FC3FFF800000C183FC3FFF800000E007FC3FFF800000
      F00FFC3FFF800000F81FFC3F00810000F81FFC3F00830000F00FF81F00E30000
      E007F00F00C10000C183E00700800000C3C3C00300E30000E7E7800100E30000
      FFFF000001C30000FFFFFFFF03070000FF80FFFFFF7FF33FFF800021FE7FE007
      FF800029FC03C000FF800021F8038001FF800021FC030000FF80FFFE82600000
      FF800021036000000081002903E080000083002103E0E00100E3002103E0F003
      00C1FFFE001FF01F00800021001FE03F00E30029001FE03F00E30021001FC03F
      01C30021001FC07F0307FFFE803FF8FFC001FFFFFFFCFFFFC00100079FF98003
      C00100078FF38003C001000787E78003C0010007C3CF8003C0010007F11F8003
      C0010007F83F8003C0010007FC7F8003C0010007F83F8003C0010007F19F8003
      C0010003E3CF8003C0010001C7E78003C00100008FFB8003C00300001FFF8007
      C00700103FFF800FC00F0039FFFF801F00000000000000000000000000000000
      000000000000}
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 352
    Top = 171
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
    Left = 408
    Top = 171
  end
  object InvNumDataSet: TpFIBDataSet
    Database = MnaKartDatabase
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_DT_MNA_INUM_SELECT(:ID_MNA_KART)')
    DataSource = KartDataSource
    Left = 80
    Top = 257
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
    object InvNumDataSetID_MNA_INUM: TFIBBCDField
      FieldName = 'ID_MNA_INUM'
      Size = 0
      RoundByScale = True
    end
    object InvNumDataSetINV_NUM: TFIBStringField
      FieldName = 'INV_NUM'
      Size = 10
      EmptyStrToNull = True
    end
    object InvNumDataSetZAVNUM: TFIBStringField
      FieldName = 'ZAVNUM'
      Size = 30
      EmptyStrToNull = True
    end
    object InvNumDataSetPASSNUM: TFIBStringField
      FieldName = 'PASSNUM'
      Size = 30
      EmptyStrToNull = True
    end
  end
  object InvNumDataSource: TDataSource
    DataSet = InvNumDataSet
    Left = 112
    Top = 257
  end
  object PopupMenuAdd: TPopupMenu
    Left = 344
    Top = 107
    object acAddSameKart2: TMenuItem
      Action = acAdd
    end
    object acAddSameKart3: TMenuItem
      Action = acAddSameKart
    end
  end
  object frxDBDataset_mna_kart: TfrxDBDataset
    UserName = 'frxDBDataset_mna_kart'
    CloseDataSource = False
    Left = 450
    Top = 243
  end
  object frxDBDataset_oper: TfrxDBDataset
    UserName = 'frxDBDataset_oper'
    CloseDataSource = False
    Left = 486
    Top = 244
  end
  object ds_kart: TpFIBDataSet
    Database = MnaKartDatabase
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 313
    Top = 260
    poSQLINT64ToBCD = True
  end
  object ds_prh_rsh: TpFIBDataSet
    Database = MnaKartDatabase
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 277
    Top = 260
    poSQLINT64ToBCD = True
  end
end
