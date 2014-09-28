object fFamilyEdit: TfFamilyEdit
  Left = 264
  Top = 190
  BorderStyle = bsDialog
  Caption = #1056#1086#1076#1080#1085#1072
  ClientHeight = 134
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 8
    Width = 151
    Height = 13
    Caption = #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103' '#1090#1072' '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110':'
  end
  object Label2: TLabel
    Left = 10
    Top = 56
    Width = 54
    Height = 13
    Caption = #1042#1110#1076#1085#1086#1089#1080#1085#1080':'
  end
  object FIOEdit: TcxTextEdit
    Left = 4
    Top = 24
    Width = 399
    Height = 21
    TabOrder = 0
  end
  object BirthDateEdit: TcxDateEdit
    Left = 241
    Top = 72
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object RelationsComboBox: TcxLookupComboBox
    Left = 5
    Top = 72
    Width = 188
    Height = 21
    Properties.KeyFieldNames = 'ID_RELATION'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_RELATION'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = RelationsDataSource
    Properties.OnChange = RelationsComboBoxPropertiesChange
    TabOrder = 1
  end
  object OkBtn: TcxButton
    Left = 248
    Top = 104
    Width = 75
    Height = 25
    Action = OkAction
    TabOrder = 3
  end
  object cxButton1: TcxButton
    Left = 328
    Top = 104
    Width = 75
    Height = 25
    Action = CancelAction
    TabOrder = 4
  end
  object UseDateChB: TcxCheckBox
    Left = 198
    Top = 48
    Width = 204
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = UseDateChBPropertiesChange
    Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1076#1072#1090#1091' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
    TabOrder = 5
  end
  object RelationsDataSet: TpFIBDataSet
    Database = DB
    Transaction = ReadTransaction
    SelectSQL.Strings = (
      'SELECT'
      '    ID_RELATION,'
      '    NAME_RELATION,'
      '    ID_SEX,'
      '    UNIQUE_REL'
      'FROM'
      '    INI_FAMILY_RELATION'
      ' ')
    Left = 40
    Top = 96
    poSQLINT64ToBCD = True
    object RelationsDataSetID_RELATION: TFIBIntegerField
      FieldName = 'ID_RELATION'
    end
    object RelationsDataSetNAME_RELATION: TFIBStringField
      FieldName = 'NAME_RELATION'
      EmptyStrToNull = True
    end
    object RelationsDataSetID_SEX: TFIBIntegerField
      FieldName = 'ID_SEX'
    end
    object RelationsDataSetUNIQUE_REL: TFIBStringField
      FieldName = 'UNIQUE_REL'
      Size = 1
      EmptyStrToNull = True
    end
  end
  object RelationsDataSource: TDataSource
    DataSet = RelationsDataSet
    Left = 72
    Top = 96
  end
  object DB: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 104
    Top = 96
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    Left = 136
    Top = 96
  end
  object ActionList1: TActionList
    Left = 136
    Top = 40
    object OkAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
