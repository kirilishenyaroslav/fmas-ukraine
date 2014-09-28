object Raise_config: TRaise_config
  Left = 329
  Top = 199
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1091#1074#1072#1090#1080' '#1085#1072#1076#1073#1072#1074#1082#1080'/'#1076#1086#1087#1083#1072#1090#1080
  ClientHeight = 466
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 208
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object cxG_Nadb: TcxGrid
      Left = 0
      Top = 17
      Width = 592
      Height = 191
      Align = alClient
      TabOrder = 0
      object cxG_NadbDBTableView1: TcxGridDBTableView
        DataController.DataSource = DS_Nadb
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object cxG_Nadb_Name_Column: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072
          Options.Editing = False
          SortOrder = soAscending
          Width = 390
          DataBinding.FieldName = 'Name'
        end
        object cxG_Nadb_Group_Column: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1072
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1047#1072' '#1089#1082#1083'., '#1085#1072#1087#1088'.'
            #1047#1072' '#1087#1086#1095#1077#1089#1085#1110', '#1089#1087#1086#1088#1090'. '#1079#1074#1072#1085#1085#1103
            #1030#1085#1096#1110
            #1047#1072' '#1074#1080#1089#1083#1091#1075#1091' '#1088#1086#1082#1110#1074)
          Width = 200
          DataBinding.FieldName = 'group'
        end
        object cxG_NadbDB_Id_column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'Name'
        end
      end
      object cxG_NadbLevel1: TcxGridLevel
        GridView = cxG_NadbDBTableView1
      end
    end
    object cxLabel1: TcxLabel
      Left = 0
      Top = 0
      Width = 592
      Height = 17
      Align = alTop
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      Caption = #1053#1072#1076#1073#1072#1074#1082#1080
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 208
    Width = 592
    Height = 208
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cxLabel2: TcxLabel
      Left = 0
      Top = 0
      Width = 592
      Height = 17
      Align = alTop
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #1044#1086#1087#1083#1072#1090#1080
    end
    object cxG_Dopl: TcxGrid
      Left = 0
      Top = 17
      Width = 592
      Height = 191
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DS_Dopl
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object cxGridDB_Name_Column: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072
          SortOrder = soAscending
          Width = 390
          DataBinding.FieldName = 'name'
        end
        object cxGridDB_Group_Column: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1072
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1047#1072' '#1074#1095#1077#1085#1077' '#1079#1074#1072#1085#1085#1103
            #1047#1072' '#1085#1072#1091#1082'. '#1089#1090#1091#1087#1110#1085#1100
            #1030#1085#1096#1110)
          Properties.ReadOnly = False
          Width = 200
          DataBinding.FieldName = 'group'
        end
        object cxGridDB_Id_Column: TcxGridDBColumn
          Visible = False
          DataBinding.FieldName = 'id_raise'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 416
    Width = 592
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BBOk: TBitBtn
      Left = 258
      Top = 12
      Width = 75
      Height = 25
      Caption = #1043#1072#1088#1072#1079#1076
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BBOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object RxMD_Nadb: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'id_raise'
        DataType = ftInteger
      end
      item
        Name = 'group'
        DataType = ftString
        Size = 255
      end>
    Left = 176
    Top = 104
    object RxMD_NadbName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object RxMD_Nadbid_raise: TIntegerField
      FieldName = 'id_raise'
    end
    object RxMD_Nadbgroup: TStringField
      FieldName = 'group'
      Size = 255
    end
  end
  object RxMD_Dopl: TRxMemoryData
    FieldDefs = <
      item
        Name = 'name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'id_raise'
        DataType = ftInteger
      end
      item
        Name = 'group'
        DataType = ftString
        Size = 255
      end>
    Left = 176
    Top = 312
    object RxMD_Doplname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object RxMD_Doplid_raise: TIntegerField
      FieldName = 'id_raise'
    end
    object RxMD_Doplgroup: TStringField
      FieldName = 'group'
      Size = 255
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 232
    Top = 152
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 14745599
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14745599
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16776176
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
      Color = clBtnFace
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
      Caption = 'qizzStyle'
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
  object DS_Nadb: TDataSource
    DataSet = RxMD_Nadb
    Left = 208
    Top = 104
  end
  object DS_Dopl: TDataSource
    DataSet = RxMD_Dopl
    Left = 208
    Top = 312
  end
  object pFIBDS_SelectRaises: TpFIBDataSet
    Left = 256
    Top = 248
    poSQLINT64ToBCD = True
  end
end
