object SetInitOptions_Form: TSetInitOptions_Form
  Left = 480
  Top = 331
  BorderStyle = bsDialog
  Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1087#1077#1088#1074#1080#1085#1085#1086#1111' '#1110#1085#1110#1094#1110#1072#1083#1110#1079#1072#1094#1110#1111
  ClientHeight = 127
  ClientWidth = 345
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
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 329
    Height = 57
    Brush.Style = bsClear
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 205
    Height = 13
    Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1087#1077#1088#1074#1080#1085#1085#1091' '#1110#1085#1110#1094#1110#1072#1083#1110#1079#1072#1094#1110#1102' '#1090#1072#1073#1083#1080#1094#1110':'
  end
  object TableComboBox: TcxDBLookupComboBox
    Left = 16
    Top = 32
    Width = 313
    Height = 21
    DataBinding.DataField = 'NAME_TABLE'
    DataBinding.DataSource = MemDataSource
    Properties.ImmediatePost = True
    Properties.KeyFieldNames = 'NAME_TABLE'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_TABLE'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DataSource
    Style.Color = 16247513
    TabOrder = 0
    OnKeyPress = TableComboBoxKeyPress
  end
  object ApplyButton: TcxButton
    Left = 180
    Top = 93
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 2
    OnClick = ApplyButtonClick
  end
  object CancelButton: TcxButton
    Left = 262
    Top = 93
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object CheckBox: TcxCheckBox
    Left = 12
    Top = 64
    Width = 233
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1080#1075#1088#1091#1079#1080#1090#1080' '#1076#1072#1085#1110' '#1083#1080#1096#1077' '#1087#1086#1090#1086#1095#1085#1086#1075#1086' '#1089#1077#1088#1074#1077#1088#1091
    TabOrder = 1
  end
  object MemoryData: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'NAME_TABLE'
        DataType = ftString
        Size = 32
      end>
    Left = 56
    Top = 64
  end
  object DataSet: TpFIBDataSet
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    SelectSQL.Strings = (
      'select * from EXCH_PROC_ALL_TABLES_SELECT'
      'order by NAME_TABLE')
    Left = 88
    Top = 64
    poSQLINT64ToBCD = True
  end
  object DataSource: TDataSource
    DataSet = DataSet
    Left = 88
    Top = 96
  end
  object MemDataSource: TDataSource
    DataSet = MemoryData
    Left = 56
    Top = 96
  end
end
