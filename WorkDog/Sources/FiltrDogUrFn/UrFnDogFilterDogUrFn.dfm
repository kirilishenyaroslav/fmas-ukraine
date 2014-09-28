object UrFnDogForm: TUrFnDogForm
  Left = 412
  Top = 143
  Width = 847
  Height = 802
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1076#1086#1075#1086#1074#1086#1088#1091
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 831
    Height = 97
    Align = alTop
    TabOrder = 0
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 829
      Height = 24
      Align = alTop
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1076#1086#1075#1086#1074#1086#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 25
      Width = 829
      Height = 71
      Align = alClient
      Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1076#1086#1075#1086#1074#1110#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        829
        71)
      object Label1: TLabel
        Left = 16
        Top = 48
        Width = 121
        Height = 16
        Caption = #1085#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 24
        Width = 86
        Height = 16
        Caption = #1082#1086#1085#1090#1088#1072#1075#1077#1085#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 488
        Top = 48
        Width = 111
        Height = 16
        Caption = #1089#1091#1084#1072' '#1076#1086#1075#1086#1074#1086#1088#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 232
        Top = 48
        Width = 23
        Height = 16
        Caption = #1074#1110#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ContragentDBLabel: TcxDBLabel
        Left = 112
        Top = 24
        Width = 361
        Height = 17
        DataBinding.DataField = 'NAME_CUSTOMER'
        DataBinding.DataSource = FiltrDogUrFnDM.DSourceDog
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
      end
      object SUMMA_DOG_DBLabel: TcxDBLabel
        Left = 600
        Top = 48
        Width = 145
        Height = 17
        DataBinding.DataField = 'SUMMA_DOG'
        DataBinding.DataSource = FiltrDogUrFnDM.DSourceDog
        AutoSize = False
        ParentFont = False
        Properties.Orientation = cxoLeft
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 1
      end
      object N_DOG_DBLabel: TcxDBLabel
        Left = 136
        Top = 48
        Width = 97
        Height = 17
        DataBinding.DataField = 'N_DOG'
        DataBinding.DataSource = FiltrDogUrFnDM.DSourceDog
        Anchors = [akTop, akRight]
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 2
      end
      object DateDogDBLabel: TcxDBLabel
        Left = 256
        Top = 48
        Width = 107
        Height = 17
        DataBinding.DataField = 'D_DOG'
        DataBinding.DataSource = FiltrDogUrFnDM.DSourceDog
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -12
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 831
    Height = 200
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 1
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 829
      Height = 24
      Align = alTop
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1102#1088' '#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cxGridUrOb: TcxGrid
      Left = 1
      Top = 25
      Width = 829
      Height = 174
      Align = alClient
      TabOrder = 1
      object cxGridUrObDBTableView1: TcxGridDBTableView
        DataController.DataSource = FiltrDogUrFnDM.DSourceUrOb
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'#39#39';-,0.00'#39#39
            Kind = skSum
            FieldName = 'summa'
            Column = cxGridUrObDBTableView1DB_summa
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGridUrObDBTableView1DB_number_urzb: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1102#1088'.'#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 199
          DataBinding.FieldName = 'number_urzb'
        end
        object cxGridUrObDBTableView1DB_date_urzb: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1102#1088'.'#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 260
          DataBinding.FieldName = 'date_urzb'
        end
        object cxGridUrObDBTableView1DB_ID_KEKV_NUM: TcxGridDBColumn
          Caption = #1050#1045#1050#1042
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 128
          DataBinding.FieldName = 'ID_KEKV_NUM'
        end
        object cxGridUrObDBTableView1DB_summa: TcxGridDBColumn
          Caption = #1057#1091#1084#1072' '#1102#1088'. '#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 240
          DataBinding.FieldName = 'summa'
        end
      end
      object cxGridUrObLevel1: TcxGridLevel
        GridView = cxGridUrObDBTableView1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 297
    Width = 831
    Height = 200
    Align = alTop
    Caption = 'Panel3'
    TabOrder = 2
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 829
      Height = 24
      Align = alTop
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1092#1110#1085'. '#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cxGridFnOb: TcxGrid
      Left = 1
      Top = 25
      Width = 829
      Height = 174
      Align = alClient
      TabOrder = 1
      object cxGridFnObDBTableView1: TcxGridDBTableView
        DataController.DataSource = FiltrDogUrFnDM.DSourceFnOb
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'#39#39';-,0.00'#39#39
            Kind = skSum
            FieldName = 'summa'
            Column = cxGridFnObDBTableView1DB_summa
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGridFnObDBTableView1DB_number_fnzb: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1092#1110#1085'. '#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 198
          DataBinding.FieldName = 'number_fnzb'
        end
        object cxGridFnObDBTableView1DB_date_fnzb: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1092#1110#1085'. '#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 266
          DataBinding.FieldName = 'date_fnzb'
        end
        object cxGridFnObDBTableView1DB_ID_KEKV_NUM: TcxGridDBColumn
          Caption = #1050#1045#1050#1042
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 127
          DataBinding.FieldName = 'ID_KEKV_NUM'
        end
        object cxGridFnObDBTableView1DB_summa: TcxGridDBColumn
          Caption = #1057#1091#1084#1072' '#1092#1110#1085'. '#1079#1086#1073#1086#1074'`'#1103#1079#1072#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 236
          DataBinding.FieldName = 'summa'
        end
      end
      object cxGridFnObLevel1: TcxGridLevel
        GridView = cxGridFnObDBTableView1
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 497
    Width = 831
    Height = 267
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 3
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 829
      Height = 24
      Align = alTop
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1086#1087#1083#1072#1090#1080' '#1076#1086#1075#1086#1074#1086#1088#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cxGridPlat: TcxGrid
      Left = 1
      Top = 25
      Width = 829
      Height = 241
      Align = alClient
      TabOrder = 1
      object cxGridPlatDBTableView1: TcxGridDBTableView
        DataController.DataSource = FiltrDogUrFnDM.DSourcePlat
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = ',0.00'#39#39';-,0.00'#39#39
            Kind = skSum
            Position = spFooter
            FieldName = 'summa_kekv'
            Column = cxGridPlatDBTableView1DB_summa_kekv
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00'#39#39';-,0.00'#39#39
            Kind = skSum
            FieldName = 'summa_doc'
            Column = cxGridPlatDBTableView1DB_summa_doc
          end
          item
            Format = ',0.00'#39#39';-,0.00'#39#39
            Kind = skSum
            FieldName = 'summa_kekv'
            Column = cxGridPlatDBTableView1DB_summa_kekv
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderAutoHeight = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGridPlatDBTableView1DB_KEKV: TcxGridDBColumn
          Caption = #1050#1045#1050#1042
          Visible = False
          GroupIndex = 0
          Options.Filtering = False
          SortOrder = soDescending
          DataBinding.FieldName = 'KEKV_KODE'
        end
        object cxGridPlatDBTableView1DB_is_in_all_prov: TcxGridDBColumn
          Caption = #1055#1083#1072#1090#1110#1078' '#1087#1088#1086#1074#1077#1076#1077#1085' '#1087#1086' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1110#1111
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 149
          DataBinding.FieldName = 'is_in_all_prov'
        end
        object cxGridPlatDBTableView1DB_num_pl: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 201
          DataBinding.FieldName = 'num_pl'
        end
        object cxGridPlatDBTableView1DB_date_pl: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1085#1103
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 143
          DataBinding.FieldName = 'date_pl'
        end
        object cxGridPlatDBTableView1DB_summa_doc: TcxGridDBColumn
          Caption = #1057#1091#1084#1072' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1085#1103
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 151
          DataBinding.FieldName = 'summa_doc'
        end
        object cxGridPlatDBTableView1DB_summa_kekv: TcxGridDBColumn
          Caption = #1089#1091#1084#1072' '#1087#1086' '#1050#1045#1050#1042
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 166
          DataBinding.FieldName = 'summa_kekv'
        end
      end
      object cxGridPlatLevel1: TcxGridLevel
        GridView = cxGridPlatDBTableView1
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 776
    Top = 152
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
end
