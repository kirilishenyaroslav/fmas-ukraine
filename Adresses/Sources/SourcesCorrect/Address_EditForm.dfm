object fAdrEditForm: TfAdrEditForm
  Left = 484
  Top = 172
  BorderStyle = bsDialog
  ClientHeight = 247
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object CountryLbl: TLabel
    Left = 7
    Top = 11
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '* '#1050#1088#1072#1111#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RegionLbl: TLabel
    Left = 9
    Top = 35
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = '* '#1056#1077#1075#1110#1086#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DistrictLbl: TLabel
    Left = 20
    Top = 59
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = #1056#1072#1081#1086#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TownLbl: TLabel
    Left = 14
    Top = 83
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = '* '#1052#1110#1089#1090#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StreetLbl: TLabel
    Left = 5
    Top = 107
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = '* '#1042#1091#1083#1080#1094#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object AreaLbl: TLabel
    Left = 20
    Top = 131
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = #1056#1072#1081#1086#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object KorpusLbl: TLabel
    Left = 152
    Top = 161
    Width = 47
    Height = 13
    Caption = #1050#1086#1088#1087#1091#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object HouseLbl: TLabel
    Left = 48
    Top = 160
    Width = 54
    Height = 13
    Caption = #1041#1091#1076#1080#1085#1086#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object FlatLbl: TLabel
    Left = 247
    Top = 161
    Width = 61
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ZipLbl: TLabel
    Left = 128
    Top = 187
    Width = 49
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089':'
    FocusControl = TEZip
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CBCountry: TcxLookupComboBox
    Left = 64
    Top = 8
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_COUNTRY'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_COUNTRY'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnEditValueChanged = CBCountryPropertiesEditValueChanged
    TabOrder = 0
  end
  object CountryBtn: TcxButton
    Left = 344
    Top = 8
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 1
    OnClick = CountryOpenSprav
  end
  object CBRegion: TcxLookupComboBox
    Left = 64
    Top = 32
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_REGION'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_REGION'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnEditValueChanged = CBRegionPropertiesEditValueChanged
    TabOrder = 2
  end
  object RegionBtn: TcxButton
    Left = 344
    Top = 32
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 3
    OnClick = RegionOpenSprav
  end
  object CBDistrict: TcxLookupComboBox
    Left = 64
    Top = 56
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_DISTRICT'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_DISTRICT'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnEditValueChanged = CBDistrictPropertiesEditValueChanged
    TabOrder = 4
  end
  object DistrictBtn: TcxButton
    Left = 344
    Top = 56
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 5
    OnClick = DistrictOpenSprav
  end
  object CBTown: TcxLookupComboBox
    Left = 64
    Top = 80
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_PLACE'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_PLACE'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnEditValueChanged = CBTownPropertiesEditValueChanged
    TabOrder = 6
  end
  object TownBtn: TcxButton
    Left = 344
    Top = 80
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 7
    OnClick = PlaceOpenSprav
  end
  object CBStreet: TcxLookupComboBox
    Left = 64
    Top = 104
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_STREET'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_STREET'
      end>
    Properties.ListOptions.ShowHeader = False
    TabOrder = 8
  end
  object StreetBtn: TcxButton
    Left = 344
    Top = 104
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 9
    OnClick = StreetOpenSprav
  end
  object CBArea: TcxLookupComboBox
    Left = 64
    Top = 128
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_CITY_AREA'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_CITY_AREA'
      end>
    Properties.ListOptions.ShowHeader = False
    TabOrder = 10
  end
  object AreaBtn: TcxButton
    Left = 344
    Top = 128
    Width = 21
    Height = 21
    Caption = '...'
    TabOrder = 11
    OnClick = AreaOpenSprav
  end
  object TEZip: TcxTextEdit
    Left = 184
    Top = 184
    Width = 49
    Height = 21
    TabOrder = 15
  end
  object TEFlat: TcxTextEdit
    Left = 310
    Top = 157
    Width = 35
    Height = 21
    TabOrder = 14
  end
  object TEHouse: TcxTextEdit
    Left = 104
    Top = 157
    Width = 41
    Height = 21
    TabOrder = 12
  end
  object TEKorpus: TcxTextEdit
    Left = 200
    Top = 157
    Width = 41
    Height = 21
    TabOrder = 13
  end
  object AcceptBtn: TcxButton
    Left = 72
    Top = 216
    Width = 105
    Height = 25
    Action = AcceptAction
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
  end
  object CancelBtn: TcxButton
    Left = 200
    Top = 216
    Width = 105
    Height = 25
    Action = CancelAction
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
  end
  object ActionList1: TActionList
    Left = 16
    Top = 192
    object AcceptAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
