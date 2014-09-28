object jo9_ostatki_Form: Tjo9_ostatki_Form
  Left = 339
  Top = 433
  Width = 803
  Height = 468
  Caption = #1056#1077#1108#1089#1090#1088' '#1079#1072#1083#1080#1096#1082#1110#1074
  Color = 16247513
  Constraints.MinHeight = 352
  Constraints.MinWidth = 710
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 287
    Width = 787
    Height = 143
    Align = alBottom
    BevelOuter = bvNone
    Color = 16247513
    TabOrder = 0
    DesignSize = (
      787
      143)
    object Label5: TLabel
      Left = 8
      Top = 30
      Width = 48
      Height = 13
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072':'
    end
    object Label6: TLabel
      Left = 7
      Top = -2
      Width = 89
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1091#1093#1091' '#1082#1086#1096#1090#1110#1074':'
    end
    object cxGroupBox1: TcxGroupBox
      Left = 8
      Top = 93
      Width = 713
      Height = 50
      Alignment = alTopLeft
      Caption = #1054#1089#1090#1072#1085#1085#1110' '#1079#1084#1110#1085#1080' '#1073#1091#1083#1080' '#1079#1088#1086#1073#1083#1077#1085#1110':'
      CaptionBkColor = 16247513
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 4
      object Label2: TLabel
        Left = 24
        Top = 12
        Width = 61
        Height = 13
        Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095':'
      end
      object Label3: TLabel
        Left = 320
        Top = 13
        Width = 54
        Height = 13
        Caption = #1044#1072#1090#1072' '#1110' '#1095#1072#1089':'
      end
      object Label1: TLabel
        Left = 472
        Top = 13
        Width = 57
        Height = 13
        Caption = #1050#1086#1084#1087#39#1102#1090#1077#1088':'
      end
      object UserEdit: TcxTextEdit
        Left = 23
        Top = 25
        Width = 282
        Height = 21
        TabStop = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = 14281696
        TabOrder = 0
      end
      object ChangesEdit: TcxTextEdit
        Left = 320
        Top = 26
        Width = 145
        Height = 21
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = 14281696
        TabOrder = 1
      end
      object CompEdit: TcxTextEdit
        Left = 472
        Top = 26
        Width = 217
        Height = 21
        TabStop = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = 14281696
        TabOrder = 2
      end
    end
    object NoteMemo: TcxMemo
      Left = 8
      Top = 41
      Width = 265
      Height = 53
      TabStop = False
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Properties.ScrollBars = ssVertical
      Style.Color = 14281696
      TabOrder = 0
    end
    object DateEdit: TcxTextEdit
      Left = 7
      Top = 11
      Width = 129
      Height = 21
      TabStop = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = 14281696
      TabOrder = 1
    end
    object VGrid: TcxGrid
      Left = 276
      Top = 3
      Width = 516
      Height = 91
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 2
      object VTableView: TcxGridDBTableView
        OnDblClick = VTableViewDblClick
        OnKeyPress = VTableViewKeyPress
        DataController.DataSource = VDataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = Reg_Num_Column
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = VSumma_Column
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = VTableViewFocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ScrollBars = ssVertical
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheet
        object Reg_Num_Column: TcxGridDBColumn
          Caption = #1056#1077#1108#1089#1090#1088'. '#8470
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 75
          DataBinding.FieldName = 'REG_NUM'
        end
        object Sch_Num_Column: TcxGridDBColumn
          Caption = #1056#1072#1093#1091#1085#1086#1082
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 57
          DataBinding.FieldName = 'NUM_SCH'
        end
        object Kod_S_Column: TcxGridDBColumn
          Caption = #1050#1086#1096#1090#1086#1088#1080#1089
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 71
          DataBinding.FieldName = 'KOD_S'
        end
        object Kod_R_Column: TcxGridDBColumn
          Caption = #1056#1086#1079#1076#1110#1083
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 56
          DataBinding.FieldName = 'KOD_R'
        end
        object Kod_St_Column: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1090#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 54
          DataBinding.FieldName = 'KOD_ST'
        end
        object Kod_Kekv_Column: TcxGridDBColumn
          Caption = #1050#1045#1050#1042
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Width = 52
          DataBinding.FieldName = 'KOD_KEKV'
        end
        object VSumma_Column: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 76
          DataBinding.FieldName = 'SUMMA'
        end
        object Name_Sch_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_SCH'
        end
        object Name_S_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_S'
        end
        object Name_R_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_R'
        end
        object Name_St_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_ST'
        end
        object id_Kekv_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'ID_KEKV'
        end
        object Name_Kekv_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_KEKV'
        end
      end
      object VGridLevel: TcxGridLevel
        GridView = VTableView
      end
    end
    object HintPanel: TcxGroupBox
      Left = 280
      Top = 10
      Width = 385
      Height = 81
      Alignment = alTopLeft
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103':'
      CaptionBkColor = 16247513
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      TabOrder = 3
      Visible = False
      object St_Label: TLabel
        Left = 72
        Top = 52
        Width = 305
        Height = 13
        AutoSize = False
        Caption = 'St_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 25
        Top = 52
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
      object Label16: TLabel
        Left = 26
        Top = 40
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
      object R_Label: TLabel
        Left = 72
        Top = 40
        Width = 305
        Height = 13
        AutoSize = False
        Caption = 'R_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object S_Label: TLabel
        Left = 72
        Top = 28
        Width = 305
        Height = 13
        AutoSize = False
        Caption = 'S_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 9
        Top = 28
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
      object Label4: TLabel
        Left = 18
        Top = 15
        Width = 44
        Height = 13
        Caption = #1056#1072#1093#1091#1085#1086#1082':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Sch_Label: TLabel
        Left = 72
        Top = 15
        Width = 51
        Height = 13
        Caption = 'Sch_Label'
      end
      object Label7: TLabel
        Left = 31
        Top = 65
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
      object Kekv_Label: TLabel
        Left = 72
        Top = 65
        Width = 307
        Height = 13
        AutoSize = False
        Caption = 'Kekv_Label'
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
  end
  object Splitter: TcxSplitter
    Left = 0
    Top = 279
    Width = 787
    Height = 8
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 60
    AlignSplitter = salBottom
    AutoSnap = True
    ResizeUpdate = True
    Control = BottomPanel
  end
  object MainPanel: TPanel
    Left = 0
    Top = 46
    Width = 787
    Height = 233
    Align = alClient
    BevelOuter = bvNone
    Color = 16247513
    TabOrder = 6
    object Grid: TcxGrid
      Left = 0
      Top = 33
      Width = 787
      Height = 200
      Align = alClient
      TabOrder = 0
      object TableView: TcxGridDBTableView
        OnDblClick = TableViewDblClick
        OnKeyDown = TableViewKeyDown
        OnKeyPress = TableViewKeyPress
        DataController.DataSource = DataSource
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = TableViewHAND_ADD
          end
          item
            Format = '#,##0.00'
            Kind = skSum
            Column = TableViewSUMMA1
          end
          item
            Format = '#,##0.00'
            Kind = skSum
            Column = TableViewSUMMA2
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = TableViewCustomDrawCell
        OnFocusedRecordChanged = TableViewFocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheet
        object TableViewHAND_ADD: TcxGridDBColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.GlyphCount = 1
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          HeaderGlyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000794141733F3F763F3F
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000914747844A4A5C636300000085
            4D4DBC8B8B7F4C4C784343624343733B3B713939773B3B000000000000000000
            000000000000000000000000000000000000000000000000713636804C4C8D5A
            5A814A4A7F4B4B956262E6C7C7AB7E7E774242703B3BC28E8EAE7C7C713A3A00
            0000000000000000000000000000000000000000000000000000000000000000
            8D5656AF8888D5B4B4A47070C49090EDC0C0DEC0C0D4B0B0B07D7DD3A2A2E3BC
            BCCBA4A4743D3D00000000000000000000000000000000000000000000000000
            0000000000000000935959A77C7CEBD3D3E4CBCBE2C5C5E1C6C6E3C8C8E4CACA
            E3C8C8DBBABADDBABAA57979744040782F2F9400000000000000000000000000
            000000000000000000000000009B6060905F5F895555CFAFAFE5CCCCE1C6C6E3
            C9C9E2C6C6E0C4C4E0C4C4E4CDCDE0C0C0B588888A55558C5B5B7A4646000000
            000000000000000000000000000000000000000000936060AF7A7AA26B6BE3CC
            CCE1C5C5E7D0D0E6CDCDD6B0B0DBB2B2E1C0C0DFC0C0E6CDCDD9B7B7D3A7A7EB
            C1C1804C4C7D4747000000000000000000000000000000000000000000A47474
            F3DEDEECD8D8E3CACAE6D1D1EBD7D7AD7C7CC28B8BD9A4A4DAA5A5E0BEBEDFC2
            C2E2C5C5DFBDBDD9B6B6855353803E3E00000000000000000000000000000000
            0000000000A97B7BE9D7D7F3E5E5E1C3C3EDDDDDDEC7C78F5757000000000000
            D19A9AD6AEAEE1C4C4E4C8C8BC94947E4A4A8249490000000000000000000000
            00000000000000000000000000AB7575A36C6CBB9191E6CECEEBD8D8F0E1E185
            50508B5555A06767AB7777DDC0C0E2C6C6E3C6C6B68B8B834F4F875454000000
            000000000000000000000000000000000000000000000000B78181B17D7DF3E8
            E8DEBEBEF2E5E5E5D0D0BF9696C9A1A1E6CECEE6CFCFE2C5C5E2C5C5DFC1C1B1
            8484835050713B3B7039397C3D3D000000000000000000000000000000000000
            BD8383F8EEEEF8F0F0EBD8D8E0C2C2F0E2E2F1E1E1EDDCDCEAD5D5E2C7C7E2C5
            C5D1B2B2DDBFBFAB7F7F784646916464A06F6F733C3C00000000000000000000
            0000000000000000C28888DFC9C9D7B8B8D1AFAFEAD8D8E0C1C1E0C2C2E0C2C2
            DFC1C1E5CBCBB389899660608E5858956161A36E6ED9B6B6DFBBBB713B3B7540
            40753B3B6A3C3C000000000000000000D19999C99191C68E8EBB8686C79D9DF7
            EEEEE2CBCBCCAAAAD9BEBEEFDDDDB48989D4B2B2DCC0C0E2BCBCE4C5C5E1C6C6
            DFBFBFAD7F7FB380809B68686D38380000000000000000000000000000000000
            00CF9595CA9F9FF0E2E2B68080B77C7CA97575CDABABA47373AB8181ECD7D7E6
            CECEE8D2D2E4CBCBE6D0D0E2C6C6DFBBBBCCA4A4703B3B000000000000000000
            000000000000000000AB7171D39A9AC89090D09797000000C58B8B9F6A6AA36D
            6DCDA9A9E7D1D1E7D1D1C79898D5A2A2E3B4B4E3CACADFBEBE7F4B4B73414100
            0000000000000000000000000000000000000000000000000000000000000000
            000000A97171F8E1E1F1E2E2E4CACAD1B4B4A56D6DB57A7AD29E9EE1C5C5E4C5
            C5814C4C7F4B4B00000000000000000000000000000000000000000000000000
            0000000000000000000000AF7777DAC3C3F0E4E4E2C6C6DFCACAA26C6CBA8686
            DCBABADFC1C1E1C2C2C198987F4C4C0000000000000000000000000000000000
            00000000000000000000000000000000000000C08787AC7575B78888F0DFDFE1
            C2C2EEDCDCEED9D9E2C4C4DCBDBDD3B0B0B58B8B824F4F000000000000000000
            000000000000000000000000000000000000000000000000000000000000C48A
            8AC39797FBF6F6ECDBDBDFC0C0DEBDBDE3C7C7A471719A6363985F5F995C5C00
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000DA9B9BC69898D7B7B7B98484B27E7ED3B3B3E2C9C9A86E6E0000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000D19A9AC39090C17E7E9A7F7FB07B7B
            A57373AD77770000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          HeaderGlyphAlignmentHorz = taCenter
          MinWidth = 31
          Options.HorzSizing = False
          Width = 31
          DataBinding.FieldName = 'HAND_ADD'
          IsCaptionAssigned = True
        end
        object TableViewKREDIT: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'KREDIT'
        end
        object TableViewKOD_SYS: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'KOD_SYS'
        end
        object TableViewDATE_REG: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'DATE_REG'
        end
        object TableViewID_OST_DOC: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'ID_OST_DOC'
        end
        object TableViewID_CUSTOMER: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'ID_CUSTOMER'
        end
        object TableViewNAME_SYS: TcxGridDBColumn
          Caption = #1057#1080#1089#1090#1077#1084#1072
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 68
          DataBinding.FieldName = 'NAME_SYS'
        end
        object TableViewNUM_DOC: TcxGridDBColumn
          Caption = #1047#1074#1110#1090#1085#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 79
          DataBinding.FieldName = 'NUM_DOC'
        end
        object TableViewDATE_DOC: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.MaxLength = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 71
          DataBinding.FieldName = 'DATE_DOC'
        end
        object TableViewOPL_DATE: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1089#1088#1077#1076#1089#1090#1074
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'OPL_DATE'
        end
        object TableViewSUMMA1: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00 '#1075#1088#1085#39'.'#39';-,0.00 '#1075#1088#1085#39'.'#39
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 83
          DataBinding.FieldName = 'SUMMA_1'
        end
        object TableViewSUMMA2: TcxGridDBColumn
          Caption = #1057#1091#1084#1072' '#1050#1088
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Properties.DisplayFormat = ',0.00 '#1075#1088#1085#39'.'#39';-,0.00 '#1075#1088#1085#39'.'#39
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 89
          DataBinding.FieldName = 'SUMMA_2'
        end
        object TableViewNOTE: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'NOTE'
        end
        object TableViewID_SERVER: TcxGridDBColumn
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          DataBinding.FieldName = 'ID_SERVER'
        end
        object TableViewNAME_CUSTOMER: TcxGridDBColumn
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 299
          DataBinding.FieldName = 'NAME_CUSTOMER'
        end
        object TableViewNAME_USER: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'NAME_USER'
        end
        object TableViewSYS_DATETIME: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'SYS_DATETIME'
        end
        object TableViewCOMPUTER: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'COMPUTER'
        end
      end
      object GridLevel: TcxGridLevel
        GridView = TableView
      end
    end
    object RadioGroup: TcxRadioGroup
      Left = 0
      Top = 0
      Width = 787
      Height = 33
      Align = alTop
      ItemIndex = 0
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = #1059#1089#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1080' '#1091' '#1079#1072#1083#1080#1096#1082#1072#1093
        end
        item
          Caption = #1044#1077#1073#1077#1090#1086#1074#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1080' '#1091' '#1079#1072#1083#1080#1096#1082#1072#1093
        end
        item
          Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1080' '#1091' '#1079#1072#1083#1080#1096#1082#1072#1093
        end>
      Properties.OnChange = RadioGroupPropertiesChange
      TabOrder = 1
      Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080':'
    end
  end
  object BarManager: TdxBarManager
    AllowReset = False
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
        Caption = 'Main'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 274
        FloatTop = 270
        FloatClientWidth = 378
        FloatClientHeight = 80
        ItemLinks = <
          item
            Item = AddButton
            Visible = True
          end
          item
            Item = EditButton
            Visible = True
          end
          item
            Item = DelButton
            Visible = True
          end
          item
            Item = ViewButton
            Visible = True
          end
          item
            Item = PrintButton
            Visible = True
          end
          item
            Item = RefreshButton
            Visible = True
          end
          item
            Item = CloseButton
            Visible = True
          end
          item
            Item = dxBarStatic1
            Visible = True
          end
          item
            Item = MonthCombo
            Visible = True
          end
          item
            Item = YearCombo
            Visible = True
          end>
        Name = 'Main'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
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
    Style = bmsOffice11
    UseSystemFont = True
    Left = 392
    Top = 9
    DockControlHeights = (
      0
      0
      46
      0)
    object AddButton: TdxBarLargeButton
      Caption = #1044#1086#1076#1072#1090#1080
      Category = 0
      Hint = #1044#1086#1076#1072#1090#1080
      Visible = ivAlways
      OnClick = AddButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
        00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0CE9EEFCB97
        EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF
        7F9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1F0
        D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7F
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7
        C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC189EABF82E9
        BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7F2D4B0F0D1AAEFCEA3EECB9CEDC7
        95EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBDF2D8B7F2D5B1
        EACCA6DDBF97D7B78DD6B387DBB685E5BC86E9BF82E9BD7FE9BD7FEABF7FE7BC
        7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
        DEC5F3DCBFF2D8B8DEC4A4BAA284A89172A78E6EB89B75DBB685EBC189E9BD81
        E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
        DAFAEEDEF7E7D4F6E2CBF4E0C5F3DCBF004B00004B00004B00004B00A78E6ED6
        B387EDC58FEBC189E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
        FF00FF9E6E64F4EAE1FBF2E6F8EADCF1E1CEE4D1BDDCCAB3004B000895110690
        0E004B00A18B6FC4A881D6B387D9B684E5BC85EABF82E7BB7E9F6F60FF00FFFF
        00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3E5D9CAC0B3A4AD9F8F
        004B000C9D190A9814004B0096826AA18B6EA78E6EB89B74D9B583EBC288E7BC
        809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EB00
        4B00004B00004B00004B0011A6240EA11D004B00004B00004B00004B00A68E6E
        D6B386EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
        F4FFFFFEFEF8F3004B0025C74720C1401CBA3818B23014AC2911A5220DA01C0A
        9A17004B00A89172D7B78DEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
        FF00FFB17E6BFAF6F4FFFFFFFFFEFB004B002CD35528CC4D23C5451FBF3E1BB7
        3517B02E13AB2710A520004B00BAA283DDBF95EECB9CEBC592A07264FF00FFFF
        00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFF004B00004B00004B00
        004B0027CB4B22C443004B00004B00004B00004B00E0C4A2EACCA5F0CFA3EDC9
        999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
        FFFFFFFEFBFEF7F2004B002DD45829CF52004B00AD9F8EDEC8B1F3DABCF2D8B6
        F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
        F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFB004B0034DE6530D95E004B00C0B3A4E4
        D1BCF6DEC4F3DCBDE5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
        FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF004B00004B00004B
        00004B00E6D9C9F2E2CFFAE9D0E0D0BAB8AB9AA79C8BA49786846964FF00FFFF
        00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B95655B96655B9665
        5B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16B
        DD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FCF8
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DD
        C4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD39570E6C2ACE7C6B0E7C6B0E6
        C4B0E3C2B0E1C0AFDEBDADDCBCACD8BAACD5B7ABD3B5ABC099909F675BA5686B
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object RefreshButton: TdxBarLargeButton
      Caption = #1042#1110#1076#1085#1086#1074#1080#1090#1080
      Category = 0
      Hint = #1042#1110#1076#1085#1086#1074#1080#1090#1080
      Visible = ivAlways
      OnClick = RefreshButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000017000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000FF00FFFF00FF92635D8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598050
        4BFF00FFFF00FF000000FF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0
        CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080
        EDC180EABF7F80504BFF00FFFF00FF000000FF00FFFF00FF93655FEED4B8F4DA
        BBF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9
        BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF
        93655FEED7C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC1
        89EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FF00
        0000FF00FFFF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7007000F0D1AAEFCEA3
        B1B874007000007000007000ADAD60E9BD7FE9BD7FE9BD7FEABF7FE7BC7E8050
        4BFF00FFFF00FF000000FF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBD00
        7000047503B2BD7F007000B1B874EDC796B0B46B007000ADAF62E9BD7FE9BD7F
        EABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF956660F2E2D3FAEA
        D7F6E3CEF4DEC5007000007000007000B2BD7FEFCEA3EECB9DEDC797B0B46B00
        7000E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FF000000FF00FFFF00FF
        986963F2E6DAFAEEDEF7E7D4F6E2CB007000007000007000007000F0D1A9EFCE
        A3EECB9DEDC796007000EBC189E9BD81EABF7FE7BC7E80504BFF00FFFF00FF00
        0000FF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3007000007000007000
        007000007000F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E8050
        4BFF00FFFF00FF000000FF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7
        E6D3F6E2CCF4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48E
        EBC288E7BC8080504BFF00FFFF00FF000000FF00FFFF00FFA77568F8F3F0FEFB
        F6FBF3EBF8EEE3F8EBDCF7E7D3F6E2CCF4E0C500700000700000700000700000
        7000EDCB9CEDC795EDC58FE9BF8780504BFF00FFFF00FF000000FF00FFFF00FF
        AC7969FAF6F4FFFFFEFEF8F3FBF2EA007000F8EBDAF7E6D3F7E2CCF6E0C50070
        00007000007000007000EFCEA3EECB9CEEC996EAC18E80504BFF00FFFF00FF00
        0000FF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0007000BAD4AAF8EADA
        F7E7D3F6E2CBB7C792007000007000007000F0D1A9EFCEA1EECB9CEBC5928050
        4BFF00FFFF00FF000000FF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBBC
        DAB4007000B8D3AAF8EBDCB7CC9D007000B7C792047503007000F2D4AFF0D1A9
        F0CFA3EDC99980504BFF00FFFF00FF000000FF00FFFF00FFBB846EFAF6F4FFFF
        FFFFFFFFFFFFFFFFFEFBBCDAB4007000007000007000B7CC9DF6E2CBF6DEC400
        7000F2D8B6F0D4AFEFD0A7CEB49180504BFF00FFFF00FF000000FF00FFFF00FF
        C0896FFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EB
        DAF7E6D3F6E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F80504BFF00FFFF00FF00
        0000FF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
        FCF8F2FBF3EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA497868050
        4BFF00FFFF00FF000000FF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C4A0675BA0675BA0675B
        A0675BA0675BA0675BFF00FFFF00FF000000FF00FFFF00FFCF9674FBF7F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B6A0
        675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FF000000FF00FFFF00FF
        D49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
        FBFFFEF7DDC4BCA0675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FF00
        0000FF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDC7C2A0675BEAB273EFA751A5686BFF00FFFF00
        FFFF00FFFF00FF000000FF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CEA0675BEDB572A5686B
        FF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FFCF8E68CF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68A0
        675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000}
    end
    object CloseButton: TdxBarLargeButton
      Caption = #1042#1080#1093#1110#1076
      Category = 0
      Hint = #1042#1080#1093#1110#1076
      Visible = ivAlways
      OnClick = CloseButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E
        1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B
        8C4B4B914B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B89
        4B4B9C4B4CB64B4CBD4B4C9F4B4C4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B
        4B9A4D4EAF4E4FC14E4FC04D4EBF4C4DBF4C4D9F4B4C4E1E1F994B4B824B4B82
        4B4B824B4B824B4B824B4B824B4B824B4B824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BC55455C95455C75354C65253C55152C45051C24F50A04C4D4E1E
        1FFE8B8CFC9293FB9A9CFAA3A4F8AAABF7B1B1F7B5B6F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BCE5859CC5758CB5657CA5556C95455C75354
        C65253A34E4F4E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD15B5CD05A5BCF595ACE
        5859CC5758CB5657CA5556A550504E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BD55E
        5FD55E5FD45D5ED35C5DD15B5CD05A5BCF595AA651524E1E1F3F9E4C1EBC4C1E
        BC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BDA6364D96263D86062D75F60D55E5FD45D5ED35C5DA953544E1E
        1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BDE6667DD6566DC6465DA6364D96263D86062
        D75F60AB55554E1E1F3F9E4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4C1EBC4CF7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE2696AE16869E06768DE
        6667E06D6EE69091DC6465AC56574E1E1F58A55B1EBC4C1EBC4C1EBC4C1EBC4C
        1EBC4C1EBC4CF7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BE76D
        6EE66C6DE56B6CE36A6BEEA6A7FFFFFFEB9C9CAF58594E1E1FEECEAFB7EBAA5E
        D3775ED37745CA6745CA6745CA67F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BEB7072EA6F70E96E6FE76D6EF2A9AAFFFFFFEB9596B15A5A4E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3D9F6BDD9F6BDF7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BEF7475EE7374ED7273EB7072EA6F70EF9091
        E76D6EB25B5C4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF37778F37778F27677F0
        7576EF7475EE7374ED7273B55D5D4E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF87B
        7DF77A7BF6797AF47879F37778F27677F07576B75F5F4E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4BFC7F80FB7E7FFA7D7EF87B7DF77A7BF6797AF47879B860624E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FE8081FC7F80FC7F80FB7E7F
        FA7D7EBB63634E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5
        B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BFF8182FF8182FF8182FF
        8182FF8182FE8081FE8081BD65654E1E1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3
        FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FFFF00FF824B4BF77E
        7FFF8182FF8182FF8182FF8182FF8182FF8182BF66664E1E1FEECEAFFFFFD3FF
        FFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF00FFFF00FFFF00FF
        FF00FF824B4B824B4BAF5E5FD56F70FF8182FF8182FF8182FF8182BF66664E1E
        1FEECEAFFFFFD3FFFFD3FFFFD3FFFFD3FFFFD3FFFFD3F7B5B6824B4BFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4B915152B66263EE7A7B
        FF8182BF66664E1E1F914B4B824B4B824B4B824B4B824B4B824B4B824B4B824B
        4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF824B4B824B4B9855559F58584E1E1FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ViewButton: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1075#1083#1103#1076
      Category = 0
      Hint = #1055#1077#1088#1077#1075#1083#1103#1076
      Visible = ivAlways
      OnClick = ViewButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D59
        8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
        5980504BFF00FFFF00FFFF00FFFF00FF646365314B62AC7D7EF6DAB6F3D5ADF2
        D1A5F0CE9EEFCB97EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080
        EBC080EDC180EABF7F80504BFF00FFFF00FFFF00FFFF00FF5084B20F6FE1325F
        8CB87E7AF2D5B1F0D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9
        BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
        32A0FE37A1FF106FE2325F8BB67D79F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC5
        8FEBC189EABF82E9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79F2D4B0F0D1AA
        EFCEA3EECB9CEDC795EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC
        7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF93656037A4FE359EFF0F6FDE35
        608BA67B7FF2D5B1F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9BF82E9BD7F
        E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2
        D338A5FE329DFF156DCE444F5BDAB8A0925D5A986660935E5B9A6663B88A74D7
        AB82EBC189E9BD81E9BD7FEABF7FE7BC7E80504BFF00FFFF00FFFF00FFFF00FF
        FF00FF986963F2E6DAFAEEDE3BABFFA1CAE78F6D6B96665FC2A38CE9DCB7FBF8
        CBE7DCB6BF9A899D6B66CB9E7BEBC189E9BD81EABF7FE7BC7E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FF9E6E64F4EAE1FBF2E6F8EADCB49291A06D66EDD4A4
        FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAE3D3CC96635FD5AB82EBC188EABF82E7BB
        7E80504BFF00FFFF00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3A1
        6C67C79F81F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFFFAFFFFFFB79387B88A73
        EBC48EEBC288E7BC8080504BFF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3
        F0FEFBF6FBF3EB9D6A64E7C28EEEB87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFF
        FFE6DCCEAD996560EDC795EDC58FE9BF8780504BFF00FFFF00FFFF00FFFF00FF
        FF00FFAC7969FAF6F4FFFFFEFEF8F3935F5BF7D495EAA76CF7DAA3FFFFCEFFFF
        D4FFFFE1FFFFE3FFFFD7F6F2C9935E5BEECB9CEEC996EAC18E80504BFF00FFFF
        00FFFF00FFFF00FFFF00FFB17E6BFAF6F4FFFFFFFFFEFB9E6B65E9C793EAA96A
        EFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1E1D1B0996660EFCEA1EECB9CEBC5
        9280504BFF00FFFF00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFA4
        706BCBA989F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8C6FFFFCFBB9984BB8F7E
        F0D1A9F0CFA3EDC99980504BFF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6
        F4FFFFFFFFFFFFE5D5D5A07068EDE3E2FFF4E2EFBD80EBAB6FF0C086FBDEA3EB
        D9A9986760DAB89FF0D4AFEFD0A7CEB49180504BFF00FFFF00FFFF00FFFF00FF
        FF00FFC0896FFBF7F4FFFFFFFFFFFFFFFFFFD7C0BF9E6F6BC6A999EAD19EFADA
        9CE9C793C59D829D6A64D0AC9CF3DCBDE5CEAFC4B096A1927F80504BFF00FFFF
        00FFFF00FFFF00FFFF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFE5D5D5
        A4766A9A6862935F5B9E6A64BD988FE0C4B5FAE9D0E0D0BAB8AB9AA79C8BA497
        8680504BFF00FFFF00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B
        95655B96655B96655B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDA
        C0B69F675BDAA16BDD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FF
        FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFCFBFFFEF7DDC4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572
        A5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCF8E68CF8E
        68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E689F675BA5686BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object MonthCombo: TdxBarCombo
      Align = iaRight
      Caption = #1052#1110#1089#1103#1094#1100
      Category = 0
      Hint = #1052#1110#1089#1103#1094#1100
      Visible = ivAlways
      OnChange = MonthComboChange
      Width = 100
      ShowEditor = False
      ItemIndex = -1
    end
    object dxBarStatic1: TdxBarStatic
      Align = iaRight
      Caption = #1060#1110#1083#1100#1090#1088':'
      Category = 0
      Hint = #1060#1110#1083#1100#1090#1088':'
      Visible = ivAlways
      Alignment = taRightJustify
      Width = 90
    end
    object YearCombo: TdxBarCombo
      Align = iaRight
      Caption = #1056#1110#1082
      Category = 0
      Hint = #1056#1110#1082
      Visible = ivAlways
      OnChange = YearComboChange
      Width = 100
      ShowEditor = False
      ItemIndex = -1
    end
    object EditButton: TdxBarLargeButton
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Category = 0
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Visible = ivAlways
      OnClick = EditButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF93655EA46769A46769A46769A46769A46769A46769A46769A46769A46769
        A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF00
        FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1EDCEA7E6C79DE1C093DE
        BB8CE1BB88E5BC84E7BC81E7BC7EE9BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E
        9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7C0F4DEC0F0D8B7E9CC
        ABD9BD99C9AD89C1A57FC6A67ED1AF7FDAB47FE1B77DE3BA7DE7BC7EE9BD7FE9
        BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEFDAC5
        F6E1C6F0D9BCE6CEAF2221233E39358C79609D8767AA8F6BB89A6FC7A474D1AB
        75DEB579E5BB7DE7BC7EEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF
        00FF936560F0DECCF7E5CEF4DEC5EAD4B63C38351F1F21182A33344344836F56
        8E77599E835FB29268C7A36FD9B176E3BA7DE7BC7EE7BC7E9F6F60FF00FFFF00
        FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF0DAC2AC9D8A113B4E04
        689A064F750C3C523A494877644C897253A4865FBC9969D1AB73E1B779E3BA7B
        9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6DAFAEEDEF7E7D4F4E1
        CAEBD8BD1A3E4D036A9D0567981B506E2A34404135386A55427E694C987D58B2
        9163CCA66EDAB1779D6D5FFF00FFFF00FFFF00FFFF00FFFF00FF9E6E64F4EAE1
        FBF2E6F8EADCF7E6D3F3E0CA748686045983315065956060AA6E6E965D5D643B
        3A6552407663478E7451A9895DC09C6996695AFF00FFFF00FFFF00FFFF00FFFF
        00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7E6D3F0DDC90B41598C5B5BCC8E8E
        BB7E7EAA6E6E965C5C643B3A64513E6F5D43826C4B9A7E55865D51FF00FFFF00
        FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EBF8EEE3F8EBDCF6E6D14E
        6C769C6969DD9D9DCB8C8CBA7D7DA96D6D9159595A353462503D6A58417B6648
        735046FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6F4FFFFFEFEF8F3FBF2
        EAF8EEE3F8EBDAF4E3D07B504FE2A4A4DC9D9DCA8C8CBA7D7DA96D6D8C57575A
        3534604F3D6C594162443CFF00FFFF00FFFF00FFFF00FFFF00FFB17E6BFAF6F4
        FFFFFFFFFEFBFEF7F0FBF3EAFAEFE3F8EADAE1CCBB7B504FE2A3A3DC9C9CCA8B
        8BB87B7BA76C6C8C56565A353566523F583F37FF00FFFF00FFFF00FFFF00FFFF
        00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBFEF7F2FBF3EBF8EEE3F8EBDCE1CCBB
        734847E1A3A3DA9C9CC98B8BB87B7BA76C6C8B56565D3836533C35FF00FFFF00
        FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FB
        F3EAFAEEE3F8EADABBA196734847E1A1A1DA9A9AC98A8AB77A7AA66B6B8B5555
        5A3535FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7F4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EBDABBA196734847E0A1A1D99A9AC7
        8A8AB77A7AA66B6B8A55555B3535FF00FFFF00FFFF00FFFF00FFC58C70FBF7F4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFCF8F2FBF3EAF8EEE2F8EAD9BCA1
        96916060EBAAAAD99999C78989B67979804E4E414855354756FF00FFFF00FFFF
        00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFCF7F0
        FBF2E9FBF2E5E9D3C484544C916060EAAAAAD89999534E57028AC400AAEA00A6
        E60087C4FF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BAA7856906060C28989097BAB
        00BDFF00BDFF00A6E6001C9D000082FF00FFD49875FCF8F6FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DDC4BC9F675BEAB474B7
        7D46734747009FDE00BDFF008CD1001C9D010D9D010A97000082D49875FCF8F6
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC7
        C29F675BEAB273EFA7517A494A0093D100B1F2012BA70725DC0420B8021DB101
        0A97D49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00FF0084C10C21BF2D4F
        F60F2ECC031EB100058FCF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68CF8E68CF8E68CF8E689F675BA5686BFF00FFFF00FFFF00FF
        FF00FF1624BF5270FC1839E3010997FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF1322BD050DA5FF00FFFF00FF}
    end
    object DelButton: TdxBarLargeButton
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Category = 0
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080
      Visible = ivAlways
      OnClick = DelButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object PrintButton: TdxBarLargeButton
      Caption = #1047#1074#1110#1090
      Category = 0
      Hint = #1047#1074#1110#1090
      Visible = ivNever
      OnClick = PrintButtonClick
      AutoGrayScale = False
      LargeGlyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
        6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
        6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
        BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
        6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
        C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
        7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
        A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
        C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
        2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
        CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
        A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
        00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
        EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
        6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
        F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
        B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
        F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
        C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
        6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
        B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
        00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
        6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
        B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
        D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
        CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
        82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
        8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
        FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
        E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
        ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
        FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
        F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 512
    Top = 178
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
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
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
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle28: TcxStyle
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
    object GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet
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
      Styles.BandBackground = cxStyle15
      Styles.BandHeader = cxStyle23
      BuiltIn = True
    end
  end
  object Database: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=win1251')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 126
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 96
    Top = 126
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 128
    Top = 126
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 488
    Top = 120
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 556
    Top = 120
    poSQLINT64ToBCD = True
  end
  object Query: TpFIBQuery
    Database = Database
    Transaction = ReadTransaction
    Left = 24
    Top = 126
  end
  object VDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'select * from JO9_DT_OST_SMET_SEL(1, '#39'01.02.2005'#39')')
    Left = 560
    Top = 360
    poSQLINT64ToBCD = True
  end
  object VDataSource: TDataSource
    DataSet = VDataSet
    Left = 528
    Top = 360
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 48
    Top = 176
  end
  object ActionList1: TActionList
    Left = 320
    Top = 144
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 27
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 16464
      OnExecute = Action2Execute
    end
  end
  object DataSet_Rep: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 320
    Top = 200
    poSQLINT64ToBCD = True
  end
  object Report: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38615.874150925930000000
    ReportOptions.LastChange = 38615.874150925930000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 248
    Top = 180
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object RowDataSet: TfrxUserDataSet
    UserName = 'RowDataSet'
    Left = 184
    Top = 180
  end
end
