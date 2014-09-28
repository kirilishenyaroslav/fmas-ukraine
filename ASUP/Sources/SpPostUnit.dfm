inherited SpPostForm: TSpPostForm
  Left = 133
  Top = 68
  Width = 750
  Height = 493
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1087#1086#1089#1072#1076
  Constraints.MinHeight = 400
  Constraints.MinWidth = 750
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    Width = 742
    inherited OkButton: TSpeedButton
      Left = 497
    end
    inherited CancelButton: TSpeedButton
      Left = 566
    end
  end
  inherited SpGrid: TDBGrid
    Width = 742
    Height = 354
    Columns = <
      item
        Expanded = False
        FieldName = 'POST_CODE'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_POST'
        Width = 326
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_CATEGORY'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_WORK_COND'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOLIDAY_LONG'
        Width = 81
        Visible = True
      end>
  end
  inherited SearchFrame: TfmSearch
    Top = 403
    Width = 742
    inherited AllLabel: TLabel
      Left = 618
    end
  end
  inherited ResultQuery: TIBQuery
    SQL.Strings = (
      'SELECT Id_Post, P.Id_Category, Post_Code,'
      ' Name_Category, Name_Post, Holiday_Long, Name_Work_Cond'
      'FROM Sp_Post P, Sp_Category C, Ini_Work_Cond W'
      'WHERE P.Id_Category = C.Id_Category'
      'AND W.Id_Work_Cond = P.Id_Work_Cond'
      'ORDER BY Name_Post')
    object ResultQueryID_POST: TIntegerField
      FieldName = 'ID_POST'
      Required = True
    end
    object ResultQueryPOST_CODE: TIBStringField
      DisplayLabel = #1050#1086#1076' '#1087#1086#1089#1072#1076#1080
      FieldName = 'POST_CODE'
      Required = True
      Size = 10
    end
    object ResultQueryNAME_CATEGORY: TIBStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      FieldName = 'NAME_CATEGORY'
      Required = True
      Size = 25
    end
    object ResultQueryNAME_POST: TIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1087#1086#1089#1072#1076#1080
      FieldName = 'NAME_POST'
      Required = True
      Size = 100
    end
    object ResultQueryHOLIDAY_LONG: TIntegerField
      DisplayLabel = #1042#1110#1076#1087#1091#1089#1090#1082#1072
      FieldName = 'HOLIDAY_LONG'
      Required = True
    end
    object ResultQueryID_CATEGORY: TIntegerField
      FieldName = 'ID_CATEGORY'
      Required = True
    end
    object ResultQueryNAME_WORK_COND: TIBStringField
      DisplayLabel = #1059#1084#1086#1074#1080' '#1087#1088#1072#1094#1110
      FieldName = 'NAME_WORK_COND'
      Size = 255
    end
  end
  inherited WorkQuery: TIBQuery
    Left = 248
  end
  object BufferQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT First_PBKey, Last_PBKey FROM Asup_Ltd_Sp_Post_Delete(:Id_' +
        'Post)')
    Left = 288
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Post'
        ParamType = ptUnknown
      end>
  end
end
