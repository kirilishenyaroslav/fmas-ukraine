object PfSub_Add_Form: TPfSub_Add_Form
  Left = 598
  Top = 289
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1091#1073#1089#1080#1076#1080#1080
  ClientHeight = 271
  ClientWidth = 246
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
  object Label16: TLabel
    Left = 8
    Top = 48
    Width = 69
    Height = 13
    Caption = #1058#1080#1087' '#1089#1091#1073#1089#1080#1076#1080#1080
    Transparent = True
  end
  object Label18: TLabel
    Left = 160
    Top = 48
    Width = 34
    Height = 13
    Caption = #1057#1091#1084#1084#1072
    Transparent = True
  end
  object Label19: TLabel
    Left = 8
    Top = 88
    Width = 54
    Height = 13
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
    Transparent = True
  end
  object Label1: TLabel
    Left = 152
    Top = 88
    Width = 81
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1084#1077#1089#1103#1094#1077#1074
    Transparent = True
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 192
    Width = 70
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    Transparent = True
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 128
    Width = 241
    Height = 57
    Alignment = alTopLeft
    TabOrder = 5
    TabStop = False
    object DateBegEdit: TcxDateEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = DateBegEditKeyPress
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Width = 15
      Height = 17
      TabStop = False
      TabOrder = 2
      Caption = #1057
    end
    object DateEndEdit: TcxDateEdit
      Left = 136
      Top = 24
      Width = 97
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = DateEndEditKeyPress
    end
    object cxLabel2: TcxLabel
      Left = 136
      Top = 8
      Width = 22
      Height = 17
      TabStop = False
      TabOrder = 3
      Caption = #1055#1086
    end
  end
  object OkButton: TcxButton
    Left = 64
    Top = 241
    Width = 81
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 7
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 152
    Top = 241
    Width = 81
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 8
    OnClick = CancelButtonClick
  end
  object Sub_State_ComboBox: TcxComboBox
    Left = 8
    Top = 104
    Width = 125
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 6
    Properties.ValidateOnEnter = False
    Style.BorderStyle = ebsUltraFlat
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    TabOrder = 3
    OnKeyPress = Sub_State_ComboBoxKeyPress
  end
  object Comment_Edit: TcxTextEdit
    Left = 8
    Top = 208
    Width = 225
    Height = 21
    AutoSize = False
    BeepOnEnter = False
    Properties.AutoSelect = False
    Properties.MaxLength = 100
    Style.Color = clInfoBk
    TabOrder = 6
    OnKeyPress = Comment_EditKeyPress
  end
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
    TabOrder = 9
    Caption = #1055#1086#1089#1083#1091#1075#1072
  end
  object serves_ButtonEdit: TcxButtonEdit
    Left = 8
    Top = 24
    Width = 225
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = serves_ButtonEditPropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 0
    OnKeyPress = serves_ButtonEditKeyPress
  end
  object TypeEdit: TcxButtonEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = TypeEditPropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 1
    OnKeyPress = TypeEditKeyPress
  end
  object summa_edit: TcxCurrencyEdit
    Left = 152
    Top = 64
    Width = 81
    Height = 21
    Properties.DisplayFormat = '0.00'
    Style.Color = clInfoBk
    TabOrder = 2
    OnKeyPress = Summa_EditKeyPress
  end
  object month_edit: TcxCurrencyEdit
    Left = 152
    Top = 104
    Width = 81
    Height = 21
    Properties.DisplayFormat = '0.00'
    Style.Color = clInfoBk
    TabOrder = 4
    OnKeyPress = Month_EditKeyPress
  end
  object ReadDataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    Left = 8
    Top = 232
    poSQLINT64ToBCD = True
  end
end
