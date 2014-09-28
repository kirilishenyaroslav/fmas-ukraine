object JO9_Options_Form: TJO9_Options_Form
  Left = 339
  Top = 288
  Width = 535
  Height = 386
  Caption = #1054#1087#1094#1110#1111' '#1089#1080#1089#1090#1077#1084#1080
  Color = 16247513
  Constraints.MinHeight = 368
  Constraints.MinWidth = 520
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPanel: TPanel
    Left = 8
    Top = 8
    Width = 509
    Height = 333
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 507
      Height = 289
      ActivePage = RepTabSheet
      Style = tsFlatButtons
      TabOrder = 0
      object RepTabSheet: TTabSheet
        Caption = #1047#1074#1110#1090#1080' '#1089#1080#1089#1090#1077#1084#1080
        object RepGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 499
          Height = 258
          Align = alClient
          TabOrder = 0
          object RepTableView: TcxGridTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0'
                Kind = skSum
                Column = is_Active_Column
              end
              item
                Kind = skCount
                Column = Name_Report_Column
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnFocusedRecordChanged = RepTableViewFocusedRecordChanged
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            OptionsView.CellAutoHeight = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = GridTableViewStyleSheet
            object is_Active_Column: TcxGridColumn
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Width = 38
            end
            object id_Report_Column: TcxGridColumn
              Visible = False
              FooterAlignmentHorz = taCenter
            end
            object Name_Report_Column: TcxGridColumn
              Caption = #1053#1072#1079#1074#1072' '#1079#1074#1110#1090#1091
              PropertiesClassName = 'TcxMemoProperties'
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Focusing = False
              Width = 459
            end
            object is_Active_Old_Column: TcxGridColumn
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              Visible = False
            end
          end
          object RepGridLevel: TcxGridLevel
            GridView = RepTableView
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1057#1087#1110#1083#1100#1085#1110' '#1086#1087#1094#1110#1111
        ImageIndex = 1
        object Shape5: TShape
          Left = 0
          Top = 0
          Width = 499
          Height = 258
          Align = alClient
          Brush.Style = bsClear
          Pen.Color = 14128185
        end
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 136
          Height = 13
          Caption = #1053#1077#1074#1080#1079#1085#1072#1095#1077#1085#1080#1081' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
        end
        object Shape1: TShape
          Left = 16
          Top = 64
          Width = 377
          Height = 129
          Brush.Style = bsClear
          Pen.Color = 14128185
        end
        object Label7: TLabel
          Left = 16
          Top = 204
          Width = 123
          Height = 26
          Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088' '#1088#1077#1075#1080#1089#1090#1088#1072' '#1086#1073#1083#1110#1082#1091' '#1075#1086#1083#1086#1074#1085#1086#1081' '#1082#1085#1080#1075#1080':'
          WordWrap = True
        end
        object Undef_Cust_Edit: TcxButtonEdit
          Left = 16
          Top = 31
          Width = 377
          Height = 21
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = Undef_Cust_EditPropertiesButtonClick
          Style.Color = 16247513
          TabOrder = 0
        end
        object Show_Mng_Panel: TcxCheckBox
          Left = 28
          Top = 72
          Width = 313
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1091' '#1084#1077#1085#1077#1076#1078#1077#1088#1110' '#1087#1088#1086#1074#1086#1076#1086#1082' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1081#1085#1091' '#1087#1072#1085#1077#1083#1100
          Style.TransparentBorder = True
          TabOrder = 1
        end
        object Not_Dif_Bdg: TcxCheckBox
          Left = 28
          Top = 136
          Width = 329
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Properties.Caption = #1042#1074#1072#1078#1072#1090#1080' '#1073#1102#1076#1078#1077#1090#1080' '#1086#1076#1080#1085#1072#1082#1086#1074#1080#1084#1080' '#1087#1088#1080' '#1076#1086#1076#1072#1074#1072#1085#1085#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
          Style.TransparentBorder = True
          TabOrder = 2
        end
        object Wizard_Form_Sh: TcxCheckBox
          Left = 28
          Top = 104
          Width = 321
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Properties.Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1091' '#1084#1077#1085#1077#1076#1078#1077#1088#1110' '#1087#1088#1086#1074#1086#1076#1086#1082' '#1092#1086#1088#1084#1091' '#1087#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1085#1103
          Style.TransparentBorder = True
          TabOrder = 3
        end
        object Use_Sec_Prov: TcxCheckBox
          Left = 28
          Top = 168
          Width = 217
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' "'#1110#1085#1096#1110'" '#1087#1088#1086#1074#1086#1076#1082#1080
          Style.TransparentBorder = True
          TabOrder = 4
        end
        object MainBookEdit: TcxCurrencyEdit
          Left = 16
          Top = 232
          Width = 129
          Height = 21
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '0'
          Properties.Nullable = False
          Properties.UseLeftAlignmentOnEditing = False
          Style.Color = 16247513
          TabOrder = 5
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1054#1087#1094#1110#1111' '#1089#1080#1089#1090#1077#1084#1080
        ImageIndex = 2
        object Shape6: TShape
          Left = 0
          Top = 0
          Width = 499
          Height = 258
          Align = alClient
          Brush.Style = bsClear
          Pen.Color = 14128185
        end
        object Shape4: TShape
          Left = 8
          Top = 152
          Width = 483
          Height = 103
          Brush.Style = bsClear
          Pen.Color = 14128185
        end
        object Shape3: TShape
          Left = 8
          Top = 16
          Width = 329
          Height = 129
          Brush.Style = bsClear
          Pen.Color = 14128185
        end
        object Label2: TLabel
          Left = 16
          Top = 36
          Width = 81
          Height = 13
          Caption = #1053#1072#1079#1074#1072' '#1089#1080#1089#1090#1077#1084#1080':'
        end
        object Label3: TLabel
          Left = 16
          Top = 99
          Width = 131
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1076#1110#1111' '#1089#1080#1089#1090#1077#1084#1080':'
        end
        object Label4: TLabel
          Left = 193
          Top = 73
          Width = 136
          Height = 39
          Caption = 
            #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1084#1110#1089#1103#1094#1110#1074', '#1085#1072' '#1103#1082#1110' '#1084#1086#1078#1085#1072' '#1087#1077#1088#1077#1081#1090#1080' '#1091#1087#1077#1088#1077#1076' '#1074#1110#1076' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1087#1077#1088 +
            #1110#1086#1076#1072':'
          WordWrap = True
        end
        object Label5: TLabel
          Left = 16
          Top = 160
          Width = 158
          Height = 13
          Caption = #1043#1088#1091#1087#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1085#1072' '#1087#1088#1086#1089#1084#1086#1090#1088':'
        end
        object Label6: TLabel
          Left = 16
          Top = 208
          Width = 163
          Height = 13
          Caption = #1043#1088#1091#1087#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1085#1072' '#1076#1086#1076#1072#1074#1072#1085#1085#1103':'
        end
        object Name_Sys_Edit: TcxTextEdit
          Left = 16
          Top = 48
          Width = 313
          Height = 21
          Properties.MaxLength = 30
          Style.Color = 16247513
          TabOrder = 0
        end
        object Sys_BegDateEdit: TcxDateEdit
          Left = 16
          Top = 112
          Width = 137
          Height = 21
          Properties.Alignment.Horz = taLeftJustify
          Style.Color = 16247513
          Style.ButtonTransparency = ebtHideInactive
          TabOrder = 1
        end
        object GroupDocView: TcxButtonEdit
          Left = 16
          Top = 176
          Width = 465
          Height = 21
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = GroupDocViewPropertiesButtonClick
          Style.Color = 16247513
          TabOrder = 3
        end
        object GroupDocAdd: TcxButtonEdit
          Left = 16
          Top = 224
          Width = 465
          Height = 21
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = GroupDocAddPropertiesButtonClick
          Style.Color = 16247513
          TabOrder = 4
        end
        object ShowMonthEdit: TcxCurrencyEdit
          Left = 192
          Top = 112
          Width = 137
          Height = 21
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '0'
          Properties.Nullable = False
          Properties.UseLeftAlignmentOnEditing = False
          Style.Color = 16247513
          TabOrder = 2
        end
      end
    end
    object RepPanel: TPanel
      Left = 4
      Top = 291
      Width = 499
      Height = 37
      BevelOuter = bvNone
      TabOrder = 1
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 499
        Height = 37
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = 14128185
      end
      object ApplyButton: TcxButton
        Left = 312
        Top = 6
        Width = 99
        Height = 25
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1079#1084#1110#1085#1080
        TabOrder = 0
        OnClick = ApplyButtonClick
      end
      object CancelButton: TcxButton
        Left = 416
        Top = 6
        Width = 75
        Height = 25
        Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
        TabOrder = 1
        OnClick = CancelButtonClick
      end
      object cxButton1: TcxButton
        Left = 8
        Top = 6
        Width = 89
        Height = 25
        Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
        Enabled = False
        TabOrder = 2
        OnClick = cxButton1Click
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 56
    Top = 293
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
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 132
    Top = 293
  end
  object DataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    Left = 244
    Top = 293
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 172
    Top = 293
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 204
    Top = 293
  end
  object Query: TpFIBQuery
    Database = Database
    Transaction = ReadTransaction
    Left = 276
    Top = 293
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 100
    Top = 293
  end
end
