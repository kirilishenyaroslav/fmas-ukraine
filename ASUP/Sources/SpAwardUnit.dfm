inherited SpAwardForm: TSpAwardForm
  Left = 71
  Top = 47
  Height = 462
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1079#1072#1086#1093#1086#1095#1077#1085#1100
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Height = 330
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_AWARD'
        Title.Caption = #1047#1072#1086#1093#1086#1095#1077#1085#1085#1103
        Width = 338
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_AWARD_TYPE'
        Title.Caption = #1058#1080#1087' '#1079#1072#1086#1093#1086#1095#1077#1085#1085#1103
        Width = 165
        Visible = True
      end>
  end
  inherited SearchFrame: TfmSearch
    Top = 379
  end
  inherited ResultQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    SQL.Strings = (
      'SELECT P. Id_Award, S.Id_Award_Type,Name_Award,Name_Award_Type'
      'FROM Sp_Award P,  Sp_Award_Type S'
      'WHERE'
      'P.Id_Award_Type=S.Id_Award_Type')
    object ResultQueryID_AWARD: TIntegerField
      FieldName = 'ID_AWARD'
      Required = True
    end
    object ResultQueryID_AWARD_TYPE: TIntegerField
      FieldName = 'ID_AWARD_TYPE'
      Required = True
    end
    object ResultQueryNAME_AWARD: TIBStringField
      FieldName = 'NAME_AWARD'
      Size = 50
    end
    object ResultQueryNAME_AWARD_TYPE: TIBStringField
      FieldName = 'NAME_AWARD_TYPE'
      Size = 50
    end
  end
end
