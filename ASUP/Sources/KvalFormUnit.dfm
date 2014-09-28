inherited KvalForm: TKvalForm
  Left = 114
  Top = 43
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1082#1074#1072#1083#1110#1092#1110#1082#1072#1094#1110#1081
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_KVAL'
        Title.Caption = #1050#1074#1072#1083#1110#1092#1110#1082#1072#1094#1110#1103
        Visible = True
      end>
  end
  inherited ResultQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.WriteTransaction
    SQL.Strings = (
      
        'SELECT ID_KVAL,NAME_KVAL FROM SP_KVALIFICATION WHERE NOT(ID_KVAL' +
        ' BETWEEN -10 AND 0) ORDER BY NAME_KVAL')
    object ResultQueryNAME_KVAL: TIBStringField
      FieldName = 'NAME_KVAL'
      Origin = 'SP_KVALIFICATION.NAME_KVAL'
      Required = True
      Size = 255
    end
    object ResultQueryID_KVAL: TIntegerField
      FieldName = 'ID_KVAL'
      Origin = 'SP_KVALIFICATION.ID_KVAL'
      Required = True
    end
  end
end
