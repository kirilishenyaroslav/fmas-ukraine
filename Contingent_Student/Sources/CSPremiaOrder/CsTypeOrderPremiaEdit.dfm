object FCsTypeOrderPremiaEdit: TFCsTypeOrderPremiaEdit
  Left = 744
  Top = 168
  Width = 431
  Height = 372
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IdType: TcxComboBox
    Left = 13
    Top = 25
    Width = 386
    Height = 21
    AutoSize = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1055#1088#1077#1084#1110#1103
      #1052#1072#1090#1077#1088#1110#1072#1083#1100#1085#1072' '#1076#1086#1087#1086#1084#1086#1075#1072)
    Properties.OnEditValueChanged = IdTypePropertiesEditValueChanged
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.ButtonStyle = btsUltraFlat
    Style.ButtonTransparency = ebtNone
    TabOrder = 0
  end
  object EditVidOpl: TcxButtonEdit
    Left = 13
    Top = 72
    Width = 385
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 0
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditVidOplPropertiesButtonClick
    TabOrder = 1
  end
  object cxLabel2: TcxLabel
    Left = 12
    Top = 8
    Width = 30
    Height = 17
    TabOrder = 2
    Caption = #1058#1080#1087':'
  end
  object cxLabel3: TcxLabel
    Left = 15
    Top = 53
    Width = 74
    Height = 17
    TabOrder = 3
    Caption = #1042#1080#1076' '#1074#1080#1087#1083#1072#1090#1080':'
  end
  object BtnEditSmeta: TcxButtonEdit
    Left = 13
    Top = 119
    Width = 80
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '\d?\d?\d?\d?\d?\d?\d?\d?'
    Properties.MaxLength = 0
    Properties.ReadOnly = False
    Properties.OnButtonClick = BtnEditSmetaPropertiesButtonClick
    Properties.OnEditValueChanged = BtnEditSmetaPropertiesEditValueChanged
    TabOrder = 4
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 100
    Width = 51
    Height = 17
    TabOrder = 5
    Caption = #1041#1102#1076#1078#1077#1090':'
  end
  object LabelSmeta: TcxLabel
    Left = 96
    Top = 119
    Width = 303
    Height = 21
    TabStop = False
    AutoSize = False
    ParentColor = False
    Style.BorderColor = clHotLight
    Style.BorderStyle = ebsSingle
    Style.Color = clWhite
    TabOrder = 6
    Caption = ''
  end
  object cxLabel5: TcxLabel
    Left = 18
    Top = 148
    Width = 45
    Height = 17
    TabOrder = 7
    Caption = #1057#1091#1084#1084#1072':'
  end
  object MaskEditSumma: TcxMaskEdit
    Left = 16
    Top = 168
    Width = 385
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
    Properties.MaxLength = 0
    TabOrder = 8
  end
  object cxButton1: TcxButton
    Left = 216
    Top = 304
    Width = 75
    Height = 25
    Caption = #1054#1082
    TabOrder = 9
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 304
    Top = 304
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 10
    OnClick = cxButton2Click
  end
  object cxLabel4: TcxLabel
    Left = 18
    Top = 197
    Width = 54
    Height = 17
    TabOrder = 11
    Caption = #1055#1088#1080#1095#1080#1085#1072':'
  end
  object MEReason: TcxMaskEdit
    Left = 16
    Top = 217
    Width = 385
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 0
    TabOrder = 12
  end
  object cxLabel6: TcxLabel
    Left = 18
    Top = 247
    Width = 58
    Height = 17
    TabOrder = 13
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072':'
  end
  object MENote: TcxMaskEdit
    Left = 16
    Top = 265
    Width = 385
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.MaxLength = 0
    TabOrder = 14
  end
  object CBReason: TcxCheckBox
    Left = 256
    Top = 197
    Width = 121
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072' '#1079#1072#1084#1086#1074#1095#1077#1085#1085#1103#1084
    TabOrder = 15
  end
  object PubSprSmet: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from pub_spr_smeta'
      'where smeta_kod = :smeta_kod')
    Left = 76
    Top = 299
    poSQLINT64ToBCD = True
    object PubSprSmetID_SMETA: TFIBBCDField
      FieldName = 'ID_SMETA'
      Size = 0
      RoundByScale = True
    end
    object PubSprSmetSMETA_TITLE: TFIBStringField
      FieldName = 'SMETA_TITLE'
      Size = 180
      EmptyStrToNull = True
    end
    object PubSprSmetSMETA_KOD: TFIBIntegerField
      FieldName = 'SMETA_KOD'
    end
  end
  object ActionList1: TActionList
    Left = 128
    Top = 299
    object OKBut: TAction
      Caption = #1043#1072#1088#1072#1079#1076
      ShortCut = 121
    end
  end
end
