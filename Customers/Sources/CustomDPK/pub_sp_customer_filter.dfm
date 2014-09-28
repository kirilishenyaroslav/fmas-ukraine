object frmCustomerFilter: TfrmCustomerFilter
  Left = 324
  Top = 109
  BorderStyle = bsDialog
  Caption = #1060#1080#1083#1100#1090#1088' '#1086#1090#1073#1086#1088#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
  ClientHeight = 557
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 516
    Width = 382
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077
      TabOrder = 2
      OnClick = cxButton3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 516
    Align = alClient
    TabOrder = 1
    object FilterProductGroup: TGroupBox
      Left = 1
      Top = 1
      Width = 380
      Height = 136
      Align = alTop
      Caption = #1047#1072' '#1086#1089#1085#1086#1074#1085#1080#1084#1080' '#1072#1090#1088#1080#1073#1091#1090#1072#1084#1080' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      TabOrder = 0
      object CheckCustTitle: TcxCheckBox
        Left = 32
        Top = 13
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
        TabOrder = 0
        OnClick = CheckCustTitleClick
      end
      object CheckCustCode: TcxCheckBox
        Left = 32
        Top = 54
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1086' '#1082#1086#1076#1091' '#1054#1050#1055#1054
        TabOrder = 1
        OnClick = CheckCustCodeClick
      end
      object CheckCustIsFiz: TcxCheckBox
        Left = 32
        Top = 102
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
        TabOrder = 2
      end
      object FilterCustTitle: TcxComboBox
        Left = 64
        Top = 32
        Width = 281
        Height = 21
        Enabled = False
        Properties.OnCloseUp = FilterCustTitlePropertiesCloseUp
        TabOrder = 3
      end
      object FilterCustCode: TcxComboBox
        Left = 64
        Top = 76
        Width = 281
        Height = 21
        Enabled = False
        Properties.OnCloseUp = FilterCustCodePropertiesCloseUp
        TabOrder = 4
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 281
      Width = 380
      Height = 208
      Align = alTop
      Caption = #1055#1086' '#1085#1072#1083#1086#1075#1086#1074#1099#1084' '#1072#1090#1088#1080#1073#1091#1090#1072#1084' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      TabOrder = 2
      object CheckCustNNSDate: TcxCheckBox
        Left = 32
        Top = 15
        Width = 321
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1054' '#1076#1072#1090#1077' '#1074#1099#1076#1072#1095#1080' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        TabOrder = 0
        OnClick = CheckCustNNSDateClick
      end
      object CheckCustNNSNum: TcxCheckBox
        Left = 32
        Top = 53
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1086' '#1085#1086#1084#1077#1088#1091' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
        TabOrder = 1
        OnClick = CheckCustNNSNumClick
      end
      object FilterCustomerNNSDate: TcxDateEdit
        Left = 64
        Top = 32
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object CheckCustPDV: TcxCheckBox
        Left = 32
        Top = 95
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1053#1044#1057
        TabOrder = 3
      end
      object CheckCustPNP: TcxCheckBox
        Left = 32
        Top = 116
        Width = 257
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1085#1072#1083#1086#1075#1072' '#1085#1072' '#1087#1088#1080#1073#1099#1083#1100
        TabOrder = 4
      end
      object CheckCustPodNum: TcxCheckBox
        Left = 32
        Top = 141
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1086' '#1085#1072#1083#1086#1075#1086#1074#1086#1084#1091' '#1085#1086#1084#1077#1088#1091
        TabOrder = 5
        OnClick = CheckCustPodNumClick
      end
      object FIlterCustomerNNSNum: TcxComboBox
        Left = 64
        Top = 72
        Width = 289
        Height = 21
        Enabled = False
        Properties.OnCloseUp = FIlterCustomerNNSNumPropertiesCloseUp
        TabOrder = 6
      end
      object FilterCustPodNum: TcxComboBox
        Left = 64
        Top = 162
        Width = 289
        Height = 21
        Enabled = False
        Properties.OnCloseUp = FilterCustPodNumPropertiesCloseUp
        TabOrder = 7
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 137
      Width = 380
      Height = 144
      Align = alTop
      Caption = #1055#1086' '#1073#1072#1085#1082#1086#1074#1089#1082#1080#1084' '#1072#1090#1088#1080#1073#1091#1090#1072#1084
      TabOrder = 1
      object CheckCustBank: TcxCheckBox
        Left = 32
        Top = 15
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1086' '#1073#1072#1085#1082#1091
        TabOrder = 0
        OnClick = CheckCustBankClick
      end
      object CheckCustAccType: TcxCheckBox
        Left = 32
        Top = 53
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1086' '#1090#1080#1087#1091' '#1089#1095#1077#1090#1072
        TabOrder = 1
        OnClick = CheckCustAccTypeClick
      end
      object CheckCustAccNum: TcxCheckBox
        Left = 32
        Top = 93
        Width = 177
        Height = 21
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1086' '#1085#1086#1084#1077#1088#1091' '#1089#1095#1077#1090#1072
        TabOrder = 2
        OnClick = CheckCustAccNumClick
      end
      object FilterCustBank: TcxButtonEdit
        Left = 64
        Top = 32
        Width = 289
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        TabOrder = 3
      end
      object FilterCustAccType: TcxButtonEdit
        Left = 64
        Top = 72
        Width = 289
        Height = 21
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        TabOrder = 4
      end
      object FilterCustAccNum: TcxComboBox
        Left = 64
        Top = 112
        Width = 289
        Height = 21
        Enabled = False
        Properties.OnCloseUp = FilterCustAccNumPropertiesCloseUp
        TabOrder = 5
      end
    end
  end
  object ActionList1: TActionList
    Left = 329
    Top = 17
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = Action2Execute
    end
  end
end
