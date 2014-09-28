object MassiveAddForm: TMassiveAddForm
  Left = 251
  Top = 268
  BorderStyle = bsDialog
  Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1089#1087#1080#1089#1086#1082' '#1085#1072' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1086#1082
  ClientHeight = 127
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 6
    Width = 385
    Height = 75
    Caption = #1054#1073#1077#1088#1110#1090#1100' '#1087#1077#1088#1110#1086#1076
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object PeriodBegLabel: TLabel
      Left = 8
      Top = 36
      Width = 90
      Height = 13
      Caption = 'PeriodBegLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MonthBegCombo: TcxComboBox
      Left = 104
      Top = 32
      Width = 49
      Height = 21
      Properties.Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12')
      Properties.EditMask = '!99'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      TabOrder = 0
      Text = '  '
    end
    object YearBegCombo: TcxSpinEdit
      Left = 168
      Top = 32
      Width = 57
      Height = 21
      Properties.MaxValue = 3000.000000000000000000
      Properties.MinValue = 2004.000000000000000000
      TabOrder = 1
      Value = 2005
    end
  end
  object OkBtn: TcxButton
    Left = 224
    Top = 90
    Width = 75
    Height = 25
    Caption = 'OkBtn'
    ModalResult = 1
    TabOrder = 1
    OnClick = OkBtnClick
  end
  object CancelBtn: TcxButton
    Left = 320
    Top = 90
    Width = 75
    Height = 25
    Caption = 'CancelBtn'
    ModalResult = 2
    TabOrder = 2
  end
end
