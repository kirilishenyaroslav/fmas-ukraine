object frmDosImport: TfrmDosImport
  Left = 314
  Top = 230
  BorderStyle = bsDialog
  Caption = #1030#1084#1087#1086#1088#1090' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1076#1086' dbf '#1092#1072#1081#1083#1091
  ClientHeight = 252
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 211
    Width = 407
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1086#1095#1072#1090#1080
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 211
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 113
      Width = 67
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 11
      Top = 161
      Width = 59
      Height = 13
      Caption = #1055#1088#1086#1074#1086#1076#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 17
      Width = 145
      Height = 13
      Caption = #1056#1086#1079#1084#1110#1097#1077#1085#1085#1103' DBF '#1092#1072#1081#1083#1110#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 84
      Width = 41
      Height = 13
      Caption = #1055#1077#1088#1110#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdDBFOutputPath: TcxButtonEdit
      Left = 8
      Top = 32
      Width = 385
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EdDBFOutputPathPropertiesButtonClick
      Style.Color = clInfoBk
      TabOrder = 0
    end
    object Docs: TProgressBar
      Left = 9
      Top = 130
      Width = 385
      Height = 25
      TabOrder = 1
    end
    object Provs: TProgressBar
      Left = 10
      Top = 178
      Width = 385
      Height = 25
      TabOrder = 2
    end
    object cxDateEdit1: TcxDateEdit
      Left = 56
      Top = 80
      Width = 337
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 3
    end
    object Panel3: TPanel
      Left = 112
      Top = 104
      Width = 185
      Height = 41
      Caption = #1049#1076#1077' '#1074#1110#1076#1073#1110#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
  end
  object cxShellBrowserDialog1: TcxShellBrowserDialog
    Left = 8
    Top = 217
  end
end
