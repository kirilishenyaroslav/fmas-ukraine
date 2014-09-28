object frmGetRests: TfrmGetRests
  Left = 287
  Top = 291
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1079#1072#1083#1080#1096#1082#1072#1084#1080
  ClientHeight = 257
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 216
    Width = 585
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 216
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 54
      Height = 16
      Caption = #1056#1072#1093#1091#1085#1086#1082
    end
    object Label2: TLabel
      Left = 10
      Top = 56
      Width = 51
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
    end
    object Label3: TLabel
      Left = 10
      Top = 88
      Width = 44
      Height = 16
      Caption = #1056#1086#1079#1076#1110#1083
    end
    object Label4: TLabel
      Left = 10
      Top = 120
      Width = 45
      Height = 16
      Caption = #1057#1090#1072#1090#1090#1103
    end
    object Label5: TLabel
      Left = 10
      Top = 152
      Width = 36
      Height = 16
      Caption = #1050#1045#1050#1042
    end
    object Label6: TLabel
      Left = 378
      Top = 23
      Width = 85
      Height = 16
      Caption = #1042#1093'.'#1079#1072#1083#1080#1096#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 372
      Top = 56
      Width = 91
      Height = 16
      Caption = #1053#1072#1088#1072#1093#1086#1074#1072#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 391
      Top = 87
      Width = 71
      Height = 16
      Caption = #1053#1072#1076#1110#1081#1096#1083#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 369
      Top = 118
      Width = 92
      Height = 16
      Caption = #1050#1072#1089'.'#1074#1080#1076#1072#1090#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 368
      Top = 151
      Width = 95
      Height = 16
      Caption = #1060#1072#1082'.'#1074#1080#1076#1072#1090#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 10
      Top = 180
      Width = 66
      Height = 16
      Caption = #1040#1085#1072#1083#1110#1090#1080#1082#1072
    end
    object EDSch: TcxLookupComboBox
      Left = 89
      Top = 20
      Width = 260
      Height = 24
      Properties.KeyFieldNames = 'ID_OBJECT'
      Properties.ListColumns = <
        item
          Caption = #1056#1072#1093#1091#1085#1086#1082
          FieldName = 'OBJECT_CODE'
        end>
      Properties.ListSource = SchDataSource
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object EdSm: TcxLookupComboBox
      Left = 89
      Top = 52
      Width = 260
      Height = 24
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 500
      Properties.KeyFieldNames = 'ID_SM'
      Properties.ListColumns = <
        item
          Caption = #1050#1086#1076
          Width = 40
          FieldName = 'SMETA_KOD'
        end
        item
          Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
          Width = 100
          FieldName = 'SMETA_TITLE'
        end>
      Properties.ListSource = SmDataSource
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object EdSt: TcxButtonEdit
      Left = 89
      Top = 116
      Width = 260
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object EdKV: TcxButtonEdit
      Left = 89
      Top = 148
      Width = 260
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object EdRazdel: TcxTextEdit
      Left = 89
      Top = 84
      Width = 260
      Height = 24
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object EdSumma: TcxCalcEdit
      Left = 463
      Top = 20
      Width = 109
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 5
    end
    object Nar_summa: TcxCalcEdit
      Left = 463
      Top = 52
      Width = 109
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 6
    end
    object Nad_summa: TcxCalcEdit
      Left = 463
      Top = 84
      Width = 109
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 7
    end
    object kv_summa: TcxCalcEdit
      Left = 463
      Top = 116
      Width = 109
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 8
    end
    object fv_summa: TcxCalcEdit
      Left = 463
      Top = 148
      Width = 109
      Height = 24
      EditValue = '0'
      Style.Color = clInfoBk
      TabOrder = 9
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 89
      Top = 180
      Width = 260
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 10
    end
  end
  object SchDataSet: TpFIBDataSet
    Left = 8
    Top = 243
    poSQLINT64ToBCD = True
  end
  object SchDataSource: TDataSource
    DataSet = SchDataSet
    Left = 40
    Top = 243
  end
  object SmDataSet: TpFIBDataSet
    Left = 8
    Top = 208
    poSQLINT64ToBCD = True
  end
  object SmDataSource: TDataSource
    DataSet = SmDataSet
    Left = 40
    Top = 208
  end
end
