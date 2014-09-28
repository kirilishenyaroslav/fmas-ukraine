object fmPereocenka: TfmPereocenka
  Left = 458
  Top = 265
  Width = 696
  Height = 628
  Caption = 'fmPereocenka'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 185
    Width = 688
    Height = 220
    Align = alClient
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 2
      Top = 15
      Width = 684
      Height = 118
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = DataSourceContek
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '##,#0.00'
            Kind = skSum
            FieldName = 'SUMMA_OPER'
            Column = cxGrid1DBTableView1DBColumn7
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.Background = cxStylemalinYellow
        Styles.Content = cxStylemalinYellow
        Styles.ContentEven = cxStylemalinYellow
        Styles.ContentOdd = cxStylemalinYellow
        Styles.Inactive = AfterSelection
        Styles.Selection = cxStyleMalin
        Styles.FilterBox = cxStylemalinYellow
        Styles.Footer = cxStylemalinYellow
        Styles.Group = cxStylemalinYellow
        Styles.GroupByBox = cxStylemalinYellow
        Styles.Header = ForHaeder
        object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1044#1077#1073#1077#1090
          Width = 58
          DataBinding.FieldName = 'NUM_SCH'
        end
        object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1050#1088#1077#1076#1080#1090
          Width = 55
          DataBinding.FieldName = 'FULL_INV'
        end
        object cxGrid1DBTableView1DBColumn8: TcxGridDBColumn
          Options.Editing = False
          Options.Filtering = False
          Width = 76
          DataBinding.FieldName = 'NUM_DOG'
        end
        object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Width = 235
          DataBinding.FieldName = 'NAME_KART'
        end
        object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Width = 86
          DataBinding.FieldName = 'OST_PRICE'
        end
        object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Width = 82
          DataBinding.FieldName = 'OST_IZNOS'
        end
        object cxGrid1DBTableView1DBColumn7: TcxGridDBColumn
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Width = 90
          DataBinding.FieldName = 'SUMMA_OPER'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 141
      Width = 684
      Height = 69
      Align = alBottom
      TabOrder = 1
      object cxGrid2: TcxGrid
        Left = 1
        Top = 1
        Width = 682
        Height = 67
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.DataSource = DataSourceProv
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              FieldName = 'Summa'
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.Background = cxStylemalinYellow
          Styles.Content = cxStylemalinYellow
          Styles.ContentEven = cxStylemalinYellow
          Styles.ContentOdd = cxStylemalinYellow
          Styles.Inactive = AfterSelection
          Styles.Selection = cxStyleMalin
          Styles.FilterBox = cxStylemalinYellow
          Styles.Footer = cxStylemalinYellow
          Styles.Group = cxStylemalinYellow
          Styles.GroupByBox = cxStylemalinYellow
          Styles.Header = ForHaeder
          object cxGridDBTableView1DBColumn1: TcxGridDBColumn
            Caption = #1044#1077#1073#1077#1090
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            DataBinding.FieldName = 'DB_SCH'
          end
          object cxGridDBTableView1DBColumn2: TcxGridDBColumn
            Caption = #1050#1088#1077#1076#1080#1090
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            DataBinding.FieldName = 'KR_SCH'
          end
          object cxGridDBTableView1DBColumn3: TcxGridDBColumn
            Caption = #1041#1102#1076#1078#1077#1090
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            DataBinding.FieldName = 'SM'
          end
          object cxGridDBTableView1DBColumn4: TcxGridDBColumn
            Caption = #1056#1086#1079#1076'i'#1083
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            DataBinding.FieldName = 'RZ'
          end
          object cxGridDBTableView1DBColumn5: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1090#1103
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            DataBinding.FieldName = 'ST'
          end
          object cxGridDBTableView1DBColumn6: TcxGridDBColumn
            Caption = #1050#1045#1050#1042
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            DataBinding.FieldName = 'KEKV'
          end
          object cxGridDBTableView1DBColumn7: TcxGridDBColumn
            Caption = #1057#1091#1084#1072
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            DataBinding.FieldName = 'SUMMA'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 2
      Top = 133
      Width = 684
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 100
      AlignSplitter = salBottom
      Control = Panel3
    end
    object cxSplitter2: TcxSplitter
      Left = 2
      Top = 210
      Width = 684
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 100
      AlignSplitter = salBottom
      Control = Panel2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 540
    Width = 688
    Height = 59
    Align = alBottom
    TabOrder = 1
    object cxButtonAdd: TcxButton
      Left = 411
      Top = 8
      Width = 120
      Height = 25
      Action = Action1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
        FF00FF00FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00006600001EB231001FB1330000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00656565009A9A9A009A9A9A0065656500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000066000031C24F0022B738001AB02D0021B4370000660000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500ABABAB009E9E9E00979797009C9C9C0065656500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000047D36D003BCB5E0025A83B00006600001BA92E001DB132000066
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500BFBFBF00B5B5B500989898006565650094949400999999006565
        6500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000066
        00004FD6790053DE7F0031B54D0000660000FF00FF0000660000179D27001EAE
        310000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006565
        6500C4C4C400CACACA00A5A5A50065656500FF00FF00656565008C8C8C009898
        980065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000041C5630000660000FF00FF00FF00FF00FF00FF00FF00FF000066
        000019AA2B0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500B5B5B50065656500FF00FF00FF00FF00FF00FF00FF00FF006565
        65009393930065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000660000149D210000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00656565008A8A8A0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxButtonCansel: TcxButton
      Left = 539
      Top = 8
      Width = 120
      Height = 25
      Action = ActionClose
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      NumGlyphs = 2
      UseSystemPaint = False
    end
    object cxButtonAddProv: TcxButton
      Left = 4
      Top = 8
      Width = 120
      Height = 25
      Hint = 'Ins'
      Action = Action_add_new_prov
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object cxButtonChange: TcxButton
      Left = 283
      Top = 8
      Width = 120
      Height = 25
      Hint = 'F2'
      Action = ActionChange
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    object cxButtonDel: TcxButton
      Left = 133
      Top = 8
      Width = 140
      Height = 25
      Hint = 'Del'
      Action = ActionDel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    object StatusBar1: TStatusBar
      Left = 1
      Top = 39
      Width = 686
      Height = 19
      Panels = <
        item
          Width = 300
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 688
    Height = 135
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      688
      135)
    object LabelOldMol: TLabel
      Left = 3
      Top = 36
      Width = 85
      Height = 13
      Caption = 'LabelFIO_MOL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelNameKart: TLabel
      Left = 3
      Top = 12
      Width = 87
      Height = 13
      Caption = 'LabelNameKart'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 3
      Top = 60
      Width = 159
      Height = 13
      Caption = #1057#1090#1072#1088#1072' '#1079#1072#1083#1080#1096#1082#1086#1074#1072' '#1074#1072#1088#1090'i'#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 3
      Top = 84
      Width = 107
      Height = 13
      Caption = #1057#1090#1072#1088#1072' '#1089#1091#1084#1072' '#1079#1085#1086#1089#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 3
      Top = 108
      Width = 157
      Height = 13
      Caption = #1057#1090#1072#1088#1072' '#1073#1072#1083#1072#1085#1089#1086#1074#1072' '#1074#1072#1088#1090'i'#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 331
      Top = 60
      Width = 154
      Height = 13
      Caption = #1053#1086#1074#1072' '#1079#1072#1083#1080#1096#1082#1086#1074#1072' '#1074#1072#1088#1090'i'#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 331
      Top = 84
      Width = 102
      Height = 13
      Caption = #1053#1086#1074#1072' '#1089#1091#1084#1072' '#1079#1085#1086#1089#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 331
      Top = 108
      Width = 152
      Height = 13
      Caption = #1053#1086#1074#1072' '#1073#1072#1083#1072#1085#1089#1086#1074#1072' '#1074#1072#1088#1090'i'#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxTextEditMOLold: TcxTextEdit
      Left = 120
      Top = 32
      Width = 544
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      OnKeyPress = cxTextEditMOLoldKeyPress
    end
    object cxTextEditZnosOld: TcxTextEdit
      Left = 170
      Top = 80
      Width = 153
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      OnKeyPress = cxTextEditZnosOldKeyPress
    end
    object cxTextEditBalOld: TcxTextEdit
      Left = 170
      Top = 104
      Width = 153
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      OnKeyPress = cxTextEditBalOldKeyPress
    end
    object cxTextEditZalNew: TcxTextEdit
      Left = 527
      Top = 56
      Width = 137
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      OnKeyPress = cxTextEditZalNewKeyPress
    end
    object cxTextEditZnosNew: TcxTextEdit
      Left = 527
      Top = 80
      Width = 137
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      OnKeyPress = cxTextEditZnosNewKeyPress
    end
    object cxTextEditBalNew: TcxTextEdit
      Left = 527
      Top = 104
      Width = 137
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      OnKeyPress = cxTextEditBalNewKeyPress
    end
    object cxTextEditNomnShow: TcxTextEdit
      Left = 120
      Top = 8
      Width = 544
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      OnKeyPress = cxTextEditNomnShowKeyPress
    end
    object cxTextEditZalOld: TcxTextEdit
      Left = 170
      Top = 56
      Width = 153
      Height = 21
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      OnKeyPress = cxTextEditZalOldKeyPress
    end
    object CheckBoxShowSumma: TCheckBox
      Left = 665
      Top = 8
      Width = 17
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 8
      OnClick = CheckBoxShowSummaClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 185
    Align = alTop
    TabOrder = 3
    object LabelIznos: TLabel
      Left = 5
      Top = 144
      Width = 51
      Height = 13
      Caption = 'LabelIznos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object LabelSumm_pr: TLabel
      Left = 337
      Top = 142
      Width = 83
      Height = 13
      Caption = 'LabelSumm_pr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LabelSumma_izn: TLabel
      Left = 337
      Top = 163
      Width = 95
      Height = 13
      Caption = 'LabelSumma_izn'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LabelSumma: TLabel
      Left = 337
      Top = 122
      Width = 72
      Height = 13
      Caption = 'LabelSumma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelTip_oper: TLabel
      Left = 5
      Top = 59
      Width = 82
      Height = 13
      Caption = 'LabelTip_oper'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelFIO_MOL: TLabel
      Left = 5
      Top = 81
      Width = 85
      Height = 13
      Caption = 'LabelFIO_MOL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelNum_doc: TLabel
      Left = 5
      Top = 102
      Width = 85
      Height = 13
      Caption = 'LabelNum_doc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Labeldate_doc: TLabel
      Left = 5
      Top = 123
      Width = 85
      Height = 13
      Caption = 'Labeldate_doc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Labelkoeff: TLabel
      Left = 5
      Top = 143
      Width = 61
      Height = 13
      Caption = 'Labelkoeff'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object cxTextEditSumma_izn: TcxTextEdit
      Left = 477
      Top = 160
      Width = 156
      Height = 21
      TabOrder = 0
      Text = '0,00'
      Visible = False
    end
    object cxButtonCalcul: TcxButton
      Left = 296
      Top = 157
      Width = 100
      Height = 28
      Action = ActionCalculate
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A4787400A4787400A4787400A4787400A4787400A478
        7400A4787400A4787400A4787400A4787400A4787400FF00FF00FF00FF00FF00
        FF00FF00FF0005720A0005720A0005720A00FFDDAE00FFDDAE00FFDDAE00FFDD
        AE00FFDDAE00FFDDAE00FFDDAE00FFDDAE00A4787400FF00FF00FF00FF00FF00
        FF0005720A00028D0E0005720A00F4E3CE00F4E3CE00DF993E00DF993E00DF99
        3E00DF993E00DF993E00F4E3CE00F4E3CE00A4787400FF00FF00FF00FF000572
        0A000D9C150005720A00A4787400FCFAF600FCFAF600FCFAF600FCFAF600FCFA
        F600FCFAF600FCFAF600FCFAF600FFFEF900A4787400FF00FF0005720A000572
        0A0023B5340005720A0005720A00FFFFFD00FFFFFD00DF993E00DF993E00DF99
        3E00DF993E00DF993E00FFFFFD00FFFFFD00A4787400FF00FF0005720A0016A1
        220043D2690048CF6E0005720A00FFFFFE00FDFFFF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00CE8C4F00CE8C4F00A4787400FF00FF00FF00FF000572
        0A0048D5690005720A00A4787400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF003098FC003098FC00A4787400FF00FF00FF00FF00A478
        740005720A00FFDDAE00A4787400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0005720A00A4787400FF00FF00FF00FF00A478
        7400F4E3CE00F4E3CE00A4787400A4787400A4787400A4787400A4787400A478
        7400A4787400A478740005720A0048D5690005720A00FF00FF00FF00FF00A478
        7400FCFAF600FCFAF600FCFAF600FCFAF600FCFAF600FCFAF600FCFAF600FFFE
        F900FFFEF90005720A0048CF6E0043D2690016A1220005720A00FF00FF00A478
        7400FFFFFD00FFFFFD00DF993E00DF993E00DF993E00DF993E00DF993E00FFFF
        FD00FFFFFD0005720A0005720A0023B5340005720A0005720A00FF00FF00A478
        7400FDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CE8C
        4F00D4915300A478740005720A000D9C150005720A00FF00FF00FF00FF00A478
        7400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003098
        FC003098FC0005720A00028D0E0005720A00FF00FF00FF00FF00FF00FF00A478
        7400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0005720A0005720A0005720A00FF00FF00FF00FF00FF00FF00FF00FF00A478
        7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
        7400A4787400A4787400FF00FF00FF00FF00FF00FF00FF00FF00}
      UseSystemPaint = False
    end
    object cxTextEditSumma_pr: TcxTextEdit
      Left = 477
      Top = 138
      Width = 156
      Height = 21
      TabOrder = 2
      Text = '0,00'
      Visible = False
    end
    object cxTextEditSumma: TcxTextEdit
      Left = 478
      Top = 117
      Width = 155
      Height = 21
      Properties.ReadOnly = False
      TabOrder = 3
      Text = '0'
    end
    object cxTextEdit_koeff: TcxTextEdit
      Left = 135
      Top = 146
      Width = 165
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 4
      Visible = False
      OnKeyPress = cxTextEdit_koeffKeyPress
    end
    object cxTextEditIznos: TcxTextEdit
      Left = 127
      Top = 138
      Width = 137
      Height = 21
      TabOrder = 5
      Text = '0'
      Visible = False
    end
    object cxDateEditDate_doc: TcxDateEdit
      Left = 127
      Top = 117
      Width = 165
      Height = 21
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 6
    end
    object cxTextEditDoc_num: TcxTextEdit
      Left = 127
      Top = 96
      Width = 165
      Height = 21
      Properties.MaxLength = 15
      Style.Color = clInfoBk
      TabOrder = 7
    end
    object cxButtonEditMOL_old: TcxButtonEdit
      Left = 127
      Top = 75
      Width = 165
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 8
    end
    object cxTextEditVid_oper: TcxTextEdit
      Left = 128
      Top = 54
      Width = 165
      Height = 21
      Enabled = False
      Properties.ReadOnly = True
      TabOrder = 9
    end
    object CheckBoxDookrugl: TCheckBox
      Left = 296
      Top = 140
      Width = 137
      Height = 17
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 10
      Visible = False
    end
    object cxNotePlus: TcxTextEdit
      Left = 310
      Top = 53
      Width = 335
      Height = 21
      Properties.MaxLength = 15
      Style.Color = clInfoBk
      TabOrder = 11
      Visible = False
    end
    object cxAddNote: TcxButton
      Left = 286
      Top = 54
      Width = 21
      Height = 21
      TabOrder = 12
      OnClick = cxAddNoteClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08
        780E08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A70DA31B08780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
        F9A70EAA1D08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A70EA81C08780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
        F9A710AA1F08780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        08780E08780E08780E08780E08780E76F9A719B02C08780E08780E08780E0878
        0E08780EFF00FFFF00FFFF00FF08780E76F9A755E38349DA7242D36837C8562A
        B94322B3371CB23016AF270FA81D0EA91B0DA21B08780EFF00FFFF00FF08780E
        76F9A776F9A776F9A776F9A776F9A776F9A72CBB4876F9A776F9A776F9A776F9
        A776F9A708780EFF00FFFF00FFFF00FF08780E08780E08780E08780E08780E76
        F9A73CCB5D08780E08780E08780E08780E08780EFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A749D97208780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
        F9A755E28208780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF08780E76F9A763F09708780EFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08780E76
        F9A776F9A708780EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF08780E08780EFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      UseSystemPaint = False
    end
  end
  object ErrorDataSet: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'SELECT ID_ERROR, ERROR_MESSAGE'
      ' FROM KERNEL_PROVS_ERRORS'
      ' WHERE KEY_SESSION=:KEY_SESSION'
      ' AND ID_PROV=?ID_PROV')
    Left = 304
    Top = 328
    poSQLINT64ToBCD = True
  end
  object WorkDataSet: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    Left = 336
    Top = 328
    poSQLINT64ToBCD = True
  end
  object OperProvDataSet: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'SELECT'
      #9'MAT_SP_OPER_PROV_SELECT.ID_PROV,'
      #9'MAT_SP_OPER_PROV_SELECT.ID_OPER,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_ID_SCH,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_NUMBER,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_TYPE,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_TYPE_OBJECT,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_OBJ_TYPE_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_TYPE_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_ID_SYSTEM,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_ID_SCH,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_NUMBER,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_TYPE,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_TYPE_OBJECT,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_OBJ_TYPE_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_TYPE_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_ID_SYSTEM,'
      #9'MAT_SP_OPER_PROV_SELECT.FORMULA,'
      #9'MAT_SP_OPER_PROV_SELECT.IS_EX_PROV,'
      #9'MAT_SP_OPER_PROV_SELECT.SUM_DB_PROV,'
      #9'MAT_SP_OPER_PROV_SELECT.SUM_KR_PROV,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_ID_MARK,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_ID_MARK'
      'FROM MAT_SP_OPER_PROV_SELECT(:ID_OPER)'
      'WHERE IS_EX_PROV=0')
    Left = 368
    Top = 360
    poSQLINT64ToBCD = True
  end
  object OperExProvDataSet: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'SELECT'
      #9'MAT_SP_OPER_PROV_SELECT.ID_PROV,'
      #9'MAT_SP_OPER_PROV_SELECT.ID_OPER,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_ID_SCH,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_NUMBER,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_TYPE,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_TYPE_OBJECT,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_OBJ_TYPE_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_SCH_TYPE_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_ID_SYSTEM,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_ID_SCH,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_NUMBER,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_TYPE,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_TYPE_OBJECT,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_OBJ_TYPE_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_SCH_TYPE_TITLE,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_ID_SYSTEM,'
      #9'MAT_SP_OPER_PROV_SELECT.FORMULA,'
      #9'MAT_SP_OPER_PROV_SELECT.IS_EX_PROV,'
      #9'MAT_SP_OPER_PROV_SELECT.SUM_DB_PROV,'
      #9'MAT_SP_OPER_PROV_SELECT.SUM_KR_PROV,'
      #9'MAT_SP_OPER_PROV_SELECT.DB_ID_MARK,'
      #9'MAT_SP_OPER_PROV_SELECT.KR_ID_MARK'
      'FROM MAT_SP_OPER_PROV_SELECT(:ID_OPER)'
      'WHERE IS_EX_PROV=1')
    Left = 368
    Top = 328
    poSQLINT64ToBCD = True
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = fmMainIvKartForm.DatabaseMain
    TimeoutAction = TARollback
    Left = 128
    Top = 224
  end
  object DocDataSet: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'SELECT * FROM MAT_INV_SEL_TO_PRINT(0)')
    Left = 192
    Top = 224
    poSQLINT64ToBCD = True
    object DocDataSetR_ID_KART: TFIBBCDField
      FieldName = 'R_ID_KART'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetTIP_KRT: TFIBStringField
      FieldName = 'TIP_KRT'
      Size = 6
      EmptyStrToNull = True
    end
    object DocDataSetGRP_NUM: TFIBStringField
      FieldName = 'GRP_NUM'
      Size = 5
      EmptyStrToNull = True
    end
    object DocDataSetINV_NUM: TFIBIntegerField
      FieldName = 'INV_NUM'
    end
    object DocDataSetKART_NUM: TFIBIntegerField
      FieldName = 'KART_NUM'
    end
    object DocDataSetBEG_PRICE: TFIBBCDField
      FieldName = 'BEG_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DocDataSetBEG_IZNOS: TFIBBCDField
      FieldName = 'BEG_IZNOS'
      Size = 4
      RoundByScale = True
    end
    object DocDataSetOST_PRICE: TFIBBCDField
      FieldName = 'OST_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DocDataSetOST_IZNOS: TFIBBCDField
      FieldName = 'OST_IZNOS'
      Size = 4
      RoundByScale = True
    end
    object DocDataSetDATE_OST: TFIBDateField
      FieldName = 'DATE_OST'
    end
    object DocDataSetDATE_OPR: TFIBDateField
      FieldName = 'DATE_OPR'
    end
    object DocDataSetID_OPER_OPR: TFIBBCDField
      FieldName = 'ID_OPER_OPR'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetDATE_EXPL: TFIBDateField
      FieldName = 'DATE_EXPL'
    end
    object DocDataSetID_OPER_EXPL: TFIBBCDField
      FieldName = 'ID_OPER_EXPL'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetDATE_UPDATE: TFIBDateField
      FieldName = 'DATE_UPDATE'
    end
    object DocDataSetID_OPER_UPDATE: TFIBBCDField
      FieldName = 'ID_OPER_UPDATE'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetDATE_OUT: TFIBDateField
      FieldName = 'DATE_OUT'
    end
    object DocDataSetID_OPER_OUT: TFIBBCDField
      FieldName = 'ID_OPER_OUT'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetZAV_NUM: TFIBStringField
      FieldName = 'ZAV_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object DocDataSetPASS_NUM: TFIBStringField
      FieldName = 'PASS_NUM'
      Size = 30
      EmptyStrToNull = True
    end
    object DocDataSetMODEL: TFIBStringField
      FieldName = 'MODEL'
      Size = 255
      EmptyStrToNull = True
    end
    object DocDataSetMARK: TFIBStringField
      FieldName = 'MARK'
      Size = 255
      EmptyStrToNull = True
    end
    object DocDataSetDATE_CREATE: TFIBDateField
      FieldName = 'DATE_CREATE'
    end
    object DocDataSetID_CUST: TFIBBCDField
      FieldName = 'ID_CUST'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetDOC_REG: TFIBStringField
      FieldName = 'DOC_REG'
      Size = 30
      EmptyStrToNull = True
    end
    object DocDataSetDATE_REG: TFIBDateField
      FieldName = 'DATE_REG'
    end
    object DocDataSetNOTE: TFIBStringField
      FieldName = 'NOTE'
      Size = 255
      EmptyStrToNull = True
    end
    object DocDataSetNAME_NORM: TFIBStringField
      FieldName = 'NAME_NORM'
      Size = 50
      EmptyStrToNull = True
    end
    object DocDataSetAMORT_PERC: TFIBFloatField
      FieldName = 'AMORT_PERC'
    end
    object DocDataSetMIN_PRICE: TFIBBCDField
      FieldName = 'MIN_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DocDataSetMETHOD_NAME: TFIBStringField
      FieldName = 'METHOD_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object DocDataSetNORM_TIP: TFIBSmallIntField
      FieldName = 'NORM_TIP'
    end
    object DocDataSetNORM_FORMULA: TFIBStringField
      FieldName = 'NORM_FORMULA'
      Size = 255
      EmptyStrToNull = True
    end
    object DocDataSetBUH_DB_SCH: TFIBBCDField
      FieldName = 'BUH_DB_SCH'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetBUH_KR_SCH: TFIBBCDField
      FieldName = 'BUH_KR_SCH'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetNORM_YEAR: TFIBSmallIntField
      FieldName = 'NORM_YEAR'
    end
    object DocDataSetNORM_MONTH: TFIBSmallIntField
      FieldName = 'NORM_MONTH'
    end
    object DocDataSetNORM_ID: TFIBBCDField
      FieldName = 'NORM_ID'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetNORM_PER_PERIOD: TFIBSmallIntField
      FieldName = 'NORM_PER_PERIOD'
    end
    object DocDataSetIS_NALOG_ACC: TFIBSmallIntField
      FieldName = 'IS_NALOG_ACC'
    end
    object DocDataSetNAL_NAME_NORM: TFIBStringField
      FieldName = 'NAL_NAME_NORM'
      Size = 50
      EmptyStrToNull = True
    end
    object DocDataSetNAL_AMORT_PERC: TFIBFloatField
      FieldName = 'NAL_AMORT_PERC'
    end
    object DocDataSetNAL_MIN_PRICE: TFIBBCDField
      FieldName = 'NAL_MIN_PRICE'
      Size = 4
      RoundByScale = True
    end
    object DocDataSetNAL_METHOD_NAME: TFIBStringField
      FieldName = 'NAL_METHOD_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object DocDataSetNAL_NORM_TIP: TFIBSmallIntField
      FieldName = 'NAL_NORM_TIP'
    end
    object DocDataSetNAL_NORM_FORMULA: TFIBStringField
      FieldName = 'NAL_NORM_FORMULA'
      Size = 255
      EmptyStrToNull = True
    end
    object DocDataSetNAL_DB_SCH: TFIBBCDField
      FieldName = 'NAL_DB_SCH'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetNAL_KR_SCH: TFIBBCDField
      FieldName = 'NAL_KR_SCH'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetNAL_NORM_YEAR: TFIBSmallIntField
      FieldName = 'NAL_NORM_YEAR'
    end
    object DocDataSetNAL_NORM_MONTH: TFIBSmallIntField
      FieldName = 'NAL_NORM_MONTH'
    end
    object DocDataSetNAL_NORM_ID: TFIBBCDField
      FieldName = 'NAL_NORM_ID'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetNAL_NORM_PER_PERIOD: TFIBSmallIntField
      FieldName = 'NAL_NORM_PER_PERIOD'
    end
    object DocDataSetID_BUH_DB: TFIBBCDField
      FieldName = 'ID_BUH_DB'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetID_BUH_KR: TFIBBCDField
      FieldName = 'ID_BUH_KR'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetID_NAL_DB: TFIBBCDField
      FieldName = 'ID_NAL_DB'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetID_NAL_KR: TFIBBCDField
      FieldName = 'ID_NAL_KR'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetID_METHD: TFIBBCDField
      FieldName = 'ID_METHD'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetID_METHD_NAL: TFIBBCDField
      FieldName = 'ID_METHD_NAL'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetMAIN_SCH_NUM: TFIBBCDField
      FieldName = 'MAIN_SCH_NUM'
      Size = 0
      RoundByScale = True
    end
    object DocDataSetFIO_MOL: TFIBStringField
      FieldName = 'FIO_MOL'
      Size = 68
      EmptyStrToNull = True
    end
    object DocDataSetMAIN_NOMN: TFIBStringField
      FieldName = 'MAIN_NOMN'
      Size = 50
      EmptyStrToNull = True
    end
    object DocDataSetDEPARTMENT: TFIBStringField
      FieldName = 'DEPARTMENT'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object StoredProc: TpFIBStoredProc
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = WriteTransaction
    Left = 160
    Top = 224
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Debet'
        DataType = ftVariant
      end
      item
        Name = 'Kredit'
        DataType = ftVariant
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'id_debet'
        DataType = ftBCD
        Size = 10
      end
      item
        Name = 'id_kredit'
        DataType = ftBCD
        Size = 10
      end>
    Left = 128
    Top = 255
    object RxMemoryData1Debet: TVariantField
      FieldName = 'Debet'
    end
    object RxMemoryData1Kredit: TVariantField
      FieldName = 'Kredit'
    end
    object RxMemoryData1Summa: TCurrencyField
      FieldName = 'Summa'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      currency = False
    end
    object RxMemoryData1id_debet: TVariantField
      FieldName = 'id_debet'
    end
    object RxMemoryData1id_kredit: TVariantField
      FieldName = 'id_kredit'
    end
    object RxMemoryData1db_id_sm: TIntegerField
      DisplayWidth = 15
      FieldName = 'db_id_sm'
    end
    object RxMemoryData1db_sm: TStringField
      Alignment = taRightJustify
      FieldName = 'db_sm'
    end
    object RxMemoryData1db_id_rz: TIntegerField
      FieldName = 'db_id_rz'
    end
    object RxMemoryData1db_rz: TStringField
      Alignment = taRightJustify
      FieldName = 'db_rz'
    end
    object RxMemoryData1db_id_st: TIntegerField
      FieldName = 'db_id_st'
    end
    object RxMemoryData1db_st: TStringField
      Alignment = taRightJustify
      FieldName = 'db_st'
    end
    object RxMemoryData1db_id_kekv: TIntegerField
      FieldName = 'db_id_kekv'
    end
    object RxMemoryData1db_kekv: TStringField
      Alignment = taRightJustify
      FieldName = 'db_kekv'
    end
    object RxMemoryData1kr_sm: TStringField
      FieldName = 'kr_sm'
    end
    object RxMemoryData1kr_rz: TStringField
      FieldName = 'kr_rz'
    end
    object RxMemoryData1kr_st: TStringField
      FieldName = 'kr_st'
    end
    object RxMemoryData1kr_kekv: TStringField
      FieldName = 'kr_kekv'
    end
    object RxMemoryData1kr_id_sm: TIntegerField
      FieldName = 'kr_id_sm'
    end
    object RxMemoryData1kr_id_rz: TIntegerField
      FieldName = 'kr_id_rz'
    end
    object RxMemoryData1kr_id_st: TIntegerField
      FieldName = 'kr_id_st'
    end
    object RxMemoryData1kr_id_kekv: TIntegerField
      FieldName = 'kr_id_kekv'
    end
    object RxMemoryData1id_doc: TIntegerField
      FieldName = 'id_doc'
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 192
    Top = 255
  end
  object ActionList1: TActionList
    Left = 392
    Top = 239
    object ActionDel: TAction
      Caption = 'ActionDel'
      ShortCut = 16430
      OnExecute = ActionDelExecute
    end
    object ActionChange: TAction
      Caption = 'ActionChange'
      ShortCut = 113
      OnExecute = ActionChangeExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
    object Action_add_new_prov: TAction
      Caption = 'Action_add_new_prov'
      ShortCut = 45
      OnExecute = Action_add_new_provExecute
    end
    object PushEnter: TAction
      Caption = 'PushEnter'
      ShortCut = 13
      OnExecute = PushEnterExecute
    end
    object ActionClose: TAction
      Caption = 'ActionClose'
      OnExecute = ActionCloseExecute
    end
    object ActionCalculate: TAction
      Caption = 'ActionCalculate'
      OnExecute = ActionCalculateExecute
    end
  end
  object pFIBDataSetSel_sch: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_SCH (201)')
    Left = 400
    Top = 328
    poSQLINT64ToBCD = True
    object pFIBDataSetSel_schID_SCH: TFIBBCDField
      FieldName = 'ID_SCH'
      Size = 0
      RoundByScale = True
    end
  end
  object DataSetGridWatch: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_FOR_PEREOCENKA('#39#39#39'1'#39#39#39')')
    AfterScroll = DataSetGridWatchAfterScroll
    Left = 232
    Top = 328
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceOpen = True
    object DataSetGridWatchID_MO: TFIBBCDField
      FieldName = 'ID_MO'
      Size = 0
      RoundByScale = True
    end
    object DataSetGridWatchFIO_MOL: TFIBStringField
      FieldName = 'FIO_MOL'
      Size = 68
      EmptyStrToNull = True
    end
    object DataSetGridWatchNAME_KART: TFIBStringField
      FieldName = 'NAME_KART'
      Size = 100
      EmptyStrToNull = True
    end
    object DataSetGridWatchID_NOMNS: TFIBBCDField
      FieldName = 'ID_NOMNS'
      Size = 0
      RoundByScale = True
    end
    object DataSetGridWatchNUM_SCH: TFIBStringField
      FieldName = 'NUM_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object DataSetGridWatchID_SCHS: TFIBBCDField
      FieldName = 'ID_SCHS'
      Size = 0
      RoundByScale = True
    end
    object DataSetGridWatchOST_PRICE: TFIBBCDField
      FieldName = 'OST_PRICE'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 4
      RoundByScale = True
    end
    object DataSetGridWatchOST_IZNOS: TFIBBCDField
      FieldName = 'OST_IZNOS'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 4
      RoundByScale = True
    end
    object DataSetGridWatchFULL_INV: TFIBStringField
      FieldName = 'FULL_INV'
      Size = 10
      EmptyStrToNull = True
    end
    object DataSetGridWatchSUMMA_OPER: TFIBBCDField
      FieldName = 'SUMMA_OPER'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 4
      RoundByScale = True
    end
    object DataSetGridWatchID_KART: TFIBBCDField
      FieldName = 'ID_KART'
      Size = 0
      RoundByScale = True
    end
    object DataSetGridWatchNUM_DOG: TFIBStringField
      FieldName = 'NUM_DOG'
      Size = 10
      EmptyStrToNull = True
    end
  end
  object DataSourceContek: TDataSource
    DataSet = DataSetGridWatch
    Left = 232
    Top = 360
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 232
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
      Font.Color = clGreen
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
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15204351
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object ForHaeder: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object AfterSelection: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle16
      Styles.ContentEven = cxStyle17
      Styles.ContentOdd = cxStyle18
      Styles.Inactive = cxStyle24
      Styles.IncSearch = cxStyle25
      Styles.Selection = cxStyle28
      Styles.FilterBox = cxStyle19
      Styles.Footer = cxStyle20
      Styles.Group = cxStyle21
      Styles.GroupByBox = cxStyle22
      Styles.Header = cxStyle23
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      BuiltIn = True
    end
  end
  object pFIBDataSetMegaSel: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    DataSource = DataSourceContek
    Left = 264
    Top = 360
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
    dcIgnoreMasterClose = True
  end
  object pFIBDatabaseResurs: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    SaveDBParams = False
    WaitForRestoreConnect = 0
    Left = 24
    Top = 232
  end
  object RxMemoryData2: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Debet'
        DataType = ftVariant
      end
      item
        Name = 'Kredit'
        DataType = ftVariant
      end
      item
        Name = 'Summa'
        DataType = ftFloat
      end
      item
        Name = 'id_debet'
        DataType = ftBCD
        Size = 10
      end
      item
        Name = 'id_kredit'
        DataType = ftBCD
        Size = 10
      end>
    Left = 144
    Top = 335
    object VariantField1: TVariantField
      FieldName = 'Debet'
    end
    object VariantField2: TVariantField
      FieldName = 'Kredit'
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'Summa'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      currency = False
    end
    object VariantField3: TVariantField
      FieldName = 'id_debet'
    end
    object VariantField4: TVariantField
      FieldName = 'id_kredit'
    end
    object IntegerField1: TIntegerField
      DisplayWidth = 15
      FieldName = 'db_id_sm'
    end
    object StringField1: TStringField
      Alignment = taRightJustify
      FieldName = 'db_sm'
    end
    object IntegerField2: TIntegerField
      FieldName = 'db_id_rz'
    end
    object StringField2: TStringField
      Alignment = taRightJustify
      FieldName = 'db_rz'
    end
    object IntegerField3: TIntegerField
      FieldName = 'db_id_st'
    end
    object StringField3: TStringField
      Alignment = taRightJustify
      FieldName = 'db_st'
    end
    object IntegerField4: TIntegerField
      FieldName = 'db_id_kekv'
    end
    object StringField4: TStringField
      Alignment = taRightJustify
      FieldName = 'db_kekv'
    end
    object StringField5: TStringField
      FieldName = 'kr_sm'
    end
    object StringField6: TStringField
      FieldName = 'kr_rz'
    end
    object StringField7: TStringField
      FieldName = 'kr_st'
    end
    object StringField8: TStringField
      FieldName = 'kr_kekv'
    end
    object IntegerField5: TIntegerField
      FieldName = 'kr_id_sm'
    end
    object IntegerField6: TIntegerField
      FieldName = 'kr_id_rz'
    end
    object IntegerField7: TIntegerField
      FieldName = 'kr_id_st'
    end
    object IntegerField8: TIntegerField
      FieldName = 'kr_id_kekv'
    end
    object IntegerField9: TIntegerField
      FieldName = 'id_doc'
    end
  end
  object DataSourceProv: TDataSource
    DataSet = pFIBDataSetProvInfo
    Left = 178
    Top = 333
  end
  object pFIBDataSetProvInfo: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    SelectSQL.Strings = (
      'select * from MAT_INV_SEL_BUFF_PROV(3719999)')
    Left = 114
    Top = 333
    poSQLINT64ToBCD = True
    object pFIBDataSetProvInfoDB_ID_SCH: TFIBBCDField
      FieldName = 'DB_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetProvInfoKR_ID_SCH: TFIBBCDField
      FieldName = 'KR_ID_SCH'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetProvInfoDB_ID_SM: TFIBBCDField
      FieldName = 'DB_ID_SM'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetProvInfoDB_ID_RZ: TFIBBCDField
      FieldName = 'DB_ID_RZ'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetProvInfoDB_ID_ST: TFIBBCDField
      FieldName = 'DB_ID_ST'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetProvInfoDB_ID_KEKV: TFIBBCDField
      FieldName = 'DB_ID_KEKV'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetProvInfoSUMMA: TFIBBCDField
      FieldName = 'SUMMA'
      DisplayFormat = '#,##0.00'
      EditFormat = '0.00'
      Size = 4
      RoundByScale = True
    end
    object pFIBDataSetProvInfoID_PROV: TFIBBCDField
      FieldName = 'ID_PROV'
      Size = 0
      RoundByScale = True
    end
    object pFIBDataSetProvInfoSM: TFIBStringField
      FieldName = 'SM'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetProvInfoRZ: TFIBStringField
      FieldName = 'RZ'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetProvInfoST: TFIBStringField
      FieldName = 'ST'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetProvInfoKEKV: TFIBStringField
      FieldName = 'KEKV'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetProvInfoDB_SCH: TFIBStringField
      FieldName = 'DB_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetProvInfoKR_SCH: TFIBStringField
      FieldName = 'KR_SCH'
      Size = 30
      EmptyStrToNull = True
    end
    object pFIBDataSetProvInfoFLAG: TFIBIntegerField
      FieldName = 'FLAG'
    end
  end
  object DSAllMOL: TpFIBDataSet
    Database = fmMainIvKartForm.DatabaseMain
    Transaction = fmMainIvKartForm.TransactionRead
    Left = 232
    Top = 400
    poSQLINT64ToBCD = True
  end
end
