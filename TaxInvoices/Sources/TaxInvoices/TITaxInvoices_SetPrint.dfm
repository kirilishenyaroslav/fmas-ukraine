object TITaxInvoicesSetPrintForm: TTITaxInvoicesSetPrintForm
  Left = 412
  Top = 239
  BorderStyle = bsDialog
  Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103' '#1076#1088#1091#1082#1091' '#1087#1086#1076#1072#1090#1082#1086#1074#1080#1093' '#1085#1072#1082#1083#1072#1076#1085#1080#1093
  ClientHeight = 293
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 337
    Height = 200
    TabOrder = 0
    object Label15: TLabel
      Left = 96
      Top = 24
      Width = 142
      Height = 16
      Caption = #1055#1077#1088#1096#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxGroupBox1: TcxGroupBox
      Left = 16
      Top = 49
      Width = 89
      Height = 97
      Alignment = alTopLeft
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 59
        Height = 16
        Caption = #1054#1088#1080#1075#1110#1085#1072#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 104
      Top = 96
      Width = 153
      Height = 49
      TabOrder = 1
      object Label5: TLabel
        Left = 40
        Top = 32
        Width = 67
        Height = 13
        Caption = '('#1090#1080#1087' '#1087#1088#1080#1095#1080#1085#1080')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 16
        Width = 127
        Height = 13
        Caption = #1047#1072#1083#1080#1096#1072#1108#1090#1100#1089#1103' '#1091' '#1087#1088#1086#1076#1072#1074#1094#1103
      end
    end
    object GroupBox3: TGroupBox
      Left = 104
      Top = 74
      Width = 153
      Height = 30
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 98
        Height = 13
        Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1076#1086' '#1028#1056#1055#1053
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox4: TGroupBox
      Left = 16
      Top = 140
      Width = 241
      Height = 29
      TabOrder = 3
      object Label6: TLabel
        Left = 8
        Top = 8
        Width = 162
        Height = 13
        Caption = #1050#1086#1087#1110#1103' ('#1079#1072#1083#1080#1096#1072#1108#1090#1100#1089#1103' '#1091' '#1087#1088#1086#1076#1072#1074#1094#1103')'
      end
    end
    object GroupBox1: TGroupBox
      Left = 104
      Top = 49
      Width = 153
      Height = 31
      TabOrder = 4
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 100
        Height = 13
        Caption = #1042#1080#1076#1072#1108#1090#1100#1089#1103' '#1087#1086#1082#1091#1087#1094#1102
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox9: TGroupBox
      Left = 256
      Top = 49
      Width = 65
      Height = 31
      TabOrder = 5
      object IS_ISSUED_BUYER_CheckBox: TCheckBox
        Left = 24
        Top = 8
        Width = 25
        Height = 17
        TabOrder = 0
      end
    end
    object GroupBox10: TGroupBox
      Left = 256
      Top = 140
      Width = 65
      Height = 29
      TabOrder = 6
      object Is_copy_CheckBox: TCheckBox
        Left = 24
        Top = 10
        Width = 25
        Height = 17
        TabOrder = 0
      end
    end
    object GroupBox11: TGroupBox
      Left = 256
      Top = 98
      Width = 65
      Height = 48
      TabOrder = 7
      object IS_REMAINS_SELLER_CheckBox: TCheckBox
        Left = 24
        Top = 8
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = IS_REMAINS_SELLER_CheckBoxClick
      end
      object SpecialNotes1ButtonEdit: TcxButtonEdit
        Left = 8
        Top = 24
        Width = 49
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = SpecialNotes1ButtonEditPropertiesButtonClick
        TabOrder = 1
        Text = 'SpecialNotes1ButtonEdit'
      end
    end
    object GroupBox12: TGroupBox
      Left = 256
      Top = 74
      Width = 65
      Height = 30
      TabOrder = 8
      object IS_ERPN_CheckBox: TCheckBox
        Left = 24
        Top = 8
        Width = 17
        Height = 17
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 337
    Top = 41
    Width = 359
    Height = 200
    TabOrder = 1
    object Label16: TLabel
      Left = 112
      Top = 24
      Width = 138
      Height = 16
      Caption = #1044#1088#1091#1075#1080#1081' '#1077#1082#1079#1077#1084#1087#1083#1103#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxGroupBox2: TcxGroupBox
      Left = 24
      Top = 49
      Width = 89
      Height = 97
      Alignment = alTopLeft
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      object Label7: TLabel
        Left = 8
        Top = 40
        Width = 59
        Height = 16
        Caption = #1054#1088#1080#1075#1110#1085#1072#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox5: TGroupBox
      Left = 112
      Top = 49
      Width = 153
      Height = 31
      TabOrder = 1
      object Label8: TLabel
        Left = 8
        Top = 8
        Width = 100
        Height = 13
        Caption = #1042#1080#1076#1072#1108#1090#1100#1089#1103' '#1087#1086#1082#1091#1087#1094#1102
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox6: TGroupBox
      Left = 112
      Top = 74
      Width = 153
      Height = 30
      TabOrder = 2
      object Label9: TLabel
        Left = 8
        Top = 8
        Width = 98
        Height = 13
        Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1076#1086' '#1028#1056#1055#1053
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object GroupBox7: TGroupBox
      Left = 112
      Top = 96
      Width = 153
      Height = 49
      TabOrder = 3
      object Label11: TLabel
        Left = 48
        Top = 32
        Width = 67
        Height = 13
        Caption = '('#1090#1080#1087' '#1087#1088#1080#1095#1080#1085#1080')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 8
        Top = 16
        Width = 127
        Height = 13
        Caption = #1047#1072#1083#1080#1096#1072#1108#1090#1100#1089#1103' '#1091' '#1087#1088#1086#1076#1072#1074#1094#1103
      end
    end
    object GroupBox8: TGroupBox
      Left = 24
      Top = 140
      Width = 241
      Height = 29
      TabOrder = 4
      object Label12: TLabel
        Left = 8
        Top = 8
        Width = 162
        Height = 13
        Caption = #1050#1086#1087#1110#1103' ('#1079#1072#1083#1080#1096#1072#1108#1090#1100#1089#1103' '#1091' '#1087#1088#1086#1076#1072#1074#1094#1103')'
      end
    end
    object GroupBox13: TGroupBox
      Left = 264
      Top = 140
      Width = 65
      Height = 29
      TabOrder = 5
      object is_copy_two_ekz_CheckBox: TCheckBox
        Left = 24
        Top = 10
        Width = 25
        Height = 17
        TabOrder = 0
      end
    end
    object GroupBox14: TGroupBox
      Left = 264
      Top = 98
      Width = 65
      Height = 48
      TabOrder = 6
      object is_remains_seller_two_ekz_CheckBox: TCheckBox
        Left = 24
        Top = 8
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = is_remains_seller_two_ekz_CheckBoxClick
      end
      object SpecialNotes2ButtonEdit: TcxButtonEdit
        Left = 8
        Top = 24
        Width = 49
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = SpecialNotes2ButtonEditPropertiesButtonClick
        TabOrder = 1
        Text = 'SpecialNotes1ButtonEdit'
      end
    end
    object GroupBox15: TGroupBox
      Left = 264
      Top = 74
      Width = 65
      Height = 30
      TabOrder = 7
      object is_erpn_two_ekz_CheckBox: TCheckBox
        Left = 24
        Top = 8
        Width = 17
        Height = 17
        TabOrder = 0
      end
    end
    object GroupBox16: TGroupBox
      Left = 264
      Top = 49
      Width = 65
      Height = 31
      TabOrder = 8
      object is_issued_buyer_two_ekz_CheckBox: TCheckBox
        Left = 24
        Top = 8
        Width = 25
        Height = 17
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 684
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label13: TLabel
      Left = 16
      Top = 16
      Width = 121
      Height = 16
      Caption = #1055#1077#1088#1110#1086#1076' '#1088#1077#1108#1089#1090#1088#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 304
      Top = 16
      Width = 150
      Height = 16
      Caption = #1042#1080#1076#1072#1085#1072' '#1085#1072#1082#1083#1072#1076#1085#1072' '#8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PeriodReestrDBLabel: TcxDBLabel
      Left = 144
      Top = 16
      Width = 161
      Height = 20
      DataBinding.DataField = 'KOD_SETUP_OUT'
      DataBinding.DataSource = TaxInvoicesDM.ReestrDSource
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object NumVidNaklDBLabel: TcxDBLabel
      Left = 456
      Top = 16
      Width = 155
      Height = 20
      DataBinding.DataField = 'NUM_NAKL'
      DataBinding.DataSource = TaxInvoicesDM.VidNaklDSource
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object YesButton: TcxButton
    Left = 488
    Top = 256
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 3
    OnClick = YesButtonClick
  end
  object CancelButton: TcxButton
    Left = 576
    Top = 256
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = CancelButtonClick
  end
end
