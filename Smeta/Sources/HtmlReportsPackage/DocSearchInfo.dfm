object frmDocsSearchInfo: TfrmDocsSearchInfo
  Left = 479
  Top = 322
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1053#1072#1076#1072#1090#1080' '#1072#1085#1072#1083#1110#1079' '#1087#1086#1082#1072#1079#1085#1080#1082#1110#1074
  ClientHeight = 227
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 358
    Height = 227
    Align = alClient
    TabOrder = 0
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
    object grp1: TGroupBox
      Left = 10
      Top = 53
      Width = 336
      Height = 65
      Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object rb1: TRadioButton
        Left = 8
        Top = 18
        Width = 325
        Height = 17
        Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1088#1086#1079#1076#1110#1083#1110#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rb2: TRadioButton
        Left = 8
        Top = 40
        Width = 325
        Height = 17
        Caption = #1059' '#1088#1086#1079#1088#1110#1079#1110' '#1088#1086#1079#1076#1110#1083#1110#1074'/'#1089#1090#1072#1090#1077#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 125
      Width = 336
      Height = 65
      Caption = #1054#1073#1083#1110#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object rb3: TRadioButton
        Left = 8
        Top = 18
        Width = 325
        Height = 17
        Caption = #1059#1087#1088#1072#1074#1083#1110#1085#1089#1100#1082#1080#1081' '#1086#1073#1083#1110#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object rb4: TRadioButton
        Left = 8
        Top = 40
        Width = 325
        Height = 17
        Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1080#1081' '#1086#1073#1083#1110#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object cxButtonOk: TcxButton
      Left = 131
      Top = 195
      Width = 90
      Height = 25
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
      OnClick = OKClick
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
      TabOrder = 3
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
      TabOrder = 4
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
      TabOrder = 5
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
      TabOrder = 6
    end
  end
end
