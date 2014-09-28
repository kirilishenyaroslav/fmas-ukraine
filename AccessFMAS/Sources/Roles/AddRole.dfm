object FormAddRole: TFormAddRole
  Left = 298
  Top = 236
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1075#1088#1091#1087#1080
  ClientHeight = 101
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    517
    101)
  PixelsPerInch = 96
  TextHeight = 16
  object LabelAdd: TLabel
    Left = 52
    Top = 10
    Width = 42
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = #1053#1072#1079#1074#1072
  end
  object LabelFullName: TLabel
    Left = 12
    Top = 42
    Width = 85
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
  end
  object EditName: TEdit
    Left = 100
    Top = 6
    Width = 410
    Height = 24
    Anchors = [akRight, akBottom]
    Color = clWhite
    TabOrder = 0
    OnKeyPress = EditNameKeyPress
  end
  object EditFullName: TEdit
    Left = 100
    Top = 38
    Width = 409
    Height = 24
    Anchors = [akRight, akBottom]
    Color = clWhite
    TabOrder = 1
    OnKeyPress = EditNameKeyPress
  end
  object ButtonOk: TButton
    Left = 355
    Top = 70
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1044#1086#1076#1072#1090#1080
    ModalResult = 1
    TabOrder = 2
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 435
    Top = 70
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
end
