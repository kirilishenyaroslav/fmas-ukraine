object frm_Add_Edit_Prikaz: Tfrm_Add_Edit_Prikaz
  Left = 321
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 159
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ord_ae_GroupBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 470
    Height = 113
    Align = alTop
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    object ord_ae_TypeOrder_Label: TLabel
      Left = 8
      Top = 16
      Width = 57
      Height = 13
      Caption = #1058#1080#1087' '#1085#1072#1082#1072#1079#1091
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_NomOrder_Label: TLabel
      Left = 241
      Top = 16
      Width = 72
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1072#1079#1091
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_DateOrder_Label: TLabel
      Left = 361
      Top = 16
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1082#1072#1079#1091
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_Comments_Label: TLabel
      Left = 8
      Top = 64
      Width = 52
      Height = 13
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1110
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object ord_ae_Nom_Ord: TcxTextEdit
      Left = 240
      Top = 30
      Width = 113
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 10
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnKeyPress = ord_ae_Nom_OrdKeyPress
    end
    object ord_ae_Comments: TcxTextEdit
      Left = 8
      Top = 76
      Width = 457
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 200
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      OnKeyPress = ord_ae_CommentsKeyPress
    end
    object ord_ae_Date_Ord: TcxDateEdit
      Left = 360
      Top = 30
      Width = 105
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
      OnKeyPress = ord_ae_Date_OrdKeyPress
    end
    object ord_ae_Type_Ord: TcxButtonEdit
      Left = 8
      Top = 30
      Width = 221
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ord_ae_Type_OrdPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.ButtonTransparency = ebtNone
      TabOrder = 0
      OnKeyPress = ord_ae_Type_OrdKeyPress
    end
  end
  object ord_ae_OkButton: TcxButton
    Left = 287
    Top = 125
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = ord_ae_OkButtonClick
  end
  object ord_ae_CancelButton: TcxButton
    Left = 378
    Top = 125
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = ord_ae_CancelButtonClick
  end
end
