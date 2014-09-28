object frmImportStatistics: TfrmImportStatistics
  Left = 124
  Top = 113
  Width = 969
  Height = 649
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1110#1084#1087#1086#1088#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxGrid
    Left = 0
    Top = 73
    Width = 961
    Height = 416
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object GridDBBandedTableView1: TcxGridDBBandedTableView
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = GridDBBandedTableView1CODE
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = dm.GridBandedTableViewStyleSheetDevExpress
      Bands = <
        item
          Caption = #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
          Width = 782
        end
        item
          Caption = 'I'
          Options.Sizing = False
          Width = 60
        end
        item
          Caption = 'II'
          Options.Sizing = False
          Width = 60
        end
        item
          Caption = 'III'
          Options.Sizing = False
          Width = 60
        end
        item
          Caption = 'IV'
          Options.Sizing = False
          Width = 60
        end>
      object GridDBBandedTableView1ID_ORGANIZATION: TcxGridDBBandedColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'ID_ORGANIZATION'
      end
      object GridDBBandedTableView1NAME_ORGANIZATION: TcxGridDBBandedColumn
        Caption = #1053#1072#1079#1074#1072' ('#1089#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072') - '#1045#1044#1056#1055#1054#1059
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        OnCustomDrawCell = GridDBBandedTableView1NAME_ORGANIZATIONCustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 328
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'NAME_ORGANIZATION'
      end
      object GridDBBandedTableView1SHORT_NAME: TcxGridDBBandedColumn
        Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'SHORT_NAME'
      end
      object GridDBBandedTableView1CODE: TcxGridDBBandedColumn
        Caption = #1050#1086#1076
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 47
        Options.HorzSizing = False
        Options.VertSizing = False
        SortOrder = soAscending
        Width = 47
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'CODE'
      end
      object GridDBBandedTableView1MONTH1: TcxGridDBBandedColumn
        Caption = '1'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH1'
      end
      object GridDBBandedTableView1MONTH2: TcxGridDBBandedColumn
        Caption = '2'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH2'
      end
      object GridDBBandedTableView1MONTH3: TcxGridDBBandedColumn
        Caption = '3'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH3'
      end
      object GridDBBandedTableView1MONTH4: TcxGridDBBandedColumn
        Caption = '4'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH4'
      end
      object GridDBBandedTableView1MONTH5: TcxGridDBBandedColumn
        Caption = '5'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH5'
      end
      object GridDBBandedTableView1MONTH6: TcxGridDBBandedColumn
        Caption = '6'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH6'
      end
      object GridDBBandedTableView1MONTH7: TcxGridDBBandedColumn
        Caption = '7'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH7'
      end
      object GridDBBandedTableView1MONTH8: TcxGridDBBandedColumn
        Caption = '8'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH8'
      end
      object GridDBBandedTableView1MONTH9: TcxGridDBBandedColumn
        Caption = '9'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH9'
      end
      object GridDBBandedTableView1MONTH10: TcxGridDBBandedColumn
        Caption = '10'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH10'
      end
      object GridDBBandedTableView1MONTH11: TcxGridDBBandedColumn
        Caption = '11'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH11'
      end
      object GridDBBandedTableView1MONTH12: TcxGridDBBandedColumn
        Caption = '12'
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.VertSizing = False
        Width = 20
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'MONTH12'
      end
      object GridDBBandedTableView1NAME_TYPE_ORG: TcxGridDBBandedColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
        DataBinding.FieldName = 'NAME_TYPE_ORG'
      end
      object GridDBBandedTableView1KV1: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 60
        Options.HorzSizing = False
        Options.VertSizing = False
        Width = 60
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'KV1'
        IsCaptionAssigned = True
      end
      object GridDBBandedTableView1KV2: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 60
        Options.HorzSizing = False
        Options.VertSizing = False
        Width = 60
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'KV2'
        IsCaptionAssigned = True
      end
      object GridDBBandedTableView1KV3: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 60
        Options.HorzSizing = False
        Options.VertSizing = False
        Width = 60
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'KV3'
        IsCaptionAssigned = True
      end
      object GridDBBandedTableView1KV4: TcxGridDBBandedColumn
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBBandedTableView1MONTH1CustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 60
        Options.HorzSizing = False
        Options.VertSizing = False
        Width = 60
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 1
        DataBinding.FieldName = 'KV4'
        IsCaptionAssigned = True
      end
      object GridDBBandedTableView1ID_TYPE_ORG: TcxGridDBBandedColumn
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
        DataBinding.FieldName = 'ID_TYPE_ORG'
      end
      object GridDBBandedTableView1EDRPOU: TcxGridDBBandedColumn
        Caption = #1045#1044#1056#1055#1054#1059
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 90
        Options.HorzSizing = False
        Options.VertSizing = False
        Width = 90
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.LineCount = 2
        Position.RowIndex = 0
        DataBinding.FieldName = 'EDRPOU'
      end
    end
    object GridLevel1: TcxGridLevel
      GridView = GridDBBandedTableView1
    end
  end
  object DBChart1: TDBChart
    Left = 296
    Top = 424
    Width = 410
    Height = 218
    BackWall.Brush.Color = clWhite
    BottomWall.Color = 16776176
    BottomWall.Size = 10
    LeftWall.Color = 13746349
    Title.Text.Strings = (
      #1057#1090#1080#1090#1080#1089#1090#1080#1082#1072' '#1087#1086#1084#1080#1083#1086#1082)
    BottomAxis.ExactDateTime = False
    BottomAxis.LabelsAngle = 90
    BottomAxis.TickInnerLength = 1
    BottomAxis.Title.Angle = 180
    Legend.Visible = False
    View3DOptions.Elevation = 338
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 1
    Visible = False
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.BackColor = 16763283
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = dsStatistics
      SeriesColor = 16744448
      ShowInLegend = False
      Title = #1042#1089#1077#1075#1086' '#1086#1096#1080#1073#1086#1082
      XLabelsSource = 'NAME_ORGANIZATION'
      BarStyle = bsRectGradient
      BarWidthPercent = 100
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      XValues.ValueSource = 'BAR'
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'ERRORS'
    end
  end
  object cxButton2: TcxButton
    Left = 376
    Top = 240
    Width = 145
    Height = 29
    Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086#1084#1080#1083#1086#1082
    TabOrder = 2
    Visible = False
    Colors.Default = 16776176
    Colors.Normal = 16776176
    Colors.Pressed = 7972351
    Glyph.Data = {
      DA040000424DDA040000000000009A0200002800000018000000180000000100
      08000000000040020000120B0000120B000099000000990000000D0A6C00362C
      4300FF00FF00FBE9EA00BD4B4C00C5515200FF818200F6848600F7979800AB58
      5800914B4B008C4B4A00824B4B009F4A4800AA68600069484200FFF6F4009635
      1100FFFCFB0064544B00FFFCFA00BD580C00D5CEC900FFF8F300FFF4EB00E97F
      1E004F41340056493D0050484100685E5500FBAF66005847370065534100FED7
      AF004F433700FEDAB500C6B6A6005B554F00625D5800FFF4E900FFFBF700FECB
      9600C6A07500FECC9700FECC9800FECE9A00FECF9C00FECF9D00FECF9E00FED0
      A000FED1A000FED1A1004F413200FFD3A500FED3A400FED4A600FED4A7005043
      3500FFD7AA00FED5A900FFD7AB00FED7AC00FED8AF00FED9B000FFDAB200FEDA
      B40050453900FFDCB700FFDEBA0097836E00FEDDBA00FFE0BF00EFD3B400FEE1
      C1004F463C00FFE2C400FEE2C400FEE3C6004F473E00FFE5C900FEE5C900FFE6
      CB00FEE6CB00FFE7CE00FFEAD300FFEBD500FFEFDD00FFEFDE00FFF0E000FFF3
      E600FFF7EE005B4A36004F4130004F4131005B4F4100FEE0BC00FEE1C000FEE9
      D000FEEAD300504A4300FFEDD800FFEEDA00FEEFDD00FFF2E200FFF2E300FFF3
      E500A39D9600FFF8F000FEEEDA00FFFCF800FEFBF700FFFEFC00FFFFFE003D57
      3A00008100000A6C0A000288050052C970001EBC4C0000662800016C2D001EC0
      7F001F6758001CFFFF0056FFFF0048CCCC00EAFFFF00689CA30000CEEE0000D1
      FF001F819C0000C5FF001E88AA0000BDFF001184AB00009FDE001E739F004D57
      6000315EFF003B67FE006687FC003553C7004F68E100001EFF000824E6000924
      D4003344B8000014DE000000820003069100FFFFFF00DCDCDC00000000000202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202021111111111111111111111111111111111111111111111021156
      6462534F4C4746233F3D3B36312F2D2C292929291102116958655561514D605F
      4341213A37201F5D5B2A292911021118596766645453504B48455E1B92919300
      015C2B291102116B5A2768586C241D130E0D0B0F8F8F939494342E2C1102116E
      17166A267F82868904040A0C8F8F9394941A3230110211126D71737A85858788
      04040A0C8F8F939494393533110211966F7272778585878804040A0C8F8F9394
      94223C3811021196967272778585878804040A0C8F8F93949442403E11021196
      967274788585878804040A0C8F8F9394944A4423110211969675767983818084
      04040A0C8F8F9394944E495F110211969696967E7C7B7B7D0405090C8F8F9394
      941C4F4C110211969696969696969603080606078F8F93949463615211021196
      9696969696969696961014288F8F909594256454110211969696969696969696
      969670128C8B8A8A8E68576C1102119797979797979797979797979797979797
      9797979711021111111111111111111111111111111111111111111111021519
      19191919191919191919191919191E191E198D19150202151515151515151515
      1515151515151515151515150202020202020202020202020202020202020202
      020202020202020202020202020202020202020202020202020202020202}
    UseSystemPaint = False
  end
  object cxButton3: TcxButton
    Left = 376
    Top = 208
    Width = 145
    Height = 29
    Caption = #1057#1090#1072#1085#1076#1072#1088#1090#1085#1080#1081' '#1088#1077#1078#1080#1084
    TabOrder = 3
    Visible = False
    Colors.Default = 16776176
    Colors.Normal = 16776176
    Colors.Pressed = 7972351
    Glyph.Data = {
      62040000424D6204000000000000220200002800000018000000180000000100
      08000000000040020000120B0000120B00007B0000007B00000000000000FFFF
      FF00FF00FF00FFFEFE00811E0000BD4C0000FFFCFA00FFF8F300FFFBF800D964
      0100FFFAF600FFEFE000FFF0E300FFF4EA00FFF7F000FFF8F200FECB9700FECC
      9900FED1A300FED1A400FFD5AA00FED5AB00FFD9B200FFDAB500FEDAB600FFDD
      BA00FFDEBC00FEDEBD00FFE7CF00FFEAD500FFEBD700FFF2E500FFF3E700FFF4
      E900FFF6ED00FFF7EF00FFFBF700FECB9600FECC9700FECC9800FECE9900FECE
      9C00FECF9D00FECF9E00FED09E00FED09F00FED0A000FED1A100FFD4A600FFD5
      A700FED4A700FED5A900FFD7AD00FED7AD00FFD8AF00FED8AF00FFD9B100FED8
      B000FFDCB500FFDCB700FFDDB700FEDCB600FEDCB700FEDDBA00FFE0BD00FEDE
      BC00FEE0BF00FEE0C000FEE1C100FFE2C400FFE3C500FEE2C400FEE5C900FEE5
      CA00FEE6CC00FFE7CE00FEE7CE00FFE9D100FFEAD300FFEBD500FEEBD700FFED
      D900FFEEDC00FFEFDD00FFEFDE00FFF0E000FFF3E600FFF7EE00FEF6ED00FEE0
      BD00FFE1BF00FEE1C000FEE2C200FEE3C400FEE5C600FEE5C700FFE7CB00FEE7
      CC00FFE9D000FEEBD400FEEDD900FEF0E000FFF2E300FEF3E600FFF6EB00FFF8
      F000FFFAF400FEEAD100FEEEDA00FEEFDC00FEF3E500FEF4E700FFF6EA00FFF7
      ED00FFFBF600FFFCF800FFFAF300FFFBF400FFFCF700FFFEFC00FFFEFB00FFFE
      FA00FFFFFE000202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020205050505050505050505
      0505050505050505050505050505052256544F4C04593D36312F042725252525
      0425252525050575576F0B50045E423E3933042B112525250425252525050506
      6A2320550462485B3C3804132B11252504252525250505017872232104514D49
      443F0415132D2810042525252505050404040404040404040404040404040404
      0404040404050501010177240468666D4E60041A1735302E0426252525050501
      0101017A040F586E531D045D403A343204292725250505010101010104736A57
      5654044C461B1837042F2A272705050101010101047A066A576704501C5F5A3B
      0414122C2C0505010101010104017A790A23046564625F430439331212050504
      0404040404040404040404040404040404040404040505010101010104010101
      0178040E0D0C6C6B045C19161605050101010101040101010101047669706652
      044A47414105050101010101040101010101047A0807681F0463614545050501
      0101010104010101010104010308747104541E4B4B0505090909090909090909
      0909090909090909090909090905050505050505050505050505050505050505
      0505050505050505050505050505050505050505050505050505050505050202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      020202020202}
    UseSystemPaint = False
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 80
    Top = 48
    Width = 113
    Height = 21
    TabStop = False
    Properties.DropDownListStyle = lsFixedList
    Properties.GridMode = True
    Properties.IncrementalFiltering = False
    Properties.KeyFieldNames = 'ID_TYPE_ORG'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_TYPE_ORG'
      end>
    Properties.ListOptions.ColumnSorting = False
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dscTypeOrg
    Properties.OnCloseUp = cxLookupComboBox1PropertiesCloseUp
    TabOrder = 4
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 497
    Width = 961
    Height = 125
    Align = alBottom
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object GridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource2
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0'
          Kind = skSum
          Position = spFooter
          FieldName = 'IS_ERROR'
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          FieldName = 'IS_ERROR'
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Styles.StyleSheet = dm.GridTableViewStyleSheetDevExpress
      object GridDBTableView1IS_ERROR: TcxGridDBColumn
        Caption = #1055
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBTableView1IS_ERRORCustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.HorzSizing = False
        Options.Moving = False
        Width = 20
        DataBinding.FieldName = 'IS_ERROR'
      end
      object GridDBTableView1IS_KVARTAL: TcxGridDBColumn
        Caption = #1050#1074
        PropertiesClassName = 'TcxImageProperties'
        OnCustomDrawCell = GridDBTableView1IS_KVARTALCustomDrawCell
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.HorzSizing = False
        Options.Moving = False
        Width = 20
        DataBinding.FieldName = 'IS_KVARTAL'
      end
      object GridDBTableView1IMPORT_DATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        SortOrder = soAscending
        Width = 114
        DataBinding.FieldName = 'IMPORT_DATE'
      end
      object GridDBTableView1FILE_NAME: TcxGridDBColumn
        Caption = #1060#1072#1081#1083
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 382
        DataBinding.FieldName = 'FILE_NAME'
      end
      object GridDBTableView1FULL_NAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 175
        DataBinding.FieldName = 'FULL_NAME'
      end
      object GridDBTableView1ID_LOG: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_LOG'
      end
      object GridDBTableView1ID_USER: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_USER'
      end
      object GridDBTableView1COMP_NAME: TcxGridDBColumn
        Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 76
        DataBinding.FieldName = 'COMP_NAME'
      end
      object GridDBTableView1COMP_IP: TcxGridDBColumn
        Caption = 'IP'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 61
        DataBinding.FieldName = 'COMP_IP'
      end
      object GridDBTableView1NOTE: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 164
        DataBinding.FieldName = 'NOTE'
      end
      object GridDBTableView1DATE_DATA: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'DATE_DATA'
      end
      object GridDBTableView1ID_ORGANIZATION: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_ORGANIZATION'
      end
      object GridDBTableView1KVARTAL_NUM: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        DataBinding.FieldName = 'KVARTAL_NUM'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = GridDBTableView1
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 489
    Width = 961
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 100
    AlignSplitter = salBottom
    Control = cxGrid1
  end
  object Panel1: TPanel
    Left = 0
    Top = 51
    Width = 961
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    TabOrder = 11
    object SpeedButton1: TSpeedButton
      Tag = 1
      Left = 40
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Down = True
      Caption = '1'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Tag = 2
      Left = 64
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 2
      Down = True
      Caption = '2'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Tag = 3
      Left = 88
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 4
      Down = True
      Caption = '3'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton4: TSpeedButton
      Tag = 4
      Left = 112
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 3
      Down = True
      Caption = '4'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton5: TSpeedButton
      Tag = 5
      Left = 136
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 6
      Down = True
      Caption = '5'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton6: TSpeedButton
      Tag = 6
      Left = 160
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 5
      Down = True
      Caption = '6'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton7: TSpeedButton
      Tag = 7
      Left = 184
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 7
      Down = True
      Caption = '7'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton8: TSpeedButton
      Tag = 8
      Left = 208
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 8
      Down = True
      Caption = '8'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton9: TSpeedButton
      Tag = 9
      Left = 232
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 9
      Down = True
      Caption = '9'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton10: TSpeedButton
      Tag = 10
      Left = 256
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 10
      Down = True
      Caption = '10'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton11: TSpeedButton
      Tag = 11
      Left = 280
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 11
      Down = True
      Caption = '11'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton12: TSpeedButton
      Tag = 12
      Left = 304
      Top = 0
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 12
      Down = True
      Caption = '12'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton13: TSpeedButton
      Tag = 12
      Left = 408
      Top = 0
      Width = 23
      Height = 22
      Caption = 'I'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton13Click
    end
    object SpeedButton14: TSpeedButton
      Tag = 12
      Left = 432
      Top = 0
      Width = 23
      Height = 22
      Caption = 'II'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton14Click
    end
    object SpeedButton15: TSpeedButton
      Tag = 12
      Left = 456
      Top = 0
      Width = 23
      Height = 22
      Caption = 'III'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton15Click
    end
    object SpeedButton16: TSpeedButton
      Tag = 12
      Left = 480
      Top = 0
      Width = 23
      Height = 22
      Caption = 'IV'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton16Click
    end
    object SpeedButton17: TSpeedButton
      Tag = 12
      Left = 504
      Top = 0
      Width = 23
      Height = 22
      Caption = #1042#1057#1030
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton17Click
    end
    object cxLabel1: TcxLabel
      Left = 2
      Top = 3
      Width = 39
      Height = 17
      TabOrder = 0
      Caption = #1052#1110#1089#1103#1094#1110
    end
    object cxLabel2: TcxLabel
      Left = 354
      Top = 3
      Width = 50
      Height = 17
      TabOrder = 1
      Caption = #1050#1074#1072#1088#1090#1072#1083
    end
  end
  object dxBarManager1: TdxBarManager
    AlwaysMerge = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        Caption = #1055#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 278
        FloatTop = 286
        FloatClientWidth = 66
        FloatClientHeight = 220
        ItemLinks = <
          item
            Item = dxBarButton2
            Visible = True
          end
          item
            Item = seYear
            Visible = True
          end
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = ePrg
            UserDefine = [udWidth]
            UserWidth = 59
            Visible = True
          end
          item
            Item = dxBarButton5
            Visible = True
          end
          item
            Item = dxBarControlContainerItem1
            Visible = True
          end
          item
            Item = eCode
            Visible = True
          end
          item
            Item = dxBarButton3
            Visible = True
          end
          item
            Item = eName
            Visible = True
          end
          item
            Item = dxBarButton4
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            Item = RefreshButton
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            Item = ExitButton
            Visible = True
          end>
        Name = #1055#1072#1085#1077#1083#1100' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    ButtonArrowWidth = 13
    CanCustomize = False
    Categories.Strings = (
      #1057#1090#1072#1085#1076#1072#1088#1090#1085#1099#1077' '#1076#1077#1081#1089#1090#1074#1080#1103)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = LargeImages
    LookAndFeel.Kind = lfUltraFlat
    NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
    PopupMenuLinks = <>
    StretchGlyphs = False
    Style = bmsOffice11
    UseSystemFont = True
    Left = 288
    Top = 136
    DockControlHeights = (
      0
      0
      51
      0)
    object RefreshButton: TdxBarLargeButton
      Caption = #1042#1110#1076#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1080' '#1076#1072#1085#1110' '#1090#1072#1073#1083#1080#1094#1110' (F5)'
      Visible = ivAlways
      ImageIndex = 3
      OnClick = RefreshButtonClick
      AutoGrayScale = False
    end
    object ExitButton: TdxBarLargeButton
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Category = 0
      Hint = #1047#1072#1082#1088#1080#1090#1080' (ESC)'
      Visible = ivAlways
      ImageIndex = 5
      OnClick = ExitButtonClick
      AutoGrayScale = False
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'Container Type org'
      Category = 0
      Hint = 'Container Type org'
      Visible = ivNever
      Control = cxLookupComboBox1
    end
    object seYear: TdxBarEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Text = '2007'
      OnCurChange = seYearCurChange
      OnExit = seYearExit
      OnKeyPress = seYearKeyPress
      MaxLength = 4
      Width = 40
    end
    object dxBarButton1: TdxBarButton
      Caption = '>'
      Category = 0
      Hint = '>'
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = '<'
      Category = 0
      Hint = '<'
      Visible = ivAlways
      OnClick = dxBarButton2Click
    end
    object eCode: TdxBarEdit
      Caption = #1050#1086#1076
      Category = 0
      Hint = #1050#1086#1076
      Visible = ivAlways
      OnCurChange = eCodeCurChange
      OnExit = eCodeExit
      OnKeyPress = eCodeKeyPress
      MaxLength = 3
      ShowCaption = True
      Width = 40
    end
    object dxBarButton3: TdxBarButton
      Caption = 'X'
      Category = 0
      Hint = 'X'
      Visible = ivAlways
      OnClick = dxBarButton3Click
    end
    object eName: TdxBarEdit
      Caption = #1053#1072#1079#1074#1072
      Category = 0
      Hint = #1053#1072#1079#1074#1072
      Visible = ivAlways
      OnCurChange = eNameCurChange
      OnExit = eCodeExit
      OnKeyPress = eCodeKeyPress
      MaxLength = 160
      ShowCaption = True
      Width = 200
    end
    object dxBarButton4: TdxBarButton
      Caption = 'X'
      Category = 0
      Hint = 'X'
      Visible = ivAlways
      OnClick = dxBarButton4Click
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = #1047#1074#1110#1090
      Category = 0
      Hint = #1047#1074#1110#1090
      Visible = ivAlways
      ImageIndex = 13
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1087#1080#1089#1100#1084#1086
      Category = 0
      Hint = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1087#1080#1089#1100#1084#1086
      Visible = ivAlways
      ImageIndex = 13
      OnClick = dxBarLargeButton2Click
      AutoGrayScale = False
    end
    object ePrg: TdxBarEdit
      Caption = #1055#1088#1086#1075#1088#1072#1084#1072
      Category = 0
      Hint = #1055#1088#1086#1075#1088#1072#1084#1072
      Visible = ivAlways
      OnCurChange = ePrgCurChange
      OnExit = RefreshButtonClick
      OnKeyPress = eCodeKeyPress
      MaxLength = 6
      ShowCaption = True
      Width = 100
    end
    object dxBarButton5: TdxBarButton
      Caption = 'X'
      Category = 0
      Hint = 'X'
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
  end
  object DataSet: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'select * from MON_IMPORT_LOG_SEL_MONTH(:ID_TYPE_ORG, :ACTUAL_YEA' +
        'R, 1, 12, :IN_CODE, :IN_NAME, :IN_PROGRAM)')
    Left = 8
    Top = 112
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 40
    Top = 112
  end
  object pFIBDatabase1: TpFIBDatabase
    DBName = 'D:\Projects\monudb\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=sysdba')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 320
    Top = 136
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 288
    Top = 168
  end
  object LargeImages: TImageList
    Height = 24
    Width = 24
    Left = 352
    Top = 136
    Bitmap = {
      494C010114001800040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000090000000010020000000000000D8
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
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008731000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000005200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7CE00EFE7
      CE00EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600A5636B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000873100008731000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000052000000000000000000000000000000000000000000000000
      0000000000000000000000520000006300000052000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7CE00EFDECE00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600EFDEC600EFDE
      C600A5636B0000000000000000000000000094635A00BD8C7B00BD8C7B00BD8C
      7B00BD8C7B00BD8C7300BD8C7300BD8C7300BD8C7300BD8C7300C68C7300BD84
      6B000873100029BD520008731000AD846300C6847B009C636B00000000000000
      000000000000000000000000000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000520000006300000052000000000000000000000000000000639C000063
      9C0000639C0000520000006B000000940800006B0000004A1000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFE7D600EFE7CE00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400EFDEC600EFDE
      C600A5636B000000000000000000000000009C6B6300F7DEB500FFE7BD00FFDE
      AD00FFD6A500FFD69C00FFD69C00FFD69400FFD68C00FFD68C00EFBD84000873
      100021A539004AE7840008731000087310000873100008731000000000000000
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000031
      FF000031FF000000000000000000000000000000000000000000000000000052
      0000006B000000940800006B0000004A10000063A500088CBD000073AD00006B
      9C000052000000630000088C100000940800008C0800005A0000006339000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00F7E7D600F7E7D600EFE7CE00EFE7CE00EFDECE00EFDECE00EFDEC600EFDE
      C600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600A5636B000000000000000000000000009C6B6300F7DEBD00FFE7BD00FFDE
      B500FFDEAD00FFDEA500F7C69C00B59494008C73A5008C737B000873100029B5
      52004AE77B004ADE730042DE730031C65A0021A54200108C2900006B0800005A
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B730000000000000000000031FF000031
      FF000031FF000000180000000000000000000000000000000000005200000063
      0000088C100000940800008C0800005A000000633900087BB500006B9C000052
      00000063080018A5290010A521000894100000940800008C0800005A0000086B
      5200000000000000000000000000000000000000000000000000000000009463
      5A00F7E7D600EFE7D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600EFDEC600EFDE
      C600A5636B000000000000000000000000009C6B6300FFDEC600FFE7C600FFE7
      BD00FFE7B500947B9C001821A5000018DE000018D6000873100031BD52004AE7
      7B004ADE73004ADE730042D6730039D6630031CE5A0031C6520021B542000884
      1800005A0000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000000
      0000000000000031E700000000000000000000000000005200000063080018A5
      290010A521000894100000940800008C0800005A0000086B5200005200000052
      000018A5310021BD420018A5290010A52100089418000084080000730000005A
      000021B59C000000000000000000000000000000000000000000000000009463
      5A00E7DED600E7DECE00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400E7CEBD00E7CE
      BD00A5636B000000000000000000000000009C6B6300F7E7CE00FFE7C600FFEF
      C6008C73A5000010C6000018F7000018FF00215AA5000873100039D66B004AE7
      7B0042DE730042D6730042D66B0039CE630031C6520029C64A0029BD420018B5
      310008841800005A00000000000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      0000000000000031E7000031FF0000000000005200000052000018A5310021BD
      420018A5290010A52100089418000084080000730000005A000000520000005A
      0000086B08000884180021BD420018B53100088C180000520800005A08000052
      00000052000018A57B0000000000000000000000000000000000000000009C6B
      6300CEC6BD00CEC6BD00CEC6B500CEC6B500CEC6B500CEC6B500CEC6B500CEBD
      AD00CEBDAD00CEBDAD00CEBDAD00CEBDA500CEBDA500C6B5A500C6B5A500C6B5
      A500A5636B000000000000000000000000009C6B6300FFE7D600FFF7D600A59C
      B5000010CE000021FF000021FF005273FF00E7EFFF00B5CEB5000873100039CE
      63004ADE7B0042D66B0031BD4A00189C3100189429001894290018A5290018AD
      290010AD2100087B080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031FF000031FF0000520000005A0000086B08000884
      180021BD420018B53100088C180000520800005A0800005200000052000018A5
      7B00086B5A00005A000029BD4A0029C64A00108C1800004A290000639C000063
      9C00006BA50000528C0000528C00000000000000000000000000000000008C5A
      5200A59C9400A59C9400A59C9400A5949400A5948C009C948C009C948C009C94
      8C009C948C009C9484009C9484009C9484009C9484009C9484009C8C84009C8C
      84008C5A5A000000000000000000000000009C6B6300FFEFDE00FFEFDE003142
      C6000021FF000018FF00395AFF00F7F7FF00D6DEFF00BDC6FF00B5CEB5000873
      100031BD4A0039D66B00087310007B844A009C8C5A0042632900006300000073
      0800089418000894100000630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A84001094CE00086B5A00005A
      000029BD4A0029C64A00108C1800004A290000527300005A730008738C001894
      BD001094C6000052000029B5420039D6630018942100005A31000073B5000063
      9C00006BA5000084C60000A5E700006BA5008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910009C6B6300FFF7E700CEBDCE000821
      CE000029FF000021FF00395AFF006384FF007B94FF00637BFF00C6CEFF00527B
      BD000873100029BD3900087310008C737B00E7AD84009C636300000000000000
      000000630800088C1000006B080000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      000000000000000000000000000000000000004A840000527B0000527B000052
      000029B5420039D6630018942100005A31000063A500004A8C00004A8C000042
      7B0000000000005A18001894290042E77B0021A53900005A210000639C000073
      B50000BDF70000C6FF0000D6FF00006BAD008C3910000000000000000000A573
      6B00E7DED600E7DED600DED6CE00DED6CE00DED6CE00DED6CE00DED6C600DED6
      C600DED6C600DECEC600DECEBD00DECEBD00DECEBD00DECEBD00DECEB500DECE
      B500A5636B0000000000000000008C391000A5736B00FFFFEF006B6BBD000018
      DE000839FF000831FF000029FF000029FF009CB5FF00DEE7FF00F7F7FF003152
      FF000018DE0008731000087310005A5A7B00E7A57B009C636300000000000000
      000000000000007308000073080000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000031
      FF000031FF00000000000000000000000000004A84001094CE001094CE00005A
      18001894290042E77B0021A53900005A21000084CE00007BBD00007BBD000052
      840000000000004A52000063080039D66B0039D66B0000630800004A420000C6
      FF0000C6FF0000C6FF00086B9C00000000008C3910000000000000000000A573
      6B00D6CEC600D6CEC600CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A
      2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CE5A2900CEBDAD00CEBD
      AD00A5636B0000000000000000008C391000A5736B00FFFFF7006B6BBD000021
      DE001042FF000831FF001039FF00BDCEFF00FFFFFF00F7F7FF00527BFF000021
      FF000021FF000021EF00087310005A5A7B00E7A57B0094636300000000000000
      00000000000000630000006B080000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B730000000000000000000031FF000031
      FF000031FF00000018000000000000000000004A84000873B5000873B500004A
      52000063080039D66B0039D66B0000630800004A4200005A9400006BAD000063
      9C000000000000528C00006B29001894290042E77B0029AD4200004A0000006B
      6B0000CEFF0000B5F700086B9C00000000008C39100000000000000000009C6B
      5A00A5A59C00A5A59C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD
      9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C00F7BD9C009C948C009C94
      8C008C5A5A0000000000000000008C391000AD7B6B00FFFFFF009494D6000821
      D6001842FF000831FF005273FF00E7EFFF00CEDEFF006384FF000018FF000029
      FF000029FF000021FF000018EF0073639C00E7AD7B0094636300000000000000
      000000000000000000000063000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000000
      0000000000000031E7000000000000000000004A8400006394000063A5000063
      A500006B29001894290042E77B0029AD4200004A0000006B6B00005A9C00004A
      840000528C0000639C00006BA500004A0000189C290042DE730029BD4A00086B
      1000006B2900006B520000000000000000008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C3910008C3910008C3910008C3910008C39
      10008C3910008C3910008C3910008C391000B57B6B00FFFFF700FFF7F7002139
      D6001842FF001039FF006384FF00D6DEFF00A5B5FF009CB5FF00A5B5FF00214A
      FF000029FF000029FF000018D600B5949400E7AD7B0094636300000000000000
      00000000000000000000005A000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      0000000000000031E7000031FF0000000000004A84001894BD00006BA500006B
      A500087B9400004A0000189C290042DE730029BD4A00086B1000006B2900006B
      520000525A00087B9400086B940031D6EF00005210000873080018A5310021A5
      390010841000006300000052000000520000000000000000000000000000B57B
      6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00FFF7
      EF00FFF7EF00F7EFE700F7EFE700F7EFE700F7EFE700F7E7DE00F7E7DE00F7E7
      DE00A5636B00000000000000000000000000BD846B00FFF7F700FFFFFF008484
      D6000829E700214AFF00214AFF00BDCEFF00FFFFFF00FFFFFF00A5B5FF001039
      FF000831FF000021EF0031319C00FFD6A500D6A58C0094636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031FF000031FF00004A8400005A9400004A8400005A
      9C00005A9C00005A7300005210000873080018A5310021A53900108410000063
      00000052000000520000004A080052FFFF0052FFFF00005A420000521000005A
      1000005A1000005A18000052210000000000000000000000000000000000BD84
      6B00FFFFFF00FFFFFF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600F7E7DE00F7E7
      DE00A5636B00000000000000000000000000BD847300FFF7F700FFFFFF00F7EF
      F7003142C6001031EF001842FF002952FF0094ADFF007B94FF001842FF001039
      FF000029F7002131B500CEADA500FFE7B500D6A58C0094635A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A84000873A50000639C00088C
      BD00006BB500006BB50000639C00005A420000521000005A1000005A1000005A
      18000052210000526B0052DEEF0063FFFF0052E7F700086B9C00086B9C000000
      000000000000000000000000000000000000000000000000000000000000C68C
      6B00FFFFFF00FFFFFF00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400F7EFDE00F7EF
      DE00A5636B00000000000000000000000000C68C7300FFF7F700FFFFFF00FFFF
      FF00EFE7F7005A63CE002139D6001031EF000831F7000831F7000831F7001029
      CE004A4AB500E7CEBD00FFEFC600FFE7BD00D6AD940094635A00000000000000
      000000000000000000000000000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      000000000000000000000000000000000000004A840000639C0000639C00007B
      B5000073AD00007BB500007BB5000073B500006BA500005A9400006BAD00004A
      84000000000000000000107BA5001073A500086B9C0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7EFE700F7EF
      E700A5636B00000000000000000000000000CE947300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEEF009494D6006B73CE006B73CE008C84C600CEC6
      CE00FFF7D600FFF7D600FFE7CE00FFEFC600D6AD940094635A00000000000000
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000031
      FF000031FF00000000000000000000000000005A940029ADCE0029C6EF0018CE
      F70018CEF70008C6FF0000C6FF0000BDFF0000B5F70000ADEF000094D600004A
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700FFF7F700FFF7F700FFF7EF00FFF7EF00FFF7EF00F7EFEF00F7EFE700F7EF
      E700A5636B00000000000000000000000000CE947300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFEF00E7CE
      BD00CE9C8C00C6948C00C69C8C00C69C8C00B584730094635A00000000000000
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B730000000000000000000031FF000031
      FF000031FF0000001800000000000000000008639C0073FFFF0052FFFF0039EF
      FF0031E7FF0018DEFF0010D6FF0008CEFF0000CEFF0000CEFF0000D6FF00004A
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFFFFF00FFFFFF00FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEF
      D600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600FFEFD600F7F7EF00F7EF
      E700A5636B00000000000000000000000000D69C7300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      A500A56B5A00CE946300CE8C5200D6843900D684390000000000000000000000
      000000000000000000000000000000000000D6A58400FFFFF700FFF7EF00FFF7
      EF00FFEFE700FFEFDE00FFE7D600F7E7CE00F7E7C600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00F7D6A500EFCE9C00A57B73000000000000000000000000000000
      0000000000000031E700000000000000000008639C00299CBD0042CEE7004ADE
      EF0039DEFF0031DEFF0021DEFF0010CEFF0008C6FF0000A5E700008CCE00004A
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD
      8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFBD8400FFF7EF00FFF7
      EF00A5636B00000000000000000000000000D69C7300FFFFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      A500B57B6300EFB57300EFAD5200EF9C39000000000000000000000000000000
      000000000000000000000000000000000000D6A58400D69C8400CE9C8400CE9C
      8400CE948400C6947B00C6947B00BD8C7B00BD8C7B00BD8C7B00B5847B00B584
      7B00AD847B00AD7B7300AD7B7300A57B73000000000000000000000000000000
      0000000000000031E7000031FF00000000000000000000000000086394000063
      9400086B9C000873A5000873A500006B9C000063940000528C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7F700FFF7
      EF00A5636B00000000000000000000000000D69C7300FFFFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      AD00B5736300EFB57300EFAD5200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031FF000031FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7
      F700A5636B00000000000000000000000000D69C7300FFF7EF00FFFFFF00FFFF
      F700FFFFF700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFFFFF00CEAD
      A500B57B6300DEA56B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B0094636300000000000000000000000000D6946B00D69C7300D69C7300D69C
      7300D69C7300CE947300CE947300C68C7300C68C7300BD847300B5847300AD73
      6300B57B6B000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000528C0000528C0000528C000052
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006B080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006B6B6B006B6B6B006B6B6B0000000000000000000000
      0000000000006B6B6B006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000528C0000528C0000528C00004A8400000000000000
      000000000000005A9400005A9400005A9C000063A50000639C0000639C00005A
      9C00005A9400005A940000639C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B29
      10006B2910006B2910006B2910006B2910006B2910006B2910006B2910006B29
      10006B2910000000000000000000000000000000000000000000000000000000
      000000730800007B080000730000000000000000000000000000007BB5000084
      B500007BB500007BB500007BB5000073A500006B9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B00B5ADAD00949494008C8C8C006B6B6B006B6B6B00847B
      7B006B6B6B00DEDEDE00D6CECE006B6B6B006B6B6B006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000639C00006BA500005A9400005A9400005A9400004A84000000
      0000005A9400006BA500005A9C0000639C00006BA500006BA500006BA5000063
      9C00005A940000528C00005A940000528C000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B291000B531
      0800D6422100EF422900F74A3100F74A3900F7523900F7634200F74A3100F742
      3100F74A31006B2910006B29100000000000000000000000000000000000006B
      00000884080008A5180008840800006B21000884B50010A5CE00088CBD000084
      B5000094C600008CBD00008CC600007BB500007BAD00006B9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B6B6B00D6D6D600C6C6C600A59C9C00A59C9C00A59C9C00848484005A5A
      5A00BDBDBD00CECECE00CECECE00D6D6D600D6D6D600CECECE006B6B6B006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000000000
      00000000000008639C0000BDFF00009CD600006BA50000528C0000639C00004A
      8400005A94000884B500188CBD00109CC60008A5DE0000B5EF0000B5F70000A5
      E7000094CE00007BBD00006BA50000528C000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B291000BD39
      0800DE422100EF4A3100F75A3900FF6B4200FF734A00FF634200FF846B00F763
      5200EF423100E7422900CE4221006B2910000000000000000000006B0000007B
      080010A5210010AD180008A5180000730000087B52001094C6000084B5000073
      AD000084B5000084B5000084B5000073AD00007BAD00007BB5000073AD000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      6B00DED6D600E7DEDE00C6BDBD00A59C9C00A59C9C00A59C9C00636363000000
      000000000000101010005A5A5A00ADADAD00CECECE00CECECE00CECECE00CECE
      CE00C6C6C6006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      00000000000008639C0000C6FF0000C6FF0000B5F7000084C60000639C000063
      9C0000528C00219CC60031BDDE0029B5DE0021B5DE0018BDEF0008C6FF0000C6
      FF0000CEFF0000CEFF0000BDF70008639C000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B291000C639
      1000E7422900F75A4200FF734A00FF734A00FF6B4200BD421000FFDED600FFBD
      B500BD421000E7422900C63921006B29100000000000006B0000087B100029BD
      420021B5390010AD210010AD180008A518000073000010846B0021C6EF0010C6
      F70008C6F70000BDF70000B5E70000A5D60000B5E700009CCE000073A5000000
      00000000000000000000000000000000000000000000000000006B6B6B00D6D6
      D600D6D6D600CECECE008C8C8C00847B7B00847B7B00847B7B006B6B6B001010
      100008080800000000000000000000000000101010005A5A5A00ADADAD00CECE
      CE00CECECE00B5B5B500B5B5B5006B6B6B000000000000000000000000000000
      0000000000000000000008639C0000CEFF0000C6FF0000C6FF000094D6000063
      A500006BA500005A940031B5D60039C6E70031C6E70029CEEF0018D6FF0010D6
      FF0000C6FF0008639C0008639C00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B291000C639
      1000EF523100FF734A00FF6B4A00FF6B4A00BD421000FF8C7B00FFFFFF00FFE7
      DE00BD421000E74A3100BD3918006B291000006B00000073080031B54A0039CE
      5A0029BD420021B5390018AD2900089C1000088C00000873100039C6AD0029DE
      FF0018DEFF0008D6FF0000D6FF0000D6FF0000DEFF0000D6FF00008CC600006B
      9C000073AD00007BB5000000000000000000000000006B6B6B00CECECE00CECE
      CE00C6C6C6008C8C8C00BDB5B500B5B5B500A59C9C00A59C9C009C9C9C009C94
      9400949494008484840052525200292929000808080000000000000000001010
      100063636300847B7B006B6B6B00000000000000000000000000000000000000
      00000042000000420000006B840010CEFF0010D6FF0008D6FF0008D6FF00008C
      C60000639C00006BA50000528C00086B9C00086B9C00086B9C00086B9C000863
      9C0008639C000000000000000000000000000000000000000000000000000000
      000000000000005A00000000000000000000000000000000000000000000CE42
      1800F75A3900FF734A00FF6B4A00FF6B4200BD421000FFD6D600FFFFFF00FFE7
      DE00BD421000F7634200B54218006B291000006B080000730800108C1800189C
      290039CE5A0031C64A0018A52900006B100000731000006B0000006B000031BD
      940039E7FF0021E7FF0010DEFF0000CEFF0000BDF7000094C600007BB500007B
      AD000084BD00006BA500006BA50000000000000000006B6B6B00CECECE00C6C6
      C6008C8C8C00D6D6D600F7F7F700F7F7F700F7F7F700E7DEDE00CEC6C600B5B5
      B500A5A5A500A59C9C00A59C9C009C9C9C00949494006B636300212121000000
      0000181818009C9494006B6B6B0000000000000000000808840000185200004A
      0000004A0000004A0000004200000873730021CEFF0029E7FF0021DEFF0021DE
      FF000894C60000639C0000528C00004A8400005A9400005A94000063A500005A
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000005A0000005A000000000000000000000000000000000000B531
      1000B5311000FF6B4A00FF6B4200BD421000F7AD9C00E7E7E700EFEFEF00F7D6
      CE00BD421000FF6B4A00CE5231006B291000006B9C0021ADD600108473000873
      080042CE6B0042D66B0021A52900006B4200006B8C00087B8C00188CA50029AD
      CE0021A5CE0018A5CE00088CBD00007BAD000073AD00007BAD00008CC600007B
      AD000084BD00009CD60000BDEF000084BD00000000006B6B6B00C6C6C6008C8C
      8C00E7E7E700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700E7E7E700D6D6D600C6C6C600ADADAD00A59C9C00A59C9C009C9494008484
      84006B6B6B009C9C9C006B6B6B0000000000080884000000B50000185200004A
      00000052000000520000004A00000042000008639C0039DEFF0042F7FF0042F7
      FF0031DEF7000873A50000639C00006BA5000073B500007BB500005A94000052
      8C00000000000000000000000000000000000000000000000000000000000000
      0000005A0000005A000008941000005A00000000000000000000000000000000
      000000000000B5311000E76B4A00CE848400949CAD00737B840094949400C684
      7300BD421000B5311000B53110000000000000639C0008739400087394000073
      100042C6630052E77B0029A5390000734A00007BB500006BA500006BA5000063
      94000000000000000000006B9C000084B5000094CE000084B500007BAD000094
      C60000CEF70000D6FF0000DEFF000084BD00000000006B6B6B008C8C8C00EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600847B7B00948C8C00C6BD
      BD00DEDEDE00E7E7E700DEDEDE00DEDEDE00D6D6D600C6C6C600B5B5B500A59C
      9C009C9C9C006B6B6B006B6B6B0000000000080884000000B50000185200004A
      0000005A0000005A000000520000004A000008639C001073AD0029A5C60052E7
      F70063FFFF001894BD00004A8C0000639C000063A5000073AD00006BA5000063
      9C00000000000000000000000000000000000000000000000000005A0000005A
      000018BD4A0010AD390008A5210000940800005A000000000000000000000000
      0000000000004A639400086B940008638C0008638C0008638C0008638C000863
      8C000000000000000000000000000000000000639C0021ADD60021ADD600007B
      310029AD420063EF940039BD5200007B3100009CD6000094CE000094CE00006B
      9C0000000000000000000073A500008CBD000084B5000073AD0008A5D60008D6
      FF0000D6FF0000D6FF001884AD0000000000000000006B6B6B00CECECE00F7F7
      F700F7F7F700F7F7F700F7F7F700CECECE00ADADAD00ADADAD009C9C9C00847B
      7B00736B6B008C848400ADA5A500C6C6C600D6D6D600D6D6D600CECECE00CEC6
      C600BDBDBD00A5A5A5006B6B6B0000000000080884000000BD0000185200004A
      00000063080000630800005200000052080008639C000052940000639C00108C
      BD002194BD00087BB50000639C00006BAD0000639C0000639C00005A94000052
      8C000000000000000000000000000000000000000000005A000031CE630029CE
      5A0021C6520018B5420010AD2900089C1800008C0800005A0000000000000000
      0000086B9C00086BE7000863E7001063E7001063E700105ADE000852D600085A
      DE00086B9C00000000000000000000000000006B9C00188CC600188CC600006B
      6B00107B100052DE840052DE840010841800006B5A000073AD00008CBD00007B
      B500000000000073A500109CCE00007BAD00087BAD0018B5DE0021E7FF0010D6
      FF0008D6FF0000C6F7001884AD000000000000000000000000006B6B6B006B6B
      6B00CECECE00EFEFEF00ADA5A5006B5A5A00736B6B00847B7B009C949400ADAD
      AD00B5B5B500ADA5AD009C94940084737B00847B7B00948C8C00BDBDBD00CECE
      CE00CECECE00C6C6C6006B6B6B0000000000080884000000C60000185A00004A
      0000086B0800086B100000520000005A100008639C000873A5000894C6000073
      AD00006BA5000084C6000073AD000073B5000073AD00006BAD00006BAD00005A
      94000000000000000000000000000000000000000000005A000031D6630029CE
      630021C65A0018BD4A0010B5390008A52100005A000000000000000000000039
      63000863C6001873EF00187BF700187BF700187BF700187BF7001873EF00186B
      E700105ADE00086B9C00000000000000000000639C00087BAD00087BB500087B
      B5000884420029AD420063EF940039BD5A0000630000008484000073B5000063
      9C00006BA5000884B5000884B5001894C60031B5D60039EFFF0029DEFF0029DE
      FF0018D6FF001884AD0000000000000000000000000000000000000000000000
      00006B6B6B006B6B6B00BD848400AD8C73007B5A520063525200635252006B5A
      63006B5A63008C848400A59C9C00ADADAD00B5B5B500A59CA500CECECE00CECE
      CE00B5B5B5006B6B6B000000000000000000080884000008CE0000185A00004A
      000008731000087B1800005A00000063100008639C00108CBD001094C600109C
      CE0008A5DE0000A5DE00009CDE00009CD6000094CE000084C600007BB5000063
      9C0000000000000000000000000000000000005A000039D66B0039D66B00005A
      0000005A0000005A000018BD4200005A00000000000000000000000000000039
      6300187BE7002184FF00218CFF00218CFF00218CFF00218CFF002184FF00187B
      F7001873EF001063DE00086B9C0000000000006B9C0029ADCE000884BD000884
      BD001094A5000063080031AD42005AE78C0042CE6B00108C210008844200008C
      6B00006B73001094A5001084AD004ADEF7005AF7FF004AEFFF0042EFFF0031D6
      F7001884AD000000000000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFD6AD00FFD6A500FFCE9C00D6A57B00A57B
      5A007B635A006352520063525A006B6363008C848400CECECE00CECECE00A5A5
      A5006B6B6B00000000000000000000000000080884000008DE0000215A00004A
      000010841800108C210008630800086B180008639C004ADEFF0042EFFF0029E7
      FF0018DEFF0010D6FF0000CEFF0000C6FF0000C6FF0000C6FF0000ADE700005A
      940000000000000000000000000000000000005A000039D66B00005A00000000
      000000000000005A0000005A0000000000000000000000000000004A7B000031
      5A00085A9C00298CFF002994FF002994FF002994FF002994FF00218CFF00218C
      FF001884F7001873EF00086B9C0000000000006B9C000873A500006B9C000073
      B5000073B500087B8C00006B2100188C180031B54A0039BD5200219C2900107B
      00000073000000730000006B10006BFFFF006BFFFF0063F7FF0042D6EF001884
      AD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFDEB500FFD6AD00FFCEA500FFCE9400FFC6
      8C00FFC68400FFBD8400FFC68400BD8484006B6B6B006B6B6B006B6B6B006B6B
      6B0000000000000000000000000000000000080884000010E70000215A00004A
      000018942900189C3100086B1000087B1800188C7B0008639C0052F7FF0042F7
      FF0039EFFF0021DEFF0018DEFF0008D6FF0000C6FF0008639C0008639C000000
      000000000000000000000000000000000000005A000000520000000000000000
      000000000000005A00000000000000000000000000000000000000427B000031
      5A00217BCE002994FF00319CFF00299CFF00299CFF00299CFF002994FF002994
      FF00218CFF00187BF700086B9C000000000000639C00108CB5000884B50018A5
      CE00088CC600088CC600007BAD00007B6300006B2900007B2100087B2900087B
      310000733100086B84006BE7EF007BFFFF006BEFF7001884AD001084B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFDEBD00FFDEB500FFD6A500FFCE9C00FFCE
      9400FFC68C00FFC68400FFC68400BD8484000000000000000000000000000000
      000000000000000000000000000000000000080884000010EF0000216300004A
      000021AD390029B54200087310001894290010842900107B4A0008639C000863
      9C0008639C0008639C0008639C0008639C0008639C0000000000000000000000
      000000000000000000000000000000000000005A000000520000000000000000
      0000000000000000000000000000000000000000000000000000004A7B000031
      5A002184E7002184D60000315A002994EF00319CFF00319CFF00299CFF002994
      FF00218CFF002184FF00086B9C000000000000639C00087BAD00087BAD000894
      C600088CBD000094C6000094C600008CC6000084BD000073AD000084BD000063
      9C0000000000000000002994BD00218CB5001884AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFE7CE00FFE7C600FFDEBD00FFD6AD00FFD6A500FFCE
      9C00FFCE9400FFC68C00BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000080884000018FF0000216B00004A
      000021B5390031D65A001084210021AD3900189C2900108C2100087B18000873
      1800005A1000004A000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005A000000520000000000000000
      000000000000000000000000000000000000000000000000000000528C000052
      8C000039630000315A0000315A00218CDE0031A5FF00319CFF00319CFF00299C
      FF002994FF00218CF700086B9C0000000000107BA50039BDDE0042D6F70031D6
      F70029DEFF0018D6FF0008CEFF0000CEFF0000C6FF0000BDF70000ADDE000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFEFD600FFE7CE00FFE7C600FFDEB500FFD6AD00FFD6
      A500FFCE9C00FFC69400BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000080884000018FF0000185A00004A
      00001884290018A5310029BD4A0031C6520029BD4A0021AD3900189C29001894
      210008731000004A000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A0000000000000000
      000000000000000000000000000000000000000000000000000010639C00106B
      9C00085A8C00004A840000396300299CF70031A5FF0031A5FF00319CFF00299C
      FF002994FF00086B9C0000000000000000001084AD008CFFFF006BFFFF005AF7
      FF004AEFFF0031E7FF0021DEFF0010DEFF0000D6FF0000D6FF0000DEFF000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFEFDE00FFEFD600FFE7CE00FFE7BD00FFDEB500FFD6
      AD00FFD6A500F7C69400BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000080884000018FF0008425A00004A
      00005AA56B00398C4A00187B21001084180021AD390029C64A0029B5420021AD
      390010842100004A000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A0000000000000000
      0000000000000000000000000000000000000000000000000000000000001873
      A500529CBD00106B9C00084A6B00218CD600299CEF00319CF70031A5FF00319C
      FF00218CEF00086B9C0000000000000000001084AD0042ADCE005AD6E7006BEF
      F70052E7FF004AE7FF0039E7FF0029D6FF0010CEFF0000BDEF0000A5D6000063
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD848400FFF7EF00FFF7E700FFEFDE00FFE7D600FFE7C600FFDEBD00FFDE
      B500FFD6AD00BD84840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080884000808840094A59C00085A
      0800106B1800298431004A9C5A00398C4A0021843100108421001894290021AD
      390018942900004A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000106B
      9C00529CBD00529CBD00186BA500105A7B00084A6B000039630000396B000039
      6300086B9C000000000000000000000000000000000000000000107BAD00107B
      AD001884B500188CB500108CB5000884B500007BAD00006BA500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      8400FFFFF700FFFFF700FFF7EF00FFF7E700FFEFDE00FFE7CE00FFE7C600FFDE
      BD00F7C6AD00BD84840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080884000808
      7300396B4A0018631800004A0000085A100021732900429C5A00318C42001884
      2900086B10000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000106B9C00186B9C00106B9C00085A9400004A840000427B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      8400BD848400BD848400BD848400FFF7EF00FFF7E700FFEFD600FFE7CE00FFDE
      C600BD8484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000080884000808840008087B005A8452001063100000520000086B1000086B
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD848400BD848400BD848400BD848400BD84
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000080884000808840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006394000063
      9400006394000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000639400ADF7FF00ADEF
      FF00A5F7FF000063940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000212121003939310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000005200000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A0000004A
      0000004A0000004A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063940000639400FFFFFF0094EF
      FF0094EFFF008CEFFF0000639400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000393931001818210018293100314242000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      0000089410000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      840029DE520000840000004A0000000000000000000000000000000000000000
      00000000000000000000000000000000000008739C0084E7FF0000639400FFFF
      FF007BE7FF0084EFFF006BD6F700006394000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD9C8C0010394A00006B9C00004A730008395200394A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000052000010A5
      2100089C18000052000000520000005200000052000000520000005200000052
      0000005200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      840029DE520000840000004A0000000000000000000000000000000000000000
      000000000000000000000000000000000000006B94002994BD007BE7FF000063
      9400FFFFFF006BE7FF0073E7FF0031ADCE000063940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000018394A00006B9C0000639C0018526B0029314200423139000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052000021B5390018AD
      310010A52900089C18000894100000941000008C0800008C0800008C0800008C
      0800005200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      840029D6520000840000004A0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A8C002994BD0063E7
      FF0000639400FFFFFF005ADEFF0052DEFF00107BA50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073848400005A84003152630094636300AD6B6B00945A5A006339
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052000031CE5A0029C64A0021BD
      420018B5310010A52900109C21000894180000941000008C0800008C0800008C
      0800005200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      7B0029D6520000840000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006B9400219C
      C60052E7FF0000639400FFFFFF004ADEFF00188CBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008425A008C5A5A00CE8C8C00BD7B7B00AD6B6B00945A
      5A00633939000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000052000031CE5A0029C6
      520021BD420018B5390018AD290010A52100089C180008941000008C0800008C
      0800005200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000029CE4A0042F7
      840029DE520000840000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000063
      940021A5CE0042DEFF0000639400FFFFFF0021B5E70000639400000000000000
      0000006394000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE004A6B73009C6B6B00DE9C9C00CE8C8C00BD7B7B00AD6B
      6B00945A5A005A313100085ACE00085ACE000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE0008397B00000000000052000031CE
      5A0029C652000052000000520000005200000052000000520000005200000052
      000000520000085ACE00085ACE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000031A54A0029BD
      520018AD290010941000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000063940018A5D60031D6FF0000639400FFFFFF0018ADDE00006394000063
      940010CEFF000063940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF007B5A5A00DEA5A500DE9C9C00CE8C8C00BD7B
      7B00AD6B6B008C5252005A31310039A5FF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF002994FF0008397B0000000000000000000052
      000031CE6300005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      000000000000000000000000000000000000005A0000189C310021C6520018B5
      420010A52900089C180000840800004A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000063940010A5D60021D6FF0000639400FFFFFF0018CEFF0010CE
      FF0010CEFF0010CEFF0000639400006394000063940000639400006394000063
      9400006B9400000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF003194F7007B525A00DEA5A500DE9C9C00CE8C
      8C00BD7B7B00A56B6B008C5252005A313100085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994FF0008397B0000000000000000000000
      000000520000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      0000000000000000000000000000005A000018A5390029D65A0021C6520018B5
      390010A52900089C1000008C000000730000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000063940010ADDE0010CEFF0000639400FFFFFF0008C6
      FF0008C6FF0008C6FF0008C6FF0008C6FF0008C6FF0010CEFF0010CEFF0018CE
      FF0018CEFF00006394000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00105AC6007B5A5A00DEA5A500DE9C
      9C00CE8C8C00BD7B7B00A56B6B008C5252005A39310000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF0008397B0000000000000000000000
      000000000000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      00000000000000000000005A000021AD420031E76B0029CE5A0018BD4A0010B5
      390008A5210000941000008C00000084000000730000004A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000006B9C0008ADE70008CEFF000063940008C6
      FF0008C6FF0010CEFF0010CEFF0018CEFF0021CEFF0021CEFF0029D6FF0029D6
      FF0031D6FF0039D6FF000063940000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE009CD6F70073525A00DE9C
      9C00DE9C9C00CE8C8C00B57B7B00A56B6B008C5252005A313100000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF0008397B0000000000000000000000
      000000000000000000000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      000000000000005A000029B5420042EF730031DE630029CE5A0018BD4A0010AD
      310008A521000094080000840000008400000084000000730000004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000006B9C0008ADE70018CEFF0021D6
      FF0021CEFF0029CEFF0029D6FF0031D6FF0039D6FF0039D6FF0042D6FF004ADE
      FF0052DEFF0052E7FF0052DEFF0000639400085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE009CDEFF004AADF7007352
      5A00DE9C9C00DE9C9C00C68C8C00B57B7B00A56B6B008C5252005A3131000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF0008397B0000000000000000000000
      000000000000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      0000005A000029B542004AFF840039EF730031DE630021CE520018BD420010AD
      3100089C1800009408000084000000840000008400000084000000730000004A
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000063940021CEF70031D6
      FF0039D6FF0042D6FF0042DEFF004ADEFF0052DEFF005ADEFF005ADEFF0063E7
      FF006BE7FF0073E7FF0063D6F700006B9400085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE00A5DEFF0042B5FF004AAD
      F700946B6B00E7A5A500DE9C9C00C68C8C00B57B7B00844A4A00424A52003142
      520000000000000000000000000000000000085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF0008397B0000000000000000000000
      000000520000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE00000000000000000000000000005A
      000029B542004AFF840042FF7B0039E76B0029D6630021C6520018B5420010A5
      2900089C1800008C080000840000008400000084000000840000008400000073
      0000004A00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000063940042D6FF004ADE
      FF0052DEFF005ADEFF005ADEFF0063E7FF006BE7FF0073E7FF007BE7FF0084EF
      FF007BDEFF0094EFFF0094EFFF00006B9400085ACE00E7EFFF009CDEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF00085ACE00E7EFFF00A5DEFF009CDE
      FF009CD6F700946B6B00E7A5A500DE9C9C00524A5200008CC60000ADEF0000A5
      E7000084C600000000000000000000000000085ACE009CD6FF0042ADFF0039AD
      FF0039ADFF0039A5FF0039A5FF0031A5FF0008397B0000000000000000000052
      000008941000005200000000000000000000DEEFFF00DEEFFF00DEEFFF00DEEF
      FF00DEEFFF00DEEFFF00DEEFFF00DEEFFF000000000000000000005A0000189C
      310031CE5A00189C3100189C310010841800006B080000630800006308000063
      0000005A0000005A0000005A0000005A0000005A000000630000006300000073
      0000006B0000004A000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006394006BE7FF006BE7
      FF006BE7FF0073E7FF007BE7FF0084E7FF008CE7FF0094EFFF00A5F7FF00FFFF
      FF0000639400B5F7FF00B5F7FF00006B9400085ACE004284C6002173C6002173
      C6002173C6002173C600186BC600186BC600085ACE00085ACE00085ACE00085A
      CE00085ACE00105AC6008C636B00BD848C00087BAD0000BDFF0000BDFF0000A5
      E70000189C00000084000000000000000000085ACE004284C6002173C6002173
      C6002173C6002173C600186BC600186BC60008397B0008397B000052000010A5
      2100089C18000052000000520000005200000052000000520000005200000052
      00000052000000000000000000000000000000000000005A0000004A0000004A
      0000005A000000630000006B00000073080000841000088C180084FFFF0000CE
      EF0000B5CE0000A5BD00084A520021B54A0021A53900189C3100108C21000873
      1000004A0000004A0000004A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000873A5006BDEF70084E7FF0084E7
      FF008CEFFF0094EFFF009CEFFF00A5EFFF00ADEFFF00BDFFFF00FFFFFF000063
      940000639400CEFFFF00CEFFFF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0039ADFF0039A5FF00186BC6009CDEFF00319CFF00319C
      FF00319CFF00299CFF003194F7006B525A00009CDE0000BDFF00008CD6000018
      9C0000089C00000894000000840000000000085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0039ADFF0039A5FF00186BC6000052000021B5390018AD
      310010A52900089C18000894100000941000008C0800008C0800008C0800008C
      080000520000000000000000000000000000005A0000005A0000007300000084
      0000C67B0000C67B0000C67B0000C67B0000089C180008A5290010AD31007BFF
      FF0000CEE70000C6E70000CEE700085A630042F77B004AFF84004AFF84004AFF
      84004AFF840031CE5A00005A0800004A00000000000000000000000000000000
      000000000000000000000000000000000000006394009CF7FF00A5EFFF00A5EF
      FF00ADEFFF00B5F7FF00B5F7FF00BDF7FF00CEFFFF00FFFFFF00006394000000
      000000639400C6FFFF00C6FFFF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF0039ADFF0039ADFF00186BC6009CDEFF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994F7000094D60000B5F7000029A5000021
      DE000021BD000018B5000008940000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF0039ADFF0039ADFF000052000031CE5A0029C64A0021BD
      420018B5310010A52900109C21000894180000941000008C0800008C0800008C
      08000052000000000000000000000000000000000000005A000000630000C67B
      0000E7C65A00E7C65200E7B53900DEAD1800C67B000008A5290010AD310018BD
      420084FFFF0000D6F70000D6F70000D6F700085A630031CE5A00189C31001894
      2900FF7BFF00004A0000004A0000000000000000000000000000000000000000
      000000000000000000000000000000000000006B940052ADCE00FFFFFF00BDF7
      FF00BDF7FF00BDF7FF00BDF7FF00C6FFFF00FFFFFF0000639400000000000000
      000000639400BDF7FF00BDF7FF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6009CDEFF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00085ACE000084C6000821BD00294A
      F7000829CE000018B50000008C0000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6000052000031CE5A0029C6
      520021BD420018B5390018AD290010A52100089C180008941000008C0800008C
      080000520000000000000000000000000000000000000000000000000000E7AD
      6B00EFDE9C00EFD68C00E7CE6300E7BD3900C67B0000004A0000004A0000004A
      0000004A000084FFFF0000D6F700085A6300004A0000004A0000004A0000FF7B
      FF00FF7BFF007300730000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006394006BBDD600FFFF
      FF00BDF7FF00BDF7FF00C6F7FF007BC6DE000063940000639400006394000063
      940000639400BDF7FF00BDF7FF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6009CDEFF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE00000000001021BD005273
      FF001839E700000894000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C60039ADFF000052000031CE
      5A0029C652000052000000520000005200000052000000520000005200000052
      000000520000000000000000000000000000000000000000000000000000E7AD
      6B00FFF7D600F7EFBD00EFD68C00E7C65200C67B000000000000000000000000
      0000000000000000000052E7F700000000000000000000000000FF94FF00FF7B
      FF00000000007300730073007300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000063940073C6
      DE00FFFFFF00BDF7FF00BDF7FF008CD6EF008CD6EF00A5E7F700ADEFFF00BDF7
      FF00D6FFFF00B5F7FF00B5F7FF00006B9400085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C6009CDEFF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE0000000000000000001021
      BD000008A500000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C60039ADFF0039ADFF000052
      000031CE630000520000319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7AD
      6B00FFFFFF00FFF7D600EFDE9C00E7C65A00FF7B000000000000000000000000
      00000000000000000000000000000000000000000000FF94FF00FF94FF000000
      0000000000000000000073007300730073000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000006B
      940073C6DE00FFFFFF00B5F7FF00B5F7FF00B5F7FF00B5F7FF00B5F7FF00B5F7
      FF00B5F7FF00B5F7FF00006B940000000000085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C6009CDEFF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C60039ADFF0039ADFF0039AD
      FF00005200000052000031A5FF00319CFF00085ACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7AD6B00E7AD6B00E7AD6B00E7AD6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF94FF00FF94
      FF00000000007300730073007300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006B9400006B9400006B9400006B9400006B9400006B9400006B9400006B
      9400006B9400006B94000000000000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C600E7EFFF0094D6FF0094D6
      FF0094D6FF0094D6FF0094D6FF0094CEFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C6009CD6FF0094D6FF0094D6
      FF0094D6FF000052000094D6FF0094CEFF00085ACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF94
      FF00FF7BFF007300730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A004A1818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000073080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000844A4A00844A4A008C4A4A00944A
      4A004A1818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007308000073080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000844A4A00844A4A008C4A4A009C4A4A00B54A4A00BD4A4A009C4A
      4A004A1818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000073
      080010AD21000073080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00844A4A009C4A4A00AD4A4A00C64A4A00C64A4A00BD4A4A00BD4A4A009C4A
      4A004A1818009C4A4A00844A4A00844A4A00844A4A00844A4A00844A4A00844A
      4A00844A4A00844A4A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000073080021B5
      390018AD31000073080000730800007308000073080000730800007308000073
      0800007308000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104AC600104A
      C600104AC6001042BD000842B5000842B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00C6525200CE525200C6525200C6525200C6525200C6525200C64A5200A54A
      4A004A181800FF8C8C00FF949400FF9C9C00FFA5A500FFADAD00F7B5B500F7B5
      B500F7B5B500844A4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000073080039C65A0029BD
      4A0021B5390018B5310018AD290010A5210008A5180008A5180008A5180008A5
      1800007308000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001873FF00186BEF001863E700296BD6005A84
      C6009C9CB500D6AD9400CE8C63004A63A5001042BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004A0000108C1800004A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00CE5A5A00CE525A00CE525200CE525200CE525200C6525200C6525200A54A
      4A004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007308004AD6730042CE6B0039CE
      5A0031C64A0029BD420021B5310018AD290010A5210008A5180008A5180008A5
      1800007308000000000000000000000000000000000000000000000000000000
      0000000000001873FF00297BF700528CDE008CA5C600DEC6AD00FFD69C00F7C6
      9C00E7AD8C00D68C5A00E7945A00EFAD7300848CAD00104AC600104AC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004A0000108C210000941000109C2900004A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00D65A5A00D65A5A00CE5A5A00CE5A5A00CE525A00CE525200CE525200A552
      52004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007308004AD6730042D6
      6B0039CE5A0031C6520029BD420021B5390018AD290010AD210008A5180008A5
      1800007308000000000000000000000000000000000000000000000000000000
      00001873FF006394DE00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7C6
      9C00F7CEA500D6845200DE8C5200EFAD7B00F7CEAD00D6CEC6004273D6001052
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000004A00001094210008A51800089C100008941000109C2100004A
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00D65A5A00D65A5A00D65A5A00D65A5A00D65A5A00D65A5A00CE5A5A00A552
      52004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A00000000000000000000000000187BD600187BD600187B
      D600187BD600187BD600187BD600187BD600185A940000000000007308004ADE
      7B004AD66B000073080000730800007308000073080000730800007308000073
      080000730800187BD600187BD60000000000000000000000000000000000187B
      FF00187BFF00DECEBD00FFDEB500FFDEB500FFDEB500FFDEBD00FFDEBD00EFBD
      9C00DE9C7300D67B4A00E7946300F7CE9C00FFDEBD00FFE7D600FFEFE7008CAD
      E7002163DE000000000000000000000000000000000000000000000000000000
      0000004A00000884180018AD310010A5210008A51800089C180008941000109C
      2100004A00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00DE636300DE636300DE636300D65A6300D65A5A00D65A5A00D65A5A00AD52
      52004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A000000000000000000187BD600A5DEFF004AB5FF004AB5
      FF004AADFF004AADFF0042ADFF0042ADFF00185A940000000000000000000073
      080052DE7B00007308000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD600000000000000000000000000296B
      CE0073634A00FFE7BD00FFE7CE00FFE7CE00FFE7CE00FFE7CE00F7CEB500EFC6
      A500DE9C7300EFA56B00EFA57300F7D6B500FFE7CE00FFEFDE00FFF7EF00FFFF
      F700CEDEF700397BE7001863E70000000000000000000000000000000000004A
      0000087B180029C64A0021BD390018B5310010942100004A0000109C29000894
      1000109C2100004A000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00DE636300DE636300DE636300DE636300DE636300DE636300D65A6300AD52
      52004A181800399C4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A000000000000000000187BD600ADDEFF0052B5FF004AB5
      FF004AB5FF004AADFF004AADFF0042ADFF00185A940000000000000000000000
      000000730800007308000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD6000000000000000000187BFF006363
      5A00FFA53100FFEFDE00FFEFDE00FFEFDE00FFEFDE00FFEFDE00F7DEC600EFCE
      B500D6845200D67B4A00EFB58400FFDEC600FFE7D600FFF7E700FFF7F700FFFF
      FF00FFFFFF00DEEFFF00186BEF001863E7000000000000000000004A00000873
      100031CE5A0029CE520029C64A00189C3100004A000000000000004A0000089C
      18000894100010942100004A0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00E76B6B00E76B6B00E7636B00DE636300E76B6B00E7949400DE636300AD52
      52004A1818005AA55A0018BD4A0018BD4A0018BD4A0018BD4A0018BD4A0018BD
      4A00F7B5B500844A4A000000000000000000187BD600ADDEFF0052B5FF0052B5
      FF004AB5FF004AB5FF004AADFF004AADFF00185A940000000000000000000000
      000000000000007308000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD6000000000000000000187BFF00AD73
      2900FFC66B00FFF7E700FFF7EF00FFF7EF00FFF7EF00FFEFE700EFB59C00DE9C
      7300D6845200EFA57300F7D6B500EFD6C600FFEFE700FFF7EF00FFFFF700FFFF
      FF00FFFFFF00DEC6C600395A9C00186BF7000000000000000000004A000039DE
      6B0039D66B0031D6630021AD3900004A0000000000000000000000000000004A
      000008731000089C100010942100004A00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00E76B6B00E76B6B00E76B6B00E76B6B00EFA5A500FFFFFF00EF9C9C00AD5A
      5A004A181800EFCEAD00B5EFAD005AD673005AD6730042CE630042CE630042CE
      6300F7B5B500844A4A000000000000000000187BD600ADDEFF0052BDFF0052B5
      FF0052B5FF004AB5FF004AB5FF004AADFF00185A940000000000000000000000
      000000000000000000000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD6000000000000000000185AA50018BD
      4A00CEEFCE00FFFFF700FFFFF700FFFFF700FFFFF700F7DEC600F7D6C600DE9C
      7B00E7A57300EFAD7B00FFE7C6009C9C94009C9C9C00EFE7E700FFFFFF00FFFF
      FF00FFFFFF00CE949400736B94001873F7000000000000000000004A0000189C
      310042DE730021AD4200004A0000000000000000000000000000000000000000
      000000000000004A0000089C100010941800004A000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00EF737300EF6B7300EF6B6B00E76B6B00F7ADAD00FFFFFF00EF949400B55A
      5A004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600DEF7BD00DEF7
      BD00F7B5B500844A4A000000000000000000187BD600ADDEFF0052BDFF0052BD
      FF0052B5FF0052B5FF004AB5FF004AB5FF00185A940000000000000000000000
      000000000000000000000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD60000000000187BFF001863520018BD
      4A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEFE700EFCEB500D67B
      5200D6844A00F7C69C00FFE7D600FFF7E700DED6D6008C948C00B5BDB500FFFF
      FF00F7EFEF00BD8484003163B50000000000000000000000000000000000004A
      000029C65200004A000000000000000000000000000000000000000000000000
      00000000000000000000004A0000089C180008941000004A0000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00EF737300EF737300EF737300EF737300EF6B7300EF949400E76B6B00B55A
      5A004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600ADDEFF005ABDFF0052BD
      FF0052BDFF0052B5FF0052B5FF004AB5FF00185A940000000000000000000000
      000000000000000000000000000000000000E7F7FF00319CFF00319CFF00319C
      FF00319CFF00319CFF00319CFF00187BD600000000001873EF00186B5A006BC6
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00E7AD8C00E7A58400DE8C
      5A00EFBD9400FFDEC600FFEFDE00FFF7EF00FFFFF700FFFFFF00B5BDB500CECE
      CE00CEE7FF005A7BC600187BFF00000000000000000000000000000000000000
      0000004A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004A00000063080008941000004A00000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00F7737B00F7737B00F7737300F7737300EF737300EF737300EF737300B55A
      5A004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600ADE7FF005ABDFF005ABD
      FF0052BDFF0052BDFF0052B5FF0052B5FF00185A940000000000000000000000
      000000000000000000000000000000000000E7F7FF00E7F7FF00E7F7FF00E7F7
      FF00E7F7FF00E7F7FF00E7F7FF00E7F7FF00000000001852B5000018FF00C6CE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7A58400E79C
      7300E7A57B00E7D6C600DED6CE00FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0063A5FF00187BFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004A000000730800004A
      000000000000000000000000000000000000000000000000000000000000844A
      4A00FF7B7B00F77B7B00F77B7B00F77B7B00F7737B00F7737300F7737300B55A
      5A004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600639CCE00398CCE00398C
      CE00318CCE00318CCE00318CCE00318CCE00185A9400185A9400185A9400185A
      9400185A9400185A9400185A9400185A9400185A940000000000000000000000
      000000000000000000000000000000000000000000001031B5000018FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDDEFF007BB5FF00398CFF00187BFF007BA5
      DE00FFE7D600EFE7D6009C9C9C009C9C9C00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF002984FF00187BFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004A0000005A
      0000004A0000000000000000000000000000000000000000000000000000844A
      4A00FF7B8400FF7B7B00FF7B7B00FF7B7B00F77B7B00F77B7B00F77B7B00BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600ADE7FF005AC6FF005AC6
      FF005ABDFF005ABDFF0052BDFF0052BDFF00318CCE0052B5FF004AB5FF004AB5
      FF004AADFF004AADFF0042ADFF0042ADFF00187BD60000000000000000000000
      000000000000000000000000000000000000187BFF00105AFF0084ADFF00EFF7
      FF00ADD6FF0073ADFF002984FF002984FF000000000000000000000000000000
      00004294FF00DEE7EF00FFFFF700DEDEDE008C948C00B5BDBD00FFFFFF009CCE
      FF00187BFF00187BFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004A0000004A00000000000000000000000000000000000000000000844A
      4A00FF848400FF848400FF848400FF7B8400FF7B8400FF7B7B00FF7B7B00BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600B5E7FF005AC6FF005AC6
      FF005AC6FF005ABDFF005ABDFF0052BDFF00318CCE0052B5FF0052B5FF004AB5
      FF004AB5FF004AADFF004AADFF0042ADFF00187BD60000000000000000000000
      000000000000000000000000000000000000187BFF00187BFF00187BFF00187B
      FF00187BFF000000000000000000000000000000000000000000000000000000
      0000000000002984FF0094C6FF00FFFFFF00FFFFFF00C6C6C600F7F7F7004A9C
      FF00187BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004A000000000000000000000000000000000000844A
      4A00FF848400FF848400FF848400FF848400FF848400FF848400FF848400BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600B5E7FF0063C6FF005AC6
      FF005AC6FF005AC6FF005ABDFF005ABDFF00318CCE0052BDFF0052B5FF0052B5
      FF004AB5FF004AB5FF004AADFF004AADFF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005AA5FF00EFF7FF00FFFFFF00ADD6FF00187B
      FF00187BFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00F77B7B00FF848400FF848400FF848400FF848400FF848400FF848400BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600B5E7FF0063C6FF0063C6
      FF005AC6FF005AC6FF005AC6FF005ABDFF00318CCE0052BDFF0052BDFF0052B5
      FF0052B5FF004AB5FF004AB5FF004AADFF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000187BFF00187BFF00187BFF00187B
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A00844A4A00AD5A5A00D66B7300FF848400FF848400FF848400FF848400BD63
      63004A181800EFCEAD00FFFFD600FFFFD600FFFFD600FFFFD600FFFFD600FFFF
      D600F7B5B500844A4A000000000000000000187BD600B5E7FF0063C6FF0063C6
      FF0063C6FF005AC6FF005AC6FF005AC6FF00398CCE005ABDFF0052BDFF0052BD
      FF0052B5FF0052B5FF004AB5FF004AB5FF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000187BFF00187B
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000844A4A00844A4A0094525200B5636300EF7B7B00FF848400BD63
      63004A181800944A4A00844A4A00844A4A00844A4A00844A4A00844A4A00844A
      4A00844A4A00844A4A000000000000000000187BD600BDE7FF0063C6FF0063C6
      FF0063C6FF0063C6FF005AC6FF005AC6FF00398CCE005ABDFF005ABDFF0052BD
      FF0052BDFF0052B5FF0052B5FF004AB5FF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000844A4A00844A4A009C5252009C5A
      5A004A1818000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000187BD600E7F7FF00BDE7FF00B5E7
      FF00B5E7FF00B5E7FF00B5E7FF00ADE7FF00639CCE00ADDEFF00ADDEFF00ADDE
      FF00ADDEFF00ADDEFF00ADDEFF00A5DEFF00187BD60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000844A
      4A004A1818000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000187BD600187BD600187B
      D600187BD600187BD600187BD600187BD600187BD600187BD600187BD600187B
      D600187BD600187BD600187BD600187BD6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC6
      8C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
      8400EFBD7B009C6B6300000000000000000094635A00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000B5000000B50000000000000000000000000094635A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A0084524A000000000000000000000000000000000000000000000000009463
      5A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094635A00EFD6BD00F7DEBD00F7D6
      B500EFCEA500E7C69C00E7C69400DEBD8C00E7BD8C00E7BD8400E7BD8400E7BD
      7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD7B009C6B63000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000B5000000B5000000B50000000000000000000000000094635A00EFD6
      B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC68C00EFC6
      8400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFBD
      7B0084524A000000000000000000000000000000000000000000000000009463
      5A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC6
      9400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094635A00EFD6C600F7DEC600F7DE
      B500EFCEAD00DEBD9C00CEAD8C00C6A57B00C6A57B00D6AD7B00DEB57B00E7B5
      7B00E7BD7B00E7BD7B00EFBD7B00EFBD7B00EFBD7B00E7BD7B009C6B63000000
      00000000000000000000000000000000000000000000000000000000B5000000
      B5000000B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000000000000000000000000000000094635A00EFD6
      BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC6
      8C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009463
      5A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094635A00EFDEC600F7E7C600F7DE
      BD00E7CEAD0021212100393931008C7B63009C846300AD8C6B00BD9C6B00C6A5
      7300D6AD7300DEB57B00E7BD7B00E7BD7B00EFBD7B00E7BD7B009C6B63000000
      00000000000000000000000000000000000000000000000000000000B5000000
      B5000000B5000000B50000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B5000000B5000000
      B5000000B500000000000000000000000000000000000000000094635A00EFD6
      C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009463
      6300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6B500EFCEA500DEBD
      9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094636300F7DECE00F7E7CE00F7DE
      C600EFD6B50039393100181821001829310031424200846B52008C735A009C84
      5A00B5946B00C6A56B00DEB57300E7BD7B00E7BD7B00E7BD7B009C6B63000000
      00000000000000000000000000000000000000000000000000000000B5000000
      B5000000B5000000B5000000B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000B5000000B5000000B5000000
      B50000000000000000000000000000000000000000000000000094635A00EFDE
      C600F7E7C600F7DEBD00F7DEB50000730000F7D6AD00EFCEA500B5BD73000073
      00000073000000730000ADAD6300EFBD7B00EFBD7B00EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009463
      6300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DEBD00DEC6A500BDA5
      8400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD8400EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000094636300F7E7D600FFEFD600F7E7
      CE00F7DEC600AD9C8C0010394A00006B9C00004A730008395200394A4A007363
      4A008C735200A5845A00BD9C6B00D6AD7300E7B57B00E7BD7B009C6B63000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000B5000000B5000000000000000000000000000000
      00000000000000000000000000000000B5000000B5000000B5000000B5000000
      000000000000000000000000000000000000000000000000000094636300F7DE
      CE00FFE7CE00F7E7C600F7DEBD000073000000730000B5BD7B0000730000B5BD
      7300EFC69400B5B56B0000730000ADAD6300EFBD7B00EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009C6B
      6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEBD00004A0000004A
      0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC68C00EFBD8400EFBD
      7B00E7BD7B009C6B630000000000000000009C6B6300F7E7DE00FFEFDE00F7E7
      D600F7E7CE00EFDEBD0018394A00006B9C0000639C0018526B00293142004231
      39006B5242007B6B4A009C7B5A00B5946300CEA56B00DEB573009C6B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000F7000000B5000000B5000000B5000000B50000000000000000000000
      000000000000000000000000B5000000B5000000B5000000B500000000000000
      000000000000000000000000000000000000000000000000000094636300F7E7
      D600FFEFD600F7E7CE00F7DEC600007300000073000000730000B5BD7B00EFCE
      A500EFCE9C00EFC69400B5B56B0000730000EFBD8400EFBD7B00EFBD7B00E7BD
      7B0084524A000000000000000000000000000000000000000000000000009C6B
      6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECEB500004A00000894
      100000940800004A0000A58C6B00C6AD8400D6B58400DEB58400E7BD8400EFBD
      8400E7BD7B009C6B630000000000000000009C6B6300F7EFE700FFF7E700FFEF
      DE00F7E7D600F7E7CE0073848400005A84003152630094636300AD6B6B00945A
      5A006339390063524200736342008C735200AD8C5A00C69C6B00946B5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000B5000000B5000000B5000000B500000000000000
      00000000B5000000B5000000B5000000B5000000B50000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B6300F7E7
      DE00FFEFDE00F7E7D600F7E7CE0000730000007300000073000000730000F7D6
      AD00EFCEA500EFCE9C00EFC6940000730000EFC68C00EFBD8400EFBD7B00E7BD
      7B0084524A00000000000000000000000000000000000000000000000000A573
      6300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C8C00004A0000089C
      1800089C1000004A000094846B00A58C6B00A58C6B00BD9C7300DEB58400EFC6
      8C00E7BD84009C6B63000000000000000000A5736300F7EFEF00FFF7EF00FFEF
      E700F7EFDE00F7E7D600F7DECE0008425A008C5A5A00CE8C8C00BD7B7B00AD6B
      6B00945A5A0063393900635239006B5A4200846B4A009C7B5200845A52000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000B5000000B5000000B5000000B5000000
      B5000000B5000000B5000000B5000000B5000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C6B6300F7EF
      E700FFF7E700FFEFDE00F7E7D600007300000073000000730000007300000073
      0000F7D6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00EFBD8400E7BD
      7B0084524A00000000000000000000000000000000000000000000000000A573
      6B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A0000004A000010A5
      210008A51800004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC6
      8C00EFBD84009C6B63000000000000000000A5736B00FFF7F700FFFFF700FFF7
      EF00FFEFE700FFEFDE00F7E7D6004A6B73009C6B6B00DE9C9C00CE8C8C00BD7B
      7B00AD6B6B00945A5A005A313100635239006B5A42007B634A00735242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000B5000000B5000000F7000000
      B5000000F7000000B5000000B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5736300F7EF
      EF00FFF7EF00FFEFE700F7EFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7DE
      B500F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFC68C00E7BD
      840084524A00000000000000000000000000000000000000000000000000AD7B
      6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6420018BD390018B5
      310010AD290010A5210008A51800089C1000004A0000AD947300D6B58C00EFCE
      9400EFC68C00A57363000000000000000000AD7B6B00FFF7F700FFFFFF00FFFF
      F700FFF7EF00FFEFE700FFEFDE00F7E7D6007B524A00E7A5A500DE9C9C00CE8C
      8C00BD7B7B00AD6B6B008C5252005A313100634A39006B5A4200634239000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B5000000B5000000
      B5000000F7000000B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5736B00FFF7
      F700FFFFF700FFF7EF00FFEFE700FFEFDE00F7E7D600F7E7CE00F7E7C6000073
      000000730000007300000073000000730000EFCE9C00EFC69400EFC68C00EFBD
      840084524A00000000000000000000000000000000000000000000000000B57B
      6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE4A0021C6420018BD
      390018B5310010B5290010AD210010A52100004A0000BDA58400DEBD9400EFCE
      9C00EFC69400A57363000000000000000000B57B6B00FFF7F700FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFEFE700FFEFDE00E7CEBD007B524A00E7A5A500DE9C
      9C00CE8C8C00BD7B7B00A56B6B008C5252005A313100635239005A3931000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000B5000000B5000000F7000000
      B5000000B5000000F7000000F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B6B00FFF7
      F700FFFFFF00FFFFF700FFF7EF0000730000FFEFDE00F7E7D600F7E7CE00F7E7
      C60000730000007300000073000000730000EFCEA500EFCE9C00EFCE9400EFC6
      8C0084524A00000000000000000000000000000000000000000000000000B584
      6B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A0000004A000021CE
      4A0021C64200004A0000004A0000004A0000004A0000E7C6A500EFCEA500F7CE
      A500EFCE9C009C7363000000000000000000B5846B00FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEFDE00E7CEBD00734A4200E7A5
      A500DE9C9C00CE8C8C00BD7B7B00A56B6B008C5252005A393100523931000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000B5000000B5000000F7000000B5000000
      F7000000F7000000F7000000B5000000F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57B6B00FFF7
      F700FFFFFF00FFFFFF00FFF7F70000730000BDD6AD00FFEFDE00F7E7D600F7E7
      CE00B5C69400007300000073000000730000F7D6AD00EFCEA500EFCE9C00EFC6
      940084524A00000000000000000000000000000000000000000000000000BD84
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700004A000029D6
      5A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DEB500F7D6AD00EFD6
      A500CEB594008C6B63000000000000000000BD846B00FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEFDE00BDA59400734A
      4200E7A5A500DE9C9C00CE8C8C00B57B7B00A56B6B008C5252005A3131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000F7000000F7000000F7000000B5000000F7000000
      0000000000000000F7000000F7000000F7000000F70000000000000000000000
      0000000000000000000000000000000000000000000000000000B5846B00FFF7
      F700FFFFFF00FFFFFF00FFFFFF00BDDEB50000730000BDD6AD00FFEFDE00B5CE
      9C0000730000B5C694000073000000730000F7D6AD00F7D6AD00F7CEA500EFCE
      9C0084524A00000000000000000000000000000000000000000000000000C68C
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A000031DE
      630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DEBD00E7CEAD00C6B5
      9400A5947B00846363000000000000000000C68C6B00FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEFE700FFEFDE00BDA5
      9400734A4200E7A5A500DE9C9C00C68C8C00B57B7B00A56B6B008C5252005A31
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000F7000000F7000000B5000000F7000000F700000000000000
      000000000000000000000000F7000000F7000000F7000000F700000000000000
      0000000000000000000000000000000000000000000000000000BD846B00FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDDEB50000730000007300000073
      0000B5CE9C00F7E7CE00F7DEC60000730000F7DEB500F7D6AD00EFD6A500CEB5
      940084524A00000000000000000000000000000000000000000000000000C68C
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A0000004A
      0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6BD00BDAD9C00A59C
      8C00A5948400846B63000000000000000000C68C7300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFEFE700FFEF
      DE00BDA5940094636300EFADAD00DE9C9C00C68C8C00B57B7B00844A4A00424A
      5200314252000000000000000000000000000000000000000000000000000000
      00000000F7000000F7000000F7000000F7000000F70000000000000000000000
      0000000000000000000000000000000000000000F7000000F7000000F7000000
      0000000000000000000000000000000000000000000000000000C68C6B00FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFEF
      E700FFEFDE00F7E7D600F7E7CE00F7DEC600F7DEBD00E7CEAD00C6B59400A594
      7B0084524A00000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C635A0094635A009463
      5A0094635A009C6B5A000000000000000000CE947300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00FFF7
      E700EFD6C60084524A0094636300EFADAD00DE9C9C00524A5200008CC60000AD
      EF0000A5E7000084C60000000000000000000000000000000000000000000000
      F7000000F7000000F7000000F7000000F7000000000000000000000000000000
      000000000000000000000000000000000000000000000000F7000000F7000000
      F700000000000000000000000000000000000000000000000000C68C7300FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7
      EF00FFEFE700FFEFDE00FFE7D600FFEFD600E7D6BD00BDAD9C00A59C8C00A594
      840084524A00000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA56B00DE9C4A00E794
      3900EF8C2100A56B6B000000000000000000CE947300FFF7F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFFF
      EF00DEC6B5009C635A00AD7B520094636300C68C8C00087BAD0000BDFF0000BD
      FF0000A5E70000189C00000084000000000000000000000000000000F7000000
      F7000000F7000000F7000000F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      F700000000000000000000000000000000000000000000000000CE947300FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFF7EF00FFF7E700EFD6C600A5635A00A5635A00A5635A00A5635A00A563
      5A00A5635A00000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB57300EFAD5200F7A5
      3100A56B6B00000000000000000000000000D69C7300FFFFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700DEC6BD009C635A00EFB57300B57B420073424200009CDE0000BDFF00008C
      D60000189C0000089C000008940000008400000000000000F7000000F7000000
      F7000000F7000000F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE947300FFF7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFFFEF00DEC6B500A5635A00DEA56B00DE9C4A00E7943900EF8C
      2100A56B6B00000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB57300EFA55200A56B
      6B0000000000000000000000000000000000D69C7300FFFFF700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DEC6C6009C635A00EFB57300EFA552007B4A4A000094D60000B5F7000029
      A5000021DE000021BD000018B50000089400000000000000F7000000F7000000
      F7000000F7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C7300FFFF
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700DEC6BD00A5635A00EFB57300EFAD5200F7A53100A56B
      6B0000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB57300A56B6B000000
      000000000000000000000000000000000000D69C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7D6CE009C635A00EFB57300A56B6B0000000000000000000084C6000821
      BD00294AF7000829CE000018B50000008C00000000000000F7000000F7000000
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C7300FFFF
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEC6C600A5635A00EFB57300EFA55200A56B6B000000
      000000000000000000000000000000000000000000000000000000000000D694
      7300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6AD00DEBDAD00DEBD
      AD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B6B00000000000000
      000000000000000000000000000000000000CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B009C635A00A56B6B00000000000000000000000000000000001021
      BD005273FF001839E70000089400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7D6CE00A5635A00EFB57300A56B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001021BD000008A50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00A5635A00A56B6B0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000900000000100010000000000C00600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFE00007FFFDFFFFFFFFFFFEFFE0
      0007FFF9FFFFFFFFFBFC7FE0000700003F000083F1C03FE0000700003F0000A3
      E0001FE0000700000F000083C0000FE000070000070000BB800007E000070000
      03000081000003E00007000003FFFFFC000001E00007000001FFFFFF00000000
      00000000310000830008006000060000390000A3000801600006000039000083
      00080160000600003D0000BB00000300000000003D000081000000E000070000
      3FFFFFFC000001E0000700003FFFFFFF00001FE0000700003F000083000C7FE0
      000700003F0000A3000FFFE0000700003F000083000FFFE0000700007F0000BB
      000FFFE000070000FF000081C03FFFE000070001FFFFFFFCFFFFFFE000070003
      FFFFFFFFFFFFFFE000070007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF0FFFFFFFFBFFFFFC79FFFC3801FFE007F1C07FF8003FF81000FFC001
      E0003FF00007F80000FFC000C0001FE00000F80000FFC00080001FC00000FC00
      01FFC000000003800001F00007FBE00000000180000180000FF9E00000000080
      000100000FF0F801000C0080000100000FC0780F000C0180000100000F803007
      000801C0000100000F806003000003F0000300000F00E001000007FC00070000
      0F19C00100000FFC000F00001F3BC00100001FFC00FF00007F3FC001000C7FF8
      01FF0003FF3FC001000FFFF801FF0003FFBFC003000FFFF801FF0003FFBFE003
      000FFFF003FF0003FFFFE007C03FFFE003FFC007FFFFF81FFFFFFFE007FFF00F
      FFFFFFFFFFFFFFFE0FFFFE7FFFFFFFFFC7FFFFFFFFFFFFFBFFFFFFFF83FFFFF3
      FFFFFFF3FFFFC3FF01FFFFF0FFFFFFE3FFFF81FF00FFFFF03FFFFFC007FF81FF
      007FFFF81FFFFF8007FF81FF807FFFF80FFFFF0007FF81FFC07FFFFC07FFFF80
      07FF81FFE037FF8000FF804001FF81FFF003FF00007F006300FF00FFF8000700
      007F007300FE007FFC000300007F007B00FC003FFE000100003F007F00F8001F
      FF000000001F007B00F0000FFF800000000F007300E00007FF80000000070063
      00C00003FF8000000003000007800001FF0000000001000007000000FF001000
      0001000007800001FF0030000001000007E00003FF8000000043000007E07DC9
      FFC00000006700007FE07F9CFFE00100007F00007FF0FFC9FFF00300007F0000
      7FFFFFE3FFFFFF8000FF8000FFFFFFF7FFFFFFFFE7FFFFFBFFFFFFFFFFFFFFFF
      07FFFFF3FFFFFFFFFFFFFFF807FFFFE3FFFFFFFFFFFFFFE00003FFC007FFC0FF
      FF7FFFE00003FF8007FE007FFE3FFFE00003FF0007F8001FFC1FFFE00003FF80
      07F0000FF80FFFE00003804001E00007F007FFE00003006300E00001E003FFE0
      0003007300C00000C041FFE00003007B00C00000C0E0FFE00003007F00C00000
      C1F87FE00003007F00800001E3FC3FE00003007F00800001F7FE1FE00003007F
      00800003FFFF8FE0000300007F800003FFFFC7E0000300007F00F003FFFFF3E0
      000300007F07F807FFFFFDE0000300007FFFFE07FFFFFFE0000300007FFFFF0F
      FFFFFFE0000300007FFFFFCFFFFFFFF8000300007FFFFFFFFFFFFFFF07FF0000
      7FFFFFFFFFFFFFFFE7FF8000FFFFFFFFE00003FFFFFFFFFFFFFFFFFFE0000300
      001FFFFFF9C00007E0000300001FFFFFF1C00007E0000300001FC7FFE3C00007
      E0000300001FC3FF87C00007E0000300001FC1FF0FC00007E0000300001FE0FE
      1FC00007E0000300001FF07C3FC00007E0000300001FFC307FC00007E0000300
      001FFE00FFC00007E0000300001FFF01FFC00007E0000300001FFF83FFC00007
      E0000300001FFF01FFC00007E0000300001FFE00FFC00007E0000300001FFC18
      7FC00007E0000300000FF83C3FC00007E00003000007F07F1FC00007E0000300
      0003E0FF8FC00007E00003000001C1FFEFC00007E0000700000083FFFFC00007
      E0000F00000087FFFFC0000FE0001F0000C08FFFFFC0001FE0003F0001E1FFFF
      FFC0003FFFFFFFFFFFF3FFFFFFC0007F00000000000000000000000000000000
      000000000000}
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    Left = 320
    Top = 168
  end
  object StoredProc: TpFIBStoredProc
    Database = pFIBDatabase1
    Transaction = WriteTransaction
    Left = 352
    Top = 168
  end
  object ImageList1: TImageList
    Left = 384
    Top = 168
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      00000000000000000000000000000000000000000000BC4E0300BC4E0300BC4E
      0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E
      0300BC4E0300BC4E0300BC4E0300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6E0000006E000000000000000000000000000000000000000000000000000000
      6E0000006E000000000000000000000000000000000000000000000000000000
      000000000000004B0000004B0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC4D0200FFFFFF00FFFF
      FF00FFFFFF0068BA5B00FFEACF00FFEACF00FFEACF00B47B4100726A1E00FFCF
      A000FFCFA000FFCFA000BC4C0100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006E00001D
      E8000010DC0000006E000000000000000000000000000000000000006E000004
      E2000008E70000006E0000000000000000000000000000000000000000000000
      0000004B00000F9E1C000F9D1E00004B00000000000000000000000000000000
      00000000000000000000000000000000000000000000BC4E0300FFFFFF00FFFF
      FF00FFFFFF0068BA5B00FFEACF00FFEBD300FFE9C5007D706D000E485F007368
      5B00D4AC8300FFCFA000BD4D0200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006E00001A
      E200001FEB000010D90000006E00000000000000000000006E000005DF000009
      EB000003DB0000006E000000000000000000000000000000000000000000004B
      00001CB1350011A422000C9C190011A02100004B000000000000000000000000
      00000000000000000000000000000000000000000000BA4C010070B7600067B6
      590067B65B003D9F2D0063AF4B0067AF4B0067AF48004E9941003C636F009F67
      6D005A4A360052773200BA4D0100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6E00001ADF000020EB000013DC0000006E0000006E000005E200000BEB000004
      DA0000006E000000000000000000000000000000000000000000004B00002EC6
      520024BC430013922400004B00000D931A000E9D1D00004B0000000000000000
      00000000000000000000000000000000000000000000BC4D0200EDF3E500EDF7
      EB00EDF7EB0062B55500DAE5C400EDE6C900EDE0BB00E1D8A6005A7D3F00E595
      9A00A068690060483800C1490000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000006E00001BDF000022EB000012E6000008EA000009EB000004DF000000
      6E000000000000000000000000000000000000000000004B000035CA5E0039D4
      65001CA13400004B000000000000004B00000A8615000F991C00004B00000000
      00000000000000000000000000000000000000000000BC4D0200FFFFF800FCFC
      FF00F7F7FF0063B46000F0F4E100FFFCEE00FFF2E600FAE6C70067AC4700DE9D
      9A00D9939900B16462006B5B3300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006E00001BE3000016EB000011EB00000ADF0000006E000000
      0000000000000000000000000000000000000000000000000000004B000029B5
      4800004B000000000000000000000000000000000000004B00000C951800004B
      00000000000000000000000000000000000000000000C64E00008B8AF2004445
      EE003232E300222BC7006363F700A7BACE00A6D4880096C57B004EA739009FC4
      780084834F00758089000897C9000018A0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000006E000021E700001EEB00001AEB000017DF0000006E000000
      000000000000000000000000000000000000000000000000000000000000004B
      0000000000000000000000000000000000000000000000000000004B00000986
      1100004B00000000000000000000000000000000000066479D004647CC009790
      B600A099B400A7A1C1005B59C1001B2BBB006E9D9A009ED387004DA73C00A0CE
      8C00AFC27D006EADA7000559E000040CA5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000006E00062DE3000430EB000020E200001EE2000027EB000019DF000000
      6E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B000000000000000000004141FA00545AF000D4D4C500FFEF
      AC00F4BF8100FBC78800FFFAD1006D6BBD005952FF00EDEDF2006DBA5900FFFC
      FF00FFEFDD00FFE5B8005D446C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6E000C35E4000E3CEB00052BDC0000006E0000006E00001FDC00002AEB00001C
      DF0000006E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004B0000004B0000000000004141FA009F9ED700FFFFD400FEFC
      CA00FBF4C400F4D19600EEBB7D00D5C4B100393ACE00B4B8E90079C15B00FFF8
      F000FEEBD400FEE1BA00B0490A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006E001442
      E4001645EB00092ED90000006E00000000000000000000006E000020D900012C
      EB00001FE20000006E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D4CF400AFBAE300FFFFF600FFFF
      D9008687750031343400544B3E00A39696004145D40092463700CE580100C756
      0200C7560200C756020000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000006E001C4B
      E7001037DB0000006E000000000000000000000000000000000000006E000022
      DC000027E40000006E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004545F800B2B2E000FFFFFF00FFFF
      F300D8D8B7005F605300B2976B00E7CBA900353EE5008E403000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6E0000006E000000000000000000000000000000000000000000000000000000
      6E0000006E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004545F8007E79E300F8F4EB00FFFF
      FF00FFFFFF00F2F2DE00A7A17900938FB5002D30FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004647FB00827FE000DDD8
      E500EAF4F000EEF3F600A6A5DC003839E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003536FE00403E
      F0004A49E9003C3CED002828FA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFF80010000
      E7E7F9FF80010000C3C3F0FF80010000C183E07F80010000E007C03F80010000
      F00F821F80010000F81FC78F80000000F81FEFC780000000F00FFFF300010000
      E007FFF900010000C183FFFF00030000C3C3FFFF003F0000E7E7FFFF007F0000
      FFFFFFFF80FF0000FFFFFFFFC1FF000000000000000000000000000000000000
      000000000000}
  end
  object dsStatistics: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'select * from MON_IMPORT_LOG_SEL_ERRORS_REP(:ONLY_KVARTAL, :ON_Y' +
        'EAR, :PERIOD_BEG, :PERIOD_END, :KV_NUM, :ONLY_MONTH, :ONLY_ERROR' +
        'S, :NOT_SOLVED_ERRORS, :ID_TYPE_ORG)')
    Left = 288
    Top = 200
    poSQLINT64ToBCD = True
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'select * from MON_IMPORT_LOG_SEL_ERRORS_REP(0, null, null, null,' +
        ' null, 0, 1, 0, :ID_TYPE_ORG)')
    Left = 320
    Top = 200
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 352
    Top = 200
  end
  object dsTypeOrg: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      ''
      'select t.id_type_org, t.name_type_org from MON_SP_TYPE_ORG t'
      'union'
      
        'select cast(null as numeric(18,0)), cast('#39#1042#1089#1110#39' as Varchar(60)) f' +
        'rom RDB$DATABASE'
      '')
    Left = 104
    Top = 168
    poSQLINT64ToBCD = True
  end
  object dscTypeOrg: TDataSource
    DataSet = dsTypeOrg
    Left = 136
    Top = 168
  end
  object dsReport: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      
        'select * from MON_IMPORT_LOG_SEL_MONTH(:ID_TYPE_ORG, :ACTUAL_YEA' +
        'R, 1, 12, :IN_CODE, :IN_NAME, :IN_PROGRAM)'
      
        'where (month1 <> -1) or (month2 <> -1) or (month3 <> -1) or (mon' +
        'th4 <> -1) or (month5 <> -1) or (month6 <> -1) or'
      
        '      (month7 <> -1) or (month8 <> -1) or (month9 <> -1) or (mon' +
        'th10 <> -1) or (month11 <> -1) or (month12 <> -1)'
      'order by NAME_ORGANIZATION')
    Left = 520
    Top = 88
    poSQLINT64ToBCD = True
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dsReport
    Left = 584
    Top = 88
  end
  object frxReport1: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39372.785181747700000000
    ReportOptions.LastChange = 39510.604611747690000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure CheckBox1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      ' a : array [1..12] of integer;'
      'begin'
      '  TfrxMemoView(Sender).color := clSilver;'
      '  a[1] :=<frxDBDataset1."MONTH1">;'
      '  a[2] :=<frxDBDataset1."MONTH2">;'
      '  a[3] :=<frxDBDataset1."MONTH3">;'
      '  a[4] :=<frxDBDataset1."MONTH4">;'
      '  a[5] :=<frxDBDataset1."MONTH5">;'
      '  a[6] :=<frxDBDataset1."MONTH6">;'
      '  a[7] :=<frxDBDataset1."MONTH7">;'
      '  a[8] :=<frxDBDataset1."MONTH8">;'
      '  a[9] :=<frxDBDataset1."MONTH9">;'
      '  a[10] :=<frxDBDataset1."MONTH10">;'
      '  a[11] :=<frxDBDataset1."MONTH11">;'
      '  a[12] :=<frxDBDataset1."MONTH12">;'
      ''
      '  if a[sender.tag] = -1 then'
      '  begin'
      '      TfrxMemoView(Sender).color := clWhite;'
      '  end;'
      '  if a[sender.tag] = 1 then'
      '  begin'
      '      TfrxMemoView(Sender).color := clGray;'
      '  end;'
      'end;'
      ''
      'procedure Memo20OnBeforePrint(Sender: TfrxComponent);'
      'var'
      ' a : array [1..4] of integer;'
      'begin'
      '  TfrxMemoView(Sender).color := clSilver;'
      '  a[1] :=<frxDBDataset1."KV1">;'
      '  a[2] :=<frxDBDataset1."KV2">;'
      '  a[3] :=<frxDBDataset1."KV3">;'
      '  a[4] :=<frxDBDataset1."KV4">;'
      ''
      '  if a[sender.tag] = -1 then'
      '  begin'
      '      TfrxMemoView(Sender).color := clWhite;'
      '  end;'
      '  if a[sender.tag] = 1 then'
      '  begin'
      '      TfrxMemoView(Sender).color := clGray;'
      '  end;'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'var'
      ' i : integer;'
      'begin'
      '  if <KV1> = false then'
      '  begin'
      '    Memo24.Visible := false;'
      '    Memo25.Visible := false;'
      '    Memo26.Visible := false;'
      '    Memo36.Visible := false;'
      '    Memo8.Visible := false;'
      '    Memo9.Visible := false;'
      '    Memo10.Visible := false;'
      '    Memo20.Visible := false;'
      '  end;'
      '  if <KV2> = false then'
      '  begin'
      '    Memo27.Visible := false;'
      '    Memo28.Visible := false;'
      '    Memo29.Visible := false;'
      '    Memo37.Visible := false;'
      '    Memo11.Visible := false;'
      '    Memo12.Visible := false;'
      '    Memo13.Visible := false;'
      '    Memo21.Visible := false;'
      '  end;'
      '  if <KV3> = false then'
      '  begin'
      '    Memo30.Visible := false;'
      '    Memo31.Visible := false;'
      '    Memo32.Visible := false;'
      '    Memo38.Visible := false;'
      '    Memo14.Visible := false;'
      '    Memo15.Visible := false;'
      '    Memo16.Visible := false;'
      '    Memo22.Visible := false;'
      '  end;'
      '  if <KV4> = false then'
      '  begin'
      '    Memo33.Visible := false;'
      '    Memo34.Visible := false;'
      '    Memo35.Visible := false;'
      '    Memo39.Visible := false;'
      '    Memo17.Visible := false;'
      '    Memo18.Visible := false;'
      '    Memo19.Visible := false;'
      '    Memo23.Visible := false;'
      '  end;'
      '  if <M1> = false then'
      '  begin'
      '   Memo24.Visible := false;'
      '   Memo8.Visible := false;'
      '  end;'
      '  if <M2> = false then'
      '  begin'
      '   Memo25.Visible := false;'
      '   Memo9.Visible := false;'
      '  end;'
      '  if <M3> = false then'
      '  begin'
      '   Memo26.Visible := false;'
      '   Memo10.Visible := false;'
      '  end;'
      '  if <M4> = false then'
      '  begin'
      '   Memo27.Visible := false;'
      '   Memo11.Visible := false;'
      '  end;'
      '  if <M5> = false then'
      '  begin'
      '   Memo28.Visible := false;'
      '   Memo12.Visible := false;'
      '  end;'
      '  if <M6> = false then'
      '  begin'
      '   Memo29.Visible := false;'
      '   Memo13.Visible := false;'
      '  end;'
      '  if <M7> = false then'
      '  begin'
      '   Memo30.Visible := false;'
      '   Memo14.Visible := false;'
      '  end;'
      '  if <M8> = false then'
      '  begin'
      '   Memo31.Visible := false;'
      '   Memo15.Visible := false;'
      '  end;'
      '  if <M9> = false then'
      '  begin'
      '   Memo32.Visible := false;'
      '   Memo16.Visible := false;'
      '  end;'
      '  if <M10> = false then'
      '  begin'
      '   Memo33.Visible := false;'
      '   Memo17.Visible := false;'
      '  end;'
      '  if <M11> = false then'
      '  begin'
      '   Memo34.Visible := false;'
      '   Memo18.Visible := false;'
      '  end;'
      '  if <M12> = false then'
      '  begin'
      '   Memo35.Visible := false;'
      '   Memo19.Visible := false;'
      '  end;'
      ''
      '  i := 0;'
      '  if Memo24.visible then i := i + 1;'
      '  if Memo25.visible then i := i + 1;'
      '  if Memo26.visible then i := i + 1;'
      '  if i <> 0 then'
      '  begin'
      '    Memo24.Width := Memo36.Width / i;'
      '    Memo25.Width := Memo36.Width / i;'
      '    Memo26.Width := Memo36.Width / i;'
      '    Memo8.Width := Memo36.Width / i;'
      '    Memo9.Width := Memo36.Width / i;'
      '    Memo10.Width := Memo36.Width / i;'
      '  end;'
      ''
      '  i := 0;'
      '  if Memo27.visible then i := i + 1;'
      '  if Memo28.visible then i := i + 1;'
      '  if Memo29.visible then i := i + 1;'
      '  if i <> 0 then'
      '  begin'
      '    Memo27.Width := Memo36.Width / i;'
      '    Memo28.Width := Memo36.Width / i;'
      '    Memo29.Width := Memo36.Width / i;'
      '    Memo11.Width := Memo36.Width / i;'
      '    Memo12.Width := Memo36.Width / i;'
      '    Memo13.Width := Memo36.Width / i;'
      '  end;'
      ''
      '  i := 0;'
      '  if Memo30.visible then i := i + 1;'
      '  if Memo31.visible then i := i + 1;'
      '  if Memo32.visible then i := i + 1;'
      '  if i <> 0 then'
      '  begin'
      '    Memo30.Width := Memo36.Width / i;'
      '    Memo31.Width := Memo36.Width / i;'
      '    Memo32.Width := Memo36.Width / i;'
      '    Memo14.Width := Memo36.Width / i;'
      '    Memo15.Width := Memo36.Width / i;'
      '    Memo16.Width := Memo36.Width / i;'
      '  end;'
      ''
      '  i := 0;'
      '  if Memo33.visible then i := i + 1;'
      '  if Memo34.visible then i := i + 1;'
      '  if Memo35.visible then i := i + 1;'
      '  if i <> 0 then'
      '  begin'
      '    Memo33.Width := Memo36.Width / i;'
      '    Memo34.Width := Memo36.Width / i;'
      '    Memo35.Width := Memo36.Width / i;'
      '    Memo17.Width := Memo36.Width / i;'
      '    Memo18.Width := Memo36.Width / i;'
      '    Memo19.Width := Memo36.Width / i;'
      '  end;'
      
        '{ if memo24.visible then Memo1.Width := Memo1.Width + memo24.wid' +
        'th;'
      
        ' if memo25.visible then Memo1.Width := Memo1.Width + memo25.widt' +
        'h;'
      
        ' if memo26.visible then Memo1.Width := Memo1.Width + memo26.widt' +
        'h;'
      
        ' if memo27.visible then Memo1.Width := Memo1.Width + memo27.widt' +
        'h;'
      
        ' if memo28.visible then Memo1.Width := Memo1.Width + memo28.widt' +
        'h;'
      
        ' if memo29.visible then Memo1.Width := Memo1.Width + memo29.widt' +
        'h;'
      
        ' if memo30.visible then Memo1.Width := Memo1.Width + memo30.widt' +
        'h;'
      
        ' if memo31.visible then Memo1.Width := Memo1.Width + memo31.widt' +
        'h;'
      
        ' if memo32.visible then Memo1.Width := Memo1.Width + memo32.widt' +
        'h;'
      
        ' if memo33.visible then Memo1.Width := Memo1.Width + memo33.widt' +
        'h;'
      
        ' if memo34.visible then Memo1.Width := Memo1.Width + memo34.widt' +
        'h;'
      
        ' if memo35.visible then Memo1.Width := Memo1.Width + memo35.widt' +
        'h;'
      ' }'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    Left = 552
    Top = 88
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' vars'
        Value = Null
      end
      item
        Name = 'KV1'
        Value = Null
      end
      item
        Name = 'KV2'
        Value = Null
      end
      item
        Name = 'KV3'
        Value = Null
      end
      item
        Name = 'KV4'
        Value = Null
      end
      item
        Name = 'M1'
        Value = Null
      end
      item
        Name = 'M2'
        Value = Null
      end
      item
        Name = 'M3'
        Value = Null
      end
      item
        Name = 'M4'
        Value = Null
      end
      item
        Name = 'M5'
        Value = Null
      end
      item
        Name = 'M6'
        Value = Null
      end
      item
        Name = 'M7'
        Value = Null
      end
      item
        Name = 'M8'
        Value = Null
      end
      item
        Name = 'M9'
        Value = Null
      end
      item
        Name = 'M10'
        Value = Null
      end
      item
        Name = 'M11'
        Value = Null
      end
      item
        Name = 'M12'
        Value = Null
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
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo42: TfrxMemoView
          Align = baWidth
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #1042#1053#1047' '#1097#1086' '#1085#1072#1076#1072#1083#1080' '#1079#1074#1110#1090' '#1079#1072' [YEAR] '#1088#1110#1082'.')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 37.795300000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 71.811070000000000000
          Width = 385.512060000000000000
          Height = 37.795300000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1053#1072#1079#1074#1072)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 26.456710000000000000
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1050#1086#1076)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 457.323130000000000000
          Width = 34.015770000000000000
          Height = 37.795300000000000000
          Visible = False
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #1045#1044#1056#1055#1054#1059)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          Left = 491.338900000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '1')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          Left = 510.236550000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '2')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          Left = 529.134200000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '3')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          Left = 548.031850000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '4')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          Left = 566.929500000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '5')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          Left = 585.827150000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '6')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          Left = 604.724800000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '7')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          Left = 623.622450000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '8')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Align = baLeft
          Left = 642.520100000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '9')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Align = baLeft
          Left = 661.417750000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '10')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Align = baLeft
          Left = 680.315400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '11')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Align = baLeft
          Left = 699.213050000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '12')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Align = baLeft
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'I')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Align = baLeft
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'II')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Align = baLeft
          Left = 604.724800000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'III')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Align = baLeft
          Left = 661.417750000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Color = 14211288
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            'IV')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Width = 26.456710000000000000
          Height = 37.795300000000000000
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #8470' '#1087'.'#1087'.')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 37.795300000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Align = baLeft
          Left = 71.811070000000000000
          Width = 385.512060000000000000
          Height = 37.795300000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."NAME_ORGANIZATION"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Align = baLeft
          Left = 26.456710000000000000
          Width = 45.354360000000000000
          Height = 37.795300000000000000
          DataField = 'CODE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."CODE"]')
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Left = 457.323130000000000000
          Width = 34.015770000000000000
          Height = 37.795300000000000000
          Visible = False
          DataField = 'EDRPOU'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.Strings = (
            '[frxDBDataset1."EDRPOU"]')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Tag = 1
          Align = baLeft
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Tag = 2
          Align = baLeft
          Left = 548.031850000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Tag = 3
          Align = baLeft
          Left = 604.724800000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Tag = 4
          Align = baLeft
          Left = 661.417750000000000000
          Top = 18.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo20OnBeforePrint'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Tag = 1
          Align = baLeft
          Left = 491.338900000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo9: TfrxMemoView
          Tag = 2
          Align = baLeft
          Left = 510.236550000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo10: TfrxMemoView
          Tag = 3
          Align = baLeft
          Left = 529.134200000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo11: TfrxMemoView
          Tag = 4
          Align = baLeft
          Left = 548.031850000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo12: TfrxMemoView
          Tag = 5
          Align = baLeft
          Left = 566.929500000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo13: TfrxMemoView
          Tag = 6
          Align = baLeft
          Left = 585.827150000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo14: TfrxMemoView
          Tag = 7
          Align = baLeft
          Left = 604.724800000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo15: TfrxMemoView
          Tag = 8
          Align = baLeft
          Left = 623.622450000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo16: TfrxMemoView
          Tag = 9
          Align = baLeft
          Left = 642.520100000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo17: TfrxMemoView
          Tag = 10
          Align = baLeft
          Left = 661.417750000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo18: TfrxMemoView
          Tag = 11
          Align = baLeft
          Left = 680.315400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo19: TfrxMemoView
          Tag = 12
          Align = baLeft
          Left = 699.213050000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'CheckBox1OnBeforePrint'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo40: TfrxMemoView
          Align = baLeft
          Width = 26.456710000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        object Memo41: TfrxMemoView
          Align = baRight
          Left = 461.102660000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            #1057#1090#1086#1088'. [Page#] '#1079' [TotalPages#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 52.913420000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object Memo43: TfrxMemoView
          Left = 18.897650000000000000
          Top = 30.236240000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            '[Date]')
        end
      end
    end
  end
  object pFIBDataSet2: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select l.is_error, l.is_kvartal, l.import_date,'
      '       l.file_name, u.full_name, l.comp_name,'
      '       l.comp_ip, l.note'
      '  from mon_import_log l'
      '  left join users u on (l.id_user = u.id_user)'
      
        '  left join mon_organizations o on (l.id_organization = o.id_org' +
        'anization)'
      '  where'
      '       (extract(year from l.date_data) = :ACTUAL_YEAR) and'
      '       (o.id_organization = ?MAS_ID_ORGANIZATION)'
      'union'
      
        'select cast(0 as integer), cast(0 as integer), cast(DATE_PRINT a' +
        's timestamp),'
      
        '       cast('#39#1044#1088#1091#1082' '#1087#1110#1089#1100#1084#1072' '#1087#1088#1086' '#1085#1077#1074#1080#1082#1086#1085#1103#1085#1085#1103' '#1074#1080#1084#1086#1075#39' as varchar(500))' +
        ', cast(NAME_USER as varchar(255)), cast('#39#39' as varchar(60)),'
      '      cast('#39#39' as varchar(16)), cast('#39#39' as varchar(100))'
      
        '       from mon_print_letter_log_sel(?MAS_ID_ORGANIZATION, :ACTU' +
        'AL_YEAR) p')
    DataSource = DataSource
    DefaultFormats.DateTimeDisplayFormat = 'dd.mm.yyyy HH:mm:ss'
    DefaultFormats.DisplayFormatTime = 'HH:mm'
    Left = 8
    Top = 408
    poUseBooleanField = False
    poSQLINT64ToBCD = True
  end
  object DataSource2: TDataSource
    DataSet = pFIBDataSet2
    Left = 40
    Top = 408
  end
  object frxReport2: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1047#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
    ReportOptions.CreateDate = 39373.447578298600000000
    ReportOptions.LastChange = 39385.586882303240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnPrintReport = frxReport2PrintReport
    Left = 664
    Top = 72
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxLetter'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 30.000000000000000000
      RightMargin = 15.000000000000000000
      TopMargin = 20.000000000000000000
      BottomMargin = 20.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 623.622450000000000000
        Top = 18.897650000000000000
        Width = 623.622450000000000000
        object Memo1: TfrxMemoView
          Align = baRight
          Left = 343.937230000000000000
          Top = 136.063080000000000000
          Width = 279.685220000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.Strings = (
            #1050#1077#1088#1110#1074#1085#1080#1082#1091' '#1087#1110#1076#1074#1110#1076#1086#1084#1095#1086#1111' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 306.141930000000000000
          Top = 162.519790000000000000
          Width = 317.480520000000000000
          Height = 124.724490000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.Strings = (
            '[frxLetter."NAME_ORGANIZATION"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 291.023810000000000000
          Width = 623.622450000000000000
          Height = 109.606370000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haBlock
          LineSpacing = 6.000000000000000000
          Memo.Strings = (
            
              #1055#1088#1086#1089#1080#1084#1086' '#1079#1074#1077#1088#1085#1091#1090#1080' '#1042#1072#1096#1091' '#1091#1074#1072#1075#1091' '#1085#1072' '#1085#1077#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1074#1080#1084#1086#1075' '#1085#1072#1082#1072#1079#1091' '#1052#1054#1053#1059' '#1074#1110#1076 +
              ' 30.08.2007'#1088'. '#8470' 773 '#1090#1072' '#1083#1080#1089#1090#1072' '#1052#1054#1053#1059' '#1074#1110#1076' 18.09.07 '#8470' 10/1-261 '#1110' '#1090#1077#1088#1084 +
              #1110#1085#1086#1074#1086' ('#1074' 3-'#1093' '#1076#1077#1085#1085#1080#1081' '#1089#1090#1088#1086#1082') '#1085#1072#1076#1072#1090#1080' '#1097#1086#1084#1110#1089#1103#1095#1085#1080#1081' '#1079#1074#1110#1090' '#1076#1086' '#1044#1077#1087#1072#1088#1090#1072#1084#1077#1085#1090 +
              #1091' '#1077#1082#1086#1085#1086#1084#1110#1082#1080' '#1110' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103'. ')
          ParagraphGap = 30.000000000000000000
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baWidth
          Top = 445.984540000000000000
          Width = 623.622450000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            
              #1044#1080#1088#1077#1082#1090#1086#1088' '#1044#1077#1087#1072#1088#1090#1072#1084#1077#1085#1090#1091#9'                                      '#1055'.'#1052'.' +
              ' '#1050#1091#1083#1110#1082#1086#1074)
          ParentFont = False
        end
      end
    end
  end
  object dsLetter: TpFIBDataSet
    Database = pFIBDatabase1
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'select * from MON_ORGANIZATIONS_INFO(?MAS_ID_ORGANIZATION)')
    DataSource = DataSource
    Left = 632
    Top = 72
    poSQLINT64ToBCD = True
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxLetter'
    CloseDataSource = False
    DataSet = dsLetter
    Left = 696
    Top = 72
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 584
    Top = 136
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    FixedWidth = True
    Background = False
    Left = 616
    Top = 136
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 584
    Top = 168
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    Left = 616
    Top = 168
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 648
    Top = 136
  end
end
