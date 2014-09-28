object frmGetRec: TfrmGetRec
  Left = 337
  Top = 152
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1079#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1072#1084#1080' '#1085#1072#1074#1095#1072#1085#1085#1103
  ClientHeight = 350
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 309
    Width = 550
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Action = ActionOk
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 309
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 45
      Top = 28
      Width = 71
      Height = 16
      Caption = #1060#1072#1082#1091#1083#1100#1090#1077#1090
    end
    object Label2: TLabel
      Left = 25
      Top = 68
      Width = 91
      Height = 16
      Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1110#1089#1090#1100
    end
    object Label3: TLabel
      Left = 6
      Top = 141
      Width = 110
      Height = 16
      Caption = #1060#1086#1088#1084#1072' '#1085#1072#1074#1095#1072#1085#1085#1103
    end
    object Label4: TLabel
      Left = 23
      Top = 105
      Width = 93
      Height = 16
      Caption = #1043#1088#1086#1084#1072#1076#1103#1085#1089#1090#1074#1086
    end
    object Label5: TLabel
      Left = 53
      Top = 187
      Width = 63
      Height = 16
      Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
    end
    object Label6: TLabel
      Left = 85
      Top = 228
      Width = 31
      Height = 16
      Caption = #1050#1091#1088#1089
    end
    object Label7: TLabel
      Left = 5
      Top = 268
      Width = 132
      Height = 16
      Caption = #1055#1086#1095#1072#1090#1086#1082' '#1076#1110#1111' '#1074#1072#1088#1090#1086#1089#1090#1110
    end
    object Label8: TLabel
      Left = 298
      Top = 268
      Width = 84
      Height = 16
      Caption = #1042#1072#1088#1090#1110#1089#1090#1100', '#1075#1088#1085
    end
    object FacultyText: TcxButtonEdit
      Left = 120
      Top = 24
      Width = 401
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 0
    end
    object SpecialityText: TcxButtonEdit
      Left = 120
      Top = 64
      Width = 401
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
      TabOrder = 1
    end
    object FormTeatchText: TcxButtonEdit
      Left = 120
      Top = 138
      Width = 401
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 3
    end
    object GragdText: TcxButtonEdit
      Left = 120
      Top = 101
      Width = 401
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = GragdTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 2
    end
    object KategoryText: TcxButtonEdit
      Left = 120
      Top = 184
      Width = 401
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = KategoryTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 4
    end
    object KursText: TcxButtonEdit
      Left = 120
      Top = 224
      Width = 401
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = KursTextPropertiesButtonClick
      Style.Color = 16776176
      TabOrder = 5
    end
    object SumValue: TcxCalcEdit
      Left = 384
      Top = 264
      Width = 137
      Height = 24
      EditValue = '0'
      Style.Color = 16776176
      TabOrder = 7
    end
    object DateStart: TDateTimePicker
      Left = 142
      Top = 264
      Width = 153
      Height = 24
      Date = 38842.493258761570000000
      Time = 38842.493258761570000000
      Color = 16776176
      TabOrder = 6
    end
  end
  object DefaultsDataSet: TpFIBDataSet
    Left = 16
    Top = 304
    poSQLINT64ToBCD = True
  end
  object ActionList1: TActionList
    Left = 248
    Top = 317
    object ActionOk: TAction
      Caption = 'ActionOk'
      OnExecute = ActionOkExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCansel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
