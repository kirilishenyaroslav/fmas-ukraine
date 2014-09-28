object UpReminderForm: TUpReminderForm
  Left = 323
  Top = 245
  Width = 531
  Height = 379
  Caption = #1057#1087#1080#1089#1086#1082' '#1085#1072#1087#1072#1084#39#1103#1090#1072#1085#1100
  Color = 16247513
  Constraints.MinHeight = 368
  Constraints.MinWidth = 520
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
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 345
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 523
      Height = 345
      ActivePage = RepTabSheet
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object RepTabSheet: TTabSheet
        Caption = #1044#1086#1075#1086#1074#1086#1088#1080
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 515
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1076#1110#1111' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1086' '#1087#1088#1080#1081#1085#1103#1090#1090#1110' '#1085#1072' '#1088#1072#1073#1086#1090#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DogGrid: TcxGrid
          Left = 0
          Top = 45
          Width = 515
          Height = 269
          Align = alClient
          TabOrder = 0
          object DogTableView: TcxGridDBTableView
            DataController.DataSource = DogDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = DogTableViewTN
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRect = False
            OptionsView.CellAutoHeight = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.StyleSheet = GridTableViewStyleSheet
            object DogTableViewTN: TcxGridDBColumn
              Caption = #1058#1053
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 41
              DataBinding.FieldName = 'TN'
            end
            object DogTableViewFIO: TcxGridDBColumn
              Caption = #1060#1048#1054
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 194
              DataBinding.FieldName = 'FIO'
            end
            object DogTableViewNAME_DEPARTMENT: TcxGridDBColumn
              Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 309
              DataBinding.FieldName = 'NAME_DEPARTMENT'
            end
            object DogTableViewNAME_POST: TcxGridDBColumn
              Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 311
              DataBinding.FieldName = 'NAME_POST'
            end
            object DogTableViewACCEPT_DATE: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1087#1088#1080#1077#1084#1072
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 111
              DataBinding.FieldName = 'ACCEPT_DATE'
            end
            object DogTableViewDATE_END: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1091#1074#1086#1083#1100#1085#1077#1085#1080#1103
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 89
              DataBinding.FieldName = 'DATE_END'
            end
          end
          object DogGridLevel1: TcxGridLevel
            GridView = DogTableView
          end
        end
        object dockDogovor: TdxBarDockControl
          Left = 0
          Top = 19
          Width = 515
          Height = 26
          Align = dalTop
          BarManager = BarManager
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1044#1085#1110' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
        ImageIndex = 1
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 515
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #1044#1085#1110' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1110#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dockBirthDay: TdxBarDockControl
          Left = 0
          Top = 19
          Width = 515
          Height = 26
          Align = dalTop
          BarManager = BarManager
        end
        object BirthGrid: TcxGrid
          Left = 0
          Top = 45
          Width = 515
          Height = 269
          Align = alClient
          TabOrder = 1
          object BirthTableView: TcxGridDBTableView
            DataController.DataSource = BirthDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = BirthTableViewTN
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRect = False
            OptionsView.CellAutoHeight = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.StyleSheet = GridTableViewStyleSheet
            object BirthTableViewTN: TcxGridDBColumn
              Caption = #1058#1053
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 30
              DataBinding.FieldName = 'TN'
            end
            object BirthTableViewFIO: TcxGridDBColumn
              Caption = #1060#1048#1054
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 176
              DataBinding.FieldName = 'FIO'
            end
            object BirthTableViewNAME_DEPARTMENT: TcxGridDBColumn
              Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 271
              DataBinding.FieldName = 'NAME_DEPARTMENT'
            end
            object BirthTableViewNAME_POST: TcxGridDBColumn
              Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 195
              DataBinding.FieldName = 'NAME_POST'
            end
            object BirthTableViewBIRTH_DATE: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 84
              DataBinding.FieldName = 'BIRTH_DATE'
            end
          end
          object BirthGridLevel: TcxGridLevel
            GridView = BirthTableView
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1054#1089#1086#1073#1080#1089#1090#1110
        ImageIndex = 2
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 169
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #1054#1089#1086#1073#1080#1089#1090#1110' '#1085#1072#1087#1072#1084'`'#1103#1090#1072#1085#1085#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PrivateGrid: TcxGrid
          Left = 0
          Top = 19
          Width = 515
          Height = 302
          Align = alClient
          TabOrder = 0
          object PrivateTableView: TcxGridDBTableView
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsView.GroupByBox = False
            Styles.StyleSheet = GridTableViewStyleSheet
          end
          object PrivateLevel: TcxGridLevel
            GridView = PrivateTableView
          end
        end
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
    DBName = 'E:\Andrew\DB\CH\FULL_DB.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=tpfibdataset'
      'user_name=sysdba')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 132
    Top = 293
  end
  object DogDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'select * from UP_DT_REMINDER_SEL_WORKDOG(:ID_USER)')
    Left = 100
    Top = 259
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
  object DogDataSource: TDataSource
    DataSet = DogDataSet
    Left = 132
    Top = 259
  end
  object BarManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
        DockControl = dockDogovor
        DockedDockControl = dockDogovor
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnDelDog
            Visible = True
          end
          item
            Item = btnPostponeDog
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnRefreshDog
            Visible = True
          end>
        Name = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103' '#1087#1086' '#1076#1085#1103#1084' '#1088#1086#1078#1076#1077#1085#1080#1103
        DockControl = dockBirthDay
        DockedDockControl = dockBirthDay
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = btnDelBirth
            Visible = True
          end
          item
            Item = btnPostponeBirth
            Visible = True
          end
          item
            Item = btnRefreshBirth
            Visible = True
          end>
        Name = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103' '#1087#1086' '#1076#1085#1103#1084' '#1088#1086#1078#1076#1077#1085#1080#1103
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
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
    Left = 27
    Top = 293
    DockControlHeights = (
      0
      0
      0
      0)
    object btnDelDog: TdxBarButton
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000FF00FF000000
        9A00012AF200002CF600002CF8000733F6000031FE000431FE000134FF000C3C
        FF00123BF100103BF400143EF400103DFB001743F6001B46F6001C47F6001D48
        F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
        FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
        FA002355FF002659FF002E5BF9002C5FFF00325DF1003B66F3003664FA00386B
        FF004071FA004274FF00497AFC00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010100
        00000000000101000000000001150B010000000001040601000000000113180B
        010000010306030100000000000110180B010104060301000000000000000111
        190D060603010000000000000000000118120D05010000000000000000000001
        1D181312010000000000000000000124241D1D19110100000000000000012829
        2401011F191F010000000000012A2A26010000011F231D0100000000012C2701
        00000000011F1901000000000001010000000000000101000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object btnPostponeDog: TdxBarButton
      Caption = #1054#1090#1083#1086#1078#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Category = 0
      Hint = #1054#1090#1083#1086#1078#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000C9C7CC00FF00
        FF0084787900918182009988880091828200968787009D9191009F9696009691
        9100C1C0C000B5B4B4005035320082524C00865650008E5F580092625B009363
        5C00764F4900B68F880096898700746E6D00A18681009F675A00BB918700837A
        7800BB8E82009C776D00917F7A00B6887900BF91820082787500BA8B7A008C89
        8800CECBCA00BB775D009F7565009A6F5B00B7866F00B8897500AD9286007462
        5A006B595000FCF8F600C7C5C400D1967400CF8E6800FFFCFA00928E8B00FEFA
        F700EDE9E500FCFAF800F2A34200F4B76800E3B77D00C59E6C00EFCFA500EFD1
        A900F0D4AF00E9D3B6007A6E5F009E805400D9B17500EBC08000C5A37000EBC6
        9000816C4F00DCBC8F00FBD8A40098887200E5D3BA00B7AB9A00FFC46400F6CB
        8400F3C78300E9C18300F4CC8C00F3CB8B00F4CF970088796200F4CA8400F3C9
        8300FFEFD300B5AA9600FEFAF300FEFCF8009A999700FFF7E300FFFCF300FFFE
        FB00E2E2E000FBFBFA00CBCCCB00C5C9C700EEFFFF007B7D7D00FCFFFF00A9BB
        BC00C0FAFF00A0F6FF00E3FCFF0077959900275A630010D7FF0066B0BF0084A4
        AB00CAE7ED0011D4FF0047DDFF0064E0FF003E646D0091E0F300B0D8E1007A8B
        8F00EFFCFF001AB5E1002BCFFF0062C7E30081E3FF0020363C0031484E0073A3
        B000C9F2FE0000C2FC0001C5FF000989B00025CAFB003FC2E9002E87A30057D7
        FF0091ACB40003BDFE004D6F7B0000A5E6001F6480002B749100406A7A003C46
        4A00008BCC00389CC7000086CB000081BF001387CA00226FA500E1F3FF000068
        CF002A2B2C0098999A000759AF00A0A1A300D5DDF0006C86D000A3ABC900BABF
        E600D4D5E3009797D300FFFFFF00FBFBFB00CECECE00A5A5A500828282007A7A
        7A00787878000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000010101A1A1A1
        A1A1010101010101010101A1A171808F878414150C120F10110E01A169737B91
        8C8D86053C3D3E3F490DA095756C746B83858A881C423736510DA16163766D7F
        7E677C7D042A25264A0DA19897626F7877668E94024F404B500DA10096647A65
        926E818B062924274D0DA10B5B60725E70896879034543414C0D01A19E9D9C99
        906A82071F1B1D204E0D015F9F0A5A9B9A5D0819473B3A38440D0101A2A19356
        0921301613181A1E390D01010101285C2C22325458575246530D010101012D9C
        592F312B339C17171717010101012D9C2B2B2B2B559C17483423010101012D9C
        9C9C9C9C9C9C17352301010101012D2E2E2E2E2E2E2E17230101}
    end
    object btnRefreshDog: TdxBarButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA467698E5D598E5D598E5D598E5D598E5D598E
        5D598E5D598E5D598E5D598E5D598E5D5980504BFF00FFFF00FFFF00FFA46769
        FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD7FEFC4
        8180504BFF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6F2DABCF2D5B2C1C18800
        7000007000BDB672E9BD82E9BD7FEFC48180504BFF00FFFF00FFFF00FFA0675B
        FFF4E5F7E5CF007000C4CA97007000C2C187C0BD80007000BDB66FEABF81EFC4
        8080504BFF00FFFF00FFFF00FFA7756BFFFBF0F8EADC007000007000C4C998F2
        D5B1F0D0A9BFBD80007000EBC28AEFC58380504BFF00FFFF00FFFF00FFA7756B
        FFFFFCFAF0E6007000007000007000F2DABAF2D5B1F0D0A7EECB9DEBC793F2C9
        8C80504BFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F8EAD9F7E3CFF6
        E0C5007000007000007000EECC9EF3CE9780504BFF00FFFF00FFFF00FFBC8268
        FFFFFFFFFEFC007000CADABAF7EADAF6E3CFC5CE9F007000007000F0D0A6F6D3
        A080504BFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFCEE7CC007000CADAB8C9
        D7B0007000C6CC9E007000F4D8B1EBCFA480504BFF00FFFF00FFFF00FFD1926D
        FFFFFFFFFFFFFFFFFFCEE7CC007000007000C9D5B0F8E7D1FBEACEDECEB4B6AA
        9380504BFF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFC
        F6EFFCF3E6EDD8C9A0675BA0675BA0675BA0675BFF00FFFF00FFFF00FFDA9D75
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA0675BE19E55E68F
        31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDCC7C5A0675BF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FFE7AB79
        FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A0675BC1836CFF00
        FFFF00FFFF00FFFF00FFFF00FFE7AB79CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68A0675BFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = btnRefreshDogClick
    end
    object btnDelBirth: TdxBarButton
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000FF00FF000000
        9A00012AF200002CF600002CF8000733F6000031FE000431FE000134FF000C3C
        FF00123BF100103BF400143EF400103DFB001743F6001B46F6001C47F6001D48
        F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
        FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
        FA002355FF002659FF002E5BF9002C5FFF00325DF1003B66F3003664FA00386B
        FF004071FA004274FF00497AFC00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010100
        00000000000101000000000001150B010000000001040601000000000113180B
        010000010306030100000000000110180B010104060301000000000000000111
        190D060603010000000000000000000118120D05010000000000000000000001
        1D181312010000000000000000000124241D1D19110100000000000000012829
        2401011F191F010000000000012A2A26010000011F231D0100000000012C2701
        00000000011F1901000000000001010000000000000101000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object btnPostponeBirth: TdxBarButton
      Caption = #1054#1090#1083#1086#1078#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Category = 0
      Hint = #1054#1090#1083#1086#1078#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000C9C7CC00FF00
        FF0084787900918182009988880091828200968787009D9191009F9696009691
        9100C1C0C000B5B4B4005035320082524C00865650008E5F580092625B009363
        5C00764F4900B68F880096898700746E6D00A18681009F675A00BB918700837A
        7800BB8E82009C776D00917F7A00B6887900BF91820082787500BA8B7A008C89
        8800CECBCA00BB775D009F7565009A6F5B00B7866F00B8897500AD9286007462
        5A006B595000FCF8F600C7C5C400D1967400CF8E6800FFFCFA00928E8B00FEFA
        F700EDE9E500FCFAF800F2A34200F4B76800E3B77D00C59E6C00EFCFA500EFD1
        A900F0D4AF00E9D3B6007A6E5F009E805400D9B17500EBC08000C5A37000EBC6
        9000816C4F00DCBC8F00FBD8A40098887200E5D3BA00B7AB9A00FFC46400F6CB
        8400F3C78300E9C18300F4CC8C00F3CB8B00F4CF970088796200F4CA8400F3C9
        8300FFEFD300B5AA9600FEFAF300FEFCF8009A999700FFF7E300FFFCF300FFFE
        FB00E2E2E000FBFBFA00CBCCCB00C5C9C700EEFFFF007B7D7D00FCFFFF00A9BB
        BC00C0FAFF00A0F6FF00E3FCFF0077959900275A630010D7FF0066B0BF0084A4
        AB00CAE7ED0011D4FF0047DDFF0064E0FF003E646D0091E0F300B0D8E1007A8B
        8F00EFFCFF001AB5E1002BCFFF0062C7E30081E3FF0020363C0031484E0073A3
        B000C9F2FE0000C2FC0001C5FF000989B00025CAFB003FC2E9002E87A30057D7
        FF0091ACB40003BDFE004D6F7B0000A5E6001F6480002B749100406A7A003C46
        4A00008BCC00389CC7000086CB000081BF001387CA00226FA500E1F3FF000068
        CF002A2B2C0098999A000759AF00A0A1A300D5DDF0006C86D000A3ABC900BABF
        E600D4D5E3009797D300FFFFFF00FBFBFB00CECECE00A5A5A500828282007A7A
        7A00787878000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000010101A1A1A1
        A1A1010101010101010101A1A171808F878414150C120F10110E01A169737B91
        8C8D86053C3D3E3F490DA095756C746B83858A881C423736510DA16163766D7F
        7E677C7D042A25264A0DA19897626F7877668E94024F404B500DA10096647A65
        926E818B062924274D0DA10B5B60725E70896879034543414C0D01A19E9D9C99
        906A82071F1B1D204E0D015F9F0A5A9B9A5D0819473B3A38440D0101A2A19356
        0921301613181A1E390D01010101285C2C22325458575246530D010101012D9C
        592F312B339C17171717010101012D9C2B2B2B2B559C17483423010101012D9C
        9C9C9C9C9C9C17352301010101012D2E2E2E2E2E2E2E17230101}
    end
    object btnRefreshBirth: TdxBarButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFA467698E5D598E5D598E5D598E5D598E5D598E
        5D598E5D598E5D598E5D598E5D598E5D5980504BFF00FFFF00FFFF00FFA46769
        FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD7FEFC4
        8180504BFF00FFFF00FFFF00FFA0675BFEEFDAF6E0C6F2DABCF2D5B2C1C18800
        7000007000BDB672E9BD82E9BD7FEFC48180504BFF00FFFF00FFFF00FFA0675B
        FFF4E5F7E5CF007000C4CA97007000C2C187C0BD80007000BDB66FEABF81EFC4
        8080504BFF00FFFF00FFFF00FFA7756BFFFBF0F8EADC007000007000C4C998F2
        D5B1F0D0A9BFBD80007000EBC28AEFC58380504BFF00FFFF00FFFF00FFA7756B
        FFFFFCFAF0E6007000007000007000F2DABAF2D5B1F0D0A7EECB9DEBC793F2C9
        8C80504BFF00FFFF00FFFF00FFBC8268FFFFFFFEF7F2FAEFE6F8EAD9F7E3CFF6
        E0C5007000007000007000EECC9EF3CE9780504BFF00FFFF00FFFF00FFBC8268
        FFFFFFFFFEFC007000CADABAF7EADAF6E3CFC5CE9F007000007000F0D0A6F6D3
        A080504BFF00FFFF00FFFF00FFD1926DFFFFFFFFFFFFCEE7CC007000CADAB8C9
        D7B0007000C6CC9E007000F4D8B1EBCFA480504BFF00FFFF00FFFF00FFD1926D
        FFFFFFFFFFFFFFFFFFCEE7CC007000007000C9D5B0F8E7D1FBEACEDECEB4B6AA
        9380504BFF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFC
        F6EFFCF3E6EDD8C9A0675BA0675BA0675BA0675BFF00FFFF00FFFF00FFDA9D75
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA0675BE19E55E68F
        31B56D4DFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFDCC7C5A0675BF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FFE7AB79
        FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A0675BC1836CFF00
        FFFF00FFFF00FFFF00FFFF00FFE7AB79CF8E68CF8E68CF8E68CF8E68CF8E68CF
        8E68CF8E68CF8E68A0675BFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = btnRefreshBirthClick
    end
  end
  object BirthDataSet: TpFIBDataSet
    Database = Database
    Transaction = ReadTransaction
    UpdateTransaction = WriteTransaction
    SelectSQL.Strings = (
      'select * from UP_DT_REMINDER_SEL_BIRTH(:ID_USER)')
    Left = 100
    Top = 227
    poSQLINT64ToBCD = True
  end
  object BirthDataSource: TDataSource
    DataSet = BirthDataSet
    Left = 132
    Top = 227
  end
end
