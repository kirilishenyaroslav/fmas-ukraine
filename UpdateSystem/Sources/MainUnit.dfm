object MainForm: TMainForm
  Left = 262
  Top = 213
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1080#1089#1090#1077#1084#1072' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
  ClientHeight = 455
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MainPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 680
    Height = 435
    ActivePage = AcceptPage
    Align = alClient
    DockSite = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object AcceptPage: TTabSheet
      Caption = #1055#1088#1080#1084#1077#1085#1077#1085#1080#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
      object Label5: TLabel
        Left = 8
        Top = 201
        Width = 197
        Height = 14
        Caption = #1055#1088#1086#1094#1077#1089#1089' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LogEdit: TcxMemo
        Left = 8
        Top = 224
        Width = 658
        Height = 177
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Style.Color = 16247513
        TabOrder = 0
      end
      object OpenUpdateButton: TcxButton
        Left = 8
        Top = 8
        Width = 658
        Height = 25
        Caption = '<--- '#1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' --->'
        TabOrder = 1
        OnClick = OpenUpdateButtonClick
      end
      object AcceptUpdateButton: TcxButton
        Left = 8
        Top = 168
        Width = 658
        Height = 25
        Caption = '<--- '#1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' --->'
        TabOrder = 2
        OnClick = AcceptUpdateButtonClick
      end
      object cxGroupBox1: TcxGroupBox
        Left = 7
        Top = 40
        Width = 660
        Height = 121
        Alignment = alTopLeft
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1092#1072#1081#1083#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
        LookAndFeel.Kind = lfUltraFlat
        TabOrder = 3
        object Label2: TLabel
          Left = 31
          Top = 24
          Width = 106
          Height = 14
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1080#1089#1090#1077#1084#1099':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SystemNameLabel: TLabel
          Left = 183
          Top = 24
          Width = 13
          Height = 13
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 31
          Top = 48
          Width = 139
          Height = 14
          Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LastUpdateLabel: TLabel
          Left = 183
          Top = 48
          Width = 13
          Height = 13
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object UpdateVersionLabel: TLabel
          Left = 183
          Top = 72
          Width = 13
          Height = 13
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object UpdateDateLabel: TLabel
          Left = 183
          Top = 96
          Width = 13
          Height = 13
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 31
          Top = 96
          Width = 100
          Height = 14
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 31
          Top = 72
          Width = 115
          Height = 14
          Caption = #1042#1077#1088#1089#1080#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object ProgresBar: TcxProgressBar
        Left = 208
        Top = 200
        Width = 289
        Height = 21
        Properties.PeakValue = 100
        TabOrder = 4
        Visible = False
      end
      object AbortBtn: TcxButton
        Left = 504
        Top = 200
        Width = 161
        Height = 20
        Caption = #1055#1088#1077#1088#1074#1072#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
        TabOrder = 5
        Visible = False
        OnClick = AbortBtnClick
      end
    end
    object SettingsPage: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 1
      object Label6: TLabel
        Left = 9
        Top = 10
        Width = 202
        Height = 14
        Caption = #1057#1090#1088#1086#1082#1072' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1089' '#1073#1072#1079#1086#1081' '#1076#1072#1085#1085#1099#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ConnectionEdit: TcxTextEdit
        Left = 8
        Top = 24
        Width = 657
        Height = 21
        TabOrder = 0
      end
      object SaveOptionsButton: TcxButton
        Left = 589
        Top = 48
        Width = 75
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
        OnClick = SaveOptionsButtonClick
      end
      object SysAdminButton: TcxButton
        Left = 10
        Top = 88
        Width = 185
        Height = 49
        Caption = #1040#1082#1090#1080#1074#1085#1110' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
        TabOrder = 2
        OnClick = SysAdminButtonClick
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6969696B6B6B6B6B6B6B6B6B6B6B6B6B6B6B
          6B6B6B6B6B6B616161FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60
          00D36400DB6B00DB6B00E06F00DD6C00FFFFFF7070717070708C8C8C9E9E9E77
          76769D9D9D9595958888887474746969696C6C6C696969FFFFFFFFFFFFDF6F00
          DE6C00DB6A00D1750FD98122DD8828D87F1DD37511DB7B11B970257E82888686
          86B1B1B1A8A7A65E686C777575A4A3A39999998888888282827A7A7A656565FF
          FFFFFFFFFFCB6300E8A245E69E45E9A24DF4B96CF4B463C86D16D77A13F1AE4B
          BA8A458B8F95B4B4B4B7B7B76E686740899A4A767E716D6C9999999595958989
          897D7D7D666666FFFFFFFFFFFFCA6000ECAB55F3B568F6BC76F0B066D56C005B
          305DB25A13E38E29D197457F858CBEBEBE7A7A7A9D949330A6B5319EAE99908F
          6C6C6C9393938E8E8E777777636363FFFFFFFFFFFFCC6300E49A44F6BC74F3B4
          6FD37515F098342128B1955946D97A11E9962D6F706CB3B5B6808080A7A1A074
          C0C564DAE2847A789090907E7E7E9292926D6D6D616161FFFFFFFFFFFFD96100
          D77815FBC886DB852CF8BD82E683153159FFD79B62ECA346D36E06BC863F7F83
          8A6E6E6D958F8992CDCB5ED8F581797896928A6C6C6A757575757575FFFFFFFF
          FFFFFFFFFFFFFFFFEA7100DA8022D6710BF7A650B8956A1048EDCC9E72E8871A
          D27108DC6D006E69656E6A5E6D80BE4B7AFF4B7FFF497FFF6384E56B6A637474
          71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA6700BB6F203EA1FF3EA7FF4D
          AFFF32A2FF758A9CE06000E16E00FFFFFF507EFF4E8AFF559FFF559EFF559CFF
          5291FF4F80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F9CFF2CA0
          FF60B7FF6CBCFF6DBEFF6BBDFF48ABFF25A7FFFFFFFFFFFFFF5285FF5AA7FF59
          A7FF59A7FF58A4FF57A1FF5089FF548AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF2395F257B0FF73C1FF7AC5FF7DC6FF78C4FF72BFFF38A7FFFFFFFF4082
          FF5289FF5CB1FF5EB3FF5EB2FF5BAFFF5AAAFF5699FF5588FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF006E8F00669D3C98DB76C4FC89CEFF90D2FF86CCFF7BC5FF
          44AEFF0000FF4083FF5692FF67C6FF66C9FF64C6FF61BAFF62BBFF4A89D90102
          08FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF006AA5006799005D8E59AADF9ADAFFA2
          DFFF95D7FF87CEFF47B2FFFFFFFF0000001B2D5D0E1D25193A4B3F80A563C1FF
          182E42000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0071B60075A80086
          B9026CA02D86B82882B31375A80B71A21686D6FFFFFF0000001D1C1954535050
          4D4B2E28240000001A17140D0D0C000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF0073AA0093C6008EC10086B90081B4007DB00078AB006DA4FFFFFFFFFF
          FF0B0B0B7272727C7C7C6F6F6F5858583A3A3A1A1A1AFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0072AE007DB00095C8008DC00087BA0081B40071A5
          006CA9FFFFFFFFFFFFFFFFFF0C0C0C4848485050502F2F2F0D0D0DFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0071AF0072A90076A900
          72A6006CA4006AA6009A91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0072B50072A9006158FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        UseSystemPaint = False
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
      ImageIndex = 2
      OnShow = TabSheet1Show
      object HistGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 672
        Height = 407
        Align = alClient
        BorderStyle = cxcbsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        object HistTableView: TcxGridDBTableView
          DataController.DataSource = HistoryDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = HistTableView_SYSTEM_NAME
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = GridTableViewStyleSheet
          object HistTableView_SYSTEM_NAME: TcxGridDBColumn
            Caption = #1057#1080#1089#1090#1077#1084#1072
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 169
            DataBinding.FieldName = 'SYSTEM_NAME'
          end
          object HistTableView_VERSION_NUMBER: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088' '#1074#1077#1088#1089#1080#1080
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 85
            DataBinding.FieldName = 'VERSION_NUMBER'
          end
          object HistTableView_VERSION_DATE: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1074#1077#1088#1089#1080#1080
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 89
            DataBinding.FieldName = 'VERSION_DATE'
          end
          object HistTableView_ACCEPT_DATETIME: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 146
            DataBinding.FieldName = 'ACCEPT_DATETIME'
          end
          object HistTableView_SERVER_NAME: TcxGridDBColumn
            Caption = #1057#1077#1088#1074#1077#1088
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 181
            DataBinding.FieldName = 'SERVER_NAME'
          end
        end
        object HistGridLevel1: TcxGridLevel
          GridView = HistTableView
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1093' '#1074' '#1041#1044' '#1089#1080#1089#1090#1077#1084#1072#1093
      ImageIndex = 3
      OnShow = TabSheet2Show
      object SysGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 672
        Height = 407
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = cxcbsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        object SysTableView: TcxGridDBTableView
          DataController.DataSource = SystemsDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.StyleSheet = GridTableViewStyleSheet
          object SysGrid_NAME_SYSTEM: TcxGridDBColumn
            Caption = #1057#1080#1089#1090#1077#1084#1072
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 268
            DataBinding.FieldName = 'NAME_SYSTEM'
          end
          object SysGrid_E_MAIL: TcxGridDBColumn
            Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 269
            DataBinding.FieldName = 'E_MAIL'
          end
        end
        object SysGridLevel: TcxGridLevel
          GridView = SysTableView
        end
      end
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 435
    Width = 680
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 300
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 300
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object HistoryQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM SYS_VERSION_HISTORY_SELECT')
    Left = 540
    Top = 266
    object HistoryQueryID_SYSTEM: TIntegerField
      FieldName = 'ID_SYSTEM'
      Origin = 'SYS_VERSION_HISTORY_SELECT.ID_SYSTEM'
    end
    object HistoryQueryVERSION_NUMBER: TIntegerField
      FieldName = 'VERSION_NUMBER'
      Origin = 'SYS_VERSION_HISTORY_SELECT.VERSION_NUMBER'
    end
    object HistoryQueryVERSION_DATE: TDateField
      FieldName = 'VERSION_DATE'
      Origin = 'SYS_VERSION_HISTORY_SELECT.VERSION_DATE'
    end
    object HistoryQueryACCEPT_DATETIME: TDateTimeField
      FieldName = 'ACCEPT_DATETIME'
      Origin = 'SYS_VERSION_HISTORY_SELECT.ACCEPT_DATETIME'
    end
    object HistoryQuerySYSTEM_NAME: TIBStringField
      FieldName = 'SYSTEM_NAME'
      Origin = 'SYS_VERSION_HISTORY_SELECT.SYSTEM_NAME'
      Size = 255
    end
    object HistoryQuerySERVER_NAME: TIBStringField
      FieldName = 'SERVER_NAME'
      Origin = 'SYS_VERSION_HISTORY_SELECT.SERVER_NAME'
      Size = 255
    end
    object HistoryQueryACCEPT_LOG: TBlobField
      FieldName = 'ACCEPT_LOG'
      Origin = 'SYS_VERSION_HISTORY_SELECT.ACCEPT_LOG'
      Size = 8
    end
  end
  object HistoryDataSource: TDataSource
    DataSet = HistoryQuery
    Left = 572
    Top = 266
  end
  object OpenDialog: TOpenDialog
    Filter = '*.upd'
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
    Left = 572
    Top = 298
  end
  object WorkSQL: TIBSQL
    ParamCheck = True
    Left = 572
    Top = 330
  end
  object GetSystemNameQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from INI_SYSTEM_SELECT(:id_system)')
    Left = 540
    Top = 298
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_system'
        ParamType = ptUnknown
      end>
    object GetSystemNameQueryNAME_SYSTEM: TIBStringField
      FieldName = 'NAME_SYSTEM'
      Origin = 'INI_SYSTEM_SELECT.NAME_SYSTEM'
      Size = 255
    end
    object GetSystemNameQueryE_MAIL: TIBStringField
      FieldName = 'E_MAIL'
      Origin = 'INI_SYSTEM_SELECT.E_MAIL'
      Size = 255
    end
    object GetSystemNameQueryLAST_UPDATE: TIntegerField
      FieldName = 'LAST_UPDATE'
      Origin = 'INI_SYSTEM_SELECT.LAST_UPDATE'
    end
  end
  object WorkQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'UPDATE SYS_VERSION_HISTORY SET ACCEPT_LOG = :ACCEPT_LOG'
      ''
      
        'where id_system = :id_system and version_number = :version_numbe' +
        'r')
    Left = 540
    Top = 330
    ParamData = <
      item
        DataType = ftBlob
        Name = 'ACCEPT_LOG'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id_system'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'version_number'
        ParamType = ptUnknown
      end>
  end
  object SystemsQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM INI_SYSTEM')
    Left = 540
    Top = 362
    object SystemsQueryID_SYSTEM: TIntegerField
      FieldName = 'ID_SYSTEM'
      Origin = 'INI_SYSTEM.ID_SYSTEM'
    end
    object SystemsQueryNAME_SYSTEM: TIBStringField
      FieldName = 'NAME_SYSTEM'
      Origin = 'INI_SYSTEM.NAME_SYSTEM'
      Size = 255
    end
    object SystemsQueryE_MAIL: TIBStringField
      FieldName = 'E_MAIL'
      Origin = 'INI_SYSTEM.E_MAIL'
      Size = 255
    end
  end
  object SystemsDataSource: TDataSource
    DataSet = SystemsQuery
    Left = 572
    Top = 362
  end
  object PopupMenu1: TPopupMenu
    Left = 372
    Top = 314
    object N1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1095#1077#1090' '#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080' '#1074' '#1092#1072#1081#1083'...'
      OnClick = N1Click
    end
  end
  object SaveDialog: TSaveDialog
    Left = 604
    Top = 298
  end
  object StyleRepository: TcxStyleRepository
    Left = 605
    Top = 267
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
end
