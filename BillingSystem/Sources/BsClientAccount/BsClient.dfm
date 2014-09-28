object frmClientAccount: TfrmClientAccount
  Left = 450
  Top = 113
  Width = 648
  Height = 624
  Caption = #1054#1089#1086#1073#1086#1074#1110' '#1088#1072#1093#1091#1085#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlClient: TPanel
    Left = 34
    Top = 46
    Width = 598
    Height = 540
    Align = alClient
    TabOrder = 4
    object pnlGrid: TPanel
      Left = 1
      Top = 379
      Width = 596
      Height = 160
      Align = alClient
      TabOrder = 0
      Visible = False
      object FIlterGrid: TcxGrid
        Left = 1
        Top = 1
        Width = 594
        Height = 158
        Align = alClient
        TabOrder = 0
        object FIlterGridDBView: TcxGridDBTableView
          OnKeyDown = FIlterGridDBViewKeyDown
          DataController.DataSource = FilterDS
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsData.Editing = False
          OptionsView.CellAutoHeight = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = ClientAccountGridStyle
          object FIlterGridDBViewDBColumn6: TcxGridDBColumn
            Caption = #1052#1072#1096#1080#1085#1080#1081' '#1082#1086#1076
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 69
            DataBinding.FieldName = 'KOD_MACHINE'
          end
          object FIlterGridDBViewDBColumn9: TcxGridDBColumn
            Caption = #1054#1089#1086#1073#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 68
            DataBinding.FieldName = 'CLIENT_ACCOUNT'
          end
          object FIlterGridDBViewDBColumn5: TcxGridDBColumn
            Caption = #1055#1088#1110#1079#1074#1080#1097#1077
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 121
            DataBinding.FieldName = 'SURNAME_CLIENT'
          end
          object FIlterGridDBViewDBColumn1: TcxGridDBColumn
            Caption = #1030#1084#39#1103
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 89
            DataBinding.FieldName = 'FIRSTNAME_CLIENT'
          end
          object FIlterGridDBViewDBColumn2: TcxGridDBColumn
            Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 94
            DataBinding.FieldName = 'SECONDNAME_CLIENT'
          end
          object FIlterGridDBViewDBColumn3: TcxGridDBColumn
            Caption = #1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 65
            DataBinding.FieldName = 'TIN_CLIENT'
          end
          object FIlterGridDBViewDBColumn4: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 98
            DataBinding.FieldName = 'DATE_BIRTH'
          end
          object FIlterGridDBViewDBColumn7: TcxGridDBColumn
            Caption = #1050#1074#1072#1088#1090#1080#1088#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            SortOrder = soAscending
            Width = 150
            DataBinding.FieldName = 'NUM_FLAT'
          end
          object FIlterGridDBViewDBColumn8: TcxGridDBColumn
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1084#1077#1096#1082#1072#1085#1094#1110#1074
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 150
            DataBinding.FieldName = 'NUM_TENANTS'
          end
          object FIlterGridDBViewDBColumn10: TcxGridDBColumn
            Caption = #1055#1086#1095#1072#1090#1086#1082' '#1076#1110#1111' '#1086#1089#1086#1073'. '#1088#1072#1093#1091#1085#1082#1091
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 98
            DataBinding.FieldName = 'DATE_BEG'
          end
          object FIlterGridDBViewDBColumn11: TcxGridDBColumn
            Caption = #1050#1110#1085#1077#1094#1100' '#1076#1110#1111' '#1086#1089#1086#1073'. '#1088#1072#1093#1091#1085#1082#1091
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 93
            DataBinding.FieldName = 'DATE_END'
          end
          object FIlterGridDBViewDBColumn12: TcxGridDBColumn
            Caption = #1058#1077#1083#1077#1092#1086#1085' '#1072#1073#1086#1085#1077#1085#1090#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 78
            DataBinding.FieldName = 'CLIENT_PHONE'
          end
          object FIlterGridDBViewDBColumn13: TcxGridDBColumn
            Caption = #1042#1074#1086#1076
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 60
            DataBinding.FieldName = 'KOD_INPUT'
          end
          object FIlterGridDBViewDBColumn14: TcxGridDBColumn
            Caption = #1055#1086#1089#1083#1091#1075#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 100
            DataBinding.FieldName = 'NAME_SERVICE'
          end
          object FIlterGridDBViewDBColumn15: TcxGridDBColumn
            Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1086#1089#1083#1091#1075#1080
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Width = 61
            DataBinding.FieldName = 'NUM_SERVICE'
          end
          object FIlterGridDBViewDBColumn16: TcxGridDBColumn
            Caption = #1041#1083#1072#1075#1086#1091#1089#1090#1088#1110#1081
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 90
            DataBinding.FieldName = 'Kod_Name'
          end
        end
        object FIlterGridLevel: TcxGridLevel
          GridView = FIlterGridDBView
        end
      end
    end
    object pnlMain: TPanel
      Left = 1
      Top = 1
      Width = 596
      Height = 378
      Align = alTop
      BorderStyle = bsSingle
      TabOrder = 1
      object lblStatusClient: TcxLabel
        Left = 351
        Top = 159
        Width = 140
        Height = 17
        TabOrder = 31
        Caption = #1057#1090#1072#1090#1091#1089' '#1086#1089#1086#1073#1086#1074#1086#1075#1086' '#1088#1072#1093#1091#1085#1082#1091
      end
      object pnlAction: TPanel
        Left = 1
        Top = 341
        Width = 590
        Height = 32
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 48
        Visible = False
        object btnOk: TcxButton
          Left = 149
          Top = 4
          Width = 90
          Height = 25
          Action = ActOk
          TabOrder = 0
          Visible = False
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            3300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            003300009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF666666969696666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF009933009933009900009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF999999999999969696969696999999666666FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF003300339933009933009933009933009900009933003300FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF666666B2B2B2A4A0A0999999969696969696999999666666FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF00330000800033CC3333CC330099330033000099330099000099330033
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF666666868686B2B2B2B2B2B2969696666666999999969696999999
            666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF00330000800033CC6633CC33339933003300FFFFFF00330000993300
            9900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF666666868686C0C0C0C0C0C0A4A0A0666666FFFFFF6666669999
            99969696999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF00330033CC6633CC66339933003300FFFFFFFFFFFFFFFFFF
            003300008000009900009933003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF666666CCCCCCCCCCCCB2B2B2666666FFFFFFFFFFFFFF
            FFFF666666868686969696999999666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF00330033993333CC66003300FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF003300009900009933003300FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0D7D7D7666666FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF666666969696969696666666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00330033CC66FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300009933009900FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666969696969696FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0033000066000033
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666777777
            666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF008000003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF868686666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF003300006600003300FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF666666777777666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF003300003300FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666666666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          UseSystemPaint = False
        end
        object btnCancel: TcxButton
          Left = 285
          Top = 4
          Width = 90
          Height = 25
          Action = ActCancel
          TabOrder = 1
          Visible = False
          Glyph.Data = {
            8E0B0000424D8E0B00000000000036000000280000002C000000160000000100
            180000000000580B0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000066000066FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000066000066
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
            66666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66
            6666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660033FF0033FF
            0033FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0000
            FF0000FF0000FF000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666B2
            B2B2B2B2B2A4A0A0969696666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666
            969696999999999999999999666666FFFFFFFFFFFFFFFFFFFFFFFF0000660000
            CC0033FF0033FF0033FF0000CC000066FFFFFFFFFFFFFFFFFF0000660000CC00
            00FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            666666A4A0A0B2B2B2B2B2B2B2B2B2969696666666FFFFFFFFFFFFFFFFFF6666
            66969696999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0000660000CC0033FF0033FF0033FF0000CC000066FFFFFF0000660000CC
            0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2B2B2B2B2999999666666FFFFFF66
            6666999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033FF0000CC0000660000
            CC0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2B2B2B2B2999999
            666666999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033FF00
            00FF0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2B2B2
            B2B2B2B2999999999999999999999999969696666666FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660000CC0033FF
            0033FF0000FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4
            A0A0B2B2B2B2B2B2A4A0A0A4A0A0999999969696666666FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
            660033CC0033FF0000FF0000FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF666666A4A0A0B2B2B2A4A0A0A4A0A0999999666666FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            00660033CC0033FF0033FF0033FF0033FF0033FF0000CC000066FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF666666B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A0A0666666FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000660033CC0033FF0033FF0033FF0033CC0033FF0033FF0033FF0000CC0000
            66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF666666B2B2B2B2B2B2B2B2B2B2B2B2A4A0A0B2B2B2B2B2B2B2B2B2
            A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF0000660033CC0033FF0033FF0033FF0033CC0000660033CC0033FF0033FF00
            33FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF666666B2B2B2C0C0C0B2B2B2B2B2B2B2B2B2666666A4A0A0B2B2
            B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF0000660033CC0033FF0033FF0033FF0033CC000066FFFFFF0000660000CC
            0033FF0033FF0033FF0000CC000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF666666B2B2B2C0C0C0C0C0C0C0C0C0A4A0A0666666FFFFFF66
            6666A4A0A0B2B2B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF0000660033CC0033FF0033FF0033FF0033CC000066FFFFFFFFFFFFFFFF
            FF0000660000CC0033FF0033FF0033FF0033CC000066FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF666666C0C0C0C0C0C0C0C0C0C0C0C0A4A0A0666666FFFFFF
            FFFFFFFFFFFF666666999999B2B2B2B2B2B2B2B2B2A4A0A0666666FFFFFFFFFF
            FFFFFFFFFFFFFF0000663333FF3333FF3333FF0033CC000066FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000660000CC0033FF0033FF0033CC000066FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0C0C0C0C0C0C0A4A0A0666666FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF666666999999B2B2B2B2B2B2A4A0A0666666FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000663333CC0033CC000066FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000660033CC0033CC000066FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666C0C0C0B2B2B2666666FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666A4A0A0B2B2B2666666
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          UseSystemPaint = False
        end
      end
      object lblRegion: TcxLabel
        Left = 15
        Top = 1
        Width = 40
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsUnderline]
        TabOrder = 0
        OnClick = lblRegionClick
        OnMouseEnter = lblAdresMouseEnter
        OnMouseLeave = lblAdresMouseLeave
        Caption = #1056#1077#1075#1110#1086#1085
      end
      object BsRegionBox: TcxLookupComboBox
        Left = 15
        Top = 17
        Width = 282
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Id_Gr_List_Obj'
        Properties.ListColumns = <
          item
            Caption = #1056#1045#1043#1030#1054#1053
            Width = 70
            FieldName = 'Name_Gr_List_Obj'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = RegionDS
        Properties.OnChange = BsRegionBoxPropertiesChange
        Properties.OnInitPopup = BsRegionBoxPropertiesInitPopup
        TabOrder = 1
        OnClick = BsRegionBoxClick
        OnEnter = BsRegionBoxEnter
        OnExit = BsRegionBoxExit
        OnKeyUp = BsRegionBoxKeyUp
      end
      object lblCItyArea: TcxLabel
        Left = 344
        Top = 1
        Width = 39
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsUnderline]
        TabOrder = 2
        OnClick = lblCItyAreaClick
        OnMouseEnter = lblAdresMouseEnter
        OnMouseLeave = lblAdresMouseLeave
        Caption = #1056#1072#1081#1086#1085
      end
      object CityAreaBox: TcxLookupComboBox
        Left = 312
        Top = 17
        Width = 266
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Id_City_Area'
        Properties.ListColumns = <
          item
            Caption = #1056#1040#1049#1054#1053
            FieldName = 'Name_City_Area'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = CityAreaDS
        Properties.OnChange = CityAreaBoxPropertiesChange
        Properties.OnInitPopup = CityAreaBoxPropertiesInitPopup
        TabOrder = 3
        OnClick = CityAreaBoxClick
        OnEnter = CityAreaBoxEnter
        OnExit = CityAreaBoxExit
        OnKeyUp = CityAreaBoxKeyUp
      end
      object HouseEdit: TcxTextEdit
        Left = 336
        Top = 138
        Width = 49
        Height = 21
        TabOrder = 22
      end
      object lblHouse: TcxLabel
        Left = 309
        Top = 140
        Width = 29
        Height = 17
        TabOrder = 21
        Caption = #1041#1091#1076'.'
      end
      object lblKorpus: TcxLabel
        Left = 389
        Top = 140
        Width = 44
        Height = 17
        TabOrder = 23
        Caption = #1050#1086#1088#1087#1091#1089
      end
      object KorpusEdit: TcxTextEdit
        Left = 431
        Top = 138
        Width = 43
        Height = 21
        Properties.MaxLength = 5
        TabOrder = 24
      end
      object DomBox: TcxLookupComboBox
        Left = 83
        Top = 138
        Width = 214
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Id_Street'
        Properties.ListColumns = <
          item
            Caption = #1042#1059#1051#1048#1062#1071
            Width = 130
            FieldName = 'Name_Street'
          end
          item
            Width = 40
            FieldName = 'Type_Street'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DomDS
        Properties.OnInitPopup = DomBoxPropertiesInitPopup
        TabOrder = 20
        OnClick = DomBoxClick
        OnEnter = DomBoxEnter
        OnExit = DomBoxExit
        OnKeyUp = DomBoxKeyUp
      end
      object lblStreet: TcxLabel
        Left = 15
        Top = 122
        Width = 45
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsUnderline]
        TabOrder = 19
        OnClick = lblStreetClick
        OnMouseEnter = lblStreetMouseEnter
        OnMouseLeave = lblStreetMouseLeave
        Caption = #1042#1091#1083#1080#1094#1103
      end
      object lblFIO: TcxLabel
        Left = 15
        Top = 36
        Width = 145
        Height = 17
        TabOrder = 4
        Caption = #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
      end
      object lblFlat: TcxLabel
        Left = 478
        Top = 139
        Width = 56
        Height = 17
        TabOrder = 25
        Caption = #1050#1074#1072#1088#1090#1080#1088#1072
      end
      object FlatEdit: TcxTextEdit
        Left = 532
        Top = 138
        Width = 46
        Height = 21
        TabOrder = 26
      end
      object FamiliyaBox: TcxLookupComboBox
        Left = 16
        Top = 55
        Width = 281
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Out_Str'
        Properties.ListColumns = <
          item
            Caption = #1055#1088#1110#1079#1074#1080#1097#1077
            FieldName = 'Out_Str'
          end>
        Properties.ListSource = FamSource
        Properties.MaxLength = 40
        Properties.OnInitPopup = FamiliyaBoxPropertiesInitPopup
        TabOrder = 5
        OnClick = FamiliyaBoxClick
        OnEnter = FamiliyaBoxEnter
        OnExit = FamiliyaBoxExit
        OnKeyUp = FamiliyaBoxKeyUp
      end
      object ImyaBox: TcxLookupComboBox
        Left = 15
        Top = 80
        Width = 282
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Out_Str'
        Properties.ListColumns = <
          item
            Caption = #1030#1084#39#1103
            FieldName = 'Out_Str'
          end>
        Properties.ListSource = ImyaSource
        Properties.MaxLength = 40
        Properties.OnInitPopup = ImyaBoxPropertiesInitPopup
        TabOrder = 12
        OnClick = ImyaBoxClick
        OnEnter = ImyaBoxEnter
        OnExit = ImyaBoxExit
        OnKeyUp = ImyaBoxKeyUp
      end
      object PatronomycBox: TcxLookupComboBox
        Left = 15
        Top = 105
        Width = 282
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Out_Str'
        Properties.ListColumns = <
          item
            Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
            FieldName = 'Out_Str'
          end>
        Properties.ListSource = PatrSource
        Properties.MaxLength = 40
        Properties.OnInitPopup = PatronomycBoxPropertiesInitPopup
        TabOrder = 18
        OnClick = PatronomycBoxClick
        OnEnter = PatronomycBoxEnter
        OnExit = PatronomycBoxExit
        OnKeyUp = PatronomycBoxKeyUp
      end
      object lblMchineKod: TcxLabel
        Left = 338
        Top = 37
        Width = 55
        Height = 17
        TabOrder = 6
        Caption = #1052#1072#1096'. '#1082#1086#1076
      end
      object lblInput: TcxLabel
        Left = 438
        Top = 37
        Width = 33
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsUnderline]
        TabOrder = 8
        OnClick = lblInputClick
        OnMouseEnter = lblInputMouseEnter
        OnMouseLeave = lblInputMouseLeave
        Caption = #1042#1074#1086#1076
      end
      object lblClientAccount: TcxLabel
        Left = 504
        Top = 37
        Width = 80
        Height = 17
        TabOrder = 10
        Caption = #1054#1089#1086#1073'. '#1088#1072#1093#1091#1085#1086#1082
      end
      object MachineKodEdit: TcxTextEdit
        Left = 316
        Top = 54
        Width = 91
        Height = 21
        TabOrder = 7
      end
      object InputEdit: TcxTextEdit
        Left = 416
        Top = 54
        Width = 73
        Height = 21
        TabOrder = 9
        OnKeyUp = InputEditKeyUp
      end
      object ClientAccountEdit: TcxTextEdit
        Left = 496
        Top = 54
        Width = 84
        Height = 21
        TabOrder = 11
      end
      object lblTenants: TcxLabel
        Left = 17
        Top = 177
        Width = 57
        Height = 17
        TabOrder = 27
        Caption = #1052#1077#1096#1082#1072#1085#1094#1110
      end
      object TenantsEdit: TcxTextEdit
        Left = 40
        Top = 194
        Width = 41
        Height = 21
        TabOrder = 29
      end
      object lblTenantsE: TcxLabel
        Left = 15
        Top = 195
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 28
        Caption = '='
      end
      object lblLastPayment: TcxLabel
        Left = 349
        Top = 84
        Width = 89
        Height = 17
        TabOrder = 13
        Caption = #1054#1089#1090#1072#1085#1085#1103' '#1086#1087#1083#1072#1090#1072
      end
      object lblPayE: TcxLabel
        Left = 315
        Top = 106
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 14
        Caption = '='
      end
      object WaterEdit: TcxTextEdit
        Left = 486
        Top = 107
        Width = 93
        Height = 21
        TabOrder = 17
      end
      object ProcGroupBox: TGroupBox
        Left = 96
        Top = 174
        Width = 201
        Height = 52
        Caption = #1055#1110#1083#1100#1075#1080
        TabOrder = 30
        object btnProcKod: TcxButton
          Left = 11
          Top = 19
          Width = 35
          Height = 24
          Caption = '%'
          TabOrder = 0
          OnClick = btnProcKodClick
        end
        object lblProcKodEqual: TcxLabel
          Left = 49
          Top = 23
          Width = 25
          Height = 17
          AutoSize = False
          PopupMenu = MenusSign
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          TabOrder = 1
          Caption = '='
        end
        object ProcKodEdit: TcxTextEdit
          Left = 69
          Top = 21
          Width = 35
          Height = 21
          TabOrder = 2
        end
        object lblPeople: TcxLabel
          Left = 111
          Top = 22
          Width = 20
          Height = 17
          TabOrder = 3
          Caption = #1085#1072
        end
        object CntPeopleEdit: TcxTextEdit
          Left = 155
          Top = 21
          Width = 38
          Height = 21
          TabOrder = 4
        end
        object lblPeopleEqual: TcxLabel
          Left = 132
          Top = 23
          Width = 25
          Height = 17
          AutoSize = False
          PopupMenu = MenusSign
          TabOrder = 5
          Caption = '='
        end
      end
      object lblStatusFlat: TcxLabel
        Left = 111
        Top = 232
        Width = 92
        Height = 17
        TabOrder = 32
        Caption = #1057#1090#1072#1090#1091#1089' '#1082#1074#1072#1088#1090#1080#1088#1080
      end
      object lblOrganization: TcxLabel
        Left = 391
        Top = 232
        Width = 140
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsUnderline]
        TabOrder = 35
        OnClick = lblOrganizationClick
        OnMouseEnter = lblOrganizationMouseEnter
        OnMouseLeave = lblOrganizationMouseLeave
        Caption = #1054#1073#1089#1083#1091#1075#1086#1074#1091#1102#1095#1072' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
      end
      object lblImprovement: TcxLabel
        Left = 177
        Top = 269
        Width = 68
        Height = 17
        TabOrder = 38
        Caption = #1041#1083#1072#1075#1086#1091#1089#1090#1088#1110#1081
      end
      object lblPhone: TcxLabel
        Left = 485
        Top = 269
        Width = 53
        Height = 17
        TabOrder = 40
        Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      object CustomServiceBox: TcxLookupComboBox
        Left = 344
        Top = 249
        Width = 235
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Id_Gr_List_Obj'
        Properties.ListColumns = <
          item
            Caption = #1054#1073#1089#1091#1083#1075#1086#1074#1091#1102#1095#1072' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
            FieldName = 'Name_Gr_List_Obj'
          end>
        Properties.ListSource = CustomServiceDS
        Properties.OnInitPopup = CustomServiceBoxPropertiesInitPopup
        TabOrder = 36
        OnClick = CustomServiceBoxClick
        OnEnter = CustomServiceBoxEnter
        OnExit = CustomServiceBoxExit
        OnKeyUp = CustomServiceBoxKeyUp
      end
      object lblFlatE: TcxLabel
        Left = 15
        Top = 250
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 33
        Caption = '='
      end
      object lblOrganiztionEqual: TcxLabel
        Left = 315
        Top = 250
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 34
        Caption = '='
      end
      object NormIntakeBox: TcxLookupComboBox
        Left = 40
        Top = 287
        Width = 353
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'ID_NORM_INTAKE'
        Properties.ListColumns = <
          item
            FieldName = 'KOD_NAME'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = NormIntakeDS
        Properties.OnInitPopup = NormIntakeBoxPropertiesInitPopup
        TabOrder = 39
        OnClick = NormIntakeBoxClick
        OnEnter = NormIntakeBoxEnter
        OnExit = NormIntakeBoxExit
        OnKeyUp = NormIntakeBoxKeyUp
      end
      object PhoneEdit: TcxTextEdit
        Left = 408
        Top = 286
        Width = 170
        Height = 21
        TabOrder = 41
      end
      object lblNormIntakeE: TcxLabel
        Left = 15
        Top = 288
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 37
        Caption = '='
      end
      object lblAvto: TcxLabel
        Left = 15
        Top = 313
        Width = 32
        Height = 17
        TabOrder = 42
        Caption = #1040#1074#1090#1086
      end
      object lblGreenHouse: TcxLabel
        Left = 399
        Top = 313
        Width = 51
        Height = 17
        TabOrder = 46
        Caption = #1058#1077#1087#1083#1080#1094#1103
      end
      object lblWatering: TcxLabel
        Left = 204
        Top = 313
        Width = 40
        Height = 17
        TabOrder = 44
        Caption = #1055#1086#1083#1080#1074
      end
      object GreenHouseEdit: TcxTextEdit
        Left = 456
        Top = 313
        Width = 122
        Height = 21
        TabOrder = 47
      end
      object WateringEdit: TcxTextEdit
        Left = 272
        Top = 313
        Width = 122
        Height = 21
        TabOrder = 45
      end
      object AvtoEdit: TcxTextEdit
        Left = 74
        Top = 313
        Width = 127
        Height = 21
        TabOrder = 43
      end
      object LastPaymentDate: TcxDateEdit
        Left = 340
        Top = 106
        Width = 117
        Height = 21
        TabOrder = 15
      end
      object btnWater: TcxButton
        Left = 484
        Top = 84
        Width = 94
        Height = 19
        Caption = #1042#1086#1076#1072
        TabOrder = 16
        OnClick = btnWaterClick
      end
      object lblWaterEqual: TcxLabel
        Left = 464
        Top = 108
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 49
        Caption = '='
      end
      object lblStatusCLientEqual: TcxLabel
        Left = 311
        Top = 175
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 50
        Caption = '='
      end
      object lblAvtoEqual: TcxLabel
        Left = 44
        Top = 313
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 51
        Caption = '='
      end
      object lblGreenHouseEqual: TcxLabel
        Left = 402
        Top = 313
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 52
        Caption = '='
      end
      object lblWateringEqual: TcxLabel
        Left = 246
        Top = 313
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 53
        Caption = '='
      end
      object StatusClientBox: TcxLookupComboBox
        Left = 344
        Top = 175
        Width = 234
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID_CLIENT_STATUS'
        Properties.ListColumns = <
          item
            Caption = #1057#1090#1072#1090#1091#1089' '#1086#1089#1086#1073#1086#1074#1086#1075#1086' '#1088#1072#1093#1091#1085#1082#1091
            FieldName = 'NAME_CLIENT_STATUS'
          end>
        Properties.ListSource = ClientStatusDS
        TabOrder = 54
      end
      object StatusFlatBox: TcxLookupComboBox
        Left = 40
        Top = 248
        Width = 257
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID_FLAT_STATUS'
        Properties.ListColumns = <
          item
            Caption = #1057#1090#1072#1090#1091#1089' '#1082#1074#1072#1088#1090#1080#1088#1080
            FieldName = 'NAME_FLAT_STATUS'
          end>
        Properties.ListSource = FlatStatusDS
        TabOrder = 55
      end
      object InginerBox: TcxLookupComboBox
        Left = 344
        Top = 212
        Width = 236
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'Id_Gr_List_Obj'
        Properties.ListColumns = <
          item
            Caption = #1054#1073#1089#1091#1083#1075#1086#1074#1091#1102#1095#1072' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
            FieldName = 'Name_Gr_List_Obj'
          end>
        Properties.ListSource = InginerDS
        Properties.OnInitPopup = CustomServiceBoxPropertiesInitPopup
        TabOrder = 56
        OnClick = InginerBoxClick
        OnEnter = InginerBoxEnter
        OnExit = InginerBoxExit
        OnKeyUp = InginerBoxKeyUp
      end
      object lblInginerEqual: TcxLabel
        Left = 313
        Top = 213
        Width = 25
        Height = 17
        AutoSize = False
        PopupMenu = MenusSign
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        TabOrder = 57
        Caption = '='
      end
      object lblInginer: TcxLabel
        Left = 421
        Top = 195
        Width = 62
        Height = 17
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsUnderline]
        TabOrder = 58
        OnClick = lblOrganizationClick
        OnMouseEnter = lblOrganizationMouseEnter
        OnMouseLeave = lblOrganizationMouseLeave
        Caption = #1050#1086#1085#1090#1088#1086#1083#1077#1088
      end
      object TypeStreetBox: TcxLookupComboBox
        Left = 16
        Top = 139
        Width = 61
        Height = 21
        Properties.DropDownHeight = 100
        Properties.DropDownListStyle = lsEditList
        Properties.DropDownWidth = 100
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'ID_TYPE_STREET'
        Properties.ListColumns = <
          item
            FieldName = 'NAME_SHORT'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = TypeStreetDS
        Properties.OnInitPopup = TypeStreetBoxPropertiesInitPopup
        TabOrder = 59
        OnClick = TypeStreetBoxClick
        OnEnter = TypeStreetBoxEnter
        OnExit = TypeStreetBoxExit
        OnKeyUp = TypeStreetBoxKeyUp
      end
    end
  end
  object ClientDB: TpFIBDatabase
    DefaultTransaction = ClientTransRead
    DefaultUpdateTransaction = ClientTransWrite
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 40
    Top = 380
  end
  object ClientTransRead: TpFIBTransaction
    DefaultDatabase = ClientDB
    TimeoutAction = TARollback
    Left = 100
    Top = 382
  end
  object ClientTransWrite: TpFIBTransaction
    DefaultDatabase = ClientDB
    TimeoutAction = TARollback
    Left = 69
    Top = 380
  end
  object ActionList1: TActionList
    Left = 285
    Top = 378
    object ActIns: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = ActInsExecute
    end
    object ActEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = ActEditExecute
    end
    object ActDel: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = ActDelExecute
    end
    object ActSelect: TAction
      Caption = #1054#1073#1088#1072#1090#1080
    end
    object ActClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnExecute = ActCloseExecute
    end
    object ActFilter: TAction
      OnExecute = ActFilterExecute
    end
    object ActClear: TAction
      OnExecute = ActClearExecute
    end
    object ActRedo: TAction
      OnExecute = ActRedoExecute
    end
    object ActUndo: TAction
      OnExecute = ActUndoExecute
    end
    object ActOk: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    end
    object ActCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = ActCancelExecute
    end
  end
  object ClientAcStyleRepository: TcxStyleRepository
    Left = 447
    Top = 381
    object stBackground: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object stContent: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentEven: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stContentOdd: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stFilterBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stGroup: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stGroupByBox: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stInactive: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object stIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBlack
    end
    object stIndicator: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object stPreview: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object stHotTrack: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clMaroon
    end
    object ContentError: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15850428
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15850428
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
      Color = 14531001
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
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
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object ClientAccountGridStyle: TcxGridTableViewStyleSheet
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
  object ImageList: TImageList
    Height = 24
    Width = 24
    Left = 415
    Top = 379
    Bitmap = {
      494C010128002C00040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000080100000100200000000000008C
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00FEFEFE000000000000000000F7F7F700EFEEEE00EAE9
      E900EAE9E900EFEEEE00F7F7F7000000000000000000FEFEFE00FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00FEFEFE000000000000000000F7F6F600EFEEEE00E9E8
      E800E9E8E800EFEEEE00F7F6F6000000000000000000FEFEFE00FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00FEFEFE000000000000000000F6F6F700EEEEEE00E8E7
      EB00E8E7EB00EEEEEE00F6F6F7000000000000000000FEFEFE00FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00FEFEFE000000000000000000F6F6F700EEEEEE00E8E7
      EB00E8E7EB00EEEEEE00F6F6F7000000000000000000FEFEFE00FDFDFD00FEFE
      FE00FEFEFE00FEFEFE00000000000000000000000000FEFEFE0000000000FEFE
      FE00FDFDFD0000000000F9F9F900D2D3D300AFB0B000AEAEAF00ACADAE00AAAC
      AD00AAACAD00ACADAE00AEAEAF00AFB0B000D2D3D300F9F9F90000000000FDFD
      FD00FEFEFE0000000000FEFEFE000000000000000000FEFEFE0000000000FEFE
      FE00FDFDFD0000000000F9F9F900D0CFCF00B0B0B000B0B2B300ADB0B200ABAF
      B100ABAFB100ADB0B200B0B2B300B0B0B000D0CFCF00F9F9F90000000000FDFD
      FD00FEFEFE0000000000FEFEFE000000000000000000FEFEFE0000000000FEFE
      FE00FDFDFD0000000000F9F8FA00D0D0D200B0B1AE00B2B3AF00AFB1AF00B2B2
      A800B2B2A800AFB1AF00B2B3AF00B1B1AD00D0D0D100F9F8FA0000000000FDFD
      FD00FEFEFE0000000000FEFEFE000000000000000000FEFEFE0000000000FEFE
      FE00FDFDFD0000000000F9F8FA00D0D0D200B0B1AE00B2B3AF00AFB1AF00B2B2
      A800B2B2A800AFB1AF00B2B3AF00B1B1AD00D0D0D100F9F8FA0000000000FDFD
      FD00FEFEFE0000000000FEFEFE0000000000FEFEFE0000000000FEFEFE00FEFE
      FE0000000000DCDBDB00B1B2B300AAA9A900C0BEBE00B3AEAC00A7948F00B492
      8A00B4928A00A9948F00B5B0AE00C2BFBE00ABAAA900B1B2B300DCDBDB000000
      0000FEFEFE00FEFEFE0000000000FEFEFE00FEFEFE0000000000FEFEFE00FEFE
      FE0000000000DCDCDC00B0AFAF00B3B8B900BEBFBF00AA9F9C00A0868000AE85
      7C00AE867C00A3888100ACA09D00BFC0BF00B3B8BA00AFAFAF00DCDCDC000000
      0000FEFEFE00FEFEFE0000000000FEFEFE00FEFEFE0000000000FEFEFE00FEFE
      FE0000000000DBDBDC00B2B2AD00B4B4AE00BDBBC400A19BAE009D8682007165
      E2007165E2009F878300A39EAE00BAB9CA00B2B2B200B2B2AB00DCDBDD000000
      0000FEFEFE00FEFEFE0000000000FEFEFE00FEFEFE0000000000FEFEFE00FEFE
      FE0000000000DBDBDC00B2B2AD00B4B4AE00BDBBC400A19BAE009D8682007165
      E2007165E2009F878300A39EAE00BAB9CA00B2B2B200B2B2AB00DCDBDD000000
      0000FEFEFE00FEFEFE0000000000FEFEFE0000000000FEFEFE00FEFEFE000000
      0000C6C5C600B1B2B400C3C0C000C2BAB800D8CECB00FCFBFB00F5F3F300F6F2
      F300F6F2F300F5F3F300FCFBFB00D9CECC00C6BDBA00C5C2C100B0B3B400C6C5
      C50000000000FEFEFE00FEFEFE000000000000000000FEFEFE00FEFEFE000000
      0000C6C5C600AFB0B100C8CACB00A78E870098554300A6442900AE3B1E00B131
      1200B1301200B43B1E00B0442B009F564400AE908A00C9CBCC00AFB0B100C6C5
      C50000000000FEFEFE00FEFEFE000000000000000000FEFEFE00FEFEFE000000
      0000C5C5C700B1B2AE00BEBDD600655CD200372BDA002018EE001D13E100160C
      E800160CE8001D13E200231AE900261EF3005B54E200BCBBD400B2B4AC00C7C6
      C70000000000FEFEFE00FEFEFE000000000000000000FEFEFE00FEFEFE000000
      0000C5C5C700B1B2AE00BEBDD600655CD200372BDA002018EE001D13E100140B
      E700140BE7001D13E200231AE900261EF3005B54E200BCBBD400B2B4AC00C7C6
      C70000000000FEFEFE00FEFEFE0000000000FEFEFE00FDFDFD0000000000C6C6
      C600B6B9BB00BAAEAB00B6A49F00FCFBFB0000000000FFFEFF0000000000FDFF
      FD00FDFFFD0000000000FFFEFE0000000000FCFBFB00BBA49F00BEB0AC00B6BA
      BC00C6C6C60000000000FDFDFD00FEFEFE00FEFEFE00FDFDFD0000000000C6C6
      C600B4B5B700C4C0BF00905E4E009F3C1D00B3412000BE422100B24022009348
      3600934A3900AB432A00C9422300C4432600AE3C23009B5F5100C6C1C000B4B6
      B800C6C6C60000000000FDFDFD00FEFEFE00FEFEFE00FDFDFD0000000000C5C5
      C700B4B6B700CBC3B5004838BB00130CF400221AED00241BEC00241EEE002621
      E9002621E900241EED00231BED00241BEB00140DF2004433C600C7BEC100AEB0
      B300C7C6C70000000000FDFDFD00FEFEFE00FEFEFE00FDFDFD0000000000C5C5
      C700B4B6B700CBC3B5004838BB00130CF4002219ED00241CEC00241CED002921
      EB002A22EC00251DED00231BED00241BEB00140DF2004433C600C7BEC100AEB0
      B300C7C6C70000000000FDFDFD00FEFEFE00FCFCFC0000000000DCDCDC00B1B3
      B500B9AEAB00B2988F00FFFDFD00FDFDFC00F9FAF70000000000BDE2AE004AAF
      20004AAF2000BDE2AE0000000000F9FAF700FDFDFC00FFFDFD00B6958E00BEB0
      AC00B0B4B500DCDBDB0000000000FDFDFD00FCFCFC0000000000DCDCDC00AFAF
      B000C2BFBF008B4F3B00A9401E00B6452200B5432100B7350F00BF6E5800E7EE
      EF00EEF1F100A3766900B02A0B00C9452700C7442700BB402400954D3C00C5C1
      BF00AFB1B100DCDCDC0000000000FDFDFD00FCFCFC0000000000DCDBDD00B1B2
      AE00C9C1B600663F75002115E700261EED00241EE700200FFC003251A3004BB1
      1F004BB11F003251A300200FFC00231DE800261EEE002319E700190FE5006F6B
      F100BABBAB00DAD9DE0000000000FDFDFD00FCFCFC0000000000DCDBDD00B1B2
      AE00C9C1B600663F75002115E700261EED00271FEA00150EF0006257DA00EFEA
      E900F0EDEE00665CDF00150DEE00261EEB00261EEE002319E700190FE5006F6B
      F100BABBAB00DAD9DE0000000000FDFDFD00FDFDFD00F7F7F700B0B1B100BEBB
      BA00B7A6A100FEFEFF00FEFEFE00FEFEFE00FBFDFA00FEFEFE00B8E0A8003DA9
      0F003DA90F00B8E0A800FEFEFE00FBFDFA00FEFEFE00FEFEFE00FFFEFE00BAA4
      9F00C5C1C000B1B2B300F7F7F700FEFEFE00FDFDFD00F7F6F600AFAFAF00C8CA
      CB00905F4F00A7421E00B2462100B2401D00B5442100B1320C00CA826C00F3FA
      FC0000000000B08B7F00AA270500C8452600C2402100C3432500B73F2200985E
      4E00C8CBCB00AFAFAF00F7F7F700FEFEFE00FDFDFD00F6F6F800B2B2AC00BFBE
      D4004535C3002A18DA00231DF000231BEB00231EE9001F0EFD0033559D004EBC
      10004EBC100033559D001F0EFD00241EE800231BEC00261EEB001711F5004A3E
      CC00D5D0B800ADAEB300F7F7F700FEFEFE00FDFDFD00F6F6F800B2B2AC00BFBE
      D4004535C3002A18DA00231DF000231BEB00271FEC00130BED006F69E900FCFC
      EF00FFFFF900736FEF001209EB002820ED00231BEC00261EEB001711F5004A3E
      CC00D5D0B800ADAEB300F7F7F700FEFEFE0000000000D0D0D100B0B0B000D6D4
      D200FCFEFE00FDFDFD00FEFEFE0000000000FBFCFA0000000000BAE1AA0040AB
      130040AB1300BAE1AA0000000000FBFCFA0000000000FEFEFE00FCFCFC00FDFE
      FE00C3BAB700ABAAAA00D3D4D4000000000000000000CFCECE00B3B8B900A994
      8C009B411F00B1482200AF421D00B0411D00B2432000B1330D00C47D6600D0DB
      DE00E9EDEF00AF897C00A8260500C4442300BF3F1E00BE3F1F00C0432400A53B
      1F00A98E8700B4B8BA00D1D0D0000000000000000000CECED100B7B7AF006E67
      D400120BF300251EF000241BEB00231BED00241EE800200FFC0032549F004DB9
      14004DB9140032549F00200FFC00241DE900231BED00241CEB00241EF0001F11
      DA008B7FB800B8BAB100CFD0D2000000000000000000CECED100B7B7AF006E67
      D400120BF300251EF000241BEB00231BED00261EEB00140CEF006862E200DCDE
      D100EEEFE300726EEF00120AEC002720EC00231BED00241CEB00241EF0001F11
      DA008B7FB800B8BAB100CFD0D20000000000FBFBFC00ADADAE00CBCBCB000000
      0000FDFDFD00FEFEFE0000000000FEFEFE00FBFDFA0000000000BAE1AA0040AB
      130040AB1300BAE1AA0000000000FBFDFA00FEFEFE0000000000FDFCFC00FFFE
      FE00D8CECB00C1BDBD00AFB0B100FFFEFE00FBFBFB00B0AFB000C0C0C1009F67
      5300AF482200AE451E00B0441E00AF411D00B0441F00B0340C00C07A6500BEC9
      CC00D5D9DA00AD877B00A6270400C0422200BB3F1E00BB401E00B93F1D00B540
      200095544100BFBFBF00B0B0B10000000000FBFBFB00AFB0B100C2BFBE004B39
      C2001F17F000251BE900231CED00241CEC00241EE900200FFC0033559F004EBA
      14004EBA140033559F00200FFD00241EE800241CEC00231BED00241BEA001C17
      F6004933B500C4BFBA00AFB0B200FFFEFF00FBFBFB00AFB0B100C2BFBE004B39
      C2001F17F000251BE900231CED00241CEC00271FEC00150CEE006560E100C9CC
      BF00DADBCE00716DEE00130AEB00261FEB00241CEC00231BED00241BEA001C17
      F6004933B500C4BFBA00AFB0B200FFFEFF00E2E2E200B3B3B400B7B4B200FBFB
      FB00FEFEFE00FEFEFE00FEFEFE0000000000FBFDFA0000000000BAE1AA0040AB
      130040AB1300BAE1AA0000000000FBFDFA0000000000FEFEFE0000000000FEFE
      FE0000000000B6B1B000AEADAE00F7F8F800E1E0E100B5B6B700AFA7A400AD5B
      3C00B9542D00AE451E00AE441D00AE421D00AF431F00AD350D00BE7A6300B3BD
      C000C8CCCD00AB857A00A3280300BA422000B63E1D00B63F1C00B63E1B00B340
      1E009C402500AAA09D00B0B2B300F7F7F700E1E0E100B4B6B700B0A7A3004E30
      B3001D18F400251CEB00241CEC00241CEC00241EE900200FFD0033559F004EBA
      14004EBA140033559F00200FFD00241EE800241CEC00241CEC00231BEC00211B
      F000301ECF00A29AA800B2B3B100F7F6F700E1E0E100B4B6B700B0A7A3004E30
      B3001D18F400251CEB00241CEC00241CEC00271FEC00150DEF00645EDF00BEC0
      B300CDCFC100706BEC00120AEC00271EEC00241CEC00241CEC00231BEC00211B
      F000301ECF00A29AA800B2B3B100F7F6F700C9C8C800B4B5B500B0A5A000F7F6
      F50000000000000000000000000000000000FBFDFA0000000000BAE1AA0040AB
      130040AB1300BAE1AA0000000000FBFDFA000000000000000000FEFEFE000000
      0000F4F2F200A4938D00ACADAE00EEEEEE00C8C6C700B6B8B900AA999200B057
      3300C35D3700BB532C00AD431D00AE421D00AF442000AC350D00BF7C6500AEB8
      BB00BFC4C500AA8579009E270300B5411E00B13E1B00B13E1C00B03D1A00B03F
      1D009C3C1D009D867E00AEB0B100EEEDED00C6C7C700B6B7B900AA9991004B2A
      AD001E19F500251CEB00241CED00241CEB00241EE900200FFD0033559F004EBA
      14004EBA140033559F00200FFD00241EE900241CED00241CED00241CED00251D
      ED001810E8007A6DB800B2B3AB00ECEDEF00C6C7C700B6B7B900AA9991004B2A
      AD001E19F500251CEB00241CED00241CEB00271FEC00150CEF006560DF00B8BB
      AE00C4C7B9006E6BEC001309ED00271FEC00241CED00241CED00241CED00251D
      ED001810E8007A6DB800B2B3AB00ECEDEF00B9B8B800B4B5B600BFA9A000F5F3
      F200FEFEFE00000000000000000000000000FBFDFA0000000000BAE1AA0040AB
      130040AB1300BAE1AA0000000000FBFDFA00000000000000000000000000FEFE
      FE00F4F1F000AF918800AAACAD00E9E8E800B8B7B700B6B8BA00BA9D9200B559
      3400C7603800C7603900BE562F00AD431D00AB421D00AB360D00BE7B6500B1BB
      BF00BFC4C500A98478009C270200B1411E00AD3D1A00AE3E1B00AD3E1B00AE40
      1B009A371500A7837700ACAFB200E9E8E700B8B6B700B5B8BA00BB9D9000512B
      A4001D18F600251CEA00241CED00241CEC00241EE900200FFC0033559F004EBA
      14004EBA140033559F00200FFD00241EE800241CEC00241CEC00241CEC00241E
      EE00170DE3007F6DC300B1B2AA00E7E7E900B8B6B700B5B8BA00BB9D9000512B
      A4001D18F600251CEA00241CED00241CEC00271FEC00150DEE00655FE000BBBE
      B200C4C6B9006F6BEC00130AEC00271FEC00241CEC00241CEC00241CEC00241E
      EE00170DE3007F6DC300B1B2AA00E7E7E900B9B8B800B4B5B600C2AAA300F5F3
      F300FEFEFE00000000000000000000000000FBFDFA0000000000BAE1AA0042AB
      150042AB1500BAE1AA0000000000FBFDFA00000000000000000000000000FEFE
      FE00F4F1F000AF928800AAADAE00E9E8E800B8B7B700B5B8BA00BBA09500BA5E
      3900CB653D00C9633C00CB653E00C55D3600B44C2700A6340B00BA7A6200BAC2
      C600C5C8C900A98377009B280200AF431E00AB3E1A00AC3F1B00AB3E1A00AC41
      1C0099371600A7847800ACAFB100E9E8E700B8B7B700B4B8BB00BFA192005830
      A0001C19F700251CEA00241CEC00241CED00241DE900200FFC0032549F004DB8
      16004DB8160032549F00200FFC00241DE900241CEC00241CED00241CED00251D
      EF00180EE00091799F00AFB1AC00E8E7E900B8B7B700B4B8BB00BFA192005830
      A0001C19F700251CEA00241CEC00241CED00261EEC00150DEE00645FE000C2C4
      BA00C9CABF006E6AEC00130AEC00261EEC00241CEC00241CED00241CED00251D
      EF00180EE00091799F00AFB1AC00E8E7E900C9C8C800B4B4B500B7AAA600F7F5
      F50000000000FEFEFE000000000000000000FAFCF90000000000B6DFA60037A7
      070037A70700B6DFA60000000000FAFCF9000000000000000000FEFEFE000000
      0000F5F2F200A6969000ABADAE00EEEEEE00C7C7C600B5B7B800B1A19900BE67
      4300CF6A4100CD694000CE683F00D0694100CF6A4300BE4B2100C0816900C6D4
      DA00D0D9DC00A886790097270100AE431E00AA3F1A00AB401A00AA3F1A00AB41
      1C00983C1D009E898000AEB0B200EEEDED00C8C7C800B5B7B800B2A098005030
      B1001D18F500251BEB00241CED00241CEC00241EE8001F0EFD0033579B004FC1
      09004FC1090033579B001F0EFD00241EE800241CED00241CEC00241CEC00241C
      EE001D13E00098868C00B0B1AE00EEEDED00C8C7C800B5B7B800B2A098005030
      B1001D18F500251BEB00241CED00241CEC00271FEB00140CEF006962DF00DADC
      C500DFE0C900726EEB001209ED00271FEB00241CED00241CEC00241CEC00241C
      EE001D13E00098868C00B0B1AE00EEEDED00E2E2E200B2B2B300BDBAB9000000
      0000FEFEFE0000000000FEFEFE0000000000FBFDFA00FEFEFE00C7E6BA0065BB
      400064BB4000C6E6B900FEFEFE00FBFDFB00FEFEFE00FEFEFE0000000000FEFE
      FE0000000000B7B2B000ADADAE00F7F8F800E1E1E100B4B5B600B6AFAC00C576
      5600D16E4500D26F4500D36D4600D26C4500D26E4700D3683E00D27D5D00E3CF
      C700EBD7D100B0745F009E310B00AC441D00A9401A00A8411A00A9411B00AA43
      1E009B492B00ACA39F00B0B2B300F7F7F700E1E0E200B4B5B600B7AEAB005539
      BD001D17F200241CEB00231CEC00241CEC00241DE9002011F900304AAE00459B
      3D00459B3D00304AAE002011F900241DE900241CEC00241CEC00231BEC00231B
      EB001F17EF00A29DAF00B3B3AF00F7F6F800E1E0E200B4B5B600B7AEAB005539
      BD001D17F200241CEB00231CEC00241CEC00261DEA001711F1005B47D200CAC2
      DC00CAC6E2005F50DE00160FEF00261EEC00241CEC00241CEC00231BEC00231B
      EB001F17EF00A29DAF00B3B3AF00F7F6F800FBFBFC00AFAFB000C4C2C200E4DE
      DC0000000000FDFDFD0000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFC00FFFE
      FE00DBD3CF00C1BFBE00AFAFB000FFFEFE00FBFBFB00AFAFAF00C2C4C500C18C
      7800D6744C00D6724B00D8734B00D7724A00D6714900D5704900D46A4300CC5B
      3100C6582E00D0623A00CA633C00C35B3500BF573100BC552F00BA542E00B655
      2F009C654F00C0C0C000AFAFB00000000000FBFBFB00ADAEB100CAC7BE006552
      C2001711F400271EE900231BEC00241CED00241BED00241DEA002216F5001F0B
      FF001F0BFF002216F500241DEB00241BED00241CEC00231BED00241CEA001E17
      F1003C30D500C0BEC200AFB0AF00FEFEFE00FBFBFB00ADAEB100CAC7BE006552
      C2001711F400271EE900231BEC00241CED00231BED00251DEB001C15EF000E06
      EF000E05EE001C14EE00251DEC00231BED00241CEC00231BED00241CEA001E17
      F1003C30D500C0BEC200AFB0AF00FEFEFE0000000000D1D1D100ACACAC00D1CC
      CA00FBFCFD00FDFCFC00FEFEFE0000000000FEFEFE00FCFDFC00F5FBF3008ECD
      740056B52E00B9E0A900FCFEFC00FCFDFB00FEFEFE00FEFEFE00FCFCFC00FDFE
      FE00C5BEBA00ABAAAA00D3D3D3000000000000000000D0CFCF00B0B4B500C7B4
      AD00D57E5C00DC795100DB785000DB784F00DB784F00DA754C00D8744B00E3B7
      A600DEC7BD00C5755600CF653D00CE684200C9643D00C6613A00C4603B00AB55
      3400AE999000B3B7B800D1D0D0000000000000000000CECDD000B6B8B200AEA1
      BC003220D9001D18F300261DEA00231BED00241DE9002011FA00304BAC00469F
      3800469F3800304BAC002011FA00241DE900231BED00251CE900221CF3002B1A
      D000A4919E00B5B8B400D0CFD2000000000000000000CECDD000B6B8B200AEA1
      BC003220D9001D18F300261DEA00231BED00261DEA001714F6005D3ABD00D1B1
      BC00CDC1D6005845CF001711F200261DEB00231BED00251CE900221CF3002B1A
      D000A4919E00B5B8B400D0CFD20000000000FDFDFD00F7F7F700AFB0B000CBC9
      C900DBCDC800FEFEFE00FDFEFE00FEFEFE00FAFCF90000000000B7DFA60035A6
      06004AAF200042AC1700ECF6E80000000000FDFDFD00FEFDFE00FEFEFE00C0AF
      A900C6C2C200B1B2B200F7F7F700FEFEFE00FDFDFD00F7F7F700AEAEAE00CCCF
      D000CEA39200DF805900E17F5600E17E5500E17F5700DC714400EAAA8F000000
      000000000000E8CCC000CC643A00CF6B4300C9663E00C8663F00BA5E3A009E71
      6000C9CBCB00B0AFAF00F8F7F700FEFEFE00FDFDFD00F7F7F700ACADAF00D5D5
      CB00A789AA003822D9001B17F200271EEA00231DE8001F0EFE0033589A0050C3
      060050C3060033589A001F0EFE00231EE800251CEA00211CF200140DF6005F4D
      AF00D4D1BE00ADAEB200F8F7F700FEFEFE00FDFDFD00F7F7F700ACADAF00D5D5
      CB00A789AA003822D9001B17F200271EEA00281FEC001008ED007A70E900FFFF
      F800000000007B76F2000F07EB002820ED00251CEA00211CF200140DF6005F4D
      AF00D4D1BE00ADAEB200F8F7F700FEFEFE00FCFCFC0000000000DDDDDD00ACAD
      AE00D3CAC600E4CFC600FFFFFE00FDFDFD00FAFCF900FEFEFE00BEE2AE0038A8
      0A0040AB13004CB02200EEF7EA00FDFDFC00FCFDFC00FFFEFD00BFA89E00C0B5
      B100AFB1B300DCDCDC0000000000FDFDFD00FCFCFC0000000000DDDDDD00ABAC
      AC00D6D5D400D6A28C00E3845E00E5825A00E6845C00E3794E00EA9B7B00FDF4
      F000FFFEFD00ECB8A300D3693F00D2704800CF6E4500C1674100A06C5600C8C4
      C300AEAFB000DDDCDC0000000000FDFDFD00FCFCFC0000000000DDDDDD00A9AA
      AE00E0DBCD00B98E9F004027D4001613F3002922E6002010FB003151A3004BB0
      21004BB021003251A300200FFC00261FE6001A18F8003F25C90074518A00C8C3
      C300ADAEB000DDDCDC0000000000FDFDFD00FCFCFC0000000000DDDDDD00A9AA
      AE00E0DBCD00B98E9F004027D4001613F3002D23E900130DEF00705DDD00F1ED
      EE00F1F0FE00716AEE001109EB002921EA001A18F8003F25C90074518A00C8C3
      C300ADAEB000DDDCDC0000000000FDFDFD00FEFEFE00FDFDFD0000000000C7C7
      C800AFB2B400D5CDC900E6D9D400FFFEFE0000000000FCFDFC00FEFFFE00ABDB
      970074C35400D1EBC600FEFEFE00FEFFFE00FCFCFB00C5B4AD00C2B7B300B4B8
      B900C6C6C60000000000FDFDFD00FEFEFE00FEFEFE00FDFDFD0000000000C7C7
      C800AFB0B100D7D7D600DCB2A100E8916F00E8855E00E8855E00E77E5400ED97
      7400EDA18100DE784E00D9764D00D3744C00BF6B4900A97D6B00C9C5C400B3B5
      B600C6C6C60000000000FDFDFD00FEFEFE00FEFEFE00FDFDFD0000000000C7C7
      C700ACAEB200E1DDD000C2A0B1005037D2000C08F4002018EE00241DEC00241F
      EA00251FEA00241DED00251CEA001712F6004D2FB500AA7D6A00D0C9BB00B3B5
      B500C6C6C70000000000FDFDFD00FEFEFE00FEFEFE00FDFDFD0000000000C7C7
      C700ACAEB200E1DDD000C2A0B1005037D2000C08F4001F19EE00261CEA002820
      EC002821EF00251DEE00251CEA001712F6004D2FB500AA7D6A00D0C9BB00B3B5
      B500C6C6C70000000000FDFDFD00FEFEFE0000000000FEFEFE00FEFEFE000000
      0000C7C7C700AAACAD00D1CFCE00DFDAD800F5EEEC00FEFEFE00F9F8F800FFFB
      FF00FFFDFF00FDF9FD00FDFCFC00E3DBD800CDC5C300C7C5C400AFB1B200C6C6
      C60000000000FEFEFE00FEFEFE000000000000000000FEFEFE00FEFEFE000000
      0000C7C7C700AAAAAA00D2D5D600DCC8C100E4B09B00E5967600DE886500D879
      5300D3734A00D0795700CA7C5C00B9836E00BBA59D00CBCCCD00AEAFAF00C6C6
      C60000000000FEFEFE00FEFEFE000000000000000000FEFEFE00FEFEFE000000
      0000C8C7C700A7A9AC00DADAD100D2C1C400A488C4003F2FDF001A12EA001F13
      E4001D12E4002016E4001C15F1004F42CE00C4AA9400CDCDCA00ACAEB100C6C6
      C60000000000FEFEFE00FEFEFE000000000000000000FEFEFE00FEFEFE000000
      0000C8C7C700A7A9AC00DADAD100D2C1C400A488C4003F2FDF001912EA001D13
      E3001B11E3001F16E3001C15F1004F42CE00C4AA9400CDCDCA00ACAEB100C6C6
      C60000000000FEFEFE00FEFEFE0000000000FEFEFE0000000000FEFEFE00FEFE
      FE0000000000DDDDDD00ADADAE00AEAEAD00C8C7C600CAC7C500D2C4BF00DBC4
      B900D2BDB100C0B3AC00BDBAB800C4C2C000ACABAB00B0B1B100DCDCDC000000
      0000FEFEFE00FEFEFE0000000000FEFEFE00FEFEFE0000000000FEFEFE00FEFE
      FE0000000000DDDDDD00ACACAC00B0B3B500C9CACA00C7C0BD00CFBCB500DABE
      B300D3B8AD00BDAAA300B8B0AD00C3C3C200B2B6B700AFAEAF00DCDCDC000000
      0000FEFEFE00FEFEFE0000000000FEFEFE00FEFEFE0000000000FEFEFE00FEFE
      FE0000000000DDDDDD00ABABAD00B1B5B500DAD5BF00BFB9C100BFB2BE00CCB3
      BA00C5ADB400B1A2AC00AAA6B900C5C3C000B4B7B600ADAEB000DCDCDC000000
      0000FEFEFE00FEFEFE0000000000FEFEFE00FEFEFE0000000000FEFEFE00FEFE
      FE0000000000DDDDDD00ABABAD00B1B5B500DAD5BF00BFB9C100BFB2BE00CCB3
      BA00C5ADB400B1A2AC00AAA6B900C5C3C000B4B7B600ADAEB000DCDCDC000000
      0000FEFEFE00FEFEFE0000000000FEFEFE0000000000FEFEFE0000000000FEFE
      FE00FDFDFD0000000000FAFAFA00D0D0D000AEAFAF00B2B2B300B2B2B300B2B4
      B500B3B4B500B3B4B500B3B3B400AFB0B000D0D1D100F9F9F90000000000FDFD
      FD00FEFEFE0000000000FEFEFE000000000000000000FEFEFE0000000000FEFE
      FE00FDFDFD0000000000FAFAFA00CFCECE00AEAEAE00B2B4B500B2B4B600B3B6
      B700B3B6B800B4B6B700B4B5B600B0B0B000CFCECE00F9F9F90000000000FDFD
      FD00FEFEFE0000000000FEFEFE000000000000000000FEFEFE0000000000FEFE
      FE00FDFDFD0000000000FAFAFA00CECDCF00AAABB000B5B5B400B6B7B300B6B8
      B500B7B9B600B7B8B500B7B8B300AFB0B000CECDCF00FAF9F90000000000FDFD
      FD00FEFEFE0000000000FEFEFE000000000000000000FEFEFE0000000000FEFE
      FE00FDFDFD0000000000FAFAFA00CECDCF00AAABB000B5B5B400B6B7B300B6B8
      B500B7B9B600B7B8B500B7B8B300AFB0B000CECDCF00FAF9F90000000000FDFD
      FD00FEFEFE0000000000FEFEFE00000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00000000000000000000000000E2E2E200CACACA00BAB9
      BA00BAB9B900C9C9C900E1E1E200000000000000000000000000FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00000000000000000000000000E1E1E100CAC9C900BAB9
      B800BAB8B800C9C8C800E1E0E000000000000000000000000000FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00000000000000000000000000E0E0E200C8C8CA00B9B8
      B900B8B7B900C8C7C900DFDFE100000000000000000000000000FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000FEFEFE00FEFE
      FE00FEFEFE00FDFDFD00000000000000000000000000E0E0E200C8C8CA00B9B8
      B900B8B7B900C8C7C900DFDFE100000000000000000000000000FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00FDFDFD00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFF00FAFBFB00F9F9
      F900F9FAFA00F9F9FA00FAF9F900FEFDFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000EAEAEA00C7C7
      C700EAEAEA00000000000000000000000000FEFEFE00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000F6F0E700E1CEB100DCC9AC00DBC8AC00D9C5AA00D6C3AA00D4C1A700D2BE
      A800D0BBA500CEB8A200CDB8A300CCB6A100CDB8A300C9B6A300CBB6A100DACA
      BA00FAF8F60000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00000000000000000000000000D3CECB00B79F9300B38A7200B283
      6700B58A6E00B3968300BFB4AC00E6E4E4000000000000000000FEFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000BEBEBE00A5A5
      A500A5A3A300B6B6B600DADADA00F7F7F700000000000000000000000000FEFE
      FE00FEFEFE000000000000000000000000000000000000000000FDFCFB000000
      0000DBC29900D6AA6100D9AC6200D7A85C00D6A85F00D6A65F00D4A76400D3A5
      6100D3AA6C00D6AF7500D1AA7100D5B07A00D3AC7500E3B37500D9B27A00BB93
      6000DFD1C40000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000EDFEFF0043617E00363636003738
      39003636390040363600E6CFAA00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE000000000000000000BFB0A900B46D4600D6682800E8773300EC7F3A00EF87
      4000F28D4400F7954A00F4994F00D8915600B2957E00DEDCDB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEFEFE0000000000E0E0E000A2A1A100B1B0
      B000AEAEAE00A8A7A7009C9B9B00A5A4A400C6C6C500EAEAEA00000000000000
      000000000000FEFEFE00FEFEFE00000000000000000000000000FCFDFA000000
      0000D7BB8C00EBC99100EACA9800E3BF8700E8C28500E5C49200E9C28600E6CA
      9F00EAC98F00DEC08C00EED4A400DFC08B00E7D5AF009FC1CB00E5DDBF00D2A9
      7400D4C2B10000000000FCFBFA00000000000000000000000000000000000000
      000000000000000000000000000000000000E7FDFF00042C5300000000000000
      00000000000001000000DEBF8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000ECECEB00AC745800DE652500DF6C2B00D76D2E00D7733500D9753300DC75
      2D00E0813A00E48C4600E8914900F39E5000FFB26100E1A36400B7ACA3000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7F700A0A0A000717171007878
      7800757474007776760079797900777676006E6D6C007E7D7C00AAAAA900D8D8
      D800F6F6F6000000000000000000000000000000000000000000FDFDFB000000
      0000D9BE9100E6C18400EEE2D100E5DACB00E8D0AB00E7E2DD00E6CBA000ECEC
      F100E0C29100C8A77100E5D0AB00CBA56800D5D1BD00008AF500B3CCCD00D9AA
      7200D3C3B30000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000E9FEFF0012385C00020202000304
      0500020206000F020200E0C29400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE0000000000E8E7
      E600B45E3600E1642500D0632700D3672A00D86E2F00DA6F2C00DF854E00E8AF
      8B00E6955D00E7883F00EB944B00EE9A4F00EFA05400FEB25E00FFC27200AF9D
      8E0000000000FEFEFE0000000000000000000000000000000000000000000000
      00000000000000000000FEFEFE0000000000CCCBCB005D5A5A00565353005655
      5500585555005856550058565500595656005A58570058565500555251005F5D
      5C008B898800BFBEBE00ECECEC00FDFDFD000000000000000000FDFDFB000000
      0000DABD8F00E8C99300E7C89500E0BC8600E3BF8600E2C19200E3BF8900E3C6
      9D00E7CA9C00E2CBA400ECD7B300E6CCA300E2DCCA002CA5F300C2D4D000D6A9
      7100D2C2B20000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000E9FEFF0013395D00040404000405
      06000404070010040400E0C29400000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00F8F8F700B065
      4300DD5F2200CC5E2600D1612500D5682A00D76D2C00DA723300ECD4CC00F2F7
      FF00EFE0DB00E78F4D00EB914700EE9A5000F2A25400F3A85900F8B26100FFC1
      7200B7ACA40000000000FEFEFE00000000000000000000000000000000000000
      000000000000FEFEFE0000000000ECECEC0089868600545353006C6C6C00514F
      4F00585655005452510056545300595756005A58570059575600585656005554
      530053504F00514D4C0097959300FEFEFE000000000000000000FDFDFB000000
      0000DABF9100E8C78F00EFE4D600E4DBCF00E9D4B400E6E1DF00E7D0AD00EBEB
      F100E0C49700C4A26900E6D2B000C69F6000DBD2BC0044B8FF00CAD8D200D3A7
      6F00D3C3B30000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000E7FDFF0000274E00000000000000
      00000000000000000000DDBD8B00000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD0000000000B18E7E00DA5B
      1F00CA581F00CF5C2100D1612500D4662800D66A2900DA773B00EEE4E300F1F1
      F600EFE8EB00E7935600E98E4200ED984D00F09E5200F3A45600F4A75900FBB1
      5F00E3A16100DEDDDC0000000000FEFEFE000000000000000000000000000000
      000000000000FEFEFE00FCFCFC00B7B6B6005C5A5A005D5C5C00555353005452
      5200616161005553530054525200545252005451500056535200595756005856
      56005B5858005C585700DCDBDB00000000000000000000000000FDFDFB000000
      0000DBBF9100EACD9F00EACEA300E2C49600E5C69600E3C9A100E5C79900E5CD
      AA00E9D0AA00E6D0AE00EEDABA00E5D0AD00EBD9B900D1CDBA00ECDBBB00CAA5
      7300D5C3B20000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000F1FEFF0071879D00686868006869
      690068686A006F676800ECDABE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5E2E100C0511F00CD55
      1C00CC571E00CF5C2100D1602300D3642700D66B2C00D86A2700E29D7600EBD2
      C700E7AA8500E4843B00E88E4600EB944A00EE9A4E00F09E5200F2A25400EF9F
      5400FFB26100AF91790000000000FEFEFE000000000000000000000000000000
      0000FEFEFE0000000000DBDBDB00777575005250500063626200555353005C5B
      5B0052515100504E4D005B5A5A00585656005856550059575600514E4D005754
      530055515000ACABAA0000000000FCFCFC000000000000000000FCFDFB000000
      0000DCC09300EBCE9D00EFE7DB00E4DBD100EAD8BF00E5E1DD00E9D5B700EAEA
      EF00E0C69B00C29F6500E7D2B000C09C6000E5D0AE00C79F6200E7CEA400CAA9
      7B00D4C3B10000000000FDFCFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFEFE000000000000000000000000000000
      00000000000000000000000000000000000000000000B9978800D3531900C954
      1D00CC551C00CE5A2000D05E2200D3632600D5682A00D86C2C00D8651C00DB69
      1F00DE712400E3833D00E68A4200E98F4600EB944900ED974C00EE9A4F00EE9B
      5000F39D5000D88F5200E6E5E400000000000000000000000000000000000000
      0000FEFEFE00F4F4F400A3A2A200555354006C6B6B0054535300555353005B5A
      5A00535251005C5B5B0059585700504D4C005554530056545400585655005C5B
      5A0073717000F8F8F800FDFDFD00FEFEFE000000000000000000FDFDFB000000
      0000DCC19200EDD6AF00F0DBBC00E9D5B500EDD6B300E9D6B900EBD5B100E9D8
      BC00EBD7B600E8D3B300EEDBBE00E6D2B100ECDABB00E4D1B100F0DCB900C8A5
      7500D5C3B20000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000FDFEFE0044668300131414001617
      170013131400281C1300F9E1C200FCFCFC000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00BB765600D0531A00C750
      1900CB551C00CD581E00CF5D2100D2622500D4642400D8733A00E6B69D00E8BA
      A200E8B59A00E1844400E4843C00E68A4300E88E4500EA914700EA934A00EB93
      4900E8914800F4984F00BCB1A90000000000000000000000000000000000FEFE
      FE0000000000C9C8C8006F6D6E00555454005D5C5C0055545400636262005857
      57005452510058575600514F4F005A5959005C5B5B00504D4C00585756005552
      5100DADAD90000000000FDFDFD00000000000000000000000000FEFDFA000000
      0000DCBF9100F4E2C500D6BA8C00C7A67100DEC69E00C29E6600E2CBA600BE9A
      5F00E5CFAE00BF9C6200E5D2B100BD995D00E4CFAF00C09C6400E4CDA600CBA9
      7C00D5C3B10000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFF0036597B00000000000000
      00000000000001000000BE9B7200000000000000000000000000000000000000
      000000000000000000000000000000000000D9D4D200C6714900D1612C00C852
      1A00CA521800CC571D00CE5B2000D1602400D3612200D7733B00F1ECEF00F2F4
      F900F1F3FA00E28F5B00E07B3200E3854000E5874000E68A4200E78B4300E78C
      4400E38A4500F6954B00B2958100000000000000000000000000FEFEFE000000
      0000E7E7E7009492920053515100676767005857570059585800595858005150
      50005C5A5A005A585800565454005A595800504D4C005A5857005B595800A4A3
      A20000000000FDFDFD0000000000000000000000000000000000FDFDFB000000
      0000DDC19500F2DFC100F5E3C700F2DEBE00F5E5C800F1DEBD00F5E4C900EFDC
      BB00F4E2C800EED9B700F3E2C600ECD7B400F1E0C200EBD5B100F2DEBA00C9A7
      7900D6C4B20000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008AAACF00000001000505
      020002020200010201001E0B0400BFA98C0000000000FCFCFF00000000000000
      000000000000000000000000000000000000C1B3AC00CB6C4200D1653200CE63
      2F00CA541C00CB531900CD591E00D05D2200D2632700D25D1C00E6B9A400F3F3
      F700F1EDEF00E9BEA700DC702700E1803C00E2813C00E3833E00E4843E00E485
      4000E1844000F28C4300B4896D00000000000000000000000000FEFEFE00FDFD
      FD00B7B6B60068676700636363005A595900545151005F5E5E00575555005C5A
      5A005D5C5C00504E4D005A5858005A595900565555005B5A5A006C6A6900F6F6
      F600FEFEFE000000000000000000000000000000000000000000FEFDFB000000
      0000DFC59A00F1DFC400E9D7B900E1CDAB00E2CEAC00E2CEAE00E0CBA900E0CD
      AC00DEC9A600DFCAA900DDC7A300DECAA700DBC6A000DAC49F00E9D6B500CCAD
      8000D8C6B40000000000FDFCFB00000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900F2FDFD003E5E87000000
      0000020200000101020000000100050000009A755C00FFFFF500000000000000
      000000000000000000000000000000000000BBACA500CB6D4200D0633000D067
      3600D0663100CD5B2300CC551B00CE591E00D05F2400D25F2000D56C3200EEDB
      D500F3F1F400F2EFF300E4A37E00DC6F2800DF7D3A00E07C3800E07E3A00E07F
      3A00DD7E3B00EF853D00B28367000000000000000000FDFDFD0000000000D7D7
      D6008A8788005856550061605F0056555400605F5E005D5C5C0056555500605F
      5F00585656005C5A5A0063626200524F4F005B5959005A575600D4D3D3000000
      0000FDFDFD000000000000000000000000000000000000000000FEFDFC000000
      0000E4CCA400E6D3B400CCB79200D5C5A800D3C2A400D2C1A200D2C0A300D1BF
      A200D0C0A200D0BEA100D2C1A500CFBDA000D3C2A600CFBEA100CCB79200CEB1
      8800DBCAB70000000000FDFCFB0000000000000000000000000000000000FFFE
      FF00000000000000000000000000000000000000000000000000F4FFFF005178
      960000000000010000000201010000020300000000007E574000FFFBEE00FCFD
      FD0000000000000000000000000000000000CDC2BD00CA704700D1633100CF65
      3300D0663200D1683400D0632D00CE5C2300CF5A1F00D05F2300D15C1C00D877
      4400F1E6E400F3F0F100F2EEF100DF8E5F00DB6E2800DD783700DD773500DD79
      3600DA783700EC7F3A00B288710000000000FEFEFE00FEFEFE00F5F5F500A6A4
      A500676466005B5858005C5A5A005B595800656669005B5A5A005B5956005F5E
      5C005755540062606000545251005A5858005A5958009B99980000000000FDFD
      FD00000000000000000000000000000000000000000000000000FEFDFC000000
      0000E6D0AB00E2CFAF00DACAAE00FFF4EA00FBEBDA00FAEAD500FAE5CE00F9E2
      C800F7DFC000F8DEBF00DFC1A400C9A98C00DDBA9800F4E0C600CEBC9C00CEB2
      8A00DDCDBA0000000000FDFCFB0000000000000000000000000000000000FEFF
      FE00FAFDFF00E7E8EB00E6E5E400DFE6E600758A9C008F717100FFF3E3000000
      00008EA8BC00010A250000000000010001000305040000000000A8805500FFFF
      FE0000000000000000000000000000000000EEEDEC00C5785500D4663300CE65
      3500CF663200D0663200D1683400D26A3500D2683100D2642B00D2642A00D057
      1400DB885D00F3EEEF00F4F4F700EDD4CA00D86B2A00D9702F00DA703000DA71
      3000D7723200E7773300B49C8F0000000000FCFCFC0000000000BFBFBE008987
      870081847F006D6D6B005D5B5B0057545400848796009CA3B800898E9D006C6D
      74005E5C5C005F5E5D005B5959006261610067646300F3F3F300FEFEFE00FEFE
      FE00000000000000000000000000000000000000000000000000FEFDFC000000
      0000E6CFAB00E4D1B300DAC9AD00FBF1E400F9E8D600F8E6D000F6E2C800F5DE
      C100F5DAB900F4D9B800BA926F00DFC1A200C9A17B00EDD5B900CEBC9C00D0B4
      8C00DECEBA0000000000FDFCFB0000000000000000000000000000000000FFFE
      FD00E6FBFF001426540005050500050607000000000005000000F5D7B200F9FA
      FC000000000098BDDD0000011800010100000202020001020200361B0700FEF2
      DA000000000000000000000000000000000000000000BF8E7800D86A3700CD66
      3600CF643300CF653200D0663200D1683300D1652E00D1652C00D46C3400D56E
      3500D3632600EED8D000F4F3F500F3EDEF00DB825100D6692700D8713300D870
      3200D9723500D86D2F00D3CDCA000000000000000000DCDDDD0075737400929A
      9000B4C6AF009FAA9800929B8D007D827A0068696500676668007D7E8A008B8F
      9F00615F5F00585553005C5A580058555400CCCBCB0000000000FDFDFD000000
      0000000000000000000000000000000000000000000000000000FEFDFC000000
      0000E6D0AC00E3D1B300DCCCB000FDF6EE00F9EDE000F9EBDA00F8E6D200F7E3
      CA00F6DFC300F3DBBF00C29F7F00D7BB9E00B78D6800F1DDC300CDBB9B00D1B5
      8D00DFCFBB0000000000FDFCFB00000000000000000000000000000000000000
      000000000000365C8300000000000102020006050500010405008A6C4A00FFFF
      FE0000000000B3D3F0000001180001000000010101000000000021150200FAE2
      C6000000000000000000000000000000000000000000D1C5BF00D56C3D00CC64
      3400CF653400CF653300D0673500CC571E00E3A88F00E6B29B00D1632B00D05E
      2200DC8A6100F5EFEF00F4F0EF00F4F2F500DE906600D76E3000D9763C00D776
      3D00E47D4000B3704900FCFCFC00FEFEFE0000000000C9C9CA00848485008693
      86009DB09B009CAB96009EAE97009AA8920095A28F00838C7D0072776D006262
      5D005A5857005C585800595654009392910000000000FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000FEFDFC000000
      0000E7D0AE00E4D2B400DFCDB000FFF9F100FDF4E800FDF1E500FCEEDE00FBEA
      D700FAE6CE00F8E3C800D4B39600D3B39400CEA78200F1DBBF00CDBC9B00D2B7
      8F00E0CFBC0000000000FDFCFB00000000000000000000000000000000000000
      0000000000008AB0D4000000030004040300000000000000000000000000564A
      3C0061616100162133000000000001010100020100000101020045250D00FEF6
      E20000000000000000000000000000000000FEFEFE00FAFAFA00BE7C5E00D769
      3700CD643400D0663500CD5E2A00DC927000FDFFFF00FBFDFF00F0D7CD00EAC2
      B100F5EDEB00F6F3F400F6F3F400F4EDEC00D8774400D66E3400D7723900D572
      3B00E2753800BFB2AB0000000000FDFDFD0000000000DADADA005D5C5C003D39
      3B00414140005B615B007C877C00909F8E0098A8940097A7920095A491008A96
      850080897C006E726A0057555400EEEEEE0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000FEFDFC000000
      0000E6D1AE00E6D4B700D9CBB000F5F4F100F4F0E900F5EFE600F5EEE500F5ED
      E200F5EBDD00F6ECDD00F2E5D400DDC9B700F1E0CD00F6ECDE00D0C0A100D4B9
      9100E1D0BC0000000000FDFCFB00000000000000000000000000000000000000
      000000000000E8F9FF0018375A00000000000405050001020200000000000000
      0000000000000000000001010100020202000204050000000000B99166000000
      000000000000000000000000000000000000FDFDFD0000000000DCD5D200D270
      4400D0663600CE663700CD5E2B00DB8E6D00FAF0ED00FEFFFF00FEFFFF00FDFF
      FF00FAFBFC00FAFCFE00FAFFFF00E2A68900D2652A00D56F3900D16F3A00E778
      3D00AD775B00FEFEFE00FEFEFE00000000000000000000000000F1F1F000CACA
      CA008C8A8A00494444002722230031302F004E534E00707B7100859385008B9A
      890092A18E0074807400BEBDBD0000000000FDFDFD0000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFDFC000000
      0000E3D1B000F6D8B00072ACC90026AEFF0036AEFF0038AFFF003EB2FF0047B6
      FF0051BBFF005DBFFF006CC7FF007ED4FF0086D2FF008CD8FF00BAB9A600D9BA
      8F00E1D2BC0000000000FDFCFB00000000000000000000000000000000000000
      000000000000FFFEFC00C1D9F2000F1D3D000000000000000000040302000707
      0600070707000505060000000000000000000000000081674600FFF9F100FDFD
      FD000000000000000000000000000000000000000000FEFEFE0000000000C6B1
      A900DA724300D0643400CD653600CC5B2700D3714600E9B9A400F6E5DE00F8EE
      EB00F7ECE800F0D5CA00DE957300D1632B00D36B3600D16C3800E3743B00B667
      4000EDECEC000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700D4D4D40099969600534F5000262122002E2C2C005054
      5000687269007F807E0000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFCFB000000
      0000E3CDA900F3E1C800B8BEAE0096B4B5009AB3B60099B3B60099B3B5009AB4
      B4009CB4B4009EB4B300A0B4B200A3B5B000A8B6B100A9B5AD00D0C6AE00DAC0
      9800E0CFB70000000000FCFBFA00000000000000000000000000000000000000
      0000000000000000000000000000D5E1F30057687700212A3000000000000000
      00000000000000000000120A00003F383200B3A28D00FFFFF800FDFFFF00FEFE
      FD00000000000000000000000000000000000000000000000000FEFEFE000000
      0000C6B1A800D2704400D7693700CD673600CC613000CB5A2700CF673600D26F
      4200D26D3E00CE612C00CD5F2900CF6A3600D46C3600E2703900B46F4E00E8E7
      E600000000000000000000000000000000000000000000000000FEFEFE00FDFD
      FD00FDFDFD00000000000000000000000000FCFCFC00DEDEDE00A8A7A700635F
      6000413D3E00E9E9E90000000000FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFC000000
      0000E6D1AE00E7D3B200F0D9B800F5D6B000F4D8B200F4D7B100F4D8B200F3D8
      B300F3D8B200F1D7B100F0D4AF00EED3AC00EBD0AA00E8CCA500E6CFAE00D2B4
      8700EADECC0000000000FDFDFB00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0FBFF00B3B5B900B3B3
      B300B4B4B400B3B3B300DFD4C7000000000000000000FCFDFF00FEFEFD000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000D9D2CF00C0806300D66D3D00D86A3800D4673500D1633100D061
      2E00D0632F00D4673400D96B3700DC6C3700C7643500B3918200F8F7F7000000
      0000FEFEFE000000000000000000000000000000000000000000000000000000
      00000000000000000000FDFDFD00FDFDFD000000000000000000000000000000
      0000F2F2F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000F8F4EB00EAD8BB00E7D6B900E7D8BD00E7D7BB00E6D6BA00E5D5B900E5D4
      B700E4D3B600E4D3B400E3D2B300E3D1B200E3D0B100E2CEB000DEC9A700E8D9
      C400FCFBF90000000000FEFEFE00000000000000000000000000000000000000
      00000000000000000000FDFDFE00FCFCFB00FFFFFD0000000000000000000000
      00000000000000000000FCFCFC00FCFBFB00FFFEFE0000000000FFFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE0000000000FCFCFB00D1C4BF00C0907C00C5795700CA714800CB6E
      4400CB6E4400C6714900BD7C5D00BC9D8E00E3E0DF000000000000000000FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00FBFBFB000000
      000000000000FEFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0000000000FDFEFE00F8F9
      F900F8F8F800F9F9F900F8F8F800FCFBFA0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD00000000000000000000000000EEEDEC00CFC4BF00BAAB
      A400C3B5AE00D9D4D200000000000000000000000000FDFDFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6006666660066666600666666006666
      660066666600666666006666660065656500E1E1E10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4C4C400797979006666
      660066666600666666009C9C9C00E7E7E7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BABABA000000
      00000000000000000000000000000000000000000000C4C4C400797979006666
      660066666600666666009C9C9C00E7E7E7000000000000000000000000000000
      0000000000009090900075757500000000000000000000000000000000000000
      00000000000000000000F6F6F6000D0D0D009090900099999900999999009999
      99009999990099999900999999002B2B2B00B0B0B00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5002424240000000000000000000000
      0000000000000000000000000000000000005A5A5A00DEDEDE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAEAEA001E1E1E008181
      8100000000000000000000000000A5A5A5002424240000000000000000000000
      0000000000000000000000000000000000005A5A5A00DEDEDE00000000000000
      00008181810021212100E1E1E100000000000000000000000000000000000000
      00000000000000000000ABABAB004B4B4B00EA995200EA995200EA995200EA99
      5200EA995200EA995200EA995200878787006969690000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F60054545400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C0C0C00B1B1B1000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000A0909000603030000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4E4E4002A2A
      2A006F6F6F00F6F6F60054545400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C0C0C00B1B1B1007272
      72002A2A2A00E7E7E70000000000000000000000000000000000000000000000
      0000000000000000000054545400A2A2A200EA995200EA995200EA995200EA99
      5200EA995200EA995200EA995200EA9952001E1E1E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F6004242420000000000000000000909090066666600B7B7B700DBDB
      DB0000000000C3C3C300818181001B1B1B00000000000000000000000000AEAE
      AE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000100D0F00FBFBFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDED
      ED00343434001919190000000000000000000909090066666600B7B7B700DBDB
      DB0000000000C3C3C300818181001B1B1B000000000000000000000000002323
      2300EDEDED000000000000000000000000000000000000000000000000000000
      000000000000F3F3F30012121200EA995200EA995200EA995200EA995200EA99
      5200EA995200EA995200EA995200EA9952002D2D2D00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006F6F6F00000000000000000036363600DEDEDE0000000000000000000000
      0000000000000000000000000000F3F3F3006060600000000000000000000909
      0900DBDBDB000000000000000000000000000000000000000000000000000000
      0000000000002A29290000000000FCFCFC00FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006A6A6A00000000000000000035353500DEDEDE0000000000000000000000
      0000000000000000000000000000F3F3F3005E5E5E0000000000000000000909
      0900DBDBDB000000000000000000000000000000000000000000000000000000
      000000000000A5A5A50051515100EA995200EA995200EA995200EA995200EA99
      5200EA9952001212120012121200121212001212120078787800000000000000
      000000000000000000000000000000000000000000000000000000000000DBDB
      DB00060606000000000030303000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004F4F4F000000000000000000000000000000000000000000000000000000
      000000000000F8F8F80000000000F8F8F800FAFCFB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DBDB
      DB0006060600000000000F0F0F0000000000F3F3F30000000000000000000000
      0000000000000000000000000000F6F6F6004E4E4E0000000000000000000000
      00004F4F4F000000000000000000000000000000000000000000000000000000
      0000000000004B4B4B00A8A8A800EA995200EA995200EA995200EA995200EA99
      5200EA995200EA995200EA995200EA995200EA9952002A2A2A00000000000000
      0000000000000000000000000000000000000000000000000000000000006969
      69000000000006060600DBDBDB00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900242424000000
      000000000000E1E1E10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006969
      69000000000006060600D8D8D8006363630000000000EDEDED00000000000000
      00000000000000000000F3F3F3004242420000000000F3F3F300242424000000
      000000000000E1E1E10000000000000000000000000000000000000000000000
      0000EDEDED000F0F0F00EA995200EA995200EA995200EA995200EA995200EA99
      5200EA995200EA995200EA995200EA995200EA9952001E1E1E00D2D2D2000000
      0000000000000000000000000000000000000000000000000000FEFEFE001E1E
      1E00000000006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A2A2A2000000
      0000000000009090900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE001E1E
      1E0000000000636363000000000000000000727272002A2A2A00E4E4E4000000
      000000000000EDEDED003939390060606000FCFCFC0000000000A2A2A2000000
      0000000000009090900000000000000000000000000000000000000000000000
      0000999999005A5A5A00EA995200EA995200EA995200EA995200EA995200EA99
      5200EA995200EA995200EA995200EA995200EA99520072727200878787000000
      0000000000000000000000000000000000000000000000000000E6E6E6000000
      000000000000B1B1B10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDEDED000000
      0000000000006060600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E6E6000000
      000000000000B1B1B100000000000000000000000000878787001E1E1E00DBDB
      DB00E7E7E700303030006C6C6C00000000000000000000000000EDEDED000000
      0000000000006060600000000000000000000000000000000000000000000000
      000042424200B1B1B100EA995200EA995200EA995200EA995200EA995200EA99
      5200EA995200EA995200EA995200EA995200EA995200EA995200333333000000
      0000000000000000000000000000000000000000000000000000D2D2D2000000
      000000000000D8D8D80000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6A6A60000000000000000001818
      1800000000004545450000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D2D2D2000000
      000000000000D8D8D80000000000000000000000000000000000999999001515
      150000000000000000000000000000000000A6A6A60000000000000000001818
      180000000000454545000000000000000000000000000000000000000000E7E7
      E70015151500EA995200EA995200EA995200EA995200EA995200EA995200EA99
      5200EA995200121212001212120012121200121212001212120012121200E1E1
      E100000000000000000000000000000000000000000000000000D6D6D6000000
      000000000000D2D2D20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001515
      1500000000004E4E4E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D6D6000000
      000000000000D2D2D20000000000000000000000000000000000DBDBDB001313
      13000C0C0C00C3C3C30000000000000000000000000000000000000000001515
      1500000000004E4E4E0000000000000000000000000000000000000000009393
      9300606060000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000696969009696
      9600000000000000000000000000000000000000000000000000F9F9F9000303
      030000000000B1B1B10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDEDED000000
      0000000000006F6F6F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F9000303
      030000000000B1B1B100000000000000000000000000CFCFCF001B1B1B009999
      9900B4B4B40012121200B7B7B700000000000000000000000000EDEDED000000
      0000000000006F6F6F0000000000000000000000000000000000000000003C3C
      3C00B7B7B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B4B4B4003C3C
      3C00000000000000000000000000000000000000000000000000000000003F3F
      3F00000000006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B4B4B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F3F
      3F0000000000666666000000000000000000C6C6C60018181800A5A5A5000000
      000000000000C3C3C30015151500A8A8A8000000000000000000000000000000
      000000000000B4B4B40000000000000000000000000000000000E1E1E1001212
      1200FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F6F6001212
      1200EDEDED000000000000000000000000000000000000000000000000009E9E
      9E00000000000606060000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00000000000000
      000012121200F6F6F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009E9E
      9E00000000000606060000000000BDBDBD0015151500B1B1B100000000000000
      00000000000000000000CFCFCF001B1B1B0099999900FCFCFC00000000000000
      000012121200F6F6F600000000000000000000000000000000008A8A8A006969
      6900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005A5A
      5A009F9F9F00000000000000000000000000000000000000000000000000F9F9
      F900242424000000000039393900F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000075757500000000000000
      0000909090000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F9
      F90024242400000000002828280015151500BDBDBD0000000000000000000000
      0000000000000000000000000000DBDBDB001E1E1E003E3E3E00000000000000
      000090909000000000000000000000000000000000000000000033333300C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A5004B4B4B00000000000000000000000000FDFDFD0000000000000000000000
      0000C3C3C30006060600000000002D2D2D00D2D2D20000000000000000000000
      0000000000000000000000000000EAEAEA005A5A5A0000000000000000003F3F
      3F00F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD0000000000000000000000
      0000C3C3C300040404000000000023232300D2D2D20000000000000000000000
      0000000000000000000000000000EAEAEA005050500000000000000000003F3F
      3F00F9F9F90000000000000000000000000000000000DBDBDB001B1B1B00FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000001212120012121200121212001212120012121200121212001212
      120012121200F6F6F6000000000000000000FCFCFC0000000000000000000000
      000000000000A8A8A80006060600000000000606060072727200C0C0C000F6F6
      F60000000000D2D2D2008A8A8A001515150000000000000000002D2D2D00EAEA
      EA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC0000000000000000000000
      0000999999001212120005050500000000000606060072727200C0C0C000F6F6
      F60000000000D2D2D2008A8A8A001515150000000000000000000A0A0A005B5B
      5B00FCFCFC000000000000000000000000000000000084848400727272000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004B4B4B00ABABAB0000000000000000000000000000000000000000000000
      00000000000000000000C0C0C0001E1E1E000000000000000000000000000000
      000000000000000000000000000000000000000000005D5D5D00F3F3F3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008D8D
      8D001E1E1E00D8D8D800C0C0C0001E1E1E000000000000000000000000000000
      000000000000000000000000000000000000000000005D5D5D00E8E8E8004242
      420051515100F9F9F9000000000000000000000000002D2D2D00C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C9C9
      C900969696005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9F9009090900039393900000000000000
      000000000000000000000F0F0F0054545400C7C7C700FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007E7E7E002424
      2400E1E1E1000000000000000000F9F9F9009090900039393900000000000000
      000000000000000000000F0F0F0054545400C7C7C700FEFEFE0000000000F6F6
      F6004E4E4E0042424200F3F3F30000000000000000004B4B4B004B4B4B004B4B
      4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B
      4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B4B004B4B
      4B004B4B4B004B4B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F6F600CCCC
      CC00CCCCCC00D8D8D80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093939300E7E7
      E700000000000000000000000000000000000000000000000000F6F6F600CCCC
      CC00CCCCCC00D8D8D80000000000000000000000000000000000000000000000
      0000FCFCFC005D5D5D0081818100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFD00FFFFFC00E9F4
      F800B3DEF2008AC3E1005CA6D300408EBF00367AAA00457597006F8CA200ACBE
      C900F1F1EF00FFFFFF00FDFFFE00FDFEFE00FFFFFD00FEFEFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00E6F2F80097CFED007DC8
      ED007FCCEE0064C1ED0048B4ED003AA2DE002A8AC100196F9E00146592001F71
      9E004186B00087B3CC00EEF3F600FDFDFE00FDFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FFFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CC
      AE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE000000
      000000000000000000000000000000000000F6FAFA0078C5EE0059BEEF0083D1
      F10097D8EF007FCDEE006DC3EF0061B7E40054A8D6004896C300428AB3003C87
      B2003188BB001F87C10087BCDA00FFFFFF00F9FBFC00FBFCFD00FBFCFD00FBFC
      FD00FCFDFD00FEFEFE00FFFFFF00FEFEFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE000000000000000000B8CCAE000000000000000000D7E5
      C9000000000000000000B8CCAE00000000000000000000000000B8CCAE000000
      000000000000000000000000000000000000ECF4F60069BFED0077CDEF008DDC
      F10079CFF10073CCEF0072C8EE005EBBE90048ACE4003D9BD2003484B4002C6E
      9800266B95002977A6005897C100F1F3F500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FCFDFE00FEFEFE000000000000000000000000000000
      000000000000000000000C0C0C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F00000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE0000000000FCFDFD00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FEFDFC000000
      0000FEFEFE0000000000FEFEFE0000000000FCFDFD00FDFCFB0000000000FEFE
      FE00FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE000000000000000000B8CCAE000000000000000000D7E5
      C9000000000000000000B8CCAE00000000000000000000000000B8CCAE000000
      000000000000000000000000000000000000EBF3F80070BEE4008AE5F8006ACB
      EE0065C0EE0085D1F3008CD5F0006EC4EF0057B8F0004BABE0003797CA00267E
      AC002176A2002478A800247DB3004C98C4006F9ABB00698DAC007B97B0009EB5
      C400C9D6DE00F5F5F600FFFFFF00FEFEFF000000000000000000000000000000
      000000000000000000000F0F0F0000000000FCFCFC0000000000000000000000
      000000000000000000000000000000000000CECECE001E1E1E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFE0000000000FDFDFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CC
      AE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE000000
      000000000000000000000000000000000000FCFCFD00A7D4E80066C3E70055BA
      ED0071C6EF008ACBEB007DBFE20061AED90057A2CC004A99C0004996BD0055A3
      C8005BACD80062B5E0004AA9DB003299D0002074AE000C538C00024A7E000A5A
      8B001A6EA1004288B500A1C5DA00FBFAFB000000000000000000000000000000
      00000000000000000000000000000F0F0F0000000000FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD00FEFFFF00000000000000000000000000000000000000000014141400FEFF
      FF00FDFDFD00FEFFFF0000000000000000000000000000000000000000000000
      0000FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE000000000000000000B8CCAE000000000000000000D7E5
      C9000000000000000000B8CCAE00000000000000000000000000B8CCAE000000
      000000000000000000000000000000000000FCFDFD00FFFFFD0094CAE8005BB9
      EA0081CDEE0075C8EE0052B8EF003BA9E9002F92CD001C74A9000D5C88001460
      90002175A6003590BF0051B3E50057C3F400408CBF003372A8003D7EAE004D94
      C0004B9EC9003492C8002E8FC6009CC5DB000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F0000000000FCFCFC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFFFF00FEFEFE00CCDBDB000000000000000000DEDBDB00FEFEFE00FFFE
      FE00FEFEFE00FCFCFD00FFFFFB00CCDBDB000000000000000000CCDBDB00FBFA
      FB00FFFFFD000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE000000000000000000B8CCAE000000000000000000D7E5
      C9000000000000000000B8CCAE00000000000000000000000000B8CCAE000000
      000000000000000000000000000000000000FDFEFE00C0E2F40056BDEE0079CE
      F20094D6F0008CD0EC0079C4EC006EBEE90061BBE50058B4E10052A9D5004EA0
      CB004296C5002E88BE00348EC0006DCFF1003386BE001554870013538400246C
      9A003F8AB4004A9DCE0045A2D70079B6D6000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F0000000000FCFC
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFB0000000000000000000000000000000000FCFDFF000000
      0000FCFEFE00FFFDFA00FEFEFE00FEFEFE00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CC
      AE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE000000
      000000000000000000000000000000000000FFFFFF00B4DBF10054B7EC007FC7
      EB0075C2E8005AB6E5004AA8DC003D97C7003284B200317EA8003D8EB70054AB
      D30064C1EB0057BEF2003FA2D900428FC3002D75AC00276CA1002D75A4002E80
      AD00287FB0002A84B9003991C7008BBFDC000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F000000
      0000FCFCFC000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE00FEFFFF00FEFBF900FDFEFE000000000000000000FEFEFE00FCFBFC00FDFD
      FE00FCFAFA00F5FFFF00CCDBDB0000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE000000000000000000B8CCAE000000000000000000D7E5
      C9000000000000000000B8CCAE00000000000000000000000000B8CCAE000000
      000000000000000000000000000000000000CEE8F3007DC6EA006CC5ED0087D5
      F00074C9EF0057B9EF0046ABE5003896CE00257BAE0018669300176797001F74
      A6002C85B7004EB1DE0065D1FA003180BB002C6DA40027679A003981AD004E97
      BD0057A3CB0049A5D6003D9CD00082B8D8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000909
      0900000000006565650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA0000000000000000000000000000000000FBFBFD00FBFB
      FA0000000000CCDBDB000000020000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE000000000000000000B8CCAE000000000000000000D7E5
      C9000000000000000000B8CCAE00000000000000000000000000B8CCAE000000
      00000000000000000000000000000000000053B5E9005CBEF10083CFEF009DD7
      EF0094D7F10083D4F3007ED1F40075CEF50069C6EF0063BEE80060B6DD0051A9
      D4003697CD003A96C80053ADDE00297FC3001E67A5001A639A00156191001262
      91001C70A4003288BC00409CD00083BBDA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000F0F0F00ABABAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000FEFEFE00FEFEFE00FEFE
      FE00CCDBDB00000000000000000000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CC
      AE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE000000
      00000000000000000000000000000000000051AFE60081D0F0009EE4F40092E2
      F7008FE0FA0089DEF8007FD8F80078D6F40075D5F1006CD1F4006CD4FB0069D3
      FB0058C4F70048AADF004696CD00428AC4003A7EB40052A8D60057AED80055A7
      D00051A3D0003698C9003292C6008ABDDB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F0F
      0F00F0F0F0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000FDFEFF0000000000CCDB
      DB00000000000000000000000000CCDBDB00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE000000000000000000B8CCAE000000000000000000D7E5
      C9000000000000000000B8CCAE00000000000000000000000000B8CCAE000000
      0000000000000000000000000000000000005DACD9008DD9F000AAF3FE00A5EB
      FA00A7EFFA0089E1F6007BD4F20078D3F20079D5F50070D1F60062CAF60060CB
      F8007ADCFB0067CCF6003792D2002578B7001B67A000297CAE002773A1002D7B
      A9004396C4004BABDC0045AADD0081B7D5000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F00F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00FEFFFF000000000000000000FFFFFD00CCDBDB000000
      00000A00000000000000CCDBDB00FEFDFD00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE000000000000000000B8CCAE000000000000000000D7E5
      C9000000000000000000B8CCAE00000000000000000000000000B8CCAE000000
      000000000000000000000000000000000000E6F2F6009ED1E7007BCBEA0089D9
      F20087E1FA007CDCFA0072D2F5006BCFF50063D0F4006FD8F90081DBF9008CD8
      F7007AD0F20051B1E6004299D8003A8BC8004396CD003793C500297BA7002475
      A2001E77A9002780B6003C98CD0093C6E3000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F00F0F0F0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFCFA00000000000000000000000000CCDBDB00000000000000
      000000000000CCDBDB00F5F8FA00FFFFFE00000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CC
      AE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE00B8CCAE000000
      000000000000000000000000000000000000FFFFFF00FFFFFD00E6F2F700C4E3
      F100A9DAF00098D7F0008ED5F4008ED5F60099DDF60087D4F00057BBEE0063BD
      EB0068BEEA006ABDE70061B5E2005EB2E00055A8D600499BC6004895C000529D
      C6005AA8D00046A5D5003899CD0084BAD9000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F00F0F0F000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCDBDB00FBFBFE00FAFAF90000000000000000000000000000000000FCFB
      FC00FFFFFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FDFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFD00FFFFFB00FFFDFB00FFFFFD00C7E2F20050B1E7006FC4
      EC007FCEED0078CDF0005ABCF0003FABEA003198D100227CAE0013628F001464
      93002276A7003790C20044A1D40082BADA000000000000000000000000000000
      00000000000000000000000000000F0F0F00F0F0F00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE00FEFF
      FF00FEFEFE00FEFBFA00FEFEFE0000000000000000000000020000000000CCDB
      DB00FAFCFF00FEFDFC00F8FAFC00FCFDFD000000000000000000FDFDFC00FBFA
      FA00FFFEFE00FEFEFE00FFFFFE00000000000000000000000000000000000000
      000000000000EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEF
      EC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FCFD
      FE0000000000FCFDFE00FCFEFE00FAFCFD00FDFEFE00C6E5F40052B9ED0078CE
      F30090D5EF008ED0ED007AC3EB006CBAE6005FB2DD0051A8D4004D9EC8004D9C
      C4004498C5003390C2003391C50089BFDD000000000000000000000000000000
      000000000000000000000F0F0F00000000000000000000000000000000000000
      000000000000000000000000000000000000CECECE000B0B0B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCDBDB00FDFF
      FF00FDFCFB0000000000FFFFFE0000000000000000000000000000000000FEFF
      FF00FFFFFD000000000000000000000000000000000000000000000000000000
      000000000000EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEF
      EC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FEFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFDFE00FFFFFF00C2E4F50058B8EC0079C6
      EA007FCBEA0074C7ED0057BAEC0045ABE3003798D0002C83B20025739E002F7C
      A9004694C0004BA4D50043A3D80080B7D5000000000000000000000000000000
      000000000000000000000F0F0F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005050500000000000000
      0000000000000000000000000000000000000000000000000000FDFEFE00FEFF
      FF00FDFCFB00FDFCFB00CCDBDB000000000000000000CCDBDB0000000000FDFB
      FB00FEFEFE00FDFEFF00FDFCFB00CCDBDB000000000000000000CCDBDB00FDFC
      FB00FFFEFD00FEFDFD00FFFFFE00000000000000000000000000000000000000
      000000000000EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEF
      EC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC000000
      000000000000000000000000000000000000FFFFFF00FEFFFF00FFFEFF00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FBFCFD00FFFFFE00C7E3F50050B3E7006FC8
      EF0087D2EF0083CFEE0067BEEE0055B4EB0049A5DA003590C0002A78A7002173
      9F002077A6002A83B6003D97CC0088BFDD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFE00FEFF
      FF00FDFCFB00000000000000000000000000000000000000000000000000FFFF
      FE00FCFDFE00FEFEFF0000000000000000000000000000000000000000000000
      0000FFFEFF00FDFDFD00FFFFFE00000000000000000000000000000000000000
      000000000000EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEF
      EC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFDFE00FEFEFE00C5E5F60054BAEF0081CE
      F0009AD8F00097DBF4008CDAF60084D7F7007DD7F90073D1F7006CCBF3006DC7
      EF0065BCE6004AA7DB003697CC0082BAD6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD0000000000FEFE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE000000000000000000000000000000000000000000000000000000
      000000000000EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEF
      EC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC00EDEFEC000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FBFDFD00FFFFFF00BCDFF1006FC4EA00A9EC
      F70097E5F8008EE1F9008BDEF70080D8F60079D3F40077D6F0006ED2F30067D0
      F80066D2FD005FCEFD004FBCF1007CB8D7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE000000
      0000FDFEFE00FAFAFA00FAFAFA00FAFAFA00FDFCFB0000000000FEFEFE000000
      0000FEFEFE0000000000FCFDFE00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FEFD
      FC0000000000FEFEFE00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFDFE00FEFEFE00D6E9F40073C4E4009CEB
      FB00A1EAFA00AEF1FB008EE7FA0078D7F30078D2F10075D3F30072D3F70067CF
      F80063CDF90076D7F90075D7F500B3DDF5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDEFEC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FDFEFE00FFFEFE00CCE5F1008ACC
      E80088D3EF0089DBF50082DBFA007AD6F50073D2F5006ED1F6006FD8F70080DA
      F80096DBF600A3DBF400CBE9F400FFFFFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFE00FAFCFC00FFFFFF00FFFF
      FD00CDE4F10094CFEB0079C5E90069C2EB0065C2F0006EC9F1007FD0F000A6DB
      F000CFE8F400F9FAF900FFFFFE00F9FDFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00FDFDFD00FCFCFC00FCFCFC00FDFDFD00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000993300009933
      0000993300009933000099330000993300000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900F8F8F800F8F8
      F800F7F7F700FAFAFA00F9F9F900FCFCFC00F9F9F900F6F6F600F8F8F800FDFD
      FD00FAFAFA00ECECEC00F4F4F400F7F7F700FBFBFB00FAFAFA00FCFCFC00FBFB
      FB00F7F7F700F5F5F50000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00F4F4F400F2F2
      F200EFEFEF00ECECEC00ECECEC00ECECEC00EDEDED00EEEEEE00F0F0F000F9F9
      F900FCFCFC000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300007B3E2900984D1B00AA551200B158
      0E00B1580E00AB5711009A4E19007E4027009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300007B3E2900984D1B00AA551200B158
      0E00B1580E00AB5711009A4E19007E4027009933000099330000000000000000
      000000000000000000000000000000000000F7F7F70008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0F0F0000000000000000000000000000000
      00000000000000000000FBFBFB00F1F1F100ECECEC00E8E8E80023ABCA0025AB
      C8005DB8CD00D0D1D200D1D1D100D1D1D100D3D3D300D6D6D600D9D9D900E1E1
      E100E6E6E600EAEAEA00F4F4F400FBFBFB000000000000000000000000000000
      0000993300009933000086432300B65C0C00D1690000D46B0000D36A0000D16A
      0000D1690000D36A0000D46B0000D1690000BB5F0B008D462000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      0000993300009933000086432300B65C0C00D1690000D46B0000D36A0000D16A
      0000D1690000D36A0000D46B0000D1690000BB5F0B008D462000993300009933
      000000000000000000000000000000000000F8F8F80012121200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F3F300000000000000000000000000000000000000
      000000000000F2F2F2001E1E1E00000000000000000000000000000000000000
      000000000000FCFCFC00F7F7F700ECECEC00E7E7E700C0D8DD005CCBDF0051BF
      D70049C5DC0008A2C30052AFC400A6BEC300C8C8C800CCCCCC00D0D0D000DADA
      DA00DFDFDF00E4E4E400EFEFEF00F4F4F4000000000000000000000000009933
      00007B3E2900A8561300D56C0000D36A0000CB660100CA650100C9640000CB66
      0100CB660100CB660100CB660100CB660000D16A0000D86C0000AC5711009933
      0000993300000000000000000000000000000000000000000000000000009933
      00007B3E2900A8561300D56C0000D36A0000CB660100CA650100C9640000CB66
      0100CB660100CB660100CB660100CB660000D16A0000D86C0000AC5711009933
      000099330000000000000000000000000000F8F8F8001F1F1F00000000001E1E
      1E00000000000E0E0E00000000000F0F0F00000000000E0E0E00000000000F0F
      0F00000000001C1C1C000000000000000000000000001E1E1E00000000000000
      000000000000F3F3F3001E1E1E00000000000000000000000000000000000000
      000000000000FBFBFB00F5F5F500EAEAEA00E4E5E50026ABCA0075CFE10044CC
      E00061D1E40078D8E70057C9DD0004A0C500A2BCC200C7C7C700CCCCCC00D7D7
      D700DDDDDD00E2E2E200EDEDED00F3F3F3000000000000000000993300008342
      2400AE571000D66C0000CD680000CA660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB670000D96D0000AE57
      1000993300009933000000000000000000000000000000000000993300008342
      2400AE571000D66C0000CD680000CA660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB670000D96D0000AE57
      100099330000993300000000000000000000F9F9F9001E1E1E00000000000F0F
      0F00E2E2E2000F0F0F00000000000F0F0F00E2E2E2000F0F0F00000000000F0F
      0F00D4D4D4001E1E1E000000000000000000000000001E1E1E00E1E1E1000000
      000000000000F3F3F3001E1E1E00000000000000000000000000000000000000
      00000000000000000000FAFAFA00EFF0F0001AAACA0057D1E30007BED70028BC
      D60007B1D10048CFE30002A4C60047D1E30013A9CB002BB7D20012A7C700DFDF
      DF00E4E4E400E9E9E900F3F3F300F8F8F800000000000000000099330000AF59
      0E00D46B0000CC660000CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100CA650100D96C
      0000AC571100993300000000000000000000000000000000000099330000AF59
      0E00D46B0000CC660000CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100CB660100CB660100CB660100CB660100CB660100CA650100D96C
      0000AC571100993300000000000000000000FBFBFB001E1E1E00000000001E1E
      1E00000000001E1E1E000000000000000000000000001E1E1E00000000000F0F
      0F00000000002D2D2D000000000000000000000000001E1E1E00000000000000
      000000000000FBFBFB001E1E1E00000000000000000000000000000000000000
      0000000000000000000000000000B3DFE90021B2CE0064D5E60019C8E10009AA
      CC001ACDE70013ADCD001CC0DA0042C8DD001CC4DB0089E2EE006CD5E50066C0
      D300ECECEC00F0F0F000F9F9F900FEFEFE000000000099330000A2511500D169
      0000CC670000CB660100CB660100CB670200CB660100CB660100D0741800D584
      3400D5843400D5843400D5843400D27B2500CB660100CB660100CB660100CB66
      0100D66B00008D46200099330000000000000000000099330000A2511500D169
      0000CC670000CB660100CB660100CB670200CB660100D27B2500D5843300D584
      3400D5843400D5843400D0741900CB660100CB660100CB660100CB660100CB66
      0100D66B00008D4620009933000000000000FAFAFA001D1D1D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB001E1E1E00000000000000000000000000000000000000
      000000000000000000000000000054C1D80040C7DC0038C8DD0013C1DC0012BD
      DB0035DBF00007ABCD0042D1E5000CA7CA0033CDE00050D4E4003CC0D90030B4
      D1006FC8DB00F9FAFA0000000000000000000000000099330000BE600800D26A
      0200CD6A0700CE6B0800CE6E0B00CC670200E1A66A00F9F0E700FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00EFD1B400CB660100CB660100CB660100CA66
      0100D2690000BA5E090099330000000000000000000099330000BE600800D26A
      0200CD6A0700CE6B0800CE6E0B00CC670200CE6B0700EFD2B500FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00F9F0E600DFA36600CB660100CB660100CA66
      0100D2690000BA5E09009933000000000000FAFAFA0019191900000000001E1E
      1E000000000000000000000000001E1E1E000000000000000000000000001E1E
      1E000000000000000000EDEDED0000000000000000001E1E1E00383838003333
      33004B4B4B00FCFCFC001E1E1E00000000000000000000000000000000000000
      00000000000000000000000000001AADCB006FDDEB0015C7E2001BC3E00036E3
      FA0021C7E20031C9E20008B4D20013C4DC0007ACCC0031C1D80097E4EF001FAD
      CC00ACE0EC00000000000000000000000000D6820000A7541400CF6E0900D272
      1000D2761500D3771900D4791B00EDC9A400FEFEFE00FEFEFE00F9EDE200F4E1
      CD00F4E0CC00F4E0CB00F4E0CB00E8BC9000CB660100CB660100CB660100CB66
      0100CB660100D36A00007F3F270099330000D6820000A7541400CF6E0900D272
      1000D2761500D3771900D4791B00D2721000D4761800EBC29800F5E1CE00F4E1
      CD00F4E0CC00F4E0CB00F8ECE000FEFEFE00FEFEFE00EBC59F00CB660100CB66
      0100CB660100D36A00007F3F270099330000FAFAFA0018181800F3F3F3003F3F
      3F00000000000F0F0F00000000003F3F3F00000000000F0F0F00000000003F3F
      3F00000000000F0F0F00F0F0F00000000000000000001E1E1E00E1E1E1000000
      000019191900FCFCFC001E1E1E00000000000000000000000000000000000000
      00000000000000000000000000002DB9D30061DCED0023D4ED002FD4EE003CDF
      F70014B7D70016BBD80013C9DF0030C8DD003BC8DD009AE4EE0048BED600F6FC
      FC0000000000000000000000000000000000D6820000B75F1300D87A1700D57C
      2000D77F2400D8812800E3A66600FEFEFE00FBF5EF00E09C5700D67A1D00D376
      1600CF6E0D00CC690400CB660100CB660100CB660100CB660100CB660100CB66
      0100CB660100D46B00009A4F1A0099330000D6820000B75F1300D87A1700D57C
      2000D77F2400D8812800D9832A00D77C2000D9802700D77E2300D67A1D00D376
      1600CF6E0D00CC690400CB660100D78A3D00FAF3EC00FEFEFE00D9914800CB66
      0100CB660100D46B00009A4F1A0099330000FAFAFA0018181800000000000F0F
      0F00000000000D0D0D00000000000F0F0F00000000000D0D0D00000000000F0F
      0F00000000000D0D0D00F0F0F00000000000000000001E1E1E000D0D0D000D0D
      0D001E1E1E00FCFCFC001E1E1E00000000000000000000000000000000000000
      00000000000000000000000000003BC4DC005AE0F10031E0F80048E2F80030CB
      E7002DD1EC001ACBE40028C8DF0003B3D00091E0EC002EB2D000A3DDEA000000
      000000000000000000000000000000000000D6820000C26B1800DE852900DC86
      3000DC873200DD8A3600F2D3B400FEFEFE00EBB88500DC863000DA832A00D77D
      2200D3771900D1700E00CC690500CB660100CB660100CB660100CB660100CB66
      0100CB660100D36A0000AA55120099330000D6820000C26B1800DE852900DC86
      3000DC873200DD8A3600DE8C3900DD872E00DE893500DC863000DA832A00D77D
      2200D3771900D1700E00CC690500CB660100DFA36600FEFEFE00EBC59F00CB66
      0100CB660100D36A0000AA55120099330000F9F9F90018181800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFC001E1E1E00000000000000000000000000000000000000
      00000000000000000000DADAE9004DCFE50065EAFC004EE6FC0053DBF0004EE3
      F70033DBF40014C6DE0050D3E40074D5E600D7F0F60000000000000000000000
      000000000000000000000000000000000000D6820000CA762300E3964600E199
      4D00E1914200E2934400F6E0CA00FEFEFE00E8AA6C00E08F3C00DE8B3500DB85
      2D00D77D2300D4771900FEFEFE00CB680300CB660100CB660100CB660100CB66
      0100CA650100D2690000B1580E0099330000D6820000CA762300E3964600E199
      4D00E1914200E2934400E3954700E3954600E2924200E08F3C00FEFEFE00DB85
      2D00D77D2300D4771900CF6F0D00CB680300D6883A00FEFEFE00F0D3B700CB66
      0100CA650100D2690000B1580E0099330000F9F9F90018181800000000001E1E
      1E00000000000000000000000000040404000000000000000000000000001E1E
      1E000000000000000000EDEDED0000000000000000001E1E1E00383838003333
      33004B4B4B00FDFDFD001E1E1E00000000000000000000000000000000000000
      000000000000B5B5D3000A0B74000D5AA0008EE8F80089EFFE0064E5F90050E6
      FC0035E3F90063DBEA005CCDDE0025AFCD000000000000000000000000000000
      000000000000000000000000000000000000D6820000CF7D2F00E9A96600EAAE
      7200E79F5500E79E5300F6D8BB00FEFEFE00F1C89E00E5984B00E2934300DF8D
      3900DB852E00D67F2700FEFEFE00FEFEFE00CC660100CB660100CB660100CB66
      0100CA650100D2690000B1580E0099330000D6820000CF7D2F00E9A96600EAAE
      7200E79F5500E79E5300E9A05600E8A05500E79D5100FEFEFE00FEFEFE00DF8E
      3B00DB852E00D67D2400D3751600CE6B0800E2AA7200FEFEFE00EAC19900CB66
      0100CA650100D2690000B1580E0099330000F7F7F70018181800F3F3F3003F3F
      3F00000000000F0F0F0000000000101010000000000001010100000000003F3F
      3F00000000000F0F0F00F0F0F00000000000000000001E1E1E00E1E1E1000000
      000019191900FDFDFD001E1E1E00000000000000000000000000000000000000
      0000000000001F1F80000000AA0002088900020E75004E92C1007AEEFD0048E7
      FD004DE4F70044C1D90037B7D200EFF9FB000000000000000000000000000000
      000000000000000000000000000000000000D6820000CF7E2F00EDB37900F0C3
      9500ECAE6D00ECA76000F1BC8500FEFDFC00FDFAF700F0BF8E00E69A4F00E293
      4300DE8B3600DC8A3600FEFEFE00FEFEFE00FEFEFE00CB660100CB660100CB66
      0100CB660100D36A0000AA55120099330000D6820000CF7E2F00EDB37900F0C3
      9500ECAE6D00ECA76000EDAA6400EDA96300FEFEFE00FEFEFE00FEFEFE00E499
      4E00DE8B3600DA832A00D67A1D00E09F5D00FCF7F200FDFCFB00D6863700CB66
      0100CB660100D36A0000AA55120099330000F6F6F60018181800000000000F0F
      0F00000000000D0D0D0000000000010101000000000001010100000000000F0F
      0F00000000000D0D0D00F0F0F00000000000000000001E1E1E000D0D0D000D0D
      0D001E1E1E00FEFEFE001E1E1E00000000000000000000000000000000000000
      000005A2C50022A3C600174193001011AE003333E3004B4BF40003087200053F
      90002EB1CF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000CB762500EFB67D00F5D3
      B000F3C29000F1B16F00F1B27100F8D8B800FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B28000CB66
      0100CB660100D46B0000984D1C0099330000D6820000CB762500EFB67D00F5D3
      B000F3C29000F1B16F00F8D8B800FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B38100CB660100CB66
      0100CB660100D46B0000984D1C0099330000F7F7F70018181800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001E1E1E00000000000000000000000000000000000000
      000002A1C4002CBFD7005DDCED0011248400101688004545DF002B2BD2000E0E
      7B00BCBCD8000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000D6820000ECAE7000F7D8
      B900FADBBB00F6C18D00F6BD8100F7BC7F00F7CCA200FBEDDF00FEFDFC00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E5B28000CB66
      0100CC660000D16900007C3F280099330000D6820000D6820000ECAE7000F7D8
      B900FADBBB00F6C18D00FADEC000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFDFB00F5E1CD00DD9A5600CB670100CB660100CB66
      0100CC660000D16900007C3F280099330000F8F8F80018181800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F003B3B3B003333
      33004B4B4B00000000001E1E1E00000000000000000000000000000000000000
      0000DBF2F600179FC20010A5C8008EEFFC005193C4000D1379001A1AB2000D0D
      7400EEEEF5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6820000DF954C00F8D1
      AA00FBEAD700FADBBB00FCCC9800FBC38800F7C08700F2B17000EDA96400E8A0
      5500E3954600E0934400FEFEFE00FEFEFE00FEFEFE00CB670200CB660100CA66
      0100D36A0000B85D0A00993300000000000000000000D6820000DF954C00F8D1
      AA00FBEAD700FADBBB00FCCC9800FBC38800FEFEFE00FEFEFE00FEFEFE00E9A6
      5F00E3954600DE8C3800D9822A00D4781B00CE6D0A00CB670200CB660100CA66
      0100D36A0000B85D0A009933000000000000F8F8F80019191900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000012121200F6F6F6000000
      000019191900000000001E1E1E00000000000000000000000000000000000000
      0000106396004292C2002E89C100188FBD00059FC30047C5DC00E0F3F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6820000D6820000F3C0
      8B00FCE5CD00FDEFE000FEDFBE00FCCA9300F7C18800F2B37200EDA96400E8A0
      5600E2954600DF8F3D00FEFEFE00FEFEFE00CE6D0B00CB670200CB660100CC66
      0000D66B000087442300993300000000000000000000D6820000D6820000F3C0
      8B00FCE5CD00FDEFE000FEDFBE00FCCA9300F7C18800FEFEFE00FEFEFE00E9A2
      5A00E2954600DE8C3800D9822A00D4781B00CE6D0B00CB670200CB660100CC66
      0000D66B0000874423009933000000000000F9F9F90014141400000000001E1E
      1E0000000000F0F0F00000000000000000000F0F0F0000000000F0F0F0000000
      0000000000000F0F0F000F0F0F0000000000000000001E1E1E00000000000000
      000000000000F0F0F0001D1D1D0000000000000000000000000000000000FDFE
      FE003E8CBB005DA7D500107CBF002378AE005192B70070CBDE00FCFEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6820000DA8D
      4200FAD2A800FDEDDD00FEF2E600FBDDBE00F8CA9D00F0B06E00ECA76000E79E
      5300E2934300DD8A3600FEFEFE00D3771900CE6C0900CB660200CC670000D86C
      0000A45214009933000000000000000000000000000000000000D6820000DA8D
      4200FAD2A800FDEDDD00FEF2E600FBDDBE00F8CA9D00F0B06E00FEFEFE00E79E
      5300E2934300DD8A3600D8812800D3771900CE6C0900CB660200CC670000D86C
      0000A4521400993300000000000000000000FAFAFA000C0C0C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000292929000000000000000000000000000000000085B0
      CA008DC1E1002186C5001982C30011649800CEDFE90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6820000D682
      0000DD944C00F9D3AC00FCEBD900FEF2E600FAE5CF00F6D4B000F0B98300E8A4
      5D00E2994C00DE8F3E00DA893600D7842F00D27C2400D1721100D86C0000A652
      14006A3531009933000000000000000000000000000000000000D6820000D682
      0000DD944C00F9D3AC00FCEBD900FEF2E600FAE5CF00F6D4B000F0B98300E8A4
      5D00E2994C00DE8F3E00DA893600D7842F00D27C2400D1721100D86C0000A652
      14006A353100993300000000000000000000FBFBFB0009090900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000292929000000000000000000000000004787B0005FA0
      C70019689A0012689E0097C6E300B1CCDC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D682
      0000D6820000DA8F4600F5C69600FBDFC200FBEBDB00FBEBDB00F8E2CC00F2D4
      B500EFC89F00EBBD8E00E8B58200E3A66800DE8F3E00D6761600A75313006F39
      2D0099330000000000000000000000000000000000000000000000000000D682
      0000D6820000DA8F4600F5C69600FBDFC200FBEBDB00FBEBDB00F8E2CC00F2D4
      B500EFC89F00EBBD8E00E8B58200E3A66800DE8F3E00D6761600A75313006F39
      2D0099330000000000000000000000000000FAFAFA0007070700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000222222000000000000000000000000000E6296007AB0
      D100ECEEEE0019689A006BA7CD00FDFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6820000D6820000D6820000E09E5D00F0C08E00F5D1AA00F7D8B900F6D8
      BA00F4D2AF00EFC59900E9B17700DC944A00C06E2400974E2000993300009933
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6820000D6820000D6820000E09E5D00F0C08E00F5D1AA00F7D8B900F6D8
      BA00F4D2AF00EFC59900E9B17700DC944A00C06E2400974E2000993300009933
      000000000000000000000000000000000000FCFCFC000C0C0C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001E1E1E000000000000000000000000001E6D9E0093C1
      DE00126497002F79A7003580AD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6820000D6820000D6820000C9803B00D28F5100D595
      5800D1905300C9824400B56C31009C5526008845250099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6820000D6820000D6820000C9803B00D28F5100D595
      5800D1905300C9824400B56C31009C5526008845250099330000000000000000
      000000000000000000000000000000000000FEFEFE002F2F2F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000047474700000000000000000000000000F8FAFC005B94
      B80017679A005F97BA00EAF1F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000D6820000D6820000D682
      0000D6820000D6820000D6820000D68200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6820000D6820000D6820000D682
      0000D6820000D6820000D6820000D68200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFF9
      F500FFF9F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100694731006947310069473100694731006947
      3100694731006947310069473100000000007A2D06007A2D06007A2D06007A2D
      06007A2D06007A2D06007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F3EE0000000000F7F0EC00CAC5
      C300A4A19F00DBD5D300F9F3EE0000000000F9F3EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFEFEFEFFFEFEFEFFFDFD
      FDFFF3F3F3FFE0E0E0FFCCCCCCFFB0B0B0FFA0A0A0FF939393FF898989FF8585
      85FF888888FF8D8D8DFF999999FFAAAAAAFFD0D0D0FFE4E4E4FFF3F3F3FFFCFC
      FCFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF00000000C8B3A400C8B3A400B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A29300B7A2
      9300B7A29300B7A2930069473100000000007A2D06001FEDFF0022E2FF002ADD
      FF0043C9D40039D4E1007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBD5D300A5A3
      A200898787009C9A9800E5E0DC00F9F3EE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFEFEFEFFFFFFFFFFFEFE
      FEFFF4F4F4FFE6E6E6FFC5C5C5FF848484FF9C9C9CFF949494FF7B7B7BFF6868
      68FF505050FF4B4B4BFF434343FF222222FF646464FFE1E1E1FFEEEEEEFFFCFC
      FCFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF00000000C8B3A400DBD0C900B7A2
      9300C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D0600B2C6A000ABAC8200C78F
      4A00D4752300C66817007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F3EE0000000000DBD5D300D3CE
      CC00A5A3A2008C8A8A00B0ACAB00F2EAE5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFEFEFEFFFEFEFEFFFEFE
      FEFFFFFFFFFFFFFFFFFFDDDDDDFFDCDCDCFFF7F7F7FFE7E7E7FFD5D5D5FFAFAF
      AFFFA2A2A2FF909090FF949494FF686868FF363636FFD3D3D3FFFFFFFFFFFCFC
      FCFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF00000000C3AFA100E2D9D400DBD0
      C900C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D0600FCB26800E7954500E17E
      2B00D56C1800CC5906007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFE9E500D3CE
      CC00CAC5C3009C9A98008C8A8A00C5C1BF00F7F0EC0000000000F9F3EE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFEFEFEFFFFFFFFFFFDFD
      FDFFFDFDFDFFFDFDFDFFD4D4D4FFB4B4B4FFD4D4D4FFB0B0B0FFBFBFBFFF7C7C
      7CFF9B9B9BFF6A6A6AFF838383FF4E4E4EFF343434FFD2D2D2FFFEFEFEFFFCFC
      FCFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF00000000C8B3A400F1ECEA00E2D9
      D400C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D060028B5400028932700D5AC
      7000EAA96F00E3A365007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F3EE00FFF9F500E4DE
      DA00CAC5C300BCBABA008C8A8A00908E8E00DBD5D300F9F3EE0000000000F9F3
      EE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFEFEFEFFFDFDFDFFD5D5D5FFB8B8B8FFD9D9D9FFB5B5B5FFC2C2C2FF8181
      81FF9B9B9BFF6C6C6CFF858585FF515151FF333333FFCECECEFFFFFFFFFFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400C8B3A400B7A2930069473100000000007A2D060026C4510088D09500FFFF
      FF00FFFFFF00FFFFFF007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F3EE00FFF9
      F500DBD5D300CAC5C300B4B0AF0084838300A5A3A200EDE6E200F9F3EE00F7F0
      EC00F9F3EE00F9F3EE00F9F3EE00F9F3EE000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFEFEFEFFFFFFFFFFFEFE
      FEFFFFFFFFFFFCFCFCFFD2D2D2FFB8B8B8FFD9D9D9FFB4B4B4FFC3C3C3FF7F7F
      7FFF9C9C9CFF6C6C6CFF868686FF525252FF313131FFC4C4C4FFFFFFFFFFFCFC
      FCFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF00000000C8B3A400DBD0C900B7A2
      9300C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D06007A2D06007A2D06007A2D
      06007A2D06007A2D06007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9F3
      EE00FFF9F500DBD5D300CAC5C300A5A3A20084838300C4BEBC0000000000FFFD
      F800FFF9F500FFF9F500FFF9F500FFF9F5000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFEFEFEFFFBFBFBFFD0D0D0FFB9B9B9FFDADADAFFB3B3B3FFC3C3C3FF7E7E
      7EFF9B9B9BFF6C6C6CFF868686FF545454FF303030FFBABABAFFFFFFFFFFFBFB
      FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400E2D9D400DBD0
      C900C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500D3CECC00CABEBC008C8A8A008A888600C5C1BF00B9B5
      B300A19D9C00969392009C9A9800C4BEBC00EDE6E200F9F3EE00000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFFFFFFFFF9F9F9FFCECECEFFBABABAFFDBDBDBFFB3B3B3FFC4C4C4FF7F7F
      7FFF9C9C9CFF6C6C6CFF878787FF545454FF2D2D2DFFADADADFFFFFFFFFFFCFC
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400F1ECEA00E2D9
      D400C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D06007A2D06007A2D06007A2D
      06007A2D06007A2D06007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9CFCE00B9B5B3006F6F6F007B7878009693
      9200AAA5A200AAA5A20094918E007776750084838300D3CECC00F7F0EC000000
      0000F9F3EE00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFFFFFFFFF8F8F8FFCCCCCCFFB9B9B9FFDCDCDCFFB2B2B2FFC4C4C4FF7F7F
      7FFF9B9B9BFF6B6B6BFF868686FF565656FF2B2B2BFFA1A1A1FFFFFFFFFFFCFC
      FCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400C8B3A400B7A2930069473100000000007A2D06001FEDFF0022E2FF002ADD
      FF0043C9D40039D4E1007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F3EE0000000000F9F3EE00AAA8A800B0ACAB00DCD3CC00F7F0
      EC0000000000FFF9F500F9F3EE00E2D9D4009A9795007B787800D3CECC00F9F3
      EE0000000000F9F3EE000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFFFFFFFFF5F5F5FFCBCBCBFFB9B9B9FFDEDEDEFFB2B2B2FFC5C5C5FF7E7E
      7EFF9C9C9CFF6A6A6AFF878787FF585858FF2A2A2AFF989898FFFFFFFFFFFCFC
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400DBD0C900B7A2
      9300C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D0600B2C6A000ABAC8200C78F
      4A00D4752300C66817007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFF9F500CFCAC800AAA5A200EADDD200F8EEE300F8EE
      E300F9F3EE00F7F0EC00F9F3EE00FAEFE900F5E3DF009C9897008A888600E4DE
      DA000000000000000000F9F3EE0000000000FFFFFFFFFEFEFEFFFFFFFFFFFEFE
      FEFFFFFFFFFFF3F3F3FFCACACAFFB9B9B9FFDFDFDFFFB1B1B1FFC6C6C6FF7F7F
      7FFF9D9D9DFF6A6A6AFF878787FF585858FF2A2A2AFF939393FFFFFFFFFFFBFB
      FBFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400E2D9D400DBD0
      C900C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D0600FCB26800E7954500E17E
      2B00D56C1800CC5906007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2EAE500AAA5A200D9CEC400F9E9DB00F5E9DC00F8EE
      E300F2EAE500F8EEE300F8EEE300F2EAE500F7E6E200E6D4D10081807F00B9B5
      B300F9F3EE00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFFFFFFFFFEFEFEFFFC9C9C9FFBABABAFFE1E1E1FFB2B2B2FFC7C7C7FF7F7F
      7FFF9C9C9CFF6A6A6AFF878787FF585858FF2C2C2CFF888888FFFFFFFFFFFCFC
      FCFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400F1ECEA00E2D9
      D400C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D060028B5400028932700D5AC
      7000EAA96F00E3A365007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500D3CECC00ABA29B00F4DECA00F6E4D200F9E9DB00F9E9
      DB00F9E9DB00F9E9DB00F9E9DB00F9E9DB00F5E9DC00F9E2DA00AAA5A2009693
      9200F2EAE500000000000000000000000000FFFFFFFFFEFEFEFFFFFFFFFFFEFE
      FEFFFFFFFFFFEBEBEBFFC6C6C6FFB6B6B6FFDEDEDEFFABABABFFC5C5C5FF7878
      78FF9C9C9CFF666666FF858585FF545454FF2D2D2DFF7B7B7BFFFEFEFEFFFCFC
      FCFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF00000000C8B3A400C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3A400C8B3
      A400C8B3A400B7A2930069473100000000007A2D060026C4510088D09500FFFF
      FF00FFFFFF00FFFFFF007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500BCBABA00B7AA9E00F4DECA00F6E4D200F9E9DB00FBE8
      D600FBE8D600FBE8D600FBE8D600F9E9DB00F5E9DC00F9E2DA00CABEBC00908E
      8E00EAE3DF00000000000000000000000000FFFFFFFFFEFEFEFFFEFEFEFFFDFD
      FDFFFEFEFEFFE7E7E7FFCACACAFFCDCDCDFFF0F0F0FFCBCBCBFFCFCFCFFF9E9E
      9EFFA1A1A1FF7B7B7BFF939393FF646464FF373737FF5E5E5EFFFEFEFEFFFDFD
      FDFFFDFDFDFFFFFFFFFFFEFEFEFFFFFFFFFF00000000C8B3A400DBD0C900B7A2
      9300C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000007A2D06007A2D06007A2D06007A2D
      06007A2D06007A2D06007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500B4B0AF00B5A59600F9DDC300FBE6D300FBE8D600FBE6
      D300FBE6D300FBE6D300FBE8D600F9E9DB00F9E9DB00F9E2DA00D1BCB600908E
      8E00EAE3DF00000000000000000000000000FFFFFFFFFEFEFEFFFFFFFFFFFDFD
      FDFFFFFFFFFFE4E4E4FFB8B8B8FFD1D1D1FFE5E5E5FFD9D9D9FFB6B6B6FFA0A0
      A0FF7B7B7BFF707070FF6E6E6EFF4C4C4CFF141414FF414141FFFFFFFFFFFEFE
      FEFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFF00000000C8B3A400E2D9D400DBD0
      C900C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B7A2930069473100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE00FFF9F500C5C1BF00A4968A00F4D6BA00FADCBE00F9DDC300F9DD
      C300F9DDC300FBE0C700FCE4CC00FCE4CC00F7E3CE00FADDCC00CEBBB4009C9A
      9800F2EAE500000000000000000000000000FFFFFFFFFEFEFEFFFEFEFEFFFEFE
      FEFFFDFDFDFFBCBCBCFFA5A5A5FFB2B2B2FFA8A8A8FF979797FF898989FF7979
      79FF6A6A6AFF595959FF4E4E4EFF4C4C4CFF3D3D3DFF353535FFD5D5D5FFFFFF
      FFFFFCFCFCFFFFFFFFFFFEFEFEFFFFFFFFFF00000000C8B3A400F1ECEA00E2D9
      D400C8B3A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8B3A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0069473100000000007A2D06007A2D06007A2D06007A2D
      06007A2D06007A2D06007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCD8D600928B8300E3C2A200FCE4CC00F9DDC300FADC
      BE00FADCBE00FADCBE00F9DDC300F9DDC300F7E3CE00FADDCC00BAAEA800AAA8
      A80000000000000000000000000000000000FFFFFFFFFEFEFEFFFDFDFDFFFFFF
      FFFFFBFBFBFFC4C4C4FFD7D7D7FFEDEDEDFFE5E5E5FFD5D5D5FFC1C1C1FFB0B0
      B0FFA0A0A0FF929292FF7E7E7EFF666666FF626262FF424242FFB7B7B7FFFFFF
      FFFFFBFBFBFFFEFEFEFFFEFEFEFFFFFFFFFF00000000C8600000C8600000C860
      0000C8600000C8600000C8600000C8600000C8600000C8600000C8600000C860
      0000C8600000C8600000C8600000C8600000C8600000C8600000C8600000C860
      0000C8600000C860000098300000000000007A2D06001FEDFF0022E2FF002ADD
      FF0043C9D40039D4E1007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F3EE0000000000F6EEEA00ACA8A600B1967B00FCE4CC00FBE6D300FCE4
      CC00FCE4CC00FCE4CC00FCE4CC00FBE6D300FBE6D300EDD2BB009C989700D3CE
      CC00FFF9F500F9F3EE00F9F3EE0000000000FFFFFFFFFFFFFFFFFEFEFEFFFEFE
      FEFFFFFFFFFFFEFEFEFFFDFDFDFFFDFDFDFFF9F9F9FFF1F1F1FFEBEBEBFFDEDE
      DEFFC4C4C4FFA0A0A0FF737373FF5C5C5CFF646464FF747474FFE4E4E4FFFEFE
      FEFFFDFDFDFFFEFEFEFFFEFEFEFFFFFFFFFF00000000C8600000F8B65A00F8B6
      5A00C8600000F8B55500F8B55500F8B04600F8A62A00F8980000C8600000F8B5
      5500F8B55500F8B04600F8A62A00F8980000C8600000F8B55500F8B55500F8B0
      4600F8A62A00F898000098300000000000007A2D0600B2C6A000ABAC8200C78F
      4A00D4752300C66817007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DBD5D3009D918700C6AA9100FCE4CC00FFE8
      CE00FCE4CC00FCE4CC00FCE4CC00FBE6D300EDD2BB00B3A8A000B4B1B000F9F3
      EE0000000000F9F3EE000000000000000000FFFFFFFFFEFEFEFFFFFFFFFFFEFE
      FEFFFEFEFEFFFEFEFEFFFDFDFDFFFAFAFAFFF0F0F0FFE7E7E7FFD2D2D2FFB1B1
      B1FF959595FF838383FF838383FF808080FF828282FFCCCCCCFFFFFFFFFFFDFD
      FDFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF00000000C8600000F8B65A00F8B6
      5A00C8600000F8B55500F8B55500F8B55500F8B04600F8AB3800C8600000F8B5
      5500F8B55500F8B55500F8B04600F8AB3800C8600000F8B55500F8B55500F8B5
      5500F8B04600F8AB380098300000000000007A2D0600FCB26800E7954500E17E
      2B00D56C1800CC5906007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F0EC00CCC9C7009D918700B7A08C00DBC2
      A900EDD2BB00F4D6BA00EACEB300D2B8A100ABA29B00B4B1B000F2EAE5000000
      0000F9F3EE00000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFAFAFAFFD0D0D0FFC9C9C9FFD0D0D0FFC6C6C6FFC1C1
      C1FFBDBDBDFFC4C4C4FFADADADFFBCBCBCFFF6F6F6FFFFFFFFFFFDFDFDFFFEFE
      FEFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFF00000000C8600000C8600000C860
      0000C8600000C8600000C8600000C8600000C8600000C8600000C8600000C860
      0000C8600000C8600000C8600000C8600000C8600000C8600000C8600000C860
      0000C8600000C860000098300000000000007A2D060028B5400028932700D5AC
      7000EAA96F00E3A365007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F0EC00D3CECC00AAA5A2009D91
      8700A2918200A2918200A4968A00AAA5A200CAC5C300F6EEEA00000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFFFFFFFFFFDFDFDFFFEFEFEFFECECECFFDADADAFFDDDDDDFFD9D9D9FFBBBB
      BBFFDFDFDFFFE8E8E8FFBBBBBBFFF2F2F2FFFFFFFFFFFCFCFCFFFEFEFEFFFFFF
      FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A2D060026C4510088D09500FFFF
      FF00FFFFFF00FFFFFF007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F3EE00F9F3EE0000000000F6EEEA00E4DE
      DA00D3CECC00D3CECC00DCD8D600F2EAE500FFF9F50000000000F9F3EE000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFFEFEFEFFFEFEFEFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6
      E6FFC8C8C8FFD7D7D7FFEBEBEBFFFDFDFDFFFDFDFDFFFEFEFEFFFFFFFFFFFEFE
      FEFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007A2D06007A2D06007A2D06007A2D
      06007A2D06007A2D06007A2D0600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6EEEA00F6EEEA00F6EEEA00F6EE
      EA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00F9F3EE00FFF9
      F500FFFDF800FFFDF800FFF9F500F9F3EE00F6EEEA00F6EEEA00F6EEEA00F6EE
      EA00F6EEEA00F6EEEA00F6EEEA00F6EEEA00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000607
      8800040586000202860000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001011
      9F000C0D9D0007079D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000009721300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000002028400070788000D0D8A00CFCF
      C0006E6CA3000008C10002038A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000006069C0011119F001B1BA100DADA
      CE008886B6000113CF000709A100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F752800047D1100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000972130009721300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000020284000A0A8A009998B600D5D1C000CBC9BB007978
      AB0002028400000DCC000018F300020389000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000007079C001717A100AEADC600DFDCCE00D7D5CA009291
      BD0006069C00001BD800002CF6000709A0000000000000000000000000000000
      000000000000000000000000000000000000A87C7800A87C7800A87C7800A87C
      7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C7800A87C
      7800A87C7800A87C7800A87C7800A87C780005710A0019AC390005710A000000
      00000000000000000000000000000000000093655E00BA8E7E00BA8E7E00BB8B
      7900BB8C7900BB8A7500BB8A7500BB887000BC887000BC897200C48C7700B984
      6F00097213002EBC550009721300AF816500C28278009E676900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000060688000B0B8A00A5A5B800DDDAC000B8B5B6005F63B60003058C000106
      AD000002A00000039900000FCA000013E1000203890000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000F0F9F001818A100B8B8C800E5E3CE00C8C5C6007A7DC6000A0DA3000410
      BF000006B400000AAE00001ED6000025E8000608A00000000000000000000000
      000000000000000000000000000000000000AA7F7A00FAE2C900FFEACA00FFE3
      C300FFE0BA00FFDDB400FFE0AB00FFE0AB00FFDB9C00FFD59D00FFDB9C00FFD8
      A200FFD59D00E6C28700ADAE68007EA2510005710A002BBC4E0035C253000571
      0A000000000000000000000000000000000098696500F7D9B700FFE1B900FFD9
      AF00FFD5A700FFD19E00FFD19E00FFD39100FFD48B00FFD48B00EDBF82000972
      130021A53F004DE5810009731400097414000974140009741400000000000000
      0000000000000000000000000000000000000000000000000000070787000F0F
      8B00C5C1C100DED7BF00B5B0B8005962BF000204910000019200000BD300000C
      C500000AB7000005A10000029100000DC4000011D70002038800000000000000
      000000000000000000000000000000000000000000000000000011119E001E1E
      A200D2CFCF00E6E0CD00C5C1C800747CCD00070BA7000005A8000018DD000019
      D2000016C700000EB5000006A700001BD1000021E00006089F00000000000000
      000000000000000000000000000000000000AA7F7A00FAE2C900FEE7CD00FFE3
      C300FFE0BE00FFE5B900DEBBA9009A83A4006B63AC00605BAF007967AD00A498
      79006B9A43002C9A350026AA42002BBC4E0036C45B003CC95D003AC95B0035C2
      530005710A0000000000000000000000000098696500F7D9BC00FFE0BE00FEDA
      B500FFD9AF00FFDDA700F4C79C00B79497008974A1008B767E000972130029B7
      50004BE07D0048DC770046D8740031C25B0023A6400017892800036C0A00015D
      040000000000000000000000000000000000000000000A097D00C6BFB100DACF
      C0009A99B800070A8E00020795000021FF00001BFF00001AF7000016E3000011
      D400000DC6000009B6000006A40000029300000AB700000DCB00020289000000
      0000000000000000000000000000000000000000000016159500D3CDC200E3DA
      CE00AFAEC8001117A4000611AA000037FF00002FFF00002EF9000028EA000022
      DE00001CD3000015C600000FB7000007A9000016C700001BD7000607A0000000
      000000000000000000000000000000000000AA7F7A00F9E6D300FFE9D200FFEA
      CA00FFE9C200AC97B2000A2CB100001DDF000026FC00002DFF000A2CB1000C7B
      22002DBB510049D876004AD7730046D36C0041CE66003ECA61003BC85C003AC9
      5B0035C35400158D2300000000000000000098696500F8DCC400FFE5C700FFE0
      BE00FFE4B400977E99001F27A700001BDD000019D3000972130030BF50004DE2
      7F0048DC770048D9760045D770003FD1660037CC5D0032C6550027B541000F80
      1A00015D040000000000000000000000000000000000000000001B1B8E003660
      C000075DE100004FF800004AFE000041D400002FFF000021FF00001AF4000016
      E3000011D300000DC600000AB7000005A100000293000008B000000AC0000102
      870000000000000000000000000000000000000000000000000077799500658C
      B0001D71AF000063C0000068DE000060F700004EFF00003CFF000031FD00002B
      F1000027E700001FDA00001ACD000014C300000CB1000008AB000017CE000507
      9E0000000000000000000000000000000000AA7F7A00F9E6D300FDECDA00FEE7
      CD00716BB4000221D800002FFF000028FF004F6FFF007CA5AC001D943D0050DB
      770055E0840050DA7B004ED978004AD7730046D36C0041CE66003ECA61003CC9
      5D003CCC5E002AAC420005710A000000000098696500F7E0CA00FFE5C700FFEA
      C1008974A1000111C700001CF700001AFF002659A400097213003FD46C004BE0
      7D0047DA770045D7700041D36A003BCE630032C655002DC04A0028BB42001FB0
      35000D841800015D04000000000000000000000000000452BD00048CE3000086
      FA000088FF000074FF00005101000051010000439F00002EFF000021FF000019
      F6000016E3000011D400000DC600000AB7000006A500000393000006A7000007
      B400010287000000000000000000000000000000000005720B000A5E23000065
      120000731000057B150005782600046E4900026379000158C7000042FF000031
      FE00002BF3000027E7000021DB00001BCF000014C300000EB5000010BA000012
      C40005069E00000000000000000000000000AA807B00FDECDA00FFFBE400A298
      C100001DDF000032FF00002AFF006583FC00D0D5D8002B93290052DD7C005CE8
      8E0053DE780046CF5D0039BD45002DB6460033BE580045CF690041CE660041CF
      650026A63E0008750E00000000000000000098696500F8E3D100FFF7D700A698
      B6000115CE000021FF000024FF005372FF00E6EBFF00B3CFB6000972130039CC
      620049DD790041D36A0030BB4D001F9D34001B962D00189729001AA02D001AAA
      2D0015A9270008790F000000000000000000000000000037B6000098EB0000BF
      FF000097F300035A05001989260019872300004E00000042A900002EFF000023
      FF00001AF7000016E6000012D700000DC600000AB7000006A600000393000004
      9E000005A700010287000000000000000000000000000051C60001693E000588
      300005730900087300000C8903000C9508000A82000004711400025C7F00003F
      F6000032FF00002BF3000027E7000021DB00001BCF000015C5000008A900000C
      B200000DBA0005069E000000000000000000AA817C00FCEFE100FFF1E000434F
      C6000031FC000032FF001E4BFF00EAEAFB007EB47E002EB24D0055E084002FAE
      460018814C00065C7500004A81003F685C004592330036C45B004AD872002AAC
      420005710A0000000000000000000000000098696500FBEAD800FBEAD8003642
      C0000020FB00001FFF003C5EFF00F6F7FF00D4DEFF00BDC6FF00B3CFB6000972
      130030BB4D003FD76900097213007A864B009E8E5A0043602F00016204000674
      0E000D971A000A931400036306000000000000000000000000000023BD000093
      E200035A050016821F003BD16B003CD46C0016801E00004E00000041CF00002F
      FF000023FF00001AF7000016E6000012D700000DC600000AB8000006A7000003
      93000003970000039C00010186000000000000000000000000000139CC000176
      D30002BBC50003946F0006720B000D94110016AD270013991400097C00000260
      65000042F7000034FF00002DF5000027E8000021DC00001BD0000010BA000008
      A9000009AC000008B00004059D0000000000AF857E00FDF4E900D0D5D8001234
      DC001246FF00093DFF002752FF006583FC00238E56004DDA750039A543007CA5
      AC000938F300002DFF000028FF005549CD0085A155002DBB510026A63E000370
      0800000000000000000000000000000000009D6E6700FFF3E200CFBFCC000A20
      CA00062FFF000023FF003C5EFF006781FF007D96FF00667BFF00C2CBFF00527B
      B800097213002EBD3D00097213008C777F00E7AC850099666600000000000000
      000004670800088E1100046E090000000000000000000000000000000000035A
      0500188422003CD36A0043E2790043E2790035CB5F0017831F00004C00000042
      C5000031FF000023FF00001AF8000017E7000012D700000DC600000AB8000006
      A70000039600000291000000910001018400000000000000000000000000006A
      D70000C4FF0000C4FF0001A09C0005700E00139B1C0023BA3B001EAA2E00097C
      0000015D80000044FF000037FE00002DF5000028E9000022DE000017C8000010
      BA000008AB000006A7000002A70004049C00B4898000FFFDEF00B9B6DB00133B
      E700194CFF001549FE000C3FFF00002FEC00238E56002FAE4600B9D8A10095A6
      FF00002AFF000032FF000032FF00303AD20075954E00047D110005710A000000
      000000000000000000000000000000000000A5756B00FFFFEE006F6DBC00011C
      DC000F39FF000C34FF00032BFF00042AFF009EB2FF00D9E1FF00F3F6FF003656
      FF00011FDD0009721300097213005C5B7F00E0A47F0099666600000000000000
      00000000000004700A0005750B00000000000000000000000000035A05001C8A
      280041DA720042DE75003ED76D003FD86E003EDA6E0035CC5F00188420000048
      00000041EB000031FF000023FF00001AF7000017E7000012D700000EC900000A
      B8000006A7000003970000018C00000086000000000000000000000000000000
      0000004AC20000C4FF0000C1FF00029467000A78040025B63C002DC0490023A7
      340005730900005AC5000044FF000037FE00002DF5000028E900001DD5000017
      C8000010BA000009AC000005A30000019D00BA8C8100FFFEF600B9B6DB00183F
      E8002153FF001C4EFF001848FF00839EEF002C9A350025873C00839EEF00133F
      FF00002FFF000032FF000031FF00303AD2008299550005710A00000000000000
      000000000000000000000000000000000000A5756B00FFFFF3006F6DBC000320
      DD001640FF000E37FF00133CFF00BDCBFF00FFFFFF00F6F7FF005778FF000023
      FF000023FF000026EE00097213005C5B7F00E0A47F0093656300000000000000
      00000000000003640600036A09000000000000000000035A05001F932E0041DA
      720042DE75003ED76D003ED76D003DD56B003BD4680037D3630035CE5E001E91
      2B00004C00000042EF000031FF000023FF00001AF7000017E7000013D700000D
      C600000AB8000007AD0000029800000186000000000000000000000000000000
      0000000000000042C80001A1C30001A1C300067B170025AC360033C5510038C8
      5900138C1200016947000058FF000047FF000037FE00002DF7000024E000001C
      D3000017C8000012BF000007AD0002039D00BC918300FFFEF600D5D9F7002744
      DB00285CFF002153FF00416BFF00EBF1F800248719001D6C6D001246FF001041
      FF000639FF000236FF00002DFF00434ABD00F4CC9B00C2938400000000000000
      000000000000000000000000000000000000AB7A6C00FFFEF8009796D5000B25
      D4001A47FF000E37FF005576FF00E6EBFF00CCD8FF006382FF00001FFF00032B
      FF000128FF000026FF000019EB0070639800E6AC7F0091636000000000000000
      0000000000000000000002600500000000000156010028A53D0048EB800048EB
      80003FD86E003DD76C003BD4680038D0640035CF5F0035CF5F003FDE6F0038D4
      640028A63B00005101000042E3000031FF000023FF00001AF7000017EA000014
      DD00000EC9000008A7000007A400000000000000000000000000000000000000
      00000000000000000000002FB90001A1C300026C290025A735003ACA5B003ECE
      610030B54700047111000267C4000058FF000047FF00003AFF00002AEF000026
      E500001DD5000113BA000111B70000000000C2938400FEFBF800FCFAFB004354
      D5002659FF00285AFF00416BFF00EBF1F8004592330057929600EAEAFB007E9B
      FF000236FF00093DFF000026F2007D70AC00FFE0AB00BE928300000000000000
      000000000000000000000000000000000000B17E6B00FEFAF600FBF7F6002338
      D0001843FF00133FFF006382FF00D4DEFF00A1B5FF009EB2FF00A3B7FF002348
      FF00032BFF00032BFF00001AD400B7949700E6AC7F0092636000000000000000
      00000000000000000000025F050000000000035A0500035A0500035A0500188E
      27002DBA51003DD76C0035CE5E0034CE5C0027B24400035A0500035A0500035A
      0500035A050001540200005001000044FF000036FF000025FF00001AF0000009
      AF000004A0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000002FB900015B1E0025A7350041D1660042CF
      670047D36E001283120000708C00006CFF00005AFF000049FF00002EF4000015
      C000000CB400000000000000000000000000C5988600FBF8F700FFFFFF00A5A7
      E000163BE3003064FF002B5CFF0088A3FF008EBE9700CDE5C700D5D9F7003460
      FF001246FF000C3FFF001C33C900DEBFB000FFDDB400BD928400000000000000
      000000000000000000000000000000000000B9846F00FAF6F400FFFFFF008487
      D1000C2DE300234FFF00234FFF00BDCBFF00FFFFFF00FFFFFF00A3B7FF001139
      FF000C37FF000020E90035359D00FFD5A700D5A68A0091636000000000000000
      000000000000000000000000000000000000000000000000000000000000035A
      05001384190037D363002EC653002FCA550014902400004800000091E70000A9
      FF000088FF000079FE00006EFC000056FA000035E900000CB2000007A6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063010026A63B0048D6700047D3
      6E0051DD7D00259C2D0000643C00006EBE000062B8000056B9000012B9000000
      000000000000000000000000000000000000CB9D8900FBF8F700FFFFFF00FFFF
      FE00777ACF001234DC003064FF002A5FFF005C82FF007E9BFF002659FF001E53
      FF001549FE00051EC400AC97B200FFEBBF00FFDDB400BD938600000000000000
      000000000000000000000000000000000000BC877000FAF6F400FFFFFF00F0EE
      F4003541C0001035EE001A47FF002854FF0091AAFF007B96FF001843FF00113E
      FF00042BF6002430B100CEACA600FFE4B400D5A68A0091625E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000035A05002EC653002AC14C0029C44B0013911F0000410F000034B800007F
      E70000B0FF000081F8000013B1000007A6000007A60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000875
      0D0008750D0008750D0008750D0008750D0008750D003EC35F004DD977004FD9
      790057E086003EC35F0008750D0008750D0008750D0008750D0008750D000000
      000000000000000000000000000000000000CDA08900FCF9F700FFFFFF00FFFF
      FF00FFFEFC009397DB002744DB002048EB001646F5000E41F6001646F500173C
      E3003B4AC800BBA9BF00FFEACA00FFE3C300FFE0BE00BE958900000000000000
      000000000000000000000000000000000000C28C7400FAF6F400FFFFFF00FFFF
      FF00EAE7F3005F67CC002439D0001035EE000E35F3000C31F0000C31F0001028
      CF00494DB500E5CEBC00FFEAC200FFE1B900D0AA960091625E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000015607001CA12E0027C0460023BB410013911F0000511600000000000020
      C4000007A6000007A60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008750D0045BF5B0052DE7E0059E689004FDA7A004FDA7A0052DB7E0055DE
      820057E0860059E1880063F0980063F0980046BE5D0008750D00000000000000
      000000000000000000000000000000000000D2A38B00FCF9F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00EAEAFB00B7B6E2008488D7008488D7008E8ECF00C1B6
      D000F6E5D600FFF2D500FEE7CD00FDE3C800FCDFC200BE958900000000000000
      000000000000000000000000000000000000C9907500FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DCD9EE009796D5006C70CB006C70CB008883C200CFC0
      CC00FFF2D400FFF2D400FFE5C900FFEAC200D0AA960091605E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000035A050022B83F001EB5370013972000035A0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000008750D0039AD49004FD9790051DD7D0055DE820057DF850058E0
      870058E087005DE68E005BE38B003BAF4D0008750D0000000000000000000000
      000000000000000000000000000000000000D7A78C00FCF9F700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFF900FFFFF300FFFB
      E400BE908500BE908500BF918600BE908500BE908500AF817500000000000000
      000000000000000000000000000000000000C9907500FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFB00FFFFF300FFFFEE00E5CE
      BC00CB9F8F00C6978800C6988800C6988800B683730093655E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000158030012911F0019AF300013A32500035A0500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008750D0032A23C004FD87A0058E3880059E1880058E0
      87005DE68E005BE38B0037A7450008750D000000000000000000000000000000
      000000000000000000000000000000000000DCAC8E00FCF9F800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF600FDF4
      E900BA8C8100CE9F7E00D7A27400D99C5F00DD984C00C1865800000000000000
      000000000000000000000000000000000000D3997700FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEF800FFFFFB00CCAB
      A400A4695800CA906600CB8A5400D0823900D082390000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000035A05000F951A0012A7240008830D00015505000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000008750D0030A13B004FD77A005EE992005EE9
      920056DD840032A23E0008750D00000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8E00FDFAF800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FBF5
      F000BF928700E6BB8B00F6C07600F8B35200C186580000000000000000000000
      000000000000000000000000000000000000D59A7700FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCAB
      A400B2796300EEB67000EFA95300EF9C39000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000035A0500088109000A981500057B07000257
      0400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008750D002E9E390056DE860055DC
      85002FA03B0008750D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8E00FDFAF800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBF8
      F700BF938800E5B98900F2BE7500C18658000000000000000000000000000000
      000000000000000000000000000000000000D59A7700FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEAF
      A900B0766200EEB67000EFA95300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000035A0500035A0500047D0300046F
      0100035800000158030000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008750D0033A4400033A6
      430008750D000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEAD8E00FBF5F000FEFBFA00FDFA
      F800FDFAF800FCF9F800FCF9F800FCF9F700FCF9F700FBF8F700FCF9F800F7F1
      F000BF928700E5B98900C1865800000000000000000000000000000000000000
      000000000000000000000000000000000000D5997700FAF2ED00FEFAF800FCF8
      F600FCF8F600FBF7F600FBF7F600FAF6F400FAF6F400FAF6F400FFFFFF00CCAB
      A400B2796300DAA56E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000035A0500035A
      0500035A050000580600004A0700034312000157040000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008750D000875
      0D00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCA88700DEAD8E00DEAD8E00DEAD
      8E00DCAC8E00D9A98C00D4A58B00D2A38B00CB9D8900C89B8700C4978600BE91
      8300BA897C00C186580000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D3936F00D5997700D59A7700D59A
      7700D3997700CE957600C9907500C28C7400C1887200BC877000B6837300A974
      6700B17E6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A08281000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B008C4B4B00914B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A08281008662
      4D00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B00894B4B009C4B4C00B64B4C00BD4B4C009F4B
      4C004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0828100E9B8
      950086624D000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B009A4D4E00AF4E4F00C14E4F00C04D4E00BF4C4D00BF4C4D009F4B
      4C004E1E1F00994B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0828100FDFA
      F700E9B8950086624D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00C5545500C9545500C7535400C6525300C5515200C4505100C24F5000A04C
      4D004E1E1F00FE8B8C00FC929300FB9A9C00FAA3A400F8AAAB00F7B1B100F7B5
      B600F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0828100FDFA
      F700E9B8950086624D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B0000118C1F00004B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00CE585900CC575800CB565700CA555600C9545500C7535400C6525300A34E
      4F004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0828100FDFA
      F700E9B8950086624D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00F2D8B700F2D4B000F0D1AA00EFCEA300EECB9C00EDC7
      9500EDC58F00EBC18900E9BD8100E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000004B0000138F230007931000169C2800004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D15B5C00D05A5B00CF595A00CE585900CC575800CB565700CA555600A550
      50004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0828100FDFA
      F700E9B8950086624D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00811E0000811E0000811E0000811E0000811E0000811E0000EECB
      9C00EDC79600EDC59000EBC18900E9BF8200E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000000000000004B0000159127000FA01D000B99160008961100159A2700004B
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00D55E5F00D55E5F00D45D5E00D35C5D00D15B5C00D05A5B00CF595A00A651
      52004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A0828100FDFA
      F700E9B8950086624D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000095666000F2E2
      D300FAEAD700811E0000FEFEFE00CCD4F2002346FC00566FDD00811E0000EFCE
      A300EECB9D00EDC79700EDC59000EBC18900E9BD8100E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      0000004B00000F811C001AAF310014A727000FA11F000C9A1800089612001399
      2500004B00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DA636400D9626300D8606200D75F6000D55E5F00D45D5E00D35C5D00A953
      54004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0828100FDFAF700F6E3
      D500F5E0D100E9B8950086624D00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00811E0000BAC6FA00183EFF005B78FE001032F400751C0100F0D1
      A900EFCEA300EECB9D00EDC79600EDC58F00EBC18900E9BD8100EABF7F00E7BC
      7E0080504B00000000000000000000000000000000000000000000000000004B
      00000E7D1A0028C0480021B83D001BB0330013902400004B0000169D29000997
      130013982300004B000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00DE666700DD656600DC646500DA636400D9626300D8606200D75F6000AB55
      55004E1E1F003F9E4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A0828100FDFAF700F7E6DA00F6E3
      D500F5E0D100EFCAB100E9B8950086624D000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600811E0000D8E0FE00BBC7FE00FEFEFE006480F7001E185E00F2D5
      B000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF8200E7BB
      7E0080504B000000000000000000000000000000000000000000004B00000C77
      170035CF5E002FC9540028C149001B9F3100004B000000000000004B00000D9E
      1B000997140011972200004B0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E2696A00E1686900E0676800DE666700E06D6E00E6909100DC646500AC56
      57004E1E1F0058A55B001EBC4C001EBC4C001EBC4C001EBC4C001EBC4C001EBC
      4C00F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000000000000000000000000000A0828100FDFAF700F8E9DE00F7E6DA00F6E3
      D500F5E0D100F4DCCC00EFCAB100E9B8950086624D0000000000000000000000
      0000000000000000000000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00811E0000FEFEFE00FEFEFE00FEFEFE00F6F6F8000E1A9A006073
      DA00F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC28800E7BC
      800080504B000000000000000000000000000000000000000000004B00003FD9
      6F003BD7680036D0600020AA3B00004B0000000000000000000000000000004B
      0000097411000A99150011962000004B00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00E76D6E00E66C6D00E56B6C00E36A6B00EEA6A700FFFFFF00EB9C9C00AF58
      59004E1E1F00EECEAF00B7EBAA005ED377005ED3770045CA670045CA670045CA
      6700F7B5B600824B4B0000000000000000000000000000000000000000000000
      00000000000000000000A0828100FDFAF700F9ECE300F8E9DE00F7E6DA00F6E3
      D500F5E0D100F4DCCC00F3D9C700EFCAB100E9B8950086624D00000000000000
      0000000000000000000000000000000000000000000000000000A7756800F8F3
      F000FEFBF600811E0000811E0000811E0000811E0000811E0000741D04002948
      EE002F4BE6009695C600F0D1A900EFCEA300EDCB9C00EDC79500EDC58F00E9BF
      870080504B000000000000000000000000000000000000000000004B00001C9C
      340041DC700023AD4100004B0000000000000000000000000000000000000000
      000000000000004B00000B99160010951F00004B000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EB707200EA6F7000E96E6F00E76D6E00F2A9AA00FFFFFF00EB959600B15A
      5A004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300D9F6BD00D9F6
      BD00F7B5B600824B4B0000000000000000000000000000000000000000000000
      000000000000A08C7D00FDFAF700FAEFE700F9ECE300F8E9DE00F7E6DA00F6E3
      D500F5E0D100F4DCCC00F3D9C700F2D6C300EFCAB100E9B8950086624D000000
      0000000000000000000000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300FBF2EA00F8EEE300F8EBDA00F7E6D300F7E2CC00EFDC
      C6006877DA005367DC00F2D4B000F0D1AA00EFCEA300EECB9C00EEC99600EAC1
      8E0080504B00000000000000000000000000000000000000000000000000004B
      00002EC15200004B000000000000000000000000000000000000000000000000
      00000000000000000000004B00000C9A180009961200004B0000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00EF747500EE737400ED727300EB707200EA6F7000EF909100E76D6E00B25B
      5C004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000A08C7D00FDFAF700FBF2EC00FAEFE700F9ECE300F8E9DE00A08C7D008662
      4D00A08C7D00F4DCCC00F3D9C700F2D6C300F1D3BE00EFCAB100E9B895008662
      4D00000000000000000000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00FEF7F000FBF3EA00FAEFE300F8EADA00F7E7D300F6E2
      CB00F6E0C500F3DCBF00F2D8B600F2D4B000F0D1A900EFCEA100EECB9C00EBC5
      920080504B000000000000000000000000000000000000000000000000000000
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B00000464080009961300004B00000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F3777800F3777800F2767700F0757600EF747500EE737400ED727300B55D
      5D004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000A082
      8100FDFAF700FCF6F100FBF2EC00A08C7D0086624D0086624D009CDEFF009CDE
      FF00009CCE0086624D0086624D0086624D00A08C7D00EFCAB100EFCAB100E9B8
      950086624D000000000000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00811E0000811E0000811E0000811E0000811E0000811E0000F7E6
      D300F6E3CC00F6DEC500F3DCBD00F3D8B600F2D4AF00F0D1A900F0CFA300EDC9
      990080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004B000007740E00004B
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F87B7D00F77A7B00F6797A00F4787900F3777800F2767700F0757600B75F
      5F004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000A082
      8100A08C7D0086624D0086624D009CFFFF009CFFFF0000BDFF009CDEFF009CDE
      FF009CDEFF00009CCE0000009C0000009C00C7AB970086624D00A08C7D00E9B8
      950086624D000000000000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00811E0000FEFEFE00CCD4F2002346FC00566FDD00811E0000F8EA
      DA00F7E6D300F6E2CB00F6DEC400F3DABC00F2D8B600F0D4AF00EFD0A700CEB4
      910080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000035E
      0600004B0000000000000000000000000000000000000000000000000000824B
      4B00FC7F8000FB7E7F00FA7D7E00F87B7D00F77A7B00F6797A00F4787900B860
      62004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B000000000000000000000000000000000000000000A082
      8100C7AB9700C7AB970000BDFF00E9FFFF009CFFFF009CFFFF0000A5EF009CDE
      FF00009CCE000000C80000009C000000C80000009C00C7AB9700C7AB97008662
      4D0086624D000000000000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00811E0000BAC6FA00183EFF005B78FE001032F400751C0100FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B09600A192
      7F0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004B0000004B00000000000000000000000000000000000000000000824B
      4B00FF818200FF818200FE808100FC7F8000FC7F8000FB7E7F00FA7D7E00BB63
      63004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      0000A08281009C6B63003883980000A5EF00E9FFFF009CFFFF009CFFFF0000A5
      EF000000C80000009C000000DE000000DE000000C80000009C0086624D000000
      0000000000000000000000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00811E0000D8E0FE00BBC7FE00FEFEFE006480F7001E185E00FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C8B00A497
      860080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004B000000000000000000000000000000000000824B
      4B00FF818200FF818200FF818200FF818200FF818200FE808100FE808100BD65
      65004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000063313100CE6300009C6B63009C6B630000A5EF00E9FFFF0000BDFF000000
      B4000000B4000000DE000000DE000000DE000000DE000000C80000009C000000
      0000000000000000000000000000000000000000000000000000CB917300FBF7
      F400FFFFFF00811E0000FEFEFE00FEFEFE00FEFEFE00F6F6F8000E1A9A006580
      F800FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00A0675B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00F77E7F00FF818200FF818200FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000063313100CE630000CE630000CE6300009C31000000BDFF000000B4008B9E
      F100718BED000000B4000000DE000000DE000000DE0000009C00000000000000
      0000000000000000000000000000000000000000000000000000CF967400FBF7
      F600FFFFFF00811E0000811E0000811E0000811E0000811E0000741D04002B4E
      FE003252F7009EACF200DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B00824B4B00AF5E5F00D56F7000FF818200FF818200FF818200FF818200BF66
      66004E1E1F00EECEAF00FFFFD300FFFFD300FFFFD300FFFFD300FFFFD300FFFF
      D300F7B5B600824B4B0000000000000000000000000000000000000000000000
      000063313100FFAD4A009C3100009C310000CE630000CE6300009C3100000000
      B4008B9EF100718BED000000B4000000DE0000009C0000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FA
      FF006C86FB005875F800DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000824B4B00824B4B0091515200B6626300EE7A7B00FF818200BF66
      66004E1E1F00914B4B00824B4B00824B4B00824B4B00824B4B00824B4B00824B
      4B00824B4B00824B4B0000000000000000000000000000000000000000000000
      00006331310063313100FFCE9C00FFAD4A00D6840000D6840000D68400006331
      31000000B4000000B4000000B4000000B4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000824B4B00824B4B00985555009F58
      58004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006331310063313100FFCE9C00FFCE9C0063313100633131000000
      0000000000000000B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000824B
      4B004E1E1F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000633131006331310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      590080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00999C9E00999C
      9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C
      9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C
      9E00999C9E00999C9E0000000000000000000000000000000000A87D7800A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400986B6600000000000000000000000000000000000000000093655E00EFD3
      B400F6DAB600F3D5AD00F2D1A500F0CE9E00EFCB9700EFC79100EEC58900EBC1
      8200EBC08000EBC08000EBC08000EBC08000EBC08000EBC08000EDC18000EABF
      7F0080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000086848400868484008684840000000000000000000000
      0000000000008684840086848400000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00FEFEFD00FEFE
      FD00FEFEFD00FDFDFC00FBFBFA00F9F9F800F7F7F600F5F5F400F3F3F200F1F1
      F000EFEFEE00EDEDEC00EBEBEA00E9E9E800E6E6E400E1E1E000DCDCDB00D2D2
      D100CACACA00989B9D0000000000000000000000000000000000A97F7900F3DD
      C400F8E3C600F6DFBF00F5DCB800F4D9B200F3D7AC00F3D4A700F2D2A000F0CF
      9A00F0CE9800F0CE9800F0CE9800F0CE9800F0CE9800F0CE9800F1CF9800EFCD
      9700986B6600000000000000000000000000000000000000000093655F00EED4
      B800F4DABB00F2D5B100F0D1AA00EFCFA300EECB9D00EDC79600EDC58F00EBC1
      8800EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      00000000000086848400C1BFBF00ABA8A900A4A1A20086848400868484009996
      970086848400E5E4E400DBDADA00868484008684840086848400000000000000
      00000000000000000000000000000000000000000000AFAFAF00FEFEFD00F7A9
      5F00F2A65B00EEA25900F5A65A00F7A75900F7A65800F7A55700F7A55500F7A4
      5400F7A35300F7A35100F7A25000F7A14F00F7A14E00F79C4500ED923900DB85
      3100BDBDBC009396980000000000000000000000000000000000A97F7A00F2DE
      C800F7E3CA00F5DFC200F4DCBC00F3DAB600F2D7B100F1D4AB00F1D2A500F0CF
      9F00EFCD9A00EECC9700EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B6600000000000000000000000000000000000000000093655F00EED7
      C000F6E0C100F2D9B800F2D4B100F0D1AA00EFCFA400EECB9D00EDC79600EDC5
      8F00EBC18900EABF8200E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000000000
      000086848400DFDEDE00D3D1D100B5B3B300B5B3B300B5B3B3009B999A007776
      7600CBCBCB00D9D9D900DADADA00DCDCDC00DDDDDD00D6D5D500868484008684
      84008684840000000000000000000000000000000000AFAFAF00FEFEFD00EDA3
      5D00DBDBDA00D0D0CF00E9E9E800F5A75A00FEFEFD00FEFEFD00FEFEFD00F7A5
      5600FEFEFD00FEFEFD00FEFEFD00F7A25100F8F8F700EBEBEA00ADB4D7000031
      DE00C2C2C10096999B0000000000000000000000000000000000A97F7A00F2E0
      CE00F8E7CF00F5E2C800F5DEC200F4DCBC00F3DAB700F2D7B100F1D4AB00F1D2
      A500F0CFA000EFCD9A00EECC9700EECC9700EECC9700EECC9700EFCD9700EDCB
      9600986B6600000000000000000000000000000000000000000093655F00EFDA
      C500F7E2C700F3DCBF00F2D8B70000700000F0D1AA00EFCEA300B1B874000070
      00000070000000700000ADAD6000E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000000000000000000008684
      8400E1E0E000E7E6E600CECDCD00B5B3B300B5B3B300B5B3B3007C7B7B000000
      0000000000002828280078787800BBBBBB00D6D6D600D6D6D600D6D6D600D6D6
      D600CFCECE0086848400868484008684840000000000AFAFAF00FAFAF900D895
      5600002EE400A0A09F00C1C1C000E29A5500FCFCFB00FEFEFD00FEFEFD00F7A6
      5700FEFEFD00FEFEFD00FEFEFD00ED9C4F00D8D8D7006974B7000031DE000426
      BA00D1D1D000989B9D0000000000000000000000000000000000A97F7A00F3E3
      D200F9E9D400F6E4CD0099330000993300009933000099330000993300009933
      00009933000099330000993300009933000099330000EECC9700EFCD9700EDCB
      9600986B6600000000000000000000000000000000000000000093656000F0DE
      CC00F8E6CF00F6E0C600F3DCBD000070000004750300B2BD7F0000700000B1B8
      7400EDC79600B0B46B0000700000ADAF6200E9BD7F00E9BD7F00EABF7F00E7BC
      7E0080504B00000000000000000000000000000000000000000086848400DDDD
      DD00DEDDDD00DADADA00A3A1A100999797009997970099979700868484002626
      2600131313000000000000000000000000002828280078787800BBBBBB00D6D6
      D600D6D6D600C7C6C600C7C6C6008684840000000000AFAFAF00F9F9F8001B48
      FB001B48FB00002EE4009B9B9A00BB804800E9E9E800FCFCFB00FEFEFD00F7A6
      5900FEFEFD00FEFEFD00F4F4F300CF894600002EE4000532F5001B48FB00D38A
      4300DFDFDD00999C9E0000000000000000000000000000000000A97F7B00F4E6
      D800FAECDA00F8E7D30099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00DFE5
      FE00325BFC00EEF1FE00FEFEFE00FEFEFE0099330000EECC9700EFCD9700EDCB
      9600986B6600000000000000000000000000000000000000000095666000F2E2
      D300FAEAD700F6E3CE00F4DEC500007000000070000000700000B2BD7F00EFCE
      A300EECB9D00EDC79700B0B46B0000700000E9BD8100E9BD7F00EABF7F00E7BC
      7E0080504B000000000000000000000000000000000086848400D6D6D600D6D6
      D600D3D3D300A4A3A300C8C5C500C6C4C400B5B3B300B5B3B300B3B1B100AEAC
      AC00A9A6A7009A9898006D6B6B00434242001313130000000000000000002828
      28007E7E7E0099969700868484000000000000000000AFAFAF00FBFBFA001B48
      FB003E5EFF003E5EFF00002EE40097683A00BB804800E29A5500F5A75A00F7A7
      5A00F7A65900ED9F5400CF8A4800002EE4000532F5001B48FB00CF884400ED9C
      4C00E8E8E700999C9E0000000000000000000000000000000000AA807B00F5E9
      DD00FBEFE000F8EAD90099330000FEFEFE00FEFEFE00FEFEFE00AFBFFD001342
      FB000335FB00A0B2FD00FEFEFE00FEFEFE0099330000EECC9700EFCD9700EDCB
      9600986B6600000000000000000000000000000000000000000098696300F2E6
      DA00FAEEDE00F7E7D400F6E2CB0000700000007000000070000000700000F0D1
      A900EFCEA300EECB9D00EDC7960000700000EBC18900E9BD8100EABF7F00E7BC
      7E0080504B000000000000000000000000000000000086848400D6D6D600D2D2
      D200A4A3A300E0DEDE00F9F8F800F8F7F700F5F4F400E7E6E600D6D4D400C6C5
      C500B8B6B600B5B3B300B5B3B300B2AFB000A9A6A700827F8000393839000A09
      09002D2D2D00AEACAC00868484000000000000000000AFAFAF00FAFAF900F6AB
      65008C9CF6001B48FB003E5EFF00002EE4009B9B9A00C1C1C000E8E8E700EDA1
      5800EBEBEA00AAB1D300002EE4000532F5001B48FB00D5D5D400F4F4F300F6A1
      5100EBEBEA00999C9E0000000000000000000000000000000000AD837D00F5EC
      E300FBF2E600F9EDDE0099330000FEFEFE00FEFEFE00718DFC000335FB000335
      FB000335FB00224EFB00FEFEFE00FEFEFE0099330000EECC9900EFCD9700EDCB
      9600986B660000000000000000000000000000000000000000009E6E6400F4EA
      E100FBF2E600F8EADC00F7E6D300007000000070000000700000007000000070
      0000F0D1AA00EFCEA400EDCB9C00EDC79600EBC58F00EBC18800EABF8200E7BB
      7E0080504B000000000000000000000000000000000086848400D2D2D200A4A3
      A300EDECEC00F9F8F800F9F8F800F8F7F700F5F4F400F2F1F100EFEFEF00EDEC
      EC00EAE9E900DEDDDD00D0CFCF00C0BFBF00B5B3B300B5B3B300AEACAC009A98
      980086848400B3B1B100868484000000000000000000AFAFAF00F8F8F700F8AE
      6600FEFEFD00BAC3FA001B48FB003E5EFF00002EE4009B9B9A00BCBCBB00C687
      4B006873B6000031DE000532F5001B48FB00D5D5D400F4F4F300FDFDFC00F7A3
      5200EEEEED00999C9E0000000000000000000000000000000000B2887E00F7EF
      E800FCF5EC00FAEFE40099330000EEF1FE00325BFC000335FB000335FB00718D
      FC001342FB000335FB00AFBFFD00FEFEFE0099330000F0CF9F00EFCD9A00EDCA
      9600986B66000000000000000000000000000000000000000000A3726600F6EE
      E900FCF6ED00F8EFE300F7EADA00F7E6D300F6E2CC00F4DEC500F3DCBD00F2D8
      B600F0D5B000F0D1AA00EFCEA300EECA9C00EDC79500EBC48E00EBC28800E7BC
      800080504B000000000000000000000000000000000086848400A4A3A300F3F2
      F200F9F8F800F9F8F800F9F8F800F8F7F700DFDDDE009D949600AAA2A400CFCD
      CD00E5E4E400E7E7E700E4E4E400E1E1E100DCDCDC00D0CFCF00C3C1C100B5B3
      B300B0AEAE0086848400868484000000000000000000AFAFAF00F6F6F500F8AE
      6600FEFEFD00FEFEFD00FAFAF9001B48FB003E5EFF00002EE400959594000031
      DE000532F5001B48FB001B48FB00CF8B4B00F4F4F300FDFDFC00FEFEFD00F7A4
      5300F0F0EF00999C9E0000000000000000000000000000000000B68B8000F8F2
      EE00FDF8F100FAF3EA0099330000224EFB000335FB001342FB00AFBFFD00FEFE
      FE008099FC000335FB00224EFB00FEFEFE0099330000F0D1A400F0D09F00EDCB
      9800986B66000000000000000000000000000000000000000000A7756800F8F3
      F000FEFBF600FBF3EB00F8EEE300F8EBDC00F7E7D300F6E2CC00F4E0C5000070
      000000700000007000000070000000700000EDCB9C00EDC79500EDC58F00E9BF
      870080504B000000000000000000000000000000000086848400D9D7D800F9F8
      F800F9F8F800F9F8F800F9F8F800DAD7D800C0BEBF00BFBDBD00B2ADAD009B92
      94008E838500A0989900BDB8B900D4D3D300DFDFDF00DCDCDC00D9D9D900D5D4
      D400CAC9C900B9B7B700868484000000000000000000AFAFAF00F4F4F300F8AE
      6600F8AE6600F8AE6600F8AE6600F3A963001B48FB003E5EFF001B48FB001B48
      FB001B48FB001B48FB00C4864900EA9E5700F6A65900F7A65800F7A55700F7A5
      5500F2F2F100999C9E0000000000000000000000000000000000BA8E8200FAF6
      F400FEFCF800FCF6F00099330000A0B2FD00325BFC00CFD8FD00FEFEFE00FEFE
      FE00EEF1FE001342FB000335FB008099FC0099330000F1D4AA00F1D2A500EECD
      9E00986B66000000000000000000000000000000000000000000AC796900FAF6
      F400FFFFFE00FEF8F300FBF2EA0000700000F8EBDA00F7E6D300F7E2CC00F6E0
      C50000700000007000000070000000700000EFCEA300EECB9C00EEC99600EAC1
      8E0080504B000000000000000000000000000000000000000000868484008684
      8400D9D7D800F1F0F000C0B7B80085787A008F8486009B919300B0ABAC00BEBC
      BC00C3C1C100BDBABB00ADA7A800999091009C939500A9A3A400CDCDCD00D7D7
      D700D6D6D600CECECE00868484000000000000000000AFAFAF00F2F2F100F8AE
      6600FEFEFD00FEFEFD00FEFEFD00EDA66200D2D2D1001B48FB001B48FB001B48
      FB001B48FB0092929100BCBCBB00E1995400FCFCFB00FEFEFD00FEFEFD00F7A5
      5700F4F4F300999C9E0000000000000000000000000000000000BE928300FBF8
      F700FFFFFE00FEFAF60099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00A0B2FD000335FB000335FB007D332F00F2D7B000F2D5AB00EFCF
      A400986B66000000000000000000000000000000000000000000B17E6B00FAF6
      F400FFFFFF00FFFEFB00FEF7F00000700000BAD4AA00F8EADA00F7E7D300F6E2
      CB00B7C79200007000000070000000700000F0D1A900EFCEA100EECB9C00EBC5
      920080504B000000000000000000000000000000000000000000000000000000
      00008684840086848400CC9A9900C0A18C0095796C00806F71007F6F72008779
      7C0087797C00A0989900B4AFB000C0BEBF00C3C1C100B7B3B400D6D5D600D7D7
      D700C7C6C60086848400000000000000000000000000AFAFAF00F0F0EF00F8AE
      6600FEFEFD00FEFEFD00F4F4F300D09256001B48FB003E5EFF001B48FB001B48
      FB003E5EFF00002EE4009B9B9A00BB804700E9E9E800FCFCFB00FEFEFD00F7A6
      5800F6F6F500999C9E0000000000000000000000000000000000C2968500FBF8
      F700FFFFFF00FFFEFC0099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE005274FC000335FB000C35EB00E4CFB900F2D7B000F0D2
      A800986B66000000000000000000000000000000000000000000B6816C00FAF6
      F400FFFFFF00FFFFFF00FFFCFB00BCDAB40000700000B8D3AA00F8EBDC00B7CC
      9D0000700000B7C792000475030000700000F2D4AF00F0D1A900F0CFA300EDC9
      990080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000CC9A9900FFDEBD00FFDBB500FFD7AD00DFB89400B591
      770094807A007B6B6E0080717400897C7F00A49D9E00D9D8D800DADADA00B8B7
      B7008684840000000000000000000000000000000000AFAFAF00EEEEED00F8AE
      6600FEFEFD00F4F4F300D5D5D4001B48FB003E5EFF001B48FB00002EE400002E
      E4001B48FB003E5EFF00002EE4009F6D3E00C4C4C300E9E9E800FCFCFB00F7A7
      5900F8F8F700999C9E0000000000000000000000000000000000C6998600FBF8
      F700FFFFFF00FFFFFF0099330000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00EEF1FE00325BFC000335FB003054EF00F4DAB600F1D5
      AE00986B66000000000000000000000000000000000000000000BB846E00FAF6
      F400FFFFFF00FFFFFF00FFFFFF00FFFEFB00BCDAB40000700000007000000070
      0000B7CC9D00F6E2CB00F6DEC40000700000F2D8B600F0D4AF00EFD0A700CEB4
      910080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000CC9A9900FFE2C300FFDEBB00FFDAB400FFD6AC00FFD3
      A400FFCF9D00FFCD9900FFCE9C00CC9A99008684840086848400868484008684
      84000000000000000000000000000000000000000000AFAFAF00EBEBEA00F8AE
      6600EEA76200D09256001B48FB003E5EFF001B48FB00002EE400D0925600EBA4
      6000EEA661001B48FB003E5EFF00002EE400A8734100BE824800E29A5500F5A6
      5A00FAFAF900999C9E0000000000000000000000000000000000CA9C8800FBF8
      F700FFFFFF00FFFFFF0099330000993300009933000099330000993300009933
      00009933000099330000993300007D332F000C35EB000335FB000335FB00D9C4
      A700986B66000000000000000000000000000000000000000000C0896F00FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2EA00FAEE
      E200F8EBDA00F7E6D300F6E2CB00F6DEC400F3DCBD00E5CEAF00C4B09600A192
      7F0080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000CC9A9900FFE5C900FFE1C200FFDDBA00FFD9B200FFD6
      AB00FFD2A300FFCE9C00FFCE9C00CC9A99000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00E9E9E800EEA7
      6200D5D5D4001B48FB003E5EFF001B48FB00002EE400D5D5D400F4F4F300F7AD
      6600FEFEFD00FCFCFB008C9CF6001B48FB00002EE400ADADAC00C4C4C300E29A
      5500FBFBFA00999C9E0000000000000000000000000000000000CEA08900FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FEF9F500FCF5EF00FBF2
      E900FAF0E300F9ECDD00F8E9D700F8E6D100F6E4CC000335FB000335FB000335
      FB000335FB000000000000000000000000000000000000000000C58C7000FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF8F200FBF3
      EA00F8EEE200F8EAD900F8E7D400FAE9D000E0D0BA00B8AB9A00A79C8B00A497
      860080504B000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900FFEBD700FFE8D000FFE4C800FFE0C000FFDDB900FFD9
      B100FFD5AA00FFD1A200CC9A9900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00DEDEDE00D092
      56001B48FB003E5EFF001B48FB00002EE400D5D5D400F4F4F300FDFDFC00F8AE
      6600FEFEFD00FEFEFD00FEFEFD00BAC3FA001B48FB00002EE400B4B4B300C788
      4B00ECECEB00989B9D0000000000000000000000000000000000D2A38A00FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFDFC00FDFAF500FCF6
      EF00FAF2E900FAEFE200FAEDDE00FBEEDB00E7DBC900C8BDAF000335FB000335
      FB000335FB000335FB000335FB00000000000000000000000000CB917300FBF7
      F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7
      F000FBF2E900FBF2E500E9D3C400A0675B00A0675B00A0675B00A0675B00A067
      5B00A0675B000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900FFEFDE00FFEBD600FFE7CE00FFE3C700FFE0BF00FFDC
      B800FFD8B000FFD4A800CC9A9900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADAD00CCCCCB001B48
      FB005B7AFF001B48FB00002EE400D0925600F4F4F300FDFDFC00FEFEFD00F8AE
      6600FEFEFD00FEFEFD00FEFEFD00F8AD6500FAFAF9001B48FB00002EE400CB8C
      4E00DCDCDB009396980000000000000000000000000000000000D7A78C00FCF9
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FDF9
      F400FCF5EE00FCF5EB00EEDDD100B4817600B4817600B4817600B4817600B481
      76000335FB000335FB000335FB00000000000000000000000000CF967400FBF7
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFC
      FA00FCF7F000FFFAEF00DAC0B600A0675B00DAA16B00DD984F00E2903A00EA89
      2300A5686B000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900FFF2E400FFEEDC00FFEAD500FFE7CD00FFE3C600FFDF
      BE00FFDBB600F9D0AC00CC9A9900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAE001B48FB006482
      FF001B48FB00002EE400D0925600EEA76200F7AD6600F8AE6600F8AE6600F8AE
      6600F8AE6600F8AE6600F8AE6600F8AD6600F8AD6500F5AA6200F0A65F00002E
      E400EBEBEA0096999B0000000000000000000000000000000000DAAB8D00FCF9
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFD
      FB00FDF9F400FFFBF300E3CEC600B4817600E3B58500E5AD6A00E9A65400EFA0
      3900B88285000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFCFB00FFFEF700DDC4BC00A0675B00EAB47400EFA95200F6A03600A568
      6B00000000000000000000000000000000000000000000000000000000000000
      0000CC9A9900FFF9F200FFF5EA00FFF1E300FFEDDB00FFEAD400FFE6CC00FFE2
      C400FFDEBD00CC9A990000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00D9D9D9001B48
      FB00002EE400CACACA00DFDFDE00EAEAE900EDEDEC00EFEFEE00F1F1F000F3F3
      F200F5F5F400F7F7F600F9F9F800FBFBFA00FDFDFC00FEFEFD00FEFEFD00FDFD
      FC00FBFBFA00989B9D0000000000000000000000000000000000DEAD8E00FDFA
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFDFC00FFFEF900E5D1CB00B4817600EFC48D00F3BB6D00F8B45000B882
      8500000000000000000000000000000000000000000000000000D4987500FCF8
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DDC7C200A0675B00EAB27300EFA75100A5686B000000
      000000000000000000000000000000000000000000000000000000000000CC9A
      9900FFFBF600FFFBF600FFF8F100FFF4E900FFF0E200FFEDDA00FFE9D200FFE5
      CB00F5D4BB00CC9A990000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00D8D8D800DADA
      D900DADAD900DEDEDE00E7E7E600E9E9E800EBEBEA00EDEDEC00EFEFEE00F1F1
      F000F3F3F200F5F5F400F7F7F600F9F9F800FBFBFA00FDFDFC00FEFEFD00FEFE
      FD00FEFEFD00999C9E0000000000000000000000000000000000DEAD8E00FDFA
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E5D4D000B4817600EFC38C00F3BA6C00B88285000000
      0000000000000000000000000000000000000000000000000000D4987500FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2D0CE00A0675B00EDB57200A5686B00000000000000
      000000000000000000000000000000000000000000000000000000000000CC9A
      9900CC9A9900CC9A9900CC9A9900FFF7F000FFF4E800FFF0E000FFECD900FCE4
      CE00CC9A99000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAF00999C9E00999C
      9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C
      9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C
      9E00999C9E00999C9E0000000000000000000000000000000000DEAD8E00FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E9DBD900B4817600F1C58B00B8828500000000000000
      0000000000000000000000000000000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800A0675B00A5686B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CC9A9900CC9A9900CC9A9900CC9A9900CC9A
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200DAA4
      8200DAA48200DAA48200DAA48200B4817600B882850000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDBAA900D0B5
      AA00CCB0A400DCB7A60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009463
      5A00EFD6B500F7DEB500F7D6AD00F7D6A500F7CE9C00EFCE9400EFC69400EFC6
      8C00EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC68400EFC6
      8400EFBD7B009C6B6300000000000000000093655F00A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A46769000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0BDAF00CCC1BD00BCB6
      B600ADA5A500AF9F9A00D5B2A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005B7000005B700000000000000000000000000000000009463
      5A00EFD6BD00F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EED4B800F2DABC00F2D5
      B100EDCEA700E6C79D00E1C09300DEBB8C00E1BB8800E5BC8400E7BC8100E7BC
      7E00E9BD7F00E9BD7F00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0BDAF00DCD1D000D1CFD000C9C6
      C700BFB8BA00ADA5A500AD9D9900D4B4A4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000005B7000005B7000005B700000000000000000000000000000000009463
      5A00EFD6C600F7E7C600F7DEBD00F7D6B500F7D6AD00EFCEA500EFCE9C00EFC6
      9400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00ECD5C200F4DEC000F0D8
      B700E9CCAB00D9BD9900C9AD8900C1A57F00C6A67E00D1AF7F00DAB47F00E1B7
      7D00E3BA7D00E7BC7E00E9BD7F00E9BD7F00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E1BFAF00E6DCDA00E2E2E300DCDADD00D0BC
      B500C7B2AB00BFBABB00AFA6A700AC9D9800D5B4A50000000000000000000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B70000000000000000000000000000000000000000009463
      5A00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00EFCEA500EFCE
      9C00EFC69400EFC68C00EFC68C00EFBD8400EFBD7B00EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093655F00EFDAC500F6E1C600F2DA
      BC00E6CEAF00222123003E3935008C7960009D876700AA8F6B00B89A6F00C7A4
      7400D1AB7500DEB57900E5BB7D00E7BC7E00EABF7F00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2C1B100EDE5E200EEEFF300E9E9EB00D0917400C052
      2300C0522300C2816400BFB8BA00AFA7A900AD9D9900D3B1A300000000000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000005B7000000000000000000000000000000000000000000000000009463
      6300F7DECE00FFE7CE00F7E7C600F7DEBD00F7DEB500F7D6B500EFCEA500DEBD
      9400D6B58C00D6B58400DEB58400E7BD8400EFBD8400EFBD7B00EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000093656000F0DECB00F7E5CE00F4DE
      C500EAD4B6003C3835001F1F2100182A330034434400836F56008E7759009E83
      5F00B2926800C7A36F00D9B17600E3BA7D00E7BC7E00E7BC7E009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E2C0B000F2EBE900F4F8FB00F3F7FB00D3906F00BA400F00BA41
      1100BB411200BB411100C1795800C0BABA00AFA7A900A99A9700D3B1A3000000
      00000000000000000000000000000000000000000000000000000005B7000005
      B7000005B7000005B7000005B700000000000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000005B7000005
      B700000000000000000000000000000000000000000000000000000000009463
      6300F7E7D600FFEFD600F7E7CE00F7DEC600F7DEBD00F7DEBD00DEC6A500BDA5
      8400AD947300A58C6B00BD9C7300DEB58400EFC68C00EFBD8400EFBD7B00EFBD
      7B00E7BD7B009C6B6300000000000000000095666000F2E2D300FAEAD700F6E3
      CE00F0DAC200AC9D8A00113B4E0004689A00064F75000C3C52003A4948007764
      4C0089725300A4865F00BC996900D1AB7300E1B77900E3BA7B009F6F60000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E1BDAD00F4EDE900FBFEFF00F8FEFF00D99F8200C2562700D9906D00DD9C
      7B00DD9C7B00D9906D00C4542400C1765300BFBABB00AFA7A900A99A9700D3B1
      A300000000000000000000000000000000000000000000000000000000000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000000
      0000000000000000000000000000000000000000000000000000000000009C6B
      6300F7E7DE00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEBD00004A0000004A
      0000004A0000004A0000A58C6B00D6B58400EFC68C00EFC68C00EFBD8400EFBD
      7B00E7BD7B009C6B6300000000000000000098696300F2E6DA00FAEEDE00F7E7
      D400F4E1CA00EBD8BD001A3E4D00036A9D00056798001B506E002A3440004135
      38006A5542007E694C00987D5800B2916300CCA66E00DAB177009D6D5F000000
      000000000000000000000000000000000000000000000000000000000000E1BD
      AD00F6EDE900FEFFFF00FEFFFF00DEA68B00BC491900BC491900DD9D7E00FFFF
      FF00FFFFFF00DA977600BD4A1A00BF491800C27B5B00BFB8BA00B0A9AA00AB9C
      9800D3B1A3000000000000000000000000000000000000000000000000000000
      00000006F6000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      0000000000000000000000000000000000000000000000000000000000009C6B
      6300F7EFE700FFF7E700FFEFDE00F7E7CE00E7D6BD00DECEB500004A00000894
      100000940800004A0000A58C6B00C6AD8400D6B58400DEB58400E7BD8400EFBD
      8400E7BD7B009C6B630000000000000000009E6E6400F4EAE100FBF2E600F8EB
      DC00F7E6D300F3E0CA0074868600045983003150650095606000AA6E6E00965D
      5D00643B3A0065524000766347008E745100A9895D00C09C690096695A000000
      0000000000000000000000000000000000000000000000000000E1BFAF00F8F0
      EE00FFFFFF00FFFFFF00E0A58800BD4A1A00BD4B1C00BC471600D17F5600FFFF
      FF00FFFFFF00CF784F00BC471800BF4E1E00BF4A1800C1755200C0B7B700B0A9
      AA00A99A9700CEAFA10000000000000000000000000000000000000000000000
      000000000000000000000005B7000005B7000005B7000005B700000000000000
      00000005B7000005B7000005B7000005B7000005B70000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A573
      6300F7EFEF00FFF7EF00FFEFE700E7DECE00C6B5A500AD9C8C00004A0000089C
      1800089C1000004A000094846B00A58C6B00A58C6B00BD9C7300DEB58400EFC6
      8C00E7BD84009C6B63000000000000000000A3726600F6EEE900FCF6ED00F8EE
      E300F7EADA00F7E6D300F0DECB000B4159008C5B5B00CC8E8E00BB7E7E00AA6E
      6E00965D5D00643B3A0064513E006F5D4300826C4B009A7E5500865D51000000
      00000000000000000000000000000000000000000000E1BCAC00F8EFEB00FFFF
      FF00FFFFFF00E7B79D00C5592600C4542400C0512200BC471600D3815900FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1E00BF491800C1724E00BDB5
      B500AFA7A900A6999700CEAFA100000000000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000005B7000005B7000005
      B7000005B7000005B7000005B7000005B7000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A573
      6B00FFF7F700FFFFF700FFF7EF00004A0000004A0000004A0000004A000010A5
      210008A51800004A0000004A0000004A0000004A0000A58C6B00D6B58400EFC6
      8C00EFBD84009C6B63000000000000000000A7756800F8F3F000FEFBF600FBF3
      EA00F8EEE300F8EBDC00F6E6D1004E6C76009C696900DC9D9D00CB8C8C00BA7D
      7D00A96D6D00915959005A35350062503D006A5841007B664800735046000000
      000000000000000000000000000000000000E0BAA900F4E9E200FFFFFF00FFFF
      FF00EECAB000CF703A00CB683300C9643000C65C2A00C04D1C00D4825A00FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1F00BF4E1E00BF471700C178
      5700BFB8BA00AFA6A500AA9A9700D8B5A5000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000006F6000005B7000005B700000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      6B00FFF7F700FFFFFF00FFFFF700004A000021C6420021C6420018BD390018B5
      310010AD290010A5210008A51800089C1000004A0000AD947300D6B58C00EFCE
      9400EFC68C00A57363000000000000000000AC796900FAF6F400FFFFFE00FDF8
      F300FBF2E900F8EEE300F8EBDA00F4E3D0007B504F00E2A4A400DC9D9D00CB8C
      8C00BA7D7D00A96D6D008C5757005A353500604F3D006C59410062443C000000
      000000000000000000000000000000000000E7CABC00FFFFFF00FFFFFF00FEFB
      F800DC935D00D47A4100D1774000CF703A00CC693500C5592600D78A6300FFFF
      FF00FFFFFF00D07A5200BC471800BF4E1F00BF4E1F00BF4E1F00BF4C1D00C050
      2100C6B0A700BFBABB00AFA6A500CBAFA4000000000000000000000000000000
      000000000000000000000000000000000000000000000005B7000005B7000005
      B7000006F6000005B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B57B
      6B00FFF7F700FFFFFF00FFFFFF00004A000029D6520029CE4A0021C6420018BD
      390018B5310010B5290010AD210010A52100004A0000BDA58400DEBD9400EFCE
      9C00EFC69400A57363000000000000000000B17E6B00FAF6F400FFFFFF00FFFE
      FB00FEF7F000FBF3EA00FAEEE300F8EAD900E1CCBB007B504F00E2A3A300DC9D
      9D00CA8B8B00B87B7B00A76C6C008B5656005A35350066523F00583F37000000
      000000000000000000000000000000000000E7C9BC00FFFFFF00FFFFFF00FEFB
      F800E2A06900DA894B00D8844A00D47D4400D1763F00CB673000DA926A00FFFF
      FF00FFFFFF00D17D5400BC471800BF4E1F00BF4E1F00BF4E1F00BD4A1A00C056
      2800D1C0BB00C9C6C700BDB6B600D3B5A9000000000000000000000000000000
      0000000000000000000000000000000000000005B7000005B7000006F6000005
      B7000005B7000006F6000006F600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B584
      6B00FFF7F700FFFFFF00FFFFFF00004A0000004A0000004A0000004A000021CE
      4A0021C64200004A0000004A0000004A0000004A0000E7C6A500EFCEA500F7CE
      A500EFCE9C009C7363000000000000000000B6816C00FAF6F400FFFFFF00FFFF
      FF00FFFCFB00FEF7F200FBF3EA00F8EEE300F8EBDC00E1CCBB0073484700E1A3
      A300DA9C9C00C98B8B00B87B7B00A76C6C008B5656005D383600533C35000000
      000000000000000000000000000000000000E0BAA900F6E9E300FFFFFF00FFFF
      FF00F4DCC200E19A5C00DD8F5200DA894F00D7824800D0723900E1A37B00FFFF
      FF00FFFFFF00D5875E00C04F1D00C0501F00BF4E1F00BD4B1C00BD4A1A00D4A0
      8800DCDDE000D1CFD000CFC0BC00E0BAA9000000000000000000000000000000
      00000000000000000000000000000005B7000005B7000006F6000005B7000006
      F6000006F6000006F6000005B7000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD84
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700004A000029D6
      5A0029CE5200004A0000AD9C8C00DECEB500F7DEBD00F7DEB500F7D6AD00EFD6
      A500CEB594008C6B63000000000000000000BB846E00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FEF7F200FBF3EA00FAEEE300F8EAD900BBA196007348
      4700E1A1A100DA9A9A00C98B8B00B77A7A00A66B6B008B5555005A3535000000
      00000000000000000000000000000000000000000000E1BCAC00F8EFEA00FFFF
      FF00FFFFFF00F4DCC000E29E5F00DE955600DA8E5100DC8E5600EEC6A900F4DE
      CE00F4DDCC00D7865800C75C2800C55A2800C0501F00BD4B1C00D89F8400E9ED
      F000E2E2E300DCCFCB00E0BBAB00000000000000000000000000000000000000
      000000000000000000000006F6000006F6000006F6000005B7000006F6000000
      0000000000000006F6000006F6000006F6000006F60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      6B00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A000031DE
      630031DE5A00004A0000C6B5A500E7D6BD00F7DEC600F7DEBD00E7CEAD00C6B5
      9400A5947B00846363000000000000000000C0896F00FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FEF7F200FBF2E900FAEEE300F8EBDA00BBA1
      960073484700E1A1A100D99A9A00C78A8A00B77A7A00A66B6B008B5555005A35
      3500000000000000000000000000000000000000000000000000E1BCAC00F6EB
      E500FFFFFF00FFFFFF00F7E2CA00E6A66700E19A5A00E0985C00DD905500D988
      4E00D5804700D0743C00CE6E3800CA653000C65C2800E0AF9700F2F7FB00EDEF
      F200E5D9D500E0BBAB0000000000000000000000000000000000000000000000
      0000000000000006F6000006F6000005B7000006F6000006F600000000000000
      000000000000000000000006F6000006F6000006F6000006F600000000000000
      000000000000000000000000000000000000000000000000000000000000C68C
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00004A0000004A
      0000004A0000004A0000E7DECE00F7E7CE00FFEFD600E7D6BD00BDAD9C00A59C
      8C00A5948400846B63000000000000000000C58C7000FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FDF8F300FBF3EA00F8EEE300F8EA
      D900BCA1960091606000EBAAAA00D9999900C78A8A00B6797900804E4E004148
      550035475600000000000000000000000000000000000000000000000000E0BB
      AB00F4E9E200FFFFFF00FFFFFF00F8E5CE00E9AC6D00E29D5B00E3A56D00F7E3
      D300F6DECE00DA8C5700D1763D00CF6F3700E7B79D00F8FEFF00F4F8FB00EDE2
      DE00E0BCAC000000000000000000000000000000000000000000000000000000
      00000006F6000006F6000006F6000006F6000006F60000000000000000000000
      0000000000000000000000000000000000000006F6000006F6000006F6000000
      000000000000000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFD6C6009C635A009C635A0094635A009463
      5A0094635A009C6B5A000000000000000000CB917300FAF6F400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FCF7F000FBF2E900FBF2
      E600ECD5C20084544C0091606000EBAAAA00D9999900534E5700028AC40000AA
      EA0000A6E6000087C40000000000000000000000000000000000000000000000
      0000E0BBAB00F4E9E300FFFFFF00FFFFFF00FAE9D300E9AB6700EFC99E00FFFF
      FF00FFFFFF00E7B28700D57D3F00E9BB9C00FEFFFF00FBFEFF00F0E9E600E1BF
      AF00000000000000000000000000000000000000000000000000000000000006
      F6000006F6000006F6000006F6000006F6000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F60000000000000000000000000000000000000000000000000000000000CE94
      7300FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFFFEF00DEC6B5009C635A00DEA56B00DE9C4A00E794
      3900EF8C2100A56B6B000000000000000000CF967400FBF7F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FCF7F000FFFA
      EF00DAC0B6009F675B00AA78560091606000C2898900097BAB0000BDFF0000BD
      FF0000A6E600001C9D0000008200000000000000000000000000000000000000
      000000000000E1BCAC00F4E7E100FFFFFF00FFFFFF00F8E6CE00EFC08600F7E0
      C200F6DABD00E3A06500EEC7A500FFFFFF00FEFFFF00F6EDE900E2C0B0000000
      00000000000000000000000000000000000000000000000000000006F6000006
      F6000006F6000006F6000006F600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000006
      F60000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700DEC6BD009C635A00EFB57300EFAD5200F7A5
      3100A56B6B00000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFCFB00FFFE
      F700DDC4BC009F675B00EAB47400B77D460073474700009FDE0000BDFF00008C
      D100001C9D00010D9D00010A9700000082000000000000000000000000000000
      00000000000000000000E0BAA900F3E5DE00FFFFFF00FFFFFF00FBEDD700F0C4
      8A00EBB77A00F4D8B800FFFFFF00FFFFFF00F7EEEA00E1BFAF00000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F6000006F6000006F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEC6C6009C635A00EFB57300EFA55200A56B
      6B0000000000000000000000000000000000D4987500FCF8F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDC7C2009F675B00EAB27300EFA751007A494A000093D10000B1F200012B
      A7000725DC000420B800021DB100010A97000000000000000000000000000000
      0000000000000000000000000000E0BAA900F3E5DE00FFFFFF00FFFFFF00FFFE
      FC00FEFBF800FFFFFF00FFFFFF00FAF3F000E2C0B00000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F6000006F6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D69C
      7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE009C635A00EFB57300A56B6B000000
      000000000000000000000000000000000000D4987500FFFFFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E2D0CE009F675B00EDB57200A5686B0000000000000000000084C1000C21
      BF002D4FF6000F2ECC00031EB10000058F000000000000000000000000000000
      000000000000000000000000000000000000E0BAA900F4E7E100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAF3F000E3C2B4000000000000000000000000000000
      000000000000000000000000000000000000000000000006F6000006F6000006
      F600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D694
      7300E7C6AD00E7C6B500E7C6B500E7C6B500E7C6B500E7C6AD00DEBDAD00DEBD
      AD00DEBDAD00D6B5AD00D6B5AD00C69C94009C635A00A56B6B00000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00A5686B00000000000000000000000000000000001624
      BF005270FC001839E30001099700000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0BAA900F2E0D700FEFC
      FC00FFFEFE00F7EEEA00E3C2B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001322BD00050DA50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1BCAB00E6C5
      B700E7C9BC00E1BCAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000080100000100010000000000600C00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C18183C18183C18183C18183A40025A4
      0025A40025A40025480012480012480012480012900009900009900009900009
      20A5042000042000042000044042024000024000024000020000000008000000
      000000008142818000018000018000011242400000010000000000000142A800
      00000000000000000F42D00000000000000000000742E0000000000000000000
      0742E00000000000000000000B42D00000000000000000001500280000000000
      000000000AFFC000000100000000000081000180000180000180000100410000
      1800000000000800400002400002400002400002208004200004200004200004
      900009900009900009900009480012480012480012480012A40025A40025A400
      25A40025C381C3C381C3C381C3C381C3FFF8FFFFFFFFFF80FFFDFF3FFF473FD0
      0005FFFFFFF700DFFF40E7D00005FF01FFEC003FFE8039D00005FF01FFD00017
      FF0007D00005FF01FFA0000BFD0000D00005FF01FF000005FA0000D00005FF01
      FF400002F80001D00005FF01FF800002F40002D00005FFFEFF800001F00000D0
      0005FF00FF000001E80005D00005FF01FF000001D0000BD00005FF80BF000001
      C00007D00005FF003F000001A00017D00005EFC00F00000100002FD00005E010
      0F00000140000FD00005E0080F80000180005FD00005F8080F8000008000BFD0
      0005F8000F0000028000BFD00005F8001F400001C0017FD00005F8000FA00007
      F802FFD00005FE000FD0000FC702FFD00005FF819FE80017FCF7FFD00005FC7C
      5FF4006FFF9BFFFFFFFFFF40BFFB83BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFE007FFF80FFFFFFFFDF80F9FC007FFE003FE000078E0031FC007F
      F8001FE00007C00003FC007FF0000FE0E787E00007F8003FF07607E06787F076
      07F8003FE0FF87E27FE7E07E07F8003FE17F03E7FFE7E03C03F0001FC3FFC3E7
      FFE7C31843F0001FC3FFC3E7FFE7C381C3F0001FC0F003E1E087C0C003E0000F
      C3FFE3E1E087C3C3E3E7FFCFC3FFC3E7FFE7C381C3E7FFCFE2FFA3E7FFE7E218
      A3C7FFC7E1FF83E7FFE7E03C03CFFFE7E0FF87E7FFE7E07E07CFFFE7707607E1
      E7877076078FF80378000FE1E7877000079FFFF3FC001FE00007E000039FFFE3
      FE003FE00007C60021800003FFC3FFFFFFFFCFC3F1FFFFFFFFFFFFFFFFFFFFFF
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FFFFFFFF
      FFFFF00007000000FFFFFFFFFFFFF00007000000FC003FFFFFFFF00007000000
      FC003FE81527F00007000000FC7F3FFFFAFFF00007000000FE3FFFE00007F000
      07000000FF1FFFE00007F00007000000FF8FFFFA5027F00007000000FFC7FFE0
      0027F00007000000FFE3FFFA4827F00007000000FFE3FFFA0027F00007000000
      FFC7FFFA2027F00007000000FF8FFFF80027F00007000000FF1FFFFA0027F000
      07000000FE3FFFFE0127F00007000000FC7FFFC00001F00007080000FCFF3FFE
      0527F00007000000FC003FC02001F00007000000FC003FC00001F00007000000
      FFFFFFFFAFF7F00007000000FFFFFFD05409F00007000000FFFFFFFFFFFF7000
      07000000FFFFFFFFFFFFFFFFFF000000FFF03FFF00FFFF00FF800003FF8007FC
      003FFC003F000000FC0000F0000FF0000F3FFCF9F80000E00007E00007222281
      F80000C00003C00003222291FC0000C00003C00003222281FE00008000018000
      013FFEF9FE0003800001800001222081FE00070000000000000AA891FE000F00
      0000000000222081FE001F0000000000003FFEF9FC007F000000000000222081
      F800FF0000000000000AA891F800FF000000000000222081F007FF0000000000
      003FFEFDF007FF000000000000000085F007FF8000018000013FFF95F01FFF80
      0001800001231981E01FFFC00003C000033FFFFDE07FFFC00003C00003000001
      C0FFFFE00007E000073FFFFDC0FFFFF0000FF0000F3FFFFDC1FFFFFC003FFC00
      3F000001C1FFFFFF00FFFF00FFFFFFFFFFFFFFFFFFFFE7FFFF00000080000101
      FFFF417FFF00000080000101FFFFC0FFFF00000080000101FFFF40FFFF000000
      800001010001C05FFF00000080000101FFFF802FFF00000080000101FFFFC000
      FF00000080000101FFFFE020FF000000800001FFFFFFF0003F00000080000101
      FFFFFE001700000080000101FFFFFA080B00000080000101FFFFFC000D000000
      800001010001FC000700000080000101FFFFF0000700000080000101FFFFF000
      0700000080000101FFFFF00007000000800001FFFFFFF0000700000080000101
      FFFFFC000F00000080000101FFFFF4000100000080000101FFFFFE000B000000
      800001010001FE001700000080000101FFFFFF003F000000FFFFFF01FFFFFE40
      5F000000FFFFFF01FFFF000000000000FFE3FFFFE3FFFFFFFFFFFDFFFF01FFFF
      01FFFFFF3FFFF9FFFC00FFFC00FF00001F00003FF0007FF0007F00000F00003F
      C0003FC0003F00000700000F80001F80001F000003000007C0000FC0000F0000
      01000003800007800007000003000003800003800003000007000001C00001C0
      000100000F000031E00000E0000000001F000039C00000F0000000003F000039
      800000F8000000003F00003D000001FC000100003F00003D000007FE00070000
      3F00003FE0001FFF001F00003F00003FF0007FE0001F00003F00003FF023FFF0
      003F00003F00003FF83FFFF8007F00003F00003FF83FFFFC00FF00003F00007F
      FC1FFFFE01FF00007F0000FFFE0FFFFF03FF0000FF0001FFFF03FFFF87FF0001
      FF0003FFFFC07FFFCFFF0003FF0007FFFFFFFFFFE7FFFFDFFFFFFFFFFFFFFFFF
      07FFFFCFFFC00007FFFFFFF807FFFFC7FFC00007FFFFFFE00003FFC3FFC00007
      FF7FFFE00003FFC3FFC00007FE3FFFE00003FFC3FFC00007FC1FFFE00003FFC3
      FFC00007F80FFFE00003FFC3FFC00007F007FFE00003FF81FFC00007E003FFE0
      0003FF00FFC00007C041FFE00003FE007FC00007C0E0FFE00003FC003FC00007
      C1F87FE00003F8001FC00007E3FC3FE00003F0000FC00007F7FE1FE00003E000
      07C00007FFFF8FE00003E00007C00007FFFFC7E00003E00007C00007FFFFF3E0
      0003F0001FC00007FFFFFDE00003F0001FC00007FFFFFFE00003F0003FC00007
      FFFFFFE00003F0007FC0000FFFFFFFF80003F000FFC0001FFFFFFFFF07FFF81B
      FFC0003FFFFFFFFFE7FFFE7FFFC0007FFFFFFFFFFFFFFFFFFFFFFFFFC00007FF
      FFFF800003C00007C00007FC79FF800003C00007C00007F8003F800003C00007
      C00007F00007800003C00007C00007E00000800003C00007C00007C000008000
      03C00007C00007800001800003C00007C00007800001800003C00007C0000780
      0001800003C00007C00007800001800003C00007C00007800001800003C00007
      C00007C00001800003C00007C00007F00003800003C00007C00007FC00078000
      03C00007C00007FC000F800003C00007C00007FC00FF800003C00007C00007F8
      01FF800003C00001C00007F801FF800003C00001C00007F801FF800003C00007
      C0000FF003FF800003C0000FC0001FE003FF800003C0001FC0003FE007FF8000
      03C0003FC0007FFE0FFFFFFFFFC0007FE00003FFFFFFFFC3FFFFFFFFE0000300
      001FFF81FFFFFFF9E0000300001FFF00FFFFFFF1E0000300001FFE007FC7FFE3
      E0000300001FFC003FC3FF87E0000300001FF8001FC1FF0FE0000300001FF000
      0FE0FE1FE0000300001FE00007F07C3FE0000300001FC00003FC307FE0000300
      001F800001FE00FFE0000300001F000000FF01FFE0000300001F000000FF83FF
      E0000300001F000000FF01FFE0000300001F000000FE00FFE0000300001F8000
      01FC187FE0000300000FC00003F83C3FE00003000007E00007F07F1FE0000300
      0003F0000FE0FF8FE00003000001F8001FC1FFEFE00007000000FC003F83FFFF
      E0000F000000FE007F87FFFFE0001F0000C0FF00FF8FFFFFE0003F0001E1FF81
      FFFFFFFFFFFFFFFFFFF3FFC3FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object StoredProc: TpFIBStoredProc
    Database = ClientDB
    Transaction = ClientTransWrite
    Left = 127
    Top = 380
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'MainToolBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 447
        FloatTop = 215
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnEdit
            Visible = True
          end
          item
            Item = btnDel
            Visible = True
          end
          item
            Item = btnSprav
            Visible = True
          end
          item
            Item = btnCalculator
            Visible = True
          end
          item
            Item = btnSelect
            Visible = True
          end
          item
            Item = btnClose
            Visible = True
          end>
        Name = 'MainToolBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        BorderStyle = bbsNone
        Caption = 'FilterToolBar'
        DockedDockingStyle = dsLeft
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsLeft
        FloatLeft = 541
        FloatTop = 381
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnFliter
            Visible = True
          end
          item
            Item = btnClear
            Visible = True
          end
          item
            Item = btnRedo
            Visible = True
          end
          item
            Item = btnUndo
            Visible = True
          end
          item
            Item = btnPredesign
            Visible = True
          end
          item
            Item = btnVodomer
            Visible = True
          end
          item
            Item = btnSum
            Visible = True
          end
          item
            Item = btnCnt
            Visible = True
          end
          item
            Item = btnClientComment
            Visible = True
          end>
        Name = 'FilterToolBar'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = ImageList
    LargeImages = ImageList
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 475
    Top = 380
    DockControlHeights = (
      34
      0
      46
      0)
    object btn: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object btnAdd: TdxBarLargeButton
      Action = ActIns
      Caption = #1053#1086#1074#1080#1081' '#1086#1089#1086#1073'. '#1088#1072#1093'.'
      Category = 0
      Hint = #1053#1086#1074#1080#1081' '#1086#1089#1086#1073'. '#1088#1072#1093'.'
      ImageIndex = 0
      AutoGrayScale = False
    end
    object btnEdit: TdxBarLargeButton
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
      Category = 0
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = MenuEditClient
      ImageIndex = 1
      AutoGrayScale = False
    end
    object btnDel: TdxBarLargeButton
      Action = ActDel
      Caption = #1047#1072#1082#1088#1080#1090#1080' '#1086#1089#1086#1073'.'#13#10' '#1088#1072#1093'.'
      Category = 0
      Hint = #1047#1072#1082#1088#1080#1090#1080' '#1086#1089#1086#1073'.'#13#10' '#1088#1072#1093'.'
      ImageIndex = 3
      AutoGrayScale = False
    end
    object btnRefresh: TdxBarLargeButton
      Action = ActSelect
      Category = 0
      Hint = #1054#1073#1088#1072#1090#1080
      ImageIndex = 4
      AutoGrayScale = False
    end
    object btnSprav: TdxBarLargeButton
      Caption = #1044#1086#1074#1110#1076#1082#1072
      Category = 0
      Hint = #1044#1086#1074#1110#1076#1082#1072
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = MenuSprav
      ImageIndex = 35
      AutoGrayScale = False
    end
    object btnClose: TdxBarLargeButton
      Action = ActClose
      Align = iaRight
      Category = 0
      ImageIndex = 9
      AutoGrayScale = False
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object btnFliter: TdxBarLargeButton
      Action = ActFilter
      Category = 0
      Hint = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080
      ImageIndex = 18
      AutoGrayScale = False
      ShowCaption = False
    end
    object btnClear: TdxBarLargeButton
      Action = ActClear
      Category = 0
      Hint = #1054#1095#1080#1089#1090#1080#1090#1080' '#1087#1086#1083#1103
      ImageIndex = 20
      AutoGrayScale = False
      ShowCaption = False
    end
    object btnRedo: TdxBarLargeButton
      Action = ActRedo
      Category = 0
      Enabled = False
      ImageIndex = 21
      AutoGrayScale = False
      ShowCaption = False
    end
    object btnUndo: TdxBarLargeButton
      Action = ActUndo
      Category = 0
      ImageIndex = 22
      AutoGrayScale = False
      ShowCaption = False
    end
    object btnPredesign: TdxBarLargeButton
      Category = 0
      Hint = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1072#1073#1086' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1086#1082
      Visible = ivAlways
      ImageIndex = 32
      OnClick = btnPredesignClick
      AutoGrayScale = False
      ShowCaption = False
    end
    object btnSum: TdxBarLargeButton
      Category = 0
      Visible = ivAlways
      ImageIndex = 24
      OnClick = btnSumClick
      ShowCaption = False
    end
    object btnCnt: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ImageIndex = 25
      OnClick = btnCntClick
      ShowCaption = False
    end
    object btnCalculator: TdxBarLargeButton
      Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
      Category = 0
      Hint = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
      Visible = ivAlways
      ImageIndex = 33
      OnClick = btnCalculatorClick
      AutoGrayScale = False
    end
    object btnLgot: TdxBarLargeButton
      Caption = #1055#1110#1083#1100#1075#1080
      Category = 0
      Hint = #1055#1110#1083#1100#1075#1080
      Visible = ivAlways
      ImageIndex = 27
      OnClick = btnLgotClick
      AutoGrayScale = False
    end
    object btnEditClient: TdxBarLargeButton
      Caption = #1055#1086#1089#1090#1110#1081#1085#1110' '#1079#1084#1110#1085#1080' '#1088#1077#1082#1074#1110#1079#1080#1090#1110#1074
      Category = 0
      Hint = #1055#1086#1089#1090#1110#1081#1085#1110' '#1079#1084#1110#1085#1080' '#1088#1077#1082#1074#1110#1079#1080#1090#1110#1074
      Visible = ivAlways
      ImageIndex = 1
      OnClick = btnEditClientClick
      AutoGrayScale = False
    end
    object btnTempEditClient: TdxBarLargeButton
      Caption = #1058#1080#1084#1095#1072#1089#1086#1074#1110' '#1079#1084#1110#1085#1080' '#1088#1077#1082#1074#1110#1079#1110#1090#1110#1074
      Category = 0
      Hint = #1058#1080#1084#1095#1072#1089#1086#1074#1110' '#1079#1084#1110#1085#1080' '#1088#1077#1082#1074#1110#1079#1110#1090#1110#1074
      Visible = ivAlways
      ImageIndex = 1
      OnClick = btnTempEditClientClick
      AutoGrayScale = False
    end
    object btnTempEditService: TdxBarLargeButton
      Caption = #1058#1080#1084#1095#1072#1089#1086#1074#1072' '#1079#1084#1110#1085#1072' '#1087#1086#1089#1083#1091#1075
      Category = 0
      Hint = #1058#1080#1084#1095#1072#1089#1086#1074#1072' '#1079#1084#1110#1085#1072' '#1087#1086#1089#1083#1091#1075
      Visible = ivAlways
      ImageIndex = 1
      OnClick = btnTempEditServiceClick
      AutoGrayScale = False
    end
    object btnEditService: TdxBarLargeButton
      Caption = #1055#1086#1089#1090#1110#1081#1085#1072' '#1079#1084#1110#1085#1072' '#1087#1086#1089#1083#1091#1075
      Category = 0
      Hint = #1055#1086#1089#1090#1110#1081#1085#1072' '#1079#1084#1110#1085#1072' '#1087#1086#1089#1083#1091#1075
      Visible = ivAlways
      ImageIndex = 1
      OnClick = btnEditServiceClick
    end
    object btnVodomer: TdxBarLargeButton
      Caption = 'U'
      Category = 0
      Hint = #1053#1077' '#1074#1080#1079#1085#1072#1095#1077#1085#1086
      Visible = ivAlways
      ImageIndex = 34
      AutoGrayScale = False
      ShowCaption = False
    end
    object btnNachislSprav: TdxBarLargeButton
      Caption = #1040#1085#1072#1083#1110#1079' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1093' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1110#1074
      Category = 0
      Hint = #1040#1085#1072#1083#1110#1079' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1093' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1110#1074
      Visible = ivAlways
      ImageIndex = 35
      OnClick = btnNachislSpravClick
    end
    object btnSelect: TdxBarLargeButton
      Caption = #1054#1073#1088#1072#1090#1080
      Category = 0
      Hint = #1054#1073#1088#1072#1090#1080
      Visible = ivAlways
      ImageIndex = 8
      OnClick = btnSelectClick
      AutoGrayScale = False
    end
    object btnClientComment: TdxBarLargeButton
      Caption = #1047#1072#1091#1074#1072#1078#1077#1085#1085#1103
      Category = 0
      Hint = #1047#1072#1091#1074#1072#1078#1077#1085#1085#1103
      Visible = ivAlways
      ImageIndex = 37
      OnClick = btnClientCommentClick
      ShowCaption = False
    end
  end
  object DomDS: TDataSource
    DataSet = DomDSet
    Left = 194
    Top = 186
  end
  object DomDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 164
    Top = 185
    poSQLINT64ToBCD = True
  end
  object TimeEnter: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimeEnterTimer
    Left = 160
    Top = 381
  end
  object FilterSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    OnEndScroll = FilterSetEndScroll
    Left = 455
    Top = 498
    poSQLINT64ToBCD = True
  end
  object FilterDS: TDataSource
    DataSet = FilterSet
    Left = 481
    Top = 498
  end
  object CityAreaDS: TDataSource
    DataSet = CityAreaDSet
    Left = 415
    Top = 58
  end
  object CityAreaDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 385
    Top = 57
    poSQLINT64ToBCD = True
  end
  object RegionDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 101
    Top = 59
    poSQLINT64ToBCD = True
  end
  object RegionDS: TDataSource
    DataSet = RegionDSet
    Left = 131
    Top = 60
  end
  object FamDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 188
    Top = 98
    poSQLINT64ToBCD = True
  end
  object FamSource: TDataSource
    DataSet = FamDSet
    Left = 213
    Top = 99
  end
  object ImyaSource: TDataSource
    DataSet = ImyaDSet
    Left = 176
    Top = 125
  end
  object PatrSource: TDataSource
    DataSet = PatrDSet
    Left = 257
    Top = 152
  end
  object ImyaDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 148
    Top = 126
    poSQLINT64ToBCD = True
  end
  object PatrDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 231
    Top = 153
    poSQLINT64ToBCD = True
  end
  object MenusSign: TPopupMenu
    Left = 507
    Top = 380
    object msEqual: TMenuItem
      Caption = '='
      OnClick = msEqualClick
    end
    object msLessEqual: TMenuItem
      Caption = '<='
      OnClick = msLessEqualClick
    end
    object msLess: TMenuItem
      Caption = '<'
      OnClick = msLessClick
    end
    object msMore: TMenuItem
      Caption = '>'
      OnClick = msMoreClick
    end
    object msEqualMore: TMenuItem
      Caption = '=>'
      OnClick = msEqualMoreClick
    end
    object msNotEqual: TMenuItem
      Caption = '<>'
      OnClick = msNotEqualClick
    end
  end
  object InginerDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 474
    Top = 247
    poSQLINT64ToBCD = True
  end
  object CustomServiceDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 496
    Top = 285
    poSQLINT64ToBCD = True
  end
  object InginerDS: TDataSource
    DataSet = InginerDSet
    Left = 505
    Top = 246
  end
  object CustomServiceDS: TDataSource
    DataSet = CustomServiceDSet
    Left = 525
    Top = 284
  end
  object BsConstDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 476
    Top = 419
    poSQLINT64ToBCD = True
  end
  object FlatStatusDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 250
    Top = 283
    poSQLINT64ToBCD = True
  end
  object ClientStatusDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 506
    Top = 210
    poSQLINT64ToBCD = True
  end
  object ClientStatusDS: TDataSource
    DataSet = ClientStatusDSet
    Left = 537
    Top = 210
  end
  object FlatStatusDS: TDataSource
    DataSet = FlatStatusDSet
    Left = 279
    Top = 284
  end
  object MenuEditClient: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = btnEditClient
        Visible = True
      end
      item
        Item = btnTempEditClient
        Visible = True
      end
      item
        Item = btnEditService
        Visible = True
      end
      item
        Item = btnTempEditService
        Visible = True
      end
      item
        Item = btnLgot
        Visible = True
      end>
    UseOwnFont = False
    Left = 195
    Top = 522
  end
  object TypeStreetDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 55
    Top = 202
    poSQLINT64ToBCD = True
  end
  object TypeStreetDS: TDataSource
    DataSet = TypeStreetDSet
    Left = 85
    Top = 206
  end
  object NormIntakeDS: TDataSource
    DataSet = NormIntakeDSet
    Left = 307
    Top = 329
  end
  object NormIntakeDSet: TpFIBDataSet
    Database = ClientDB
    Transaction = ClientTransRead
    UpdateTransaction = ClientTransWrite
    Left = 339
    Top = 329
    poSQLINT64ToBCD = True
  end
  object MenuSprav: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = btnNachislSprav
        Visible = True
      end>
    UseOwnFont = False
    Left = 227
    Top = 521
  end
end
