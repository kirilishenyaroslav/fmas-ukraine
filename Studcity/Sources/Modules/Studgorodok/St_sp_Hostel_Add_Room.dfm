object BuildsFormAddRoom: TBuildsFormAddRoom
  Left = 365
  Top = 218
  BorderStyle = bsSingle
  Caption = #1082#1086#1084#1085#1072#1090#1091
  ClientHeight = 107
  ClientWidth = 284
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
  object OKButton: TcxButton
    Left = 118
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 198
    Top = 72
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 57
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object RoomLabel: TcxLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 17
      TabOrder = 0
      Caption = #1050#1086#1084#1085#1072#1090#1072
    end
    object RoomEdit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 65
      Height = 21
      BeepOnEnter = False
      Properties.MaxLength = 5
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 80
      Top = 8
      Width = 27
      Height = 17
      TabOrder = 2
      Caption = #1058#1080#1087
    end
    object TypeEdit: TcxPopupEdit
      Left = 80
      Top = 24
      Width = 177
      Height = 21
      Properties.PopupControl = cxGrid1
      Properties.PopupHeight = 100
      Properties.PopupMinHeight = 60
      Properties.PopupSizeable = False
      Properties.PopupWidth = 177
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 3
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 96
    Width = 177
    Height = 60
    BorderStyle = cxcbsNone
    TabOrder = 3
    Visible = False
    LookAndFeel.Kind = lfUltraFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGrid1DBTableView1CellClick
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.Background = BuildsForm.cxStyle2
      Styles.Content = BuildsForm.cxStyle2
      object cxGrid1DBTableView1ID_TYPE_ROOM: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID_TYPE_ROOM'
      end
      object cxGrid1DBTableView1NAME_TYPE_ROOM: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignmentHorz = taCenter
        DataBinding.FieldName = 'NAME_TYPE_ROOM'
      end
      object cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SHORT_NAME'
      end
      object cxGrid1DBTableView1MAX_PEOPLE_COUNT: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'MAX_PEOPLE_COUNT'
      end
      object cxGrid1DBTableView1SIZE: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'SIZE'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DataModule1.pFIBDatabase1
    Transaction = DataModule1.ReadTransaction2
    SelectSQL.Strings = (
      'select * from ST_INI_TYPE_ROOM_SELECT')
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 144
    Top = 8
    poSQLINT64ToBCD = True
  end
  object DataSource1: TDataSource
    DataSet = pFIBDataSet1
    Left = 176
    Top = 8
  end
end
