object frmFilterEx: TfrmFilterEx
  Left = 710
  Top = 263
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'frmFilterEx'
  ClientHeight = 340
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TcxButton
    Left = 125
    Top = 307
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 217
    Top = 307
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object GroupBox: TcxGroupBox
    Left = 6
    Top = 0
    Width = 297
    Height = 145
    Alignment = alTopLeft
    TabOrder = 2
    object TIN_Radio: TcxRadioButton
      Left = 8
      Top = 16
      Width = 281
      Height = 17
      Caption = 'TIN_Radio'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = TIN_RadioClick
    end
    object Payer_Radio: TcxRadioButton
      Left = 8
      Top = 35
      Width = 281
      Height = 17
      Caption = 'Payer_Radio'
      TabOrder = 1
      OnClick = Payer_RadioClick
    end
    object Edit: TcxTextEdit
      Left = 8
      Top = 112
      Width = 282
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 30
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = EditKeyPress
    end
    object TypePayer_GroupBox: TcxGroupBox
      Left = 3
      Top = 51
      Width = 291
      Height = 57
      Alignment = alTopLeft
      TabOrder = 3
      Visible = False
      object Label_yur: TLabel
        Left = 80
        Top = 32
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Label_yur'
      end
      object FizLizo_RadioButton: TcxRadioButton
        Left = 5
        Top = 8
        Width = 113
        Height = 17
        Caption = 'FizLizo_RadioButton'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = FizLizo_RadioButtonClick
      end
      object YurLizo_RadioButton: TcxRadioButton
        Left = 151
        Top = 8
        Width = 130
        Height = 17
        Caption = 'YurLizo_RadioButton'
        TabOrder = 1
        OnClick = YurLizo_RadioButtonClick
      end
      object Schet_Edit: TcxButtonEdit
        Left = 136
        Top = 29
        Width = 145
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = Schet_EditPropertiesButtonClick
        TabOrder = 2
        Text = 'Schet_Edit'
      end
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 6
    Top = 144
    Width = 297
    Height = 153
    Alignment = alTopLeft
    TabOrder = 3
    object Params_Button: TcxButton
      Left = 41
      Top = 20
      Width = 220
      Height = 21
      Caption = 'Params_Button'
      TabOrder = 0
      OnClick = Params_ButtonClick
    end
    object Date_beg_z: TcxDateEdit
      Left = 40
      Top = 67
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 1
      EditValue = 2d
    end
    object Date_End_Po: TcxDateEdit
      Left = 184
      Top = 120
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 4
      EditValue = 420031d
    end
    object Date_Beg_po: TcxDateEdit
      Left = 184
      Top = 67
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 2
      EditValue = 420031d
    end
    object Date_End_Z: TcxDateEdit
      Left = 40
      Top = 120
      Width = 97
      Height = 21
      Enabled = False
      Style.Color = clInfoBk
      TabOrder = 3
      EditValue = 2d
    end
    object Z_beg: TcxLabel
      Left = 24
      Top = 68
      Width = 0
      Height = 4
      TabOrder = 5
      Caption = ''
    end
    object Po_beg: TcxLabel
      Left = 160
      Top = 70
      Width = 0
      Height = 4
      TabOrder = 6
      Caption = ''
    end
    object Z_end: TcxLabel
      Left = 24
      Top = 121
      Width = 0
      Height = 4
      TabOrder = 7
      Caption = ''
    end
    object Po_End: TcxLabel
      Left = 160
      Top = 124
      Width = 0
      Height = 4
      TabOrder = 8
      Caption = ''
    end
    object Date_Beg_Check: TcxCheckBox
      Left = 24
      Top = 47
      Width = 121
      Height = 21
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = Date_Beg_CheckPropertiesChange
      TabOrder = 9
    end
    object Date_End_Check: TcxCheckBox
      Left = 24
      Top = 96
      Width = 121
      Height = 21
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = Date_End_CheckPropertiesChange
      TabOrder = 10
    end
    object filterParams_check: TcxCheckBox
      Left = 16
      Top = 20
      Width = 25
      Height = 21
      AutoSize = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = filterParams_checkPropertiesChange
      Properties.Caption = ''
      TabOrder = 11
    end
  end
end
