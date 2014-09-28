object FSp_customer_search: TFSp_customer_search
  Left = 306
  Top = 178
  Width = 528
  Height = 513
  Caption = #1055#1086#1080#1089#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 199
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object NameCheckV: TCheckBox
      Left = 66
      Top = 38
      Width = 14
      Height = 17
      Color = clInfoBk
      ParentColor = False
      TabOrder = 0
      Visible = False
    end
    object TypePropCheckV: TCheckBox
      Left = 66
      Top = 57
      Width = 14
      Height = 17
      Color = clInfoBk
      ParentColor = False
      TabOrder = 1
      Visible = False
    end
    object HigherInstCheckV: TCheckBox
      Left = 66
      Top = 76
      Width = 14
      Height = 17
      Color = clInfoBk
      ParentColor = False
      TabOrder = 2
      Visible = False
    end
    object BranchCheckV: TCheckBox
      Left = 66
      Top = 95
      Width = 14
      Height = 17
      Color = clInfoBk
      ParentColor = False
      TabOrder = 3
      Visible = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 216
      Width = 505
      Height = 177
      Caption = 'Panel2'
      TabOrder = 4
      object Label1: TLabel
        Left = 24
        Top = 10
        Width = 42
        Height = 13
        Caption = #1053#1072#1079#1074#1072':'
      end
      object Label5: TLabel
        Left = 24
        Top = 50
        Width = 89
        Height = 13
        Caption = #1058#1080#1087' '#1074#1083#1072#1089#1085#1086#1089#1090#1110':'
      end
      object Label6: TLabel
        Left = 24
        Top = 90
        Width = 95
        Height = 13
        Caption = #1042#1080#1097#1072' '#1110#1085#1089#1090#1072#1085#1094#1110#1103':'
      end
      object Label4: TLabel
        Left = 24
        Top = 130
        Width = 46
        Height = 13
        Caption = #1043#1072#1083#1091#1079#1100':'
      end
      object Label2: TLabel
        Left = 376
        Top = 10
        Width = 58
        Height = 13
        Caption = #1045#1044#1056#1055#1054#1059':'
      end
      object Label3: TLabel
        Left = 376
        Top = 50
        Width = 53
        Height = 13
        Caption = #1056#1072#1093#1091#1085#1086#1082':'
      end
      object Label7: TLabel
        Left = 376
        Top = 90
        Width = 104
        Height = 13
        Caption = #8470' '#1087#1086#1076#1072#1090#1082'. '#1089#1074#1110#1076#1095'.:'
      end
      object Label8: TLabel
        Left = 376
        Top = 130
        Width = 117
        Height = 13
        Caption = #1055#1086#1076#1072#1090#1082#1086#1074#1080#1081' '#1085#1086#1084#1077#1088':'
      end
      object NameCheck: TCheckBox
        Left = 8
        Top = 24
        Width = 16
        Height = 19
        TabOrder = 0
        OnClick = NameCheckClick
      end
      object NameEdit: TEdit
        Left = 24
        Top = 24
        Width = 297
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 1
        OnKeyPress = NameEditKeyPress
      end
      object TypePropCheck: TCheckBox
        Left = 8
        Top = 66
        Width = 16
        Height = 17
        TabOrder = 2
        OnClick = TypePropCheckClick
      end
      object TypePropEdit: TEdit
        Left = 24
        Top = 64
        Width = 297
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 3
        OnKeyPress = NameEditKeyPress
      end
      object HigherInstCheck: TCheckBox
        Left = 8
        Top = 106
        Width = 16
        Height = 17
        TabOrder = 4
        OnClick = HigherInstCheckClick
      end
      object HigherInstEdit: TEdit
        Left = 24
        Top = 104
        Width = 297
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 5
        OnKeyPress = NameEditKeyPress
      end
      object BranchCheck: TCheckBox
        Left = 8
        Top = 146
        Width = 16
        Height = 17
        TabOrder = 6
        OnClick = BranchCheckClick
      end
      object BranchEdit: TEdit
        Left = 24
        Top = 144
        Width = 297
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 7
        OnKeyPress = NameEditKeyPress
      end
      object edrpouCheck: TCheckBox
        Left = 360
        Top = 26
        Width = 16
        Height = 17
        TabOrder = 8
        OnClick = edrpouCheckClick
      end
      object edrpouEdit: TEdit
        Left = 376
        Top = 24
        Width = 105
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 9
        OnKeyPress = NameEditKeyPress
      end
      object AccountEdit: TEdit
        Left = 376
        Top = 64
        Width = 105
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 10
        OnKeyPress = NameEditKeyPress
      end
      object AccountCheck: TCheckBox
        Left = 360
        Top = 66
        Width = 16
        Height = 17
        TabOrder = 11
        OnClick = AccountCheckClick
      end
      object nnsEdit: TEdit
        Left = 376
        Top = 104
        Width = 105
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 12
        OnKeyPress = NameEditKeyPress
      end
      object nnsCheck: TCheckBox
        Left = 360
        Top = 106
        Width = 16
        Height = 17
        TabOrder = 13
        OnClick = nnsCheckClick
      end
      object NalogNomEdit: TEdit
        Left = 376
        Top = 144
        Width = 105
        Height = 21
        Color = clSilver
        Enabled = False
        TabOrder = 14
        OnKeyPress = NameEditKeyPress
      end
      object NalogNomCheck: TCheckBox
        Left = 360
        Top = 146
        Width = 16
        Height = 17
        TabOrder = 15
        OnClick = NalogNomCheckClick
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 520
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object SearchButton: TSpeedButton
        Left = 2
        Top = 2
        Width = 79
        Height = 28
        Caption = #1055#1086#1080#1089#1082
        Flat = True
        NumGlyphs = 2
        OnClick = SearchBttonClick
      end
      object SpeedButton1: TSpeedButton
        Left = 81
        Top = 2
        Width = 95
        Height = 28
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        Flat = True
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          1878EB1877E91674E11372DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF1877E31878EB1776E61573DE1370D8116ED10F6BCBFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1574C91C7DE21877EA1675E31473DD136FD5116DCF0F
          6AC90D68C20C65BC0A63B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF116EC51F82D32E97E23AA6EE37A3F237A3
          F22286E1106CCC0E69C60D67C00B64BA0A62B4085EAD065CA70559A0FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF197ACE2991DE37A3EB
          41B0F445B4F84CBDFE4DBFFF3AA6F22184D90F6AC10A63B70960B1075DAB065B
          A505599E035698035493FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1473C724
          8AD9339EE73EACF23BA6EF2C8EDE41ACF24CBDFF48B7FE3EA9F443B1FF2990E2
          0B64B4075DA9055AA304589C035596035493FF00FFFF00FFFF00FFFF00FFFF00
          FF0B647801500A1370CA36A0FA2F96E62483DA1B6DC44DBFFF43B1F82E95E53A
          A4F241AFFF3EAAFE38A1F639A3FF3097F3116CB8035495035493FF00FFFF00FF
          FF00FFFF00FF01500A0F6C652D659D01500A0A4BAA1978E1166AD43DAAFC43B1
          F82687DD2582D742B0FF3EAAFC3097E938A3FC37A0FF37A0FF37A0FF2386D9FF
          00FFFF00FFFF00FFFF00FF004D00096C10188940339EEB2784DD2482E601500A
          01500A1357B51B79E11160C0379FF2349AF62486DD3096ED38A1FF37A0FF37A0
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08680D20A4383CDE6745F67821
          AA41198366288BC21C6DC93092F201500A01500A165CAF176DC41C77D3349AF4
          37A0FE37A0FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF06640C1F9F353ADA
          6546F67939E5632ACF481BB82E0D9C16067B15167D733397DE267FDA2F95F428
          86E301500A2C8FEEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          1C9A3136D45E46F6793AE7652BD14A1CBA310FA41A048E070082000082000178
          030C812921959960A7D31E7AD9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF1890290C721321AA392DD34D1EBC3310A61C059008008200
          00820001870409971518B43F1BB4450F8B26FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B001AA62D11A71E06
          910A00820000810001870307951313AB3218AB3E0F8B26FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B0023AB
          3D32DA560FA41A008001005E00005C00026B04067611015503FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          004B001A962D35DE5A13AA20018101005500FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF004B0013842036E15E15AD23018202005500FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF08680D38E36217B128028803005500FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF02550335DA5B19B52B028904005F
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF035C061BB82F
          038B05005E00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF0F8B19037F06005100FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = SpeedButton1Click
      end
    end
    object edrpouCheckV: TCheckBox
      Left = 66
      Top = 115
      Width = 14
      Height = 17
      Color = clInfoBk
      ParentColor = False
      TabOrder = 6
      Visible = False
    end
    object AccountCheckV: TCheckBox
      Left = 66
      Top = 134
      Width = 14
      Height = 17
      Color = clInfoBk
      ParentColor = False
      TabOrder = 7
      Visible = False
    end
    object NNSCheckV: TCheckBox
      Left = 66
      Top = 153
      Width = 14
      Height = 17
      Color = clInfoBk
      ParentColor = False
      TabOrder = 8
      Visible = False
    end
    object NalogNomCheckV: TCheckBox
      Left = 66
      Top = 172
      Width = 14
      Height = 17
      Color = clInfoBk
      ParentColor = False
      TabOrder = 9
      Visible = False
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 33
      Width = 520
      Height = 166
      Align = alClient
      TabOrder = 10
      LookAndFeel.Kind = lfUltraFlat
      object cxGrid1TableView1: TcxGridTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = cxGrid1TableView1FocusedRecordChanged
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.HideSelection = True
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = cxGridTableViewStyleSheet1
        object cxGrid1TableView1Column1: TcxGridColumn
          Caption = #1055#1086#1083#1077
          HeaderAlignmentHorz = taCenter
          MinWidth = 164
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
          Width = 164
        end
        object cxGrid1TableView1Column2: TcxGridColumn
          Caption = #1056#1103#1076' '#1087#1086#1080#1089#1082#1072
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = cxGrid1TableView1Column2PropertiesButtonClick
          HeaderAlignmentHorz = taCenter
          Width = 275
        end
        object cxGrid1TableView1Column3: TcxGridColumn
          Caption = #1042#1093#1086#1078#1076#1077#1085#1080#1077
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1TableView1
      end
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 199
    Width = 520
    Height = 280
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfUltraFlat
    object cxGrid2DBTableView1: TcxGridDBTableView
      OnDblClick = DBGrid1DblClick
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = cxGridTableViewStyleSheet1
      object cxGrid2DBTableView1ID_CUSTOMER: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_CUSTOMER'
      end
      object cxGrid2DBTableView1NAME_CUSTOMER: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        Width = 406
        DataBinding.FieldName = 'NAME_CUSTOMER'
      end
      object cxGrid2DBTableView1KOD_EDRPOU: TcxGridDBColumn
        Caption = #1045#1043#1056#1055#1054#1059
        HeaderAlignmentHorz = taCenter
        Width = 112
        DataBinding.FieldName = 'KOD_EDRPOU'
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = DataSet1
    Left = 472
    Top = 304
  end
  object DataSet1: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from sp_customer')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 440
    Top = 304
    poSQLINT64ToBCD = True
  end
  object PopupMenu1: TPopupMenu
    Left = 408
    Top = 304
    object N1: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080
      OnClick = N1Click
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 480
    Top = 64
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
    object cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet
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
