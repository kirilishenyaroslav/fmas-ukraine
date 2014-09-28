inherited SpWorkTimeForm: TSpWorkTimeForm
  Left = 77
  Top = 78
  Height = 462
  Caption = #1053#1086#1088#1084#1080' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Height = 330
  end
  inherited SearchFrame: TfmSearch
    Top = 379
  end
  inherited ResultQuery: TIBQuery
    SQL.Strings = (
      'SELECT * FROM dt_WorkTimeNorm_Select')
    object ResultQueryWTYEAR: TIntegerField
      DisplayLabel = #1056#1110#1082
      FieldKind = fkInternalCalc
      FieldName = 'WTYEAR'
      ReadOnly = True
    end
    object ResultQueryWTMONTH: TIntegerField
      DisplayLabel = #1052#1110#1089#1103#1094#1100
      FieldKind = fkInternalCalc
      FieldName = 'WTMONTH'
      ReadOnly = True
      OnGetText = ResultQueryWTMONTHGetText
    end
    object ResultQueryKOL_HOURS: TIBBCDField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1090#1088#1080#1074#1072#1083#1086#1089#1090#1110' '#1088#1086#1073#1086#1095#1086#1075#1086' '#1095#1072#1089#1091
      FieldKind = fkInternalCalc
      FieldName = 'KOL_HOURS'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
  end
end
