inherited SpWarpostForm: TSpWarpostForm
  Left = 169
  Top = 69
  Height = 471
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082': '#1042#1110#1081#1089#1100#1082#1086#1074#1110' '#1079#1074#1072#1085#1085#1103
  Constraints.MinWidth = 524
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Height = 339
    Constraints.MinHeight = 100
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_WARPOST'
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_WARSOSTAV'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_WARPOSTGR'
        Width = 97
        Visible = True
      end>
  end
  inherited SearchFrame: TfmSearch
    Top = 388
  end
  inherited ResultQuery: TIBQuery
    object ResultQueryID_WARPOST: TIntegerField
      FieldName = 'ID_WARPOST'
      Required = True
    end
    object ResultQueryNAME_WARPOST: TIBStringField
      DisplayLabel = #1042#1110#1081#1089#1082#1086#1074#1077' '#1079#1074#1072#1085#1085#1103
      FieldName = 'NAME_WARPOST'
      Required = True
      Size = 50
    end
    object ResultQueryID_WARSOSTAV: TIntegerField
      FieldName = 'ID_WARSOSTAV'
      Required = True
    end
    object ResultQueryNAME_WARSOSTAV: TIBStringField
      DisplayLabel = #1042#1110#1081#1089#1082#1086#1074#1080#1081' '#1089#1082#1083#1072#1076
      FieldName = 'NAME_WARSOSTAV'
      Required = True
      Size = 50
    end
    object ResultQueryNAME_WARPOSTGR: TIBStringField
      DisplayLabel = #1043#1088#1091#1087#1072' '#1086#1073#1083#1110#1082#1091
      FieldName = 'NAME_WARPOSTGR'
      Size = 50
    end
  end
end
