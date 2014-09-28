inherited SpTarDigitsForm: TSpTarDigitsForm
  Left = 27
  Top = 90
  Width = 750
  Height = 479
  Caption = #1056#1086#1079#1088#1103#1076#1080' '#1090#1072#1088#1080#1092#1085#1080#1093' '#1089#1110#1090#1086#1082
  Constraints.MinWidth = 750
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDD
    DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00
    00000000000000000000000000DDDD0FFFFFFFFFFFFFFFFFFFFFFFFFF0DDDD00
    00000000000000000000000000DDDD0FFFFFFFFFFFFFFFFFFFFFFFFFF0DDDD0F
    000FFFFFFFFF0F000F0FFF0FF0DDDD0FFFF0FFFFFFFF0FFF0FFFFF0FF0DDDD0F
    FFF0FFFFFFFF0FFF0FFFF000F0DDDD0FFF0FF000FF000F000FFFFF0FF0DDDD0F
    FFF0FFFFFF0F0F0FFFFFFF0FF0DDDD0F0000FFFFFF0F0F000FFF000FF0DDDD0F
    FFFFFFFFFFFFFFFFFFFFFFFFF0DDDD0000000000000000000000000000DDDD0F
    0000FFFFFF000FFFF0F0F000F0DDDD0FF0FFFFFFFFFFF0FFF0FFF0F0F0DDDD0F
    FF0FFFFFFFFFF0FFF0FFF000F0DDDD0FFFF0F000FFFF0FF000FFF0FFF0DDDD0F
    0FF0FFFFFFFFF0F0F0FFF0FFF0DDDD0FF00FFFFFFF0000F0F0FFF000F0DDDD0F
    FFFFFFFFFFFFFFFFFFFFFFFFF0DDDD0000000000000000000000000000DDDD0F
    F000FFFFFFF000F00FF0F000F0DDDD0FFF0FFFFFFFF0FFFFF0FFF0F0F0DDDD0F
    FF0FFFFFFFFF0FFFF0FFFFF0F0DDDD0F0F0FF000FFFFF0FF0FFFF00FF0DDDD0F
    F00FFFFFFF0FF0FFF0FFF0FFF0DDDD0FFF0FFFFFFFF00FF000FFF000F0DDDD0F
    FFFFFFFFFFFFFFFFFFFFFFFFF0DDDD0000000000000000000000000000DDDDDD
    DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    Width = 742
    TabOrder = 3
    inherited OkButton: TSpeedButton
      Left = 585
    end
    inherited CancelButton: TSpeedButton
      Left = 654
    end
  end
  inherited SpGrid: TDBGrid
    Top = 85
    Width = 742
    Height = 304
    TabOrder = 0
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_DIGIT'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMENT'
        Width = 269
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOEFICIENT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STAVKA'
        Width = 279
        Visible = True
      end>
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 49
    Width = 742
    Height = 36
    Align = alTop
    TabOrder = 2
    object TarNetLabel: TLabel
      Left = 8
      Top = 8
      Width = 91
      Height = 13
      Caption = #1058#1072#1088#1080#1092#1085#1072' '#1089#1110#1090#1082#1072':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TarNetBox: TSpComboBox
      Left = 112
      Top = 4
      Width = 553
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = TarNetBoxChange
      OnEnter = TarNetBoxEnter
      ItemCount = 8
      SpOpenItem = '* '#1044#1086#1074#1110#1076#1085#1080#1082' ...'
      AutoDrop = True
      SpParams.Table = 'Sp_Tar_Net'
      SpParams.IdField = 'Id_Tar_Net'
      SpParams.SpFields = 'Name_Tar_Net, Name_Tar_Plan'
      SpParams.Title = #1058#1072#1088#1080#1092#1085#1110' '#1089#1110#1090#1082#1080
      SpParams.ComboField = 'Name_Tar_Net'
      SpParams.ColumnNames = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1089#1110#1090#1082#1080','#1057#1090#1072#1074#1082#1072' '#1087#1077#1088#1096#1086#1075#1086' '#1088#1086#1079#1088#1103#1076#1091','#1055#1086#1095#1072#1090#1086#1082','#1050#1110#1085#1077#1094#1100
      SpParams.SelectProcName = 'Sp_Tar_Net_Select'
      SpParams.InsertProcName = 'Sp_Tar_Net_Select'
      SpParams.DeleteProcName = 'Sp_Tar_Net_Delete'
      SpParams.DontHideFirstColumn = False
      SpParams.SpMode = [spfAdd, spfModify, spfDelete, spfFind, spfSelect]
      AlternativeForm = 'SpTarNetForm'
    end
  end
  inherited SearchFrame: TfmSearch
    Top = 389
    Width = 742
    TabOrder = 1
    inherited AllLabel: TLabel
      Left = 618
    end
  end
  inherited ResultQuery: TIBQuery
    SQL.Strings = (
      'SELECT * FROM Tar_Nets_Select(:Id_Tar_Net)')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id_Tar_Net'
        ParamType = ptUnknown
      end>
    object ResultQueryNUM_DIGIT: TIntegerField
      DisplayLabel = #1056#1086#1079#1088#1103#1076
      FieldKind = fkInternalCalc
      FieldName = 'NUM_DIGIT'
      ReadOnly = True
    end
    object ResultQueryCOMMENT: TIBStringField
      DisplayLabel = #1050#1086#1084#1077#1085#1090#1072#1088
      FieldName = 'COMMENT'
      Origin = 'TAR_NETS_SELECT.COMMENT'
      Size = 50
    end
    object ResultQueryKOEFICIENT: TIBBCDField
      DisplayLabel = #1050#1086#1077#1092#1110#1094#1110#1108#1085#1090
      FieldKind = fkInternalCalc
      FieldName = 'KOEFICIENT'
      ReadOnly = True
      Precision = 9
      Size = 3
    end
    object ResultQuerySTAVKA: TIBBCDField
      DisplayLabel = #1057#1090#1072#1074#1082#1072
      FieldKind = fkInternalCalc
      FieldName = 'STAVKA'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object ResultQueryNAME_TAR_NET: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NAME_TAR_NET'
      ReadOnly = True
      Size = 100
    end
  end
end
