object frmLgots_AddEdit: TfrmLgots_AddEdit
  Left = 480
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmLgots_AddEdit'
  ClientHeight = 263
  ClientWidth = 284
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
    Left = 102
    Top = 231
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 195
    Top = 231
    Width = 85
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 281
    Height = 225
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object OsnovanieLabel: TLabel
      Left = 6
      Top = 180
      Width = 77
      Height = 13
      Caption = 'OsnovanieLabel'
      Transparent = True
    end
    object Date_Beg_Label: TLabel
      Left = 5
      Top = 138
      Width = 80
      Height = 13
      Caption = 'Date_Beg_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Date_End_Label: TLabel
      Left = 117
      Top = 138
      Width = 80
      Height = 13
      Caption = 'Date_End_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DatePrikaz_Label: TLabel
      Left = 5
      Top = 10
      Width = 80
      Height = 13
      Caption = 'Date_Beg_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NomPrikaz_Label: TLabel
      Left = 117
      Top = 10
      Width = 80
      Height = 13
      Caption = 'Date_Beg_Label'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TypeLg_Label: TLabel
      Left = 7
      Top = 49
      Width = 81
      Height = 13
      Caption = 'Comments_Label'
    end
    object Osnovanie_Edit: TcxTextEdit
      Left = 5
      Top = 194
      Width = 268
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 150
      Style.Color = clInfoBk
      TabOrder = 7
      OnKeyPress = Osnovanie_EditKeyPress
    end
    object Percent_RadioButton: TcxRadioButton
      Left = 5
      Top = 96
      Width = 84
      Height = 17
      Caption = 'Percent_RadioButton'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = Percent_RadioButtonClick
      OnKeyPress = Percent_RadioButtonKeyPress
    end
    object Summa_RadioButton: TcxRadioButton
      Left = 5
      Top = 114
      Width = 84
      Height = 17
      Caption = 'Summa_RadioButton'
      TabOrder = 3
      OnClick = Summa_RadioButtonClick
      OnKeyPress = Summa_RadioButtonKeyPress
    end
    object PercentEdit: TcxCurrencyEdit
      Left = 96
      Top = 102
      Width = 53
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 4
      Properties.DisplayFormat = '0.0000;'
      Style.Color = clInfoBk
      TabOrder = 4
      OnKeyPress = PercentEditKeyPress
    end
    object pLabel: TcxLabel
      Left = 148
      Top = 104
      Width = 29
      Height = 17
      TabStop = False
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
      Caption = '%'
    end
    object Date_Beg: TcxDateEdit
      Left = 5
      Top = 152
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 5
      OnKeyPress = Date_BegKeyPress
    end
    object Date_End: TcxDateEdit
      Left = 116
      Top = 152
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 6
      OnKeyPress = Date_EndKeyPress
    end
    object DatePrikaz: TcxDateEdit
      Left = 5
      Top = 24
      Width = 97
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = DatePrikazKeyPress
    end
    object NomPrikaz: TcxTextEdit
      Left = 116
      Top = 24
      Width = 132
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = NomPrikazKeyPress
    end
    object TypeLg_Edit: TcxButtonEdit
      Left = 6
      Top = 66
      Width = 267
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
      Properties.OnButtonClick = TypeDiss_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsDefault
      Style.ButtonTransparency = ebtInactive
      TabOrder = 9
      OnKeyPress = TypeLg_EditKeyPress
    end
  end
end
