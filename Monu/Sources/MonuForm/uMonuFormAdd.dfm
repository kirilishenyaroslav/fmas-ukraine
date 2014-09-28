object frmAdd: TfrmAdd
  Left = 436
  Top = 232
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  ClientHeight = 326
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    367
    326)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 88
    Top = 291
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 192
    Top = 291
    Width = 91
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 345
    Height = 273
    Alignment = alTopLeft
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 56
      Height = 13
      Caption = #1050#1086#1076' '#1092#1086#1088#1084#1080
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 118
      Height = 13
      Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1088#1080#1085#1072#1083#1077#1078#1085#1110#1089#1090#1100
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 51
      Height = 13
      Caption = #1055#1088#1086#1075#1088#1072#1084#1072
    end
    object Label4: TLabel
      Left = 16
      Top = 136
      Width = 56
      Height = 13
      Caption = #1058#1080#1087' '#1092#1086#1088#1084#1080
    end
    object Label5: TLabel
      Left = 16
      Top = 220
      Width = 71
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1092#1086#1088#1084#1080
    end
    object Label6: TLabel
      Left = 16
      Top = 176
      Width = 69
      Height = 13
      Caption = #1053#1072#1079#1074#1072' '#1092#1086#1088#1084#1080
    end
    object beFormCode: TcxButtonEdit
      Left = 64
      Top = 32
      Width = 265
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clSkyBlue
      TabOrder = 0
    end
    object beKVK: TcxButtonEdit
      Left = 64
      Top = 72
      Width = 265
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = beKVKPropertiesButtonClick
      Style.Color = clSkyBlue
      TabOrder = 1
    end
    object beProgram: TcxButtonEdit
      Left = 64
      Top = 112
      Width = 265
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = beProgramPropertiesButtonClick
      Style.Color = clSkyBlue
      TabOrder = 2
    end
    object beTypeForm: TcxButtonEdit
      Left = 64
      Top = 152
      Width = 265
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = beTypeFormPropertiesButtonClick
      Style.Color = clSkyBlue
      TabOrder = 3
    end
    object eTypeForm: TcxTextEdit
      Left = 16
      Top = 152
      Width = 49
      Height = 21
      Properties.MaxLength = 10
      Properties.OnChange = eTypeFormPropertiesChange
      Style.Color = clSkyBlue
      TabOrder = 4
      OnExit = eTypeFormExit
      OnKeyPress = eTypeFormKeyPress
    end
    object eFormCode: TcxTextEdit
      Left = 16
      Top = 32
      Width = 49
      Height = 21
      Properties.MaxLength = 6
      Properties.OnChange = eTypeFormPropertiesChange
      Style.Color = clSkyBlue
      TabOrder = 5
      OnExit = eFormCodeExit
      OnKeyPress = eFormCodeKeyPress
    end
    object eKVK: TcxTextEdit
      Left = 16
      Top = 72
      Width = 49
      Height = 21
      Properties.MaxLength = 10
      Properties.OnChange = eTypeFormPropertiesChange
      Style.Color = clSkyBlue
      TabOrder = 6
      OnExit = eKVKExit
      OnKeyPress = eKVKKeyPress
    end
    object eProgram: TcxTextEdit
      Left = 16
      Top = 112
      Width = 49
      Height = 21
      Properties.OnChange = eTypeFormPropertiesChange
      Style.Color = clSkyBlue
      TabOrder = 7
      OnExit = eProgramExit
      OnKeyPress = eProgramKeyPress
    end
    object eNameForm: TcxTextEdit
      Left = 16
      Top = 192
      Width = 313
      Height = 21
      Properties.MaxLength = 255
      Properties.ReadOnly = False
      Style.Color = clSkyBlue
      TabOrder = 8
      OnKeyPress = eNameFormKeyPress
    end
    object eNumForm: TcxTextEdit
      Left = 16
      Top = 236
      Width = 313
      Height = 21
      Properties.MaxLength = 255
      Properties.ReadOnly = False
      Style.Color = clSkyBlue
      TabOrder = 9
      OnKeyPress = eNumFormKeyPress
    end
  end
  object Query1: TpFIBQuery
    Left = 360
    Top = 65520
  end
end
