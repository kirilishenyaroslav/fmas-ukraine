object Arnd_Sch_Add_Form: TArnd_Sch_Add_Form
  Left = 493
  Top = 266
  Width = 651
  Height = 525
  Caption = #1042#1080#1089#1090#1072#1074#1083#1103#1085#1085#1103' '#1088#1072#1093#1091#1085#1082#1091' '#1079#1072' '#1086#1088#1077#1085#1076#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 489
    Align = alCustom
    TabOrder = 0
    object DogGroupBox: TcxGroupBox
      Left = 3
      Top = 8
      Width = 273
      Height = 177
      Alignment = alTopLeft
      Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1076#1086#1075#1086#1074#1110#1088':'
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 14
        Width = 52
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1110#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 9
        Top = 47
        Width = 75
        Height = 13
        Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082':'
      end
      object Label3: TLabel
        Left = 169
        Top = 17
        Width = 59
        Height = 13
        Caption = #1056#1077#1075'. '#1085#1086#1084#1077#1088':'
      end
      object Label4: TLabel
        Left = 9
        Top = 81
        Width = 21
        Height = 13
        Caption = #1056'/'#1088':'
      end
      object Label11: TLabel
        Left = 9
        Top = 117
        Width = 97
        Height = 13
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1076#1086#1075#1086#1074#1086#1088#1091':'
      end
      object Label21: TLabel
        Left = 169
        Top = 82
        Width = 31
        Height = 13
        Caption = #1052#1060#1054':'
      end
      object DogNameEdit: TcxButtonEdit
        Left = 9
        Top = 26
        Width = 144
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = DogNameEditPropertiesButtonClick
        Style.Color = clMoneyGreen
        TabOrder = 0
      end
      object NameCustEdit: TcxTextEdit
        Left = 9
        Top = 60
        Width = 256
        Height = 21
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        TabOrder = 2
      end
      object MFOEdit: TcxTextEdit
        Left = 168
        Top = 94
        Width = 97
        Height = 21
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        TabOrder = 3
      end
      object RateAccEdit: TcxTextEdit
        Left = 9
        Top = 94
        Width = 144
        Height = 21
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        TabOrder = 4
      end
      object NoteMemo: TcxMemo
        Left = 9
        Top = 130
        Width = 256
        Height = 41
        TabStop = False
        Properties.MaxLength = 0
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Style.Color = 14281696
        TabOrder = 5
        OnKeyDown = NoteMemoKeyDown
      end
      object RegNumEdit: TcxTextEdit
        Left = 168
        Top = 28
        Width = 97
        Height = 21
        TabStop = False
        Properties.ReadOnly = False
        Style.Color = clMoneyGreen
        TabOrder = 1
        OnKeyPress = RegNumEditKeyPress
      end
    end
    object MainPanel: TPanel
      Left = 3
      Top = 187
      Width = 629
      Height = 198
      BevelOuter = bvNone
      TabOrder = 1
      object SmetGrid: TcxGrid
        Left = 0
        Top = 2
        Width = 273
        Height = 194
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object SmetTableView: TcxGridBandedTableView
          OnKeyDown = SmetTableViewKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = S_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Sum_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = SmetTableViewFocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.BandMoving = False
          OptionsCustomize.BandSizing = False
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
          Styles.StyleSheet = cxGridBandedTableViewStyleSheet2
          Bands = <
            item
              Caption = #1042#1080#1089#1090#1072#1074#1083#1077#1085#1086' '#1079#1072' '#1087#1077#1088#1110#1086#1076':'
              Width = 77
            end>
          object S_Column: TcxGridBandedColumn
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 62
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object R_Column: TcxGridBandedColumn
            Caption = #1056#1086#1079#1076#1110#1083
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 59
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object St_Column: TcxGridBandedColumn
            Caption = #1057#1090#1072#1090#1090#1103
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 53
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object Kekv_Column: TcxGridBandedColumn
            Caption = #1050#1045#1050#1042
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 55
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object Sum_Column: TcxGridBandedColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            SortOrder = soAscending
            Width = 79
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object S_Name_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object R_Name_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object St_Name_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object id_S_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object id_R_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object id_St_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object id_Kekv_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object Kekv_Name_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object _id_fav: TcxGridBandedColumn
            Caption = 'id'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object _fav_cnt: TcxGridBandedColumn
            Caption = 'cnt'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object _tarif: TcxGridBandedColumn
            Caption = #1058#1072#1088#1080#1092
            Visible = False
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 47
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object _arnd_sum: TcxGridBandedColumn
            Caption = #1040#1088#1077#1085#1076#1072
            Visible = False
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 56
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object id_period: TcxGridBandedColumn
            Caption = #1055#1077#1088#1080#1086#1076
            Visible = False
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 71
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
        end
        object SmetGridLevel: TcxGridLevel
          GridView = SmetTableView
        end
      end
      object OldSGrid: TcxGrid
        Left = 272
        Top = 2
        Width = 356
        Height = 194
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object OldSTableView: TcxGridBandedTableView
          OnKeyDown = OldSTableViewKeyDown
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Old_S_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Old_Sum_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = OldSTableViewFocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.BandMoving = False
          OptionsCustomize.BandSizing = False
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
          Styles.Background = cxStyle33
          Styles.StyleSheet = cxGridBandedTableViewStyleSheet2
          Bands = <
            item
              Caption = #1055#1077#1088#1077#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1084#1080#1085#1091#1083#1080#1093' '#1087#1077#1088#1110#1086#1076#1110#1074':'
              Width = 77
            end>
          object Old_S_Column: TcxGridBandedColumn
            Caption = #1050#1086#1096#1090#1086#1088#1080#1089
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 45
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object Old_R_Column: TcxGridBandedColumn
            Caption = #1056#1086#1079#1076#1110#1083
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object Old_St_Column: TcxGridBandedColumn
            Caption = #1057#1090#1072#1090#1090#1103
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object Old_Kekv_Column: TcxGridBandedColumn
            Caption = #1050#1045#1050#1042
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 35
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object Old_Sum_Column: TcxGridBandedColumn
            Caption = #1057#1091#1084#1072
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 41
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object Old_S_Name_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object Old_R_Name_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object Old_St_Name_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object Old_id_S_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object Old_id_R_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object Old_id_St_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object Old_id_Kekv_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object Old_Kekv_Name_Column: TcxGridBandedColumn
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object id_fav: TcxGridBandedColumn
            Caption = 'ID'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object fav_cnt: TcxGridBandedColumn
            Caption = 'CNT'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object tarif: TcxGridBandedColumn
            Caption = 'Tf'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object arnd_sum: TcxGridBandedColumn
            Caption = 'As'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object DateB: TcxGridBandedColumn
            Caption = #1055#1086#1095#1072#1090#1086#1082
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 49
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object DateE: TcxGridBandedColumn
            Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 54
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object Id_recalc_per: TcxGridBandedColumn
            Caption = 'Sch'
            Visible = False
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 46
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
        end
        object OldSGridLevel: TcxGridLevel
          GridView = OldSTableView
        end
      end
    end
    object BottomPanel: TPanel
      Left = 3
      Top = 443
      Width = 630
      Height = 41
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object ApplyButton: TcxButton
        Left = 460
        Top = 9
        Width = 75
        Height = 25
        Caption = #1055#1088#1080#1081#1085#1103#1090#1080
        TabOrder = 1
        OnClick = ApplyButtonClick
        LookAndFeel.NativeStyle = False
      end
      object CancelButton: TcxButton
        Left = 540
        Top = 9
        Width = 77
        Height = 25
        Caption = #1057#1082#1072#1089#1091#1074#1072#1090#1080
        TabOrder = 2
        OnClick = CancelButtonClick
      end
      object DoCalcButton: TcxButton
        Left = 4
        Top = 9
        Width = 117
        Height = 25
        Caption = #1056#1086#1079#1088#1072#1093#1091#1074#1072#1090#1080
        TabOrder = 0
        OnClick = DoCalcButtonClick
      end
    end
    object SchGroupBox: TcxGroupBox
      Left = 275
      Top = 8
      Width = 355
      Height = 177
      Alignment = alTopLeft
      Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1088#1072#1093#1091#1085#1086#1082':'
      TabOrder = 3
      object Label6: TLabel
        Left = 12
        Top = 14
        Width = 64
        Height = 13
        Caption = #1058#1080#1087' '#1088#1072#1093#1091#1085#1082#1091':'
      end
      object Label7: TLabel
        Left = 244
        Top = 14
        Width = 37
        Height = 13
        Caption = #1053#1086#1084#1077#1088':'
      end
      object Label9: TLabel
        Left = 7
        Top = 119
        Width = 6
        Height = 13
        Caption = #1079
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 205
        Top = 118
        Width = 15
        Height = 13
        Caption = #1087#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 16
        Top = 138
        Width = 71
        Height = 13
        Caption = #1057#1091#1084#1072' '#1088#1072#1093#1091#1085#1082#1091':'
      end
      object Label13: TLabel
        Left = 240
        Top = 138
        Width = 93
        Height = 13
        Caption = #1059' '#1090#1086#1084#1091' '#1095#1080#1089#1083#1110' '#1055#1044#1042':'
      end
      object Label14: TLabel
        Left = 12
        Top = 47
        Width = 23
        Height = 13
        Caption = #1042#1110#1076':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TipDogEdit: TcxTextEdit
        Left = 11
        Top = 26
        Width = 166
        Height = 21
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        TabOrder = 0
      end
      object NumSchEdit: TcxTextEdit
        Left = 243
        Top = 26
        Width = 101
        Height = 21
        TabStop = False
        Properties.ReadOnly = True
        Style.Color = 14281696
        TabOrder = 1
      end
      object SumEdit: TcxTextEdit
        Left = 16
        Top = 150
        Width = 113
        Height = 21
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        Style.Color = 14281696
        TabOrder = 2
      end
      object NDSEdit: TcxTextEdit
        Left = 228
        Top = 150
        Width = 117
        Height = 21
        TabStop = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ReadOnly = True
        Style.Color = 14281696
        TabOrder = 3
      end
      object DateSchEdit: TcxDateEdit
        Left = 11
        Top = 60
        Width = 110
        Height = 21
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.Color = clMoneyGreen
        TabOrder = 4
      end
      object DateEndEdit: TcxDateEdit
        Left = 235
        Top = 116
        Width = 110
        Height = 21
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.Color = clMoneyGreen
        TabOrder = 5
      end
      object KindRadioGroup: TcxRadioGroup
        Left = 14
        Top = 80
        Width = 331
        Height = 32
        ItemIndex = 0
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = #1056#1072#1093#1091#1085#1086#1082' '#1079#1072' '#1087#1077#1088#1110#1086#1076
          end
          item
            Caption = #1058#1110#1083#1100#1082#1080' '#1087#1077#1088#1077#1088#1072#1093#1091#1074#1072#1090#1080
          end>
        Properties.OnChange = KindRadioGroupPropertiesChange
        TabOrder = 6
        Caption = #1056#1086#1079#1088#1072#1093#1091#1074#1072#1090#1080':'
      end
      object DateBegEdit: TcxTextEdit
        Left = 16
        Top = 116
        Width = 113
        Height = 21
        Properties.ReadOnly = True
        Style.Color = 14281696
        TabOrder = 7
      end
      object cxButton1: TcxButton
        Left = 245
        Top = 56
        Width = 99
        Height = 25
        Caption = #1044#1086#1075#1086#1074#1110#1088
        TabOrder = 8
        OnClick = cxButton1Click
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000094CE000094CE000094CE00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000094CE0010B5E70000C6F70000B5EF000094CE000094
          CE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000094CE0031BDE70039D6F70021D6FF0000C6F70000BDEF0000AD
          DE000094CE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000094CE0052C6E7006BDEF70063DEFF0039CEF70021CEF70008C6F70000BD
          F70000ADE7000094CE000094CE00FF00FF00FF00FF00FF00FF00FF00FF000094
          CE006BCEE70094DEF7009CEFFF006BDEF7005AD6F70042CEF70029CEF70010CE
          FF0000C6F70000B5EF0000A5DE000094CE000094CE00FF00FF000094CE0084CE
          EF00B5E7F700D6FFFF009CE7F70084DEF7007BDEF70063D6F7004AD6F70039CE
          F70021CEF70008C6F70000BDEF0000ADE700009CD6000094CE000094CE00B5E7
          F700FFFFFF00FFFFFF00D6F7FF00A5E7F7008CDEF7007BDEF7006BDEF70052D6
          F70042CEF70029CEF70010C6F70000BDF70000B5EF000094CE000094CE00EFFF
          FF0052BDDE007BCEE700EFFFFF00F7FFFF00C6F7FF009CE7F70084DEF70073DE
          F70063D6F7004AD6F70031CEF70018D6FF000094CE00FF00FF000094CE00A5DE
          EF0029A5D600008CC60029A5D6009CDEEF00F7FFFF00E7FFFF00B5EFFF008CDE
          F70073DEF70063D6F70063DEFF000094CE00FF00FF00FF00FF00FF00FF000094
          CE006BCEE70084CEE700219CCE00008CC60039ADD600ADE7F700EFFFFF00DEFF
          FF00A5E7FF00A5EFFF000094CE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000094CE009CDEEF0073C6E700189CCE000094C6004AB5DE00ADE7
          F700E7FFFF000094CE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000094CE00A5DEEF007BCEE7000894CE0063BD
          DE000094CE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000094CE00B5E7F700B5E7F7000094
          CE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000094CE00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        UseSystemPaint = False
      end
    end
    object Panel2: TPanel
      Left = 313
      Top = 384
      Width = 320
      Height = 58
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 4
      object Label18: TLabel
        Left = 9
        Top = 2
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
      object Label19: TLabel
        Left = 26
        Top = 14
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
      object Label20: TLabel
        Left = 25
        Top = 26
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
      object St_Label2: TLabel
        Left = 64
        Top = 26
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'St_Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object R_Label2: TLabel
        Left = 64
        Top = 14
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'R_Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object S_Label2: TLabel
        Left = 64
        Top = 2
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'S_Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label8: TLabel
        Left = 31
        Top = 40
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
      object Kekv_Label2: TLabel
        Left = 65
        Top = 40
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'KEKV_Label2'
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
    object Panel3: TPanel
      Left = 3
      Top = 384
      Width = 310
      Height = 58
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 5
      object Label15: TLabel
        Left = 9
        Top = 2
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
      object Label16: TLabel
        Left = 26
        Top = 14
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
      object Label17: TLabel
        Left = 25
        Top = 26
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
      object St_Label1: TLabel
        Left = 64
        Top = 26
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'St_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object R_Label1: TLabel
        Left = 64
        Top = 14
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'R_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object S_Label1: TLabel
        Left = 64
        Top = 2
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'S_Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label5: TLabel
        Left = 31
        Top = 40
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
      object KEKV_Label1: TLabel
        Left = 65
        Top = 40
        Width = 225
        Height = 13
        AutoSize = False
        Caption = 'KEKV_Label1'
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
  object DataSet: TpFIBDataSet
    Left = 496
    Top = 396
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Left = 528
    Top = 396
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 264
    Top = 256
    object cxStyle29: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle69: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle70: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMoneyGreen
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14084566
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clYellow
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clGradientInactiveCaption
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle29
      Styles.Content = cxStyle33
      Styles.Inactive = cxStyle37
      Styles.Selection = cxStyle41
      Styles.BandBackground = cxStyle30
      Styles.BandHeader = cxStyle31
      Styles.ColumnHeader = cxStyle32
      Styles.ContentEven = cxStyle34
      Styles.ContentOdd = cxStyle35
      Styles.Footer = cxStyle36
      Styles.IncSearch = cxStyle38
      Styles.Indicator = cxStyle39
      Styles.Preview = cxStyle40
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle29
      Styles.Content = cxStyle33
      Styles.ContentEven = cxStyle34
      Styles.ContentOdd = cxStyle35
      Styles.Inactive = cxStyle37
      Styles.IncSearch = cxStyle38
      Styles.Selection = cxStyle41
      Styles.FilterBox = cxStyle32
      Styles.Footer = cxStyle36
      Styles.Group = cxStyle42
      Styles.GroupByBox = cxStyle32
      Styles.Header = cxStyle32
      Styles.Indicator = cxStyle39
      Styles.Preview = cxStyle40
      BuiltIn = True
    end
    object cxGridBandedTableViewStyleSheet2: TcxGridBandedTableViewStyleSheet
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
  object ActionList1: TActionList
    Left = 560
    Top = 397
    object save: TAction
      Caption = 'save'
      ShortCut = 121
      OnExecute = saveExecute
    end
    object calc: TAction
      Caption = 'calc'
      ShortCut = 117
      OnExecute = calcExecute
    end
    object Cancel: TAction
      Caption = 'Cancel'
      ShortCut = 27
      OnExecute = CancelExecute
    end
  end
  object StPrc: TpFIBStoredProc
    Left = 528
    Top = 364
  end
  object DataSetPeriods: TpFIBDataSet
    Left = 496
    Top = 364
    poSQLINT64ToBCD = True
  end
end
