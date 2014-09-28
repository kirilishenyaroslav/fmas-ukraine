object frmZEmailConf: TfrmZEmailConf
  Left = 375
  Top = 161
  BorderStyle = bsDialog
  Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1088#1086#1079#1089#1080#1083#1082#1080
  ClientHeight = 472
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 431
    Width = 476
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 368
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
    Width = 476
    Height = 431
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 474
      Height = 429
      ActivePage = TabSheet4
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1088#1086#1079#1089#1080#1083#1082#1080
        object Label1: TLabel
          Left = 30
          Top = 13
          Width = 166
          Height = 47
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1040#1076#1088#1077#1089#1072' SMTP '#1089#1077#1088#1074#1077#1088#1091' ('#1085#1072#1087#1088#1080#1082#1083#1072#1076' mail.ru, 217.69.128.44)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label2: TLabel
          Left = 130
          Top = 60
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'SMTP '#1087#1086#1088#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 127
          Top = 82
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'IMAP4 '#1087#1086#1088#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 94
          Top = 113
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = #1030#1084#39#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 73
          Top = 137
          Width = 123
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1072#1088#1086#1083#1100' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 23
          Top = 161
          Width = 173
          Height = 33
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1040#1076#1088#1077#1089#1072' '#1074#1110#1076#1087#1088#1072#1074#1085#1080#1082#1072' ('#1085#1072#1087#1088#1080#1082#1083#1072#1076' user@mail.ru)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label10: TLabel
          Left = 82
          Top = 254
          Width = 117
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1088#1090' Proxy '#1089#1077#1088#1074#1077#1088#1091
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 9
          Top = 275
          Width = 190
          Height = 31
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1040#1076#1088#1077#1089#1072' Proxy '#1089#1077#1088#1074#1077#1088#1091' HTTPS ('#1085#1072#1087#1088#1080#1082#1083#1072#1076' 192.168.16.1)'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label7: TLabel
          Left = 82
          Top = 304
          Width = 117
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086#1088#1090' Proxy '#1089#1077#1088#1074#1077#1088#1091
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 9
          Top = 324
          Width = 190
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1030#1084#39#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label9: TLabel
          Left = 76
          Top = 348
          Width = 123
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1072#1088#1086#1083#1100' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SMTP_server: TcxTextEdit
          Left = 200
          Top = 13
          Width = 225
          Height = 21
          Style.Color = 16247513
          TabOrder = 0
        end
        object SMTP_port: TcxSpinEdit
          Left = 200
          Top = 58
          Width = 121
          Height = 21
          Style.Color = 16247513
          TabOrder = 1
          Value = 25
        end
        object IMAP_port: TcxSpinEdit
          Left = 200
          Top = 80
          Width = 121
          Height = 21
          Style.Color = 16247513
          TabOrder = 2
          Value = 143
        end
        object SMTP_user: TcxTextEdit
          Left = 200
          Top = 111
          Width = 225
          Height = 21
          Style.Color = 16247513
          TabOrder = 3
        end
        object SMTP_password: TcxTextEdit
          Left = 200
          Top = 135
          Width = 225
          Height = 21
          Style.Color = 16247513
          TabOrder = 4
        end
        object SMTP_account: TcxTextEdit
          Left = 200
          Top = 159
          Width = 225
          Height = 21
          Style.Color = 16247513
          TabOrder = 5
        end
        object CheckHistoryMailBox: TcxCheckBox
          Left = 45
          Top = 191
          Width = 212
          Height = 21
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckHistoryMailBoxPropertiesChange
          Properties.Caption = #1047#1073#1077#1088#1110#1075#1072#1090#1080' '#1074#1110#1076#1087#1088#1072#1074#1083#1077#1085#1110' '#1074' '#1087#1072#1087#1094#1110
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 6
          OnClick = cxCheckBox1Click
        end
        object HistoryMailBox: TcxComboBox
          Left = 256
          Top = 192
          Width = 169
          Height = 21
          Enabled = False
          Style.Color = 16247513
          TabOrder = 7
        end
        object cxCheckBox1: TcxCheckBox
          Left = 5
          Top = 231
          Width = 217
          Height = 21
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' Proxy '#1089#1077#1088#1074#1077#1088
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 8
          OnClick = cxCheckBox1Click
        end
        object Proxy_type: TcxComboBox
          Left = 200
          Top = 251
          Width = 220
          Height = 21
          Enabled = False
          Properties.Items.Strings = (
            'HTTPS')
          Style.Color = 16247513
          TabOrder = 9
          Text = 'HTTPS'
        end
        object Proxy_server: TcxTextEdit
          Left = 200
          Top = 275
          Width = 225
          Height = 21
          Enabled = False
          Style.Color = 16247513
          TabOrder = 10
        end
        object Proxy_port: TcxSpinEdit
          Left = 200
          Top = 301
          Width = 121
          Height = 21
          Enabled = False
          Style.Color = 16247513
          TabOrder = 11
          Value = 3128
        end
        object Proxy_user: TcxTextEdit
          Left = 200
          Top = 324
          Width = 225
          Height = 21
          Enabled = False
          Style.Color = 16247513
          TabOrder = 12
        end
        object Proxy_password: TcxTextEdit
          Left = 200
          Top = 346
          Width = 225
          Height = 21
          Enabled = False
          Style.Color = 16247513
          TabOrder = 13
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1064#1072#1073#1083#1086#1085#1080' '#1076#1083#1103' '#1088#1086#1079#1089#1080#1083#1082#1080' '#1090#1072#1073#1091#1083#1077#1075#1088#1072#1084
        ImageIndex = 1
        object Label15: TLabel
          Left = 6
          Top = 7
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = #1064#1072#1073#1083#1086#1085' '#1083#1080#1089#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 8
          Top = 231
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = #1064#1072#1073#1083#1086#1085' '#1090#1077#1084#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Body_template: TcxMemo
          Left = 0
          Top = 24
          Width = 451
          Height = 193
          Style.Color = 16247513
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 0
          Top = 296
          Width = 466
          Height = 87
          Align = alBottom
          TabOrder = 1
          object Label12: TLabel
            Left = 19
            Top = 10
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = #1044#1086#1089#1090#1091#1087#1085'i '#1084#1072#1082#1088#1086#1089#1080':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 142
            Top = 10
            Width = 142
            Height = 13
            Alignment = taRightJustify
            Caption = '%FIO% - '#1055'.I.'#1041' '#1088#1086#1073'i'#1090#1085#1080#1082#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 142
            Top = 26
            Width = 174
            Height = 13
            Alignment = taRightJustify
            Caption = '%DATE% - '#1087#1077#1088'i'#1086#1076' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object cxTextEdit1: TcxTextEdit
          Left = 0
          Top = 245
          Width = 449
          Height = 21
          Style.Color = 16247513
          TabOrder = 2
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1064#1072#1073#1083#1086#1085' '#1076#1083#1103' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1081#1085#1080#1093' '#1087#1086#1074#1110#1076#1086#1084#1083#1077#1085#1100
        ImageIndex = 2
        object Label17: TLabel
          Left = 6
          Top = 7
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = #1064#1072#1073#1083#1086#1085' '#1083#1080#1089#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 8
          Top = 231
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = #1064#1072#1073#1083#1086#1085' '#1090#1077#1084#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object body_info_template: TcxMemo
          Left = 0
          Top = 24
          Width = 451
          Height = 193
          Style.Color = 16247513
          TabOrder = 0
        end
        object INFO_SUBJECT_TEMPLATE: TcxTextEdit
          Left = 0
          Top = 245
          Width = 449
          Height = 21
          Style.Color = 16247513
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 0
          Top = 296
          Width = 466
          Height = 87
          Align = alBottom
          TabOrder = 2
          object Label19: TLabel
            Left = 19
            Top = 10
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = #1044#1086#1089#1090#1091#1087#1085'i '#1084#1072#1082#1088#1086#1089#1080':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 142
            Top = 10
            Width = 142
            Height = 13
            Alignment = taRightJustify
            Caption = '%FIO% - '#1055'.I.'#1041' '#1088#1086#1073'i'#1090#1085#1080#1082#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 142
            Top = 26
            Width = 174
            Height = 13
            Alignment = taRightJustify
            Caption = '%DATE% - '#1087#1077#1088'i'#1086#1076' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1064#1072#1073#1083#1086#1085' '#1076#1083#1103' '#1088#1086#1079#1089#1080#1083#1082#1080' '#1087#1072#1088#1086#1083#1102' '#1076#1083#1103' '#1072#1088#1093#1110#1074#1091
        ImageIndex = 3
        object Label22: TLabel
          Left = 6
          Top = 7
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = #1064#1072#1073#1083#1086#1085' '#1083#1080#1089#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 8
          Top = 231
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = #1064#1072#1073#1083#1086#1085' '#1090#1077#1084#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object body_pswrd_template: TcxMemo
          Left = 0
          Top = 24
          Width = 451
          Height = 193
          Style.Color = 16247513
          TabOrder = 0
        end
        object PSWRD_SUBJECT_TEMPLATE: TcxTextEdit
          Left = 0
          Top = 245
          Width = 449
          Height = 21
          Style.Color = 16247513
          TabOrder = 1
        end
        object Panel5: TPanel
          Left = 0
          Top = 296
          Width = 466
          Height = 87
          Align = alBottom
          TabOrder = 2
          object Label24: TLabel
            Left = 19
            Top = 10
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = #1044#1086#1089#1090#1091#1087#1085'i '#1084#1072#1082#1088#1086#1089#1080':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 142
            Top = 10
            Width = 142
            Height = 13
            Alignment = taRightJustify
            Caption = '%FIO% - '#1055'.I.'#1041' '#1088#1086#1073'i'#1090#1085#1080#1082#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 142
            Top = 26
            Width = 174
            Height = 13
            Alignment = taRightJustify
            Caption = '%DATE% - '#1087#1077#1088'i'#1086#1076' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 141
            Top = 42
            Width = 119
            Height = 13
            Alignment = taRightJustify
            Caption = '%PSWRD% - '#1087#1072#1088#1086#1083#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  object IMAP: TIdIMAP4
    SASLMechanisms = <>
    MilliSecsToWaitToClearBuffer = 10
    Left = 24
    Top = 32
  end
end
