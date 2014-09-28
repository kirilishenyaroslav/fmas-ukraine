object FormTemplet_Edit: TFormTemplet_Edit
  Left = 123
  Top = 85
  BorderStyle = bsDialog
  Caption = 'FormTemplet_Edit'
  ClientHeight = 183
  ClientWidth = 774
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
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 34
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 440
    Top = 11
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 440
    Top = 34
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Panel1: TPanel
    Left = 0
    Top = 152
    Width = 774
    Height = 31
    Align = alBottom
    TabOrder = 0
    object ButtonYes: TcxButton
      Left = 605
      Top = 5
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 687
      Top = 5
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
    end
  end
  object EditName: TcxTextEdit
    Left = 160
    Top = 8
    Width = 274
    Height = 21
    TabOrder = 1
  end
  object EditCommentar: TcxTextEdit
    Left = 160
    Top = 30
    Width = 274
    Height = 21
    TabOrder = 2
  end
  object EditMonthBeg: TcxComboBox
    Left = 512
    Top = 8
    Width = 145
    Height = 21
    Properties.Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
    TabOrder = 3
  end
  object EditYearBeg: TcxSpinEdit
    Left = 664
    Top = 8
    Width = 105
    Height = 21
    Properties.MaxValue = 2100.000000000000000000
    Properties.MinValue = 2000.000000000000000000
    TabOrder = 4
    Value = 2000
  end
  object EditMonthEnd: TcxComboBox
    Left = 512
    Top = 32
    Width = 145
    Height = 21
    Properties.Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
    TabOrder = 5
  end
  object EditYearEnd: TcxSpinEdit
    Left = 664
    Top = 32
    Width = 105
    Height = 21
    Properties.MaxValue = 3333.000000000000000000
    Properties.MinValue = 2000.000000000000000000
    TabOrder = 6
    Value = 2000
  end
  object cxLabel2: TcxLabel
    Left = 4
    Top = 53
    Width = 115
    Height = 17
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    TabOrder = 7
    Caption = #1042#1110#1076#1087#1086#1074#1110#1076#1072#1083#1100#1085#1072' '#1086#1089#1086#1073#1072':'
  end
  object EditResponsible: TcxButtonEdit
    Left = 160
    Top = 52
    Width = 274
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditResponsiblePropertiesButtonClick
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
  end
  object EditResponsiblePost: TcxTextEdit
    Left = 512
    Top = 54
    Width = 257
    Height = 21
    TabOrder = 9
  end
  object cxLabel1: TcxLabel
    Left = 4
    Top = 76
    Width = 110
    Height = 17
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    TabOrder = 10
    Caption = #1050#1077#1088#1110#1074#1085#1080#1082' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1091':'
  end
  object EditHead: TcxButtonEdit
    Left = 160
    Top = 74
    Width = 274
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditHeadPropertiesButtonClick
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 11
  end
  object EditHeadPost: TcxTextEdit
    Left = 512
    Top = 76
    Width = 257
    Height = 21
    TabOrder = 12
  end
  object cxLabel3: TcxLabel
    Left = 4
    Top = 98
    Width = 151
    Height = 17
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    TabOrder = 13
    Caption = #1055#1088#1072#1094#1110#1074#1085#1080#1082' '#1082#1072#1076#1088#1086#1074#1086#1111' '#1089#1083#1091#1078#1073#1080':'
  end
  object EditPersonnel: TcxButtonEdit
    Left = 160
    Top = 96
    Width = 274
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditPersonnelPropertiesButtonClick
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 14
  end
  object EditPersonnelPost: TcxTextEdit
    Left = 512
    Top = 98
    Width = 257
    Height = 21
    TabOrder = 15
  end
  object cxLabel4: TcxLabel
    Left = 437
    Top = 55
    Width = 49
    Height = 17
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    TabOrder = 16
    Caption = #1055#1086#1089#1072#1076#1072':'
  end
  object cxLabel5: TcxLabel
    Left = 437
    Top = 76
    Width = 49
    Height = 17
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    TabOrder = 17
    Caption = #1055#1086#1089#1072#1076#1072':'
  end
  object cxLabel6: TcxLabel
    Left = 437
    Top = 98
    Width = 49
    Height = 17
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    TabOrder = 18
    Caption = #1055#1086#1089#1072#1076#1072':'
  end
  object EditParent: TcxButtonEdit
    Left = 336
    Top = 121
    Width = 434
    Height = 21
    Enabled = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditParentPropertiesButtonClick
    Style.Color = clWhite
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 19
  end
  object CheckBoxNoTemplate: TcxCheckBox
    Left = 152
    Top = 122
    Width = 81
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.ValueChecked = 0
    Properties.ValueUnchecked = 1
    Properties.Caption = #1053#1077' '#1096#1072#1073#1083#1086#1085
    TabOrder = 20
  end
  object CheckBoxBranch: TcxCheckBox
    Left = 248
    Top = 121
    Width = 73
    Height = 21
    Properties.Alignment = taRightJustify
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = CheckBoxBranchPropertiesChange
    Properties.Caption = #1042' '#1082#1086#1088#1077#1085#1100
    State = cbsChecked
    TabOrder = 21
  end
  object ActionList: TActionList
    Left = 35
    Top = 13
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
