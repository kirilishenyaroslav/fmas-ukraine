object MoveOst_Form: TMoveOst_Form
  Left = 324
  Top = 224
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1077#1082#1080#1085#1091#1090#1080' '#1079#1072#1083#1080#1096#1082#1080
  ClientHeight = 377
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 578
    Height = 377
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControlChange
    object TabSheet1: TTabSheet
      Caption = #1059#1089#1110' '#1087#1086' '#1089#1091#1073#1088#1072#1093#1091#1085#1082#1091
      object Panel1: TPanel
        Left = 0
        Top = 277
        Width = 570
        Height = 72
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          570
          72)
        object Label4: TLabel
          Left = 86
          Top = 6
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
          Left = 138
          Top = 6
          Width = 51
          Height = 13
          Caption = 'Sch_Label'
        end
        object Label1: TLabel
          Left = 10
          Top = 22
          Width = 121
          Height = 13
          Caption = #1055#1077#1088#1077#1082#1080#1085#1091#1090#1080' '#1085#1072' '#1088#1072#1093#1091#1085#1086#1082':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object New_Sch_Label: TLabel
          Left = 138
          Top = 22
          Width = 79
          Height = 13
          Caption = 'New_Sch_Label'
        end
        object MoveButton: TcxButton
          Left = 329
          Top = 40
          Width = 155
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1055#1077#1088#1077#1082#1080#1085#1091#1090#1080' '#1074#1080#1076#1110#1083#1077#1085#1110
          TabOrder = 0
          OnClick = MoveButtonClick
        end
        object CancelButton: TcxButton
          Left = 489
          Top = 40
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
          TabOrder = 1
          OnClick = CancelButtonClick
        end
      end
      object Grid1: TcxGrid
        Left = 0
        Top = 0
        Width = 570
        Height = 277
        Align = alClient
        TabOrder = 0
        object TableView1: TcxGridTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Sch_Sch_Num_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Sch_Db_Summa_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Sch_Kr_Summa_Column
            end
            item
              Format = ',0;-,0'
              Kind = skSum
              Column = Sch_Move_Btn_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedItemChanged = TableView1FocusedItemChanged
          OnFocusedRecordChanged = TableView1FocusedRecordChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = GridTableViewStyleSheet
          object Sch_id_Sch_Column: TcxGridColumn
            Visible = False
          end
          object Sch_Sch_Num_Column: TcxGridColumn
            Caption = #1056#1072#1093#1091#1085#1086#1082
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 102
          end
          object Sch_Sch_Name_Column: TcxGridColumn
            Visible = False
            IsCaptionAssigned = True
          end
          object Sch_Db_Summa_Column: TcxGridColumn
            Caption = #1044#1077#1073#1077#1090
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Width = 80
          end
          object Sch_Kr_Summa_Column: TcxGridColumn
            Caption = #1050#1088#1077#1076#1080#1090
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Width = 75
          end
          object Sch_New_id_Sch_Column: TcxGridColumn
            Visible = False
          end
          object Sch_New_Sch_Num_Column: TcxGridColumn
            Caption = #1055#1077#1088#1077#1082#1080#1085#1091#1090#1080' '#1085#1072' '#1088#1072#1093#1091#1085#1086#1082
            PropertiesClassName = 'TcxPopupEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Properties.PopupControl = SchGrid
            Properties.PopupWidth = 380
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnCloseUp = Sch_New_Sch_Num_ColumnPropertiesCloseUp
            Properties.OnPopup = Sch_New_Sch_Num_ColumnPropertiesPopup
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 100
          end
          object Sch_New_Sch_Name_Column: TcxGridColumn
            Visible = False
          end
          object Sch_Move_Btn_Column: TcxGridColumn
            Caption = #1055#1077#1088#1077#1082#1080#1085#1091#1090#1080
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayUnchecked = 'False'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Options.Grouping = False
            Width = 108
          end
        end
        object Grid1Level: TcxGridLevel
          GridView = TableView1
        end
      end
      object SchGrid: TcxGrid
        Left = -294
        Top = 48
        Width = 380
        Height = 200
        TabOrder = 2
        Visible = False
        object SchTableView: TcxGridTableView
          OnDblClick = SchTableViewDblClick
          OnKeyPress = SchTableViewKeyPress
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Num_Sch_Column2
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
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
          object id_Sch_Column2: TcxGridColumn
            Visible = False
          end
          object Num_Sch_Column2: TcxGridColumn
            Caption = #1053#1086#1084#1077#1088' '#1088#1072#1093#1091#1085#1082#1072
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 90
          end
          object Name_Sch_Column2: TcxGridColumn
            Caption = #1053#1072#1079#1074#1072' '#1088#1072#1093#1091#1085#1082#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 285
          end
        end
        object SchGridLevel: TcxGridLevel
          GridView = SchTableView
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093
      ImageIndex = 1
      object Grid2: TcxGrid
        Left = 0
        Top = 0
        Width = 570
        Height = 274
        Align = alClient
        TabOrder = 0
        object TableView2: TcxGridTableView
          OnDblClick = TableView2DblClick
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = Name_Sys_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Summa1_Column
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = Summa2_Column
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = TableView2FocusedRecordChanged
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
          object id_Ost_Doc_Column: TcxGridColumn
            Visible = False
          end
          object Name_Sys_Column: TcxGridColumn
            Caption = #1057#1080#1089#1090#1077#1084#1072
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 81
          end
          object Num_Doc_Column: TcxGridColumn
            Caption = #1047#1074#1110#1090#1085#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 92
          end
          object Date_Doc_Column: TcxGridColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 76
          end
          object Summa1_Column: TcxGridColumn
            Caption = #1057#1091#1084#1072' '#1044#1073
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 69
          end
          object Summa2_Column: TcxGridColumn
            Caption = #1057#1091#1084#1072' '#1050#1088
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 71
          end
          object Note_Column: TcxGridColumn
            Visible = False
          end
          object Name_Customer_Column: TcxGridColumn
            Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 179
          end
        end
        object Grid2Level: TcxGridLevel
          GridView = TableView2
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 274
        Width = 570
        Height = 75
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          570
          75)
        object Label5: TLabel
          Left = 8
          Top = 4
          Width = 48
          Height = 13
          Caption = #1055#1110#1076#1089#1090#1072#1074#1072':'
        end
        object NoteMemo: TcxMemo
          Left = 8
          Top = 16
          Width = 329
          Height = 57
          TabStop = False
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.ScrollBars = ssVertical
          Style.Color = 14281696
          TabOrder = 0
        end
        object Edit_Doc_Button: TcxButton
          Left = 345
          Top = 32
          Width = 142
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
          TabOrder = 1
          OnClick = Edit_Doc_ButtonClick
        end
        object CancelButton2: TcxButton
          Left = 489
          Top = 32
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
          TabOrder = 2
          OnClick = CancelButtonClick
        end
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 448
    Top = 262
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
    Left = 248
    Top = 260
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 288
    Top = 260
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 320
    Top = 260
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 353
    Top = 260
    poSQLINT64ToBCD = True
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 388
    Top = 260
  end
end
