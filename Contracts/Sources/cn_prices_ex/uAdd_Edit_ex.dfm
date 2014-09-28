object frmAdd_Edit: TfrmAdd_Edit
  Left = 693
  Top = 333
  Width = 446
  Height = 290
  Caption = 'frmAdd_Edit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button_ok: TcxButton
    Left = 272
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Button_ok'
    TabOrder = 0
    OnClick = Button_okClick
  end
  object Button_cancel: TcxButton
    Left = 355
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Button_cancel'
    TabOrder = 1
    OnClick = Button_cancelClick
  end
  object GroupBox: TcxGroupBox
    Left = 4
    Top = 0
    Width = 429
    Height = 217
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object Smeta_Edit: TcxButtonEdit
      Left = 8
      Top = 24
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
      TabOrder = 0
      OnKeyPress = Smeta_EditKeyPress
    end
    object Razdel_Edit: TcxButtonEdit
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
      Properties.OnButtonClick = Razdel_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Razdel_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 1
      OnKeyPress = Razdel_EditKeyPress
    end
    object Stat_Edit: TcxButtonEdit
      Left = 8
      Top = 110
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
      Properties.OnButtonClick = Stat_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Stat_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 2
      OnKeyPress = Stat_EditKeyPress
    end
    object Smeta_Label: TcxLabel
      Left = 8
      Top = 8
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
      Caption = #1057#1084#1077#1090#1072
    end
    object Razdel_Label: TcxLabel
      Left = 8
      Top = 48
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
      Caption = #1056#1072#1079#1076#1077#1083
    end
    object Stat_Label: TcxLabel
      Left = 8
      Top = 94
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
      Caption = #1057#1090#1072#1090#1100#1103
    end
    object Smeta_description_Label: TcxLabel
      Left = 104
      Top = 24
      Width = 313
      Height = 35
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Razdel_description_Label: TcxLabel
      Left = 104
      Top = 64
      Width = 313
      Height = 37
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Stat_description_Label: TcxLabel
      Left = 104
      Top = 110
      Width = 313
      Height = 33
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Kekv_Edit: TcxButtonEdit
      Left = 8
      Top = 156
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
      Properties.OnButtonClick = Kekv_EditPropertiesButtonClick
      Properties.OnEditValueChanged = Kekv_EditPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 3
      OnKeyPress = Kekv_EditKeyPress
    end
    object Kekv_description_Label: TcxLabel
      Left = 104
      Top = 158
      Width = 313
      Height = 33
      TabStop = False
      AutoSize = False
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 10
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Kekv_Label: TcxLabel
      Left = 8
      Top = 140
      Width = 89
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 11
      Caption = #1050#1045#1050#1042
    end
    object Procent_edit: TcxCurrencyEdit
      Left = 8
      Top = 192
      Width = 89
      Height = 21
      EditValue = 0
      Properties.DisplayFormat = '0'
      TabOrder = 12
    end
    object Procent_Label: TcxLabel
      Left = 104
      Top = 192
      Width = 91
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 8938270
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
    end
  end
  object DataSet_Add: TpFIBDataSet
    Database = frmPriceReestr.WorkDatabase
    Transaction = frmPriceReestr.ReadTransaction
    UpdateTransaction = frmPriceReestr.WriteTransaction
    Left = 392
    Top = 16
    poSQLINT64ToBCD = True
  end
  object DataSet_deff: TpFIBDataSet
    Database = frmPriceReestr.WorkDatabase
    Transaction = frmPriceReestr.ReadTransaction
    UpdateTransaction = frmPriceReestr.WriteTransaction
    Left = 360
    Top = 16
    poSQLINT64ToBCD = True
  end
end
