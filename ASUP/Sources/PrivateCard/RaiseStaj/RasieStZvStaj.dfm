object frmStZvStaj: TfrmStZvStaj
  Left = 350
  Top = 195
  Width = 505
  Height = 215
  Caption = 'frmStZvStaj'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 13
    Top = 40
    Width = 141
    Height = 16
    Caption = #1053#1072#1076#1073#1072#1074#1082#1072'/'#1076#1086#1087#1083#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 21
    Top = 87
    Width = 94
    Height = 16
    Caption = #1055#1077#1088#1110#1086#1076' '#1076#1110#1111'   '#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 279
    Top = 86
    Width = 19
    Height = 16
    Caption = #1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cxDateBeg: TcxDateEdit
    Left = 128
    Top = 85
    Width = 121
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 0
    EditValue = 2d
  end
  object cxDateEnd: TcxDateEdit
    Left = 320
    Top = 85
    Width = 121
    Height = 21
    Style.Color = clInfoBk
    TabOrder = 1
    EditValue = 91677d
  end
  object SprRaise: TcxButtonEdit
    Left = 160
    Top = 40
    Width = 321
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = SprRaisePropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 2
  end
  object cxButton1: TcxButton
    Left = 80
    Top = 140
    Width = 113
    Height = 25
    Caption = #1054#1050
    TabOrder = 3
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 328
    Top = 140
    Width = 121
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = cxButton2Click
  end
end
