object BuildsFormAdd: TBuildsFormAdd
  Left = 350
  Top = 157
  Width = 492
  Height = 266
  Caption = #1086#1073#1097#1077#1078#1080#1090#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TcxButton
    Left = 288
    Top = 200
    Width = 91
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 384
    Top = 200
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 225
    Height = 185
    Alignment = alTopLeft
    Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    TabStop = False
    object ShortEdit: TcxTextEdit
      Left = 64
      Top = 32
      Width = 153
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      OnKeyPress = ShortEditKeyPress
    end
    object ShortNameLabel: TcxLabel
      Left = 64
      Top = 16
      Width = 72
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
    end
    object NameLabel: TcxLabel
      Left = 8
      Top = 56
      Width = 84
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object NameEdit: TcxTextEdit
      Left = 8
      Top = 72
      Width = 209
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 12
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
      OnKeyPress = NameEditKeyPress
    end
    object NumEdit: TcxTextEdit
      Left = 8
      Top = 32
      Width = 49
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 4
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      OnKeyPress = NumEditKeyPress
    end
    object NumLabel: TcxLabel
      Left = 8
      Top = 16
      Width = 42
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
      Caption = #1053#1086#1084#1077#1088
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 96
      Width = 64
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
      Caption = #1050#1086#1084#1077#1085#1076#1072#1085#1090
    end
    object ChiefEdit: TcxTextEdit
      Left = 8
      Top = 112
      Width = 209
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 25
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
      OnKeyPress = ChiefEditKeyPress
    end
    object SizeLabel: TcxLabel
      Left = 8
      Top = 136
      Width = 55
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 8
      Caption = #1055#1083#1086#1097#1072#1076#1100
    end
    object SizeEdit: TcxTextEdit
      Left = 8
      Top = 152
      Width = 65
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 9
      Text = '0'
      OnKeyPress = SizeEditKeyPress
    end
    object FloorLabel: TcxLabel
      Left = 80
      Top = 136
      Width = 82
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 10
      Caption = #1050#1086#1083'-'#1074#1086' '#1101#1090#1072#1078#1077#1081
    end
    object FloorEdit: TcxTextEdit
      Left = 80
      Top = 152
      Width = 81
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 2
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 11
      Text = '0'
      OnKeyPress = FloorEditKeyPress
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 240
    Top = 8
    Width = 233
    Height = 185
    Alignment = alTopLeft
    Caption = #1040#1076#1088#1077#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TabStop = False
    object OblastLabel: TcxLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      Caption = #1054#1073#1083#1072#1089#1090#1100
    end
    object OblastEdit: TcxTextEdit
      Left = 8
      Top = 32
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnKeyPress = OblastEditKeyPress
    end
    object TownLabel: TcxLabel
      Left = 120
      Top = 16
      Width = 38
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      Caption = #1043#1086#1088#1086#1076
    end
    object TownEdit: TcxTextEdit
      Left = 120
      Top = 32
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      OnKeyPress = TownEditKeyPress
    end
    object RaionLabel: TcxLabel
      Left = 8
      Top = 56
      Width = 39
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
      Caption = #1056#1072#1081#1086#1085
    end
    object RaionEdit: TcxTextEdit
      Left = 8
      Top = 72
      Width = 217
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
      OnKeyPress = RaionEditKeyPress
    end
    object StreetLabel: TcxLabel
      Left = 8
      Top = 96
      Width = 40
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
      Caption = #1059#1083#1080#1094#1072
    end
    object StreetEdit: TcxTextEdit
      Left = 8
      Top = 112
      Width = 217
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 50
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
      OnKeyPress = StreetEditKeyPress
    end
    object HouseLabel: TcxLabel
      Left = 8
      Top = 136
      Width = 31
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 8
      Caption = #1044#1086#1084
    end
    object HouseEdit: TcxTextEdit
      Left = 8
      Top = 152
      Width = 57
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 8
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 9
      OnKeyPress = HouseEditKeyPress
    end
    object IndexLabel: TcxLabel
      Left = 72
      Top = 136
      Width = 46
      Height = 17
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 10
      Caption = #1048#1085#1076#1077#1082#1089
    end
    object IndexEdit: TcxTextEdit
      Left = 72
      Top = 152
      Width = 81
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 12
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 11
      Text = '0'
      OnKeyPress = IndexEditKeyPress
    end
  end
end
