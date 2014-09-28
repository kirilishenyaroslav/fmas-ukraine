object MainForm: TMainForm
  Left = 351
  Top = 283
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1092#1072#1081#1083'a '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
  ClientHeight = 191
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 441
    Height = 145
    Brush.Style = bsClear
    Pen.Color = 16679687
  end
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 104
    Height = 14
    Caption = #1060#1072#1081#1083' '#1089#1086' '#1089#1082#1088#1080#1087#1090#1086#1084':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 61
    Width = 96
    Height = 14
    Caption = #1058#1080#1087' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 110
    Width = 111
    Height = 14
    Caption = #1053#1086#1084#1077#1088' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 152
    Top = 110
    Width = 100
    Height = 14
    Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object NumberEdit: TcxTextEdit
    Left = 16
    Top = 124
    Width = 121
    Height = 21
    Style.Color = 16247513
    TabOrder = 2
    OnKeyPress = NumberEditKeyPress
  end
  object FileEdit: TcxButtonEdit
    Left = 16
    Top = 32
    Width = 425
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = FileEditPropertiesButtonClick
    Style.Color = 16247513
    TabOrder = 0
  end
  object SystemBox: TcxComboBox
    Left = 16
    Top = 75
    Width = 425
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Style.Color = 16247513
    TabOrder = 1
  end
  object DateEdit: TcxDateEdit
    Left = 151
    Top = 124
    Width = 121
    Height = 21
    Style.Color = 16247513
    TabOrder = 3
    OnKeyPress = DateEditKeyPress
  end
  object GenerateButton: TcxButton
    Left = 136
    Top = 160
    Width = 195
    Height = 25
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
    TabOrder = 4
    OnClick = GenerateButtonClick
  end
  object OpenDialog: TOpenDialog
    Left = 360
    Top = 112
  end
  object SaveDialog: TSaveDialog
    Left = 392
    Top = 112
  end
end
