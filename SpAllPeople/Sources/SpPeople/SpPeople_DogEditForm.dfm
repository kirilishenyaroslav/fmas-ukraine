object fEditDog: TfEditDog
  Left = 285
  Top = 177
  BorderStyle = bsDialog
  Caption = 'fEditDog'
  ClientHeight = 269
  ClientWidth = 392
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
  object BankBE: TcxButtonEdit
    Left = 8
    Top = 56
    Width = 377
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = BankBEPropertiesButtonClick
    TabOrder = 3
  end
  object ControlIdME: TcxMaskEdit
    Left = 240
    Top = 96
    Width = 145
    Height = 21
    Properties.MaxLength = 16
    TabOrder = 8
  end
  object NLAME: TcxMaskEdit
    Left = 8
    Top = 96
    Width = 162
    Height = 21
    Properties.MaxLength = 16
    TabOrder = 6
  end
  object DogDE: TcxDateEdit
    Left = 8
    Top = 136
    Width = 81
    Height = 21
    TabOrder = 11
  end
  object BegDE: TcxDateEdit
    Left = 8
    Top = 176
    Width = 81
    Height = 21
    TabOrder = 14
  end
  object EndDE: TcxDateEdit
    Left = 8
    Top = 216
    Width = 81
    Height = 21
    TabOrder = 16
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 120
    Width = 83
    Height = 17
    TabOrder = 9
    Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1091
  end
  object cxLabel2: TcxLabel
    Left = 240
    Top = 80
    Width = 147
    Height = 17
    TabOrder = 5
    Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1080#1081' '#1110#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 160
    Width = 125
    Height = 17
    TabOrder = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091' '#1076#1086#1075#1086#1074#1086#1088#1091
  end
  object LabelBank: TcxLabel
    Left = 8
    Top = 40
    Width = 39
    Height = 17
    AutoSize = False
    TabOrder = 2
    Caption = #1041#1072#1085#1082
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 80
    Width = 170
    Height = 17
    TabOrder = 4
    Caption = #1057#1087#1077#1094#1110#1072#1083#1100#1085#1080#1081' '#1082#1072#1088#1090#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
  end
  object InnBtn: TcxButton
    Left = 176
    Top = 96
    Width = 50
    Height = 20
    Caption = #1048#1053#1053
    TabOrder = 7
    OnClick = InnBtnClick
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 200
    Width = 112
    Height = 17
    TabOrder = 15
    Caption = #1044#1072#1090#1072' '#1082#1110#1085#1094#1103' '#1076#1086#1075#1086#1074#1086#1088#1091
  end
  object OkButton: TcxButton
    Left = 184
    Top = 239
    Width = 97
    Height = 25
    Action = OkAction
    TabOrder = 17
  end
  object CancelButton: TcxButton
    Left = 289
    Top = 239
    Width = 97
    Height = 25
    Action = CancelAction
    TabOrder = 18
  end
  object cxLabel6: TcxLabel
    Left = 144
    Top = 120
    Width = 58
    Height = 17
    TabOrder = 10
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088
  end
  object ComentM: TcxMemo
    Left = 144
    Top = 136
    Width = 241
    Height = 97
    Properties.MaxLength = 255
    Properties.ScrollBars = ssVertical
    TabOrder = 12
  end
  object DogCloseCB: TcxCheckBox
    Left = 8
    Top = 240
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1082#1088#1080#1090#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
    TabOrder = 19
  end
  object NumDogME: TcxMaskEdit
    Left = 8
    Top = 16
    Width = 377
    Height = 21
    Properties.MaxLength = 25
    TabOrder = 1
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 0
    Width = 91
    Height = 17
    TabOrder = 0
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1091
  end
  object ActionList1: TActionList
    Left = 128
    Top = 192
    object OkAction: TAction
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      ShortCut = 121
      OnExecute = OkActionExecute
    end
    object CancelAction: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = CancelActionExecute
    end
  end
end
