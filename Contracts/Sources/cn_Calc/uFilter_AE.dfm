object frmFilter_AE: TfrmFilter_AE
  Left = 359
  Top = 291
  Width = 545
  Height = 279
  Caption = #1044#1086#1076#1072#1090#1080'/'#1047#1084#1110#1085#1080#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 53
    Top = 163
    Width = 49
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 204
    Width = 537
    Height = 41
    Align = alBottom
    TabOrder = 0
    object OkButton: TcxButton
      Left = 366
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object CancelButton: TcxButton
      Left = 446
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = CancelButtonClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 204
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object FacLabel: TLabel
      Left = 10
      Top = 20
      Width = 56
      Height = 13
      Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SpecLabel: TLabel
      Left = 10
      Top = 52
      Width = 70
      Height = 13
      Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object FormStudLabel: TLabel
      Left = 10
      Top = 109
      Width = 87
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NacLabel: TLabel
      Left = 10
      Top = 81
      Width = 73
      Height = 13
      Caption = #1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object KatLabel: TLabel
      Left = 10
      Top = 139
      Width = 49
      Height = 13
      Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 171
      Width = 24
      Height = 13
      Caption = #1050#1091#1088#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object FacultyText: TcxButtonEdit
      Left = 120
      Top = 16
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = FaculPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 0
    end
    object SpecialityText: TcxButtonEdit
      Left = 120
      Top = 48
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = SpecialityTextPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 1
    end
    object FormStudText: TcxButtonEdit
      Left = 120
      Top = 106
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = Form_StudPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 3
    end
    object NacText: TcxButtonEdit
      Left = 120
      Top = 77
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = GragdTextPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 2
    end
    object KatText: TcxButtonEdit
      Left = 120
      Top = 136
      Width = 401
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = KategoryTextPropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 4
    end
    object KursStud: TcxComboBox
      Left = 120
      Top = 168
      Width = 57
      Height = 21
      Properties.Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8')
      TabOrder = 5
      Text = 'KursStud'
    end
  end
end
