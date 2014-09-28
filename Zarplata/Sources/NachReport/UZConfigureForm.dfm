object frmZGetConfInfo: TfrmZGetConfInfo
  Left = 348
  Top = 266
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103#1084#1080' '#1079#1072#1088#1087#1083#1072#1090#1080
  ClientHeight = 555
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 509
    Width = 680
    Height = 46
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 463
      Top = 9
      Width = 88
      Height = 25
      Caption = #1060#1086#1088#1084#1091#1074#1072#1090#1080
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 555
      Top = 9
      Width = 88
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 509
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 71
      Width = 678
      Height = 437
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1110' '#1087#1072#1088#1072#1084#1077#1090#1088#1080
        object ShowProgram: TcxCheckBox
          Left = 29
          Top = 15
          Width = 92
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1088#1086#1075#1088#1072#1084
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
        end
        object edProgramInfo: TcxRadioGroup
          Left = 228
          Top = 15
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 1
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1087#1088#1086#1075#1088#1072#1084
        end
        object ShowTypeFinance: TcxCheckBox
          Left = 29
          Top = 57
          Width = 188
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1058#1080#1087#1110#1074' '#1092#1110#1085#1072#1089#1091#1074#1072#1085#1085#1103
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 2
        end
        object edTypeFinanceInfo: TcxRadioGroup
          Left = 228
          Top = 57
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 3
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1090#1080#1087#1110#1074' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
        end
        object ShowSmGr: TcxCheckBox
          Left = 29
          Top = 97
          Width = 132
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1043#1088#1091#1087' '#1073#1102#1076#1078#1077#1090#1110#1074
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
        end
        object edTypeSmGrInfo: TcxRadioGroup
          Left = 228
          Top = 97
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 5
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1075#1088#1091#1087' '#1073#1102#1076#1078#1077#1090#1110#1074
        end
        object ShowSm: TcxCheckBox
          Left = 29
          Top = 137
          Width = 121
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1041#1102#1076#1078#1077#1090#1110#1074
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 6
        end
        object edTypeSmInfo: TcxRadioGroup
          Left = 228
          Top = 137
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 7
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1073#1102#1076#1078#1077#1090#1110#1074
        end
        object ShowDep: TcxCheckBox
          Left = 29
          Top = 177
          Width = 121
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1110#1076#1088#1086#1079#1076#1110#1083#1110#1074
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 8
        end
        object edTypeDepInfo: TcxRadioGroup
          Left = 228
          Top = 177
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 9
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1087#1110#1076#1088#1086#1079#1076#1110#1083#1110#1074
        end
        object ShowVidOpl: TcxCheckBox
          Left = 29
          Top = 221
          Width = 121
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1042#1080#1076#1110#1074' '#1086#1087#1083#1072#1090
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 10
        end
        object edTypeVidOpl: TcxRadioGroup
          Left = 228
          Top = 221
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 11
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1074#1080#1076#1110#1074' '#1086#1087#1083#1072#1090
        end
        object ShowPost: TcxCheckBox
          Left = 29
          Top = 264
          Width = 121
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1086#1089#1072#1076
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 12
        end
        object ShowTypePost: TcxCheckBox
          Left = 29
          Top = 307
          Width = 196
          Height = 24
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1058#1080#1087#1110#1074' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 13
        end
        object ShowCateg: TcxCheckBox
          Left = 29
          Top = 349
          Width = 340
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 14
        end
        object edTypePosada: TcxRadioGroup
          Left = 228
          Top = 264
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 15
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1087#1086#1089#1072#1076#1080
        end
        object edTypePost: TcxRadioGroup
          Left = 228
          Top = 307
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 16
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1090#1080#1087#1091' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
        end
        object edTypeCateg: TcxRadioGroup
          Left = 228
          Top = 349
          Width = 419
          Height = 38
          ItemIndex = 0
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = #1090#1110#1083#1100#1082#1080' '#1082#1086#1076#1080
            end
            item
              Caption = #1082#1086#1076#1080' + '#1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
            end>
          Style.BorderStyle = ebs3D
          TabOrder = 17
          Caption = #1058#1080#1087' '#1074#1110#1079#1091#1072#1083#1110#1079#1072#1094#1110#1111' '#1082#1072#1090#1077#1075#1086#1088#1110#1111' '#1087#1077#1088#1089#1086#1085#1072#1083#1091
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1110' '#1087#1072#1088#1072#1084#1077#1090#1088#1080
        ImageIndex = 1
        object ShowTarif: TcxCheckBox
          Left = 29
          Top = 15
          Width = 340
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1058#1072#1088#1080#1092#1085#1080#1081' '#1088#1086#1079#1088#1103#1076' ('#1088#1086#1079#1088#1103#1076' + '#1087#1088#1086#1094#1077#1085#1090')'
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 0
        end
        object ShowPostGroup: TcxCheckBox
          Left = 29
          Top = 44
          Width = 340
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1043#1088#1091#1087#1072' '#1087#1086#1089#1072#1076#1080
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 1
        end
        object ShowParentDep: TcxCheckBox
          Left = 29
          Top = 72
          Width = 340
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1050#1086#1088#1077#1085#1077#1074#1080#1081' '#1087#1110#1076#1088#1086#1079#1076#1110#1083
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 2
        end
        object ShowPostShifr: TcxCheckBox
          Left = 29
          Top = 99
          Width = 340
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1064#1080#1092#1088' '#1074#1080#1076#1091' '#1086#1087#1083#1072#1090#1080
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 3
        end
        object ShowPostAddName: TcxCheckBox
          Left = 29
          Top = 126
          Width = 340
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1044#1086#1076#1072#1090#1086#1082' '#1087#1086#1089#1072#1076#1080
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 4
        end
        object ShowKodSetup1: TcxCheckBox
          Left = 29
          Top = 154
          Width = 340
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 5
        end
        object ShowKodSetup2: TcxCheckBox
          Left = 29
          Top = 181
          Width = 372
          Height = 25
          AutoSize = False
          ParentFont = False
          Properties.DisplayUnchecked = 'False'
          Properties.Caption = #1055#1077#1088#1110#1086#1076', '#1079#1072' '#1103#1082#1080#1081' '#1074#1110#1076#1073#1091#1074#1072#1108#1090#1100#1089#1103' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = [fsBold]
          TabOrder = 6
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 678
      Height = 49
      Align = alTop
      TabOrder = 1
      object Label4: TLabel
        Left = 17
        Top = 4
        Width = 139
        Height = 16
        Alignment = taRightJustify
        Caption = #1042#1080#1073#1088#1072#1090#1080' '#1079#1072' '#1087#1077#1088#1110#1086#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 28
        Top = 25
        Width = 64
        Height = 16
        Alignment = taRightJustify
        Caption = #1055#1086#1095#1072#1090#1086#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 325
        Top = 26
        Width = 85
        Height = 16
        Alignment = taRightJustify
        Caption = #1047#1072#1082#1110#1085#1095#1077#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbMonthBeg: TcxComboBox
        Left = 96
        Top = 23
        Width = 130
        Height = 24
        Properties.DropDownListStyle = lsFixedList
        Style.Color = clInfoBk
        TabOrder = 0
      end
      object cbYearBeg: TcxComboBox
        Left = 230
        Top = 22
        Width = 88
        Height = 24
        Properties.DropDownListStyle = lsFixedList
        Style.Color = clInfoBk
        TabOrder = 1
      end
      object cbMonthEnd: TcxComboBox
        Left = 413
        Top = 22
        Width = 137
        Height = 24
        Properties.DropDownListStyle = lsFixedList
        Style.Color = clInfoBk
        TabOrder = 2
      end
      object cbYearEnd: TcxComboBox
        Left = 552
        Top = 22
        Width = 89
        Height = 24
        Properties.DropDownListStyle = lsFixedList
        Style.Color = clInfoBk
        TabOrder = 3
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 50
      Width = 678
      Height = 21
      Align = alTop
      Caption = #1053#1072#1076#1072#1090#1080' '#1072#1085#1072#1083#1110#1079' '#1091' '#1088#1086#1079#1088#1110#1079#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 24
    Top = 501
  end
  object ActionList1: TActionList
    Left = 56
    Top = 501
    object Esc: TAction
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = EscExecute
    end
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16397
    end
  end
end
