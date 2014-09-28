object frmPostEdit: TfrmPostEdit
  Left = 344
  Top = 270
  Width = 384
  Height = 184
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1087#1086#1089#1072#1076#1110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 36
    Top = 11
    Width = 130
    Height = 13
    Caption = #1042#1089#1110' '#1087#1086#1089#1072#1076#1080' '#1087#1110#1076' '#1082#1072#1090#1077#1075#1086#1088#1110#1108#1102
  end
  object Label1: TLabel
    Left = 36
    Top = 60
    Width = 38
    Height = 13
    Caption = #1055#1086#1089#1072#1076#1072
  end
  object Panel1: TPanel
    Left = 0
    Top = 109
    Width = 376
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 95
      Top = 7
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 173
      Top = 7
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object cxLookupComboBox2: TcxLookupComboBox
    Left = 36
    Top = 30
    Width = 320
    Height = 21
    Enabled = False
    Properties.KeyFieldNames = 'ID_CATEGORY'
    Properties.ListColumns = <
      item
        Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
        FieldName = 'NAME_CATEGORY'
      end>
    Properties.ListSource = DM.CatDataSource
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object cxRadioButton1: TcxRadioButton
    Left = 16
    Top = 11
    Width = 17
    Height = 17
    TabOrder = 2
    OnClick = cxRadioButton1Click
  end
  object cxRadioButton2: TcxRadioButton
    Left = 16
    Top = 60
    Width = 16
    Height = 17
    TabOrder = 3
    OnClick = cxRadioButton2Click
  end
  object PostSpr: TcxButtonEdit
    Left = 40
    Top = 80
    Width = 313
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = PostSprPropertiesButtonClick
    TabOrder = 4
  end
end
