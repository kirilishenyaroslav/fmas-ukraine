object ViewSchMoOborotForm: TViewSchMoOborotForm
  Left = 377
  Top = 166
  Width = 692
  Height = 435
  Caption = 'ViewSchMoOborotForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridIOborotSchMo: TcxGrid
    Left = 0
    Top = 41
    Width = 684
    Height = 331
    Align = alClient
    TabOrder = 0
    object cxGridIOborotSchMoDBBandedTableView1: TcxGridDBBandedTableView
      DataController.DataSource = DataSourceOborotSchMo
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0.0000'
          Kind = skSum
          FieldName = 'KOL_BEG'
          Column = colKOL_BEG
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMMA_BEG'
          Column = colSUMMA_BEG
        end
        item
          Format = '0.0000'
          Kind = skSum
          FieldName = 'KOL_PRH'
          Column = colKOL_PRH
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMMA_PRH'
          Column = colSUMMA_PRH
        end
        item
          Format = '0.0000'
          Kind = skSum
          FieldName = 'KOL_RSH'
          Column = colKOL_RSH
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMMA_RSH'
          Column = colSUMMA_RSH
        end
        item
          Format = '0.0000'
          Kind = skSum
          FieldName = 'KOL_END'
          Column = colKOL_END
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'SUMMA_END'
          Column = colSUMMA_END
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.BandHeaders = False
      Styles.Background = cxStyle13
      Styles.Content = cxStyle13
      Styles.Selection = cxStyle14
      Styles.Footer = cxStyle5
      Styles.Header = cxStyle10
      Bands = <
        item
        end>
      object colSFIO: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 138
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SFIO'
      end
      object colPysto: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 138
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object colKOL_BEG: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 138
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'KOL_BEG'
      end
      object colSUMMA_BEG: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 138
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 1
        DataBinding.FieldName = 'SUMMA_BEG'
      end
      object colKOL_PRH: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 130
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'KOL_PRH'
      end
      object colSUMMA_PRH: TcxGridDBBandedColumn
        Options.Filtering = False
        SortOrder = soAscending
        Width = 130
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 1
        DataBinding.FieldName = 'SUMMA_PRH'
      end
      object colKOL_RSH: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 137
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'KOL_RSH'
      end
      object colSUMMA_RSH: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 137
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 1
        DataBinding.FieldName = 'SUMMA_RSH'
      end
      object colKOL_END: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 139
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'KOL_END'
      end
      object colSUMMA_END: TcxGridDBBandedColumn
        Options.Filtering = False
        Width = 139
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 1
        DataBinding.FieldName = 'SUMMA_END'
      end
    end
    object cxGridIOborotSchMoLevel1: TcxGridLevel
      GridView = cxGridIOborotSchMoDBBandedTableView1
    end
  end
  object cxGroupBoxSchMo: TcxGroupBox
    Left = 0
    Top = 372
    Width = 684
    Height = 36
    Align = alBottom
    Alignment = alTopLeft
    TabOrder = 1
    object cxDBTextEditName_Department: TcxDBTextEdit
      Left = 210
      Top = 9
      Width = 367
      Height = 21
      AutoSize = False
      DataBinding.DataField = 'NAME_DEPARTMENT'
      DataBinding.DataSource = DataSourceOborotSchMo
      ParentFont = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxLabelNameDepartment: TcxLabel
      Left = 8
      Top = 11
      Width = 161
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 41
    Align = alTop
    TabOrder = 2
    object ApplyButton: TcxButton
      Left = 10
      Top = 8
      Width = 120
      Height = 25
      Action = ActionObnov
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        C6070000424DC607000000000000360000002800000016000000160000000100
        2000000000009007000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00010101000101010001010100010101000101010001010100010101000101
        01000101010001010100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101002573
        0000257300002573000025730000257300002573000025730000257300000101
        0100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101002573000068B5730069B6
        740069B6740069B6740069B6740069B674002573000025730000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0001010100257300002573000025730000257300002573
        00002573000069B674002573000025730000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000101010001010100010101000101010001010100010101002573000069B6
        74002573000001010100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010100FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00010101002573000069B67400257300000101
        0100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00010101002573000001010100FFFFFF00FFFFFF00010101000101
        010001010100010101002573000069B674002573000001010100010101000101
        010001010100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101002573
        000049DC00002573000001010100FFFFFF000101010025730000257300002573
        00002573000069B674002573000025730000257300002573000001010100FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00010101002573000049DC000049DC000049DC
        00002573000001010100FFFFFF00010101002573000068B5730069B6740049DC
        000069B674006AB675002573000001010100FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00010101002573000068B5730069B6740049DC000069B674006AB675002573
        000001010100FFFFFF00010101002573000049DC000049DC000049DC00002573
        000001010100FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010100257300002573
        0000257300002573000069B67400257300002573000025730000257300000101
        0100FFFFFF00010101002573000049DC00002573000001010100FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00010101000101010001010100010101002573
        000069B674002573000001010100010101000101010001010100FFFFFF00FFFF
        FF00010101002573000001010100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101002573000069B674002573
        000001010100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000101
        0100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00010101002573000069B6740025730000010101000101
        01000101010001010100010101000101010001010100FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00010101002573000069B67400257300002573000025730000257300002573
        0000257300002573000001010100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101002573
        000069B6740069B6740069B6740069B6740069B6740069B6740068B573002573
        000001010100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000101010025730000257300002573
        000025730000257300002573000025730000257300002573000001010100FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0001010100010101000101010001010100010101000101
        01000101010025730000257300002573000001010100FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00}
      UseSystemPaint = False
    end
    object PrintButton: TcxButton
      Left = 136
      Top = 8
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
        760A0000424D760E000000000000360800002800000014000000140000000100
        2000000000004006000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600D4F0FF00B1E2F8008ED4DF006BC9D10048B8C30025AABD0000AAC5000092
        AF00007A930000626200004A4A0000323200D4E3FF00B1C7FF008EABFF006B8F
        FF004873FF002557FF000055FF000049DC00003DB90000319600002573000019
        5000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000FE000000
        DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8EFF008F6B
        FF007348FF005725FF005500FF004900DC003D00B90031009600250073001900
        5000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF009200
        DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00FF6B
        FF00FF48FF00FF25FF00FE00FE00DC00DC00B900B90096009600730073005000
        5000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00DC00
        9200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8EAB00FF6B
        8F00FF487300FF255700FF005500DC004900B9003D0096003100730025005000
        1900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FE000000DC00
        0000B9000000960000007300000050000000FFE3D400FFC7B100FFAB8E00FF8F
        6B00FF734800FF572500FF550000DC490000B93D000096310000732500005019
        0000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000DC92
        0000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF8E00FFFF
        6B00FFFF4800FFFF2500FEFE0000DCDC0000B9B9000096960000737300005050
        0000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC
        00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF8E008FFF
        6B0073FF480057FF250055FF000049DC00003DB9000031960000257300001950
        0000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FE000000DC
        000000B90000009600000073000000500000D4FFE300B1FFC7008EFFAB006BFF
        8F0048FF730025FF570000FF550000DC490000B93D0000963100007325000050
        1900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA0000DC
        920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFFFF006BFF
        FF0048FFFF0025FFFF0000FEFE0000DCDC0000B9B90000969600007373000050
        5000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA009E9E
        9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A4A003E3E
        3E0032323200262626001A1A1A000E0E0E00F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6
        B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600B6B6B600FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6B60062626200626262006262
        6200626262006262620062626200626262006262620062626200626262006262
        62006262620062626200B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
        B600626262000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000032323200B6B6
        B600FFFFFF00FFFFFF00B6B6B60062626200000000006262620000AAC50000AA
        C50000AAC50000AAC50000AAC50000AAC50000AAC50000AAC50000AAC50000AA
        C500007A930048B8C3000000000032323200B6B6B600FFFFFF00626262000000
        00006262620048B8C30048B8C30048B8C30048B8C30048B8C30048B8C30048B8
        C30048B8C30048B8C30048B8C30048B8C30000AAC500007A930048B8C3000000
        000032323200B6B6B6006262620000000000007A9300007A9300007A9300007A
        9300007A9300007A9300007A9300007A9300007A9300007A9300007A9300007A
        9300007A9300007A930048B8C30048B8C3000000000032323200626262000000
        00006BC9D1006BC9D1006BC9D1006BC9D1006BC9D1006BC9D1006BC9D1006BC9
        D1008ED4DF008ED4DF008ED4DF008ED4DF008ED4DF0000AAC5000092AF0048B8
        C300007A9300000000006262620000000000B1E2F8006BC9D1006BC9D1006BC9
        D1006BC9D1006BC9D1008ED4DF008ED4DF008ED4DF008ED4DF008ED4DF00007A
        93008ED4DF0000AAC5008ED4DF000092AF000092AF0000000000626262000000
        0000B1E2F800B1E2F8006BC9D1006BC9D1006BC9D1006BC9D1006BC9D1008ED4
        DF008ED4DF008ED4DF0000626200006262008ED4DF0000AAC5008ED4DF008ED4
        DF000092AF00000000006262620000000000B1E2F800B1E2F800B1E2F800B1E2
        F800B1E2F800B1E2F800B1E2F800B1E2F800B1E2F800B1E2F800B1E2F8008ED4
        DF008ED4DF0000AAC500B1E2F8008ED4DF000092AF0000000000626262000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000AAC500B1E2
        F8000092AF0000000000626262000000000062626200B1E2F80048B8C30048B8
        C30048B8C30048B8C30048B8C30048B8C30048B8C30048B8C30048B8C30048B8
        C30048B8C30048B8C300FFFFFF0000AAC5000092AF0000000000B6B6B6006262
        62000000000062626200B1E2F800004A4A00004A4A00004A4A00004A4A00004A
        4A00004A4A00004A4A00004A4A00004A4A00004A4A00004A4A0048B8C300FFFF
        FF0000AAC50000000000FFFFFF00B6B6B6006262620000000000626262000000
        0000B9B900008EABFF00B9B90000B9B90000B9B90000DCDC0000DCDC0000DCDC
        0000DCDC000000000000004A4A00007A9300007A930000000000FFFFFF00FFFF
        FF00B6B6B600626262000000000000000000AAAAAA00B1C7FF00C2C2C200C2C2
        C200C2C2C200CECECE00E6E6E600E6E6E600E6E6E60000000000004A4A000000
        0000000000006E6E6E00FFFFFF00FFFFFF00FFFFFF00B6B6B600626262006262
        620000000000DCDC0000B1C7FF00DCDC0000DCDC0000DCDC0000DCDC0000DCDC
        0000FFFF8E00FFFF8E000000000032323200B6B6B600B6B6B600FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00B6B6B600B6B6B60000000000AAAAAA00B1C7FF00CECE
        CE00E6E6E600E6E6E600E6E6E600FFFFFF00FFFFFF00FFFFFF00000000003232
        3200B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
        B6006262620000000000FFFF8E00B1C7FF00FFFF8E00FFFF8E00FFFF8E00FFFF
        8E00FFFF8E00FFFF8E00FFFF8E00000000006E6E6E00B6B6B600FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6B60000000000AAAAAA00B1C7
        FF00CECECE00E6E6E600E6E6E600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000062626200B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00B6B6B6006262620000000000000000000000000000000000000000000000
        000000000000000000000000000032323200B6B6B600FFFFFF00}
      UseSystemPaint = False
    end
    object ExitButton: TcxButton
      Left = 552
      Top = 8
      Width = 120
      Height = 25
      Action = ActionOtmena
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Glyph.Data = {
        B6070000424DB607000000000000360000002800000018000000140000000100
        2000000000008007000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF000000FF000000FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF000000FF000000FF0000
        00FF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF000000FF00699BFF0000
        00FF000000FF0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000FF000000FF00699BFF0069
        9BFF000000FF000000FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000FF000000FF00000000000000000000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF00699BFF0069
        9BFF00699BFF000000FF000000FF000000000000000000000000000000000000
        0000000000000000000000000000000000FF000000FF000000FF000000000000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF00699BFF0069
        9BFF00699BFF00699BFF000000FF000000FF0000000000000000000000000000
        0000000000000000000000000000000000FF000000FF000000FF000000FF0000
        00FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00699BFF0069
        9BFF00699BFF00699BFF00699BFF000000FF000000FF00000000000000000000
        0000000000000000000000000000000000FF000000FF00FF00FF000000FF0000
        00FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00699BFF0069
        9BFF00699BFF00699BFF00699BFF000000FF000000FF00000000000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF0000
        00FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00699BFF0000
        00FF000000FF00699BFF00699BFF000000FF000000FF00000000000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF
        00FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF00699BFF0000
        00FF000000FF00699BFF00699BFF000000FF000000FF00000000000000FF0000
        00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF
        00FF00FF00FF000000FF000000FF00FFFFFF000000FF000000FF00699BFF0069
        9BFF00699BFF00699BFF00699BFF000000FF000000FF00000000000000FF0000
        00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF
        00FF00FF00FF319600FF000000FF000000FF000000FF000000FF00699BFF0069
        9BFF00699BFF00699BFF00699BFF000000FF000000FF00000000000000FF0000
        00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF
        00FF319600FF000000FF000000FF00FFFFFF000000FF000000FF00699BFF0069
        9BFF00699BFF00699BFF00699BFF000000FF000000FF00000000000000FF0000
        00FF319600FF319600FF319600FF319600FF319600FF00FF00FF00FF00FF3196
        00FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF00699BFF0069
        9BFF00699BFF00699BFF00699BFF000000FF000000FF00000000000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF00FF00FF319600FF0000
        00FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF0069
        9BFF00699BFF00699BFF00699BFF000000FF000000FF00000000000000000000
        0000000000000000000000000000000000FF000000FF319600FF000000FF0000
        00FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF0000
        00FF00699BFF00699BFF00699BFF000000FF000000FF00000000000000000000
        0000000000000000000000000000000000FF000000FF000000FF000000000000
        00FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF0000
        00FF000000FF00699BFF00699BFF000000FF000000FF00000000000000000000
        0000000000000000000000000000000000FF000000FF00000000000000000000
        00FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000
        00FF000000FF000000FF00699BFF000000FF000000FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF00000000}
      UseSystemPaint = False
    end
    object cxButtonOborotName: TcxButton
      Left = 272
      Top = 8
      Width = 145
      Height = 25
      Caption = #1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1053#1072#1079#1074#1072#1085#1080#1102
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = cxButtonOborotNameClick
    end
  end
  object ActionList1: TActionList
    Left = 64
    Top = 176
    object ActionObnov: TAction
      Caption = 'ActionObnov'
      Hint = 'F5'
      ImageIndex = 7
      ShortCut = 116
      OnExecute = ActionObnovExecute
    end
    object ActionOtmena: TAction
      Caption = 'ActionOtmena'
      Hint = 'F10'
      ImageIndex = 5
      ShortCut = 27
      OnExecute = ActionOtmenaExecute
    end
    object ActionPrint: TAction
      Caption = 'ActionPrint'
      ShortCut = 16464
      OnExecute = PrintButtonClick
    end
  end
  object pFIBDataSetOborotSchMo: TpFIBDataSet
    Database = ViewSchOborotForm.WorkDatabase
    Transaction = ViewSchOborotForm.WorkTransaction
    SelectSQL.Strings = (
      'SELECT * FROM MAT_GET_OBOROT_BY_SCH_MO(:ID_SESSION,:PID_SCH)'
      'ORDER BY ID_MO')
    Left = 16
    Top = 224
    poSQLINT64ToBCD = True
    object pFIBDataSetOborotSchMoBAL_ID_SCH: TFIBBCDField
      FieldName = 'BAL_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoBAL_SCH_NUMBER: TFIBStringField
      FieldName = 'BAL_SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetOborotSchMoBAL_SCH_TITLE: TFIBStringField
      FieldName = 'BAL_SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object pFIBDataSetOborotSchMoID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 65
      EmptyStrToNull = True
    end
    object pFIBDataSetOborotSchMoSFIO: TFIBStringField
      FieldName = 'SFIO'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetOborotSchMoNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 255
      EmptyStrToNull = True
    end
    object pFIBDataSetOborotSchMoSCH_TITLE: TFIBStringField
      FieldName = 'SCH_TITLE'
      Size = 60
      EmptyStrToNull = True
    end
    object pFIBDataSetOborotSchMoSCH_NUMBER: TFIBStringField
      FieldName = 'SCH_NUMBER'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetOborotSchMoKOL_BEG: TFIBBCDField
      FieldName = 'KOL_BEG'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoSUMMA_BEG: TFIBBCDField
      FieldName = 'SUMMA_BEG'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoKOL_PRH: TFIBBCDField
      FieldName = 'KOL_PRH'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoSUMMA_PRH: TFIBBCDField
      FieldName = 'SUMMA_PRH'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoKOL_RSH: TFIBBCDField
      FieldName = 'KOL_RSH'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoSUMMA_RSH: TFIBBCDField
      FieldName = 'SUMMA_RSH'
      Size = 2
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoKOL_END: TFIBBCDField
      FieldName = 'KOL_END'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetOborotSchMoSUMMA_END: TFIBBCDField
      FieldName = 'SUMMA_END'
      Size = 2
      RoundByScale = True
    end
  end
  object DataSourceOborotSchMo: TDataSource
    DataSet = pFIBDataSetOborotSchMo
    Left = 64
    Top = 224
  end
  object StyleRepository: TcxStyleRepository
    Left = 104
    Top = 184
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
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWindow
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
  object frxDBDatasetSchMoOborot: TfrxDBDataset
    UserName = 'frxDBDatasetSchMoOborot'
    CloseDataSource = False
    FieldAliases.Strings = (
      'BAL_ID_SCH=BAL_ID_SCH'
      'BAL_SCH_NUMBER=BAL_SCH_NUMBER'
      'BAL_SCH_TITLE=BAL_SCH_TITLE'
      'ID_SCH=ID_SCH'
      'ID_MO=ID_MO'
      'FIO=FIO'
      'SFIO=SFIO'
      'NAME_DEPARTMENT=NAME_DEPARTMENT'
      'SCH_TITLE=SCH_TITLE'
      'SCH_NUMBER=SCH_NUMBER'
      'KOL_BEG=KOL_BEG'
      'SUMMA_BEG=SUMMA_BEG'
      'KOL_PRH=KOL_PRH'
      'SUMMA_PRH=SUMMA_PRH'
      'KOL_RSH=KOL_RSH'
      'SUMMA_RSH=SUMMA_RSH'
      'KOL_END=KOL_END'
      'SUMMA_END=SUMMA_END')
    DataSet = pFIBDataSetOborotSchMo
    Left = 360
    Top = 160
  end
  object frxReportSchMoOborot: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38898.477260740700000000
    ReportOptions.LastChange = 38904.456797233800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo16OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if  StrToFloat(VarToStr(<frxDBDatasetSchMoOborot."KOL_BEG">))' +
        '=0 then memo16.text:='#39#39';'
      'end;'
      ''
      'procedure Memo17OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if  StrToFloat(VarToStr(<frxDBDatasetSchMoOborot."SUMMA_BEG">' +
        '))=0 then memo17.text:='#39#39';'
      'end;'
      ''
      'procedure Memo18OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if  StrToFloat(VarToStr(<frxDBDatasetSchMoOborot."KOL_PRH">))' +
        '=0 then memo18.text:='#39#39';'
      'end;'
      ''
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if  StrToFloat(VarToStr(<frxDBDatasetSchMoOborot."SUMMA_PRH">' +
        '))=0 then memo19.text:='#39#39';'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if  StrToFloat(VarToStr(<frxDBDatasetSchMoOborot."KOL_RSH">))=' +
        '0 then memo20.text:='#39#39';'
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if  StrToFloat(VarToStr(<frxDBDatasetSchMoOborot."SUMMA_RSH">)' +
        ')=0 then memo21.text:='#39#39';'
      'end;'
      ''
      'procedure Memo22OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if  StrToFloat(VarToStr(<frxDBDatasetSchMoOborot."KOL_END">))' +
        '=0 then memo22.text:='#39#39';'
      'end;'
      ''
      'procedure Memo23OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '   if  StrToFloat(VarToStr(<frxDBDatasetSchMoOborot."SUMMA_END">' +
        '))=0 then memo23.text:='#39#39';'
      'end;'
      ''
      'procedure Memo26OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if <SUM(<frxDBDatasetSchMoOborot."KOL_BEG">,MasterData1)> =0 th' +
        'en Memo26.text:='#39#39' ;'
      'end;'
      ''
      'procedure Memo27OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if  <SUM(<frxDBDatasetSchMoOborot."SUMMA_BEG">,MasterData1)> =' +
        '0 then Memo27.text:='#39#39' ;'
      'end;'
      ''
      'procedure Memo28OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if   <SUM(<frxDBDatasetSchMoOborot."KOL_PRH">,MasterData1)> =0 ' +
        'then Memo28.text:='#39#39' ;'
      'end;'
      ''
      'procedure Memo29OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if   <SUM(<frxDBDatasetSchMoOborot."SUMMA_PRH">,MasterData1)> =' +
        '0 then Memo29.text:='#39#39'  ;'
      'end;'
      ''
      'procedure Memo30OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if   <SUM(<frxDBDatasetSchMoOborot."KOL_RSH">,MasterData1)> =0 ' +
        'then Memo30.text:='#39#39'   ;'
      'end;'
      ''
      'procedure Memo31OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  if  <SUM(<frxDBDatasetSchMoOborot."SUMMA_RSH">,MasterData1)> =' +
        '0 then Memo31.text:='#39#39'  ;'
      'end;'
      ''
      'procedure Memo32OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if   <SUM(<frxDBDatasetSchMoOborot."KOL_END">,MasterData1)> =0 ' +
        'then Memo32.text:='#39#39'  ;'
      'end;'
      ''
      'procedure Memo33OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        ' if   <SUM(<frxDBDatasetSchMoOborot."SUMMA_END">,MasterData1)> =' +
        '0 then Memo33.text:='#39#39' ;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReportSchMoOborotGetValue
    Left = 360
    Top = 200
    Datasets = <
      item
        DataSet = frxDBDatasetSchMoOborot
        DataSetName = 'frxDBDatasetSchMoOborot'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'MONTHBEG'
        Value = ''
      end
      item
        Name = 'YEARBEG'
        Value = ''
      end
      item
        Name = 'MONTHEND'
        Value = ''
      end
      item
        Name = 'YEAREND'
        Value = ''
      end
      item
        Name = 'NumberDateEnd'
        Value = ''
      end
      item
        Name = 'KodOKPO'
        Value = ''
      end
      item
        Name = 'FullName'
        Value = ''
      end>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo24: TfrxMemoView
          Left = 22.677180000000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[FullName]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 11.338590000000000000
          Top = 26.456710000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #1030#1076#1077#1085#1090#1080#1110#1082#1072#1094#1110#1081#1085#1080#1081
            #1082#1086#1076' '#1028#1044#1056#1055#1054#1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 120.944960000000000000
          Top = 30.236239999999990000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[KodOKPO]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetSchMoOborot
        DataSetName = 'frxDBDatasetSchMoOborot'
        RowCount = 0
        Stretched = True
        object Memo15: TfrxMemoView
          Align = baLeft
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataSet = frxDBDatasetSchMoOborot
          DataSetName = 'frxDBDatasetSchMoOborot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."SFIO"] / '
            '[frxDBDatasetSchMoOborot."NAME_DEPARTMENT"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          Left = 105.826840000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo16OnBeforePrint'
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."KOL_BEG"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          Left = 181.417440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo17OnBeforePrint'
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."SUMMA_BEG"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          Left = 260.787570000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo18OnBeforePrint'
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."KOL_PRH"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Left = 332.598640000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo19OnBeforePrint'
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."SUMMA_PRH"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Align = baLeft
          Left = 408.189240000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."KOL_RSH"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Left = 476.220780000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."SUMMA_RSH"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Left = 551.811380000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo22OnBeforePrint'
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."KOL_END"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Align = baWidth
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo23OnBeforePrint'
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[frxDBDatasetSchMoOborot."SUMMA_END"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 56.692950000000010000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDatasetSchMoOborot."ID_SCH"'
        object Memo2: TfrxMemoView
          Top = 18.897650000000000000
          Width = 105.826840000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1052#1042#1054)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 105.826840000000000000
          Top = 18.897650000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' [NumberDateBeg]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 260.787570000000000000
          Top = 18.897650000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1055#1088#1080#1093#1110#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 408.189240000000000000
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1080#1090#1088#1072#1090#1080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 551.811380000000000000
          Top = 18.897650000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1047#1072#1083#1080#1096#1086#1082' '#1085#1072' [NumberDateEnd]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 551.811380000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 623.622450000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 408.189240000000000000
          Top = 37.795300000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 332.598640000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 105.826840000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 476.220780000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
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
          Left = 260.787570000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1110#1083#1100#1082#1110#1089#1090#1100)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 181.417440000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1057#1091#1084#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            
              '[frxDBDatasetSchMoOborot."SCH_NUMBER"]  [frxDBDatasetSchMoOborot' +
              '."SCH_TITLE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo25: TfrxMemoView
          Align = baLeft
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1059#1089#1100#1086#1075#1086)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 105.826840000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo26OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetSchMoOborot."KOL_BEG">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 181.417440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo27OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetSchMoOborot."SUMMA_BEG">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          Left = 260.787570000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo28OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetSchMoOborot."KOL_PRH">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          Left = 332.598640000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo29OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetSchMoOborot."SUMMA_PRH">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          Left = 408.189240000000000000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo30OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetSchMoOborot."KOL_RSH">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          Left = 476.220780000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo31OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetSchMoOborot."SUMMA_RSH">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Align = baLeft
          Left = 551.811380000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo32OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetSchMoOborot."KOL_END">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Align = baWidth
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo33OnBeforePrint'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.Strings = (
            '[SUM(<frxDBDatasetSchMoOborot."SUMMA_END">,MasterData1)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 22.677180000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        PrintOnFirstPage = False
        object Memo36: TfrxMemoView
          Left = 600.945270000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088' [Page#]')
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        object Memo37: TfrxMemoView
          Left = 68.031540000000010000
          Width = 589.606680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            
              #1054#1041#1054#1056#1054#1058#1053#1040' '#1042#1030#1044#1054#1052#1030#1057#1058#1068' '#1047#1040' '#1055#1045#1056#1030#1054#1044' [MONTHBEG] [YEARBEG] - [MONTHEND] [' +
              'YEAREND]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 416
    Top = 160
  end
end
