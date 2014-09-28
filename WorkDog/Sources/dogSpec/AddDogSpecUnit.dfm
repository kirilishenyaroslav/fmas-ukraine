object frmAddSpec: TfrmAddSpec
  Left = 333
  Top = 249
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  ClientHeight = 275
  ClientWidth = 282
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
  object MatEdit: TcxButtonEdit
    Left = 16
    Top = 24
    Width = 249
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 0
  end
  object TopPricePercentEdit: TcxTextEdit
    Left = 16
    Top = 64
    Width = 57
    Height = 21
    Properties.OnChange = TopPricePercentEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 2
    Text = '0'
  end
  object BottomPricePercentEdit: TcxTextEdit
    Left = 80
    Top = 64
    Width = 57
    Height = 21
    Properties.OnChange = BottomPricePercentEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 3
    Text = '0'
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 8
    Width = 77
    Height = 17
    TabOrder = 9
    Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1086#1088
  end
  object cxLabel5: TcxLabel
    Left = 16
    Top = 48
    Width = 61
    Height = 17
    TabOrder = 10
    Caption = #1042#1077#1088#1093#1085#1110#1081' %'
  end
  object cxLabel6: TcxLabel
    Left = 80
    Top = 48
    Width = 59
    Height = 17
    TabOrder = 11
    Caption = #1053#1080#1078#1085#1080#1081' %'
  end
  object cxButton1: TcxButton
    Left = 56
    Top = 240
    Width = 75
    Height = 25
    Caption = #1054'&'#1050
    Default = True
    TabOrder = 12
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 144
    Top = 240
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1072
    TabOrder = 13
    OnClick = cxButton2Click
  end
  object LastPriceEdit: TcxTextEdit
    Left = 144
    Top = 64
    Width = 121
    Height = 21
    Properties.OnChange = BottomPricePercentEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 4
    Text = '0'
    Visible = False
  end
  object cxLabel7: TcxLabel
    Left = 144
    Top = 48
    Width = 91
    Height = 17
    TabOrder = 14
    Visible = False
    Caption = #1054#1089#1090#1072#1085#1085#1103' '#1094#1077#1085#1072
  end
  object CommentEdit: TcxMemo
    Left = 16
    Top = 184
    Width = 249
    Height = 33
    Style.Color = clMoneyGreen
    TabOrder = 8
  end
  object cxLabel8: TcxLabel
    Left = 16
    Top = 168
    Width = 70
    Height = 17
    TabOrder = 15
    Caption = #1050#1086#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object MatEdit2: TcxButtonEdit
    Left = 16
    Top = 24
    Width = 249
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = MatEdit2PropertiesButtonClick
    Style.Color = clMoneyGreen
    TabOrder = 1
    Visible = False
  end
  object lbShablon: TcxLabel
    Left = 16
    Top = 8
    Width = 47
    Height = 17
    TabOrder = 16
    Visible = False
    Caption = #1064#1072#1073#1083#1086#1085
  end
  object VolumeEdit: TcxTextEdit
    Left = 16
    Top = 104
    Width = 57
    Height = 21
    Properties.OnChange = VolumeEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 5
    Text = '0'
  end
  object cxLabel9: TcxLabel
    Left = 16
    Top = 88
    Width = 78
    Height = 17
    TabOrder = 17
    Caption = #1054#1073#39#1101#1084
  end
  object SummaEdit: TcxTextEdit
    Left = 80
    Top = 104
    Width = 89
    Height = 21
    Properties.OnChange = SummaEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 6
    Text = '0'
  end
  object lbSumma: TcxLabel
    Left = 80
    Top = 88
    Width = 34
    Height = 17
    TabOrder = 18
    Caption = #1057#1091#1084#1072
  end
  object lbSummaNDS: TcxLabel
    Left = 176
    Top = 88
    Width = 61
    Height = 17
    TabOrder = 19
    Caption = #1057#1091#1084#1072' '#1055#1044#1042
  end
  object SummaNDSEdit: TcxTextEdit
    Left = 176
    Top = 104
    Width = 89
    Height = 21
    Properties.OnChange = BottomPricePercentEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 7
    Text = '0'
  end
  object PlanPriceEdit: TcxTextEdit
    Left = 16
    Top = 144
    Width = 121
    Height = 21
    Properties.OnChange = PlanPriceEditPropertiesChange
    Style.Color = clMoneyGreen
    TabOrder = 20
    Text = '0'
  end
  object BottomPriceEdit: TcxTextEdit
    Left = 24
    Top = 344
    Width = 121
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 21
    Text = '0'
    Visible = False
  end
  object TopPriceEdit: TcxTextEdit
    Left = 24
    Top = 368
    Width = 121
    Height = 21
    Style.Color = clMoneyGreen
    TabOrder = 22
    Text = '0'
    Visible = False
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 128
    Width = 97
    Height = 17
    TabOrder = 23
    Caption = #1055#1083#1072#1085#1086#1074#1072' '#1074#1072#1088#1090#1110#1089#1090#1100
  end
end
