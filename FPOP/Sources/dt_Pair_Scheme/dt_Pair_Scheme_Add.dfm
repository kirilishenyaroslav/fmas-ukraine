object dt_Pair_Scheme_Add_Form: Tdt_Pair_Scheme_Add_Form
  Left = 338
  Top = 245
  BorderStyle = bsDialog
  Caption = 'dt_Pair_Scheme_Add_Form'
  ClientHeight = 190
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 249
    Height = 149
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 74
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091':'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 84
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1087#1088#1086#1076#1091#1082#1094#1110#1111':'
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 71
    Height = 13
    Caption = #1063#1072#1089#1090#1082#1072' '#1074#1093#1086#1076#1091':'
  end
  object Label4: TLabel
    Left = 136
    Top = 112
    Width = 77
    Height = 13
    Caption = #1063#1072#1089#1090#1082#1072' '#1074#1080#1093#1086#1076#1091':'
  end
  object ObjectEdit: TcxButtonEdit
    Left = 16
    Top = 32
    Width = 233
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ObjectEditPropertiesButtonClick
    Style.StyleController = dm.EditStyleController1
    TabOrder = 0
  end
  object ProductEdit: TcxButtonEdit
    Left = 16
    Top = 80
    Width = 233
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ProductEditPropertiesButtonClick
    Style.StyleController = dm.EditStyleController1
    TabOrder = 1
  end
  object PercentInEdit: TcxSpinEdit
    Left = 16
    Top = 128
    Width = 113
    Height = 21
    Properties.MaxValue = 100.000000000000000000
    Properties.ValueType = vtFloat
    Style.StyleController = dm.EditStyleController1
    TabOrder = 2
  end
  object PercentOutEdit: TcxSpinEdit
    Left = 136
    Top = 128
    Width = 113
    Height = 21
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Properties.MaxValue = 100.000000000000000000
    Properties.UseCtrlIncrement = True
    Properties.ValueType = vtFloat
    Style.StyleController = dm.EditStyleController1
    TabOrder = 3
  end
  object Button1: TcxButton
    Left = 101
    Top = 160
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TcxButton
    Left = 182
    Top = 160
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
end
