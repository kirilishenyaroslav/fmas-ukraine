object frmAnketaEdit: TfrmAnketaEdit
  Left = 807
  Top = 469
  Width = 473
  Height = 206
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1072#1085#1082#1077#1090#1110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 127
    Width = 457
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 127
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 22
      Top = 14
      Width = 89
      Height = 13
      Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 20
      Top = 83
      Width = 156
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076' '#1092#1086#1088#1084#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1080#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 112
      Top = 32
      Width = 329
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = 16247513
      TabOrder = 0
    end
    object cxTextEdit1: TcxTextEdit
      Left = 16
      Top = 32
      Width = 89
      Height = 21
      Style.Color = 16247513
      TabOrder = 1
      OnExit = cxTextEdit1Exit
      OnKeyPress = cxTextEdit1KeyPress
    end
    object cxDateEdit1: TcxDateEdit
      Left = 16
      Top = 100
      Width = 121
      Height = 21
      Style.Color = 16247513
      TabOrder = 2
    end
    object TINText: TcxTextEdit
      Left = 112
      Top = 56
      Width = 329
      Height = 21
      Properties.ReadOnly = True
      Style.Color = 16247513
      TabOrder = 3
    end
  end
end
