object frmGetDefBudget: TfrmGetDefBudget
  Left = 332
  Top = 201
  BorderStyle = bsDialog
  Caption = #1041#1102#1076#1078#1077#1090' '#1076#1083#1103' '#1073#1072#1085#1082#1110#1074#1089#1100#1082#1086#1075#1086' '#1086#1073#1089#1083#1091#1075#1086#1074#1091#1074#1072#1085#1085#1103
  ClientHeight = 113
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 72
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 9
      Width = 119
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090' '#1076#1083#1103' '#1073#1072#1085#1082#1091
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 40
      Top = 33
      Width = 361
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
      Text = #1053#1077' '#1074#1080#1073#1088#1072#1085#1086
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 72
    Width = 414
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
