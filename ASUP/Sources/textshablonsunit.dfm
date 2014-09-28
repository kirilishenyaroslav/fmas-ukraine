inherited TextShablonsForm: TTextShablonsForm
  Left = 269
  Top = 162
  Caption = ''
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited SpGrid: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'TEXT1'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEXT2'
        Width = 308
        Visible = True
      end>
  end
  inherited ResultQuery: TIBQuery
    AfterOpen = ResultQueryAfterOpen
    SQL.Strings = (
      'SELECT * FROM DT_TEXT_SHABLONS_SELECT(:ID_TYPE)')
    Left = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_TYPE'
        ParamType = ptUnknown
      end>
    object ResultQueryID_TEXT_SHABLON: TIntegerField
      FieldName = 'ID_TEXT_SHABLON'
      Origin = 'DT_TEXT_SHABLONS_SELECT.ID_TEXT_SHABLON'
    end
    object ResultQueryTEXT1: TIBStringField
      FieldName = 'TEXT1'
      Origin = 'DT_TEXT_SHABLONS_SELECT.TEXT1'
      Size = 4096
    end
    object ResultQueryTEXT2: TIBStringField
      FieldName = 'TEXT2'
      Origin = 'DT_TEXT_SHABLONS_SELECT.TEXT2'
      Size = 4096
    end
  end
  object CheckQuery: TIBQuery
    AfterOpen = ResultQueryAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *'
      'from   Asup_Jn_Order_Auto a'
      'where  a.Id_Text_Shablon = :id_text_shablon and'
      '       a.Id_User = :id_user')
    Left = 488
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id_text_shablon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id_user'
        ParamType = ptUnknown
      end>
  end
end
