inherited WorkRegForm: TWorkRegForm
  Left = 46
  Top = 91
  Width = 849
  Height = 494
  Caption = ''
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    Width = 841
    inherited OkButton: TSpeedButton
      Left = 722
    end
    inherited CancelButton: TSpeedButton
      Left = 782
    end
  end
  inherited SpGrid: TDBGrid
    Top = 81
    Width = 841
    Height = 330
    DefaultDrawing = False
    OnDrawColumnCell = SpGridDrawColumnCell
  end
  inherited SearchFrame: TfmSearch
    Top = 411
    Width = 841
    inherited AllLabel: TLabel
      Left = 717
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 49
    Width = 841
    Height = 32
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 80
      Height = 13
      Caption = #1056#1077#1078#1080#1084' '#1087#1088#1072#1094#1110':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object WorkModeBox: TSpComboBox
      Left = 112
      Top = 4
      Width = 281
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = WorkModeBoxChange
      OnEnter = WorkModeBoxEnter
      ItemCount = 5
      SpOpenItem = '...'#1030#1085#1096#1077
      AutoDrop = True
      SpParams.IdField = 'Id_Work_Mode'
      SpParams.SpFields = 'Name'
      SpParams.Title = #1056#1077#1078#1080#1084#1080' '#1087#1088#1072#1094#1110
      SpParams.ComboField = 'Name'
      SpParams.ColumnNames = #1053#1086#1084#1077#1088','#1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103','#1057#1082#1086#1088#1086#1095#1077#1085#1085#1103','#1055#1086#1095#1072#1090#1086#1082' '#1085#1086#1095#1110','#1050#1110#1085#1077#1094#1100' '#1085#1086#1095#1110
      SpParams.SelectProcName = 'Dt_Work_Mode_Select'
      SpParams.InsertProcName = 'Dt_Work_Mode_Insert'
      SpParams.UpdateProcName = 'Dt_Work_Mode_Update'
      SpParams.DeleteProcName = 'Dt_Work_Mode_Delete'
      SpParams.DontHideFirstColumn = False
      SpParams.SpMode = [spfAdd, spfModify, spfDelete, spfFind, spfSelect, spfExt]
      SpParams.AddFormName = 'AddWorkModeForm'
    end
    object DecBox: TCheckBox
      Left = 536
      Top = 5
      Width = 177
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080' '#1091' '#1089#1086#1090#1080#1093' '#1076#1086#1083#1103#1093
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = DecBoxClick
    end
  end
  inherited ResultQuery: TIBQuery
    AfterOpen = ResultQueryAfterOpen
    OnCalcFields = ResultQueryCalcFields
    SQL.Strings = (
      'SELECT * FROM Dt_WorkReg_Select(:Id_Work_Mode)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Work_Mode'
        ParamType = ptUnknown
      end>
    object ResultQueryID_DAY_WEEK: TIntegerField
      DisplayLabel = #1044#1077#1085#1100
      FieldName = 'ID_DAY_WEEK'
      Origin = 'DT_WORKREG_SELECT.ID_DAY_WEEK'
    end
    object ResultQueryWORK_BEG: TTimeField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082' '#1088#1086#1073#1086#1090#1080
      FieldName = 'WORK_BEG'
      Origin = 'DT_WORKREG_SELECT.WORK_BEG'
      OnGetText = ResultQueryWORK_BEGGetText
    end
    object ResultQueryWORK_END: TTimeField
      DisplayLabel = #1050#1110#1085#1077#1094#1100' '#1088#1086#1073#1086#1090#1080
      FieldName = 'WORK_END'
      Origin = 'DT_WORKREG_SELECT.WORK_END'
      OnGetText = ResultQueryWORK_BEGGetText
    end
    object ResultQueryBREAK_BEG: TTimeField
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1077#1088#1074#1080
      FieldName = 'BREAK_BEG'
      Origin = 'DT_WORKREG_SELECT.BREAK_BEG'
    end
    object ResultQueryBREAK_END: TTimeField
      DisplayLabel = #1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1077#1088#1074#1080
      FieldName = 'BREAK_END'
      Origin = 'DT_WORKREG_SELECT.BREAK_END'
    end
    object ResultQuerySmena: TStringField
      DisplayLabel = #1058#1088#1080#1074#1072#1083#1110#1089#1090#1100' '#1079#1084#1110#1085#1080
      FieldKind = fkCalculated
      FieldName = 'Smena'
      Calculated = True
    end
    object ResultQueryHours: TStringField
      DisplayLabel = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1075#1086#1076#1080#1085
      FieldKind = fkCalculated
      FieldName = 'Hours'
      Calculated = True
    end
    object ResultQueryTODAY_HOURS: TIBBCDField
      FieldName = 'TODAY_HOURS'
      Origin = 'DT_WORKREG_SELECT.TODAY_HOURS'
      Visible = False
      Precision = 9
      Size = 3
    end
    object ResultQueryTOMORROW_HOURS: TIBBCDField
      FieldName = 'TOMORROW_HOURS'
      Origin = 'DT_WORKREG_SELECT.TOMORROW_HOURS'
      Visible = False
      Precision = 9
      Size = 3
    end
  end
  object BufferQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT First_PBKey, Last_PBKey FROM ASUP_LTD_ONE_DT_TIME_EXPORT(' +
        ':Id_Work_Mode)')
    Left = 368
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Work_Mode'
        ParamType = ptUnknown
      end>
  end
end
