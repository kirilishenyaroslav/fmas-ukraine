inherited SpWarSostavForm: TSpWarSostavForm
  Left = 55
  Top = 108
  Height = 428
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082': '#1042#1110#1081#1089#1100#1082#1086#1074#1110' '#1089#1082#1083#1072#1076#1080
  Constraints.MinWidth = 524
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Height = 296
    Constraints.MinHeight = 100
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_WARSOSTAV'
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_WARPOSTGR'
        Width = 159
        Visible = True
      end>
  end
  inherited SearchFrame: TfmSearch
    Top = 345
  end
  inherited SpDataSource: TDataSource
    Left = 376
    Top = 48
  end
  inherited ResultQuery: TIBQuery
    Left = 248
    Top = 208
    object ResultQueryID_WARSOSTAV: TIntegerField
      FieldName = 'ID_WARSOSTAV'
      Required = True
    end
    object ResultQueryNAME_WARSOSTAV: TIBStringField
      DisplayLabel = #1042#1110#1081#1089#1100#1082#1086#1074#1080#1081' '#1089#1082#1083#1072#1076
      FieldName = 'NAME_WARSOSTAV'
      Required = True
      Size = 50
    end
    object ResultQueryNAME_WARPOSTGR: TIBStringField
      DisplayLabel = #1043#1088#1091#1087#1072' '#1086#1073#1083#1110#1082#1091
      FieldName = 'NAME_WARPOSTGR'
      Size = 50
    end
    object ResultQueryID_WARPOSTGR: TIntegerField
      FieldName = 'ID_WARPOSTGR'
      Required = True
    end
  end
  inherited WorkQuery: TIBQuery
    Left = 416
    Top = 48
  end
end
