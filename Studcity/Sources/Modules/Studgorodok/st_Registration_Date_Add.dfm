object Registration_Date_Add_Form: TRegistration_Date_Add_Form
  Left = 494
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1076#1072#1090' '#1087#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1102
  ClientHeight = 203
  ClientWidth = 226
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
    Top = 8
    Width = 50
    Height = 13
    Caption = #8470' '#1079#1076#1072#1085#1080#1103
    Transparent = True
  end
  object Label18: TLabel
    Left = 136
    Top = 8
    Width = 59
    Height = 13
    Caption = #8470' '#1082#1086#1084#1085#1072#1090#1099
    Transparent = True
  end
  object Label19: TLabel
    Left = 8
    Top = 64
    Width = 67
    Height = 13
    Caption = #1058#1080#1087' '#1082#1086#1084#1085#1072#1090#1099
    Transparent = True
  end
  object ShortName_Build_Label: TLabel
    Left = 8
    Top = 48
    Width = 113
    Height = 13
    AutoSize = False
    Caption = #1082#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object cxGroupBox1: TcxGroupBox
    Left = 4
    Top = 104
    Width = 217
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
      Left = 112
      Top = 24
      Width = 97
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = DateEndEditKeyPress
    end
    object cxLabel2: TcxLabel
      Left = 120
      Top = 8
      Width = 22
      Height = 17
      TabOrder = 2
      Caption = #1055#1086
    end
  end
  object OkButton: TcxButton
    Left = 32
    Top = 169
    Width = 89
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 128
    Top = 169
    Width = 89
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  object TypeEdit: TcxButtonEdit
    Left = 8
    Top = 24
    Width = 89
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
  object Nomer_Komnat_Edit: TcxTextEdit
    Left = 136
    Top = 24
    Width = 73
    Height = 21
    AutoSize = False
    BeepOnEnter = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaxLength = 20
    Style.Color = clInfoBk
    TabOrder = 4
    OnExit = Nomer_Komnat_EditExit
    OnKeyPress = Nomer_Komnat_EditKeyPress
  end
  object Type_Room_ComboBox: TcxComboBox
    Left = 4
    Top = 80
    Width = 157
    Height = 21
    BeepOnEnter = False
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 6
    Properties.ValidateOnEnter = False
    Style.BorderStyle = ebsUltraFlat
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    TabOrder = 5
    OnKeyPress = Type_Room_ComboBoxKeyPress
  end
  object ReadDataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    Left = 176
    Top = 56
    poSQLINT64ToBCD = True
  end
end
