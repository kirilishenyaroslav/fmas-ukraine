object frmGetExtParams: TfrmGetExtParams
  Left = 335
  Top = 212
  BorderStyle = bsDialog
  Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1110' '#1087#1072#1088#1072#1084#1077#1090#1088#1080' '#1087#1088#1086#1074#1086#1076#1082#1080
  ClientHeight = 318
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 277
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 58
      Height = 16
      Caption = #1044#1086#1075#1086#1074#1110#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 153
      Width = 150
      Height = 16
      Caption = #1050#1088#1077#1076#1080#1090#1086#1074#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 228
      Width = 110
      Height = 16
      Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxCheckBox1: TcxCheckBox
      Left = 29
      Top = 128
      Width = 201
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = #1055#1077#1088#1077#1073#1088#1086#1089#1082#1072' '#1084#1110#1078' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#1080
      TabOrder = 0
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 29
      Top = 48
      Width = 444
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 1
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 29
      Top = 168
      Width = 444
      Height = 24
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 2
    end
    object cxButtonEdit3: TcxButtonEdit
      Left = 29
      Top = 244
      Width = 444
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object cxMemo1: TcxMemo
      Left = 29
      Top = 71
      Width = 444
      Height = 33
      Lines.Strings = (
        '')
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 4
    end
    object cxMemo2: TcxMemo
      Left = 29
      Top = 191
      Width = 444
      Height = 33
      Enabled = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 277
    Width = 492
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 230
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = cxButton1Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
end
