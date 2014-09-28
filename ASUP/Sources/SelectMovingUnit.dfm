object SelectMovingForm: TSelectMovingForm
  Left = 257
  Top = 283
  Width = 523
  Height = 294
  Caption = #1055#1086#1089#1072#1076#1080
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 515
    Height = 260
    Align = alClient
    Color = clInfoBk
    DataSource = ManMovingSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_DEPARTMENT_SHORT'
        Title.Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POST'
        Title.Caption = #1055#1086#1089#1072#1076#1072
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_STAVOK'
        Title.Caption = #1050#1110#1083'. '#1089#1090#1072#1074#1086#1082
        Width = 69
        Visible = True
      end>
  end
  object ManMovingQuery: TIBQuery
    Database = Main.ChermetDatabase
    Transaction = Main.DefaultTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM GET_PCARD_MOVINGS(:ID_PCARD,'#39'NOW'#39')')
    Left = 464
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PCARD'
        ParamType = ptUnknown
      end>
    object ManMovingQueryID_MAN_MOVING: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ID_MAN_MOVING'
      ReadOnly = True
    end
    object ManMovingQueryNAME_DEPARTMENT_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NAME_DEPARTMENT_FULL'
      ReadOnly = True
      Size = 255
    end
    object ManMovingQueryNAME_DEPARTMENT_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NAME_DEPARTMENT_SHORT'
      ReadOnly = True
      Size = 50
    end
    object ManMovingQueryPOST: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'POST'
      ReadOnly = True
      Size = 100
    end
    object ManMovingQueryDATE_BEG: TDateField
      FieldKind = fkInternalCalc
      FieldName = 'DATE_BEG'
      ReadOnly = True
    end
    object ManMovingQueryDATE_END: TDateField
      FieldKind = fkInternalCalc
      FieldName = 'DATE_END'
      ReadOnly = True
    end
    object ManMovingQueryKOL_STAVOK: TIBBCDField
      FieldKind = fkInternalCalc
      FieldName = 'KOL_STAVOK'
      ReadOnly = True
      Precision = 9
      Size = 4
    end
    object ManMovingQueryID_SHTATRAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ID_SHTATRAS'
      ReadOnly = True
    end
  end
  object ManMovingSource: TDataSource
    DataSet = ManMovingQuery
    Left = 432
    Top = 224
  end
end
