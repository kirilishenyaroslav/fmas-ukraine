object TypeUchQuery: TTypeUchQuery
  Left = 327
  Top = 192
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1076#1088#1091#1082#1091' '#1079#1074#1110#1090#1085#1080#1093' '#1092#1086#1088#1084
  ClientHeight = 166
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 125
    Width = 399
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 125
    Align = alClient
    TabOrder = 1
    object Label4: TLabel
      Left = 5
      Top = 6
      Width = 212
      Height = 13
      Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076' '#1079
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 172
      Top = 29
      Width = 15
      Height = 13
      Caption = #1087#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RadioGroup: TcxRadioGroup
      Left = 7
      Top = 49
      Width = 385
      Height = 70
      ItemIndex = 0
      Properties.Items = <
        item
          Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081' '#1086#1073#1083#1110#1082'('#1086#1087#1077#1088#1072#1090#1080#1074#1085#1080#1081')'
        end
        item
          Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082'('#1092#1072#1082#1090#1080#1095#1085#1080#1081')'
        end>
      TabOrder = 0
      Caption = ''
    end
    object edtMonthBeg: TcxMRUEdit
      Left = 6
      Top = 26
      Width = 91
      Height = 21
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 5
      Properties.ShowEllipsis = False
      Style.Color = clWhite
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'Microsoft Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object edtYearBeg: TcxSpinEdit
      Left = 99
      Top = 26
      Width = 70
      Height = 21
      ParentFont = False
      Properties.ValueType = vtInt
      Style.Color = clWhite
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'Microsoft Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object edtMonthEnd: TcxMRUEdit
      Left = 189
      Top = 26
      Width = 91
      Height = 21
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 5
      Properties.ShowEllipsis = False
      Style.Color = clWhite
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'Microsoft Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object edtYearEnd: TcxSpinEdit
      Left = 282
      Top = 26
      Width = 70
      Height = 21
      ParentFont = False
      Properties.ValueType = vtInt
      Style.Color = clWhite
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'Microsoft Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
  end
end
