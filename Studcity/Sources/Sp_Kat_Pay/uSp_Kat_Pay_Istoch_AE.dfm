object CategoryFormAddFin: TCategoryFormAddFin
  Left = 444
  Top = 265
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1080#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 211
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 0
    Width = 369
    Height = 177
    Alignment = alTopLeft
    TabOrder = 0
    object cxLabel7: TcxLabel
      Left = 8
      Top = 8
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      Caption = #1055#1086#1089#1083#1091#1075#1072
    end
    object serves_ButtonEdit: TcxButtonEdit
      Left = 8
      Top = 24
      Width = 353
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = serves_ButtonEditPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = serves_ButtonEditKeyPress
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 48
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      Caption = #1057#1084#1077#1090#1072
    end
    object Smeta_Edit: TcxButtonEdit
      Left = 8
      Top = 64
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = Smeta_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Smeta_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 3
    end
    object Smeta_Label: TcxLabel
      Left = 104
      Top = 64
      Width = 257
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object SummaLabel: TcxLabel
      Left = 8
      Top = 128
      Width = 121
      Height = 17
      AutoSize = False
      TabOrder = 5
      Caption = #1057#1091#1084#1084#1072' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1081
    end
    object SummaEdit: TcxCurrencyEdit
      Left = 8
      Top = 144
      Width = 113
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 6
      OnEnter = SummaEditEnter
      OnExit = SummaEditExit
    end
    object Currency_PDV: TcxCurrencyEdit
      Left = 128
      Top = 144
      Width = 113
      Height = 21
      BeepOnEnter = False
      EditValue = '0'
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 7
      OnEnter = Currency_PDVEnter
      OnExit = Currency_PDVExit
    end
    object cxLabel1: TcxLabel
      Left = 248
      Top = 128
      Width = 113
      Height = 17
      AutoSize = False
      TabOrder = 8
      Caption = #1057#1091#1084#1084#1072' '#1089#1091#1073#1089#1080#1076#1080#1080
    end
    object S_SummaEdit: TcxCurrencyEdit
      Left = 248
      Top = 144
      Width = 113
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Style.Color = clInfoBk
      TabOrder = 9
      OnEnter = S_SummaEditEnter
      OnExit = S_SummaEditExit
    end
    object cxLabel8: TcxLabel
      Left = 128
      Top = 128
      Width = 121
      Height = 17
      AutoSize = False
      TabOrder = 10
      Caption = #1057#1091#1084#1084#1072' '#1055#1044#1042
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 88
      Width = 89
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 11
      Caption = #1050#1045#1050#1042
    end
    object KEKV_Edit: TcxButtonEdit
      Left = 8
      Top = 104
      Width = 89
      Height = 21
      BeepOnEnter = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.OnButtonClick = KEKV_EditPropertiesButtonClick
      Properties.OnEditValueChanged = KEKV_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 12
    end
    object kekv_Label: TcxLabel
      Left = 104
      Top = 104
      Width = 257
      Height = 25
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
  end
  object OKButton: TcxButton
    Left = 202
    Top = 180
    Width = 83
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 290
    Top = 180
    Width = 83
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object ReadDataSet: TpFIBDataSet
    Database = frmDM.DB
    Transaction = frmDM.Transaction_Read
    Left = 186
    Top = 4
    poSQLINT64ToBCD = True
  end
  object Category_ActionList: TActionList
    Left = 224
    object Add_Action: TAction
      Category = 'Work'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 45
    end
    object Edit_Action: TAction
      Category = 'Work'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 113
    end
    object Delete_Action: TAction
      Category = 'Work'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
    end
    object Ok_Action: TAction
      Category = 'Accept'
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Hint = #1055#1088#1080#1085#1103#1090#1100
      ShortCut = 121
      OnExecute = Ok_ActionExecute
    end
  end
end
