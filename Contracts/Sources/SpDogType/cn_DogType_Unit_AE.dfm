object frmAE: TfrmAE
  Left = 416
  Top = 364
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmAE'
  ClientHeight = 209
  ClientWidth = 467
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
    Left = 286
    Top = 177
    Width = 87
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TcxButton
    Left = 379
    Top = 177
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
    Width = 465
    Height = 169
    Alignment = alTopLeft
    TabOrder = 2
    TabStop = False
    object NameLabel: TLabel
      Left = 8
      Top = 48
      Width = 54
      Height = 13
      Caption = 'NameLabel'
      Transparent = True
    end
    object CodeLabel: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'CodeLabel'
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 8
      Top = 112
      Width = 449
      Height = 8
      Shape = bsBottomLine
    end
    object Label1: TLabel
      Left = 305
      Top = 124
      Width = 36
      Height = 13
      Caption = '*Report'
      Visible = False
    end
    object CopyPrintCount_Label: TLabel
      Left = 12
      Top = 125
      Width = 105
      Height = 13
      Caption = 'CopyPrintCount_Label'
      Transparent = True
    end
    object Name_Edit: TcxTextEdit
      Left = 8
      Top = 62
      Width = 449
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Name_EditKeyPress
    end
    object ISMAINDOG_checkbox: TcxCheckBox
      Left = 4
      Top = 88
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      TabOrder = 1
      OnKeyPress = ISMAINDOG_checkboxKeyPress
    end
    object CodeEdit: TcxTextEdit
      Left = 8
      Top = 23
      Width = 129
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 50
      Style.Color = clInfoBk
      TabOrder = 2
      OnKeyPress = CodeEditKeyPress
    end
    object ReportEdit: TcxTextEdit
      Left = 304
      Top = 138
      Width = 153
      Height = 21
      BeepOnEnter = False
      ParentFont = False
      Properties.MaxLength = 255
      Style.Color = clInfoBk
      TabOrder = 3
      Visible = False
      OnKeyPress = ReportEditKeyPress
    end
    object CopyPrintCount_Edit: TcxCurrencyEdit
      Left = 11
      Top = 139
      Width = 69
      Height = 21
      BeepOnEnter = False
      EditValue = 0c
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0;'
      Style.Color = clInfoBk
      TabOrder = 4
      OnKeyPress = CopyPrintCount_EditKeyPress
    end
  end
end
