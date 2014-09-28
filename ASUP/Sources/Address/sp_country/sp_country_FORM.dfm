object Fsp_country: TFsp_country
  Left = 215
  Top = 109
  Width = 393
  Height = 337
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1082#1088#1072#1111#1085
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object AddButton: TSpeedButton
      Left = 0
      Top = 2
      Width = 28
      Height = 28
      Hint = #1044#1086#1076#1072#1090#1080
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = AddButtonClick
    end
    object DelButton: TSpeedButton
      Left = 64
      Top = 2
      Width = 28
      Height = 28
      Hint = #1042#1080#1083#1091#1095#1080#1090#1080
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = DelButtonClick
    end
    object ModButton: TSpeedButton
      Left = 32
      Top = 2
      Width = 28
      Height = 28
      Hint = #1047#1084#1110#1085#1080#1090#1080
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ModButtonClick
    end
    object SelButton: TSpeedButton
      Left = 128
      Top = 2
      Width = 28
      Height = 28
      Hint = #1042#1080#1073#1088#1072#1090#1080
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SelButtonClick
    end
    object ExitButton: TSpeedButton
      Left = 160
      Top = 2
      Width = 28
      Height = 28
      Hint = #1042#1080#1093#1110#1076
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ExitButtonClick
    end
    object RefreshButton: TSpeedButton
      Left = 96
      Top = 2
      Width = 28
      Height = 28
      Hint = #1054#1073#1085#1086#1074#1080#1090#1080
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = RefreshButtonClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 255
    Width = 385
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 7
      Width = 33
      Height = 13
      Caption = #1055#1086#1096#1091#1082
    end
    object SearchEdit: TcxTextEdit
      Left = 0
      Top = 24
      Width = 193
      Height = 21
      BeepOnEnter = False
      Properties.OnChange = SearchEditPropertiesChange
      TabOrder = 0
      OnKeyPress = SearchEditKeyPress
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 59
    Width = 385
    Height = 196
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = DBGridDblClick
      OnKeyPress = cxGrid1DBTableView1KeyPress
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1ID_COUNTRY: TcxGridDBColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'ID_COUNTRY'
      end
      object cxGrid1DBTableView1NAME_COUNTRY: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        HeaderAlignmentHorz = taCenter
        SortOrder = soAscending
        DataBinding.FieldName = 'NAME_COUNTRY'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object FilterPanel: TPanel
    Left = 0
    Top = 33
    Width = 385
    Height = 26
    Align = alTop
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 6
      Width = 65
      Height = 13
      Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ServersBox: TDBLookupComboBox
      Left = 104
      Top = 2
      Width = 265
      Height = 21
      KeyField = 'ID_SERVER'
      ListField = 'NAME_SERVER'
      TabOrder = 0
      OnCloseUp = ServersBoxCloseUp
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 120
    object Action_Add: TAction
      ImageIndex = 0
      OnExecute = Action_AddExecute
    end
    object Action_Del: TAction
      Caption = 'Action_Del'
      OnExecute = Action_DelExecute
    end
    object Action_Mod: TAction
      Caption = 'Action_Mod'
      OnExecute = Action_ModExecute
    end
    object Action_Refresh: TAction
      Caption = 'Action_Refresh'
      ShortCut = 116
      OnExecute = Action_RefreshExecute
    end
    object Action_Sel: TAction
      Caption = 'Action_Sel'
      OnExecute = Action_SelExecute
    end
    object Action_Exit: TAction
      Caption = 'Action_Exit'
      ShortCut = 16499
      OnExecute = Action_ExitExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 120
    object PM_AddButton: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080
      ImageIndex = 0
      OnClick = PM_AddButtonClick
    end
    object PM_DelButton: TMenuItem
      Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      ImageIndex = 1
      OnClick = PM_DelButtonClick
    end
    object PM_ModButton: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ImageIndex = 2
      OnClick = PM_ModButtonClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object PM_RefreshButton: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1080
      ImageIndex = 3
      OnClick = PM_RefreshButtonClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object PM_SelButton: TMenuItem
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ImageIndex = 6
      OnClick = PM_SelButtonClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object PM_ExitButton: TMenuItem
      Caption = #1042#1080#1093#1110#1076
      ImageIndex = 7
      OnClick = PM_ExitButtonClick
    end
  end
  object DataSet: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from VIEW_SP_COUNTRY'
      'ORDER BY Name_Country')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 104
    Top = 120
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object StoredProc: TpFIBStoredProc
    Left = 136
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = DataSet
    Left = 72
    Top = 120
  end
end
