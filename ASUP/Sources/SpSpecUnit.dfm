inherited SpecForm: TSpecForm
  Left = 43
  Top = 27
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#39#1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100#39
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_SPEC'
        Title.Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
        Visible = True
      end>
  end
  inherited ResultQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.WriteTransaction
    SQL.Strings = (
      
        'SELECT ID_SPEC,NAME_SPEC FROM SP_SPEC WHERE NOT(ID_SPEC BETWEEN ' +
        '-10 AND 0) ORDER BY NAME_SPEC')
    object ResultQueryID_SPEC: TIntegerField
      FieldName = 'ID_SPEC'
      Origin = 'SP_SPEC.ID_SPEC'
      Required = True
    end
    object ResultQueryNAME_SPEC: TIBStringField
      FieldName = 'NAME_SPEC'
      Origin = 'SP_SPEC.NAME_SPEC'
      Required = True
      Size = 150
    end
  end
end
