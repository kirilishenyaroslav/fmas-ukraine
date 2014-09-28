object ini_Group_UnitM_Unit_Meas1: Tini_Group_UnitM_Unit_Meas1
  Left = 379
  Top = 336
  BorderStyle = bsDialog
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1075#1088#1091#1087' '#1086#1076#1080#1085#1080#1094#1100'/'#1086#1076#1080#1085#1080#1094#1100' '#1074#1080#1084#1110#1088#1091
  ClientHeight = 103
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TcxRadioGroup
    Left = 8
    Top = 8
    Width = 337
    Height = 57
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #1075#1088#1091#1087#1091' '#1086#1076#1080#1085#1080#1094#1100' '#1074#1080#1084#1110#1088#1091
      end
      item
        Caption = #1086#1076#1080#1085#1080#1094#1102' '#1074#1080#1084#1110#1088#1091
      end>
    TabOrder = 0
    Caption = #1044#1086#1076#1072#1090#1080':'
  end
  object cxButton1: TcxButton
    Left = 190
    Top = 72
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 270
    Top = 72
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    ModalResult = 2
    TabOrder = 2
    OnClick = Button2Click
  end
  object ActionList1: TActionList
    Left = 56
    Top = 72
    object ActionExit: TAction
      Caption = 'ActionExit'
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
  end
end
