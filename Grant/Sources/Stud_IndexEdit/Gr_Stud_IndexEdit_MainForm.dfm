object FormStudIndex_Edit: TFormStudIndex_Edit
  Left = 401
  Top = 361
  BorderStyle = bsSingle
  Caption = 'FormStudIndex_Edit'
  ClientHeight = 164
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 128
    Width = 481
    Height = 36
    Align = alBottom
    TabOrder = 9
    object ButtonYes: TcxButton
      Left = 300
      Top = 5
      Width = 81
      Height = 25
      Caption = 'ActionYes'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButtonYesClick
      LookAndFeel.Kind = lfFlat
    end
    object ButtonCancel: TcxButton
      Left = 388
      Top = 5
      Width = 81
      Height = 25
      Action = ActionCancel
      Cancel = True
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
    end
  end
  object LabelDate: TcxLabel
    Left = 8
    Top = 8
    Width = 113
    Height = 17
    AutoSize = False
    TabOrder = 10
  end
  object EditMonth: TcxComboBox
    Left = 256
    Top = 5
    Width = 145
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'January'
      'February')
    TabOrder = 0
  end
  object EditYear: TcxSpinEdit
    Left = 416
    Top = 5
    Width = 57
    Height = 21
    Properties.MaxValue = 2100.000000000000000000
    Properties.MinValue = 2000.000000000000000000
    TabOrder = 1
    Value = 2000
  end
  object EditMonthBase: TcxComboBox
    Left = 256
    Top = 37
    Width = 145
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'January'
      'February')
    TabOrder = 3
  end
  object EditYearBase: TcxSpinEdit
    Left = 416
    Top = 37
    Width = 57
    Height = 21
    Properties.MaxValue = 2100.000000000000000000
    Properties.MinValue = 200.000000000000000000
    TabOrder = 4
    Value = 200
  end
  object LabelBaseDate: TcxCheckBox
    Left = 9
    Top = 35
    Width = 234
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 'F'
    Properties.ValueUnchecked = 'T'
    Properties.OnChange = LabelBaseDatePropertiesChange
    Properties.Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1073#1072#1079#1086#1074#1080#1081' '#1087#1077#1088#1110#1086#1076':'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object cxCheckBox2: TcxCheckBox
    Left = 9
    Top = 64
    Width = 153
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 'F'
    Properties.ValueUnchecked = 'T'
    Properties.OnChange = cxCheckBox2PropertiesChange
    Properties.Caption = #1057#1091#1084#1072' '#1092#1110#1082#1089#1086#1074#1072#1085#1072':'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 5
  end
  object cxMaskEdit1: TcxMaskEdit
    Left = 256
    Top = 68
    Width = 217
    Height = 21
    Enabled = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
    Properties.MaxLength = 0
    TabOrder = 6
  end
  object cxCheckBox1: TcxCheckBox
    Left = 9
    Top = 92
    Width = 144
    Height = 24
    ParentFont = False
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 'F'
    Properties.ValueUnchecked = 'T'
    Properties.OnChange = cxCheckBox1PropertiesChange
    Properties.Caption = #1057#1091#1084#1072' '#1092#1072#1082#1090#1080#1095#1085#1072':'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
  end
  object EditSumma: TcxMaskEdit
    Left = 256
    Top = 95
    Width = 217
    Height = 21
    Enabled = False
    Properties.Alignment.Horz = taRightJustify
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? ([,]\d\d?)?'
    Properties.MaxLength = 0
    TabOrder = 8
  end
  object Actions: TActionList
    Left = 24
    Top = 125
    object Action1: TAction
      Caption = 'Action1'
      GroupIndex = 1
      ImageIndex = 1
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      GroupIndex = 3
      ImageIndex = 3
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
