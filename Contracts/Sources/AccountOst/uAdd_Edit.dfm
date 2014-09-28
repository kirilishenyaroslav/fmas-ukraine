object frmAdd_Edit: TfrmAdd_Edit
  Left = 359
  Top = 113
  Width = 449
  Height = 400
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
    Left = 280
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Button_ok'
    TabOrder = 0
    OnClick = Button_okClick
  end
  object Button_cancel: TcxButton
    Left = 360
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Button_cancel'
    TabOrder = 1
    OnClick = Button_cancelClick
  end
  object GroupBox: TcxGroupBox
    Left = 8
    Top = 0
    Width = 425
    Height = 329
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object Summa_Edit: TcxCurrencyEdit
      Left = 9
      Top = 114
      Width = 69
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;-0.00'
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = Summa_EditKeyPress
    end
    object Persent_Label: TcxLabel
      Left = 10
      Top = 96
      Width = 42
      Height = 17
      TabStop = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
      Caption = #1057#1091#1084#1084#1072
    end
    object Smeta_Edit: TcxButtonEdit
      Left = 8
      Top = 160
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
      OnKeyPress = Smeta_EditKeyPress
    end
    object Razdel_Edit: TcxButtonEdit
      Left = 8
      Top = 200
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
      TabOrder = 4
      OnKeyPress = Razdel_EditKeyPress
    end
    object Stat_Edit: TcxButtonEdit
      Left = 8
      Top = 246
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
      TabOrder = 5
      OnKeyPress = Stat_EditKeyPress
    end
    object Smeta_Label: TcxLabel
      Left = 8
      Top = 144
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
      TabOrder = 8
      Caption = #1057#1084#1077#1090#1072
    end
    object Razdel_Label: TcxLabel
      Left = 8
      Top = 184
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
      TabOrder = 9
      Caption = #1056#1072#1079#1076#1077#1083
    end
    object Stat_Label: TcxLabel
      Left = 8
      Top = 230
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
      TabOrder = 10
      Caption = #1057#1090#1072#1090#1100#1103
    end
    object Smeta_description_Label: TcxLabel
      Left = 104
      Top = 160
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
      TabOrder = 11
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Razdel_description_Label: TcxLabel
      Left = 104
      Top = 200
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
      TabOrder = 12
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Stat_description_Label: TcxLabel
      Left = 104
      Top = 246
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
      TabOrder = 13
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object P_Label: TcxLabel
      Left = 84
      Top = 115
      Width = 33
      Height = 17
      TabStop = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 14
      Caption = #1075#1088#1085'.'
    end
    object Kekv_Edit: TcxButtonEdit
      Left = 8
      Top = 292
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
      TabOrder = 6
      OnKeyPress = Kekv_EditKeyPress
    end
    object Kekv_description_Label: TcxLabel
      Left = 104
      Top = 294
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
      TabOrder = 15
      Visible = False
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    end
    object Kekv_Label: TcxLabel
      Left = 8
      Top = 276
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
      TabOrder = 16
      Caption = #1050#1045#1050#1042
    end
    object Edit_num_dog: TcxTextEdit
      Left = 8
      Top = 72
      Width = 121
      Height = 21
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Edit_num_dogKeyPress
    end
    object Label_Num_dog: TcxLabel
      Left = 8
      Top = 56
      Width = 0
      Height = 4
      TabOrder = 17
      Caption = ''
    end
    object Label_fio: TcxLabel
      Left = 8
      Top = 16
      Width = 0
      Height = 4
      TabOrder = 18
      Caption = ''
    end
    object Edit_FIO: TcxButtonEdit
      Left = 8
      Top = 32
      Width = 409
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Edit_FIOKeyPress
    end
  end
  object DataSet_Add: TpFIBDataSet
    Database = frmAccountOst_main.DB
    Transaction = frmAccountOst_main.Tran_Read
    UpdateTransaction = frmAccountOst_main.Tran_write
    Left = 120
    Top = 336
    poSQLINT64ToBCD = True
  end
end
