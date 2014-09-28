object dt_Doc_Form_Add1: Tdt_Doc_Form_Add1
  Left = 253
  Top = 183
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  ClientHeight = 352
  ClientWidth = 393
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
  object Bevel2: TBevel
    Left = 8
    Top = 72
    Width = 377
    Height = 129
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel1: TBevel
    Left = 8
    Top = 208
    Width = 377
    Height = 105
    Shape = bsFrame
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 204
    Top = 216
    Width = 132
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1085#1086#1074#1086#1075#1086'  '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
  end
  object Label1: TLabel
    Left = 16
    Top = 216
    Width = 131
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1085#1086#1074#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
  end
  object Label3: TLabel
    Left = 202
    Top = 264
    Width = 141
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
  end
  object Label4: TLabel
    Left = 16
    Top = 120
    Width = 108
    Height = 13
    Caption = #1053#1072' '#1086#1089#1085#1086#1074#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
  end
  object Label5: TLabel
    Left = 15
    Top = 264
    Width = 177
    Height = 13
    Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091' '#1074#1072#1088#1090#1086#1089#1090#1110' '#1087#1088#1086#1076#1091#1082#1094#1110#1111':'
  end
  object Label6: TLabel
    Left = 16
    Top = 80
    Width = 84
    Height = 13
    Caption = #1053#1072' '#1086#1089#1085#1086#1074#1110' '#1087#1083#1072#1085#1091':'
  end
  object Cost_Unit_Meas: TcxButtonEdit
    Left = 16
    Top = 280
    Width = 177
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = Cost_Unit_MeasPropertiesButtonClick
    Style.StyleController = dm.EditStyleController1
    TabOrder = 0
  end
  object NewCost: TcxCheckBox
    Left = 12
    Top = 160
    Width = 217
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1077#1088#1077#1088#1072#1093#1091#1074#1072#1090#1080', '#1079#1074#1072#1078#1072#1102#1095#1080' '#1085#1072' '#1085#1086#1074#1110' '#1094#1110#1085#1080
    TabOrder = 1
  end
  object DocNum: TcxTextEdit
    Left = 16
    Top = 232
    Width = 177
    Height = 21
    Properties.ReadOnly = True
    Style.StyleController = dm.EditStyleController1
    TabOrder = 2
    OnKeyPress = DocNumKeyPress
  end
  object Name_Doc: TcxTextEdit
    Left = 202
    Top = 232
    Width = 177
    Height = 21
    Properties.MaxLength = 60
    Style.StyleController = dm.EditStyleController1
    TabOrder = 3
    Text = #1042#1072#1088#1110#1072#1085#1090' '
    OnKeyPress = Name_DocKeyPress
  end
  object DateTimePicker1: TcxDateEdit
    Left = 202
    Top = 280
    Width = 177
    Height = 21
    Properties.ShowTime = False
    Style.StyleController = dm.EditStyleController1
    TabOrder = 4
    OnKeyPress = DateTimePicker1KeyPress
  end
  object Button1: TcxButton
    Left = 230
    Top = 320
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 5
    OnClick = Button1Click
    LookAndFeel.NativeStyle = False
  end
  object Button2: TcxButton
    Left = 310
    Top = 320
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 6
    OnClick = Button2Click
  end
  object PopupDoc: TcxPopupEdit
    Left = 16
    Top = 136
    Width = 361
    Height = 21
    Properties.PopupControl = Grid
    Properties.PopupSysPanelStyle = True
    Properties.PopupWidth = 361
    Properties.ReadOnly = True
    Properties.OnCloseUp = PopupDocPropertiesCloseUp
    Properties.OnPopup = PopupDocPropertiesPopup
    Style.StyleController = dm.EditStyleController1
    TabOrder = 7
  end
  object RadioGroup: TcxRadioGroup
    Left = 8
    Top = 8
    Width = 377
    Height = 57
    ItemIndex = 0
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #1085#1086#1074#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      end
      item
        Caption = #1085#1072' '#1086#1089#1085#1086#1074#1110' '#1110#1089#1085#1091#1102#1095#1086#1075#1086
      end
      item
        Caption = #1085#1072' '#1086#1089#1085#1086#1074#1110' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1080#1093
      end
      item
        Caption = #1085#1072' '#1086#1089#1085#1086#1074#1110' '#1087#1083#1072#1085#1110#1074' '#1087#1086' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1072#1084
      end>
    TabOrder = 8
    OnClick = RadioButton1Click
    Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103':'
  end
  object UseContracts: TcxCheckBox
    Left = 12
    Top = 176
    Width = 148
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1086#1076#1072#1090#1080' '#1076#1072#1085#1110' '#1079' '#1076#1086#1075#1086#1074#1086#1088#1110#1074
    TabOrder = 9
  end
  object PopupPlan: TcxPopupEdit
    Left = 16
    Top = 96
    Width = 361
    Height = 21
    Properties.PopupControl = dt_Plan_Form1.DepartmentTreeList
    Properties.PopupSysPanelStyle = True
    Properties.PopupWidth = 361
    Properties.ReadOnly = True
    Properties.OnCloseUp = PopupPlanPropertiesCloseUp
    Properties.OnPopup = PopupPlanPropertiesPopup
    Style.StyleController = dm.EditStyleController1
    TabOrder = 10
  end
  object Grid: TcxGrid
    Left = 8
    Top = 312
    Width = 250
    Height = 200
    TabOrder = 11
    Visible = False
    object TableView: TcxGridDBTableView
      OnKeyPress = TableViewKeyPress
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'ID_DOC'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = TableViewCellClick
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = dm.GridStyleSheetDevExpress
      object ID_DOC_COLUMN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_DOC'
      end
      object ID_TYPE_DOC_COLUMN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_TYPE_DOC'
      end
      object NAME_DOC_COLUMN: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 118
        DataBinding.FieldName = 'NAME_DOC'
      end
      object DATE_DOC_COLUMN: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 94
        DataBinding.FieldName = 'DATE_DOC'
      end
      object DATE_REG_COLUMN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'DATE_REG'
      end
      object ID_UNIT_MEAS_COLUMN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_UNIT_MEAS'
      end
      object NAME_UNIT_MEAS_COLUMN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'NAME_UNIT_MEAS'
      end
      object COEFFICIENT_COLUMN: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'COEFFICIENT'
      end
      object IS_SIGNED_COLUMN: TcxGridDBColumn
        Caption = #1055#1110#1076#1087#1080#1089#1072#1085#1086
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 36
        DataBinding.FieldName = 'IS_SIGNED'
      end
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object ActionList1: TActionList
    Left = 160
    Top = 32
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
  object DataSet: TpFIBDataSet
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    SelectSQL.Strings = (
      'select * from SP_DT_PLAN_DOC_SEL(516)')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy'#39' '#1088'.'#39
    Left = 152
    Top = 320
    poSQLINT64ToBCD = True
    poAskRecordCount = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 184
    Top = 320
  end
end
