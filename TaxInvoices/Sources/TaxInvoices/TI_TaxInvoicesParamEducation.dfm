object FormParamEducation: TFormParamEducation
  Left = 483
  Top = 448
  Width = 376
  Height = 293
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 214
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 40
      Top = 16
      Width = 270
      Height = 48
      Alignment = taCenter
      Caption = 
        #1060#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1080#1093' '#13#10'('#1085#1072#1074#1095#1072#1085#1085#1103', '#1089#1090#1091#1076#1084#1110#1089#1090#1077#1095#1082#1072')'#13#10#1079' '#1091#1088 +
        #1072#1093#1091#1074#1072#1085#1085#1103#1084' '#1087#1077#1088#1096#1086#1111' '#1087#1086#1076#1110#1111
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 72
      Width = 313
      Height = 113
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 28
        Width = 145
        Height = 13
        Caption = #1088#1086#1073#1086#1095#1080#1081' '#1087#1077#1088#1110#1086#1076' '#1089#1080#1089#1090#1077#1084#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cxDateEditWorkDate: TcxDateEdit
        Left = 168
        Top = 28
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object RadioButtonEducation: TRadioButton
        Left = 48
        Top = 72
        Width = 89
        Height = 17
        Caption = #1085#1072#1074#1095#1072#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object RadioButtonStCity: TRadioButton
        Left = 152
        Top = 72
        Width = 113
        Height = 17
        Caption = #1089#1090#1091#1076#1084#1110#1089#1090#1077#1095#1082#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 214
    Width = 360
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
