object frmConfigureDefaults: TfrmConfigureDefaults
  Left = 343
  Top = 110
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1087#1072#1088#1077#1084#1077#1090#1088#1110#1074' '#1087#1088#1077#1081#1089#1082#1091#1088#1072#1085#1090#1072' '#1079#1072' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1103#1084
  ClientHeight = 366
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 325
    Width = 542
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 368
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton12: TcxButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton12Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 325
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 73
      Top = 15
      Width = 81
      Height = 16
      Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 49
      Top = 44
      Width = 105
      Height = 16
      Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 48
      Top = 74
      Width = 106
      Height = 16
      Caption = #1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 29
      Top = 104
      Width = 125
      Height = 16
      Caption = #1060#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 6
      Top = 134
      Width = 148
      Height = 16
      Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1085#1072#1074#1095#1072#1085#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 118
      Top = 165
      Width = 36
      Height = 16
      Caption = #1050#1091#1088#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 96
      Top = 196
      Width = 58
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 103
      Top = 227
      Width = 51
      Height = 16
      Caption = #1056#1086#1079#1076#1110#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 102
      Top = 258
      Width = 52
      Height = 16
      Caption = #1057#1090#1072#1090#1090#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 70
      Top = 291
      Width = 84
      Height = 16
      Caption = #1050#1086#1076' '#1074#1080#1090#1088#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object FacultyText: TcxButtonEdit
      Left = 164
      Top = 11
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = FacultyTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 0
    end
    object SpecialityText: TcxButtonEdit
      Left = 164
      Top = 40
      Width = 270
      Height = 24
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = SpecialityTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 2
    end
    object GrazdanstvoText: TcxButtonEdit
      Left = 164
      Top = 70
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = GrazdanstvoTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 4
    end
    object TeatchFormText: TcxButtonEdit
      Left = 164
      Top = 100
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = TeatchFormTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 6
    end
    object KategoryText: TcxButtonEdit
      Left = 164
      Top = 130
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = KategoryTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 8
    end
    object KursText: TcxButtonEdit
      Left = 164
      Top = 161
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = KursTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 10
    end
    object SmetaText: TcxButtonEdit
      Left = 164
      Top = 192
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = SmetaTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 12
    end
    object RazdelText: TcxButtonEdit
      Left = 164
      Top = 223
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Style.Color = 16776176
      TabOrder = 14
    end
    object StateText: TcxButtonEdit
      Left = 164
      Top = 254
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Style.Color = 16776176
      TabOrder = 16
    end
    object KekvText: TcxButtonEdit
      Left = 164
      Top = 287
      Width = 270
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = KekvTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 18
    end
    object cxButton2: TcxButton
      Left = 448
      Top = 11
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 448
      Top = 40
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 3
      OnClick = cxButton3Click
    end
    object cxButton4: TcxButton
      Left = 448
      Top = 70
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 5
      OnClick = cxButton4Click
    end
    object cxButton5: TcxButton
      Left = 448
      Top = 100
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 7
      OnClick = cxButton5Click
    end
    object cxButton6: TcxButton
      Left = 448
      Top = 130
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 9
      OnClick = cxButton6Click
    end
    object cxButton7: TcxButton
      Left = 448
      Top = 161
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 11
      OnClick = cxButton7Click
    end
    object cxButton8: TcxButton
      Left = 448
      Top = 192
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 13
      OnClick = cxButton8Click
    end
    object cxButton9: TcxButton
      Left = 448
      Top = 223
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 15
      OnClick = cxButton9Click
    end
    object cxButton10: TcxButton
      Left = 448
      Top = 254
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 17
      OnClick = cxButton10Click
    end
    object cxButton11: TcxButton
      Left = 448
      Top = 287
      Width = 75
      Height = 24
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080
      TabOrder = 19
      OnClick = cxButton11Click
    end
  end
  object DefaultssataSet: TpFIBDataSet
    Left = 32
    Top = 272
    poSQLINT64ToBCD = True
  end
end
