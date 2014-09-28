object PfLg_Add_Form: TPfLg_Add_Form
  Left = 431
  Top = 210
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1083#1100#1075#1086#1090#1072#1093
  ClientHeight = 222
  ClientWidth = 255
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
    Top = 4
    Width = 73
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1083#1100#1075#1086#1090#1099
    Transparent = True
  end
  object Full_LG_Label: TLabel
    Left = 8
    Top = 44
    Width = 241
    Height = 29
    AutoSize = False
    Transparent = True
    WordWrap = True
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 68
    Width = 241
    Height = 57
    Alignment = alTopLeft
    TabOrder = 0
    object DateBegEdit: TcxDateEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = DateBegEditKeyPress
    end
    object cxLabel1: TcxLabel
      Left = 8
      Top = 8
      Width = 15
      Height = 17
      TabOrder = 0
      Caption = #1057
    end
    object DateEndEdit: TcxDateEdit
      Left = 136
      Top = 24
      Width = 97
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = DateEndEditKeyPress
    end
    object cxLabel2: TcxLabel
      Left = 136
      Top = 8
      Width = 22
      Height = 17
      TabOrder = 2
      Caption = #1055#1086
    end
  end
  object OkButton: TcxButton
    Left = 80
    Top = 189
    Width = 81
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 168
    Top = 189
    Width = 81
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object TypeEdit: TcxButtonEdit
    Left = 8
    Top = 20
    Width = 241
    Height = 21
    BeepOnEnter = False
    Properties.Buttons = <
      item
        Default = True
      end>
    Properties.OnButtonClick = TypeEditPropertiesButtonClick
    Style.Color = clInfoBk
    Style.LookAndFeel.NativeStyle = False
    TabOrder = 3
    OnExit = TypeEditExit
    OnKeyPress = TypeEditKeyPress
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 124
    Width = 241
    Height = 57
    Alignment = alTopLeft
    TabOrder = 4
    object DataPrikaza_Edit: TcxDateEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = DataPrikaza_EditKeyPress
    end
    object DataPrikaza_Label: TcxLabel
      Left = 8
      Top = 8
      Width = 81
      Height = 17
      AutoSize = False
      TabOrder = 0
      Caption = #1044#1072#1090#1072' '#1087#1088#1080#1082#1072#1079#1072
    end
    object NomerPrikaza_Label: TcxLabel
      Left = 136
      Top = 8
      Width = 89
      Height = 17
      AutoSize = False
      TabOrder = 2
      Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1082#1072#1079#1072
    end
    object NomerPrikaza_Edit: TcxTextEdit
      Left = 136
      Top = 24
      Width = 97
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = NomerPrikaza_EditKeyPress
    end
  end
  object ReadDataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    Left = 192
    Top = 12
    poSQLINT64ToBCD = True
  end
end
