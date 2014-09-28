object AddModifAdrForm3: TAddModifAdrForm3
  Left = 469
  Top = 172
  BorderStyle = bsDialog
  ClientHeight = 317
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object CountryLbl: TLabel
    Left = 29
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
    Left = 19
    Top = 35
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = '* '#1054#1073#1083#1072#1089#1090#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DistrictLbl: TLabel
    Left = 42
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
    Left = 5
    Top = 83
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = '* '#1053#1072#1089'. '#1087#1091#1085#1082#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StreetLbl: TLabel
    Left = 27
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
    Left = 6
    Top = 131
    Width = 77
    Height = 13
    Alignment = taRightJustify
    Caption = #1056#1072#1081#1086#1085' '#1084#1110#1089#1090#1072':'
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
    Left = 23
    Top = 187
    Width = 44
    Height = 13
    Caption = #1030#1085#1076#1077#1082#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CBCountry: TcxLookupComboBox
    Left = 86
    Top = 8
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_COUNTRY'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_COUNTRY'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnChange = CBCountryPropertiesChange
    Properties.OnCloseUp = CBCountryPropertiesCloseUp
    Properties.OnEditValueChanged = CBCountryPropertiesEditValueChanged
    TabOrder = 0
  end
  object CountryBtn: TcxButton
    Left = 366
    Top = 9
    Width = 19
    Height = 19
    Caption = '...'
    TabOrder = 1
    OnClick = CountryOpenSprav
  end
  object RegionBtn: TcxButton
    Left = 366
    Top = 33
    Width = 19
    Height = 19
    Caption = '...'
    TabOrder = 3
    OnClick = RegionOpenSprav
  end
  object CBDistrict: TcxLookupComboBox
    Left = 86
    Top = 56
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_DISTRICT'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_DISTRICT'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnChange = CBDistrictPropertiesChange
    Properties.OnCloseUp = CBDistrictPropertiesCloseUp
    Properties.OnEditValueChanged = CBDistrictPropertiesEditValueChanged
    TabOrder = 4
  end
  object DistrictBtn: TcxButton
    Left = 366
    Top = 57
    Width = 19
    Height = 19
    Caption = '...'
    TabOrder = 5
    OnClick = DistrictOpenSprav
  end
  object CBTown: TcxLookupComboBox
    Left = 86
    Top = 80
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_PLACE'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_PLACE'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnChange = CBTownPropertiesChange
    Properties.OnCloseUp = CBTownPropertiesCloseUp
    Properties.OnEditValueChanged = CBTownPropertiesEditValueChanged
    TabOrder = 6
  end
  object TownBtn: TcxButton
    Left = 366
    Top = 81
    Width = 19
    Height = 19
    Caption = '...'
    TabOrder = 7
    OnClick = PlaceOpenSprav
  end
  object CBStreet: TcxLookupComboBox
    Left = 86
    Top = 104
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_STREET'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_STREET'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnChange = CBStreetPropertiesChange
    Properties.OnCloseUp = CBStreetPropertiesCloseUp
    Properties.OnEditValueChanged = CBStreetPropertiesEditValueChanged
    TabOrder = 8
  end
  object StreetBtn: TcxButton
    Left = 366
    Top = 105
    Width = 19
    Height = 19
    Caption = '...'
    TabOrder = 9
    OnClick = StreetOpenSprav
  end
  object CBArea: TcxLookupComboBox
    Left = 86
    Top = 128
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_CITY_AREA'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_CITY_AREA'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnChange = CBAreaPropertiesChange
    Properties.OnCloseUp = CBAreaPropertiesCloseUp
    Properties.OnEditValueChanged = CBAreaPropertiesEditValueChanged
    TabOrder = 10
  end
  object AreaBtn: TcxButton
    Left = 366
    Top = 129
    Width = 19
    Height = 19
    Caption = '...'
    TabOrder = 11
    OnClick = AreaOpenSprav
  end
  object TEFlat: TcxTextEdit
    Left = 310
    Top = 157
    Width = 41
    Height = 21
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 14
  end
  object TEHouse: TcxTextEdit
    Left = 104
    Top = 157
    Width = 41
    Height = 21
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 12
  end
  object TEKorpus: TcxTextEdit
    Left = 200
    Top = 157
    Width = 41
    Height = 21
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 13
  end
  object AcceptBtn: TcxButton
    Left = 80
    Top = 282
    Width = 105
    Height = 25
    Action = AcceptAction
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
  end
  object CancelBtn: TcxButton
    Left = 208
    Top = 282
    Width = 105
    Height = 25
    Action = CancelAction
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 23
  end
  object CBRegion: TcxLookupComboBox
    Left = 86
    Top = 32
    Width = 281
    Height = 21
    Properties.KeyFieldNames = 'ID_REGION'
    Properties.ListColumns = <
      item
        FieldName = 'NAME_REGION'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.OnChange = CBRegionPropertiesChange
    Properties.OnCloseUp = CBRegionPropertiesCloseUp
    Properties.OnEditValueChanged = CBRegionPropertiesEditValueChanged
    TabOrder = 2
  end
  object MEZip: TcxMaskEdit
    Left = 71
    Top = 184
    Width = 57
    Height = 21
    ParentFont = False
    Properties.MaskKind = emkRegExprEx
    Properties.EditMask = '[0-9*][0-9*][0-9*][0-9*][0-9*]'
    Properties.MaxLength = 0
    Properties.OnValidate = MEZipPropertiesValidate
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 15
    OnExit = MEZipExit
    OnKeyPress = MEZipKeyPress
  end
  object SearchBtn: TcxButton
    Left = 135
    Top = 184
    Width = 225
    Height = 21
    Caption = #1055#1086#1096#1091#1082' '#1079#1072' '#1110#1085#1076#1077#1082#1089#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = SearchBtnClick
  end
  object DEBeg: TcxDateEdit
    Left = 168
    Top = 246
    Width = 81
    Height = 21
    TabOrder = 18
    Visible = False
  end
  object DEEnd: TcxDateEdit
    Left = 269
    Top = 246
    Width = 81
    Height = 21
    TabOrder = 19
    Visible = False
  end
  object DateLbl: TcxLabel
    Left = 40
    Top = 247
    Width = 129
    Height = 17
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 20
    Visible = False
    Caption = #1058#1077#1088#1084#1110#1085' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103':'
  end
  object DateLbl2: TcxLabel
    Left = 250
    Top = 248
    Width = 17
    Height = 17
    TabOrder = 21
    Visible = False
    Caption = '---'
  end
  object SearchPlaceBtn: TcxButton
    Left = 40
    Top = 216
    Width = 313
    Height = 21
    Caption = #1055#1086#1096#1091#1082' '#1085#1072#1089#1077#1083#1077#1085#1086#1075#1086' '#1087#1091#1085#1082#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = SearchPlaceBtnClick
  end
  object ActionList1: TActionList
    Left = 22
    Top = 152
    object AcceptAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = AcceptActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
