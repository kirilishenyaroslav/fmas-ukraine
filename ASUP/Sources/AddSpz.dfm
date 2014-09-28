object AddSpzForm: TAddSpzForm
  Left = 224
  Top = 176
  BorderStyle = bsDialog
  ClientHeight = 114
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SPZLabel: TLabel
    Left = 8
    Top = 16
    Width = 38
    Height = 13
    Caption = #1064#1080#1092#1088':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Name_SPZLabel: TLabel
    Left = 8
    Top = 48
    Width = 123
    Height = 13
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1064#1055#1047':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FC_SPZ: TFieldControl
    Left = 381
    Top = 16
    Width = 18
    Height = 18
    Control = SPZEdit
    ReadFromField = DetailsQuerySPZ
    Title = '"'#1064#1080#1092#1088'"'
    MaxLength = 10
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object FC_Name_SPZ: TFieldControl
    Left = 381
    Top = 48
    Width = 18
    Height = 18
    Control = Name_SPZEdit
    ReadFromField = DetailsQueryName_SPZ
    Title = '"'#1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1064#1055#1047'"'
    MaxLength = 100
    ExactLength = 0
    CapitalizeStyle = csNone
  end
  object SPZEdit: TCheckEdit
    Left = 179
    Top = 16
    Width = 200
    Height = 21
    MaxLength = 10
    TabOrder = 0
    Text = 'SPZEdit'
    InputSet = isAll
  end
  object Name_SPZEdit: TCheckEdit
    Left = 179
    Top = 48
    Width = 200
    Height = 21
    MaxLength = 100
    TabOrder = 1
    Text = 'Name_SPZEdit'
    InputSet = isAll
  end
  object OkButton: TBitBtn
    Left = 137
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
    Left = 282
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
      'SELECT SPZ,Name_SPZ FROM Ini_Spz WHERE Id_Spz = :Id_Spz')
    Left = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id_Spz'
        ParamType = ptUnknown
      end>
    object DetailsQuerySPZ: TIBStringField
      FieldName = 'SPZ'
    end
    object DetailsQueryName_SPZ: TIBStringField
      FieldName = 'Name_SPZ'
    end
  end
  object SPZBufferWrite: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'INSERT INTO BUFF_NSPZ(ID_PBKEY,ID_ACTION,ID_SPZ,NAME_SPZ,'
      'KOD_SPZ)'
      'VALUES (:ID_PBKEY,:ID_ACTION,:ID_SPZ,:NAME_SPZ,:KOD_SPZ)')
    Left = 8
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PBKEY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_ACTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_SPZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NAME_SPZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KOD_SPZ'
        ParamType = ptUnknown
      end>
  end
end
