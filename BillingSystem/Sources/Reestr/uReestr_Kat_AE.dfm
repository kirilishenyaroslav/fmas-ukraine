object frmReestr_Kat_AE: TfrmReestr_Kat_AE
  Left = 469
  Top = 242
  Width = 281
  Height = 269
  Caption = 'frmReestr_Kat_AE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label_name_kat: TcxLabel
    Left = 8
    Top = 8
    Width = 107
    Height = 17
    TabOrder = 0
  end
  object Label_date_beg: TcxLabel
    Left = 8
    Top = 48
    Width = 85
    Height = 17
    TabOrder = 1
  end
  object Label_date_end: TcxLabel
    Left = 144
    Top = 48
    Width = 85
    Height = 17
    TabOrder = 2
  end
  object Label_summa: TcxLabel
    Left = 8
    Top = 152
    Width = 73
    Height = 17
    TabOrder = 3
  end
  object Button_Ok: TcxButton
    Left = 112
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button_Ok'
    TabOrder = 4
    OnClick = Button_OkClick
  end
  object Button_Cancel: TcxButton
    Left = 192
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button_Cancel'
    TabOrder = 5
    OnClick = Button_CancelClick
  end
  object ButtonEdit_name_Kat: TcxButtonEdit
    Left = 8
    Top = 24
    Width = 257
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = ButtonEdit_name_KatPropertiesButtonClick
    TabOrder = 6
    Text = 'ButtonEdit_name_Kat'
  end
  object DateEdit_date_beg: TcxDateEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 7
    EditValue = 0d
  end
  object DateEdit_date_end: TcxDateEdit
    Left = 144
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 8
    EditValue = 0d
  end
  object CurrencyEdit_summa: TcxCurrencyEdit
    Left = 8
    Top = 168
    Width = 121
    Height = 21
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '0.00'
    TabOrder = 9
  end
  object cxCheckBox1: TcxCheckBox
    Left = 8
    Top = 88
    Width = 257
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBox1PropertiesChange
    Properties.Caption = #1055#1086#1082#1072#1079#1085#1080#1082#1080' '#1083#1110#1095#1110#1083#1100#1085#1080#1082#1072
    TabOrder = 10
  end
  object cxCurrencyEdit1: TcxCurrencyEdit
    Left = 8
    Top = 128
    Width = 121
    Height = 21
    Enabled = False
    Properties.DisplayFormat = '0'
    TabOrder = 11
  end
  object cxCurrencyEdit2: TcxCurrencyEdit
    Left = 144
    Top = 128
    Width = 121
    Height = 21
    Enabled = False
    Properties.DisplayFormat = '0'
    TabOrder = 12
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 112
    Width = 64
    Height = 17
    TabOrder = 13
    Caption = #1053#1072' '#1087#1086#1095#1072#1090#1082#1091
  end
  object cxLabel2: TcxLabel
    Left = 144
    Top = 112
    Width = 65
    Height = 17
    TabOrder = 14
    Caption = #1053#1072' '#1087#1088#1080#1082#1110#1085#1094#1110
  end
end
