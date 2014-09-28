object frmReestr_Subsidy_AE: TfrmReestr_Subsidy_AE
  Left = 514
  Top = 320
  Width = 279
  Height = 298
  Caption = 'frmReestr_Subsidy_AE'
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
  object Label_name_subsidy: TcxLabel
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
    Top = 88
    Width = 73
    Height = 17
    TabOrder = 3
  end
  object Label_comments: TcxLabel
    Left = 8
    Top = 136
    Width = 88
    Height = 17
    TabOrder = 4
  end
  object Button_Ok: TcxButton
    Left = 112
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Button_Ok'
    TabOrder = 5
    OnClick = Button_OkClick
  end
  object Button_Cancel: TcxButton
    Left = 192
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Button_Cancel'
    TabOrder = 6
    OnClick = Button_CancelClick
  end
  object ButtonEdit_name_subsidy: TcxButtonEdit
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
    Properties.OnButtonClick = ButtonEdit_name_subsidyPropertiesButtonClick
    TabOrder = 7
    Text = 'ButtonEdit_name_subsidy'
  end
  object DateEdit_date_beg: TcxDateEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 8
    EditValue = 0d
  end
  object DateEdit_date_end: TcxDateEdit
    Left = 144
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 9
    EditValue = 0d
  end
  object CurrencyEdit_summa: TcxCurrencyEdit
    Left = 8
    Top = 104
    Width = 121
    Height = 21
    EditValue = 0.000000000000000000
    Properties.DisplayFormat = '0.00'
    TabOrder = 10
  end
  object Memo_comments: TcxMemo
    Left = 8
    Top = 152
    Width = 257
    Height = 65
    TabOrder = 11
  end
end
