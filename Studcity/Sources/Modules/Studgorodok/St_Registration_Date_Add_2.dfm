object Registration_Date_Add_Form_2: TRegistration_Date_Add_Form_2
  Left = 673
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1076#1072#1090' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
  ClientHeight = 153
  ClientWidth = 256
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label22: TLabel
    Left = 8
    Top = 0
    Width = 74
    Height = 13
    Caption = #1050#1086#1076' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
    Transparent = True
  end
  object Full_Cat_Label: TLabel
    Left = 8
    Top = 40
    Width = 225
    Height = 17
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object cxGroupBox1: TcxGroupBox
    Left = 7
    Top = 58
    Width = 242
    Height = 57
    Alignment = alTopLeft
    TabOrder = 1
    object DateBegEdit: TcxDateEdit
      Left = 8
      Top = 24
      Width = 105
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
      Left = 128
      Top = 24
      Width = 105
      Height = 21
      BeepOnEnter = False
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = DateEndEditKeyPress
    end
    object cxLabel2: TcxLabel
      Left = 128
      Top = 8
      Width = 22
      Height = 17
      TabOrder = 2
      Caption = #1055#1086
    end
  end
  object OkButton: TcxButton
    Left = 59
    Top = 122
    Width = 89
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 2
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 155
    Top = 122
    Width = 89
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object Category_ButtonEdit: TcxButtonEdit
    Left = 8
    Top = 16
    Width = 241
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = Category_ButtonEditPropertiesButtonClick
    Style.Color = clInfoBk
    TabOrder = 0
    OnExit = Category_ButtonEdit2Exit
    OnKeyPress = Category_ButtonEdit2KeyPress
  end
  object TypeRoom_Selecter_DataSet: TpFIBDataSet
    Database = DataModule1.DB
    Transaction = DataModule1.ReadTransaction
    UpdateTransaction = DataModule1.WriteTransaction
    DefaultFormats.DateTimeDisplayFormat = 'd MMMM yyyy '#39#1075'.'#39
    Left = 19
    Top = 104
    poSQLINT64ToBCD = True
  end
end
