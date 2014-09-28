object frmPriceSmetAdd: TfrmPriceSmetAdd
  Left = 377
  Top = 233
  BorderStyle = bsDialog
  Caption = #1056#1086#1073#1086#1090#1072' '#1079' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1108#1102' '#1087#1086' '#1073#1102#1076#1078#1077#1090#1072#1084
  ClientHeight = 249
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 208
    Width = 628
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 544
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 208
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 48
      Top = 36
      Width = 51
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
    end
    object Label2: TLabel
      Left = 56
      Top = 68
      Width = 44
      Height = 16
      Caption = #1056#1086#1079#1076#1110#1083
    end
    object Label3: TLabel
      Left = 56
      Top = 100
      Width = 45
      Height = 16
      Caption = #1057#1090#1072#1090#1090#1103
    end
    object Label4: TLabel
      Left = 32
      Top = 132
      Width = 73
      Height = 16
      Caption = #1050#1086#1076' '#1074#1080#1090#1088#1072#1090
    end
    object LabelSm: TLabel
      Left = 256
      Top = 36
      Width = 77
      Height = 16
      Caption = '___________'
    end
    object LabelRz: TLabel
      Left = 256
      Top = 68
      Width = 77
      Height = 16
      Caption = '___________'
    end
    object LabelSt: TLabel
      Left = 256
      Top = 100
      Width = 77
      Height = 16
      Caption = '___________'
    end
    object LabelKekv: TLabel
      Left = 256
      Top = 132
      Width = 77
      Height = 16
      Caption = '___________'
    end
    object Label9: TLabel
      Left = 48
      Top = 172
      Width = 57
      Height = 16
      Caption = #1055#1088#1086#1094#1077#1085#1090
    end
    object SmText: TcxButtonEdit
      Left = 112
      Top = 32
      Width = 121
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = False
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Properties.OnEditValueChanged = SmTextPropertiesEditValueChanged
      Style.Color = clGradientActiveCaption
      TabOrder = 0
      OnKeyPress = SmTextKeyPress
    end
    object RzText: TcxTextEdit
      Left = 112
      Top = 64
      Width = 121
      Height = 24
      Properties.ReadOnly = False
      Properties.OnEditValueChanged = RzTextPropertiesEditValueChanged
      Style.Color = clGradientActiveCaption
      TabOrder = 1
      OnKeyPress = RzTextKeyPress
    end
    object StText: TcxTextEdit
      Left = 112
      Top = 96
      Width = 121
      Height = 24
      Properties.ReadOnly = False
      Properties.OnEditValueChanged = StTextPropertiesEditValueChanged
      Style.Color = clGradientActiveCaption
      TabOrder = 2
      OnKeyPress = StTextKeyPress
    end
    object KekvText: TcxButtonEdit
      Left = 112
      Top = 128
      Width = 121
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = False
      Properties.OnButtonClick = KekvTextPropertiesButtonClick
      Properties.OnEditValueChanged = KekvTextPropertiesEditValueChanged
      Style.Color = clGradientActiveCaption
      TabOrder = 3
      OnKeyPress = KekvTextKeyPress
    end
    object PercentValue: TcxCalcEdit
      Left = 112
      Top = 168
      Width = 121
      Height = 24
      EditValue = 100.000000000000000000
      Style.Color = clGradientActiveCaption
      TabOrder = 4
      OnKeyPress = PercentValueKeyPress
    end
  end
  object ReadDataset: TpFIBDataSet
    Left = 350
    Top = 14
    poSQLINT64ToBCD = True
  end
end
