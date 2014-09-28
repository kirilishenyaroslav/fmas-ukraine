object frmDocFilter: TfrmDocFilter
  Left = 363
  Top = 181
  ActiveControl = cxButton1
  BorderStyle = bsDialog
  Caption = #1060#1110#1083#1100#1090#1088' '#1074#1110#1076#1073#1086#1088#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1076#1086' '#1088#1077#1108#1089#1090#1088#1091
  ClientHeight = 119
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label3: TLabel
    Left = 72
    Top = 56
    Width = 121
    Height = 16
    Caption = #1047#1072#1082#1072#1085#1095#1080#1074#1072#1103' '#1076#1072#1090#1086#1081
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 406
    Height = 78
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 14
      Width = 404
      Height = 8
      Align = alTop
      Caption = #1057#1091#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      object Label1: TLabel
        Left = 33
        Top = 19
        Width = 135
        Height = 16
        Caption = #1041#1110#1083#1100#1096#1077' '#1072#1073#1086' '#1076#1086#1088#1110#1074#1085#1102#1108
      end
      object Label8: TLabel
        Left = 33
        Top = 43
        Width = 135
        Height = 16
        Caption = #1052#1077#1085#1096#1077' '#1072#1073#1086' '#1076#1086#1088#1110#1074#1085#1102#1108
      end
      object CheckDocSumFrom: TCheckBox
        Left = 15
        Top = 19
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = CheckDocSumFromClick
      end
      object FilterDocSumFrom: TEdit
        Left = 176
        Top = 13
        Width = 217
        Height = 24
        Color = clMenu
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object CheckDocSumTo: TCheckBox
        Left = 15
        Top = 43
        Width = 17
        Height = 17
        TabOrder = 1
        OnClick = CheckDocSumToClick
      end
      object FilterDocSumTo: TEdit
        Left = 176
        Top = 37
        Width = 217
        Height = 24
        Color = clMenu
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        TabOrder = 3
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 7
      Width = 404
      Height = 7
      Align = alTop
      Caption = #1055#1086' '#1073#1072#1083#1072#1085#1089#1086#1074#1086#1084#1091' '#1088#1072#1093#1091#1085#1082#1091' '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
      object Label2: TLabel
        Left = 41
        Top = 20
        Width = 54
        Height = 16
        Caption = #1056#1072#1093#1091#1085#1086#1082
      end
      object CheckSch: TCheckBox
        Left = 16
        Top = 19
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = CheckSchClick
      end
      object FilterDocSch: TcxButtonEdit
        Left = 176
        Top = 16
        Width = 217
        Height = 24
        Enabled = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = FilterDocSchPropertiesButtonClick
        Style.BorderStyle = ebs3D
        Style.Color = clMenu
        TabOrder = 1
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 22
      Width = 404
      Height = 55
      Align = alClient
      Caption = #1056#1086#1073#1086#1095#1080#1081' '#1087#1077#1088#1110#1086#1076
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object cbMonth: TComboBox
        Left = 72
        Top = 20
        Width = 172
        Height = 22
        Style = csOwnerDrawFixed
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        TabStop = False
      end
      object cbYear: TComboBox
        Left = 244
        Top = 20
        Width = 79
        Height = 22
        Style = csOwnerDrawFixed
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 1
        TabStop = False
      end
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 1
      Width = 404
      Height = 6
      Align = alTop
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
      object Label9: TLabel
        Left = 40
        Top = 20
        Width = 103
        Height = 16
        Caption = #1064#1072#1073#1083#1086#1085' '#1085#1086#1084#1077#1088#1091
      end
      object CheckDocNum: TCheckBox
        Left = 17
        Top = 19
        Width = 17
        Height = 17
        TabOrder = 0
        OnClick = CheckDocNumClick
      end
      object FilterDocNum: TEdit
        Left = 178
        Top = 16
        Width = 212
        Height = 24
        Color = clMenu
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 78
    Width = 406
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 120
      Top = 8
      Width = 113
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1074#1089#1077
      TabOrder = 2
      Visible = False
      OnClick = cxButton3Click
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 228
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 13
      OnExecute = cxButton1Click
    end
    object Action2: TAction
      Caption = 'Action2'
      ShortCut = 27
      OnExecute = cxButton2Click
    end
  end
end
