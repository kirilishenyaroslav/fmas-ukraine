object fmManHospControl: TfmManHospControl
  Left = 575
  Top = 191
  Width = 547
  Height = 572
  Caption = 'fmManHospControl'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object HospPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 531
    Height = 497
    ActivePage = FirstPage
    Align = alTop
    TabOrder = 0
    object FirstPage: TTabSheet
      Caption = 'FirstPage'
      object GroupBoxList: TcxGroupBox
        Left = 0
        Top = 8
        Width = 521
        Height = 113
        Alignment = alTopLeft
        Caption = #1051#1080#1089#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object LabelSeria: TcxLabel
          Left = 8
          Top = 24
          Width = 49
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = #1057#1077#1088#1110#1103
        end
        object LabelList: TcxLabel
          Left = 8
          Top = 56
          Width = 41
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
          Caption = #1051#1080#1089#1090
        end
        object LabelNomer: TcxLabel
          Left = 219
          Top = 24
          Width = 73
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 2
          Caption = #1053#1086#1084#1077#1088':'
        end
        object LabelCont: TcxLabel
          Left = 219
          Top = 56
          Width = 161
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 3
          Caption = #1055#1088#1086#1076#1086#1074#1078#1077#1085#1085#1080#1103' '#1083#1080#1089#1090#1072' '#8470
        end
        object SeriaEdit: TcxTextEdit
          Left = 60
          Top = 22
          Width = 121
          Height = 21
          ParentFont = False
          Style.Color = clWindow
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
          OnKeyPress = SeriaEditKeyPress
        end
        object NomerEdit: TcxTextEdit
          Left = 376
          Top = 22
          Width = 121
          Height = 21
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 5
          OnKeyPress = SeriaEditKeyPress
        end
        object ListComboBox: TcxComboBox
          Left = 60
          Top = 55
          Width = 121
          Height = 21
          ParentFont = False
          Properties.Items.Strings = (
            '1 - '#1087#1077#1088#1074#1080#1085#1085#1080#1081
            '2 - '#1087#1088#1086#1076#1086#1074#1078#1077#1085#1085#1103)
          Properties.OnChange = ListComboBoxPropertiesChange
          Properties.OnNewLookupDisplayText = ListComboBoxPropertiesNewLookupDisplayText
          Properties.OnPopup = ListComboBoxPropertiesPopup
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 6
          OnKeyPress = IllTypeBoxKeyPress
        end
        object ParentButtonEdit: TcxButtonEdit
          Left = 376
          Top = 55
          Width = 121
          Height = 21
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = ParentButtonEditPropertiesButtonClick
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 7
        end
        object LabelFormHosp: TcxLabel
          Left = 8
          Top = 88
          Width = 201
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 8
          Caption = #1060#1086#1088#1084#1072' '#1083#1080#1089#1090#1072' '#1085#1077#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1086#1089#1090#1110
        end
        object ComboBoxFormHosp: TcxComboBox
          Left = 220
          Top = 84
          Width = 277
          Height = 21
          ParentFont = False
          Properties.Items.Strings = (
            #1057#1090#1072#1088#1072' '#1092#1086#1088#1084#1072
            #1053#1086#1074#1072' '#1092#1086#1088#1084#1072' ('#1079' 11.2004)')
          Properties.OnChange = ComboBoxFormHospPropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 9
          OnKeyPress = IllTypeBoxKeyPress
        end
      end
      object GroupBoxIllness: TcxGroupBox
        Left = 0
        Top = 131
        Width = 521
        Height = 126
        Alignment = alTopLeft
        Caption = #1047#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object cxLabel1: TcxLabel
          Left = 8
          Top = 24
          Width = 145
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = #1064#1080#1092#1088' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
        end
        object KodEdit: TcxTextEdit
          Left = 159
          Top = 22
          Width = 121
          Height = 21
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
          OnKeyPress = SeriaEditKeyPress
        end
        object cxLabel2: TcxLabel
          Left = 8
          Top = 56
          Width = 137
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 2
          Caption = #1058#1080#1087' '#1079#1072#1093#1074#1086#1088#1102#1074#1072#1085#1085#1103
        end
        object cxLabel3: TcxLabel
          Left = 8
          Top = 88
          Width = 145
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 3
          Caption = #1047#1072#1082#1083#1102#1095#1085#1110' '#1074#1080#1089#1085#1086#1074#1082#1080
        end
        object EndingBox: TcxComboBox
          Left = 159
          Top = 88
          Width = 338
          Height = 21
          ParentFont = False
          Properties.Items.Strings = (
            '1 - '#1087#1088#1072#1094#1077#1079#1076#1072#1090#1085#1080#1081
            '2 - '#1087#1088#1086#1076#1086#1074#1078#1091#1108' '#1093#1074#1086#1088#1110#1090#1080
            '3 - '#1074#1080#1079#1085#1072#1085#1080#1081' '#1110#1085#1074#1072#1083#1110#1076#1086#1084' 3'#1075#1088'.'
            '4 - '#1074#1080#1079#1085#1072#1085#1080#1081' '#1110#1085#1074#1072#1083#1110#1076#1086#1084' 2'#1075#1088'.'
            '5 - '#1074#1080#1079#1085#1072#1085#1080#1081' '#1110#1085#1074#1072#1083#1110#1076#1086#1084' 1'#1075#1088'.'
            '6 - '#1089#1084#1077#1088#1090#1100)
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
          OnKeyPress = IllTypeBoxKeyPress
        end
        object IllTypeBox: TcxLookupComboBox
          Left = 160
          Top = 52
          Width = 337
          Height = 21
          ParentFont = False
          Properties.DropDownRows = 10
          Properties.ListColumns = <>
          Properties.ListOptions.ShowHeader = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 5
          OnEnter = IllTypeBoxEnter
          OnKeyPress = IllTypeBoxKeyPress
        end
      end
      object GroupBoxPay: TcxGroupBox
        Left = 0
        Top = 336
        Width = 521
        Height = 89
        Alignment = alTopLeft
        Caption = #1054#1087#1083#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object cxLabel4: TcxLabel
          Left = 8
          Top = 24
          Width = 121
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = #1055#1088#1086#1094#1077#1085#1090' '#1076#1086' '#1086#1087#1083#1072#1090#1080
        end
        object PercentBox: TcxComboBox
          Left = 159
          Top = 24
          Width = 106
          Height = 21
          ParentFont = False
          Properties.Items.Strings = (
            '0'
            '60'
            '80'
            '100')
          Properties.OnChange = PercentBoxPropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
          OnKeyPress = IllTypeBoxKeyPress
        end
        object cxLabel5: TcxLabel
          Left = 8
          Top = 56
          Width = 113
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 2
          Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1080
        end
        object VoplComboBox: TcxLookupComboBox
          Left = 159
          Top = 56
          Width = 337
          Height = 21
          ParentFont = False
          Properties.DropDownRows = 12
          Properties.ListColumns = <>
          Properties.ListOptions.ShowHeader = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 3
          OnEnter = VoplComboBoxEnter
          OnKeyPress = IllTypeBoxKeyPress
        end
      end
      object GroupBoxPeriod: TcxGroupBox
        Left = 2
        Top = 259
        Width = 521
        Height = 73
        Alignment = alTopLeft
        Caption = #1055#1077#1088#1110#1086#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object DateBegEdit: TcxDateEdit
          Left = 102
          Top = 36
          Width = 121
          Height = 21
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          OnEnter = DateBegEditEnter
          OnExit = DateBegEditExit
        end
        object DateBegLabel: TcxLabel
          Left = 4
          Top = 38
          Width = 93
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
        end
        object DateEndEdit: TcxDateEdit
          Left = 363
          Top = 36
          Width = 121
          Height = 21
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 2
          OnExit = DateBegEditExit
        end
        object DateendLabel: TcxLabel
          Left = 248
          Top = 38
          Width = 113
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 3
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
        end
        object CheckBoxInfinity: TcxCheckBox
          Left = 247
          Top = 11
          Width = 241
          Height = 21
          ParentColor = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckBoxInfinityPropertiesChange
          Properties.Caption = #1041#1077#1079#1089#1090#1088#1086#1082#1086#1074#1080#1081' '#1083#1080#1089#1090' '#1058#1053
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
          OnExit = DateBegEditExit
        end
      end
    end
    object SecondPage: TTabSheet
      Caption = 'SecondPage'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 523
        Height = 129
        Align = alClient
        TabOrder = 0
        object cxLabel7: TcxLabel
          Left = 1
          Top = 1
          Width = 521
          Height = 17
          Align = alTop
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = #1055#1086#1088#1091#1096#1077#1085#1085#1103' '#1088#1077#1078#1080#1084#1091
        end
        object GridExept: TcxGrid
          Left = 1
          Top = 59
          Width = 521
          Height = 69
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object GridExeptDBTableView1: TcxGridDBTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.ExpandButtonsForEmptyDetails = False
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.StyleSheet = GridTableViewStyleSheetDevExpress
            object Grid2ClPeriodBeg: TcxGridDBColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 183
              DataBinding.FieldName = 'DateBegExcept'
            end
            object Grid2ClPeriodEnd: TcxGridDBColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 183
              DataBinding.FieldName = 'DateEndExcept'
            end
          end
          object GridExeptLevel1: TcxGridLevel
            GridView = GridExeptDBTableView1
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 18
          Width = 521
          Height = 41
          Align = alTop
          TabOrder = 2
          object AddButton: TcxButton
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Caption = 'AddButton'
            TabOrder = 0
            OnClick = AddButtonClick
          end
          object DeleteButton: TcxButton
            Left = 96
            Top = 8
            Width = 75
            Height = 25
            Caption = 'DeleteButton'
            TabOrder = 1
            OnClick = DeleteButtonClick
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 129
        Width = 523
        Height = 57
        Align = alBottom
        TabOrder = 1
        object NoteMemo: TcxMemo
          Left = 112
          Top = 8
          Width = 401
          Height = 41
          TabOrder = 0
          OnKeyPress = SeriaEditKeyPress
        end
        object cxLabel8: TcxLabel
          Left = 8
          Top = 8
          Width = 89
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
          Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 186
        Width = 523
        Height = 119
        Align = alBottom
        TabOrder = 2
        object cxLabel6: TcxLabel
          Left = 1
          Top = 1
          Width = 521
          Height = 40
          Align = alTop
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = #1058#1088#1091#1076#1086#1074#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
        end
        object GridRmoving: TcxGrid
          Left = 1
          Top = 41
          Width = 521
          Height = 77
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object GridRmovingDBTableView1: TcxGridDBTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.KeyFieldNames = 'RMOVING'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.Deleting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.ExpandButtonsForEmptyDetails = False
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.StyleSheet = GridTableViewStyleSheetDevExpress
            object cxGridDBColumn1: TcxGridDBColumn
              Width = 123
              DataBinding.FieldName = 'NAME_SOVMEST'
            end
            object cxGridDBColumn2: TcxGridDBColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 89
              DataBinding.FieldName = 'DATE_BEG_RMOVING'
            end
            object cxGridDBColumn3: TcxGridDBColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 89
              DataBinding.FieldName = 'DATE_END_RMOVING'
            end
            object cxGridDBColumn4: TcxGridDBColumn
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              SortOrder = soDescending
              Width = 161
              DataBinding.FieldName = 'VPOST'
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = GridRmovingDBTableView1
          end
        end
        object cxButton1: TcxButton
          Left = 8
          Top = 6
          Width = 153
          Height = 25
          Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1090#1088#1091#1076#1086#1074#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
          TabOrder = 2
          OnClick = cxButton1Click
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 305
        Width = 523
        Height = 164
        Align = alBottom
        TabOrder = 3
        object cxLabel9: TcxLabel
          Left = 8
          Top = 8
          Width = 97
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
          Caption = #1056#1077#1078#1080#1084' '#1087#1088#1072#1094#1110
        end
        object cxLabel10: TcxLabel
          Left = 8
          Top = 34
          Width = 81
          Height = 18
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
          Caption = #1047#1089#1091#1074
        end
        object ShiftSpin: TcxSpinEdit
          Left = 112
          Top = 35
          Width = 121
          Height = 21
          Properties.OnChange = ShiftSpinPropertiesChange
          TabOrder = 2
          OnExit = WorkModeBoxExit
        end
        object SetDefaultMode: TcxButton
          Left = 336
          Top = 37
          Width = 105
          Height = 25
          Caption = #1047#1072#1073#1088#1072#1090#1080' '#1075#1088#1072#1092#1110#1082
          TabOrder = 3
          OnClick = SetDefaultModeClick
        end
        object cxLabel11: TcxLabel
          Left = 8
          Top = 61
          Width = 97
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
          Caption = #1056#1086#1073#1086#1095#1080#1093' '#1076#1085#1110#1074':'
        end
        object cxLabel12: TcxLabel
          Left = 8
          Top = 85
          Width = 89
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 5
          Caption = #1042#1080#1093#1110#1076#1085#1080#1093' '#1076#1085#1110#1074':'
        end
        object WorkingDays: TcxLabel
          Left = 103
          Top = 61
          Width = 49
          Height = 20
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 6
          Caption = ''
        end
        object AllLabel: TcxLabel
          Left = 103
          Top = 84
          Width = 41
          Height = 17
          AutoSize = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -12
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 7
          Caption = ''
        end
        object HolidaysMemo: TcxMemo
          Left = 144
          Top = 80
          Width = 369
          Height = 73
          Properties.ScrollBars = ssVertical
          TabOrder = 8
          OnKeyPress = HolidaysMemoKeyPress
        end
        object WorkModeBox: TcxLookupComboBox
          Left = 112
          Top = 5
          Width = 401
          Height = 21
          ParentFont = False
          Properties.ListColumns = <>
          Properties.ListOptions.ShowHeader = False
          Properties.OnChange = WorkModeBoxPropertiesChange
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 9
          OnExit = WorkModeBoxExit
          OnKeyPress = IllTypeBoxKeyPress
        end
      end
    end
  end
  object CancelBtn: TcxButton
    Left = 440
    Top = 504
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object YesBtn: TcxButton
    Left = 336
    Top = 504
    Width = 81
    Height = 25
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
  object Actions: TActionList
    Left = 416
    Top = 40
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      SecondaryShortCuts.Strings = (
        'Ctrl+End')
      OnExecute = YesBtnClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 472
    Top = 40
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8535838
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
end
