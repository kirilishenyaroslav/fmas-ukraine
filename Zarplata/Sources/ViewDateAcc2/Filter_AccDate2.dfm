object FFilter: TFFilter
  Left = 228
  Top = 129
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1080
  ClientHeight = 310
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ManSelectBox: TGroupBox
    Left = 0
    Top = 41
    Width = 613
    Height = 228
    Align = alClient
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 29
      Top = 50
      Width = 154
      Height = 13
      Caption = #1054#1073#1088#1072#1090#1080' '#1092#1110#1079#1080#1095#1085#1091' '#1086#1089#1086#1073#1091' (F):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 29
      Top = 76
      Width = 128
      Height = 13
      Caption = #1054#1073#1088#1072#1090#1080' '#1087#1110#1076#1088#1086#1079#1076#1110#1083' (D):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 106
      Width = 138
      Height = 13
      Caption = #1044#1086#1076#1072#1090#1080' '#1079#1072' '#1082#1088#1080#1090#1077#1088#1110#1103#1084#1080':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 29
      Top = 128
      Width = 224
      Height = 13
      Caption = #1052#1072#1102#1090#1100' '#1087#1086#1095#1072#1090#1086#1082' '#1074#1110#1076#1087#1091#1089#1090#1082#1080' '#1091' '#1087#1077#1088#1110#1086#1076#1110'(H)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 29
      Top = 152
      Width = 193
      Height = 13
      Caption = #1052#1072#1102#1090#1100' '#1086#1089#1085#1086#1074#1085#1077' '#1084#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080'(M)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 29
      Top = 176
      Width = 150
      Height = 13
      Caption = #1042#1080#1087#1083#1072#1095#1091#1108#1090#1100#1089#1103' "'#1072#1074#1072#1085#1089'"(A)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 29
      Top = 199
      Width = 341
      Height = 13
      Caption = #1052#1072#1102#1090#1100' '#1074#1080#1076#1080' '#1086#1087#1083#1072#1090#1080', '#1085#1072' '#1103#1082#1080#1093' '#1074#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072' '#1074#1083#1072#1089#1090#1080#1074#1110#1089#1090#1100'(P)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 265
      Top = 130
      Width = 8
      Height = 13
      Caption = #1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 395
      Top = 130
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ManEdit: TcxButtonEdit
      Left = 313
      Top = 46
      Width = 290
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = ManEditPropertiesButtonClick
      Style.BorderStyle = ebs3D
      TabOrder = 0
    end
    object AllPeopleBtn: TRadioButton
      Left = 8
      Top = 24
      Width = 121
      Height = 17
      Caption = #1044#1086#1076#1072#1090#1080' '#1091#1089#1110#1093' (*)'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = AllPeopleBtnClick
    end
    object ManSelBtn: TRadioButton
      Left = 8
      Top = 49
      Width = 17
      Height = 17
      Caption = 'ManSelBtn'
      TabOrder = 2
      OnClick = ManSelBtnClick
    end
    object DepNameBtn: TRadioButton
      Left = 8
      Top = 75
      Width = 17
      Height = 17
      Caption = 'DepNameBtn'
      TabOrder = 3
      OnClick = DepNameBtnClick
    end
    object DepEdit: TcxButtonEdit
      Left = 313
      Top = 70
      Width = 290
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = DepEditPropertiesButtonClick
      Style.BorderStyle = ebs3D
      TabOrder = 4
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 127
      Width = 17
      Height = 17
      Caption = 'DepNameBtn'
      TabOrder = 5
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 151
      Width = 17
      Height = 17
      Caption = 'DepNameBtn'
      TabOrder = 6
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 8
      Top = 175
      Width = 17
      Height = 17
      Caption = 'DepNameBtn'
      TabOrder = 7
      OnClick = RadioButton3Click
    end
    object RadioButton5: TRadioButton
      Left = 8
      Top = 198
      Width = 17
      Height = 17
      Caption = 'DepNameBtn'
      TabOrder = 8
      OnClick = RadioButton5Click
    end
    object HolDateBeg: TDateTimePicker
      Left = 278
      Top = 126
      Width = 104
      Height = 21
      Date = 40015.613534791670000000
      Time = 40015.613534791670000000
      TabOrder = 9
    end
    object HolDateEnd: TDateTimePicker
      Left = 422
      Top = 125
      Width = 104
      Height = 21
      Date = 40015.613534791670000000
      Time = 40015.613534791670000000
      TabOrder = 10
    end
    object ManEditCode: TcxTextEdit
      Left = 241
      Top = 46
      Width = 66
      Height = 21
      Enabled = False
      Style.BorderStyle = ebs3D
      TabOrder = 11
      OnExit = ManEditCodeExit
    end
    object DepEditCode: TcxTextEdit
      Left = 241
      Top = 70
      Width = 66
      Height = 21
      Enabled = False
      Style.BorderStyle = ebs3D
      TabOrder = 12
      OnExit = DepEditCodeExit
    end
    object VidOplPropButton: TcxButtonEdit
      Left = 376
      Top = 196
      Width = 227
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = VidOplPropButtonPropertiesButtonClick
      Style.BorderStyle = ebs3D
      TabOrder = 13
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 4
      Width = 113
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 173
      Top = 14
      Width = 8
      Height = 13
      Caption = #1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 307
      Top = 14
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DateBeg: TDateTimePicker
      Left = 190
      Top = 10
      Width = 104
      Height = 21
      Date = 40015.613534791670000000
      Time = 40015.613534791670000000
      TabOrder = 0
    end
    object DateEnd: TDateTimePicker
      Left = 334
      Top = 10
      Width = 104
      Height = 21
      Date = 40015.613534791670000000
      Time = 40015.613534791670000000
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 613
    Height = 41
    Align = alBottom
    TabOrder = 2
    object OkBtn: TcxButton
      Left = 211
      Top = 8
      Width = 89
      Height = 25
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 0
      OnClick = OkBtnClick
    end
    object CancelBtn: TcxButton
      Left = 304
      Top = 8
      Width = 91
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ModalResult = 2
      TabOrder = 1
    end
  end
end
