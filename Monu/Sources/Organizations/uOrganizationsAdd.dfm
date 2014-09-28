object frmAdd: TfrmAdd
  Left = 289
  Top = 211
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1102
  ClientHeight = 311
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    384
    311)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 96
    Top = 276
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 200
    Top = 276
    Width = 91
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 1
    OnClick = cxButton2Click
  end
  object eName: TcxTextEdit
    Left = 80
    Top = 32
    Width = 273
    Height = 21
    Properties.MaxLength = 255
    Style.Color = clSkyBlue
    TabOrder = 3
    OnKeyDown = eNameKeyDown
  end
  object cxLabel1: TcxLabel
    Left = 80
    Top = 16
    Width = 40
    Height = 17
    TabOrder = 4
    Caption = #1053#1072#1079#1074#1072
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 56
    Width = 95
    Height = 17
    TabOrder = 5
    Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
  end
  object eShortName: TcxTextEdit
    Left = 24
    Top = 72
    Width = 105
    Height = 21
    Properties.MaxLength = 80
    Style.Color = clSkyBlue
    TabOrder = 6
    OnKeyDown = eShortNameKeyDown
  end
  object cxLabel3: TcxLabel
    Left = 248
    Top = 56
    Width = 55
    Height = 17
    TabOrder = 7
    Caption = #1045#1044#1056#1055#1054#1059
  end
  object eEDRPOU: TcxTextEdit
    Left = 248
    Top = 72
    Width = 105
    Height = 21
    Properties.MaxLength = 16
    Style.Color = clSkyBlue
    TabOrder = 9
    OnKeyDown = eEDRPOUKeyDown
  end
  object cxLabel4: TcxLabel
    Left = 24
    Top = 96
    Width = 55
    Height = 17
    TabOrder = 10
    Caption = #1050#1054#1040#1058#1059#1059
  end
  object eKOATUU: TcxTextEdit
    Left = 24
    Top = 112
    Width = 105
    Height = 21
    Properties.MaxLength = 16
    Style.Color = clSkyBlue
    TabOrder = 11
    OnKeyDown = eKOATUUKeyDown
  end
  object cxLabel5: TcxLabel
    Left = 136
    Top = 96
    Width = 55
    Height = 17
    TabOrder = 12
    Caption = #1047#1050#1043#1053#1043
  end
  object eZKGNG: TcxTextEdit
    Left = 136
    Top = 112
    Width = 105
    Height = 21
    Properties.MaxLength = 16
    Style.Color = clSkyBlue
    TabOrder = 13
    OnKeyDown = eZKGNGKeyDown
  end
  object cxLabel6: TcxLabel
    Left = 248
    Top = 96
    Width = 38
    Height = 17
    TabOrder = 14
    Caption = #1050#1042#1045#1044
  end
  object eKVED: TcxTextEdit
    Left = 248
    Top = 112
    Width = 105
    Height = 21
    Properties.MaxLength = 16
    Style.Color = clSkyBlue
    TabOrder = 15
    OnKeyDown = eKVEDKeyDown
  end
  object cxLabel7: TcxLabel
    Left = 24
    Top = 136
    Width = 55
    Height = 17
    TabOrder = 16
    Caption = #1050#1060#1042
  end
  object eKFV: TcxTextEdit
    Left = 24
    Top = 152
    Width = 105
    Height = 21
    Properties.MaxLength = 16
    Style.Color = clSkyBlue
    TabOrder = 17
    OnKeyDown = eKFVKeyDown
  end
  object cxLabel8: TcxLabel
    Left = 136
    Top = 136
    Width = 55
    Height = 17
    TabOrder = 18
    Caption = #1050#1054#1055#1060#1043
  end
  object eKOPFG: TcxTextEdit
    Left = 136
    Top = 152
    Width = 105
    Height = 21
    Properties.MaxLength = 16
    Style.Color = clSkyBlue
    TabOrder = 19
    OnKeyDown = eKOPFGKeyDown
  end
  object cxLabel9: TcxLabel
    Left = 248
    Top = 136
    Width = 48
    Height = 17
    TabOrder = 20
    Caption = #1057#1055#1054#1044#1059
  end
  object eSPODU: TcxTextEdit
    Left = 248
    Top = 152
    Width = 105
    Height = 21
    Properties.MaxLength = 16
    Style.Color = clSkyBlue
    TabOrder = 21
    OnKeyDown = eSPODUKeyDown
  end
  object beCustomer: TcxButtonEdit
    Left = 24
    Top = 192
    Width = 329
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = beCustomerPropertiesButtonClick
    Style.Color = clSkyBlue
    TabOrder = 22
  end
  object beTypeOrg: TcxButtonEdit
    Left = 24
    Top = 232
    Width = 329
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.HideCursor = True
    Properties.ReadOnly = True
    Properties.OnButtonClick = beTypeOrgPropertiesButtonClick
    Style.Color = clSkyBlue
    TabOrder = 23
  end
  object cxLabel10: TcxLabel
    Left = 24
    Top = 176
    Width = 66
    Height = 17
    TabOrder = 24
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  end
  object cxLabel11: TcxLabel
    Left = 24
    Top = 216
    Width = 84
    Height = 17
    TabOrder = 25
    Caption = #1058#1080#1087' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
  end
  object cxLabel12: TcxLabel
    Left = 24
    Top = 16
    Width = 27
    Height = 17
    TabOrder = 26
    Caption = #1050#1086#1076
  end
  object eCode: TcxTextEdit
    Left = 24
    Top = 32
    Width = 49
    Height = 21
    Properties.MaxLength = 3
    Style.Color = clSkyBlue
    TabOrder = 2
    OnKeyDown = eCodeKeyDown
  end
  object eDir: TcxTextEdit
    Left = 136
    Top = 72
    Width = 105
    Height = 21
    Properties.MaxLength = 60
    Style.Color = clSkyBlue
    TabOrder = 8
    OnKeyDown = eDirKeyDown
  end
  object cxLabel13: TcxLabel
    Left = 136
    Top = 56
    Width = 95
    Height = 17
    TabOrder = 27
    Caption = #1050#1077#1088#1110#1074#1085#1080#1082
  end
end
