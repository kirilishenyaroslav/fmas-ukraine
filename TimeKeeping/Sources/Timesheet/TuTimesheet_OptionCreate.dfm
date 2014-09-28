object FormOptionCreate: TFormOptionCreate
  Left = 603
  Top = 267
  BorderStyle = bsDialog
  Caption = #1058#1072#1073#1077#1083#1100#1085#1080#1081' '#1086#1073#1083#1110#1082
  ClientHeight = 148
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 110
    Width = 360
    Height = 38
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object GroupBoxPeriod: TcxGroupBox
    Left = 0
    Top = 0
    Width = 353
    Height = 54
    Alignment = alTopLeft
    Caption = #1055#1077#1088#1110#1086#1076
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 17
      Width = 21
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object Label2: TLabel
      Left = 105
      Top = 17
      Width = 38
      Height = 13
      Caption = #1052#1110#1089#1103#1094#1100':'
    end
    object LabelAcces: TLabel
      Left = 25
      Top = 37
      Width = 89
      Height = 13
      Caption = #1042#1080' '#1085#1077' '#1084#1072#1108#1090#1077' '#1087#1088#1072#1074
      Visible = False
    end
    object EditYear: TcxSpinEdit
      Left = 40
      Top = 13
      Width = 57
      Height = 21
      Properties.OnChange = EditYearPropertiesChange
      TabOrder = 0
    end
    object EditMonth: TcxComboBox
      Left = 145
      Top = 13
      Width = 193
      Height = 21
      Properties.OnChange = EditYearPropertiesChange
      TabOrder = 1
    end
  end
  object GroupBox: TcxGroupBox
    Left = 2
    Top = 53
    Width = 353
    Height = 62
    Alignment = alTopLeft
    Caption = #1060#1110#1083#1100#1090#1088
    TabOrder = 2
    object RadioButtonAll: TcxRadioButton
      Left = 10
      Top = 17
      Width = 105
      Height = 17
      Caption = #1042#1089#1110' '#1090#1072#1073#1077#1083#1103
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButtonAllClick
    end
    object RadioButtonTemplet: TcxRadioButton
      Left = 100
      Top = 17
      Width = 113
      Height = 17
      Caption = #1055#1086' '#1096#1072#1073#1083#1086#1085#1091
      TabOrder = 1
      OnClick = RadioButtonDogClick
    end
    object RadioButtonDog: TcxRadioButton
      Left = 195
      Top = 17
      Width = 154
      Height = 17
      Caption = #1055#1086' '#1090#1088#1091#1076#1086#1074#1086#1084#1091' '#1076#1086#1075#1086#1074#1086#1088#1091
      TabOrder = 2
      Visible = False
      OnClick = RadioButtonDogClick
    end
    object EditTemOrDog: TcxButtonEdit
      Left = 9
      Top = 34
      Width = 333
      Height = 21
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditTemOrDogPropertiesButtonClick
      TabOrder = 3
    end
  end
  object ActionList: TActionList
    Left = 116
    Top = 112
    object ActionYes: TAction
      Caption = #1054#1073#1088#1072#1090#1080
      ShortCut = 13
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1072
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
