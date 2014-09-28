inherited SpStajForm: TSpStajForm
  Left = 79
  Top = 70
  Height = 427
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082':'#1057#1090#1072#1078
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Height = 295
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_STAJ'
        Title.Caption = #1057#1090#1072#1078
        Width = 326
        Visible = True
      end>
  end
  inherited SearchFrame: TfmSearch
    Top = 344
  end
  inherited ResultQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    SQL.Strings = (
      'SELECT Id_staj,Name_staj,Is_Default'
      'FROM INI_STAJ')
    object ResultQueryID_STAJ: TIntegerField
      FieldName = 'ID_STAJ'
      Required = True
    end
    object ResultQueryNAME_STAJ: TIBStringField
      FieldName = 'NAME_STAJ'
      Size = 50
    end
    object ResultQueryIS_DEFAULT: TIBStringField
      FieldName = 'IS_DEFAULT'
      OnGetText = ResultQueryIS_DEFAULTGetText
      Size = 1
    end
  end
end
