object fmSearch: TfmSearch
  Left = 476
  Top = 228
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 150
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShortCut = FormShortCut
  PixelsPerInch = 96
  TextHeight = 13
  object lblSearch: TLabel
    Left = 8
    Top = 8
    Width = 107
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
  end
  object btnCancel: TcxButton
    Left = 280
    Top = 118
    Width = 75
    Height = 25
    Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' - <Esc>'
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object btnOK: TcxButton
    Left = 201
    Top = 118
    Width = 75
    Height = 25
    Hint = #1055#1088#1080#1085#1103#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' - <F10>'
    Caption = #1055#1088#1080#1085#1103#1090#1100
    ModalResult = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnOKClick
    Colors.Default = 16247513
    Colors.Normal = clBtnFace
    Colors.Hot = 16247513
    Colors.Pressed = 11184895
  end
  object edtSearch: TcxMRUEdit
    Left = 8
    Top = 24
    Width = 347
    Height = 21
    Properties.DropDownRows = 5
    Properties.ShowEllipsis = False
    Style.Color = 16247513
    TabOrder = 0
  end
  object gbxOptions: TGroupBox
    Left = 8
    Top = 50
    Width = 161
    Height = 58
    Caption = ' '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086' '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object cbxWholeWords: TcxCheckBox
      Left = 8
      Top = 33
      Width = 153
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1058#1086#1083#1100#1082#1086' '#1094#1077#1083#1099#1077' '#1089#1083#1086#1074#1072
      TabOrder = 0
    end
    object cbxCaseSensitive: TcxCheckBox
      Left = 8
      Top = 15
      Width = 145
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088
      TabOrder = 1
    end
  end
  object rgrDirection: TRadioGroup
    Left = 194
    Top = 50
    Width = 161
    Height = 58
    Caption = ' '#1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1080#1089#1082#1072' '
    Ctl3D = False
    ItemIndex = 0
    Items.Strings = (
      #1042#1085#1080#1079
      #1042#1074#1077#1088#1093)
    ParentCtl3D = False
    TabOrder = 4
  end
end
