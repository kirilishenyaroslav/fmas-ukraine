object FormSpOfficialNoteEdit: TFormSpOfficialNoteEdit
  Left = 470
  Top = 119
  BorderStyle = bsDialog
  Caption = #1057#1083#1091#1078#1073#1086#1074#1110' '#1079#1072#1087#1080#1089#1080' ['#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103']'
  ClientHeight = 600
  ClientWidth = 478
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
    Top = 0
    Width = 478
    Height = 568
    Align = alClient
    TabOrder = 0
    object cxGroupBox1: TcxGroupBox
      Left = 11
      Top = 24
      Width = 462
      Height = 65
      Alignment = alTopLeft
      Caption = #1055#1088#1080#1084#1110#1090#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object EditNote: TcxMemo
        Left = 8
        Top = 14
        Width = 442
        Height = 45
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
    object cxGroupBox4: TcxGroupBox
      Left = 10
      Top = 88
      Width = 463
      Height = 171
      Alignment = alTopLeft
      Caption = #1047#1072#1087#1080#1089' '#1076#1086' '#1089#1083#1091#1078#1077#1073#1082#1110
      TabOrder = 3
      object cxGroupBox2: TcxGroupBox
        Left = 9
        Top = 12
        Width = 444
        Height = 55
        Alignment = alTopLeft
        TabOrder = 0
        object EditMan: TcxButtonEdit
          Left = 10
          Top = 25
          Width = 421
          Height = 21
          Enabled = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = EditManPropertiesButtonClick
          TabOrder = 1
        end
        object CheckBoxMan: TcxCheckBox
          Left = 23
          Top = 6
          Width = 121
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckBoxDogPropertiesChange
          Properties.Caption = #1060#1110#1079#1080#1095#1085#1072' '#1086#1089#1086#1073#1072
          TabOrder = 0
          OnClick = CheckBoxManClick
        end
      end
      object cxGroupBox3: TcxGroupBox
        Left = 9
        Top = 66
        Width = 444
        Height = 57
        Alignment = alTopLeft
        TabOrder = 1
        object EditDog: TcxButtonEdit
          Left = 8
          Top = 26
          Width = 425
          Height = 21
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = EditDogPropertiesButtonClick
          TabOrder = 1
        end
        object CheckBoxDog: TcxCheckBox
          Left = 23
          Top = 7
          Width = 121
          Height = 21
          Properties.DisplayUnchecked = 'False'
          Properties.OnChange = CheckBoxDogPropertiesChange
          Properties.Caption = #1058#1088#1091#1076#1086#1074#1080#1081' '#1076#1086#1075#1086#1074#1110#1088
          State = cbsChecked
          TabOrder = 0
          OnClick = CheckBoxDogClick
        end
      end
      object EditManOrDogInfo: TcxMemo
        Left = 9
        Top = 127
        Width = 445
        Height = 39
        Enabled = False
        TabOrder = 2
      end
    end
    object cxGroupBox8: TcxGroupBox
      Left = 9
      Top = 258
      Width = 464
      Height = 303
      Alignment = alTopLeft
      TabOrder = 4
      object EditDataBeg: TcxDateEdit
        Left = 72
        Top = 12
        Width = 121
        Height = 21
        Properties.OnChange = EditDataBegPropertiesChange
        TabOrder = 0
      end
      object cxLabel1: TcxLabel
        Left = 8
        Top = 16
        Width = 67
        Height = 17
        TabOrder = 4
        Caption = #1055#1086#1095#1072#1090#1086#1082' '#1076#1110#1111':'
      end
      object cxLabel2: TcxLabel
        Left = 215
        Top = 16
        Width = 58
        Height = 17
        TabOrder = 5
        Caption = #1050#1110#1085#1077#1094#1100' '#1076#1110#1111':'
      end
      object EditDataEnd: TcxDateEdit
        Left = 272
        Top = 12
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object cxLabel3: TcxLabel
        Left = 20
        Top = 37
        Width = 67
        Height = 17
        TabOrder = 6
        Caption = #1058#1080#1087' '#1074#1080#1093#1086#1076#1091':'
      end
      object cxGroupBox5: TcxGroupBox
        Left = 7
        Top = 57
        Width = 451
        Height = 241
        Alignment = alTopLeft
        TabOrder = 3
        object cxGroupBox6: TcxGroupBox
          Left = 6
          Top = 8
          Width = 438
          Height = 146
          Alignment = alTopLeft
          TabOrder = 0
          object CheckBoxWorkMode: TcxCheckBox
            Left = 5
            Top = 6
            Width = 121
            Height = 21
            Enabled = False
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = CheckBoxWorkModePropertiesChange
            Properties.Caption = #1056#1077#1078#1080#1084
            TabOrder = 0
            OnClick = CheckBoxWorkModeClick
          end
          object EditWorkModeShift: TcxSpinEdit
            Left = 346
            Top = 49
            Width = 49
            Height = 21
            Enabled = False
            Properties.OnChange = EditWorkModeShiftPropertiesChange
            TabOrder = 2
          end
          object cxLabel8: TcxLabel
            Left = 310
            Top = 51
            Width = 35
            Height = 17
            TabOrder = 4
            Caption = #1047#1089#1091#1074':'
          end
          object EditWorkMode: TcxButtonEdit
            Left = 383
            Top = 10
            Width = 19
            Height = 35
            AutoSize = False
            Enabled = False
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.LookupItems.Strings = (
              'yb tyty ty'
              'ty ytty j')
            Properties.OnButtonClick = EditWorkModePropertiesButtonClick
            TabOrder = 5
          end
          object GridWorkMode: TStringGrid
            Left = 54
            Top = 73
            Width = 341
            Height = 66
            ColCount = 7
            DefaultColWidth = 47
            DefaultRowHeight = 27
            FixedCols = 0
            RowCount = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnDrawCell = GridWorkModeDrawCell
            OnKeyDown = GridWorkModeKeyDown
            OnSelectCell = GridWorkModeSelectCell
            ColWidths = (
              47
              47
              47
              47
              47
              47
              47)
          end
          object EditWM: TcxMemo
            Left = 66
            Top = 10
            Width = 321
            Height = 35
            Enabled = False
            TabOrder = 1
          end
        end
        object cxGroupBox7: TcxGroupBox
          Left = 5
          Top = 153
          Width = 439
          Height = 82
          Alignment = alTopLeft
          TabOrder = 1
          object CheckBoxNoWorkMode: TcxCheckBox
            Left = 7
            Top = 6
            Width = 146
            Height = 21
            Enabled = False
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = CheckBoxWorkModePropertiesChange
            Properties.Caption = #1056#1086#1073#1086#1090#1072' '#1087#1086' '#1079#1072' '#1075#1088#1072#1092#1110#1082#1086#1084
            TabOrder = 0
            OnClick = CheckBoxNoWorkModeClick
          end
          object EditWorkBeg: TcxTimeEdit
            Left = 98
            Top = 30
            Width = 91
            Height = 21
            EditValue = 0.000000000000000000
            Enabled = False
            Properties.OnChange = EditWorkBegPropertiesChange
            TabOrder = 1
          end
          object EditWorkEnd: TcxTimeEdit
            Left = 98
            Top = 53
            Width = 91
            Height = 21
            EditValue = 0.000000000000000000
            Enabled = False
            Properties.OnChange = EditWorkBegPropertiesChange
            TabOrder = 2
          end
          object cxLabel4: TcxLabel
            Left = 4
            Top = 30
            Width = 91
            Height = 17
            Properties.Alignment.Horz = taRightJustify
            TabOrder = 5
            Caption = #1055#1086#1095#1072#1090#1086#1082' '#1088#1086#1073#1086#1090#1080':'
          end
          object cxLabel6: TcxLabel
            Left = 196
            Top = 30
            Width = 98
            Height = 17
            Properties.Alignment.Horz = taRightJustify
            TabOrder = 6
            Caption = #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1077#1088#1074#1080':'
          end
          object cxLabel7: TcxLabel
            Left = 204
            Top = 54
            Width = 89
            Height = 17
            Properties.Alignment.Horz = taRightJustify
            TabOrder = 7
            Caption = #1050#1110#1085#1077#1094#1100' '#1087#1077#1088#1077#1088#1074#1080':'
          end
          object EditBreakBeg: TcxTimeEdit
            Left = 299
            Top = 30
            Width = 121
            Height = 21
            EditValue = 0.000000000000000000
            Enabled = False
            Properties.OnChange = EditWorkBegPropertiesChange
            TabOrder = 3
          end
          object EditBreakEnd: TcxTimeEdit
            Left = 299
            Top = 54
            Width = 121
            Height = 21
            EditValue = 0.000000000000000000
            Enabled = False
            Properties.OnChange = EditWorkBegPropertiesChange
            TabOrder = 4
          end
          object cxLabel5: TcxLabel
            Left = 10
            Top = 54
            Width = 82
            Height = 17
            Properties.Alignment.Horz = taRightJustify
            TabOrder = 8
            Caption = #1050#1110#1085#1077#1094#1100' '#1088#1086#1073#1086#1090#1080':'
          end
          object LabelHours: TcxLabel
            Left = 328
            Top = 8
            Width = 103
            Height = 20
            AutoSize = False
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = cl3DDkShadow
            Style.Font.Height = -13
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = [fsBold]
            TabOrder = 9
            Caption = ' '
          end
        end
      end
      object EditVihod: TcxButtonEdit
        Left = 88
        Top = 36
        Width = 330
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = EditVihodPropertiesButtonClick
        TabOrder = 2
      end
    end
    object LabelNum: TcxLabel
      Left = 5
      Top = 5
      Width = 25
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      Caption = #8470':'
    end
    object cxLabel9: TcxLabel
      Left = 131
      Top = 5
      Width = 43
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
      Caption = #1044#1072#1090#1072':'
    end
    object EditDate: TcxDateEdit
      Left = 175
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object EditNum: TcxMaskEdit
      Left = 31
      Top = 3
      Width = 82
      Height = 21
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '[0-9]+'
      Properties.MaxLength = 0
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 568
    Width = 478
    Height = 32
    Align = alBottom
    TabOrder = 1
    object ButtonYes: TcxButton
      Left = 234
      Top = 4
      Width = 75
      Height = 25
      Action = ActionYES
      TabOrder = 0
    end
    object ButtonCancel: TcxButton
      Left = 312
      Top = 4
      Width = 75
      Height = 25
      Action = ActionNo
      TabOrder = 1
    end
    object ButtonDelete: TcxButton
      Left = 390
      Top = 4
      Width = 75
      Height = 25
      Action = ActionDelete
      TabOrder = 2
    end
  end
  object ActionList: TActionList
    Left = 426
    Top = 4
    object ActionYES: TAction
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object ActionNo: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = ActionNoExecute
    end
    object ActionDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ShortCut = 46
      Visible = False
      OnExecute = ActionDeleteExecute
    end
  end
end
