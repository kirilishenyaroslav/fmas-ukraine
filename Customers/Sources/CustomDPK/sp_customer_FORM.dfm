object Fsp_customer: TFsp_customer
  Left = 540
  Top = 212
  Width = 754
  Height = 558
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1110#1074
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 240
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000040010000000000000000000000000000000000002826
    A500FF00FF0086777700924E4100B5321500EE533000E2552D00FF6E4600ED6A
    47006E2D130095685200BCFBAD0045923500C9FBBF00C7F2C40060CA5B000087
    000000800000007D0000007900000078000000590000028604000F9313000176
    050006911100099518000A991A0006370B0015B135000948160013B63B001391
    35001ABC49001DCC500023C558003570810057838F005A8799000B6E9A005298
    BC00166997002377A60007507E0013699C00156392000E2B3D0002426D000237
    5C00003C6A00033E6800064F83001D78BD0039ACFF0035A6FF0037A7FF002990
    EA00288EE6002D98FA00309DFB00319DFB0034A0FF00000102002890FB002993
    FF002991FA002A95FE002C96FB000464CC00072649001D7FEE002087FA001C7B
    DE002389F600268EFA001E6CBF00095FC2000F6DDC001B72DC001F82F7002184
    FA000457C100020912001D7EFC0005162C001E7BF7002081FB0004101F000037
    8A001A74F800186BE6001A70EB001C73F000020811001D375C00166BEF00186A
    E9001869E5001457BD000B53D1004058820001050D001151CE00114EC600104B
    BD00114CC400010204000D3DAA000A2D7B000335B0000E41BB000D3CAA00D0DC
    FF00012092000322900005228E00163EC7003462FF003764FF002B469F007290
    FE00D5DEFF004D72FF005172FF005374FF005376FF005577FF00E6EBFF00284F
    FC002F54FF004162FF004667FF00748EFF0093A6FF001539FF002346FF00274A
    FF002A4BFF004866FF004C69FF005470FF00001EFF001233FF00253390000420
    FF00010313004A4C8B006868680000000000010101010101010101018D8D8D8D
    01010101151515151515588D827C89888D010115131216191110588B8A70858E
    87010115141B21170F1874817B798490760901151A231F170D208D8C787F8386
    800901011522170E0B1D058D7D7E7A75000901011E1C5E77240C64078D8D8D8D
    0609019494917372718F08030226250A040194943E6C6E6F6B6D924D444C5127
    0101949465686667676963535656555F270194946A62595A61605C4042414A50
    5B27949494454846474E4B38393B3A3F4F27019493945257545D333030363C43
    4927010194939394942E282F3435373D270101010194949401012C282D323231
    27010101010101010101012A292B31010101000000000000030070F81200F0F8
    12000CC5D4770000000002000000F0F8120012010000100373000700000000E0
    FD7F0000000020B7D47700000000423BD377ACF81200BF45D377000003000200
    000000000000CE45D37712010000100373000700000088F8120010037300B0F9
    120076C0D677D8B7D477FFFFFFFFCE45D377F445D377E0F81200F0F812000446
    D377000000000000000020000000F0F8120060F912008F10F577E0F812009494
    94949494949494948D8D8D8D94949494151515151515588D827C89888D949415
    131216191110588B8A70858E87949415141B21170F1874817B79849076099415
    1A231F170D208D8C787F8386800994941522170E0B1D058D7D7E7A7500099494
    1E1C5E77240C64078D8D8D8D0609949494917372718F08030226250A04949494
    3E6C6E6F6B6D924D444C51279494949465686667676963535656555F27949494
    6A62595A61605C4042414A505B27949494454846474E4B38393B3A3F4F279494
    93945257545D333030363C434927949494939394942E282F3435373D27949494
    9494949494942C282D32323127949494949494949494942A292B31949494FFC3
    FFFFC001FFFF8001FFFF8000FFFF8000FFFFC000FFFFC000FFFF8001FFFF0003
    FFFF0001FFFF0000FFFF0000FFFF8000FFFFC001FFFFE301FFFFFF87FFFF}
  OldCreateOrder = False
  Position = poDefaultPosOnly
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelRight: TPanel
    Left = 350
    Top = 49
    Width = 388
    Height = 451
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object PanelAccount: TPanel
      Left = 0
      Top = 0
      Width = 388
      Height = 132
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      OnResize = PanelAccountResize
      object cxDBTreeList1: TcxDBTreeList
        Left = 0
        Top = 46
        Width = 388
        Height = 36
        Styles.StyleSheet = TreeListStyleSheetDevExpress
        Align = alClient
        Bands = <
          item
            Caption.Text = 'Band1'
            Width = 300
          end>
        BufferedPaint = False
        DataController.DataSource = AccountDataSource
        DataController.ParentField = 'LINKTO'
        DataController.KeyField = 'ID_RATE_ACCOUNT'
        LookAndFeel.Kind = lfFlat
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.BandHorzSizing = False
        OptionsCustomizing.BandMoving = False
        OptionsCustomizing.BandVertSizing = False
        OptionsCustomizing.ColumnCustomizing = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = tlglBoth
        PopupMenu = PopupMenu3
        RootValue = -1
        TabOrder = 0
        OnDblClick = cxDBTreeList1DblClick
        OnFocusedNodeChanged = cxDBTreeList1FocusedNodeChanged
        OnKeyDown = cxDBTreeList1KeyDown
        object cxDBTreeList1ID_CUSTOMER: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = 'ID_CUSTOMER'
          DataBinding.FieldName = 'ID_CUSTOMER'
          Position.ColIndex = 4
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 30
        end
        object cxDBTreeList1ID_RATE_ACCOUNT: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = 'ID_RATE_ACCOUNT'
          DataBinding.FieldName = 'ID_RATE_ACCOUNT'
          Position.ColIndex = 5
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 31
        end
        object cxDBTreeList1LINKTO: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = 'LINKTO'
          DataBinding.FieldName = 'LINKTO'
          Position.ColIndex = 6
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 30
        end
        object cxDBTreeList1RATE_ACCOUNT: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = #1056#1072#1093#1091#1085#1086#1082
          DataBinding.FieldName = 'RATE_ACCOUNT'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          SortOrder = soDescending
          Width = 164
        end
        object cxDBTreeList1ID_BANK: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = 'ID_BANK'
          DataBinding.FieldName = 'ID_BANK'
          Position.ColIndex = 7
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 30
        end
        object cxDBTreeList1ID_TYPE_ACCOUNT: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = 'ID_TYPE_ACCOUNT'
          DataBinding.FieldName = 'ID_TYPE_ACCOUNT'
          Position.ColIndex = 8
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 31
        end
        object cxDBTreeList1MFO: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = #1052#1060#1054
          DataBinding.FieldName = 'MFO'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 85
        end
        object cxDBTreeList1NAME_BANK: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = 'NAME_BANK'
          DataBinding.FieldName = 'NAME_BANK'
          Position.ColIndex = 9
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 31
        end
        object cxDBTreeList1NAME_TYPE_ACCOUNT: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = 'NAME_TYPE_ACCOUNT'
          DataBinding.FieldName = 'NAME_TYPE_ACCOUNT'
          Position.ColIndex = 10
          Position.RowIndex = 0
          Position.BandIndex = 0
          Visible = False
          Width = 30
        end
        object cxDBTreeList1CLOSED: TcxDBTreeListColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Caption.Text = #1047#1072#1082#1088#1080#1090#1080#1081
          DataBinding.FieldName = 'CLOSED'
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 28
        end
        object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.AlignVert = vaCenter
          Caption.Text = #1055#1088#1080#1084#1110#1090#1082#1072
          DataBinding.FieldName = 'COMMENT'
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Width = 109
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 82
        Width = 388
        Height = 50
        Align = alBottom
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Bevel1: TBevel
          Left = 0
          Top = 40
          Width = 388
          Height = 10
          Align = alBottom
          Shape = bsBottomLine
        end
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 25
          Height = 13
          Caption = #1041#1072#1085#1082
        end
        object Label2: TLabel
          Left = 200
          Top = 4
          Width = 61
          Height = 13
          Caption = #1058#1080#1087' '#1088#1072#1093#1091#1085#1082#1091
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 8
          Top = 20
          Width = 185
          Height = 21
          DataBinding.DataField = 'NAME_BANK'
          DataBinding.DataSource = AccountDataSource
          Properties.ReadOnly = True
          Style.BorderColor = clBlack
          Style.Color = clSilver
          TabOrder = 0
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 200
          Top = 20
          Width = 97
          Height = 21
          DataBinding.DataField = 'NAME_TYPE_ACCOUNT'
          DataBinding.DataSource = AccountDataSource
          Properties.ReadOnly = True
          Style.BorderColor = clBlack
          Style.Color = clSilver
          TabOrder = 1
        end
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 388
        Height = 46
        AutoSize = True
        ButtonHeight = 44
        ButtonWidth = 71
        Caption = 'ToolBar2'
        Flat = True
        Images = LargeImages
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object AddButton2: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
          Caption = #1044#1086#1076#1072#1090#1080
          ImageIndex = 0
          OnClick = AddButton2Click
        end
        object EditButton2: TToolButton
          Left = 49
          Top = 0
          AutoSize = True
          Caption = #1047#1084#1110#1085#1080#1090#1080
          ImageIndex = 1
          OnClick = EditButton2Click
        end
        object DelButton2: TToolButton
          Left = 100
          Top = 0
          AutoSize = True
          Caption = #1042#1080#1076#1072#1083#1080#1090#1080
          ImageIndex = 2
          OnClick = DelButton2Click
        end
        object dxBarLargeButton1: TToolButton
          Left = 159
          Top = 0
          AutoSize = True
          Caption = #1047#1072#1082#1088#1080#1090#1080
          ImageIndex = 8
          OnClick = dxBarLargeButton1Click
        end
        object RefreshButton2: TToolButton
          Left = 212
          Top = 0
          AutoSize = True
          Caption = #1054#1073#1085#1086#1074#1080#1090#1080
          ImageIndex = 3
          OnClick = RefreshButton2Click
        end
        object ToolButton1: TToolButton
          Left = 272
          Top = 0
          AutoSize = True
          Caption = #1030#1089#1090#1086#1088#1110#1103
          ImageIndex = 17
          OnClick = ToolButton1Click
        end
        object MoveAccButton: TToolButton
          Left = 317
          Top = 0
          Hint = #1055#1077#1088#1077#1084#1110#1089#1090#1080#1090#1080
          Caption = #1055#1077#1088#1077#1084#1110#1089#1090#1080#1090#1080
          ImageIndex = 18
          ParentShowHint = False
          ShowHint = True
          OnClick = MoveAccButtonClick
        end
      end
    end
    object PanelPeople: TPanel
      Left = 0
      Top = 140
      Width = 388
      Height = 207
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Panel1: TPanel
        Left = 0
        Top = 152
        Width = 388
        Height = 55
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 0
        object LabelPrim: TLabel
          Left = 0
          Top = 0
          Width = 56
          Height = 13
          Caption = #1055#1088#1080#1084#1110#1090#1082#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Memo1: TcxMemo
          Left = 0
          Top = 16
          Width = 388
          Height = 39
          Align = alBottom
          Properties.ReadOnly = True
          Style.Color = clSilver
          Style.LookAndFeel.Kind = lfUltraFlat
          TabOrder = 0
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 46
        Width = 388
        Height = 106
        Align = alClient
        PopupMenu = PopupMenu2
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object cxGrid1DBTableView1: TcxGridDBTableView
          OnKeyDown = cxGrid1DBTableView1KeyDown
          DataController.DataSource = PeopleDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGrid1DBTableView1ID_CUST_MEN: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'ID_CUST_MEN'
          end
          object cxGrid1DBTableView1ID_TYPE_MEN: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'ID_TYPE_MEN'
          end
          object cxGrid1DBTableView1NAME_TYPE_MEN: TcxGridDBColumn
            Caption = #1055#1086#1089#1072#1076#1072
            HeaderAlignmentHorz = taCenter
            Width = 94
            DataBinding.FieldName = 'NAME_TYPE_MEN'
          end
          object cxGrid1DBTableView1FAMILIA: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'FAMILIA'
          end
          object cxGrid1DBTableView1IMYA: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'IMYA'
          end
          object cxGrid1DBTableView1OTCHESTVO: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'OTCHESTVO'
          end
          object cxGrid1DBTableView1FIO: TcxGridDBColumn
            Caption = #1055#1030#1041
            HeaderAlignmentHorz = taCenter
            Width = 154
            DataBinding.FieldName = 'FIO'
          end
          object cxGrid1DBTableView1NOTES: TcxGridDBColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            DataBinding.FieldName = 'NOTES'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 388
        Height = 46
        AutoSize = True
        ButtonHeight = 44
        ButtonWidth = 56
        Caption = 'ToolBar3'
        Flat = True
        Images = LargeImages
        ShowCaptions = True
        TabOrder = 2
        Wrapable = False
        object AddButton3: TToolButton
          Left = 0
          Top = 0
          Caption = #1044#1086#1076#1072#1090#1080
          ImageIndex = 0
          OnClick = AddButton3Click
        end
        object EditButton3: TToolButton
          Left = 56
          Top = 0
          Caption = #1047#1084#1110#1085#1080#1090#1080
          ImageIndex = 1
          OnClick = EditButton3Click
        end
        object DelButton3: TToolButton
          Left = 112
          Top = 0
          Caption = #1042#1080#1076#1072#1083#1080#1090#1080
          ImageIndex = 2
          OnClick = DelButton3Click
        end
        object RefreshButton3: TToolButton
          Left = 168
          Top = 0
          Caption = #1054#1073#1085#1086#1074#1080#1090#1080
          ImageIndex = 3
          OnClick = RefreshButton3Click
        end
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 0
      Top = 132
      Width = 388
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 57
      AlignSplitter = salBottom
      ResizeUpdate = True
      Control = PanelPeople
    end
    object SelPanel: TPanel
      Left = 0
      Top = 347
      Width = 388
      Height = 104
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      object SelPanelLeft: TPanel
        Left = 0
        Top = 0
        Width = 33
        Height = 104
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          33
          104)
        object Panel3: TPanel
          Left = 3
          Top = 29
          Width = 25
          Height = 55
          Anchors = [akLeft]
          BevelOuter = bvNone
          TabOrder = 0
          object RemoveFromSelectionButton: TSpeedButton
            Left = 0
            Top = 32
            Width = 23
            Height = 21
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FF013002014103025104025104014303013302FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF014503014503037808039C0B03
              9F0C039F0C039D0C027E09014D04014D04FF00FFFF00FFFF00FFFF00FFFF00FF
              034F0903650904A30D03A60C03A00B029E0A039F0C03A00C03A50C03A60C0269
              06013402FF00FFFF00FFFF00FF044F09066B110AAB1F07A415049E0D029D0A03
              9D0A039E0C039E0C039E0C03A00C03A70C026A06024C04FF00FFFF00FF044F09
              10AC300DAB2809A41C039E0F48C052E9F8EAD5F2D816AA20039E0C039E0C039F
              0C03A70C024C04FF00FF0357060D822317B6410EA92D05A01341BD4BF4FCF6FF
              FFFF82D58907A010039E0C039E0C039E0C03A50C037B0801420303570617A341
              18B54A11AB3441BD4EF3FBF4FCFEFC75D07D039E0C039E0C039E0C039E0C039E
              0C03A10C03960A01420306680D21B1511EB75170D392F0FBF3FFFFFFF7FCF8B7
              E9C5B4E7BDADE5B2ADE5B2AFE5B4B1E6B603A00C039F0C014A040874123EBD69
              2ABA5CBAEACCFFFFFFFFFFFFFCFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF03A00C039F0C02520506780E54C57A44C6742CBA5CA4E3BCFFFFFFFAFEFB82
              D9A03EBF5E41C05B41BF5B41BF5841BF5707A518039D0C01460306780E4CBD69
              83DDA722B6551DB24F95DEB0FFFFFFE2F7EA4FC67511AB340FAA300FAA2E0CA6
              2706A716038C0A014603FF00FF139923AAE7C568D08E16AF481CB14D8EDCABFF
              FFFFF4FCF72DB85310A9310EA7290BA42009AF1C036B0AFF00FFFF00FF139923
              56C573C5F0D866CF8C20B4521CB24F95DEB0ABE6C11FB44E13AC3C12AA340FB0
              2D0A991F036B0AFF00FFFF00FFFF00FF1399236ACC88D0F4E39AE1B650C77A38
              BD672CBA5D30BB602FBC5D23BC4F11A33006620FFF00FFFF00FFFF00FFFF00FF
              FF00FF13992313992398E1B5BDEED4A7E7C490E0B178D99F49C7791B9D3D1B9D
              3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1DA43513992313
              9923139923139923138C2AFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = RemoveFromSelectionButtonClick
          end
          object AddToSelectionButton: TSpeedButton
            Left = 0
            Top = 0
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FF013002014103025104025104014303013302FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF014503014503037808039C0B03
              9F0C039F0C039D0C027E09014D04014D04FF00FFFF00FFFF00FFFF00FFFF00FF
              034F0903650904A30D03A60C03A00B029E0A039F0C03A00C03A50C03A60C0269
              06013402FF00FFFF00FFFF00FF044F09066B110AAB1F07A415049E0D029D0A03
              9D0A039E0C039E0C039E0C03A00C03A70C026A06024C04FF00FFFF00FF044F09
              10AC300DAB2809A41C039E0F16AA20D5F2D8E9F8EA48C052039E0C039E0C039F
              0C03A70C024C04FF00FF0357060D822317B6410EA92D05A013049F0D07A01182
              D589FFFFFFF4FCF640BC4A039E0C039E0C03A50C037B0801420303570617A341
              18B54A11AB3406A011039E0C049F0D039E0C74D07DFCFEFCF3FBF43EBC48039E
              0C03A10C03960A01420306680D21B1511EB751BFEDCFBAEAC6B7E9C2B8EAC5B5
              E9C2B7E9C1F6FCF7FFFFFFEEFAEF54C55E03A00C039F0C014A040874123EBD69
              2ABA5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFCFFFFFFFFFFFFAAE3
              B003A00C039F0C02520506780E54C57A44C67452C77D57CA8156CA8057CA8149
              C57379D592FAFEFAFFFFFF97DDA51AAD3307A518039D0C01460306780E4CBD69
              83DDA722B6551CB24E22B55422B55455CA7FE1F6E9FFFFFF88D99D10AB2F0CA6
              2706A716038C0A014603FF00FF139923AAE7C568D08E16AF481BB14C39BF68F4
              FCF7FFFFFF84D99E11AA320EA7290BA42009AF1C036B0AFF00FFFF00FF139923
              56C573C5F0D866CF8C20B45223B554AAE6C096DEB119B14813AC3C12AA340FB0
              2D0A991F036B0AFF00FFFF00FFFF00FF1399236ACC88D0F4E39AE1B650C77A38
              BD672CBA5D30BB602FBC5D23BC4F11A33006620FFF00FFFF00FFFF00FFFF00FF
              FF00FF13992313992398E1B5BDEED4A7E7C490E0B178D99F49C7791B9D3D1B9D
              3DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1DA43513992313
              9923139923139923138C2AFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = AddToSelectionButtonClick
          end
        end
      end
      object cxGrid3: TcxGrid
        Left = 33
        Top = 0
        Width = 355
        Height = 104
        Align = alClient
        PopupMenu = PopupMenu1
        TabOrder = 1
        OnResize = cxGrid2Resize
        LookAndFeel.Kind = lfFlat
        object cxGrid3TableView1: TcxGridTableView
          OnDblClick = cxGrid3TableView1DblClick
          OnDragDrop = cxGrid3TableView1DragDrop
          OnDragOver = cxGrid3TableView1DragOver
          OnMouseDown = cxGrid3TableView1MouseDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRect = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGrid3TableView1ID_CUSTOMER: TcxGridColumn
            Caption = 'ID_CUSTOMER'
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object cxGrid3TableView1NAME_CUSTOMER: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072
            HeaderAlignmentHorz = taCenter
            Width = 156
          end
          object cxGrid3TableView1EDRPOU: TcxGridColumn
            Caption = #1045#1044#1056#1055#1054#1059
            HeaderAlignmentHorz = taCenter
            Width = 66
          end
        end
        object cxGrid3Level1: TcxGridLevel
          GridView = cxGrid3TableView1
        end
      end
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 49
    Width = 350
    Height = 451
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cxGrid2: TcxGrid
      Left = 0
      Top = 0
      Width = 342
      Height = 410
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnResize = cxGrid2Resize
      LookAndFeel.Kind = lfFlat
      object cxGrid2DBTableView1: TcxGridDBTableView
        OnDblClick = ChooseButtonClick
        OnDragDrop = cxGrid2DBTableView1DragDrop
        OnDragOver = cxGrid2DBTableView1DragOver
        OnKeyDown = cxGrid2DBTableView1KeyDown
        OnMouseDown = cxGrid2DBTableView1MouseDown
        DataController.DataModeController.GridMode = True
        DataController.DataSource = CustDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.KeyFieldNames = 'ID_CUSTOMER'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = cxGrid2DBTableView1FocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsSelection.MultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          SortOrder = soAscending
          Width = 320
          DataBinding.FieldName = 'NAME_CUSTOMER'
        end
        object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1045#1044#1056#1055#1054#1059
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 104
          DataBinding.FieldName = 'KOD_EDRPOU'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
    object cxSplitter3: TcxSplitter
      Left = 342
      Top = 0
      Width = 8
      Height = 410
      HotZoneClassName = 'TcxXPTaskBarStyle'
      HotZone.SizePercent = 57
      AlignSplitter = salRight
      PositionAfterOpen = 100
      AutoSnap = True
      MinSize = 100
      ResizeUpdate = True
      Control = PanelRight
    end
    object Panel4: TPanel
      Left = 0
      Top = 410
      Width = 350
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object cxLabel1: TcxLabel
        Left = 0
        Top = 0
        Width = 106
        Height = 17
        TabOrder = 0
        Caption = #1053#1072#1079#1074#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      end
      object CustLocateEdit: TcxTextEdit
        Left = 0
        Top = 16
        Width = 313
        Height = 21
        Properties.OnChange = CustLocateEditPropertiesChange
        Style.Color = clMoneyGreen
        TabOrder = 1
        OnKeyDown = CustLocateEditKeyDown
      end
      object cxLabel2: TcxLabel
        Left = 320
        Top = 0
        Width = 77
        Height = 17
        TabOrder = 2
        Caption = #1050#1086#1076' '#1045#1044#1056#1055#1054#1059
      end
      object EdrpouLocateEdit: TcxTextEdit
        Left = 320
        Top = 16
        Width = 89
        Height = 21
        Style.Color = clMoneyGreen
        TabOrder = 3
        OnKeyDown = EdrpouLocateEditKeyDown
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 500
    Width = 738
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'Ins - '#1044#1086#1076#1072#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F2 - '#1047#1084#1110#1085#1080#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'Del - '#1042#1080#1076#1072#1083#1080#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F3 - '#1055#1077#1088#1077#1075#1083#1103#1076
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F5 - '#1054#1073#1085#1086#1074#1080#1090#1080
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        Fixed = False
        Text = 'F8 -'#1060#1110#1083#1100#1090#1088
        Width = 100
      end>
    PaintStyle = stpsXP
    LookAndFeel.NativeStyle = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 738
    Height = 49
    ButtonHeight = 44
    ButtonWidth = 97
    Caption = 'ToolBar1'
    Flat = True
    Images = LargeImages
    ShowCaptions = True
    TabOrder = 3
    Wrapable = False
    object AddButton: TToolButton
      Left = 0
      Top = 0
      AutoSize = True
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 0
      OnClick = AddButtonClick
    end
    object EditButton: TToolButton
      Left = 49
      Top = 0
      AutoSize = True
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 1
      OnClick = EditButtonClick
    end
    object ViewButton: TToolButton
      Left = 100
      Top = 0
      AutoSize = True
      Caption = #1055#1077#1088#1077#1075#1083#1103#1085#1091#1090#1080
      ImageIndex = 7
      OnClick = dxBarLargeButton2Click
    end
    object Delbutton: TToolButton
      Left = 176
      Top = 0
      AutoSize = True
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 2
      OnClick = DelButtonClick
    end
    object CustHistButton: TToolButton
      Left = 235
      Top = 0
      AutoSize = True
      Caption = #1030#1089#1090#1086#1088#1110#1103
      ImageIndex = 17
      OnClick = CustHistButtonClick
    end
    object ContactButton: TToolButton
      Left = 280
      Top = 0
      Cursor = crArrow
      AutoSize = True
      Caption = #1050#1086#1085#1090#1072#1082#1090#1080
      ImageIndex = 15
      OnClick = ContactButtonClick
    end
    object ShowDogButton: TToolButton
      Left = 338
      Top = 0
      AutoSize = True
      Caption = #1044#1086#1075#1086#1074#1086#1088#1072
      ImageIndex = 14
      OnClick = ShowDogButtonClick
    end
    object RefreshButton: TToolButton
      Left = 399
      Top = 0
      AutoSize = True
      Caption = #1054#1073#1085#1086#1074#1080#1090#1080
      ImageIndex = 3
      OnClick = RefreshButtonClick
    end
    object FilterButton: TToolButton
      Left = 459
      Top = 0
      AutoSize = True
      Caption = #1060#1110#1083#1100#1090#1088
      ImageIndex = 11
      OnClick = FilterButtonClick
    end
    object DonnuRecv: TToolButton
      Left = 506
      Top = 0
      AutoSize = True
      Caption = #1056#1077#1082#1074#1110#1079#1080#1090#1080' '#1044#1086#1085#1053#1059
      ImageIndex = 16
      OnClick = DonnuRecvClick
    end
    object ChooseButton: TToolButton
      Tag = 3053544
      Left = 607
      Top = 0
      AutoSize = True
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ImageIndex = 4
      OnClick = ChooseButtonClick
    end
    object ExitButton: TToolButton
      Left = 660
      Top = 0
      AutoSize = True
      Caption = #1042#1080#1093#1110#1076
      ImageIndex = 5
      OnClick = ExitButtonClick
    end
  end
  object StoredProc: TpFIBStoredProc
    Database = WorkDatabase
    Transaction = WriteTransaction
    Left = 16
    Top = 224
  end
  object Query: TpFIBQuery
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 80
    Top = 192
  end
  object Query1: TpFIBQuery
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 48
    Top = 192
  end
  object PeopleDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Options = [poRefreshAfterPost, poStartTransaction]
    SelectSQL.Strings = (
      'select * from PROC_SP_CUST_MEN_SEL(?MAS_ID_CUSTOMER);')
    DataSource = CustDataSource
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 424
    Top = 288
    poSQLINT64ToBCD = True
  end
  object PeopleDataSource: TDataSource
    DataSet = PeopleDataSet
    Left = 456
    Top = 288
  end
  object CustDataSource: TDataSource
    DataSet = CustDataSet
    Left = 64
    Top = 328
  end
  object CustDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Options = [poRefreshAfterPost, poStartTransaction]
    SelectSQL.Strings = (
      
        'SELECT * FROM PUB_SP_CUSTOMER_SEL(:ID_SESSION, :FROM_TABLES, :WH' +
        'ERE_COND)')
    AfterScroll = CustDataSetAfterScroll
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 16
    Top = 256
    poUseBooleanField = False
    poImportDefaultValues = False
    poSQLINT64ToBCD = True
    object CustDataSetID_CUSTOMER: TFIBBCDField
      FieldName = 'ID_CUSTOMER'
      Size = 0
      RoundByScale = True
    end
    object CustDataSetID_HIGHER_INSTANCE: TFIBBCDField
      FieldName = 'ID_HIGHER_INSTANCE'
      Size = 0
      RoundByScale = True
    end
    object CustDataSetNAME_CUSTOMER: TFIBStringField
      FieldName = 'NAME_CUSTOMER'
      Size = 180
      EmptyStrToNull = True
    end
    object CustDataSetKOD_EDRPOU: TFIBStringField
      FieldName = 'KOD_EDRPOU'
      Size = 16
      EmptyStrToNull = True
    end
    object CustDataSetDATE_NNS: TFIBDateField
      FieldName = 'DATE_NNS'
    end
    object CustDataSetNNS: TFIBStringField
      FieldName = 'NNS'
      Size = 16
      EmptyStrToNull = True
    end
    object CustDataSetNALOG_NOM: TFIBStringField
      FieldName = 'NALOG_NOM'
      EmptyStrToNull = True
    end
    object CustDataSetFIZ_LICO: TFIBIntegerField
      FieldName = 'FIZ_LICO'
    end
    object CustDataSetSHORT_NAME: TFIBStringField
      FieldName = 'SHORT_NAME'
      Size = 40
      EmptyStrToNull = True
    end
    object CustDataSetPLAT_NDS: TFIBIntegerField
      FieldName = 'PLAT_NDS'
    end
    object CustDataSetID_BRANCH: TFIBIntegerField
      FieldName = 'ID_BRANCH'
    end
    object CustDataSetNAME_IST: TFIBStringField
      FieldName = 'NAME_IST'
      Size = 60
      EmptyStrToNull = True
    end
    object CustDataSetNAME_BRANCH: TFIBStringField
      FieldName = 'NAME_BRANCH'
      Size = 30
      EmptyStrToNull = True
    end
    object CustDataSetNAME_DEPARTMENT: TFIBStringField
      FieldName = 'NAME_DEPARTMENT'
      Size = 50
      EmptyStrToNull = True
    end
    object CustDataSetID_ADRESS: TFIBBCDField
      FieldName = 'ID_ADRESS'
      Size = 0
      RoundByScale = True
    end
    object CustDataSetID_DEPARTMENT: TFIBIntegerField
      FieldName = 'ID_DEPARTMENT'
    end
    object CustDataSetNAME_UKR: TFIBStringField
      FieldName = 'NAME_UKR'
      Size = 180
      EmptyStrToNull = True
    end
    object CustDataSetNAME_CUST_FOR_LOCATE: TFIBStringField
      FieldName = 'NAME_CUST_FOR_LOCATE'
      Size = 40
      EmptyStrToNull = True
    end
    object CustDataSetDNDZ_ID: TFIBBCDField
      FieldName = 'DNDZ_ID'
      Size = 0
      RoundByScale = True
    end
    object CustDataSetIS_ID_DEP: TFIBBCDField
      FieldName = 'IS_ID_DEP'
      Size = 0
      RoundByScale = True
    end
    object CustDataSetFULL_NAME_CUSTOMER: TFIBStringField
      FieldName = 'FULL_NAME_CUSTOMER'
      Size = 255
      EmptyStrToNull = True
    end
    object CustDataSetFULL_ADRESS_CUSTOMER: TFIBStringField
      FieldName = 'FULL_ADRESS_CUSTOMER'
      Size = 255
      EmptyStrToNull = True
    end
  end
  object AccountDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Options = [poRefreshAfterPost, poStartTransaction]
    SelectSQL.Strings = (
      
        'select * from PUB_SP_CUST_RATE_ACC_SEL(?MAS_ID_CUSTOMER, :ONLY_B' +
        'ANK_ACC, :WHERE_COND)')
    DataSource = CustDataSource
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 442
    Top = 105
    poSQLINT64ToBCD = True
    WaitEndMasterScroll = True
  end
  object AccountDataSource: TDataSource
    DataSet = AccountDataSet
    Left = 474
    Top = 105
  end
  object WorkDatabase: TpFIBDatabase
    DBName = 'D:\DB\DONNU\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey]\'
      'user_name=SYSDBA'
      'sql_role_name=')
    DefaultTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 16
    Top = 160
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 48
    Top = 160
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 80
    Top = 160
  end
  object ImageList1: TImageList
    Left = 304
    Top = 160
    Bitmap = {
      494C010119001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300C6948C00EFC6A500FFDE
      AD00FFDEAD00FFDEAD00FFDEAD00FFDEAD00FFDEAD00FFDEAD00FFDEAD00FFDE
      AD00FFDEAD00EFBDA500C6948C00A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300DEB59C00C6949400F7DE
      BD00F7DEC600F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DE
      C600F7D6BD00C6949400E7BDA500A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300F7DEC600D6A59400CEAD
      A500F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7
      D600CEA59C00D6A59C00F7E7CE00A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300EFE7DE00F7DEC600C694
      8C00E7CEC600F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700DEC6
      BD00C6948C00F7E7D600EFE7DE00A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300F7EFE700FFF7EF00EFCE
      B500BD948C00EFDEDE00F7EFE700F7EFE700F7EFE700F7EFE700EFD6D600C694
      8C00EFD6C600FFF7EF00F7EFE700A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300FFF7F700FFFFF700D6AD
      AD00C6948C00A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300C68C
      8C00E7C6C600FFFFFF00FFF7F700A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300EFDEDE00C69C9C00CEA5
      A500F7EFEF00F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFFFFF00DEDE
      DE00C69C9400CEA5A500F7E7E700A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300C6949400DEC6C600FFFF
      FF00FFFFFF00FFFFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00EFFFFF00F7FF
      FF00EFFFFF00D6B5B500C69C9400A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300B5E7E700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00F7FFFF00EFF7
      F700DEF7F700D6F7F700BDCECE00A57B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A57B7300FFFFFF00FFFF
      FF00FFFFFF00F7FFFF00EFF7F700D6EFEF00BDDEDE00ADCED6009CCED60094C6
      D6008CC6D6008CB5CE00A57B7300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A57B7300BDE7
      E700A5FFFF0094E7EF008CDEEF0084E7EF0084E7EF0084E7F70084E7F70084E7
      FF009CCEDE00A57B730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A57B
      7300ADC6CE008CF7FF008CFFFF008CF7FF008CF7FF008CFFFF008CEFFF00B5BD
      C600A57B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A57B7300A57B73009CE7E7008CF7FF008CF7FF009CE7E700A57B7300A57B
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A57B7300A57B7300A57B7300A57B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD848400BD848400BD84
      8400BD848400BD848400BD848400BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5310000B5390800E7422900F74A
      3100F74A31000000000000FF000000FF00000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD848400F7DEB500F7D6
      AD00F7D6A500F7CE9C00F7CE8C00BD848400A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B000000000000000000000000000000000000000000000000000000
      0000A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B730000000000A5310000BD391000EF422900F752
      3900F75A4200F7634A0000FF0000EF4229008C4210000000000000FF00000000
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD8C8400FFE7CE008C94
      DE001842F7008C8CCE00F7D69C00BD848400A5636B00FFEFCE00F7DEBD00DEC6
      A500C6AD8C00BDA58400CEAD8400DEB58400E7BD7B00E7BD7B00EFBD7B00EFC6
      8400A5636B000000000000000000000000000000000000000000000000000073
      08000073080000730800FFDEAD00FFDEAD00FFDEAD00FFDEAD00FFDEAD00FFDE
      AD00FFDEAD00FFDEAD00A57B730000000000AD310000C6391800F75A3900FF6B
      4A00FF6B4A00FFC6BD0000FF0000E73921008439100000730000089C180010AD
      310000FF000042B53900007B0000006300000000000000000000000000000000
      00000000000000000000000000000000000000000000CE9C8400FFEFDE00184A
      FF000031FF00184AF700F7DEAD00BD848400A5635A00FFEFDE00F7E7C6003129
      290021212100314242009C846B00AD946B00C6A57300DEB57B00E7BD7B00EFC6
      8400A5636B00000000000000000000000000000000000000000000730800008C
      080000730800F7E7CE00F7E7CE00DE9C3900DE9C3900DE9C3900DE9C3900DE9C
      3900F7E7CE00F7E7CE00A57B730000000000B5310800D6422100FF6B4A00FF6B
      4200FF947B00FFFFFF0000FF000000FF00007B39080000FF000018C6520018C6
      420000FF00009CEF9C0008941000006B00000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD8400FFF7EF008C9C
      EF00184AFF008C94E700F7E7BD00BD848400A5635A00FFF7E700F7E7CE009C8C
      84000842630000639400083952004A424200947B5A00B5946B00D6AD7300EFBD
      7B00A5636B000000000000000000000000000000000000730800089C10000073
      0800A57B7300FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFF
      F700FFFFF700FFFFFF00A57B73000000000000000000D6422100FF734A00B552
      4200948C8C00B5BDBD00E78C730000FF000000FF000000FF000000FF0000298C
      390094B58C006BBD630010AD3100007300000000000000000000000000000000
      00000000000000000000000000000000000000000000E7B58C00FFFFF700FFF7
      EF00FFF7E700FFEFDE00FFEFCE00BD848400A5736B00FFFFF700FFEFDE00EFDE
      CE0021526B00105A8400735A63007B5252005A39390084735A00A58C6300CEAD
      7300A5636300000000000000000000000000007308000073080021B531000073
      080000730800FFFFFF00FFFFFF00DE9C3900DE9C3900DE9C3900DE9C3900DE9C
      3900FFFFFF00FFFFFF00A57B730000000000000000000000000042426300184A
      94001052AD00104A9400734A5200000000000000000000FF0000001800000818
      4A00081863000829390010943100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFBD9400FFFFFF00FFFF
      FF00FFFFF700BD848400BD848400BD847300A5736B00FFFFFF00FFF7E700FFEF
      DE008C9C9C0063525A00DE948C00BD7B7B008C5252005A3931007B6B52009C84
      5A00945A5A000000000000000000000000000073080010A5210042D66B004ACE
      6B0000730800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CE8C4A00CE8C4A00A57B730000000000000000001063A500086BD600188C
      FF001884FF00187BF7001863C600000000000000080000000000000829000829
      9C0000299C0000188C000029730000000000B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B584840000000000EFBD9400FFFFFF00FFFF
      FF00FFFFFF00BD848400D6946B0000000000BD846B00FFFFFF00FFF7F700FFEF
      E700F7E7D6006B5A6300EFA5A500CE949400B5737300845252005A3931007B6B
      52008452520000000000000000000000000000000000007308004AD66B000073
      0800A57B7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00319CFF00319CFF00A57B730000000000186B8C002984C6002994FF00299C
      FF00299CFF00299CFF002994FF00106BC6000000000000000000083194000842
      C6000842B5000842B5000831B50000108C00B5848400EFD6B500E7BD9400E7B5
      8C00DEB58400DEAD7300EFC68400B584840000000000EFBD9400DEAD8400DEAD
      8400DEAD8400BD8484000000000000730000BD846B00FFFFFF00FFFFFF00FFF7
      F700FFEFE700EFDECE008C5A5A00E7A5A500CE8C8C00B5737300845252005A39
      3900734A4A0000000000000000000000000000000000A57B730000730800FFDE
      AD00A57B7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000730800A57B730000000000186B8C00298CD60031A5FF00319C
      FF00299CF700299CF70031A5FF00217BCE000000000000001000104ABD001052
      D600104AC6001052CE00104AC6000831A500B5848400CE8C6B00942900009C31
      00009C3100009C310000E7B57B00B58484000000000000000000428429000000
      0000000000000000000000000000007B0800D6946B00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFEFE700E7CEC600845A5A00E7A5A500CE8C8C00B57373008452
      52006339390000000000000000000000000000000000A57B7300F7E7CE00F7E7
      CE00A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300007308004AD66B000073080000000000186B8C00186B8C00298CC6002994
      E700319CFF00319CFF0031A5FF001873C6000000000000000000104AA500187B
      FF001873F700187BF700105AD60010429C00BD8C8400FFEFE700A54210009429
      000094290000BD734A00FFE7B500B584840000000000007B0800109421000000
      0000000000000000000000941000087B1000D6946B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFEFE700D6C6B5008C5A5A00E7A5A500CE8C8C00B573
      73007B42420039424200000000000000000000000000A57B7300FFFFF700FFFF
      F700FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700FFFFFF00FFFFFF000073
      08004ACE6B0042D66B0010A5210000730800186B8C00186B8C00186B8C002994
      D60031A5FF0031A5FF00319CF700104A8C00000008001010080010213900084A
      9C001063BD00186BC6000831730010429C00CE9C8400FFFFFF00D6AD94009421
      0000A5421000EFCEAD00FFEFC600B5848400007308004ACE730029AD4A000073
      0800087B100008941000089C180000730800DE9C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFF7E700CEB5AD0094636300EFADAD008C6B
      7300187B9C00089CBD00089CBD000000000000000000A57B7300FFFFFF00FFFF
      FF00DE9C3900DE9C3900DE9C3900DE9C3900DE9C3900FFFFFF00FFFFFF000073
      08000073080021B53100007308000073080000000000186B8C00186B8C00186B
      8C00186B8C00186B8C00186B8C000000000000000000101010004A4A42004242
      420010101800000810000000080000000000DEAD8400FFFFFF00FFF7F700AD5A
      3100CE947300FFF7DE00DECEB500428C390042D673005AE78C0039CE630021BD
      420010AD210008A518000084080000000000DE9C7300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700DEC6BD00945A52009C5A5A002984
      A50000BDF700008CDE00000894000000840000000000A57B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE8C4A00D6945200A57B
      730000730800089C100000730800000000000000000000000000186B8C00186B
      8C00186B8C00186B8C0000000000000000000000000000000000393939004242
      390010080800000000000000000000000000E7B58C00FFFFFF00FFFFFF00EFDE
      D600FFF7EF00B5848400B5848400B584730031AD4A0039C65A0021AD3900088C
      180008841000007B08000000000000000000E7AD7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B5A00D6944A00008C
      C6000094DE000021BD000018B50000089C0000000000A57B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00319CFF00319CFF000073
      0800008C08000073080000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFBD9400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5848400DE9C63000000000000000000108C2100189C29000000
      000000000000000000000000000000000000E7AD7B00FFF7F700FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00F7F7EF00F7F7EF00DEC6C600A56B5A00C6846B000000
      00000063BD002942EF001031D6000008940000000000A57B7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007308000073
      0800007308000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFBD9400DEAD8400DEAD8400DEAD
      8400DEAD8400B584840000000000000000000000000000000000087B10000000
      000000000000000000000000000000000000E7AD7B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B5A00000000000000
      0000000000002131D6000818B5000000000000000000A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF004200FF00420000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000FF000000FF0000000000B5848400A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B73009C6B63000000000000000000B54A0800C6521800EF634200F763
      4A00F7634A000000000000000000000000000000000000000000000000000000
      0000FF004200FF0042000000000000000000A5310000B5390800E7422900F74A
      3100F74A31000000000000000000000000000000000000000000FF000000FF00
      000000000000000000000000000000000000A5310000B5390800E7422900F74A
      3100F74A310000000000000000000000000000000000000000000000FF000000
      FF00000000000000FF000000FF000000000000000000B5848400FFEFDE00F7E7
      CE00F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400F7D69C009C6B63000000000000000000B54A0800CE522100F7634A00FF6B
      5200FF7B5A00FF846B00F76B5A00F75A4200A55A210000FF0000FF004200FF00
      4200FF004200FF004200FF004200FF004200A5310000BD391000EF422900F752
      3900F75A4200F7634A00F7523900EF4229008C4210000000000000000000FF00
      0000FF000000000000000000000000000000A5310000BD391000EF422900F752
      3900F75A4200F7634A00F7523900EF4229008C42100000000000000000000000
      FF000000FF000000FF00000000000000000000000000B5847300FFF7E7009C31
      00009C3100009C3100009C3100009C3100009C3100009C3100009C310000EFCE
      9400F7D69C009C6B63000000000000000000BD4A1000D6522900F7735A00FF8C
      6300FF846300FFD6CE00FFA59400EF5239009C5A210000FF0000FF004200FF00
      4200FF004200FF004200FF004200FF004200AD310000C6391800F75A3900FF6B
      4A00FF6B4A00FFC6BD00FF8C7B00E73921008439100000730000089C180010AD
      3100FF000000FF000000007B000000630000AD310000C6391800F75A3900FF6B
      4A00FF6B4A00FFC6BD00FF8C7B00E739210084391000007300000000FF000000
      FF000000FF000000FF000000FF000063000000000000B5847300FFF7EF009C31
      0000FFFFFF00FFFFFF00FFFFFF008CA5FF00BDC6FF00FFFFFF009C310000EFCE
      9C00F7D69C009C6B63000000000000000000C64A1800DE633900FF8C6B00FF84
      5A00FFAD9400FFFFFF00FFCEBD00EF6342009452180010A5210031D66B0031D6
      5A00FF004200FF00420010AD210000840000B5310800D6422100FF6B4A00FF6B
      4200FF947B00FFFFFF00FFBDAD00EF4A29007B390800008C100018C6520018C6
      42009CF79C00FF000000FF000000FF000000B5310800D6422100FF6B4A00FF6B
      4200FF947B00FFFFFF00FFBDAD00EF4A29007B390800008C10000000FF0018C6
      42009CF79C000000FF000000FF00006B000000000000BD8C8400FFFFF7009C31
      0000FFFFFF00FFFFFF007B9CFF000031FF005A7BFF00FFFFFF009C310000F7D6
      A500F7D69C009C6B6300000000000000000000000000DE633900FF8C6300C673
      5A00ADA5A500C6CECE00EFA58C00FF7B5200A563290018B5310021C6520042A5
      5200FF004200FF00420021BD4A00008C100000000000D6422100FF734A00B552
      4200948C8C00B5BDBD00E78C7300FF5A3900944A100008A5210010B53900298C
      390094B58C006BBD6300FF000000FF00000000000000D6422100FF734A00B552
      4200948C8C00B5BDBD00E78C7300FF5A3900944A10000000FF000000FF00298C
      390094B58C006BBD63000000FF000000FF0000000000BD8C8400FFFFFF009C31
      0000D6DEFF00426BFF000031FF004263FF000031FF00DEE7FF009C310000F7D6
      AD00F7D6A5009C6B6300000000000000000000000000000000005A637B00316B
      AD002173BD00216BAD008C636B00000000000000000000390800003110001031
      6300183184001042520021A54A0000000000000000000000000042426300184A
      94001052AD00104A9400734A5200000000000000000000210000001800000818
      4A00081863000829390010943100FF000000000000000000000042426300184A
      94001052AD00104A9400734A5200000000000000000000210000001800000818
      4A000818630008293900109431000000000000000000CE9C8400FFFFFF009C31
      00005273FF001042FF00BDCEFF00EFF7FF001842FF004A73FF0094310000F7DE
      B500F7DEAD009C6B63000000000000000000000000002184B5001884DE00319C
      FF00319CFF002994F7002984D60000000000000810000000000008104A001042
      B5000839AD000831A50010428C0000000000000000001063A500086BD600188C
      FF001884FF00187BF7001863C600000000000000080000000000000829000829
      9C0000299C0000188C000029730000000000000000001063A500086BD600188C
      FF001884FF00187BF7001863C600000000000000080000000000000829000829
      9C0000299C0000188C00002973000000000000000000CE9C8400FFFFFF009C31
      0000E7EFFF00DEE7FF00FFFFFF00FFFFFF009CADFF000031FF0063315A00F7DE
      BD00FFDEB5009C6B630000000000000000003184A500399CD60042ADFF0042AD
      FF0042ADFF0042ADFF0039ADFF002184D6000008100000001000184AAD001863
      D600185AC600185AC6001852C6000021A500186B8C002984C6002994FF00299C
      FF00299CFF00299CFF002994FF00106BC6000000000000000000083194000842
      C6000842B5000842B5000831B50000108C00186B8C002984C6002994FF00299C
      FF00299CFF00299CFF002994FF00106BC6000000000000000000083194000842
      C6000842B5000842B5000831B50000108C0000000000DEAD8400FFFFFF009C31
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005273FF000031FF00F7E7
      C600F7DEB5009C6B630000000000000000003184A50042A5E7004AB5FF004AB5
      FF0042ADFF0042ADFF004AB5FF003994DE000008080000082100216BCE002173
      E7002163CE00216BD600216BD6001852B500186B8C00298CD60031A5FF00319C
      FF00299CF700299CF70031A5FF00217BCE000000000000001000104ABD001052
      D600104AC6001052CE00104AC6000831A500186B8C00298CD60031A5FF00319C
      FF00299CF700299CF70031A5FF00217BCE000000000000001000104ABD001052
      D600104AC6001052CE00104AC6000831A50000000000DEAD8400FFFFFF009C31
      00009C3100009C3100009C3100009C3100009C3100008C3110002131CE000031
      FF00C6BDAD009C6B630000000000000000003184A5003184A50042A5D6004AAD
      EF004AB5FF004AADFF004AB5FF00318CD6000008100000000800216BBD003194
      FF00298CF7003194FF00297BDE00215AAD00186B8C00186B8C00298CC6002994
      E700319CFF00319CFF0031A5FF001873C6000000000000000000104AA500187B
      FF001873F700187BF700105AD60010429C00186B8C00186B8C00298CC6002994
      E700319CFF00319CFF0031A5FF001873C6000000000000000000104AA500187B
      FF001873F700187BF700105AD60010429C0000000000E7B58C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00F7E7D600B58473000031
      FF000031FF000031FF0000000000000000003184A5003184A5003184A5004AA5
      DE004AB5FF004AB5FF004AB5F700216B9C00000810002121180021395200186B
      AD00217BCE002984D600184A8C00215AAD00186B8C00186B8C00186B8C002994
      D60031A5FF0031A5FF00319CF700104A8C00000008001010080010213900084A
      9C001063BD00186BC6000831730010429C00186B8C00186B8C00186B8C002994
      D60031A5FF0031A5FF00319CF700104A8C00000008001010080010213900084A
      9C001063BD00186BC6000831730010429C0000000000E7B58C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7CECE00B5847300EFB5
      7300EFA54A000031FF000000000000000000000000003184A5003184A5003184
      A5003184A5003184A5003184A5000000000000000000292921006B6363006363
      5A002129310000102100000810000000000000000000186B8C00186B8C00186B
      8C00186B8C00186B8C00186B8C000000000000000000101010004A4A42004242
      42001010180000081000000008000000000000000000186B8C00186B8C00186B
      8C00186B8C00186B8C00186B8C000000000000000000101010004A4A42004242
      42001010180000081000000008000000000000000000EFBD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6D600B5847300FFC6
      7300CE94730000000000000000000000000000000000000000003184A5003184
      A5003184A5003184A50000000000000000000000000000000000525252005A5A
      5A00211818000000000000000000000000000000000000000000186B8C00186B
      8C00186B8C00186B8C0000000000000000000000000000000000393939004242
      3900100808000000000000000000000000000000000000000000186B8C00186B
      8C00186B8C00186B8C0000000000000000000000000000000000393939004242
      39001008080000000000000000000000000000000000EFBD9400FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700E7D6CE00B5847300CE9C
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFBD9400DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400B58473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000094635A009C6B
      63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B63009C6B
      63009C6B63009C6B63009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      00000000000000000000000000000000000000000000000000009C6B5A00F7E7
      BD00F7DEBD00F7DEB500F7D6AD00F7D6A500F7D6A500F7D69C00EFCE9C00EFCE
      9400EFCE9400EFC68C009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000000000008C5A5A008C5A5A0000000000FFFF0000FFFF0000000000008C5A
      5A008C5A5A008C5A5A008C5A5A0000000000A57B7300F7E7D600EFDECE00EFD6
      C600EFD6BD00E7CEB500E7CEAD00E7C6A500E7BD9C00A57B7300000000000000
      0000000000000031FF00000000000000000000000000000000009C6B6300F7E7
      C600F7E7C600F7DEBD00F7DEB50000840000F7D6AD00F7D6A500F7CE9C00EFCE
      9C00EFCE9400EFCE94009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000F7DECE00F7DEC60000000000FFFF0000FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000A57B7300FFF7F700FFF7E700FFEF
      DE00F7E7D600F7E7CE00F7DEBD00F7DEB500F7D6AD00A57B7300000000000000
      00000031FF000031FF0000000000000000000000000000000000A56B6300F7E7
      CE00F7E7C600F7E7C600008400000084000000840000F7D6AD00F7D6A500EFD6
      9C00EFCE9C00EFCE94009C6B6300000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      000000000000000000000000000000000000FFFFFF00FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      000000000000000000000031E700000000000000000000000000A5736300FFEF
      D600F7E7CE0000840000317B29005A944A0000840000528C3900F7D6AD00F7D6
      A500F7D6A500EFCE9C009C6B6300000000000000000000000000000000000000
      0000000000000084840000FFFF00008484000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000FFD6A500FFD6A500FFD6A500000000000000000084848400FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000031FF000000000000000000AD736300FFEF
      DE00FFEFD60000840000EFE7C600F7E7C600A5BD84000084000000840000EFD6
      AD00F7D6A500F7D6A5009C6B6300000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000084840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      0000F7E7CE00F7E7CE000000000000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      0000000000000000000000000000000000000000000000000000B57B6300FFF7
      E700FFEFDE00FFEFD600FFEFD600F7E7CE00F7E7C600E7DEB500008400000084
      0000F7D6AD00F7D6A5009C6B63000000000000000000000000000000000000FF
      FF0000FFFF00848484008484840000FFFF0000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7EFDE00F7DECE0000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C60000000000EFDECE000000000000000000A57B7300F7E7D600EFDECE00EFD6
      C600EFD6BD00E7CEB500E7CEAD00E7C6A500E7BD9C00A57B7300000000000000
      0000000000000031FF0000000000000000000000000000000000B57B6300FFF7
      E700FFF7E700FFEFDE00FFEFDE00F7EFD600FFE7CE00F7E7C600F7E7C600F7DE
      BD00F7DEB500F7D6AD009C6B63000000000000000000000000008484840000FF
      FF008484840000000000000000008484840000FFFF0000FFFF00008484000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C0000000000FFD6A50000000000FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500000000000000000000000000A57B7300FFF7F700FFF7E700FFEF
      DE00F7E7D600F7E7CE00F7DEBD00F7DEB500F7D6AD00A57B7300000000000000
      00000031FF000031FF0000000000000000000000000000000000BD846300FFF7
      EF00D6842100D6842100D6842100D6842100D6842100D6842100D6842100D684
      2100D6842100F7DEB5009C6B6300000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFF0000FFFF000084
      840000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF000000000000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      000000000000000000000031E700000000000000000000000000C6846300FFFF
      F700FFF7EF00FFF7EF00FFF7E700FFEFDE00FFEFDE00FFEFD600FFE7CE00F7E7
      C600F7E7C600F7DEBD009C6B6300000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF0000FF
      FF0000848400000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000031FF000000000000000000C6846300FFFF
      FF00FFFFF700FFF7EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFD600F7EF
      CE00F7E7CE00F7E7C6009C6B6300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF00000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      0000000000000000000000000000000000000000000000000000CE8C6300FFFF
      FF00D6842100D6842100D6842100D6842100D6842100D6842100D6842100D684
      2100D6842100F7E7CE009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFF00000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000A57B7300F7E7D600EFDECE00EFD6
      C600EFD6BD00E7CEB500E7CEAD00E7C6A500E7BD9C00A57B7300000000000000
      0000000000000031FF0000000000000000000000000000000000CE8C6B00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7E700FFF7E700FFEF
      DE00FFEFD600FFEFD6009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000A57B7300FFF7F700FFF7E700FFEF
      DE00F7E7D600F7E7CE00F7DEBD00F7DEB500F7D6AD00A57B7300000000000000
      00000031FF000031FF0000000000000000000000000000000000CE8C6B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7EF00FFF7
      E700FFEFDE00FFEFDE009C6B6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00C68C7B00000000000000000000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300000000000000
      000000000000000000000031E700000000000000000000000000CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000031FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005242420052424200524242005242420052424200524242000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D60000000000EF42
      0000AD290000AD2900007329000073290000000000000000000000000000B58C
      7B00B5948400F7E7D600EFE7DE00EFE7DE00F7E7DE00F7E7D600BDA59C005242
      4200524242000000000000000000000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000094736B00B58C7B00B584
      7B00B5847B00B5847B00B5847B00B5847B00B5847B00B5847B00AD847B00AD84
      7B00B5848400B58C7B00845A520000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000000000000BDA59C00F7E7
      DE00FFF7F700E7DED600DEB59C00D6A58C00E7C6BD00EFEFEF00F7F7F700F7E7
      D600E7CEBD005242420000000000000000003939390084848400848484008484
      8400848484008484840084848400848484008484840084848400848484003939
      39003939390000000000000000000000000000000000B5948C00F7DECE00FFDE
      C600FFDEC600FFDEC600FFD6BD00FFD6BD00FFD6B500FFD6B500F7CEB500F7CE
      AD00F7CEAD00FFCEAD009C736B0000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000BDA59C00F7EFE700FFFF
      FF00C68C7300BD5A2900BD5A2900DEB59C00BD5A2900BD5A2900D69C8400F7F7
      F700F7E7DE00D6C6BD0052424200000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      39003939390039393900000000000000000000000000B5949400EFEFD600FFF7
      D600E7E7BD00E7E7BD00FFEFD600F7E7B500EFE7AD00FFDEB500FFDEAD00FFD6
      A500F7D6A500FFDEB500A573730000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600000000000000
      0000AD290000AD290000732900007329000000000000BDA59C00FFFFFF00CE6B
      4200BD5A2900BD5A2900C6A59400FFFFFF00E7845200BD5A2900BD5A2900D694
      7300FFFFF700F7E7D600524242000000000039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      84003939390039393900000000000000000000000000BD9C9400EFEFE700FFFF
      EF00ADD68C00009C0000009C0000009C0000009C000000940000219C2100D6CE
      9C00FFD6AD00FFD6BD009C73730000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000CED6D600CED6D600CED6D600CED6D600000000000000
      0000AD290000AD2900007329000073290000BDA59C00FFFFFF00DE9C7B00BD5A
      2900CE633100CE633100CE6B3900D68C6300CE633100CE633100BD5A2900BD5A
      2900E7CEBD00F7EFEF00DECEC6005242420039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000FF000000FF00000000FF000000FF00C6C6C6008484
      84008484840039393900393939000000000000000000C6A59C00EFF7EF00FFFF
      F700ADDE9C0000940000009C000010A510009CCE9400ADC6940029AD21005AB5
      4A00F7DEB500FFDEC6009C73730000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD2900007329000073290000D6C6BD00FFF7F700C6633100BD5A
      2900CE633100BD5A2900CE846300F7E7DE00D66B3900BD5A2900CE633100BD5A
      2900CE734200FFFFFF00E7CEBD005242420039393900C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      84008484840084848400393939000000000000000000C6A5A500EFF7EF00FFFF
      F700B5DEA500009C000008A5080018A5180052B54200F7E7C600F7E7C6005AB5
      5A00DED69C00FFDEC600A57B730000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD2900007329000073290000D6C6BD00F7DED600BD5A2900CE63
      3100CE633100BD5A2900D6845200FFFFFF00E7AD9400BD5A2900BD5A2900CE63
      3100BD5A2900FFEFEF00F7DED600524242000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C6C6
      C6008484840084848400393939000000000000000000CEADA500F7FFF700F7F7
      E700DEEFCE00FFF7E700F7F7DE00FFF7DE00FFE7CE00FFEFDE00FFEFDE00F7E7
      CE00F7DEB500FFDEC600AD7B730000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900007329000073290000D6C6BD00F7D6CE00CE633100CE63
      3100CE633100CE633100BD5A2900DEAD9400FFF7F700EF9C7300BD5A2900CE63
      3100BD5A2900F7F7EF00EFE7DE00524242000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C6C6C60084848400393939000000000000000000D6B5A500F7FFFF00E7F7
      E7008CD68C00EFF7DE00FFFFFF00C6DEAD004AB5390052B542004AB53900C6D6
      9C00FFEFD600FFE7CE00AD7B730000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C392100D6C6BD00FFEFE700D66B3900CE63
      3100CE633100BD5A2900BD5A2900BD5A2900E7CEC600FFFFFF00D66B3900CE63
      3100CE6B3900FFFFFF00F7DED600524242000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B003939390039393900000000000000000000000000D6B5A500F7FFFF00FFFF
      FF008CCE94004ABD5200E7EFDE00FFFFEF0063BD63000094000000940000ADD6
      8C00FFEFDE00FFDECE00AD7B730000000000CED6D600FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100CED6D600D6C6BD00FFFFFF00F79C6B00D66B
      3900CE8C6B00F7EFE700D6845200BD5A2900D6947300FFFFFF00E78C5A00BD5A
      2900EF946300FFFFFF00D6C6BD00524242000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B000000000000000000000000000000000000000000DEBDA500F7FFFF00FFFF
      FF00EFF7E70039AD310018A518005AC65A0031AD3100009C000000940000ADD6
      8C00FFF7E700FFDECE00AD847B0000000000CED6D600CED6D600FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100CED6D600CED6D60000000000D6C6BD00FFEFDE00EF84
      5200E7845200F7F7F700FFFFFF00DEBDAD00FFFFFF00F7F7F700DE734200D673
      3900FFF7EF00F7E7E7005242420000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B0000000000000000000000000000000000E7C6A500F7FFFF00FFFF
      FF00FFFFFF00C6EFCE0021AD2100009400000094000010A51000089C1000A5CE
      8C00FFCEC600FFADA500AD7B730000000000CED6D600CED6D600FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D60000000000D6C6BD00FFFFFF00FFEF
      D600FFAD7300EFAD8C00EFE7DE00EFEFEF00F7E7E700FFA57B00F78C5A00F7DE
      CE00FFFFFF00D6C6BD000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B0000000000000000000000000000000000E7CEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAD
      9400D6945200C69C7B00C6ADA50000000000CED6D600CED6D600FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D6000000000000000000D6C6BD00FFFF
      FF00FFFFFF00FFF7C600FFDEAD00FFD69C00FFC69400FFD6AD00FFFFFF00FFFF
      FF00D6C6BD000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B00000000000000000000000000EFCEAD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFFF00F7FFFF00F7FFFF00C6AD
      9C00D69C7300DECEB5000000000000000000CED6D600CED6D600CED6D600FFA5
      3900FF9C1800EF4200008C392100CED6D600CED6D600FFA53900000000000000
      00008C392100CED6D600CED6D600CED6D600000000000000000000000000D6C6
      BD00D6C6BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DECEC600D6C6
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B00000000000000000000000000E7C69C00E7C6A500E7C6
      A500E7C6A500E7C6A500E7C6A500E7C6A500DEC6A500DEC6A500DEC6A500C69C
      8400DECEBD00000000000000000000000000CED6D600CED6D600CED6D600FFA5
      3900F7FFFF00EF4200008C392100CED6D600CED6D600FFA53900F7FFFF000000
      00008C392100CED6D600CED6D600CED6D6000000000000000000000000000000
      000000000000DECEC600D6C6BD00D6C6BD00D6C6BD00D6C6BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CED6D600CED6D600CED6D600FFCE
      6300FFCE6300FFA53900FFA53900CED6D600CED6D600FFCE6300FFA53900FFA5
      39008C392100CED6D600CED6D600CED6D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C3100009C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA5005A3118005A311800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00F7EFDE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFA500FFEFA500FFE78C00FFE78C00313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5636B0084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A000000000000000000FFF7E700FFD6A500FFD6
      A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A003131
      31009C3100009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00CECED60084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A000000000000000000FFF7E700F7DEC600F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100FFEFA500FFEFA500FFE78C00FFE78C00FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000000000000000FF00B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A000000000000000000F7EFDE00F7DECE00F7DE
      C600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDECE00EFDECE008C5A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFEFA500FFEFA5000000000008080800FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      FF00EFDECE00EFDECE008C5A5A000000000000000000FFF7E70042424200FFD6
      A50042424200FFD6A50018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001818180018181800F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000006B6B
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B000000000000000000FFF7EF00F7E7CE00F7DE
      C600181818001818180018181800F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000FFFFF700FFD6A5001818
      18008484840000FFFF0018181800FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B000000000000000000FFFFF700FFE7D6001818
      1800C6C6C60000FFFF0018181800FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B0000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B000000000000000000FFFFFF00181818008484
      840000FFFF0018181800FFFFF700FFFFF70000000000FFFFFF00C68C7B00CED6
      D600000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B00000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000000000004242420084848400C6C6
      C60000FFFF0018181800FFFFFF00FFFFFF0000000000C68C7B00CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C31000000000000000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B00000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B0000000000000000000000000000000000181818001818180000FF
      FF001818180000000000000000000000000000000000CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C310000000000000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B0000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000001818180000008400000084001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000CED6D60018181800181818001818
      1800CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6D600CED6
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FF633100FF633100FF633100FF633100FF633100FF63
      3100FF633100FF63310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7E7CE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00F7EFDE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600EFDE
      CE00EFDECE008C5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500EFDECE008C5A5A0000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00F7E7CE008C5A5A0000000000B58C8C008C5A5A008C5A5A008C5A
      5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
      CE00EFDECE009C6B630000000000000000000000000000000000000084000000
      8400000084008484840000000000000000000000000000000000000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A0000000000B58C8C00FFF7E700F7EFDE00F7EF
      DE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7E7
      D600EFDECE009C6B6B0000000000000000000000000000000000000000000000
      8400000084000000840084848400000000000000000000008400000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000FF0000008400000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B630000000000B58C8C00F7EFDE00F7DECE00F7DE
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004A844A004A844A004A84
      4A004A844A00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF00000084000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008484840000FFFF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004A844A0052AD520052AD
      52004A844A00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF0000848484008484840000FF000000FF000000840000000000000000
      0000000000000000000000000000000000000000000000FFFF0000000000B58C
      8C008484840000FFFF00F7DEC60000FFFF0000FFFF00F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B0000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A004A844A004A844A0052AD520052AD
      52004A844A004A844A004A844A00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      00008484840000000000000000008484840000FF000000FF0000008400000000
      000000000000000000000000000000000000000000008484840000FFFF00B58C
      8C008484840000FFFF0000FFFF0084848400FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004A844A0052AD520052AD520052AD520052AD
      520052AD520052AD52004A844A00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FF000000FF00000084
      00000000000000000000000000000000000000000000000000008484840000FF
      FF008484840000FFFF008484840000FFFF0000FFFF0000FFFF00FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004A844A006BCE84006BCE84006BCE840052AD
      520052AD520052AD52004A844A00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      0000008400000000000000000000000000008484840084848400848484008484
      840000FFFF0084848400848484008484840084848400FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004A844A004A844A004A844A006BCE840052AD
      52004A844A004A844A004A844A00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF0000000000000000000000000000000000000000000000FFFF008484
      840000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00C68C7B00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004A844A006BCE840052AD
      52004A844A000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FF00000000000000000000000000000000000000FFFF008484840000FF
      FF008484840000FFFF008484840000FFFF00B58C8C00B58C8C00B58C8C00B58C
      8C0000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004A844A004A844A004A84
      4A004A844A000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000008484840000FFFF000000
      00008484840000FFFF00000000008484840000FFFF0000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000000000008001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008001000000000000C003000000000000E007000000000000
      F00F000000000000FC3F000000000000FFDFFF80FFFFFFFF048FFF800007F001
      0057FF800007E0010000FF800007C0010000FF80000780018000FF8000070001
      C181FF800007000181010081000780010000008200078001000000DE00078001
      0000009C0003800000000000000180008181000100008001C3C3000300008003
      FFFF019F00108007FFFF03DF0039800FFFFFFFF3FF1FFF9C800307F307CF07C9
      8003000000670063800300000000000080030000000000008003800080008000
      8003C181C180C181800381018101810180030000000000008003000000000000
      8003000000000000800300000000000080038181818181818007C3C3C3C3C3C3
      800FFFFFFFFFFFFF801FFFFFFFFFFFFFFFFFFFFFFFFFC001FFFFCF3F0021C001
      FFFF80010029C001FDFF80010021C001F8FF80010021C001F07F8001FFFEC001
      E03FC0010021C001C01FE0010029C001C60FE0010021C001EF07E0010021C001
      FF83E001FFFEC001FFC3E0010021C001FFE3E0010029C001FFF7E0030021C001
      FFFFE0070021C001FFFFE00FFFFEFFFFF81FFFFFFFFFE020E007800F80012000
      C003000780012000800100038001203080010003800120300000000180016030
      000000018001403000008001800140300000C001800100300000C00380010030
      0000C00F800100308001E007800100308003E00780010030C007F00380030030
      E00FF80380070010F83FFFFFFFFF0000FFFF800FFCFFFFFFE001800FFC3FFF3F
      E001800FFC1FFE3FE001800FF803FC3FE001800FF003FC3FC001800FF803FC3F
      C001800FD803FC3FE001800FD803FC3FE001800F0003FC3FE001800F8003F81F
      E00180EFD803F00FE001808FD003E007E003808FF803C003C007878FF8038001
      800F000FF8030000FF9F000FF803FFFFE001F003FFFFFFFFE001F003FFFFFFFF
      E001F003FFFFFFFFE001F003C7E7FDFFE0010003C3C7F8FFE0010003E18FF07F
      E0010003F01FE03FE0010003F83FC01FA0010001FC3FC60F80010001F81FEF07
      C0010001F10FFF8300030001E387FFC3C0070007C7C7FFE3800F0007CFE7FFF7
      927F007FFFFFFFFFF3FF00FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 80
    Top = 256
    object N1: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 1
      ShortCut = 45
      OnClick = AddButtonClick
    end
    object N2: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 2
      ShortCut = 46
      OnClick = DelButtonClick
    end
    object N3: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 5
      ShortCut = 113
      OnClick = EditButtonClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1080
      ImageIndex = 23
      ShortCut = 16460
      OnClick = ContactButtonClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1080
      ImageIndex = 10
      ShortCut = 116
      OnClick = RefreshButtonClick
    end
    object N8: TMenuItem
      Caption = #1055#1086#1096#1091#1082
      Enabled = False
      ImageIndex = 11
      ShortCut = 16454
    end
    object N9: TMenuItem
      Caption = #1044#1086#1087#1086#1084#1086#1075#1072
      Enabled = False
      ImageIndex = 8
      ShortCut = 112
    end
    object N10: TMenuItem
      Caption = #1044#1088#1091#1082' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1111' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      Enabled = False
      ImageIndex = 9
      ShortCut = 16464
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #1042#1080#1093#1110#1076
      ImageIndex = 6
      ShortCut = 32883
      OnClick = ExitButtonClick
    end
  end
  object PopupMenu2: TPopupMenu
    Images = ImageList1
    Left = 488
    Top = 288
    object N13: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1082#1086#1085#1090#1072#1082#1090#1085#1091' '#1086#1089#1086#1073#1091
      ImageIndex = 17
      OnClick = AddButton3Click
    end
    object N14: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1082#1086#1085#1090#1072#1090#1082#1090#1085#1091' '#1086#1089#1086#1073#1091
      ImageIndex = 19
      OnClick = AddButton3Click
    end
    object N15: TMenuItem
      Caption = #1047#1084#1085#1110#1085#1080#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1087#1086' '#1082#1086#1085#1090#1072#1082#1090#1085#1110#1081' '#1086#1089#1086#1073#1110
      ImageIndex = 18
      OnClick = EditButton3Click
    end
    object N16: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1079' '#1089#1077#1088#1074#1077#1088#1072
      ImageIndex = 20
      OnClick = RefreshButton3Click
    end
  end
  object PopupMenu3: TPopupMenu
    Images = ImageList1
    Left = 504
    Top = 104
    object N17: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1088#1072#1093#1091#1085#1086#1082
      ImageIndex = 21
      OnClick = AddButton2Click
    end
    object N18: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1088#1072#1093#1091#1085#1086#1082
      ImageIndex = 4
      OnClick = DelButton2Click
    end
    object N19: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080' '#1088#1072#1093#1091#1085#1086#1082
      ImageIndex = 22
      OnClick = EditButton2Click
    end
    object N20: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1072#1084
      ImageIndex = 10
      OnClick = RefreshButton2Click
    end
  end
  object LargeImages: TImageList
    Height = 24
    Width = 24
    Left = 336
    Top = 160
    Bitmap = {
      494C010113001800040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000940000009400000094000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000010
      B5000010B5000018FF000018FF000018FF000000940000009400004A0000004A
      0000004A0000004A0000004A0000004A00000000000000000000000000000000
      0000000000000000000000000000000000007B2900007B2900007B2900007B29
      00007B2900007B2900007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000005200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000010B5000018
      FF000018FF000018FF00ADBDFF000018FF000018FF000018FF000008BD00107B
      3900087B1800087B1800087B180008731800004A0000004A0000004A0000004A
      0000000000000000000000000000000000007B29000018EFFF0021E7FF0029DE
      FF0042CED60039D6E7007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      0000005200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000010B5000018FF000018
      FF00315AFF00D6DEFF00FFFFFF00ADBDFF000029FF000018FF000018FF000008
      A50021A5420021A5390021A53900219C3900189C310018943100108C29000873
      1000004A0000004A000000000000000000007B290000B5C6A500ADAD8400C68C
      4A00D6732100C66B10007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      0000005A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000010B5000021FF000829
      FF00EFEFFF008C9CFF00C6CEFF00ADBDFF008C9CFF000018FF000018FF000010
      E70018734A00219C3900219C3900189C310018943100188C2900108C29001084
      2100107B1800086B1000004A0000000000007B290000FFB56B00E7944200E77B
      2900D66B1800CE5A00007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005A
      0000006B08000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000010B5000831FF000029FF000831
      FF005A7BFF000029FF00ADBDFF007394FF00ADBDFF000018FF000018FF000018
      FF0008315A0031522900524A39006B4242005A29290042422900215218001073
      1800087318000873100008630800004A00007B29000029B5420029942100D6AD
      7300EFAD6B00E7A563007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005A
      0000087B1800005A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000010B500214AFF001031FF000829
      FF000831FF008CA5FF00FFFFFF00FFFFFF00315AFF000018FF000018FF000018
      FF0008087B00A5848400C6A5A500A57B7B006B31420094636B00845252006331
      3900393921001052100000630800004A00007B29000021C652008CD69400FFFF
      FF00FFFFFF00FFFFFF007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005A
      0000189C31000063000000000000000000000000000000000000000000000000
      0000000000000000000000520000005200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000010B5005273FF002952FF000831
      FF00B5C6FF00D6DEFF00C6D6FF001039FF000021FF000018FF000018FF000018
      FF0021085200A5848400C6ADAD00A58484006B31420094636B0094636B008C5A
      63008C5A5A002142100000630800004A00007B2900007B2900007B2900007B29
      00007B2900007B2900007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005A
      000029B54200087B180000520000000000000000000000000000000000000000
      0000000000000000000000520000006308000052000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000094006B8CFF001039
      FF00FFFFFF004A6BFF00B5C6FF005273FF001839FF000021FF000021FF000018
      EF005A211800A5848400C6ADAD00A58484006B314200946B730094636B009463
      6B008C5A63002139100000630800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005A
      000029BD520018A5390000520000000000000000000000000000000000000000
      0000000000000000000000520000007B08000063080000520000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000094009CB5FF006384
      FF00BDCEFF00EFF7FF00EFF7FF00FFFFFF00315AFF000029FF000029FF000008
      BD009C390000A5848C00CEB5B500A58484006B314200946B7300946B73009463
      6B0094636B002931100000000000000000007B2900007B2900007B2900007B29
      00007B2900007B2900007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      000029AD420031CE5A0008731800005200000000000000000000000000000000
      000000000000000000000052000021A53900007B080000630800005200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009400B5C6
      FF008CA5FF0084A5FF00DEE7FF005273FF00214AFF001039FF000021DE006B39
      4200A5522900B5949400CEB5B500A58484006B31420094737B00946B7300946B
      6B0094636B006B31420000000000000000007B29000018EFFF0021E7FF0029DE
      FF0042CED60039D6E7007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      0000108C210042E7730021AD4200006308000052000000000000000000000000
      0000000000000000000000520000189C3100008C0800007B0800006308000052
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      94007B9CFF009CB5FF0084A5FF006B8CFF003963FF000821CE007B6BA500D6BD
      BD00D6BDBD00AD8C8C00AD8C8C00946B6B006B3142008C6B6B0094737B00946B
      7300946B6B006B31420000000000000000007B290000B5C6A500ADAD8400C68C
      4A00D6732100C66B10007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000086B100039D66B0039D66B0021B54200086B100000630000005200000052
      00000052000000520000004A0000189C310008941000008C080000730800086B
      0800005200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000181894001829BD001831C6002929A50063527B00AD7B5200B57B3100945A
      2900945A2100D6841800D67B1000AD5A08006B314200AD420000843108007B31
      21007B4239006B31420000000000000000007B290000FFB56B00E7944200E77B
      2900D66B1800CE5A00007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000520000189C310042DE730039D6630029BD4A001894290008731000087B
      1000087B10000884180010942900007B08000894100000940800008C0800007B
      0800087310000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200F7DE9400EFCE8400946B4200EFBD6B00E7B55A00E7AD4A00B57B
      3100B5732900DE8C2100D6841800AD6310006B314200C65200009C3900008C31
      0000942900006B31420000000000000000007B29000029B5420029942100D6AD
      7300EFAD6B00E7A563007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000052000029AD420039DE6B0031D65A0029C6520021BD4A0021B5
      390018AD310018AD290010A52100089C18000894100000941000008C0800008C
      0800007B0800108C290000520000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200F7E7A500F7DE94009C6B4A00EFC67B00EFBD6300E7B55A00BD84
      4200B57B3100DE943100DE8C2100B56B18006B314200DE630000A54200009C39
      0000A53900006B31420000000000000000007B29000021C652008CD69400FFFF
      FF00FFFFFF00FFFFFF007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000052000021A5390031CE5A0031D65A0029C64A0021BD
      420018B5390018AD310010A5290010A52100089C180008941000008C0800008C
      080000940800007B080000520000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200FFEFB500F7E7A5009C6B5200EFCE8400EFC67300EFBD6300BD8C
      5200BD844200DE9C3900DE943100B56B21006B314200E76B0000B54A0000A542
      0000B54A00006B31420000000000000000007B2900007B2900007B2900007B29
      00007B2900007B2900007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000005200001084210021AD420029C64A0029C6
      4A0021BD420018B5390018AD290010A52100089C18000894100000941000008C
      0800108421000052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200C6ADA500C6ADA500AD8C8400B5948C00BDA5A500BDA5A500B59C
      9C00B59C9C00B5949C00B5949400947373006B314200846B6B00845252008C52
      42008C5242006B31420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000052000000520000087B18001094
      2900189C290018A5310018AD310018AD2900109C2100089C180008941000087B
      1800005200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200BD9C8400C69C7B00946B5A00BD946B00BD8C6300BD8C5200A573
      4A00A5734A00B5734200AD733900945A29006B314200944A2100844221007B39
      21007B3121006B31420000000000000000007B2900007B2900007B2900007B29
      00007B2900007B2900007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005200000052
      00000052000000520000005A0000109C210010A52900109C1800006B08000052
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200F7DEA500F7D69400946B4A00EFBD6B00E7B55A00E7AD4A00B57B
      3100B5732900DE8C2100D6841800AD6310006B314200CE5200009C3900008C31
      00009C3100006B31420000000000000000007B29000018EFFF0021E7FF0029DE
      FF0042CED60039D6E7007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000520000108C180010A52900005A0000005200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200FFEFB500F7DEA5009C6B5200EFCE7B00EFBD6B00E7B55A00BD84
      4200B57B3100DE943100DE8C2100AD6318006B314200DE630000A54200009C39
      0000A53900006B31420000000000000000007B290000B5C6A500ADAD8400C68C
      4A00D6732100C66B10007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000005A000008841800005A000000520000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200BDA59400C6AD94009C736300C6A58400C69C7B00BD946B009C6B
      39009C633100B57B3100B5732900945A21006B314200BD520000943908009439
      08008C4218006B31420000000000000000007B290000FFB56B00E7944200E77B
      2900D66B1800CE5A00007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000520000005200000052000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200FFF7F700F7F7F700F7EFF700F7EFEF00EFE7EF00EFE7E700EFE7
      E700E7DEDE00E7DEDE00E7D6D600BD9C9C006B3142009C949C009C9494009C94
      94009C8C94006B31420000000000000000007B29000029B5420029942100D6AD
      7300EFAD6B00E7A563007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000520000005200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B314200FFFFFF00FFF7F700F7F7F700F7EFF700F7EFEF00EFE7EF00EFE7
      E700EFE7E700E7DEDE00E7DEDE00BDA5A5006B3142009C9C9C009C949C009C94
      94009C9494006B31420000000000000000007B29000021C652008CD69400FFFF
      FF00FFFFFF00FFFFFF007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006B3142006B3142006B3142006B3142006B3142006B3142006B3142006B31
      42006B3142006B3142006B3142006B3142006B3142006B3142006B3142006B31
      42006B3142006B31420000000000000000007B2900007B2900007B2900007B29
      00007B2900007B2900007B290000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084BD000084BD000084BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C635A009C635A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084BD000084BD000084BD000084C6000084BD00008CCE009452
      4A0094524A0094524A0094524A0094524A0094524A0094524A0094524A009452
      4A0094524A0094524A0094524A0094524A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C635A009C635A00FFDEAD009C635A009C635A009C63
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A0000000000000000000084BD000084
      BD000084BD00008CCE0000A5E70000B5F70000ADEF000084BD0000BDFF009463
      5A00FFDEB500FFD6AD00FFD6A500FFCEA500FFCE9C00FFCE9400FFC69400FFC6
      8C00FFC68C00FFC68400FFBD840084524A000000000000000000000000000000
      000000000000000000006B6B6B006B6B6B006B6B6B0000000000000000000000
      0000000000006B6B6B006B6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C635A00FFE7C6009C635A00FFE7C600FFE7C600FFDE
      AD009C635A00945A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008C5A5A00FFD69C00FFD69C00FFCE9400FFD6
      9C00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD69C00FFCE9400FFDE9C008C5A5A000084BD000084BD00089CD60010B5
      E70010C6FF0008C6FF0000C6FF0000BDFF0000ADEF000084BD0000BDFF009463
      5A00FFE7C600FFDEBD00FFD6B500FFD6AD00FFD6A500FFCE9C00FFCE9C00FFC6
      9400FFC69400FFC68C00FFC6840084524A000000000000000000000000000000
      0000000000006B6B6B00B5ADAD00949494008C8C8C006B6B6B006B6B6B00847B
      7B006B6B6B00DEDEDE00D6CECE006B6B6B006B6B6B006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C5A5A0094635A009C635A009C635A009C635A009C635A009C63
      5A009C635A009C635A009C635A009C635A009C635A009C635A009C635A009C63
      5A009C635A009C635A009C635A00000000000000000000000000000000000000
      00000000000000520000005200000052000000520000F7DEC600EFDEC600EFDE
      C600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600EFCEAD00EFDEC600FFE7C6008C5A5A000084BD0039D6EF004AEFFF0039E7
      FF0029DEFF0018CEEF0008C6EF0000C6FF0000ADEF000084BD0000BDFF009463
      5A00FFE7CE00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00FFC68C0084524A000000000000000000000000000000
      00006B6B6B00D6D6D600C6C6C600A59C9C00A59C9C00A59C9C00848484005A5A
      5A00BDBDBD00CECECE00CECECE00D6D6D600D6D6D600CECECE006B6B6B006B6B
      6B006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000008C5A5A0094635A00FFE7C600FFE7BD00FFE7B500FFDEAD00FFD6
      A500FFCE9C00FFCE9400FFC68C00FFC68400FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFC684009C635A00000000000000000000000000000000000000
      000000520000007B0800007308008C5A5A00EFE7D600EFE7D600EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00F7EFE7008C5A5A000084BD0052DEEF006BF7FF0052EF
      FF0042E7FF00006B080018B5B50018CEFF0008B5EF000084BD00006B08009C6B
      5A00FFEFD600FFE7D600FFE7CE00FFE7C600FFDEBD00FFDEB500FFD6AD00FFD6
      A500FFCEA500FFCE9C00FFCE940084524A000000000000000000000000006B6B
      6B00DED6D600E7DEDE00C6BDBD00A59C9C00A59C9C00A59C9C00636363000000
      000000000000101010005A5A5A00ADADAD00CECECE00CECECE00CECECE00CECE
      CE00C6C6C6006B6B6B006B6B6B006B6B6B000000000000000000000000000000
      0000000000008C5A5A0094635A00FFE7C600FFDEBD00B5949C00FFD6A500FFD6
      A500FFD6A500FFD69C00FFCE9C00FFCE8C00FFC68400FFC68400FFC68400FFC6
      8400FFC68400FFC684009C635A00000000000000000000000000000000000052
      0000009C080000520000000000008C5A5A00F7EFDE00F7EFDE00F7EFE700D684
      2100D6842100D6842100D6842100D6842100D6842100D6842100D6842100D684
      2100F7EFE700F7E7DE00FFF7E7008C5A5A000084BD005ADEEF0084FFFF0073FF
      FF0063F7FF00006B0800108C5A0029DEFF0018C6EF000084BD00006B0800006B
      0800FFF7E700A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00FFCE9C0084524A0000000000000000006B6B6B00D6D6
      D600D6D6D600CECECE008C8C8C00847B7B00847B7B00847B7B006B6B6B001010
      100008080800000000000000000000000000101010005A5A5A00ADADAD00CECE
      CE00CECECE00B5B5B500B5B5B5006B6B6B000000000000000000000000000000
      00009C6B5A00AD847B009C6B5A00FFF7DE00FFDEBD0000008400FFDEBD00FFE7
      B5009C635A009C635A009C635A009C635A009C635A009C635A009C635A009C63
      5A009C635A00FFC684009C635A0000000000000000000000000000520000007B
      00000094100000520000000000008C5A5A00F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700FFFFEF008C5A5A000084BD005ADEEF0084FFFF0084FF
      FF007BFFFF00006B0800006B080042DEEF0029CEEF000084BD00006B08000894
      1800006B0800FFF7E700FFEFE700FFEFDE00FFEFD600FFE7CE00FFE7C600FFDE
      BD00FFDEB500FFD6B500FFD6AD0084524A00000000006B6B6B00CECECE00CECE
      CE00C6C6C6008C8C8C00BDB5B500B5B5B500A59C9C00A59C9C009C9C9C009C94
      9400949494008484840052525200292929000808080000000000000000001010
      100063636300847B7B006B6B6B00000000000000000000000000000000000000
      00009C6B5A00B5948C009C6B6300FFF7E700FFE7C600BDA5B500FFDEC600FFE7
      BD00FFD6A500FFD69C00FFCE9C00FFCE9C00FFCE9400FFCE9400FFC68C00FFC6
      8C00FFC68C00FFC684009C635A0000000000000000000000000000520000088C
      080010A5210000520000000000008C5A5A00FFF7EF00FFF7EF00FFF7EF00D684
      2100D6842100D6842100D6842100D6842100D6842100D6842100D6842100D684
      2100F7F7F700F7F7F700FFFFF7008C5A5A000084BD005ADEEF0084FFFF0084FF
      FF0084FFFF00006B080021AD4200006B08001894730000738400007342000894
      180008941800006B0800A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00FFDEB50084524A00000000006B6B6B00CECECE00C6C6
      C6008C8C8C00D6D6D600F7F7F700F7F7F700F7F7F700E7DEDE00CEC6C600B5B5
      B500A5A5A500A59C9C00A59C9C009C9C9C00949494006B636300212121000000
      0000181818009C9494006B6B6B00000000000000000000000000000000000000
      00009C6B5A00CE9C8C009C6B6300FFF7E700FFE7CE0000008400FFE7CE00FFE7
      C6009C635A009C635A009C635A009C635A009C635A009C635A009C635A009C63
      5A009C635A00FFC68C009C635A000000000000520000005200000052000010A5
      210018AD3100005200000052000000520000FFFFF700FFFFF700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFFFFF00FFFFFF00FFFFFF008C5A5A000084BD005ADEEF0084FFFF0063E7
      F70039C6E70018A5C600006B080039D66B0029B5420018A53100109C290010A5
      29000894180008941800006B0800FFF7EF00FFF7E700FFF7E700FFEFDE00FFEF
      D600FFE7CE00FFE7C600FFE7C60084524A00000000006B6B6B00C6C6C6008C8C
      8C00E7E7E700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7
      E700E7E7E700D6D6D600C6C6C600ADADAD00A59C9C00A59C9C009C9494008484
      84006B6B6B009C9C9C006B6B6B0000000000000000000000000000000000AD7B
      6B00E7D6CE00CE9C8C00A56B6300FFFFF700FFEFDE00BDADC600FFE7D600FFEF
      D600FFDEB500FFDEB500FFDEAD00FFD6AD00FFD6A500FFD6A500FFD69C00FFCE
      9C00FFCE9400FFCE94009C635A000000000000520000006B000010AD290021B5
      390029C6520039D66B00087B100000520000FFFFFF00FFFFFF00FFFFF700FFFF
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCEB500CE6B
      2100CE733100C65A1800FFFFFF008C5A5A000084BD000894CE00008CC6000084
      BD000084BD000084C600008CA500006B080029C6520029C6520021B5420018AD
      3100109C2100006B0800A56B6B00A56B6B00A56B6B00A56B6B00A56B6B00A56B
      6B00A56B6B00A56B6B00FFE7CE0084524A00000000006B6B6B008C8C8C00EFEF
      EF00F7F7F700F7F7F700F7F7F700F7F7F700D6D6D600847B7B00948C8C00C6BD
      BD00DEDEDE00E7E7E700DEDEDE00DEDEDE00D6D6D600C6C6C600B5B5B500A59C
      9C009C9C9C006B6B6B006B6B6B0000000000000000000000000000000000AD7B
      6B00E7D6CE00CE9C8C00A5736300FFFFFF00FFEFE70000008400FFEFDE00FFEF
      D6009C635A009C635A009C635A009C635A009C635A009C635A009C635A009C63
      5A009C635A00FFCE9C009C635A000000000000000000005200001084100031D6
      5A0042E77300108C2100005200008C5A5A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6C600B584
      5200B58C6300B5845200FFFFFF008C5A5A000084BD000084BD000094CE0008A5
      DE0008BDF70000C6FF0000BDFF0000B5EF000084630008732100006B080018B5
      3900006B0800C6DEC600FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7
      EF00EFDED600D6CEBD00C6BDAD0084524A00000000006B6B6B00CECECE00F7F7
      F700F7F7F700F7F7F700F7F7F700CECECE00ADADAD00ADADAD009C9C9C00847B
      7B00736B6B008C848400ADA5A500C6C6C600D6D6D600D6D6D600CECECE00CEC6
      C600BDBDBD00A5A5A5006B6B6B0000000000000000000000000000000000AD7B
      6B00CEA59400EFE7DE00AD736300FFFFFF00FFF7EF00BDB5D600FFF7E700FFF7
      DE00FFE7CE00FFE7CE00FFE7C600FFE7C600FFDEBD00FFDEB500FFDEB500FFDE
      AD00FFD6AD00FFD6A5009C635A00000000008C5A5A008C5A5A000052000021A5
      310018A53100005200008C5A5A008C5A5A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5D6FF001884
      FF00298CFF00107BFF00FFFFFF008C5A5A000084BD0031CEEF0039E7FF0029DE
      FF0018D6FF0010CEFF0000C6FF0000BDFF0000ADEF000084BD00006B0800006B
      0800BDCEB500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      F700CEC6BD00BDB5AD00C6BDB50084524A0000000000000000006B6B6B006B6B
      6B00CECECE00EFEFEF00ADA5A5006B5A5A00736B6B00847B7B009C949400ADAD
      AD00B5B5B500ADA5AD009C94940084737B00847B7B00948C8C00BDBDBD00CECE
      CE00CECECE00C6C6C6006B6B6B00000000000000000000000000BD7B6300FFFF
      FF00CE9C8C00F7EFEF00AD7B6300FFFFFF00FFF7EF0000008400FFF7EF00FFFF
      EF009C635A009C635A009C635A009C635A009C635A009C635A009C635A009C63
      5A009C635A00FFDEB5009C635A00000000008C5A5A00FFD69C00FFD69C000052
      000000520000FFD6A500FFD6A5008C5A5A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000052
      000000520000FFFFFF00FFFFFF008C5A5A000084BD004AD6EF005AEFFF004AE7
      FF0039E7FF0029DEFF0018D6FF0008CEFF0000B5EF000084BD00006B08005294
      7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094524A0094524A0094524A0094524A000000000000000000000000000000
      00006B6B6B006B6B6B00BD848400AD8C73007B5A520063525200635252006B5A
      63006B5A63008C848400A59C9C00ADADAD00B5B5B500A59CA500CECECE00CECE
      CE00B5B5B5006B6B6B0000000000000000000000000000000000BD7B6300FFFF
      FF00CE9C8C00FFFFFF00B57B6B00FFFFFF00FFFFF700BDBDDE00FFFFF700FFFF
      F700FFF7E700FFEFDE00FFEFDE00FFEFD600FFEFD600FFE7CE00FFE7CE00FFE7
      C600FFE7BD00FFDEBD009C635A00000000008C5A5A00F7DEC600F7DEC600EFDE
      C600EFDEC600EFDEC600EFDEC6008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A000052000018A5
      310021A53100005200008C5A5A008C5A5A000084BD0052DEEF007BFFFF006BF7
      FF0052EFFF0042E7FF0031DEFF0021D6FF0010BDEF000084BD0000BDFF00CE9C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094524A00FFEFDE00F7942100000000000000000000000000000000000000
      00000000000000000000BD848400FFD6AD00FFD6A500FFCE9C00D6A57B00A57B
      5A007B635A006352520063525A006B6363008C848400CECECE00CECECE00A5A5
      A5006B6B6B000000000000000000000000000000000000000000BD7B6300F7E7
      E700CE9C8C00FFFFFF00B5846B00FFFFFF00FFFFFF0000008400FFFFFF00FFFF
      FF009C635A009C635A009C635A009C635A009C635A009C635A009C635A009C63
      5A009C635A00FFE7C6009C635A00000000008C5A5A00EFE7D600EFE7D600EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7DE00EFE7
      DE00EFE7DE00EFE7DE00EFE7DE00F7EFE7008C5A5A0000520000108C210042E7
      730031D65A001084100000520000000000000084BD005ADEEF0084FFFF007BFF
      FF0073FFFF0063F7FF004AEFFF0039E7FF0021C6EF000084BD0000BDFF00D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0094524A00F794210000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFDEB500FFD6AD00FFCEA500FFCE9400FFC6
      8C00FFC68400FFBD8400FFC68400BD8484006B6B6B006B6B6B006B6B6B006B6B
      6B000000000000000000000000000000000000000000CE846300F7E7DE00E7C6
      B500D6B5A500FFFFFF00BD846B00FFFFFF00FFFFFF00BDBDE700FFFFFF00FFFF
      FF00FFFFF700FFFFF700FFF7EF00FFF7EF00FFF7E700FFF7E700FFEFDE00FFEF
      DE00FFEFD600FFFFDE009C635A00000000008C5A5A00F7EFDE00F7EFDE00F7EF
      E700D6842100D6842100D6842100D6842100D6842100D6842100D6842100D684
      2100D6842100F7EFE700F7E7DE00FFF7E70000520000087B100039D66B0029C6
      520021B5390010AD2900006B0000005200000084BD005ADEEF0084FFFF0084FF
      FF0084FFFF007BFFFF006BF7FF005AEFFF0031CEEF000084BD0000BDFF00DEA5
      7300D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B0094524A000000000000000000000000000000000000000000000000000000
      00000000000000000000BD848400FFDEBD00FFDEB500FFD6A500FFCE9C00FFCE
      9400FFC68C00FFC68400FFC68400BD8484000000000000000000000000000000
      00000000000000000000000000000000000000000000CE8C6B00FFF7EF00DEA5
      8C00EFCEBD00FFFFFF00BD846B00FFFFFF00FFFFFF0000008400FFFFFF00FFFF
      FF009C635A009C635A009C635A009C635A009C635A009C635A009C635A009C63
      5A009C635A00FFFFDE009C635A00000000008C5A5A00F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700F7EFE700F7EFE700FFFFEF0000520000005200000052000018AD
      310010A521000052000000520000005200000084BD005ADEEF0084FFFF0084FF
      FF0084FFFF005ADEEF0031BDDE00109CCE00008CC6000084BD000084C600218C
      B500528C9C00529CA50052A5B50052A5B5004AA5B5004A949C00527B8C00AD73
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFE7CE00FFE7C600FFDEBD00FFD6AD00FFD6A500FFCE
      9C00FFCE9400FFC68C00BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000CE8C6B00E7B59C00FFFFFF00DEA5
      8C00F7E7DE00FFFFFF00C68C6B00FFFFFF00FFFFFF00BDBDE700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFEF00FFFFF700FFFF
      F700FFFFE700FFFFDE009C635A00000000008C5A5A00FFF7EF00FFF7EF00FFF7
      EF00D6842100D6842100D6842100D6842100D6842100D6842100D6842100D684
      2100D6842100F7F7F700F7F7F700FFFFF7008C5A5A00000000000052000010A5
      2100088C08000052000000000000000000000084BD0031BDDE0031BDDE00109C
      CE000084BD000084BD000894C60021ADD60042CEE70039D6EF0018B5E700009C
      D600008CC6000084BD000084BD000094CE00009CDE000094D6000084BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFEFD600FFE7CE00FFE7C600FFDEB500FFD6AD00FFD6
      A500FFCE9C00FFC69400BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000CE8C6B00EFD6C600FFFFFF00DEA5
      8C00FFF7EF00FFFFFF00C68C6B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFF7EF00FFF7EF00FFFFDE00FFFF
      DE00FFFFDE00FFFFDE009C635A00000000008C5A5A00FFFFF700FFFFF700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFFFFF00FFFFFF00FFFFFF008C5A5A0000000000005200000094
      1000007B00000052000000000000000000000084BD000084BD000084BD00008C
      C60029B5DE006BEFF70084FFFF0084FFFF007BFFFF0052EFFF0031DEFF0010CE
      FF0000C6FF0000ADEF000094D6000084BD000084BD000084BD000084BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD848400FFEFDE00FFEFD600FFE7CE00FFE7BD00FFDEB500FFD6
      AD00FFD6A500F7C69400BD848400000000000000000000000000000000000000
      000000000000000000000000000000000000D6946B00CE8C6300EFD6C600DEA5
      8C00FFFFFF00FFFFFF00CE8C7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF7009C635A009C63
      5A009C635A009C635A009C635A00000000008C5A5A00FFFFFF00FFFFFF00FFFF
      F700FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFCE
      B500CE6B2100CE733100C65A1800FFFFFF008C5A5A000000000000520000009C
      080000520000000000000000000000000000000000000084BD000084BD000084
      BD000084BD000084BD000894CE0018A5D60031BDDE0029BDE70010ADDE000094
      CE000084BD000084BD000084BD000084BD000084BD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD848400FFF7EF00FFF7E700FFEFDE00FFE7D600FFE7C600FFDEBD00FFDE
      B500FFD6AD00BD84840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6946B00E7BD
      A500FFFFFF00FFFFFF00CE947300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C635A00FFC6
      8400FFC68400FFC68400FF942100000000008C5A5A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6
      C600B5845200B58C6300B5845200FFFFFF008C5A5A0000730800007B08000052
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000084BD000084BD000084BD000084BD000084BD000084
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      8400FFFFF700FFFFF700FFF7EF00FFF7E700FFEFDE00FFE7CE00FFE7C600FFDE
      BD00F7C6AD00BD84840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CE8C6300CE8C
      6B00EFCEBD00FFE7D600CE947300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C635A00FFC6
      8400FFCE9400FF94210000000000000000008C5A5A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5D6
      FF001884FF00298CFF00107BFF00005200000052000000520000005200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      8400BD848400BD848400BD848400FFF7EF00FFF7E700FFEFD600FFE7CE00FFDE
      C600BD8484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE8C6B00FFE7D600D6947300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C635A00FFC6
      8400FF9421000000000000000000000000008C5A5A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C5A5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BD848400BD848400BD848400BD848400BD84
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE8C6300D69C7300CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C
      6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B00CE8C6B009C635A00FF94
      2100000000000000000000000000000000008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00000000000000000000000000085ACE00085A
      CE00085ACE00085ACE00085ACE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE004A6B73009C6B6B00DE9C9C00CE8C8C00BD7B7B00AD6B
      6B00945A5A005A313100085ACE00085ACE000000000000000000000000000000
      00000000000000000000000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE0008397B00000000000052000031CE
      5A0029C652000052000000520000005200000052000000520000005200000052
      000000520000085ACE00085ACE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A000031A54A0029BD
      520018AD290010941000004A0000000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF002994FF00000000000000000000000000319C
      FF00319CFF00319CFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF007B5A5A00DEA5A500DE9C9C00CE8C8C00BD7B
      7B00AD6B6B008C5252005A31310039A5FF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094CEFF00319CFF00319C
      FF00319CFF00299CFF002994FF002994FF0008397B0000000000000000000052
      000031CE6300005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      000000000000000000000000000000000000005A0000189C310021C6520018B5
      420010A52900089C180000840800004A00000000000000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994FF002173C60000000000000000000000
      0000319CFF00000000000000000000000000085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF003194F7007B525A00DEA5A500DE9C9C00CE8C
      8C00BD7B7B00A56B6B008C5252005A313100085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994FF0008397B0000000000000000000000
      000000520000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      0000000000000000000000000000005A000018A5390029D65A0021C6520018B5
      390010A52900089C1000008C000000730000004A000000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF002173C60094D6FF00000000000000
      0000000000000000000000000000319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00105AC6007B5A5A00DEA5A500DE9C
      9C00CE8C8C00BD7B7B00A56B6B008C5252005A39310000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF0008397B0000000000000000000000
      000000000000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      00000000000000000000005A000021AD420031E76B0029CE5A0018BD4A0010B5
      390008A5210000941000008C00000084000000730000004A0000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF002173C60094D6FF00319CFF000000
      00000000000000000000319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE009CD6F70073525A00DE9C
      9C00DE9C9C00CE8C8C00B57B7B00A56B6B008C5252005A313100000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF0008397B0000000000000000000000
      000000000000000000000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      000000000000005A000029B5420042EF730031DE630029CE5A0018BD4A0010AD
      310008A521000094080000840000008400000084000000730000004A00000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF002173C60094D6FF00000000000000
      0000000000000000000000000000319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE009CDEFF004AADF7007352
      5A00DE9C9C00DE9C9C00C68C8C00B57B7B00A56B6B008C5252005A3131000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF0008397B0000000000000000000000
      000000000000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE000000000000000000000000000000
      0000005A000029B542004AFF840039EF730031DE630021CE520018BD420010AD
      3100089C1800009408000084000000840000008400000084000000730000004A
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF002173C60000000000000000000000
      0000319CFF00000000000000000000000000085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE00A5DEFF0042B5FF004AAD
      F700946B6B00E7A5A500DE9C9C00C68C8C00B57B7B00844A4A00424A52003142
      520000000000000000000000000000000000085ACE0094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF0008397B0000000000000000000000
      000000520000005200000000000000000000DEEFFF001884FF001884FF001884
      FF001884FF001884FF001884FF00085ACE00000000000000000000000000005A
      000029B542004AFF840042FF7B0039E76B0029D6630021C6520018B5420010A5
      2900089C1800008C080000840000008400000084000000840000008400000073
      0000004A0000000000000000000000000000085ACE00E7EFFF0094D6FF0094D6
      FF0094D6FF0094D6FF0094D6FF0094D6FF0000000000000000000000000094D6
      FF0094D6FF0094D6FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE00E7EFFF009CDEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF00085ACE00E7EFFF00A5DEFF009CDE
      FF009CD6F700946B6B00E7A5A500DE9C9C00524A5200008CC60000ADEF0000A5
      E7000084C600000000000000000000000000085ACE009CD6FF0042ADFF0039AD
      FF0039ADFF0039A5FF0039A5FF0031A5FF0008397B0000000000000000000052
      000008941000005200000000000000000000DEEFFF00DEEFFF00DEEFFF00DEEF
      FF00DEEFFF00DEEFFF00DEEFFF00DEEFFF000000000000000000005A0000189C
      310031CE5A00189C3100189C310010841800006B080000630800006308000063
      0000005A0000005A0000005A0000005A0000005A000000630000006300000073
      0000006B0000004A00000000000000000000085ACE004284C6002173C6002173
      C6002173C6002173C600186BC6000000000000000000000000002173C6002173
      C6002173C6002173C6002173C600000000000000000000000000000000000000
      000000000000000000000000000000000000085ACE004284C6002173C6002173
      C6002173C6002173C600186BC600186BC600085ACE00085ACE00085ACE00085A
      CE00085ACE00105AC6008C636B00BD848C00087BAD0000BDFF0000BDFF0000A5
      E70000189C00000084000000000000000000085ACE004284C6002173C6002173
      C6002173C6002173C600186BC600186BC60008397B0008397B000052000010A5
      2100089C18000052000000520000005200000052000000520000005200000052
      00000052000000000000000000000000000000000000005A0000004A0000004A
      0000005A000000630000006B00000073080000841000088C180084FFFF0000CE
      EF0000B5CE0000A5BD00084A520021B54A0021A53900189C3100108C21000873
      1000004A0000004A0000004A000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0000000000000000000000000094D6FF00319CFF00319C
      FF00319CFF00299CFF002994FF002994FF000000000000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0039ADFF0039A5FF00186BC6009CDEFF00319CFF00319C
      FF00319CFF00299CFF003194F7006B525A00009CDE0000BDFF00008CD6000018
      9C0000089C00000894000000840000000000085ACE009CDEFF0042B5FF0042B5
      FF0042ADFF0039ADFF0039ADFF0039A5FF00186BC6000052000021B5390018AD
      310010A52900089C18000894100000941000008C0800008C0800008C0800008C
      080000520000000000000000000000000000005A0000005A0000007300000084
      0000C67B0000C67B0000C67B0000C67B0000089C180008A5290010AD31007BFF
      FF0000CEE70000C6E70000CEE700085A630042F77B004AFF84004AFF84004AFF
      84004AFF840031CE5A00005A0800004A0000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF000000000000000000186BC60094D6FF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994FF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF0039ADFF0039ADFF00186BC6009CDEFF0031A5FF00319C
      FF00319CFF00319CFF00299CFF002994F7000094D60000B5F7000029A5000021
      DE000021BD000018B5000008940000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042ADFF0039ADFF0039ADFF000052000031CE5A0029C64A0021BD
      420018B5310010A52900109C21000894180000941000008C0800008C0800008C
      08000052000000000000000000000000000000000000005A000000630000C67B
      0000E7C65A00E7C65200E7B53900DEAD1800C67B000008A5290010AD310018BD
      420084FFFF0000D6F70000D6F70000D6F700085A630031CE5A00189C31001894
      2900FF7BFF00004A0000004A000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C60094D6FF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6009CDEFF0039A5FF0031A5
      FF00319CFF00319CFF00319CFF00299CFF00085ACE000084C6000821BD00294A
      F7000829CE000018B50000008C0000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6000052000031CE5A0029C6
      520021BD420018B5390018AD290010A52100089C180008941000008C0800008C
      080000520000000000000000000000000000000000000000000000000000E7AD
      6B00EFDE9C00EFD68C00E7CE6300E7BD3900C67B0000004A0000004A0000004A
      0000004A000084FFFF0000D6F700085A6300004A0000004A0000004A0000FF7B
      FF00FF7BFF00730073000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C60094D6FF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C6009CDEFF0039A5FF0039A5
      FF0031A5FF00319CFF00319CFF00319CFF00085ACE00000000001021BD005273
      FF001839E700000894000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042ADFF0039ADFF002173C60039ADFF000052000031CE
      5A0029C652000052000000520000005200000052000000520000005200000052
      000000520000000000000000000000000000000000000000000000000000E7AD
      6B00FFF7D600F7EFBD00EFD68C00E7C65200C67B000000000000000000000000
      0000000000000000000052E7F700000000000000000000000000FF94FF00FF7B
      FF0000000000730073007300730000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C60094D6FF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C6009CDEFF0039ADFF0039A5
      FF0039A5FF0031A5FF00319CFF00319CFF00085ACE0000000000000000001021
      BD000008A500000000000000000000000000085ACE009CDEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042ADFF002173C60039ADFF0039ADFF000052
      000031CE630000520000319CFF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7AD
      6B00FFFFFF00FFF7D600EFDE9C00E7C65A00FF7B000000000000000000000000
      00000000000000000000000000000000000000000000FF94FF00FF94FF000000
      000000000000000000007300730073007300085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C60094D6FF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C6009CDEFF0039ADFF0039AD
      FF0039A5FF0039A5FF0031A5FF00319CFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00A5DEFF0042B5FF0042B5
      FF0042B5FF0042B5FF0042B5FF0042B5FF002173C60039ADFF0039ADFF0039AD
      FF00005200000052000031A5FF00319CFF00085ACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7AD6B00E7AD6B00E7AD6B00E7AD6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF94FF00FF94
      FF0000000000730073007300730000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C600E7EFFF0094D6FF0094D6
      FF0094D6FF0094D6FF0094D6FF0094CEFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C600E7EFFF0094D6FF0094D6
      FF0094D6FF0094D6FF0094D6FF0094CEFF00085ACE0000000000000000000000
      000000000000000000000000000000000000085ACE00E7EFFF00A5DEFF009CDE
      FF009CDEFF009CDEFF009CDEFF009CDEFF004284C6009CD6FF0094D6FF0094D6
      FF0094D6FF000052000094D6FF0094CEFF00085ACE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF94
      FF00FF7BFF0073007300000000000000000000000000085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085ACE00085A
      CE00085ACE00085ACE00085ACE00085ACE000000000000000000000000000000
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
      00000000000000000000000000000000F8FFFFFFFFFFFFFFFF000000E000FF01
      FFFFF7FFFF000000C0000F01FFFFE7FFFF00000080000301FFFFE7FFFF000000
      800001010001E3FFFF00000000000001FFFFE3FFFF00000000000001FFFFE3FC
      FF00000000000001FFFFE1FC7F000000800001FFFFFFE1FC3F00000080000301
      FFFFE0FC1F000000C0000301FFFFE07C0F000000E0000301FFFFF00007000000
      F00003010001F00003000000F0000301FFFFF80001000000F0000301FFFFFC00
      01000000F0000301FFFFFE0003000000F00003FFFFFFFF0007000000F0000301
      FFFFFFC00F000000F0000301FFFFFFFC1F000000F0000301FFFFFFFC3F000000
      F00003010001FFFC7F000000F0000301FFFFFFFCFF000000F0000301FFFFFFFF
      FF000000F0000301FFFFFFFFFF000000FF1FFFFFFFFFFE7FFFFFFFFFF80000FF
      FFFFFC0FFFFE0000C00000FC79FFFC03FFFE0000000000F8003FF80001F80000
      000000F00007F80001F00000000000E00000F80001E20000000000C00000F000
      01C20000000000800001F00001C20000000000800001F0000100000000000080
      0001E00001000000000000800001E00001800000000000800001E00001000000
      000000C00001C00001000000000000F00003C00001000000000001FC0007C000
      01000001000003FC000F800001000000000007FC00FF80000100000000000FF8
      01FF00000100004300001FF801FF00000100004300001FF801FF000001000047
      80007FF003FFC0000100000FFC0FFFE003FFC0000300001FFFFFFFE007FFF000
      0700007FFFFFFFFE0FFFF8000F00007FFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFF3
      FFFFFFF3FFFFC3FFFFFFFFF0FFFFFFE3FFFF81FFFFFFFFF03FFFFFC007FF81FF
      FFFFFFF81FFFFF8007FF81FFFCFF9FF80FFFFF0007FF81FFFC7F1FFC07FFFF80
      07FF81FF80003F8000FF804001FF81FF00007F00007F006300FF00FF00007F00
      007F007300FE007F00007F00007F007B00FC003F00007F00003F007F00F8001F
      00007F00001F007B00F0000F00007F00000F007300E0000700007F0000070063
      00C0000300003F00000300000780000100001F00000100000700000000001F00
      000100000780000100007F000001000007E0000300007F000043000007E07DC9
      00007F00006700007FE07F9C00007F00007F00007FF0FFC900007F00007F0000
      7FFFFFE38000FF8000FF8000FFFFFFF7FFFFFFFFE7FFFFFBFFFFFFFFFFFFFFFF
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
  object cxStyleRepository1: TcxStyleRepository
    Left = 368
    Top = 160
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
  object StoredProc2: TpFIBStoredProc
    Database = WorkDatabase
    Transaction = WriteTransaction
    Left = 56
    Top = 224
  end
end
