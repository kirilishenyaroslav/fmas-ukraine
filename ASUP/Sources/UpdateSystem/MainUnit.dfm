object MainForm: TMainForm
  Left = 196
  Top = 110
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1052#1077#1085#1077#1076#1078#1077#1088' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
  ClientHeight = 456
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
  object StatusBar: TStatusBar
    Left = 0
    Top = 437
    Width = 680
    Height = 19
    Panels = <
      item
        Width = 230
      end
      item
        Width = 250
      end>
    ParentShowHint = False
    ShowHint = True
  end
  object MainPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 680
    Height = 437
    ActivePage = AcceptPage
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 1
    object AcceptPage: TTabSheet
      Caption = #1055#1088#1080#1084#1077#1085#1077#1085#1080#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
      object Label5: TLabel
        Left = 143
        Top = 202
        Width = 216
        Height = 13
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 40
        Width = 657
        Height = 121
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1092#1072#1081#1083#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 72
          Width = 122
          Height = 13
          Caption = #1042#1077#1088#1089#1080#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 24
          Width = 119
          Height = 13
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1080#1089#1090#1077#1084#1099':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 96
          Width = 109
          Height = 13
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SystemNameLabel: TLabel
          Left = 160
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
        object UpdateVersionLabel: TLabel
          Left = 160
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
          Left = 160
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
        object Label4: TLabel
          Left = 8
          Top = 48
          Width = 144
          Height = 13
          Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LastUpdateLabel: TLabel
          Left = 160
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
      end
      object OpenUpdateButton: TButton
        Left = 8
        Top = 8
        Width = 657
        Height = 25
        Caption = '<--- '#1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' --->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = OpenUpdateButtonClick
      end
      object AcceptUpdateButton: TButton
        Left = 8
        Top = 168
        Width = 657
        Height = 25
        Caption = '<--- '#1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' --->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = AcceptUpdateButtonClick
      end
      object LogEdit: TRichEdit
        Left = 8
        Top = 224
        Width = 657
        Height = 161
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
    end
    object SettingsPage: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 1
      object Label6: TLabel
        Left = 8
        Top = 8
        Width = 218
        Height = 13
        Caption = #1057#1090#1088#1086#1082#1072' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1089' '#1073#1072#1079#1086#1081' '#1076#1072#1085#1085#1099#1093':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ConnectionEdit: TEdit
        Left = 8
        Top = 32
        Width = 657
        Height = 21
        TabOrder = 0
      end
      object SaveOptionsButton: TButton
        Left = 592
        Top = 56
        Width = 75
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
        OnClick = SaveOptionsButtonClick
      end
      object SysAdminButton: TBitBtn
        Left = 8
        Top = 120
        Width = 169
        Height = 49
        Caption = #1040#1082#1090#1080#1074#1085#1110' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = SysAdminButtonClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
      ImageIndex = 2
      OnShow = TabSheet1Show
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 672
        Height = 409
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = HistoryDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.HeaderAutoHeight = True
          object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
            Caption = #1057#1080#1089#1090#1077#1084#1072
            Width = 169
            DataBinding.FieldName = 'SYSTEM_NAME'
          end
          object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088' '#1074#1077#1088#1089#1080#1080
            Width = 85
            DataBinding.FieldName = 'VERSION_NUMBER'
          end
          object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1074#1077#1088#1089#1080#1080
            Width = 89
            DataBinding.FieldName = 'VERSION_DATE'
          end
          object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
            Width = 146
            DataBinding.FieldName = 'ACCEPT_DATETIME'
          end
          object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
            Caption = #1057#1077#1088#1074#1077#1088
            Width = 181
            DataBinding.FieldName = 'SERVER_NAME'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1093' '#1074' '#1041#1044' '#1089#1080#1089#1090#1077#1084#1072#1093
      ImageIndex = 3
      OnShow = TabSheet2Show
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 672
        Height = 409
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.DataSource = SystemsDataSource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.HeaderAutoHeight = True
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1057#1080#1089#1090#1077#1084#1072
            Width = 268
            DataBinding.FieldName = 'NAME_SYSTEM'
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089
            Width = 269
            DataBinding.FieldName = 'E_MAIL'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
  end
  object HistoryQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM SYS_VERSION_HISTORY_SELECT')
    Left = 372
    Top = 122
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
    Left = 404
    Top = 122
  end
  object OpenDialog: TOpenDialog
    Filter = '*.upd'
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
    Left = 404
    Top = 154
  end
  object WorkSQL: TIBSQL
    ParamCheck = True
    Left = 404
    Top = 186
  end
  object GetSystemNameQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from INI_SYSTEM_SELECT(:id_system)')
    Left = 372
    Top = 154
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
    Left = 372
    Top = 186
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
    Left = 372
    Top = 218
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
    Left = 404
    Top = 218
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
    Left = 436
    Top = 154
  end
end
