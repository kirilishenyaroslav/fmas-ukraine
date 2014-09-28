object TaxInvoicesAddReestrForm: TTaxInvoicesAddReestrForm
  Left = 448
  Top = 315
  BorderStyle = bsDialog
  Caption = 'TaxInvoicesAddReestrForm'
  ClientHeight = 378
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DataReestrGroupBox: TcxGroupBox
    Left = 8
    Top = 48
    Width = 401
    Height = 121
    Alignment = alTopLeft
    Caption = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DateBegEdit: TcxDateEdit
      Left = 112
      Top = 56
      Width = 153
      Height = 24
      Properties.ShowTime = False
      TabOrder = 0
      OnKeyPress = DateBegEditKeyPress
    end
    object DateEndEdit: TcxDateEdit
      Left = 112
      Top = 88
      Width = 153
      Height = 24
      Properties.ShowTime = False
      TabOrder = 1
      OnKeyPress = DateEndEditKeyPress
    end
    object PeriodLabel: TcxLabel
      Left = 24
      Top = 24
      Width = 58
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1087#1077#1088#1110#1086#1076
    end
    object DataBegLabel: TcxLabel
      Left = 24
      Top = 56
      Width = 89
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = #1088#1086#1079#1087#1086#1095#1072#1090#1086
    end
    object DataEndLabel: TcxLabel
      Left = 24
      Top = 88
      Width = 84
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
      Caption = #1079#1072#1082#1110#1085#1095#1077#1085#1086
    end
    object MonthList: TComboBox
      Left = 112
      Top = 24
      Width = 153
      Height = 24
      ItemHeight = 16
      TabOrder = 5
      Text = 'MonthList'
      OnChange = MonthListChange
      OnKeyPress = MonthListKeyPress
    end
    object YearSpinEdit: TSpinEdit
      Left = 264
      Top = 24
      Width = 97
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 6
      Value = 0
      OnChange = YearSpinEditChange
    end
  end
  object TipReestrGroupBox: TcxGroupBox
    Left = 8
    Top = 168
    Width = 401
    Height = 65
    Alignment = alTopLeft
    Caption = #1058#1080#1087' '#1088#1077#1108#1089#1090#1088#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object TypeReestrButtonEdit: TcxButtonEdit
      Left = 40
      Top = 24
      Width = 321
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = TipReestrButtonEditPropertiesButtonClick
      TabOrder = 0
      Text = 'TypeReestrButtonEdit'
      OnKeyPress = TypeReestrButtonEditKeyPress
    end
  end
  object OtherInfoReestrGroupBox: TcxGroupBox
    Left = 8
    Top = 240
    Width = 401
    Height = 97
    Alignment = alTopLeft
    Caption = #1030#1085#1096#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object SaveTextEdit: TcxTextEdit
      Left = 136
      Top = 24
      Width = 233
      Height = 24
      Style.Color = clWindow
      TabOrder = 0
      Text = 'SaveTextEdit'
      OnKeyPress = SaveTextEditKeyPress
    end
    object SpecModeTextEdit: TcxTextEdit
      Left = 136
      Top = 56
      Width = 233
      Height = 24
      TabOrder = 1
      Text = 'SpecModeTextEdit'
      OnKeyPress = SpecModeTextEditKeyPress
    end
    object SaveLabel: TcxLabel
      Left = 40
      Top = 24
      Width = 78
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
      Caption = #1079#1073#1077#1088#1077#1075#1090#1080
    end
    object SpecModeLabel: TcxLabel
      Left = 40
      Top = 56
      Width = 95
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
      Caption = #1089#1087#1077#1094'.'#1088#1077#1078#1080#1084
    end
  end
  object YesButton: TcxButton
    Left = 240
    Top = 344
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 3
    OnClick = YesButtonClick
  end
  object CancelButton: TcxButton
    Left = 320
    Top = 344
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 0
    Width = 401
    Height = 49
    Alignment = alTopLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object NumReestrLabel: TcxLabel
      Left = 24
      Top = 16
      Width = 89
      Height = 20
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      Caption = #8470' '#1088#1077#1108#1089#1090#1088#1091
    end
    object NumReestrTextEdit: TcxTextEdit
      Left = 120
      Top = 16
      Width = 241
      Height = 24
      TabOrder = 1
      Text = 'NumReestrTextEdit'
      OnKeyPress = NumReestrTextEditKeyPress
    end
  end
end
