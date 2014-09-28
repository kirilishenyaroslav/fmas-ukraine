object AddBonusForm: TAddBonusForm
  Left = 42
  Top = 225
  BorderStyle = bsDialog
  ClientHeight = 118
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Name_BonusLabel: TLabel
    Left = 16
    Top = 16
    Width = 92
    Height = 13
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Id_VidOplLabel: TLabel
    Left = 16
    Top = 48
    Width = 72
    Height = 13
    Caption = #1042#1080#1076' '#1086#1087#1083#1072#1090#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FC_Name_Bonus: TFieldControl
    Left = 590
    Top = 16
    Width = 18
    Height = 18
    Control = Name_BonusEdit
    ReadFromField = DetailsQueryName_Bonus
    Title = '"'#1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103'"'
    MaxLength = 100
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object FC_Id_VidOpl: TFieldControl
    Left = 590
    Top = 48
    Width = 18
    Height = 18
    Control = Id_VidOplBox
    ReadFromField = DetailsQueryId_VidOpl
    Title = '"'#1042#1080#1076' '#1086#1087#1083#1072#1090#1080'"'
    MaxLength = 0
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object Name_BonusEdit: TCheckEdit
    Left = 128
    Top = 16
    Width = 457
    Height = 21
    MaxLength = 100
    TabOrder = 0
    Text = 'Name_BonusEdit'
    InputSet = isAll
  end
  object Id_VidOplBox: TSpComboBox
    Left = 128
    Top = 48
    Width = 457
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    ItemCount = 5
    SpOpenItem = '...'#1030#1085#1096#1077
    AutoDrop = True
    SpParams.Table = 'Sp_VidOpl'
    SpParams.IdField = 'Id_VidOpl'
    SpParams.SpFields = 'Name_VidOpl'
    SpParams.Title = #1042#1080#1076#1080' '#1086#1087#1083#1072#1090#1080
    SpParams.ComboField = 'Name_VidOpl, Nachisl'
    SpParams.ColumnNames = #1042#1080#1076' '#1086#1087#1083#1072#1090#1080', '#1053#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103
    SpParams.SelectProcName = 'Sp_VidOpl_Select'
    SpParams.InsertProcName = 'Sp_VidOpl_Insert'
    SpParams.UpdateProcName = 'Sp_VidOpl_Update'
    SpParams.DeleteProcName = 'Sp_VidOpl_Delete'
    SpParams.DontHideFirstColumn = False
    SpParams.SpMode = [spfAdd, spfModify, spfDelete, spfFind, spfSelect, spfExt]
    SpParams.AddFormName = 'AddVidoplForm'
    AlternativeForm = 'SpVidoplForm'
  end
  object OkButton: TBitBtn
    Left = 190
    Top = 80
    Width = 97
    Height = 25
    Caption = #1043#1072#1088#1072#1079#1076
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    OnClick = OkButtonClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888882222288888888822222222288888822222222222888822222222222
      22888222228F22222288222228FFF222222822228F8FF222222822222222FF22
      222822222222FF222228222222222FF22228822222222FF22288822222222222
      2288882222222222288888822222222288888888822222888888}
  end
  object CancelButton: TBitBtn
    Left = 365
    Top = 80
    Width = 97
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888880888888888808880908888888889888999088888880888899998888880
      9888889990888809888888899908809988888888999009988888888889999988
      8888888880999088888888880999990888888800999889908888809999888899
      0888899998888889908889998888888889888888888888888888}
  end
  object DetailsQuery: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT Name_Bonus,Id_VidOpl FROM Sp_Bonus WHERE Id_Bonus = :Id_B' +
        'onus')
    Left = 16
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Bonus'
        ParamType = ptUnknown
      end>
    object DetailsQueryName_Bonus: TIBStringField
      FieldName = 'Name_Bonus'
      Size = 100
    end
    object DetailsQueryId_VidOpl: TIntegerField
      FieldName = 'Id_VidOpl'
    end
  end
end
