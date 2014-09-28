object FormAddObject: TFormAddObject
  Left = 622
  Top = 279
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1074#1072#1085#1085#1103' '#1086#1073'`'#1108#1082#1090#1091
  ClientHeight = 146
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    526
    146)
  PixelsPerInch = 96
  TextHeight = 16
  object LabelAdd: TLabel
    Left = 9
    Top = 15
    Width = 45
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = #1053#1072#1079#1074#1072':'
  end
  object LabelFullName: TLabel
    Left = 9
    Top = 47
    Width = 88
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072':'
  end
  object Label1: TLabel
    Left = 9
    Top = 79
    Width = 59
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = #1057#1080#1089#1090#1077#1084#1072':'
  end
  object ButtonOk: TButton
    Left = 360
    Top = 115
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1044#1086#1076#1072#1090#1080
    ModalResult = 1
    TabOrder = 3
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 440
    Top = 115
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 4
    OnClick = ButtonCancelClick
  end
  object Systems: TcxLookupComboBox
    Left = 106
    Top = 74
    Width = 407
    Height = 24
    Properties.Alignment.Horz = taRightJustify
    Properties.KeyFieldNames = 'ID_SYSTEM'
    Properties.ListColumns = <
      item
        Caption = #1057#1080#1089#1090#1077#1084#1072
        FieldName = 'SHORT_NAME'
      end>
    Properties.ReadOnly = False
    EditValue = 0
    Style.Color = clWhite
    TabOrder = 2
  end
  object EditFullName: TcxTextEdit
    Left = 106
    Top = 43
    Width = 407
    Height = 24
    Style.Color = clWhite
    TabOrder = 1
  end
  object EditName: TcxTextEdit
    Left = 107
    Top = 13
    Width = 406
    Height = 24
    Style.Color = clWhite
    TabOrder = 0
  end
end
