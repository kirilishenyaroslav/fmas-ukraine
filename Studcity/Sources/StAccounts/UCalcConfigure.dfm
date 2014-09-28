object frmCalcConfigure: TfrmCalcConfigure
  Left = 530
  Top = 260
  AutoSize = True
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091'/'#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1091
  ClientHeight = 440
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 396
    Align = alClient
    TabOrder = 0
    object Panel4: TPanel
      Left = 3
      Top = 184
      Width = 593
      Height = 209
      TabOrder = 10
      object Label2: TLabel
        Left = 27
        Top = 8
        Width = 419
        Height = 16
        Caption = #1056#1077#1078#1080#1084#1080' '#1088#1086#1073#1086#1090#1080' '#1087#1088#1086#1094#1077#1076#1091#1088#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091'/'#1087#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel3: TPanel
      Left = 4
      Top = 8
      Width = 593
      Height = 171
      TabOrder = 9
      object Label1: TLabel
        Left = 32
        Top = 4
        Width = 509
        Height = 16
        Caption = #1056#1077#1078#1080#1084#1080' '#1074#1110#1076#1073#1086#1088#1091' '#1076#1072#1085#1080#1093' '#1076#1083#1103' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091'/'#1087#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Calc: TcxCheckBox
      Left = 22
      Top = 241
      Width = 547
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1086#1073#1080#1090#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1079#1072' '#1074#1080#1073#1088#1072#1085#1080#1081' '#1087#1077#1088#1110#1086#1076
      State = cbsChecked
      TabOrder = 0
    end
    object Recalc: TcxCheckBox
      Left = 22
      Top = 265
      Width = 273
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1056#1086#1073#1080#1090#1080' '#1087#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100
      State = cbsChecked
      TabOrder = 1
    end
    object rbAll: TcxRadioButton
      Left = 24
      Top = 32
      Width = 569
      Height = 25
      Caption = 
        #1044#1072#1085#1110' '#1076#1083#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091'/'#1087#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '#1092#1086#1088#1084#1091#1102#1090#1100#1089#1103' '#1089#1080#1089#1090#1077#1084#1086#1102' '#1072#1074#1090#1086#1084#1072#1090#1080#1095 +
        #1085#1086
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = rbAllClick
    end
    object rbFixedKod: TcxRadioButton
      Left = 24
      Top = 124
      Width = 385
      Height = 17
      Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1086#1082'/'#1087#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1087#1086' '#1092#1110#1082#1089#1086#1074#1072#1085#1086#1084#1091' '#1082#1086#1076#1091
      TabOrder = 3
      OnClick = rbFixedKodClick
    end
    object edFixedKode: TcxButtonEdit
      Left = 24
      Top = 142
      Width = 265
      Height = 24
      Enabled = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = False
      Properties.OnButtonClick = edFixedKodePropertiesButtonClick
      TabOrder = 4
      Text = '0'
    end
    object rbFilter: TcxRadioButton
      Left = 24
      Top = 62
      Width = 521
      Height = 17
      Caption = 
        #1044#1072#1085#1110' '#1076#1083#1103' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091'/'#1087#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091' '#1092#1086#1088#1084#1091#1102#1090#1100#1089#1103' '#1079#1072' '#1076#1086#1087#1086#1084#1086#1075#1086#1102' '#1092#1110#1083#1100#1090 +
        #1088#1072
      TabOrder = 5
      OnClick = rbFilterClick
    end
    object cxButtonFilter: TcxButton
      Left = 24
      Top = 86
      Width = 265
      Height = 33
      Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074' '#1074#1110#1076#1073#1086#1088#1091
      Enabled = False
      TabOrder = 6
      OnClick = cxButtonFilterClick
    end
    object CheckCalc: TcxCheckBox
      Left = 22
      Top = 290
      Width = 273
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1053#1077' '#1085#1072#1088#1072#1093#1086#1074#1091#1074#1072#1090#1080' '#1074#1078#1077' '#1085#1072#1088#1072#1093#1086#1074#1072#1085#1080#1084
      TabOrder = 7
      Visible = False
    end
    object CheckBox_revers: TcxCheckBox
      Left = 22
      Top = 315
      Width = 273
      Height = 24
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1090#1086#1088#1085#1091#1074#1072#1090#1080' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103
      TabOrder = 8
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 396
    Width = 596
    Height = 44
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 222
      Top = 8
      Width = 81
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 310
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object pFIBDatabase1: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251')
    DefaultTransaction = pFIBTransaction1
    DefaultUpdateTransaction = pFIBTransaction1
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 584
    Top = 40
  end
  object StProc: TpFIBStoredProc
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    Left = 584
    Top = 8
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = pFIBDatabase1
    TimeoutAction = TARollback
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 584
    Top = 72
  end
end
