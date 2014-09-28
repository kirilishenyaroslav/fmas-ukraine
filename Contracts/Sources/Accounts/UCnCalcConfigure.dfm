object frmCalcConfigure: TfrmCalcConfigure
  Left = 357
  Top = 215
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091'/'#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1091
  ClientHeight = 325
  ClientWidth = 799
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
    Width = 799
    Height = 281
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object Panel5: TPanel
      Left = 528
      Top = 1
      Width = 270
      Height = 279
      Align = alRight
      TabOrder = 1
      object Label3: TLabel
        Left = 10
        Top = 9
        Width = 171
        Height = 16
        Caption = #1056#1077#1078#1080#1084#1080' '#1074#1110#1076#1073#1086#1088#1091' '#1076#1072#1085#1080#1093' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label1: TLabel
        Left = 16
        Top = 208
        Width = 135
        Height = 16
        Caption = #1057#1092#1086#1088#1084#1091#1074#1072#1090#1080' '#1079#1074#1110#1090' '#1085#1072' '
        Visible = False
      end
      object rbFixedKod: TcxRadioButton
        Left = 9
        Top = 97
        Width = 176
        Height = 17
        Caption = #1055#1086' '#1092#1110#1082#1089#1086#1074#1072#1085#1086#1084#1091' '#1082#1086#1076#1091
        TabOrder = 0
        OnClick = rbFixedKodClick
      end
      object edFixedKode: TcxButtonEdit
        Left = 9
        Top = 117
        Width = 211
        Height = 24
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        Properties.OnButtonClick = edFixedKodePropertiesButtonClick
        TabOrder = 1
        Text = '0'
      end
      object TextEdit_FIO: TcxTextEdit
        Left = 9
        Top = 143
        Width = 211
        Height = 24
        Enabled = False
        Properties.ReadOnly = True
        TabOrder = 2
      end
      object rbFilter: TcxRadioButton
        Left = 9
        Top = 29
        Width = 175
        Height = 17
        Caption = #1047#1072' '#1076#1086#1087#1086#1084#1086#1075#1086#1102' '#1092#1110#1083#1100#1090#1088#1072
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rbFilterClick
      end
      object cxButtonFilter: TcxButton
        Left = 9
        Top = 49
        Width = 210
        Height = 33
        Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1110#1074' '#1074#1110#1076#1073#1086#1088#1091
        TabOrder = 4
        OnClick = cxButtonFilterClick
      end
      object cxCheckBox1: TcxCheckBox
        Left = 8
        Top = 173
        Width = 520
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = 
          #1042' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1082#1083#1102#1095#1072#1090#1080' '#1090#1110#1083#1100#1082#1080' '#1076#1086#1075#1086#1074#1086#1088#1080', '#1087#1086' '#1103#1082#1080#1084' '#1087#1086#1082#1072#1079#1085#1080#1082#1080' '#1088#1086#1079#1093#1086#1076#1103#1090 +
          #1100#1089#1103
        TabOrder = 5
        Visible = False
      end
      object cbMonthBeg: TcxComboBox
        Left = 11
        Top = 226
        Width = 153
        Height = 24
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 6
        Visible = False
      end
      object cbYearBeg: TcxComboBox
        Left = 167
        Top = 226
        Width = 87
        Height = 24
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 7
        Visible = False
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 527
      Height = 279
      Align = alClient
      TabOrder = 0
      object DoCalc: TcxCheckBox
        Left = 4
        Top = 10
        Width = 519
        Height = 24
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1056#1086#1073#1080#1090#1080' '#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1072#1084' '#1079#1072' '#1074#1080#1073#1088#1072#1085#1080#1081' '#1087#1077#1088#1110#1086#1076
        State = cbsChecked
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 0
        OnClick = DoCalcClick
      end
      object DoReversCalc: TcxCheckBox
        Left = 18
        Top = 30
        Width = 347
        Height = 24
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1057#1090#1086#1088#1085#1091#1074#1072#1090#1080' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1085#1103' '#1079#1072' '#1074#1080#1073#1088#1072#1085#1080#1081'  '#1087#1077#1088#1110#1086#1076
        TabOrder = 1
      end
      object DoRecalcByFilter: TcxRadioButton
        Left = 22
        Top = 77
        Width = 500
        Height = 17
        Caption = 
          #1084#1085#1086#1078#1080#1085#1072' '#1076#1086#1075#1086#1074#1086#1088#1110#1074' '#1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1093#1091#1085#1082#1091' '#1089#1092#1086#1088#1084#1086#1074#1072#1085#1072' '#1079#1072' '#1076#1086#1087#1086#1084#1086#1075#1086#1102' '#1092#1110#1083#1100#1090#1088 +
          #1072
        Checked = True
        Enabled = False
        TabOrder = 2
        TabStop = True
        OnClick = rbFilterClick
      end
      object DoRecalcWithoutFilter: TcxRadioButton
        Left = 22
        Top = 99
        Width = 427
        Height = 17
        Caption = #1087#1077#1088#1077#1088#1072#1093#1091#1085#1086#1082' '#1088#1086#1073#1080#1090#1080' '#1087#1086' '#1074#1089#1110#1084' '#1079#1072#1088#1077#1108#1089#1090#1088#1086#1074#1072#1085#1080#1084' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
        Enabled = False
        TabOrder = 3
        OnClick = rbFilterClick
      end
      object Recalc: TcxCheckBox
        Left = 7
        Top = 55
        Width = 442
        Height = 24
        ParentFont = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1056#1086#1073#1080#1090#1080' '#1087#1077#1088#1077#1088#1086#1079#1088#1072#1093#1091#1085#1086#1082' '#1085#1072#1088#1072#1093#1091#1074#1072#1085#1100' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
        OnClick = RecalcClick
      end
      object DoRecalcWithCheckEdit: TcxCheckBox
        Left = 18
        Top = 118
        Width = 422
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1079#1072' '#1091#1084#1086#1074#1080', '#1097#1086' '#1076#1086#1075#1086#1074#1086#1088#1080' '#1088#1077#1076#1072#1075#1091#1074#1072#1083#1080#1089#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1077#1084
        TabOrder = 5
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 281
    Width = 799
    Height = 44
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 298
      Top = 8
      Width = 81
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 386
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
    Left = 592
    Top = 320
  end
  object StProc: TpFIBStoredProc
    Database = pFIBDatabase1
    Transaction = pFIBTransaction1
    Left = 592
    Top = 288
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
    Left = 592
    Top = 352
  end
end
