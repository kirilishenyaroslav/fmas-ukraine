object frmEditKekv: TfrmEditKekv
  Left = 351
  Top = 268
  BorderStyle = bsDialog
  ClientHeight = 300
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 607
    Height = 257
    Align = alTop
    TabOrder = 0
    object Bevel1: TBevel
      Left = 16
      Top = 16
      Width = 585
      Height = 230
    end
    object Label1: TLabel
      Left = 32
      Top = 35
      Width = 171
      Height = 13
      AutoSize = False
    end
    object Label2: TLabel
      Left = 32
      Top = 84
      Width = 171
      Height = 16
      AutoSize = False
    end
    object Label3: TLabel
      Left = 32
      Top = 113
      Width = 171
      Height = 16
      AutoSize = False
      Caption = #1050#1086#1076' '#1076#1083#1103' '#1076#1077#1088#1078#1072#1074#1085#1086#1075#1086' '#1082#1072#1079#1085'.'
    end
    object Label4: TLabel
      Left = 32
      Top = 171
      Width = 162
      Height = 64
      Caption = 
        #1059' '#1088#1072#1079#1110' '#1079#1072#1082#1088#1080#1090#1090#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1085#1086' '#1079#1084#1110#1085#1102#1074#1072#1090#1080' '#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093' '#1089#1090#1086#1088#1085#1091#1074#1072#1085#1085#1103' '#1085 +
        #1072' '#1050#1045#1050#1042':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 312
      Top = 224
      Width = 136
      Height = 16
      AutoSize = False
      Caption = #1042#1110#1076#1082#1088#1080#1090#1080' '#1076#1086#1074#1110#1076#1085#1080#1082' '#1085#1072' '#1076#1072#1090#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdKekvCode: TEdit
      Left = 218
      Top = 32
      Width = 353
      Height = 24
      Color = clInfoBk
      TabOrder = 0
    end
    object EdKekvTitle: TEdit
      Left = 218
      Top = 80
      Width = 353
      Height = 24
      Color = clInfoBk
      TabOrder = 1
    end
    object cxCheckBox1: TcxCheckBox
      Left = 216
      Top = 144
      Width = 367
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1044#1086'c'#1090#1091#1087#1085#1110#1089#1090#1100' '#1076#1083#1103' '#1074#1080#1073#1086#1088#1091' '#1074' '#1110#1085#1096#1080#1093' '#1073#1091#1093#1075'.'#1089#1080#1089#1090#1077#1084#1072#1093
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 218
      Top = 109
      Width = 353
      Height = 24
      Color = clInfoBk
      MaxLength = 10
      TabOrder = 3
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 219
      Top = 192
      Width = 353
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Style.BorderStyle = ebs3D
      TabOrder = 4
      OnClick = cxButtonEdit1Click
    end
    object OLD_KEKV_CH_DATE: TcxDateEdit
      Left = 450
      Top = 221
      Width = 122
      Height = 24
      Style.BorderStyle = ebs3D
      TabOrder = 5
    end
  end
  object Button1: TButton
    Left = 417
    Top = 265
    Width = 89
    Height = 25
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 513
    Top = 265
    Width = 89
    Height = 25
    TabOrder = 2
    OnClick = Button2Click
  end
end
