object frm_Contracts_Periods_AE: Tfrm_Contracts_Periods_AE
  Left = 553
  Top = 297
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frm_Contracts_Periods_AE'
  ClientHeight = 242
  ClientWidth = 287
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
  object id_stud_Label: TLabel
    Left = 14
    Top = 1
    Width = 40
    Height = 13
    Caption = #1057#1090#1091#1076#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object id_payer_Label: TLabel
    Left = 14
    Top = 38
    Width = 64
    Height = 13
    Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox: TcxGroupBox
    Left = 8
    Top = 80
    Width = 273
    Height = 121
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Date_End_Label: TLabel
      Left = 43
      Top = 44
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date_End_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Date_Beg_Label: TLabel
      Left = 43
      Top = 20
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date_Beg_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Date_Opl_Label: TLabel
      Left = 46
      Top = 68
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date_Opl_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Summa_Label: TLabel
      Left = 56
      Top = 92
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Summa_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Date_End_DateEdit: TcxDateEdit
      Left = 128
      Top = 40
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Date_End_DateEditKeyPress
    end
    object Date_Beg_DateEdit: TcxDateEdit
      Left = 128
      Top = 16
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = Date_Beg_DateEditPropertiesChange
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Date_Beg_DateEditKeyPress
    end
    object Date_Opl_DateEdit: TcxDateEdit
      Left = 128
      Top = 64
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = Date_Opl_DateEditKeyPress
    end
    object Summa_Edit: TcxCurrencyEdit
      Left = 128
      Top = 88
      Width = 81
      Height = 21
      BeepOnEnter = False
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;'
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = Summa_EditKeyPress
    end
  end
  object OkButton: TcxButton
    Left = 103
    Top = 210
    Width = 85
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 195
    Top = 210
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object id_payer_ComboBox: TcxComboBox
    Left = 11
    Top = 52
    Width = 270
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 6
    Properties.ReadOnly = False
    Properties.ValidateOnEnter = False
    Style.Color = 16311512
    TabOrder = 3
  end
  object id_stud_ComboBox: TcxComboBox
    Left = 11
    Top = 14
    Width = 270
    Height = 21
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 6
    Properties.ReadOnly = False
    Properties.ValidateOnEnter = False
    Style.Color = 16311512
    TabOrder = 4
  end
end
