object frmDogOrders_AE: TfrmDogOrders_AE
  Left = 525
  Top = 351
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmDogOrders_AE'
  ClientHeight = 149
  ClientWidth = 475
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
  object OkButton: TcxButton
    Left = 297
    Top = 118
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 389
    Top = 118
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object ord_ae_GroupBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 475
    Height = 113
    Align = alTop
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
      Properties.MaxLength = 50
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
      Properties.MaxLength = 255
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
      Text = '...'
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
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ord_ae_Type_OrdPropertiesButtonClick
      Style.Color = 16311512
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
end
