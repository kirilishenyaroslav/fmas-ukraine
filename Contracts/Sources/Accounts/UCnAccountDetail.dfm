object frmAccDetail: TfrmAccDetail
  Left = 330
  Top = 176
  Width = 774
  Height = 522
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1076#1077#1090#1072#1083#1100#1085#1086#1102' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1088#1072#1093#1091#1085#1082#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 484
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 756
      Height = 482
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082
        object GridAccData: TcxGrid
          Left = 0
          Top = 41
          Width = 748
          Height = 308
          Align = alClient
          TabOrder = 0
          object ViewAccData: TcxGridDBTableView
            DataController.DataSource = CalcDataDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = '0.00;-0.00'
                Kind = skSum
                Position = spFooter
                FieldName = 'CUR_NACH'
                Column = NACH
              end
              item
                Format = '0.00;-0.00'
                Kind = skSum
                Position = spFooter
                FieldName = 'CUR_PAY'
                Column = PAY
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00;-0.00'
                Kind = skSum
                FieldName = 'CUR_PAY'
                Column = PAY
              end
              item
                Format = '0.00;-0.00'
                Kind = skSum
                FieldName = 'CUR_NACH'
                Column = NACH
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.IncSearch = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfAlwaysVisible
            OptionsView.HeaderAutoHeight = True
            Styles.Background = cxStyle1
            Styles.Content = cxStyle1
            Styles.ContentEven = cxStyle1
            Styles.Header = cxStyle3
            object TYPE_CALC: TcxGridDBColumn
              Caption = #1058#1080#1087' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Visible = False
              GroupIndex = 1
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              SortOrder = soDescending
              Width = 125
              DataBinding.FieldName = 'TYPE_CALC_TEXT'
            end
            object FIO: TcxGridDBColumn
              Caption = #1055'.'#1030'.'#1041'.'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taLeftJustify
              Visible = False
              GroupIndex = 0
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              SortOrder = soAscending
              Width = 141
              DataBinding.FieldName = 'FIO'
            end
            object SM: TcxGridDBColumn
              Caption = #1041#1102#1076#1078#1077#1090
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Width = 107
              DataBinding.FieldName = 'SM_CODE'
            end
            object RZ: TcxGridDBColumn
              Caption = #1056#1086#1079#1076#1110#1083
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Width = 115
              DataBinding.FieldName = 'RZ_CODE'
            end
            object ST: TcxGridDBColumn
              Caption = #1057#1090#1072#1090#1090#1103
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Width = 95
              DataBinding.FieldName = 'ST_CODE'
            end
            object KEKV: TcxGridDBColumn
              Caption = #1050#1086#1076' '#1074#1080#1090#1088#1072#1090
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Width = 117
              DataBinding.FieldName = 'KEKV_CODE'
            end
            object NACH: TcxGridDBColumn
              Caption = #1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Width = 111
              DataBinding.FieldName = 'CUR_NACH'
            end
            object PAY: TcxGridDBColumn
              Caption = #1054#1087#1083#1072#1090#1072
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Width = 102
              DataBinding.FieldName = 'CUR_PAY'
            end
          end
          object LevelAccData: TcxGridLevel
            GridView = ViewAccData
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 349
          Width = 748
          Height = 102
          Align = alBottom
          TabOrder = 1
          object Label1: TLabel
            Left = 74
            Top = 6
            Width = 51
            Height = 16
            Caption = #1041#1102#1076#1078#1077#1090
          end
          object Label2: TLabel
            Left = 74
            Top = 30
            Width = 44
            Height = 16
            Caption = #1056#1086#1079#1076#1110#1083
          end
          object Label3: TLabel
            Left = 74
            Top = 54
            Width = 45
            Height = 16
            Caption = #1057#1090#1072#1090#1090#1103
          end
          object Label4: TLabel
            Left = 74
            Top = 79
            Width = 73
            Height = 16
            Caption = #1050#1086#1076' '#1074#1080#1090#1088#1072#1090
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 152
            Top = 3
            Width = 657
            Height = 24
            DataBinding.DataField = 'SM_TEXT'
            DataBinding.DataSource = CalcDataDataSource
            Style.Color = clInfoBk
            TabOrder = 0
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 152
            Top = 27
            Width = 657
            Height = 24
            DataBinding.DataField = 'RZ_TEXT'
            DataBinding.DataSource = CalcDataDataSource
            Style.Color = clInfoBk
            TabOrder = 1
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 152
            Top = 51
            Width = 657
            Height = 24
            DataBinding.DataField = 'ST_TEXT'
            DataBinding.DataSource = CalcDataDataSource
            Style.Color = clInfoBk
            TabOrder = 2
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 152
            Top = 75
            Width = 657
            Height = 24
            DataBinding.DataField = 'KEKV_TEXT'
            DataBinding.DataSource = CalcDataDataSource
            Style.Color = clInfoBk
            TabOrder = 3
          end
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 748
          Height = 41
          AutoSize = True
          ButtonHeight = 39
          ButtonWidth = 71
          Caption = 'ToolBar1'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Images = ImageList1
          ParentFont = False
          ShowCaptions = True
          TabOrder = 2
          object ToolButton_del: TToolButton
            Left = 0
            Top = 0
            Caption = #1042#1080#1076#1072#1083#1080#1090#1080
            ImageIndex = 2
            OnClick = ToolButton_delClick
          end
          object FilterButton: TToolButton
            Left = 71
            Top = 0
            Caption = #1060#1110#1083#1100#1090#1088
            ImageIndex = 7
            Style = tbsCheck
            OnClick = FilterButtonClick
          end
          object RefreshButton: TToolButton
            Left = 142
            Top = 0
            Caption = #1054#1085#1086#1074#1080#1090#1080
            ImageIndex = 10
            OnClick = RefreshButtonClick
          end
          object CloseButton: TToolButton
            Left = 213
            Top = 0
            Caption = #1047#1072#1082#1088#1080#1090#1080
            ImageIndex = 6
            OnClick = CloseButtonClick
          end
          object CheckGroupPanel: TcxCheckBox
            Left = 284
            Top = 7
            Width = 225
            Height = 24
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = CheckGroupPanelPropertiesChange
            Properties.Caption = #1055#1072#1085#1077#1083#1100' '#1076#1083#1103' '#1075#1088#1091#1087#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1080#1093
            TabOrder = 0
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1089#1100#1082#1110' '#1087#1088#1086#1074#1086#1076#1082#1080
        ImageIndex = 1
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 748
          Height = 41
          AutoSize = True
          ButtonHeight = 39
          ButtonWidth = 64
          Caption = 'ToolBar1'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Images = ImageList1
          ParentFont = False
          ShowCaptions = True
          TabOrder = 0
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Caption = #1060#1110#1083#1100#1090#1088
            ImageIndex = 7
            Style = tbsCheck
            OnClick = ToolButton1Click
          end
          object ToolButton2: TToolButton
            Left = 64
            Top = 0
            Caption = #1054#1085#1086#1074#1080#1090#1080
            ImageIndex = 10
            OnClick = RefreshButtonClick
          end
          object ToolButton3: TToolButton
            Left = 128
            Top = 0
            Caption = #1047#1072#1082#1088#1080#1090#1080
            ImageIndex = 6
            OnClick = CloseButtonClick
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 313
          Width = 748
          Height = 138
          Align = alBottom
          TabOrder = 1
          object Label5: TLabel
            Left = 74
            Top = 43
            Width = 51
            Height = 16
            Caption = #1041#1102#1076#1078#1077#1090
          end
          object Label6: TLabel
            Left = 74
            Top = 67
            Width = 44
            Height = 16
            Caption = #1056#1086#1079#1076#1110#1083
          end
          object Label7: TLabel
            Left = 74
            Top = 91
            Width = 45
            Height = 16
            Caption = #1057#1090#1072#1090#1090#1103
          end
          object Label8: TLabel
            Left = 74
            Top = 116
            Width = 73
            Height = 16
            Caption = #1050#1086#1076' '#1074#1080#1090#1088#1072#1090
          end
          object Label9: TLabel
            Left = 258
            Top = 0
            Width = 110
            Height = 16
            Caption = #1056#1072#1093#1091#1085#1086#1082' '#1074' '#1076#1077#1073#1077#1090#1110
          end
          object Label10: TLabel
            Left = 594
            Top = 0
            Width = 117
            Height = 16
            Caption = #1056#1072#1093#1091#1085#1086#1082' '#1074' '#1082#1088#1077#1076#1080#1090#1110
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 152
            Top = 40
            Width = 657
            Height = 24
            DataBinding.DataField = 'KR_ID_SM_NAME'
            DataBinding.DataSource = ProvsDataSource
            Style.Color = clInfoBk
            TabOrder = 0
          end
          object cxDBTextEdit6: TcxDBTextEdit
            Left = 152
            Top = 64
            Width = 657
            Height = 24
            DataBinding.DataField = 'KR_ID_RZ_NAME'
            DataBinding.DataSource = ProvsDataSource
            Style.Color = clInfoBk
            TabOrder = 1
          end
          object cxDBTextEdit7: TcxDBTextEdit
            Left = 152
            Top = 88
            Width = 657
            Height = 24
            DataBinding.DataField = 'KR_ID_ST_NAME'
            DataBinding.DataSource = ProvsDataSource
            Style.Color = clInfoBk
            TabOrder = 2
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 152
            Top = 112
            Width = 657
            Height = 24
            DataBinding.DataField = 'KR_ID_KEKV_NAME'
            DataBinding.DataSource = ProvsDataSource
            Style.Color = clInfoBk
            TabOrder = 3
          end
          object cxDBTextEdit9: TcxDBTextEdit
            Left = 152
            Top = 17
            Width = 322
            Height = 24
            DataBinding.DataField = 'DB_ID_SCH_NAME'
            DataBinding.DataSource = ProvsDataSource
            Style.Color = clInfoBk
            TabOrder = 4
          end
          object cxDBTextEdit10: TcxDBTextEdit
            Left = 475
            Top = 17
            Width = 333
            Height = 24
            DataBinding.DataField = 'KR_ID_SCH_NAME'
            DataBinding.DataSource = ProvsDataSource
            Style.Color = clInfoBk
            TabOrder = 5
          end
        end
        object ProvsGrid: TcxGrid
          Left = 0
          Top = 41
          Width = 748
          Height = 272
          Align = alClient
          TabOrder = 2
          object ProvsView: TcxGridDBTableView
            DataController.DataSource = ProvsDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsBehavior.IncSearch = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.Background = cxStyle1
            Styles.Content = cxStyle1
            Styles.ContentEven = cxStyle1
            Styles.Header = cxStyle3
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = #1056#1072#1093#1091#1085#1086#1082' '#1074' '#1076#1077#1073#1077#1090#1110
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              SortOrder = soDescending
              Width = 141
              DataBinding.FieldName = 'DB_ID_SCH_NUM'
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = #1041#1102#1076#1078#1077#1090
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Styles.Content = cxStyle4
              Width = 106
              DataBinding.FieldName = 'DB_ID_SM_NUM'
            end
            object cxGridDBColumn4: TcxGridDBColumn
              Caption = #1056#1086#1079#1076#1110#1083
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Styles.Content = cxStyle4
              Width = 112
              DataBinding.FieldName = 'DB_ID_RZ_NUM'
            end
            object cxGridDBColumn5: TcxGridDBColumn
              Caption = #1057#1090#1072#1090#1090#1103
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Styles.Content = cxStyle4
              Width = 94
              DataBinding.FieldName = 'DB_ID_ST_NUM'
            end
            object cxGridDBColumn6: TcxGridDBColumn
              Caption = #1050#1086#1076' '#1074#1080#1090#1088#1072#1090
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Styles.Content = cxStyle4
              Width = 113
              DataBinding.FieldName = 'DB_ID_KEKV_NUM'
            end
            object cxGridDBColumn2: TcxGridDBColumn
              Caption = #1056#1072#1093#1091#1085#1086#1082' '#1074' '#1082#1088#1077#1076#1080#1090#1110
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Sorting = False
              Width = 138
              DataBinding.FieldName = 'KR_ID_SCH_NUM'
            end
            object cxGridDBColumn7: TcxGridDBColumn
              Caption = #1057#1091#1084#1072
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Width = 111
              DataBinding.FieldName = 'SUMMA'
            end
          end
          object ProvsLevel: TcxGridLevel
            GridView = ProvsView
          end
        end
      end
    end
  end
  object CalcDataDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 13
    Top = 281
    poSQLINT64ToBCD = True
  end
  object CalcDataDataSource: TDataSource
    DataSet = CalcDataDataSet
    Left = 45
    Top = 281
  end
  object ImageList1: TImageList
    Left = 48
    Top = 312
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7818300A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7818300FDEFD900F6E3
      CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC9700EECC
      9700F3D19900986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4817600FEF3E3009933
      000099330000993300009933000099330000993300009933000099330000EECC
      9700F3D19900986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4817600FFF7EB009933
      0000FEFEFE00FEFEFE00FEFEFE008EA4FD00B8C6FD00FEFEFE0099330000EFCD
      9900F3D19800986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFCF4009933
      0000FEFEFE00FAFBFE007E98FC000335FB00597AFC00FEFEFE0099330000F0D0
      A100F3D29B00986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFFFD009933
      0000D6DEFE004368FC000335FB004066FC000436FB00D9E0FE0099330000F0D4
      A900F5D5A300986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF009933
      00005274FC001442FB00BCC9FD00EFF2FE001A47FB004F72FC0097330400F2D8
      B200F6D9AC00986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF009933
      0000E4EAFE00D9E0FE00FEFEFE00FEFEFE0098ACFD000335FB0064345900F4DB
      B900F8DDB400986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FFFFFF009933
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE005677FC000335FB00F7E1
      C200F0DAB700986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCA88700FFFFFF009933
      000099330000993300009933000099330000993300008F3311002235C8000335
      FB00C6BCA900986B660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500B48176000335
      FB000335FB000335FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B4817600E8B2
      7000ECA54A000335FB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B4817600FAC5
      7700CD9377000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200FCF7F400FCF7
      F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B4817600CF9B
      8600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200B48176000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000096675E009F6F
      60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F60009F6F
      60009F6F60009F6F60009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000000000000000000000000000000000099695F00F6E0
      BF00F4DDB800F3DAB400F3D7AD00F2D5A700F0D3A300F0D09E00EECC9900EECA
      9300EDC99000EDC68C009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000000000008C5A5A008C5A5A0000000000FFFF0000FFFF0000000000008C5A
      5A008C5A5A008C5A5A008C5A5A0000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB00000000000000000000000000000000009D6C6000F6E3
      C600F6E1C100F4DDBB00F3DCB40000810000F2D5AA00F0D3A400F0CF9F00EFCC
      9900EFCB9500EEC990009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000F7DECE00F7DEC60000000000FFFF0000FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000A16E6000F7E6
      CE00F6E5C700F4E1C100008100000081000000810000F3D5AB00F0D3A500EFD1
      9F00EFCE9A00EFCB96009F6F6000000000000000000000000000000000000000
      0000000000000000000000848300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      000000000000000000000000000000000000FFFFFF00FFFF000000000000F7DE
      C600EFDECE00F7EFDE008C5A5A0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000A6726200F8EA
      D400F7E7CE0000810000307A2A005F924B000081000050883C00F2D5AB00F0D3
      A500F0D0A000EFCF9C009F6F6000000000000000000000000000000000000000
      0000000000000084830000FFFE00008483000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      000000000000FFD6A500FFD6A500FFD6A500000000000000000084848400FFD6
      A500FFD6A500F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000AB766300FAEE
      DA00FAEBD50000810000EFE2C200F6E2C200A7B883000081000000810000EDD4
      A900F0D4A600F0D1A1009F6F6000000000000000000000000000000000000000
      000000FFFE0000FFFE0000FFFE0000FFFE000084830000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC6000000
      0000F7E7CE00F7E7CE000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000000000000000000000B0786400FAF0
      E200FAEEDC00F8EBD500F8E9D000F7E6CA00F6E3C500E6D8B400008100000081
      0000F2D7AD00F2D4A7009F6F60000000000000000000000000000000000000FF
      FE0000FFFE00848484008484840000FFFE0000FFFE0000848300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7EFDE00F7DECE0000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C60000000000EFDECE000000000000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000000000000000000000B57D6400FCF3
      E700FBF0E300FAEFDD00FAEDD800F7E9D100F8E6CB00F6E3C500F6E1C000F4DE
      BA00F4DAB500F3D7AD009F6F60000000000000000000000000008484840000FF
      FE008484840000000000000000008484840000FFFE0000FFFE00008483000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C0000000000FFD6A50000000000FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500000000000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000BB806500FCF7
      ED00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700F3DAB6009F6F6000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FFFE0000FFFE000084
      830000000000000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF000000000000000000F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000C0836600FCF8
      F300FCF7EF00FCF4EA00FBF2E500FBEFDE00F8EDD900F8EBD400F8E7CE00F7E3
      C700F6E1C200F4DEBB009F6F6000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFE0000FF
      FE0000848300000000000000000000000000000000000000000000000000B58C
      8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000C4876700FEFB
      F800FEFAF300FEF7EF00FCF4EA00FBF2E600FAEFE000F8EDDA00F8EAD400F7E9
      CF00F7E5C900F6E2C4009F6F6000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FE0000FFFE00000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      0000000000000000000000000000000000000000000000000000C9896700FEFC
      FB00D5812700D5812700D5812700D5812700D5812700D5812700D5812700D581
      2700D5812700F7E5CA009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FFFE00000000000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000A67A7500F1E1D600EEDBCD00ECD6
      C500EAD1BD00E7CCB500E5C8AD00E3C3A500E0BF9D00A67A7500000000000000
      0000000000000335FB0000000000000000000000000000000000CC8B6800FFFF
      FF00FFFEFC00FEFCFA00FEFBF400FEF8F000FCF6ED00FCF4E700FAF2E200FAEF
      DC00F8EDD700F8EAD1009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000A67A7500FCF7F200FAF1E700F9EC
      DC00F7E7D200F5E2C800F4DDBE00F3D8B400F1D4A900A67A7500000000000000
      00000335FB000335FB0000000000000000000000000000000000CF8E6800FFFF
      FF00FFFFFF00FFFFFC00FFFCFA00FEFBF600FEF8F000FCF7EE00FBF4E900FBF2
      E300FBEFDD00F8EDD8009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00C68C7B00000000000000000000000000A67A7500A67A7500A67A7500A67A
      7500A67A7500A67A7500A67A7500A67A7500A67A7500A67A7500000000000000
      000000000000000000000330E200000000000000000000000000CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000335FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005346450053464500534645005346450053464500534645000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D40000000000EF42
      0000AD290000AD2900007329000073290000000000000000000000000000B58E
      7B00B5928400F7E3D600EFE3DE00EFE3DE00F7E7DE00F7E3D600BDA69C005346
      4500534645000000000000000000000000000000000039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      3900000000000000000000000000000000000000000097736B00B3887F00B184
      7C00B1847C00B1847C00B1857D00B1857D00B1857E00B0857D00AE857E00AA83
      7C00B0858000B48A7C00875D560000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD29000073290000732900000000000000000000BDA69C00F7E7
      DE00FFF3F700E7DBD600DEB29C00D6A68C00E7C7BD00EFEBEF00F7F3F700F7E3
      D600E7CBBD005346450000000000000000003939390080808000808080008080
      8000808080008080800084848400848484008484840084848400848484003939
      39003939390000000000000000000000000000000000B3938C00F1DCCA00FCDB
      C400FCDAC600FCDBC700FAD5BA00FED6BC00FFD4B600FAD3B600F6CFB000F1CD
      AE00F5CEA800FDCFAD009D706A0000000000FF9C1800FFF7E70000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400FF9C1800FFF7
      E700AD290000AD290000732900007329000000000000BDA69C00F7EBE700FFFF
      FF00C68E7300BD5D2900BD5D2900DEB29C00BD5D2900BD5D2900D69E8400F7F3
      F700F7E7DE00D6C7BD0053464500000000003939390039393900393939003939
      3900393939003939390039393900393939003939390039393900393939003939
      39003939390039393900000000000000000000000000B3969000ECE8D600FFF2
      D400E4E6BE00E3E1B900FFEAD300F4E1B600E9E3AF00FDDDB700FDD8AD00FAD5
      A700F6D6A200FCD8B600A072720000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD290000732900007329000000000000BDA69C00FFFFFF00CE6D
      4200BD5D2900BD5D2900C6A29400FFFFFF00E7825200BD5D2900BD5D2900D696
      7300FFFBF700F7E3D600534645000000000039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      84003939390039393900000000000000000000000000BB9F9000ECEFE500FFFA
      EC00A9D38F00009A0000029B050000980000009D000000930000269D2300D5CD
      9800FFD7AC00FED7BA009E70700000000000FF9C1800FF9C180000000000EF42
      0000AD2900009C310000C8D0D400C8D0D400C8D0D400C8D0D400000000000000
      0000AD290000AD2900007329000073290000BDA69C00FFFBFF00DE9E7B00BD5D
      2900CE653100CE653100CE693900D68A6300CE653100CE653100BD5D2900BD5D
      2900E7CBBD00F7EFEF00DECBC6005346450039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FF000000FF00000000FF000000FF00C5C5C5008484
      84008484840039393900393939000000000000000000C0A49800EFF1EA00FFFB
      F400AAD89900009400000098000010A016009CCE9100AFC791002FA826005FB5
      4F00F6DAB100FFDEC6009E71700000000000FF9C18000000000000000000EF42
      0000AD290000AD2900007329000073290000FF9C1800FF9C1800000000000000
      0000AD290000AD2900007329000073290000D6C7BD00FFF7F700C6613100BD5D
      2900CE653100BD5D2900CE866300F7E7DE00D6693900BD5D2900CE653100BD5D
      2900CE714200FFFFFF00E7CBBD005346450039393900C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C5C5C500C5C5C500C5C5C500C5C5C500C5C5C5008484
      84008484840084848400393939000000000000000000C4A7A000EFF5E900FFFC
      F700B3DCA300019D01000DA10B001DA41C0051B14300F0E5C400F4E2C3005FB4
      5B00D9D29D00FFDDC600A77A740000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C3100007329000073290000FF9C1800F7FFFF00000000000000
      0000AD290000AD2900007329000073290000D6C7BD00F7DFD600BD5D2900CE65
      3100CE653100BD5D2900D6825200FFFBFF00E7AE9400BD5D2900BD5D2900CE65
      3100BD5D2900FFEFEF00F7DFD600534645000000000039393900393939003939
      390039393900393939003939390039393900393939003939390039393900C5C5
      C5008484840084848400393939000000000000000000CAACA100F4FAF200F2F7
      E500DCEBCE00FBF4E600F5F3DF00F9F1DA00FEE7CD00FEEBD800FFECDB00F7E6
      CD00F0DEB600FEDAC100AB7D750000000000FF9C180000000000F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900007329000073290000D6C7BD00F7D7CE00CE653100CE65
      3100CE653100CE653100BD5D2900DEAA9400FFF7F700EF9E7300BD5D2900CE65
      3100BD5D2900F7F3EF00EFE3DE00534645000000000000000000B58C8C00FFFF
      FF00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00F7E7CE00FFFFFF009C6B
      6B00C5C5C50084848400393939000000000000000000D2B5A000F6FAFA00E6F7
      E1008AD38800EDF3DF00FFFCF900C0DEAA004AB0390053B4430049B13C00C5D5
      9F00FFE8D000FDE1CC00AA7E760000000000FFA53900FFA53900F7FFFF00EF42
      0000AD2900009C31000073290000FFC65A00FF9C1800F7FFFF00000000000000
      0000AD290000AD2900008C3921008C392100D6C7BD00FFEFE700D6693900CE65
      3100CE653100BD5D2900BD5D2900BD5D2900E7CFC600FFFFFF00D6693900CE65
      3100CE693900FFFBFF00F7DFD600534645000000000000000000B58C8C00FFFF
      FF00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFFF7009C6B
      6B003939390039393900000000000000000000000000D1B4A100F4FAF800FFFF
      FD008FCF910049B95100E2EFD800FFF9EA0063BB64000093000000910000AAD0
      8D00FFEED900FEDFCA00AC7F770000000000C8D0D400FFA53900FFA53900EF42
      0000EF420000AD290000732900008C392100FFA53900FF9C1800000000000000
      0000AD2900008C3921008C392100C8D0D400D6C7BD00FFFFFF00F79A6B00D669
      3900CE8E6B00F7EBE700D6825200BD5D2900D6967300FFFFFF00E78E5A00BD5D
      2900EF926300FFFFFF00D6C7BD00534645000000000000000000B58C8C00FFFF
      FF00FFF7EF00F7E7CE00F7DEC600F7E7CE00F7DEC600F7E7CE00FFFFF7009C6B
      6B000000000000000000000000000000000000000000DBBDA300F6FDFA00FFFF
      FF00E9F4E5003AAA350018A519005FC0590036AD33000099000000950000AAD4
      8F00FFF6E200FCDCC800AF847D0000000000C8D0D400C8D0D400FFA53900FFF7
      E700EF420000AD290000732900008C392100FFA53900FFF7E700000000000000
      00008C3921008C392100C8D0D400C8D0D40000000000D6C7BD00FFEBDE00EF86
      5200E7825200F7F7F700FFFFFF00DEBAAD00FFFFFF00F7F7F700DE714200D671
      3900FFF3EF00F7E7E7005346450000000000000000000000000000000000B58C
      8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFFF
      FF009C6B6B0000000000000000000000000000000000E1C3A300F6FDFB00F8FC
      F800FFFFFF00C4EBCC0021AA2500009500000094000012A414000D9F1100A5CC
      8B00FFCAC000F8ADA100AC7E760000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D40000000000D6C7BD00FFFFFF00FFEF
      D600FFAA7300EFAA8C00EFE3DE00EFEFEF00F7E7E700FFA67B00F78E5A00F7DB
      CE00FFFFFF00D6C7BD000000000000000000000000000000000000000000B58C
      8C00FFFFF700FFFFF700FFE7D600FFE7D600FFE7D600FFE7D600FFE7D600FFFF
      FF009C6B6B0000000000000000000000000000000000E6C9A900F9FFFE00F8FC
      F800F8FCF800F8FCF800FBFEFA00FFFFFF00FFFFFF00FEFEF800FFFFFE00C9AA
      9700D4975200C79A7A00C3AEA20000000000C8D0D400C8D0D400FFA53900FFA5
      3900EF420000EF4200008C3921008C392100FFA53900FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D4000000000000000000D6C7BD00FFFF
      FF00FFFFFF00FFF3C600FFDFAD00FFD39C00FFC79400FFD7AD00FFFFFF00FFFF
      FF00D6C7BD000000000000000000000000000000000000000000000000000000
      0000B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009C6B6B00000000000000000000000000E8CBAC00FBFFFF00FAFF
      FF00FAFFFF00FAFFFF00FAFEFD00F9FEFD00F4FBFB00F3FBF800F7FFFC00C6AA
      9800D09E7300DCC9B6000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900FF9C1800EF4200008C392100C8D0D400C8D0D400FFA53900000000000000
      00008C392100C8D0D400C8D0D400C8D0D400000000000000000000000000D6C7
      BD00D6C7BD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBFF00DECBC600D6C7
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C009C6B6B00000000000000000000000000E7C29D00E1C6A500E2C6
      A600E2C6A600E2C6A600E2C4A400E1C3A300DDC1A100DCC0A000DEC3A300C29C
      8400DECCB800000000000000000000000000C8D0D400C8D0D400C8D0D400FFA5
      3900F7FFFF00EF4200008C392100C8D0D400C8D0D400FFA53900F7FFFF000000
      00008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      000000000000DECBC600D6C7BD00D6C7BD00D6C7BD00D6C7BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8D0D400C8D0D400C8D0D400FFCE
      6300FFCE6300FFA53900FFA53900C8D0D400C8D0D400FFCE6300FFA53900FFA5
      39008C392100C8D0D400C8D0D400C8D0D4000000000000000000000000000000
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
      FF00EFDECE00EFDECE008C5A5A000000000000000000FFF7E70045454500FFD6
      A50045454500FFD6A5001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6300000000000000000000000000000000000000000000000000080808000000
      000000000000FF633100FFEFA500FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500000084000000
      FF00FFD6A500EFDECE009C6B63000000000000000000FFF7EF00F7DEC600F7DE
      C600F7DEC6001F1F1F001F1F1F00F7DEC600F7DEBD00F7E7CE00EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFDE8400FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      0000000000000000000000000000000000000000000000000000000000006C6C
      FF0000008400F7DEC600F7DEC600F7DEC600F7DEC600000084000000FF00F7DE
      BD00F7E7CE00EFDECE009C6B6B000000000000000000FFF7EF00F7E7CE00F7DE
      C6001F1F1F001F1F1F001F1F1F00F7DEC600F7DEC600F7E7D600EFDECE009C6B
      6B000000000000000000000000000000000000000000FFFFCE00FFFFBD00FFC6
      5A00FFA51000FF9C0000F7FFFF00FFEFA500FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C000000FF0000008400F7DEC600F7DEC600000084000000FF00F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000FFFFF700FFD6A5001F1F
      1F008484840000FFFF001F1F1F00FFD6A500FFD6A500FFD6A500EFDECE009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      00000000000008080800F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF0000008400000084000000FF00FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B000000000000000000FFFFF700FFE7D6001F1F
      1F00C6C6C60000FFFF001F1F1F00FFE7D6000000000000000000000000009C6B
      6B00000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100F7FFFF00FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C63009C31000000000000000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B0000000000000000000000000000000000000000000000000000000000B58C
      8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7D600FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B000000000000000000FFFFFF001F1F1F008484
      840000FFFF001F1F1F00FFFFF700FFFFF70000000000FFFFFF00C68C7B00C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      0000FF31FF00FF633100C65A0000FFFFFF00FFDE8400FFDE8400FFC65A00FF9C
      0000FF9C00009C3100000000000000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B00000000000000000000000000000000000000000000000000B58C
      8C000000FF00000084000000FF0000008400FFFFFF00FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000000000004545450084848400C6C6
      C60000FFFF001F1F1F00FFFFFF00FFFFFF0000000000C68C7B00C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300C65A0000C65A0000CE636300FFC65A00FF9C
      0000FF9C00009C31000000000000000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B00000000000000000000000000000000000000FF000000
      FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00B58C
      8C00C68C7B00000000000000000000000000000000001F1F1F001F1F1F0000FF
      FF001F1F1F0000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFD67300FFD67300FFD67300C65A0000CE636300FF9C
      0000FF9C00009C310000000000000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B0000000000000000000000FF000000FF00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF0000008400B58C8C00B58C
      8C00000000000000000000000000000000001F1F1F0000008400000084001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000FF633100FFDE8400FFDE8400FFDE8400FFDE8400C65A0000C65A
      0000C65A00009C3100000000000000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000C8D0D4001F1F1F001F1F1F001F1F
      1F00C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000000000000000
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
      C600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004C804C004C804C004C80
      4C004C804C00A57B730000000000000000000000000000000000000000000000
      0000000084000000840000008400848484000000840000008400000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF00000084000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8C008585850000FFFF00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B6B0000000000B58C8C00FFF7E700FFD6A500FFD6
      A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004C804C0052AE570052AE
      57004C804C00A57B730000000000000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF0000848484008484840000FF000000FF000000840000000000000000
      0000000000000000000000000000000000000000000000FFFF0000000000B58C
      8C008585850000FFFF00F7DEC60000FFFF0000FFFF00F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B0000000000B58C8C00FFF7EF00F7DEC600F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C004C804C004C804C0052AE570052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      00000000000000000000000084000000FF000000840084848400000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      00008484840000000000000000008484840000FF000000FF0000008400000000
      000000000000000000000000000000000000000000008585850000FFFF00B58C
      8C008585850000FFFF0000FFFF0085858500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE009C6B6B0000000000B58C8C00FFF7EF00F7E7CE00F7DE
      C600B58C8C00FFFFFF00FFFFFF004C804C0052AE570052AE570052AE570052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000000000000840000008400000084000000840000008400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000FF000000FF00000084
      00000000000000000000000000000000000000000000000000008585850000FF
      FF008585850000FFFF008585850000FFFF0000FFFF0000FFFF00FFE7D600B58C
      8C00B58C8C00B58C8C009C6B6B0000000000B58C8C00FFFFF700FFD6A500FFD6
      A500B58C8C00FFFFFF00FFFFFF004C804C0069CA800069CA800069CA800052AE
      570052AE570052AE57004C804C00000000000000000000000000000000000000
      0000000084000000840000008400000000000000840000008400000084008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FF000000FF
      0000008400000000000000000000000000008585850085858500858585008585
      850000FFFF0085858500858585008585850085858500FFFFF700FFFFF700B58C
      8C00FFFFFF00C68C7B000000000000000000B58C8C00FFFFF700FFE7D600FFE7
      D600B58C8C00B58C8C00B58C8C004C804C004C804C004C804C0069CA800052AE
      57004C804C004C804C004C804C00000000000000000000000000000000000000
      8400000084000000840000000000000000000000000000008400000084000000
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF0000000000000000000000000000000000000000000000FFFF008585
      850000FFFF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00C68C7B00000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004C804C0069CA800052AE
      57004C804C000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FF00000000000000000000000000000000000000FFFF008585850000FF
      FF008585850000FFFF008585850000FFFF00B58C8C00B58C8C00B58C8C00B58C
      8C0000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004C804C004C804C004C80
      4C004C804C000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000000000000000000000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400000000000000000000000000000000008585850000FFFF000000
      00008585850000FFFF00000000008585850000FFFF0000000000000000000000
      000000000000000000000000000000000000B58C8C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008585850000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B58C8C00B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFF0000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008007000000000000
      800F000000000000801F000000000000FFFFFFFFFFFFC001FFFFCF3F0021C001
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
  object cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 312
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object columnst: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 10930928
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object ProvsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 13
    Top = 252
    poSQLINT64ToBCD = True
  end
  object ProvsDataSource: TDataSource
    DataSet = ProvsDataSet
    Left = 45
    Top = 252
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 21
    Top = 188
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 53
    Top = 188
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 85
    Top = 188
  end
end
