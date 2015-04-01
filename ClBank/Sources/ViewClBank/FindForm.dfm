object frmFindForm: TfrmFindForm
  Left = 672
  Top = 214
  Width = 343
  Height = 536
  Caption = #1060#1110#1083#1100#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxFind: TGroupBox
    Left = 0
    Top = 0
    Width = 327
    Height = 498
    Align = alClient
    Caption = #1055#1086#1096#1091#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxCheckBoxNumberDoc: TcxCheckBox
      Left = 0
      Top = 87
      Width = 127
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 2
      OnClick = cxCheckBoxNumberDocClick
    end
    object cxCheckBoxCustomer: TcxCheckBox
      Left = 0
      Top = 238
      Width = 152
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 8
      OnClick = cxCheckBoxCustomerClick
    end
    object GroupBoxCustomer: TGroupBox
      Left = 121
      Top = 256
      Width = 192
      Height = 52
      TabOrder = 10
      object cxButtonEditCustomer: TcxButtonEdit
        Left = 3
        Top = 7
        Width = 189
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxButtonEditCustomerPropertiesButtonClick
        Style.Color = 15204351
        TabOrder = 0
      end
      object cxTextEditCustomer: TcxTextEdit
        Left = 3
        Top = 28
        Width = 189
        Height = 21
        Enabled = False
        Style.Color = 15204351
        TabOrder = 1
      end
    end
    object cxCheckBoxDatevip: TcxCheckBox
      Left = 0
      Top = 9
      Width = 272
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 0
      OnClick = cxCheckBoxDatevipClick
    end
    object cxCheckBoxPrR: TcxCheckBox
      Left = 0
      Top = 147
      Width = 217
      Height = 21
      Properties.DisplayUnchecked = 'False'
      State = cbsChecked
      TabOrder = 5
      OnClick = cxCheckBoxPrRClick
    end
    object cxCheckBoxSumma: TcxCheckBox
      Left = 0
      Top = 108
      Width = 218
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 4
      OnClick = cxCheckBoxSummaClick
    end
    object cxRadioGroupPrR: TRadioGroup
      Left = 2
      Top = 163
      Width = 311
      Height = 32
      Columns = 3
      Ctl3D = True
      Items.Strings = (
        #1055#1088#1080#1093#1086#1076'\'#1088#1072#1089#1093#1086#1076'       '
        #1055#1088#1080#1093#1086#1076
        #1056#1072#1089#1093#1086#1076)
      ParentCtl3D = False
      TabOrder = 6
    end
    object ButtonFind: TButton
      Left = 149
      Top = 456
      Width = 75
      Height = 25
      Caption = #1055#1086#1080#1089#1082
      Default = True
      TabOrder = 14
      OnClick = ButtonFindClick
    end
    object cxMaskEditNumberDoc: TcxMaskEdit
      Left = 115
      Top = 87
      Width = 200
      Height = 21
      Enabled = False
      Properties.MaxLength = 20
      Style.Color = 15204351
      TabOrder = 3
    end
    object cxCheckBoxRsNative: TcxCheckBox
      Left = 1
      Top = 200
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 7
      OnClick = cxCheckBoxRsNativeClick
    end
    object RadioGroupCustomer: TRadioGroup
      Left = 2
      Top = 256
      Width = 121
      Height = 52
      Ctl3D = True
      Enabled = False
      Items.Strings = (
        #1048#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        #1055#1086' '#1074#1082#1083#1102#1095#1077#1085#1080#1102)
      ParentCtl3D = False
      TabOrder = 9
      OnClick = RadioGroupCustomerClick
    end
    object cxCheckBoxRsCustom: TcxCheckBox
      Left = 0
      Top = 309
      Width = 161
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 11
      OnClick = cxCheckBoxRsCustomClick
    end
    object cxCheckBoxnote: TcxCheckBox
      Left = 0
      Top = 349
      Width = 209
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 12
      OnClick = cxCheckBoxnoteClick
    end
    object cxCheckBoxDate: TcxCheckBox
      Left = 0
      Top = 43
      Width = 240
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 1
      OnClick = cxCheckBoxDateClick
    end
    object cxCheckBoxDelete: TcxCheckBox
      Left = 0
      Top = 440
      Width = 137
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080' '#1074#1080#1076#1072#1083#1077#1085#1110
      TabOrder = 13
    end
    object ButtonClose: TButton
      Left = 237
      Top = 456
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      Default = True
      TabOrder = 15
      OnClick = ButtonCloseClick
    end
  end
  object cxButtonEditRsCustom: TcxButtonEdit
    Left = 3
    Top = 327
    Width = 311
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEditRsCustomPropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 14
  end
  object cxButtonEditRsNative: TcxButtonEdit
    Left = 3
    Top = 218
    Width = 311
    Height = 21
    Enabled = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEditRsNativePropertiesButtonClick
    Style.Color = 15204351
    TabOrder = 13
  end
  object cxCheckBoxDatevipBegin: TcxCheckBox
    Left = 0
    Top = 26
    Width = 169
    Height = 21
    Enabled = False
    Properties.DisplayUnchecked = 'False'
    TabOrder = 2
    OnClick = cxCheckBoxDatevipBeginClick
  end
  object cxDateEditBeginVip: TcxDateEdit
    Left = 39
    Top = 26
    Width = 120
    Height = 21
    Enabled = False
    Style.BorderColor = clWindowFrame
    Style.Color = 15204351
    Style.Shadow = False
    Style.ButtonStyle = btsDefault
    Style.PopupBorderStyle = epbsDefault
    TabOrder = 3
  end
  object cxCheckBoxDatevipEnd: TcxCheckBox
    Left = 158
    Top = 25
    Width = 151
    Height = 21
    Enabled = False
    Properties.DisplayUnchecked = 'False'
    TabOrder = 1
    OnClick = cxCheckBoxDatevipEndClick
  end
  object cxDateEditEndVip: TcxDateEdit
    Left = 195
    Top = 26
    Width = 120
    Height = 21
    Enabled = False
    Style.Color = 15204351
    TabOrder = 4
  end
  object cxCheckBoxDateBegin: TcxCheckBox
    Left = 0
    Top = 63
    Width = 121
    Height = 21
    Enabled = False
    Properties.DisplayUnchecked = 'False'
    TabOrder = 7
    OnClick = cxCheckBoxDateBeginClick
  end
  object cxCheckBoxDateEnd: TcxCheckBox
    Left = 159
    Top = 63
    Width = 128
    Height = 21
    Enabled = False
    Properties.DisplayUnchecked = 'False'
    TabOrder = 8
    OnClick = cxCheckBoxDateEndClick
  end
  object cxDateEditBegin: TcxDateEdit
    Left = 39
    Top = 62
    Width = 120
    Height = 21
    Enabled = False
    Style.Color = 15204351
    TabOrder = 5
  end
  object cxDateEditEnd: TcxDateEdit
    Left = 195
    Top = 62
    Width = 120
    Height = 21
    Enabled = False
    Style.Color = 15204351
    TabOrder = 6
  end
  object cxCheckBoxSummaBegin: TcxCheckBox
    Left = 0
    Top = 127
    Width = 167
    Height = 21
    Enabled = False
    Properties.DisplayUnchecked = 'False'
    TabOrder = 9
    OnClick = cxCheckBoxSummaBeginClick
  end
  object cxCheckBoxSummaEnd: TcxCheckBox
    Left = 159
    Top = 127
    Width = 148
    Height = 21
    Enabled = False
    Properties.DisplayUnchecked = 'False'
    TabOrder = 10
    OnClick = cxCheckBoxSummaEndClick
  end
  object cxCalcEditSummaBegin: TcxCalcEdit
    Left = 39
    Top = 128
    Width = 121
    Height = 21
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.Precision = 15
    Style.Color = 15204351
    TabOrder = 11
    OnKeyPress = cxCalcEditSummaEndKeyPress
  end
  object cxCalcEditSummaEnd: TcxCalcEdit
    Left = 195
    Top = 128
    Width = 121
    Height = 21
    EditValue = 0.000000000000000000
    Enabled = False
    Properties.Precision = 15
    Style.Color = 15204351
    TabOrder = 12
    OnKeyPress = cxCalcEditSummaEndKeyPress
  end
  object cxCheckBoxWork: TcxCheckBox
    Left = 0
    Top = 387
    Width = 217
    Height = 21
    Properties.DisplayUnchecked = 'False'
    TabOrder = 16
    OnClick = cxCheckBoxWorkClick
  end
  object RadioGroupWork: TRadioGroup
    Left = 2
    Top = 403
    Width = 311
    Height = 32
    Columns = 3
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 17
  end
  object cxTextEditNote: TcxTextEdit
    Left = 3
    Top = 368
    Width = 311
    Height = 21
    Enabled = False
    Properties.MaxLength = 100
    Style.Color = 15204351
    TabOrder = 15
  end
  object pFIBDataSet_post: TpFIBDataSet
    Database = frmMainFormView.Database
    Transaction = frmMainFormView.Transaction
    SelectSQL.Strings = (
      'select *'
      'from pub_sp_customer'
      'where pub_sp_customer.id_customer=:param_cust')
    Left = 488
    Top = 175
    poSQLINT64ToBCD = True
  end
end
