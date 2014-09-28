object FTermsSheetPrint: TFTermsSheetPrint
  Left = 302
  Top = 205
  BorderStyle = bsDialog
  Caption = 'FTermsSheetPrint'
  ClientHeight = 198
  ClientWidth = 191
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object YesBtn: TcxButton
    Left = 72
    Top = 173
    Width = 49
    Height = 21
    Action = ActionYes
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
  end
  object CancelBtn: TcxButton
    Left = 128
    Top = 173
    Width = 49
    Height = 21
    Action = ActionCancel
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object cxGroupBox: TcxGroupBox
    Left = 0
    Top = 0
    Width = 193
    Height = 65
    Alignment = alTopLeft
    Caption = 'cxGroupBox'
    TabOrder = 2
    object cxLabelFrom: TcxLabel
      Left = 0
      Top = 18
      Width = 89
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 0
    end
    object DateFrom: TcxDateEdit
      Left = 88
      Top = 16
      Width = 101
      Height = 21
      Properties.DateButtons = [btnToday]
      Properties.MaxDate = 73415.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 1
      EditValue = 36526d
    end
    object DateTo: TcxDateEdit
      Left = 88
      Top = 36
      Width = 101
      Height = 21
      Properties.DateButtons = [btnToday]
      Properties.MaxDate = 73415.000000000000000000
      Properties.MinDate = 36526.000000000000000000
      TabOrder = 2
      EditValue = 36526d
    end
    object cxLabelTo: TcxLabel
      Left = 0
      Top = 38
      Width = 89
      Height = 17
      AutoSize = False
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 3
    end
  end
  object CheckBoxNonTerm: TcxCheckBox
    Left = 0
    Top = 136
    Width = 193
    Height = 21
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    TabOrder = 3
  end
  object CheckBoxPrintDate: TcxCheckBox
    Left = 0
    Top = 152
    Width = 193
    Height = 21
    Properties.DisplayUnchecked = 'False'
    State = cbsChecked
    TabOrder = 4
  end
  object RadioGroupOrder: TcxRadioGroup
    Left = 0
    Top = 64
    Width = 193
    Height = 41
    ItemIndex = 1
    Properties.Columns = 2
    Properties.Items = <
      item
      end
      item
      end>
    TabOrder = 5
  end
  object cxCheckBox1: TcxCheckBox
    Left = 0
    Top = 103
    Width = 193
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBox1PropertiesChange
    Properties.Caption = #1043#1088#1091#1087#1091#1074#1072#1090#1080' '#1079#1072' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1086#1084
    State = cbsChecked
    TabOrder = 6
    Visible = False
  end
  object cxCheckBox2: TcxCheckBox
    Left = 0
    Top = 119
    Width = 185
    Height = 21
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = cxCheckBox2PropertiesChange
    Properties.Caption = #1043#1088#1091#1087#1091#1074#1072#1090#1080' '#1079#1072' '#1092#1072#1082#1091#1083#1100#1090#1077#1090#1086#1084
    TabOrder = 7
    Visible = False
  end
  object ActionList: TActionList
    Left = 16
    Top = 163
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 121
      OnExecute = ActionYesExecute
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
