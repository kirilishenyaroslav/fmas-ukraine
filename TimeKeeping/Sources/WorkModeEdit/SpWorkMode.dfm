object Form1: TForm1
  Left = 488
  Top = 451
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 314
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 277
    Width = 537
    Height = 37
    Align = alBottom
    TabOrder = 1
    object ButtonOK: TcxButton
      Left = 367
      Top = 7
      Width = 75
      Height = 25
      Action = ActionYes
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
    end
    object ButtonCancel: TcxButton
      Left = 444
      Top = 6
      Width = 75
      Height = 25
      Action = ActionCancel
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 277
    Align = alClient
    TabOrder = 0
    object cxGroupBox1: TcxGroupBox
      Left = 4
      Top = 113
      Width = 524
      Height = 107
      Alignment = alTopLeft
      TabOrder = 1
      object CheckBoxZm: TcxCheckBox
        Left = 121
        Top = 37
        Width = 121
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = CheckBoxZmPropertiesChange
        Properties.Caption = #1047#1084#1110#1085#1072
        TabOrder = 4
      end
      object EditFinish: TcxTimeEdit
        Left = 344
        Top = 10
        Width = 69
        Height = 21
        EditValue = 0.25d
        Properties.TimeFormat = tfHourMin
        TabOrder = 3
      end
      object Label5: TcxLabel
        Left = 230
        Top = 12
        Width = 109
        Height = 17
        TabOrder = 0
        Caption = #1050#1110#1085#1077#1094#1100' '#1085#1110#1095#1085#1080#1093' '#1075#1086#1076#1080#1085':'
      end
      object EditStart: TcxTimeEdit
        Left = 124
        Top = 10
        Width = 74
        Height = 21
        EditValue = 0.916666666666667d
        Properties.TimeFormat = tfHourMin
        TabOrder = 2
      end
      object Label4: TcxLabel
        Left = 2
        Top = 11
        Width = 118
        Height = 17
        TabOrder = 1
        Caption = #1055#1086#1095#1072#1090#1086#1082' '#1085#1110#1095#1085#1080#1093' '#1075#1086#1076#1080#1085':'
      end
      object CheckBoxTypeViewYes: TcxRadioButton
        Left = 123
        Top = 64
        Width = 201
        Height = 15
        Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1075#1086#1076#1080#1085#1080' '#1087#1086' '#1079#1084#1110#1085#1072#1084
        TabOrder = 5
      end
      object CheckBoxTypeViewNo: TcxRadioButton
        Left = 123
        Top = 85
        Width = 300
        Height = 15
        Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1075#1086#1076#1080#1085#1080' '#1091' '#1074#1110#1076#1087#1086#1074#1110#1076#1085#1080#1093' '#1082#1072#1083#1077#1085#1076#1072#1088#1085#1080#1093' '#1076#1072#1090#1072#1093
        Checked = True
        TabOrder = 6
        TabStop = True
      end
      object cxLabel4: TcxLabel
        Left = 290
        Top = 39
        Width = 47
        Height = 17
        TabOrder = 7
        Caption = #1057#1090#1072#1074#1082#1072':'
      end
      object EditCOEFFICIENT: TcxCurrencyEdit
        Left = 344
        Top = 39
        Width = 69
        Height = 21
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = ',0.000;-,0.000'
        TabOrder = 8
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 5
      Top = -1
      Width = 523
      Height = 117
      Alignment = alTopLeft
      TabOrder = 0
      object EditDb: TcxDateEdit
        Left = 124
        Top = 54
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object cxLabel1: TcxLabel
        Left = 51
        Top = 56
        Width = 67
        Height = 17
        TabOrder = 5
        Caption = #1055#1086#1095#1072#1090#1086#1082' '#1076#1110#1111':'
      end
      object Label1: TcxLabel
        Left = 75
        Top = 33
        Width = 45
        Height = 17
        TabOrder = 7
        Caption = #1053#1086#1084#1077#1088':'
      end
      object EditNum: TcxMaskEdit
        Left = 125
        Top = 31
        Width = 55
        Height = 21
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '[0-9]+'
        Properties.MaxLength = 0
        TabOrder = 1
      end
      object Label2: TcxLabel
        Left = 37
        Top = 10
        Width = 86
        Height = 17
        TabOrder = 8
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103':'
      end
      object EditName: TcxMaskEdit
        Left = 125
        Top = 8
        Width = 375
        Height = 21
        TabOrder = 0
      end
      object EditShortName: TcxMaskEdit
        Left = 271
        Top = 31
        Width = 229
        Height = 21
        TabOrder = 2
      end
      object Label3: TcxLabel
        Left = 199
        Top = 33
        Width = 71
        Height = 17
        TabOrder = 9
        Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103':'
      end
      object cxLabel2: TcxLabel
        Left = 271
        Top = 56
        Width = 58
        Height = 17
        TabOrder = 10
        Caption = #1050#1110#1085#1077#1094#1100' '#1076#1110#1111':'
      end
      object EditDe: TcxDateEdit
        Left = 336
        Top = 53
        Width = 121
        Height = 21
        TabOrder = 4
        EditValue = 2958465d
      end
      object EditCaption: TcxMemo
        Left = 122
        Top = 78
        Width = 378
        Height = 33
        TabOrder = 6
      end
      object cxLabel3: TcxLabel
        Left = 52
        Top = 81
        Width = 67
        Height = 17
        TabOrder = 11
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072':'
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 5
      Top = 219
      Width = 522
      Height = 51
      Alignment = alTopLeft
      TabOrder = 2
      object CheckBoxNoWM: TcxCheckBox
        Left = 2
        Top = 20
        Width = 81
        Height = 21
        Properties.Alignment = taRightJustify
        Properties.DisplayUnchecked = 'False'
        Properties.ValueChecked = 0
        Properties.ValueUnchecked = 1
        Properties.Caption = #1053#1077' '#1088#1077#1078#1080#1084
        TabOrder = 0
      end
      object CheckBoxBranch: TcxCheckBox
        Left = 96
        Top = 19
        Width = 73
        Height = 21
        Properties.Alignment = taRightJustify
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = CheckBoxBranchPropertiesChange
        Properties.Caption = #1042' '#1082#1086#1088#1110#1085#1100
        State = cbsChecked
        TabOrder = 1
      end
      object EditParent: TcxButtonEdit
        Left = 167
        Top = 19
        Width = 332
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
        TabOrder = 2
      end
    end
  end
  object ActionList: TActionList
    Left = 4
    Top = 7
    object ActionYes: TAction
      Caption = 'ActionYes'
      ShortCut = 13
      OnExecute = ButtonOKClick
    end
    object ActionCancel: TAction
      Caption = 'ActionCancel'
      ShortCut = 27
      OnExecute = ButtonCancelClick
    end
  end
end
