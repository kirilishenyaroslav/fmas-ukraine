object FVariantPayment: TFVariantPayment
  Left = 131
  Top = 116
  Width = 199
  Height = 144
  Caption = 'FVariantPayment'
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
  object cxRadioGroup1: TcxRadioGroup
    Left = 0
    Top = 0
    Width = 183
    Height = 74
    Align = alClient
    Properties.Items = <
      item
        Caption = #1055#1086#1090#1086#1095' '#1074#1080#1087#1083
      end
      item
        Caption = #1057#1090#1110#1087
      end>
    Properties.OnChange = cxRadioGroup1PropertiesChange
    TabOrder = 0
    Caption = ''
  end
  object Panel1: TPanel
    Left = 0
    Top = 74
    Width = 183
    Height = 32
    Align = alBottom
    TabOrder = 1
    object ButtonYes: TcxButton
      Left = 9
      Top = 4
      Width = 81
      Height = 25
      Caption = #1055#1088#1086#1076#1086#1074#1078#1080#1090#1080
      ModalResult = 6
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
    end
    object Cancel: TcxButton
      Left = 97
      Top = 4
      Width = 81
      Height = 25
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
    end
  end
  object ActionList1: TActionList
    Left = 112
    Top = 24
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 121
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'ActionSaveBuffer'
      ShortCut = 120
    end
    object Action3: TAction
      Caption = 'Action3'
      ShortCut = 13
      OnExecute = Action3Execute
    end
  end
end
