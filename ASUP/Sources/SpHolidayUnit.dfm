inherited SpHolidayForm: TSpHolidayForm
  Left = 161
  Top = 73
  Height = 480
  Caption = 'SpHolidayForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Height = 348
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_HOLIDAY'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME_HOLIDAY'
        Title.Caption = #1053#1072#1079#1074#1072
        Width = 323
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_MAIN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DEFAULT_TERM'
        Title.Caption = #1058#1077#1088#1084#1110#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_PAY'
        Title.Caption = #1054#1087#1083#1072#1095#1091#1108#1090#1100#1089#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_VIDOPL'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VIHOD_TYPE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VIHOD_NAME'
        Title.Caption = #1058#1080#1087' '#1074#1080#1093#1086#1076#1091
        Visible = True
      end>
  end
  inherited SearchFrame: TfmSearch
    Top = 397
  end
  inherited SpDataSource: TDataSource
    Left = 168
    Top = 248
  end
  inherited ResultQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    SQL.Strings = (
      'SELECT * FROM Sp_Holiday_Select')
    Top = 320
    object ResultQueryID_HOLIDAY: TIntegerField
      FieldName = 'ID_HOLIDAY'
      Required = True
    end
    object ResultQueryNAME_HOLIDAY: TIBStringField
      FieldName = 'NAME_HOLIDAY'
      Required = True
      Size = 255
    end
    object ResultQueryIS_MAIN: TIBStringField
      FieldName = 'IS_MAIN'
      Required = True
      Size = 1
    end
    object ResultQueryDEFAULT_TERM: TIntegerField
      FieldName = 'DEFAULT_TERM'
      Required = True
    end
    object ResultQueryIS_PAY: TIBStringField
      FieldName = 'IS_PAY'
      Required = True
      OnGetText = ResultQueryIS_PAYGetText
      Size = 1
    end
    object ResultQueryID_VIDOPL: TIntegerField
      FieldName = 'ID_VIDOPL'
      Origin = 'SP_HOLIDAY.ID_VIDOPL'
    end
    object ResultQueryVIHOD_TYPE: TIntegerField
      FieldName = 'VIHOD_TYPE'
      Origin = 'SP_HOLIDAY.VIHOD_TYPE'
    end
    object ResultQueryVIHOD_NAME: TIBStringField
      FieldName = 'VIHOD_NAME'
      Origin = 'SP_HOLIDAY_SELECT.VIHOD_NAME'
      Size = 5
    end
    object ResultQueryDONT_CALC_HOLIDAYS: TIBStringField
      FieldName = 'DONT_CALC_HOLIDAYS'
      Origin = 'SP_HOLIDAY_SELECT.DONT_CALC_HOLIDAYS'
      FixedChar = True
      Size = 1
    end
  end
  inherited WorkQuery: TIBQuery
    Left = 232
    Top = 328
  end
end
