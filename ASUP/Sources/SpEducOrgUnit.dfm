inherited SpEducOrgForm: TSpEducOrgForm
  Left = 297
  Top = 237
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1085#1072#1074#1095#1072#1083#1100#1085#1080#1093' '#1079#1072#1082#1083#1072#1076#1110#1074
  ClientHeight = 428
  ClientWidth = 686
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    Width = 686
  end
  inherited SpGrid: TDBGrid
    Width = 686
    Height = 323
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME_FULL'
        Title.Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
        Width = 347
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_SHORT'
        Title.Caption = #1057#1082#1086#1088#1086#1095'. '#1085#1072#1079#1074#1072
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AKREDITATION'
        Title.Caption = #1040#1082#1088#1077#1076#1080#1090#1072#1094#1110#1103
        Width = 98
        Visible = True
      end>
  end
  inherited SearchFrame: TfmSearch
    Top = 372
    Width = 686
    inherited AllLabel: TLabel
      Left = 562
    end
  end
  inherited ResultQuery: TIBQuery
    SQL.Strings = (
      
        'SELECT Id_Org,Name_Full,Name_Short,Id_Adress,Akreditation,Is_Lea' +
        'rning,'
      'Is_Kvalif'
      'FROM Sp_EducOrg'
      'ORDER BY NAME_FULL')
    object ResultQueryID_ORG: TIntegerField
      FieldName = 'ID_ORG'
      Required = True
    end
    object ResultQueryNAME_SHORT: TIBStringField
      FieldName = 'NAME_SHORT'
      Required = True
      Size = 15
    end
    object ResultQueryID_ADRESS: TIntegerField
      FieldName = 'ID_ADRESS'
    end
    object ResultQueryAKREDITATION: TIntegerField
      FieldName = 'AKREDITATION'
      Required = True
    end
    object ResultQueryIS_LEARNING: TIntegerField
      FieldName = 'IS_LEARNING'
      OnGetText = ResultQueryIS_LEARNINGGetText
    end
    object ResultQueryIS_KVALIF: TIntegerField
      FieldName = 'IS_KVALIF'
      OnGetText = ResultQueryIS_KVALIFGetText
    end
    object ResultQueryNAME_FULL: TIBStringField
      FieldName = 'NAME_FULL'
      Required = True
      Size = 255
    end
  end
  object SearchQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT ID_ORG FROM SP_EDUCORG WHERE NAME_FULL CONTAINS :FILTER')
    Left = 176
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FILTER'
        ParamType = ptUnknown
      end>
  end
end
