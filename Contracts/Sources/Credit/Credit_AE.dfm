object frmCredit_AE: TfrmCredit_AE
  Left = 463
  Top = 155
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCredit_AE'
  ClientHeight = 382
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 326
    Height = 329
    Align = alTop
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Date_Create_Label: TLabel
      Left = 210
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Date_Create'
    end
    object Num_Doc_Label: TLabel
      Left = 8
      Top = 8
      Width = 87
      Height = 13
      Caption = 'Num_Credit_Label'
    end
    object DateStartCalc_Label: TLabel
      Left = 8
      Top = 56
      Width = 98
      Height = 13
      Caption = 'DateStartCalc_Label'
    end
    object Date_Credit_Label: TLabel
      Left = 118
      Top = 54
      Width = 88
      Height = 13
      Caption = 'Date_Credit_Label'
    end
    object lblNote_Label: TLabel
      Left = 8
      Top = 96
      Width = 65
      Height = 13
      Caption = 'lblNote_Label'
    end
    object SummaLabel: TLabel
      Left = 233
      Top = 54
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = #1057#1091#1084#1084#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Customer_Label: TLabel
      Left = 8
      Top = 136
      Width = 76
      Height = 13
      Caption = 'Customer_Label'
    end
    object lblLimitSum: TLabel
      Left = 9
      Top = 177
      Width = 52
      Height = 13
      Caption = 'lblLimitSum'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblLimitDog: TLabel
      Left = 166
      Top = 177
      Width = 51
      Height = 13
      Caption = 'lblLimitDog'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object ord_ae_Comments_Label: TLabel
      Left = 10
      Top = 283
      Width = 52
      Height = 13
      Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1110
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lblStatus: TLabel
      Left = 10
      Top = 243
      Width = 34
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Num_Credit_Edit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 177
      Height = 21
      Properties.MaxLength = 40
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Num_Credit_EditKeyPress
    end
    object Date_Create_Edit: TcxDateEdit
      Left = 207
      Top = 24
      Width = 106
      Height = 21
      Properties.ReadOnly = True
      Style.Color = 16311512
      TabOrder = 1
      OnKeyPress = Date_Create_EditKeyPress
    end
    object DateStartCalc_Edit: TcxDateEdit
      Left = 8
      Top = 70
      Width = 105
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = DateStartCalc_EditKeyPress
    end
    object Date_Credit_Edit: TcxDateEdit
      Left = 117
      Top = 70
      Width = 105
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 3
      OnKeyPress = Date_Credit_EditKeyPress
    end
    object Note_Edit: TcxTextEdit
      Left = 8
      Top = 112
      Width = 305
      Height = 21
      Properties.MaxLength = 0
      Style.Color = clInfoBk
      TabOrder = 5
      OnKeyPress = Note_EditKeyPress
    end
    object SummaEdit: TcxCurrencyEdit
      Left = 232
      Top = 70
      Width = 81
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.Color = 16311512
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clDefault
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
      OnKeyPress = SummaEditKeyPress
    end
    object Customer_Edit: TcxTextEdit
      Left = 8
      Top = 152
      Width = 305
      Height = 21
      Properties.MaxLength = 0
      Style.Color = clInfoBk
      TabOrder = 6
      OnKeyPress = Customer_EditKeyPress
    end
    object LimitSum_Edit: TcxCurrencyEdit
      Left = 11
      Top = 193
      Width = 94
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0.00;'
      Properties.ReadOnly = False
      Properties.UseThousandSeparator = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clDefault
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
      OnKeyPress = LimitSum_EditKeyPress
    end
    object LimitDog_Edit: TcxCurrencyEdit
      Left = 167
      Top = 193
      Width = 70
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clDefault
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 8
      OnKeyPress = LimitDog_EditKeyPress
    end
    object ckbxImagePriority: TcxCheckBox
      Left = 11
      Top = 220
      Width = 173
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 9
      OnKeyPress = ckbxImagePriorityKeyPress
    end
    object ord_ae_Comments: TcxTextEdit
      Left = 11
      Top = 297
      Width = 302
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 255
      Style.Color = clInfoBk
      TabOrder = 10
      Text = '...'
      OnKeyPress = ord_ae_CommentsKeyPress
    end
    object StatusEdit: TcxButtonEdit
      Left = 11
      Top = 258
      Width = 299
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = TypeLg_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsDefault
      Style.ButtonTransparency = ebtInactive
      TabOrder = 11
      OnKeyPress = StatusEditKeyPress
    end
  end
  object OKButton: TcxButton
    Left = 135
    Top = 345
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 231
    Top = 345
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
