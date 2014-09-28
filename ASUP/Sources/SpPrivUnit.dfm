inherited SpPrivForm: TSpPrivForm
  Left = 175
  Top = 68
  Height = 462
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1087#1110#1083#1100#1075
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Height = 330
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_PRIV'
        Title.Caption = #1055#1110#1083#1100#1075#1072
        Width = 288
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_PRIV_TYPE'
        Title.Caption = #1058#1080#1087' '#1087#1110#1083#1100#1075#1080
        Width = 231
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
      'SELECT P. Id_Privelege, S.Id_Priv_Type,Name_Priv,Name_Priv_Type'
      'FROM Sp_Privelege P,  Sp_Priv_Type S'
      'WHERE'
      'P.Id_Priv_Type=S.Id_Priv_Type')
    object ResultQueryID_PRIVELEGE: TIntegerField
      FieldName = 'ID_PRIVELEGE'
      Required = True
    end
    object ResultQueryID_PRIV_TYPE: TIntegerField
      FieldName = 'ID_PRIV_TYPE'
      Required = True
    end
    object ResultQueryNAME_PRIV: TIBStringField
      FieldName = 'NAME_PRIV'
      Size = 50
    end
    object ResultQueryNAME_PRIV_TYPE: TIBStringField
      FieldName = 'NAME_PRIV_TYPE'
      Size = 50
    end
  end
end
